@interface NMAPISearchRequest
- (Class)responseParserClass;
- (NMAPISearchRequest)initWithSearchString:(id)a3;
- (NSString)searchString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4;
- (unint64_t)resultsPerSection;
- (void)setResultsPerSection:(unint64_t)a3;
- (void)setSearchString:(id)a3;
@end

@implementation NMAPISearchRequest

- (NMAPISearchRequest)initWithSearchString:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMAPISearchRequest;
  v5 = [(MPStoreModelRequest *)&v8 init];
  if (v5)
  {
    v6 = [NSString stringWithFormat:@"Catalog Search (%@)", v4];
    [(NMAPISearchRequest *)v5 setLabel:v6];

    [(NMAPISearchRequest *)v5 setSearchString:v4];
  }

  return v5;
}

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  v36[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = v6;
  if (self->_searchString)
  {
    objc_super v8 = MusicURLPathStorefrontWithURLBag(v6);
    if (v8)
    {
      v34.receiver = self;
      v34.super_class = (Class)NMAPISearchRequest;
      v33 = v7;
      v9 = [(NMAPIRequest *)&v34 urlComponentsWithStoreURLBag:v7 error:a4];
      if (self->_resultsPerSection)
      {
        v10 = (void *)MEMORY[0x263F08BD0];
        v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        v12 = [v11 stringValue];
        v13 = [v10 queryItemWithName:@"limit" value:v12];

        v14 = [v9 queryItems];
        v15 = [v14 arrayByAddingObject:v13];
        [v9 setQueryItems:v15];
      }
      v16 = NSString;
      v36[0] = @"/v1/catalog";
      v36[1] = v8;
      v36[2] = @"search";
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];
      v18 = [v16 pathWithComponents:v17];
      [v9 setPath:v18];

      v19 = [v9 queryItems];
      v20 = [MEMORY[0x263F08BD0] queryItemWithName:@"term" value:self->_searchString];
      v35[0] = v20;
      v21 = (void *)MEMORY[0x263F08BD0];
      v22 = v8;
      v23 = [&unk_26DA89738 componentsJoinedByString:@","];
      v24 = [v21 queryItemWithName:@"types" value:v23];
      v35[1] = v24;
      v25 = (void *)MEMORY[0x263F08BD0];
      v26 = [&unk_26DA89750 componentsJoinedByString:@","];
      v27 = [v25 queryItemWithName:@"with" value:v26];
      v35[2] = v27;
      v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
      v29 = [v19 arrayByAddingObjectsFromArray:v28];
      [v9 setQueryItems:v29];

      objc_super v8 = v22;
      v7 = v33;
    }
    else
    {
      v31 = NMLogForCategory(9);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[NMAPIRadioRequest urlComponentsWithStoreURLBag:error:](v31);
      }

      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7201 userInfo:0];
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
    }
  }
  else
  {
    v30 = NMLogForCategory(9);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[NMAPISearchRequest urlComponentsWithStoreURLBag:error:](v30);
    }

    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7101 userInfo:0];
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NMAPISearchRequest;
  id v4 = [(NMAPIRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 16, self->_searchString);
    v5[17] = self->_resultsPerSection;
  }
  return v5;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (unint64_t)resultsPerSection
{
  return self->_resultsPerSection;
}

- (void)setResultsPerSection:(unint64_t)a3
{
  self->_resultsPerSection = a3;
}

- (void).cxx_destruct
{
}

- (void)urlComponentsWithStoreURLBag:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2269EF000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Missing searchString parameter.", v1, 2u);
}

@end