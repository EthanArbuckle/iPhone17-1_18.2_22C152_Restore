@interface UITextReplacement
+ (UITextReplacement)replacementWithRange:(id)a3 original:(id)a4 replacement:(id)a5 menuTitle:(id)a6;
+ (UITextReplacement)replacementWithRange:(id)a3 original:(id)a4 replacement:(id)a5 menuTitle:(id)a6 isDictationCommandReplacement:(BOOL)a7;
- (BOOL)_isNoReplacementsFoundItem;
- (BOOL)isDictationCommandReplacement;
- (NSString)menuTitle;
- (NSString)originalText;
- (NSString)replacementText;
- (UITextRange)range;
- (id)replacementCompletionBlock;
- (unsigned)usageTrackingMask;
- (void)didReplaceTextWithTarget:(id)a3;
- (void)setReplacementCompletionBlock:(id)a3;
- (void)setUsageTrackingMask:(unsigned int)a3;
@end

@implementation UITextReplacement

+ (UITextReplacement)replacementWithRange:(id)a3 original:(id)a4 replacement:(id)a5 menuTitle:(id)a6
{
  return (UITextReplacement *)[a1 replacementWithRange:a3 original:a4 replacement:a5 menuTitle:a6 isDictationCommandReplacement:0];
}

+ (UITextReplacement)replacementWithRange:(id)a3 original:(id)a4 replacement:(id)a5 menuTitle:(id)a6 isDictationCommandReplacement:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = objc_alloc_init(UITextReplacement);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_range, a3);
    objc_storeStrong((id *)&v17->_originalText, a4);
    objc_storeStrong((id *)&v17->_replacementText, a5);
    objc_storeStrong((id *)&v17->_menuTitle, a6);
    v17->_isDictationCommandReplacement = a7;
  }

  return v17;
}

- (void)didReplaceTextWithTarget:(id)a3
{
  id v13 = a3;
  v4 = [(UITextReplacement *)self replacementCompletionBlock];

  if (v4 && [v13 conformsToProtocol:&unk_1ED42F658])
  {
    id v5 = v13;
    v6 = [(UITextReplacement *)self range];
    v7 = [v6 start];

    v8 = [(UITextReplacement *)self replacementText];
    v9 = objc_msgSend(v5, "positionFromPosition:offset:", v7, objc_msgSend(v8, "length"));

    v10 = [v5 textRangeFromPosition:v7 toPosition:v9];
    v11 = [(UITextReplacement *)self replacementCompletionBlock];
    id v12 = [(UITextReplacement *)self replacementText];
    ((void (**)(void, void *, void *, id))v11)[2](v11, v12, v10, v5);

    [(UITextReplacement *)self setReplacementCompletionBlock:0];
  }
}

- (BOOL)_isNoReplacementsFoundItem
{
  menuTitle = self->_menuTitle;
  v3 = _UINSLocalizedStringWithDefaultValue(@"No Replacements Found", @"No Replacements Found");
  LOBYTE(menuTitle) = [(NSString *)menuTitle isEqualToString:v3];

  return (char)menuTitle;
}

- (UITextRange)range
{
  return self->_range;
}

- (NSString)originalText
{
  return self->_originalText;
}

- (NSString)replacementText
{
  return self->_replacementText;
}

- (NSString)menuTitle
{
  return self->_menuTitle;
}

- (BOOL)isDictationCommandReplacement
{
  return self->_isDictationCommandReplacement;
}

- (id)replacementCompletionBlock
{
  return self->_replacementCompletionBlock;
}

- (void)setReplacementCompletionBlock:(id)a3
{
}

- (unsigned)usageTrackingMask
{
  return self->_usageTrackingMask;
}

- (void)setUsageTrackingMask:(unsigned int)a3
{
  self->_usageTrackingMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replacementCompletionBlock, 0);
  objc_storeStrong((id *)&self->_menuTitle, 0);
  objc_storeStrong((id *)&self->_replacementText, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_storeStrong((id *)&self->_range, 0);
}

@end