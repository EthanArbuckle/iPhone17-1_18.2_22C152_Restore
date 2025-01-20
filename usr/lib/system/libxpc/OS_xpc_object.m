@interface OS_xpc_object
- (NSString)debugDescription;
- (NSString)description;
- (OS_xpc_object)init;
- (void)dealloc;
@end

@implementation OS_xpc_object

- (OS_xpc_object)init
{
  v2 = _xpc_asprintf("Calling -init", a2);
  _xpc_api_misuse(v2);
}

- (void)dealloc
{
  _xpc_dispose((unint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OBJC_CLASS___OS_xpc_object;
  [(OS_xpc_object *)&v3 dealloc];
}

- (NSString)description
{
  result = (NSString *)objc_lookUpClass("NSString");
  if (result)
  {
    v4 = result;
    v5 = xpc_copy_description(self);
    uint64_t v6 = [(NSString *)v4 stringWithUTF8String:"<%s: %s>"];
    v7 = (objc_class *)objc_opt_class();
    v8 = -[NSString stringWithFormat:](v4, "stringWithFormat:", v6, class_getName(v7), v5);
    free(v5);
    return v8;
  }
  return result;
}

- (NSString)debugDescription
{
  uint64_t v9 = *MEMORY[0x263EF8C08];
  Class v3 = objc_lookUpClass("NSString");
  if (v3)
  {
    bzero(__str, 0x1000uLL);
    off_26C228140((unint64_t)self, __str, 0x1000uLL);
    v4 = xpc_copy_description(self);
    uint64_t v5 = [(objc_class *)v3 stringWithUTF8String:"<%s: %s %s>"];
    uint64_t v6 = (objc_class *)objc_opt_class();
    Class v3 = (Class)-[objc_class stringWithFormat:](v3, "stringWithFormat:", v5, class_getName(v6), __str, v4);
    free(v4);
  }
  return (NSString *)v3;
}

@end