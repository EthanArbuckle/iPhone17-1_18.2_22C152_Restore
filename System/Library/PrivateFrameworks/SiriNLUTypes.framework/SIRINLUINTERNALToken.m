@interface SIRINLUINTERNALToken
+ (Class)cleanValuesType;
+ (Class)normalizedValuesType;
- (BOOL)hasBegin;
- (BOOL)hasCleanValue;
- (BOOL)hasEnd;
- (BOOL)hasIsSignificant;
- (BOOL)hasIsWhitespace;
- (BOOL)hasNonWhitespaceTokenIndex;
- (BOOL)hasTokenIndex;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSignificant;
- (BOOL)isWhitespace;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cleanValues;
- (NSMutableArray)normalizedValues;
- (NSString)cleanValue;
- (NSString)value;
- (id)cleanValuesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)normalizedValuesAtIndex:(unint64_t)a3;
- (int)begin;
- (int)end;
- (int)nonWhitespaceTokenIndex;
- (int)tokenIndex;
- (unint64_t)cleanValuesCount;
- (unint64_t)hash;
- (unint64_t)normalizedValuesCount;
- (void)addCleanValues:(id)a3;
- (void)addNormalizedValues:(id)a3;
- (void)clearCleanValues;
- (void)clearNormalizedValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBegin:(int)a3;
- (void)setCleanValue:(id)a3;
- (void)setCleanValues:(id)a3;
- (void)setEnd:(int)a3;
- (void)setHasBegin:(BOOL)a3;
- (void)setHasEnd:(BOOL)a3;
- (void)setHasIsSignificant:(BOOL)a3;
- (void)setHasIsWhitespace:(BOOL)a3;
- (void)setHasNonWhitespaceTokenIndex:(BOOL)a3;
- (void)setHasTokenIndex:(BOOL)a3;
- (void)setIsSignificant:(BOOL)a3;
- (void)setIsWhitespace:(BOOL)a3;
- (void)setNonWhitespaceTokenIndex:(int)a3;
- (void)setNormalizedValues:(id)a3;
- (void)setTokenIndex:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_normalizedValues, 0);
  objc_storeStrong((id *)&self->_cleanValues, 0);
  objc_storeStrong((id *)&self->_cleanValue, 0);
}

- (void)setNormalizedValues:(id)a3
{
}

- (NSMutableArray)normalizedValues
{
  return self->_normalizedValues;
}

- (void)setCleanValue:(id)a3
{
}

- (NSString)cleanValue
{
  return self->_cleanValue;
}

- (int)nonWhitespaceTokenIndex
{
  return self->_nonWhitespaceTokenIndex;
}

- (int)tokenIndex
{
  return self->_tokenIndex;
}

- (void)setCleanValues:(id)a3
{
}

- (NSMutableArray)cleanValues
{
  return self->_cleanValues;
}

