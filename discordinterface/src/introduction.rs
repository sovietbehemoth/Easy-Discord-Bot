use sdl2::messagebox::*;
use json;

use std::fs::File;
use std::io::Read;
use std::io::Write;

fn once_introduced() {
    let mut file = match File::open("./meta.json") {
        Err(err) => panic!("'meta.json' file is unable to be read. {}", err),
        Ok(file) => file,
    };

    let mut buffer = String::new();
    match file.read_to_string(&mut buffer) {
        Err(_) => panic!("File cannot be indexed."),
        Ok(file) => file,
    };

    let mut obj = json::parse(buffer.as_str()).unwrap();

    obj["introducted"] = json::JsonValue::Boolean(true);

    let serialize = json::stringify(obj);

    match file.write_all(serialize.as_bytes()) {
        Err(_) => panic!("Cannot write to meta file."),
        Ok(file) => file,
    }
}

fn already_introduced() -> bool {
    let mut file = match File::open("./meta.json") {
        Err(err) => panic!("'meta.json' file is unable to be opened. {}", err),
        Ok(file) => file,
    };

    let mut buffer = String::new();
    match file.read_to_string(&mut buffer) {
        Err(_) => panic!("File cannot be indexed."),
        Ok(file) => file,
    };

    let obj = json::parse(buffer.as_str()).unwrap();

    if obj["introduced"] == false {
        false
    } else {
        true
    }
}

pub fn introduce_client() {
    let buttons: Vec<_> = vec![
        ButtonData {
            flags: MessageBoxButtonFlag::RETURNKEY_DEFAULT,
            button_id: 1,
            text: "Ok",
        }
    ];
    

    if already_introduced() == false {
        show_message_box(
            MessageBoxFlag::WARNING,
            buttons.as_slice(),
            "Welcome to the Easy Discord Bot!",
            "",
            None,
            None,
        );
    } else {
        once_introduced();
    }
}