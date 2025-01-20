@interface NUNIAegirCloudCoverService
- (BOOL)shouldFetchData;
- (NSURL)directory;
- (NUNIAegirCloudCoverService)initWithImageScale:(float)a3;
- (void)retrieveCloudTextureURLs:(id)a3;
- (void)setDirectory:(id)a3;
@end

@implementation NUNIAegirCloudCoverService

- (NUNIAegirCloudCoverService)initWithImageScale:(float)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NUNIAegirCloudCoverService;
  v4 = [(NUNIAegirCloudCoverService *)&v10 init];
  if (v4)
  {
    v5 = [_TtC12NanoUniverse22AegirCloudCoverService alloc];
    *(float *)&double v6 = a3;
    uint64_t v7 = [(AegirCloudCoverService *)v5 initWithImageScale:v6];
    cloudService = v4->_cloudService;
    v4->_cloudService = (_TtC12NanoUniverse22AegirCloudCoverService *)v7;
  }
  return v4;
}

- (void)setDirectory:(id)a3
{
}

- (NSURL)directory
{
  return [(AegirCloudCoverService *)self->_cloudService directory];
}

- (void)retrieveCloudTextureURLs:(id)a3
{
}

- (BOOL)shouldFetchData
{
  return [(AegirCloudCoverService *)self->_cloudService canFetchData];
}

- (void).cxx_destruct
{
}

@end