@interface _SFPBPhotosLibraryImage
- (BOOL)isEqual:(id)a3;
- (BOOL)isSyndicated;
- (BOOL)readFrom:(id)a3;
- (NSArray)peopleInPhotos;
- (NSData)jsonData;
- (NSString)applicationBundleIdentifier;
- (NSString)photoIdentifier;
- (_SFPBPhotosLibraryImage)initWithDictionary:(id)a3;
- (_SFPBPhotosLibraryImage)initWithFacade:(id)a3;
- (_SFPBPhotosLibraryImage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)peopleInPhotoAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)peopleInPhotoCount;
- (void)addPeopleInPhoto:(id)a3;
- (void)clearPeopleInPhoto;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setIsSyndicated:(BOOL)a3;
- (void)setPeopleInPhoto:(id)a3;
- (void)setPeopleInPhotos:(id)a3;
- (void)setPhotoIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBPhotosLibraryImage

- (_SFPBPhotosLibraryImage)initWithFacade:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBPhotosLibraryImage *)self init];
  if (v5)
  {
    v6 = [v4 photoIdentifier];

    if (v6)
    {
      v7 = [v4 photoIdentifier];
      [(_SFPBPhotosLibraryImage *)v5 setPhotoIdentifier:v7];
    }
    if ([v4 hasIsSyndicated]) {
      -[_SFPBPhotosLibraryImage setIsSyndicated:](v5, "setIsSyndicated:", [v4 isSyndicated]);
    }
    v8 = [v4 peopleInPhoto];
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
    v10 = objc_msgSend(v4, "peopleInPhoto", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
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
          v15 = [[_SFPBPerson alloc] initWithFacade:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    [(_SFPBPhotosLibraryImage *)v5 setPeopleInPhotos:v9];
    v16 = [v4 applicationBundleIdentifier];

    if (v16)
    {
      v17 = [v4 applicationBundleIdentifier];
      [(_SFPBPhotosLibraryImage *)v5 setApplicationBundleIdentifier:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_peopleInPhotos, 0);
  objc_storeStrong((id *)&self->_photoIdentifier, 0);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setPeopleInPhotos:(id)a3
{
}

- (NSArray)peopleInPhotos
{
  return self->_peopleInPhotos;
}

- (BOOL)isSyndicated
{
  return self->_isSyndicated;
}

- (NSString)photoIdentifier
{
  return self->_photoIdentifier;
}

- (_SFPBPhotosLibraryImage)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_SFPBPhotosLibraryImage;
  v5 = [(_SFPBPhotosLibraryImage *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"photoIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBPhotosLibraryImage *)v5 setPhotoIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isSyndicated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPhotosLibraryImage setIsSyndicated:](v5, "setIsSyndicated:", [v8 BOOLValue]);
    }
    id v9 = [v4 objectForKeyedSubscript:@"peopleInPhoto"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = v8;
      long long v22 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[_SFPBPerson alloc] initWithDictionary:v15];
              [(_SFPBPhotosLibraryImage *)v5 addPeopleInPhoto:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v12);
      }

      v8 = v21;
    }
    v17 = objc_msgSend(v4, "objectForKeyedSubscript:", @"applicationBundleIdentifier", v21, v22, (void)v23);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(_SFPBPhotosLibraryImage *)v5 setApplicationBundleIdentifier:v18];
    }
    v19 = v5;
  }
  return v5;
}

- (_SFPBPhotosLibraryImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBPhotosLibraryImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBPhotosLibraryImage *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_applicationBundleIdentifier)
  {
    id v4 = [(_SFPBPhotosLibraryImage *)self applicationBundleIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"applicationBundleIdentifier"];
  }
  if (self->_isSyndicated)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBPhotosLibraryImage isSyndicated](self, "isSyndicated"));
    [v3 setObject:v6 forKeyedSubscript:@"isSyndicated"];
  }
  if ([(NSArray *)self->_peopleInPhotos count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v8 = self->_peopleInPhotos;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"peopleInPhoto"];
  }
  if (self->_photoIdentifier)
  {
    uint64_t v15 = [(_SFPBPhotosLibraryImage *)self photoIdentifier];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"photoIdentifier"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_photoIdentifier hash];
  if (self->_isSyndicated) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 ^ v3 ^ [(NSArray *)self->_peopleInPhotos hash];
  return v5 ^ [(NSString *)self->_applicationBundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  uint64_t v5 = [(_SFPBPhotosLibraryImage *)self photoIdentifier];
  v6 = [v4 photoIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_17;
  }
  uint64_t v7 = [(_SFPBPhotosLibraryImage *)self photoIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [(_SFPBPhotosLibraryImage *)self photoIdentifier];
    uint64_t v10 = [v4 photoIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int isSyndicated = self->_isSyndicated;
  if (isSyndicated != [v4 isSyndicated]) {
    goto LABEL_18;
  }
  uint64_t v5 = [(_SFPBPhotosLibraryImage *)self peopleInPhotos];
  v6 = [v4 peopleInPhotos];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(_SFPBPhotosLibraryImage *)self peopleInPhotos];
  if (v13)
  {
    v14 = (void *)v13;
    uint64_t v15 = [(_SFPBPhotosLibraryImage *)self peopleInPhotos];
    v16 = [v4 peopleInPhotos];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBPhotosLibraryImage *)self applicationBundleIdentifier];
  v6 = [v4 applicationBundleIdentifier];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v18 = [(_SFPBPhotosLibraryImage *)self applicationBundleIdentifier];
  if (!v18)
  {

LABEL_21:
    BOOL v23 = 1;
    goto LABEL_19;
  }
  long long v19 = (void *)v18;
  long long v20 = [(_SFPBPhotosLibraryImage *)self applicationBundleIdentifier];
  long long v21 = [v4 applicationBundleIdentifier];
  char v22 = [v20 isEqual:v21];

  if (v22) {
    goto LABEL_21;
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBPhotosLibraryImage *)self photoIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBPhotosLibraryImage *)self isSyndicated]) {
    PBDataWriterWriteBOOLField();
  }
  v6 = [(_SFPBPhotosLibraryImage *)self peopleInPhotos];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  int v11 = [(_SFPBPhotosLibraryImage *)self applicationBundleIdentifier];
  if (v11) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPhotosLibraryImageReadFrom(self, (uint64_t)a3);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  self->_applicationBundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)peopleInPhotoAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_peopleInPhotos objectAtIndexedSubscript:a3];
}

- (unint64_t)peopleInPhotoCount
{
  return [(NSArray *)self->_peopleInPhotos count];
}

- (void)addPeopleInPhoto:(id)a3
{
  id v4 = a3;
  peopleInPhotos = self->_peopleInPhotos;
  id v8 = v4;
  if (!peopleInPhotos)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_peopleInPhotos;
    self->_peopleInPhotos = v6;

    id v4 = v8;
    peopleInPhotos = self->_peopleInPhotos;
  }
  [(NSArray *)peopleInPhotos addObject:v4];
}

- (void)clearPeopleInPhoto
{
}

- (void)setPeopleInPhoto:(id)a3
{
  self->_peopleInPhotos = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIsSyndicated:(BOOL)a3
{
  self->_int isSyndicated = a3;
}

- (void)setPhotoIdentifier:(id)a3
{
  self->_photoIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end