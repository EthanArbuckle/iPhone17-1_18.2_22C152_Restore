@interface NPKProtoStandaloneInitializationResponse
- (BOOL)hasClientInfoHTTPHeader;
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandaloneError)error;
- (NPKProtoStandaloneResponseHeader)responseHeader;
- (NSString)clientInfoHTTPHeader;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)supportedServerVersionsAsString:(int)a3;
- (int)StringAsSupportedServerVersions:(id)a3;
- (int)supportedServerVersions;
- (int)supportedServerVersionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)supportedServerVersionsCount;
- (void)addSupportedServerVersions:(int)a3;
- (void)clearSupportedServerVersions;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClientInfoHTTPHeader:(id)a3;
- (void)setError:(id)a3;
- (void)setResponseHeader:(id)a3;
- (void)setSupportedServerVersions:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandaloneInitializationResponse

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NPKProtoStandaloneInitializationResponse;
  [(NPKProtoStandaloneInitializationResponse *)&v3 dealloc];
}

- (unint64_t)supportedServerVersionsCount
{
  return self->_supportedServerVersions.count;
}

- (int)supportedServerVersions
{
  return self->_supportedServerVersions.list;
}

- (void)clearSupportedServerVersions
{
}

- (void)addSupportedServerVersions:(int)a3
{
}

- (int)supportedServerVersionsAtIndex:(unint64_t)a3
{
  p_supportedServerVersions = &self->_supportedServerVersions;
  unint64_t count = self->_supportedServerVersions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_supportedServerVersions->list[a3];
}

- (void)setSupportedServerVersions:(int *)a3 count:(unint64_t)a4
{
}

- (id)supportedServerVersionsAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"Version1";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsSupportedServerVersions:(id)a3
{
  return 1;
}

- (BOOL)hasClientInfoHTTPHeader
{
  return self->_clientInfoHTTPHeader != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandaloneInitializationResponse;
  v4 = [(NPKProtoStandaloneInitializationResponse *)&v8 description];
  v5 = [(NPKProtoStandaloneInitializationResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  responseHeader = self->_responseHeader;
  if (responseHeader)
  {
    v5 = [(NPKProtoStandaloneResponseHeader *)responseHeader dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"responseHeader"];
  }
  p_supportedServerVersions = &self->_supportedServerVersions;
  if (self->_supportedServerVersions.count)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
    if (self->_supportedServerVersions.count)
    {
      unint64_t v8 = 0;
      do
      {
        v9 = @"Version1";
        if (p_supportedServerVersions->list[v8] != 1)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_supportedServerVersions->list[v8]);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v7 addObject:v9];

        ++v8;
      }
      while (v8 < self->_supportedServerVersions.count);
    }
    [v3 setObject:v7 forKey:@"supportedServerVersions"];
  }
  clientInfoHTTPHeader = self->_clientInfoHTTPHeader;
  if (clientInfoHTTPHeader) {
    [v3 setObject:clientInfoHTTPHeader forKey:@"clientInfoHTTPHeader"];
  }
  error = self->_error;
  if (error)
  {
    v12 = [(NPKProtoStandaloneError *)error dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"error"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneInitializationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_responseHeader) {
    -[NPKProtoStandaloneInitializationResponse writeTo:]();
  }
  id v7 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_supportedServerVersions.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_supportedServerVersions.count);
  }
  if (self->_clientInfoHTTPHeader) {
    PBDataWriterWriteStringField();
  }
  v6 = v7;
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    v6 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setResponseHeader:self->_responseHeader];
  if ([(NPKProtoStandaloneInitializationResponse *)self supportedServerVersionsCount])
  {
    [v8 clearSupportedServerVersions];
    unint64_t v4 = [(NPKProtoStandaloneInitializationResponse *)self supportedServerVersionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addSupportedServerVersions:", -[NPKProtoStandaloneInitializationResponse supportedServerVersionsAtIndex:](self, "supportedServerVersionsAtIndex:", i));
    }
  }
  if (self->_clientInfoHTTPHeader) {
    objc_msgSend(v8, "setClientInfoHTTPHeader:");
  }
  id v7 = v8;
  if (self->_error)
  {
    objc_msgSend(v8, "setError:");
    id v7 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandaloneResponseHeader *)self->_responseHeader copyWithZone:a3];
  id v7 = (void *)v5[6];
  v5[6] = v6;

  PBRepeatedInt32Copy();
  uint64_t v8 = [(NSString *)self->_clientInfoHTTPHeader copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NPKProtoStandaloneError *)self->_error copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((responseHeader = self->_responseHeader, !((unint64_t)responseHeader | v4[6]))
     || -[NPKProtoStandaloneResponseHeader isEqual:](responseHeader, "isEqual:"))
    && PBRepeatedInt32IsEqual()
    && ((clientInfoHTTPHeader = self->_clientInfoHTTPHeader, !((unint64_t)clientInfoHTTPHeader | v4[4]))
     || -[NSString isEqual:](clientInfoHTTPHeader, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[5]) {
      char v8 = -[NPKProtoStandaloneError isEqual:](error, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPKProtoStandaloneResponseHeader *)self->_responseHeader hash];
  uint64_t v4 = PBRepeatedInt32Hash() ^ v3;
  NSUInteger v5 = [(NSString *)self->_clientInfoHTTPHeader hash];
  return v4 ^ v5 ^ [(NPKProtoStandaloneError *)self->_error hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  responseHeader = self->_responseHeader;
  uint64_t v6 = v4[6];
  v13 = v4;
  if (responseHeader)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandaloneResponseHeader mergeFrom:](responseHeader, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandaloneInitializationResponse setResponseHeader:](self, "setResponseHeader:");
  }
  uint64_t v4 = v13;
LABEL_7:
  uint64_t v7 = [v4 supportedServerVersionsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[NPKProtoStandaloneInitializationResponse addSupportedServerVersions:](self, "addSupportedServerVersions:", [v13 supportedServerVersionsAtIndex:i]);
  }
  id v10 = v13;
  if (v13[4])
  {
    -[NPKProtoStandaloneInitializationResponse setClientInfoHTTPHeader:](self, "setClientInfoHTTPHeader:");
    id v10 = v13;
  }
  error = self->_error;
  uint64_t v12 = v10[5];
  if (error)
  {
    if (!v12) {
      goto LABEL_18;
    }
    -[NPKProtoStandaloneError mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_18;
    }
    -[NPKProtoStandaloneInitializationResponse setError:](self, "setError:");
  }
  id v10 = v13;
LABEL_18:
}

- (NPKProtoStandaloneResponseHeader)responseHeader
{
  return self->_responseHeader;
}

- (void)setResponseHeader:(id)a3
{
}

- (NSString)clientInfoHTTPHeader
{
  return self->_clientInfoHTTPHeader;
}

- (void)setClientInfoHTTPHeader:(id)a3
{
}

- (NPKProtoStandaloneError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHeader, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clientInfoHTTPHeader, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandaloneInitializationResponse writeTo:]", "NPKProtoStandaloneInitializationResponse.m", 202, "self->_responseHeader != nil");
}

@end