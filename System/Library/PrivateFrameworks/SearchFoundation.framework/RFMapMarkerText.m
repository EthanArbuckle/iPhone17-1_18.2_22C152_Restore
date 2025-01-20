@interface RFMapMarkerText
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)title;
- (RFMapMarkerText)initWithCoder:(id)a3;
- (RFMapMarkerText)initWithProtobuf:(id)a3;
- (RFTextProperty)monogram;
- (SFLatLng)coordinate;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setMonogram:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RFMapMarkerText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogram, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

- (void)setMonogram:(id)a3
{
}

- (RFTextProperty)monogram
{
  return self->_monogram;
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
  v3 = [(RFMapMarkerText *)self coordinate];
  uint64_t v4 = [v3 hash];
  v5 = [(RFMapMarkerText *)self title];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RFMapMarkerText *)self monogram];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RFMapMarkerText *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFMapMarkerText *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(RFMapMarkerText *)self coordinate];
      unint64_t v8 = [(RFMapMarkerText *)v6 coordinate];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v9 = [(RFMapMarkerText *)self coordinate];
      if (v9)
      {
        v3 = [(RFMapMarkerText *)self coordinate];
        v10 = [(RFMapMarkerText *)v6 coordinate];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      v12 = [(RFMapMarkerText *)self title];
      v13 = [(RFMapMarkerText *)v6 title];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_27;
      }
      v15 = [(RFMapMarkerText *)self title];
      if (v15)
      {
        v25 = v12;
        v16 = [(RFMapMarkerText *)self title];
        v28 = [(RFMapMarkerText *)v6 title];
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
      v17 = [(RFMapMarkerText *)self monogram];
      v18 = [(RFMapMarkerText *)v6 monogram];
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
        uint64_t v19 = [(RFMapMarkerText *)self monogram];
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          v22 = [(RFMapMarkerText *)self monogram];
          v20 = [(RFMapMarkerText *)v6 monogram];
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
  v5 = [(RFMapMarkerText *)self coordinate];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setCoordinate:v6];

  v7 = [(RFMapMarkerText *)self title];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setTitle:v8];

  v9 = [(RFMapMarkerText *)self monogram];
  v10 = (void *)[v9 copy];
  [v4 setMonogram:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFMapMarkerText alloc] initWithFacade:self];
  v3 = [(_SFPBRFMapMarkerText *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFMapMarkerText alloc] initWithFacade:self];
  v3 = [(_SFPBRFMapMarkerText *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFMapMarkerText alloc] initWithFacade:self];
  v5 = [(_SFPBRFMapMarkerText *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFMapMarkerText)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFMapMarkerText alloc] initWithData:v5];
  v7 = [(RFMapMarkerText *)self initWithProtobuf:v6];

  return v7;
}

- (RFMapMarkerText)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RFMapMarkerText;
  v5 = [(RFMapMarkerText *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 coordinate];

    if (v6)
    {
      v7 = [SFLatLng alloc];
      unint64_t v8 = [v4 coordinate];
      v9 = [(SFLatLng *)v7 initWithProtobuf:v8];
      [(RFMapMarkerText *)v5 setCoordinate:v9];
    }
    v10 = [v4 title];

    if (v10)
    {
      char v11 = [v4 title];
      [(RFMapMarkerText *)v5 setTitle:v11];
    }
    v12 = [v4 monogram];

    if (v12)
    {
      v13 = [RFTextProperty alloc];
      v14 = [v4 monogram];
      v15 = [(RFTextProperty *)v13 initWithProtobuf:v14];
      [(RFMapMarkerText *)v5 setMonogram:v15];
    }
    v16 = v5;
  }

  return v5;
}

@end