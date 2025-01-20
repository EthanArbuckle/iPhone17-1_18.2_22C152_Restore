@interface RFAvatarImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasImage_style;
- (BOOL)isEqual:(id)a3;
- (NSArray)contact_ids;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFAvatarImage)initWithCoder:(id)a3;
- (RFAvatarImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)image_style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContact_ids:(id)a3;
- (void)setImage_style:(int)a3;
@end

@implementation RFAvatarImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (int)image_style
{
  return self->_image_style;
}

- (void)setContact_ids:(id)a3
{
}

- (NSArray)contact_ids
{
  return self->_contact_ids;
}

- (unint64_t)hash
{
  v3 = [(RFAvatarImage *)self contact_ids];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(RFAvatarImage *)self image_style];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (RFAvatarImage *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(RFAvatarImage *)v6 isMemberOfClass:objc_opt_class()])
    {
      v7 = v6;
      v8 = [(RFAvatarImage *)self contact_ids];
      v9 = [(RFAvatarImage *)v7 contact_ids];
      if ((v8 == 0) == (v9 != 0))
      {
        BOOL v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v10 = [(RFAvatarImage *)self contact_ids];
      if (!v10
        || ([(RFAvatarImage *)self contact_ids],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(RFAvatarImage *)v7 contact_ids],
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        int v12 = [(RFAvatarImage *)self image_style];
        BOOL v11 = v12 == [(RFAvatarImage *)v7 image_style];
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        BOOL v11 = 0;
      }

      goto LABEL_12;
    }
    BOOL v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = [(RFAvatarImage *)self contact_ids];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setContact_ids:", v6);

  objc_msgSend(v4, "setImage_style:", -[RFAvatarImage image_style](self, "image_style"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFAvatarImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFAvatarImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFAvatarImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFAvatarImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBRFAvatarImage alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBRFAvatarImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFAvatarImage)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBRFAvatarImage alloc] initWithData:v5];
  v7 = [(RFAvatarImage *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasImage_style
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setImage_style:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_image_style = a3;
}

- (RFAvatarImage)initWithProtobuf:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RFAvatarImage;
  unint64_t v5 = [(RFAvatarImage *)&v19 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "contact_ids");
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = objc_msgSend(v4, "contact_ids", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (*(void *)(*((void *)&v15 + 1) + 8 * i)) {
            objc_msgSend(v7, "addObject:");
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }

    [(RFAvatarImage *)v5 setContact_ids:v7];
    if (objc_msgSend(v4, "image_style")) {
      -[RFAvatarImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    }
    v13 = v5;
  }
  return v5;
}

@end