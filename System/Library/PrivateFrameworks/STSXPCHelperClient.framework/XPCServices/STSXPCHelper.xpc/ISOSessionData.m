@interface ISOSessionData
- (NSNumber)status;
- (id)description;
- (void)setStatus:(id)a3;
@end

@implementation ISOSessionData

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  if (self) {
    encData = self->_encData;
  }
  else {
    encData = 0;
  }
  id v5 = [(NSData *)encData length];
  v6 = [(ISOSessionData *)self status];
  id v7 = [v3 initWithFormat:@"{data len=%lu, statusCode=%@}", v5, v6];

  return v7;
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_encData, 0);
}

@end