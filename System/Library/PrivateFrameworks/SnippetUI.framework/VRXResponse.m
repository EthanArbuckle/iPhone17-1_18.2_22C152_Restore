@interface VRXResponse
- (NSData)model;
- (VRXResponse)initWithModel:(id)a3 responseType:(int64_t)a4;
- (int64_t)responseType;
@end

@implementation VRXResponse

- (VRXResponse)initWithModel:(id)a3 responseType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VRXResponse;
  v8 = [(VRXResponse *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_model, a3);
    v9->_responseType = a4;
  }

  return v9;
}

- (NSData)model
{
  return self->_model;
}

- (int64_t)responseType
{
  return self->_responseType;
}

- (void).cxx_destruct
{
}

@end