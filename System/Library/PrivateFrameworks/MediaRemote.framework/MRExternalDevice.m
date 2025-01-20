@interface MRExternalDevice
- (BOOL)disconnectWhenUndiscoverable;
- (BOOL)isConnected;
- (BOOL)isPaired;
- (BOOL)isUsingSystemPairing;
- (BOOL)isValid;
- (BOOL)supportsDesignatedGroupLeaderUpdates;
- (BOOL)supportsExternalDiscovery;
- (BOOL)supportsIdleDisconnection;
- (BOOL)wantsEndpointChangeNotifications;
- (BOOL)wantsNowPlayingArtworkNotifications;
- (BOOL)wantsNowPlayingNotifications;
- (BOOL)wantsOutputDeviceNotifications;
- (BOOL)wantsSystemEndpointNotifications;
- (BOOL)wantsVolumeNotifications;
- (MRDeviceInfo)deviceInfo;
- (MRGroupSessionToken)groupSessionToken;
- (MROrigin)customOrigin;
- (MRSupportedProtocolMessages)supportedMessages;
- (NSArray)personalOutputDevices;
- (NSArray)subscribedPlayerPaths;
- (NSString)hostName;
- (NSString)name;
- (NSString)uid;
- (id)_init;
- (id)currentClientUpdatesConfigMessage;
- (id)discoveryDescription;
- (id)errorForCurrentState;
- (id)registerDiscoveryTokenForConfiguration:(id)a3;
- (int64_t)connectionRecoveryBehavior;
- (int64_t)port;
- (uint64_t)_highestDiscoveryModeForConfiguration:(uint64_t)a1;
- (unsigned)connectionState;
- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)connectWithOptions:(unsigned int)a3;
- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4;
- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5;
- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)disconnect:(id)a3;
- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5;
- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)notifyDiscoveryOutputDevicesChanged:(id)a3 forConfiguration:(id)a4;
- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5;
- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)sendButtonEvent:(_MRHIDButtonEvent)a3;
- (void)sendClientUpdatesConfigMessage;
- (void)sendCustomData:(id)a3 withName:(id)a4;
- (void)setConnectionRecoveryBehavior:(int64_t)a3;
- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4;
- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setCustomDataCallback:(id)a3 withQueue:(id)a4;
- (void)setDeviceInfoChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4;
- (void)setDiscoveryMode:(unsigned int)a3 forToken:(id)a4;
- (void)setDiscoveryOutputDevicesChangedCallback:(id)a3 forToken:(id)a4;
- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setNameCallback:(id)a3 withQueue:(id)a4;
- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setOutputDevicesRemovedCallback:(id)a3 withQueue:(id)a4;
- (void)setOutputDevicesUpdatedCallback:(id)a3 withQueue:(id)a4;
- (void)setPairingAllowedCallback:(id)a3 withQueue:(id)a4;
- (void)setPairingCallback:(id)a3 withQueue:(id)a4;
- (void)setSubscribedPlayerPaths:(id)a3;
- (void)setUsingSystemPairing:(BOOL)a3;
- (void)setVolumeCallback:(id)a3 withQueue:(id)a4;
- (void)setVolumeChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setVolumeControlCapabilitiesCallback:(id)a3 withQueue:(id)a4;
- (void)setVolumeMutedChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setWantsEndpointChangeNotifications:(BOOL)a3;
- (void)setWantsNowPlayingArtworkNotifications:(BOOL)a3;
- (void)setWantsNowPlayingNotifications:(BOOL)a3;
- (void)setWantsOutputDeviceNotifications:(BOOL)a3;
- (void)setWantsSystemEndpointNotifications:(BOOL)a3;
- (void)setWantsVolumeNotifications:(BOOL)a3;
- (void)unregisterDiscoveryToken:(id)a3;
- (void)updateDesignatedGroupLeader:(id)a3;
@end

@implementation MRExternalDevice

- (BOOL)wantsSystemEndpointNotifications
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice wantsSystemEndpointNotifications]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MRExternalDevice;
  return [(MRExternalDevice *)&v3 init];
}

