@interface _REInterfaceKey
- (BOOL)conforms:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProtocol;
- (Class)cls;
- (Protocol)protocol;
- (_REInterfaceKey)initWithClass:(Class)a3;
- (_REInterfaceKey)initWithProtocol:(id)a3;
- (_REInterfaceKey)superclassKey;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)enumerateAutomaticProperties:(id)a3;
- (void)enumerateConformedProperties:(id)a3;
- (void)enumerateExposedMethods:(id)a3;
- (void)enumerateExposedProperties:(id)a3;
- (void)setCls:(Class)a3;
- (void)setProtocol:(id)a3;
@end

@implementation _REInterfaceKey

- (_REInterfaceKey)initWithClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_REInterfaceKey;
  result = [(_REInterfaceKey *)&v5 init];
  if (result)
  {
    result->_c = a3;
    result->_isClass = 1;
  }
  return result;
}

- (_REInterfaceKey)initWithProtocol:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REInterfaceKey;
  v6 = [(_REInterfaceKey *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_p, a3);
    v7->_isClass = 0;
  }

  return v7;
}

- (Class)cls
{
  return self->_c;
}

- (Protocol)protocol
{
  return self->_p;
}

- (BOOL)isProtocol
{
  return !self->_isClass;
}

- (_REInterfaceKey)superclassKey
{
  if (!self->_isClass || (Class c = self->_c, c == (Class)objc_opt_class())) {
    v4 = 0;
  }
  else {
    v4 = [[_REInterfaceKey alloc] initWithClass:[(objc_class *)self->_c superclass]];
  }
  return v4;
}

- (BOOL)conforms:(id)a3
{
  if (self->_isClass) {
    return class_conformsToProtocol(self->_c, (Protocol *)a3);
  }
  else {
    return protocol_conformsToProtocol(self->_p, (Protocol *)a3);
  }
}

- (void)enumerateAutomaticProperties:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (self->_isClass)
    {
      unsigned int outCount = 0;
      id v5 = class_copyPropertyList(self->_c, &outCount);
      if (v5)
      {
        v6 = v5;
        if (outCount)
        {
          for (unint64_t i = 0; i < outCount; ++i)
          {
            Name = property_getName(v6[i]);
            if (Name)
            {
              objc_super v9 = [NSString stringWithUTF8String:Name];
              v4[2](v4, v9);
            }
          }
        }
        free(v6);
      }
    }
  }
}

- (void)enumerateConformedProperties:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (v4)
  {
    unsigned int outCount = 0;
    id v5 = self->_isClass ? class_copyProtocolList(self->_c, &outCount) : protocol_copyProtocolList(self->_p, &outCount);
    v6 = v5;
    if (v5)
    {
      if (outCount)
      {
        for (unint64_t i = 0; i < outCount; ((void (**)(id, Protocol *))v4)[2](v4, v6[i++]))
          ;
      }
      free(v6);
    }
  }
}

- (void)enumerateExposedProperties:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (!self->_isClass)
    {
      unsigned int outCount = 0;
      id v5 = protocol_copyPropertyList(self->_p, &outCount);
      if (v5)
      {
        v6 = v5;
        if (outCount)
        {
          for (unint64_t i = 0; i < outCount; ++i)
          {
            Name = property_getName(v6[i]);
            if (Name)
            {
              objc_super v9 = [NSString stringWithUTF8String:Name];
              v4[2](v4, v9);
            }
          }
        }
        free(v6);
      }
    }
  }
}

- (void)enumerateExposedMethods:(id)a3
{
  v4 = (void (**)(id, SEL))a3;
  if (v4 && !self->_isClass)
  {
    id v5 = [MEMORY[0x263EFF9C0] set];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43___REInterfaceKey_enumerateExposedMethods___block_invoke;
    v15[3] = &unk_2644BF588;
    id v6 = v5;
    id v16 = v6;
    [(_REInterfaceKey *)self enumerateExposedProperties:v15];
    unsigned int outCount = 0;
    v7 = protocol_copyMethodDescriptionList(self->_p, 1, 1, &outCount);
    if (v7)
    {
      v8 = v7;
      if (outCount)
      {
        unint64_t v9 = 0;
        p_name = &v7->name;
        do
        {
          SEL v11 = *p_name;
          if (*p_name)
          {
            v12 = NSStringFromSelector(*p_name);
            char v13 = [v6 containsObject:v12];

            if ((v13 & 1) == 0) {
              v4[2](v4, v11);
            }
          }
          ++v9;
          p_name += 2;
        }
        while (v9 < outCount);
      }
      free(v8);
    }
  }
}

- (unint64_t)hash
{
  if (self->_isClass)
  {
    Class c = self->_c;
    return [(objc_class *)c hash];
  }
  else
  {
    v4 = [MEMORY[0x263F08D40] valueWithPointer:self->_p];
    unint64_t v5 = [v4 hash];

    return v5;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REInterfaceKey *)a3;
  if (self == v4)
  {
    BOOL isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      id v6 = v5;
      if (self->_isClass == v5->_isClass)
      {
        if (self->_isClass) {
          BOOL isEqual = self->_c == v5->_c;
        }
        else {
          BOOL isEqual = protocol_isEqual(self->_p, v5->_p);
        }
      }
      else
      {
        BOOL isEqual = 0;
      }
    }
    else
    {
      BOOL isEqual = 0;
    }
  }

  return isEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL isClass = self->_isClass;
  unint64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  if (isClass)
  {
    Class c = self->_c;
    return (id)[v5 initWithClass:c];
  }
  else
  {
    p = self->_p;
    return (id)[v5 initWithProtocol:p];
  }
}

- (void)setCls:(Class)a3
{
}

- (void)setProtocol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_cls, 0);
  objc_storeStrong((id *)&self->_p, 0);
}

@end