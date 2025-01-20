@interface SFContactImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasThreeDTouchEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)threeDTouchEnabled;
- (NSArray)contactIdentifiers;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)appIconBadgeBundleIdentifier;
- (SFContactImage)initWithCoder:(id)a3;
- (SFContactImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppIconBadgeBundleIdentifier:(id)a3;
- (void)setContactIdentifiers:(id)a3;
- (void)setThreeDTouchEnabled:(BOOL)a3;
@end

@implementation SFContactImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconBadgeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
}

- (void)setAppIconBadgeBundleIdentifier:(id)a3
{
}

- (NSString)appIconBadgeBundleIdentifier
{
  return self->_appIconBadgeBundleIdentifier;
}

- (BOOL)threeDTouchEnabled
{
  return self->_threeDTouchEnabled;
}

- (void)setContactIdentifiers:(id)a3
{
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)SFContactImage;
  unint64_t v3 = [(SFImage *)&v10 hash];
  v4 = [(SFContactImage *)self contactIdentifiers];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v5 ^ [(SFContactImage *)self threeDTouchEnabled];
  v7 = [(SFContactImage *)self appIconBadgeBundleIdentifier];
  unint64_t v8 = v6 ^ [v7 hash] ^ v3;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFContactImage *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFContactImage *)v5 isMemberOfClass:objc_opt_class()])
    {
      v22.receiver = self;
      v22.super_class = (Class)SFContactImage;
      if ([(SFImage *)&v22 isEqual:v5])
      {
        uint64_t v6 = v5;
        v7 = [(SFContactImage *)self contactIdentifiers];
        unint64_t v8 = [(SFContactImage *)v6 contactIdentifiers];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_21:

          goto LABEL_22;
        }
        v9 = [(SFContactImage *)self contactIdentifiers];
        if (v9)
        {
          objc_super v10 = [(SFContactImage *)self contactIdentifiers];
          unint64_t v3 = [(SFContactImage *)v6 contactIdentifiers];
          if (![v10 isEqual:v3])
          {
            char v11 = 0;
            goto LABEL_19;
          }
          v21 = v10;
        }
        BOOL v12 = [(SFContactImage *)self threeDTouchEnabled];
        if (v12 == [(SFContactImage *)v6 threeDTouchEnabled])
        {
          v13 = [(SFContactImage *)self appIconBadgeBundleIdentifier];
          v14 = [(SFContactImage *)v6 appIconBadgeBundleIdentifier];
          v15 = v14;
          if ((v13 == 0) != (v14 != 0))
          {
            uint64_t v16 = [(SFContactImage *)self appIconBadgeBundleIdentifier];
            if (v16)
            {
              v17 = (void *)v16;
              v20 = [(SFContactImage *)self appIconBadgeBundleIdentifier];
              v19 = [(SFContactImage *)v6 appIconBadgeBundleIdentifier];
              char v11 = [v20 isEqual:v19];
            }
            else
            {

              char v11 = 1;
            }
LABEL_18:
            objc_super v10 = v21;
            if (!v9)
            {
LABEL_20:

              goto LABEL_21;
            }
LABEL_19:

            goto LABEL_20;
          }
        }
        char v11 = 0;
        goto LABEL_18;
      }
    }
    char v11 = 0;
  }
LABEL_22:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFContactImage;
  id v4 = [(SFImage *)&v10 copyWithZone:a3];
  uint64_t v5 = [(SFContactImage *)self contactIdentifiers];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setContactIdentifiers:v6];

  objc_msgSend(v4, "setThreeDTouchEnabled:", -[SFContactImage threeDTouchEnabled](self, "threeDTouchEnabled"));
  v7 = [(SFContactImage *)self appIconBadgeBundleIdentifier];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setAppIconBadgeBundleIdentifier:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBContactImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBContactImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBContactImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBContactImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBImage alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFContactImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBImage alloc] initWithData:v5];
  v9.receiver = self;
  v9.super_class = (Class)SFContactImage;
  v7 = [(SFImage *)&v9 initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasThreeDTouchEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_threeDTouchEnabled = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFContactImage)initWithProtobuf:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFContactImage;
  uint64_t v5 = [(SFContactImage *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 contactIdentifiers];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unint64_t v8 = objc_msgSend(v4, "contactIdentifiers", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          if (*(void *)(*((void *)&v17 + 1) + 8 * i)) {
            objc_msgSend(v7, "addObject:");
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }

    [(SFContactImage *)v5 setContactIdentifiers:v7];
    if ([v4 threeDTouchEnabled]) {
      -[SFContactImage setThreeDTouchEnabled:](v5, "setThreeDTouchEnabled:", [v4 threeDTouchEnabled]);
    }
    v13 = [v4 appIconBadgeBundleIdentifier];

    if (v13)
    {
      v14 = [v4 appIconBadgeBundleIdentifier];
      [(SFContactImage *)v5 setAppIconBadgeBundleIdentifier:v14];
    }
    v15 = v5;
  }
  return v5;
}

@end