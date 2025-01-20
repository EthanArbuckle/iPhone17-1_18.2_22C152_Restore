@interface PUEditPluginActionActivity
+ (int64_t)activityCategory;
- (NSString)internalSystemImageName;
- (PUEditPluginActionActivity)initWithPlugin:(id)a3 systemImageName:(id)a4;
- (id)_systemImageName;
@end

@implementation PUEditPluginActionActivity

- (void).cxx_destruct
{
}

- (NSString)internalSystemImageName
{
  return self->_internalSystemImageName;
}

- (id)_systemImageName
{
  return self->_internalSystemImageName;
}

- (PUEditPluginActionActivity)initWithPlugin:(id)a3 systemImageName:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUEditPluginActionActivity;
  v7 = [(PUEditPluginActivity *)&v11 initWithPlugin:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    internalSystemImageName = v7->_internalSystemImageName;
    v7->_internalSystemImageName = (NSString *)v8;
  }
  return v7;
}

+ (int64_t)activityCategory
{
  return 0;
}

@end