@interface SSPurchaseResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)cancelsPurchaseBatch;
- (NSArray)downloadIdentifiers;
- (NSDictionary)tidHeaders;
- (NSError)error;
- (SSPurchase)purchase;
- (SSPurchaseResponse)initWithCoder:(id)a3;
- (SSPurchaseResponse)initWithXPCEncoding:(id)a3;
- (SSURLConnectionResponse)URLResponse;
- (double)requestStartTime;
- (double)responseEndTime;
- (double)responseStartTime;
- (id)copyXPCEncoding;
- (id)downloadMetadataForItemIdentifier:(int64_t)a3;
- (id)downloadsMetadata;
- (id)responseMetrics;
- (id)transactionIdentifierForItemIdentifier:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCancelsPurchaseBatch:(BOOL)a3;
- (void)setDownloadIdentifiers:(id)a3;
- (void)setError:(id)a3;
- (void)setPurchase:(id)a3;
- (void)setRequestStartTime:(double)a3;
- (void)setResponseEndTime:(double)a3;
- (void)setResponseStartTime:(double)a3;
- (void)setTidHeaders:(id)a3;
- (void)setURLResponse:(id)a3;
@end

@implementation SSPurchaseResponse

- (id)downloadMetadataForItemIdentifier:(int64_t)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__61;
  v14 = __Block_byref_object_dispose__61;
  id v15 = 0;
  v4 = [(SSURLConnectionResponse *)self->_response bodyData];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 objectForKey:@"items"];
      if (!v6)
      {
        v6 = [v5 objectForKey:@"songList"];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __56__SSPurchaseResponse_downloadMetadataForItemIdentifier___block_invoke;
        v9[3] = &unk_1E5BAD330;
        v9[4] = &v10;
        v9[5] = a3;
        [v6 enumerateObjectsUsingBlock:v9];
      }
    }
  }
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __56__SSPurchaseResponse_downloadMetadataForItemIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [[SSDownloadMetadata alloc] initWithDictionary:v7];
    if ([(SSDownloadMetadata *)v6 itemIdentifier] == *(void *)(a1 + 40))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
      *a4 = 1;
    }
  }
}

- (id)downloadsMetadata
{
  v2 = [(SSURLConnectionResponse *)self->_response bodyData];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__61;
  uint64_t v12 = __Block_byref_object_dispose__61;
  id v13 = (id)objc_opt_new();
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28F98] propertyListWithData:v2 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v3 objectForKey:@"items"];
      if (!v4)
      {
        v4 = [v3 objectForKey:@"songList"];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __39__SSPurchaseResponse_downloadsMetadata__block_invoke;
        v7[3] = &unk_1E5BAD358;
        v7[4] = &v8;
        [v4 enumerateObjectsUsingBlock:v7];
      }
    }
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __39__SSPurchaseResponse_downloadsMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [[SSDownloadMetadata alloc] initWithDictionary:v4];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

