@interface NPKProtoRemotePassActionEnterValueResponse
- (BOOL)hasIncrementAmount;
- (BOOL)hasIncrementCurrency;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)incrementCurrency;
- (NSString)requestUniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)resultAsString:(int)a3;
- (int)StringAsResult:(id)a3;
- (int)result;
- (int64_t)incrementAmount;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIncrementAmount:(BOOL)a3;
- (void)setIncrementAmount:(int64_t)a3;
- (void)setIncrementCurrency:(id)a3;
- (void)setRequestUniqueID:(id)a3;
- (void)setResult:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRemotePassActionEnterValueResponse

- (id)resultAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2644D6E60[a3];
  }
  return v3;
}

- (int)StringAsResult:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Successful"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Fail"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Reject"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Unsupported"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasIncrementCurrency
{
  return self->_incrementCurrency != 0;
}

- (void)setIncrementAmount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_incrementAmount = a3;
}

- (void)setHasIncrementAmount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIncrementAmount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemotePassActionEnterValueResponse;
  int v4 = [(NPKProtoRemotePassActionEnterValueResponse *)&v8 description];
  v5 = [(NPKProtoRemotePassActionEnterValueResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  requestUniqueID = self->_requestUniqueID;
  if (requestUniqueID) {
    [v3 setObject:requestUniqueID forKey:@"requestUniqueID"];
  }
  uint64_t v6 = self->_result;
  if (v6 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_result);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_2644D6E60[v6];
  }
  [v4 setObject:v7 forKey:@"result"];

  incrementCurrency = self->_incrementCurrency;
  if (incrementCurrency) {
    [v4 setObject:incrementCurrency forKey:@"incrementCurrency"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithLongLong:self->_incrementAmount];
    [v4 setObject:v9 forKey:@"incrementAmount"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassActionEnterValueResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_requestUniqueID) {
    -[NPKProtoRemotePassActionEnterValueResponse writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (self->_incrementCurrency) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteSint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setRequestUniqueID:self->_requestUniqueID];
  id v4 = v5;
  v5[8] = self->_result;
  if (self->_incrementCurrency)
  {
    objc_msgSend(v5, "setIncrementCurrency:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_incrementAmount;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestUniqueID copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(_DWORD *)(v5 + 32) = self->_result;
  uint64_t v8 = [(NSString *)self->_incrementCurrency copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_incrementAmount;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  requestUniqueID = self->_requestUniqueID;
  if ((unint64_t)requestUniqueID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](requestUniqueID, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (self->_result != *((_DWORD *)v4 + 8)) {
    goto LABEL_11;
  }
  incrementCurrency = self->_incrementCurrency;
  if ((unint64_t)incrementCurrency | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](incrementCurrency, "isEqual:")) {
      goto LABEL_11;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) != 0 && self->_incrementAmount == *((void *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_12;
    }
LABEL_11:
    BOOL v7 = 0;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestUniqueID hash];
  uint64_t v4 = self->_result;
  NSUInteger v5 = [(NSString *)self->_incrementCurrency hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_incrementAmount;
  }
  else {
    uint64_t v6 = 0;
  }
  return (2654435761 * v4) ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[NPKProtoRemotePassActionEnterValueResponse setRequestUniqueID:](self, "setRequestUniqueID:");
    id v4 = v5;
  }
  self->_result = *((_DWORD *)v4 + 8);
  if (*((void *)v4 + 2))
  {
    -[NPKProtoRemotePassActionEnterValueResponse setIncrementCurrency:](self, "setIncrementCurrency:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_incrementAmount = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)requestUniqueID
{
  return self->_requestUniqueID;
}

- (void)setRequestUniqueID:(id)a3
{
}

- (int)result
{
  return self->_result;
}

- (void)setResult:(int)a3
{
  self->_result = a3;
}

- (NSString)incrementCurrency
{
  return self->_incrementCurrency;
}

- (void)setIncrementCurrency:(id)a3
{
}

- (int64_t)incrementAmount
{
  return self->_incrementAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUniqueID, 0);
  objc_storeStrong((id *)&self->_incrementCurrency, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemotePassActionEnterValueResponse writeTo:]", "NPKProtoRemotePassActionEnterValueResponse.m", 126, "nil != self->_requestUniqueID");
}

@end