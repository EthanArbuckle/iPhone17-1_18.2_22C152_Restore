@interface SFResultEntity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)maps_encrypted_muid;
- (NSString)name;
- (SFLocationTypeInfo)location_type_info;
- (SFResultEntity)initWithCoder:(id)a3;
- (SFResultEntity)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation_type_info:(id)a3;
- (void)setMaps_encrypted_muid:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SFResultEntity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location_type_info, 0);
  objc_storeStrong((id *)&self->_maps_encrypted_muid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setLocation_type_info:(id)a3
{
}

- (SFLocationTypeInfo)location_type_info
{
  return self->_location_type_info;
}

- (void)setMaps_encrypted_muid:(id)a3
{
}

- (NSString)maps_encrypted_muid
{
  return self->_maps_encrypted_muid;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)hash
{
  v3 = [(SFResultEntity *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(SFResultEntity *)self maps_encrypted_muid];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFResultEntity *)self location_type_info];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFResultEntity *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFResultEntity *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFResultEntity *)self name];
      unint64_t v8 = [(SFResultEntity *)v6 name];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v9 = [(SFResultEntity *)self name];
      if (v9)
      {
        v3 = [(SFResultEntity *)self name];
        v10 = [(SFResultEntity *)v6 name];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      v12 = [(SFResultEntity *)self maps_encrypted_muid];
      v13 = [(SFResultEntity *)v6 maps_encrypted_muid];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_27;
      }
      v15 = [(SFResultEntity *)self maps_encrypted_muid];
      if (v15)
      {
        v25 = v12;
        v16 = [(SFResultEntity *)self maps_encrypted_muid];
        v28 = [(SFResultEntity *)v6 maps_encrypted_muid];
        v29 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v11 = 0;
          v12 = v25;
          goto LABEL_25;
        }
        v30 = v15;
        v27 = v3;
        v12 = v25;
      }
      else
      {
        v30 = 0;
        v27 = v3;
      }
      v17 = [(SFResultEntity *)self location_type_info];
      v18 = [(SFResultEntity *)v6 location_type_info];
      if ((v17 == 0) == (v18 != 0))
      {

        char v11 = 0;
        v3 = v27;
        v15 = v30;
        if (!v30) {
          goto LABEL_26;
        }
      }
      else
      {
        v24 = v17;
        v26 = v18;
        uint64_t v19 = [(SFResultEntity *)self location_type_info];
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          v22 = [(SFResultEntity *)self location_type_info];
          v20 = [(SFResultEntity *)v6 location_type_info];
          char v11 = objc_msgSend(v22, "isEqual:");
        }
        else
        {

          char v11 = 1;
        }
        v3 = v27;
        if (!v30) {
          goto LABEL_26;
        }
      }
LABEL_25:

LABEL_26:
LABEL_27:
      v10 = v31;
      if (!v9)
      {
LABEL_29:

        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    char v11 = 0;
  }
LABEL_31:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFResultEntity *)self name];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setName:v6];

  v7 = [(SFResultEntity *)self maps_encrypted_muid];
  unint64_t v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setMaps_encrypted_muid:", v8);

  v9 = [(SFResultEntity *)self location_type_info];
  v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setLocation_type_info:", v10);

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBResultEntity alloc] initWithFacade:self];
  v3 = [(_SFPBResultEntity *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBResultEntity alloc] initWithFacade:self];
  v3 = [(_SFPBResultEntity *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBResultEntity alloc] initWithFacade:self];
  v5 = [(_SFPBResultEntity *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFResultEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBResultEntity alloc] initWithData:v5];
  v7 = [(SFResultEntity *)self initWithProtobuf:v6];

  return v7;
}

- (SFResultEntity)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFResultEntity;
  v5 = [(SFResultEntity *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];

    if (v6)
    {
      v7 = [v4 name];
      [(SFResultEntity *)v5 setName:v7];
    }
    unint64_t v8 = objc_msgSend(v4, "maps_encrypted_muid");

    if (v8)
    {
      v9 = objc_msgSend(v4, "maps_encrypted_muid");
      [(SFResultEntity *)v5 setMaps_encrypted_muid:v9];
    }
    v10 = objc_msgSend(v4, "location_type_info");

    if (v10)
    {
      char v11 = [SFLocationTypeInfo alloc];
      v12 = objc_msgSend(v4, "location_type_info");
      v13 = [(SFLocationTypeInfo *)v11 initWithProtobuf:v12];
      [(SFResultEntity *)v5 setLocation_type_info:v13];
    }
    v14 = v5;
  }

  return v5;
}

@end