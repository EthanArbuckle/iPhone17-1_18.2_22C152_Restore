@interface NPKProtoMarkPaymentPassForDeleteRequest
+ (Class)paymentApplicationAIDsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)paymentApplicationAIDs;
- (NSString)passID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)paymentApplicationAIDsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)paymentApplicationAIDsCount;
- (void)addPaymentApplicationAIDs:(id)a3;
- (void)clearPaymentApplicationAIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPassID:(id)a3;
- (void)setPaymentApplicationAIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoMarkPaymentPassForDeleteRequest

- (void)clearPaymentApplicationAIDs
{
}

- (void)addPaymentApplicationAIDs:(id)a3
{
  id v4 = a3;
  paymentApplicationAIDs = self->_paymentApplicationAIDs;
  id v8 = v4;
  if (!paymentApplicationAIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_paymentApplicationAIDs;
    self->_paymentApplicationAIDs = v6;

    id v4 = v8;
    paymentApplicationAIDs = self->_paymentApplicationAIDs;
  }
  [(NSMutableArray *)paymentApplicationAIDs addObject:v4];
}

- (unint64_t)paymentApplicationAIDsCount
{
  return [(NSMutableArray *)self->_paymentApplicationAIDs count];
}

- (id)paymentApplicationAIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_paymentApplicationAIDs objectAtIndex:a3];
}

+ (Class)paymentApplicationAIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoMarkPaymentPassForDeleteRequest;
  id v4 = [(NPKProtoMarkPaymentPassForDeleteRequest *)&v8 description];
  v5 = [(NPKProtoMarkPaymentPassForDeleteRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  passID = self->_passID;
  if (passID) {
    [v3 setObject:passID forKey:@"passID"];
  }
  paymentApplicationAIDs = self->_paymentApplicationAIDs;
  if (paymentApplicationAIDs) {
    [v4 setObject:paymentApplicationAIDs forKey:@"paymentApplicationAIDs"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoMarkPaymentPassForDeleteRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_passID) {
    -[NPKProtoMarkPaymentPassForDeleteRequest writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_paymentApplicationAIDs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setPassID:self->_passID];
  if ([(NPKProtoMarkPaymentPassForDeleteRequest *)self paymentApplicationAIDsCount])
  {
    [v8 clearPaymentApplicationAIDs];
    unint64_t v4 = [(NPKProtoMarkPaymentPassForDeleteRequest *)self paymentApplicationAIDsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoMarkPaymentPassForDeleteRequest *)self paymentApplicationAIDsAtIndex:i];
        [v8 addPaymentApplicationAIDs:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passID copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_paymentApplicationAIDs;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addPaymentApplicationAIDs:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((passID = self->_passID, !((unint64_t)passID | v4[1]))
     || -[NSString isEqual:](passID, "isEqual:")))
  {
    paymentApplicationAIDs = self->_paymentApplicationAIDs;
    if ((unint64_t)paymentApplicationAIDs | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](paymentApplicationAIDs, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passID hash];
  return [(NSMutableArray *)self->_paymentApplicationAIDs hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[NPKProtoMarkPaymentPassForDeleteRequest setPassID:](self, "setPassID:");
  }
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
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NPKProtoMarkPaymentPassForDeleteRequest addPaymentApplicationAIDs:](self, "addPaymentApplicationAIDs:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
}

- (NSMutableArray)paymentApplicationAIDs
{
  return self->_paymentApplicationAIDs;
}

- (void)setPaymentApplicationAIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplicationAIDs, 0);
  objc_storeStrong((id *)&self->_passID, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoMarkPaymentPassForDeleteRequest writeTo:]", "NPKProtoMarkPaymentPassForDeleteRequest.m", 110, "nil != self->_passID");
}

@end