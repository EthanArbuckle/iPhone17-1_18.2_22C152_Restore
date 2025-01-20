@interface FCCKRecordTypeMapping
- (BOOL)hasChanges;
- (FCCKRecordSchema)fromRecordSchema;
- (FCCKRecordSchema)toRecordSchema;
- (FCCKRecordTypeMapping)initWithFromZoneSchema:(id)a3 toZoneSchema:(id)a4 fromRecordSchema:(id)a5 toRecordSchema:(id)a6;
- (FCCKZoneSchema)fromZoneSchema;
- (FCCKZoneSchema)toZoneSchema;
@end

@implementation FCCKRecordTypeMapping

- (FCCKRecordTypeMapping)initWithFromZoneSchema:(id)a3 toZoneSchema:(id)a4 fromRecordSchema:(id)a5 toRecordSchema:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FCCKRecordTypeMapping;
  v15 = [(FCCKRecordTypeMapping *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromZoneSchema, a3);
    objc_storeStrong((id *)&v16->_toZoneSchema, a4);
    objc_storeStrong((id *)&v16->_fromRecordSchema, a5);
    objc_storeStrong((id *)&v16->_toRecordSchema, a6);
  }

  return v16;
}

- (BOOL)hasChanges
{
  v3 = (void *)MEMORY[0x1E4FBA8A8];
  v4 = [(FCCKRecordTypeMapping *)self fromZoneSchema];
  v5 = [(FCCKRecordTypeMapping *)self toZoneSchema];
  if (objc_msgSend(v3, "nf_object:isEqualToObject:", v4, v5))
  {
    v6 = (void *)MEMORY[0x1E4FBA8A8];
    v7 = [(FCCKRecordTypeMapping *)self fromRecordSchema];
    v8 = [(FCCKRecordTypeMapping *)self toRecordSchema];
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

- (FCCKRecordSchema)fromRecordSchema
{
  return self->_fromRecordSchema;
}

- (FCCKRecordSchema)toRecordSchema
{
  return self->_toRecordSchema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toRecordSchema, 0);
  objc_storeStrong((id *)&self->_fromRecordSchema, 0);
  objc_storeStrong((id *)&self->_toZoneSchema, 0);
  objc_storeStrong((id *)&self->_fromZoneSchema, 0);
}

@end