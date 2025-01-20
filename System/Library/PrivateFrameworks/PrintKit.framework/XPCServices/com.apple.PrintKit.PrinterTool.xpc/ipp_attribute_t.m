@interface ipp_attribute_t
+ (BOOL)supportsSecureCoding;
- (NSMutableArray)values;
- (NSString)name;
- (id)_copySettingGroup:(int)a3;
- (id)addNewEmptyValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)loggingDict;
- (int)group_tag;
- (int)value_tag;
- (ipp_attribute_t)initWithCoder:(id)a3;
- (ipp_attribute_t)initWithName:(id)a3 group:(int)a4 value:(int)a5;
- (unint64_t)num_values;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateValues:(id)a3;
- (void)setNSName:(id)a3;
- (void)setValueTag:(int)a3;
- (void)toss_last_value;
- (void)withNewEmptyValue:(id)a3;
@end

@implementation ipp_attribute_t

- (ipp_attribute_t)initWithName:(id)a3 group:(int)a4 value:(int)a5
{
  v8 = (NSString *)a3;
  v16.receiver = self;
  v16.super_class = (Class)ipp_attribute_t;
  v9 = [(ipp_attribute_t *)&v16 init];
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
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithName:self->x_name group:self->_group_tag value:self->_value_tag];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_values;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        v10 = objc_msgSend(v4, "values", (void)v12);
        [v10 addObject:v9];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ipp_attribute_t)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ipp_attribute_t;
  v5 = [(ipp_attribute_t *)&v14 init];
  if (v5)
  {
    v5->_group_tag = [v4 decodeIntegerForKey:@"_group_tag"];
    v5->_value_tag = [v4 decodeIntegerForKey:@"_value_tag"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
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
    uint64_t v11 = (NSMutableArray *)[v10 mutableCopy];
    values = v5->_values;
    v5->_values = v11;
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
  return (unint64_t)[(NSMutableArray *)self->_values count];
}

- (NSString)name
{
  return self->x_name;
}

- (id)loggingDict
{
  if (self->_value_tag)
  {
    v3 = objc_opt_new();
    values = self->_values;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003E0DC;
    v14[3] = &unk_1000A2C38;
    v14[4] = self;
    id v5 = v3;
    id v15 = v5;
    [(NSMutableArray *)values enumerateObjectsUsingBlock:v14];
    v17[0] = self->x_name;
    v16[0] = @"name";
    v16[1] = @"tagg";
    uint64_t group_tag = self->_group_tag;
    if ((int)group_tag > 74) {
      uint64_t v7 = "UNKNOWN";
    }
    else {
      uint64_t v7 = (const char *)[(__CFString *)off_1000A2F98[group_tag] UTF8String];
    }
    uint64_t v9 = +[NSString stringWithUTF8String:v7];
    v17[1] = v9;
    v16[2] = @"tagv";
    uint64_t value_tag = self->_value_tag;
    if ((int)value_tag > 74) {
      uint64_t v11 = "UNKNOWN";
    }
    else {
      uint64_t v11 = (const char *)[(__CFString *)off_1000A2F98[value_tag] UTF8String];
    }
    long long v12 = +[NSString stringWithUTF8String:v11];
    v16[3] = @"vals";
    v17[2] = v12;
    v17[3] = v5;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
  }
  else
  {
    uint64_t v8 = &off_1000B90E0;
  }

  return v8;
}

- (id)debugDescription
{
  v7.receiver = self;
  v7.super_class = (Class)ipp_attribute_t;
  v3 = [(ipp_attribute_t *)&v7 description];
  id v4 = [(ipp_attribute_t *)self loggingDict];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (void)enumerateValues:(id)a3
{
  id v4 = a3;
  values = self->_values;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003E330;
  v7[3] = &unk_1000A2C60;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)values enumerateObjectsUsingBlock:v7];
}

- (id)_copySettingGroup:(int)a3
{
  id result = [(ipp_attribute_t *)self copyWithZone:0];
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
  objc_super v7 = v4;
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