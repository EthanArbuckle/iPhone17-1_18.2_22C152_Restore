@interface SFMediaOffer
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsEnabled;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)offerIdentifier;
- (NSString)sublabel;
- (SFActionItem)actionItem;
- (SFImage)image;
- (SFMediaOffer)initWithCoder:(id)a3;
- (SFMediaOffer)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionItem:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setOfferIdentifier:(id)a3;
- (void)setSublabel:(id)a3;
@end

@implementation SFMediaOffer

- (SFMediaOffer)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFMediaOffer;
  v5 = [(SFMediaOffer *)&v20 init];
  if (v5)
  {
    v6 = [v4 actionItem];

    if (v6)
    {
      v7 = [SFActionItem alloc];
      v8 = [v4 actionItem];
      v9 = [(SFActionItem *)v7 initWithProtobuf:v8];
      [(SFMediaOffer *)v5 setActionItem:v9];
    }
    v10 = [v4 sublabel];

    if (v10)
    {
      v11 = [v4 sublabel];
      [(SFMediaOffer *)v5 setSublabel:v11];
    }
    v12 = [v4 offerIdentifier];

    if (v12)
    {
      v13 = [v4 offerIdentifier];
      [(SFMediaOffer *)v5 setOfferIdentifier:v13];
    }
    if ([v4 isEnabled]) {
      -[SFMediaOffer setIsEnabled:](v5, "setIsEnabled:", [v4 isEnabled]);
    }
    v14 = [v4 image];

    if (v14)
    {
      v15 = [SFImage alloc];
      v16 = [v4 image];
      v17 = [(SFImage *)v15 initWithProtobuf:v16];
      [(SFMediaOffer *)v5 setImage:v17];
    }
    v18 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_offerIdentifier, 0);
  objc_storeStrong((id *)&self->_sublabel, 0);
  objc_storeStrong((id *)&self->_actionItem, 0);
}

- (void)setImage:(id)a3
{
}

