@interface _SFPBShowPhotosOneUpViewCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)matchedPeoples;
- (NSArray)matchedScenes;
- (NSData)jsonData;
- (_SFPBPerson)matchedPerson;
- (_SFPBPhotosLibraryImage)photosLibraryImage;
- (_SFPBPunchout)photoFilePunchout;
- (_SFPBShowPhotosOneUpViewCommand)initWithDictionary:(id)a3;
- (_SFPBShowPhotosOneUpViewCommand)initWithFacade:(id)a3;
- (_SFPBShowPhotosOneUpViewCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)matchedPeopleAtIndex:(unint64_t)a3;
- (id)matchedScenesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)matchedPeopleCount;
- (unint64_t)matchedScenesCount;
- (void)addMatchedPeople:(id)a3;
- (void)addMatchedScenes:(id)a3;
- (void)clearMatchedPeople;
- (void)clearMatchedScenes;
- (void)setMatchedPeople:(id)a3;
- (void)setMatchedPeoples:(id)a3;
- (void)setMatchedPerson:(id)a3;
- (void)setMatchedScenes:(id)a3;
- (void)setPhotoFilePunchout:(id)a3;
- (void)setPhotosLibraryImage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBShowPhotosOneUpViewCommand

- (_SFPBShowPhotosOneUpViewCommand)initWithFacade:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBShowPhotosOneUpViewCommand *)self init];
  if (v5)
  {
    v6 = [v4 photosLibraryImage];

    if (v6)
    {
      v7 = [_SFPBPhotosLibraryImage alloc];
      v8 = [v4 photosLibraryImage];
      v9 = [(_SFPBPhotosLibraryImage *)v7 initWithFacade:v8];
      [(_SFPBShowPhotosOneUpViewCommand *)v5 setPhotosLibraryImage:v9];
    }
    v10 = [v4 matchedPerson];

    if (v10)
    {
      v11 = [_SFPBPerson alloc];
      v12 = [v4 matchedPerson];
      v13 = [(_SFPBPerson *)v11 initWithFacade:v12];
      [(_SFPBShowPhotosOneUpViewCommand *)v5 setMatchedPerson:v13];
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
    uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
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
          v21 = [[_SFPBScene alloc] initWithFacade:*(void *)(*((void *)&v40 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v18);
    }

    [(_SFPBShowPhotosOneUpViewCommand *)v5 setMatchedScenes:v15];
    v22 = [v4 matchedPeople];
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
    v24 = objc_msgSend(v4, "matchedPeople", 0);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
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
          v29 = [[_SFPBPerson alloc] initWithFacade:*(void *)(*((void *)&v36 + 1) + 8 * j)];
          if (v29) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v26);
    }

    [(_SFPBShowPhotosOneUpViewCommand *)v5 setMatchedPeoples:v23];
    v30 = [v4 photoFilePunchout];

    if (v30)
    {
      v31 = [_SFPBPunchout alloc];
      v32 = [v4 photoFilePunchout];
      v33 = [(_SFPBPunchout *)v31 initWithFacade:v32];
      [(_SFPBShowPhotosOneUpViewCommand *)v5 setPhotoFilePunchout:v33];
    }
    v34 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoFilePunchout, 0);
  objc_storeStrong((id *)&self->_matchedPeoples, 0);
  objc_storeStrong((id *)&self->_matchedScenes, 0);
  objc_storeStrong((id *)&self->_matchedPerson, 0);
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
}

- (_SFPBPunchout)photoFilePunchout
{
  return self->_photoFilePunchout;
}

- (void)setMatchedPeoples:(id)a3
{
}

- (NSArray)matchedPeoples
{
  return self->_matchedPeoples;
}

- (NSArray)matchedScenes
{
  return self->_matchedScenes;
}

- (_SFPBPerson)matchedPerson
{
  return self->_matchedPerson;
}

- (_SFPBPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (_SFPBShowPhotosOneUpViewCommand)initWithDictionary:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)_SFPBShowPhotosOneUpViewCommand;
  v5 = [(_SFPBShowPhotosOneUpViewCommand *)&v41 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"photosLibraryImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBPhotosLibraryImage alloc] initWithDictionary:v6];
      [(_SFPBShowPhotosOneUpViewCommand *)v5 setPhotosLibraryImage:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"matchedPerson"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBPerson alloc] initWithDictionary:v8];
      [(_SFPBShowPhotosOneUpViewCommand *)v5 setMatchedPerson:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"matchedScenes"];
    objc_opt_class();
    v32 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v11 = v10;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v38 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v18 = [[_SFPBScene alloc] initWithDictionary:v17];
              [(_SFPBShowPhotosOneUpViewCommand *)v5 addMatchedScenes:v18];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v43 count:16];
        }
        while (v14);
      }

      v6 = v32;
      v10 = v11;
    }
    uint64_t v19 = [v4 objectForKeyedSubscript:@"matchedPeople"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = v10;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v26 = [[_SFPBPerson alloc] initWithDictionary:v25];
              [(_SFPBShowPhotosOneUpViewCommand *)v5 addMatchedPeople:v26];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v22);
      }

      v6 = v32;
      v10 = v31;
    }
    uint64_t v27 = [v4 objectForKeyedSubscript:@"photoFilePunchout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[_SFPBPunchout alloc] initWithDictionary:v27];
      [(_SFPBShowPhotosOneUpViewCommand *)v5 setPhotoFilePunchout:v28];
    }
    v29 = v5;
  }
  return v5;
}

- (_SFPBShowPhotosOneUpViewCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBShowPhotosOneUpViewCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBShowPhotosOneUpViewCommand *)self dictionaryRepresentation];
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
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_matchedPeoples count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v5 = self->_matchedPeoples;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"matchedPeople"];
  }
  if (self->_matchedPerson)
  {
    id v12 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedPerson];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"matchedPerson"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"matchedPerson"];
    }
  }
  if ([(NSArray *)self->_matchedScenes count])
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v16 = self->_matchedScenes;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * j), "dictionaryRepresentation", (void)v30);
          if (v21)
          {
            [v15 addObject:v21];
          }
          else
          {
            uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
            [v15 addObject:v22];
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKeyedSubscript:@"matchedScenes"];
  }
  if (self->_photoFilePunchout)
  {
    uint64_t v23 = [(_SFPBShowPhotosOneUpViewCommand *)self photoFilePunchout];
    v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"photoFilePunchout"];
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"photoFilePunchout"];
    }
  }
  if (self->_photosLibraryImage)
  {
    uint64_t v26 = [(_SFPBShowPhotosOneUpViewCommand *)self photosLibraryImage];
    uint64_t v27 = [v26 dictionaryRepresentation];
    if (v27)
    {
      [v3 setObject:v27 forKeyedSubscript:@"photosLibraryImage"];
    }
    else
    {
      v28 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v28 forKeyedSubscript:@"photosLibraryImage"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBPhotosLibraryImage *)self->_photosLibraryImage hash];
  unint64_t v4 = [(_SFPBPerson *)self->_matchedPerson hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_matchedScenes hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_matchedPeoples hash];
  return v6 ^ [(_SFPBPunchout *)self->_photoFilePunchout hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(_SFPBShowPhotosOneUpViewCommand *)self photosLibraryImage];
  uint64_t v6 = [v4 photosLibraryImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_SFPBShowPhotosOneUpViewCommand *)self photosLibraryImage];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_SFPBShowPhotosOneUpViewCommand *)self photosLibraryImage];
    v10 = [v4 photosLibraryImage];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedPerson];
  uint64_t v6 = [v4 matchedPerson];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedPerson];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedPerson];
    uint64_t v15 = [v4 matchedPerson];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedScenes];
  uint64_t v6 = [v4 matchedScenes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedScenes];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedScenes];
    id v20 = [v4 matchedScenes];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedPeoples];
  uint64_t v6 = [v4 matchedPeoples];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedPeoples];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    v24 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedPeoples];
    uint64_t v25 = [v4 matchedPeoples];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBShowPhotosOneUpViewCommand *)self photoFilePunchout];
  uint64_t v6 = [v4 photoFilePunchout];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_SFPBShowPhotosOneUpViewCommand *)self photoFilePunchout];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_SFPBShowPhotosOneUpViewCommand *)self photoFilePunchout];
    long long v30 = [v4 photoFilePunchout];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBShowPhotosOneUpViewCommand *)self photosLibraryImage];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedPerson];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedScenes];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(_SFPBShowPhotosOneUpViewCommand *)self matchedPeoples];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [(_SFPBShowPhotosOneUpViewCommand *)self photoFilePunchout];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBShowPhotosOneUpViewCommandReadFrom(self, (uint64_t)a3);
}

- (void)setPhotoFilePunchout:(id)a3
{
}

- (id)matchedPeopleAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_matchedPeoples objectAtIndexedSubscript:a3];
}

- (unint64_t)matchedPeopleCount
{
  return [(NSArray *)self->_matchedPeoples count];
}

- (void)addMatchedPeople:(id)a3
{
  id v4 = a3;
  matchedPeoples = self->_matchedPeoples;
  id v8 = v4;
  if (!matchedPeoples)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_matchedPeoples;
    self->_matchedPeoples = v6;

    id v4 = v8;
    matchedPeoples = self->_matchedPeoples;
  }
  [(NSArray *)matchedPeoples addObject:v4];
}

- (void)clearMatchedPeople
{
}

- (void)setMatchedPeople:(id)a3
{
  self->_matchedPeoples = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)matchedScenesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_matchedScenes objectAtIndexedSubscript:a3];
}

- (unint64_t)matchedScenesCount
{
  return [(NSArray *)self->_matchedScenes count];
}

- (void)addMatchedScenes:(id)a3
{
  id v4 = a3;
  matchedScenes = self->_matchedScenes;
  id v8 = v4;
  if (!matchedScenes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_matchedScenes;
    self->_matchedScenes = v6;

    id v4 = v8;
    matchedScenes = self->_matchedScenes;
  }
  [(NSArray *)matchedScenes addObject:v4];
}

- (void)clearMatchedScenes
{
}

- (void)setMatchedScenes:(id)a3
{
  self->_matchedScenes = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setMatchedPerson:(id)a3
{
}

- (void)setPhotosLibraryImage:(id)a3
{
}

@end