@interface SKVolumeDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorWithName:(id)a3 filesystem:(id)a4;
+ (id)descriptorWithName:(id)a3 password:(id)a4 filesystem:(id)a5;
- (BOOL)validateForErase;
- (NSString)name;
- (NSString)password;
- (SKFilesystem)filesystem;
- (SKVolumeDescriptor)initWithCoder:(id)a3;
- (SKVolumeDescriptor)initWithName:(id)a3 password:(id)a4 filesystem:(id)a5;
- (id)description;
- (id)redactedDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setFilesystem:(id)a3;
- (void)setName:(id)a3;
- (void)setPassword:(id)a3;
@end

@implementation SKVolumeDescriptor

- (SKVolumeDescriptor)initWithName:(id)a3 password:(id)a4 filesystem:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SKVolumeDescriptor;
  v12 = [(SKVolumeDescriptor *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_filesystem, a5);
    p_name = (void **)&v13->_name;
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v13->_password, a4);
    if (!v13->_name)
    {
      v15 = [v11 majorType];
      char v16 = [v15 isEqualToString:@"msdos"];

      v17 = *p_name;
      if (v16)
      {
        v18 = @"NO NAME";
LABEL_7:
        *p_name = v18;

        goto LABEL_8;
      }
      if (!v17)
      {
        v18 = @"Untitled";
        goto LABEL_7;
      }
    }
  }
LABEL_8:

  return v13;
}

+ (id)descriptorWithName:(id)a3 filesystem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v6 password:0 filesystem:v5];

  return v7;
}

+ (id)descriptorWithName:(id)a3 password:(id)a4 filesystem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v9 password:v8 filesystem:v7];

  return v10;
}

- (BOOL)validateForErase
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(SKVolumeDescriptor *)self name];
  uint64_t v4 = [v3 length];

  if (!v4)
  {
    v14 = SKGetOSLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    int v19 = 136315394;
    objc_super v20 = "-[SKVolumeDescriptor validateForErase]";
    __int16 v21 = 2112;
    v22 = self;
    v15 = "%s: Empty name on descriptor %@";
LABEL_17:
    _os_log_impl(&dword_23F40C000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v19, 0x16u);
    goto LABEL_18;
  }
  uint64_t v5 = [(SKVolumeDescriptor *)self password];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(SKVolumeDescriptor *)self password];
    uint64_t v8 = [v7 length];

    if (!v8)
    {
      v14 = SKGetOSLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      int v19 = 136315394;
      objc_super v20 = "-[SKVolumeDescriptor validateForErase]";
      __int16 v21 = 2112;
      v22 = self;
      v15 = "%s: Empty password on descriptor %@";
      goto LABEL_17;
    }
  }
  uint64_t v9 = [(SKVolumeDescriptor *)self password];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [(SKVolumeDescriptor *)self filesystem];
    char v12 = [v11 isEncrypted];

    if ((v12 & 1) == 0)
    {
      v14 = SKGetOSLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      int v19 = 136315394;
      objc_super v20 = "-[SKVolumeDescriptor validateForErase]";
      __int16 v21 = 2112;
      v22 = self;
      v15 = "%s: Non encrypted filesystem provided with password %@";
      goto LABEL_17;
    }
  }
  v13 = [(SKVolumeDescriptor *)self password];
  if (!v13)
  {
    char v16 = [(SKVolumeDescriptor *)self filesystem];
    int v17 = [v16 isEncrypted];

    if (!v17) {
      return 1;
    }
    v14 = SKGetOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      objc_super v20 = "-[SKVolumeDescriptor validateForErase]";
      __int16 v21 = 2112;
      v22 = self;
      v15 = "%s: Encrypted filesystem provided without password %@";
      goto LABEL_17;
    }
LABEL_18:

    return 0;
  }

  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKVolumeDescriptor *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = [(SKVolumeDescriptor *)self filesystem];
  id v7 = [v6 dictionaryRepresentation];
  [v4 encodeObject:v7 forKey:@"fs"];

  id v8 = [(SKVolumeDescriptor *)self password];
  [v4 encodeObject:v8 forKey:@"password"];
}

- (SKVolumeDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SKVolumeDescriptor;
  uint64_t v5 = [(SKVolumeDescriptor *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    char v16 = objc_msgSend(v23, "setWithObjects:", v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    int v17 = [v4 decodeObjectOfClasses:v16 forKey:@"fs"];

    v18 = [[SKFilesystem alloc] initWithDictionaryRepresentation:v17];
    filesystem = v5->_filesystem;
    v5->_filesystem = v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"password"];
    password = v5->_password;
    v5->_password = (NSString *)v20;
  }
  return v5;
}

- (id)redactedDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(SKVolumeDescriptor *)self filesystem];
  id v7 = [v3 stringWithFormat:@"<%@: { filesystem: \"%@\"}>", v5, v6];

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(SKVolumeDescriptor *)self name];
  id v7 = [(SKVolumeDescriptor *)self filesystem];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: { name: \"%@\", filesystem: \"%@\"}>", v5, v6, v7];

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (SKFilesystem)filesystem
{
  return self->_filesystem;
}

- (void)setFilesystem:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_filesystem, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end