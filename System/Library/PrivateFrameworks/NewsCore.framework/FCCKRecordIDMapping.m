@interface FCCKRecordIDMapping
- (BOOL)hasChanges;
- (CKRecordID)fromRecordID;
- (CKRecordID)toRecordID;
- (FCCKRecordIDMapping)initWithFromZoneSchema:(id)a3 toZoneSchema:(id)a4 fromRecordName:(id)a5 toRecordName:(id)a6;
- (FCCKZoneSchema)fromZoneSchema;
- (FCCKZoneSchema)toZoneSchema;
- (NSString)fromRecordName;
- (NSString)toRecordName;
@end

@implementation FCCKRecordIDMapping

- (FCCKRecordIDMapping)initWithFromZoneSchema:(id)a3 toZoneSchema:(id)a4 fromRecordName:(id)a5 toRecordName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FCCKRecordIDMapping;
  v15 = [(FCCKRecordIDMapping *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromZoneSchema, a3);
    objc_storeStrong((id *)&v16->_toZoneSchema, a4);
    objc_storeStrong((id *)&v16->_fromRecordName, a5);
    objc_storeStrong((id *)&v16->_toRecordName, a6);
  }

  return v16;
}

- (CKRecordID)fromRecordID
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v4 = [(FCCKRecordIDMapping *)self fromRecordName];
  uint64_t v5 = [(FCCKRecordIDMapping *)self fromZoneSchema];
  v6 = (void *)v5;
  if (v5) {
    v7 = *(void **)(v5 + 24);
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  v9 = (void *)[v3 initWithRecordName:v4 zoneID:v8];

  return (CKRecordID *)v9;
}

- (CKRecordID)toRecordID
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v4 = [(FCCKRecordIDMapping *)self toRecordName];
  uint64_t v5 = [(FCCKRecordIDMapping *)self toZoneSchema];
  v6 = (void *)v5;
  if (v5) {
    v7 = *(void **)(v5 + 24);
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  v9 = (void *)[v3 initWithRecordName:v4 zoneID:v8];

  return (CKRecordID *)v9;
}

- (BOOL)hasChanges
{
  id v3 = (void *)MEMORY[0x1E4FBA8A8];
  v4 = [(FCCKRecordIDMapping *)self fromZoneSchema];
  uint64_t v5 = [(FCCKRecordIDMapping *)self toZoneSchema];
  if (objc_msgSend(v3, "nf_object:isEqualToObject:", v4, v5))
  {
    v6 = (void *)MEMORY[0x1E4FBA8A8];
    v7 = [(FCCKRecordIDMapping *)self fromRecordName];
    id v8 = [(FCCKRecordIDMapping *)self toRecordName];
    int v9 = objc_msgSend(v6, "nf_object:isEqualToObject:", v7, v8) ^ 1;
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (FCCKZoneSchema)fromZoneSchema
{
  return self->_fromZoneSchema;
}

- (FCCKZoneSchema)toZoneSchema
{
  return self->_toZoneSchema;
}

- (NSString)fromRecordName
{
  return self->_fromRecordName;
}

- (NSString)toRecordName
{
  return self->_toRecordName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toRecordName, 0);
  objc_storeStrong((id *)&self->_fromRecordName, 0);
  objc_storeStrong((id *)&self->_toZoneSchema, 0);
  objc_storeStrong((id *)&self->_fromZoneSchema, 0);
}

@end