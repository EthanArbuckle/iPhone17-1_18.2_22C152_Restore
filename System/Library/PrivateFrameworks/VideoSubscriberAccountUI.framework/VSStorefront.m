@interface VSStorefront
- (BOOL)isFeatured;
- (NSString)displayName;
- (NSString)identitifer;
- (void)setDisplayName:(id)a3;
- (void)setIdentitifer:(id)a3;
- (void)setIsFeatured:(BOOL)a3;
@end

@implementation VSStorefront

- (NSString)identitifer
{
  return self->_identitifer;
}

- (void)setIdentitifer:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)isFeatured
{
  return self->_isFeatured;
}

- (void)setIsFeatured:(BOOL)a3
{
  self->_isFeatured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identitifer, 0);
}

@end