@interface SFShowPhotosOneUpViewCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)matchedPeople;
- (NSArray)matchedScenes;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFPerson)matchedPerson;
- (SFPhotosLibraryImage)photosLibraryImage;
- (SFPunchout)photoFilePunchout;
- (SFShowPhotosOneUpViewCommand)initWithCoder:(id)a3;
- (SFShowPhotosOneUpViewCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMatchedPeople:(id)a3;
- (void)setMatchedPerson:(id)a3;
- (void)setMatchedScenes:(id)a3;
- (void)setPhotoFilePunchout:(id)a3;
- (void)setPhotosLibraryImage:(id)a3;
@end

@implementation SFShowPhotosOneUpViewCommand

- (SFShowPhotosOneUpViewCommand)initWithProtobuf:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SFShowPhotosOneUpViewCommand;
  v5 = [(SFShowPhotosOneUpViewCommand *)&v44 init];
  if (v5)
  {
    v6 = [v4 photosLibraryImage];

    if (v6)
    {
      v7 = [SFPhotosLibraryImage alloc];
      v8 = [v4 photosLibraryImage];
      v9 = [(SFPhotosLibraryImage *)v7 initWithProtobuf:v8];
      [(SFShowPhotosOneUpViewCommand *)v5 setPhotosLibraryImage:v9];
    }
    v10 = [v4 matchedPerson];

    if (v10)
    {
      v11 = [SFPerson alloc];
      v12 = [v4 matchedPerson];
      v13 = [(SFPerson *)v11 initWithProtobuf:v12];
      [(SFShowPhotosOneUpViewCommand *)v5 setMatchedPerson:v13];
    }
    v14 = [v4 matchedScenes];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v16 = [v4 matchedScenes];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v41 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[SFScene alloc] initWithProtobuf:*(void *)(*((void *)&v40 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v18);
    }

    [(SFShowPhotosOneUpViewCommand *)v5 setMatchedScenes:v15];
    v22 = [v4 matchedPeoples];
    if (v22) {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v23 = 0;
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v24 = objc_msgSend(v4, "matchedPeoples", 0);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [[SFPerson alloc] initWithProtobuf:*(void *)(*((void *)&v36 + 1) + 8 * j)];
          if (v29) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v26);
    }

    [(SFShowPhotosOneUpViewCommand *)v5 setMatchedPeople:v23];
    v30 = [v4 photoFilePunchout];

    if (v30)
    {
      v31 = [SFPunchout alloc];
      v32 = [v4 photoFilePunchout];
      v33 = [(SFPunchout *)v31 initWithProtobuf:v32];
      [(SFShowPhotosOneUpViewCommand *)v5 setPhotoFilePunchout:v33];
    }
    v34 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoFilePunchout, 0);
  objc_storeStrong((id *)&self->_matchedPeople, 0);
  objc_storeStrong((id *)&self->_matchedScenes, 0);
  objc_storeStrong((id *)&self->_matchedPerson, 0);
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
}

- (void)setPhotoFilePunchout:(id)a3
{
}

- (SFPunchout)photoFilePunchout
{
  return self->_photoFilePunchout;
}

- (void)setMatchedPeople:(id)a3
{
}

- (NSArray)matchedPeople
{
  return self->_matchedPeople;
}

- (void)setMatchedScenes:(id)a3
{
}

- (NSArray)matchedScenes
{
  return self->_matchedScenes;
}

- (void)setMatchedPerson:(id)a3
{
}

- (SFPerson)matchedPerson
{
  return self->_matchedPerson;
}

- (void)setPhotosLibraryImage:(id)a3
{
}

