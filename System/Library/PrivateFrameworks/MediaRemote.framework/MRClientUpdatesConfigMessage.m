@interface MRClientUpdatesConfigMessage
- (BOOL)artworkUpdates;
- (BOOL)keyboardUpdates;
- (BOOL)nowPlayingUpdates;
- (BOOL)outputDeviceUpdates;
- (BOOL)systemEndpointUpdates;
- (BOOL)volumeUpdates;
- (MRClientUpdatesConfigMessage)initWithNowPlayingUpdates:(BOOL)a3 artworkUpdates:(BOOL)a4 volumeUpdates:(BOOL)a5 keyboardUpdates:(BOOL)a6 outputDeviceUpdates:(BOOL)a7 systemEndpointUpdates:(BOOL)a8 subscribedPlayerPaths:(id)a9;
- (MRClientUpdatesConfigMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4;
- (NSArray)subscribedPlayerPaths;
- (unint64_t)type;
- (void)setSubscribedPlayerPaths:(id)a3;
@end

@implementation MRClientUpdatesConfigMessage

- (MRClientUpdatesConfigMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MRClientUpdatesConfigMessage;
  v7 = [(MRProtocolMessage *)&v19 initWithUnderlyingCodableMessage:v6 error:a4];
  if (v7)
  {
    v8 = [v6 subscribedPlayerPaths];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v10 = [v6 subscribedPlayerPaths];
      uint64_t v11 = objc_msgSend(v10, "mr_map:", &__block_literal_global_0);
      subscribedPlayerPaths = v7->_subscribedPlayerPaths;
      v7->_subscribedPlayerPaths = (NSArray *)v11;
    }
    else
    {
      v13 = [MRPlayerPath alloc];
      v10 = +[MROrigin localOrigin];
      subscribedPlayerPaths = +[MRClient anyClient];
      v14 = +[MRPlayer anyPlayer];
      v15 = [(MRPlayerPath *)v13 initWithOrigin:v10 client:subscribedPlayerPaths player:v14];
      v20[0] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      v17 = v7->_subscribedPlayerPaths;
      v7->_subscribedPlayerPaths = (NSArray *)v16;
    }
  }

  return v7;
}

MRPlayerPath *__71__MRClientUpdatesConfigMessage_initWithUnderlyingCodableMessage_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRPlayerPath alloc] initWithProtobuf:v2];

  return v3;
}

- (MRClientUpdatesConfigMessage)initWithNowPlayingUpdates:(BOOL)a3 artworkUpdates:(BOOL)a4 volumeUpdates:(BOOL)a5 keyboardUpdates:(BOOL)a6 outputDeviceUpdates:(BOOL)a7 systemEndpointUpdates:(BOOL)a8 subscribedPlayerPaths:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  BOOL v14 = a3;
  id v16 = a9;
  v24.receiver = self;
  v24.super_class = (Class)MRClientUpdatesConfigMessage;
  v17 = [(MRProtocolMessage *)&v24 init];
  if (v17)
  {
    uint64_t v18 = [v16 copy];
    subscribedPlayerPaths = v17->_subscribedPlayerPaths;
    v17->_subscribedPlayerPaths = (NSArray *)v18;

    v20 = objc_alloc_init(_MRClientUpdatesConfigurationProtobuf);
    [(_MRClientUpdatesConfigurationProtobuf *)v20 setNowPlayingUpdates:v14];
    [(_MRClientUpdatesConfigurationProtobuf *)v20 setArtworkUpdates:v13];
    [(_MRClientUpdatesConfigurationProtobuf *)v20 setVolumeUpdates:v12];
    [(_MRClientUpdatesConfigurationProtobuf *)v20 setKeyboardUpdates:v11];
    [(_MRClientUpdatesConfigurationProtobuf *)v20 setOutputDeviceUpdates:v10];
    [(_MRClientUpdatesConfigurationProtobuf *)v20 setSystemEndpointUpdates:v9];
    v21 = [(NSArray *)v17->_subscribedPlayerPaths mr_map:&__block_literal_global_10];
    v22 = (void *)[v21 mutableCopy];
    [(_MRClientUpdatesConfigurationProtobuf *)v20 setSubscribedPlayerPaths:v22];

    [(MRProtocolMessage *)v17 setUnderlyingCodableMessage:v20];
  }

  return v17;
}

uint64_t __167__MRClientUpdatesConfigMessage_initWithNowPlayingUpdates_artworkUpdates_volumeUpdates_keyboardUpdates_outputDeviceUpdates_systemEndpointUpdates_subscribedPlayerPaths___block_invoke(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

- (BOOL)nowPlayingUpdates
{
  id v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 nowPlayingUpdates];

  return v3;
}

- (BOOL)artworkUpdates
{
  id v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 artworkUpdates];

  return v3;
}

- (BOOL)volumeUpdates
{
  id v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 volumeUpdates];

  return v3;
}

- (BOOL)keyboardUpdates
{
  id v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 keyboardUpdates];

  return v3;
}

- (BOOL)outputDeviceUpdates
{
  id v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 outputDeviceUpdates];

  return v3;
}

- (BOOL)systemEndpointUpdates
{
  id v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 systemEndpointUpdates];

  return v3;
}

- (unint64_t)type
{
  return 16;
}

- (NSArray)subscribedPlayerPaths
{
  return self->_subscribedPlayerPaths;
}

- (void)setSubscribedPlayerPaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end