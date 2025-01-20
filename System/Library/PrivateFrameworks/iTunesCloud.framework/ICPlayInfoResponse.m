@interface ICPlayInfoResponse
- (ICPlayInfoResponse)initWithResponseDictionary:(id)a3;
- (NSData)playInfoData;
@end

@implementation ICPlayInfoResponse

- (void).cxx_destruct
{
}

- (NSData)playInfoData
{
  return (NSData *)[(NSDictionary *)self->_responseDictionary ic_dataValueForKey:@"play-info"];
}

- (ICPlayInfoResponse)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPlayInfoResponse;
  v5 = [(ICPlayInfoResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end