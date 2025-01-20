@interface WFCloudKitWebServiceRequest
- (CKContainer)container;
- (CKDatabase)database;
- (WFCloudKitWebServiceRequest)initWithContainer:(id)a3 database:(id)a4;
- (id)cloudKitAPIToken;
- (id)cloudKitEnvironment;
- (id)databaseName;
- (id)extractRecordDictFromRecordIfNecessary:(id)a3 recordType:(id)a4;
- (id)fetchProxiedRecordWithIdentifier:(id)a3 possibleItemTypes:(id)a4 completionHandler:(id)a5;
- (id)fetchRecordsWithItemType:(Class)a3 filter:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6;
- (id)getJSONFromURL:(id)a3 completionHandler:(id)a4;
- (id)getJSONFromURL:(id)a3 headers:(id)a4 completionHandler:(id)a5;
- (id)pathComponentsForType:(unint64_t)a3 parameters:(id)a4;
- (id)postJSON:(id)a3 toURL:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6;
- (id)queryWithItemType:(Class)a3 filter:(id)a4;
- (id)recordsFromQueryResponse:(id)a3;
- (id)urlForType:(unint64_t)a3 parameters:(id)a4;
- (unint64_t)webServiceForRequestType:(unint64_t)a3;
- (void)parseRecord:(id)a3 intoItem:(id)a4 allKeys:(BOOL)a5;
@end

@implementation WFCloudKitWebServiceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (CKDatabase)database
{
  return self->_database;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)parseRecord:(id)a3 intoItem:(id)a4 allKeys:(BOOL)a5
{
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F28F08];
  id v9 = a3;
  v10 = [v8 currentQueue];
  v11 = [(id)objc_opt_class() recordType];
  v12 = [(WFCloudKitWebServiceRequest *)self extractRecordDictFromRecordIfNecessary:v9 recordType:v11];

  v13 = [v12 objectForKeyedSubscript:@"fields"];
  uint64_t v14 = objc_opt_class();
  v15 = WFEnforceClass(v13, v14);

  if (v15)
  {
    id v16 = v7;
    v17 = [(id)objc_opt_class() properties];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __60__WFCloudKitWebServiceRequest_parseRecord_intoItem_allKeys___block_invoke;
    v52[3] = &unk_1E65543D0;
    id v18 = v17;
    id v53 = v18;
    id v19 = v16;
    id v54 = v19;
    id v55 = v10;
    id v56 = v19;
    [v15 enumerateKeysAndObjectsUsingBlock:v52];
    v20 = [v12 objectForKeyedSubscript:@"recordName"];
    uint64_t v21 = objc_opt_class();
    v22 = WFEnforceClass(v20, v21);

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v22];
    [v19 willChangeValueForKey:@"identifier"];
    v51 = (void *)v23;
    [v19 setValue:v23 forKey:@"identifier"];
    [v19 didChangeValueForKey:@"identifier"];
    if (objc_opt_respondsToSelector())
    {
      v46 = v22;
      id v47 = v18;
      v49 = v10;
      v24 = [v12 objectForKeyedSubscript:@"created"];
      uint64_t v25 = objc_opt_class();
      v26 = WFEnforceClass(v24, v25);

      v27 = [v12 objectForKeyedSubscript:@"modified"];
      uint64_t v28 = objc_opt_class();
      v50 = WFEnforceClass(v27, v28);

      v29 = v26;
      v30 = [v26 objectForKeyedSubscript:@"timestamp"];
      uint64_t v31 = objc_opt_class();
      v32 = WFEnforceClass(v30, v31);

      v48 = v11;
      v45 = v32;
      if (v32)
      {
        v33 = (void *)MEMORY[0x1E4F1C9C8];
        [v32 doubleValue];
        v35 = [v33 dateWithTimeIntervalSince1970:v34 / 1000.0];
      }
      else
      {
        v35 = 0;
      }
      v36 = [v50 objectForKeyedSubscript:@"timestamp"];
      uint64_t v37 = objc_opt_class();
      v38 = WFEnforceClass(v36, v37);

      if (v38)
      {
        v39 = (void *)MEMORY[0x1E4F1C9C8];
        [v38 doubleValue];
        v41 = [v39 dateWithTimeIntervalSince1970:v40 / 1000.0];
      }
      else
      {
        v41 = 0;
      }
      v42 = [v29 objectForKeyedSubscript:@"userRecordName"];
      uint64_t v43 = objc_opt_class();
      v44 = WFEnforceClass(v42, v43);

      [v19 setCreatedAt:v35 modifiedAt:v41 createdBy:v44];
      v11 = v48;
      v10 = v49;
      v22 = v46;
      id v18 = v47;
    }
  }
}

