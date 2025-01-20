@interface MSDSettingsContext
+ (id)defaultContextForIdentifier:(id)a3;
- (NSDictionary)dataDict;
- (void)setDataDict:(id)a3;
@end

@implementation MSDSettingsContext

+ (id)defaultContextForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MSDSettingsContext);
  [(MSDOperationContext *)v4 setIdentifier:v3];

  return v4;
}

- (NSDictionary)dataDict
{
  return self->_dataDict;
}

- (void)setDataDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end