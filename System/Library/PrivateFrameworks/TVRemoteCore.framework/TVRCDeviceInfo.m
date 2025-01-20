@interface TVRCDeviceInfo
- (BOOL)containsID:(id)a3;
- (NSString)airplayID;
- (NSString)idsID;
- (NSString)mediaRemoteID;
- (id)description;
- (void)_populateValidIdentifiers:(id)a3;
@end

@implementation TVRCDeviceInfo

- (BOOL)containsID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  BOOL v6 = self->_mediaRemoteID && (objc_msgSend(v4, "isEqualToString:") & 1) != 0
    || self->_airplayID && objc_msgSend(v5, "isEqualToString:");

  return v6;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = v3;
  if (self->_mediaRemoteID) {
    [v3 appendFormat:@"; mediaRemoteID=%@", self->_mediaRemoteID];
  }
  if (self->_airplayID) {
    [v4 appendFormat:@"; airplayID=%@", self->_airplayID];
  }
  if (self->_idsID) {
    [v4 appendFormat:@"; idsID=%@", self->_idsID];
  }
  [v4 appendString:@">"];
  v5 = (void *)[v4 copy];

  return v5;
}

- (void)_populateValidIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"MediaRemoteID"];
  mediaRemoteID = self->_mediaRemoteID;
  self->_mediaRemoteID = v5;

  v7 = [v4 objectForKey:@"AirplayID"];

  airplayID = self->_airplayID;
  self->_airplayID = v7;
}

- (NSString)mediaRemoteID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)airplayID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)idsID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsID, 0);
  objc_storeStrong((id *)&self->_airplayID, 0);

  objc_storeStrong((id *)&self->_mediaRemoteID, 0);
}

@end