@interface RFMapMarker
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIdentifier;
- (BOOL)hasImage;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFColor)tint;
- (RFMapMarker)initWithCoder:(id)a3;
- (RFMapMarker)initWithProtobuf:(id)a3;
- (RFMapMarkerIdentifier)identifier;
- (RFMapMarkerImage)image;
- (RFMapMarkerText)text;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setText:(id)a3;
- (void)setTint:(id)a3;
@end

@implementation RFMapMarker

- (RFMapMarker)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RFMapMarker;
  v5 = [(RFMapMarker *)&v24 init];
  if (v5)
  {
    v6 = [v4 identifier];

    if (v6)
    {
      v7 = [RFMapMarkerIdentifier alloc];
      v8 = [v4 identifier];
      v9 = [(RFMapMarkerIdentifier *)v7 initWithProtobuf:v8];
      [(RFMapMarker *)v5 setIdentifier:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [RFMapMarkerText alloc];
      v12 = [v4 text];
      v13 = [(RFMapMarkerText *)v11 initWithProtobuf:v12];
      [(RFMapMarker *)v5 setText:v13];
    }
    v14 = [v4 image];

    if (v14)
    {
      v15 = [RFMapMarkerImage alloc];
      v16 = [v4 image];
      v17 = [(RFMapMarkerImage *)v15 initWithProtobuf:v16];
      [(RFMapMarker *)v5 setImage:v17];
    }
    v18 = [v4 tint];

    if (v18)
    {
      v19 = [RFColor alloc];
      v20 = [v4 tint];
      v21 = [(RFColor *)v19 initWithProtobuf:v20];
      [(RFMapMarker *)v5 setTint:v21];
    }
    v22 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tint, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setTint:(id)a3
{
}

- (RFColor)tint
{
  return self->_tint;
}

- (RFMapMarkerImage)image
{
  return self->_image;
}

- (RFMapMarkerText)text
{
  return self->_text;
}

- (RFMapMarkerIdentifier)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  v3 = [(RFMapMarker *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(RFMapMarker *)self text];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RFMapMarker *)self image];
  uint64_t v8 = [v7 hash];
  v9 = [(RFMapMarker *)self tint];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RFMapMarker *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFMapMarker *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(RFMapMarker *)self identifier];
      uint64_t v8 = [(RFMapMarker *)v6 identifier];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_37:

        goto LABEL_38;
      }
      v9 = [(RFMapMarker *)self identifier];
      if (v9)
      {
        unint64_t v10 = [(RFMapMarker *)self identifier];
        v3 = [(RFMapMarker *)v6 identifier];
        if (![v10 isEqual:v3])
        {
          char v11 = 0;
          goto LABEL_35;
        }
        v41 = v10;
      }
      v12 = [(RFMapMarker *)self text];
      v13 = [(RFMapMarker *)v6 text];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_34;
      }
      uint64_t v15 = [(RFMapMarker *)self text];
      v40 = (void *)v15;
      if (v15)
      {
        v16 = (void *)v15;
        v35 = v14;
        v17 = v12;
        v18 = [(RFMapMarker *)self text];
        v37 = [(RFMapMarker *)v6 text];
        v38 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          char v11 = 0;
          v12 = v17;
          v14 = v35;
          goto LABEL_32;
        }
        v39 = v3;
        v12 = v17;
        v14 = v35;
      }
      else
      {
        v39 = v3;
      }
      v19 = [(RFMapMarker *)self image];
      v20 = [(RFMapMarker *)v6 image];
      if ((v19 == 0) == (v20 != 0))
      {

        char v11 = 0;
        v3 = v39;
        v16 = v40;
        if (!v40) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      v33 = v20;
      v34 = v19;
      [(RFMapMarker *)self image];
      v36 = v16 = v40;
      if (!v36
        || ([(RFMapMarker *)self image],
            v21 = objc_claimAutoreleasedReturnValue(),
            [(RFMapMarker *)v6 image],
            v31 = objc_claimAutoreleasedReturnValue(),
            v32 = v21,
            objc_msgSend(v21, "isEqual:")))
      {
        v22 = [(RFMapMarker *)self tint];
        v23 = [(RFMapMarker *)v6 tint];
        if ((v22 == 0) == (v23 != 0))
        {

          char v11 = 0;
          v16 = v40;
        }
        else
        {
          v29 = v22;
          v30 = v23;
          uint64_t v24 = [(RFMapMarker *)self tint];
          v16 = v40;
          if (v24)
          {
            v28 = (void *)v24;
            v27 = [(RFMapMarker *)self tint];
            v25 = [(RFMapMarker *)v6 tint];
            char v11 = objc_msgSend(v27, "isEqual:");
          }
          else
          {

            char v11 = 1;
          }
        }
        v3 = v39;
        if (!v36)
        {
LABEL_31:

          if (!v16)
          {
LABEL_33:

LABEL_34:
            unint64_t v10 = v41;
            if (!v9)
            {
LABEL_36:

              goto LABEL_37;
            }
LABEL_35:

            goto LABEL_36;
          }
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        char v11 = 0;
        v3 = v39;
      }

      goto LABEL_31;
    }
    char v11 = 0;
  }
LABEL_38:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ([(RFMapMarker *)self hasIdentifier])
  {
    v5 = [(RFMapMarker *)self identifier];
    uint64_t v6 = (void *)[v5 copy];
    [v4 setIdentifier:v6];
  }
  if ([(RFMapMarker *)self hasText])
  {
    v7 = [(RFMapMarker *)self text];
    uint64_t v8 = (void *)[v7 copy];
    [v4 setText:v8];
  }
  if ([(RFMapMarker *)self hasImage])
  {
    v9 = [(RFMapMarker *)self image];
    unint64_t v10 = (void *)[v9 copy];
    [v4 setImage:v10];
  }
  char v11 = [(RFMapMarker *)self tint];
  v12 = (void *)[v11 copy];
  [v4 setTint:v12];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFMapMarker alloc] initWithFacade:self];
  v3 = [(_SFPBRFMapMarker *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFMapMarker alloc] initWithFacade:self];
  v3 = [(_SFPBRFMapMarker *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFMapMarker alloc] initWithFacade:self];
  v5 = [(_SFPBRFMapMarker *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFMapMarker)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFMapMarker alloc] initWithData:v5];
  v7 = [(RFMapMarker *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasImage
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setImage:(id)a3
{
  *(unsigned char *)&self->_has |= 4u;
  objc_storeStrong((id *)&self->_image, a3);
  id v7 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  identifier = self->_identifier;
  self->_identifier = 0;

  *(unsigned char *)&self->_has &= ~2u;
  text = self->_text;
  self->_text = 0;
}

- (BOOL)hasText
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setText:(id)a3
{
  *(unsigned char *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_text, a3);
  id v7 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  identifier = self->_identifier;
  self->_identifier = 0;

  *(unsigned char *)&self->_has &= ~4u;
  image = self->_image;
  self->_image = 0;
}

- (BOOL)hasIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_identifier, a3);
  id v7 = a3;
  *(unsigned char *)&self->_has &= ~2u;
  text = self->_text;
  self->_text = 0;

  *(unsigned char *)&self->_has &= ~4u;
  image = self->_image;
  self->_image = 0;
}

@end