@interface PUEditPluginActivity
+ (int64_t)activityCategory;
- (BOOL)_isHiddenByDefault;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (PUEditPlugin)plugin;
- (PUEditPluginActivity)initWithPlugin:(id)a3;
- (id)_activityImage;
- (id)_activitySettingsImage;
- (id)activityTitle;
- (id)activityType;
@end

@implementation PUEditPluginActivity

- (void).cxx_destruct
{
}

- (PUEditPlugin)plugin
{
  return self->_plugin;
}

- (BOOL)_isHiddenByDefault
{
  return 1;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (id)_activitySettingsImage
{
  v2 = [(PUEditPluginActivity *)self plugin];
  v3 = [v2 smallIcon];

  return v3;
}

- (id)_activityImage
{
  v2 = [(PUEditPluginActivity *)self plugin];
  v3 = [v2 icon];

  return v3;
}

- (id)activityTitle
{
  v2 = [(PUEditPluginActivity *)self plugin];
  v3 = [v2 title];

  return v3;
}

- (id)activityType
{
  v2 = [(PUEditPluginActivity *)self plugin];
  v3 = [v2 extension];
  v4 = [v3 identifier];

  return v4;
}

- (PUEditPluginActivity)initWithPlugin:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUEditPluginActivity;
  v6 = [(UIActivity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_plugin, a3);
  }

  return v7;
}

+ (int64_t)activityCategory
{
  return 1;
}

@end