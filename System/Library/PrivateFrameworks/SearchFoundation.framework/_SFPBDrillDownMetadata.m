@interface _SFPBDrillDownMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)cardDomains;
- (NSArray)cardIdentifiers;
- (NSData)jsonData;
- (NSString)cardIdentifier;
- (NSString)debugParams;
- (NSString)params;
- (NSString)qtype;
- (NSString)viewConfigName;
- (_SFPBCardMetadata)cardOnlyMetadata;
- (_SFPBCardSearchMetadata)cardSearchMetadata;
- (_SFPBDrillDownMetadata)initWithDictionary:(id)a3;
- (_SFPBDrillDownMetadata)initWithFacade:(id)a3;
- (_SFPBDrillDownMetadata)initWithJSON:(id)a3;
- (_SFPBEntitySearchMetadata)entitySearchMetadata;
- (_SFPBEntitySearchMetadata)entitySearchOnlyMetadata;
- (id)cardDomainsAtIndex:(unint64_t)a3;
- (id)cardIdentifiersAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (unint64_t)cardDomainsCount;
- (unint64_t)cardIdentifiersCount;
- (unint64_t)hash;
- (unint64_t)whichMetadata;
- (void)addCardDomains:(id)a3;
- (void)addCardIdentifiers:(id)a3;
- (void)clearCardDomains;
- (void)clearCardIdentifiers;
- (void)setCardDomains:(id)a3;
- (void)setCardIdentifier:(id)a3;
- (void)setCardIdentifiers:(id)a3;
- (void)setCardOnlyMetadata:(id)a3;
- (void)setCardSearchMetadata:(id)a3;
- (void)setDebugParams:(id)a3;
- (void)setEntitySearchMetadata:(id)a3;
- (void)setEntitySearchOnlyMetadata:(id)a3;
- (void)setParams:(id)a3;
- (void)setQtype:(id)a3;
- (void)setViewConfigName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBDrillDownMetadata

- (_SFPBDrillDownMetadata)initWithFacade:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBDrillDownMetadata *)self init];
  if (v5)
  {
    v6 = [v4 cardIdentifier];

    if (v6)
    {
      v7 = [v4 cardIdentifier];
      [(_SFPBDrillDownMetadata *)v5 setCardIdentifier:v7];
    }
    v8 = [v4 cardIdentifiers];
    if (v8) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v9 = 0;
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v10 = [v4 cardIdentifiers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v53 != v13) {
            objc_enumerationMutation(v10);
          }
          if (*(void *)(*((void *)&v52 + 1) + 8 * i)) {
            objc_msgSend(v9, "addObject:");
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v12);
    }

    [(_SFPBDrillDownMetadata *)v5 setCardIdentifiers:v9];
    v15 = [v4 cardDomains];
    if (v15) {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v16 = 0;
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v17 = objc_msgSend(v4, "cardDomains", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v49 != v20) {
            objc_enumerationMutation(v17);
          }
          if (*(void *)(*((void *)&v48 + 1) + 8 * j)) {
            objc_msgSend(v16, "addObject:");
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v19);
    }

    [(_SFPBDrillDownMetadata *)v5 setCardDomains:v16];
    v22 = [v4 qtype];

    if (v22)
    {
      v23 = [v4 qtype];
      [(_SFPBDrillDownMetadata *)v5 setQtype:v23];
    }
    v24 = [v4 viewConfigName];

    if (v24)
    {
      v25 = [v4 viewConfigName];
      [(_SFPBDrillDownMetadata *)v5 setViewConfigName:v25];
    }
    if ([v4 hasCardOnlyMetadata])
    {
      v26 = [v4 cardOnlyMetadata];

      if (v26)
      {
        v27 = [_SFPBCardMetadata alloc];
        v28 = [v4 cardOnlyMetadata];
        v29 = [(_SFPBCardMetadata *)v27 initWithFacade:v28];
        [(_SFPBDrillDownMetadata *)v5 setCardOnlyMetadata:v29];
      }
    }
    if ([v4 hasEntitySearchOnlyMetadata])
    {
      v30 = [v4 entitySearchOnlyMetadata];

      if (v30)
      {
        v31 = [_SFPBEntitySearchMetadata alloc];
        v32 = [v4 entitySearchOnlyMetadata];
        v33 = [(_SFPBEntitySearchMetadata *)v31 initWithFacade:v32];
        [(_SFPBDrillDownMetadata *)v5 setEntitySearchOnlyMetadata:v33];
      }
    }
    if ([v4 hasCardSearchMetadata])
    {
      v34 = [v4 cardSearchMetadata];

      if (v34)
      {
        v35 = [_SFPBCardSearchMetadata alloc];
        v36 = [v4 cardSearchMetadata];
        v37 = [(_SFPBCardSearchMetadata *)v35 initWithFacade:v36];
        [(_SFPBDrillDownMetadata *)v5 setCardSearchMetadata:v37];
      }
    }
    if ([v4 hasEntitySearchMetadata])
    {
      v38 = [v4 entitySearchMetadata];

      if (v38)
      {
        v39 = [_SFPBEntitySearchMetadata alloc];
        v40 = [v4 entitySearchMetadata];
        v41 = [(_SFPBEntitySearchMetadata *)v39 initWithFacade:v40];
        [(_SFPBDrillDownMetadata *)v5 setEntitySearchMetadata:v41];
      }
    }
    v42 = [v4 debugParams];

    if (v42)
    {
      v43 = [v4 debugParams];
      [(_SFPBDrillDownMetadata *)v5 setDebugParams:v43];
    }
    v44 = [v4 params];

    if (v44)
    {
      v45 = [v4 params];
      [(_SFPBDrillDownMetadata *)v5 setParams:v45];
    }
    v46 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_debugParams, 0);
  objc_storeStrong((id *)&self->_entitySearchMetadata, 0);
  objc_storeStrong((id *)&self->_cardSearchMetadata, 0);
  objc_storeStrong((id *)&self->_entitySearchOnlyMetadata, 0);
  objc_storeStrong((id *)&self->_cardOnlyMetadata, 0);
  objc_storeStrong((id *)&self->_viewConfigName, 0);
  objc_storeStrong((id *)&self->_qtype, 0);
  objc_storeStrong((id *)&self->_cardDomains, 0);
  objc_storeStrong((id *)&self->_cardIdentifiers, 0);
  objc_storeStrong((id *)&self->_cardIdentifier, 0);
}

