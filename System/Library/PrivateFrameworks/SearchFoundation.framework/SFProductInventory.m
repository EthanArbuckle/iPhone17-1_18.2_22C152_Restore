@interface SFProductInventory
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAvailabilityStatus;
- (BOOL)hasDistanceUnit;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDate)timestamp;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)distance;
- (NSString)storeAddress;
- (NSString)storeId;
- (NSString)storeName;
- (SFProductInventory)initWithCoder:(id)a3;
- (SFProductInventory)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)availabilityStatus;
- (int)distanceUnit;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailabilityStatus:(int)a3;
- (void)setDistance:(id)a3;
- (void)setDistanceUnit:(int)a3;
- (void)setStoreAddress:(id)a3;
- (void)setStoreId:(id)a3;
- (void)setStoreName:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setType:(int)a3;
@end

@implementation SFProductInventory

- (SFProductInventory)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFProductInventory;
  v5 = [(SFProductInventory *)&v21 init];
  if (v5)
  {
    if ([v4 type]) {
      -[SFProductInventory setType:](v5, "setType:", [v4 type]);
    }
    v6 = [v4 storeId];

    if (v6)
    {
      v7 = [v4 storeId];
      [(SFProductInventory *)v5 setStoreId:v7];
    }
    if ([v4 availabilityStatus]) {
      -[SFProductInventory setAvailabilityStatus:](v5, "setAvailabilityStatus:", [v4 availabilityStatus]);
    }
    [v4 distance];
    if (v8 != 0.0)
    {
      v9 = NSNumber;
      [v4 distance];
      v10 = objc_msgSend(v9, "numberWithFloat:");
      [(SFProductInventory *)v5 setDistance:v10];
    }
    if ([v4 distanceUnit]) {
      -[SFProductInventory setDistanceUnit:](v5, "setDistanceUnit:", [v4 distanceUnit]);
    }
    v11 = [v4 timestamp];

    if (v11)
    {
      v12 = [v4 timestamp];
      v13 = (void *)MEMORY[0x1E4F1C9C8];
      [v12 secondsSince1970];
      v14 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
      [(SFProductInventory *)v5 setTimestamp:v14];
    }
    v15 = [v4 storeName];

    if (v15)
    {
      v16 = [v4 storeName];
      [(SFProductInventory *)v5 setStoreName:v16];
    }
    v17 = [v4 storeAddress];

    if (v17)
    {
      v18 = [v4 storeAddress];
      [(SFProductInventory *)v5 setStoreAddress:v18];
    }
    v19 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAddress, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_storeId, 0);
}

- (void)setStoreAddress:(id)a3
{
}

- (NSString)storeAddress
{
  return self->_storeAddress;
}

- (void)setStoreName:(id)a3
{
}

- (NSString)storeName
{
  return self->_storeName;
}

- (void)setTimestamp:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int)distanceUnit
{
  return self->_distanceUnit;
}

- (void)setDistance:(id)a3
{
}

- (NSNumber)distance
{
  return self->_distance;
}

- (int)availabilityStatus
{
  return self->_availabilityStatus;
}

- (void)setStoreId:(id)a3
{
}

- (NSString)storeId
{
  return self->_storeId;
}

