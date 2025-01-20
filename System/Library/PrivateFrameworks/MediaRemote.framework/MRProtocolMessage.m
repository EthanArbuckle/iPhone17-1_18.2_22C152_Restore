@interface MRProtocolMessage
+ (id)protocolMessageWithProtobufData:(id)a3 error:(id *)a4;
+ (unint64_t)currentProtocolVersion;
- (BOOL)isIncomingReply;
- (BOOL)isOutgoingReply;
- (BOOL)reply;
- (BOOL)replyWithMessage:(id)a3;
- (BOOL)shouldLog;
- (BOOL)shouldVerboselyLog;
- (MRProtocolClientConnection)clientConnection;
- (MRProtocolMessage)init;
- (MRProtocolMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4;
- (MRProtocolMessageOptions)transportOptions;
- (NSData)protobufData;
- (NSError)error;
- (NSString)description;
- (NSString)replyIdentifier;
- (NSString)uniqueIdentifier;
- (PBCodable)underlyingCodableMessage;
- (unint64_t)encryptionType;
- (unint64_t)timestamp;
- (unint64_t)type;
- (void)dealloc;
- (void)setClientConnection:(id)a3;
- (void)setError:(id)a3;
- (void)setIsIncomingReply:(BOOL)a3;
- (void)setIsOutgoingReply:(BOOL)a3;
- (void)setReplyIdentifier:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTransportOptions:(id)a3;
- (void)setUnderlyingCodableMessage:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation MRProtocolMessage

- (void)setUnderlyingCodableMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientConnection);
  objc_storeStrong((id *)&self->_transportOptions, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_replyIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_underlyingCodableMessage, 0);

  objc_storeStrong((id *)&self->_protobufData, 0);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (MRProtocolClientConnection)clientConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);

  return (MRProtocolClientConnection *)WeakRetained;
}

- (NSError)error
{
  return self->_error;
}

