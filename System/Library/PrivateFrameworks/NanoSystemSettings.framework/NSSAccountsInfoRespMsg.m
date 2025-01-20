@interface NSSAccountsInfoRespMsg
+ (Class)accountType;
- (BOOL)hasWatchAKDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)watchAKDevice;
- (NSMutableArray)accounts;
- (id)accountAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)accountsCount;
- (unint64_t)hash;
- (void)addAccount:(id)a3;
- (void)clearAccounts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setWatchAKDevice:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSAccountsInfoRespMsg

- (void)clearAccounts
{
}

- (void)addAccount:(id)a3
{
  id v4 = a3;
  accounts = self->_accounts;
  id v8 = v4;
  if (!accounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_accounts;
    self->_accounts = v6;

    id v4 = v8;
    accounts = self->_accounts;
  }
  [(NSMutableArray *)accounts addObject:v4];
}

- (unint64_t)accountsCount
{
  return [(NSMutableArray *)self->_accounts count];
}

- (id)accountAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_accounts objectAtIndex:a3];
}

+ (Class)accountType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasWatchAKDevice
{
  return self->_watchAKDevice != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSAccountsInfoRespMsg;
  id v4 = [(NSSAccountsInfoRespMsg *)&v8 description];
  v5 = [(NSSAccountsInfoRespMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_accounts count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_accounts, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_accounts;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"account"];
  }
  watchAKDevice = self->_watchAKDevice;
  if (watchAKDevice) {
    [v3 setObject:watchAKDevice forKey:@"watchAKDevice"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSAccountsInfoRespMsgReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_accounts;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_watchAKDevice) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(NSSAccountsInfoRespMsg *)self accountsCount])
  {
    [v8 clearAccounts];
    unint64_t v4 = [(NSSAccountsInfoRespMsg *)self accountsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NSSAccountsInfoRespMsg *)self accountAtIndex:i];
        [v8 addAccount:v7];
      }
    }
  }
  if (self->_watchAKDevice) {
    objc_msgSend(v8, "setWatchAKDevice:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_accounts;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addAccount:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSData *)self->_watchAKDevice copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((accounts = self->_accounts, !((unint64_t)accounts | v4[1]))
     || -[NSMutableArray isEqual:](accounts, "isEqual:")))
  {
    watchAKDevice = self->_watchAKDevice;
    if ((unint64_t)watchAKDevice | v4[2]) {
      char v7 = -[NSData isEqual:](watchAKDevice, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_accounts hash];
  return [(NSData *)self->_watchAKDevice hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[1];
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
        -[NSSAccountsInfoRespMsg addAccount:](self, "addAccount:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[2]) {
    -[NSSAccountsInfoRespMsg setWatchAKDevice:](self, "setWatchAKDevice:");
  }
}

- (NSMutableArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (NSData)watchAKDevice
{
  return self->_watchAKDevice;
}

- (void)setWatchAKDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchAKDevice, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

@end