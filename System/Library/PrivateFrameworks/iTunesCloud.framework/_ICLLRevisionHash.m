@interface _ICLLRevisionHash
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLRevisionHash

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_hashValue hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_revision;
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
    goto LABEL_14;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 24);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_type != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  hashValue = self->_hashValue;
  if ((unint64_t)hashValue | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](hashValue, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 24);
  }
  BOOL v8 = (v6 & 1) == 0;
  if (has)
  {
    if ((v6 & 1) == 0 || self->_revision != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_type;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_hashValue copyWithZone:a3];
  BOOL v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 16) = self->_revision;
    *(unsigned char *)(v6 + 24) |= 1u;
  }
  return (id)v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hashValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    BOOL v8 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        goto LABEL_48;
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
        goto LABEL_48;
      }
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 3) {
        break;
      }
      if (v18 != 2)
      {
        if (v18 != 1)
        {
          int v32 = PBReaderSkipValueWithTag();
          if (!v32) {
            return v32;
          }
          goto LABEL_47;
        }
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)&self->_has |= 2u;
        while (1)
        {
          uint64_t v22 = *v4;
          unint64_t v23 = *(void *)((char *)a3 + v22);
          if (v23 == -1 || v23 >= *(void *)((char *)a3 + *v5)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v23);
          *(void *)((char *)a3 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_39;
          }
          v19 += 7;
          BOOL v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_41;
          }
        }
        *((unsigned char *)a3 + *v6) = 1;
LABEL_39:
        if (*((unsigned char *)a3 + *v6)) {
          LODWORD(v21) = 0;
        }
LABEL_41:
        uint64_t v33 = 20;
        goto LABEL_46;
      }
      PBReaderReadString();
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      hashValue = self->_hashValue;
      self->_hashValue = v30;

LABEL_47:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        goto LABEL_48;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v21 = 0;
    *(unsigned char *)&self->_has |= 1u;
    while (1)
    {
      uint64_t v27 = *v4;
      unint64_t v28 = *(void *)((char *)a3 + v27);
      if (v28 == -1 || v28 >= *(void *)((char *)a3 + *v5)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v28);
      *(void *)((char *)a3 + v27) = v28 + 1;
      v21 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0) {
        goto LABEL_43;
      }
      v25 += 7;
      BOOL v15 = v26++ >= 9;
      if (v15)
      {
        LODWORD(v21) = 0;
        goto LABEL_45;
      }
    }
    *((unsigned char *)a3 + *v6) = 1;
LABEL_43:
    if (*((unsigned char *)a3 + *v6)) {
      LODWORD(v21) = 0;
    }
LABEL_45:
    uint64_t v33 = 16;
LABEL_46:
    *(_DWORD *)((char *)&self->super.super.isa + v33) = v21;
    goto LABEL_47;
  }
LABEL_48:
  LOBYTE(v32) = *((unsigned char *)a3 + *v6) == 0;
  return v32;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  hashValue = self->_hashValue;
  if (hashValue) {
    [v3 setObject:hashValue forKey:@"hashValue"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithInt:self->_revision];
    [v3 setObject:v6 forKey:@"revision"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLRevisionHash;
  id v4 = [(_ICLLRevisionHash *)&v8 description];
  id v5 = [(_ICLLRevisionHash *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end