+ (id)protocolMessageWithProtobufData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint8_t v6 = [[_MRMediaRemoteMessageProtobuf alloc] initWithData:v5];

  if (v6)
  {
    v7 = 0;
    v8 = 0;
    switch([(_MRMediaRemoteMessageProtobuf *)v6 type])
    {
      case 0:
      case 3:
      case 9:
      case 0x89:
        v7 = (objc_class *)objc_opt_class();
        v8 = 0;
        break;
      case 1:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 sendCommandMessage];
        goto LABEL_100;
      case 2:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 sendCommandResultMessage];
        goto LABEL_100;
      case 4:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 setStateMessage];
        goto LABEL_100;
      case 5:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 setArtworkMessage];
        goto LABEL_100;
      case 6:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 registerHIDDeviceMessage];
        goto LABEL_100;
      case 7:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 registerHIDDeviceResultMessage];
        goto LABEL_100;
      case 8:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 sendHIDEventMessage];
        goto LABEL_100;
      case 0xA:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 sendVirtualTouchEventMessage];
        goto LABEL_100;
      case 0xB:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 notificationMessage];
        goto LABEL_100;
      case 0xF:
      case 0x25:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 deviceInfoMessage];
        goto LABEL_100;
      case 0x10:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 clientUpdatesConfigMessage];
        goto LABEL_100;
      case 0x11:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 masterVolumeControlCapabilitiesDidChangeMessage];
        goto LABEL_100;
      case 0x12:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 gameController];
        goto LABEL_100;
      case 0x13:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 registerGameController];
        goto LABEL_100;
      case 0x14:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 registerGameControllerResponse];
        goto LABEL_100;
      case 0x15:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 unregisterGameController];
        goto LABEL_100;
      case 0x16:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 registerForGameControllerEvents];
        goto LABEL_100;
      case 0x17:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 keyboardMessage];
        goto LABEL_100;
      case 0x18:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 getKeyboardMessage];
        goto LABEL_100;
      case 0x19:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 textInputMessage];
        goto LABEL_100;
      case 0x1A:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 getVoiceInputDevicesMessage];
        goto LABEL_100;
      case 0x1B:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 getVoiceInputDevicesResponseMessage];
        goto LABEL_100;
      case 0x1C:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 registerVoiceInputDeviceMessage];
        goto LABEL_100;
      case 0x1D:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 registerVoiceInputDeviceResponseMessage];
        goto LABEL_100;
      case 0x1E:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 setRecordingStateMessage];
        goto LABEL_100;
      case 0x1F:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 sendVoiceInputMessage];
        goto LABEL_100;
      case 0x20:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 playbackQueueRequest];
        goto LABEL_100;
      case 0x21:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 transactionPackets];
        goto LABEL_100;
      case 0x22:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 cryptoPairingMessage];
        goto LABEL_100;
      case 0x23:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 gameControllerProperties];
        goto LABEL_100;
      case 0x24:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 readyStateMessage];
        goto LABEL_100;
      case 0x26:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 connectionState];
        goto LABEL_100;
      case 0x27:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 sendButtonEventMessage];
        goto LABEL_100;
      case 0x28:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 setHiliteModeMessage];
        goto LABEL_100;
      case 0x29:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 wakeDeviceMessage];
        goto LABEL_100;
      case 0x2A:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 genericMessage];
        goto LABEL_100;
      case 0x2B:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 sendPackedVirtualTouchEventMessage];
        goto LABEL_100;
      case 0x2C:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 sendLyricsEventMessage];
        goto LABEL_100;
      case 0x2E:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 setNowPlayingClientMessage];
        goto LABEL_100;
      case 0x2F:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 setNowPlayingPlayerMessage];
        goto LABEL_100;
      case 0x30:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 modifyOutputContextRequestMessage];
        goto LABEL_100;
      case 0x31:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 getVolumeMessage];
        goto LABEL_100;
      case 0x32:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 getVolumeResultMessage];
        goto LABEL_100;
      case 0x33:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 setVolumeMessage];
        goto LABEL_100;
      case 0x34:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 volumeDidChangeMessage];
        goto LABEL_100;
      case 0x35:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 removeClientMessage];
        goto LABEL_100;
      case 0x36:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 removePlayerMessage];
        goto LABEL_100;
      case 0x37:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 updateClientMessage];
        goto LABEL_100;
      case 0x38:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 updateContentItemMessage];
        goto LABEL_100;
      case 0x39:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 updateContentItemArtworkMessage];
        goto LABEL_100;
      case 0x3A:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 updatePlayerMessage];
        goto LABEL_100;
      case 0x3B:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 promptForRouteAuthorizationMessage];
        goto LABEL_100;
      case 0x3C:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 promptForRouteAuthorizationResponseMessage];
        goto LABEL_100;
      case 0x3D:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 presentRouteAuthorizationStatusMessage];
        goto LABEL_100;
      case 0x3E:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 getVolumeControlCapabilitiesMessage];
        goto LABEL_100;
      case 0x3F:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 getVolumeControlCapabilitiesResultMessage];
        goto LABEL_100;
      case 0x40:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 volumeControlCapabilitiesDidChangeMessage];
        goto LABEL_100;
      case 0x41:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 updateOutputDevicesMessage];
        goto LABEL_100;
      case 0x42:
      case 0x45:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 removeOutputDevicesMessage];
        goto LABEL_100;
      case 0x43:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 remoteTextInputMessage];
        goto LABEL_100;
      case 0x44:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 getRemoteTextInputSessionMessage];
        goto LABEL_100;
      case 0x46:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 playbackSessionRequestMessage];
        goto LABEL_100;
      case 0x47:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 playbackSessionResponseMessage];
        goto LABEL_100;
      case 0x48:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 setDefaultSupportedCommandsMessage];
        goto LABEL_100;
      case 0x49:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 playbackSessionMigrateRequestMessage];
        goto LABEL_100;
      case 0x4A:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 playbackSessionMigrateResponseMessage];
        goto LABEL_100;
      case 0x4B:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 playbackSessionMigrateBeginMessage];
        goto LABEL_100;
      case 0x4C:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 playbackSessionMigrateEndMessage];
        goto LABEL_100;
      case 0x4D:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 updateActiveSystemEndpointMessage];
        goto LABEL_100;
      case 0x65:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 discoveryModeMessage];
        goto LABEL_100;
      case 0x66:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 updateEndpointsMessage];
        goto LABEL_100;
      case 0x67:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 removeEndpointsMessage];
        goto LABEL_100;
      case 0x68:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 playerClientPropertiesMessage];
        goto LABEL_100;
      case 0x69:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 originClientPropertiesMessage];
        goto LABEL_100;
      case 0x6A:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 audioFadeMessage];
        goto LABEL_100;
      case 0x6B:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 audioFadeResponseMessage];
        goto LABEL_100;
      case 0x6C:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 discoveryUpdateEndpointsMessage];
        goto LABEL_100;
      case 0x6D:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 discoveryUpdateOutputDevicesMessage];
        goto LABEL_100;
      case 0x6E:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 setListeningModeMessage];
        goto LABEL_100;
      case 0x78:
      case 0x85:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 configureConnectionMessage];
        goto LABEL_100;
      case 0x79:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 createHostedEndpointRequest];
        goto LABEL_100;
      case 0x7A:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 createHostedEndpointResponse];
        goto LABEL_100;
      case 0x7D:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 adjustVolumeMessage];
        goto LABEL_100;
      case 0x7E:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 getVolumeMutedMessage];
        goto LABEL_100;
      case 0x7F:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 getVolumeMutedResultMessage];
        goto LABEL_100;
      case 0x80:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 setVolumeMutedMessage];
        goto LABEL_100;
      case 0x81:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 volumeMutedDidChangeMessage];
        goto LABEL_100;
      case 0x82:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 setConversationDetectionEnabledMessage];
        goto LABEL_100;
      case 0x83:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 playerClientParticipantsUpdateMessage];
        goto LABEL_100;
      case 0x84:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 requestGroupSessionMessage];
        goto LABEL_100;
      case 0x86:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 createApplicationConnectionMessage];
        goto LABEL_100;
      case 0x87:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 applicationConnectionProtocolMessage];
        goto LABEL_100;
      case 0x88:
        v7 = (objc_class *)objc_opt_class();
        uint64_t v10 = [(_MRMediaRemoteMessageProtobuf *)v6 invalidateApplicationConnectionMessage];