- (NSArray)subscribedPlayerPaths
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice subscribedPlayerPaths]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)setSubscribedPlayerPaths:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setSubscribedPlayerPaths:]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (NSString)name
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice name]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (NSString)hostName
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice hostName]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (int64_t)port
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice port]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (NSString)uid
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice uid]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (MROrigin)customOrigin
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice customOrigin]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (MRDeviceInfo)deviceInfo
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice deviceInfo]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (MRSupportedProtocolMessages)supportedMessages
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice supportedMessages]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (MRGroupSessionToken)groupSessionToken
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice groupSessionToken]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)wantsNowPlayingNotifications
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice wantsNowPlayingNotifications]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)setWantsNowPlayingNotifications:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setWantsNowPlayingNotifications:]");
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)wantsNowPlayingArtworkNotifications
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice wantsNowPlayingArtworkNotifications]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)setWantsNowPlayingArtworkNotifications:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setWantsNowPlayingArtworkNotifications:]");
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)wantsVolumeNotifications
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice wantsVolumeNotifications]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)setWantsVolumeNotifications:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setWantsVolumeNotifications:]");
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)wantsOutputDeviceNotifications
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice wantsOutputDeviceNotifications]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)setWantsOutputDeviceNotifications:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setWantsOutputDeviceNotifications:]");
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)setWantsSystemEndpointNotifications:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setWantsSystemEndpointNotifications:]");
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)isPaired
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice isPaired]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)isUsingSystemPairing
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice isUsingSystemPairing]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)disconnect:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice disconnect:]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)setPairingCallback:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setPairingCallback:withQueue:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setConnectionStateCallback:withQueue:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setNameCallback:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setNameCallback:withQueue:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setPairingAllowedCallback:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setPairingAllowedCallback:withQueue:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setCustomDataCallback:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setCustomDataCallback:withQueue:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setVolumeCallback:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setVolumeCallback:withQueue:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setOutputDevicesUpdatedCallback:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setOutputDevicesUpdatedCallback:withQueue:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setOutputDevicesRemovedCallback:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setOutputDevicesRemovedCallback:withQueue:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setVolumeChangedCallback:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setVolumeChangedCallback:withQueue:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setVolumeControlCapabilitiesCallback:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setVolumeControlCapabilitiesCallback:withQueue:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setVolumeMutedChangedCallback:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setVolumeMutedChangedCallback:withQueue:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setDeviceInfoChangedCallback:(id)a3 withQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setDeviceInfoChangedCallback:withQueue:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v11 = *MEMORY[0x1E4F1C3B8];
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice removeFromParentGroup:queue:completion:]");
  id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v11 = *MEMORY[0x1E4F1C3B8];
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice requestGroupSessionWithDetails:queue:completion:]");
  id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v11 = *MEMORY[0x1E4F1C3B8];
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice outputDeviceVolumeControlCapabilities:queue:completion:]");
  id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v11 = *MEMORY[0x1E4F1C3B8];
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice outputDeviceVolume:queue:completion:]");
  id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v14 = [[MRRequestDetails alloc] initWithName:@"setOutputDeviceVolume" requestID:0 reason:@"LegacyAPI"];
  *(float *)&double v13 = a3;
  [(MRExternalDevice *)self setOutputDeviceVolume:v12 outputDeviceUID:v14 details:v11 queue:v10 completion:v13];
}

- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  v14 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v15 = *MEMORY[0x1E4F1C3B8];
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setOutputDeviceVolume:outputDeviceUID:details:queue:completion:]");
  id v17 = [v14 exceptionWithName:v15 reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  v14 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v15 = *MEMORY[0x1E4F1C3B8];
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice adjustOutputDeviceVolume:outputDeviceUID:details:queue:completion:]");
  id v17 = [v14 exceptionWithName:v15 reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  v14 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v15 = *MEMORY[0x1E4F1C3B8];
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice muteOutputDeviceVolume:outputDeviceUID:details:queue:completion:]");
  id v17 = [v14 exceptionWithName:v15 reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v14 = *MEMORY[0x1E4F1C3B8];
  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setListeningMode:outputDeviceUID:queue:completion:]");
  id v16 = [v13 exceptionWithName:v14 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setConversationDetectionEnabled:outputDeviceUID:queue:completion:]");
  id v14 = [v11 exceptionWithName:v12 reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v11 = *MEMORY[0x1E4F1C3B8];
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice modifyTopologyWithRequest:withReplyQueue:completion:]");
  id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v11 = *MEMORY[0x1E4F1C3B8];
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice createHostedEndpointWithOutputDeviceUIDs:queue:completion:]");
  id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)sendButtonEvent:(_MRHIDButtonEvent)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", *(void *)&a3.var2, "-[MRExternalDevice sendButtonEvent:]");
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)sendCustomData:(id)a3 withName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice sendCustomData:withName:]");
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice ping:callback:withQueue:]");
  id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (id)errorForCurrentState
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice errorForCurrentState]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (id)currentClientUpdatesConfigMessage
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice currentClientUpdatesConfigMessage]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)sendClientUpdatesConfigMessage
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice sendClientUpdatesConfigMessage]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)updateDesignatedGroupLeader:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice updateDesignatedGroupLeader:]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)disconnectWhenUndiscoverable
{
  return 0;
}

