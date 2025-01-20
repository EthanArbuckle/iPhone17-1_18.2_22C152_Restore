@interface NPKProtoPaymentPreconditionsNotMetRequest
+ (Class)passIDsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)passIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)failedPreconditionAsString:(int)a3;
- (id)passIDsAtIndex:(unint64_t)a3;
- (int)StringAsFailedPrecondition:(id)a3;
- (int)failedPrecondition;
- (unint64_t)hash;
- (unint64_t)passIDsCount;
- (void)addPassIDs:(id)a3;
- (void)clearPassIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFailedPrecondition:(int)a3;
- (void)setPassIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPaymentPreconditionsNotMetRequest

- (id)failedPreconditionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2644D8C98[a3];
  }
  return v3;
}

- (int)StringAsFailedPrecondition:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Passcode"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WristDetection"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AppleAccount"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearPassIDs
{
}

- (void)addPassIDs:(id)a3
{
  id v4 = a3;
  passIDs = self->_passIDs;
  id v8 = v4;
  if (!passIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_passIDs;
    self->_passIDs = v6;

    id v4 = v8;
    passIDs = self->_passIDs;
  }
  [(NSMutableArray *)passIDs addObject:v4];
}

- (unint64_t)passIDsCount
{
  return [(NSMutableArray *)self->_passIDs count];
}

- (id)passIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_passIDs objectAtIndex:a3];
}

+ (Class)passIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPaymentPreconditionsNotMetRequest;
  id v4 = [(NPKProtoPaymentPreconditionsNotMetRequest *)&v8 description];
  v5 = [(NPKProtoPaymentPreconditionsNotMetRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t failedPrecondition = self->_failedPrecondition;
  if (failedPrecondition >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_failedPrecondition);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_2644D8C98[failedPrecondition];
  }
  [v3 setObject:v5 forKey:@"failedPrecondition"];

  passIDs = self->_passIDs;
  if (passIDs) {
    [v3 setObject:passIDs forKey:@"passIDs"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPaymentPreconditionsNotMetRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_passIDs;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  v8[2] = self->_failedPrecondition;
  if ([(NPKProtoPaymentPreconditionsNotMetRequest *)self passIDsCount])
  {
    [v8 clearPassIDs];
    unint64_t v4 = [(NPKProtoPaymentPreconditionsNotMetRequest *)self passIDsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoPaymentPreconditionsNotMetRequest *)self passIDsAtIndex:i];
        [v8 addPassIDs:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[2] = self->_failedPrecondition;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_passIDs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addPassIDs:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_failedPrecondition == *((_DWORD *)v4 + 2))
  {
    passIDs = self->_passIDs;
    if ((unint64_t)passIDs | v4[2]) {
      char v6 = -[NSMutableArray isEqual:](passIDs, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_failedPrecondition;
  return [(NSMutableArray *)self->_passIDs hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_uint64_t failedPrecondition = *((_DWORD *)v4 + 2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[NPKProtoPaymentPreconditionsNotMetRequest addPassIDs:](self, "addPassIDs:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int)failedPrecondition
{
  return self->_failedPrecondition;
}

- (void)setFailedPrecondition:(int)a3
{
  self->_uint64_t failedPrecondition = a3;
}

- (NSMutableArray)passIDs
{
  return self->_passIDs;
}

- (void)setPassIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end