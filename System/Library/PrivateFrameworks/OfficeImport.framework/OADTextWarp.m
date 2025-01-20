@interface OADTextWarp
+ (id)nullWarp;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation OADTextWarp

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 0;
}

+ (id)nullWarp
{
  v2 = objc_alloc_init(OADPresetTextWarp);
  [(OADPresetTextWarp *)v2 setPresetTextWarpType:28];
  return v2;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTextWarp;
  v2 = [(OADTextWarp *)&v4 description];
  return v2;
}

@end