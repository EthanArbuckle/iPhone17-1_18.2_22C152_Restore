@interface PKWebServiceLoggableRequestBody
- (PKWebServiceLoggableRequestBody)init;
- (PKWebServiceLoggableRequestBody)initWithBody:(id)a3 sensitiveKeys:(id)a4;
- (id)_descriptionIncludingPrivateFields:(BOOL)a3;
- (id)description;
- (id)redactedDescription;
- (void)_redactLogsFromJSONObject:(id)a3;
@end

@implementation PKWebServiceLoggableRequestBody

- (PKWebServiceLoggableRequestBody)init
{
  return 0;
}

- (PKWebServiceLoggableRequestBody)initWithBody:(id)a3 sensitiveKeys:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKWebServiceLoggableRequestBody;
  v9 = [(PKWebServiceLoggableRequestBody *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_body, a3);
    objc_storeStrong((id *)&v10->_sensitiveKeys, a4);
  }

  return v10;
}

- (id)description
{
  return [(PKWebServiceLoggableRequestBody *)self _descriptionIncludingPrivateFields:1];
}

- (id)redactedDescription
{
  return [(PKWebServiceLoggableRequestBody *)self _descriptionIncludingPrivateFields:0];
}

- (id)_descriptionIncludingPrivateFields:(BOOL)a3
{
  if (!self->_body)
  {
    id v7 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
    id v7 = (NSData *)objc_msgSend([NSString alloc], "initWithFormat:", @"%lu bytes", -[NSData length](self->_body, "length"));
    goto LABEL_12;
  }
  v4 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    [(PKWebServiceLoggableRequestBody *)self _redactLogsFromJSONObject:v5];
    body = v5;
LABEL_10:
    v9 = [(NSData *)body description];
    goto LABEL_11;
  }
  id v8 = (NSData *)[[NSString alloc] initWithData:self->_body encoding:4];
  v5 = v8;
  if (!v8)
  {
    body = self->_body;
    goto LABEL_10;
  }
  v9 = v8;
LABEL_11:
  id v7 = v9;

LABEL_12:
  return v7;
}

- (void)_redactLogsFromJSONObject:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v6 = [v5 allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if ([(NSSet *)self->_sensitiveKeys containsObject:v11])
          {
            [v5 setObject:@"<redacted>" forKey:v11];
          }
          else
          {
            objc_super v12 = [v5 objectForKey:v11];
            [(PKWebServiceLoggableRequestBody *)self _redactLogsFromJSONObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }

LABEL_21:
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v4;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          [(PKWebServiceLoggableRequestBody *)self _redactLogsFromJSONObject:*(void *)(*((void *)&v18 + 1) + 8 * j)];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }
    goto LABEL_21;
  }
LABEL_22:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveKeys, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end