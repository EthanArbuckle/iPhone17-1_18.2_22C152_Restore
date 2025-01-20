@interface NSMutableDictionary(PDAdditions)
- (void)setBool:()PDAdditions forKey:;
- (void)setDouble:()PDAdditions forKey:;
- (void)setEntityPIDOrNull:()PDAdditions forKey:;
- (void)setInt32:()PDAdditions forKey:;
- (void)setInteger:()PDAdditions forKey:;
- (void)setLongLong:()PDAdditions forKey:;
- (void)setObjectOrNull:()PDAdditions forKey:;
- (void)setUnsignedLongLong:()PDAdditions forKey:;
@end

@implementation NSMutableDictionary(PDAdditions)

- (void)setEntityPIDOrNull:()PDAdditions forKey:
{
  if (a3)
  {
    v6 = NSNumber;
    id v7 = a4;
    objc_msgSend(v6, "numberWithLongLong:", objc_msgSend(a3, "persistentID"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObjectOrNull:forKey:");
  }
  else
  {
    id v8 = a4;
    objc_msgSend(a1, "setObjectOrNull:forKey:", 0);
  }
}

- (void)setObjectOrNull:()PDAdditions forKey:
{
  if (a3)
  {
    id v8 = a4;
    objc_msgSend(a1, "setObject:forKey:", a3);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CA98];
    id v7 = a4;
    id v8 = [v6 null];
    objc_msgSend(a1, "setObject:forKey:");
  }
}

- (void)setInt32:()PDAdditions forKey:
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInt:a3];
  [a1 setObject:v8 forKey:v7];
}

- (void)setInteger:()PDAdditions forKey:
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [a1 setObject:v8 forKey:v7];
}

- (void)setLongLong:()PDAdditions forKey:
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithLongLong:a3];
  [a1 setObject:v8 forKey:v7];
}

- (void)setUnsignedLongLong:()PDAdditions forKey:
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithUnsignedLongLong:a3];
  [a1 setObject:v8 forKey:v7];
}

- (void)setDouble:()PDAdditions forKey:
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a2];
  [a1 setObject:v8 forKey:v7];
}

- (void)setBool:()PDAdditions forKey:
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:a3];
  [a1 setObject:v8 forKey:v7];
}

@end