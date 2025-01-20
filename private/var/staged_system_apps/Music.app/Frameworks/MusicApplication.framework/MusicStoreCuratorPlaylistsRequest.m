@interface MusicStoreCuratorPlaylistsRequest
+ (BOOL)supportsSecureCoding;
+ (id)allSupportedItemProperties;
+ (id)allSupportedSectionProperties;
- (MusicStoreCuratorPlaylistsRequest)initWithCoder:(id)a3;
- (MusicStoreCuratorPlaylistsResponse)previousResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (int64_t)curatorStoreAdamID;
- (void)encodeWithCoder:(id)a3;
- (void)setCuratorStoreAdamID:(int64_t)a3;
- (void)setPreviousResponse:(id)a3;
@end

@implementation MusicStoreCuratorPlaylistsRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MusicStoreCuratorPlaylistsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MusicStoreCuratorPlaylistsRequest;
  v5 = [(MusicStoreCuratorPlaylistsRequest *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_curatorStoreAdamID = (int64_t)[v4 decodeInt64ForKey:@"MusicStoreCuratorPlaylistsRequestCuratorStoreAdamID"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MusicStoreCuratorPlaylistsRequest;
  id v4 = a3;
  [(MusicStoreCuratorPlaylistsRequest *)&v5 encodeWithCoder:v4];
  [v4 encodeInt64:self->_curatorStoreAdamID forKey:@"MusicStoreCuratorPlaylistsRequestCuratorStoreAdamID" receiver:v5.receiver super_class:v5.super_class];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MusicStoreCuratorPlaylistsRequest;
  id result = [(MusicStoreCuratorPlaylistsRequest *)&v5 copyWithZone:a3];
  if (result) {
    *((void *)result + 1) = self->_curatorStoreAdamID;
  }
  return result;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MusicStoreCuratorPlaylistsRequestOperation alloc];
  id v6 = [(MusicStoreCuratorPlaylistsRequest *)self copy];
  objc_super v7 = [(MusicStoreCuratorPlaylistsRequestOperation *)v5 initWithRequest:v6 responseHandler:v4];

  return v7;
}

+ (id)allSupportedSectionProperties
{
  return +[MPStoreModelCuratorBuilder allSupportedProperties];
}

+ (id)allSupportedItemProperties
{
  return +[MPStoreModelPlaylistBuilder allSupportedProperties];
}

- (int64_t)curatorStoreAdamID
{
  return self->_curatorStoreAdamID;
}

- (void)setCuratorStoreAdamID:(int64_t)a3
{
  self->_curatorStoreAdamID = a3;
}

- (MusicStoreCuratorPlaylistsResponse)previousResponse
{
  return self->_previousResponse;
}

- (void)setPreviousResponse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end