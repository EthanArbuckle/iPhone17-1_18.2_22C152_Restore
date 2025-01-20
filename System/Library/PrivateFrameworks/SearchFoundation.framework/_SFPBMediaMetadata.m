@interface _SFPBMediaMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)bundleIdentifiersToExcludes;
- (NSArray)mediaPunchouts;
- (NSData)jsonData;
- (NSString)albumName;
- (NSString)artistName;
- (NSString)disambiguationTitle;
- (NSString)mediaIdentifier;
- (NSString)mediaName;
- (_SFPBMediaMetadata)initWithDictionary:(id)a3;
- (_SFPBMediaMetadata)initWithFacade:(id)a3;
- (_SFPBMediaMetadata)initWithJSON:(id)a3;
- (id)bundleIdentifiersToExcludeAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)mediaPunchoutsAtIndex:(unint64_t)a3;
- (int)mediaType;
- (unint64_t)bundleIdentifiersToExcludeCount;
- (unint64_t)hash;
- (unint64_t)mediaPunchoutsCount;
- (void)addBundleIdentifiersToExclude:(id)a3;
- (void)addMediaPunchouts:(id)a3;
- (void)clearBundleIdentifiersToExclude;
- (void)clearMediaPunchouts;
- (void)setAlbumName:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setBundleIdentifiersToExclude:(id)a3;
- (void)setBundleIdentifiersToExcludes:(id)a3;
- (void)setDisambiguationTitle:(id)a3;
- (void)setMediaIdentifier:(id)a3;
- (void)setMediaName:(id)a3;
- (void)setMediaPunchouts:(id)a3;
- (void)setMediaType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMediaMetadata

- (_SFPBMediaMetadata)initWithFacade:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBMediaMetadata *)self init];
  if (v5)
  {
    v6 = [v4 mediaName];

    if (v6)
    {
      v7 = [v4 mediaName];
      [(_SFPBMediaMetadata *)v5 setMediaName:v7];
    }
    if ([v4 hasMediaType]) {
      -[_SFPBMediaMetadata setMediaType:](v5, "setMediaType:", [v4 mediaType]);
    }
    v8 = [v4 artistName];

    if (v8)
    {
      v9 = [v4 artistName];
      [(_SFPBMediaMetadata *)v5 setArtistName:v9];
    }
    v10 = [v4 albumName];

    if (v10)
    {
      v11 = [v4 albumName];
      [(_SFPBMediaMetadata *)v5 setAlbumName:v11];
    }
    v12 = [v4 mediaPunchouts];
    if (v12) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v13 = 0;
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v14 = [v4 mediaPunchouts];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          if (v19) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v16);
    }

    [(_SFPBMediaMetadata *)v5 setMediaPunchouts:v13];
    v20 = [v4 bundleIdentifiersToExclude];
    if (v20) {
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v21 = 0;
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v22 = objc_msgSend(v4, "bundleIdentifiersToExclude", 0);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          if (*(void *)(*((void *)&v33 + 1) + 8 * j)) {
            objc_msgSend(v21, "addObject:");
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v24);
    }

    [(_SFPBMediaMetadata *)v5 setBundleIdentifiersToExcludes:v21];
    v27 = [v4 disambiguationTitle];

    if (v27)
    {
      v28 = [v4 disambiguationTitle];
      [(_SFPBMediaMetadata *)v5 setDisambiguationTitle:v28];
    }
    v29 = [v4 mediaIdentifier];

    if (v29)
    {
      v30 = [v4 mediaIdentifier];
      [(_SFPBMediaMetadata *)v5 setMediaIdentifier:v30];
    }
    v31 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_storeStrong((id *)&self->_disambiguationTitle, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersToExcludes, 0);
  objc_storeStrong((id *)&self->_mediaPunchouts, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_mediaName, 0);
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (NSString)disambiguationTitle
{
  return self->_disambiguationTitle;
}

- (void)setBundleIdentifiersToExcludes:(id)a3
{
}

- (NSArray)bundleIdentifiersToExcludes
{
  return self->_bundleIdentifiersToExcludes;
}

- (NSArray)mediaPunchouts
{
  return self->_mediaPunchouts;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (NSString)mediaName
{
  return self->_mediaName;
}

- (_SFPBMediaMetadata)initWithDictionary:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)_SFPBMediaMetadata;
  v5 = [(_SFPBMediaMetadata *)&v49 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mediaName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBMediaMetadata *)v5 setMediaName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"mediaType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaMetadata setMediaType:](v5, "setMediaType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"artistName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(_SFPBMediaMetadata *)v5 setArtistName:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"albumName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(_SFPBMediaMetadata *)v5 setAlbumName:v12];
    }
    long long v37 = v11;
    id v13 = [v4 objectForKeyedSubscript:@"mediaPunchouts"];
    objc_opt_class();
    long long v40 = v13;
    long long v38 = v9;
    long long v39 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v35 = v6;
      id v36 = v4;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v46 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = [[_SFPBPunchout alloc] initWithDictionary:v19];
              [(_SFPBMediaMetadata *)v5 addMediaPunchouts:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v16);
      }

      id v4 = v36;
      v8 = v39;
    }
    id v21 = objc_msgSend(v4, "objectForKeyedSubscript:", @"bundleIdentifiersToExclude", v35, v36);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v42 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v41 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v28 = (void *)[v27 copy];
              [(_SFPBMediaMetadata *)v5 addBundleIdentifiersToExclude:v28];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v50 count:16];
        }
        while (v24);
      }

      v9 = v38;
      v8 = v39;
    }
    v29 = [v4 objectForKeyedSubscript:@"disambiguationTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = (void *)[v29 copy];
      [(_SFPBMediaMetadata *)v5 setDisambiguationTitle:v30];
    }
    v31 = [v4 objectForKeyedSubscript:@"mediaIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = (void *)[v31 copy];
      [(_SFPBMediaMetadata *)v5 setMediaIdentifier:v32];
    }
    long long v33 = v5;
  }
  return v5;
}

