@interface TIKeyboardCandidate(UIKeyboardAdditions)
+ (__CFString)imageNameForTextEffectsButton;
+ (id)textEffectsButtonCandidate;
- (BOOL)isAutofillCandidate;
- (BOOL)isReplacement;
- (id)customView;
- (id)handler;
- (id)icon;
- (uint64_t)isSlottedCandidate;
- (void)setCustomView:()UIKeyboardAdditions;
- (void)setHandler:()UIKeyboardAdditions;
- (void)setIcon:()UIKeyboardAdditions;
@end

@implementation TIKeyboardCandidate(UIKeyboardAdditions)

- (void)setIcon:()UIKeyboardAdditions
{
}

- (id)icon
{
  return objc_getAssociatedObject(a1, &kKeyboardCandidateIconKey);
}

- (void)setCustomView:()UIKeyboardAdditions
{
}

- (id)customView
{
  return objc_getAssociatedObject(a1, &kKeyboardCandidateViewKey);
}

- (void)setHandler:()UIKeyboardAdditions
{
  id v4 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, &kKeyboardCandidateHandlerKey, v4, (void *)1);
}

- (id)handler
{
  return objc_getAssociatedObject(a1, &kKeyboardCandidateHandlerKey);
}

- (uint64_t)isSlottedCandidate
{
  if ([a1 isSecureContentCandidate])
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)isAutofillCandidate
{
  return ([a1 customInfoType] & 0x66F8) != 0;
}

- (BOOL)isReplacement
{
  v1 = [a1 input];
  BOOL v2 = [v1 length] != 0;

  return v2;
}

+ (__CFString)imageNameForTextEffectsButton
{
  v0 = +[UIKeyboardImpl activeInstance];
  v1 = [v0 traitCollection];
  if ([v1 userInterfaceIdiom])
  {
    BOOL v2 = +[UIKeyboardImpl isFloating];

    if (!v2) {
      return 0;
    }
  }
  else
  {
  }
  id v4 = +[UIKeyboardImpl activeInstance];
  v5 = [v4 textInputTraits];
  uint64_t v6 = [v5 allowsTextAnimationsType];

  if (v6 == 2) {
    return @"character.motion";
  }
  else {
    return 0;
  }
}

+ (id)textEffectsButtonCandidate
{
  BOOL v2 = +[UIKeyboardInputModeController sharedInputModeController];
  v3 = [v2 textEffectsButtonLanguageCode];

  uint64_t v4 = [a1 imageNameForTextEffectsButton];
  v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = [MEMORY[0x1E4FAE318] candidateWithCandidate:&stru_1ED0E84C0 forInput:&stru_1ED0E84C0 customInfoType:0x8000];
    v8 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody" scale:-1];
    v9 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:20.0];
    v10 = [v8 configurationByApplyingConfiguration:v9];

    v11 = +[UIKeyboard activeKeyboard];
    if ([v11 _lightStyleRenderConfig]) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }

    v13 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:v12];
    v14 = [v10 configurationWithTraitCollection:v13];

    v15 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v3];
    v16 = [v14 configurationWithLocale:v15];

    v17 = +[UIImage _systemImageNamed:v5 withConfiguration:v16];
    [v7 setIcon:v17];
  }
  return v7;
}

@end