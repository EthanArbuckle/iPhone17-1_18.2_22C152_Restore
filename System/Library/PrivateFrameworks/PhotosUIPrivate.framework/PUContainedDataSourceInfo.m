@interface PUContainedDataSourceInfo
- (PUAssetsDataSource)assetsDataSource;
- (_NSRange)externalSections;
- (id)description;
- (void)setAssetsDataSource:(id)a3;
- (void)setExternalSections:(_NSRange)a3;
@end

@implementation PUContainedDataSourceInfo

- (void).cxx_destruct
{
}

- (void)setExternalSections:(_NSRange)a3
{
  self->_externalSections = a3;
}

- (_NSRange)externalSections
{
  NSUInteger length = self->_externalSections.length;
  NSUInteger location = self->_externalSections.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setAssetsDataSource:(id)a3
{
}

- (PUAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PUContainedDataSourceInfo;
  v3 = [(PUContainedDataSourceInfo *)&v8 description];
  v10.NSUInteger location = [(PUContainedDataSourceInfo *)self externalSections];
  v4 = NSStringFromRange(v10);
  v5 = [(PUContainedDataSourceInfo *)self assetsDataSource];
  v6 = [v3 stringByAppendingFormat:@" externalSections:%@ assetsDataSource:%@", v4, v5];

  return v6;
}

@end