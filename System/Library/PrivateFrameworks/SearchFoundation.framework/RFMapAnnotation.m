@interface RFMapAnnotation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)title;
- (RFMapAnnotation)initWithCoder:(id)a3;
- (RFMapAnnotation)initWithProtobuf:(id)a3;
- (RFMapPoint)anchor;
- (RFTextProperty)label;
- (RFVisualProperty)content;
- (SFLatLng)coordinate;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setContent:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RFMapAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

- (void)setLabel:(id)a3
{
}

- (RFTextProperty)label
{
  return self->_label;
}

- (void)setAnchor:(id)a3
{
}

- (RFMapPoint)anchor
{
  return self->_anchor;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setContent:(id)a3
{
}

- (RFVisualProperty)content
{
  return self->_content;
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
  v3 = [(RFMapAnnotation *)self coordinate];
  uint64_t v4 = [v3 hash];
  v5 = [(RFMapAnnotation *)self content];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RFMapAnnotation *)self title];
  uint64_t v8 = [v7 hash];
  v9 = [(RFMapAnnotation *)self anchor];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(RFMapAnnotation *)self label];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RFMapAnnotation *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    if ([(RFMapAnnotation *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      uint64_t v6 = [(RFMapAnnotation *)self coordinate];
      v7 = [(RFMapAnnotation *)v5 coordinate];
      if ((v6 == 0) == (v7 != 0))
      {
        char v10 = 0;
LABEL_37:

        goto LABEL_38;
      }
      uint64_t v8 = [(RFMapAnnotation *)self coordinate];
      if (v8)
      {
        v9 = [(RFMapAnnotation *)self coordinate];
        v47 = [(RFMapAnnotation *)v5 coordinate];
        if (!objc_msgSend(v9, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_35;
        }
        v46 = v9;
      }
      v48 = [(RFMapAnnotation *)self content];
      v11 = [(RFMapAnnotation *)v5 content];
      if ((v48 == 0) != (v11 != 0))
      {
        uint64_t v12 = [(RFMapAnnotation *)self content];
        if (v12)
        {
          v13 = (void *)v12;
          v14 = [(RFMapAnnotation *)self content];
          [(RFMapAnnotation *)v5 content];
          v44 = v43 = v14;
          if (!objc_msgSend(v14, "isEqual:"))
          {
            char v10 = 0;
            v18 = v44;
            goto LABEL_32;
          }
          v45 = v13;
        }
        else
        {
          v45 = 0;
        }
        v15 = [(RFMapAnnotation *)self title];
        v16 = [(RFMapAnnotation *)v5 title];
        if ((v15 == 0) != (v16 != 0))
        {
          v41 = v15;
          v42 = v16;
          uint64_t v40 = [(RFMapAnnotation *)self title];
          if (v40)
          {
            v17 = [(RFMapAnnotation *)self title];
            v38 = [(RFMapAnnotation *)v5 title];
            v39 = v17;
            if (!objc_msgSend(v17, "isEqual:"))
            {
              char v10 = 0;
              v13 = v45;
              v18 = v44;
              v19 = (void *)v40;
              goto LABEL_30;
            }
          }
          v20 = [(RFMapAnnotation *)self anchor];
          v21 = [(RFMapAnnotation *)v5 anchor];
          if ((v20 == 0) == (v21 != 0))
          {

            char v10 = 0;
            v13 = v45;
            v18 = v44;
            v19 = (void *)v40;
            if (!v40) {
              goto LABEL_31;
            }
            goto LABEL_30;
          }
          v36 = v21;
          v37 = v20;
          v22 = [(RFMapAnnotation *)self anchor];
          v18 = v44;
          if (v22)
          {
            v23 = [(RFMapAnnotation *)self anchor];
            v33 = [(RFMapAnnotation *)v5 anchor];
            v34 = v23;
            if (![v23 isEqual:v33])
            {
              char v10 = 0;
              goto LABEL_48;
            }
            v35 = v22;
          }
          else
          {
            v35 = 0;
          }
          v25 = [(RFMapAnnotation *)self label];
          v26 = [(RFMapAnnotation *)v5 label];
          if ((v25 == 0) == (v26 != 0))
          {

            char v10 = 0;
            v18 = v44;
            v22 = v35;
            if (!v35)
            {
LABEL_49:

              v19 = (void *)v40;
              v13 = v45;
              if (!v40)
              {
LABEL_31:

                if (!v13)
                {
LABEL_33:

LABEL_34:
                  v9 = v46;
                  if (!v8)
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
LABEL_30:

              goto LABEL_31;
            }
          }
          else
          {
            v31 = v26;
            v32 = v25;
            uint64_t v27 = [(RFMapAnnotation *)self label];
            v18 = v44;
            v22 = v35;
            if (v27)
            {
              v30 = (void *)v27;
              v29 = [(RFMapAnnotation *)self label];
              v28 = [(RFMapAnnotation *)v5 label];
              char v10 = [v29 isEqual:v28];

              if (!v35) {
                goto LABEL_49;
              }
            }
            else
            {

              char v10 = 1;
              if (!v35) {
                goto LABEL_49;
              }
            }
          }
LABEL_48:

          goto LABEL_49;
        }

        if (v45)
        {
        }
      }

      char v10 = 0;
      goto LABEL_34;
    }
    char v10 = 0;
  }
LABEL_38:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(RFMapAnnotation *)self coordinate];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setCoordinate:v6];

  v7 = [(RFMapAnnotation *)self content];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setContent:v8];

  v9 = [(RFMapAnnotation *)self title];
  char v10 = (void *)[v9 copy];
  [v4 setTitle:v10];

  v11 = [(RFMapAnnotation *)self anchor];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setAnchor:v12];

  v13 = [(RFMapAnnotation *)self label];
  v14 = (void *)[v13 copy];
  [v4 setLabel:v14];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFMapAnnotation alloc] initWithFacade:self];
  v3 = [(_SFPBRFMapAnnotation *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFMapAnnotation alloc] initWithFacade:self];
  v3 = [(_SFPBRFMapAnnotation *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFMapAnnotation alloc] initWithFacade:self];
  v5 = [(_SFPBRFMapAnnotation *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFMapAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFMapAnnotation alloc] initWithData:v5];
  v7 = [(RFMapAnnotation *)self initWithProtobuf:v6];

  return v7;
}

