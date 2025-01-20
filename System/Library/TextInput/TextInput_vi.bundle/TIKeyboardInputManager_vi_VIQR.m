@interface TIKeyboardInputManager_vi_VIQR
- (BOOL)allowsAutocorrectionForCurrentInputString;
- (BOOL)inputTypeSupportsDecomposition;
- (id)wordCharacters;
- (int)vietnameseType;
@end

@implementation TIKeyboardInputManager_vi_VIQR

- (int)vietnameseType
{
  return 3;
}

- (BOOL)inputTypeSupportsDecomposition
{
  return 0;
}

- (id)wordCharacters
{
  v2 = (void *)-[TIKeyboardInputManager_vi_VIQR wordCharacters]::__wordCharacterSet;
  if (!-[TIKeyboardInputManager_vi_VIQR wordCharacters]::__wordCharacterSet)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F7E6B0]) initWithBaseCharacterSet:10];
    uint64_t v4 = [v3 copy];
    v5 = (void *)-[TIKeyboardInputManager_vi_VIQR wordCharacters]::__wordCharacterSet;
    -[TIKeyboardInputManager_vi_VIQR wordCharacters]::__wordCharacterSet = v4;

    v2 = (void *)-[TIKeyboardInputManager_vi_VIQR wordCharacters]::__wordCharacterSet;
  }
  return v2;
}

- (BOOL)allowsAutocorrectionForCurrentInputString
{
  v7[4] = *MEMORY[0x263EF8340];
  TIInputManager::input_string(v7, *(TIInputManager **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]));
  v3 = KB::ns_string((KB *)v7, v2);
  KB::String::~String((KB::String *)v7);
  uint64_t v4 = objc_msgSend(MEMORY[0x263F08708], "TI_vietnameseVIQRSpecialsCharacterSet");
  BOOL v5 = [v3 rangeOfCharacterFromSet:v4] == 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

@end