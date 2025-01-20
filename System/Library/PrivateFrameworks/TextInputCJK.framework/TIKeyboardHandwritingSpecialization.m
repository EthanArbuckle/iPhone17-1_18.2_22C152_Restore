@interface TIKeyboardHandwritingSpecialization
- (BOOL)canHandleKeyHitTest;
- (BOOL)shouldExtendPriorWord;
- (BOOL)supportsLearning;
- (BOOL)supportsReversionUI;
- (id)keyboardBehaviors;
- (id)nonstopPunctuationCharacters;
- (id)replacementForDoubleSpace;
- (id)wordSeparator;
@end

@implementation TIKeyboardHandwritingSpecialization

- (BOOL)canHandleKeyHitTest
{
  return 0;
}

- (id)nonstopPunctuationCharacters
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardHandwritingSpecialization;
  v2 = [(TIKeyboardFeatureSpecialization *)&v5 nonstopPunctuationCharacters];
  v3 = [v2 stringByAppendingString:@"☻"];

  return v3;
}

- (id)replacementForDoubleSpace
{
  v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  v3 = [v2 replacementForDoubleSpace];
  v4 = v3;
  if (!v3) {
    v3 = @"。";
  }
  objc_super v5 = v3;

  return v5;
}

- (id)wordSeparator
{
  return &stru_270B867F0;
}

- (BOOL)supportsLearning
{
  return 0;
}

- (BOOL)supportsReversionUI
{
  return 0;
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (id)keyboardBehaviors
{
  v2 = objc_opt_new();
  return v2;
}

@end