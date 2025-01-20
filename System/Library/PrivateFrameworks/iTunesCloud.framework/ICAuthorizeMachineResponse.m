@interface ICAuthorizeMachineResponse
- (ICAuthorizeMachineResponse)initWithResponseDictionary:(id)a3;
- (NSData)keybagData;
- (NSData)tokenData;
@end

@implementation ICAuthorizeMachineResponse

- (void).cxx_destruct
{
}

- (NSData)tokenData
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"token"];
  if (_NSIsNSData())
  {
    id v3 = v2;
LABEL_5:
    v4 = v3;
    goto LABEL_7;
  }
  if (_NSIsNSString())
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v2 options:0];
    goto LABEL_5;
  }
  v4 = 0;
LABEL_7:

  return (NSData *)v4;
}

- (NSData)keybagData
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"keybag"];
  if (_NSIsNSData())
  {
    id v3 = v2;
LABEL_5:
    v4 = v3;
    goto LABEL_7;
  }
  if (_NSIsNSString())
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v2 options:0];
    goto LABEL_5;
  }
  v4 = 0;
LABEL_7:

  return (NSData *)v4;
}

- (ICAuthorizeMachineResponse)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICAuthorizeMachineResponse;
  v5 = [(ICAuthorizeMachineResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end