- (id)transactionIdentifierForItemIdentifier:(int64_t)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  transactionIdentifiers = self->_transactionIdentifiers;
  unint64_t v5 = 0x1E4F28000;
  if (!transactionIdentifiers)
  {
    id v7 = [(SSURLConnectionResponse *)self->_response bodyData];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:0];
      unint64_t v9 = 0x1E4F1C000uLL;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v8 objectForKey:@"items"];
        if (!v10)
        {
          uint64_t v10 = [v8 objectForKey:@"songList"];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v36 = v8;
          v37 = v7;
          int64_t v38 = a3;
          v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v12 = self->_transactionIdentifiers;
          self->_transactionIdentifiers = v11;

          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          v35 = v10;
          id v13 = v10;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v41;
            v17 = &off_1E5BA6000;
            do
            {
              uint64_t v18 = 0;
              uint64_t v39 = v15;
              do
              {
                if (*(void *)v41 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * v18);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v20 = (void *)[objc_alloc((Class)v17[209]) initWithDictionary:v19];
                  uint64_t v21 = [v20 itemIdentifier];
                  uint64_t v22 = [v20 transactionIdentifier];
                  v23 = (void *)v22;
                  if (v21) {
                    BOOL v24 = v22 == 0;
                  }
                  else {
                    BOOL v24 = 1;
                  }
                  if (!v24)
                  {
                    uint64_t v25 = v16;
                    id v26 = v13;
                    unint64_t v27 = v9;
                    v28 = v17;
                    v29 = self->_transactionIdentifiers;
                    v30 = [NSNumber numberWithUnsignedLongLong:v21];
                    v31 = v29;
                    v17 = v28;
                    unint64_t v9 = v27;
                    id v13 = v26;
                    uint64_t v16 = v25;
                    uint64_t v15 = v39;
                    [(NSMutableDictionary *)v31 setObject:v23 forKey:v30];
                  }
                }
                ++v18;
              }
              while (v15 != v18);
              uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
            }
            while (v15);
          }

          id v7 = v37;
          a3 = v38;
          unint64_t v5 = 0x1E4F28000uLL;
          uint64_t v10 = v35;
          uint64_t v8 = v36;
        }
      }
    }

    transactionIdentifiers = self->_transactionIdentifiers;
  }
  v32 = [*(id *)(v5 + 3792) numberWithLongLong:a3];
  v33 = [(NSMutableDictionary *)transactionIdentifiers objectForKey:v32];

  return v33;
}

