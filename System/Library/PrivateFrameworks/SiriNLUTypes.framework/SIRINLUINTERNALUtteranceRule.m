@interface SIRINLUINTERNALUtteranceRule
+ (Class)spansForNamedCaptureGroupsType;
- (BOOL)hasCompareOptions;
- (BOOL)hasPattern;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)spansForNamedCaptureGroups;
- (NSString)pattern;
- (SIRINLUINTERNALCompareOptions)compareOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)spansForNamedCaptureGroupsAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)spansForNamedCaptureGroupsCount;
- (void)addSpansForNamedCaptureGroups:(id)a3;
- (void)clearSpansForNamedCaptureGroups;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompareOptions:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPattern:(id)a3;
- (void)setSpansForNamedCaptureGroups:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALUtteranceRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spansForNamedCaptureGroups, 0);
  objc_storeStrong((id *)&self->_pattern, 0);
  objc_storeStrong((id *)&self->_compareOptions, 0);
}

- (void)setSpansForNamedCaptureGroups:(id)a3
{
}

- (NSMutableArray)spansForNamedCaptureGroups
{
  return self->_spansForNamedCaptureGroups;
}

- (void)setCompareOptions:(id)a3
{
}

- (SIRINLUINTERNALCompareOptions)compareOptions
{
  return self->_compareOptions;
}

- (void)setPattern:(id)a3
{
}

- (NSString)pattern
{
  return self->_pattern;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[SIRINLUINTERNALUtteranceRule setPattern:](self, "setPattern:");
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  compareOptions = self->_compareOptions;
  uint64_t v6 = *((void *)v4 + 1);
  if (compareOptions)
  {
    if (v6) {
      -[SIRINLUINTERNALCompareOptions mergeFrom:](compareOptions, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALUtteranceRule setCompareOptions:](self, "setCompareOptions:");
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
        -[SIRINLUINTERNALUtteranceRule addSpansForNamedCaptureGroups:](self, "addSpansForNamedCaptureGroups:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_pattern hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  unint64_t v6 = [(SIRINLUINTERNALCompareOptions *)self->_compareOptions hash];
  return v5 ^ v6 ^ [(NSMutableArray *)self->_spansForNamedCaptureGroups hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  pattern = self->_pattern;
  if ((unint64_t)pattern | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](pattern, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  compareOptions = self->_compareOptions;
  if ((unint64_t)compareOptions | *((void *)v4 + 1)
    && !-[SIRINLUINTERNALCompareOptions isEqual:](compareOptions, "isEqual:"))
  {
    goto LABEL_13;
  }
  spansForNamedCaptureGroups = self->_spansForNamedCaptureGroups;
  if ((unint64_t)spansForNamedCaptureGroups | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](spansForNamedCaptureGroups, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_pattern copyWithZone:a3];
  id v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  id v8 = [(SIRINLUINTERNALCompareOptions *)self->_compareOptions copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_spansForNamedCaptureGroups;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [(id)v5 addSpansForNamedCaptureGroups:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_pattern)
  {
    objc_msgSend(v4, "setPattern:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_type;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  if (self->_compareOptions) {
    objc_msgSend(v9, "setCompareOptions:");
  }
  if ([(SIRINLUINTERNALUtteranceRule *)self spansForNamedCaptureGroupsCount])
  {
    [v9 clearSpansForNamedCaptureGroups];
    unint64_t v5 = [(SIRINLUINTERNALUtteranceRule *)self spansForNamedCaptureGroupsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v8 = [(SIRINLUINTERNALUtteranceRule *)self spansForNamedCaptureGroupsAtIndex:i];
        [v9 addSpansForNamedCaptureGroups:v8];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_pattern) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_compareOptions) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_spansForNamedCaptureGroups;
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
  return SIRINLUINTERNALUtteranceRuleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  pattern = self->_pattern;
  if (pattern) {
    [v3 setObject:pattern forKey:@"pattern"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if (type >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = off_1E6578B18[type];
    }
    [v4 setObject:v7 forKey:@"type"];
  }
  compareOptions = self->_compareOptions;
  if (compareOptions)
  {
    uint64_t v9 = [(SIRINLUINTERNALCompareOptions *)compareOptions dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"compare_options"];
  }
  if ([(NSMutableArray *)self->_spansForNamedCaptureGroups count])
  {
    long long v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_spansForNamedCaptureGroups, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v11 = self->_spansForNamedCaptureGroups;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"spans_for_named_capture_groups"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALUtteranceRule;
  id v4 = [(SIRINLUINTERNALUtteranceRule *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALUtteranceRule *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)spansForNamedCaptureGroupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_spansForNamedCaptureGroups objectAtIndex:a3];
}

- (unint64_t)spansForNamedCaptureGroupsCount
{
  return [(NSMutableArray *)self->_spansForNamedCaptureGroups count];
}

- (void)addSpansForNamedCaptureGroups:(id)a3
{
  id v4 = a3;
  spansForNamedCaptureGroups = self->_spansForNamedCaptureGroups;
  id v8 = v4;
  if (!spansForNamedCaptureGroups)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_spansForNamedCaptureGroups;
    self->_spansForNamedCaptureGroups = v6;

    id v4 = v8;
    spansForNamedCaptureGroups = self->_spansForNamedCaptureGroups;
  }
  [(NSMutableArray *)spansForNamedCaptureGroups addObject:v4];
}

- (void)clearSpansForNamedCaptureGroups
{
}

- (BOOL)hasCompareOptions
{
  return self->_compareOptions != 0;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"COMPARISON_TYPE_UNSPECIFIED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COMPARISON_TYPE_EXACT_LITERAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"COMPARISON_TYPE_REGULAR_EXPRESSION"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578B18[a3];
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

- (BOOL)hasPattern
{
  return self->_pattern != 0;
}

+ (Class)spansForNamedCaptureGroupsType
{
  return (Class)objc_opt_class();
}

@end