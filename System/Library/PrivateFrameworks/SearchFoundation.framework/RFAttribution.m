@interface RFAttribution
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)index;
- (NSString)locale;
- (NSString)localized_index;
- (NSString)localized_separator;
- (RFAttribution)initWithCoder:(id)a3;
- (RFAttribution)initWithProtobuf:(id)a3;
- (RFTextProperty)subtitle;
- (RFTextProperty)title;
- (RFVisualProperty)image;
- (SFCommandReference)commandReference;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCommandReference:(id)a3;
- (void)setImage:(id)a3;
- (void)setIndex:(id)a3;
- (void)setLocale:(id)a3;
- (void)setLocalized_index:(id)a3;
- (void)setLocalized_separator:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RFAttribution

- (RFAttribution)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)RFAttribution;
  v5 = [(RFAttribution *)&v31 init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      v8 = [v4 title];
      v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFAttribution *)v5 setTitle:v9];
    }
    v10 = [v4 subtitle];

    if (v10)
    {
      v11 = [RFTextProperty alloc];
      v12 = [v4 subtitle];
      v13 = [(RFTextProperty *)v11 initWithProtobuf:v12];
      [(RFAttribution *)v5 setSubtitle:v13];
    }
    v14 = [v4 image];

    if (v14)
    {
      v15 = [RFVisualProperty alloc];
      v16 = [v4 image];
      v17 = [(RFVisualProperty *)v15 initWithProtobuf:v16];
      [(RFAttribution *)v5 setImage:v17];
    }
    if ([v4 index])
    {
      v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "index"));
      [(RFAttribution *)v5 setIndex:v18];
    }
    v19 = objc_msgSend(v4, "localized_index");

    if (v19)
    {
      v20 = objc_msgSend(v4, "localized_index");
      [(RFAttribution *)v5 setLocalized_index:v20];
    }
    v21 = objc_msgSend(v4, "localized_separator");

    if (v21)
    {
      v22 = objc_msgSend(v4, "localized_separator");
      [(RFAttribution *)v5 setLocalized_separator:v22];
    }
    v23 = [v4 locale];

    if (v23)
    {
      v24 = [v4 locale];
      [(RFAttribution *)v5 setLocale:v24];
    }
    v25 = [v4 commandReference];

    if (v25)
    {
      v26 = [SFCommandReference alloc];
      v27 = [v4 commandReference];
      v28 = [(SFCommandReference *)v26 initWithProtobuf:v27];
      [(RFAttribution *)v5 setCommandReference:v28];
    }
    v29 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandReference, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_localized_separator, 0);
  objc_storeStrong((id *)&self->_localized_index, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setCommandReference:(id)a3
{
}

- (SFCommandReference)commandReference
{
  return self->_commandReference;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocalized_separator:(id)a3
{
}

- (NSString)localized_separator
{
  return self->_localized_separator;
}

- (void)setLocalized_index:(id)a3
{
}

- (NSString)localized_index
{
  return self->_localized_index;
}

- (void)setIndex:(id)a3
{
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setImage:(id)a3
{
}

- (RFVisualProperty)image
{
  return self->_image;
}

- (void)setSubtitle:(id)a3
{
}

- (RFTextProperty)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (RFTextProperty)title
{
  return self->_title;
}

- (unint64_t)hash
{
  v3 = [(RFAttribution *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(RFAttribution *)self subtitle];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RFAttribution *)self image];
  uint64_t v8 = [v7 hash];
  v9 = [(RFAttribution *)self index];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(RFAttribution *)self localized_index];
  uint64_t v12 = [v11 hash];
  v13 = [(RFAttribution *)self localized_separator];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(RFAttribution *)self locale];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  v17 = [(RFAttribution *)self commandReference];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RFAttribution *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFAttribution *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      uint64_t v6 = [(RFAttribution *)self title];
      v7 = [(RFAttribution *)v5 title];
      if ((v6 == 0) == (v7 != 0))
      {
        char v11 = 0;
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v8 = [(RFAttribution *)self title];
      if (v8)
      {
        v9 = [(RFAttribution *)self title];
        uint64_t v10 = [(RFAttribution *)v5 title];
        if (![v9 isEqual:v10])
        {
          char v11 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v71 = v10;
        v72 = v9;
      }
      uint64_t v12 = [(RFAttribution *)self subtitle];
      v13 = [(RFAttribution *)v5 subtitle];
      if ((v12 == 0) == (v13 != 0)) {
        goto LABEL_22;
      }
      uint64_t v14 = [(RFAttribution *)self subtitle];
      if (v14)
      {
        v15 = [(RFAttribution *)self subtitle];
        v68 = [(RFAttribution *)v5 subtitle];
        v69 = v15;
        if (![v15 isEqual:v68]) {
          goto LABEL_20;
        }
      }
      v70 = v14;
      uint64_t v16 = [(RFAttribution *)self image];
      v17 = [(RFAttribution *)v5 image];
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14)
        {
LABEL_21:

LABEL_22:
          char v11 = 0;
          if (!v8)
          {
LABEL_25:

            goto LABEL_26;
          }
          goto LABEL_23;
        }
LABEL_20:

        goto LABEL_21;
      }
      v65 = v16;
      v66 = v17;
      v67 = [(RFAttribution *)self image];
      if (v67)
      {
        unint64_t v18 = [(RFAttribution *)self image];
        [(RFAttribution *)v5 image];
        v64 = v63 = v18;
        if (![v18 isEqual:v64])
        {
LABEL_49:

LABEL_50:
          if (!v14) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
      }
      v20 = [(RFAttribution *)self index];
      v21 = [(RFAttribution *)v5 index];
      if ((v20 == 0) == (v21 != 0))
      {

        goto LABEL_48;
      }
      v61 = v20;
      v62 = v21;
      v22 = [(RFAttribution *)self index];
      if (v22)
      {
        v20 = [(RFAttribution *)self index];
        v59 = [(RFAttribution *)v5 index];
        if (!objc_msgSend(v20, "isEqual:")) {
          goto LABEL_46;
        }
      }
      v58 = v20;
      v60 = v22;
      v23 = [(RFAttribution *)self localized_index];
      v24 = [(RFAttribution *)v5 localized_index];
      if ((v23 == 0) == (v24 != 0))
      {

        goto LABEL_45;
      }
      v55 = v23;
      v56 = v24;
      v57 = [(RFAttribution *)self localized_index];
      if (v57)
      {
        v25 = [(RFAttribution *)self localized_index];
        [(RFAttribution *)v5 localized_index];
        v54 = v53 = v25;
        if (![v25 isEqual:v54]) {
          goto LABEL_43;
        }
      }
      v26 = [(RFAttribution *)self localized_separator];
      v27 = [(RFAttribution *)v5 localized_separator];
      if ((v26 == 0) == (v27 != 0))
      {

        if (!v57)
        {
LABEL_44:

LABEL_45:
          v20 = v58;
          if (!v22)
          {
LABEL_47:

LABEL_48:
            uint64_t v14 = v70;
            if (!v67) {
              goto LABEL_50;
            }
            goto LABEL_49;
          }
LABEL_46:

          goto LABEL_47;
        }
LABEL_43:

        goto LABEL_44;
      }
      v51 = v26;
      v52 = v27;
      v28 = [(RFAttribution *)self localized_separator];
      if (v28)
      {
        v29 = [(RFAttribution *)self localized_separator];
        [(RFAttribution *)v5 localized_separator];
        uint64_t v50 = v48 = v29;
        if (!objc_msgSend(v29, "isEqual:"))
        {
          char v11 = 0;
          v34 = (void *)v50;
LABEL_70:

LABEL_71:
          if (v57)
          {
          }
          if (v60)
          {
          }
          if (v67)
          {
          }
          if (v70)
          {
          }
          if (!v8) {
            goto LABEL_25;
          }
LABEL_23:
          uint64_t v10 = v71;
          v9 = v72;
          goto LABEL_24;
        }
        v49 = v28;
      }
      else
      {
        v49 = 0;
      }
      v30 = [(RFAttribution *)self locale];
      objc_super v31 = [(RFAttribution *)v5 locale];
      if ((v30 == 0) == (v31 != 0))
      {

        char v11 = 0;
        goto LABEL_69;
      }
      v46 = v31;
      v47 = v30;
      v32 = [(RFAttribution *)self locale];
      if (v32)
      {
        v33 = [(RFAttribution *)self locale];
        v43 = [(RFAttribution *)v5 locale];
        v44 = v33;
        if (!objc_msgSend(v33, "isEqual:"))
        {
          char v11 = 0;
          v38 = v54;
          v39 = v47;
LABEL_67:
          v54 = v38;

LABEL_68:
LABEL_69:
          v28 = v49;
          v34 = (void *)v50;
          if (!v49) {
            goto LABEL_71;
          }
          goto LABEL_70;
        }
        v45 = v32;
      }
      else
      {
        v45 = 0;
      }
      v35 = [(RFAttribution *)self commandReference];
      v36 = [(RFAttribution *)v5 commandReference];
      if ((v35 == 0) == (v36 != 0))
      {

        char v11 = 0;
      }
      else
      {
        v42 = v36;
        v41 = [(RFAttribution *)self commandReference];
        if (v41)
        {
          v40 = [(RFAttribution *)self commandReference];
          v37 = [(RFAttribution *)v5 commandReference];
          char v11 = objc_msgSend(v40, "isEqual:");
        }
        else
        {

          char v11 = 1;
        }
      }
      v38 = v54;
      v39 = v47;
      v32 = v45;
      if (!v45) {
        goto LABEL_68;
      }
      goto LABEL_67;
    }
    char v11 = 0;
  }
