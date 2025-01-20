@interface NMAPIModelObjectRequest
- (Class)responseParserClass;
- (MPModelObject)modelObject;
- (NMAPIModelObjectRequest)initWithModelObject:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4;
- (void)setModelObject:(id)a3;
@end

@implementation NMAPIModelObjectRequest

- (NMAPIModelObjectRequest)initWithModelObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMAPIModelObjectRequest;
  v5 = [(MPStoreModelRequest *)&v8 init];
  if (v5)
  {
    v6 = [NSString stringWithFormat:@"Model Object: %@", v5->_modelObject];
    [(NMAPIModelObjectRequest *)v5 setLabel:v6];

    [(NMAPIModelObjectRequest *)v5 setModelObject:v4];
  }

  return v5;
}

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  v41[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = v6;
  if (self->_modelObject)
  {
    objc_super v8 = MusicURLPathStorefrontWithURLBag(v6);
    if (!v8)
    {
      v15 = NMLogForCategory(9);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[NMAPIModelObjectRequest urlComponentsWithStoreURLBag:error:]();
      }

      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7201 userInfo:0];
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      goto LABEL_38;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [(MPModelObject *)self->_modelObject identifiers];
      v10 = [v9 universalStore];
      v11 = [v10 globalPlaylistID];

      v12 = MediaAPIPlaylistsPathString;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v27 = NSNumber;
          v28 = [(MPModelObject *)self->_modelObject identifiers];
          v29 = [v28 universalStore];
          v30 = objc_msgSend(v27, "numberWithLongLong:", objc_msgSend(v29, "adamID"));
          v11 = [v30 stringValue];

          v20 = @"artists";
          v31 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"includeOnly" value:@"default-playable-content"];
          v41[0] = v31;
          id v32 = objc_alloc(MEMORY[0x263F08BD0]);
          v33 = [&unk_26DA89720 componentsJoinedByString:@","];
          v34 = (void *)[v32 initWithName:@"views" value:v33];
          v41[1] = v34;
          v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];

          if (v11) {
            goto LABEL_16;
          }
        }
        else
        {
          v21 = 0;
          v20 = 0;
        }
        goto LABEL_29;
      }
      v16 = NSNumber;
      v17 = [(MPModelObject *)self->_modelObject identifiers];
      v18 = [v17 universalStore];
      v19 = objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v18, "adamID"));
      v11 = [v19 stringValue];

      v12 = MediaAPIAlbumsPathString;
    }
    v20 = *v12;
    v21 = 0;
    if (v11)
    {
LABEL_16:
      if (v20)
      {
        v39.receiver = self;
        v39.super_class = (Class)NMAPIModelObjectRequest;
        v14 = [(NMAPIRequest *)&v39 urlComponentsWithStoreURLBag:v7 error:a4];
        v22 = NSString;
        v40[0] = @"/v1/catalog";
        v40[1] = v8;
        v40[2] = v20;
        v40[3] = v11;
        v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
        v24 = [v22 pathWithComponents:v23];
        [v14 setPath:v24];

        if (v21)
        {
          v25 = [v14 queryItems];
          v26 = [v25 arrayByAddingObjectsFromArray:v21];
          [v14 setQueryItems:v26];
        }
        goto LABEL_37;
      }
      v35 = NMLogForCategory(9);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[NMAPIModelObjectRequest urlComponentsWithStoreURLBag:error:].cold.4();
      }

      if (a4)
      {
        id v36 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7101 userInfo:0];
        v20 = 0;
LABEL_33:
        v14 = 0;
        *a4 = v36;
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      v20 = 0;
      goto LABEL_36;
    }
LABEL_29:
    v37 = NMLogForCategory(9);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[NMAPIModelObjectRequest urlComponentsWithStoreURLBag:error:]();
    }

    if (a4)
    {
      id v36 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7101 userInfo:0];
      v11 = 0;
      goto LABEL_33;
    }
    v11 = 0;
LABEL_36:
    v14 = 0;
    goto LABEL_37;
  }
  v13 = NMLogForCategory(9);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[NMAPIModelObjectRequest urlComponentsWithStoreURLBag:error:]();
  }

  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7101 userInfo:0];
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_39:

  return v14;
}

- (Class)responseParserClass
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = objc_opt_class();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NMAPIModelObjectRequest;
    v3 = [(NMAPIRequest *)&v5 responseParserClass];
  }

  return (Class)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NMAPIModelObjectRequest;
  id v4 = [(NMAPIRequest *)&v7 copyWithZone:a3];
  objc_super v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 16, self->_modelObject);
  }
  return v5;
}

- (MPModelObject)modelObject
{
  return self->_modelObject;
}

- (void)setModelObject:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)urlComponentsWithStoreURLBag:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2269EF000, v0, v1, "[NMAPIRequest] Missing modelObject parameter.", v2, v3, v4, v5, v6);
}

- (void)urlComponentsWithStoreURLBag:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2269EF000, v0, v1, "[NMAPIRequest] Missing musicURLPath.", v2, v3, v4, v5, v6);
}

- (void)urlComponentsWithStoreURLBag:error:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2269EF000, v0, v1, "[NMAPIRequest] Missing identifier.", v2, v3, v4, v5, v6);
}

- (void)urlComponentsWithStoreURLBag:error:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2269EF000, v0, v1, "[NMAPIRequest] Missing resourceType.", v2, v3, v4, v5, v6);
}

@end