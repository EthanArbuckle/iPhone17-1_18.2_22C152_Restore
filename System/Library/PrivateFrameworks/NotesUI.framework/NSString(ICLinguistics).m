@interface NSString(ICLinguistics)
- (id)ic_guessedWords;
@end

@implementation NSString(ICLinguistics)

- (id)ic_guessedWords
{
  v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v3 = [v2 firstObject];

  id v4 = objc_alloc_init(MEMORY[0x1E4FB1D50]);
  v6 = 0;
  if (!objc_msgSend(v4, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", a1, 0, objc_msgSend(a1, "length"), 0, 0, v3))
  {
    uint64_t v7 = v5;
    if (v5 == [a1 length])
    {
      v6 = objc_msgSend(v4, "guessesForWordRange:inString:language:", 0, v7, a1, v3);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

@end