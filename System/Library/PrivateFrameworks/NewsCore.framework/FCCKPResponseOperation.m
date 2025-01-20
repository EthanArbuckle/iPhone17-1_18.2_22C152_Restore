@interface FCCKPResponseOperation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)queryRetrieveResponse;
- (id)recordRetrieveResponse;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPResponseOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_recordRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_queryRetrieveResponse, 0);
}

- (id)queryRetrieveResponse
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)recordRetrieveResponse
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
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
        break;
      }
      unint64_t v18 = v11 >> 3;
      if ((int)(v11 >> 3) <= 2)
      {
        if (v18 == 1)
        {
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)&self->_has |= 1u;
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
              goto LABEL_46;
            }
            v20 += 7;
            BOOL v15 = v21++ >= 9;
            if (v15)
            {
              LODWORD(v22) = 0;
              goto LABEL_48;
            }
          }
          *((unsigned char *)a3 + *v6) = 1;
LABEL_46:
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v22) = 0;
          }
LABEL_48:
          self->_operationCost = v22;
          continue;
        }
        if (v18 != 2)
        {
LABEL_43:
          int v26 = PBReaderSkipValueWithTag();
          if (!v26) {
            return v26;
          }
          continue;
        }
        v19 = objc_alloc_init(FCCKPOperation);
        objc_storeStrong((id *)&self->_response, v19);
        if (!PBReaderPlaceMark() || (FCCKPOperationReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
        {
LABEL_51:

          LOBYTE(v26) = 0;
          return v26;
        }
      }
      else
      {
        switch(v18)
        {
          case 3:
            v19 = objc_alloc_init(FCCKPResponseOperationResult);
            objc_storeStrong((id *)&self->_result, v19);
            if (!PBReaderPlaceMark()
              || (FCCKPResponseOperationResultReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
            {
              goto LABEL_51;
            }
            break;
          case 0xD3:
            v19 = objc_alloc_init(FCCKPRecordRetrieveResponse);
            objc_storeStrong((id *)&self->_recordRetrieveResponse, v19);
            if (!PBReaderPlaceMark()
              || (FCCKPRecordRetrieveResponseReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
            {
              goto LABEL_51;
            }
            break;
          case 0xDC:
            v19 = objc_alloc_init(FCCKPQueryRetrieveResponse);
            objc_storeStrong((id *)&self->_queryRetrieveResponse, v19);
            if (!PBReaderPlaceMark() || !FCCKPQueryRetrieveResponseReadFrom((uint64_t)v19, (uint64_t)a3)) {
              goto LABEL_51;
            }
            break;
          default:
            goto LABEL_43;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v26) = *((unsigned char *)a3 + *v6) == 0;
  return v26;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPResponseOperation;
  v4 = [(FCCKPResponseOperation *)&v8 description];
  v5 = [(FCCKPResponseOperation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedInt:self->_operationCost];
    [v3 setObject:v4 forKey:@"operationCost"];
  }
  response = self->_response;
  if (response)
  {
    v6 = [(FCCKPOperation *)response dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"response"];
  }
  v7 = self->_result;
  if (v7)
  {
    objc_super v8 = [(FCCKPResponseOperationResult *)v7 dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"result"];
  }
  recordRetrieveResponse = self->_recordRetrieveResponse;
  if (recordRetrieveResponse)
  {
    unsigned int v10 = [(FCCKPRecordRetrieveResponse *)recordRetrieveResponse dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"recordRetrieveResponse"];
  }
  queryRetrieveResponse = self->_queryRetrieveResponse;
  if (queryRetrieveResponse)
  {
    uint64_t v12 = [(FCCKPQueryRetrieveResponse *)queryRetrieveResponse dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"queryRetrieveResponse"];
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_response)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_result)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_queryRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_operationCost;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v7 = [(FCCKPOperation *)self->_response copyWithZone:a3];
  objc_super v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(FCCKPResponseOperationResult *)self->_result copyWithZone:a3];
  unsigned int v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = [(FCCKPRecordRetrieveResponse *)self->_recordRetrieveResponse copyWithZone:a3];
  uint64_t v12 = (void *)v6[3];
  v6[3] = v11;

  id v13 = [(FCCKPQueryRetrieveResponse *)self->_queryRetrieveResponse copyWithZone:a3];
  char v14 = (void *)v6[2];
  v6[2] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_operationCost != *((_DWORD *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  response = self->_response;
  if ((unint64_t)response | *((void *)v4 + 4) && !-[FCCKPOperation isEqual:](response, "isEqual:")) {
    goto LABEL_15;
  }
  v6 = self->_result;
  if ((unint64_t)v6 | *((void *)v4 + 5))
  {
    if (!-[FCCKPResponseOperationResult isEqual:](v6, "isEqual:")) {
      goto LABEL_15;
    }
  }
  recordRetrieveResponse = self->_recordRetrieveResponse;
  if ((unint64_t)recordRetrieveResponse | *((void *)v4 + 3))
  {
    if (!-[FCCKPRecordRetrieveResponse isEqual:](recordRetrieveResponse, "isEqual:")) {
      goto LABEL_15;
    }
  }
  queryRetrieveResponse = self->_queryRetrieveResponse;
  if ((unint64_t)queryRetrieveResponse | *((void *)v4 + 2)) {
    char v9 = -[FCCKPQueryRetrieveResponse isEqual:](queryRetrieveResponse, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_operationCost;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(FCCKPOperation *)self->_response hash] ^ v3;
  unint64_t v5 = [(FCCKPResponseOperationResult *)self->_result hash];
  unint64_t v6 = v4 ^ v5 ^ [(FCCKPRecordRetrieveResponse *)self->_recordRetrieveResponse hash];
  return v6 ^ [(FCCKPQueryRetrieveResponse *)self->_queryRetrieveResponse hash];
}

@end