@interface SXAdvertisementComponent
- (SXAdvertisementComponent)initWithJSONObject:(id)a3 andVersion:(id)a4;
- (UIColor)debugColor;
- (unint64_t)adType;
- (unint64_t)placementType;
- (unint64_t)traits;
@end

@implementation SXAdvertisementComponent

- (SXAdvertisementComponent)initWithJSONObject:(id)a3 andVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  v9 = v8;
  if (objc_opt_isKindOfClass())
  {
    v10 = [v8 objectForKey:@"placementIdentifier"];

    v9 = v8;
    if (!v10)
    {
      v9 = (void *)[v8 mutableCopy];
      v11 = [MEMORY[0x263F08C38] UUID];
      v12 = [v11 UUIDString];
      [v9 setObject:v12 forKey:@"placementIdentifier"];
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SXAdvertisementComponent;
  v13 = [(SXJSONObject *)&v15 initWithJSONObject:v9 andVersion:v7];

  return v13;
}

- (unint64_t)traits
{
  return 16;
}

- (UIColor)debugColor
{
  return 0;
}

- (unint64_t)placementType
{
  return 0;
}

- (unint64_t)adType
{
  return self->adType;
}

@end