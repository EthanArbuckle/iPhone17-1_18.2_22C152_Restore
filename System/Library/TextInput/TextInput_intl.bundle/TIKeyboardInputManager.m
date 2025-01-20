@interface TIKeyboardInputManager
@end

@implementation TIKeyboardInputManager

uint64_t __45__TIKeyboardInputManager_intl_HWR_recognizer__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F35CA0]);
  v1 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en"];
  uint64_t v2 = [v0 initWithMode:1 locale:v1];
  v3 = (void *)recognizer___recognizer;
  recognizer___recognizer = v2;

  v4 = (void *)recognizer___recognizer;
  return [v4 setMaxRecognitionResultCount:4];
}

@end