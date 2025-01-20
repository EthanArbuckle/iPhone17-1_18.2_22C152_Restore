@interface TPPBDictionaryMatchingRule
+ (Class)andType;
+ (Class)orType;
- (BOOL)hasExists;
- (BOOL)hasMatch;
- (BOOL)hasNot;
- (BOOL)hasType;
- (BOOL)invertMatch:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3 error:(id *)a4;
- (BOOL)performAndMatch:(id)a3 error:(id *)a4;
- (BOOL)performOrMatch:(id)a3 error:(id *)a4;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)ands;
- (NSMutableArray)ors;
- (TPPBDictionaryMatchingRule)not;
- (TPPBDictionaryMatchingRuleFieldExists)exists;
- (TPPBDictionaryMatchingRuleFieldRegexMatch)match;
- (id)andAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)orAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)andsCount;
- (unint64_t)hash;
- (unint64_t)orsCount;
- (void)addAnd:(id)a3;
- (void)addOr:(id)a3;
- (void)clearAnds;
- (void)clearOrs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnds:(id)a3;
- (void)setExists:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMatch:(id)a3;
- (void)setNot:(id)a3;
- (void)setOrs:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBDictionaryMatchingRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ors, 0);
  objc_storeStrong((id *)&self->_not, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_exists, 0);
  objc_storeStrong((id *)&self->_ands, 0);
}

- (void)setExists:(id)a3
{
}

- (TPPBDictionaryMatchingRuleFieldExists)exists
{
  return self->_exists;
}

- (void)setMatch:(id)a3
{
}

- (TPPBDictionaryMatchingRuleFieldRegexMatch)match
{
  return self->_match;
}

- (void)setNot:(id)a3
{
}

- (TPPBDictionaryMatchingRule)not
{
  return self->_not;
}

- (void)setOrs:(id)a3
{
}

- (NSMutableArray)ors
{
  return self->_ors;
}

- (void)setAnds:(id)a3
{
}

