@interface SFMediaArtworkImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMediaEntityType;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)persistentID;
- (NSString)spotlightIdentifier;
- (NSString)universalLibraryID;
- (SFMediaArtworkImage)initWithCoder:(id)a3;
- (SFMediaArtworkImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)mediaEntityType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMediaEntityType:(int)a3;
- (void)setPersistentID:(id)a3;
- (void)setSpotlightIdentifier:(id)a3;
- (void)setUniversalLibraryID:(id)a3;
@end

@implementation SFMediaArtworkImage

- (SFMediaArtworkImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFMediaArtworkImage;
  v5 = [(SFMediaArtworkImage *)&v14 init];
  if (v5)
  {
    v6 = [v4 persistentID];

    if (v6)
    {
      v7 = [v4 persistentID];
      [(SFMediaArtworkImage *)v5 setPersistentID:v7];
    }
    v8 = [v4 spotlightIdentifier];

    if (v8)
    {
      v9 = [v4 spotlightIdentifier];
      [(SFMediaArtworkImage *)v5 setSpotlightIdentifier:v9];
    }
    if ([v4 mediaEntityType]) {
      -[SFMediaArtworkImage setMediaEntityType:](v5, "setMediaEntityType:", [v4 mediaEntityType]);
    }
    v10 = [v4 universalLibraryID];

    if (v10)
    {
      v11 = [v4 universalLibraryID];
      [(SFMediaArtworkImage *)v5 setUniversalLibraryID:v11];
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalLibraryID, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

- (void)setUniversalLibraryID:(id)a3
{
}

- (NSString)universalLibraryID
{
  return self->_universalLibraryID;
}

- (int)mediaEntityType
{
  return self->_mediaEntityType;
}

- (void)setSpotlightIdentifier:(id)a3
{
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (void)setPersistentID:(id)a3
{
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)SFMediaArtworkImage;
  unint64_t v3 = [(SFImage *)&v12 hash];
  id v4 = [(SFMediaArtworkImage *)self persistentID];
  uint64_t v5 = [v4 hash];
  v6 = [(SFMediaArtworkImage *)self spotlightIdentifier];
  uint64_t v7 = v5 ^ [v6 hash];
  uint64_t v8 = v7 ^ [(SFMediaArtworkImage *)self mediaEntityType];
  v9 = [(SFMediaArtworkImage *)self universalLibraryID];
  unint64_t v10 = v8 ^ [v9 hash] ^ v3;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFMediaArtworkImage *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFMediaArtworkImage *)v5 isMemberOfClass:objc_opt_class()])
    {
      v32.receiver = self;
      v32.super_class = (Class)SFMediaArtworkImage;
      if ([(SFImage *)&v32 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFMediaArtworkImage *)self persistentID];
        uint64_t v8 = [(SFMediaArtworkImage *)v6 persistentID];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        v9 = [(SFMediaArtworkImage *)self persistentID];
        if (v9)
        {
          unint64_t v10 = [(SFMediaArtworkImage *)self persistentID];
          unint64_t v3 = [(SFMediaArtworkImage *)v6 persistentID];
          if (![v10 isEqual:v3])
          {
            char v11 = 0;
            goto LABEL_29;
          }
          v31 = v10;
        }
        objc_super v12 = [(SFMediaArtworkImage *)self spotlightIdentifier];
        v13 = [(SFMediaArtworkImage *)v6 spotlightIdentifier];
        objc_super v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
          goto LABEL_28;
        }
        v15 = [(SFMediaArtworkImage *)self spotlightIdentifier];
        if (v15)
        {
          v26 = v3;
          v16 = [(SFMediaArtworkImage *)self spotlightIdentifier];
          v29 = [(SFMediaArtworkImage *)v6 spotlightIdentifier];
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            char v11 = 0;
            unint64_t v3 = v26;
            goto LABEL_26;
          }
          v28 = v15;
          unint64_t v3 = v26;
        }
        else
        {
          v28 = 0;
        }
        int v17 = [(SFMediaArtworkImage *)self mediaEntityType];
        if (v17 == [(SFMediaArtworkImage *)v6 mediaEntityType])
        {
          v18 = [(SFMediaArtworkImage *)self universalLibraryID];
          v19 = [(SFMediaArtworkImage *)v6 universalLibraryID];
          if ((v18 == 0) != (v19 != 0))
          {
            v25 = v19;
            v27 = v18;
            uint64_t v20 = [(SFMediaArtworkImage *)self universalLibraryID];
            if (v20)
            {
              v24 = (void *)v20;
              v23 = [(SFMediaArtworkImage *)self universalLibraryID];
              v21 = [(SFMediaArtworkImage *)v6 universalLibraryID];
              char v11 = [v23 isEqual:v21];
            }
            else
            {

              char v11 = 1;
            }
LABEL_25:
            v15 = v28;
            if (!v28)
            {
LABEL_27:

LABEL_28:
              unint64_t v10 = v31;
              if (!v9)
              {
LABEL_30:

                goto LABEL_31;
              }
LABEL_29:

              goto LABEL_30;
            }
LABEL_26:

            goto LABEL_27;
          }
        }
        char v11 = 0;
        goto LABEL_25;
      }
    }
    char v11 = 0;
  }
LABEL_32:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFMediaArtworkImage;
  id v4 = [(SFImage *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFMediaArtworkImage *)self persistentID];
  v6 = (void *)[v5 copy];
  [v4 setPersistentID:v6];

  uint64_t v7 = [(SFMediaArtworkImage *)self spotlightIdentifier];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setSpotlightIdentifier:v8];

  objc_msgSend(v4, "setMediaEntityType:", -[SFMediaArtworkImage mediaEntityType](self, "mediaEntityType"));
  v9 = [(SFMediaArtworkImage *)self universalLibraryID];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setUniversalLibraryID:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMediaArtworkImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBMediaArtworkImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMediaArtworkImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBMediaArtworkImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBImage alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFMediaArtworkImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBImage alloc] initWithData:v5];
  v9.receiver = self;
  v9.super_class = (Class)SFMediaArtworkImage;
  uint64_t v7 = [(SFImage *)&v9 initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasMediaEntityType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMediaEntityType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mediaEntityType = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end