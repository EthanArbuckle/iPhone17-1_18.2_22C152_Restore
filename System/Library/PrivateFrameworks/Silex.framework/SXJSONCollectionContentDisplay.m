@interface SXJSONCollectionContentDisplay
+ (id)typeString;
- (unint64_t)alignmentWithValue:(id)a3 withType:(int)a4;
- (unint64_t)distributionWithValue:(id)a3 withType:(int)a4;
- (unint64_t)widowsWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXJSONCollectionContentDisplay

+ (id)typeString
{
  return @"collection";
}

- (unint64_t)widowsWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    if ([v5 isEqualToString:@"equalize"])
    {
      unint64_t v7 = 1;
    }
    else if ([v6 isEqualToString:@"allow"])
    {
      unint64_t v7 = 2;
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)alignmentWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    if ([v5 isEqualToString:@"center"])
    {
      unint64_t v7 = 1;
    }
    else if ([v6 isEqualToString:@"right"])
    {
      unint64_t v7 = 2;
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)distributionWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 3) {
    return objc_msgSend(a3, "isEqualToString:", @"narrow", v4, v5);
  }
  else {
    return 0;
  }
}

@end