- (NSMutableArray)ands
{
  return self->_ands;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (id *)v4;
  if (*((unsigned char *)v4 + 52))
  {
    self->_type = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        [(TPPBDictionaryMatchingRule *)self addAnd:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v5[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        -[TPPBDictionaryMatchingRule addOr:](self, "addOr:", *(void *)(*((void *)&v22 + 1) + 8 * j), (void)v22);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v13);
  }

  not = self->_not;
  id v17 = v5[4];
  if (not)
  {
    if (v17) {
      -[TPPBDictionaryMatchingRule mergeFrom:](not, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[TPPBDictionaryMatchingRule setNot:](self, "setNot:");
  }
  match = self->_match;
  id v19 = v5[3];
  if (match)
  {
    if (v19) {
      -[TPPBDictionaryMatchingRuleFieldRegexMatch mergeFrom:](match, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[TPPBDictionaryMatchingRule setMatch:](self, "setMatch:");
  }
  exists = self->_exists;
  id v21 = v5[2];
  if (exists)
  {
    if (v21) {
      -[TPPBDictionaryMatchingRuleFieldExists mergeFrom:](exists, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[TPPBDictionaryMatchingRule setExists:](self, "setExists:");
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_ands hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_ors hash];
  unint64_t v6 = v4 ^ v5 ^ [(TPPBDictionaryMatchingRule *)self->_not hash];
  unint64_t v7 = [(TPPBDictionaryMatchingRuleFieldRegexMatch *)self->_match hash];
  return v6 ^ v7 ^ [(TPPBDictionaryMatchingRuleFieldExists *)self->_exists hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_type != *((_DWORD *)v4 + 12)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  ands = self->_ands;
  if ((unint64_t)ands | *((void *)v4 + 1) && !-[NSMutableArray isEqual:](ands, "isEqual:")) {
    goto LABEL_17;
  }
  ors = self->_ors;
  if ((unint64_t)ors | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](ors, "isEqual:")) {
      goto LABEL_17;
    }
  }
  not = self->_not;
  if ((unint64_t)not | *((void *)v4 + 4))
  {
    if (!-[TPPBDictionaryMatchingRule isEqual:](not, "isEqual:")) {
      goto LABEL_17;
    }
  }
  match = self->_match;
  if ((unint64_t)match | *((void *)v4 + 3))
  {
    if (!-[TPPBDictionaryMatchingRuleFieldRegexMatch isEqual:](match, "isEqual:")) {
      goto LABEL_17;
    }
  }
  exists = self->_exists;
  if ((unint64_t)exists | *((void *)v4 + 2)) {
    char v10 = -[TPPBDictionaryMatchingRuleFieldExists isEqual:](exists, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_type;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v7 = self->_ands;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addAnd:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v9);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v13 = self->_ors;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v17), "copyWithZone:", a3, (void)v26);
        [v6 addOr:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v15);
  }

  id v19 = [(TPPBDictionaryMatchingRule *)self->_not copyWithZone:a3];
  v20 = (void *)v6[4];
  v6[4] = v19;

  id v21 = [(TPPBDictionaryMatchingRuleFieldRegexMatch *)self->_match copyWithZone:a3];
  long long v22 = (void *)v6[3];
  v6[3] = v21;

  id v23 = [(TPPBDictionaryMatchingRuleFieldExists *)self->_exists copyWithZone:a3];
  long long v24 = (void *)v6[2];
  v6[2] = v23;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[12] = self->_type;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  id v14 = v4;
  if ([(TPPBDictionaryMatchingRule *)self andsCount])
  {
    [v14 clearAnds];
    unint64_t v5 = [(TPPBDictionaryMatchingRule *)self andsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(TPPBDictionaryMatchingRule *)self andAtIndex:i];
        [v14 addAnd:v8];
      }
    }
  }
  if ([(TPPBDictionaryMatchingRule *)self orsCount])
  {
    [v14 clearOrs];
    unint64_t v9 = [(TPPBDictionaryMatchingRule *)self orsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(TPPBDictionaryMatchingRule *)self orAtIndex:j];
        [v14 addOr:v12];
      }
    }
  }
  if (self->_not) {
    objc_msgSend(v14, "setNot:");
  }
  uint64_t v13 = v14;
  if (self->_match)
  {
    objc_msgSend(v14, "setMatch:");
    uint64_t v13 = v14;
  }
  if (self->_exists)
  {
    objc_msgSend(v14, "setExists:");
    uint64_t v13 = v14;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_ands;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v10 = self->_ors;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_not) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_match) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_exists) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDictionaryMatchingRuleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if (type >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      unint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v5 = off_2640EC978[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  if ([(NSMutableArray *)self->_ands count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_ands, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v7 = self->_ands;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"and"];
  }
  if ([(NSMutableArray *)self->_ors count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_ors, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v14 = self->_ors;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = [*(id *)(*((void *)&v27 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"or"];
  }
  not = self->_not;
  if (not)
  {
    long long v21 = [(TPPBDictionaryMatchingRule *)not dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"not"];
  }
  match = self->_match;
  if (match)
  {
    id v23 = [(TPPBDictionaryMatchingRuleFieldRegexMatch *)match dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"match"];
  }
  exists = self->_exists;
  if (exists)
  {
    uint64_t v25 = [(TPPBDictionaryMatchingRuleFieldExists *)exists dictionaryRepresentation];
    [v3 setObject:v25 forKey:@"exists"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBDictionaryMatchingRule;
  id v4 = [(TPPBDictionaryMatchingRule *)&v8 description];
  unint64_t v5 = [(TPPBDictionaryMatchingRule *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasExists
{
  return self->_exists != 0;
}

- (BOOL)hasMatch
{
  return self->_match != 0;
}

- (BOOL)hasNot
{
  return self->_not != 0;
}

- (id)orAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_ors objectAtIndex:a3];
}

- (unint64_t)orsCount
{
  return [(NSMutableArray *)self->_ors count];
}

- (void)addOr:(id)a3
{
  id v4 = a3;
  ors = self->_ors;
  id v8 = v4;
  if (!ors)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_ors;
    self->_ors = v6;

    id v4 = v8;
    ors = self->_ors;
  }
  [(NSMutableArray *)ors addObject:v4];
}

- (void)clearOrs
{
}

- (id)andAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_ands objectAtIndex:a3];
}

- (unint64_t)andsCount
{
  return [(NSMutableArray *)self->_ands count];
}

- (void)addAnd:(id)a3
{
  id v4 = a3;
  ands = self->_ands;
  id v8 = v4;
  if (!ands)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_ands;
    self->_ands = v6;

    id v4 = v8;
    ands = self->_ands;
  }
  [(NSMutableArray *)ands addObject:v4];
}

- (void)clearAnds
{
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AND_RULE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OR_RULE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NOT_RULE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MATCH_RULE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FIELD_EXISTS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TRUE_RULE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FALSE_RULE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_2640EC978[a3];
  }
  return v3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t type = a3;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 0;
  }
}

+ (Class)orType
{
  return (Class)objc_opt_class();
}

+ (Class)andType
{
  return (Class)objc_opt_class();
}

- (BOOL)invertMatch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(TPPBDictionaryMatchingRule *)self not];

  if (v7)
  {
    id v8 = [(TPPBDictionaryMatchingRule *)self not];
    id v13 = 0;
    char v9 = [v8 matches:v6 error:&v13];
    id v10 = v13;

    if (v10)
    {
      char v11 = 0;
      if (a4) {
        *a4 = v10;
      }
    }
    else
    {
      char v11 = v9 ^ 1;
    }
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"CKKSMatcherError" code:2 description:@"No 'not' subrule present"];
    char v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)performOrMatch:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(TPPBDictionaryMatchingRule *)self ors];
  if (v7)
  {
    id v8 = (void *)v7;
    char v9 = [(TPPBDictionaryMatchingRule *)self ors];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      char v11 = [(TPPBDictionaryMatchingRule *)self ors];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            id v22 = 0;
            char v17 = [v16 matches:v6 error:&v22];
            id v18 = v22;
            BOOL v19 = v18 == 0;
            if (v18)
            {
              long long v20 = v18;
              if (a4) {
                *a4 = v18;
              }

LABEL_19:
              goto LABEL_20;
            }
            if (v17) {
              goto LABEL_19;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      goto LABEL_15;
    }
  }
  if (!a4)
  {
LABEL_15:
    BOOL v19 = 0;
    goto LABEL_20;
  }
  [MEMORY[0x263F087E8] errorWithDomain:@"CKKSMatcherError" code:2 description:@"No 'or' subrules present"];
  BOOL v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v19;
}

