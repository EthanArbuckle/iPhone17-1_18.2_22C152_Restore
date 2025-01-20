@interface TLTimelineUtilities
+ (BOOL)date:(id)a3 isOrderedAscendingToDate:(id)a4;
+ (BOOL)object:(id)a3 isEqualToObject:(id)a4;
@end

@implementation TLTimelineUtilities

+ (BOOL)date:(id)a3 isOrderedAscendingToDate:(id)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4) {
      return [a3 compare:a4] == -1;
    }
  }
  return result;
}

+ (BOOL)object:(id)a3 isEqualToObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 == v6)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v7 = [v5 isEqual:v6];
    }
    else {
      char v7 = 0;
    }
  }

  return v7;
}

@end