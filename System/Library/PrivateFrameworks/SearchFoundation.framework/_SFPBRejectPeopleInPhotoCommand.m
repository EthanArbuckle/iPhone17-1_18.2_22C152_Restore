@interface _SFPBRejectPeopleInPhotoCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)rejectedPeoples;
- (NSData)jsonData;
- (_SFPBPhotosLibraryImage)photosLibraryImage;
- (_SFPBRejectPeopleInPhotoCommand)initWithDictionary:(id)a3;
- (_SFPBRejectPeopleInPhotoCommand)initWithFacade:(id)a3;
- (_SFPBRejectPeopleInPhotoCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)rejectedPeopleAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rejectedPeopleCount;
- (void)addRejectedPeople:(id)a3;
- (void)clearRejectedPeople;
- (void)setPhotosLibraryImage:(id)a3;
- (void)setRejectedPeople:(id)a3;
- (void)setRejectedPeoples:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRejectPeopleInPhotoCommand

- (_SFPBRejectPeopleInPhotoCommand)initWithFacade:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRejectPeopleInPhotoCommand *)self init];
  if (v5)
  {
    v6 = [v4 rejectedPeople];
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
    v8 = objc_msgSend(v4, "rejectedPeople", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
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
          v13 = [[_SFPBPerson alloc] initWithFacade:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    [(_SFPBRejectPeopleInPhotoCommand *)v5 setRejectedPeoples:v7];
    v14 = [v4 photosLibraryImage];

    if (v14)
    {
      v15 = [_SFPBPhotosLibraryImage alloc];
      v16 = [v4 photosLibraryImage];
      v17 = [(_SFPBPhotosLibraryImage *)v15 initWithFacade:v16];
      [(_SFPBRejectPeopleInPhotoCommand *)v5 setPhotosLibraryImage:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
  objc_storeStrong((id *)&self->_rejectedPeoples, 0);
}

- (_SFPBPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (void)setRejectedPeoples:(id)a3
{
}

- (NSArray)rejectedPeoples
{
  return self->_rejectedPeoples;
}

- (_SFPBRejectPeopleInPhotoCommand)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_SFPBRejectPeopleInPhotoCommand;
  v5 = [(_SFPBRejectPeopleInPhotoCommand *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rejectedPeople"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [_SFPBPerson alloc];
              v14 = -[_SFPBPerson initWithDictionary:](v13, "initWithDictionary:", v12, (void)v19);
              [(_SFPBRejectPeopleInPhotoCommand *)v5 addRejectedPeople:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"photosLibraryImage", (void)v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[_SFPBPhotosLibraryImage alloc] initWithDictionary:v15];
      [(_SFPBRejectPeopleInPhotoCommand *)v5 setPhotosLibraryImage:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (_SFPBRejectPeopleInPhotoCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRejectPeopleInPhotoCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRejectPeopleInPhotoCommand *)self dictionaryRepresentation];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_photosLibraryImage)
  {
    id v4 = [(_SFPBRejectPeopleInPhotoCommand *)self photosLibraryImage];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"photosLibraryImage"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"photosLibraryImage"];
    }
  }
  if ([(NSArray *)self->_rejectedPeoples count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = self->_rejectedPeoples;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
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
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"rejectedPeople"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_rejectedPeoples hash];
  return [(_SFPBPhotosLibraryImage *)self->_photosLibraryImage hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBRejectPeopleInPhotoCommand *)self rejectedPeoples];
  v6 = [v4 rejectedPeoples];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBRejectPeopleInPhotoCommand *)self rejectedPeoples];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRejectPeopleInPhotoCommand *)self rejectedPeoples];
    uint64_t v10 = [v4 rejectedPeoples];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRejectPeopleInPhotoCommand *)self photosLibraryImage];
  v6 = [v4 photosLibraryImage];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBRejectPeopleInPhotoCommand *)self photosLibraryImage];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBRejectPeopleInPhotoCommand *)self photosLibraryImage];
    v15 = [v4 photosLibraryImage];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRejectPeopleInPhotoCommand *)self rejectedPeoples];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_SFPBRejectPeopleInPhotoCommand *)self photosLibraryImage];
  if (v10) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRejectPeopleInPhotoCommandReadFrom(self, (uint64_t)a3);
}

- (void)setPhotosLibraryImage:(id)a3
{
}

- (id)rejectedPeopleAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_rejectedPeoples objectAtIndexedSubscript:a3];
}

- (unint64_t)rejectedPeopleCount
{
  return [(NSArray *)self->_rejectedPeoples count];
}

- (void)addRejectedPeople:(id)a3
{
  id v4 = a3;
  rejectedPeoples = self->_rejectedPeoples;
  id v8 = v4;
  if (!rejectedPeoples)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_rejectedPeoples;
    self->_rejectedPeoples = v6;

    id v4 = v8;
    rejectedPeoples = self->_rejectedPeoples;
  }
  [(NSArray *)rejectedPeoples addObject:v4];
}

- (void)clearRejectedPeople
{
}

- (void)setRejectedPeople:(id)a3
{
  self->_rejectedPeoples = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end