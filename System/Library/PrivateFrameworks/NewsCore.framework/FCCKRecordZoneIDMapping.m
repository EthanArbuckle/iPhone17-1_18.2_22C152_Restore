@interface FCCKRecordZoneIDMapping
- (BOOL)hasChanges;
- (FCCKRecordZoneIDMapping)initWithFromZoneSchema:(id)a3 toZoneSchema:(id)a4;
- (FCCKZoneSchema)fromZoneSchema;
- (FCCKZoneSchema)toZoneSchema;
@end

@implementation FCCKRecordZoneIDMapping

- (FCCKRecordZoneIDMapping)initWithFromZoneSchema:(id)a3 toZoneSchema:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCKRecordZoneIDMapping;
  v9 = [(FCCKRecordZoneIDMapping *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fromZoneSchema, a3);
    objc_storeStrong((id *)&v10->_toZoneSchema, a4);
  }

  return v10;
}

- (BOOL)hasChanges
{
  v3 = (void *)MEMORY[0x1E4FBA8A8];
  v4 = [(FCCKRecordZoneIDMapping *)self fromZoneSchema];
  v5 = [(FCCKRecordZoneIDMapping *)self toZoneSchema];
  LOBYTE(v3) = objc_msgSend(v3, "nf_object:isEqualToObject:", v4, v5) ^ 1;

  return (char)v3;
}

- (FCCKZoneSchema)fromZoneSchema
{
  return self->_fromZoneSchema;
}

- (FCCKZoneSchema)toZoneSchema
{
  return self->_toZoneSchema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toZoneSchema, 0);
  objc_storeStrong((id *)&self->_fromZoneSchema, 0);
}

@end