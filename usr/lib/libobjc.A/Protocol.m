@interface Protocol
- (BOOL)conformsTo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (const)name;
- (objc_method_description)descriptionForClassMethod:(SEL)a3;
- (objc_method_description)descriptionForInstanceMethod:(SEL)a3;
- (unint64_t)hash;
@end

@implementation Protocol

- (unint64_t)hash
{
  return 23;
}

- (BOOL)isEqual:(id)a3
{
  v5 = look_up_class("Protocol");
  Class Class = object_getClass(a3);
  BOOL v7 = Class == 0;
  if (Class && Class != v5)
  {
    do
    {
      v8 = (objc_class *)*((void *)Class + 1);
      if (!v8) {
        return 0;
      }
      Class Class = (Class)*((void *)Class + 1);
      BOOL v7 = v8 == 0;
    }
    while (v5 != v8);
  }
  if (v7) {
    return 0;
  }

  return protocol_isEqual(self, (Protocol *)a3);
}

- (const)name
{
  if (self) {
    return (const char *)protocol_t::demangledName((char **)self);
  }
  else {
    return "nil";
  }
}

- (objc_method_description)descriptionForClassMethod:(SEL)a3
{
  Method = (objc_method *)protocol_getMethod((protocol_t *)self, (objc_selector *)a3, (const char *)1, 0, v3);

  return method_getDescription(Method);
}

- (objc_method_description)descriptionForInstanceMethod:(SEL)a3
{
  Method = (objc_method *)protocol_getMethod((protocol_t *)self, (objc_selector *)a3, (const char *)1, (char *)1, v3);

  return method_getDescription(Method);
}

- (BOOL)conformsTo:(id)a3
{
  return protocol_conformsToProtocol(self, (Protocol *)a3);
}

@end