@interface VRXVisualResponseProvider
+ (id)transformModel:(id)a3 mode:(int64_t)a4 currentIdiom:(int64_t)a5;
+ (void)preWarm:(id)a3;
+ (void)preloadPlugins;
+ (void)setPatternId:(id)a3 forViewId:(id)a4;
- (VRXVisualResponseProvider)init;
- (_TtC9SnippetUI22VisualResponseProvider)provider;
- (id)transformModel:(id)a3 mode:(int64_t)a4;
- (id)viewControllerForModel:(id)a3 mode:(int64_t)a4;
- (id)viewControllerForSnippetModel:(id)a3 bundleName:(id)a4 mode:(int64_t)a5;
- (id)viewForModel:(id)a3 mode:(int64_t)a4;
- (id)viewForSnippetModel:(id)a3 bundleName:(id)a4 mode:(int64_t)a5;
- (void)reset;
- (void)viewControllerForModel:(id)a3 mode:(int64_t)a4 completion:(id)a5;
@end

@implementation VRXVisualResponseProvider

- (VRXVisualResponseProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)VRXVisualResponseProvider;
  v2 = [(VRXVisualResponseProvider *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9SnippetUI22VisualResponseProvider);
    provider = v2->_provider;
    v2->_provider = v3;
  }
  return v2;
}

+ (void)preloadPlugins
{
  if (preloadPlugins_once[0] != -1) {
    dispatch_once(preloadPlugins_once, &__block_literal_global);
  }
}

uint64_t __43__VRXVisualResponseProvider_preloadPlugins__block_invoke()
{
  return +[VisualResponseProvider preloadPlugins];
}

+ (void)preWarm:(id)a3
{
}

- (id)viewControllerForModel:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  v7 = [(VRXVisualResponseProvider *)self provider];
  v8 = [v7 viewControllerForModel:v6 mode:a4];

  return v8;
}

- (id)viewControllerForSnippetModel:(id)a3 bundleName:(id)a4 mode:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(VRXVisualResponseProvider *)self provider];
  v11 = [v10 viewControllerForSnippetModel:v9 bundleName:v8 mode:a5];

  return v11;
}

- (void)viewControllerForModel:(id)a3 mode:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(VRXVisualResponseProvider *)self provider];
  [v10 viewControllerFor:v9 mode:a4 completion:v8];
}

- (id)viewForModel:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  v7 = [(VRXVisualResponseProvider *)self provider];
  id v8 = [v7 viewForModel:v6 mode:a4 overload:0];

  return v8;
}

- (id)viewForSnippetModel:(id)a3 bundleName:(id)a4 mode:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(VRXVisualResponseProvider *)self provider];
  v11 = [v10 viewForSnippetModel:v9 bundleName:v8 mode:a5];

  return v11;
}

- (void)reset
{
  id v2 = [(VRXVisualResponseProvider *)self provider];
  [v2 reset];
}

- (id)transformModel:(id)a3 mode:(int64_t)a4
{
  return +[VisualResponseProvider transformModel:a3 mode:a4 currentIdiom:1];
}

+ (id)transformModel:(id)a3 mode:(int64_t)a4 currentIdiom:(int64_t)a5
{
  return +[VisualResponseProvider transformModel:a3 mode:a4 currentIdiom:a5];
}

+ (void)setPatternId:(id)a3 forViewId:(id)a4
{
}

- (_TtC9SnippetUI22VisualResponseProvider)provider
{
  return (_TtC9SnippetUI22VisualResponseProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end