@interface PDPersonalizePassResult
- (NSString)encodedSignature;
- (PDPersonalizePassResult)initWithSignatureData:(id)a3;
@end

@implementation PDPersonalizePassResult

- (PDPersonalizePassResult)initWithSignatureData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPersonalizePassResult;
  v5 = [(PDPersonalizePassResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 base64EncodedStringWithOptions:0];
    encodedSignature = v5->_encodedSignature;
    v5->_encodedSignature = (NSString *)v6;
  }
  return v5;
}

- (NSString)encodedSignature
{
  return self->_encodedSignature;
}

- (void).cxx_destruct
{
}

@end