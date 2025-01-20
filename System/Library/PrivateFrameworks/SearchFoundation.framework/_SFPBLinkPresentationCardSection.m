@interface _SFPBLinkPresentationCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighlighted;
- (BOOL)readFrom:(id)a3;
- (NSArray)peopleToBadges;
- (NSData)jsonData;
- (NSString)coreSpotlightIdentifier;
- (NSString)url;
- (_SFPBLinkPresentationCardSection)initWithDictionary:(id)a3;
- (_SFPBLinkPresentationCardSection)initWithFacade:(id)a3;
- (_SFPBLinkPresentationCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)peopleToBadgeAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)peopleToBadgeCount;
- (void)addPeopleToBadge:(id)a3;
- (void)clearPeopleToBadge;
- (void)setCoreSpotlightIdentifier:(id)a3;
- (void)setIsHighlighted:(BOOL)a3;
- (void)setPeopleToBadge:(id)a3;
- (void)setPeopleToBadges:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBLinkPresentationCardSection

- (_SFPBLinkPresentationCardSection)initWithFacade:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBLinkPresentationCardSection *)self init];
  if (v5)
  {
    v6 = [v4 coreSpotlightIdentifier];

    if (v6)
    {
      v7 = [v4 coreSpotlightIdentifier];
      [(_SFPBLinkPresentationCardSection *)v5 setCoreSpotlightIdentifier:v7];
    }
    v8 = [v4 url];

    if (v8)
    {
      v9 = [v4 url];
      [(_SFPBLinkPresentationCardSection *)v5 setUrl:v9];
    }
    v10 = [v4 peopleToBadge];
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
    v12 = objc_msgSend(v4, "peopleToBadge", 0);
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
          v17 = [[_SFPBPerson alloc] initWithFacade:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    [(_SFPBLinkPresentationCardSection *)v5 setPeopleToBadges:v11];
    if ([v4 hasIsHighlighted]) {
      -[_SFPBLinkPresentationCardSection setIsHighlighted:](v5, "setIsHighlighted:", [v4 isHighlighted]);
    }
    v18 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleToBadges, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (void)setPeopleToBadges:(id)a3
{
}

- (NSArray)peopleToBadges
{
  return self->_peopleToBadges;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (_SFPBLinkPresentationCardSection)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_SFPBLinkPresentationCardSection;
  v5 = [(_SFPBLinkPresentationCardSection *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"coreSpotlightIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBLinkPresentationCardSection *)v5 setCoreSpotlightIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBLinkPresentationCardSection *)v5 setUrl:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"peopleToBadge"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = v8;
      long long v22 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[_SFPBPerson alloc] initWithDictionary:v16];
              [(_SFPBLinkPresentationCardSection *)v5 addPeopleToBadge:v17];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v13);
      }

      v8 = v21;
      v6 = v22;
    }
    v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isHighlighted", v21, v22, (void)v23);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBLinkPresentationCardSection setIsHighlighted:](v5, "setIsHighlighted:", [v18 BOOLValue]);
    }
    v19 = v5;
  }
  return v5;
}

- (_SFPBLinkPresentationCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBLinkPresentationCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBLinkPresentationCardSection *)self dictionaryRepresentation];
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
  if (self->_coreSpotlightIdentifier)
  {
    id v4 = [(_SFPBLinkPresentationCardSection *)self coreSpotlightIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"coreSpotlightIdentifier"];
  }
  if (self->_isHighlighted)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBLinkPresentationCardSection isHighlighted](self, "isHighlighted"));
    [v3 setObject:v6 forKeyedSubscript:@"isHighlighted"];
  }
  if ([(NSArray *)self->_peopleToBadges count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v8 = self->_peopleToBadges;
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
            uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"peopleToBadge"];
  }
  if (self->_url)
  {
    uint64_t v15 = [(_SFPBLinkPresentationCardSection *)self url];
    uint64_t v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"url"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_coreSpotlightIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_url hash];
  uint64_t v5 = [(NSArray *)self->_peopleToBadges hash];
  uint64_t v6 = 2654435761;
  if (!self->_isHighlighted) {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  uint64_t v5 = [(_SFPBLinkPresentationCardSection *)self coreSpotlightIdentifier];
  uint64_t v6 = [v4 coreSpotlightIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBLinkPresentationCardSection *)self coreSpotlightIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [(_SFPBLinkPresentationCardSection *)self coreSpotlightIdentifier];
    uint64_t v10 = [v4 coreSpotlightIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBLinkPresentationCardSection *)self url];
  uint64_t v6 = [v4 url];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBLinkPresentationCardSection *)self url];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBLinkPresentationCardSection *)self url];
    uint64_t v15 = [v4 url];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBLinkPresentationCardSection *)self peopleToBadges];
  uint64_t v6 = [v4 peopleToBadges];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBLinkPresentationCardSection *)self peopleToBadges];
    if (!v17)
    {

LABEL_20:
      int isHighlighted = self->_isHighlighted;
      BOOL v22 = isHighlighted == [v4 isHighlighted];
      goto LABEL_18;
    }
    long long v18 = (void *)v17;
    long long v19 = [(_SFPBLinkPresentationCardSection *)self peopleToBadges];
    long long v20 = [v4 peopleToBadges];
    int v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBLinkPresentationCardSection *)self coreSpotlightIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  uint64_t v6 = [(_SFPBLinkPresentationCardSection *)self url];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  uint64_t v7 = [(_SFPBLinkPresentationCardSection *)self peopleToBadges];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if ([(_SFPBLinkPresentationCardSection *)self isHighlighted]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBLinkPresentationCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setIsHighlighted:(BOOL)a3
{
  self->_int isHighlighted = a3;
}

- (id)peopleToBadgeAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_peopleToBadges objectAtIndexedSubscript:a3];
}

- (unint64_t)peopleToBadgeCount
{
  return [(NSArray *)self->_peopleToBadges count];
}

- (void)addPeopleToBadge:(id)a3
{
  id v4 = a3;
  peopleToBadges = self->_peopleToBadges;
  id v8 = v4;
  if (!peopleToBadges)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_peopleToBadges;
    self->_peopleToBadges = v6;

    id v4 = v8;
    peopleToBadges = self->_peopleToBadges;
  }
  [(NSArray *)peopleToBadges addObject:v4];
}

- (void)clearPeopleToBadge
{
}

- (void)setPeopleToBadge:(id)a3
{
  self->_peopleToBadges = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setUrl:(id)a3
{
  self->_url = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
  self->_coreSpotlightIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end