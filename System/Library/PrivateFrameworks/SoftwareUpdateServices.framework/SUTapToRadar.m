@interface SUTapToRadar
+ (id)_stringOfClassification:(int64_t)a3;
+ (id)_stringOfReproducibility:(int64_t)a3;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)message;
- (NSString)title;
- (SUTapToRadar)init;
- (int64_t)classification;
- (int64_t)componentID;
- (int64_t)reproducibility;
- (void)file;
- (void)setClassification:(int64_t)a3;
- (void)setComponentID:(int64_t)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentVersion:(id)a3;
- (void)setMessage:(id)a3;
- (void)setReproducibility:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUTapToRadar

- (SUTapToRadar)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUTapToRadar;
  v2 = [(SUTapToRadar *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_classification = 0;
    v2->_reproducibility = 0;
    componentName = v2->_componentName;
    v2->_componentName = (NSString *)@"SoftwareUpdateServices";

    componentVersion = v3->_componentVersion;
    v3->_componentVersion = (NSString *)@"all";

    v3->_componentID = 435644;
  }
  return v3;
}

+ (id)_stringOfClassification:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9) {
    return 0;
  }
  else {
    return off_26447EA08[a3 - 1];
  }
}

+ (id)_stringOfReproducibility:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return off_26447EA58[a3 - 1];
  }
}

- (void)file
{
  if (MGGetBoolAnswer())
  {
    id v18 = (id)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"tap-to-radar://new?"];
    if (self->_title) {
      [v18 appendFormat:@"Title=%@&", self->_title];
    }
    if (self->_message) {
      [v18 appendFormat:@"Description=%@&", self->_message];
    }
    uint64_t v10 = +[SUTapToRadar _stringOfClassification:self->_classification];
    v11 = (void *)v10;
    if (v10) {
      [v18 appendFormat:@"Classification=%@&", v10];
    }
    uint64_t v12 = +[SUTapToRadar _stringOfReproducibility:self->_reproducibility];
    v13 = (void *)v12;
    if (v12) {
      [v18 appendFormat:@"Reproducibility=%@&", v12];
    }
    componentName = self->_componentName;
    if (componentName)
    {
      if (self->_componentVersion)
      {
        int64_t componentID = self->_componentID;
        if (componentID) {
          [v18 appendFormat:@"ComponentName=%@&ComponentVersion=%@&ComponentID=%ld", componentName, self->_componentVersion, componentID];
        }
      }
    }
    v16 = (void *)[objc_alloc(NSURL) initWithString:v18];
    v17 = [MEMORY[0x263F01880] defaultWorkspace];
    [v17 openURL:v16 configuration:0 completionHandler:0];
  }
  else
  {
    SULogInfo(@"%s: Shouldn't try to file a radar on an external device...", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUTapToRadar file]");
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (int64_t)reproducibility
{
  return self->_reproducibility;
}

- (void)setReproducibility:(int64_t)a3
{
  self->_reproducibility = a3;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
}

- (int64_t)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(int64_t)a3
{
  self->_int64_t componentID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end