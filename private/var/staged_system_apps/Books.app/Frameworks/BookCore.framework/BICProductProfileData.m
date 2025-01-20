@interface BICProductProfileData
- (NSDate)expiration;
- (NSError)error;
- (NSString)identifier;
- (NSString)url;
- (unint64_t)height;
- (unint64_t)width;
- (void)setError:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation BICProductProfileData

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end