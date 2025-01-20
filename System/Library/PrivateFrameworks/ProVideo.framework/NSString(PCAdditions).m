@interface NSString(PCAdditions)
- (BOOL)isAllWhitespace;
- (BOOL)isAllWhitespaceAndNewline;
- (BOOL)isNewline;
- (CFIndex)glyphCount;
- (__CFString)stringByTrimmingLeadingCharactersInSet:()PCAdditions;
- (uint64_t)composedCharacterCount;
- (uint64_t)stringByRemovingCharactersInSet:()PCAdditions;
- (uint64_t)stringByTrimmingLeadingWhitespace;
- (unint64_t)UTF32CharacterCount;
@end

@implementation NSString(PCAdditions)

- (uint64_t)composedCharacterCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v2 = [a1 length];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __47__NSString_PCAdditions__composedCharacterCount__block_invoke;
  v5[3] = &unk_1E616BF98;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CFIndex)glyphCount
{
  CFAttributedStringRef v1 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a1];
  uint64_t v2 = CTLineCreateWithAttributedString(v1);

  CFIndex GlyphCount = CTLineGetGlyphCount(v2);
  CFRelease(v2);
  return GlyphCount;
}

- (unint64_t)UTF32CharacterCount
{
  return (unint64_t)[a1 lengthOfBytesUsingEncoding:2348810496] >> 2;
}

- (BOOL)isAllWhitespace
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet")), "length") == 0;
}

- (BOOL)isAllWhitespaceAndNewline
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet")), "length") == 0;
}

- (BOOL)isNewline
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "newlineCharacterSet")), "length") == 0;
}

- (uint64_t)stringByRemovingCharactersInSet:()PCAdditions
{
  CFAttributedStringRef v1 = objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");

  return [v1 componentsJoinedByString:&stru_1F119C770];
}

- (__CFString)stringByTrimmingLeadingCharactersInSet:()PCAdditions
{
  uint64_t v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", objc_msgSend(a3, "invertedSet"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return &stru_1F119C770;
  }

  return (__CFString *)[a1 substringFromIndex:v4];
}

- (uint64_t)stringByTrimmingLeadingWhitespace
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];

  return [a1 stringByTrimmingLeadingCharactersInSet:v2];
}

@end