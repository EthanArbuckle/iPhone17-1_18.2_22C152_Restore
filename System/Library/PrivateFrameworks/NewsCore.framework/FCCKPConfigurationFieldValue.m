@interface FCCKPConfigurationFieldValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addFieldValues:(uint64_t)a1;
- (uint64_t)addListValues:(uint64_t)a1;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPConfigurationFieldValue

- (uint64_t)addFieldValues:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 32);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      v5 = *(void **)(a1 + 32);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)addListValues:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 40);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v6;

      v5 = *(void **)(a1 + 40);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPConfigurationFieldValue;
  id v4 = [(FCCKPConfigurationFieldValue *)&v8 description];
  v5 = [(FCCKPConfigurationFieldValue *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    id v4 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  bytesValue = self->_bytesValue;
  if (bytesValue) {
    [v3 setObject:bytesValue forKey:@"bytesValue"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v24 = [NSNumber numberWithBool:self->_BOOLValue];
    [v3 setObject:v24 forKey:@"BOOLValue"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v25 = [NSNumber numberWithLongLong:self->_longValue];
  [v3 setObject:v25 forKey:@"longValue"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    v7 = [NSNumber numberWithDouble:self->_doubleValue];
    [v3 setObject:v7 forKey:@"doubleValue"];
  }
LABEL_9:
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  if ([(NSMutableArray *)self->_fieldValues count])
  {
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_fieldValues, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v10 = self->_fieldValues;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v30 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"fieldValues"];
  }
  if ([(NSMutableArray *)self->_listValues count])
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_listValues, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v17 = self->_listValues;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "dictionaryRepresentation", (void)v26);
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKey:@"listValues"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPConfigurationFieldValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_bytesValue) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_8:
  }
    PBDataWriterWriteDoubleField();
LABEL_9:
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = self->_fieldValues;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = self->_listValues;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(unsigned char *)(v5 + 64) |= 4u;
  }
  uint64_t v7 = [(NSData *)self->_bytesValue copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v6 + 60) = self->_BOOLValue;
    *(unsigned char *)(v6 + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 16) = self->_longValue;
  *(unsigned char *)(v6 + 64) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *(double *)(v6 + 8) = self->_doubleValue;
    *(unsigned char *)(v6 + 64) |= 1u;
  }
LABEL_7:
  uint64_t v10 = [(NSString *)self->_stringValue copyWithZone:a3];
  uint64_t v11 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v10;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = self->_fieldValues;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * i) copyWithZone:a3];
        -[FCCKPConfigurationFieldValue addFieldValues:](v6, v17);
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v18 = self->_listValues;
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
        -[FCCKPConfigurationFieldValue addListValues:](v6, v23);
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 64);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_34;
  }
  bytesValue = self->_bytesValue;
  if ((unint64_t)bytesValue | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](bytesValue, "isEqual:")) {
      goto LABEL_34;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 64);
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_34;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_18;
      }
    }
LABEL_34:
    char v11 = 0;
    goto LABEL_35;
  }
  if ((v6 & 8) != 0) {
    goto LABEL_34;
  }
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_longValue != *((void *)v4 + 2)) {
      goto LABEL_34;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_34;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_34;
    }
  }
  else if (v6)
  {
    goto LABEL_34;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 6)
    && !-[NSString isEqual:](stringValue, "isEqual:"))
  {
    goto LABEL_34;
  }
  fieldValues = self->_fieldValues;
  if ((unint64_t)fieldValues | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](fieldValues, "isEqual:")) {
      goto LABEL_34;
    }
  }
  listValues = self->_listValues;
  if ((unint64_t)listValues | *((void *)v4 + 5)) {
    char v11 = -[NSMutableArray isEqual:](listValues, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_35:

  return v11;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_bytesValue hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v11 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = 2654435761 * self->_BOOLValue;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_longValue;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  double doubleValue = self->_doubleValue;
  double v8 = -doubleValue;
  if (doubleValue >= 0.0) {
    double v8 = self->_doubleValue;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_16:
  unint64_t v12 = v4 ^ v3 ^ v5 ^ v6 ^ v11;
  NSUInteger v13 = [(NSString *)self->_stringValue hash];
  uint64_t v14 = v12 ^ v13 ^ [(NSMutableArray *)self->_fieldValues hash];
  return v14 ^ [(NSMutableArray *)self->_listValues hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_listValues, 0);
  objc_storeStrong((id *)&self->_fieldValues, 0);
  objc_storeStrong((id *)&self->_bytesValue, 0);
}

@end