@interface _SFPBSafariTableOfContentsCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)tableOfContentsItems;
- (NSData)jsonData;
- (NSString)algorithmVersion;
- (_SFPBSafariTableOfContentsCardSection)initWithDictionary:(id)a3;
- (_SFPBSafariTableOfContentsCardSection)initWithFacade:(id)a3;
- (_SFPBSafariTableOfContentsCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)tableOfContentsItemsAtIndex:(unint64_t)a3;
- (int)tableOfContentsSource;
- (int)tableOfContentsType;
- (unint64_t)hash;
- (unint64_t)tableOfContentsItemsCount;
- (void)addTableOfContentsItems:(id)a3;
- (void)clearTableOfContentsItems;
- (void)setAlgorithmVersion:(id)a3;
- (void)setTableOfContentsItems:(id)a3;
- (void)setTableOfContentsSource:(int)a3;
- (void)setTableOfContentsType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSafariTableOfContentsCardSection

- (_SFPBSafariTableOfContentsCardSection)initWithFacade:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBSafariTableOfContentsCardSection *)self init];
  if (v5)
  {
    if ([v4 hasTableOfContentsType]) {
      -[_SFPBSafariTableOfContentsCardSection setTableOfContentsType:](v5, "setTableOfContentsType:", [v4 tableOfContentsType]);
    }
    if ([v4 hasTableOfContentsSource]) {
      -[_SFPBSafariTableOfContentsCardSection setTableOfContentsSource:](v5, "setTableOfContentsSource:", [v4 tableOfContentsSource]);
    }
    v6 = [v4 tableOfContentsItems];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v8 = objc_msgSend(v4, "tableOfContentsItems", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
          v13 = [[_SFPBSafariTableOfContentsItem alloc] initWithFacade:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [(_SFPBSafariTableOfContentsCardSection *)v5 setTableOfContentsItems:v7];
    v14 = [v4 algorithmVersion];

    if (v14)
    {
      v15 = [v4 algorithmVersion];
      [(_SFPBSafariTableOfContentsCardSection *)v5 setAlgorithmVersion:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmVersion, 0);
  objc_storeStrong((id *)&self->_tableOfContentsItems, 0);
}

- (NSString)algorithmVersion
{
  return self->_algorithmVersion;
}

- (NSArray)tableOfContentsItems
{
  return self->_tableOfContentsItems;
}

- (int)tableOfContentsSource
{
  return self->_tableOfContentsSource;
}

- (int)tableOfContentsType
{
  return self->_tableOfContentsType;
}

- (_SFPBSafariTableOfContentsCardSection)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_SFPBSafariTableOfContentsCardSection;
  v5 = [(_SFPBSafariTableOfContentsCardSection *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"tableOfContentsType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSafariTableOfContentsCardSection setTableOfContentsType:](v5, "setTableOfContentsType:", [v6 intValue]);
    }
    id v7 = [v4 objectForKeyedSubscript:@"tableOfContentsSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSafariTableOfContentsCardSection setTableOfContentsSource:](v5, "setTableOfContentsSource:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"tableOfContentsItems"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = v7;
      long long v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[_SFPBSafariTableOfContentsItem alloc] initWithDictionary:v14];
              [(_SFPBSafariTableOfContentsCardSection *)v5 addTableOfContentsItems:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v11);
      }

      id v7 = v20;
      v6 = v21;
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"algorithmVersion", v20, v21, (void)v22);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBSafariTableOfContentsCardSection *)v5 setAlgorithmVersion:v17];
    }
    long long v18 = v5;
  }
  return v5;
}

- (_SFPBSafariTableOfContentsCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSafariTableOfContentsCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSafariTableOfContentsCardSection *)self dictionaryRepresentation];
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_algorithmVersion)
  {
    id v4 = [(_SFPBSafariTableOfContentsCardSection *)self algorithmVersion];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"algorithmVersion"];
  }
  if ([(NSArray *)self->_tableOfContentsItems count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_tableOfContentsItems;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"tableOfContentsItems"];
  }
  if (self->_tableOfContentsSource)
  {
    uint64_t v14 = [(_SFPBSafariTableOfContentsCardSection *)self tableOfContentsSource];
    if (v14 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E5A2F058[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"tableOfContentsSource"];
  }
  if (self->_tableOfContentsType)
  {
    uint64_t v16 = [(_SFPBSafariTableOfContentsCardSection *)self tableOfContentsType];
    if (v16 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E5A2F058[v16];
    }
    [v3 setObject:v17 forKeyedSubscript:@"tableOfContentsType"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = (2654435761 * self->_tableOfContentsSource) ^ (2654435761 * self->_tableOfContentsType);
  uint64_t v4 = [(NSArray *)self->_tableOfContentsItems hash];
  return v3 ^ v4 ^ [(NSString *)self->_algorithmVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  int tableOfContentsType = self->_tableOfContentsType;
  if (tableOfContentsType != [v4 tableOfContentsType]) {
    goto LABEL_14;
  }
  int tableOfContentsSource = self->_tableOfContentsSource;
  if (tableOfContentsSource != [v4 tableOfContentsSource]) {
    goto LABEL_14;
  }
  uint64_t v7 = [(_SFPBSafariTableOfContentsCardSection *)self tableOfContentsItems];
  uint64_t v8 = [v4 tableOfContentsItems];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_13;
  }
  uint64_t v9 = [(_SFPBSafariTableOfContentsCardSection *)self tableOfContentsItems];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(_SFPBSafariTableOfContentsCardSection *)self tableOfContentsItems];
    uint64_t v12 = [v4 tableOfContentsItems];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  uint64_t v7 = [(_SFPBSafariTableOfContentsCardSection *)self algorithmVersion];
  uint64_t v8 = [v4 algorithmVersion];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v14 = [(_SFPBSafariTableOfContentsCardSection *)self algorithmVersion];
    if (!v14)
    {

LABEL_17:
      BOOL v19 = 1;
      goto LABEL_15;
    }
    v15 = (void *)v14;
    uint64_t v16 = [(_SFPBSafariTableOfContentsCardSection *)self algorithmVersion];
    v17 = [v4 algorithmVersion];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_17;
    }
  }
  else
  {
LABEL_13:
  }
LABEL_14:
  BOOL v19 = 0;
LABEL_15:

  return v19;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_SFPBSafariTableOfContentsCardSection *)self tableOfContentsType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBSafariTableOfContentsCardSection *)self tableOfContentsSource]) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(_SFPBSafariTableOfContentsCardSection *)self tableOfContentsItems];
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

  uint64_t v10 = [(_SFPBSafariTableOfContentsCardSection *)self algorithmVersion];
  if (v10) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSafariTableOfContentsCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setAlgorithmVersion:(id)a3
{
  self->_algorithmVersion = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)tableOfContentsItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_tableOfContentsItems objectAtIndexedSubscript:a3];
}

- (unint64_t)tableOfContentsItemsCount
{
  return [(NSArray *)self->_tableOfContentsItems count];
}

- (void)addTableOfContentsItems:(id)a3
{
  id v4 = a3;
  tableOfContentsItems = self->_tableOfContentsItems;
  id v8 = v4;
  if (!tableOfContentsItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tableOfContentsItems;
    self->_tableOfContentsItems = v6;

    id v4 = v8;
    tableOfContentsItems = self->_tableOfContentsItems;
  }
  [(NSArray *)tableOfContentsItems addObject:v4];
}

- (void)clearTableOfContentsItems
{
}

- (void)setTableOfContentsItems:(id)a3
{
  self->_tableOfContentsItems = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setTableOfContentsSource:(int)a3
{
  self->_int tableOfContentsSource = a3;
}

- (void)setTableOfContentsType:(int)a3
{
  self->_int tableOfContentsType = a3;
}

@end