@interface SiriCoreSyncRecord
+ (id)syncRecordWithKey:(id)a3 identifier:(id)a4;
+ (id)syncRecordWithKey:(id)a3 identifier:(id)a4 priority:(int)a5 debugValue:(id)a6 dataValue:(id)a7 addedValue:(id)a8 appMeta:(id)a9;
- (NSData)addedValue;
- (NSData)checkHash;
- (NSData)dataValue;
- (NSData)metaValue;
- (NSString)debugValue;
- (NSString)identifier;
- (NSString)key;
- (SiriCoreSyncRecord)initWithKey:(id)a3 identifier:(id)a4 priority:(int)a5 debugValue:(id)a6 dataValue:(id)a7 addedValue:(id)a8 appMeta:(id)a9;
- (double)updateTime;
- (id)description;
- (int)itemPriority;
- (void)setAddedValue:(id)a3;
- (void)setCheckHash:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setDebugValue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItemPriority:(int)a3;
- (void)setKey:(id)a3;
- (void)setMetaValue:(id)a3;
- (void)setUpdateTime:(double)a3;
- (void)setUpdateTimeToNow;
- (void)updateHash;
@end

@implementation SiriCoreSyncRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkHash, 0);
  objc_storeStrong((id *)&self->_metaValue, 0);
  objc_storeStrong((id *)&self->_addedValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_debugValue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setCheckHash:(id)a3
{
}

- (NSData)checkHash
{
  return self->_checkHash;
}

- (void)setUpdateTime:(double)a3
{
  self->_updateTime = a3;
}

- (double)updateTime
{
  return self->_updateTime;
}

- (void)setMetaValue:(id)a3
{
}

- (NSData)metaValue
{
  return self->_metaValue;
}

- (void)setAddedValue:(id)a3
{
}

- (NSData)addedValue
{
  return self->_addedValue;
}

- (void)setDataValue:(id)a3
{
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDebugValue:(id)a3
{
}

- (NSString)debugValue
{
  return self->_debugValue;
}

- (void)setItemPriority:(int)a3
{
  self->_itemPriority = a3;
}

- (int)itemPriority
{
  return self->_itemPriority;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)SiriCoreSyncRecord;
  v3 = [(SiriCoreSyncRecord *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" key:%@,priority:%d,id:%@,data:%luB,added:%luB,meta:%luB,hash:%@,time:%.0f", self->_key, self->_itemPriority, self->_identifier, -[NSData length](self->_dataValue, "length"), -[NSData length](self->_addedValue, "length"), -[NSData length](self->_metaValue, "length"), self->_checkHash, *(void *)&self->_updateTime];

  return v4;
}

- (void)setUpdateTimeToNow
{
  id v4 = [MEMORY[0x263EFF910] date];
  [v4 timeIntervalSince1970];
  self->_updateTime = v3;
}

- (void)updateHash
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CC_SHA256(&self->_itemPriority, 4u, md);
  if (self->_identifier)
  {
    double v3 = [(NSString *)self->_key UTF8String];
    CC_LONG v4 = strlen(v3);
    CC_SHA256(v3, v4, md);
  }
  dataValue = self->_dataValue;
  if (dataValue) {
    CC_SHA256([(NSData *)dataValue bytes], [(NSData *)self->_dataValue length], md);
  }
  addedValue = self->_addedValue;
  if (addedValue) {
    CC_SHA256([(NSData *)addedValue bytes], [(NSData *)self->_addedValue length], md);
  }
  if (self->_metaValue) {
    CC_SHA256([(NSData *)self->_addedValue bytes], [(NSData *)self->_metaValue length], md);
  }
  v7 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:8];
  checkHash = self->_checkHash;
  self->_checkHash = v7;
}

- (SiriCoreSyncRecord)initWithKey:(id)a3 identifier:(id)a4 priority:(int)a5 debugValue:(id)a6 dataValue:(id)a7 addedValue:(id)a8 appMeta:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)SiriCoreSyncRecord;
  v18 = [(SiriCoreSyncRecord *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a4);
    v19->_itemPriority = a5;
    objc_storeStrong((id *)&v19->_key, a3);
    objc_storeStrong((id *)&v19->_debugValue, a6);
    objc_storeStrong((id *)&v19->_dataValue, a7);
    objc_storeStrong((id *)&v19->_addedValue, a8);
    objc_storeStrong((id *)&v19->_metaValue, a9);
    [(SiriCoreSyncRecord *)v19 setUpdateTimeToNow];
    [(SiriCoreSyncRecord *)v19 updateHash];
  }

  return v19;
}

+ (id)syncRecordWithKey:(id)a3 identifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SiriCoreSyncRecord alloc] initWithKey:v6 identifier:v5 priority:0 debugValue:0 dataValue:0 addedValue:0 appMeta:0];

  return v7;
}

+ (id)syncRecordWithKey:(id)a3 identifier:(id)a4 priority:(int)a5 debugValue:(id)a6 dataValue:(id)a7 addedValue:(id)a8 appMeta:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a4;
  id v20 = a3;
  id v21 = [[SiriCoreSyncRecord alloc] initWithKey:v20 identifier:v19 priority:v12 debugValue:v18 dataValue:v17 addedValue:v16 appMeta:v15];

  return v21;
}

@end