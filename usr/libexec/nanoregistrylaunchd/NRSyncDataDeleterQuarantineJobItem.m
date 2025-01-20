@interface NRSyncDataDeleterQuarantineJobItem
- (NRSyncDataDeleterQuarantineJobItem)initWithSourcePath:(id)a3;
- (NSString)quarantinePath;
- (NSString)sourcePath;
- (void)setQuarantinePath:(id)a3;
- (void)setSourcePath:(id)a3;
@end

@implementation NRSyncDataDeleterQuarantineJobItem

- (NRSyncDataDeleterQuarantineJobItem)initWithSourcePath:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NRSyncDataDeleterQuarantineJobItem;
  v6 = [(NRSyncDataDeleterQuarantineJobItem *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourcePath, a3);
    uint64_t v8 = [v5 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    quarantinePath = v7->_quarantinePath;
    v7->_quarantinePath = (NSString *)v8;
  }
  return v7;
}

- (NSString)sourcePath
{
  return self->_sourcePath;
}

- (void)setSourcePath:(id)a3
{
}

- (NSString)quarantinePath
{
  return self->_quarantinePath;
}

- (void)setQuarantinePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quarantinePath, 0);

  objc_storeStrong((id *)&self->_sourcePath, 0);
}

@end