@interface UIWindowSceneGeometryPreferences
- (BOOL)isEqual:(id)a3;
- (id)_init;
- (int64_t)_type;
@end

@implementation UIWindowSceneGeometryPreferences

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)UIWindowSceneGeometryPreferences;
  return [(UIWindowSceneGeometryPreferences *)&v3 init];
}

- (int64_t)_type
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = [(UIWindowSceneGeometryPreferences *)self _type];
    BOOL v6 = v5 == [v4 _type];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end