void __60__WFCloudKitWebServiceRequest_parseRecord_intoItem_allKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v23 = a3;
  v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v5)
  {
    v6 = [v23 objectForKeyedSubscript:@"value"];
    id v7 = [v23 objectForKeyedSubscript:@"type"];
    if ([v7 isEqualToString:@"ASSETID"]
      && ([v5 isIgnoredByDefault] & 1) == 0)
    {
      uint64_t v14 = [v6 objectForKeyedSubscript:@"downloadURL"];
      uint64_t v15 = objc_opt_class();
      id v16 = WFEnforceClass(v14, v15);

      if (!v16)
      {
LABEL_13:

        goto LABEL_14;
      }
      v17 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
      v13 = [v16 stringByAddingPercentEncodingWithAllowedCharacters:v17];

      id v18 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
      if (v18)
      {
        id v19 = [WFCloudKitWebServiceAssetDownloadOperation alloc];
        uint64_t v20 = *(void *)(a1 + 40);
        uint64_t v21 = [v5 name];
        v22 = [(WFCloudKitWebServiceAssetDownloadOperation *)v19 initWithAssetURL:v18 item:v20 key:v21];

        [*(id *)(a1 + 48) addOperation:v22];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_13;
      }
      if (!v6)
      {
LABEL_14:

        goto LABEL_15;
      }
      v8 = *(void **)(a1 + 56);
      id v9 = [v5 name];
      [v8 willChangeValueForKey:v9];

      v10 = *(void **)(a1 + 56);
      v11 = [v5 name];
      [v10 setValue:v6 forKey:v11];

      v12 = *(void **)(a1 + 56);
      v13 = [v5 name];
      [v12 didChangeValueForKey:v13];
    }

    goto LABEL_13;
  }
LABEL_15:
}

- (id)extractRecordDictFromRecordIfNecessary:(id)a3 recordType:(id)a4
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:a4];
  id v7 = [v6 objectForKeyedSubscript:@"record"];
  uint64_t v8 = objc_opt_class();
  id v9 = WFEnforceClass(v7, v8);

  if (v9) {
    v10 = v9;
  }
  else {
    v10 = v5;
  }
  id v11 = v10;

  return v11;
}

- (id)recordsFromQueryResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = WFEnforceClass(v3, v4);

  if (v5)
  {
    v6 = [v5 objectForKeyedSubscript:@"results"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)urlForType:(unint64_t)a3 parameters:(id)a4
{
  v30[5] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(WFCloudKitWebServiceRequest *)self pathComponentsForType:a3 parameters:a4];
  unint64_t v8 = [(WFCloudKitWebServiceRequest *)self webServiceForRequestType:a3];
  if (v8 == 1)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
    uint64_t v21 = [v20 stringForKey:@"WFWebServiceProxyDevelopmentHostnameKey"];

    uint64_t v14 = [&unk_1F2317AF0 arrayByAddingObjectsFromArray:v7];

    id v18 = 0;
    id v19 = @"https://www.icloud.com";
    goto LABEL_5;
  }
  if (!v8)
  {
    v30[0] = @"database";
    v30[1] = @"1";
    id v9 = [(WFCloudKitWebServiceRequest *)self container];
    v10 = [v9 containerIdentifier];
    v30[2] = v10;
    id v11 = [(WFCloudKitWebServiceRequest *)self cloudKitEnvironment];
    v30[3] = v11;
    v12 = [(WFCloudKitWebServiceRequest *)self databaseName];
    v30[4] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
    uint64_t v14 = [v13 arrayByAddingObjectsFromArray:v7];

    uint64_t v15 = (void *)MEMORY[0x1E4F290C8];
    id v16 = [(WFCloudKitWebServiceRequest *)self cloudKitAPIToken];
    v17 = [v15 queryItemWithName:@"ckAPIToken" value:v16];
    v29 = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];

    id v19 = @"https://api.apple-cloudkit.com";