- (BOOL)isWhitespace
{
  return self->_isWhitespace;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (int)end
{
  return self->_end;
}

- (int)begin
{
  return self->_begin;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[SIRINLUINTERNALToken setValue:](self, "setValue:");
  }
  char v5 = *((unsigned char *)v4 + 68);
  if (v5)
  {
    self->_begin = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_end = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_31:
  self->_isSignificant = *((unsigned char *)v4 + 64);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 68) & 0x20) != 0)
  {
LABEL_7:
    self->_isWhitespace = *((unsigned char *)v4 + 65);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_8:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = *((id *)v4 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [(SIRINLUINTERNALToken *)self addCleanValues:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  char v11 = *((unsigned char *)v4 + 68);
  if ((v11 & 8) != 0)
  {
    self->_tokenIndex = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 8u;
    char v11 = *((unsigned char *)v4 + 68);
  }
  if ((v11 & 4) != 0)
  {
    self->_nonWhitespaceTokenIndex = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 2)) {
    -[SIRINLUINTERNALToken setCleanValue:](self, "setCleanValue:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 5);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[SIRINLUINTERNALToken addNormalizedValues:](self, "addNormalizedValues:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_value hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_begin;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_end;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_isSignificant;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_isWhitespace;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v7 = 0;
LABEL_10:
  uint64_t v8 = [(NSMutableArray *)self->_cleanValues hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v9 = 2654435761 * self->_tokenIndex;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_12;
    }
LABEL_14:
    uint64_t v10 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  uint64_t v10 = 2654435761 * self->_nonWhitespaceTokenIndex;
LABEL_15:
  NSUInteger v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  NSUInteger v12 = v9 ^ v10 ^ [(NSString *)self->_cleanValue hash];
  return v11 ^ v12 ^ [(NSMutableArray *)self->_normalizedValues hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](value, "isEqual:")) {
      goto LABEL_47;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 68);
  if (has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_begin != *((_DWORD *)v4 + 2)) {
      goto LABEL_47;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_end != *((_DWORD *)v4 + 8)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x10) == 0) {
      goto LABEL_47;
    }
    if (self->_isSignificant)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x20) == 0) {
      goto LABEL_47;
    }
    if (self->_isWhitespace)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x20) != 0)
  {
    goto LABEL_47;
  }
  cleanValues = self->_cleanValues;
  if (!((unint64_t)cleanValues | *((void *)v4 + 3))) {
    goto LABEL_33;
  }
  if (!-[NSMutableArray isEqual:](cleanValues, "isEqual:"))
  {
LABEL_47:
    char v11 = 0;
    goto LABEL_48;
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 68);
LABEL_33:
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_tokenIndex != *((_DWORD *)v4 + 12)) {
      goto LABEL_47;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_nonWhitespaceTokenIndex != *((_DWORD *)v4 + 9)) {
      goto LABEL_47;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_47;
  }
  cleanValue = self->_cleanValue;
  if ((unint64_t)cleanValue | *((void *)v4 + 2) && !-[NSString isEqual:](cleanValue, "isEqual:")) {
    goto LABEL_47;
  }
  normalizedValues = self->_normalizedValues;
  if ((unint64_t)normalizedValues | *((void *)v4 + 5)) {
    char v11 = -[NSMutableArray isEqual:](normalizedValues, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_48:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_value copyWithZone:a3];
  char v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_begin;
    *(unsigned char *)(v5 + 68) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_end;
  *(unsigned char *)(v5 + 68) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  *(unsigned char *)(v5 + 64) = self->_isSignificant;
  *(unsigned char *)(v5 + 68) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 65) = self->_isWhitespace;
    *(unsigned char *)(v5 + 68) |= 0x20u;
  }
