@interface NDODeviceSection
+ (BOOL)supportsSecureCoding;
- (NDODeviceSection)initWithCoder:(id)a3;
- (NDODeviceSection)initWithLabel:(id)a3 identifier:(id)a4;
- (NSMutableArray)privateDeviceList;
- (NSString)identifier;
- (NSString)label;
- (id)description;
- (id)deviceForSN:(id)a3;
- (void)addDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPrivateDeviceList:(id)a3;
@end

@implementation NDODeviceSection

- (NDODeviceSection)initWithLabel:(id)a3 identifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NDODeviceSection;
  id v5 = a4;
  id v6 = a3;
  v7 = [(NDODeviceSection *)&v10 init];
  -[NDODeviceSection setLabel:](v7, "setLabel:", v6, v10.receiver, v10.super_class);

  [(NDODeviceSection *)v7 setIdentifier:v5];
  v8 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  [(NDODeviceSection *)v7 setPrivateDeviceList:v8];

  return v7;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = NSString;
  v4 = [(NDODeviceSection *)self label];
  id v5 = [(NDODeviceSection *)self identifier];
  id v6 = [v3 stringWithFormat:@"%@ (%@):\n", v4, v5];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = [(NDODeviceSection *)self deviceList];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      v12 = v6;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = NSString;
        v14 = [*(id *)(*((void *)&v17 + 1) + 8 * v11) description];
        v15 = [v13 stringWithFormat:@"%@\n", v14];
        id v6 = [v12 stringByAppendingString:v15];

        ++v11;
        v12 = v6;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)addDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(NDODeviceSection *)self privateDeviceList];
  [v5 addObject:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NDODeviceSection *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(NDODeviceSection *)self label];
  [v4 encodeObject:v6 forKey:@"label"];

  v7 = (void *)MEMORY[0x263F08910];
  id v9 = [(NDODeviceSection *)self privateDeviceList];
  uint64_t v8 = [v7 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
  [v4 encodeObject:v8 forKey:@"deviceList"];
}

- (NDODeviceSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NDODeviceSection;
  id v5 = [(NDODeviceSection *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    [(NDODeviceSection *)v5 setLabel:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(NDODeviceSection *)v5 setIdentifier:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceList"];
    id v9 = [MEMORY[0x263F08928] unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v8 error:0];
    uint64_t v10 = (void *)[v9 mutableCopy];
    [(NDODeviceSection *)v5 setPrivateDeviceList:v10];
  }
  return v5;
}

- (id)deviceForSN:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NDODeviceSection *)self privateDeviceList];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 serialNumber];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLabel:(id)a3
{
}

- (NSMutableArray)privateDeviceList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrivateDeviceList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDeviceList, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end