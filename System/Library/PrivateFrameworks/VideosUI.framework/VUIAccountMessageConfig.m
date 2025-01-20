@interface VUIAccountMessageConfig
- (BOOL)alwaysForceOpenSidebarAnimated;
- (BOOL)alwaysForceOpenSidebarNonAnimated;
- (NSDictionary)visibilityBehaviours;
- (VUIAccountMessageConfig)init;
- (id)_createVisibilityDictionary;
- (int64_t)_getFallbackVisibilityType;
- (int64_t)fallbackVisibilityType;
- (void)setAlwaysForceOpenSidebarAnimated:(BOOL)a3;
- (void)setAlwaysForceOpenSidebarNonAnimated:(BOOL)a3;
- (void)setFallbackVisibilityType:(int64_t)a3;
- (void)setVisibilityBehaviours:(id)a3;
@end

@implementation VUIAccountMessageConfig

- (void)setVisibilityBehaviours:(id)a3
{
}

- (void)setFallbackVisibilityType:(int64_t)a3
{
  self->_fallbackVisibilityType = a3;
}

- (void)setAlwaysForceOpenSidebarNonAnimated:(BOOL)a3
{
  self->_alwaysForceOpenSidebarNonAnimated = a3;
}

- (void)setAlwaysForceOpenSidebarAnimated:(BOOL)a3
{
  self->_alwaysForceOpenSidebarAnimated = a3;
}

- (VUIAccountMessageConfig)init
{
  v7.receiver = self;
  v7.super_class = (Class)VUIAccountMessageConfig;
  v2 = [(VUIAccountMessageConfig *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(VUIAccountMessageConfig *)v2 _createVisibilityDictionary];
    visibilityBehaviours = v3->_visibilityBehaviours;
    v3->_visibilityBehaviours = (NSDictionary *)v4;

    v3->_fallbackVisibilityType = [(VUIAccountMessageConfig *)v3 _getFallbackVisibilityType];
    *(_WORD *)&v3->_alwaysForceOpenSidebarAnimated = 0;
  }
  return v3;
}

- (int64_t)_getFallbackVisibilityType
{
  v2 = +[VUIFeaturesConfiguration defaultsStringValueForKey:@"fallbackVisibilityType"];
  v3 = v2;
  if (v2) {
    int64_t v4 = VUIAccountMessageVisibilityTypeFromString(v2);
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (id)_createVisibilityDictionary
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"highVisibility";
  v8[0] = @"animateMessageIn";
  v8[1] = @"forceOpenSidebar";
  v9[0] = MEMORY[0x1E4F1CC38];
  v9[1] = MEMORY[0x1E4F1CC38];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v11[0] = v2;
  v10[1] = @"passiveVisibility";
  v6[0] = @"animateMessageIn";
  v6[1] = @"forceOpenSidebar";
  v7[0] = MEMORY[0x1E4F1CC28];
  v7[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v11[1] = v3;
  int64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v4;
}

- (NSDictionary)visibilityBehaviours
{
  return self->_visibilityBehaviours;
}

- (int64_t)fallbackVisibilityType
{
  return self->_fallbackVisibilityType;
}

- (BOOL)alwaysForceOpenSidebarAnimated
{
  return self->_alwaysForceOpenSidebarAnimated;
}

- (BOOL)alwaysForceOpenSidebarNonAnimated
{
  return self->_alwaysForceOpenSidebarNonAnimated;
}

- (void).cxx_destruct
{
}

@end