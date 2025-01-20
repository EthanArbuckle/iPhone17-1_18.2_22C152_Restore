@interface TIKeyboardInputManagerTransliterationBase
- (BOOL)deletesComposedTextByComposedCharacterSequence;
- (BOOL)isHighMemoryManager;
- (void)initImplementation;
@end

@implementation TIKeyboardInputManagerTransliterationBase

- (BOOL)isHighMemoryManager
{
  return 1;
}

- (BOOL)deletesComposedTextByComposedCharacterSequence
{
  return 0;
}

- (void)initImplementation
{
  if (!self->super.m_impl) {
    operator new();
  }
  return self->super.m_impl;
}

@end