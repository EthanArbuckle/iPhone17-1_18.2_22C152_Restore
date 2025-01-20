@interface ICSetContainerPropertiesResponse
- (BOOL)updateRequired;
- (NSString)globalPlaylistID;
- (NSString)subscribedContainerURL;
- (void)setGlobalPlaylistID:(id)a3;
- (void)setSubscribedContainerURL:(id)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation ICSetContainerPropertiesResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedContainerURL, 0);

  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
}

- (void)setSubscribedContainerURL:(id)a3
{
}

- (NSString)subscribedContainerURL
{
  return self->_subscribedContainerURL;
}

- (void)setGlobalPlaylistID:(id)a3
{
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

@end