@interface _SFPBCoreSpotlightCopyItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)dataProviderTypeIdentifiers;
- (NSArray)fileProviderTypeIdentifiers;
- (NSData)jsonData;
- (NSString)applicationBundleIdentifier;
- (NSString)coreSpotlightIdentifier;
- (_SFPBCoreSpotlightCopyItem)initWithDictionary:(id)a3;
- (_SFPBCoreSpotlightCopyItem)initWithFacade:(id)a3;
- (_SFPBCoreSpotlightCopyItem)initWithJSON:(id)a3;
- (id)dataProviderTypeIdentifiersAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)fileProviderTypeIdentifiersAtIndex:(unint64_t)a3;
- (unint64_t)dataProviderTypeIdentifiersCount;
- (unint64_t)fileProviderTypeIdentifiersCount;
- (unint64_t)hash;
- (void)addDataProviderTypeIdentifiers:(id)a3;
- (void)addFileProviderTypeIdentifiers:(id)a3;
- (void)clearDataProviderTypeIdentifiers;
- (void)clearFileProviderTypeIdentifiers;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setCoreSpotlightIdentifier:(id)a3;
- (void)setDataProviderTypeIdentifiers:(id)a3;
- (void)setFileProviderTypeIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCoreSpotlightCopyItem

- (_SFPBCoreSpotlightCopyItem)initWithFacade:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBCoreSpotlightCopyItem *)self init];
  if (v5)
  {
    v6 = [v4 dataProviderTypeIdentifiers];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v8 = [v4 dataProviderTypeIdentifiers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          if (*(void *)(*((void *)&v30 + 1) + 8 * i)) {
            objc_msgSend(v7, "addObject:");
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v10);
    }

    [(_SFPBCoreSpotlightCopyItem *)v5 setDataProviderTypeIdentifiers:v7];
    v13 = [v4 fileProviderTypeIdentifiers];
    if (v13) {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v14 = 0;
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v15 = objc_msgSend(v4, "fileProviderTypeIdentifiers", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          if (*(void *)(*((void *)&v26 + 1) + 8 * j)) {
            objc_msgSend(v14, "addObject:");
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v17);
    }

    [(_SFPBCoreSpotlightCopyItem *)v5 setFileProviderTypeIdentifiers:v14];
    v20 = [v4 applicationBundleIdentifier];

    if (v20)
    {
      v21 = [v4 applicationBundleIdentifier];
      [(_SFPBCoreSpotlightCopyItem *)v5 setApplicationBundleIdentifier:v21];
    }
    v22 = [v4 coreSpotlightIdentifier];

    if (v22)
    {
      v23 = [v4 coreSpotlightIdentifier];
      [(_SFPBCoreSpotlightCopyItem *)v5 setCoreSpotlightIdentifier:v23];
    }
    v24 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fileProviderTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_dataProviderTypeIdentifiers, 0);
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSArray)fileProviderTypeIdentifiers
{
  return self->_fileProviderTypeIdentifiers;
}

- (NSArray)dataProviderTypeIdentifiers
{
  return self->_dataProviderTypeIdentifiers;
}

- (_SFPBCoreSpotlightCopyItem)initWithDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_SFPBCoreSpotlightCopyItem;
  v5 = [(_SFPBCoreSpotlightCopyItem *)&v36 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dataProviderTypeIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v33;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v33 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = (void *)[v12 copy];
              [(_SFPBCoreSpotlightCopyItem *)v5 addDataProviderTypeIdentifiers:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v9);
      }
    }
    id v14 = [v4 objectForKeyedSubscript:@"fileProviderTypeIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v28 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = objc_msgSend(v20, "copy", (void)v28);
              [(_SFPBCoreSpotlightCopyItem *)v5 addFileProviderTypeIdentifiers:v21];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }
        while (v17);
      }
    }
    v22 = objc_msgSend(v4, "objectForKeyedSubscript:", @"applicationBundleIdentifier", (void)v28);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (void *)[v22 copy];
      [(_SFPBCoreSpotlightCopyItem *)v5 setApplicationBundleIdentifier:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"coreSpotlightIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(_SFPBCoreSpotlightCopyItem *)v5 setCoreSpotlightIdentifier:v25];
    }
    long long v26 = v5;
  }
  return v5;
}

- (_SFPBCoreSpotlightCopyItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCoreSpotlightCopyItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCoreSpotlightCopyItem *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_applicationBundleIdentifier)
  {
    id v4 = [(_SFPBCoreSpotlightCopyItem *)self applicationBundleIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"applicationBundleIdentifier"];
  }
  if (self->_coreSpotlightIdentifier)
  {
    v6 = [(_SFPBCoreSpotlightCopyItem *)self coreSpotlightIdentifier];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"coreSpotlightIdentifier"];
  }
  if (self->_dataProviderTypeIdentifiers)
  {
    uint64_t v8 = [(_SFPBCoreSpotlightCopyItem *)self dataProviderTypeIdentifiers];
    uint64_t v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"dataProviderTypeIdentifiers"];
  }
  if (self->_fileProviderTypeIdentifiers)
  {
    uint64_t v10 = [(_SFPBCoreSpotlightCopyItem *)self fileProviderTypeIdentifiers];
    uint64_t v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"fileProviderTypeIdentifiers"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_dataProviderTypeIdentifiers hash];
  uint64_t v4 = [(NSArray *)self->_fileProviderTypeIdentifiers hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_applicationBundleIdentifier hash];
  return v4 ^ v5 ^ [(NSString *)self->_coreSpotlightIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(_SFPBCoreSpotlightCopyItem *)self dataProviderTypeIdentifiers];
  v6 = [v4 dataProviderTypeIdentifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_SFPBCoreSpotlightCopyItem *)self dataProviderTypeIdentifiers];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBCoreSpotlightCopyItem *)self dataProviderTypeIdentifiers];
    uint64_t v10 = [v4 dataProviderTypeIdentifiers];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBCoreSpotlightCopyItem *)self fileProviderTypeIdentifiers];
  v6 = [v4 fileProviderTypeIdentifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_SFPBCoreSpotlightCopyItem *)self fileProviderTypeIdentifiers];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [(_SFPBCoreSpotlightCopyItem *)self fileProviderTypeIdentifiers];
    id v15 = [v4 fileProviderTypeIdentifiers];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBCoreSpotlightCopyItem *)self applicationBundleIdentifier];
  v6 = [v4 applicationBundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_SFPBCoreSpotlightCopyItem *)self applicationBundleIdentifier];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBCoreSpotlightCopyItem *)self applicationBundleIdentifier];
    v20 = [v4 applicationBundleIdentifier];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBCoreSpotlightCopyItem *)self coreSpotlightIdentifier];
  v6 = [v4 coreSpotlightIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_SFPBCoreSpotlightCopyItem *)self coreSpotlightIdentifier];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_SFPBCoreSpotlightCopyItem *)self coreSpotlightIdentifier];
    v25 = [v4 coreSpotlightIdentifier];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBCoreSpotlightCopyItem *)self dataProviderTypeIdentifiers];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_SFPBCoreSpotlightCopyItem *)self fileProviderTypeIdentifiers];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  id v15 = [(_SFPBCoreSpotlightCopyItem *)self applicationBundleIdentifier];
  if (v15) {
    PBDataWriterWriteStringField();
  }

  int v16 = [(_SFPBCoreSpotlightCopyItem *)self coreSpotlightIdentifier];
  if (v16) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCoreSpotlightCopyItemReadFrom(self, (uint64_t)a3);
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
  self->_coreSpotlightIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  self->_applicationBundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)fileProviderTypeIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_fileProviderTypeIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)fileProviderTypeIdentifiersCount
{
  return [(NSArray *)self->_fileProviderTypeIdentifiers count];
}

- (void)addFileProviderTypeIdentifiers:(id)a3
{
  id v4 = a3;
  fileProviderTypeIdentifiers = self->_fileProviderTypeIdentifiers;
  id v8 = v4;
  if (!fileProviderTypeIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_fileProviderTypeIdentifiers;
    self->_fileProviderTypeIdentifiers = v6;

    id v4 = v8;
    fileProviderTypeIdentifiers = self->_fileProviderTypeIdentifiers;
  }
  [(NSArray *)fileProviderTypeIdentifiers addObject:v4];
}

- (void)clearFileProviderTypeIdentifiers
{
}

- (void)setFileProviderTypeIdentifiers:(id)a3
{
  self->_fileProviderTypeIdentifiers = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)dataProviderTypeIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_dataProviderTypeIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)dataProviderTypeIdentifiersCount
{
  return [(NSArray *)self->_dataProviderTypeIdentifiers count];
}

- (void)addDataProviderTypeIdentifiers:(id)a3
{
  id v4 = a3;
  dataProviderTypeIdentifiers = self->_dataProviderTypeIdentifiers;
  id v8 = v4;
  if (!dataProviderTypeIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_dataProviderTypeIdentifiers;
    self->_dataProviderTypeIdentifiers = v6;

    id v4 = v8;
    dataProviderTypeIdentifiers = self->_dataProviderTypeIdentifiers;
  }
  [(NSArray *)dataProviderTypeIdentifiers addObject:v4];
}

- (void)clearDataProviderTypeIdentifiers
{
}

- (void)setDataProviderTypeIdentifiers:(id)a3
{
  self->_dataProviderTypeIdentifiers = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end