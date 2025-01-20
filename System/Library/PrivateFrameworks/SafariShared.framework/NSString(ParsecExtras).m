@interface NSString(ParsecExtras)
- (id)safari_normalizedParsecInputString;
@end

@implementation NSString(ParsecExtras)

- (id)safari_normalizedParsecInputString
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"‘’‚‛"];
  v27[0] = v2;
  v28[0] = @"'";
  v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"“”„‟"];
  v27[1] = v3;
  v28[1] = @"\"";
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v5 = (void *)[v4 mutableCopy];

  objc_msgSend(v5, "addCharactersInRange:", 0x2000, 12);
  [v5 addCharactersInString:@"  ᠎  　﻿"];
  v6 = [a1 precomposedStringWithCanonicalMapping];
  v7 = [v6 lowercaseString];

  v8 = [MEMORY[0x1E4F28E78] string];
  uint64_t v9 = [v7 length];
  if (v9)
  {
    LOBYTE(v10) = 0;
    for (uint64_t i = 0; i != v9; ++i)
    {
      char v12 = v10;
      __int16 v26 = 0;
      uint64_t v13 = [v7 characterAtIndex:i];
      __int16 v26 = v13;
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      int v10 = [v5 characterIsMember:v13];
      if (v10)
      {
        if ((v12 & 1) == 0)
        {
          if ([v8 length]) {
            [v8 appendString:@" "];
          }
          *((unsigned char *)v23 + 24) = 1;
        }
      }
      else if (!*((unsigned char *)v23 + 24))
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __60__NSString_ParsecExtras__safari_normalizedParsecInputString__block_invoke;
        v18[3] = &unk_1E5C9E5A8;
        __int16 v21 = v26;
        id v14 = v8;
        id v19 = v14;
        v20 = &v22;
        [v17 enumerateKeysAndObjectsUsingBlock:v18];
        if (!*((unsigned char *)v23 + 24))
        {
          v15 = [NSString stringWithCharacters:&v26 length:1];
          [v14 appendString:v15];
        }
      }
      _Block_object_dispose(&v22, 8);
    }
  }

  return v8;
}

@end