- (SFPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (unint64_t)hash
{
  v15.receiver = self;
  v15.super_class = (Class)SFShowPhotosOneUpViewCommand;
  unint64_t v3 = [(SFCommand *)&v15 hash];
  id v4 = [(SFShowPhotosOneUpViewCommand *)self photosLibraryImage];
  uint64_t v5 = [v4 hash];
  v6 = [(SFShowPhotosOneUpViewCommand *)self matchedPerson];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFShowPhotosOneUpViewCommand *)self matchedScenes];
  uint64_t v9 = v7 ^ [v8 hash];
  v10 = [(SFShowPhotosOneUpViewCommand *)self matchedPeople];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(SFShowPhotosOneUpViewCommand *)self photoFilePunchout];
  unint64_t v13 = v11 ^ [v12 hash] ^ v3;

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFShowPhotosOneUpViewCommand *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    if ([(SFShowPhotosOneUpViewCommand *)v4 isMemberOfClass:objc_opt_class()])
    {
      v50.receiver = self;
      v50.super_class = (Class)SFShowPhotosOneUpViewCommand;
      if ([(SFCommand *)&v50 isEqual:v4])
      {
        uint64_t v5 = v4;
        v6 = [(SFShowPhotosOneUpViewCommand *)self photosLibraryImage];
        uint64_t v7 = [(SFShowPhotosOneUpViewCommand *)v5 photosLibraryImage];
        if ((v6 == 0) == (v7 != 0))
        {
          char v10 = 0;
LABEL_51:

          goto LABEL_52;
        }
        v8 = [(SFShowPhotosOneUpViewCommand *)self photosLibraryImage];
        if (v8)
        {
          uint64_t v9 = [(SFShowPhotosOneUpViewCommand *)self photosLibraryImage];
          v48 = [(SFShowPhotosOneUpViewCommand *)v5 photosLibraryImage];
          if (!objc_msgSend(v9, "isEqual:"))
          {
            char v10 = 0;
            goto LABEL_49;
          }
          uint64_t v47 = v9;
        }
        v49 = [(SFShowPhotosOneUpViewCommand *)self matchedPerson];
        uint64_t v11 = [(SFShowPhotosOneUpViewCommand *)v5 matchedPerson];
        if ((v49 == 0) != (v11 != 0))
        {
          uint64_t v12 = [(SFShowPhotosOneUpViewCommand *)self matchedPerson];
          if (v12)
          {
            unint64_t v13 = (void *)v12;
            v14 = [(SFShowPhotosOneUpViewCommand *)self matchedPerson];
            [(SFShowPhotosOneUpViewCommand *)v5 matchedPerson];
            v45 = objc_super v44 = v14;
            if (!objc_msgSend(v14, "isEqual:"))
            {
              char v10 = 0;
              uint64_t v19 = v13;
              v20 = v45;
              goto LABEL_46;
            }
            v46 = v13;
          }
          else
          {
            v46 = 0;
          }
          objc_super v15 = [(SFShowPhotosOneUpViewCommand *)self matchedScenes];
          v16 = [(SFShowPhotosOneUpViewCommand *)v5 matchedScenes];
          if ((v15 == 0) != (v16 != 0))
          {
            long long v42 = v15;
            long long v43 = v16;
            uint64_t v17 = [(SFShowPhotosOneUpViewCommand *)self matchedScenes];
            if (v17)
            {
              uint64_t v18 = [(SFShowPhotosOneUpViewCommand *)self matchedScenes];
              long long v39 = [(SFShowPhotosOneUpViewCommand *)v5 matchedScenes];
              long long v40 = v18;
              if (!objc_msgSend(v18, "isEqual:"))
              {
                char v10 = 0;
                v20 = v45;
                uint64_t v19 = v46;
                goto LABEL_44;
              }
              long long v41 = v17;
            }
            else
            {
              long long v41 = 0;
            }
            v21 = [(SFShowPhotosOneUpViewCommand *)self matchedPeople];
            v22 = [(SFShowPhotosOneUpViewCommand *)v5 matchedPeople];
            if ((v21 == 0) != (v22 != 0))
            {
              long long v38 = v22;
              [(SFShowPhotosOneUpViewCommand *)self matchedPeople];
              uint64_t v37 = v20 = v45;
              if (v37)
              {
                v33 = v21;
                id v23 = [(SFShowPhotosOneUpViewCommand *)self matchedPeople];
                v35 = [(SFShowPhotosOneUpViewCommand *)v5 matchedPeople];
                long long v36 = v23;
                if (!objc_msgSend(v23, "isEqual:"))
                {
                  char v10 = 0;
                  uint64_t v27 = (void *)v37;
                  v21 = v33;
                  goto LABEL_42;
                }
                v21 = v33;
              }
              v24 = [(SFShowPhotosOneUpViewCommand *)self photoFilePunchout];
              uint64_t v25 = [(SFShowPhotosOneUpViewCommand *)v5 photoFilePunchout];
              if ((v24 == 0) == (v25 != 0))
              {

                char v10 = 0;
                v20 = v45;
                uint64_t v27 = (void *)v37;
                if (!v37)
                {
LABEL_43:

                  uint64_t v17 = v41;
                  uint64_t v19 = v46;
                  if (!v41) {
                    goto LABEL_45;
                  }
                  goto LABEL_44;
                }
              }
              else
              {
                v32 = v25;
                v34 = v24;
                uint64_t v26 = [(SFShowPhotosOneUpViewCommand *)self photoFilePunchout];
                v20 = v45;
                uint64_t v27 = (void *)v37;
                if (v26)
                {
                  v31 = (void *)v26;
                  v30 = [(SFShowPhotosOneUpViewCommand *)self photoFilePunchout];
                  v29 = [(SFShowPhotosOneUpViewCommand *)v5 photoFilePunchout];
                  char v10 = [v30 isEqual:v29];

                  if (!v37) {
                    goto LABEL_43;
                  }
                }
                else
                {

                  char v10 = 1;
                  if (!v37) {
                    goto LABEL_43;
                  }
                }
              }
LABEL_42:

              goto LABEL_43;
            }

            char v10 = 0;
            v20 = v45;
            uint64_t v19 = v46;
            uint64_t v17 = v41;
            if (!v41)
            {
LABEL_45:

              if (!v19)
              {
LABEL_47:

LABEL_48:
                uint64_t v9 = v47;
                if (!v8)
                {
LABEL_50:

                  goto LABEL_51;
                }
LABEL_49:

                goto LABEL_50;
              }
LABEL_46:

              goto LABEL_47;
            }
LABEL_44:

            goto LABEL_45;
          }

          if (v46)
          {
          }
        }

        char v10 = 0;
        goto LABEL_48;
      }
    }
    char v10 = 0;
  }
