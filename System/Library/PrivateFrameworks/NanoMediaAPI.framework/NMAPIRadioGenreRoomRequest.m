@interface NMAPIRadioGenreRoomRequest
- (Class)responseParserClass;
- (NMAPIRadioGenreRoomRequest)initWithURL:(id)a3;
- (NSURL)URL;
- (id)_bagRoomURLRegularExpressionWithStoreURLBag:(id)a3;
- (id)_roomIdentifierWithStoreURLBag:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4;
- (void)setURL:(id)a3;
@end

@implementation NMAPIRadioGenreRoomRequest

- (NMAPIRadioGenreRoomRequest)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMAPIRadioGenreRoomRequest;
  v5 = [(MPStoreModelRequest *)&v8 init];
  if (v5)
  {
    v6 = [NSString stringWithFormat:@"Radio Genre Room URL : %@", v4];
    [(NMAPIRadioGenreRoomRequest *)v5 setLabel:v6];

    [(NMAPIRadioGenreRoomRequest *)v5 setURL:v4];
  }

  return v5;
}

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  v24[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NMAPIRadioGenreRoomRequest;
  v7 = [(NMAPIRequest *)&v22 urlComponentsWithStoreURLBag:v6 error:a4];
  objc_super v8 = MusicURLPathStorefrontWithURLBag(v6);
  if (v8)
  {
    uint64_t v9 = [(NMAPIRadioGenreRoomRequest *)self _roomIdentifierWithStoreURLBag:v6];
    v10 = (void *)v9;
    if (v9)
    {
      v11 = NSString;
      v24[0] = @"/v1/editorial";
      v24[1] = v8;
      v24[2] = @"rooms";
      v24[3] = v9;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
      v13 = [v11 pathWithComponents:v12];
      [v7 setPath:v13];

      v14 = [v7 queryItems];
      v15 = [MEMORY[0x263F08BD0] queryItemWithName:@"art[url]" value:@"f,c"];
      v23 = v15;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
      v17 = [v14 arrayByAddingObjectsFromArray:v16];
      [v7 setQueryItems:v17];

      id v18 = v7;
    }
    else
    {
      v20 = NMLogForCategory(9);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[NMAPIRadioGenreRoomRequest urlComponentsWithStoreURLBag:error:](v20);
      }

      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7201 userInfo:0];
        id v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v18 = 0;
      }
    }
  }
  else
  {
    v19 = NMLogForCategory(9);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NMAPIRadioRequest urlComponentsWithStoreURLBag:error:](v19);
    }

    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7201 userInfo:0];
      id v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v18 = 0;
    }
  }

  return v18;
}

- (id)_roomIdentifierWithStoreURLBag:(id)a3
{
  id v4 = a3;
  v5 = [(NMAPIRadioGenreRoomRequest *)self URL];
  id v6 = [v5 absoluteString];

  v7 = [(NMAPIRadioGenreRoomRequest *)self _bagRoomURLRegularExpressionWithStoreURLBag:v4];

  objc_super v8 = objc_msgSend(v7, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  uint64_t v9 = [v8 firstObject];
  v10 = v9;
  if (!v9)
  {
    v14 = NMLogForCategory(9);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[NMAPIRadioGenreRoomRequest _roomIdentifierWithStoreURLBag:]((uint64_t)v6, v14);
    }
    goto LABEL_8;
  }
  uint64_t v11 = [v9 rangeWithName:@"identifier"];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend(v6, "substringWithRange:", v11, v12), (v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v14 = NMLogForCategory(9);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[NMAPIRadioGenreRoomRequest _roomIdentifierWithStoreURLBag:]((uint64_t)v10, v14);
    }
LABEL_8:

    v13 = 0;
  }

  return v13;
}

- (id)_bagRoomURLRegularExpressionWithStoreURLBag:(id)a3
{
  v3 = [a3 dictionaryForBagKey:*MEMORY[0x263F89058]];
  if (_NSIsNSDictionary())
  {
    id v4 = [v3 objectForKey:@"viewRoomUrlRegex"];
    if (_NSIsNSString())
    {
      id v9 = 0;
      v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v4 options:0 error:&v9];
      id v6 = v9;
      if (v6)
      {
        v7 = NMLogForCategory(9);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          [(NMAPIRadioGenreRoomRequest *)(uint64_t)v4 _bagRoomURLRegularExpressionWithStoreURLBag:v7];
        }
      }
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NMAPIRadioGenreRoomRequest;
  id v4 = [(NMAPIRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 16, self->_URL);
  }
  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)urlComponentsWithStoreURLBag:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2269EF000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Missing room identifier.", v1, 2u);
}

- (void)_roomIdentifierWithStoreURLBag:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2269EF000, a2, OS_LOG_TYPE_ERROR, "[NMAPIRequest] No match found, URL is not supported: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_roomIdentifierWithStoreURLBag:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2269EF000, a2, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Match didn't capture an identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_bagRoomURLRegularExpressionWithStoreURLBag:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2269EF000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Regex cannot be generated from pattern: %{public}@ with error %{public}@", (uint8_t *)&v3, 0x16u);
}

@end