LABEL_5:
    uint64_t v7 = (void *)v14;
    goto LABEL_7;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2 object:self file:@"WFCloudKitWebServiceRequest.m" lineNumber:388 description:@"baseURL not provided for request type"];

  id v18 = 0;
  id v19 = 0;
LABEL_7:
  id v23 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v19];
  v24 = [v7 componentsJoinedByString:@"/"];
  uint64_t v25 = [@"/" stringByAppendingString:v24];
  [v23 setPath:v25];

  [v23 setQueryItems:v18];
  v26 = [v23 URL];
  if (!v26)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"WFCloudKitWebServiceRequest.m", 394, @"Could not create URL for web service request of type: %lu", a3);
  }
  return v26;
}

- (id)cloudKitAPIToken
{
  v2 = [(WFCloudKitWebServiceRequest *)self container];
  id v3 = [v2 containerIdentifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F5ABD8]];

  if (v4) {
    return @"7488b9154a1a645448ca0b434fe1e0a63f312198ae1edf687920e274850d536c";
  }
  else {
    return @"8ab06078c4a6b3fa9dfb17508d0ca33174297a2382da5b17b272c5546780d68d";
  }
}

- (id)cloudKitEnvironment
{
  v2 = [MEMORY[0x1E4F5A7A0] sharedContext];
  id v3 = [v2 applicationBundle];
  int v4 = objc_msgSend(v3, "wf_entitlements");

  id v5 = [v4 objectForKeyedSubscript:@"com.apple.developer.icloud-container-environment"];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = WFEnforceClass(v5, v6);

  if (v7) {
    unint64_t v8 = (__CFString *)v7;
  }
  else {
    unint64_t v8 = @"development";
  }
  id v9 = [(__CFString *)v8 lowercaseString];

  return v9;
}

- (id)pathComponentsForType:(unint64_t)a3 parameters:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    uint64_t v6 = [a4 objectForKeyedSubscript:@"WFCloudKitURLParameterIdentifier"];
    uint64_t v7 = objc_opt_class();
    unint64_t v8 = WFEnforceClass(v6, v7);

    if (!v8)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"WFCloudKitWebServiceRequest.m", 318, @"Missing %@ for proxied record lookup", @"WFCloudKitURLParameterIdentifier" object file lineNumber description];
    }
    v12[0] = @"records";
    v12[1] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  }
  else
  {
    id v9 = &unk_1F2317AD8;
  }
  return v9;
}

- (unint64_t)webServiceForRequestType:(unint64_t)a3
{
  return a3 != 0;
}

- (id)databaseName
{
  v2 = [(WFCloudKitWebServiceRequest *)self database];
  uint64_t v3 = [v2 databaseScope];

  int v4 = @"public";
  if (v3 == 3) {
    int v4 = @"shared";
  }
  if (v3 == 2) {
    return @"private";
  }
  else {
    return v4;
  }
}

