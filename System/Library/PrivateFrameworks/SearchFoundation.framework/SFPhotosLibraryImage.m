@interface SFPhotosLibraryImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsSyndicated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSyndicated;
- (NSArray)peopleInPhoto;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)applicationBundleIdentifier;
- (NSString)photoIdentifier;
- (SFPhotosLibraryImage)initWithCoder:(id)a3;
- (SFPhotosLibraryImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setIsSyndicated:(BOOL)a3;
- (void)setPeopleInPhoto:(id)a3;
- (void)setPhotoIdentifier:(id)a3;
@end

@implementation SFPhotosLibraryImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_peopleInPhoto, 0);
  objc_storeStrong((id *)&self->_photoIdentifier, 0);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setPeopleInPhoto:(id)a3
{
}

- (NSArray)peopleInPhoto
{
  return self->_peopleInPhoto;
}

- (BOOL)isSyndicated
{
  return self->_isSyndicated;
}

- (void)setPhotoIdentifier:(id)a3
{
}

- (NSString)photoIdentifier
{
  return self->_photoIdentifier;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)SFPhotosLibraryImage;
  unint64_t v3 = [(SFImage *)&v12 hash];
  v4 = [(SFPhotosLibraryImage *)self photoIdentifier];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v5 ^ [(SFPhotosLibraryImage *)self isSyndicated];
  v7 = [(SFPhotosLibraryImage *)self peopleInPhoto];
  uint64_t v8 = v6 ^ [v7 hash];
  v9 = [(SFPhotosLibraryImage *)self applicationBundleIdentifier];
  unint64_t v10 = v8 ^ [v9 hash] ^ v3;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SFPhotosLibraryImage *)a3;
  if (self == v6)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFPhotosLibraryImage *)v6 isMemberOfClass:objc_opt_class()])
    {
      v32.receiver = self;
      v32.super_class = (Class)SFPhotosLibraryImage;
      if ([(SFImage *)&v32 isEqual:v6])
      {
        v7 = v6;
        uint64_t v8 = [(SFPhotosLibraryImage *)self photoIdentifier];
        v9 = [(SFPhotosLibraryImage *)v7 photoIdentifier];
        if ((v8 == 0) == (v9 != 0))
        {
          char v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        unint64_t v10 = [(SFPhotosLibraryImage *)self photoIdentifier];
        if (v10)
        {
          unint64_t v3 = [(SFPhotosLibraryImage *)self photoIdentifier];
          v4 = [(SFPhotosLibraryImage *)v7 photoIdentifier];
          if (![v3 isEqual:v4])
          {
            char v11 = 0;
            goto LABEL_18;
          }
        }
        BOOL v12 = [(SFPhotosLibraryImage *)self isSyndicated];
        if (v12 == [(SFPhotosLibraryImage *)v7 isSyndicated])
        {
          v13 = [(SFPhotosLibraryImage *)self peopleInPhoto];
          v14 = [(SFPhotosLibraryImage *)v7 peopleInPhoto];
          if ((v13 == 0) != (v14 != 0))
          {
            v31 = v14;
            uint64_t v30 = [(SFPhotosLibraryImage *)self peopleInPhoto];
            if (v30)
            {
              v15 = [(SFPhotosLibraryImage *)self peopleInPhoto];
              v28 = [(SFPhotosLibraryImage *)v7 peopleInPhoto];
              v29 = v15;
              if (!objc_msgSend(v15, "isEqual:"))
              {
                char v11 = 0;
                v20 = v13;
                v23 = (void *)v30;
                goto LABEL_30;
              }
              v27 = v3;
            }
            else
            {
              v27 = v3;
            }
            v17 = [(SFPhotosLibraryImage *)self applicationBundleIdentifier];
            v18 = [(SFPhotosLibraryImage *)v7 applicationBundleIdentifier];
            if ((v17 == 0) == (v18 != 0))
            {

              char v11 = 0;
              v20 = v13;
            }
            else
            {
              v25 = v17;
              v26 = v18;
              uint64_t v19 = [(SFPhotosLibraryImage *)self applicationBundleIdentifier];
              v20 = v13;
              if (v19)
              {
                v21 = (void *)v19;
                v24 = [(SFPhotosLibraryImage *)self applicationBundleIdentifier];
                v22 = [(SFPhotosLibraryImage *)v7 applicationBundleIdentifier];
                char v11 = objc_msgSend(v24, "isEqual:");
              }
              else
              {

                char v11 = 1;
              }
            }
            v23 = (void *)v30;
            unint64_t v3 = v27;
            if (!v30)
            {
LABEL_31:

              if (!v10) {
                goto LABEL_19;
              }
              goto LABEL_18;
            }
LABEL_30:

            goto LABEL_31;
          }
        }
        char v11 = 0;
        if (!v10)
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_18:

        goto LABEL_19;
      }
    }
    char v11 = 0;
  }
LABEL_21:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFPhotosLibraryImage;
  id v4 = [(SFImage *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFPhotosLibraryImage *)self photoIdentifier];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPhotoIdentifier:v6];

  objc_msgSend(v4, "setIsSyndicated:", -[SFPhotosLibraryImage isSyndicated](self, "isSyndicated"));
  v7 = [(SFPhotosLibraryImage *)self peopleInPhoto];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setPeopleInPhoto:v8];

  v9 = [(SFPhotosLibraryImage *)self applicationBundleIdentifier];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setApplicationBundleIdentifier:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPhotosLibraryImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPhotosLibraryImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPhotosLibraryImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPhotosLibraryImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBImage alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFPhotosLibraryImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBImage alloc] initWithData:v5];
  v9.receiver = self;
  v9.super_class = (Class)SFPhotosLibraryImage;
  v7 = [(SFImage *)&v9 initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasIsSyndicated
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsSyndicated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isSyndicated = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPhotosLibraryImage)initWithProtobuf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFPhotosLibraryImage;
  uint64_t v5 = [(SFPhotosLibraryImage *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 photoIdentifier];

    if (v6)
    {
      v7 = [v4 photoIdentifier];
      [(SFPhotosLibraryImage *)v5 setPhotoIdentifier:v7];
    }
    if ([v4 isSyndicated]) {
      -[SFPhotosLibraryImage setIsSyndicated:](v5, "setIsSyndicated:", [v4 isSyndicated]);
    }
    uint64_t v8 = [v4 peopleInPhotos];
    if (v8) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v9 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v10 = objc_msgSend(v4, "peopleInPhotos", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [[SFPerson alloc] initWithProtobuf:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v12);
    }

    [(SFPhotosLibraryImage *)v5 setPeopleInPhoto:v9];
    v16 = [v4 applicationBundleIdentifier];

    if (v16)
    {
      v17 = [v4 applicationBundleIdentifier];
      [(SFPhotosLibraryImage *)v5 setApplicationBundleIdentifier:v17];
    }
    v18 = v5;
  }
  return v5;
}

@end