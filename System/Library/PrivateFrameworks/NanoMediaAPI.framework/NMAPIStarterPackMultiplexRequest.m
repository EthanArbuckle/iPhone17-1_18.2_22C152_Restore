@interface NMAPIStarterPackMultiplexRequest
- (BOOL)isUnderageUser;
- (Class)responseParserClass;
- (NMAPIStarterPackMultiplexRequest)initWithUnderageUser:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4;
- (void)setUnderageUser:(BOOL)a3;
@end

@implementation NMAPIStarterPackMultiplexRequest

- (NMAPIStarterPackMultiplexRequest)initWithUnderageUser:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NMAPIStarterPackMultiplexRequest;
  v4 = [(MPStoreModelRequest *)&v7 init];
  if (v4)
  {
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"Multiplex Identifier For Underage User: (%d)", v3);
    [(NMAPIStarterPackMultiplexRequest *)v4 setLabel:v5];

    [(NMAPIStarterPackMultiplexRequest *)v4 setUnderageUser:v3];
  }
  return v4;
}

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  v20[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = MusicURLPathStorefrontWithURLBag(v6);
  if (v7)
  {
    v8 = [v6 dictionaryForBagKey:*MEMORY[0x263F89058]];
    if (self->_underageUser) {
      v9 = MediaAPIStarterPackUnder13MultiplexBagKey;
    }
    else {
      v9 = MediaAPIStarterPackOver13MultiplexBagKey;
    }
    v10 = *v9;
    v11 = [v8 objectForKey:v10];
    if (v11)
    {
      v19.receiver = self;
      v19.super_class = (Class)NMAPIStarterPackMultiplexRequest;
      v12 = [(NMAPIRequest *)&v19 urlComponentsWithStoreURLBag:v6 error:a4];
      v13 = NSString;
      v20[0] = @"/v1/editorial";
      v20[1] = v7;
      v20[2] = @"multiplex";
      v20[3] = v11;
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];
      v15 = [v13 pathWithComponents:v14];
      [v12 setPath:v15];
    }
    else
    {
      v17 = NMLogForCategory(9);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[NMAPIStarterPackMultiplexRequest urlComponentsWithStoreURLBag:error:]((uint64_t)v10, v17);
      }

      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7201 userInfo:0];
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
    }
  }
  else
  {
    v16 = NMLogForCategory(9);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[NMAPIRadioRequest urlComponentsWithStoreURLBag:error:](v16);
    }

    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7201 userInfo:0];
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NMAPIStarterPackMultiplexRequest;
  id result = [(NMAPIRequest *)&v5 copyWithZone:a3];
  if (result) {
    *((unsigned char *)result + 128) = self->_underageUser;
  }
  return result;
}

- (BOOL)isUnderageUser
{
  return self->_underageUser;
}

- (void)setUnderageUser:(BOOL)a3
{
  self->_underageUser = a3;
}

- (void)urlComponentsWithStoreURLBag:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2269EF000, a2, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Missing musicStarterPack bag key: %@", (uint8_t *)&v2, 0xCu);
}

@end