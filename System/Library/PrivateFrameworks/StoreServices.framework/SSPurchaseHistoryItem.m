@interface SSPurchaseHistoryItem
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SSPurchaseHistoryItem)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)valueForProperty:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setValue:(id)a3 forProperty:(id)a4;
@end

@implementation SSPurchaseHistoryItem

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSPurchaseHistoryItem;
  [(SSPurchaseHistoryItem *)&v3 dealloc];
}

- (void)setValue:(id)a3 forProperty:(id)a4
{
  id v9 = a3;
  if ([a3 conformsToProtocol:&unk_1EF9AC4F0])
  {

    uint64_t v7 = [a3 copy];
  }
  else
  {
    uint64_t v7 = (uint64_t)v9;
  }
  properties = self->_properties;
  id v10 = (id)v7;
  if (properties)
  {
    if (v7)
    {
LABEL_6:
      [(NSMutableDictionary *)properties setObject:v7 forKey:a4];
      goto LABEL_9;
    }
  }
  else
  {
    properties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = (uint64_t)v10;
    self->_properties = properties;
    if (v10) {
      goto LABEL_6;
    }
  }
  [(NSMutableDictionary *)properties removeObjectForKey:a4];
LABEL_9:
}

- (id)valueForProperty:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_properties objectForKey:a3];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSMutableDictionary *)self->_properties mutableCopyWithZone:a3];
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_properties);
  return v3;
}

- (SSPurchaseHistoryItem)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSPurchaseHistoryItem;
    v5 = [(SSPurchaseHistoryItem *)&v8 init];
    if (v5)
    {
      objc_opt_class();
      CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "0");

      v5->_properties = (NSMutableDictionary *)[(__CFArray *)v7 mutableCopy];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)SSPurchaseHistoryItem;
  return (NSString *)[NSString stringWithFormat:@"%@: %@", -[SSPurchaseHistoryItem description](&v3, sel_description), self->_properties];
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_properties hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  properties = self->_properties;
  if (properties == *((NSMutableDictionary **)a3 + 1)) {
    return 1;
  }
  return -[NSMutableDictionary isEqualToDictionary:](properties, "isEqualToDictionary:");
}

@end