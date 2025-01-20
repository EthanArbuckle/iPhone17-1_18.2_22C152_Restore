@interface TIKeyboardInputManager_ain
- (id)deleteComposedTextFromIndex:(unint64_t)a3 count:(unint64_t *)a4;
@end

@implementation TIKeyboardInputManager_ain

- (id)deleteComposedTextFromIndex:(unint64_t)a3 count:(unint64_t *)a4
{
  v15[4] = *MEMORY[0x263EF8340];
  TIInputManager::input_string(v15, *(TIInputManager **)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98]));
  v7 = KB::ns_string((KB *)v15, v6);
  v8 = [(TIKeyboardInputManager_ain *)self internalStringToExternal:v7];

  KB::String::~String((KB::String *)v15);
  unint64_t v9 = a3 - 1;
  if (v9 <= [v8 length])
  {
    v10 = [v8 substringToIndex:v9];
    [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB90]) setString:v10];
    v11 = [(TIKeyboardInputManager_ain *)self keyboardFeatureSpecialization];
    v12 = [v11 externalStringToInternal:v10 byConvertingEagerly:1];
    KB::utf8_string(v15, v12, v13);
    TIInputManager::set_input();
    KB::String::~String((KB::String *)v15);
  }
  return 0;
}

@end