- (unint64_t)whichMetadata
{
  return self->_whichMetadata;
}

- (NSString)params
{
  return self->_params;
}

- (NSString)debugParams
{
  return self->_debugParams;
}

- (NSString)viewConfigName
{
  return self->_viewConfigName;
}

- (NSString)qtype
{
  return self->_qtype;
}

- (NSArray)cardDomains
{
  return self->_cardDomains;
}

- (NSArray)cardIdentifiers
{
  return self->_cardIdentifiers;
}

- (NSString)cardIdentifier
{
  return self->_cardIdentifier;
}

- (_SFPBDrillDownMetadata)initWithDictionary:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)_SFPBDrillDownMetadata;
  v5 = [(_SFPBDrillDownMetadata *)&v54 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"cardIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBDrillDownMetadata *)v5 setCardIdentifier:v7];
    }
    v45 = v6;
    v8 = [v4 objectForKeyedSubscript:@"cardIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v51;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v51 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v50 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = (void *)[v14 copy];
              [(_SFPBDrillDownMetadata *)v5 addCardIdentifiers:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v50 objects:v56 count:16];
        }
        while (v11);
      }
    }
    id v16 = [v4 objectForKeyedSubscript:@"cardDomains"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v47;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v47 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v46 + 1) + 8 * v21);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = (void *)[v22 copy];
              [(_SFPBDrillDownMetadata *)v5 addCardDomains:v23];
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
        }
        while (v19);
      }
    }
    v24 = [v4 objectForKeyedSubscript:@"qtype"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(_SFPBDrillDownMetadata *)v5 setQtype:v25];
    }
    v26 = objc_msgSend(v4, "objectForKeyedSubscript:", @"viewConfigName", v24);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(_SFPBDrillDownMetadata *)v5 setViewConfigName:v27];
    }
    v43 = v16;
    v28 = [v4 objectForKeyedSubscript:@"cardOnlyMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBCardMetadata alloc] initWithDictionary:v28];
      [(_SFPBDrillDownMetadata *)v5 setCardOnlyMetadata:v29];
    }
    v44 = v8;
    v30 = [v4 objectForKeyedSubscript:@"entitySearchOnlyMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[_SFPBEntitySearchMetadata alloc] initWithDictionary:v30];
      [(_SFPBDrillDownMetadata *)v5 setEntitySearchOnlyMetadata:v31];
    }
    v32 = [v4 objectForKeyedSubscript:@"cardSearchMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[_SFPBCardSearchMetadata alloc] initWithDictionary:v32];
      [(_SFPBDrillDownMetadata *)v5 setCardSearchMetadata:v33];
    }
    v34 = [v4 objectForKeyedSubscript:@"entitySearchMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = [[_SFPBEntitySearchMetadata alloc] initWithDictionary:v34];
      [(_SFPBDrillDownMetadata *)v5 setEntitySearchMetadata:v35];
    }
    v36 = [v4 objectForKeyedSubscript:@"debugParams"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = (void *)[v36 copy];
      [(_SFPBDrillDownMetadata *)v5 setDebugParams:v37];
    }
    v38 = [v4 objectForKeyedSubscript:@"params"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = (void *)[v38 copy];
      [(_SFPBDrillDownMetadata *)v5 setParams:v39];
    }
    v40 = v5;
  }
  return v5;
}

