@interface _UIPhysicalKeyTranslator
- (_UIPhysicalKeyTranslator)initWithGSKeyboard:(__GSKeyboard *)a3;
- (__GSKeyboard)keyboardRef;
- (id)layoutName;
- (id)translationForHIDUsageCode:(unsigned __int16)a3 modifiers:(int64_t)a4;
- (int)HIDUsageCodeForCharacter:(unsigned __int16)a3 modifiers:(int64_t)a4;
- (void)dealloc;
@end

@implementation _UIPhysicalKeyTranslator

- (_UIPhysicalKeyTranslator)initWithGSKeyboard:(__GSKeyboard *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPhysicalKeyTranslator;
  v4 = [(_UIPhysicalKeyTranslator *)&v7 init];
  v5 = v4;
  if (a3 && v4)
  {
    v4->_keyboardRef = a3;
    CFRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  keyboardRef = self->_keyboardRef;
  if (keyboardRef) {
    CFRelease(keyboardRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalKeyTranslator;
  [(_UIPhysicalKeyTranslator *)&v4 dealloc];
}

- (id)translationForHIDUsageCode:(unsigned __int16)a3 modifiers:(int64_t)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(_UIPhysicalKeyTranslator *)self keyboardRef];
  if (v4)
  {
    GSKeyboardTranslateKeyWithModifiers();
    objc_super v4 = 0;
  }
  return v4;
}

- (int)HIDUsageCodeForCharacter:(unsigned __int16)a3 modifiers:(int64_t)a4
{
  if (![(_UIPhysicalKeyTranslator *)self keyboardRef]) {
    return -1;
  }
  return GSKeyboardGetKeyCodeForChar();
}

- (id)layoutName
{
  v2 = [(_UIPhysicalKeyTranslator *)self keyboardRef];
  if (v2)
  {
    GSKeyboardGetLayout();
    v2 = (__GSKeyboard *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (__GSKeyboard)keyboardRef
{
  return self->_keyboardRef;
}

@end