- (id)getJSONFromURL:(id)a3 headers:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  unint64_t v8 = (void *)MEMORY[0x1E4F28E88];
  id v9 = a4;
  v10 = [v8 requestWithURL:a3];
  [v10 setHTTPMethod:@"GET"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__WFCloudKitWebServiceRequest_getJSONFromURL_headers_completionHandler___block_invoke;
  v21[3] = &unk_1E6554C00;
  id v22 = v10;
  id v11 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v21];

  v12 = objc_msgSend(MEMORY[0x1E4F290E0], "wf_sharedSession");
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __72__WFCloudKitWebServiceRequest_getJSONFromURL_headers_completionHandler___block_invoke_2;
  id v19 = &unk_1E65543A0;
  id v20 = v7;
  id v13 = v7;
  uint64_t v14 = [v12 dataTaskWithRequest:v11 completionHandler:&v16];

  objc_msgSend(v14, "resume", v16, v17, v18, v19);
  return v14;
}

uint64_t __72__WFCloudKitWebServiceRequest_getJSONFromURL_headers_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addValue:a3 forHTTPHeaderField:a2];
}

void __72__WFCloudKitWebServiceRequest_getJSONFromURL_headers_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  id v11 = WFEnforceClass(v9, v10);

  if (v7 && !v8 && [v11 statusCode] == 200)
  {
    id v18 = 0;
    v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v18];
    id v8 = v18;
    id v13 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_12:
    v13();

    goto LABEL_13;
  }
  uint64_t v14 = [v8 domain];
  uint64_t v15 = *MEMORY[0x1E4F289A0];
  if ([v14 isEqualToString:*MEMORY[0x1E4F289A0]])
  {
    uint64_t v16 = [v8 code];

    if (v16 == -999)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFCloudKitErrorDomain" code:0 userInfo:0];
      id v13 = *(void (**)(void))(v17 + 16);
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v15, objc_msgSend(v11, "statusCode"), 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_13:
}

- (id)getJSONFromURL:(id)a3 completionHandler:(id)a4
{
  return [(WFCloudKitWebServiceRequest *)self getJSONFromURL:a3 headers:0 completionHandler:a4];
}

- (id)postJSON:(id)a3 toURL:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void, id))a6;
  id v23 = 0;
  v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:0 error:&v23];
  id v13 = v23;
  if (v13)
  {
    v11[2](v11, 0, v13);
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28E88] requestWithURL:v9];
    [v15 setHTTPMethod:@"POST"];
    [v15 setHTTPBody:v12];
    [v15 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [v15 setValue:v10 forHTTPHeaderField:@"X-Apple-Cache-Key"];
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F290E0], "wf_sharedSession");
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __73__WFCloudKitWebServiceRequest_postJSON_toURL_cacheKey_completionHandler___block_invoke;
    uint64_t v21 = &unk_1E65543A0;
    id v22 = v11;
    uint64_t v14 = [v16 dataTaskWithRequest:v15 completionHandler:&v18];

    objc_msgSend(v14, "resume", v18, v19, v20, v21);
  }

  return v14;
}

void __73__WFCloudKitWebServiceRequest_postJSON_toURL_cacheKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  id v11 = WFEnforceClass(v9, v10);

  if (v7 && !v8 && [v11 statusCode] == 200)
  {
    id v18 = 0;
    v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v18];
    id v8 = v18;
    id v13 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_12:
    v13();

    goto LABEL_13;
  }
  uint64_t v14 = [v8 domain];
  uint64_t v15 = *MEMORY[0x1E4F289A0];
  if ([v14 isEqualToString:*MEMORY[0x1E4F289A0]])
  {
    uint64_t v16 = [v8 code];

    if (v16 == -999)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFCloudKitErrorDomain" code:0 userInfo:0];
      id v13 = *(void (**)(void))(v17 + 16);
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v15, objc_msgSend(v11, "statusCode"), 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_13:
}

- (id)queryWithItemType:(Class)a3 filter:(id)a4
{
  v12[6] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(objc_class *)a3 recordType];
  id v7 = [NSString stringWithFormat:@"%@.*", v6];
  id v8 = [v5 stringRepresentationWithRecordType:v6];

  v12[0] = @"SELECT";
  v12[1] = v7;
  v12[2] = @"FROM";
  void v12[3] = v6;
  v12[4] = @"WHERE";
  v12[5] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:6];
  uint64_t v10 = [v9 componentsJoinedByString:@" "];

  return v10;
}

