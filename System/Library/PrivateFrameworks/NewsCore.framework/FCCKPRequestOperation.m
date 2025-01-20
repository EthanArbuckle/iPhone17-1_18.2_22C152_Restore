@interface FCCKPRequestOperation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)queryRetrieveRequest;
- (id)recordRetrieveRequest;
- (unint64_t)hash;
- (void)setHeader:(uint64_t)a1;
- (void)setQueryRetrieveRequest:(uint64_t)a1;
- (void)setRecordRetrieveRequest:(uint64_t)a1;
- (void)setRequest:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_recordRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_queryRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_queryRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)queryRetrieveRequest
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)recordRetrieveRequest
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setRequest:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setRecordRetrieveRequest:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setQueryRetrieveRequest:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setHeader:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRequestOperation;
  id v4 = [(FCCKPRequestOperation *)&v8 description];
  id v5 = [(FCCKPRequestOperation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  header = self->_header;
  if (header)
  {
    id v5 = [(FCCKPRequestOperationHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  request = self->_request;
  if (request)
  {
    v7 = [(FCCKPOperation *)request dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"request"];
  }
  recordRetrieveRequest = self->_recordRetrieveRequest;
  if (recordRetrieveRequest)
  {
    v9 = [(FCCKPRecordRetrieveRequest *)recordRetrieveRequest dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"recordRetrieveRequest"];
  }
  queryRetrieveRequest = self->_queryRetrieveRequest;
  if (queryRetrieveRequest)
  {
    v11 = [(FCCKPQueryRetrieveRequest *)queryRetrieveRequest dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"queryRetrieveRequest"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    objc_super v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        return *((unsigned char *)a3 + *v6) == 0;
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
        return *((unsigned char *)a3 + *v6) == 0;
      }
      unint64_t v18 = v11 >> 3;
      if ((int)(v11 >> 3) > 210)
      {
        if (v18 == 211)
        {
          v19 = objc_alloc_init(FCCKPRecordRetrieveRequest);
          objc_storeStrong((id *)&self->_recordRetrieveRequest, v19);
          if (!PBReaderPlaceMark() || !FCCKPRecordRetrieveRequestReadFrom((uint64_t)v19, (uint64_t)a3))
          {
LABEL_38:

            return 0;
          }
          goto LABEL_34;
        }
        if (v18 == 220)
        {
          v19 = objc_alloc_init(FCCKPQueryRetrieveRequest);
          objc_storeStrong((id *)&self->_queryRetrieveRequest, v19);
          if (!PBReaderPlaceMark()
            || (FCCKPQueryRetrieveRequestReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
          {
            goto LABEL_38;
          }
          goto LABEL_34;
        }
      }
      else
      {
        if (v18 == 1)
        {
          v19 = objc_alloc_init(FCCKPRequestOperationHeader);
          objc_storeStrong((id *)&self->_header, v19);
          if (!PBReaderPlaceMark()
            || (FCCKPRequestOperationHeaderReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
          {
            goto LABEL_38;
          }
          goto LABEL_34;
        }
        if (v18 == 2)
        {
          v19 = objc_alloc_init(FCCKPOperation);
          objc_storeStrong((id *)&self->_request, v19);
          if (!PBReaderPlaceMark() || (FCCKPOperationReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0) {
            goto LABEL_38;
          }
LABEL_34:
          PBReaderRecallMark();

          continue;
        }
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  return *((unsigned char *)a3 + *v6) == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(FCCKPRequestOperationHeader *)self->_header copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(FCCKPOperation *)self->_request copyWithZone:a3];
  char v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(FCCKPRecordRetrieveRequest *)self->_recordRetrieveRequest copyWithZone:a3];
  unint64_t v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(FCCKPQueryRetrieveRequest *)self->_queryRetrieveRequest copyWithZone:a3];
  unint64_t v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[1]))
     || -[FCCKPRequestOperationHeader isEqual:](header, "isEqual:"))
    && ((request = self->_request, !((unint64_t)request | v4[4]))
     || -[FCCKPOperation isEqual:](request, "isEqual:"))
    && ((recordRetrieveRequest = self->_recordRetrieveRequest, !((unint64_t)recordRetrieveRequest | v4[3]))
     || -[FCCKPRecordRetrieveRequest isEqual:](recordRetrieveRequest, "isEqual:")))
  {
    queryRetrieveRequest = self->_queryRetrieveRequest;
    if ((unint64_t)queryRetrieveRequest | v4[2]) {
      char v9 = -[FCCKPQueryRetrieveRequest isEqual:](queryRetrieveRequest, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FCCKPRequestOperationHeader *)self->_header hash];
  unint64_t v4 = [(FCCKPOperation *)self->_request hash] ^ v3;
  unint64_t v5 = [(FCCKPRecordRetrieveRequest *)self->_recordRetrieveRequest hash];
  return v4 ^ v5 ^ [(FCCKPQueryRetrieveRequest *)self->_queryRetrieveRequest hash];
}

@end