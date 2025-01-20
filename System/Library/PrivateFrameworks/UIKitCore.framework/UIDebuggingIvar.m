@interface UIDebuggingIvar
+ (id)ivarWithObjcIvar:(objc_ivar *)a3 forObject:(id)a4;
- (BOOL)isObject;
- (NSObject)object;
- (NSString)name;
- (NSString)typeDescription;
- (NSString)valueDescription;
- (const)typeEncoding;
- (id)value;
- (objc_ivar)objcIvar;
- (void)dealloc;
- (void)setName:(id)a3;
- (void)setObjcIvar:(objc_ivar *)a3;
- (void)setObject:(id)a3;
- (void)setTypeDescription:(id)a3;
- (void)setTypeEncoding:(const char *)a3;
- (void)setValue:(id)a3;
@end

@implementation UIDebuggingIvar

+ (id)ivarWithObjcIvar:(objc_ivar *)a3 forObject:(id)a4
{
  id v6 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v7 = [NSString stringWithCString:ivar_getName(a3) encoding:4];
  TypeEncoding = ivar_getTypeEncoding(a3);
  v9 = _UIDebugObjectTypeDescription(TypeEncoding);
  id Ivar = object_getIvar(a4, a3);
  [v6 setObject:a4];
  [v6 setObjcIvar:a3];
  [v6 setName:v7];
  [v6 setTypeEncoding:ivar_getTypeEncoding(a3)];
  [v6 setTypeDescription:v9];
  [v6 setValue:Ivar];
  return v6;
}

- (NSString)valueDescription
{
  v3 = [(UIDebuggingIvar *)self object];
  v4 = (__CFString *)((char *)v3 + ivar_getOffset([(UIDebuggingIvar *)self objcIvar]));
  return (NSString *)[NSString stringWithFormat:@"%@", _UIDebugIvarValue(v4, (char *)-[UIDebuggingIvar typeEncoding](self, "typeEncoding"), 0)];
}

- (BOOL)isObject
{
  char v3 = objc_msgSend((id)objc_msgSend(NSString, "stringWithCString:encoding:", -[UIDebuggingIvar typeEncoding](self, "typeEncoding"), 4), "containsString:", @"@");
  if ([(UIDebuggingIvar *)self value]) {
    return v3;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  self->_object = 0;

  self->_name = 0;
  self->_typeDescription = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIDebuggingIvar;
  [(UIDebuggingIvar *)&v3 dealloc];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)typeDescription
{
  return self->_typeDescription;
}

- (void)setTypeDescription:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  self->_value = a3;
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  self->_object = a3;
}

- (objc_ivar)objcIvar
{
  return self->_objcIvar;
}

- (void)setObjcIvar:(objc_ivar *)a3
{
  self->_objcid Ivar = a3;
}

- (const)typeEncoding
{
  return self->_typeEncoding;
}

- (void)setTypeEncoding:(const char *)a3
{
  self->_typeEncoding = a3;
}

@end