@interface DirectUploadResponse
- (DirectUploadResponse)initWithURLResponse:(id)a3 data:(id)a4;
- (NSError)error;
- (NSString)assetToken;
- (NSString)assetTokenType;
- (int64_t)countOfBytesSent;
- (void)setCountOfBytesSent:(int64_t)a3;
@end

@implementation DirectUploadResponse

- (DirectUploadResponse)initWithURLResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)DirectUploadResponse;
  v8 = [(DirectUploadResponse *)&v39 init];
  if (v8)
  {
    uint64_t v9 = (uint64_t)[v6 statusCode];
    v10 = +[SSVURLProtocolConsumer consumer];
    v11 = [v10 objectForData:v7 response:v6 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v36 = (id)v9;
      id v12 = v11;
      v13 = [v12 objectForKey:@"responses"];
      objc_opt_class();
      v38 = v13;
      if (objc_opt_isKindOfClass())
      {
        v14 = [v13 firstObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;

          id v12 = v15;
        }
      }
      v16 = [v12 objectForKey:@"token"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v17 = (NSString *)[v16 copy];
      }
      else {
        v17 = 0;
      }
      v20 = [v12 objectForKey:@"tokenType"];

      objc_opt_class();
      v21 = v11;
      v22 = v10;
      if (objc_opt_isKindOfClass()) {
        id obj = [v20 copy];
      }
      else {
        id obj = 0;
      }
      v23 = [v12 objectForKey:@"statusCode"];

      if (objc_opt_respondsToSelector()) {
        id v36 = [v23 integerValue];
      }
      v24 = [v12 objectForKey:@"localizedMessage"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v18 = [v24 copy];
      }
      else {
        id v18 = 0;
      }
      v10 = v22;
      v11 = v21;

      if (v17)
      {
        assetToken = v8->_assetToken;
        v8->_assetToken = v17;
        p_isa = v17;

        v19 = obj;
        objc_storeStrong((id *)&v8->_assetTokenType, obj);
LABEL_27:

        goto LABEL_28;
      }
      uint64_t v9 = (uint64_t)v36;
      v19 = obj;
    }
    else
    {
      id v18 = 0;
      v19 = 0;
    }
    if (v9 == 403)
    {
      SSError();
      p_isa = (NSString *)objc_claimAutoreleasedReturnValue();
      +[NSNumber numberWithInteger:403];
      v28 = v27 = v19;
      uint64_t v29 = SSErrorBySettingUserInfoValue();
      error = v8->_error;
      v8->_error = (NSError *)v29;

      v19 = v27;
    }
    else
    {
      SSError();
      v31 = (NSError *)objc_claimAutoreleasedReturnValue();
      if (v9 >= 400)
      {
        +[NSNumber numberWithInteger:v9];
        v33 = v32 = v19;
        uint64_t v34 = SSErrorBySettingUserInfoValue();

        v19 = v32;
        v31 = (NSError *)v34;
      }
      p_isa = (NSString *)&v8->_error->super.isa;
      v8->_error = v31;
    }
    goto LABEL_27;
  }
LABEL_28:

  return v8;
}

- (NSString)assetToken
{
  return self->_assetToken;
}

- (NSString)assetTokenType
{
  return self->_assetTokenType;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_assetTokenType, 0);

  objc_storeStrong((id *)&self->_assetToken, 0);
}

@end