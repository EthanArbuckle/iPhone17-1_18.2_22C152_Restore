@interface ICDelegationPlayInfoRequest
- (NSArray)tokenRequests;
- (NSData)playerAnisetteMID;
- (NSMutableDictionary)propertyListRepresentation;
- (NSString)playerDeviceGUID;
- (NSString)playerUserAgent;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPlayerAnisetteMID:(id)a3;
- (void)setPlayerDeviceGUID:(id)a3;
- (void)setPlayerUserAgent:(id)a3;
- (void)setTokenRequests:(id)a3;
@end

@implementation ICDelegationPlayInfoRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerUserAgent, 0);
  objc_storeStrong((id *)&self->_playerAnisetteMID, 0);
  objc_storeStrong((id *)&self->_tokenRequests, 0);

  objc_storeStrong((id *)&self->_playerDeviceGUID, 0);
}

- (void)setTokenRequests:(id)a3
{
}

- (void)setPlayerUserAgent:(id)a3
{
}

- (void)setPlayerDeviceGUID:(id)a3
{
}

- (void)setPlayerAnisetteMID:(id)a3
{
}

- (NSData)playerAnisetteMID
{
  return self->_playerAnisetteMID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSData *)self->_playerAnisetteMID copyWithZone:a3];
    v7 = (void *)v5[3];
    v5[3] = v6;

    uint64_t v8 = [(NSString *)self->_playerDeviceGUID copyWithZone:a3];
    v9 = (void *)v5[1];
    v5[1] = v8;

    uint64_t v10 = [(NSString *)self->_playerUserAgent copyWithZone:a3];
    v11 = (void *)v5[4];
    v5[4] = v10;

    uint64_t v12 = [(NSArray *)self->_tokenRequests copyWithZone:a3];
    v13 = (void *)v5[2];
    v5[2] = v12;
  }
  return v5;
}

- (NSMutableDictionary)propertyListRepresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSData *)self->_playerAnisetteMID length])
  {
    v4 = [(NSData *)self->_playerAnisetteMID base64EncodedStringWithOptions:0];
    [v3 setObject:v4 forKey:@"player-mid"];
  }
  if ([(NSString *)self->_playerDeviceGUID length]) {
    [v3 setObject:self->_playerDeviceGUID forKey:@"player-guid"];
  }
  if ([(NSString *)self->_playerUserAgent length]) {
    [v3 setObject:self->_playerUserAgent forKey:@"player-user-agent"];
  }
  if (self->_tokenRequests)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_tokenRequests, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = self->_tokenRequests;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "propertyListRepresentation", (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"enqueuers"];
  }

  return (NSMutableDictionary *)v3;
}

- (NSString)playerUserAgent
{
  if (self->_playerUserAgent) {
    return self->_playerUserAgent;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSArray)tokenRequests
{
  if (self->_tokenRequests) {
    return self->_tokenRequests;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (NSString)playerDeviceGUID
{
  if (self->_playerDeviceGUID) {
    return self->_playerDeviceGUID;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

@end