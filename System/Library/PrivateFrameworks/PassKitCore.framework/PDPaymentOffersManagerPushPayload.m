@interface PDPaymentOffersManagerPushPayload
- (NSString)fpanIdentifier;
- (PDPaymentOffersManagerPushPayload)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)endpoint;
@end

@implementation PDPaymentOffersManagerPushPayload

- (PDPaymentOffersManagerPushPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v14.receiver = self;
    v14.super_class = (Class)PDPaymentOffersManagerPushPayload;
    v5 = [(PDPaymentOffersManagerPushPayload *)&v14 init];
    if (v5)
    {
      uint64_t v6 = [v4 PKStringForKey:@"passTypeIdentifier"];
      fpanIdentifier = v5->_fpanIdentifier;
      v5->_fpanIdentifier = (NSString *)v6;

      v8 = [v4 PKStringForKey:@"endpoint"];
      v9 = v8;
      BOOL v11 = 1;
      if (v8 != @"catalog")
      {
        if (!v8
          || (unsigned int v10 = [(__CFString *)v8 isEqualToString:@"catalog"],
              v9,
              !v10))
        {
          BOOL v11 = 0;
        }
      }

      v5->_endpoint = v11;
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  [v3 appendFormat:@"fpanIdentifier: '%@'; ", self->_fpanIdentifier];
  if (self->_endpoint == 1) {
    CFStringRef v4 = @"catalog";
  }
  else {
    CFStringRef v4 = @"unknown";
  }
  [v3 appendFormat:@"endpoint: '%@'; ", v4];
  [v3 appendFormat:@">"];
  return v3;
}

- (unint64_t)endpoint
{
  return self->_endpoint;
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void).cxx_destruct
{
}

@end