- (void)connectWithOptions:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"MRExternalDeviceConnectionReasonUserInfoKey";
  v7[0] = @"Deprecated";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(MRExternalDevice *)self connectWithOptions:v3 userInfo:v5];
}

- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4
{
}

- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice connectWithOptions:userInfo:completion:]");
  id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (BOOL)supportsIdleDisconnection
{
  return 1;
}

- (BOOL)supportsExternalDiscovery
{
  v2 = [(MRExternalDevice *)self supportedMessages];
  char v3 = [v2 isSupported:109];

  return v3;
}

- (BOOL)isConnected
{
  return [(MRExternalDevice *)self connectionState] == 2;
}

- (BOOL)supportsDesignatedGroupLeaderUpdates
{
  return 0;
}

- (id)registerDiscoveryTokenForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSNumber numberWithUnsignedInt:arc4random()];
  id v6 = self;
  objc_sync_enter(v6);
  discoveryConfigurations = v6->_discoveryConfigurations;
  if (!discoveryConfigurations)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = v6->_discoveryConfigurations;
    v6->_discoveryConfigurations = v8;

    discoveryConfigurations = v6->_discoveryConfigurations;
  }
  [(NSMutableDictionary *)discoveryConfigurations setObject:v4 forKeyedSubscript:v5];
  objc_sync_exit(v6);

  return v5;
}

- (void)setDiscoveryMode:(unsigned int)a3 forToken:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v11 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  if (!v6->_discoveryModes)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    discoveryModes = v6->_discoveryModes;
    v6->_discoveryModes = v7;
  }
  uint64_t v9 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMutableDictionary *)v6->_discoveryModes setObject:v9 forKeyedSubscript:v11];

  id v10 = [(NSMutableDictionary *)v6->_discoveryConfigurations objectForKeyedSubscript:v11];
  -[MRExternalDevice setDiscoveryMode:forConfiguration:](v6, "setDiscoveryMode:forConfiguration:", -[MRExternalDevice _highestDiscoveryModeForConfiguration:]((uint64_t)v6, v10), v10);

  objc_sync_exit(v6);
}

- (uint64_t)_highestDiscoveryModeForConfiguration:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    int v13 = 0;
    uint64_t v5 = *(void **)(a1 + 24);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __58__MRExternalDevice__highestDiscoveryModeForConfiguration___block_invoke;
    v7[3] = &unk_1E57D45C8;
    v7[4] = a1;
    id v8 = v3;
    uint64_t v9 = &v10;
    [v5 enumerateKeysAndObjectsUsingBlock:v7];
    a1 = *((unsigned int *)v11 + 6);

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDevice setDiscoveryMode:forConfiguration:]");
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)setDiscoveryOutputDevicesChangedCallback:(id)a3 forToken:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = v13;
  if (!v7->_discoveryOutputDevicesCallbacks)
  {
    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    discoveryOutputDevicesCallbacks = v7->_discoveryOutputDevicesCallbacks;
    v7->_discoveryOutputDevicesCallbacks = v9;

    id v8 = v13;
  }
  id v11 = (void *)[v8 copy];
  uint64_t v12 = (void *)MEMORY[0x1997190F0]();
  [(NSMutableDictionary *)v7->_discoveryOutputDevicesCallbacks setObject:v12 forKeyedSubscript:v6];

  objc_sync_exit(v7);
}