LABEL_100:
        v8 = (void *)v10;
        break;
      default:
        break;
    }
    if ([(_MRMediaRemoteMessageProtobuf *)v6 hasError]
      && ([(_MRMediaRemoteMessageProtobuf *)v6 error],
          v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 code],
          v11,
          v12))
    {
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      v14 = [(_MRMediaRemoteMessageProtobuf *)v6 error];
      v15 = objc_msgSend(v13, "mr_initWithProtobuf:", v14);
    }
    else
    {
      if (![(_MRMediaRemoteMessageProtobuf *)v6 errorCode])
      {
        v15 = 0;
        goto LABEL_108;
      }
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v17 = [(_MRMediaRemoteMessageProtobuf *)v6 errorCode];
      id v13 = [(_MRMediaRemoteMessageProtobuf *)v6 errorDescription];
      v15 = (void *)[v16 initWithMRError:v17 description:v13];
    }

LABEL_108:
    v9 = (void *)[[v7 alloc] initWithUnderlyingCodableMessage:v8 error:v15];
    objc_msgSend(v9, "setTimestamp:", -[_MRMediaRemoteMessageProtobuf timestamp](v6, "timestamp"));
    v18 = [(_MRMediaRemoteMessageProtobuf *)v6 replyIdentifier];
    [v9 setReplyIdentifier:v18];

    v19 = [(_MRMediaRemoteMessageProtobuf *)v6 uniqueIdentifier];
    [v9 setUniqueIdentifier:v19];

    goto LABEL_109;
  }
  v9 = 0;
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:2 format:@"Message is corrupted."];
  }
LABEL_109:

  return v9;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (void)setReplyIdentifier:(id)a3
{
}