- (_SFPBDrillDownMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBDrillDownMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBDrillDownMetadata *)self dictionaryRepresentation];
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
  if (self->_cardDomains)
  {
    id v4 = [(_SFPBDrillDownMetadata *)self cardDomains];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"cardDomains"];
  }
  if (self->_cardIdentifier)
  {
    v6 = [(_SFPBDrillDownMetadata *)self cardIdentifier];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"cardIdentifier"];
  }
  if (self->_cardIdentifiers)
  {
    v8 = [(_SFPBDrillDownMetadata *)self cardIdentifiers];
    id v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"cardIdentifiers"];
  }
  if (self->_cardOnlyMetadata)
  {
    uint64_t v10 = [(_SFPBDrillDownMetadata *)self cardOnlyMetadata];
    uint64_t v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"cardOnlyMetadata"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"cardOnlyMetadata"];
    }
  }
  if (self->_cardSearchMetadata)
  {
    uint64_t v13 = [(_SFPBDrillDownMetadata *)self cardSearchMetadata];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"cardSearchMetadata"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"cardSearchMetadata"];
    }
  }
  if (self->_debugParams)
  {
    id v16 = [(_SFPBDrillDownMetadata *)self debugParams];
    id v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"debugParams"];
  }
  if (self->_entitySearchMetadata)
  {
    uint64_t v18 = [(_SFPBDrillDownMetadata *)self entitySearchMetadata];
    uint64_t v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"entitySearchMetadata"];
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"entitySearchMetadata"];
    }
  }
  if (self->_entitySearchOnlyMetadata)
  {
    uint64_t v21 = [(_SFPBDrillDownMetadata *)self entitySearchOnlyMetadata];
    v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"entitySearchOnlyMetadata"];
    }
    else
    {
      v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"entitySearchOnlyMetadata"];
    }
  }
  if (self->_params)
  {
    v24 = [(_SFPBDrillDownMetadata *)self params];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"params"];
  }
  if (self->_qtype)
  {
    v26 = [(_SFPBDrillDownMetadata *)self qtype];
    v27 = (void *)[v26 copy];
    [v3 setObject:v27 forKeyedSubscript:@"qtype"];
  }
  if (self->_viewConfigName)
  {
    v28 = [(_SFPBDrillDownMetadata *)self viewConfigName];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"viewConfigName"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_cardIdentifier hash];
  uint64_t v4 = [(NSArray *)self->_cardIdentifiers hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_cardDomains hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_qtype hash];
  NSUInteger v7 = [(NSString *)self->_viewConfigName hash];
  unint64_t v8 = v7 ^ [(_SFPBCardMetadata *)self->_cardOnlyMetadata hash];
  unint64_t v9 = v6 ^ v8 ^ [(_SFPBEntitySearchMetadata *)self->_entitySearchOnlyMetadata hash];
  unint64_t v10 = [(_SFPBCardSearchMetadata *)self->_cardSearchMetadata hash];
  unint64_t v11 = v10 ^ [(_SFPBEntitySearchMetadata *)self->_entitySearchMetadata hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_debugParams hash];
  return v9 ^ v12 ^ [(NSString *)self->_params hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  uint64_t v5 = [(_SFPBDrillDownMetadata *)self cardIdentifier];
  NSUInteger v6 = [v4 cardIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v7 = [(_SFPBDrillDownMetadata *)self cardIdentifier];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBDrillDownMetadata *)self cardIdentifier];
    unint64_t v10 = [v4 cardIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDrillDownMetadata *)self cardIdentifiers];
  NSUInteger v6 = [v4 cardIdentifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v12 = [(_SFPBDrillDownMetadata *)self cardIdentifiers];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(_SFPBDrillDownMetadata *)self cardIdentifiers];
    v15 = [v4 cardIdentifiers];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDrillDownMetadata *)self cardDomains];
  NSUInteger v6 = [v4 cardDomains];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v17 = [(_SFPBDrillDownMetadata *)self cardDomains];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBDrillDownMetadata *)self cardDomains];
    uint64_t v20 = [v4 cardDomains];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDrillDownMetadata *)self qtype];
  NSUInteger v6 = [v4 qtype];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v22 = [(_SFPBDrillDownMetadata *)self qtype];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBDrillDownMetadata *)self qtype];
    v25 = [v4 qtype];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDrillDownMetadata *)self viewConfigName];
  NSUInteger v6 = [v4 viewConfigName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v27 = [(_SFPBDrillDownMetadata *)self viewConfigName];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBDrillDownMetadata *)self viewConfigName];
    v30 = [v4 viewConfigName];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDrillDownMetadata *)self cardOnlyMetadata];
  NSUInteger v6 = [v4 cardOnlyMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v32 = [(_SFPBDrillDownMetadata *)self cardOnlyMetadata];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_SFPBDrillDownMetadata *)self cardOnlyMetadata];
    v35 = [v4 cardOnlyMetadata];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDrillDownMetadata *)self entitySearchOnlyMetadata];
  NSUInteger v6 = [v4 entitySearchOnlyMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v37 = [(_SFPBDrillDownMetadata *)self entitySearchOnlyMetadata];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_SFPBDrillDownMetadata *)self entitySearchOnlyMetadata];
    v40 = [v4 entitySearchOnlyMetadata];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDrillDownMetadata *)self cardSearchMetadata];
  NSUInteger v6 = [v4 cardSearchMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v42 = [(_SFPBDrillDownMetadata *)self cardSearchMetadata];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_SFPBDrillDownMetadata *)self cardSearchMetadata];
    v45 = [v4 cardSearchMetadata];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDrillDownMetadata *)self entitySearchMetadata];
  NSUInteger v6 = [v4 entitySearchMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v47 = [(_SFPBDrillDownMetadata *)self entitySearchMetadata];
  if (v47)
  {
    long long v48 = (void *)v47;
    long long v49 = [(_SFPBDrillDownMetadata *)self entitySearchMetadata];
    long long v50 = [v4 entitySearchMetadata];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDrillDownMetadata *)self debugParams];
  NSUInteger v6 = [v4 debugParams];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v52 = [(_SFPBDrillDownMetadata *)self debugParams];
  if (v52)
  {
    long long v53 = (void *)v52;
    objc_super v54 = [(_SFPBDrillDownMetadata *)self debugParams];
    long long v55 = [v4 debugParams];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDrillDownMetadata *)self params];
  NSUInteger v6 = [v4 params];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v57 = [(_SFPBDrillDownMetadata *)self params];
    if (!v57)
    {

LABEL_60:
      BOOL v62 = 1;
      goto LABEL_58;
    }
    uint64_t v58 = (void *)v57;
    v59 = [(_SFPBDrillDownMetadata *)self params];
    v60 = [v4 params];
    char v61 = [v59 isEqual:v60];

    if (v61) {
      goto LABEL_60;
    }
  }
  else
  {
LABEL_56:
  }
