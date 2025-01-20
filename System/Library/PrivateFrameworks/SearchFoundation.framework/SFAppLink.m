@interface SFAppLink
+ (BOOL)supportsSecureCoding;
- (BOOL)hasImageAlign;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)title;
- (SFAppLink)initWithCoder:(id)a3;
- (SFAppLink)initWithProtobuf:(id)a3;
- (SFImage)image;
- (SFPunchout)appPunchout;
- (id)copyWithZone:(_NSZone *)a3;
- (int)imageAlign;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppPunchout:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageAlign:(int)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFAppLink

- (SFAppLink)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFAppLink;
  v5 = [(SFAppLink *)&v18 init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(SFAppLink *)v5 setTitle:v7];
    }
    v8 = [v4 appPunchout];

    if (v8)
    {
      v9 = [SFPunchout alloc];
      v10 = [v4 appPunchout];
      v11 = [(SFPunchout *)v9 initWithProtobuf:v10];
      [(SFAppLink *)v5 setAppPunchout:v11];
    }
    v12 = [v4 image];

    if (v12)
    {
      v13 = [SFImage alloc];
      v14 = [v4 image];
      v15 = [(SFImage *)v13 initWithProtobuf:v14];
      [(SFAppLink *)v5 setImage:v15];
    }
    if ([v4 imageAlign]) {
      -[SFAppLink setImageAlign:](v5, "setImageAlign:", [v4 imageAlign]);
    }
    v16 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_appPunchout, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (int)imageAlign
{
  return self->_imageAlign;
}

- (void)setImage:(id)a3
{
}

- (SFImage)image
{
  return self->_image;
}

- (void)setAppPunchout:(id)a3
{
}

- (SFPunchout)appPunchout
{
  return self->_appPunchout;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)hash
{
  v3 = [(SFAppLink *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(SFAppLink *)self appPunchout];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFAppLink *)self image];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(SFAppLink *)self imageAlign];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFAppLink *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFAppLink *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFAppLink *)self title];
      uint64_t v8 = [(SFAppLink *)v6 title];
      if ((v7 == 0) == (v8 != 0))
      {
        BOOL v11 = 0;
LABEL_32:

        goto LABEL_33;
      }
      unint64_t v9 = [(SFAppLink *)self title];
      if (v9)
      {
        v10 = [(SFAppLink *)self title];
        v3 = [(SFAppLink *)v6 title];
        if (![v10 isEqual:v3])
        {
          BOOL v11 = 0;
          goto LABEL_30;
        }
        v32 = v10;
      }
      v12 = [(SFAppLink *)self appPunchout];
      v13 = [(SFAppLink *)v6 appPunchout];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        BOOL v11 = 0;
        goto LABEL_29;
      }
      v15 = [(SFAppLink *)self appPunchout];
      if (v15)
      {
        v26 = v12;
        v16 = [(SFAppLink *)self appPunchout];
        v29 = [(SFAppLink *)v6 appPunchout];
        v30 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          BOOL v11 = 0;
          v12 = v26;
          goto LABEL_27;
        }
        v28 = v3;
        v31 = v15;
        v12 = v26;
      }
      else
      {
        v28 = v3;
        v31 = 0;
      }
      v17 = [(SFAppLink *)self image];
      objc_super v18 = [(SFAppLink *)v6 image];
      if ((v17 == 0) == (v18 != 0))
      {

        BOOL v11 = 0;
        v15 = v31;
        v3 = v28;
        if (!v31) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      v24 = v18;
      v25 = v17;
      [(SFAppLink *)self image];
      v27 = v15 = v31;
      if (!v27
        || ([(SFAppLink *)self image],
            v19 = objc_claimAutoreleasedReturnValue(),
            [(SFAppLink *)v6 image],
            v22 = objc_claimAutoreleasedReturnValue(),
            v23 = v19,
            objc_msgSend(v19, "isEqual:")))
      {
        v3 = v28;
        int v20 = [(SFAppLink *)self imageAlign];
        BOOL v11 = v20 == [(SFAppLink *)v6 imageAlign];
        if (!v27) {
          goto LABEL_26;
        }
      }
      else
      {
        BOOL v11 = 0;
        v3 = v28;
      }

LABEL_26:
      if (!v31)
      {
LABEL_28:

LABEL_29:
        v10 = v32;
        if (!v9)
        {
LABEL_31:

          goto LABEL_32;
        }
LABEL_30:

        goto LABEL_31;
      }
LABEL_27:

      goto LABEL_28;
    }
    BOOL v11 = 0;
  }
LABEL_33:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFAppLink *)self title];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setTitle:v6];

  v7 = [(SFAppLink *)self appPunchout];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setAppPunchout:v8];

  unint64_t v9 = [(SFAppLink *)self image];
  v10 = (void *)[v9 copy];
  [v4 setImage:v10];

  objc_msgSend(v4, "setImageAlign:", -[SFAppLink imageAlign](self, "imageAlign"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBAppLink alloc] initWithFacade:self];
  v3 = [(_SFPBAppLink *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBAppLink alloc] initWithFacade:self];
  v3 = [(_SFPBAppLink *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBAppLink alloc] initWithFacade:self];
  v5 = [(_SFPBAppLink *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFAppLink)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBAppLink alloc] initWithData:v5];
  v7 = [(SFAppLink *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasImageAlign
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setImageAlign:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_imageAlign = a3;
}

@end