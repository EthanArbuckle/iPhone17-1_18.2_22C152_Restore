@interface VCSPropertyValue
- (NSString)description;
- (VCSPropertyValue)initWithValue:(id)a3 type:(unint64_t)a4;
- (id)dictify;
- (id)value;
- (id)valueDescription;
- (unint64_t)valueType;
- (void)addParameter:(id)a3 withValue:(id)a4;
@end

@implementation VCSPropertyValue

- (VCSPropertyValue)initWithValue:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCSPropertyValue;
  v8 = [(VCSPropertyValue *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_valueType = a4;
    objc_storeStrong(&v8->_value, a3);
    uint64_t v10 = objc_opt_new();
    parameters = v9->_parameters;
    v9->_parameters = (NSMutableDictionary *)v10;
  }
  return v9;
}

- (void)addParameter:(id)a3 withValue:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    parameters = self->_parameters;
    if (v6) {
      [(NSMutableDictionary *)parameters setObject:v6 forKeyedSubscript:v8];
    }
    else {
      [(NSMutableDictionary *)parameters removeObjectForKey:v8];
    }
  }
}

- (id)dictify
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  unint64_t valueType = self->_valueType;
  if (valueType >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid(%lu)", self->_valueType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E6C25CE8[valueType];
  }
  [v3 setObject:v5 forKeyedSubscript:@"valueType"];

  id v6 = [(VCSPropertyValue *)self valueDescription];
  [v3 setObject:v6 forKeyedSubscript:@"value"];

  if ([(NSMutableDictionary *)self->_parameters count])
  {
    id v7 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = [(NSMutableDictionary *)self->_parameters allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v14 = [(NSMutableDictionary *)self->_parameters objectForKeyedSubscript:v13];
          v15 = [v14 dictify];
          [v7 setObject:v15 forKeyedSubscript:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"parameters"];
  }
  return v3;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(VCSPropertyValue *)self dictify];
  id v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (id)valueDescription
{
  switch(self->_valueType)
  {
    case 0uLL:
      stringForEntityStatus([self->_value unsignedIntegerValue]);
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 1uLL:
      stringForEntityTransparency([self->_value unsignedIntegerValue]);
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 2uLL:
      stringForEntityClassification([self->_value unsignedIntegerValue]);
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 3uLL:
      id v2 = self->_value;
      goto LABEL_3;
    case 5uLL:
      id v5 = self->_value;
      v3 = (void *)[@"P" mutableCopy];
      if ([v5 day] != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v3, "appendFormat:", @"%ldD", objc_msgSend(v5, "day"));
      }
      [v3 appendString:@"T"];
      if ([v5 hour] != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v3, "appendFormat:", @"%ldH", objc_msgSend(v5, "hour"));
      }
      if ([v5 minute] != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v3, "appendFormat:", @"%ldM", objc_msgSend(v5, "minute"));
      }
      if ([v5 second] != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v3, "appendFormat:", @"%ldS", objc_msgSend(v5, "second"));
      }

      goto LABEL_4;
    case 9uLL:
      id v2 = [self->_value dictify];
      goto LABEL_3;
    default:
      id v2 = [self->_value description];
LABEL_3:
      v3 = v2;
LABEL_4:
      return v3;
  }
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end