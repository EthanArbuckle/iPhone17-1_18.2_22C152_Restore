@interface NPKProtoStandalonePaymentPassListResponse
+ (Class)paymentPassesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandaloneResponseHeader)responseHeader;
- (NSMutableArray)paymentPasses;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)paymentPassesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)paymentPassesCount;
- (void)addPaymentPasses:(id)a3;
- (void)clearPaymentPasses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPaymentPasses:(id)a3;
- (void)setResponseHeader:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentPassListResponse

- (void)clearPaymentPasses
{
}

- (void)addPaymentPasses:(id)a3
{
  id v4 = a3;
  paymentPasses = self->_paymentPasses;
  id v8 = v4;
  if (!paymentPasses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_paymentPasses;
    self->_paymentPasses = v6;

    id v4 = v8;
    paymentPasses = self->_paymentPasses;
  }
  [(NSMutableArray *)paymentPasses addObject:v4];
}

- (unint64_t)paymentPassesCount
{
  return [(NSMutableArray *)self->_paymentPasses count];
}

- (id)paymentPassesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_paymentPasses objectAtIndex:a3];
}

+ (Class)paymentPassesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentPassListResponse;
  id v4 = [(NPKProtoStandalonePaymentPassListResponse *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentPassListResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  responseHeader = self->_responseHeader;
  if (responseHeader)
  {
    v5 = [(NPKProtoStandaloneResponseHeader *)responseHeader dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"responseHeader"];
  }
  if ([(NSMutableArray *)self->_paymentPasses count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_paymentPasses, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_paymentPasses;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"paymentPasses"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentPassListResponseReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_responseHeader) {
    -[NPKProtoStandalonePaymentPassListResponse writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_paymentPasses;
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
        PBDataWriterWriteSubmessage();
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
  [v8 setResponseHeader:self->_responseHeader];
  if ([(NPKProtoStandalonePaymentPassListResponse *)self paymentPassesCount])
  {
    [v8 clearPaymentPasses];
    unint64_t v4 = [(NPKProtoStandalonePaymentPassListResponse *)self paymentPassesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoStandalonePaymentPassListResponse *)self paymentPassesAtIndex:i];
        [v8 addPaymentPasses:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandaloneResponseHeader *)self->_responseHeader copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_paymentPasses;
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
        [v5 addPaymentPasses:v13];

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
    && ((responseHeader = self->_responseHeader, !((unint64_t)responseHeader | v4[2]))
     || -[NPKProtoStandaloneResponseHeader isEqual:](responseHeader, "isEqual:")))
  {
    paymentPasses = self->_paymentPasses;
    if ((unint64_t)paymentPasses | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](paymentPasses, "isEqual:");
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
  unint64_t v3 = [(NPKProtoStandaloneResponseHeader *)self->_responseHeader hash];
  return [(NSMutableArray *)self->_paymentPasses hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  responseHeader = self->_responseHeader;
  uint64_t v6 = *((void *)v4 + 2);
  if (responseHeader)
  {
    if (v6) {
      -[NPKProtoStandaloneResponseHeader mergeFrom:](responseHeader, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NPKProtoStandalonePaymentPassListResponse setResponseHeader:](self, "setResponseHeader:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NPKProtoStandalonePaymentPassListResponse addPaymentPasses:](self, "addPaymentPasses:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NPKProtoStandaloneResponseHeader)responseHeader
{
  return self->_responseHeader;
}

- (void)setResponseHeader:(id)a3
{
}

- (NSMutableArray)paymentPasses
{
  return self->_paymentPasses;
}

- (void)setPaymentPasses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHeader, 0);
  objc_storeStrong((id *)&self->_paymentPasses, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentPassListResponse writeTo:]", "NPKProtoStandalonePaymentPassListResponse.m", 139, "self->_responseHeader != nil");
}

@end