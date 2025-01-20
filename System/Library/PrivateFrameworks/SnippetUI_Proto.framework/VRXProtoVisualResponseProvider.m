@interface VRXProtoVisualResponseProvider
+ (id)transformModel:(id)a3 mode:(int64_t)a4 currentIdiom:(int64_t)a5;
+ (void)preWarm:(id)a3;
+ (void)setPatternId:(id)a3 forViewId:(id)a4;
- (VRXProtoVisualResponseProvider)init;
- (_TtC15SnippetUI_Proto27ProtoVisualResponseProvider)provider;
- (id)viewControllerForModel:(id)a3 mode:(int64_t)a4;
- (id)viewForModel:(id)a3 mode:(int64_t)a4;
- (void)reset;
- (void)viewControllerForModel:(id)a3 mode:(int64_t)a4 completion:(id)a5;
@end

@implementation VRXProtoVisualResponseProvider

- (VRXProtoVisualResponseProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)VRXProtoVisualResponseProvider;
  v2 = [(VRXProtoVisualResponseProvider *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC15SnippetUI_Proto27ProtoVisualResponseProvider);
    provider = v2->_provider;
    v2->_provider = v3;
  }
  return v2;
}

+ (void)preWarm:(id)a3
{
}

- (id)viewControllerForModel:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  v7 = [(VRXProtoVisualResponseProvider *)self provider];
  v8 = [v7 viewControllerForModel:v6 mode:a4];

  return v8;
}

- (void)viewControllerForModel:(id)a3 mode:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(VRXProtoVisualResponseProvider *)self provider];
  [v10 viewControllerFor:v9 mode:a4 completion:v8];
}

- (id)viewForModel:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  v7 = [(VRXProtoVisualResponseProvider *)self provider];
  id v8 = [v7 viewForModel:v6 mode:a4 overload:0];

  return v8;
}

- (void)reset
{
  id v2 = [(VRXProtoVisualResponseProvider *)self provider];
  [v2 reset];
}

+ (id)transformModel:(id)a3 mode:(int64_t)a4 currentIdiom:(int64_t)a5
{
  return +[ProtoVisualResponseProvider transformModel:a3 mode:a4 currentIdiom:a5];
}

+ (void)setPatternId:(id)a3 forViewId:(id)a4
{
}

- (_TtC15SnippetUI_Proto27ProtoVisualResponseProvider)provider
{
  return (_TtC15SnippetUI_Proto27ProtoVisualResponseProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end