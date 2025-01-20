@interface __NSTextListElementEditedRangeValidator
- (_NSRange)adjustedInvalidationRangeForRange:(_NSRange)a3 limitRange:(_NSRange)a4 textContentStorage:(id)a5;
@end

@implementation __NSTextListElementEditedRangeValidator

- (_NSRange)adjustedInvalidationRangeForRange:(_NSRange)a3 limitRange:(_NSRange)a4 textContentStorage:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v7 = a3.length;
  unint64_t v8 = a3.location;
  v9 = (void *)[a5 attributedString];
  if (v8 < [v9 length])
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v8, 0), "textLists"), "firstObject");
    if (v10)
    {
      NSUInteger v11 = [v9 rangeOfTextList:v10 atIndex:v8];
      if (v12)
      {
        v19.NSUInteger location = v11;
        v19.NSUInteger length = v12;
        v16.NSUInteger location = v8;
        v16.NSUInteger length = v7;
        NSRange v20 = NSUnionRange(v16, v19);
        v17.NSUInteger location = location;
        v17.NSUInteger length = length;
        NSRange v13 = NSIntersectionRange(v17, v20);
        unint64_t v8 = v13.location;
        NSUInteger v7 = v13.length;
      }
    }
  }
  NSUInteger v14 = v8;
  NSUInteger v15 = v7;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

@end