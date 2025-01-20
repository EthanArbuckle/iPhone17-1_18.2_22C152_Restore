@interface _SFPBRFExpandableStandardCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)expanding_component_contents;
- (NSData)jsonData;
- (_SFPBRFExpandableStandardCardSection)initWithDictionary:(id)a3;
- (_SFPBRFExpandableStandardCardSection)initWithFacade:(id)a3;
- (_SFPBRFExpandableStandardCardSection)initWithJSON:(id)a3;
- (_SFPBRFSummaryItemStandardCardSection)summary_item_standard_card_section;
- (id)dictionaryRepresentation;
- (id)expanding_component_contentAtIndex:(unint64_t)a3;
- (unint64_t)expanding_component_contentCount;
- (unint64_t)hash;
- (unint64_t)whichPrimary_Component;
- (void)addExpanding_component_content:(id)a3;
- (void)clearExpanding_component_content;
- (void)setExpanding_component_content:(id)a3;
- (void)setExpanding_component_contents:(id)a3;
- (void)setSummary_item_standard_card_section:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFExpandableStandardCardSection

- (_SFPBRFExpandableStandardCardSection)initWithFacade:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFExpandableStandardCardSection *)self init];
  if (v5)
  {
    if (objc_msgSend(v4, "hasSummary_item_standard_card_section"))
    {
      v6 = objc_msgSend(v4, "summary_item_standard_card_section");

      if (v6)
      {
        v7 = [_SFPBRFSummaryItemStandardCardSection alloc];
        v8 = objc_msgSend(v4, "summary_item_standard_card_section");
        v9 = [(_SFPBRFSummaryItemStandardCardSection *)v7 initWithFacade:v8];
        [(_SFPBRFExpandableStandardCardSection *)v5 setSummary_item_standard_card_section:v9];
      }
    }
    v10 = objc_msgSend(v4, "expanding_component_content");
    if (v10) {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v11 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = objc_msgSend(v4, "expanding_component_content", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [[_SFPBRFExpandingComponentContent alloc] initWithFacade:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    [(_SFPBRFExpandableStandardCardSection *)v5 setExpanding_component_contents:v11];
    v18 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expanding_component_contents, 0);
  objc_storeStrong((id *)&self->_summary_item_standard_card_section, 0);
}

- (unint64_t)whichPrimary_Component
{
  return self->_whichPrimary_Component;
}

- (void)setExpanding_component_contents:(id)a3
{
}

- (NSArray)expanding_component_contents
{
  return self->_expanding_component_contents;
}

- (_SFPBRFExpandableStandardCardSection)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_SFPBRFExpandableStandardCardSection;
  v5 = [(_SFPBRFExpandableStandardCardSection *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"summaryItemStandardCardSection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFSummaryItemStandardCardSection alloc] initWithDictionary:v6];
      [(_SFPBRFExpandableStandardCardSection *)v5 setSummary_item_standard_card_section:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"expandingComponentContent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = [[_SFPBRFExpandingComponentContent alloc] initWithDictionary:v14];
              [(_SFPBRFExpandableStandardCardSection *)v5 addExpanding_component_content:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;
  }
  return v5;
}

- (_SFPBRFExpandableStandardCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFExpandableStandardCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFExpandableStandardCardSection *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_expanding_component_contents count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_expanding_component_contents;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"expandingComponentContent"];
  }
  if (self->_summary_item_standard_card_section)
  {
    uint64_t v12 = [(_SFPBRFExpandableStandardCardSection *)self summary_item_standard_card_section];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"summaryItemStandardCardSection"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"summaryItemStandardCardSection"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFSummaryItemStandardCardSection *)self->_summary_item_standard_card_section hash];
  return [(NSArray *)self->_expanding_component_contents hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBRFExpandableStandardCardSection *)self summary_item_standard_card_section];
  uint64_t v6 = objc_msgSend(v4, "summary_item_standard_card_section");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBRFExpandableStandardCardSection *)self summary_item_standard_card_section];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(_SFPBRFExpandableStandardCardSection *)self summary_item_standard_card_section];
    uint64_t v10 = objc_msgSend(v4, "summary_item_standard_card_section");
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFExpandableStandardCardSection *)self expanding_component_contents];
  uint64_t v6 = objc_msgSend(v4, "expanding_component_contents");
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBRFExpandableStandardCardSection *)self expanding_component_contents];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFExpandableStandardCardSection *)self expanding_component_contents];
    uint64_t v15 = objc_msgSend(v4, "expanding_component_contents");
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
  v5 = [(_SFPBRFExpandableStandardCardSection *)self summary_item_standard_card_section];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBRFExpandableStandardCardSection *)self expanding_component_contents];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFExpandableStandardCardSectionReadFrom(self, (uint64_t)a3);
}

- (id)expanding_component_contentAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_expanding_component_contents objectAtIndexedSubscript:a3];
}

- (unint64_t)expanding_component_contentCount
{
  return [(NSArray *)self->_expanding_component_contents count];
}

- (void)addExpanding_component_content:(id)a3
{
  id v4 = a3;
  expanding_component_contents = self->_expanding_component_contents;
  id v8 = v4;
  if (!expanding_component_contents)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_expanding_component_contents;
    self->_expanding_component_contents = v6;

    id v4 = v8;
    expanding_component_contents = self->_expanding_component_contents;
  }
  [(NSArray *)expanding_component_contents addObject:v4];
}

- (void)clearExpanding_component_content
{
}

- (void)setExpanding_component_content:(id)a3
{
  self->_expanding_component_contents = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (_SFPBRFSummaryItemStandardCardSection)summary_item_standard_card_section
{
  if (self->_whichPrimary_Component == 1) {
    v2 = self->_summary_item_standard_card_section;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSummary_item_standard_card_section:(id)a3
{
  self->_whichPrimary_Component = a3 != 0;
  objc_storeStrong((id *)&self->_summary_item_standard_card_section, a3);
}

@end