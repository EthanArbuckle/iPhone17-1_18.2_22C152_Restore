@interface SAMLStatus
+ (id)createElement:(id *)a3;
- (NSString)statusDetail;
- (NSString)statusMessage;
- (SAMLStatusCode)statusCode;
- (id)status;
@end

@implementation SAMLStatus

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLStatus alloc] initWithTagName:@"Status" error:a3];
  if (v3)
  {
    v4 = SAMLProtocolNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
  }
  return v3;
}

- (SAMLStatusCode)statusCode
{
  return (SAMLStatusCode *)[(XMLWrapperElement *)self firstElementByTagName:@"StatusCode"];
}

- (NSString)statusMessage
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"samlp:StatusMessage"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 textContent];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)statusDetail
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"samlp:StatusDetail"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 textContent];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (id)status
{
  v2 = [(SAMLStatus *)self statusCode];
  v3 = [v2 value];

  return v3;
}

@end