@interface NSAttributedString(REMTTParagraphStyle)
- (REMTTParagraphStyle)rem_paragraphStyleAtIndex:()REMTTParagraphStyle effectiveRange:;
@end

@implementation NSAttributedString(REMTTParagraphStyle)

- (REMTTParagraphStyle)rem_paragraphStyleAtIndex:()REMTTParagraphStyle effectiveRange:
{
  if ((a3 & 0x8000000000000000) != 0
    || ([a1 string],
        v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 length],
        v7,
        v8 <= a3))
  {
    v10 = 0;
    if (a4) {
      *a4 = xmmword_1B9BF2060;
    }
  }
  else
  {
    v9 = [a1 attribute:TTAttributeNameParagraphStyle atIndex:a3 effectiveRange:a4];
    if (v9)
    {
      v10 = [[REMTTParagraphStyle alloc] initWithContents:v9];
    }
    else
    {
      v10 = 0;
      if (a4) {
        *a4 = xmmword_1B9BF2060;
      }
    }
  }

  return v10;
}

@end