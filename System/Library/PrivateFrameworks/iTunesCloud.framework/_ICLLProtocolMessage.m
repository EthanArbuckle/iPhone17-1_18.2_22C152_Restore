@interface _ICLLProtocolMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)clearOneofValuesForType;
- (void)setCommand:(uint64_t)a1;
- (void)setQuery:(uint64_t)a1;
- (void)setTraceId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLProtocolMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceId, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_command, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_traceId hash] ^ v3;
  unint64_t v5 = [(_ICLLCommandMessage *)self->_command hash];
  unint64_t v6 = v4 ^ v5 ^ [(_ICLLActionMessage *)self->_action hash];
  unint64_t v7 = [(_ICLLErrorMessage *)self->_error hash];
  return v6 ^ v7 ^ [(_ICLLQueryMessage *)self->_query hash];
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
  traceId = self->_traceId;
  if ((unint64_t)traceId | *((void *)v4 + 5) && !-[NSString isEqual:](traceId, "isEqual:")) {
    goto LABEL_17;
  }
  command = self->_command;
  if ((unint64_t)command | *((void *)v4 + 2))
  {
    if (!-[_ICLLCommandMessage isEqual:](command, "isEqual:")) {
      goto LABEL_17;
    }
  }
  action = self->_action;
  if ((unint64_t)action | *((void *)v4 + 1))
  {
    if (!-[_ICLLActionMessage isEqual:](action, "isEqual:")) {
      goto LABEL_17;
    }
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 3))
  {
    if (!-[_ICLLErrorMessage isEqual:](error, "isEqual:")) {
      goto LABEL_17;
    }
  }
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 4)) {
    char v10 = -[_ICLLQueryMessage isEqual:](query, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_type;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_traceId copyWithZone:a3];
  v8 = (void *)v6[5];
  v6[5] = v7;

  id v9 = [(_ICLLCommandMessage *)self->_command copyWithZone:a3];
  char v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(_ICLLActionMessage *)self->_action copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  id v13 = [(_ICLLErrorMessage *)self->_error copyWithZone:a3];
  v14 = (void *)v6[3];
  v6[3] = v13;

  id v15 = [(_ICLLQueryMessage *)self->_query copyWithZone:a3];
  v16 = (void *)v6[4];
  v6[4] = v15;

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_traceId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_command)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_action)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_query)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    while (!*((unsigned char *)a3 + *v6))
    {
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
        if (v10++ >= 9)
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
        break;
      }
      switch((v11 >> 3))
      {
        case 0u:
          unsigned int v18 = 0;
          do
          {
            uint64_t v19 = *v4;
            unint64_t v20 = *(void *)((char *)a3 + v19);
            if (v20 == -1 || v20 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
              goto LABEL_41;
            }
            unint64_t v21 = v20 + 1;
            int v22 = *(char *)(*(void *)((char *)a3 + *v8) + v20);
            *(void *)((char *)a3 + v19) = v21;
            if ((v22 & 0x80000000) == 0) {
              break;
            }
          }
          while (v18++ <= 8);
          goto LABEL_41;
        case 1u:
          PBReaderReadString();
          v25 = (NSString *)objc_claimAutoreleasedReturnValue();
          traceId = self->_traceId;
          self->_traceId = v25;

          goto LABEL_41;
        case 2u:
          -[_ICLLProtocolMessage clearOneofValuesForType]((uint64_t)self);
          *(unsigned char *)&self->_has |= 1u;
          self->_type = 1;
          v27 = objc_alloc_init(_ICLLCommandMessage);
          objc_storeStrong((id *)&self->_command, v27);
          if (!PBReaderPlaceMark() || (_ICLLCommandMessageReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0) {
            goto LABEL_45;
          }
          goto LABEL_40;
        case 3u:
          -[_ICLLProtocolMessage clearOneofValuesForType]((uint64_t)self);
          *(unsigned char *)&self->_has |= 1u;
          self->_type = 2;
          v27 = objc_alloc_init(_ICLLActionMessage);
          objc_storeStrong((id *)&self->_action, v27);
          if (!PBReaderPlaceMark() || (_ICLLActionMessageReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0) {
            goto LABEL_45;
          }
          goto LABEL_40;
        case 4u:
          -[_ICLLProtocolMessage clearOneofValuesForType]((uint64_t)self);
          *(unsigned char *)&self->_has |= 1u;
          self->_type = 3;
          v27 = objc_alloc_init(_ICLLErrorMessage);
          objc_storeStrong((id *)&self->_error, v27);
          if (!PBReaderPlaceMark() || (_ICLLErrorMessageReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0) {
            goto LABEL_45;
          }
          goto LABEL_40;
        case 5u:
          -[_ICLLProtocolMessage clearOneofValuesForType]((uint64_t)self);
          *(unsigned char *)&self->_has |= 1u;
          self->_type = 4;
          v27 = objc_alloc_init(_ICLLQueryMessage);
          objc_storeStrong((id *)&self->_query, v27);
          if (!PBReaderPlaceMark() || (_ICLLQueryMessageReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0)
          {
LABEL_45:

            LOBYTE(v24) = 0;
            return v24;
          }
LABEL_40:
          PBReaderRecallMark();

LABEL_41:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_44;
          }
          break;
        default:
          int v24 = PBReaderSkipValueWithTag();
          if (!v24) {
            return v24;
          }
          goto LABEL_41;
      }
    }
  }
LABEL_44:
  LOBYTE(v24) = *((unsigned char *)a3 + *v6) == 0;
  return v24;
}

- (void)clearOneofValuesForType
{
  if (a1)
  {
    *(unsigned char *)(a1 + 52) &= ~1u;
    *(_DWORD *)(a1 + 48) = 0;
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    uint64_t v3 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    id v4 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    id v5 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  traceId = self->_traceId;
  if (traceId) {
    [v3 setObject:traceId forKey:@"traceId"];
  }
  command = self->_command;
  if (command)
  {
    uint64_t v7 = [(_ICLLCommandMessage *)command dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"command"];
  }
  action = self->_action;
  if (action)
  {
    char v9 = [(_ICLLActionMessage *)action dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"action"];
  }
  error = self->_error;
  if (error)
  {
    unint64_t v11 = [(_ICLLErrorMessage *)error dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"error"];
  }
  query = self->_query;
  if (query)
  {
    unint64_t v13 = [(_ICLLQueryMessage *)query dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"query"];
  }
  if (*(unsigned char *)&self->_has)
  {
    char v14 = [NSNumber numberWithInt:self->_type];
    [v4 setObject:v14 forKey:@"type"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLProtocolMessage;
  id v4 = [(_ICLLProtocolMessage *)&v8 description];
  id v5 = [(_ICLLProtocolMessage *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setCommand:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    -[_ICLLProtocolMessage clearOneofValuesForType](a1);
    *(unsigned char *)(a1 + 52) |= 1u;
    *(_DWORD *)(a1 + 48) = 1;
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setQuery:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    -[_ICLLProtocolMessage clearOneofValuesForType](a1);
    *(unsigned char *)(a1 + 52) |= 1u;
    *(_DWORD *)(a1 + 48) = 4;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setTraceId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

@end