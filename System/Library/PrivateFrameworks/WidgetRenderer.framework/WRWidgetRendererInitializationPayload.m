@interface WRWidgetRendererInitializationPayload
+ (BOOL)supportsSecureCoding;
- (NSData)systemEnvironment;
- (NSDictionary)configurations;
- (NSSet)extensions;
- (WRWidgetRendererInitializationPayload)initWithCoder:(id)a3;
- (WRWidgetRendererInitializationPayload)initWithExtensions:(id)a3 configurations:(id)a4 systemEnvironment:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WRWidgetRendererInitializationPayload

- (WRWidgetRendererInitializationPayload)initWithExtensions:(id)a3 configurations:(id)a4 systemEnvironment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WRWidgetRendererInitializationPayload;
  v11 = [(WRWidgetRendererInitializationPayload *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    extensions = v11->_extensions;
    v11->_extensions = (NSSet *)v12;

    uint64_t v14 = [v9 copy];
    configurations = v11->_configurations;
    v11->_configurations = (NSDictionary *)v14;

    uint64_t v16 = [v10 copy];
    systemEnvironment = v11->_systemEnvironment;
    v11->_systemEnvironment = (NSData *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  extensions = self->_extensions;
  id v5 = a3;
  [v5 encodeObject:extensions forKey:@"extensions"];
  [v5 encodeObject:self->_configurations forKey:@"configurations"];
  [v5 encodeObject:self->_systemEnvironment forKey:@"systemEnvironment"];
}

- (WRWidgetRendererInitializationPayload)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  id v9 = [v5 decodeObjectOfClasses:v8 forKey:@"extensions"];

  id v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  uint64_t v14 = [v5 decodeObjectOfClasses:v13 forKey:@"configurations"];

  v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"systemEnvironment"];

  uint64_t v16 = 0;
  if (v9 && v14 && v15)
  {
    v20.receiver = self;
    v20.super_class = (Class)WRWidgetRendererInitializationPayload;
    v17 = [(WRWidgetRendererInitializationPayload *)&v20 init];
    p_isa = (id *)&v17->super.isa;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_extensions, v9);
      objc_storeStrong(p_isa + 2, v14);
      objc_storeStrong(p_isa + 3, v15);
    }
    self = p_isa;
    uint64_t v16 = self;
  }

  return v16;
}

- (NSSet)extensions
{
  return self->_extensions;
}

- (NSDictionary)configurations
{
  return self->_configurations;
}

- (NSData)systemEnvironment
{
  return self->_systemEnvironment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemEnvironment, 0);
  objc_storeStrong((id *)&self->_configurations, 0);

  objc_storeStrong((id *)&self->_extensions, 0);
}

@end