LABEL_57:
  BOOL v62 = 0;
LABEL_58:

  return v62;
}

- (void)writeTo:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBDrillDownMetadata *)self cardIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v6 = [(_SFPBDrillDownMetadata *)self cardIdentifiers];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }

  int v11 = [(_SFPBDrillDownMetadata *)self cardDomains];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v13);
  }

  int v16 = [(_SFPBDrillDownMetadata *)self qtype];
  if (v16) {
    PBDataWriterWriteStringField();
  }

  uint64_t v17 = [(_SFPBDrillDownMetadata *)self viewConfigName];
  if (v17) {
    PBDataWriterWriteStringField();
  }

  uint64_t v18 = [(_SFPBDrillDownMetadata *)self cardOnlyMetadata];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v19 = [(_SFPBDrillDownMetadata *)self entitySearchOnlyMetadata];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v20 = [(_SFPBDrillDownMetadata *)self cardSearchMetadata];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }

  int v21 = [(_SFPBDrillDownMetadata *)self entitySearchMetadata];
  if (v21) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v22 = [(_SFPBDrillDownMetadata *)self debugParams];
  if (v22) {
    PBDataWriterWriteStringField();
  }

  v23 = [(_SFPBDrillDownMetadata *)self params];
  if (v23) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBDrillDownMetadataReadFrom(self, (uint64_t)a3);
}

