@interface TSBonjourNode
- (NSDictionary)interfaces;
- (NSString)domain;
- (NSString)name;
- (NSString)type;
- (TSBonjourNode)init;
- (TSBonjourNode)initWithServiceName:(id)a3 type:(id)a4 andDomain:(id)a5;
- (void)addedOnInterface:(unsigned int)a3 named:(id)a4;
- (void)removedFromInterface:(unsigned int)a3 named:(id)a4;
- (void)setInterfaces:(id)a3;
@end

@implementation TSBonjourNode

- (TSBonjourNode)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[TSBonjourNode init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (TSBonjourNode)initWithServiceName:(id)a3 type:(id)a4 andDomain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TSBonjourNode;
  v11 = [(TSBonjourNode *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    type = v11->_type;
    v11->_type = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    domain = v11->_domain;
    v11->_domain = (NSString *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionary];
    interfaces = v11->_interfaces;
    v11->_interfaces = (NSDictionary *)v18;
  }
  return v11;
}

- (void)addedOnInterface:(unsigned int)a3 named:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v15 = a4;
  v6 = [TSBonjourInterface alloc];
  v7 = [(TSBonjourNode *)self name];
  id v8 = [(TSBonjourNode *)self type];
  id v9 = [(TSBonjourNode *)self domain];
  id v10 = [(TSBonjourInterface *)v6 initWithServiceName:v7 type:v8 andDomain:v9 onInterfaceIndex:v4 andName:v15];

  [(TSBonjourInterface *)v10 setNode:self];
  v11 = [(TSBonjourNode *)self interfaces];

  uint64_t v12 = (void *)MEMORY[0x1E4F1CA60];
  if (v11)
  {
    v13 = [(TSBonjourNode *)self interfaces];
    uint64_t v14 = [v12 dictionaryWithDictionary:v13];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  [v14 setObject:v10 forKey:v15];
  [(TSBonjourNode *)self setInterfaces:v14];
}

- (void)removedFromInterface:(unsigned int)a3 named:(id)a4
{
  id v5 = a4;
  v6 = [(TSBonjourNode *)self interfaces];

  v7 = (void *)MEMORY[0x1E4F1CA60];
  if (v6)
  {
    id v8 = [(TSBonjourNode *)self interfaces];
    id v9 = [v7 dictionaryWithDictionary:v8];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  [v9 removeObjectForKey:v5];

  [(TSBonjourNode *)self setInterfaces:v9];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSDictionary)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end