- (BOOL)performAndMatch:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(TPPBDictionaryMatchingRule *)self ands];
  if (v7
    && (id v8 = (void *)v7,
        [(TPPBDictionaryMatchingRule *)self ands],
        char v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v8,
        v10))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    char v11 = [(TPPBDictionaryMatchingRule *)self ands];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v22 = 0;
          int v17 = [v16 matches:v6 error:&v22];
          id v18 = v22;
          if (v18)
          {
            long long v20 = v18;
            if (a4) {
              *a4 = v18;
            }

LABEL_20:
            BOOL v19 = 0;
            goto LABEL_21;
          }
          if (!v17) {
            goto LABEL_20;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        BOOL v19 = 1;
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v19 = 1;
    }
LABEL_21:
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"CKKSMatcherError" code:2 description:@"No 'and' subrules present"];
    BOOL v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)matches:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(TPPBDictionaryMatchingRule *)self hasType])
  {
    char v7 = 1;
    switch([(TPPBDictionaryMatchingRule *)self type])
    {
      case 1:
        BOOL v8 = [(TPPBDictionaryMatchingRule *)self performAndMatch:v6 error:a4];
        goto LABEL_12;
      case 2:
        BOOL v8 = [(TPPBDictionaryMatchingRule *)self performOrMatch:v6 error:a4];
        goto LABEL_12;
      case 3:
        BOOL v8 = [(TPPBDictionaryMatchingRule *)self invertMatch:v6 error:a4];
LABEL_12:
        char v7 = v8;
        goto LABEL_24;
      case 4:
        uint64_t v12 = [(TPPBDictionaryMatchingRule *)self match];

        if (v12)
        {
          uint64_t v13 = [(TPPBDictionaryMatchingRule *)self match];
          goto LABEL_17;
        }
        if (!a4) {
          goto LABEL_23;
        }
        char v9 = (void *)MEMORY[0x263F087E8];
        uint64_t v10 = @"No 'match' subrule present";
        goto LABEL_22;
      case 5:
        uint64_t v14 = [(TPPBDictionaryMatchingRule *)self exists];

        if (v14)
        {
          uint64_t v13 = [(TPPBDictionaryMatchingRule *)self exists];
LABEL_17:
          uint64_t v15 = v13;
          char v7 = [v13 matches:v6 error:a4];

          goto LABEL_24;
        }
        if (!a4) {
          goto LABEL_23;
        }
        char v9 = (void *)MEMORY[0x263F087E8];
        uint64_t v10 = @"No 'exists' subrule present";
LABEL_22:
        uint64_t v11 = 2;
        break;
      case 6:
        goto LABEL_24;
      case 7:
        goto LABEL_23;
      default:
        if (!a4) {
          goto LABEL_23;
        }
        char v9 = (void *)MEMORY[0x263F087E8];
        uint64_t v10 = @"Rule type is unknown";
        goto LABEL_6;
    }
  }
  else
  {
    if (!a4)
    {
LABEL_23:
      char v7 = 0;
      goto LABEL_24;
    }
    char v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = @"Rule has no type";
LABEL_6:
    uint64_t v11 = 0;
  }
  [v9 errorWithDomain:@"CKKSMatcherError" code:v11 description:v10];
  char v7 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v7;
}

@end