@interface FCCKPConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addFields:(uint64_t)a1;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPConfiguration

- (uint64_t)addFields:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 24);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      v5 = *(void **)(a1 + 24);
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
  v8.super_class = (Class)FCCKPConfiguration;
  id v4 = [(FCCKPConfiguration *)&v8 description];
  v5 = [(FCCKPConfiguration *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_fields count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_fields, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = self->_fields;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"fields"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v12 = [NSNumber numberWithUnsignedLongLong:self->_created];
    [v3 setObject:v12 forKey:@"created"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v13 = [NSNumber numberWithUnsignedLongLong:self->_expires];
    [v3 setObject:v13 forKey:@"expires"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v8 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        goto LABEL_50;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        goto LABEL_50;
      }
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 3) {
        break;
      }
      if (v18 == 2)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        unint64_t v22 = 0;
        *(unsigned char *)&self->_has |= 1u;
        while (1)
        {
          uint64_t v28 = *v4;
          unint64_t v29 = *(void *)((char *)a3 + v28);
          if (v29 == -1 || v29 >= *(void *)((char *)a3 + *v5)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v29);
          *(void *)((char *)a3 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0) {
            goto LABEL_45;
          }
          v26 += 7;
          BOOL v15 = v27++ >= 9;
          if (v15)
          {
            unint64_t v22 = 0;
            goto LABEL_47;
          }
        }
        *((unsigned char *)a3 + *v6) = 1;
LABEL_45:
        if (*((unsigned char *)a3 + *v6)) {
          unint64_t v22 = 0;
        }
LABEL_47:
        uint64_t v32 = 8;
LABEL_48:
        *(Class *)((char *)&self->super.super.isa + v32) = (Class)v22;
        goto LABEL_49;
      }
      if (v18 == 1)
      {
        v19 = objc_alloc_init(FCCKPConfigurationField);
        -[FCCKPConfiguration addFields:]((uint64_t)self, v19);
        if (!PBReaderPlaceMark() || !FCCKPConfigurationFieldReadFrom((uint64_t)v19, (uint64_t)a3))
        {

          LOBYTE(v31) = 0;
          return v31;
        }
        PBReaderRecallMark();
      }
      else
      {
        int v31 = PBReaderSkipValueWithTag();
        if (!v31) {
          return v31;
        }
      }
LABEL_49:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        goto LABEL_50;
      }
    }
    char v20 = 0;
    unsigned int v21 = 0;
    unint64_t v22 = 0;
    *(unsigned char *)&self->_has |= 2u;
    while (1)
    {
      uint64_t v23 = *v4;
      unint64_t v24 = *(void *)((char *)a3 + v23);
      if (v24 == -1 || v24 >= *(void *)((char *)a3 + *v5)) {
        break;
      }
      char v25 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v24);
      *(void *)((char *)a3 + v23) = v24 + 1;
      v22 |= (unint64_t)(v25 & 0x7F) << v20;
      if ((v25 & 0x80) == 0) {
        goto LABEL_41;
      }
      v20 += 7;
      BOOL v15 = v21++ >= 9;
      if (v15)
      {
        unint64_t v22 = 0;
        goto LABEL_43;
      }
    }
    *((unsigned char *)a3 + *v6) = 1;
LABEL_41:
    if (*((unsigned char *)a3 + *v6)) {
      unint64_t v22 = 0;
    }
LABEL_43:
    uint64_t v32 = 16;
    goto LABEL_48;
  }
LABEL_50:
  LOBYTE(v31) = *((unsigned char *)a3 + *v6) == 0;
  return v31;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_fields;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_fields;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        -[FCCKPConfiguration addFields:](v5, v11);
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_created;
    *(unsigned char *)(v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_expires;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  fields = self->_fields;
  if ((unint64_t)fields | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](fields, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_created != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_expires != *((void *)v4 + 2)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_fields hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v4 = 2654435761u * self->_created;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_expires;
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
}

@end