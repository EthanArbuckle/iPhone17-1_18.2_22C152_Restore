@interface PluginDiskImageGraphNode
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)deleteImage;
- (NSDictionary)pluginParams;
- (NSString)pluginName;
- (PluginDiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6;
- (PluginDiskImageGraphNode)initWithPluginName:(id)a3 pluginParams:(id)a4 tag:(id)a5 UUID:(id)a6 parentNode:(id)a7 metadata:(id)a8 isCache:(BOOL)a9;
- (id)URL;
- (id)toDictionary;
- (void)setPluginName:(id)a3;
- (void)setPluginParams:(id)a3;
@end

@implementation PluginDiskImageGraphNode

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  v6 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PluginDiskImageGraphNode;
  if (objc_msgSendSuper2(&v10, "validateWithDictionary:error:", v6, a4))
  {
    BOOL v7 = 0;
    if ([v6 validateAndPopObjectForKey:@"PluginName" className:objc_opt_class() isOptional:0 error:a4])
    {
      BOOL v7 = 0;
      if ([v6 validateAndPopObjectForKey:@"PluginParams" className:objc_opt_class() isOptional:0 error:a4])
      {
        if ([v6 count])
        {
          v8 = +[NSString stringWithFormat:@"Validation failed, input contains unexpected data."];
          BOOL v7 = +[DIError failWithPOSIXCode:22 verboseInfo:v8 error:a4];
        }
        else
        {
          BOOL v7 = 1;
        }
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (PluginDiskImageGraphNode)initWithPluginName:(id)a3 pluginParams:(id)a4 tag:(id)a5 UUID:(id)a6 parentNode:(id)a7 metadata:(id)a8 isCache:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PluginDiskImageGraphNode;
  v18 = [(DiskImageGraphNode *)&v23 initWithTag:a5 UUID:a6 parentNode:a7 metadata:a8 isCache:a9];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pluginName, a3);
    v20 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v17 copyItems:1];
    pluginParams = v19->_pluginParams;
    v19->_pluginParams = v20;
  }
  return v19;
}

- (PluginDiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (+[PluginDiskImageGraphNode validateWithDictionary:v10 error:a6])
  {
    v19.receiver = self;
    v19.super_class = (Class)PluginDiskImageGraphNode;
    v12 = [(DiskImageGraphNode *)&v19 initWithDictionary:v10 updateChangesToDict:v8 workDir:v11 error:a6];
    if (v12)
    {
      uint64_t v13 = [v10 objectForKeyedSubscript:@"PluginName"];
      pluginName = v12->_pluginName;
      v12->_pluginName = (NSString *)v13;

      uint64_t v15 = [v10 objectForKeyedSubscript:@"PluginParams"];
      pluginParams = v12->_pluginParams;
      v12->_pluginParams = (NSDictionary *)v15;
    }
    self = v12;
    id v17 = self;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)deleteImage
{
  return 1;
}

- (id)toDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)PluginDiskImageGraphNode;
  v3 = [(DiskImageGraphNode *)&v8 toDictionary];
  id v4 = [v3 mutableCopy];

  v5 = [(PluginDiskImageGraphNode *)self pluginName];
  [v4 setObject:v5 forKeyedSubscript:@"PluginName"];

  v6 = [(PluginDiskImageGraphNode *)self pluginParams];
  [v4 setObject:v6 forKeyedSubscript:@"PluginParams"];

  return v4;
}

- (id)URL
{
  v3 = [(PluginDiskImageGraphNode *)self pluginName];
  id v4 = [(PluginDiskImageGraphNode *)self pluginParams];
  id v5 = +[DIURL newDIURLWithPluginName:v3 params:v4];

  return v5;
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void)setPluginName:(id)a3
{
}

- (NSDictionary)pluginParams
{
  return self->_pluginParams;
}

- (void)setPluginParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginParams, 0);

  objc_storeStrong((id *)&self->_pluginName, 0);
}

@end