- (id)fetchProxiedRecordWithIdentifier:(id)a3 possibleItemTypes:(id)a4 completionHandler:(id)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = objc_opt_new();
  uint64_t v31 = @"WFCloudKitURLParameterIdentifier";
  v32[0] = v11;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  uint64_t v14 = [(WFCloudKitWebServiceRequest *)self urlForType:1 parameters:v13];

  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke;
  uint64_t v25 = &unk_1E6554378;
  id v29 = v10;
  SEL v30 = a2;
  id v26 = v9;
  v27 = self;
  id v15 = v12;
  id v28 = v15;
  id v16 = v9;
  id v17 = v10;
  id v18 = [(WFCloudKitWebServiceRequest *)self getJSONFromURL:v14 headers:0 completionHandler:&v22];
  objc_msgSend(v15, "setDataTask:", v18, v22, v23, v24, v25);

  uint64_t v19 = v28;
  id v20 = v15;

  return v20;
}

void __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v25 = v5;
    id v7 = [v5 objectForKeyedSubscript:@"recordType"];
    uint64_t v8 = objc_opt_class();
    id v9 = WFEnforceClass(v7, v8);

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
LABEL_5:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v32 + 1) + 8 * v14);
        if (([v15 conformsToProtocol:&unk_1F232DED0] & 1) == 0)
        {
          id v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 40) file:@"WFCloudKitWebServiceRequest.m" lineNumber:152 description:@"Found type in possibleItemTypes that doesn't conform to WFCloudKitItem protocol"];
        }
        id v16 = [v15 recordType];
        char v17 = [v16 isEqualToString:v9];

        if (v17) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v12) {
            goto LABEL_5;
          }
          goto LABEL_13;
        }
      }
      id v19 = objc_alloc_init((Class)v15);

      if (!v19) {
        goto LABEL_16;
      }
      id v20 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke_282;
      block[3] = &unk_1E6555DC8;
      id v21 = *(id *)(a1 + 48);
      uint64_t v22 = *(void *)(a1 + 40);
      id v27 = v21;
      uint64_t v28 = v22;
      uint64_t v6 = v25;
      id v29 = v25;
      id v30 = v19;
      id v31 = *(id *)(a1 + 56);
      id v23 = v19;
      dispatch_async(v20, block);
    }
    else
    {
LABEL_13:

LABEL_16:
      v24 = getWFCloudKitWSLogObject();
      uint64_t v6 = v25;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v37 = "-[WFCloudKitWebServiceRequest fetchProxiedRecordWithIdentifier:possibleItemTypes:completionHandler:]_block_invoke";
        __int16 v38 = 2112;
        v39 = v25;
        _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_ERROR, "%s Unable to find matching record type. Received response: %@", buf, 0x16u);
      }

      id v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFCloudKitErrorDomain" code:1 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke_282(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) operationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke_2;
  v8[3] = &unk_1E65556E0;
  uint64_t v3 = *(void **)(a1 + 48);
  v8[4] = *(void *)(a1 + 40);
  id v9 = v3;
  id v10 = *(id *)(a1 + 56);
  [v2 addOperationWithBlock:v8];

  int v4 = [*(id *)(a1 + 32) operationQueue];
  [v4 waitUntilAllOperationsAreFinished];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke_3;
  block[3] = &unk_1E65572A0;
  id v7 = *(id *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) parseRecord:*(void *)(a1 + 40) intoItem:*(void *)(a1 + 48) allKeys:1];
}