LABEL_6:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = self->_cleanValues;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addCleanValues:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  char v15 = (char)self->_has;
  if ((v15 & 8) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_tokenIndex;
    *(unsigned char *)(v5 + 68) |= 8u;
    char v15 = (char)self->_has;
  }
  if ((v15 & 4) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_nonWhitespaceTokenIndex;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  uint64_t v16 = [(NSString *)self->_cleanValue copyWithZone:a3];
  long long v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v18 = self->_normalizedValues;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (void)v25);
        [(id)v5 addNormalizedValues:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (self->_value)
  {
    objc_msgSend(v4, "setValue:");
    id v4 = v15;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_begin;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
LABEL_27:
      *((unsigned char *)v4 + 64) = self->_isSignificant;
      *((unsigned char *)v4 + 68) |= 0x10u;
      if ((*(unsigned char *)&self->_has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 8) = self->_end;
  *((unsigned char *)v4 + 68) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_27;
  }
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *((unsigned char *)v4 + 65) = self->_isWhitespace;
    *((unsigned char *)v4 + 68) |= 0x20u;
  }
LABEL_8:
  if ([(SIRINLUINTERNALToken *)self cleanValuesCount])
  {
    [v15 clearCleanValues];
    unint64_t v6 = [(SIRINLUINTERNALToken *)self cleanValuesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(SIRINLUINTERNALToken *)self cleanValuesAtIndex:i];
        [v15 addCleanValues:v9];
      }
    }
  }
  char v10 = (char)self->_has;
  if ((v10 & 8) != 0)
  {
    *((_DWORD *)v15 + 12) = self->_tokenIndex;
    *((unsigned char *)v15 + 68) |= 8u;
    char v10 = (char)self->_has;
  }
  if ((v10 & 4) != 0)
  {
    *((_DWORD *)v15 + 9) = self->_nonWhitespaceTokenIndex;
    *((unsigned char *)v15 + 68) |= 4u;
  }
  if (self->_cleanValue) {
    objc_msgSend(v15, "setCleanValue:");
  }
  if ([(SIRINLUINTERNALToken *)self normalizedValuesCount])
  {
    [v15 clearNormalizedValues];
    unint64_t v11 = [(SIRINLUINTERNALToken *)self normalizedValuesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(SIRINLUINTERNALToken *)self normalizedValuesAtIndex:j];
        [v15 addNormalizedValues:v14];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_value) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v6 = self->_cleanValues;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_cleanValue) {
    PBDataWriterWriteStringField();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v12 = self->_normalizedValues;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALTokenReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  value = self->_value;
  if (value) {
    [v3 setObject:value forKey:@"value"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v15 = [NSNumber numberWithInt:self->_begin];
    [v4 setObject:v15 forKey:@"begin"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v16 = [NSNumber numberWithInt:self->_end];
  [v4 setObject:v16 forKey:@"end"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_23:
  long long v17 = [NSNumber numberWithBool:self->_isSignificant];
  [v4 setObject:v17 forKey:@"is_significant"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = [NSNumber numberWithBool:self->_isWhitespace];
    [v4 setObject:v7 forKey:@"is_whitespace"];
  }
LABEL_8:
  cleanValues = self->_cleanValues;
  if (cleanValues) {
    [v4 setObject:cleanValues forKey:@"clean_values"];
  }
  char v9 = (char)self->_has;
  if ((v9 & 8) != 0)
  {
    char v10 = [NSNumber numberWithInt:self->_tokenIndex];
    [v4 setObject:v10 forKey:@"token_index"];

    char v9 = (char)self->_has;
  }
  if ((v9 & 4) != 0)
  {
    char v11 = [NSNumber numberWithInt:self->_nonWhitespaceTokenIndex];
    [v4 setObject:v11 forKey:@"non_whitespace_token_index"];
  }
  cleanValue = self->_cleanValue;
  if (cleanValue) {
    [v4 setObject:cleanValue forKey:@"clean_value"];
  }
  normalizedValues = self->_normalizedValues;
  if (normalizedValues) {
    [v4 setObject:normalizedValues forKey:@"normalized_values"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALToken;
  id v4 = [(SIRINLUINTERNALToken *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALToken *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)normalizedValuesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_normalizedValues objectAtIndex:a3];
}

- (unint64_t)normalizedValuesCount
{
  return [(NSMutableArray *)self->_normalizedValues count];
}

- (void)addNormalizedValues:(id)a3
{
  id v4 = a3;
  normalizedValues = self->_normalizedValues;
  id v8 = v4;
  if (!normalizedValues)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_normalizedValues;
    self->_normalizedValues = v6;

    id v4 = v8;
    normalizedValues = self->_normalizedValues;
  }
  [(NSMutableArray *)normalizedValues addObject:v4];
}

- (void)clearNormalizedValues
{
}

- (BOOL)hasCleanValue
{
  return self->_cleanValue != 0;
}

- (BOOL)hasNonWhitespaceTokenIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNonWhitespaceTokenIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNonWhitespaceTokenIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_nonWhitespaceTokenIndex = a3;
}

- (BOOL)hasTokenIndex
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasTokenIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setTokenIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_tokenIndex = a3;
}

- (id)cleanValuesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cleanValues objectAtIndex:a3];
}

- (unint64_t)cleanValuesCount
{
  return [(NSMutableArray *)self->_cleanValues count];
}

- (void)addCleanValues:(id)a3
{
  id v4 = a3;
  cleanValues = self->_cleanValues;
  id v8 = v4;
  if (!cleanValues)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_cleanValues;
    self->_cleanValues = v6;

    id v4 = v8;
    cleanValues = self->_cleanValues;
  }
  [(NSMutableArray *)cleanValues addObject:v4];
}

- (void)clearCleanValues
{
}

- (BOOL)hasIsWhitespace
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasIsWhitespace:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setIsWhitespace:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isWhitespace = a3;
}

- (BOOL)hasIsSignificant
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasIsSignificant:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setIsSignificant:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isSignificant = a3;
}

- (BOOL)hasEnd
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEnd:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEnd:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_end = a3;
}

- (BOOL)hasBegin
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasBegin:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setBegin:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_begin = a3;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

+ (Class)normalizedValuesType
{
  return (Class)objc_opt_class();
}

+ (Class)cleanValuesType
{
  return (Class)objc_opt_class();
}

@end