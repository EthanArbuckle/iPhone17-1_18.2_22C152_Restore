@interface SFToggleButtonConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)toggledTitle;
- (NSString)untoggledTitle;
- (SFImage)toggledImage;
- (SFImage)untoggledImage;
- (SFToggleButtonConfiguration)initWithCoder:(id)a3;
- (SFToggleButtonConfiguration)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setToggledImage:(id)a3;
- (void)setToggledTitle:(id)a3;
- (void)setUntoggledImage:(id)a3;
- (void)setUntoggledTitle:(id)a3;
@end

@implementation SFToggleButtonConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggledImage, 0);
  objc_storeStrong((id *)&self->_untoggledImage, 0);
  objc_storeStrong((id *)&self->_toggledTitle, 0);
  objc_storeStrong((id *)&self->_untoggledTitle, 0);
}

- (void)setToggledImage:(id)a3
{
}

- (SFImage)toggledImage
{
  return self->_toggledImage;
}

- (void)setUntoggledImage:(id)a3
{
}

- (SFImage)untoggledImage
{
  return self->_untoggledImage;
}

- (void)setToggledTitle:(id)a3
{
}

- (NSString)toggledTitle
{
  return self->_toggledTitle;
}

- (void)setUntoggledTitle:(id)a3
{
}

- (NSString)untoggledTitle
{
  return self->_untoggledTitle;
}

- (unint64_t)hash
{
  v3 = [(SFToggleButtonConfiguration *)self untoggledTitle];
  uint64_t v4 = [v3 hash];
  v5 = [(SFToggleButtonConfiguration *)self toggledTitle];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFToggleButtonConfiguration *)self untoggledImage];
  uint64_t v8 = [v7 hash];
  v9 = [(SFToggleButtonConfiguration *)self toggledImage];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFToggleButtonConfiguration *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFToggleButtonConfiguration *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFToggleButtonConfiguration *)self untoggledTitle];
      uint64_t v8 = [(SFToggleButtonConfiguration *)v6 untoggledTitle];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_37:

        goto LABEL_38;
      }
      v9 = [(SFToggleButtonConfiguration *)self untoggledTitle];
      if (v9)
      {
        unint64_t v10 = [(SFToggleButtonConfiguration *)self untoggledTitle];
        v3 = [(SFToggleButtonConfiguration *)v6 untoggledTitle];
        if (![v10 isEqual:v3])
        {
          char v11 = 0;
          goto LABEL_35;
        }
        v41 = v10;
      }
      v12 = [(SFToggleButtonConfiguration *)self toggledTitle];
      v13 = [(SFToggleButtonConfiguration *)v6 toggledTitle];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_34;
      }
      uint64_t v15 = [(SFToggleButtonConfiguration *)self toggledTitle];
      v40 = (void *)v15;
      if (v15)
      {
        v16 = (void *)v15;
        v35 = v14;
        v17 = v12;
        v18 = [(SFToggleButtonConfiguration *)self toggledTitle];
        v37 = [(SFToggleButtonConfiguration *)v6 toggledTitle];
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
      v19 = [(SFToggleButtonConfiguration *)self untoggledImage];
      v20 = [(SFToggleButtonConfiguration *)v6 untoggledImage];
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
      [(SFToggleButtonConfiguration *)self untoggledImage];
      v36 = v16 = v40;
      if (!v36
        || ([(SFToggleButtonConfiguration *)self untoggledImage],
            v21 = objc_claimAutoreleasedReturnValue(),
            [(SFToggleButtonConfiguration *)v6 untoggledImage],
            v31 = objc_claimAutoreleasedReturnValue(),
            v32 = v21,
            objc_msgSend(v21, "isEqual:")))
      {
        v22 = [(SFToggleButtonConfiguration *)self toggledImage];
        v23 = [(SFToggleButtonConfiguration *)v6 toggledImage];
        if ((v22 == 0) == (v23 != 0))
        {

          char v11 = 0;
          v16 = v40;
        }
        else
        {
          v29 = v22;
          v30 = v23;
          uint64_t v24 = [(SFToggleButtonConfiguration *)self toggledImage];
          v16 = v40;
          if (v24)
          {
            v28 = (void *)v24;
            v27 = [(SFToggleButtonConfiguration *)self toggledImage];
            v25 = [(SFToggleButtonConfiguration *)v6 toggledImage];
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
  v5 = [(SFToggleButtonConfiguration *)self untoggledTitle];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setUntoggledTitle:v6];

  v7 = [(SFToggleButtonConfiguration *)self toggledTitle];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setToggledTitle:v8];

  v9 = [(SFToggleButtonConfiguration *)self untoggledImage];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setUntoggledImage:v10];

  char v11 = [(SFToggleButtonConfiguration *)self toggledImage];
  v12 = (void *)[v11 copy];
  [v4 setToggledImage:v12];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBToggleButtonConfiguration alloc] initWithFacade:self];
  v3 = [(_SFPBToggleButtonConfiguration *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBToggleButtonConfiguration alloc] initWithFacade:self];
  v3 = [(_SFPBToggleButtonConfiguration *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBToggleButtonConfiguration alloc] initWithFacade:self];
  v5 = [(_SFPBToggleButtonConfiguration *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFToggleButtonConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBToggleButtonConfiguration alloc] initWithData:v5];
  v7 = [(SFToggleButtonConfiguration *)self initWithProtobuf:v6];

  return v7;
}

- (SFToggleButtonConfiguration)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFToggleButtonConfiguration;
  v5 = [(SFToggleButtonConfiguration *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 untoggledTitle];

    if (v6)
    {
      v7 = [v4 untoggledTitle];
      [(SFToggleButtonConfiguration *)v5 setUntoggledTitle:v7];
    }
    uint64_t v8 = [v4 toggledTitle];

    if (v8)
    {
      v9 = [v4 toggledTitle];
      [(SFToggleButtonConfiguration *)v5 setToggledTitle:v9];
    }
    unint64_t v10 = [v4 untoggledImage];

    if (v10)
    {
      char v11 = [SFImage alloc];
      v12 = [v4 untoggledImage];
      v13 = [(SFImage *)v11 initWithProtobuf:v12];
      [(SFToggleButtonConfiguration *)v5 setUntoggledImage:v13];
    }
    v14 = [v4 toggledImage];

    if (v14)
    {
      uint64_t v15 = [SFImage alloc];
      v16 = [v4 toggledImage];
      v17 = [(SFImage *)v15 initWithProtobuf:v16];
      [(SFToggleButtonConfiguration *)v5 setToggledImage:v17];
    }
    v18 = v5;
  }

  return v5;
}

@end