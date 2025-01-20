@interface CSDAVConferenceConfiguration
- (BOOL)isCaller;
- (BOOL)requiresInviteDictionary;
- (CGSize)localLandscapeAspectRatio;
- (CGSize)localPortraitAspectRatio;
- (NSDictionary)remoteInviteDictionary;
- (NSUUID)clientUUID;
- (RTCSecureHierarchyToken)reportingHierarchyToken;
- (VCCapabilities)capabilities;
- (id)description;
- (int)deviceRole;
- (void)setCaller:(BOOL)a3;
- (void)setCapabilities:(id)a3;
- (void)setClientUUID:(id)a3;
- (void)setLocalLandscapeAspectRatio:(CGSize)a3;
- (void)setLocalPortraitAspectRatio:(CGSize)a3;
- (void)setRemoteInviteDictionary:(id)a3;
- (void)setReportingHierarchyToken:(id)a3;
- (void)setRequiresInviteDictionary:(BOOL)a3;
@end

@implementation CSDAVConferenceConfiguration

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unsigned int v4 = [(CSDAVConferenceConfiguration *)self isCaller];
  v5 = [(CSDAVConferenceConfiguration *)self capabilities];
  v6 = +[NSString stringWithFormat:@"<%@ %p caller=%d capabilities=%@ deviceRole=%d>", v3, self, v4, v5, [(CSDAVConferenceConfiguration *)self deviceRole]];

  return v6;
}

- (int)deviceRole
{
  v2 = [(CSDAVConferenceConfiguration *)self capabilities];
  int v3 = [v2 deviceRole];

  return v3;
}

- (BOOL)isCaller
{
  return self->_caller;
}

- (void)setCaller:(BOOL)a3
{
  self->_caller = a3;
}

- (VCCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (NSUUID)clientUUID
{
  return self->_clientUUID;
}

- (void)setClientUUID:(id)a3
{
}

- (RTCSecureHierarchyToken)reportingHierarchyToken
{
  return self->_reportingHierarchyToken;
}

- (void)setReportingHierarchyToken:(id)a3
{
}

- (BOOL)requiresInviteDictionary
{
  return self->_requiresInviteDictionary;
}

- (void)setRequiresInviteDictionary:(BOOL)a3
{
  self->_requiresInviteDictionary = a3;
}

- (NSDictionary)remoteInviteDictionary
{
  return self->_remoteInviteDictionary;
}

- (void)setRemoteInviteDictionary:(id)a3
{
}

- (CGSize)localLandscapeAspectRatio
{
  double width = self->_localLandscapeAspectRatio.width;
  double height = self->_localLandscapeAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalLandscapeAspectRatio:(CGSize)a3
{
  self->_localLandscapeAspectRatio = a3;
}

- (CGSize)localPortraitAspectRatio
{
  double width = self->_localPortraitAspectRatio.width;
  double height = self->_localPortraitAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->_localPortraitAspectRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteInviteDictionary, 0);
  objc_storeStrong((id *)&self->_reportingHierarchyToken, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);

  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end