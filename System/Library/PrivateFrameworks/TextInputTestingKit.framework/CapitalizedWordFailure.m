@interface CapitalizedWordFailure
- (BOOL)doesMatchResult:(id)a3;
@end

@implementation CapitalizedWordFailure

- (BOOL)doesMatchResult:(id)a3
{
  id v3 = a3;
  v4 = [v3 corrected];
  v5 = [v4 componentsJoinedByString:&stru_26F2B7E50];

  v6 = [v3 intended];
  v7 = [v6 componentsJoinedByString:&stru_26F2B7E50];

  if ([v5 isEqualToString:v7])
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    id v9 = v7;
    v10 = [v3 context];
    uint64_t v11 = [v10 length];

    if (!v11) {
      goto LABEL_8;
    }
    if (v11 != 1)
    {
      v12 = [v3 context];
      int v13 = [v12 characterAtIndex:v11 - 1];

      v14 = [v3 context];
      unsigned int v15 = [v14 characterAtIndex:v11 - 2];

      if (v13 == 32 && v15 <= 0x3F && ((1 << v15) & 0x8000400200000000) != 0)
      {
LABEL_8:
        v16 = [v9 substringToIndex:1];
        v17 = [v16 lowercaseString];

        uint64_t v18 = objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", 0, 1, v17);

        id v9 = (id)v18;
      }
    }
    v19 = [v9 lowercaseString];
    int v8 = [v19 isEqualToString:v9] ^ 1;
  }
  return v8;
}

@end