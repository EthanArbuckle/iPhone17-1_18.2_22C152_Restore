@interface FCCKRecordMapping
- (BOOL)hasChanges;
- (FCCKRecordIDMapping)recordIDMapping;
- (FCCKRecordMapping)initWithFromZoneSchema:(id)a3 toZoneSchema:(id)a4 fromRecordSchema:(id)a5 toRecordSchema:(id)a6 recordIDMapping:(id)a7;
- (FCCKRecordSchema)fromRecordSchema;
- (FCCKRecordSchema)toRecordSchema;
- (FCCKZoneSchema)fromZoneSchema;
- (FCCKZoneSchema)toZoneSchema;
@end

@implementation FCCKRecordMapping

- (FCCKRecordMapping)initWithFromZoneSchema:(id)a3 toZoneSchema:(id)a4 fromRecordSchema:(id)a5 toRecordSchema:(id)a6 recordIDMapping:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FCCKRecordMapping;
  v17 = [(FCCKRecordMapping *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fromZoneSchema, a3);
    objc_storeStrong((id *)&v18->_toZoneSchema, a4);
    objc_storeStrong((id *)&v18->_fromRecordSchema, a5);
    objc_storeStrong((id *)&v18->_toRecordSchema, a6);
    objc_storeStrong((id *)&v18->_recordIDMapping, a7);
  }

  return v18;
}

- (BOOL)hasChanges
{
  v3 = (void *)MEMORY[0x1E4FBA8A8];
  v4 = [(FCCKRecordMapping *)self fromZoneSchema];
  v5 = [(FCCKRecordMapping *)self toZoneSchema];
  if (objc_msgSend(v3, "nf_object:isEqualToObject:", v4, v5))
  {
    v6 = (void *)MEMORY[0x1E4FBA8A8];
    v7 = [(FCCKRecordMapping *)self fromRecordSchema];
    v8 = [(FCCKRecordMapping *)self toRecordSchema];
    if (objc_msgSend(v6, "nf_object:isEqualToObject:", v7, v8))
    {
      v9 = [(FCCKRecordMapping *)self recordIDMapping];
      char v10 = [v9 hasChanges];
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 1;
  }

  return v10;
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

- (FCCKRecordIDMapping)recordIDMapping
{
  return self->_recordIDMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDMapping, 0);
  objc_storeStrong((id *)&self->_toRecordSchema, 0);
  objc_storeStrong((id *)&self->_fromRecordSchema, 0);
  objc_storeStrong((id *)&self->_toZoneSchema, 0);
  objc_storeStrong((id *)&self->_fromZoneSchema, 0);
}

@end