- (NSData)protobufData
{
  protobufData = self->_protobufData;
  if (!protobufData)
  {
    unint64_t v5 = [(MRProtocolMessage *)self type];
    if (!v5)
    {
      uint64_t v6 = objc_opt_class();
      if (v6 != objc_opt_class())
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:self file:@"MRProtocolMessage.m" lineNumber:634 description:@"Message does not have a valid type. Did you forget to implement the type method?"];
      }
    }
    v7 = [(MRProtocolMessage *)self underlyingCodableMessage];
    v8 = objc_alloc_init(_MRMediaRemoteMessageProtobuf);
    [(_MRMediaRemoteMessageProtobuf *)v8 setType:v5];
    v9 = [(MRProtocolMessage *)self replyIdentifier];
    [(_MRMediaRemoteMessageProtobuf *)v8 setReplyIdentifier:v9];

    uint64_t v10 = [(MRProtocolMessage *)self uniqueIdentifier];
    [(_MRMediaRemoteMessageProtobuf *)v8 setUniqueIdentifier:v10];

    unint64_t v11 = [(MRProtocolMessage *)self timestamp];
    if (v11) {
      [(_MRMediaRemoteMessageProtobuf *)v8 setTimestamp:(unint64_t)(MRTimeUtilitiesGetProcessorTimeScale() * (double)v11)];
    }
    error = self->_error;
    if (error)
    {
      id v13 = [(NSError *)error domain];
      int v14 = [v13 isEqualToString:@"kMRMediaRemoteFrameworkErrorDomain"];

      if (v14)
      {
        v15 = [(NSError *)self->_error mr_protobuf];
        [(_MRMediaRemoteMessageProtobuf *)v8 setError:v15];

        [(_MRMediaRemoteMessageProtobuf *)v8 setErrorCode:[(NSError *)self->_error code]];
        id v16 = [(NSError *)self->_error localizedDescription];
        [(_MRMediaRemoteMessageProtobuf *)v8 setErrorDescription:v16];
      }
    }
    switch(v5)
    {
      case 1uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSendCommandMessage:v7];
        break;
      case 2uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSendCommandResultMessage:v7];
        break;
      case 3uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGetStateMessage:v7];
        break;
      case 4uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSetStateMessage:v7];
        break;
      case 5uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSetArtworkMessage:v7];
        break;
      case 6uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRegisterHIDDeviceMessage:v7];
        break;
      case 7uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRegisterHIDDeviceResultMessage:v7];
        break;
      case 8uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSendHIDEventMessage:v7];
        break;
      case 0xAuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSendVirtualTouchEventMessage:v7];
        break;
      case 0xBuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setNotificationMessage:v7];
        break;
      case 0xFuLL:
      case 0x25uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setDeviceInfoMessage:v7];
        break;
      case 0x10uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setClientUpdatesConfigMessage:v7];
        break;
      case 0x11uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setMasterVolumeControlCapabilitiesDidChangeMessage:v7];
        break;
      case 0x12uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGameController:v7];
        break;
      case 0x13uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRegisterGameController:v7];
        break;
      case 0x14uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRegisterGameControllerResponse:v7];
        break;
      case 0x15uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setUnregisterGameController:v7];
        break;
      case 0x16uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRegisterForGameControllerEvents:v7];
        break;
      case 0x17uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setKeyboardMessage:v7];
        break;
      case 0x18uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGetKeyboardMessage:v7];
        break;
      case 0x19uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setTextInputMessage:v7];
        break;
      case 0x1AuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGetVoiceInputDevicesMessage:v7];
        break;
      case 0x1BuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGetVoiceInputDevicesResponseMessage:v7];
        break;
      case 0x1CuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRegisterVoiceInputDeviceMessage:v7];
        break;
      case 0x1DuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRegisterVoiceInputDeviceResponseMessage:v7];
        break;
      case 0x1EuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSetRecordingStateMessage:v7];
        break;
      case 0x1FuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSendVoiceInputMessage:v7];
        break;
      case 0x20uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setPlaybackQueueRequest:v7];
        break;
      case 0x21uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setTransactionPackets:v7];
        break;
      case 0x22uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setCryptoPairingMessage:v7];
        break;
      case 0x23uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGameControllerProperties:v7];
        break;
      case 0x24uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setReadyStateMessage:v7];
        break;
      case 0x26uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setConnectionState:v7];
        break;
      case 0x27uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSendButtonEventMessage:v7];
        break;
      case 0x28uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSetHiliteModeMessage:v7];
        break;
      case 0x29uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setWakeDeviceMessage:v7];
        break;
      case 0x2AuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGenericMessage:v7];
        break;
      case 0x2BuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSendPackedVirtualTouchEventMessage:v7];
        break;
      case 0x2CuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSendLyricsEventMessage:v7];
        break;
      case 0x2EuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSetNowPlayingClientMessage:v7];
        break;
      case 0x2FuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSetNowPlayingPlayerMessage:v7];
        break;
      case 0x30uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setModifyOutputContextRequestMessage:v7];
        break;
      case 0x31uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGetVolumeMessage:v7];
        break;
      case 0x32uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGetVolumeResultMessage:v7];
        break;
      case 0x33uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSetVolumeMessage:v7];
        break;
      case 0x34uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setVolumeDidChangeMessage:v7];
        break;
      case 0x35uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRemoveClientMessage:v7];
        break;
      case 0x36uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRemovePlayerMessage:v7];
        break;
      case 0x37uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setUpdateClientMessage:v7];
        break;
      case 0x38uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setUpdateContentItemMessage:v7];
        break;
      case 0x39uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setUpdateContentItemArtworkMessage:v7];
        break;
      case 0x3AuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setUpdatePlayerMessage:v7];
        break;
      case 0x3BuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setPromptForRouteAuthorizationMessage:v7];
        break;
      case 0x3CuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setPromptForRouteAuthorizationResponseMessage:v7];
        break;
      case 0x3DuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setPresentRouteAuthorizationStatusMessage:v7];
        break;
      case 0x3EuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGetVolumeControlCapabilitiesMessage:v7];
        break;
      case 0x3FuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGetVolumeControlCapabilitiesResultMessage:v7];
        break;
      case 0x40uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setVolumeControlCapabilitiesDidChangeMessage:v7];
        break;
      case 0x41uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setUpdateOutputDevicesMessage:v7];
        break;
      case 0x42uLL:
      case 0x45uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRemoveOutputDevicesMessage:v7];
        break;
      case 0x43uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRemoteTextInputMessage:v7];
        break;
      case 0x44uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGetRemoteTextInputSessionMessage:v7];
        break;
      case 0x46uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setPlaybackSessionRequestMessage:v7];
        break;
      case 0x47uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setPlaybackSessionResponseMessage:v7];
        break;
      case 0x48uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSetDefaultSupportedCommandsMessage:v7];
        break;
      case 0x49uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setPlaybackSessionMigrateRequestMessage:v7];
        break;
      case 0x4AuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setPlaybackSessionMigrateResponseMessage:v7];
        break;
      case 0x4BuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setPlaybackSessionMigrateBeginMessage:v7];
        break;
      case 0x4CuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setPlaybackSessionMigrateEndMessage:v7];
        break;
      case 0x4DuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setUpdateActiveSystemEndpointMessage:v7];
        break;
      case 0x65uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setDiscoveryModeMessage:v7];
        break;
      case 0x66uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setUpdateEndpointsMessage:v7];
        break;
      case 0x67uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRemoveEndpointsMessage:v7];
        break;
      case 0x68uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setPlayerClientPropertiesMessage:v7];
        break;
      case 0x69uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setOriginClientPropertiesMessage:v7];
        break;
      case 0x6AuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setAudioFadeMessage:v7];
        break;
      case 0x6BuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setAudioFadeResponseMessage:v7];
        break;
      case 0x6CuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setDiscoveryUpdateEndpointsMessage:v7];
        break;
      case 0x6DuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setDiscoveryUpdateOutputDevicesMessage:v7];
        break;
      case 0x6EuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSetListeningModeMessage:v7];
        break;
      case 0x78uLL:
      case 0x85uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setConfigureConnectionMessage:v7];
        break;
      case 0x79uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setCreateHostedEndpointRequest:v7];
        break;
      case 0x7AuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setCreateHostedEndpointResponse:v7];
        break;
      case 0x7DuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setAdjustVolumeMessage:v7];
        break;
      case 0x7EuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGetVolumeMutedMessage:v7];
        break;
      case 0x7FuLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setGetVolumeMutedResultMessage:v7];
        break;
      case 0x80uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSetVolumeMutedMessage:v7];
        break;
      case 0x81uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setVolumeMutedDidChangeMessage:v7];
        break;
      case 0x82uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setSetConversationDetectionEnabledMessage:v7];
        break;
      case 0x83uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setPlayerClientParticipantsUpdateMessage:v7];
        break;
      case 0x84uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setRequestGroupSessionMessage:v7];
        break;
      case 0x86uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setCreateApplicationConnectionMessage:v7];
        break;
      case 0x87uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setApplicationConnectionProtocolMessage:v7];
        break;
      case 0x88uLL:
        [(_MRMediaRemoteMessageProtobuf *)v8 setInvalidateApplicationConnectionMessage:v7];
        break;
      default:
        break;
    }
    uint64_t v17 = [(_MRMediaRemoteMessageProtobuf *)v8 data];
    v18 = self->_protobufData;
    self->_protobufData = v17;

    protobufData = self->_protobufData;
  }

  return protobufData;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)replyIdentifier
{
  return self->_replyIdentifier;
}

