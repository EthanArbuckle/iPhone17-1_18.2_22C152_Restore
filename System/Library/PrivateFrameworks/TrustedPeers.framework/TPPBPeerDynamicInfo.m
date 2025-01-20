@interface TPPBPeerDynamicInfo
+ (Class)dispositionsType;
+ (Class)excludedType;
+ (Class)includedType;
+ (Class)preapprovalsType;
- (BOOL)hasClock;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)dispositions;
- (NSMutableArray)excludeds;
- (NSMutableArray)includeds;
- (NSMutableArray)preapprovals;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dispositionsAtIndex:(unint64_t)a3;
- (id)excludedAtIndex:(unint64_t)a3;
- (id)includedAtIndex:(unint64_t)a3;
- (id)preapprovalsAtIndex:(unint64_t)a3;
- (unint64_t)clock;
- (unint64_t)dispositionsCount;
- (unint64_t)excludedsCount;
- (unint64_t)hash;
- (unint64_t)includedsCount;
- (unint64_t)preapprovalsCount;
- (void)addDispositions:(id)a3;
- (void)addExcluded:(id)a3;
- (void)addIncluded:(id)a3;
- (void)addPreapprovals:(id)a3;
- (void)clearDispositions;
- (void)clearExcludeds;
- (void)clearIncludeds;
- (void)clearPreapprovals;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClock:(unint64_t)a3;
- (void)setDispositions:(id)a3;
- (void)setExcludeds:(id)a3;
- (void)setHasClock:(BOOL)a3;
- (void)setIncludeds:(id)a3;
- (void)setPreapprovals:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPeerDynamicInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preapprovals, 0);
  objc_storeStrong((id *)&self->_includeds, 0);
  objc_storeStrong((id *)&self->_excludeds, 0);
  objc_storeStrong((id *)&self->_dispositions, 0);
}

- (void)setPreapprovals:(id)a3
{
}

- (NSMutableArray)preapprovals
{
  return self->_preapprovals;
}

- (void)setDispositions:(id)a3
{
}

- (NSMutableArray)dispositions
{
  return self->_dispositions;
}

- (void)setExcludeds:(id)a3
{
}

- (NSMutableArray)excludeds
{
  return self->_excludeds;
}

- (void)setIncludeds:(id)a3
{
}

- (NSMutableArray)includeds
{
  return self->_includeds;
}