- (_SFPBMediaMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMediaMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMediaMetadata *)self dictionaryRepresentation];
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
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_albumName)
  {
    id v4 = [(_SFPBMediaMetadata *)self albumName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"albumName"];
  }
  if (self->_artistName)
  {
    v6 = [(_SFPBMediaMetadata *)self artistName];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"artistName"];
  }
  if (self->_bundleIdentifiersToExcludes)
  {
    v8 = [(_SFPBMediaMetadata *)self bundleIdentifiersToExcludes];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"bundleIdentifiersToExclude"];
  }
  if (self->_disambiguationTitle)
  {
    v10 = [(_SFPBMediaMetadata *)self disambiguationTitle];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"disambiguationTitle"];
  }
  if (self->_mediaIdentifier)
  {
    v12 = [(_SFPBMediaMetadata *)self mediaIdentifier];
    id v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"mediaIdentifier"];
  }
  if (self->_mediaName)
  {
    id v14 = [(_SFPBMediaMetadata *)self mediaName];
    uint64_t v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"mediaName"];
  }
  if ([(NSArray *)self->_mediaPunchouts count])
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v17 = self->_mediaPunchouts;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
          if (v22)
          {
            [v16 addObject:v22];
          }
          else
          {
            uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"mediaPunchouts"];
  }
  if (self->_mediaType)
  {
    uint64_t v24 = [(_SFPBMediaMetadata *)self mediaType];
    uint64_t v25 = @"0";
    switch((int)v24)
    {
      case 0:
        break;
      case 1:
        uint64_t v25 = @"1";
        break;
      case 2:
        uint64_t v25 = @"2";
        break;
      case 3:
        uint64_t v25 = @"3";
        break;
      case 4:
        uint64_t v25 = @"4";
        break;
      case 5:
        uint64_t v25 = @"5";
        break;
      case 6:
        uint64_t v25 = @"6";
        break;
      case 7:
        uint64_t v25 = @"7";
        break;
      case 8:
        uint64_t v25 = @"8";
        break;
      case 9:
        uint64_t v25 = @"9";
        break;
      case 10:
        uint64_t v25 = @"10";
        break;
      case 11:
        uint64_t v25 = @"11";
        break;
      case 12:
        uint64_t v25 = @"12";
        break;
      case 13:
        uint64_t v25 = @"13";
        break;
      case 14:
        uint64_t v25 = @"14";
        break;
      case 15:
        uint64_t v25 = @"15";
        break;
      case 16:
        uint64_t v25 = @"16";
        break;
      case 17:
        uint64_t v25 = @"17";
        break;
      case 18:
        uint64_t v25 = @"18";
        break;
      case 19:
        uint64_t v25 = @"19";
        break;
      case 20:
        uint64_t v25 = @"20";
        break;
      default:
        if (v24 == 100)
        {
          uint64_t v25 = @"100";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v24);
          uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    [v3 setObject:v25 forKeyedSubscript:@"mediaType"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_mediaName hash];
  uint64_t v4 = 2654435761 * self->_mediaType;
  NSUInteger v5 = v3 ^ [(NSString *)self->_artistName hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_albumName hash];
  uint64_t v7 = v6 ^ [(NSArray *)self->_mediaPunchouts hash];
  uint64_t v8 = v4 ^ v7 ^ [(NSArray *)self->_bundleIdentifiersToExcludes hash];
  NSUInteger v9 = [(NSString *)self->_disambiguationTitle hash];
  return v8 ^ v9 ^ [(NSString *)self->_mediaIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  NSUInteger v5 = [(_SFPBMediaMetadata *)self mediaName];
  NSUInteger v6 = [v4 mediaName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v7 = [(_SFPBMediaMetadata *)self mediaName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBMediaMetadata *)self mediaName];
    v10 = [v4 mediaName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  int mediaType = self->_mediaType;
  if (mediaType != [v4 mediaType]) {
    goto LABEL_38;
  }
  NSUInteger v5 = [(_SFPBMediaMetadata *)self artistName];
  NSUInteger v6 = [v4 artistName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v13 = [(_SFPBMediaMetadata *)self artistName];
  if (v13)
  {
    id v14 = (void *)v13;
    uint64_t v15 = [(_SFPBMediaMetadata *)self artistName];
    uint64_t v16 = [v4 artistName];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMediaMetadata *)self albumName];
  NSUInteger v6 = [v4 albumName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v18 = [(_SFPBMediaMetadata *)self albumName];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [(_SFPBMediaMetadata *)self albumName];
    id v21 = [v4 albumName];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMediaMetadata *)self mediaPunchouts];
  NSUInteger v6 = [v4 mediaPunchouts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v23 = [(_SFPBMediaMetadata *)self mediaPunchouts];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    uint64_t v25 = [(_SFPBMediaMetadata *)self mediaPunchouts];
    v26 = [v4 mediaPunchouts];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMediaMetadata *)self bundleIdentifiersToExcludes];
  NSUInteger v6 = [v4 bundleIdentifiersToExcludes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v28 = [(_SFPBMediaMetadata *)self bundleIdentifiersToExcludes];
  if (v28)
  {
    long long v29 = (void *)v28;
    long long v30 = [(_SFPBMediaMetadata *)self bundleIdentifiersToExcludes];
    v31 = [v4 bundleIdentifiersToExcludes];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMediaMetadata *)self disambiguationTitle];
  NSUInteger v6 = [v4 disambiguationTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v33 = [(_SFPBMediaMetadata *)self disambiguationTitle];
  if (v33)
  {
    long long v34 = (void *)v33;
    long long v35 = [(_SFPBMediaMetadata *)self disambiguationTitle];
    id v36 = [v4 disambiguationTitle];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMediaMetadata *)self mediaIdentifier];
  NSUInteger v6 = [v4 mediaIdentifier];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v38 = [(_SFPBMediaMetadata *)self mediaIdentifier];
  if (!v38)
  {

LABEL_41:
    BOOL v43 = 1;
    goto LABEL_39;
  }
  long long v39 = (void *)v38;
  long long v40 = [(_SFPBMediaMetadata *)self mediaIdentifier];
  long long v41 = [v4 mediaIdentifier];
  char v42 = [v40 isEqual:v41];

  if (v42) {
    goto LABEL_41;
  }
LABEL_38:
  BOOL v43 = 0;
LABEL_39:

  return v43;
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBMediaMetadata *)self mediaName];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMediaMetadata *)self mediaType]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v6 = [(_SFPBMediaMetadata *)self artistName];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  uint64_t v7 = [(_SFPBMediaMetadata *)self albumName];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  uint64_t v8 = [(_SFPBMediaMetadata *)self mediaPunchouts];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [(_SFPBMediaMetadata *)self bundleIdentifiersToExcludes];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [(_SFPBMediaMetadata *)self disambiguationTitle];
  if (v18) {
    PBDataWriterWriteStringField();
  }

  uint64_t v19 = [(_SFPBMediaMetadata *)self mediaIdentifier];
  if (v19) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMediaMetadataReadFrom(self, (uint64_t)a3);
}