- (void)setParams:(id)a3
{
  self->_params = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDebugParams:(id)a3
{
  self->_debugParams = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (_SFPBEntitySearchMetadata)entitySearchMetadata
{
  if (self->_whichMetadata == 4) {
    v2 = self->_entitySearchMetadata;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEntitySearchMetadata:(id)a3
{
  id v4 = (_SFPBEntitySearchMetadata *)a3;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = 0;

  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = 0;

  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = 0;

  self->_whichMetadata = 4 * (v4 != 0);
  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = v4;
}

- (_SFPBCardSearchMetadata)cardSearchMetadata
{
  if (self->_whichMetadata == 3) {
    v2 = self->_cardSearchMetadata;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCardSearchMetadata:(id)a3
{
  id v4 = (_SFPBCardSearchMetadata *)a3;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = 0;

  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = 0;

  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = 0;

  unint64_t v8 = 3;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_whichMetadata = v8;
  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = v4;
}

- (_SFPBEntitySearchMetadata)entitySearchOnlyMetadata
{
  if (self->_whichMetadata == 2) {
    v2 = self->_entitySearchOnlyMetadata;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEntitySearchOnlyMetadata:(id)a3
{
  id v4 = (_SFPBEntitySearchMetadata *)a3;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = 0;

  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = 0;

  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = 0;

  self->_whichMetadata = 2 * (v4 != 0);
  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = v4;
}

- (_SFPBCardMetadata)cardOnlyMetadata
{
  if (self->_whichMetadata == 1) {
    v2 = self->_cardOnlyMetadata;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCardOnlyMetadata:(id)a3
{
  id v4 = (_SFPBCardMetadata *)a3;
  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = 0;

  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = 0;

  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = 0;

  self->_whichMetadata = v4 != 0;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = v4;
}

- (void)setViewConfigName:(id)a3
{
  self->_viewConfigName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setQtype:(id)a3
{
  self->_qtype = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)cardDomainsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_cardDomains objectAtIndexedSubscript:a3];
}

- (unint64_t)cardDomainsCount
{
  return [(NSArray *)self->_cardDomains count];
}

- (void)addCardDomains:(id)a3
{
  id v4 = a3;
  cardDomains = self->_cardDomains;
  id v8 = v4;
  if (!cardDomains)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_cardDomains;
    self->_cardDomains = v6;

    id v4 = v8;
    cardDomains = self->_cardDomains;
  }
  [(NSArray *)cardDomains addObject:v4];
}

- (void)clearCardDomains
{
}

- (void)setCardDomains:(id)a3
{
  self->_cardDomains = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)cardIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_cardIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)cardIdentifiersCount
{
  return [(NSArray *)self->_cardIdentifiers count];
}

- (void)addCardIdentifiers:(id)a3
{
  id v4 = a3;
  cardIdentifiers = self->_cardIdentifiers;
  id v8 = v4;
  if (!cardIdentifiers)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_cardIdentifiers;
    self->_cardIdentifiers = v6;

    id v4 = v8;
    cardIdentifiers = self->_cardIdentifiers;
  }
  [(NSArray *)cardIdentifiers addObject:v4];
}

- (void)clearCardIdentifiers
{
}

- (void)setCardIdentifiers:(id)a3
{
  self->_cardIdentifiers = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCardIdentifier:(id)a3
{
  self->_cardIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end