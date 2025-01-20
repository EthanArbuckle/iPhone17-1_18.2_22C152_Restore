@interface _SFPBSplitCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)listItems;
- (NSData)jsonData;
- (NSString)listMoreString;
- (NSString)listPrefix;
- (_SFPBRichText)body;
- (_SFPBRichText)bottomTitle;
- (_SFPBRichText)secondaryTopTitle;
- (_SFPBRichText)topTitle;
- (_SFPBSplitCardSection)initWithDictionary:(id)a3;
- (_SFPBSplitCardSection)initWithFacade:(id)a3;
- (_SFPBSplitCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)listItemsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)listItemsCount;
- (void)addListItems:(id)a3;
- (void)clearListItems;
- (void)setBody:(id)a3;
- (void)setBottomTitle:(id)a3;
- (void)setListItems:(id)a3;
- (void)setListMoreString:(id)a3;
- (void)setListPrefix:(id)a3;
- (void)setSecondaryTopTitle:(id)a3;
- (void)setTopTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSplitCardSection

- (_SFPBSplitCardSection)initWithFacade:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBSplitCardSection *)self init];
  if (v5)
  {
    v6 = [v4 topTitle];

    if (v6)
    {
      v7 = [_SFPBRichText alloc];
      v8 = [v4 topTitle];
      v9 = [(_SFPBRichText *)v7 initWithFacade:v8];
      [(_SFPBSplitCardSection *)v5 setTopTitle:v9];
    }
    v10 = [v4 secondaryTopTitle];

    if (v10)
    {
      v11 = [_SFPBRichText alloc];
      v12 = [v4 secondaryTopTitle];
      v13 = [(_SFPBRichText *)v11 initWithFacade:v12];
      [(_SFPBSplitCardSection *)v5 setSecondaryTopTitle:v13];
    }
    v14 = [v4 listPrefix];

    if (v14)
    {
      v15 = [v4 listPrefix];
      [(_SFPBSplitCardSection *)v5 setListPrefix:v15];
    }
    v16 = [v4 listItems];
    if (v16) {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v17 = 0;
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v18 = objc_msgSend(v4, "listItems", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          if (*(void *)(*((void *)&v35 + 1) + 8 * i)) {
            objc_msgSend(v17, "addObject:");
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v20);
    }

    [(_SFPBSplitCardSection *)v5 setListItems:v17];
    v23 = [v4 listMoreString];

    if (v23)
    {
      v24 = [v4 listMoreString];
      [(_SFPBSplitCardSection *)v5 setListMoreString:v24];
    }
    v25 = [v4 bottomTitle];

    if (v25)
    {
      v26 = [_SFPBRichText alloc];
      v27 = [v4 bottomTitle];
      v28 = [(_SFPBRichText *)v26 initWithFacade:v27];
      [(_SFPBSplitCardSection *)v5 setBottomTitle:v28];
    }
    v29 = [v4 body];

    if (v29)
    {
      v30 = [_SFPBRichText alloc];
      v31 = [v4 body];
      v32 = [(_SFPBRichText *)v30 initWithFacade:v31];
      [(_SFPBSplitCardSection *)v5 setBody:v32];
    }
    v33 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_bottomTitle, 0);
  objc_storeStrong((id *)&self->_listMoreString, 0);
  objc_storeStrong((id *)&self->_listItems, 0);
  objc_storeStrong((id *)&self->_listPrefix, 0);
  objc_storeStrong((id *)&self->_secondaryTopTitle, 0);
  objc_storeStrong((id *)&self->_topTitle, 0);
}

- (_SFPBRichText)body
{
  return self->_body;
}

- (_SFPBRichText)bottomTitle
{
  return self->_bottomTitle;
}

- (NSString)listMoreString
{
  return self->_listMoreString;
}

- (NSArray)listItems
{
  return self->_listItems;
}

- (NSString)listPrefix
{
  return self->_listPrefix;
}

- (_SFPBRichText)secondaryTopTitle
{
  return self->_secondaryTopTitle;
}

- (_SFPBRichText)topTitle
{
  return self->_topTitle;
}

- (_SFPBSplitCardSection)initWithDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_SFPBSplitCardSection;
  v5 = [(_SFPBSplitCardSection *)&v34 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"topTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRichText alloc] initWithDictionary:v6];
      [(_SFPBSplitCardSection *)v5 setTopTitle:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"secondaryTopTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRichText alloc] initWithDictionary:v8];
      [(_SFPBSplitCardSection *)v5 setSecondaryTopTitle:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"listPrefix"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBSplitCardSection *)v5 setListPrefix:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"listItems"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = v8;
      v29 = v6;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v19 = (void *)[v18 copy];
              [(_SFPBSplitCardSection *)v5 addListItems:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v15);
      }

      v8 = v28;
      v6 = v29;
    }
    uint64_t v20 = objc_msgSend(v4, "objectForKeyedSubscript:", @"listMoreString", v28);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v21 = (void *)[v20 copy];
      [(_SFPBSplitCardSection *)v5 setListMoreString:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"bottomTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [[_SFPBRichText alloc] initWithDictionary:v22];
      [(_SFPBSplitCardSection *)v5 setBottomTitle:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"body"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBRichText alloc] initWithDictionary:v24];
      [(_SFPBSplitCardSection *)v5 setBody:v25];
    }
    v26 = v5;
  }
  return v5;
}

