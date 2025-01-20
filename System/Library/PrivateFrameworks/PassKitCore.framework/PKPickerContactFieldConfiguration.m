@interface PKPickerContactFieldConfiguration
+ (BOOL)supportsSecureCoding;
- (NSArray)pickerItems;
- (PKPickerContactFieldConfiguration)initWithCoder:(id)a3;
- (PKPickerContactFieldConfiguration)initWithDictionary:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPickerContactFieldConfiguration

- (PKPickerContactFieldConfiguration)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPickerContactFieldConfiguration;
  v5 = [(PKContactFieldConfiguration *)&v23 initWithType:2];
  if (v5)
  {
    v6 = [v4 PKArrayForKey:@"items"];
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
          v14 = [PKContactPickerItem alloc];
          v15 = -[PKContactPickerItem initWithDictionary:](v14, "initWithDictionary:", v13, (void)v19);
          if (v15) {
            [v7 addObject:v15];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    uint64_t v16 = [v7 copy];
    pickerItems = v5->_pickerItems;
    v5->_pickerItems = (NSArray *)v16;
  }
  return v5;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"%@: '%@'; ", @"items", self->_pickerItems];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPickerContactFieldConfiguration;
  id v4 = a3;
  [(PKContactFieldConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_pickerItems, @"items", v5.receiver, v5.super_class);
}

- (PKPickerContactFieldConfiguration)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPickerContactFieldConfiguration;
  objc_super v5 = [(PKContactFieldConfiguration *)&v12 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    id v8 = (void *)[v6 initWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"items"];
    pickerItems = v5->_pickerItems;
    v5->_pickerItems = (NSArray *)v9;
  }
  return v5;
}

- (NSArray)pickerItems
{
  return self->_pickerItems;
}

- (void).cxx_destruct
{
}

@end