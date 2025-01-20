@interface SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle
+ (Class)previousTurnsType;
- (BOOL)hasCurrentTurn;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)previousTurns;
- (SIRINLUEXTERNALTurnInput)currentTurn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)previousTurnsAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)previousTurnsCount;
- (void)addPreviousTurns:(id)a3;
- (void)clearPreviousTurns;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentTurn:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPreviousTurns:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTurns, 0);
  objc_storeStrong((id *)&self->_currentTurn, 0);
}

- (void)setPreviousTurns:(id)a3
{
}

- (NSMutableArray)previousTurns
{
  return self->_previousTurns;
}

- (void)setCurrentTurn:(id)a3
{
}

- (SIRINLUEXTERNALTurnInput)currentTurn
{
  return self->_currentTurn;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  if (v4[7])
  {
    self->_type = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  currentTurn = self->_currentTurn;
  uint64_t v7 = *((void *)v5 + 1);
  if (currentTurn)
  {
    if (v7) {
      -[SIRINLUEXTERNALTurnInput mergeFrom:](currentTurn, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle setCurrentTurn:](self, "setCurrentTurn:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v5 + 2);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle addPreviousTurns:](self, "addPreviousTurns:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
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
  unint64_t v4 = [(SIRINLUEXTERNALTurnInput *)self->_currentTurn hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_previousTurns hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  currentTurn = self->_currentTurn;
  if ((unint64_t)currentTurn | *((void *)v4 + 1)
    && !-[SIRINLUEXTERNALTurnInput isEqual:](currentTurn, "isEqual:"))
  {
    goto LABEL_11;
  }
  previousTurns = self->_previousTurns;
  if ((unint64_t)previousTurns | *((void *)v4 + 2)) {
    char v7 = -[NSMutableArray isEqual:](previousTurns, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v7 = [(SIRINLUEXTERNALTurnInput *)self->_currentTurn copyWithZone:a3];
  id v8 = (void *)v6[1];
  v6[1] = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_previousTurns;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (void)v16);
        [v6 addPreviousTurns:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_type;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v9 = v4;
  if (self->_currentTurn) {
    objc_msgSend(v4, "setCurrentTurn:");
  }
  if ([(SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle *)self previousTurnsCount])
  {
    [v9 clearPreviousTurns];
    unint64_t v5 = [(SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle *)self previousTurnsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v8 = [(SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle *)self previousTurnsAtIndex:i];
        [v9 addPreviousTurns:v8];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_currentTurn) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_previousTurns;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if (type >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      unint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v5 = off_1E6578C98[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  currentTurn = self->_currentTurn;
  if (currentTurn)
  {
    uint64_t v7 = [(SIRINLUEXTERNALTurnInput *)currentTurn dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"current_turn"];
  }
  if ([(NSMutableArray *)self->_previousTurns count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_previousTurns, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = self->_previousTurns;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"previous_turns"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle;
  id v4 = [(SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)previousTurnsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_previousTurns objectAtIndex:a3];
}

- (unint64_t)previousTurnsCount
{
  return [(NSMutableArray *)self->_previousTurns count];
}

- (void)addPreviousTurns:(id)a3
{
  id v4 = a3;
  previousTurns = self->_previousTurns;
  id v8 = v4;
  if (!previousTurns)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_previousTurns;
    self->_previousTurns = v6;

    id v4 = v8;
    previousTurns = self->_previousTurns;
  }
  [(NSMutableArray *)previousTurns addObject:v4];
}

- (void)clearPreviousTurns
{
}

- (BOOL)hasCurrentTurn
{
  return self->_currentTurn != 0;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"REFORM_TYPE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CORRECTION_BY_REPETITION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REFERENCE_RESOLUTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TAP_TO_EDIT"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578C98[a3];
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

+ (Class)previousTurnsType
{
  return (Class)objc_opt_class();
}

@end