uint64_t __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)fetchRecordsWithItemType:(Class)a3 filter:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  if (([(objc_class *)a3 conformsToProtocol:&unk_1F232DED0] & 1) == 0)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"WFCloudKitWebServiceRequest.m" lineNumber:82 description:@"itemType passed to WFCloudKitServiceRequest must conform to WFCloudKitItem protocol"];
  }
  uint64_t v14 = objc_opt_new();
  id v15 = [(WFCloudKitWebServiceRequest *)self urlForType:0 parameters:0];
  id v16 = [(WFCloudKitWebServiceRequest *)self queryWithItemType:a3 filter:v13];

  char v17 = getWFCloudKitWSLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v37 = "-[WFCloudKitWebServiceRequest fetchRecordsWithItemType:filter:cacheKey:completionHandler:]";
    __int16 v38 = 2112;
    v39 = v16;
    _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_INFO, "%s Querying CloudKit: %@", buf, 0x16u);
  }

  v34[0] = @"resultsLimit";
  v34[1] = @"zoneID";
  v35[0] = &unk_1F2316D40;
  v35[1] = &unk_1F2317F30;
  v34[2] = @"queryString";
  v35[2] = v16;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke;
  id v29 = &unk_1E6554350;
  id v32 = v11;
  Class v33 = a3;
  id v30 = self;
  id v19 = v14;
  id v31 = v19;
  id v20 = v11;
  id v21 = [(WFCloudKitWebServiceRequest *)self postJSON:v18 toURL:v15 cacheKey:v12 completionHandler:&v26];

  objc_msgSend(v19, "setDataTask:", v21, v26, v27, v28, v29, v30);
  uint64_t v22 = v31;
  id v23 = v19;

  return v23;
}

void __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = getWFCloudKitWSLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFCloudKitWebServiceRequest fetchRecordsWithItemType:filter:cacheKey:completionHandler:]_block_invoke";
      __int16 v25 = 2114;
      uint64_t v26 = (uint64_t)v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Unable to fetch records. Error: %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) recordsFromQueryResponse:v5];
    id v9 = getWFCloudKitWSLogObject();
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[WFCloudKitWebServiceRequest fetchRecordsWithItemType:filter:cacheKey:completionHandler:]_block_invoke";
        __int16 v25 = 2048;
        uint64_t v26 = [v8 count];
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_INFO, "%s Received %lu records from query.", buf, 0x16u);
      }

      id v11 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_269;
      block[3] = &unk_1E6554328;
      id v12 = v8;
      uint64_t v13 = *(void *)(a1 + 56);
      id v18 = v12;
      uint64_t v22 = v13;
      id v14 = *(id *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 32);
      id v19 = v14;
      uint64_t v20 = v15;
      id v21 = *(id *)(a1 + 48);
      dispatch_async(v11, block);

      id v16 = v18;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[WFCloudKitWebServiceRequest fetchRecordsWithItemType:filter:cacheKey:completionHandler:]_block_invoke";
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v5;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Unable to fetch records. Received response: %@", buf, 0x16u);
      }

      id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFCloudKitErrorDomain" code:1 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_269(uint64_t a1)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_2;
  void v12[3] = &unk_1E6554300;
  uint64_t v15 = *(void *)(a1 + 64);
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v13 = v3;
  uint64_t v14 = v4;
  id v5 = objc_msgSend(v2, "if_map:", v12);
  id v6 = [*(id *)(a1 + 40) operationQueue];
  [v6 waitUntilAllOperationsAreFinished];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_4;
  block[3] = &unk_1E65572A0;
  id v7 = *(id *)(a1 + 56);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

id __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(*(Class *)(a1 + 48));
  id v5 = [*(id *)(a1 + 32) operationQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_3;
  v11[3] = &unk_1E65556E0;
  v11[4] = *(void *)(a1 + 40);
  id v12 = v3;
  id v6 = v4;
  id v13 = v6;
  id v7 = v3;
  [v5 addOperationWithBlock:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

uint64_t __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) parseRecord:*(void *)(a1 + 40) intoItem:*(void *)(a1 + 48) allKeys:0];
}

- (WFCloudKitWebServiceRequest)initWithContainer:(id)a3 database:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFCloudKitWebServiceRequest;
  id v9 = [(WFCloudKitWebServiceRequest *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_container, a3);
    objc_storeStrong((id *)&v10->_database, a4);
    id v11 = v10;
  }

  return v10;
}

@end