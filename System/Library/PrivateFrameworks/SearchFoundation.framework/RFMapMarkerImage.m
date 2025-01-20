@interface RFMapMarkerImage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)systemImage;
- (NSString)title;
- (RFMapMarkerImage)initWithCoder:(id)a3;
- (RFMapMarkerImage)initWithProtobuf:(id)a3;
- (SFLatLng)coordinate;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setSystemImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RFMapMarkerImage

- (RFMapMarkerImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFMapMarkerImage;
  v5 = [(RFMapMarkerImage *)&v16 init];
  if (v5)
  {
    v6 = [v4 coordinate];

    if (v6)
    {
      v7 = [SFLatLng alloc];
      v8 = [v4 coordinate];
      v9 = [(SFLatLng *)v7 initWithProtobuf:v8];
      [(RFMapMarkerImage *)v5 setCoordinate:v9];
    }
    v10 = [v4 title];

    if (v10)
    {
      v11 = [v4 title];
      [(RFMapMarkerImage *)v5 setTitle:v11];
    }
    v12 = [v4 systemImage];

    if (v12)
    {
      v13 = [v4 systemImage];
      [(RFMapMarkerImage *)v5 setSystemImage:v13];
    }
    v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

- (void)setSystemImage:(id)a3
{
}

- (NSString)systemImage
{
  return self->_systemImage;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setCoordinate:(id)a3
{
}

- (SFLatLng)coordinate
{
  return self->_coordinate;
}

- (unint64_t)hash
{
  v3 = [(RFMapMarkerImage *)self coordinate];
  uint64_t v4 = [v3 hash];
  v5 = [(RFMapMarkerImage *)self title];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RFMapMarkerImage *)self systemImage];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RFMapMarkerImage *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFMapMarkerImage *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(RFMapMarkerImage *)self coordinate];
      unint64_t v8 = [(RFMapMarkerImage *)v6 coordinate];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v9 = [(RFMapMarkerImage *)self coordinate];
      if (v9)
      {
        v3 = [(RFMapMarkerImage *)self coordinate];
        v10 = [(RFMapMarkerImage *)v6 coordinate];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      v12 = [(RFMapMarkerImage *)self title];
      v13 = [(RFMapMarkerImage *)v6 title];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_27;
      }
      v15 = [(RFMapMarkerImage *)self title];
      if (v15)
      {
        v25 = v12;
        objc_super v16 = [(RFMapMarkerImage *)self title];
        v28 = [(RFMapMarkerImage *)v6 title];
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
      v17 = [(RFMapMarkerImage *)self systemImage];
      v18 = [(RFMapMarkerImage *)v6 systemImage];
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
        uint64_t v19 = [(RFMapMarkerImage *)self systemImage];
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          v22 = [(RFMapMarkerImage *)self systemImage];
          v20 = [(RFMapMarkerImage *)v6 systemImage];
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
  v5 = [(RFMapMarkerImage *)self coordinate];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setCoordinate:v6];

  v7 = [(RFMapMarkerImage *)self title];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setTitle:v8];

  v9 = [(RFMapMarkerImage *)self systemImage];
  v10 = (void *)[v9 copy];
  [v4 setSystemImage:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFMapMarkerImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFMapMarkerImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFMapMarkerImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFMapMarkerImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFMapMarkerImage alloc] initWithFacade:self];
  v5 = [(_SFPBRFMapMarkerImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFMapMarkerImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFMapMarkerImage alloc] initWithData:v5];
  v7 = [(RFMapMarkerImage *)self initWithProtobuf:v6];

  return v7;
}

@end