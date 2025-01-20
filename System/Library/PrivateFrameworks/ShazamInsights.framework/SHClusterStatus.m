@interface SHClusterStatus
- (BOOL)isDataValid;
- (NSDate)creationDate;
- (NSString)storefront;
- (NSString)uniqueHash;
- (NSURL)dataURL;
- (SHClusterMetadata)metadata;
- (int64_t)clusterType;
- (int64_t)loadStatus;
- (void)setDataURL:(id)a3;
- (void)setIsDataValid:(BOOL)a3;
- (void)setLoadStatus:(int64_t)a3;
- (void)setMetadata:(id)a3;
@end

@implementation SHClusterStatus

- (NSString)uniqueHash
{
  v2 = [(SHClusterStatus *)self metadata];
  v3 = [v2 uniqueHash];

  return (NSString *)v3;
}

- (NSString)storefront
{
  v2 = [(SHClusterStatus *)self metadata];
  v3 = [v2 storefront];

  return (NSString *)v3;
}

- (NSDate)creationDate
{
  v2 = [(SHClusterStatus *)self metadata];
  v3 = [v2 creationDate];

  return (NSDate *)v3;
}

- (int64_t)clusterType
{
  v2 = [(SHClusterStatus *)self metadata];
  int64_t v3 = [v2 clusterType];

  return v3;
}

- (int64_t)loadStatus
{
  return self->_loadStatus;
}

- (void)setLoadStatus:(int64_t)a3
{
  self->_loadStatus = a3;
}

- (BOOL)isDataValid
{
  return self->_isDataValid;
}

- (void)setIsDataValid:(BOOL)a3
{
  self->_isDataValid = a3;
}

- (NSURL)dataURL
{
  return self->_dataURL;
}

- (void)setDataURL:(id)a3
{
}

- (SHClusterMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_dataURL, 0);
}

@end