LABEL_27:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(RFAttribution *)self title];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setTitle:v6];

  v7 = [(RFAttribution *)self subtitle];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setSubtitle:v8];

  v9 = [(RFAttribution *)self image];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setImage:v10];

  char v11 = [(RFAttribution *)self index];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setIndex:v12];

  v13 = [(RFAttribution *)self localized_index];
  uint64_t v14 = (void *)[v13 copy];
  objc_msgSend(v4, "setLocalized_index:", v14);

  v15 = [(RFAttribution *)self localized_separator];
  uint64_t v16 = (void *)[v15 copy];
  objc_msgSend(v4, "setLocalized_separator:", v16);

  v17 = [(RFAttribution *)self locale];
  unint64_t v18 = (void *)[v17 copy];
  [v4 setLocale:v18];

  v19 = [(RFAttribution *)self commandReference];
  v20 = (void *)[v19 copy];
  [v4 setCommandReference:v20];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFAttribution alloc] initWithFacade:self];
  v3 = [(_SFPBRFAttribution *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFAttribution alloc] initWithFacade:self];
  v3 = [(_SFPBRFAttribution *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFAttribution alloc] initWithFacade:self];
  v5 = [(_SFPBRFAttribution *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFAttribution alloc] initWithData:v5];
  v7 = [(RFAttribution *)self initWithProtobuf:v6];

  return v7;
}

@end