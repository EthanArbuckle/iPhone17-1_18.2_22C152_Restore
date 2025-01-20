@interface ICHashtagController(App)
- (void)checkForHashtagInEditedRange:()App ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:;
@end

@implementation ICHashtagController(App)

- (void)checkForHashtagInEditedRange:()App ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:
{
  id v20 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a10;
  if (objc_opt_respondsToSelector())
  {
    LOWORD(v19) = a9;
    [a1 _checkForHashtagInEditedRange:a3 ofTextStorage:a4 note:v20 textView:v16 allowAutoExplicitHashtag:v17 isEndingEditing:a8 languageHasSpaces:v19 parentAttachment:v18];
  }
}

@end