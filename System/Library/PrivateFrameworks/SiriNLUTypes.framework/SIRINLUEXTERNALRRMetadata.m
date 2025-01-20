@interface SIRINLUEXTERNALRRMetadata
+ (Class)surroundingTextsType;
- (BOOL)hasBoundingBox;
- (BOOL)hasDataSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)surroundingTexts;
- (SIRINLUEXTERNALRRBoundingBox)boundingBox;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataSourceAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)surroundingTextsAtIndex:(unint64_t)a3;
- (int)StringAsDataSource:(id)a3;
- (int)dataSource;
- (unint64_t)hash;
- (unint64_t)surroundingTextsCount;
- (void)addSurroundingTexts:(id)a3;
- (void)clearSurroundingTexts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoundingBox:(id)a3;
- (void)setDataSource:(int)a3;
- (void)setHasDataSource:(BOOL)a3;
- (void)setSurroundingTexts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALRRMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surroundingTexts, 0);
  objc_storeStrong((id *)&self->_boundingBox, 0);
}

- (void)setSurroundingTexts:(id)a3
{
}

- (NSMutableArray)surroundingTexts
{
  return self->_surroundingTexts;
}

- (void)setBoundingBox:(id)a3
{
}

- (SIRINLUEXTERNALRRBoundingBox)boundingBox
{
  return self->_boundingBox;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  boundingBox = self->_boundingBox;
  uint64_t v6 = *((void *)v4 + 1);
  if (boundingBox)
  {
    if (v6) {
      -[SIRINLUEXTERNALRRBoundingBox mergeFrom:](boundingBox, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALRRMetadata setBoundingBox:](self, "setBoundingBox:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SIRINLUEXTERNALRRMetadata addSurroundingTexts:](self, "addSurroundingTexts:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((unsigned char *)v4 + 32))
  {
    self->_dataSource = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALRRBoundingBox *)self->_boundingBox hash];
  uint64_t v4 = [(NSMutableArray *)self->_surroundingTexts hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_dataSource;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  boundingBox = self->_boundingBox;
  if ((unint64_t)boundingBox | *((void *)v4 + 1))
  {
    if (!-[SIRINLUEXTERNALRRBoundingBox isEqual:](boundingBox, "isEqual:")) {
      goto LABEL_10;
    }
  }
  surroundingTexts = self->_surroundingTexts;
  if ((unint64_t)surroundingTexts | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](surroundingTexts, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_dataSource == *((_DWORD *)v4 + 4))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALRRBoundingBox *)self->_boundingBox copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_surroundingTexts;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [(id)v5 addSurroundingTexts:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_dataSource;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_boundingBox) {
    objc_msgSend(v8, "setBoundingBox:");
  }
  if ([(SIRINLUEXTERNALRRMetadata *)self surroundingTextsCount])
  {
    [v8 clearSurroundingTexts];
    unint64_t v4 = [(SIRINLUEXTERNALRRMetadata *)self surroundingTextsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        BOOL v7 = [(SIRINLUEXTERNALRRMetadata *)self surroundingTextsAtIndex:i];
        [v8 addSurroundingTexts:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v8 + 4) = self->_dataSource;
    *((unsigned char *)v8 + 32) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_boundingBox) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_surroundingTexts;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALRRMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  boundingBox = self->_boundingBox;
  if (boundingBox)
  {
    unint64_t v5 = [(SIRINLUEXTERNALRRBoundingBox *)boundingBox dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"bounding_box"];
  }
  if ([(NSMutableArray *)self->_surroundingTexts count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_surroundingTexts, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = self->_surroundingTexts;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"surrounding_texts"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t dataSource = self->_dataSource;
    if (dataSource >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_dataSource);
      long long v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v14 = off_1E6578F30[dataSource];
    }
    [v3 setObject:v14 forKey:@"data_source"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALRRMetadata;
  id v4 = [(SIRINLUEXTERNALRRMetadata *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALRRMetadata *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsDataSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONVERSATIONAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ON_SCREEN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"VISUAL"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)dataSourceAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578F30[a3];
  }
  return v3;
}

- (BOOL)hasDataSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDataSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDataSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t dataSource = a3;
}

- (int)dataSource
{
  if (*(unsigned char *)&self->_has) {
    return self->_dataSource;
  }
  else {
    return 0;
  }
}

- (id)surroundingTextsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_surroundingTexts objectAtIndex:a3];
}

- (unint64_t)surroundingTextsCount
{
  return [(NSMutableArray *)self->_surroundingTexts count];
}

- (void)addSurroundingTexts:(id)a3
{
  id v4 = a3;
  surroundingTexts = self->_surroundingTexts;
  id v8 = v4;
  if (!surroundingTexts)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_surroundingTexts;
    self->_surroundingTexts = v6;

    id v4 = v8;
    surroundingTexts = self->_surroundingTexts;
  }
  [(NSMutableArray *)surroundingTexts addObject:v4];
}

- (void)clearSurroundingTexts
{
}

- (BOOL)hasBoundingBox
{
  return self->_boundingBox != 0;
}

+ (Class)surroundingTextsType
{
  return (Class)objc_opt_class();
}

@end