@interface ICURLBagMescalConfiguration
- (BOOL)shouldIncludePath;
- (BOOL)shouldSignBody;
- (NSArray)fields;
- (NSArray)headers;
- (id)description;
- (void)setFields:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setShouldIncludePath:(BOOL)a3;
- (void)setShouldSignBody:(BOOL)a3;
@end

@implementation ICURLBagMescalConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);

  objc_storeStrong((id *)&self->_fields, 0);
}

- (void)setShouldSignBody:(BOOL)a3
{
  self->_shouldSignBody = a3;
}

- (BOOL)shouldSignBody
{
  return self->_shouldSignBody;
}

- (void)setShouldIncludePath:(BOOL)a3
{
  self->_shouldIncludePath = a3;
}

- (void)setHeaders:(id)a3
{
}

- (void)setFields:(id)a3
{
}

- (NSArray)headers
{
  return self->_headers;
}

- (NSArray)fields
{
  return self->_fields;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ICURLBagMescalConfiguration;
  v4 = [(ICURLBagMescalConfiguration *)&v7 description];
  objc_msgSend(v3, "stringWithFormat:", @"%@; shouldSignBody=%d, shouldIncludePath=%d, fields=%@, headers=%@",
    v4,
    self->_shouldSignBody,
    self->_shouldIncludePath,
    self->_fields,
  v5 = self->_headers);

  return v5;
}

- (BOOL)shouldIncludePath
{
  return self->_shouldIncludePath;
}

@end