@interface MDStringCopyAbbreviations
@end

@implementation MDStringCopyAbbreviations

void ___MDStringCopyAbbreviations_block_invoke()
{
  Mutable = CFCharacterSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  _MDStringCopyAbbreviations_characterSet = (uint64_t)Mutable;
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetSymbol);
  CFCharacterSetUnion(Mutable, Predefined);
  v2 = (__CFCharacterSet *)_MDStringCopyAbbreviations_characterSet;
  CFCharacterSetRef v3 = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  CFCharacterSetUnion(v2, v3);
  v4 = (__CFCharacterSet *)_MDStringCopyAbbreviations_characterSet;
  CFCharacterSetRef v5 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);

  CFCharacterSetUnion(v4, v5);
}

@end