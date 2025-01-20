@interface TIKeyboardInputManager_vi_VNI
- (BOOL)allowsAutocorrectionForCurrentInputString;
- (BOOL)inputTypeSupportsDecomposition;
- (int)vietnameseType;
@end

@implementation TIKeyboardInputManager_vi_VNI

- (int)vietnameseType
{
  return 2;
}

- (BOOL)inputTypeSupportsDecomposition
{
  return 0;
}

- (BOOL)allowsAutocorrectionForCurrentInputString
{
  v7[4] = *MEMORY[0x263EF8340];
  TIInputManager::input_string(v7, *(TIInputManager **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]));
  v3 = KB::ns_string((KB *)v7, v2);
  KB::String::~String((KB::String *)v7);
  v4 = objc_msgSend(MEMORY[0x263F08708], "TI_vietnameseVNISpecialsCharacterSet");
  BOOL v5 = [v3 rangeOfCharacterFromSet:v4] == 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

@end