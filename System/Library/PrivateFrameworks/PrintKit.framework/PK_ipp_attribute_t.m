@interface PK_ipp_attribute_t
+ (BOOL)supportsSecureCoding;
- (NSMutableArray)values;
- (NSString)name;
- (PK_ipp_attribute_t)initWithCoder:(id)a3;
- (PK_ipp_attribute_t)initWithName:(id)a3 group:(int)a4 value:(int)a5;
- (id)_copySettingGroup:(int)a3;
- (id)addNewEmptyValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)loggingDict;
- (int)group_tag;
- (int)value_tag;
- (unint64_t)num_values;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateValues:(id)a3;
- (void)setNSName:(id)a3;
- (void)setValueTag:(int)a3;
- (void)toss_last_value;
- (void)withNewEmptyValue:(id)a3;
@end

@implementation PK_ipp_attribute_t

- (PK_ipp_attribute_t)initWithName:(id)a3 group:(int)a4 value:(int)a5
{
  v8 = (NSString *)a3;
  v16.receiver = self;
  v16.super_class = (Class)PK_ipp_attribute_t;
  v9 = [(PK_ipp_attribute_t *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_group_tag = a4;
    v9->_value_tag = a5;
    if (v8)
    {
      uint64_t v11 = internString(v8);
      x_name = v10->x_name;
      v10->x_name = (NSString *)v11;
    }
    else
    {
      x_name = v9->x_name;
      v9->x_name = 0;
    }

    uint64_t v13 = objc_opt_new();
    values = v10->_values;
    v10->_values = (NSMutableArray *)v13;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:self->x_name group:self->_group_tag value:self->_value_tag];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_values;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        v10 = objc_msgSend(v4, "values", (void)v12);
        [v10 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PK_ipp_attribute_t)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PK_ipp_attribute_t;
  v5 = [(PK_ipp_attribute_t *)&v14 init];
  if (v5)
  {
    v5->_group_tag = [v4 decodeIntegerForKey:@"_group_tag"];
    v5->_value_tag = [v4 decodeIntegerForKey:@"_value_tag"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = internString(v6);
      x_name = v5->x_name;
      v5->x_name = (NSString *)v8;
    }
    else
    {
      x_name = v5->x_name;
      v5->x_name = 0;
    }

    v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_values"];
    uint64_t v11 = [v10 mutableCopy];
    values = v5->_values;
    v5->_values = (NSMutableArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_group_tag forKey:@"_group_tag"];
  [v5 encodeInteger:self->_value_tag forKey:@"_value_tag"];
  x_name = self->x_name;
  if (x_name) {
    [v5 encodeObject:x_name forKey:@"_name"];
  }
  [v5 encodeObject:self->_values forKey:@"_values"];
}

- (unint64_t)num_values
{
  return [(NSMutableArray *)self->_values count];
}

- (NSString)name
{
  return self->x_name;
}

- (id)loggingDict
{
  v19[4] = *MEMORY[0x263EF8340];
  if (self->_value_tag)
  {
    v3 = objc_opt_new();
    values = self->_values;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __33__PK_ipp_attribute_t_loggingDict__block_invoke;
    v16[3] = &unk_2649EBFB8;
    v16[4] = self;
    id v5 = v3;
    id v17 = v5;
    [(NSMutableArray *)values enumerateObjectsUsingBlock:v16];
    v19[0] = self->x_name;
    v18[0] = @"name";
    v18[1] = @"tagg";
    uint64_t v6 = NSString;
    uint64_t group_tag = self->_group_tag;
    if ((int)group_tag > 74) {
      uint64_t v8 = "UNKNOWN";
    }
    else {
      uint64_t v8 = (const char *)[(__CFString *)ipp_tag_names[group_tag] UTF8String];
    }
    v10 = [v6 stringWithUTF8String:v8];
    v19[1] = v10;
    v18[2] = @"tagv";
    uint64_t v11 = NSString;
    uint64_t value_tag = self->_value_tag;
    if ((int)value_tag > 74) {
      long long v13 = "UNKNOWN";
    }
    else {
      long long v13 = (const char *)[(__CFString *)ipp_tag_names[value_tag] UTF8String];
    }
    objc_super v14 = [v11 stringWithUTF8String:v13];
    v18[3] = @"vals";
    v19[2] = v14;
    v19[3] = v5;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  }
  else
  {
    uint64_t v9 = &unk_26E263B80;
  }

  return v9;
}

- (id)debugDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PK_ipp_attribute_t;
  id v4 = [(PK_ipp_attribute_t *)&v8 description];
  id v5 = [(PK_ipp_attribute_t *)self loggingDict];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)enumerateValues:(id)a3
{
  id v4 = a3;
  values = self->_values;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__PK_ipp_attribute_t_enumerateValues___block_invoke;
  v7[3] = &unk_2649EBFE0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)values enumerateObjectsUsingBlock:v7];
}

- (id)_copySettingGroup:(int)a3
{
  id result = [(PK_ipp_attribute_t *)self copyWithZone:0];
  *((_DWORD *)result + 6) = a3;
  return result;
}

- (NSMutableArray)values
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (int)group_tag
{
  return self->_group_tag;
}

- (int)value_tag
{
  return self->_value_tag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->x_name, 0);
}

- (void)withNewEmptyValue:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  id v4 = objc_opt_new();
  v5[2](v5, v4);
  [(NSMutableArray *)self->_values addObject:v4];
}

- (id)addNewEmptyValue
{
  v3 = objc_opt_new();
  [(NSMutableArray *)self->_values addObject:v3];

  return v3;
}

- (void)toss_last_value
{
}

- (void)setNSName:(id)a3
{
  id v4 = (NSString *)a3;
  uint64_t v7 = v4;
  if (v4)
  {
    internString(v4);
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    x_name = self->x_name;
    self->x_name = v5;
  }
  else
  {
    x_name = self->x_name;
    self->x_name = 0;
  }
}

- (void)setValueTag:(int)a3
{
  self->_uint64_t value_tag = a3;
}

@end