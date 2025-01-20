@interface SFRejectPeopleInPhotoCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)rejectedPeople;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFPhotosLibraryImage)photosLibraryImage;
- (SFRejectPeopleInPhotoCommand)initWithCoder:(id)a3;
- (SFRejectPeopleInPhotoCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPhotosLibraryImage:(id)a3;
- (void)setRejectedPeople:(id)a3;
@end

@implementation SFRejectPeopleInPhotoCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
  objc_storeStrong((id *)&self->_rejectedPeople, 0);
}

- (void)setPhotosLibraryImage:(id)a3
{
}

- (SFPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (void)setRejectedPeople:(id)a3
{
}

- (NSArray)rejectedPeople
{
  return self->_rejectedPeople;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)SFRejectPeopleInPhotoCommand;
  unint64_t v3 = [(SFCommand *)&v9 hash];
  v4 = [(SFRejectPeopleInPhotoCommand *)self rejectedPeople];
  uint64_t v5 = [v4 hash];
  v6 = [(SFRejectPeopleInPhotoCommand *)self photosLibraryImage];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFRejectPeopleInPhotoCommand *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFRejectPeopleInPhotoCommand *)v5 isMemberOfClass:objc_opt_class()])
    {
      v22.receiver = self;
      v22.super_class = (Class)SFRejectPeopleInPhotoCommand;
      if ([(SFCommand *)&v22 isEqual:v5])
      {
        v6 = v5;
        unint64_t v7 = [(SFRejectPeopleInPhotoCommand *)self rejectedPeople];
        v8 = [(SFRejectPeopleInPhotoCommand *)v6 rejectedPeople];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        objc_super v9 = [(SFRejectPeopleInPhotoCommand *)self rejectedPeople];
        if (v9)
        {
          unint64_t v3 = [(SFRejectPeopleInPhotoCommand *)self rejectedPeople];
          v10 = [(SFRejectPeopleInPhotoCommand *)v6 rejectedPeople];
          if (![v3 isEqual:v10])
          {
            char v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        v12 = [(SFRejectPeopleInPhotoCommand *)self photosLibraryImage];
        v13 = [(SFRejectPeopleInPhotoCommand *)v6 photosLibraryImage];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
        }
        else
        {
          uint64_t v15 = [(SFRejectPeopleInPhotoCommand *)self photosLibraryImage];
          if (v15)
          {
            v16 = (void *)v15;
            v19 = [(SFRejectPeopleInPhotoCommand *)self photosLibraryImage];
            [(SFRejectPeopleInPhotoCommand *)v6 photosLibraryImage];
            v17 = v20 = v3;
            char v11 = [v19 isEqual:v17];

            unint64_t v3 = v20;
          }
          else
          {

            char v11 = 1;
          }
        }
        v10 = v21;
        if (!v9) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    char v11 = 0;
  }
LABEL_21:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFRejectPeopleInPhotoCommand;
  id v4 = [(SFCommand *)&v10 copyWithZone:a3];
  uint64_t v5 = [(SFRejectPeopleInPhotoCommand *)self rejectedPeople];
  v6 = (void *)[v5 copy];
  [v4 setRejectedPeople:v6];

  unint64_t v7 = [(SFRejectPeopleInPhotoCommand *)self photosLibraryImage];
  v8 = (void *)[v7 copy];
  [v4 setPhotosLibraryImage:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRejectPeopleInPhotoCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRejectPeopleInPhotoCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRejectPeopleInPhotoCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRejectPeopleInPhotoCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFRejectPeopleInPhotoCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFRejectPeopleInPhotoCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFRejectPeopleInPhotoCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v7 = [[_SFPBCommand alloc] initWithData:v6];
  v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v9 = [(SFCommand *)v8 rejectedPeople];
    [(SFRejectPeopleInPhotoCommand *)v5 setRejectedPeople:v9];

    objc_super v10 = [(SFCommand *)v8 photosLibraryImage];
    [(SFRejectPeopleInPhotoCommand *)v5 setPhotosLibraryImage:v10];

    char v11 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v11];

    v12 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v12];

    v13 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v13];

    v14 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v14];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRejectPeopleInPhotoCommand)initWithProtobuf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFRejectPeopleInPhotoCommand;
  uint64_t v5 = [(SFRejectPeopleInPhotoCommand *)&v24 init];
  if (v5)
  {
    v6 = [v4 rejectedPeoples];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v8 = objc_msgSend(v4, "rejectedPeoples", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPerson alloc] initWithProtobuf:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }

    [(SFRejectPeopleInPhotoCommand *)v5 setRejectedPeople:v7];
    v14 = [v4 photosLibraryImage];

    if (v14)
    {
      uint64_t v15 = [SFPhotosLibraryImage alloc];
      v16 = [v4 photosLibraryImage];
      v17 = [(SFPhotosLibraryImage *)v15 initWithProtobuf:v16];
      [(SFRejectPeopleInPhotoCommand *)v5 setPhotosLibraryImage:v17];
    }
    v18 = v5;
  }
  return v5;
}

@end