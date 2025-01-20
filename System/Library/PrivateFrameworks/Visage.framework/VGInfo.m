@interface VGInfo
- (NSDictionary)framework;
- (NSDictionary)models;
- (VGInfo)init;
@end

@implementation VGInfo

- (VGInfo)init
{
  v15[1] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)VGInfo;
  v2 = [(VGInfo *)&v13 init];
  if (v2)
  {
    v14 = @"version";
    v3 = objc_msgSend(MEMORY[0x263F086E0], "vg_bundle");
    v4 = [v3 infoDictionary];
    v5 = [v4 valueForKey:@"CFBundleVersion"];
    v15[0] = v5;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    framework = v2->_framework;
    v2->_framework = (NSDictionary *)v6;

    v8 = objc_opt_new();
    uint64_t v9 = [v8 copy];
    models = v2->_models;
    v2->_models = (NSDictionary *)v9;

    v11 = v2;
  }

  return v2;
}

- (NSDictionary)framework
{
  return self->_framework;
}

- (NSDictionary)models
{
  return self->_models;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);

  objc_storeStrong((id *)&self->_framework, 0);
}

@end