- (void)unregisterDiscoveryToken:(id)a3
{
  id v5 = a3;
  [(MRExternalDevice *)self setDiscoveryMode:0 forToken:v5];
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_discoveryOutputDevicesCallbacks setObject:0 forKeyedSubscript:v5];
  [(NSMutableDictionary *)v4->_discoveryConfigurations setObject:0 forKeyedSubscript:v5];
  [(NSMutableDictionary *)v4->_discoveryModes setObject:0 forKeyedSubscript:v5];
  objc_sync_exit(v4);
}

- (void)notifyDiscoveryOutputDevicesChanged:(id)a3 forConfiguration:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = self;
  objc_sync_enter(v9);
  discoveryOutputDevicesCallbacks = v9->_discoveryOutputDevicesCallbacks;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__MRExternalDevice_notifyDiscoveryOutputDevicesChanged_forConfiguration___block_invoke;
  v21[3] = &unk_1E57D4578;
  v21[4] = v9;
  id v11 = v7;
  id v22 = v11;
  id v12 = v8;
  id v23 = v12;
  [(NSMutableDictionary *)discoveryOutputDevicesCallbacks enumerateKeysAndObjectsUsingBlock:v21];

  objc_sync_exit(v9);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v16) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * v16));
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v14);
  }
}

void __73__MRExternalDevice_notifyDiscoveryOutputDevicesChanged_forConfiguration___block_invoke(void *a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = *(void **)(a1[4] + 16);
  id v6 = a2;
  id v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:v6];

  int v9 = [v8 intValue];
  if ([v7 isEqual:a1[5]]) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    id v11 = (void *)a1[6];
    id v12 = (void *)MEMORY[0x1997190F0](v13);
    [v11 addObject:v12];
  }
}

- (id)discoveryDescription
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = [(NSMutableDictionary *)v2->_discoveryConfigurations allValues];
  id v6 = (void *)[v4 initWithArray:v5];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __40__MRExternalDevice_discoveryDescription__block_invoke;
  id v13 = &unk_1E57D45A0;
  uint64_t v14 = v2;
  id v7 = v3;
  id v15 = v7;
  [v6 enumerateObjectsUsingBlock:&v10];
  id v8 = [v7 componentsJoinedByString:@", ", v10, v11, v12, v13, v14];

  objc_sync_exit(v2);

  return v8;
}

void __40__MRExternalDevice_discoveryDescription__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  LODWORD(v3) = -[MRExternalDevice _highestDiscoveryModeForConfiguration:](v3, v4);
  char v5 = [v4 features];

  MRMediaRemoteEndpointFeaturesDescription(v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (__CFString *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v3);
  id v7 = (void *)[[NSString alloc] initWithFormat:@"%@: %@", v8, v6];
  [*(id *)(a1 + 40) addObject:v7];
}

void __58__MRExternalDevice__highestDiscoveryModeForConfiguration___block_invoke(void *a1, uint64_t a2, void *a3)
{
  char v5 = *(void **)(a1[4] + 16);
  id v6 = a3;
  id v9 = [v5 objectForKeyedSubscript:a2];
  unsigned int v7 = [v6 intValue];

  if ([v9 isEqual:a1[5]])
  {
    uint64_t v8 = *(void *)(a1[6] + 8);
    if (v7 > *(_DWORD *)(v8 + 24)) {
      *(_DWORD *)(v8 + 24) = v7;
    }
  }
}

- (NSArray)personalOutputDevices
{
  return self->_personalOutputDevices;
}

- (BOOL)wantsEndpointChangeNotifications
{
  return self->_wantsEndpointChangeNotifications;
}

- (void)setWantsEndpointChangeNotifications:(BOOL)a3
{
  self->_wantsEndpointChangeNotifications = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (unsigned)connectionState
{
  return self->_connectionState;
}

- (void)setUsingSystemPairing:(BOOL)a3
{
  self->_usingSystemPairing = a3;
}

- (int64_t)connectionRecoveryBehavior
{
  return self->_connectionRecoveryBehavior;
}

- (void)setConnectionRecoveryBehavior:(int64_t)a3
{
  self->_connectionRecoveryBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalOutputDevices, 0);
  objc_storeStrong((id *)&self->_discoveryModes, 0);
  objc_storeStrong((id *)&self->_discoveryConfigurations, 0);

  objc_storeStrong((id *)&self->_discoveryOutputDevicesCallbacks, 0);
}

@end