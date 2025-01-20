@interface _UINSItemProviderCacheState
- (NSDate)expirationDate;
- (NSString)typeIdentifier;
- (NSURL)url;
- (void)setExpirationDate:(id)a3;
- (void)setTypeIdentifier:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation _UINSItemProviderCacheState

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setTypeIdentifier:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end