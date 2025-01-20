@interface SXVideoComponent
+ (id)typeString;
- (BOOL)allowsPrerollAdsWithValue:(id)a3 withType:(int)a4;
- (SXVideoComponent)initWithJSONObject:(id)a3 andVersion:(id)a4;
- (double)aspectRatioWithValue:(id)a3 withType:(int)a4;
- (unint64_t)traits;
@end

@implementation SXVideoComponent

+ (id)typeString
{
  return @"video";
}

- (SXVideoComponent)initWithJSONObject:(id)a3 andVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  v9 = v8;
  if (objc_opt_isKindOfClass())
  {
    v10 = [v8 objectForKey:@"prerollPlacementIdentifier"];

    v9 = v8;
    if (!v10)
    {
      v9 = (void *)[v8 mutableCopy];
      v11 = [MEMORY[0x263F08C38] UUID];
      v12 = [v11 UUIDString];
      [v9 setObject:v12 forKey:@"prerollPlacementIdentifier"];
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SXVideoComponent;
  v13 = [(SXJSONObject *)&v15 initWithJSONObject:v9 andVersion:v7];

  return v13;
}

- (double)aspectRatioWithValue:(id)a3 withType:(int)a4
{
  if (a4 != 2) {
    return 1.77777779;
  }
  [a3 floatValue];
  double v5 = v4;
  BOOL v6 = v4 == 0.0;
  double result = 1.77777779;
  if (!v6) {
    return v5;
  }
  return result;
}

- (BOOL)allowsPrerollAdsWithValue:(id)a3 withType:(int)a4
{
  if (a3 && a4 == 2) {
    return [a3 BOOLValue];
  }
  else {
    return 1;
  }
}

- (unint64_t)traits
{
  return 2;
}

@end