- (unint64_t)clock
{
  return self->_clock;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (id *)v4;
  if (*((unsigned char *)v4 + 48))
  {
    self->_clock = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = *((id *)v4 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        [(TPPBPeerDynamicInfo *)self addIncluded:*(void *)(*((void *)&v38 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v8);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = v5[3];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        [(TPPBPeerDynamicInfo *)self addExcluded:*(void *)(*((void *)&v34 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v13);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v5[2];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        [(TPPBPeerDynamicInfo *)self addDispositions:*(void *)(*((void *)&v30 + 1) + 8 * v20++)];
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v18);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = v5[5];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        -[TPPBPeerDynamicInfo addPreapprovals:](self, "addPreapprovals:", *(void *)(*((void *)&v26 + 1) + 8 * v25++), (void)v26);
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v23);
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_clock;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_includeds hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_excludeds hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_dispositions hash];
  return v6 ^ [(NSMutableArray *)self->_preapprovals hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_clock != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  includeds = self->_includeds;
  if ((unint64_t)includeds | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](includeds, "isEqual:"))
  {
    goto LABEL_15;
  }
  excludeds = self->_excludeds;
  if ((unint64_t)excludeds | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](excludeds, "isEqual:")) {
      goto LABEL_15;
    }
  }
  dispositions = self->_dispositions;
  if ((unint64_t)dispositions | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](dispositions, "isEqual:")) {
      goto LABEL_15;
    }
  }
  preapprovals = self->_preapprovals;
  if ((unint64_t)preapprovals | *((void *)v4 + 5)) {
    char v9 = -[NSMutableArray isEqual:](preapprovals, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_clock;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v7 = self->_includeds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v45;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addIncluded:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v9);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v13 = self->_excludeds;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * v17) copyWithZone:a3];
        [v6 addExcluded:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v15);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v19 = self->_dispositions;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * v23) copyWithZone:a3];
        [v6 addDispositions:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v21);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v25 = self->_preapprovals;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v48 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v33;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v29), "copyWithZone:", a3, (void)v32);
        [v6 addPreapprovals:v30];

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v48 count:16];
    }
    while (v27);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_clock;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v21 = v4;
  if ([(TPPBPeerDynamicInfo *)self includedsCount])
  {
    [v21 clearIncludeds];
    unint64_t v5 = [(TPPBPeerDynamicInfo *)self includedsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(TPPBPeerDynamicInfo *)self includedAtIndex:i];
        [v21 addIncluded:v8];
      }
    }
  }
  if ([(TPPBPeerDynamicInfo *)self excludedsCount])
  {
    [v21 clearExcludeds];
    unint64_t v9 = [(TPPBPeerDynamicInfo *)self excludedsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(TPPBPeerDynamicInfo *)self excludedAtIndex:j];
        [v21 addExcluded:v12];
      }
    }
  }
  if ([(TPPBPeerDynamicInfo *)self dispositionsCount])
  {
    [v21 clearDispositions];
    unint64_t v13 = [(TPPBPeerDynamicInfo *)self dispositionsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(TPPBPeerDynamicInfo *)self dispositionsAtIndex:k];
        [v21 addDispositions:v16];
      }
    }
  }
  if ([(TPPBPeerDynamicInfo *)self preapprovalsCount])
  {
    [v21 clearPreapprovals];
    unint64_t v17 = [(TPPBPeerDynamicInfo *)self preapprovalsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(TPPBPeerDynamicInfo *)self preapprovalsAtIndex:m];
        [v21 addPreapprovals:v20];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v5 = self->_includeds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unint64_t v10 = self->_excludeds;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = self->_dispositions;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v20 = self->_preapprovals;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPeerDynamicInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_clock];
    [v3 setObject:v4 forKey:@"clock"];
  }
  includeds = self->_includeds;
  if (includeds) {
    [v3 setObject:includeds forKey:@"included"];
  }
  excludeds = self->_excludeds;
  if (excludeds) {
    [v3 setObject:excludeds forKey:@"excluded"];
  }
  if ([(NSMutableArray *)self->_dispositions count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_dispositions, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = self->_dispositions;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"dispositions"];
  }
  preapprovals = self->_preapprovals;
  if (preapprovals) {
    [v3 setObject:preapprovals forKey:@"preapprovals"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBPeerDynamicInfo;
  id v4 = [(TPPBPeerDynamicInfo *)&v8 description];
  unint64_t v5 = [(TPPBPeerDynamicInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)preapprovalsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_preapprovals objectAtIndex:a3];
}

- (unint64_t)preapprovalsCount
{
  return [(NSMutableArray *)self->_preapprovals count];
}

- (void)addPreapprovals:(id)a3
{
  id v4 = a3;
  preapprovals = self->_preapprovals;
  id v8 = v4;
  if (!preapprovals)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_preapprovals;
    self->_preapprovals = v6;

    id v4 = v8;
    preapprovals = self->_preapprovals;
  }
  [(NSMutableArray *)preapprovals addObject:v4];
}

- (void)clearPreapprovals
{
}

- (id)dispositionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dispositions objectAtIndex:a3];
}

- (unint64_t)dispositionsCount
{
  return [(NSMutableArray *)self->_dispositions count];
}

- (void)addDispositions:(id)a3
{
  id v4 = a3;
  dispositions = self->_dispositions;
  id v8 = v4;
  if (!dispositions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_dispositions;
    self->_dispositions = v6;

    id v4 = v8;
    dispositions = self->_dispositions;
  }
  [(NSMutableArray *)dispositions addObject:v4];
}

- (void)clearDispositions
{
}

- (id)excludedAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_excludeds objectAtIndex:a3];
}

- (unint64_t)excludedsCount
{
  return [(NSMutableArray *)self->_excludeds count];
}

- (void)addExcluded:(id)a3
{
  id v4 = a3;
  excludeds = self->_excludeds;
  id v8 = v4;
  if (!excludeds)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_excludeds;
    self->_excludeds = v6;

    id v4 = v8;
    excludeds = self->_excludeds;
  }
  [(NSMutableArray *)excludeds addObject:v4];
}

- (void)clearExcludeds
{
}

- (id)includedAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_includeds objectAtIndex:a3];
}

- (unint64_t)includedsCount
{
  return [(NSMutableArray *)self->_includeds count];
}

- (void)addIncluded:(id)a3
{
  id v4 = a3;
  includeds = self->_includeds;
  id v8 = v4;
  if (!includeds)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_includeds;
    self->_includeds = v6;

    id v4 = v8;
    includeds = self->_includeds;
  }
  [(NSMutableArray *)includeds addObject:v4];
}

- (void)clearIncludeds
{
}

- (BOOL)hasClock
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasClock:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setClock:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clocuint64_t k = a3;
}

+ (Class)preapprovalsType
{
  return (Class)objc_opt_class();
}

+ (Class)dispositionsType
{
  return (Class)objc_opt_class();
}

+ (Class)excludedType
{
  return (Class)objc_opt_class();
}

+ (Class)includedType
{
  return (Class)objc_opt_class();
}

@end