- (MRProtocolMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(MRProtocolMessage *)self init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_underlyingCodableMessage, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (MRProtocolMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)MRProtocolMessage;
  uint64_t v2 = [(MRProtocolMessage *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    uniqueIdentifier = v2->_uniqueIdentifier;
    v2->_uniqueIdentifier = (NSString *)v4;
  }
  return v2;
}

- (PBCodable)underlyingCodableMessage
{
  return self->_underlyingCodableMessage;
}

- (BOOL)replyWithMessage:(id)a3
{
  uint64_t v4 = (MRProtocolMessage *)a3;
  unint64_t v5 = [(MRProtocolMessage *)self clientConnection];
  if (!v5)
  {
    uint64_t v10 = _MRLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MRProtocolMessage replyWithMessage:]();
    }
    goto LABEL_10;
  }
  replyIdentifier = self->_replyIdentifier;
  if (!replyIdentifier)
  {
    uint64_t v10 = _MRLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MRProtocolMessage replyWithMessage:]();
    }
LABEL_10:

    BOOL v9 = 0;
    goto LABEL_11;
  }
  if (!v4)
  {
    objc_super v7 = [MRProtocolMessage alloc];
    Error = (void *)MRMediaRemoteCreateError(1);
    uint64_t v4 = [(MRProtocolMessage *)v7 initWithUnderlyingCodableMessage:0 error:Error];

    replyIdentifier = self->_replyIdentifier;
  }
  [(MRProtocolMessage *)v4 setReplyIdentifier:replyIdentifier];
  BOOL v9 = 1;
  [(MRProtocolMessage *)v4 setIsOutgoingReply:1];
  [v5 sendMessage:v4];
  self->_replied = 1;
