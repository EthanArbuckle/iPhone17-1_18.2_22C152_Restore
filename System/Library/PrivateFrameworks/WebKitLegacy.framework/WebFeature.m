@interface WebFeature
- (BOOL)defaultValue;
- (BOOL)isHidden;
- (NSString)details;
- (NSString)key;
- (NSString)name;
- (NSString)preferenceKey;
- (WebFeature)initWithKey:(id)a3 preferenceKey:(id)a4 name:(id)a5 status:(unint64_t)a6 category:(unint64_t)a7 details:(id)a8 defaultValue:(BOOL)a9 hidden:(BOOL)a10;
- (id)description;
- (unint64_t)category;
- (unint64_t)status;
- (void)dealloc;
@end

@implementation WebFeature

- (WebFeature)initWithKey:(id)a3 preferenceKey:(id)a4 name:(id)a5 status:(unint64_t)a6 category:(unint64_t)a7 details:(id)a8 defaultValue:(BOOL)a9 hidden:(BOOL)a10
{
  v18.receiver = self;
  v18.super_class = (Class)WebFeature;
  v16 = [(WebFeature *)&v18 init];
  if (v16)
  {
    v16->_key = (NSString *)[a3 copy];
    v16->_preferenceKey = (NSString *)[a4 copy];
    v16->_name = (NSString *)[a5 copy];
    v16->_status = a6;
    v16->_category = a7;
    v16->_details = (NSString *)[a8 copy];
    v16->_defaultValue = a9;
    v16->_hidden = a10;
  }
  return v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebFeature;
  [(WebFeature *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WebFeature *)self name];
  v7 = [(WebFeature *)self key];
  BOOL v8 = [(WebFeature *)self defaultValue];
  v9 = @"off";
  if (v8) {
    v9 = @"on";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; name = %@; key = %@; defaultValue = %@>",
               v5,
               self,
               v6,
               v7,
               v9);
}

- (NSString)key
{
  return self->_key;
}

- (NSString)preferenceKey
{
  return self->_preferenceKey;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)status
{
  return self->_status;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSString)details
{
  return self->_details;
}

- (BOOL)defaultValue
{
  return self->_defaultValue;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

@end