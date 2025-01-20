@interface PKWebServiceLoggableHeaders
- (PKWebServiceLoggableHeaders)init;
- (PKWebServiceLoggableHeaders)initWithHeaders:(id)a3;
- (id)_descriptionIncludingPrivateFields:(BOOL)a3;
- (id)description;
- (id)redactedDescription;
@end

@implementation PKWebServiceLoggableHeaders

- (PKWebServiceLoggableHeaders)init
{
  return 0;
}

- (PKWebServiceLoggableHeaders)initWithHeaders:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKWebServiceLoggableHeaders;
  v6 = [(PKWebServiceLoggableHeaders *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_headers, a3);
  }

  return v7;
}

- (id)description
{
  return [(PKWebServiceLoggableHeaders *)self _descriptionIncludingPrivateFields:1];
}

- (id)redactedDescription
{
  return [(PKWebServiceLoggableHeaders *)self _descriptionIncludingPrivateFields:0];
}

- (id)_descriptionIncludingPrivateFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = self->_headers;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v6)
  {
    v8 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  v8 = 0;
  uint64_t v9 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = (__CFString *)*(id *)(*((void *)&v21 + 1) + 8 * i);
      v12 = v11;
      if (v11 == @"x-conversation-id"
        || v11
        && (int v13 = [(__CFString *)v11 isEqualToString:@"x-conversation-id"],
            v12,
            v13))
      {
        [(NSDictionary *)self->_headers PKStringForKey:v12];
        v8 = v14 = v8;
      }
      else
      {
        if (!v3) {
          continue;
        }
        v14 = [(NSDictionary *)self->_headers objectForKeyedSubscript:v12];
        [v20 appendFormat:@"\t%@ = \"%@\"\n", v12, v14];
      }
    }
    uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v7);
LABEL_17:

  if (!v3) {
    objc_msgSend(v20, "appendFormat:", @"\t%lu <private> fields\n", -[NSDictionary count](self->_headers, "count") - (v8 != 0));
  }
  id v15 = [NSString alloc];
  if (v8) {
    uint64_t v16 = [v15 initWithFormat:@"{\n\tx-conversation-id = \"%@\"\n%@}", v8, v20];
  }
  else {
    uint64_t v16 = [v15 initWithFormat:@"{\n%@}", v20, v19];
  }
  v17 = (void *)v16;

  return v17;
}

- (void).cxx_destruct
{
}

@end