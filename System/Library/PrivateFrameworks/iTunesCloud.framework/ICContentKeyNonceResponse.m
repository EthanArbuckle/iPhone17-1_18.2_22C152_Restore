@interface ICContentKeyNonceResponse
- (ICContentKeyNonceResponse)initWithResponseDictionary:(id)a3;
- (NSData)nonceData;
- (int64_t)status;
@end

@implementation ICContentKeyNonceResponse

- (void).cxx_destruct
{
}

- (NSData)nonceData
{
  return self->_nonceData;
}

- (int64_t)status
{
  return self->_status;
}

- (ICContentKeyNonceResponse)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICContentKeyNonceResponse;
  v5 = [(ICContentKeyNonceResponse *)&v10 init];
  if (v5)
  {
    v5->_status = objc_msgSend(v4, "ic_integerValueForKey:", @"status");
    v6 = objc_msgSend(v4, "ic_stringValueForKey:", @"nonce");
    if (v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      nonceData = v5->_nonceData;
      v5->_nonceData = (NSData *)v7;
    }
  }

  return v5;
}

@end