LABEL_52:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SFShowPhotosOneUpViewCommand;
  id v4 = [(SFCommand *)&v16 copyWithZone:a3];
  uint64_t v5 = [(SFShowPhotosOneUpViewCommand *)self photosLibraryImage];
  v6 = (void *)[v5 copy];
  [v4 setPhotosLibraryImage:v6];

  uint64_t v7 = [(SFShowPhotosOneUpViewCommand *)self matchedPerson];
  v8 = (void *)[v7 copy];
  [v4 setMatchedPerson:v8];

  uint64_t v9 = [(SFShowPhotosOneUpViewCommand *)self matchedScenes];
  char v10 = (void *)[v9 copy];
  [v4 setMatchedScenes:v10];

  uint64_t v11 = [(SFShowPhotosOneUpViewCommand *)self matchedPeople];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setMatchedPeople:v12];

  unint64_t v13 = [(SFShowPhotosOneUpViewCommand *)self photoFilePunchout];
  v14 = (void *)[v13 copy];
  [v4 setPhotoFilePunchout:v14];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBShowPhotosOneUpViewCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBShowPhotosOneUpViewCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBShowPhotosOneUpViewCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBShowPhotosOneUpViewCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFShowPhotosOneUpViewCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFShowPhotosOneUpViewCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFShowPhotosOneUpViewCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCommand alloc] initWithData:v6];
  v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCommand *)v8 photosLibraryImage];
    [(SFShowPhotosOneUpViewCommand *)v5 setPhotosLibraryImage:v9];

    char v10 = [(SFCommand *)v8 matchedPerson];
    [(SFShowPhotosOneUpViewCommand *)v5 setMatchedPerson:v10];

    uint64_t v11 = [(SFCommand *)v8 matchedScenes];
    [(SFShowPhotosOneUpViewCommand *)v5 setMatchedScenes:v11];

    uint64_t v12 = [(SFCommand *)v8 matchedPeople];
    [(SFShowPhotosOneUpViewCommand *)v5 setMatchedPeople:v12];

    unint64_t v13 = [(SFCommand *)v8 photoFilePunchout];
    [(SFShowPhotosOneUpViewCommand *)v5 setPhotoFilePunchout:v13];

    v14 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v14];

    objc_super v15 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v15];

    objc_super v16 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v16];

    uint64_t v17 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v17];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end