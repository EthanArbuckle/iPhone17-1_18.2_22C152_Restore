@interface NPKProtoGenerateTransactionKeyWithParametersResponse
+ (Class)transactionKeyCertChainType;
- (BOOL)hasAppletIdentifier;
- (BOOL)hasErrorData;
- (BOOL)hasTransactionKeyIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)appletIdentifier;
- (NSData)errorData;
- (NSMutableArray)transactionKeyCertChains;
- (NSString)transactionKeyIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)transactionKeyCertChainAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)transactionKeyCertChainsCount;
- (void)addTransactionKeyCertChain:(id)a3;
- (void)clearTransactionKeyCertChains;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppletIdentifier:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setTransactionKeyCertChains:(id)a3;
- (void)setTransactionKeyIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoGenerateTransactionKeyWithParametersResponse

- (BOOL)hasTransactionKeyIdentifier
{
  return self->_transactionKeyIdentifier != 0;
}

- (void)clearTransactionKeyCertChains
{
}

- (void)addTransactionKeyCertChain:(id)a3
{
  id v4 = a3;
  transactionKeyCertChains = self->_transactionKeyCertChains;
  id v8 = v4;
  if (!transactionKeyCertChains)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_transactionKeyCertChains;
    self->_transactionKeyCertChains = v6;

    id v4 = v8;
    transactionKeyCertChains = self->_transactionKeyCertChains;
  }
  [(NSMutableArray *)transactionKeyCertChains addObject:v4];
}

- (unint64_t)transactionKeyCertChainsCount
{
  return [(NSMutableArray *)self->_transactionKeyCertChains count];
}

- (id)transactionKeyCertChainAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_transactionKeyCertChains objectAtIndex:a3];
}

+ (Class)transactionKeyCertChainType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAppletIdentifier
{
  return self->_appletIdentifier != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoGenerateTransactionKeyWithParametersResponse;
  id v4 = [(NPKProtoGenerateTransactionKeyWithParametersResponse *)&v8 description];
  v5 = [(NPKProtoGenerateTransactionKeyWithParametersResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  transactionKeyIdentifier = self->_transactionKeyIdentifier;
  if (transactionKeyIdentifier) {
    [v3 setObject:transactionKeyIdentifier forKey:@"transactionKeyIdentifier"];
  }
  transactionKeyCertChains = self->_transactionKeyCertChains;
  if (transactionKeyCertChains) {
    [v4 setObject:transactionKeyCertChains forKey:@"transactionKeyCertChain"];
  }
  appletIdentifier = self->_appletIdentifier;
  if (appletIdentifier) {
    [v4 setObject:appletIdentifier forKey:@"appletIdentifier"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoGenerateTransactionKeyWithParametersResponseReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_transactionKeyIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_transactionKeyCertChains;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_appletIdentifier) {
    PBDataWriterWriteDataField();
  }
  if (self->_errorData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_transactionKeyIdentifier) {
    objc_msgSend(v9, "setTransactionKeyIdentifier:");
  }
  if ([(NPKProtoGenerateTransactionKeyWithParametersResponse *)self transactionKeyCertChainsCount])
  {
    [v9 clearTransactionKeyCertChains];
    unint64_t v4 = [(NPKProtoGenerateTransactionKeyWithParametersResponse *)self transactionKeyCertChainsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoGenerateTransactionKeyWithParametersResponse *)self transactionKeyCertChainAtIndex:i];
        [v9 addTransactionKeyCertChain:v7];
      }
    }
  }
  if (self->_appletIdentifier) {
    objc_msgSend(v9, "setAppletIdentifier:");
  }
  uint64_t v8 = v9;
  if (self->_errorData)
  {
    objc_msgSend(v9, "setErrorData:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_transactionKeyIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_transactionKeyCertChains;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (void)v19);
        [v5 addTransactionKeyCertChain:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSData *)self->_appletIdentifier copyWithZone:a3];
  uint64_t v15 = (void *)v5[1];
  v5[1] = v14;

  uint64_t v16 = [(NSData *)self->_errorData copyWithZone:a3];
  v17 = (void *)v5[2];
  v5[2] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((transactionKeyIdentifier = self->_transactionKeyIdentifier,
         !((unint64_t)transactionKeyIdentifier | v4[4]))
     || -[NSString isEqual:](transactionKeyIdentifier, "isEqual:"))
    && ((transactionKeyCertChains = self->_transactionKeyCertChains,
         !((unint64_t)transactionKeyCertChains | v4[3]))
     || -[NSMutableArray isEqual:](transactionKeyCertChains, "isEqual:"))
    && ((appletIdentifier = self->_appletIdentifier, !((unint64_t)appletIdentifier | v4[1]))
     || -[NSData isEqual:](appletIdentifier, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[2]) {
      char v9 = -[NSData isEqual:](errorData, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_transactionKeyIdentifier hash];
  uint64_t v4 = [(NSMutableArray *)self->_transactionKeyCertChains hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_appletIdentifier hash];
  return v4 ^ v5 ^ [(NSData *)self->_errorData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[NPKProtoGenerateTransactionKeyWithParametersResponse setTransactionKeyIdentifier:](self, "setTransactionKeyIdentifier:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
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
        -[NPKProtoGenerateTransactionKeyWithParametersResponse addTransactionKeyCertChain:](self, "addTransactionKeyCertChain:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 1)) {
    -[NPKProtoGenerateTransactionKeyWithParametersResponse setAppletIdentifier:](self, "setAppletIdentifier:");
  }
  if (*((void *)v4 + 2)) {
    -[NPKProtoGenerateTransactionKeyWithParametersResponse setErrorData:](self, "setErrorData:");
  }
}

- (NSString)transactionKeyIdentifier
{
  return self->_transactionKeyIdentifier;
}

- (void)setTransactionKeyIdentifier:(id)a3
{
}

- (NSMutableArray)transactionKeyCertChains
{
  return self->_transactionKeyCertChains;
}

- (void)setTransactionKeyCertChains:(id)a3
{
}

- (NSData)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)setAppletIdentifier:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionKeyCertChains, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end