- (SFImage)image
{
  return self->_image;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setOfferIdentifier:(id)a3
{
}

- (NSString)offerIdentifier
{
  return self->_offerIdentifier;
}

- (void)setSublabel:(id)a3
{
}

- (NSString)sublabel
{
  return self->_sublabel;
}

- (void)setActionItem:(id)a3
{
}

- (SFActionItem)actionItem
{
  return self->_actionItem;
}

- (unint64_t)hash
{
  v14.receiver = self;
  v14.super_class = (Class)SFMediaOffer;
  unint64_t v3 = [(SFActionItem *)&v14 hash];
  id v4 = [(SFMediaOffer *)self actionItem];
  uint64_t v5 = [v4 hash];
  v6 = [(SFMediaOffer *)self sublabel];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFMediaOffer *)self offerIdentifier];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(SFMediaOffer *)self isEnabled];
  v11 = [(SFMediaOffer *)self image];
  unint64_t v12 = v10 ^ [v11 hash] ^ v3;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFMediaOffer *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFMediaOffer *)v5 isMemberOfClass:objc_opt_class()])
    {
      v44.receiver = self;
      v44.super_class = (Class)SFMediaOffer;
      if ([(SFActionItem *)&v44 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFMediaOffer *)self actionItem];
        v8 = [(SFMediaOffer *)v6 actionItem];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_40:

          goto LABEL_41;
        }
        uint64_t v9 = [(SFMediaOffer *)self actionItem];
        if (v9)
        {
          uint64_t v10 = [(SFMediaOffer *)self actionItem];
          unint64_t v3 = [(SFMediaOffer *)v6 actionItem];
          if (![v10 isEqual:v3])
          {
            char v11 = 0;
            goto LABEL_38;
          }
          v43 = v10;
        }
        unint64_t v12 = [(SFMediaOffer *)self sublabel];
        v13 = [(SFMediaOffer *)v6 sublabel];
        objc_super v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
          goto LABEL_37;
        }
        v15 = [(SFMediaOffer *)self sublabel];
        if (v15)
        {
          v36 = v9;
          v16 = v14;
          v17 = v12;
          v18 = [(SFMediaOffer *)self sublabel];
          v38 = [(SFMediaOffer *)v6 sublabel];
          v39 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            char v11 = 0;
            unint64_t v12 = v17;
            objc_super v14 = v16;
            uint64_t v9 = v36;
            goto LABEL_35;
          }
          v40 = v3;
          v42 = v15;
          unint64_t v12 = v17;
          objc_super v14 = v16;
          uint64_t v9 = v36;
        }
        else
        {
          v40 = v3;
          v42 = 0;
        }
        v19 = [(SFMediaOffer *)self offerIdentifier];
        objc_super v20 = [(SFMediaOffer *)v6 offerIdentifier];
        if ((v19 == 0) == (v20 != 0))
        {

          char v11 = 0;
          unint64_t v3 = v40;
          v15 = v42;
          if (!v42) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
        v34 = v20;
        v35 = v19;
        [(SFMediaOffer *)self offerIdentifier];
        v37 = v15 = v42;
        if (v37)
        {
          v21 = [(SFMediaOffer *)self offerIdentifier];
          v32 = [(SFMediaOffer *)v6 offerIdentifier];
          v33 = v21;
          int v22 = objc_msgSend(v21, "isEqual:");
          unint64_t v3 = v40;
          if (!v22)
          {
            char v11 = 0;
LABEL_33:

LABEL_34:
            if (!v15)
            {
LABEL_36:

LABEL_37:
              uint64_t v10 = v43;
              if (!v9)
              {
LABEL_39:

                goto LABEL_40;
              }
LABEL_38:

              goto LABEL_39;
            }
LABEL_35:

            goto LABEL_36;
          }
        }
        else
        {
          unint64_t v3 = v40;
        }
        BOOL v23 = [(SFMediaOffer *)self isEnabled];
        if (v23 == [(SFMediaOffer *)v6 isEnabled])
        {
          v24 = [(SFMediaOffer *)self image];
          v25 = [(SFMediaOffer *)v6 image];
          if ((v24 == 0) != (v25 != 0))
          {
            v31 = v25;
            v41 = v24;
            uint64_t v26 = [(SFMediaOffer *)self image];
            if (v26)
            {
              v30 = (void *)v26;
              v29 = [(SFMediaOffer *)self image];
              v27 = [(SFMediaOffer *)v6 image];
              char v11 = [v29 isEqual:v27];
            }
            else
            {

              char v11 = 1;
            }
LABEL_32:
            v15 = v42;
            if (!v37) {
              goto LABEL_34;
            }
            goto LABEL_33;
          }
        }
        char v11 = 0;
        goto LABEL_32;
      }
    }
    char v11 = 0;
  }
LABEL_41:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SFMediaOffer;
  id v4 = [(SFActionItem *)&v14 copyWithZone:a3];
  uint64_t v5 = [(SFMediaOffer *)self actionItem];
  v6 = (void *)[v5 copy];
  [v4 setActionItem:v6];

  uint64_t v7 = [(SFMediaOffer *)self sublabel];
  v8 = (void *)[v7 copy];
  [v4 setSublabel:v8];

  uint64_t v9 = [(SFMediaOffer *)self offerIdentifier];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setOfferIdentifier:v10];

  objc_msgSend(v4, "setIsEnabled:", -[SFMediaOffer isEnabled](self, "isEnabled"));
  char v11 = [(SFMediaOffer *)self image];
  unint64_t v12 = (void *)[v11 copy];
  [v4 setImage:v12];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMediaOffer alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBMediaOffer *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMediaOffer alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBMediaOffer *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBMediaOffer alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBMediaOffer *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFMediaOffer)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBMediaOffer alloc] initWithData:v5];
  uint64_t v7 = [(SFMediaOffer *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasIsEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isEnabled = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end