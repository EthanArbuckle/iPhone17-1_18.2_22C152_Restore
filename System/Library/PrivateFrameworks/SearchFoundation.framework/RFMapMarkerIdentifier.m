@interface RFMapMarkerIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsForCameraPositionOnly;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForCameraPositionOnly;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)muid;
- (NSString)resultProviderID;
- (RFMapMarkerIdentifier)initWithCoder:(id)a3;
- (RFMapMarkerIdentifier)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsForCameraPositionOnly:(BOOL)a3;
- (void)setMuid:(id)a3;
- (void)setResultProviderID:(id)a3;
@end

@implementation RFMapMarkerIdentifier

- (RFMapMarkerIdentifier)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RFMapMarkerIdentifier;
  v5 = [(RFMapMarkerIdentifier *)&v12 init];
  if (v5)
  {
    v6 = [v4 muid];

    if (v6)
    {
      v7 = [v4 muid];
      [(RFMapMarkerIdentifier *)v5 setMuid:v7];
    }
    v8 = [v4 resultProviderID];

    if (v8)
    {
      v9 = [v4 resultProviderID];
      [(RFMapMarkerIdentifier *)v5 setResultProviderID:v9];
    }
    if ([v4 isForCameraPositionOnly]) {
      -[RFMapMarkerIdentifier setIsForCameraPositionOnly:](v5, "setIsForCameraPositionOnly:", [v4 isForCameraPositionOnly]);
    }
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultProviderID, 0);
  objc_storeStrong((id *)&self->_muid, 0);
}

- (BOOL)isForCameraPositionOnly
{
  return self->_isForCameraPositionOnly;
}

- (void)setResultProviderID:(id)a3
{
}

- (NSString)resultProviderID
{
  return self->_resultProviderID;
}

- (void)setMuid:(id)a3
{
}

- (NSString)muid
{
  return self->_muid;
}

- (unint64_t)hash
{
  v3 = [(RFMapMarkerIdentifier *)self muid];
  uint64_t v4 = [v3 hash];
  v5 = [(RFMapMarkerIdentifier *)self resultProviderID];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(RFMapMarkerIdentifier *)self isForCameraPositionOnly];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RFMapMarkerIdentifier *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(RFMapMarkerIdentifier *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      unint64_t v7 = [(RFMapMarkerIdentifier *)self muid];
      v8 = [(RFMapMarkerIdentifier *)v6 muid];
      if ((v7 == 0) == (v8 != 0))
      {
        LOBYTE(v11) = 0;
LABEL_24:

        goto LABEL_25;
      }
      v9 = [(RFMapMarkerIdentifier *)self muid];
      if (v9)
      {
        v10 = [(RFMapMarkerIdentifier *)self muid];
        v3 = [(RFMapMarkerIdentifier *)v6 muid];
        if (![v10 isEqual:v3])
        {
          LOBYTE(v11) = 0;
          goto LABEL_22;
        }
        v22 = v10;
      }
      objc_super v12 = [(RFMapMarkerIdentifier *)self resultProviderID];
      v13 = [(RFMapMarkerIdentifier *)v6 resultProviderID];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        LOBYTE(v11) = 0;
        goto LABEL_21;
      }
      v15 = [(RFMapMarkerIdentifier *)self resultProviderID];
      if (v15)
      {
        v19 = v3;
        v16 = [(RFMapMarkerIdentifier *)self resultProviderID];
        v20 = [(RFMapMarkerIdentifier *)v6 resultProviderID];
        v21 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          LOBYTE(v11) = 0;
          v3 = v19;
LABEL_19:

LABEL_20:
LABEL_21:
          v10 = v22;
          if (!v9)
          {
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:

          goto LABEL_23;
        }
        v3 = v19;
      }
      BOOL v17 = [(RFMapMarkerIdentifier *)self isForCameraPositionOnly];
      BOOL v11 = v17 ^ [(RFMapMarkerIdentifier *)v6 isForCameraPositionOnly] ^ 1;
      if (!v15) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    LOBYTE(v11) = 0;
  }
LABEL_25:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(RFMapMarkerIdentifier *)self muid];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setMuid:v6];

  unint64_t v7 = [(RFMapMarkerIdentifier *)self resultProviderID];
  v8 = (void *)[v7 copy];
  [v4 setResultProviderID:v8];

  objc_msgSend(v4, "setIsForCameraPositionOnly:", -[RFMapMarkerIdentifier isForCameraPositionOnly](self, "isForCameraPositionOnly"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFMapMarkerIdentifier alloc] initWithFacade:self];
  v3 = [(_SFPBRFMapMarkerIdentifier *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFMapMarkerIdentifier alloc] initWithFacade:self];
  v3 = [(_SFPBRFMapMarkerIdentifier *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFMapMarkerIdentifier alloc] initWithFacade:self];
  v5 = [(_SFPBRFMapMarkerIdentifier *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFMapMarkerIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFMapMarkerIdentifier alloc] initWithData:v5];
  unint64_t v7 = [(RFMapMarkerIdentifier *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasIsForCameraPositionOnly
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsForCameraPositionOnly:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isForCameraPositionOnly = a3;
}

@end