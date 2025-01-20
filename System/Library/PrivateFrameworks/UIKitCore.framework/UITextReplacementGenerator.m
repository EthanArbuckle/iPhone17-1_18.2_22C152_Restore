@interface UITextReplacementGenerator
- (BOOL)isStringToReplaceMisspelled;
- (BOOL)shouldAllowString:(id)a3 intoReplacements:(id)a4;
- (NSString)stringToReplace;
- (UITextRange)replacementRange;
- (id)replacementWithText:(id)a3;
- (id)replacements;
- (void)addPlaceholderForEmptyReplacements:(id)a3;
- (void)setReplacementRange:(id)a3;
- (void)setStringToReplace:(id)a3;
@end

@implementation UITextReplacementGenerator

- (BOOL)shouldAllowString:(id)a3 intoReplacements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length]
    && ([(UITextReplacementGenerator *)self stringToReplace],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v6 isEqualToString:v8],
        v8,
        (v9 & 1) == 0))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__UITextReplacementGenerator_shouldAllowString_intoReplacements___block_invoke;
    v12[3] = &unk_1E52EB3A8;
    id v13 = v6;
    BOOL v10 = [v7 indexOfObjectPassingTest:v12] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __65__UITextReplacementGenerator_shouldAllowString_intoReplacements___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 menuTitle];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (id)replacementWithText:(id)a3
{
  id v4 = a3;
  v5 = [(UITextReplacementGenerator *)self replacementRange];
  id v6 = [(UITextReplacementGenerator *)self stringToReplace];
  id v7 = +[UITextReplacement replacementWithRange:v5 original:v6 replacement:v4 menuTitle:v4];

  return v7;
}

- (void)addPlaceholderForEmptyReplacements:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    v3 = _UINSLocalizedStringWithDefaultValue(@"No Replacements Found", @"No Replacements Found");
    id v4 = +[UITextReplacement replacementWithRange:0 original:0 replacement:0 menuTitle:v3];

    [v5 addObject:v4];
  }
}

- (id)replacements
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"UITextReplacement.m", 121, @"%@ subclasses must override %s", v6, "-[UITextReplacementGenerator replacements]" object file lineNumber description];

  return 0;
}

- (BOOL)isStringToReplaceMisspelled
{
  return 0;
}

- (UITextRange)replacementRange
{
  return self->_replacementRange;
}

- (void)setReplacementRange:(id)a3
{
}

- (NSString)stringToReplace
{
  return self->_stringToReplace;
}

- (void)setStringToReplace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringToReplace, 0);
  objc_storeStrong((id *)&self->_replacementRange, 0);
}

@end