LABEL_11:

  return v9;
}

+ (unint64_t)currentProtocolVersion
{
  return 1;
}

- (NSString)description
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"\n<%@, ", objc_opt_class()];
  if ([(MRProtocolMessage *)self timestamp]) {
    [v3 appendFormat:@"Timestamp=<%llu>, ", -[MRProtocolMessage timestamp](self, "timestamp")];
  }
  uint64_t v4 = [(MRProtocolMessage *)self error];

  if (v4)
  {
    unint64_t v5 = [(MRProtocolMessage *)self error];
    [v3 appendFormat:@"Error=<%@>, ", v5];
  }
  uint64_t v6 = [(MRProtocolMessage *)self uniqueIdentifier];

  if (v6)
  {
    objc_super v7 = [(MRProtocolMessage *)self uniqueIdentifier];
    [v3 appendFormat:@"UniqueIdentifier=<%@>, ", v7];
  }
  id v8 = [(MRProtocolMessage *)self replyIdentifier];

  if (v8)
  {
    BOOL v9 = [(MRProtocolMessage *)self replyIdentifier];
    [v3 appendFormat:@"ReplyIdentifier=<%@> ", v9];
  }
  if (MSVDeviceOSIsInternalInstall())
  {
    uint64_t v10 = [(MRProtocolMessage *)self underlyingCodableMessage];
    [v3 appendFormat:@"\nMessage: %@\n", v10];
  }
  else
  {
    [v3 appendString:@"\nMessage: REDACTED\n"];
  }
  [v3 appendFormat:@">"];

  return (NSString *)v3;
}

- (unint64_t)encryptionType
{
  return 1;
}

- (unint64_t)type
{
  return 0;
}

- (BOOL)shouldLog
{
  return 1;
}

- (BOOL)shouldVerboselyLog
{
  return 0;
}

- (BOOL)reply
{
  return [(MRProtocolMessage *)self replyWithMessage:0];
}

- (void)setError:(id)a3
{
}

- (MRProtocolMessageOptions)transportOptions
{
  return self->_transportOptions;
}

- (void)setTransportOptions:(id)a3
{
}

- (void)setClientConnection:(id)a3
{
}

- (BOOL)isIncomingReply
{
  return self->_isIncomingReply;
}

- (void)setIsIncomingReply:(BOOL)a3
{
  self->_isIncomingReply = a3;
}

- (BOOL)isOutgoingReply
{
  return self->_isOutgoingReply;
}

- (void)setIsOutgoingReply:(BOOL)a3
{
  self->_isOutgoingReply = a3;
}

- (void)replyWithMessage:.cold.1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "Could not send reply message because there is no client %{public}@ ", v2, v3, v4, v5, v6);
}

- (void)replyWithMessage:.cold.2()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "Could not send reply because the message was not expecting a reply: %{public}@ ", v2, v3, v4, v5, v6);
}

@end