- (void)setMediaIdentifier:(id)a3
{
  self->_mediaIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDisambiguationTitle:(id)a3
{
  self->_disambiguationTitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)bundleIdentifiersToExcludeAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_bundleIdentifiersToExcludes objectAtIndexedSubscript:a3];
}

- (unint64_t)bundleIdentifiersToExcludeCount
{
  return [(NSArray *)self->_bundleIdentifiersToExcludes count];
}

- (void)addBundleIdentifiersToExclude:(id)a3
{
  id v4 = a3;
  bundleIdentifiersToExcludes = self->_bundleIdentifiersToExcludes;
  id v8 = v4;
  if (!bundleIdentifiersToExcludes)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_bundleIdentifiersToExcludes;
    self->_bundleIdentifiersToExcludes = v6;

    id v4 = v8;
    bundleIdentifiersToExcludes = self->_bundleIdentifiersToExcludes;
  }
  [(NSArray *)bundleIdentifiersToExcludes addObject:v4];
}

- (void)clearBundleIdentifiersToExclude
{
}

- (void)setBundleIdentifiersToExclude:(id)a3
{
  self->_bundleIdentifiersToExcludes = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)mediaPunchoutsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_mediaPunchouts objectAtIndexedSubscript:a3];
}

- (unint64_t)mediaPunchoutsCount
{
  return [(NSArray *)self->_mediaPunchouts count];
}

- (void)addMediaPunchouts:(id)a3
{
  id v4 = a3;
  mediaPunchouts = self->_mediaPunchouts;
  id v8 = v4;
  if (!mediaPunchouts)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_mediaPunchouts;
    self->_mediaPunchouts = v6;

    id v4 = v8;
    mediaPunchouts = self->_mediaPunchouts;
  }
  [(NSArray *)mediaPunchouts addObject:v4];
}

- (void)clearMediaPunchouts
{
}

- (void)setMediaPunchouts:(id)a3
{
  self->_mediaPunchouts = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setAlbumName:(id)a3
{
  self->_albumName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setArtistName:(id)a3
{
  self->_artistName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setMediaType:(int)a3
{
  self->_int mediaType = a3;
}

- (void)setMediaName:(id)a3
{
  self->_mediaName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end