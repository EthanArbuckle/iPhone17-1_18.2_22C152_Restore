@interface PBCodable(MRAdditions)
- (id)mr_valueForPotentiallyUndefinedKey:()MRAdditions;
@end

@implementation PBCodable(MRAdditions)

- (id)mr_valueForPotentiallyUndefinedKey:()MRAdditions
{
  id v4 = a3;
  v5 = [v4 substringToIndex:1];
  v6 = NSString;
  v7 = [v5 uppercaseString];
  v8 = [v6 stringWithFormat:@"has%@", v7];

  objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__PBCodable_MRAdditions__mr_valueForPotentiallyUndefinedKey___block_invoke;
  v16[3] = &unk_1E57D2B58;
  v16[4] = a1;
  id v17 = v4;
  id v10 = v4;
  v11 = (void (**)(void))MEMORY[0x1997190F0](v16);
  SEL v12 = NSSelectorFromString(v9);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v13 = (unsigned int (*)(void *, SEL))[a1 methodForSelector:v12]) != 0
    && v13(a1, v12))
  {
    v14 = v11[2](v11);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end