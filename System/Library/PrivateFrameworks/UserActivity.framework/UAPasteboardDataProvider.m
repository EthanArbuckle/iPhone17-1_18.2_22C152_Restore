@interface UAPasteboardDataProvider
- (NSData)data;
- (NSString)type;
- (NSUUID)uuid;
- (UAPasteboardDataProvider)initWithData:(id)a3 type:(id)a4;
- (void)getDataWithCompletionBlock:(id)a3;
- (void)setData:(id)a3;
- (void)setType:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation UAPasteboardDataProvider

- (UAPasteboardDataProvider)initWithData:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UAPasteboardDataProvider;
  v8 = [(UAPasteboardDataProvider *)&v11 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F29128] UUID];
    [(UAPasteboardDataProvider *)v8 setUuid:v9];

    [(UAPasteboardDataProvider *)v8 setType:v7];
    [(UAPasteboardDataProvider *)v8 setData:v6];
  }

  return v8;
}

- (void)getDataWithCompletionBlock:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, id, void))a3;
  v5 = [(UAPasteboardDataProvider *)self data];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA10];
    id v7 = [(UAPasteboardDataProvider *)self data];
    id v13 = [v6 inputStreamWithData:v7];

    v4[2](v4, v13, 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"Zero length data to convert";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v10 = [v8 errorWithDomain:@"UAContinuityErrorDomain" code:-124 userInfo:v9];

    objc_super v11 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [(UAPasteboardDataProvider *)self type];
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Error, providing nil data for type: %@", buf, 0xCu);
    }
    ((void (**)(id, id, void *))v4)[2](v4, 0, v10);
  }
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end