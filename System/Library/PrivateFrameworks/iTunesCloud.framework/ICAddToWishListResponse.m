@interface ICAddToWishListResponse
- (ICAddToWishListResponse)initWithResponseDictionary:(id)a3;
- (NSString)message;
- (id)description;
- (int64_t)statusCode;
@end

@implementation ICAddToWishListResponse

- (void).cxx_destruct
{
}

- (NSString)message
{
  return (NSString *)[(NSDictionary *)self->_responseDictionary ic_stringValueForKey:@"msg"];
}

- (int64_t)statusCode
{
  return [(NSDictionary *)self->_responseDictionary ic_intValueForKey:@"status"];
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ICAddToWishListResponse;
  v4 = [(ICAddToWishListResponse *)&v9 description];
  int64_t v5 = [(ICAddToWishListResponse *)self statusCode];
  v6 = [(ICAddToWishListResponse *)self message];
  v7 = [v3 stringWithFormat:@"%@: [status=%d, msg='%@']", v4, v5, v6];

  return v7;
}

- (ICAddToWishListResponse)initWithResponseDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICAddToWishListResponse;
  v6 = [(ICAddToWishListResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_responseDictionary, a3);
  }

  return v7;
}

@end