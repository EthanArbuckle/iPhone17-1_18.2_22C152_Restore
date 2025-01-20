@interface CTCapability
- (BOOL)getCapabilityForSlotID:(int64_t)a3;
- (BOOL)getCapabilityInfo:(id)a3 forSlotID:(int64_t)a4;
- (BOOL)getEnabledForSlotID:(int64_t)a3;
- (CTCapability)initWithCapabilityName:(id)a3;
- (NSMutableDictionary)capability;
- (NSMutableDictionary)capabilityFetched;
- (NSMutableDictionary)capabilityInfo;
- (NSMutableDictionary)enabledDict;
- (NSMutableDictionary)enabledFetched;
- (NSString)capabilityName;
- (id)getCapabilityInfoObject:(id)a3 forSlotID:(int64_t)a4;
- (id)slotNum:(int64_t)a3;
- (void)acceptCapabilityforSlotID:(int64_t)a3 status:(BOOL)a4 canSet:(BOOL)a5 info:(id)a6;
- (void)reset;
- (void)setCapability:(id)a3;
- (void)setCapabilityFetched:(id)a3;
- (void)setCapabilityInfo:(id)a3;
- (void)setCapabilityInfo:(id)a3 forSlotID:(int64_t)a4;
- (void)setCapabilityInfoObject:(id)a3 forKey:(id)a4 forSlotID:(int64_t)a5;
- (void)setCapabilityName:(id)a3;
- (void)setCapable:(BOOL)a3 forSlotID:(int64_t)a4;
- (void)setEnabled:(BOOL)a3 forSlotID:(int64_t)a4;
- (void)setEnabledDict:(id)a3;
- (void)setEnabledFetched:(id)a3;
@end

@implementation CTCapability

- (CTCapability)initWithCapabilityName:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCapability;
  v6 = [(CTCapability *)&v13 init];
  v7 = v6;
  if (v6)
  {
    [(CTCapability *)v6 reset];
    objc_storeStrong((id *)&v7->_capabilityName, a3);
    uint64_t v8 = objc_opt_new();
    capabilityFetched = v7->_capabilityFetched;
    v7->_capabilityFetched = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    enabledFetched = v7->_enabledFetched;
    v7->_enabledFetched = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (void)acceptCapabilityforSlotID:(int64_t)a3 status:(BOOL)a4 canSet:(BOOL)a5 info:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  id v19 = [(CTCapability *)self slotNum:a3];
  v11 = [NSNumber numberWithBool:v6];
  v12 = [(CTCapability *)self capability];
  [v12 setObject:v11 forKeyedSubscript:v19];

  objc_super v13 = [NSNumber numberWithBool:v7];
  v14 = [(CTCapability *)self enabledDict];
  [v14 setObject:v13 forKeyedSubscript:v19];

  v15 = [(CTCapability *)self capabilityInfo];
  [v15 setObject:v10 forKeyedSubscript:v19];

  v16 = [(CTCapability *)self capabilityFetched];
  uint64_t v17 = MEMORY[0x263EFFA88];
  [v16 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v19];

  v18 = [(CTCapability *)self enabledFetched];
  [v18 setObject:v17 forKeyedSubscript:v19];
}

- (void)setCapable:(BOOL)a3 forSlotID:(int64_t)a4
{
  id v8 = [NSNumber numberWithBool:a3];
  BOOL v6 = [(CTCapability *)self capability];
  BOOL v7 = [(CTCapability *)self slotNum:a4];
  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)getCapabilityForSlotID:(int64_t)a3
{
  id v5 = [(CTCapability *)self capability];
  BOOL v6 = [(CTCapability *)self slotNum:a3];
  BOOL v7 = [v5 objectForKeyedSubscript:v6];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (void)setCapabilityInfo:(id)a3 forSlotID:(int64_t)a4
{
  id v6 = a3;
  id v8 = [(CTCapability *)self capabilityInfo];
  BOOL v7 = [(CTCapability *)self slotNum:a4];
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (BOOL)getCapabilityInfo:(id)a3 forSlotID:(int64_t)a4
{
  v4 = [(CTCapability *)self getCapabilityInfoObject:a3 forSlotID:a4];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)getCapabilityInfoObject:(id)a3 forSlotID:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(CTCapability *)self capabilityInfo];
  id v8 = [(CTCapability *)self slotNum:a4];
  v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = [v9 objectForKeyedSubscript:v6];

  return v10;
}

- (void)setCapabilityInfoObject:(id)a3 forKey:(id)a4 forSlotID:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CTCapability *)self slotNum:a5];
  v11 = [(CTCapability *)self enabledFetched];
  v12 = [v11 objectForKeyedSubscript:v10];
  char v13 = [v12 isEqual:MEMORY[0x263EFFA88]];

  if (v13)
  {
    v14 = [(CTCapability *)self capabilityInfo];
    v15 = [v14 objectForKeyedSubscript:v10];

    v16 = (void *)[v15 mutableCopy];
    [v16 setObject:v8 forKeyedSubscript:v9];
    uint64_t v17 = [(CTCapability *)self capabilityInfo];
    [v17 setObject:v16 forKeyedSubscript:v10];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315138;
    id v19 = "-[CTCapability setCapabilityInfoObject:forKey:forSlotID:]";
    _os_log_error_impl(&dword_221B17000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: DONOTHING, not fetched", (uint8_t *)&v18, 0xCu);
  }
}

- (void)setEnabled:(BOOL)a3 forSlotID:(int64_t)a4
{
  id v8 = [NSNumber numberWithBool:a3];
  id v6 = [(CTCapability *)self enabledDict];
  BOOL v7 = [(CTCapability *)self slotNum:a4];
  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)getEnabledForSlotID:(int64_t)a3
{
  char v5 = [(CTCapability *)self enabledDict];
  id v6 = [(CTCapability *)self slotNum:a3];
  BOOL v7 = [v5 objectForKeyedSubscript:v6];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (id)slotNum:(int64_t)a3
{
  return (id)[NSNumber numberWithInteger:a3];
}

- (void)reset
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  [(CTCapability *)self setCapabilityFetched:v3];

  v4 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  [(CTCapability *)self setEnabledFetched:v4];

  char v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  [(CTCapability *)self setCapability:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  [(CTCapability *)self setCapabilityInfo:v6];

  id v7 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  [(CTCapability *)self setEnabledDict:v7];
}

- (NSString)capabilityName
{
  return self->_capabilityName;
}

- (void)setCapabilityName:(id)a3
{
}

- (NSMutableDictionary)capabilityFetched
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCapabilityFetched:(id)a3
{
}

- (NSMutableDictionary)enabledFetched
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnabledFetched:(id)a3
{
}

- (NSMutableDictionary)capability
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCapability:(id)a3
{
}

- (NSMutableDictionary)capabilityInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCapabilityInfo:(id)a3
{
}

- (NSMutableDictionary)enabledDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnabledDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledDict, 0);
  objc_storeStrong((id *)&self->_capabilityInfo, 0);
  objc_storeStrong((id *)&self->_capability, 0);
  objc_storeStrong((id *)&self->_enabledFetched, 0);
  objc_storeStrong((id *)&self->_capabilityFetched, 0);
  objc_storeStrong((id *)&self->_capabilityName, 0);
}

@end