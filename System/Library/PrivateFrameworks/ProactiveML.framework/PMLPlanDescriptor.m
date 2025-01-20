@interface PMLPlanDescriptor
+ (BOOL)isValidPlanId:(id)a3;
+ (id)descriptorFromPlanId:(id)a3;
+ (id)planIdFromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)locale;
- (NSString)name;
- (NSString)version;
- (PMLPlanDescriptor)initWithName:(id)a3 version:(id)a4 locale:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation PMLPlanDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    name = self->_name;
    v6 = [v4 name];
    if ([(NSString *)name isEqual:v6])
    {
      version = self->_version;
      v8 = [v4 version];
      if ([(NSString *)version isEqual:v8])
      {
        locale = self->_locale;
        v10 = [v4 locale];
        char v11 = [(NSString *)locale isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_version hash] ^ v3;
  return v4 ^ [(NSString *)self->_locale hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [PMLPlanDescriptor alloc];
  v5 = [(PMLPlanDescriptor *)self name];
  v6 = [(PMLPlanDescriptor *)self version];
  v7 = [(PMLPlanDescriptor *)self locale];
  v8 = [(PMLPlanDescriptor *)v4 initWithName:v5 version:v6 locale:v7];

  return v8;
}

- (PMLPlanDescriptor)initWithName:(id)a3 version:(id)a4 locale:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PMLPlanDescriptor.m", 17, @"Invalid parameter not satisfying: %@", @"version" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PMLPlanDescriptor.m", 16, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PMLPlanDescriptor.m", 18, @"Invalid parameter not satisfying: %@", @"locale" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)PMLPlanDescriptor;
  v13 = [(PMLPlanDescriptor *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v14->_version, a4);
    objc_storeStrong((id *)&v14->_locale, a5);
  }

  return v14;
}

+ (id)planIdFromString:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (id)descriptorFromPlanId:(id)a3
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x223C7E5C0]();
  v7 = [v5 componentsSeparatedByString:@"-"];
  if ([v7 count] != 3)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PMLPlanDescriptor.m", 39, @"Invalid planId. Must be <name>-<version>-<locale> but got %@", v5 object file lineNumber description];
  }
  v8 = [PMLPlanDescriptor alloc];
  v9 = [v7 objectAtIndexedSubscript:0];
  id v10 = [v7 objectAtIndexedSubscript:1];
  id v11 = [v7 objectAtIndexedSubscript:2];
  id v12 = [(PMLPlanDescriptor *)v8 initWithName:v9 version:v10 locale:v11];

  return v12;
}

+ (BOOL)isValidPlanId:(id)a3
{
  id v3 = a3;
  NSUInteger v4 = (void *)MEMORY[0x223C7E5C0]();
  id v5 = [v3 componentsSeparatedByString:@"-"];
  BOOL v6 = [v5 count] == 3;

  return v6;
}

@end