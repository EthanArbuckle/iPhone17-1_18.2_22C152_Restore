@interface BRCConfigValue
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (BRCConfigValue)initWithObject:(id)a3;
- (NSArray)arrayValue;
- (NSDictionary)dictionaryValue;
- (NSNumber)numberValue;
- (NSString)stringValue;
- (double)doubleValue;
- (float)floatValue;
- (id)debugDescription;
- (id)description;
- (id)object;
- (int64_t)integerValue;
- (int64_t)longLongValue;
- (unint64_t)unsignedIntegerValue;
- (unint64_t)unsignedLongLongValue;
@end

@implementation BRCConfigValue

- (BRCConfigValue)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCConfigValue;
  v5 = [(BRCConfigValue *)&v8 init];
  id object = v5->_object;
  v5->_id object = v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BRCConfigValue *)a3;
  if (self == v4)
  {
    unsigned __int8 v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(BRCConfigValue *)v5 object];
      if (!v6) {
        goto LABEL_9;
      }
      v7 = (void *)v6;
      objc_super v8 = [(BRCConfigValue *)self object];

      if (!v8) {
        goto LABEL_9;
      }
      v9 = [(BRCConfigValue *)v5 object];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        v11 = [(BRCConfigValue *)v5 object];
        v12 = [(BRCConfigValue *)self object];
        unsigned __int8 v13 = [v11 isEqual:v12];
      }
      else
      {
LABEL_9:
        unsigned __int8 v13 = 0;
      }
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  v2 = [(BRCConfigValue *)self object];
  v3 = [v2 description];

  return v3;
}

- (id)debugDescription
{
  v2 = [(BRCConfigValue *)self object];
  v3 = [v2 debugDescription];

  return v3;
}

- (double)doubleValue
{
  v2 = [(BRCConfigValue *)self numberValue];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (float)floatValue
{
  v2 = [(BRCConfigValue *)self numberValue];
  v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    float v5 = v4;
  }
  else
  {
    float v5 = 0.0;
  }

  return v5;
}

- (int64_t)longLongValue
{
  v2 = [(BRCConfigValue *)self numberValue];
  v3 = v2;
  if (v2) {
    id v4 = [v2 longLongValue];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (unint64_t)unsignedLongLongValue
{
  v2 = [(BRCConfigValue *)self numberValue];
  v3 = v2;
  if (v2) {
    id v4 = [v2 unsignedLongLongValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (int64_t)integerValue
{
  v2 = [(BRCConfigValue *)self numberValue];
  v3 = v2;
  if (v2) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (BOOL)BOOLValue
{
  v2 = [(BRCConfigValue *)self numberValue];
  v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unint64_t)unsignedIntegerValue
{
  v2 = [(BRCConfigValue *)self numberValue];
  v3 = v2;
  if (v2) {
    id v4 = [v2 unsignedIntegerValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (NSString)stringValue
{
  v3 = [(BRCConfigValue *)self object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  float v5 = [(BRCConfigValue *)self object];
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass();

    if (v6)
    {
      v7 = [(BRCConfigValue *)self object];
      float v5 = [v7 stringValue];
    }
    else
    {
      float v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSNumber)numberValue
{
  v3 = [(BRCConfigValue *)self object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    float v5 = [(BRCConfigValue *)self object];
    char v6 = +[NSDecimalNumber decimalNumberWithString:v5];
  }
  else
  {
    v7 = [(BRCConfigValue *)self object];
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if (v8)
    {
      char v6 = [(BRCConfigValue *)self object];
    }
    else
    {
      char v6 = 0;
    }
  }

  return (NSNumber *)v6;
}

- (NSArray)arrayValue
{
  objc_opt_class();
  v3 = [(BRCConfigValue *)self object];
  id v4 = BUDynamicCast();

  return (NSArray *)v4;
}

- (NSDictionary)dictionaryValue
{
  objc_opt_class();
  v3 = [(BRCConfigValue *)self object];
  id v4 = BUDynamicCast();

  return (NSDictionary *)v4;
}

- (id)object
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end