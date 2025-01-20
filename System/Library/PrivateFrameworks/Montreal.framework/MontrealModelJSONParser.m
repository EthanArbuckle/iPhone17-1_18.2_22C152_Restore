@interface MontrealModelJSONParser
- (MontrealModelJSONParser)initWithURL:(id)a3;
- (MontrealNNModelNetwork)network;
- (NSDictionary)infoDictionary;
- (NSString)jsonDir;
- (id)createJSONFromFile:(id)a3;
@end

@implementation MontrealModelJSONParser

- (MontrealModelJSONParser)initWithURL:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MontrealModelJSONParser;
  id v8 = [(MontrealModelJSONParser *)&v17 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_path(v4, v5, v6, v7);
    v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    v11 = [MontrealNNModelNetwork alloc];
    uint64_t v14 = objc_msgSend_initWithJSONDir_(v11, v12, *((void *)v8 + 1), v13);
    v15 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v14;
  }
  return (MontrealModelJSONParser *)v8;
}

- (id)createJSONFromFile:(id)a3
{
  id v4 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a3, v3);
  uint64_t v6 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v5, (uint64_t)v4, 0, 0);

  return v6;
}

- (NSString)jsonDir
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (MontrealNNModelNetwork)network
{
  return (MontrealNNModelNetwork *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)infoDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_network, 0);

  objc_storeStrong((id *)&self->_jsonDir, 0);
}

@end