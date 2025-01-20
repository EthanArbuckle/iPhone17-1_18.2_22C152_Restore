@interface INRegistrationResponse
- (BOOL)isResponseEmpty;
- (INRegistrationResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (unint64_t)timeToLive;
@end

@implementation INRegistrationResponse

- (INRegistrationResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)INRegistrationResponse;
  v7 = [(INRegistrationResponse *)&v9 initWithHTTPResponse:a3 data:v6];
  if (v7 && (!a3 || !v6 || ![v6 length])) {
    v7->_isResponseEmpty = 1;
  }

  return v7;
}

- (unint64_t)timeToLive
{
  v2 = [(INRegistrationResponse *)self responseDictionary];
  v3 = [v2 objectForKey:@"registration-ttl-in-sec"];
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (BOOL)isResponseEmpty
{
  return self->_isResponseEmpty;
}

@end