- (_SFPBSplitCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSplitCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSplitCardSection *)self dictionaryRepresentation];
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
  if (self->_body)
  {
    id v4 = [(_SFPBSplitCardSection *)self body];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"body"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"body"];
    }
  }
  if (self->_bottomTitle)
  {
    uint64_t v7 = [(_SFPBSplitCardSection *)self bottomTitle];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"bottomTitle"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"bottomTitle"];
    }
  }
  if (self->_listItems)
  {
    v10 = [(_SFPBSplitCardSection *)self listItems];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"listItems"];
  }
  if (self->_listMoreString)
  {
    v12 = [(_SFPBSplitCardSection *)self listMoreString];
    id v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"listMoreString"];
  }
  if (self->_listPrefix)
  {
    uint64_t v14 = [(_SFPBSplitCardSection *)self listPrefix];
    uint64_t v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"listPrefix"];
  }
  if (self->_secondaryTopTitle)
  {
    uint64_t v16 = [(_SFPBSplitCardSection *)self secondaryTopTitle];
    id v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"secondaryTopTitle"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"secondaryTopTitle"];
    }
  }
  if (self->_topTitle)
  {
    uint64_t v19 = [(_SFPBSplitCardSection *)self topTitle];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"topTitle"];
    }
    else
    {
      uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"topTitle"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRichText *)self->_topTitle hash];
  unint64_t v4 = [(_SFPBRichText *)self->_secondaryTopTitle hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_listPrefix hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_listItems hash];
  NSUInteger v7 = [(NSString *)self->_listMoreString hash];
  unint64_t v8 = v7 ^ [(_SFPBRichText *)self->_bottomTitle hash];
  return v6 ^ v8 ^ [(_SFPBRichText *)self->_body hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  NSUInteger v5 = [(_SFPBSplitCardSection *)self topTitle];
  uint64_t v6 = [v4 topTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(_SFPBSplitCardSection *)self topTitle];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(_SFPBSplitCardSection *)self topTitle];
    v10 = [v4 topTitle];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSplitCardSection *)self secondaryTopTitle];
  uint64_t v6 = [v4 secondaryTopTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(_SFPBSplitCardSection *)self secondaryTopTitle];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(_SFPBSplitCardSection *)self secondaryTopTitle];
    uint64_t v15 = [v4 secondaryTopTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSplitCardSection *)self listPrefix];
  uint64_t v6 = [v4 listPrefix];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(_SFPBSplitCardSection *)self listPrefix];
  if (v17)
  {
    v18 = (void *)v17;
    uint64_t v19 = [(_SFPBSplitCardSection *)self listPrefix];
    uint64_t v20 = [v4 listPrefix];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSplitCardSection *)self listItems];
  uint64_t v6 = [v4 listItems];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v22 = [(_SFPBSplitCardSection *)self listItems];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBSplitCardSection *)self listItems];
    v25 = [v4 listItems];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSplitCardSection *)self listMoreString];
  uint64_t v6 = [v4 listMoreString];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v27 = [(_SFPBSplitCardSection *)self listMoreString];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBSplitCardSection *)self listMoreString];
    long long v30 = [v4 listMoreString];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSplitCardSection *)self bottomTitle];
  uint64_t v6 = [v4 bottomTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v32 = [(_SFPBSplitCardSection *)self bottomTitle];
  if (v32)
  {
    long long v33 = (void *)v32;
    objc_super v34 = [(_SFPBSplitCardSection *)self bottomTitle];
    long long v35 = [v4 bottomTitle];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBSplitCardSection *)self body];
  uint64_t v6 = [v4 body];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v37 = [(_SFPBSplitCardSection *)self body];
    if (!v37)
    {

LABEL_40:
      BOOL v42 = 1;
      goto LABEL_38;
    }
    long long v38 = (void *)v37;
    v39 = [(_SFPBSplitCardSection *)self body];
    uint64_t v40 = [v4 body];
    char v41 = [v39 isEqual:v40];

    if (v41) {
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
  }
LABEL_37:
  BOOL v42 = 0;
LABEL_38:

  return v42;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBSplitCardSection *)self topTitle];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBSplitCardSection *)self secondaryTopTitle];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBSplitCardSection *)self listPrefix];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  unint64_t v8 = [(_SFPBSplitCardSection *)self listItems];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteStringField();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v13 = [(_SFPBSplitCardSection *)self listMoreString];
  if (v13) {
    PBDataWriterWriteStringField();
  }

  uint64_t v14 = [(_SFPBSplitCardSection *)self bottomTitle];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v15 = [(_SFPBSplitCardSection *)self body];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSplitCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setBody:(id)a3
{
}

- (void)setBottomTitle:(id)a3
{
}

- (void)setListMoreString:(id)a3
{
  self->_listMoreString = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)listItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_listItems objectAtIndexedSubscript:a3];
}

- (unint64_t)listItemsCount
{
  return [(NSArray *)self->_listItems count];
}

- (void)addListItems:(id)a3
{
  id v4 = a3;
  listItems = self->_listItems;
  id v8 = v4;
  if (!listItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_listItems;
    self->_listItems = v6;

    id v4 = v8;
    listItems = self->_listItems;
  }
  [(NSArray *)listItems addObject:v4];
}

- (void)clearListItems
{
}

- (void)setListItems:(id)a3
{
  self->_listItems = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setListPrefix:(id)a3
{
  self->_listPrefix = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSecondaryTopTitle:(id)a3
{
}

- (void)setTopTitle:(id)a3
{
}

@end