- (id)responseMetrics
{
  v2 = [(SSPurchaseResponse *)self URLResponse];
  v3 = [v2 bodyData];

  if (v3)
  {
    id v4 = +[SSVURLDataConsumer consumer];
    unint64_t v5 = [v4 objectForData:v3 response:0 error:0];

    objc_opt_class();
    v6 = 0;
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 objectForKey:@"metrics"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v6 = 0;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SSPurchaseResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SSPurchaseResponse;
  unint64_t v5 = [(SSPurchaseResponse *)&v28 init];
  if (v5)
  {
    v5->_cancelsPurchaseBatch = [v4 decodeBoolForKey:@"0"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"4"];
    downloadIdentifiers = v5->_downloadIdentifiers;
    v5->_downloadIdentifiers = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"1"];
    error = v5->_error;
    v5->_error = (NSError *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"2"];
    purchase = v5->_purchase;
    v5->_purchase = (SSPurchase *)v13;

    [v4 decodeDoubleForKey:@"5"];
    v5->_requestStartTime = v15;
    uint64_t v16 = [SSURLConnectionResponse alloc];
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"3"];
    uint64_t v18 = [(SSURLConnectionResponse *)v16 initWithDatabaseEncoding:v17];
    response = v5->_response;
    v5->_response = (SSURLConnectionResponse *)v18;

    [v4 decodeDoubleForKey:@"6"];
    v5->_responseEndTime = v20;
    [v4 decodeDoubleForKey:@"7"];
    v5->_responseStartTime = v21;
    uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    BOOL v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"8"];
    tidHeaders = v5->_tidHeaders;
    v5->_tidHeaders = (NSDictionary *)v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL cancelsPurchaseBatch = self->_cancelsPurchaseBatch;
  id v6 = a3;
  [v6 encodeBool:cancelsPurchaseBatch forKey:@"0"];
  [v6 encodeObject:self->_downloadIdentifiers forKey:@"4"];
  [v6 encodeObject:self->_error forKey:@"1"];
  [v6 encodeObject:self->_purchase forKey:@"2"];
  [v6 encodeDouble:@"5" forKey:self->_requestStartTime];
  unint64_t v5 = [(SSURLConnectionResponse *)self->_response databaseEncoding];
  [v6 encodeObject:v5 forKey:@"3"];

  [v6 encodeDouble:@"6" forKey:self->_responseEndTime];
  [v6 encodeDouble:@"7" forKey:self->_responseStartTime];
  [v6 encodeObject:self->_tidHeaders forKey:@"8"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SSPurchaseResponse)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v24.receiver = self;
    v24.super_class = (Class)SSPurchaseResponse;
    id v6 = [(SSPurchaseResponse *)&v24 init];
    if (v6)
    {
      v6->_BOOL cancelsPurchaseBatch = xpc_dictionary_get_BOOL(v5, "0");
      objc_opt_class();
      CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "4");
      downloadIdentifiers = v6->_downloadIdentifiers;
      v6->_downloadIdentifiers = (NSArray *)v8;

      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = xpc_dictionary_get_value(v5, "1");
      uint64_t v12 = [v10 initWithXPCEncoding:v11];
      error = v6->_error;
      v6->_error = (NSError *)v12;

      uint64_t v14 = [SSPurchase alloc];
      double v15 = xpc_dictionary_get_value(v5, "2");
      uint64_t v16 = [(SSPurchase *)v14 initWithXPCEncoding:v15];
      purchase = v6->_purchase;
      v6->_purchase = (SSPurchase *)v16;

      v6->_requestStartTime = xpc_dictionary_get_double(v5, "5");
      uint64_t v18 = [SSURLConnectionResponse alloc];
      uint64_t v19 = xpc_dictionary_get_value(v5, "3");
      uint64_t v20 = [(SSURLConnectionResponse *)v18 initWithXPCEncoding:v19];
      response = v6->_response;
      v6->_response = (SSURLConnectionResponse *)v20;

      v6->_responseEndTime = xpc_dictionary_get_double(v5, "6");
      v6->_responseStartTime = xpc_dictionary_get_double(v5, "7");
      objc_opt_class();
      CFArrayRef v22 = SSXPCDictionaryCopyCFObjectWithClass(v5, "8");
      tidHeaders = v6->_tidHeaders;
      v6->_tidHeaders = (NSDictionary *)v22;
    }
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "0", self->_cancelsPurchaseBatch);
  SSXPCDictionarySetCFObject(v3, "4", (__CFString *)self->_downloadIdentifiers);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_error);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_purchase);
  xpc_dictionary_set_double(v3, "5", self->_requestStartTime);
  SSXPCDictionarySetCFObject(v3, "3", (__CFString *)self->_response);
  xpc_dictionary_set_double(v3, "6", self->_responseEndTime);
  xpc_dictionary_set_double(v3, "7", self->_responseStartTime);
  SSXPCDictionarySetCFObject(v3, "8", (__CFString *)self->_tidHeaders);
  return v3;
}

- (BOOL)cancelsPurchaseBatch
{
  return self->_cancelsPurchaseBatch;
}

- (void)setCancelsPurchaseBatch:(BOOL)a3
{
  self->_BOOL cancelsPurchaseBatch = a3;
}

- (NSArray)downloadIdentifiers
{
  return self->_downloadIdentifiers;
}

- (void)setDownloadIdentifiers:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (SSPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
}

- (double)requestStartTime
{
  return self->_requestStartTime;
}

- (void)setRequestStartTime:(double)a3
{
  self->_requestStartTime = a3;
}

- (double)responseEndTime
{
  return self->_responseEndTime;
}

- (void)setResponseEndTime:(double)a3
{
  self->_responseEndTime = a3;
}

- (double)responseStartTime
{
  return self->_responseStartTime;
}

- (void)setResponseStartTime:(double)a3
{
  self->_responseStartTime = a3;
}

- (NSDictionary)tidHeaders
{
  return self->_tidHeaders;
}

- (void)setTidHeaders:(id)a3
{
}

- (SSURLConnectionResponse)URLResponse
{
  return self->_response;
}

- (void)setURLResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIdentifiers, 0);
  objc_storeStrong((id *)&self->_tidHeaders, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloadIdentifiers, 0);
}

@end