- (int)type
{
  return self->_type;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SFProductInventory *)self type];
  id v4 = [(SFProductInventory *)self storeId];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [(SFProductInventory *)self availabilityStatus];
  v7 = [(SFProductInventory *)self distance];
  uint64_t v8 = v5 ^ v6 ^ [v7 hash];
  uint64_t v9 = [(SFProductInventory *)self distanceUnit];
  v10 = [(SFProductInventory *)self timestamp];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(SFProductInventory *)self storeName];
  uint64_t v13 = v8 ^ v11 ^ [v12 hash];
  v14 = [(SFProductInventory *)self storeAddress];
  unint64_t v15 = v13 ^ [v14 hash];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SFProductInventory *)a3;
  if (self == v6)
  {
    char v12 = 1;
  }
  else
  {
    if ([(SFProductInventory *)v6 isMemberOfClass:objc_opt_class()])
    {
      v7 = v6;
      int v8 = [(SFProductInventory *)self type];
      if (v8 != [(SFProductInventory *)v7 type])
      {
        char v12 = 0;
LABEL_34:

        goto LABEL_35;
      }
      uint64_t v9 = [(SFProductInventory *)self storeId];
      v10 = [(SFProductInventory *)v7 storeId];
      if ((v9 == 0) == (v10 != 0))
      {
        char v12 = 0;
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v11 = [(SFProductInventory *)self storeId];
      if (v11)
      {
        uint64_t v3 = [(SFProductInventory *)self storeId];
        id v4 = [(SFProductInventory *)v7 storeId];
        if (![v3 isEqual:v4])
        {
          char v12 = 0;
          goto LABEL_31;
        }
      }
      int v13 = [(SFProductInventory *)self availabilityStatus];
      if (v13 == [(SFProductInventory *)v7 availabilityStatus])
      {
        v14 = [(SFProductInventory *)self distance];
        unint64_t v15 = [(SFProductInventory *)v7 distance];
        if ((v14 == 0) != (v15 != 0))
        {
          v49 = v15;
          v50 = [(SFProductInventory *)self distance];
          if (v50)
          {
            v16 = [(SFProductInventory *)self distance];
            [(SFProductInventory *)v7 distance];
            v47 = v48 = v16;
            if (!objc_msgSend(v16, "isEqual:"))
            {
              char v12 = 0;
              v17 = v14;
              v18 = v50;
              goto LABEL_23;
            }
          }
          int v19 = [(SFProductInventory *)self distanceUnit];
          if (v19 != [(SFProductInventory *)v7 distanceUnit])
          {
            char v12 = 0;
            v17 = v14;
            v18 = v50;
            if (!v50) {
              goto LABEL_24;
            }
            goto LABEL_23;
          }
          v46 = v3;
          v20 = [(SFProductInventory *)self timestamp];
          objc_super v21 = [(SFProductInventory *)v7 timestamp];
          if ((v20 == 0) != (v21 != 0))
          {
            v44 = v20;
            v45 = v21;
            v22 = [(SFProductInventory *)self timestamp];
            v43 = v14;
            if (v22)
            {
              v23 = [(SFProductInventory *)self timestamp];
              v40 = [(SFProductInventory *)v7 timestamp];
              v41 = v23;
              if (![v23 isEqual:v40])
              {
                char v12 = 0;
                v18 = v50;
LABEL_52:

LABEL_53:
                uint64_t v3 = v46;
                v17 = v43;
                if (!v18)
                {
LABEL_24:

                  if (!v11) {
                    goto LABEL_32;
                  }
                  goto LABEL_31;
                }
LABEL_23:

                goto LABEL_24;
              }
              v42 = v22;
            }
            else
            {
              v42 = 0;
            }
            v25 = [(SFProductInventory *)self storeName];
            v26 = [(SFProductInventory *)v7 storeName];
            if ((v25 == 0) == (v26 != 0))
            {

              char v12 = 0;
              goto LABEL_51;
            }
            v39 = v26;
            v37 = v25;
            uint64_t v38 = [(SFProductInventory *)self storeName];
            if (!v38
              || ([(SFProductInventory *)self storeName],
                  v27 = objc_claimAutoreleasedReturnValue(),
                  [(SFProductInventory *)v7 storeName],
                  v35 = objc_claimAutoreleasedReturnValue(),
                  v36 = v27,
                  objc_msgSend(v27, "isEqual:")))
            {
              v29 = [(SFProductInventory *)self storeAddress];
              v30 = [(SFProductInventory *)v7 storeAddress];
              if ((v29 == 0) == (v30 != 0))
              {

                char v12 = 0;
              }
              else
              {
                v34 = v30;
                v33 = [(SFProductInventory *)self storeAddress];
                if (v33)
                {
                  v32 = [(SFProductInventory *)self storeAddress];
                  v31 = [(SFProductInventory *)v7 storeAddress];
                  char v12 = [v32 isEqual:v31];
                }
                else
                {

                  char v12 = 1;
                }
              }
              v25 = v37;
              v28 = (void *)v38;
              if (!v38) {
                goto LABEL_50;
              }
            }
            else
            {
              char v12 = 0;
              v28 = (void *)v38;
            }

LABEL_50:
LABEL_51:
            v18 = v50;
            v22 = v42;
            if (!v42) {
              goto LABEL_53;
            }
            goto LABEL_52;
          }

          if (v50)
          {
          }
          unint64_t v15 = v49;
          uint64_t v3 = v46;
        }
      }
      char v12 = 0;
      if (!v11)
      {
LABEL_32:

        goto LABEL_33;
      }
LABEL_31:

      goto LABEL_32;
    }
    char v12 = 0;
  }
LABEL_35:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setType:", -[SFProductInventory type](self, "type"));
  uint64_t v5 = [(SFProductInventory *)self storeId];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setStoreId:v6];

  objc_msgSend(v4, "setAvailabilityStatus:", -[SFProductInventory availabilityStatus](self, "availabilityStatus"));
  v7 = [(SFProductInventory *)self distance];
  int v8 = (void *)[v7 copy];
  [v4 setDistance:v8];

  objc_msgSend(v4, "setDistanceUnit:", -[SFProductInventory distanceUnit](self, "distanceUnit"));
  uint64_t v9 = [(SFProductInventory *)self timestamp];
  v10 = (void *)[v9 copy];
  [v4 setTimestamp:v10];

  uint64_t v11 = [(SFProductInventory *)self storeName];
  char v12 = (void *)[v11 copy];
  [v4 setStoreName:v12];

  int v13 = [(SFProductInventory *)self storeAddress];
  v14 = (void *)[v13 copy];
  [v4 setStoreAddress:v14];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBProductInventory alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBProductInventory *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBProductInventory alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBProductInventory *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBProductInventory alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBProductInventory *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFProductInventory)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBProductInventory alloc] initWithData:v5];
  v7 = [(SFProductInventory *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasDistanceUnit
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDistanceUnit:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_distanceUnit = a3;
}

- (BOOL)hasAvailabilityStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAvailabilityStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_availabilityStatus = a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

@end