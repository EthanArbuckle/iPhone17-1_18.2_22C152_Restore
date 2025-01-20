@interface UITextEffectsHostingInfo
+ (id)hostingInfoForWindowScene:(id)a3;
- (BOOL)_matchingOptions:(id)a3;
- (BOOL)useHostedInstance;
- (NSDictionary)_options;
- (NSDictionary)perSceneOptions;
- (UIWindowScene)scene;
- (id)_initWithCanvas:(id)a3 options:(id)a4;
- (void)setPerSceneOptions:(id)a3;
- (void)setScene:(id)a3;
- (void)setUseHostedInstance:(BOOL)a3;
@end

@implementation UITextEffectsHostingInfo

- (BOOL)useHostedInstance
{
  return self->_hostedUseCount != 0;
}

+ (id)hostingInfoForWindowScene:(id)a3
{
  return +[_UIObjectPerCanvas objectOfClass:a1 forCanvas:a3 withOptions:0 createIfNecessary:1];
}

- (UIWindowScene)scene
{
  return self->_scene;
}

- (BOOL)_matchingOptions:(id)a3
{
  return 1;
}

- (id)_initWithCanvas:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UITextEffectsHostingInfo;
  v9 = [(UITextEffectsHostingInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scene, a3);
    objc_storeStrong((id *)&v10->_perSceneOptions, a4);
    v10->_hostedUseCount = 0;
  }

  return v10;
}

- (NSDictionary)_options
{
  return self->_perSceneOptions;
}

- (void)setUseHostedInstance:(BOOL)a3
{
  unint64_t hostedUseCount = self->_hostedUseCount;
  if (a3) {
    unint64_t v4 = hostedUseCount + 1;
  }
  else {
    unint64_t v4 = hostedUseCount - 1;
  }
  self->_unint64_t hostedUseCount = v4;
}

- (void)setScene:(id)a3
{
}

- (NSDictionary)perSceneOptions
{
  return self->_perSceneOptions;
}

- (void)setPerSceneOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perSceneOptions, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end