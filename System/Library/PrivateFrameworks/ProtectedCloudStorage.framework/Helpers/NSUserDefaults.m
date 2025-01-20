@interface NSUserDefaults
- (id)dateForKey:(id)a3;
- (id)fuzzyDaysSinceKey:(id)a3;
- (int)tristateForBoolKey:(id)a3;
@end

@implementation NSUserDefaults

- (id)dateForKey:(id)a3
{
  v3 = [(NSUserDefaults *)self objectForKey:a3];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)fuzzyDaysSinceKey:(id)a3
{
  v3 = [(NSUserDefaults *)self dateForKey:a3];
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[SFAnalytics fuzzyDaysSinceDate:v3]);

  return v4;
}

- (int)tristateForBoolKey:(id)a3
{
  v3 = [(NSUserDefaults *)self objectForKey:a3];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v4 = [v3 BOOLValue];
  }
  else {
    int v4 = -1;
  }

  return v4;
}

@end