@interface PRItem
+ (id)itemWithUUID:(id)a3 productUUID:(id)a4 isOwned:(BOOL)a5;
+ (id)itemWithUUID:(id)a3 productUUID:(id)a4 isOwned:(BOOL)a5 requiresLowerRangingFrequency:(BOOL)a6;
- (BOOL)isOwned;
- (BOOL)requiresLowerRangingFrequency;
- (NSUUID)productUUID;
- (NSUUID)uuid;
- (PRItem)initWithUUID:(id)a3 productUUID:(id)a4 isOwned:(BOOL)a5;
- (PRItem)initWithUUID:(id)a3 productUUID:(id)a4 isOwned:(BOOL)a5 requiresLowerRangingFrequency:(BOOL)a6;
@end

@implementation PRItem

+ (id)itemWithUUID:(id)a3 productUUID:(id)a4 isOwned:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[PRItem alloc] initWithUUID:v8 productUUID:v7 isOwned:v5 requiresLowerRangingFrequency:0];

  return v9;
}

- (PRItem)initWithUUID:(id)a3 productUUID:(id)a4 isOwned:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRItem;
  v11 = [(PRItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    objc_storeStrong((id *)&v12->_productUUID, a4);
    v12->_isOwned = a5;
    v12->_requiresLowerRangingFrequency = 0;
  }

  return v12;
}

+ (id)itemWithUUID:(id)a3 productUUID:(id)a4 isOwned:(BOOL)a5 requiresLowerRangingFrequency:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[PRItem alloc] initWithUUID:v10 productUUID:v9 isOwned:v7 requiresLowerRangingFrequency:v6];

  return v11;
}

- (PRItem)initWithUUID:(id)a3 productUUID:(id)a4 isOwned:(BOOL)a5 requiresLowerRangingFrequency:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PRItem;
  v13 = [(PRItem *)&v16 init];
  objc_super v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_uuid, a3);
    objc_storeStrong((id *)&v14->_productUUID, a4);
    v14->_isOwned = a5;
    v14->_requiresLowerRangingFrequency = a6;
  }

  return v14;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (BOOL)isOwned
{
  return self->_isOwned;
}

- (BOOL)requiresLowerRangingFrequency
{
  return self->_requiresLowerRangingFrequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end