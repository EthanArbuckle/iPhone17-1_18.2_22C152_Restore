@interface WFRecordProperty
- (BOOL)isDynamic;
- (BOOL)isNonAtomic;
- (BOOL)isReadOnly;
- (NSString)getter;
- (NSString)name;
- (NSString)setter;
- (WFRecordProperty)initWithName:(id)a3 property:(objc_property *)a4;
@end

@implementation WFRecordProperty

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setter, 0);
  objc_storeStrong((id *)&self->_getter, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)setter
{
  return self->_setter;
}

- (NSString)getter
{
  return self->_getter;
}

- (BOOL)isDynamic
{
  return self->_dynamic;
}

- (BOOL)isNonAtomic
{
  return self->_nonAtomic;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (NSString)name
{
  return self->_name;
}

- (WFRecordProperty)initWithName:(id)a3 property:(objc_property *)a4
{
  id v7 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WFRecordProperty;
  v8 = [(WFRecordProperty *)&v30 init];
  v9 = v8;
  if (v8)
  {
    p_name = (id *)&v8->_name;
    objc_storeStrong((id *)&v8->_name, a3);
    unsigned int outCount = 0;
    v11 = property_copyAttributeList(a4, &outCount);
    v12 = v11;
    if (outCount)
    {
      unint64_t v13 = 0;
      p_value = &v11->value;
      do
      {
        int v15 = **(p_value - 1);
        if (v15 <= 77)
        {
          if (v15 == 68)
          {
            v9->_dynamic = 1;
            goto LABEL_16;
          }
          if (v15 == 71)
          {
            uint64_t v16 = [NSString stringWithUTF8String:*p_value];
            getter = v9->_getter;
            v9->_getter = (NSString *)v16;
LABEL_14:
          }
        }
        else
        {
          if (v15 != 78)
          {
            if (v15 != 83)
            {
              if (v15 == 82) {
                v9->_readOnly = 1;
              }
              goto LABEL_16;
            }
            uint64_t v18 = [NSString stringWithUTF8String:*p_value];
            getter = v9->_setter;
            v9->_setter = (NSString *)v18;
            goto LABEL_14;
          }
          v9->_nonAtomic = 1;
        }
LABEL_16:
        ++v13;
        p_value += 2;
      }
      while (v13 < outCount);
    }
    free(v12);
    if (!v9->_getter) {
      objc_storeStrong((id *)&v9->_getter, *p_name);
    }
    if (!v9->_setter && !v9->_readOnly)
    {
      unsigned int v19 = [*p_name characterAtIndex:0] - 97;
      v20 = [*p_name substringToIndex:1];
      v21 = v20;
      if (v19 <= 0x19)
      {
        uint64_t v22 = [v20 uppercaseString];

        v21 = (void *)v22;
      }
      v23 = NSString;
      v24 = [(NSString *)v9->_name substringFromIndex:1];
      uint64_t v25 = [v23 stringWithFormat:@"set%@%@:", v21, v24];
      setter = v9->_setter;
      v9->_setter = (NSString *)v25;
    }
    v27 = v9;
  }

  return v9;
}

@end