- (RFMapAnnotation)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)RFMapAnnotation;
  v5 = [(RFMapAnnotation *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 coordinate];

    if (v6)
    {
      v7 = [SFLatLng alloc];
      uint64_t v8 = [v4 coordinate];
      v9 = [(SFLatLng *)v7 initWithProtobuf:v8];
      [(RFMapAnnotation *)v5 setCoordinate:v9];
    }
    char v10 = [v4 content];

    if (v10)
    {
      v11 = [RFVisualProperty alloc];
      uint64_t v12 = [v4 content];
      v13 = [(RFVisualProperty *)v11 initWithProtobuf:v12];
      [(RFMapAnnotation *)v5 setContent:v13];
    }
    v14 = [v4 title];

    if (v14)
    {
      v15 = [v4 title];
      [(RFMapAnnotation *)v5 setTitle:v15];
    }
    v16 = [v4 anchor];

    if (v16)
    {
      v17 = [RFMapPoint alloc];
      v18 = [v4 anchor];
      v19 = [(RFMapPoint *)v17 initWithProtobuf:v18];
      [(RFMapAnnotation *)v5 setAnchor:v19];
    }
    v20 = [v4 label];

    if (v20)
    {
      v21 = [RFTextProperty alloc];
      v22 = [v4 label];
      v23 = [(RFTextProperty *)v21 initWithProtobuf:v22];
      [(RFMapAnnotation *)v5 setLabel:v23];
    }
    v24 = v5;
  }

  return v5;
}

@end