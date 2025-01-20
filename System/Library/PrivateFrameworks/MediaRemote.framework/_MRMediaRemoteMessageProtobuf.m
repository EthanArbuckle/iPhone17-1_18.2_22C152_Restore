@interface _MRMediaRemoteMessageProtobuf
- (BOOL)hasAdjustVolumeMessage;
- (BOOL)hasApplicationConnectionProtocolMessage;
- (BOOL)hasAudioFadeMessage;
- (BOOL)hasAudioFadeResponseMessage;
- (BOOL)hasAuthenticationToken;
- (BOOL)hasClientUpdatesConfigMessage;
- (BOOL)hasConfigureConnectionMessage;
- (BOOL)hasConnectionState;
- (BOOL)hasContentItemsChangedNotificationMessage;
- (BOOL)hasCreateApplicationConnectionMessage;
- (BOOL)hasCreateHostedEndpointRequest;
- (BOOL)hasCreateHostedEndpointResponse;
- (BOOL)hasCryptoPairingMessage;
- (BOOL)hasDeviceInfoMessage;
- (BOOL)hasDiscoveryModeMessage;
- (BOOL)hasDiscoveryUpdateEndpointsMessage;
- (BOOL)hasDiscoveryUpdateOutputDevicesMessage;
- (BOOL)hasError;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDescription;
- (BOOL)hasGameController;
- (BOOL)hasGameControllerProperties;
- (BOOL)hasGenericMessage;
- (BOOL)hasGetKeyboardMessage;
- (BOOL)hasGetRemoteTextInputSessionMessage;
- (BOOL)hasGetStateMessage;
- (BOOL)hasGetVoiceInputDevicesMessage;
- (BOOL)hasGetVoiceInputDevicesResponseMessage;
- (BOOL)hasGetVolumeControlCapabilitiesMessage;
- (BOOL)hasGetVolumeControlCapabilitiesResultMessage;
- (BOOL)hasGetVolumeMessage;
- (BOOL)hasGetVolumeMutedMessage;
- (BOOL)hasGetVolumeMutedResultMessage;
- (BOOL)hasGetVolumeResultMessage;
- (BOOL)hasInvalidateApplicationConnectionMessage;
- (BOOL)hasKeyboardMessage;
- (BOOL)hasMasterVolumeControlCapabilitiesDidChangeMessage;
- (BOOL)hasModifyOutputContextRequestMessage;
- (BOOL)hasNotificationMessage;
- (BOOL)hasOriginClientPropertiesMessage;
- (BOOL)hasPlaybackQueueRequest;
- (BOOL)hasPlaybackSessionMigrateBeginMessage;
- (BOOL)hasPlaybackSessionMigrateEndMessage;
- (BOOL)hasPlaybackSessionMigrateRequestMessage;
- (BOOL)hasPlaybackSessionMigrateResponseMessage;
- (BOOL)hasPlaybackSessionRequestMessage;
- (BOOL)hasPlaybackSessionResponseMessage;
- (BOOL)hasPlayerClientParticipantsUpdateMessage;
- (BOOL)hasPlayerClientPropertiesMessage;
- (BOOL)hasPresentRouteAuthorizationStatusMessage;
- (BOOL)hasPromptForRouteAuthorizationMessage;
- (BOOL)hasPromptForRouteAuthorizationResponseMessage;
- (BOOL)hasReadyStateMessage;
- (BOOL)hasRegisterForGameControllerEvents;
- (BOOL)hasRegisterGameController;
- (BOOL)hasRegisterGameControllerResponse;
- (BOOL)hasRegisterHIDDeviceMessage;
- (BOOL)hasRegisterHIDDeviceResultMessage;
- (BOOL)hasRegisterVoiceInputDeviceMessage;
- (BOOL)hasRegisterVoiceInputDeviceResponseMessage;
- (BOOL)hasRemoteTextInputMessage;
- (BOOL)hasRemoveClientMessage;
- (BOOL)hasRemoveEndpointsMessage;
- (BOOL)hasRemoveOutputDevicesMessage;
- (BOOL)hasRemovePlayerMessage;
- (BOOL)hasReplyIdentifier;
- (BOOL)hasRequestGroupSessionMessage;
- (BOOL)hasSendButtonEventMessage;
- (BOOL)hasSendCommandMessage;
- (BOOL)hasSendCommandResultMessage;
- (BOOL)hasSendHIDEventMessage;
- (BOOL)hasSendHIDReportMessage;
- (BOOL)hasSendLyricsEventMessage;
- (BOOL)hasSendPackedVirtualTouchEventMessage;
- (BOOL)hasSendVirtualTouchEventMessage;
- (BOOL)hasSendVoiceInputMessage;
- (BOOL)hasSetArtworkMessage;
- (BOOL)hasSetConversationDetectionEnabledMessage;
- (BOOL)hasSetDefaultSupportedCommandsMessage;
- (BOOL)hasSetHiliteModeMessage;
- (BOOL)hasSetListeningModeMessage;
- (BOOL)hasSetNowPlayingClientMessage;
- (BOOL)hasSetNowPlayingPlayerMessage;
- (BOOL)hasSetRecordingStateMessage;
- (BOOL)hasSetStateMessage;
- (BOOL)hasSetVolumeMessage;
- (BOOL)hasSetVolumeMutedMessage;
- (BOOL)hasTextInputMessage;
- (BOOL)hasTimestamp;
- (BOOL)hasTransactionPackets;
- (BOOL)hasType;
- (BOOL)hasUniqueIdentifier;
- (BOOL)hasUnregisterGameController;
- (BOOL)hasUpdateActiveSystemEndpointMessage;
- (BOOL)hasUpdateClientMessage;
- (BOOL)hasUpdateContentItemArtworkMessage;
- (BOOL)hasUpdateContentItemMessage;
- (BOOL)hasUpdateEndpointsMessage;
- (BOOL)hasUpdateOutputDevicesMessage;
- (BOOL)hasUpdatePlayerMessage;
- (BOOL)hasVolumeControlCapabilitiesDidChangeMessage;
- (BOOL)hasVolumeDidChangeMessage;
- (BOOL)hasVolumeMutedDidChangeMessage;
- (BOOL)hasWakeDeviceMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)authenticationToken;
- (NSString)errorDescription;
- (NSString)replyIdentifier;
- (NSString)uniqueIdentifier;
- (_MRAVModifyOutputContextRequestProtobuf)modifyOutputContextRequestMessage;
- (_MRAdjustVolumeMessageProtobuf)adjustVolumeMessage;
- (_MRApplicationConnectionContextProtobuf)invalidateApplicationConnectionMessage;
- (_MRApplicationConnectionProtocolMessageProtobuf)applicationConnectionProtocolMessage;
- (_MRAudioFadeMessageProtobuf)audioFadeMessage;
- (_MRAudioFadeResponseMessageProtobuf)audioFadeResponseMessage;
- (_MRClientUpdatesConfigurationProtobuf)clientUpdatesConfigMessage;
- (_MRConfigureConnectionMessageProtobuf)configureConnectionMessage;
- (_MRCreateApplicationConnectionMessageProtobuf)createApplicationConnectionMessage;
- (_MRCreateHostedEndpointRequestProtobuf)createHostedEndpointRequest;
- (_MRCreateHostedEndpointResponseProtobuf)createHostedEndpointResponse;
- (_MRCryptoPairingMessageProtobuf)cryptoPairingMessage;
- (_MRDeviceInfoMessageProtobuf)deviceInfoMessage;
- (_MRDiscoveryUpdateEndpointsProtobufMessage)discoveryUpdateEndpointsMessage;
- (_MRDiscoveryUpdateOutputDevicesProtobufMessage)discoveryUpdateOutputDevicesMessage;
- (_MRErrorProtobuf)error;
- (_MRGameControllerMessageProtobuf)gameController;
- (_MRGameControllerPropertiesMessageProtobuf)gameControllerProperties;
- (_MRGenericMessageProtobuf)genericMessage;
- (_MRGetKeyboardSessionProtobuf)getKeyboardMessage;
- (_MRGetRemoteTextInputSessionProtobuf)getRemoteTextInputSessionMessage;
- (_MRGetStateMessageProtobuf)getStateMessage;
- (_MRGetVoiceInputDevicesMessageProtobuf)getVoiceInputDevicesMessage;
- (_MRGetVoiceInputDevicesResponseMessageProtobuf)getVoiceInputDevicesResponseMessage;
- (_MRGetVolumeControlCapabilitiesMessageProtobuf)getVolumeControlCapabilitiesMessage;
- (_MRGetVolumeControlCapabilitiesResultMessageProtobuf)getVolumeControlCapabilitiesResultMessage;
- (_MRGetVolumeMessageProtobuf)getVolumeMessage;
- (_MRGetVolumeMutedMessageProtobuf)getVolumeMutedMessage;
- (_MRGetVolumeMutedResultMessageProtobuf)getVolumeMutedResultMessage;
- (_MRGetVolumeResultMessageProtobuf)getVolumeResultMessage;
- (_MRKeyboardMessageProtobuf)keyboardMessage;
- (_MRNotificationMessageProtobuf)notificationMessage;
- (_MROriginClientPropertiesMessageProtobuf)originClientPropertiesMessage;
- (_MRPlaybackQueueProtobuf)contentItemsChangedNotificationMessage;
- (_MRPlaybackQueueRequestProtobuf)playbackQueueRequest;
- (_MRPlaybackSessionMigrateBeginMessageProtobuf)playbackSessionMigrateBeginMessage;
- (_MRPlaybackSessionMigrateEndMessageProtobuf)playbackSessionMigrateEndMessage;
- (_MRPlaybackSessionMigrateRequestMessageProtobuf)playbackSessionMigrateRequestMessage;
- (_MRPlaybackSessionMigrateResponseMessageProtobuf)playbackSessionMigrateResponseMessage;
- (_MRPlaybackSessionRequestMessageProtobuf)playbackSessionRequestMessage;
- (_MRPlaybackSessionResponseMessageProtobuf)playbackSessionResponseMessage;
- (_MRPlayerClientParticipantsUpdateMessageProtobuf)playerClientParticipantsUpdateMessage;
- (_MRPlayerClientPropertiesMessageProtobuf)playerClientPropertiesMessage;
- (_MRPresentRouteAuthorizationStatusMessageProtobuf)presentRouteAuthorizationStatusMessage;
- (_MRPromptForRouteAuthorizationMessageProtobuf)promptForRouteAuthorizationMessage;
- (_MRPromptForRouteAuthorizationResponseMessageProtobuf)promptForRouteAuthorizationResponseMessage;
- (_MRRegisterForGameControllerEventsMessageProtobuf)registerForGameControllerEvents;
- (_MRRegisterGameControllerMessageProtobuf)registerGameController;
- (_MRRegisterGameControllerResponseMessageProtobuf)registerGameControllerResponse;
- (_MRRegisterHIDDeviceMessageProtobuf)registerHIDDeviceMessage;
- (_MRRegisterHIDDeviceResultMessageProtobuf)registerHIDDeviceResultMessage;
- (_MRRegisterVoiceInputDeviceMessageProtobuf)registerVoiceInputDeviceMessage;
- (_MRRegisterVoiceInputDeviceResponseMessageProtobuf)registerVoiceInputDeviceResponseMessage;
- (_MRRemoteTextInputMessageProtobuf)remoteTextInputMessage;
- (_MRRemoveClientMessageProtobuf)removeClientMessage;
- (_MRRemoveEndpointsMessageProtobuf)removeEndpointsMessage;
- (_MRRemoveOutputDevicesMessageProtobuf)removeOutputDevicesMessage;
- (_MRRemovePlayerMessageProtobuf)removePlayerMessage;
- (_MRRequestGroupSessionMessageProtobuf)requestGroupSessionMessage;
- (_MRSendButtonEventMessageProtobuf)sendButtonEventMessage;
- (_MRSendCommandMessageProtobuf)sendCommandMessage;
- (_MRSendCommandResultMessageProtobuf)sendCommandResultMessage;
- (_MRSendHIDEventMessageProtobuf)sendHIDEventMessage;
- (_MRSendHIDReportMessageProtobuf)sendHIDReportMessage;
- (_MRSendLyricsEventMessageProtobuf)sendLyricsEventMessage;
- (_MRSendPackedVirtualTouchEventMessageProtobuf)sendPackedVirtualTouchEventMessage;
- (_MRSendVirtualTouchEventMessageProtobuf)sendVirtualTouchEventMessage;
- (_MRSendVoiceInputMessageProtobuf)sendVoiceInputMessage;
- (_MRSetArtworkMessageProtobuf)setArtworkMessage;
- (_MRSetConnectionStateMessageProtobuf)connectionState;
- (_MRSetConversationDetectionEnabledMessageProtobuf)setConversationDetectionEnabledMessage;
- (_MRSetDiscoveryModeProtobufMessage)discoveryModeMessage;
- (_MRSetHiliteModeMessageProtobuf)setHiliteModeMessage;
- (_MRSetListeningModeMessageProtobuf)setListeningModeMessage;
- (_MRSetNowPlayingClientMessageProtobuf)setNowPlayingClientMessage;
- (_MRSetNowPlayingPlayerMessageProtobuf)setNowPlayingPlayerMessage;
- (_MRSetReadyStateMessageProtobuf)readyStateMessage;
- (_MRSetRecordingStateMessageProtobuf)setRecordingStateMessage;
- (_MRSetStateMessageProtobuf)setDefaultSupportedCommandsMessage;
- (_MRSetStateMessageProtobuf)setStateMessage;
- (_MRSetVolumeMessageProtobuf)setVolumeMessage;
- (_MRSetVolumeMutedMessageProtobuf)setVolumeMutedMessage;
- (_MRTextInputMessageProtobuf)textInputMessage;
- (_MRTransactionMessageProtobuf)transactionPackets;
- (_MRUnregisterGameControllerMessageProtobuf)unregisterGameController;
- (_MRUpdateActiveSystemEndpointMessageProtobuf)updateActiveSystemEndpointMessage;
- (_MRUpdateClientMessageProtobuf)updateClientMessage;
- (_MRUpdateContentItemArtworkMessageProtobuf)updateContentItemArtworkMessage;
- (_MRUpdateContentItemMessageProtobuf)updateContentItemMessage;
- (_MRUpdateEndpointsMessageProtobuf)updateEndpointsMessage;
- (_MRUpdateOutputDevicesMessageProtobuf)updateOutputDevicesMessage;
- (_MRUpdatePlayerMessageProtobuf)updatePlayerMessage;
- (_MRVolumeControlAvailabilityProtobuf)masterVolumeControlCapabilitiesDidChangeMessage;
- (_MRVolumeControlCapabilitiesDidChangeMessageProtobuf)volumeControlCapabilitiesDidChangeMessage;
- (_MRVolumeDidChangeMessageProtobuf)volumeDidChangeMessage;
- (_MRVolumeMutedDidChangeMessageProtobuf)volumeMutedDidChangeMessage;
- (_MRWakeDeviceMessageProtobuf)wakeDeviceMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)errorCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdjustVolumeMessage:(id)a3;
- (void)setApplicationConnectionProtocolMessage:(id)a3;
- (void)setAudioFadeMessage:(id)a3;
- (void)setAudioFadeResponseMessage:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setClientUpdatesConfigMessage:(id)a3;
- (void)setConfigureConnectionMessage:(id)a3;
- (void)setConnectionState:(id)a3;
- (void)setContentItemsChangedNotificationMessage:(id)a3;
- (void)setCreateApplicationConnectionMessage:(id)a3;
- (void)setCreateHostedEndpointRequest:(id)a3;
- (void)setCreateHostedEndpointResponse:(id)a3;
- (void)setCryptoPairingMessage:(id)a3;
- (void)setDeviceInfoMessage:(id)a3;
- (void)setDiscoveryModeMessage:(id)a3;
- (void)setDiscoveryUpdateEndpointsMessage:(id)a3;
- (void)setDiscoveryUpdateOutputDevicesMessage:(id)a3;
- (void)setError:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setErrorDescription:(id)a3;
- (void)setGameController:(id)a3;
- (void)setGameControllerProperties:(id)a3;
- (void)setGenericMessage:(id)a3;
- (void)setGetKeyboardMessage:(id)a3;
- (void)setGetRemoteTextInputSessionMessage:(id)a3;
- (void)setGetStateMessage:(id)a3;
- (void)setGetVoiceInputDevicesMessage:(id)a3;
- (void)setGetVoiceInputDevicesResponseMessage:(id)a3;
- (void)setGetVolumeControlCapabilitiesMessage:(id)a3;
- (void)setGetVolumeControlCapabilitiesResultMessage:(id)a3;
- (void)setGetVolumeMessage:(id)a3;
- (void)setGetVolumeMutedMessage:(id)a3;
- (void)setGetVolumeMutedResultMessage:(id)a3;
- (void)setGetVolumeResultMessage:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setInvalidateApplicationConnectionMessage:(id)a3;
- (void)setKeyboardMessage:(id)a3;
- (void)setMasterVolumeControlCapabilitiesDidChangeMessage:(id)a3;
- (void)setModifyOutputContextRequestMessage:(id)a3;
- (void)setNotificationMessage:(id)a3;
- (void)setOriginClientPropertiesMessage:(id)a3;
- (void)setPlaybackQueueRequest:(id)a3;
- (void)setPlaybackSessionMigrateBeginMessage:(id)a3;
- (void)setPlaybackSessionMigrateEndMessage:(id)a3;
- (void)setPlaybackSessionMigrateRequestMessage:(id)a3;
- (void)setPlaybackSessionMigrateResponseMessage:(id)a3;
- (void)setPlaybackSessionRequestMessage:(id)a3;
- (void)setPlaybackSessionResponseMessage:(id)a3;
- (void)setPlayerClientParticipantsUpdateMessage:(id)a3;
- (void)setPlayerClientPropertiesMessage:(id)a3;
- (void)setPresentRouteAuthorizationStatusMessage:(id)a3;
- (void)setPromptForRouteAuthorizationMessage:(id)a3;
- (void)setPromptForRouteAuthorizationResponseMessage:(id)a3;
- (void)setReadyStateMessage:(id)a3;
- (void)setRegisterForGameControllerEvents:(id)a3;
- (void)setRegisterGameController:(id)a3;
- (void)setRegisterGameControllerResponse:(id)a3;
- (void)setRegisterHIDDeviceMessage:(id)a3;
- (void)setRegisterHIDDeviceResultMessage:(id)a3;
- (void)setRegisterVoiceInputDeviceMessage:(id)a3;
- (void)setRegisterVoiceInputDeviceResponseMessage:(id)a3;
- (void)setRemoteTextInputMessage:(id)a3;
- (void)setRemoveClientMessage:(id)a3;
- (void)setRemoveEndpointsMessage:(id)a3;
- (void)setRemoveOutputDevicesMessage:(id)a3;
- (void)setRemovePlayerMessage:(id)a3;
- (void)setReplyIdentifier:(id)a3;
- (void)setRequestGroupSessionMessage:(id)a3;
- (void)setSendButtonEventMessage:(id)a3;
- (void)setSendCommandMessage:(id)a3;
- (void)setSendCommandResultMessage:(id)a3;
- (void)setSendHIDEventMessage:(id)a3;
- (void)setSendHIDReportMessage:(id)a3;
- (void)setSendLyricsEventMessage:(id)a3;
- (void)setSendPackedVirtualTouchEventMessage:(id)a3;
- (void)setSendVirtualTouchEventMessage:(id)a3;
- (void)setSendVoiceInputMessage:(id)a3;
- (void)setSetArtworkMessage:(id)a3;
- (void)setSetConversationDetectionEnabledMessage:(id)a3;
- (void)setSetDefaultSupportedCommandsMessage:(id)a3;
- (void)setSetHiliteModeMessage:(id)a3;
- (void)setSetListeningModeMessage:(id)a3;
- (void)setSetNowPlayingClientMessage:(id)a3;
- (void)setSetNowPlayingPlayerMessage:(id)a3;
- (void)setSetRecordingStateMessage:(id)a3;
- (void)setSetStateMessage:(id)a3;
- (void)setSetVolumeMessage:(id)a3;
- (void)setSetVolumeMutedMessage:(id)a3;
- (void)setTextInputMessage:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTransactionPackets:(id)a3;
- (void)setType:(int)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUnregisterGameController:(id)a3;
- (void)setUpdateActiveSystemEndpointMessage:(id)a3;
- (void)setUpdateClientMessage:(id)a3;
- (void)setUpdateContentItemArtworkMessage:(id)a3;
- (void)setUpdateContentItemMessage:(id)a3;
- (void)setUpdateEndpointsMessage:(id)a3;
- (void)setUpdateOutputDevicesMessage:(id)a3;
- (void)setUpdatePlayerMessage:(id)a3;
- (void)setVolumeControlCapabilitiesDidChangeMessage:(id)a3;
- (void)setVolumeDidChangeMessage:(id)a3;
- (void)setVolumeMutedDidChangeMessage:(id)a3;
- (void)setWakeDeviceMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRMediaRemoteMessageProtobuf

- (BOOL)readFrom:(id)a3
{
  return _MRMediaRemoteMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)replyIdentifier
{
  return self->_replyIdentifier;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (_MRGetVolumeMutedResultMessageProtobuf)getVolumeMutedResultMessage
{
  return self->_getVolumeMutedResultMessage;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setReplyIdentifier:(id)a3
{
}

- (void)setGetVolumeMutedResultMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeDeviceMessage, 0);
  objc_storeStrong((id *)&self->_volumeMutedDidChangeMessage, 0);
  objc_storeStrong((id *)&self->_volumeDidChangeMessage, 0);
  objc_storeStrong((id *)&self->_volumeControlCapabilitiesDidChangeMessage, 0);
  objc_storeStrong((id *)&self->_updatePlayerMessage, 0);
  objc_storeStrong((id *)&self->_updateOutputDevicesMessage, 0);
  objc_storeStrong((id *)&self->_updateEndpointsMessage, 0);
  objc_storeStrong((id *)&self->_updateContentItemMessage, 0);
  objc_storeStrong((id *)&self->_updateContentItemArtworkMessage, 0);
  objc_storeStrong((id *)&self->_updateClientMessage, 0);
  objc_storeStrong((id *)&self->_updateActiveSystemEndpointMessage, 0);
  objc_storeStrong((id *)&self->_unregisterGameController, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionPackets, 0);
  objc_storeStrong((id *)&self->_textInputMessage, 0);
  objc_storeStrong((id *)&self->_setVolumeMutedMessage, 0);
  objc_storeStrong((id *)&self->_setVolumeMessage, 0);
  objc_storeStrong((id *)&self->_setStateMessage, 0);
  objc_storeStrong((id *)&self->_setRecordingStateMessage, 0);
  objc_storeStrong((id *)&self->_setNowPlayingPlayerMessage, 0);
  objc_storeStrong((id *)&self->_setNowPlayingClientMessage, 0);
  objc_storeStrong((id *)&self->_setListeningModeMessage, 0);
  objc_storeStrong((id *)&self->_setHiliteModeMessage, 0);
  objc_storeStrong((id *)&self->_setDefaultSupportedCommandsMessage, 0);
  objc_storeStrong((id *)&self->_setConversationDetectionEnabledMessage, 0);
  objc_storeStrong((id *)&self->_setArtworkMessage, 0);
  objc_storeStrong((id *)&self->_sendVoiceInputMessage, 0);
  objc_storeStrong((id *)&self->_sendVirtualTouchEventMessage, 0);
  objc_storeStrong((id *)&self->_sendPackedVirtualTouchEventMessage, 0);
  objc_storeStrong((id *)&self->_sendLyricsEventMessage, 0);
  objc_storeStrong((id *)&self->_sendHIDReportMessage, 0);
  objc_storeStrong((id *)&self->_sendHIDEventMessage, 0);
  objc_storeStrong((id *)&self->_sendCommandResultMessage, 0);
  objc_storeStrong((id *)&self->_sendCommandMessage, 0);
  objc_storeStrong((id *)&self->_sendButtonEventMessage, 0);
  objc_storeStrong((id *)&self->_requestGroupSessionMessage, 0);
  objc_storeStrong((id *)&self->_replyIdentifier, 0);
  objc_storeStrong((id *)&self->_removePlayerMessage, 0);
  objc_storeStrong((id *)&self->_removeOutputDevicesMessage, 0);
  objc_storeStrong((id *)&self->_removeEndpointsMessage, 0);
  objc_storeStrong((id *)&self->_removeClientMessage, 0);
  objc_storeStrong((id *)&self->_remoteTextInputMessage, 0);
  objc_storeStrong((id *)&self->_registerVoiceInputDeviceResponseMessage, 0);
  objc_storeStrong((id *)&self->_registerVoiceInputDeviceMessage, 0);
  objc_storeStrong((id *)&self->_registerHIDDeviceResultMessage, 0);
  objc_storeStrong((id *)&self->_registerHIDDeviceMessage, 0);
  objc_storeStrong((id *)&self->_registerGameControllerResponse, 0);
  objc_storeStrong((id *)&self->_registerGameController, 0);
  objc_storeStrong((id *)&self->_registerForGameControllerEvents, 0);
  objc_storeStrong((id *)&self->_readyStateMessage, 0);
  objc_storeStrong((id *)&self->_promptForRouteAuthorizationResponseMessage, 0);
  objc_storeStrong((id *)&self->_promptForRouteAuthorizationMessage, 0);
  objc_storeStrong((id *)&self->_presentRouteAuthorizationStatusMessage, 0);
  objc_storeStrong((id *)&self->_playerClientPropertiesMessage, 0);
  objc_storeStrong((id *)&self->_playerClientParticipantsUpdateMessage, 0);
  objc_storeStrong((id *)&self->_playbackSessionResponseMessage, 0);
  objc_storeStrong((id *)&self->_playbackSessionRequestMessage, 0);
  objc_storeStrong((id *)&self->_playbackSessionMigrateResponseMessage, 0);
  objc_storeStrong((id *)&self->_playbackSessionMigrateRequestMessage, 0);
  objc_storeStrong((id *)&self->_playbackSessionMigrateEndMessage, 0);
  objc_storeStrong((id *)&self->_playbackSessionMigrateBeginMessage, 0);
  objc_storeStrong((id *)&self->_playbackQueueRequest, 0);
  objc_storeStrong((id *)&self->_originClientPropertiesMessage, 0);
  objc_storeStrong((id *)&self->_notificationMessage, 0);
  objc_storeStrong((id *)&self->_modifyOutputContextRequestMessage, 0);
  objc_storeStrong((id *)&self->_masterVolumeControlCapabilitiesDidChangeMessage, 0);
  objc_storeStrong((id *)&self->_keyboardMessage, 0);
  objc_storeStrong((id *)&self->_invalidateApplicationConnectionMessage, 0);
  objc_storeStrong((id *)&self->_getVolumeResultMessage, 0);
  objc_storeStrong((id *)&self->_getVolumeMutedResultMessage, 0);
  objc_storeStrong((id *)&self->_getVolumeMutedMessage, 0);
  objc_storeStrong((id *)&self->_getVolumeMessage, 0);
  objc_storeStrong((id *)&self->_getVolumeControlCapabilitiesResultMessage, 0);
  objc_storeStrong((id *)&self->_getVolumeControlCapabilitiesMessage, 0);
  objc_storeStrong((id *)&self->_getVoiceInputDevicesResponseMessage, 0);
  objc_storeStrong((id *)&self->_getVoiceInputDevicesMessage, 0);
  objc_storeStrong((id *)&self->_getStateMessage, 0);
  objc_storeStrong((id *)&self->_getRemoteTextInputSessionMessage, 0);
  objc_storeStrong((id *)&self->_getKeyboardMessage, 0);
  objc_storeStrong((id *)&self->_genericMessage, 0);
  objc_storeStrong((id *)&self->_gameControllerProperties, 0);
  objc_storeStrong((id *)&self->_gameController, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_discoveryUpdateOutputDevicesMessage, 0);
  objc_storeStrong((id *)&self->_discoveryUpdateEndpointsMessage, 0);
  objc_storeStrong((id *)&self->_discoveryModeMessage, 0);
  objc_storeStrong((id *)&self->_deviceInfoMessage, 0);
  objc_storeStrong((id *)&self->_cryptoPairingMessage, 0);
  objc_storeStrong((id *)&self->_createHostedEndpointResponse, 0);
  objc_storeStrong((id *)&self->_createHostedEndpointRequest, 0);
  objc_storeStrong((id *)&self->_createApplicationConnectionMessage, 0);
  objc_storeStrong((id *)&self->_contentItemsChangedNotificationMessage, 0);
  objc_storeStrong((id *)&self->_connectionState, 0);
  objc_storeStrong((id *)&self->_configureConnectionMessage, 0);
  objc_storeStrong((id *)&self->_clientUpdatesConfigMessage, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_audioFadeResponseMessage, 0);
  objc_storeStrong((id *)&self->_audioFadeMessage, 0);
  objc_storeStrong((id *)&self->_applicationConnectionProtocolMessage, 0);

  objc_storeStrong((id *)&self->_adjustVolumeMessage, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_replyIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_authenticationToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_sendCommandMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sendCommandResultMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_getStateMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setStateMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setArtworkMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_registerHIDDeviceMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_registerHIDDeviceResultMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sendHIDEventMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sendHIDReportMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sendVirtualTouchEventMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_notificationMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_contentItemsChangedNotificationMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_deviceInfoMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_clientUpdatesConfigMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_masterVolumeControlCapabilitiesDidChangeMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_gameController)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_registerGameController)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_registerGameControllerResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_unregisterGameController)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_registerForGameControllerEvents)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_keyboardMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_getKeyboardMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_textInputMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_getVoiceInputDevicesMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_getVoiceInputDevicesResponseMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_registerVoiceInputDeviceMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_registerVoiceInputDeviceResponseMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setRecordingStateMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sendVoiceInputMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_playbackQueueRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_transactionPackets)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_cryptoPairingMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_gameControllerProperties)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_readyStateMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_connectionState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sendButtonEventMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setHiliteModeMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_wakeDeviceMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_genericMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sendPackedVirtualTouchEventMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sendLyricsEventMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setNowPlayingClientMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setNowPlayingPlayerMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_modifyOutputContextRequestMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_getVolumeMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_getVolumeResultMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setVolumeMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_volumeDidChangeMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_removeClientMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_removePlayerMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_updateClientMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_updateContentItemMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_updateContentItemArtworkMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_updatePlayerMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_promptForRouteAuthorizationMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_promptForRouteAuthorizationResponseMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_presentRouteAuthorizationStatusMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_getVolumeControlCapabilitiesMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_getVolumeControlCapabilitiesResultMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_volumeControlCapabilitiesDidChangeMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_updateOutputDevicesMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_removeOutputDevicesMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_remoteTextInputMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_getRemoteTextInputSessionMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_playbackSessionRequestMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_playbackSessionResponseMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setDefaultSupportedCommandsMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_playbackSessionMigrateRequestMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_playbackSessionMigrateResponseMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_playbackSessionMigrateBeginMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_playbackSessionMigrateEndMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_updateActiveSystemEndpointMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_discoveryModeMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_updateEndpointsMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_removeEndpointsMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_uniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_playerClientPropertiesMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_originClientPropertiesMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_audioFadeMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_audioFadeResponseMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_discoveryUpdateEndpointsMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_discoveryUpdateOutputDevicesMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setListeningModeMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_configureConnectionMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_createHostedEndpointRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_createHostedEndpointResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_adjustVolumeMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_getVolumeMutedMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_getVolumeMutedResultMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setVolumeMutedMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_volumeMutedDidChangeMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setConversationDetectionEnabledMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_playerClientParticipantsUpdateMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_requestGroupSessionMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_createApplicationConnectionMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_applicationConnectionProtocolMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_invalidateApplicationConnectionMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  id v4 = @"Unknown";
  switch(a3)
  {
    case 0:
      goto LABEL_36;
    case 1:
      id v4 = @"SendCommand";
      break;
    case 2:
      id v4 = @"SendCommandResult";
      break;
    case 3:
      id v4 = @"GetState";
      break;
    case 4:
      id v4 = @"SetState";
      break;
    case 5:
      id v4 = @"SetArtwork";
      break;
    case 6:
      id v4 = @"RegisterHIDDevice";
      break;
    case 7:
      id v4 = @"RegisterHIDDeviceResult";
      break;
    case 8:
      id v4 = @"SendHIDEvent";
      break;
    case 9:
      id v4 = @"SendHIDReport";
      break;
    case 10:
      id v4 = @"SendVirtualTouchEvent";
      break;
    case 11:
      id v4 = @"Notification";
      break;
    case 15:
      id v4 = @"DeviceInfo";
      break;
    case 16:
      id v4 = @"ClientUpdatesConfiguration";
      break;
    case 17:
      id v4 = @"LegacyVolumeControlCapabilitiesDidChange";
      break;
    case 18:
      id v4 = @"GameController";
      break;
    case 19:
      id v4 = @"RegisterGameController";
      break;
    case 20:
      id v4 = @"RegisterGameControllerResponse";
      break;
    case 21:
      id v4 = @"UnregisterGameController";
      break;
    case 22:
      id v4 = @"RegisterForGameControllerEvents";
      break;
    case 23:
      id v4 = @"Keyboard";
      break;
    case 24:
      id v4 = @"GetKeyboardSession";
      break;
    case 25:
      id v4 = @"TextInput";
      break;
    case 26:
      id v4 = @"GetVoiceInputDevices";
      break;
    case 27:
      id v4 = @"GetVoiceInputDevicesResponse";
      break;
    case 28:
      id v4 = @"RegisterVoiceInputDevice";
      break;
    case 29:
      id v4 = @"RegisterVoiceInputDeviceResponse";
      break;
    case 30:
      id v4 = @"SetVoiceInputRecordingState";
      break;
    case 31:
      id v4 = @"SendVoiceInput";
      break;
    case 32:
      id v4 = @"PlaybackQueueRequest";
      break;
    case 33:
      id v4 = @"Transaction";
      break;
    case 34:
      id v4 = @"CryptoPairing";
      break;
    case 35:
      id v4 = @"GameControllerProperties";
      break;
    case 36:
      id v4 = @"SetReadyState";
      break;
    case 37:
      id v4 = @"DeviceInfoUpdate";
      break;
    case 38:
      id v4 = @"SetConnectionState";
      break;
    case 39:
      id v4 = @"SendButtonEvent";
      break;
    case 40:
      id v4 = @"SetHiliteMode";
      break;
    case 41:
      id v4 = @"WakeDevice";
      break;
    case 42:
      id v4 = @"Generic";
      break;
    case 43:
      id v4 = @"SendPackedVirtualTouchEvent";
      break;
    case 44:
      id v4 = @"SendLyricsEventMessage";
      break;
    case 46:
      id v4 = @"SetNowPlayingClient";
      break;
    case 47:
      id v4 = @"SetNowPlayingPlayer";
      break;
    case 48:
      id v4 = @"ModifyOutputContextRequest";
      break;
    case 49:
      id v4 = @"GetVolume";
      break;
    case 50:
      id v4 = @"GetVolumeResult";
      break;
    case 51:
      id v4 = @"SetVolume";
      break;
    case 52:
      id v4 = @"VolumeDidChange";
      break;
    case 53:
      id v4 = @"RemoveClient";
      break;
    case 54:
      id v4 = @"RemovePlayer";
      break;
    case 55:
      id v4 = @"UpdateClient";
      break;
    case 56:
      id v4 = @"UpdateContentItems";
      break;
    case 57:
      id v4 = @"UpdateContentItemArtwork";
      break;
    case 58:
      id v4 = @"UpdatePlayer";
      break;
    case 59:
      id v4 = @"PromptForRouteAuthorization";
      break;
    case 60:
      id v4 = @"PromptForRouteAuthorizationResponse";
      break;
    case 61:
      id v4 = @"PresentRouteAuthorizationStatus";
      break;
    case 62:
      id v4 = @"GetVolumeControlCapabilities";
      break;
    case 63:
      id v4 = @"GetVolumeControlCapabilitiesResult";
      break;
    case 64:
      id v4 = @"VolumeControlCapabilitiesDidChange";
      break;
    case 65:
      id v4 = @"UpdateOutputDevices";
      break;
    case 66:
      id v4 = @"RemoveOutputDevices";
      break;
    case 67:
      id v4 = @"RemoteTextInput";
      break;
    case 68:
      id v4 = @"GetRemoteTextInputSession";
      break;
    case 69:
      id v4 = @"RemoveFromParentGroup";
      break;
    case 70:
      id v4 = @"PlaybackSessionRequest";
      break;
    case 71:
      id v4 = @"PlaybackSessionResponse";
      break;
    case 72:
      id v4 = @"SetDefaultSupportedCommands";
      break;
    case 73:
      id v4 = @"PlaybackSessionMigrateRequest";
      break;
    case 74:
      id v4 = @"PlaybackSessionMigrateResponse";
      break;
    case 75:
      id v4 = @"PlaybackSessionMigrateBegin";
      break;
    case 76:
      id v4 = @"PlaybackSessionMigrateEnd";
      break;
    case 77:
      id v4 = @"UpdateActiveSystemEndpoint";
      break;
    case 101:
      id v4 = @"SetDiscoveryMode";
      break;
    case 102:
      id v4 = @"UpdateEndpoints";
      break;
    case 103:
      id v4 = @"RemoveEndpoints";
      break;
    case 104:
      id v4 = @"SetPlayerClientProperties";
      break;
    case 105:
      id v4 = @"SetOriginClientProperties";
      break;
    case 106:
      id v4 = @"AudioFade";
      break;
    case 107:
      id v4 = @"AudioFadeResponse";
      break;
    case 108:
      id v4 = @"DiscoveryUpdateEndpoints";
      break;
    case 109:
      id v4 = @"DiscoveryUpdateOutputDevices";
      break;
    case 110:
      id v4 = @"SetListeningMode";
      break;
    case 120:
      id v4 = @"ConfigureConnection";
      break;
    case 121:
      id v4 = @"CreatedHostedEndpointRequest";
      break;
    case 122:
      id v4 = @"CreatedHostedEndpointResponse";
      break;
    case 125:
      id v4 = @"AdjustVolume";
      break;
    case 126:
      id v4 = @"GetVolumeMuted";
      break;
    case 127:
      id v4 = @"GetVolumeMutedResult";
      break;
    case 128:
      id v4 = @"SetVolumeMuted";
      break;
    case 129:
      id v4 = @"VolumeMutedDidChange";
      break;
    case 130:
      id v4 = @"SetConversationDetectionEnabled";
      break;
    case 131:
      id v4 = @"PlayerClientParticipantsUpdate";
      break;
    case 132:
      id v4 = @"RequestGroupSession";
      break;
    case 133:
      id v4 = @"ConfigureConnectionService";
      break;
    case 134:
      id v4 = @"CreateApplicationConnection";
      break;
    case 135:
      id v4 = @"ApplicationConnectionProtocolMessage";
      break;
    case 136:
      id v4 = @"InvalidateApplicationConnection";
      break;
    case 137:
      id v4 = @"LastMessageType";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_36:
      break;
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SendCommand"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SendCommandResult"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GetState"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SetState"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SetArtwork"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RegisterHIDDevice"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RegisterHIDDeviceResult"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SendHIDEvent"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SendHIDReport"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SendVirtualTouchEvent"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Notification"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"DeviceInfo"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ClientUpdatesConfiguration"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LegacyVolumeControlCapabilitiesDidChange"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"GameController"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"RegisterGameController"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"RegisterGameControllerResponse"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"UnregisterGameController"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"RegisterForGameControllerEvents"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"Keyboard"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"GetKeyboardSession"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"TextInput"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"GetVoiceInputDevices"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"GetVoiceInputDevicesResponse"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"RegisterVoiceInputDevice"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"RegisterVoiceInputDeviceResponse"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"SetVoiceInputRecordingState"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"SendVoiceInput"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"PlaybackQueueRequest"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"Transaction"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"CryptoPairing"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"GameControllerProperties"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"SetReadyState"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"DeviceInfoUpdate"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"SetConnectionState"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"SendButtonEvent"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"SetHiliteMode"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"WakeDevice"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"Generic"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"SendPackedVirtualTouchEvent"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"SendLyricsEventMessage"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"SetNowPlayingClient"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"SetNowPlayingPlayer"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"ModifyOutputContextRequest"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"GetVolume"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"GetVolumeResult"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"SetVolume"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"VolumeDidChange"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"RemoveClient"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"RemovePlayer"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"UpdateClient"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"UpdateContentItems"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"UpdateContentItemArtwork"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"UpdatePlayer"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"PromptForRouteAuthorization"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"PromptForRouteAuthorizationResponse"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"PresentRouteAuthorizationStatus"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"GetVolumeControlCapabilities"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"GetVolumeControlCapabilitiesResult"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"VolumeControlCapabilitiesDidChange"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"UpdateOutputDevices"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"RemoveOutputDevices"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"RemoteTextInput"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"GetRemoteTextInputSession"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"RemoveFromParentGroup"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"PlaybackSessionRequest"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"PlaybackSessionResponse"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"SetDefaultSupportedCommands"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"PlaybackSessionMigrateRequest"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"PlaybackSessionMigrateResponse"])
  {
    int v4 = 74;
  }
  else if ([v3 isEqualToString:@"PlaybackSessionMigrateBegin"])
  {
    int v4 = 75;
  }
  else if ([v3 isEqualToString:@"PlaybackSessionMigrateEnd"])
  {
    int v4 = 76;
  }
  else if ([v3 isEqualToString:@"UpdateActiveSystemEndpoint"])
  {
    int v4 = 77;
  }
  else if ([v3 isEqualToString:@"SetDiscoveryMode"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"UpdateEndpoints"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"RemoveEndpoints"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"SetPlayerClientProperties"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"SetOriginClientProperties"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"AudioFade"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"AudioFadeResponse"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"DiscoveryUpdateEndpoints"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"DiscoveryUpdateOutputDevices"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"SetListeningMode"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"ConfigureConnection"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"CreatedHostedEndpointRequest"])
  {
    int v4 = 121;
  }
  else if ([v3 isEqualToString:@"CreatedHostedEndpointResponse"])
  {
    int v4 = 122;
  }
  else if ([v3 isEqualToString:@"AdjustVolume"])
  {
    int v4 = 125;
  }
  else if ([v3 isEqualToString:@"GetVolumeMuted"])
  {
    int v4 = 126;
  }
  else if ([v3 isEqualToString:@"GetVolumeMutedResult"])
  {
    int v4 = 127;
  }
  else if ([v3 isEqualToString:@"SetVolumeMuted"])
  {
    int v4 = 128;
  }
  else if ([v3 isEqualToString:@"VolumeMutedDidChange"])
  {
    int v4 = 129;
  }
  else if ([v3 isEqualToString:@"SetConversationDetectionEnabled"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"PlayerClientParticipantsUpdate"])
  {
    int v4 = 131;
  }
  else if ([v3 isEqualToString:@"RequestGroupSession"])
  {
    int v4 = 132;
  }
  else if ([v3 isEqualToString:@"ConfigureConnectionService"])
  {
    int v4 = 133;
  }
  else if ([v3 isEqualToString:@"CreateApplicationConnection"])
  {
    int v4 = 134;
  }
  else if ([v3 isEqualToString:@"ApplicationConnectionProtocolMessage"])
  {
    int v4 = 135;
  }
  else if ([v3 isEqualToString:@"InvalidateApplicationConnection"])
  {
    int v4 = 136;
  }
  else if ([v3 isEqualToString:@"LastMessageType"])
  {
    int v4 = 137;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasReplyIdentifier
{
  return self->_replyIdentifier != 0;
}

- (BOOL)hasAuthenticationToken
{
  return self->_authenticationToken != 0;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasSendCommandMessage
{
  return self->_sendCommandMessage != 0;
}

- (BOOL)hasSendCommandResultMessage
{
  return self->_sendCommandResultMessage != 0;
}

- (BOOL)hasSetStateMessage
{
  return self->_setStateMessage != 0;
}

- (BOOL)hasNotificationMessage
{
  return self->_notificationMessage != 0;
}

- (BOOL)hasContentItemsChangedNotificationMessage
{
  return self->_contentItemsChangedNotificationMessage != 0;
}

- (BOOL)hasDeviceInfoMessage
{
  return self->_deviceInfoMessage != 0;
}

- (BOOL)hasClientUpdatesConfigMessage
{
  return self->_clientUpdatesConfigMessage != 0;
}

- (BOOL)hasPlaybackQueueRequest
{
  return self->_playbackQueueRequest != 0;
}

- (BOOL)hasConnectionState
{
  return self->_connectionState != 0;
}

- (BOOL)hasGetVolumeMessage
{
  return self->_getVolumeMessage != 0;
}

- (BOOL)hasGetVolumeResultMessage
{
  return self->_getVolumeResultMessage != 0;
}

- (BOOL)hasSetVolumeMessage
{
  return self->_setVolumeMessage != 0;
}

- (BOOL)hasVolumeDidChangeMessage
{
  return self->_volumeDidChangeMessage != 0;
}

- (BOOL)hasUpdateContentItemMessage
{
  return self->_updateContentItemMessage != 0;
}

- (BOOL)hasSetDefaultSupportedCommandsMessage
{
  return self->_setDefaultSupportedCommandsMessage != 0;
}

- (BOOL)hasGetStateMessage
{
  return self->_getStateMessage != 0;
}

- (BOOL)hasSetArtworkMessage
{
  return self->_setArtworkMessage != 0;
}

- (BOOL)hasRegisterHIDDeviceMessage
{
  return self->_registerHIDDeviceMessage != 0;
}

- (BOOL)hasRegisterHIDDeviceResultMessage
{
  return self->_registerHIDDeviceResultMessage != 0;
}

- (BOOL)hasSendHIDEventMessage
{
  return self->_sendHIDEventMessage != 0;
}

- (BOOL)hasSendHIDReportMessage
{
  return self->_sendHIDReportMessage != 0;
}

- (BOOL)hasSendVirtualTouchEventMessage
{
  return self->_sendVirtualTouchEventMessage != 0;
}

- (BOOL)hasMasterVolumeControlCapabilitiesDidChangeMessage
{
  return self->_masterVolumeControlCapabilitiesDidChangeMessage != 0;
}

- (BOOL)hasGameController
{
  return self->_gameController != 0;
}

- (BOOL)hasRegisterGameController
{
  return self->_registerGameController != 0;
}

- (BOOL)hasRegisterGameControllerResponse
{
  return self->_registerGameControllerResponse != 0;
}

- (BOOL)hasUnregisterGameController
{
  return self->_unregisterGameController != 0;
}

- (BOOL)hasRegisterForGameControllerEvents
{
  return self->_registerForGameControllerEvents != 0;
}

- (BOOL)hasKeyboardMessage
{
  return self->_keyboardMessage != 0;
}

- (BOOL)hasGetKeyboardMessage
{
  return self->_getKeyboardMessage != 0;
}

- (BOOL)hasTextInputMessage
{
  return self->_textInputMessage != 0;
}

- (BOOL)hasGetVoiceInputDevicesMessage
{
  return self->_getVoiceInputDevicesMessage != 0;
}

- (BOOL)hasGetVoiceInputDevicesResponseMessage
{
  return self->_getVoiceInputDevicesResponseMessage != 0;
}

- (BOOL)hasRegisterVoiceInputDeviceMessage
{
  return self->_registerVoiceInputDeviceMessage != 0;
}

- (BOOL)hasRegisterVoiceInputDeviceResponseMessage
{
  return self->_registerVoiceInputDeviceResponseMessage != 0;
}

- (BOOL)hasSetRecordingStateMessage
{
  return self->_setRecordingStateMessage != 0;
}

- (BOOL)hasSendVoiceInputMessage
{
  return self->_sendVoiceInputMessage != 0;
}

- (BOOL)hasTransactionPackets
{
  return self->_transactionPackets != 0;
}

- (BOOL)hasCryptoPairingMessage
{
  return self->_cryptoPairingMessage != 0;
}

- (BOOL)hasGameControllerProperties
{
  return self->_gameControllerProperties != 0;
}

- (BOOL)hasReadyStateMessage
{
  return self->_readyStateMessage != 0;
}

- (BOOL)hasSendButtonEventMessage
{
  return self->_sendButtonEventMessage != 0;
}

- (BOOL)hasSetHiliteModeMessage
{
  return self->_setHiliteModeMessage != 0;
}

- (BOOL)hasWakeDeviceMessage
{
  return self->_wakeDeviceMessage != 0;
}

- (BOOL)hasGenericMessage
{
  return self->_genericMessage != 0;
}

- (BOOL)hasSendPackedVirtualTouchEventMessage
{
  return self->_sendPackedVirtualTouchEventMessage != 0;
}

- (BOOL)hasSendLyricsEventMessage
{
  return self->_sendLyricsEventMessage != 0;
}

- (BOOL)hasSetNowPlayingClientMessage
{
  return self->_setNowPlayingClientMessage != 0;
}

- (BOOL)hasSetNowPlayingPlayerMessage
{
  return self->_setNowPlayingPlayerMessage != 0;
}

- (BOOL)hasModifyOutputContextRequestMessage
{
  return self->_modifyOutputContextRequestMessage != 0;
}

- (BOOL)hasRemoveClientMessage
{
  return self->_removeClientMessage != 0;
}

- (BOOL)hasRemovePlayerMessage
{
  return self->_removePlayerMessage != 0;
}

- (BOOL)hasUpdateClientMessage
{
  return self->_updateClientMessage != 0;
}

- (BOOL)hasUpdateContentItemArtworkMessage
{
  return self->_updateContentItemArtworkMessage != 0;
}

- (BOOL)hasUpdatePlayerMessage
{
  return self->_updatePlayerMessage != 0;
}

- (BOOL)hasPromptForRouteAuthorizationMessage
{
  return self->_promptForRouteAuthorizationMessage != 0;
}

- (BOOL)hasPromptForRouteAuthorizationResponseMessage
{
  return self->_promptForRouteAuthorizationResponseMessage != 0;
}

- (BOOL)hasPresentRouteAuthorizationStatusMessage
{
  return self->_presentRouteAuthorizationStatusMessage != 0;
}

- (BOOL)hasGetVolumeControlCapabilitiesMessage
{
  return self->_getVolumeControlCapabilitiesMessage != 0;
}

- (BOOL)hasGetVolumeControlCapabilitiesResultMessage
{
  return self->_getVolumeControlCapabilitiesResultMessage != 0;
}

- (BOOL)hasVolumeControlCapabilitiesDidChangeMessage
{
  return self->_volumeControlCapabilitiesDidChangeMessage != 0;
}

- (BOOL)hasUpdateOutputDevicesMessage
{
  return self->_updateOutputDevicesMessage != 0;
}

- (BOOL)hasRemoveOutputDevicesMessage
{
  return self->_removeOutputDevicesMessage != 0;
}

- (BOOL)hasRemoteTextInputMessage
{
  return self->_remoteTextInputMessage != 0;
}

- (BOOL)hasGetRemoteTextInputSessionMessage
{
  return self->_getRemoteTextInputSessionMessage != 0;
}

- (BOOL)hasPlaybackSessionRequestMessage
{
  return self->_playbackSessionRequestMessage != 0;
}

- (BOOL)hasPlaybackSessionResponseMessage
{
  return self->_playbackSessionResponseMessage != 0;
}

- (BOOL)hasPlaybackSessionMigrateRequestMessage
{
  return self->_playbackSessionMigrateRequestMessage != 0;
}

- (BOOL)hasPlaybackSessionMigrateResponseMessage
{
  return self->_playbackSessionMigrateResponseMessage != 0;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (BOOL)hasPlaybackSessionMigrateBeginMessage
{
  return self->_playbackSessionMigrateBeginMessage != 0;
}

- (BOOL)hasPlaybackSessionMigrateEndMessage
{
  return self->_playbackSessionMigrateEndMessage != 0;
}

- (BOOL)hasUpdateActiveSystemEndpointMessage
{
  return self->_updateActiveSystemEndpointMessage != 0;
}

- (BOOL)hasDiscoveryModeMessage
{
  return self->_discoveryModeMessage != 0;
}

- (BOOL)hasUpdateEndpointsMessage
{
  return self->_updateEndpointsMessage != 0;
}

- (BOOL)hasRemoveEndpointsMessage
{
  return self->_removeEndpointsMessage != 0;
}

- (BOOL)hasPlayerClientPropertiesMessage
{
  return self->_playerClientPropertiesMessage != 0;
}

- (BOOL)hasOriginClientPropertiesMessage
{
  return self->_originClientPropertiesMessage != 0;
}

- (BOOL)hasAudioFadeMessage
{
  return self->_audioFadeMessage != 0;
}

- (BOOL)hasAudioFadeResponseMessage
{
  return self->_audioFadeResponseMessage != 0;
}

- (BOOL)hasDiscoveryUpdateEndpointsMessage
{
  return self->_discoveryUpdateEndpointsMessage != 0;
}

- (BOOL)hasDiscoveryUpdateOutputDevicesMessage
{
  return self->_discoveryUpdateOutputDevicesMessage != 0;
}

- (BOOL)hasSetListeningModeMessage
{
  return self->_setListeningModeMessage != 0;
}

- (BOOL)hasConfigureConnectionMessage
{
  return self->_configureConnectionMessage != 0;
}

- (BOOL)hasCreateHostedEndpointRequest
{
  return self->_createHostedEndpointRequest != 0;
}

- (BOOL)hasCreateHostedEndpointResponse
{
  return self->_createHostedEndpointResponse != 0;
}

- (BOOL)hasAdjustVolumeMessage
{
  return self->_adjustVolumeMessage != 0;
}

- (BOOL)hasGetVolumeMutedMessage
{
  return self->_getVolumeMutedMessage != 0;
}

- (BOOL)hasGetVolumeMutedResultMessage
{
  return self->_getVolumeMutedResultMessage != 0;
}

- (BOOL)hasSetVolumeMutedMessage
{
  return self->_setVolumeMutedMessage != 0;
}

- (BOOL)hasVolumeMutedDidChangeMessage
{
  return self->_volumeMutedDidChangeMessage != 0;
}

- (BOOL)hasSetConversationDetectionEnabledMessage
{
  return self->_setConversationDetectionEnabledMessage != 0;
}

- (BOOL)hasPlayerClientParticipantsUpdateMessage
{
  return self->_playerClientParticipantsUpdateMessage != 0;
}

- (BOOL)hasRequestGroupSessionMessage
{
  return self->_requestGroupSessionMessage != 0;
}

- (BOOL)hasCreateApplicationConnectionMessage
{
  return self->_createApplicationConnectionMessage != 0;
}

- (BOOL)hasApplicationConnectionProtocolMessage
{
  return self->_applicationConnectionProtocolMessage != 0;
}

- (BOOL)hasInvalidateApplicationConnectionMessage
{
  return self->_invalidateApplicationConnectionMessage != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRMediaRemoteMessageProtobuf;
  int v4 = [(_MRMediaRemoteMessageProtobuf *)&v8 description];
  v5 = [(_MRMediaRemoteMessageProtobuf *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int v4 = @"Unknown";
    switch(self->_type)
    {
      case 0:
        break;
      case 1:
        int v4 = @"SendCommand";
        break;
      case 2:
        int v4 = @"SendCommandResult";
        break;
      case 3:
        int v4 = @"GetState";
        break;
      case 4:
        int v4 = @"SetState";
        break;
      case 5:
        int v4 = @"SetArtwork";
        break;
      case 6:
        int v4 = @"RegisterHIDDevice";
        break;
      case 7:
        int v4 = @"RegisterHIDDeviceResult";
        break;
      case 8:
        int v4 = @"SendHIDEvent";
        break;
      case 9:
        int v4 = @"SendHIDReport";
        break;
      case 0xA:
        int v4 = @"SendVirtualTouchEvent";
        break;
      case 0xB:
        int v4 = @"Notification";
        break;
      case 0xF:
        int v4 = @"DeviceInfo";
        break;
      case 0x10:
        int v4 = @"ClientUpdatesConfiguration";
        break;
      case 0x11:
        int v4 = @"LegacyVolumeControlCapabilitiesDidChange";
        break;
      case 0x12:
        int v4 = @"GameController";
        break;
      case 0x13:
        int v4 = @"RegisterGameController";
        break;
      case 0x14:
        int v4 = @"RegisterGameControllerResponse";
        break;
      case 0x15:
        int v4 = @"UnregisterGameController";
        break;
      case 0x16:
        int v4 = @"RegisterForGameControllerEvents";
        break;
      case 0x17:
        int v4 = @"Keyboard";
        break;
      case 0x18:
        int v4 = @"GetKeyboardSession";
        break;
      case 0x19:
        int v4 = @"TextInput";
        break;
      case 0x1A:
        int v4 = @"GetVoiceInputDevices";
        break;
      case 0x1B:
        int v4 = @"GetVoiceInputDevicesResponse";
        break;
      case 0x1C:
        int v4 = @"RegisterVoiceInputDevice";
        break;
      case 0x1D:
        int v4 = @"RegisterVoiceInputDeviceResponse";
        break;
      case 0x1E:
        int v4 = @"SetVoiceInputRecordingState";
        break;
      case 0x1F:
        int v4 = @"SendVoiceInput";
        break;
      case 0x20:
        int v4 = @"PlaybackQueueRequest";
        break;
      case 0x21:
        int v4 = @"Transaction";
        break;
      case 0x22:
        int v4 = @"CryptoPairing";
        break;
      case 0x23:
        int v4 = @"GameControllerProperties";
        break;
      case 0x24:
        int v4 = @"SetReadyState";
        break;
      case 0x25:
        int v4 = @"DeviceInfoUpdate";
        break;
      case 0x26:
        int v4 = @"SetConnectionState";
        break;
      case 0x27:
        int v4 = @"SendButtonEvent";
        break;
      case 0x28:
        int v4 = @"SetHiliteMode";
        break;
      case 0x29:
        int v4 = @"WakeDevice";
        break;
      case 0x2A:
        int v4 = @"Generic";
        break;
      case 0x2B:
        int v4 = @"SendPackedVirtualTouchEvent";
        break;
      case 0x2C:
        int v4 = @"SendLyricsEventMessage";
        break;
      case 0x2E:
        int v4 = @"SetNowPlayingClient";
        break;
      case 0x2F:
        int v4 = @"SetNowPlayingPlayer";
        break;
      case 0x30:
        int v4 = @"ModifyOutputContextRequest";
        break;
      case 0x31:
        int v4 = @"GetVolume";
        break;
      case 0x32:
        int v4 = @"GetVolumeResult";
        break;
      case 0x33:
        int v4 = @"SetVolume";
        break;
      case 0x34:
        int v4 = @"VolumeDidChange";
        break;
      case 0x35:
        int v4 = @"RemoveClient";
        break;
      case 0x36:
        int v4 = @"RemovePlayer";
        break;
      case 0x37:
        int v4 = @"UpdateClient";
        break;
      case 0x38:
        int v4 = @"UpdateContentItems";
        break;
      case 0x39:
        int v4 = @"UpdateContentItemArtwork";
        break;
      case 0x3A:
        int v4 = @"UpdatePlayer";
        break;
      case 0x3B:
        int v4 = @"PromptForRouteAuthorization";
        break;
      case 0x3C:
        int v4 = @"PromptForRouteAuthorizationResponse";
        break;
      case 0x3D:
        int v4 = @"PresentRouteAuthorizationStatus";
        break;
      case 0x3E:
        int v4 = @"GetVolumeControlCapabilities";
        break;
      case 0x3F:
        int v4 = @"GetVolumeControlCapabilitiesResult";
        break;
      case 0x40:
        int v4 = @"VolumeControlCapabilitiesDidChange";
        break;
      case 0x41:
        int v4 = @"UpdateOutputDevices";
        break;
      case 0x42:
        int v4 = @"RemoveOutputDevices";
        break;
      case 0x43:
        int v4 = @"RemoteTextInput";
        break;
      case 0x44:
        int v4 = @"GetRemoteTextInputSession";
        break;
      case 0x45:
        int v4 = @"RemoveFromParentGroup";
        break;
      case 0x46:
        int v4 = @"PlaybackSessionRequest";
        break;
      case 0x47:
        int v4 = @"PlaybackSessionResponse";
        break;
      case 0x48:
        int v4 = @"SetDefaultSupportedCommands";
        break;
      case 0x49:
        int v4 = @"PlaybackSessionMigrateRequest";
        break;
      case 0x4A:
        int v4 = @"PlaybackSessionMigrateResponse";
        break;
      case 0x4B:
        int v4 = @"PlaybackSessionMigrateBegin";
        break;
      case 0x4C:
        int v4 = @"PlaybackSessionMigrateEnd";
        break;
      case 0x4D:
        int v4 = @"UpdateActiveSystemEndpoint";
        break;
      case 0x65:
        int v4 = @"SetDiscoveryMode";
        break;
      case 0x66:
        int v4 = @"UpdateEndpoints";
        break;
      case 0x67:
        int v4 = @"RemoveEndpoints";
        break;
      case 0x68:
        int v4 = @"SetPlayerClientProperties";
        break;
      case 0x69:
        int v4 = @"SetOriginClientProperties";
        break;
      case 0x6A:
        int v4 = @"AudioFade";
        break;
      case 0x6B:
        int v4 = @"AudioFadeResponse";
        break;
      case 0x6C:
        int v4 = @"DiscoveryUpdateEndpoints";
        break;
      case 0x6D:
        int v4 = @"DiscoveryUpdateOutputDevices";
        break;
      case 0x6E:
        int v4 = @"SetListeningMode";
        break;
      case 0x78:
        int v4 = @"ConfigureConnection";
        break;
      case 0x79:
        int v4 = @"CreatedHostedEndpointRequest";
        break;
      case 0x7A:
        int v4 = @"CreatedHostedEndpointResponse";
        break;
      case 0x7D:
        int v4 = @"AdjustVolume";
        break;
      case 0x7E:
        int v4 = @"GetVolumeMuted";
        break;
      case 0x7F:
        int v4 = @"GetVolumeMutedResult";
        break;
      case 0x80:
        int v4 = @"SetVolumeMuted";
        break;
      case 0x81:
        int v4 = @"VolumeMutedDidChange";
        break;
      case 0x82:
        int v4 = @"SetConversationDetectionEnabled";
        break;
      case 0x83:
        int v4 = @"PlayerClientParticipantsUpdate";
        break;
      case 0x84:
        int v4 = @"RequestGroupSession";
        break;
      case 0x85:
        int v4 = @"ConfigureConnectionService";
        break;
      case 0x86:
        int v4 = @"CreateApplicationConnection";
        break;
      case 0x87:
        int v4 = @"ApplicationConnectionProtocolMessage";
        break;
      case 0x88:
        int v4 = @"InvalidateApplicationConnection";
        break;
      case 0x89:
        int v4 = @"LastMessageType";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    [v3 setObject:v4 forKey:@"type"];
  }
  replyIdentifier = self->_replyIdentifier;
  if (replyIdentifier) {
    [v3 setObject:replyIdentifier forKey:@"replyIdentifier"];
  }
  authenticationToken = self->_authenticationToken;
  if (authenticationToken) {
    [v3 setObject:authenticationToken forKey:@"authenticationToken"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v8 forKey:@"errorCode"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v9 forKey:@"timestamp"];
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v3 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  sendCommandMessage = self->_sendCommandMessage;
  if (sendCommandMessage)
  {
    v12 = [(_MRSendCommandMessageProtobuf *)sendCommandMessage dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"sendCommandMessage"];
  }
  sendCommandResultMessage = self->_sendCommandResultMessage;
  if (sendCommandResultMessage)
  {
    v14 = [(_MRSendCommandResultMessageProtobuf *)sendCommandResultMessage dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"sendCommandResultMessage"];
  }
  setStateMessage = self->_setStateMessage;
  if (setStateMessage)
  {
    v16 = [(_MRSetStateMessageProtobuf *)setStateMessage dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"setStateMessage"];
  }
  notificationMessage = self->_notificationMessage;
  if (notificationMessage)
  {
    v18 = [(_MRNotificationMessageProtobuf *)notificationMessage dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"notificationMessage"];
  }
  contentItemsChangedNotificationMessage = self->_contentItemsChangedNotificationMessage;
  if (contentItemsChangedNotificationMessage)
  {
    v20 = [(_MRPlaybackQueueProtobuf *)contentItemsChangedNotificationMessage dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"contentItemsChangedNotificationMessage"];
  }
  deviceInfoMessage = self->_deviceInfoMessage;
  if (deviceInfoMessage)
  {
    v22 = [(_MRDeviceInfoMessageProtobuf *)deviceInfoMessage dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"deviceInfoMessage"];
  }
  clientUpdatesConfigMessage = self->_clientUpdatesConfigMessage;
  if (clientUpdatesConfigMessage)
  {
    v24 = [(_MRClientUpdatesConfigurationProtobuf *)clientUpdatesConfigMessage dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"clientUpdatesConfigMessage"];
  }
  playbackQueueRequest = self->_playbackQueueRequest;
  if (playbackQueueRequest)
  {
    v26 = [(_MRPlaybackQueueRequestProtobuf *)playbackQueueRequest dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"playbackQueueRequest"];
  }
  connectionState = self->_connectionState;
  if (connectionState)
  {
    v28 = [(_MRSetConnectionStateMessageProtobuf *)connectionState dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"connectionState"];
  }
  getVolumeMessage = self->_getVolumeMessage;
  if (getVolumeMessage)
  {
    v30 = [(_MRGetVolumeMessageProtobuf *)getVolumeMessage dictionaryRepresentation];
    [v3 setObject:v30 forKey:@"getVolumeMessage"];
  }
  getVolumeResultMessage = self->_getVolumeResultMessage;
  if (getVolumeResultMessage)
  {
    v32 = [(_MRGetVolumeResultMessageProtobuf *)getVolumeResultMessage dictionaryRepresentation];
    [v3 setObject:v32 forKey:@"getVolumeResultMessage"];
  }
  setVolumeMessage = self->_setVolumeMessage;
  if (setVolumeMessage)
  {
    v34 = [(_MRSetVolumeMessageProtobuf *)setVolumeMessage dictionaryRepresentation];
    [v3 setObject:v34 forKey:@"setVolumeMessage"];
  }
  volumeDidChangeMessage = self->_volumeDidChangeMessage;
  if (volumeDidChangeMessage)
  {
    v36 = [(_MRVolumeDidChangeMessageProtobuf *)volumeDidChangeMessage dictionaryRepresentation];
    [v3 setObject:v36 forKey:@"volumeDidChangeMessage"];
  }
  updateContentItemMessage = self->_updateContentItemMessage;
  if (updateContentItemMessage)
  {
    v38 = [(_MRUpdateContentItemMessageProtobuf *)updateContentItemMessage dictionaryRepresentation];
    [v3 setObject:v38 forKey:@"updateContentItemMessage"];
  }
  setDefaultSupportedCommandsMessage = self->_setDefaultSupportedCommandsMessage;
  if (setDefaultSupportedCommandsMessage)
  {
    v40 = [(_MRSetStateMessageProtobuf *)setDefaultSupportedCommandsMessage dictionaryRepresentation];
    [v3 setObject:v40 forKey:@"setDefaultSupportedCommandsMessage"];
  }
  getStateMessage = self->_getStateMessage;
  if (getStateMessage)
  {
    v42 = [(_MRGetStateMessageProtobuf *)getStateMessage dictionaryRepresentation];
    [v3 setObject:v42 forKey:@"getStateMessage"];
  }
  error = self->_error;
  if (error)
  {
    v44 = [(_MRErrorProtobuf *)error dictionaryRepresentation];
    [v3 setObject:v44 forKey:@"error"];
  }
  setArtworkMessage = self->_setArtworkMessage;
  if (setArtworkMessage)
  {
    v46 = [(_MRSetArtworkMessageProtobuf *)setArtworkMessage dictionaryRepresentation];
    [v3 setObject:v46 forKey:@"setArtworkMessage"];
  }
  registerHIDDeviceMessage = self->_registerHIDDeviceMessage;
  if (registerHIDDeviceMessage)
  {
    v48 = [(_MRRegisterHIDDeviceMessageProtobuf *)registerHIDDeviceMessage dictionaryRepresentation];
    [v3 setObject:v48 forKey:@"registerHIDDeviceMessage"];
  }
  registerHIDDeviceResultMessage = self->_registerHIDDeviceResultMessage;
  if (registerHIDDeviceResultMessage)
  {
    v50 = [(_MRRegisterHIDDeviceResultMessageProtobuf *)registerHIDDeviceResultMessage dictionaryRepresentation];
    [v3 setObject:v50 forKey:@"registerHIDDeviceResultMessage"];
  }
  sendHIDEventMessage = self->_sendHIDEventMessage;
  if (sendHIDEventMessage)
  {
    v52 = [(_MRSendHIDEventMessageProtobuf *)sendHIDEventMessage dictionaryRepresentation];
    [v3 setObject:v52 forKey:@"sendHIDEventMessage"];
  }
  sendHIDReportMessage = self->_sendHIDReportMessage;
  if (sendHIDReportMessage)
  {
    v54 = [(_MRSendHIDReportMessageProtobuf *)sendHIDReportMessage dictionaryRepresentation];
    [v3 setObject:v54 forKey:@"sendHIDReportMessage"];
  }
  sendVirtualTouchEventMessage = self->_sendVirtualTouchEventMessage;
  if (sendVirtualTouchEventMessage)
  {
    v56 = [(_MRSendVirtualTouchEventMessageProtobuf *)sendVirtualTouchEventMessage dictionaryRepresentation];
    [v3 setObject:v56 forKey:@"sendVirtualTouchEventMessage"];
  }
  masterVolumeControlCapabilitiesDidChangeMessage = self->_masterVolumeControlCapabilitiesDidChangeMessage;
  if (masterVolumeControlCapabilitiesDidChangeMessage)
  {
    v58 = [(_MRVolumeControlAvailabilityProtobuf *)masterVolumeControlCapabilitiesDidChangeMessage dictionaryRepresentation];
    [v3 setObject:v58 forKey:@"masterVolumeControlCapabilitiesDidChangeMessage"];
  }
  gameController = self->_gameController;
  if (gameController)
  {
    v60 = [(_MRGameControllerMessageProtobuf *)gameController dictionaryRepresentation];
    [v3 setObject:v60 forKey:@"gameController"];
  }
  registerGameController = self->_registerGameController;
  if (registerGameController)
  {
    v62 = [(_MRRegisterGameControllerMessageProtobuf *)registerGameController dictionaryRepresentation];
    [v3 setObject:v62 forKey:@"registerGameController"];
  }
  registerGameControllerResponse = self->_registerGameControllerResponse;
  if (registerGameControllerResponse)
  {
    v64 = [(_MRRegisterGameControllerResponseMessageProtobuf *)registerGameControllerResponse dictionaryRepresentation];
    [v3 setObject:v64 forKey:@"registerGameControllerResponse"];
  }
  unregisterGameController = self->_unregisterGameController;
  if (unregisterGameController)
  {
    v66 = [(_MRUnregisterGameControllerMessageProtobuf *)unregisterGameController dictionaryRepresentation];
    [v3 setObject:v66 forKey:@"unregisterGameController"];
  }
  registerForGameControllerEvents = self->_registerForGameControllerEvents;
  if (registerForGameControllerEvents)
  {
    v68 = [(_MRRegisterForGameControllerEventsMessageProtobuf *)registerForGameControllerEvents dictionaryRepresentation];
    [v3 setObject:v68 forKey:@"registerForGameControllerEvents"];
  }
  keyboardMessage = self->_keyboardMessage;
  if (keyboardMessage)
  {
    v70 = [(_MRKeyboardMessageProtobuf *)keyboardMessage dictionaryRepresentation];
    [v3 setObject:v70 forKey:@"keyboardMessage"];
  }
  getKeyboardMessage = self->_getKeyboardMessage;
  if (getKeyboardMessage)
  {
    v72 = [(_MRGetKeyboardSessionProtobuf *)getKeyboardMessage dictionaryRepresentation];
    [v3 setObject:v72 forKey:@"getKeyboardMessage"];
  }
  textInputMessage = self->_textInputMessage;
  if (textInputMessage)
  {
    v74 = [(_MRTextInputMessageProtobuf *)textInputMessage dictionaryRepresentation];
    [v3 setObject:v74 forKey:@"textInputMessage"];
  }
  getVoiceInputDevicesMessage = self->_getVoiceInputDevicesMessage;
  if (getVoiceInputDevicesMessage)
  {
    v76 = [(_MRGetVoiceInputDevicesMessageProtobuf *)getVoiceInputDevicesMessage dictionaryRepresentation];
    [v3 setObject:v76 forKey:@"getVoiceInputDevicesMessage"];
  }
  getVoiceInputDevicesResponseMessage = self->_getVoiceInputDevicesResponseMessage;
  if (getVoiceInputDevicesResponseMessage)
  {
    v78 = [(_MRGetVoiceInputDevicesResponseMessageProtobuf *)getVoiceInputDevicesResponseMessage dictionaryRepresentation];
    [v3 setObject:v78 forKey:@"getVoiceInputDevicesResponseMessage"];
  }
  registerVoiceInputDeviceMessage = self->_registerVoiceInputDeviceMessage;
  if (registerVoiceInputDeviceMessage)
  {
    v80 = [(_MRRegisterVoiceInputDeviceMessageProtobuf *)registerVoiceInputDeviceMessage dictionaryRepresentation];
    [v3 setObject:v80 forKey:@"registerVoiceInputDeviceMessage"];
  }
  registerVoiceInputDeviceResponseMessage = self->_registerVoiceInputDeviceResponseMessage;
  if (registerVoiceInputDeviceResponseMessage)
  {
    v82 = [(_MRRegisterVoiceInputDeviceResponseMessageProtobuf *)registerVoiceInputDeviceResponseMessage dictionaryRepresentation];
    [v3 setObject:v82 forKey:@"registerVoiceInputDeviceResponseMessage"];
  }
  setRecordingStateMessage = self->_setRecordingStateMessage;
  if (setRecordingStateMessage)
  {
    v84 = [(_MRSetRecordingStateMessageProtobuf *)setRecordingStateMessage dictionaryRepresentation];
    [v3 setObject:v84 forKey:@"setRecordingStateMessage"];
  }
  sendVoiceInputMessage = self->_sendVoiceInputMessage;
  if (sendVoiceInputMessage)
  {
    v86 = [(_MRSendVoiceInputMessageProtobuf *)sendVoiceInputMessage dictionaryRepresentation];
    [v3 setObject:v86 forKey:@"sendVoiceInputMessage"];
  }
  transactionPackets = self->_transactionPackets;
  if (transactionPackets)
  {
    v88 = [(_MRTransactionMessageProtobuf *)transactionPackets dictionaryRepresentation];
    [v3 setObject:v88 forKey:@"transactionPackets"];
  }
  cryptoPairingMessage = self->_cryptoPairingMessage;
  if (cryptoPairingMessage)
  {
    v90 = [(_MRCryptoPairingMessageProtobuf *)cryptoPairingMessage dictionaryRepresentation];
    [v3 setObject:v90 forKey:@"cryptoPairingMessage"];
  }
  gameControllerProperties = self->_gameControllerProperties;
  if (gameControllerProperties)
  {
    v92 = [(_MRGameControllerPropertiesMessageProtobuf *)gameControllerProperties dictionaryRepresentation];
    [v3 setObject:v92 forKey:@"gameControllerProperties"];
  }
  readyStateMessage = self->_readyStateMessage;
  if (readyStateMessage)
  {
    v94 = [(_MRSetReadyStateMessageProtobuf *)readyStateMessage dictionaryRepresentation];
    [v3 setObject:v94 forKey:@"readyStateMessage"];
  }
  sendButtonEventMessage = self->_sendButtonEventMessage;
  if (sendButtonEventMessage)
  {
    v96 = [(_MRSendButtonEventMessageProtobuf *)sendButtonEventMessage dictionaryRepresentation];
    [v3 setObject:v96 forKey:@"sendButtonEventMessage"];
  }
  setHiliteModeMessage = self->_setHiliteModeMessage;
  if (setHiliteModeMessage)
  {
    v98 = [(_MRSetHiliteModeMessageProtobuf *)setHiliteModeMessage dictionaryRepresentation];
    [v3 setObject:v98 forKey:@"setHiliteModeMessage"];
  }
  wakeDeviceMessage = self->_wakeDeviceMessage;
  if (wakeDeviceMessage)
  {
    v100 = [(_MRWakeDeviceMessageProtobuf *)wakeDeviceMessage dictionaryRepresentation];
    [v3 setObject:v100 forKey:@"wakeDeviceMessage"];
  }
  genericMessage = self->_genericMessage;
  if (genericMessage)
  {
    v102 = [(_MRGenericMessageProtobuf *)genericMessage dictionaryRepresentation];
    [v3 setObject:v102 forKey:@"genericMessage"];
  }
  sendPackedVirtualTouchEventMessage = self->_sendPackedVirtualTouchEventMessage;
  if (sendPackedVirtualTouchEventMessage)
  {
    v104 = [(_MRSendPackedVirtualTouchEventMessageProtobuf *)sendPackedVirtualTouchEventMessage dictionaryRepresentation];
    [v3 setObject:v104 forKey:@"sendPackedVirtualTouchEventMessage"];
  }
  sendLyricsEventMessage = self->_sendLyricsEventMessage;
  if (sendLyricsEventMessage)
  {
    v106 = [(_MRSendLyricsEventMessageProtobuf *)sendLyricsEventMessage dictionaryRepresentation];
    [v3 setObject:v106 forKey:@"sendLyricsEventMessage"];
  }
  setNowPlayingClientMessage = self->_setNowPlayingClientMessage;
  if (setNowPlayingClientMessage)
  {
    v108 = [(_MRSetNowPlayingClientMessageProtobuf *)setNowPlayingClientMessage dictionaryRepresentation];
    [v3 setObject:v108 forKey:@"setNowPlayingClientMessage"];
  }
  setNowPlayingPlayerMessage = self->_setNowPlayingPlayerMessage;
  if (setNowPlayingPlayerMessage)
  {
    v110 = [(_MRSetNowPlayingPlayerMessageProtobuf *)setNowPlayingPlayerMessage dictionaryRepresentation];
    [v3 setObject:v110 forKey:@"setNowPlayingPlayerMessage"];
  }
  modifyOutputContextRequestMessage = self->_modifyOutputContextRequestMessage;
  if (modifyOutputContextRequestMessage)
  {
    v112 = [(_MRAVModifyOutputContextRequestProtobuf *)modifyOutputContextRequestMessage dictionaryRepresentation];
    [v3 setObject:v112 forKey:@"modifyOutputContextRequestMessage"];
  }
  removeClientMessage = self->_removeClientMessage;
  if (removeClientMessage)
  {
    v114 = [(_MRRemoveClientMessageProtobuf *)removeClientMessage dictionaryRepresentation];
    [v3 setObject:v114 forKey:@"removeClientMessage"];
  }
  removePlayerMessage = self->_removePlayerMessage;
  if (removePlayerMessage)
  {
    v116 = [(_MRRemovePlayerMessageProtobuf *)removePlayerMessage dictionaryRepresentation];
    [v3 setObject:v116 forKey:@"removePlayerMessage"];
  }
  updateClientMessage = self->_updateClientMessage;
  if (updateClientMessage)
  {
    v118 = [(_MRUpdateClientMessageProtobuf *)updateClientMessage dictionaryRepresentation];
    [v3 setObject:v118 forKey:@"updateClientMessage"];
  }
  updateContentItemArtworkMessage = self->_updateContentItemArtworkMessage;
  if (updateContentItemArtworkMessage)
  {
    v120 = [(_MRUpdateContentItemArtworkMessageProtobuf *)updateContentItemArtworkMessage dictionaryRepresentation];
    [v3 setObject:v120 forKey:@"updateContentItemArtworkMessage"];
  }
  updatePlayerMessage = self->_updatePlayerMessage;
  if (updatePlayerMessage)
  {
    v122 = [(_MRUpdatePlayerMessageProtobuf *)updatePlayerMessage dictionaryRepresentation];
    [v3 setObject:v122 forKey:@"updatePlayerMessage"];
  }
  promptForRouteAuthorizationMessage = self->_promptForRouteAuthorizationMessage;
  if (promptForRouteAuthorizationMessage)
  {
    v124 = [(_MRPromptForRouteAuthorizationMessageProtobuf *)promptForRouteAuthorizationMessage dictionaryRepresentation];
    [v3 setObject:v124 forKey:@"promptForRouteAuthorizationMessage"];
  }
  promptForRouteAuthorizationResponseMessage = self->_promptForRouteAuthorizationResponseMessage;
  if (promptForRouteAuthorizationResponseMessage)
  {
    v126 = [(_MRPromptForRouteAuthorizationResponseMessageProtobuf *)promptForRouteAuthorizationResponseMessage dictionaryRepresentation];
    [v3 setObject:v126 forKey:@"promptForRouteAuthorizationResponseMessage"];
  }
  presentRouteAuthorizationStatusMessage = self->_presentRouteAuthorizationStatusMessage;
  if (presentRouteAuthorizationStatusMessage)
  {
    v128 = [(_MRPresentRouteAuthorizationStatusMessageProtobuf *)presentRouteAuthorizationStatusMessage dictionaryRepresentation];
    [v3 setObject:v128 forKey:@"presentRouteAuthorizationStatusMessage"];
  }
  getVolumeControlCapabilitiesMessage = self->_getVolumeControlCapabilitiesMessage;
  if (getVolumeControlCapabilitiesMessage)
  {
    v130 = [(_MRGetVolumeControlCapabilitiesMessageProtobuf *)getVolumeControlCapabilitiesMessage dictionaryRepresentation];
    [v3 setObject:v130 forKey:@"getVolumeControlCapabilitiesMessage"];
  }
  getVolumeControlCapabilitiesResultMessage = self->_getVolumeControlCapabilitiesResultMessage;
  if (getVolumeControlCapabilitiesResultMessage)
  {
    v132 = [(_MRGetVolumeControlCapabilitiesResultMessageProtobuf *)getVolumeControlCapabilitiesResultMessage dictionaryRepresentation];
    [v3 setObject:v132 forKey:@"getVolumeControlCapabilitiesResultMessage"];
  }
  volumeControlCapabilitiesDidChangeMessage = self->_volumeControlCapabilitiesDidChangeMessage;
  if (volumeControlCapabilitiesDidChangeMessage)
  {
    v134 = [(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf *)volumeControlCapabilitiesDidChangeMessage dictionaryRepresentation];
    [v3 setObject:v134 forKey:@"volumeControlCapabilitiesDidChangeMessage"];
  }
  updateOutputDevicesMessage = self->_updateOutputDevicesMessage;
  if (updateOutputDevicesMessage)
  {
    v136 = [(_MRUpdateOutputDevicesMessageProtobuf *)updateOutputDevicesMessage dictionaryRepresentation];
    [v3 setObject:v136 forKey:@"updateOutputDevicesMessage"];
  }
  removeOutputDevicesMessage = self->_removeOutputDevicesMessage;
  if (removeOutputDevicesMessage)
  {
    v138 = [(_MRRemoveOutputDevicesMessageProtobuf *)removeOutputDevicesMessage dictionaryRepresentation];
    [v3 setObject:v138 forKey:@"removeOutputDevicesMessage"];
  }
  remoteTextInputMessage = self->_remoteTextInputMessage;
  if (remoteTextInputMessage)
  {
    v140 = [(_MRRemoteTextInputMessageProtobuf *)remoteTextInputMessage dictionaryRepresentation];
    [v3 setObject:v140 forKey:@"remoteTextInputMessage"];
  }
  getRemoteTextInputSessionMessage = self->_getRemoteTextInputSessionMessage;
  if (getRemoteTextInputSessionMessage)
  {
    v142 = [(_MRGetRemoteTextInputSessionProtobuf *)getRemoteTextInputSessionMessage dictionaryRepresentation];
    [v3 setObject:v142 forKey:@"getRemoteTextInputSessionMessage"];
  }
  playbackSessionRequestMessage = self->_playbackSessionRequestMessage;
  if (playbackSessionRequestMessage)
  {
    v144 = [(_MRPlaybackSessionRequestMessageProtobuf *)playbackSessionRequestMessage dictionaryRepresentation];
    [v3 setObject:v144 forKey:@"playbackSessionRequestMessage"];
  }
  playbackSessionResponseMessage = self->_playbackSessionResponseMessage;
  if (playbackSessionResponseMessage)
  {
    v146 = [(_MRPlaybackSessionResponseMessageProtobuf *)playbackSessionResponseMessage dictionaryRepresentation];
    [v3 setObject:v146 forKey:@"playbackSessionResponseMessage"];
  }
  playbackSessionMigrateRequestMessage = self->_playbackSessionMigrateRequestMessage;
  if (playbackSessionMigrateRequestMessage)
  {
    v148 = [(_MRPlaybackSessionMigrateRequestMessageProtobuf *)playbackSessionMigrateRequestMessage dictionaryRepresentation];
    [v3 setObject:v148 forKey:@"playbackSessionMigrateRequestMessage"];
  }
  playbackSessionMigrateResponseMessage = self->_playbackSessionMigrateResponseMessage;
  if (playbackSessionMigrateResponseMessage)
  {
    v150 = [(_MRPlaybackSessionMigrateResponseMessageProtobuf *)playbackSessionMigrateResponseMessage dictionaryRepresentation];
    [v3 setObject:v150 forKey:@"playbackSessionMigrateResponseMessage"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v3 setObject:errorDescription forKey:@"errorDescription"];
  }
  playbackSessionMigrateBeginMessage = self->_playbackSessionMigrateBeginMessage;
  if (playbackSessionMigrateBeginMessage)
  {
    v153 = [(_MRPlaybackSessionMigrateBeginMessageProtobuf *)playbackSessionMigrateBeginMessage dictionaryRepresentation];
    [v3 setObject:v153 forKey:@"playbackSessionMigrateBeginMessage"];
  }
  playbackSessionMigrateEndMessage = self->_playbackSessionMigrateEndMessage;
  if (playbackSessionMigrateEndMessage)
  {
    v155 = [(_MRPlaybackSessionMigrateEndMessageProtobuf *)playbackSessionMigrateEndMessage dictionaryRepresentation];
    [v3 setObject:v155 forKey:@"playbackSessionMigrateEndMessage"];
  }
  updateActiveSystemEndpointMessage = self->_updateActiveSystemEndpointMessage;
  if (updateActiveSystemEndpointMessage)
  {
    v157 = [(_MRUpdateActiveSystemEndpointMessageProtobuf *)updateActiveSystemEndpointMessage dictionaryRepresentation];
    [v3 setObject:v157 forKey:@"updateActiveSystemEndpointMessage"];
  }
  discoveryModeMessage = self->_discoveryModeMessage;
  if (discoveryModeMessage)
  {
    v159 = [(_MRSetDiscoveryModeProtobufMessage *)discoveryModeMessage dictionaryRepresentation];
    [v3 setObject:v159 forKey:@"discoveryModeMessage"];
  }
  updateEndpointsMessage = self->_updateEndpointsMessage;
  if (updateEndpointsMessage)
  {
    v161 = [(_MRUpdateEndpointsMessageProtobuf *)updateEndpointsMessage dictionaryRepresentation];
    [v3 setObject:v161 forKey:@"updateEndpointsMessage"];
  }
  removeEndpointsMessage = self->_removeEndpointsMessage;
  if (removeEndpointsMessage)
  {
    v163 = [(_MRRemoveEndpointsMessageProtobuf *)removeEndpointsMessage dictionaryRepresentation];
    [v3 setObject:v163 forKey:@"removeEndpointsMessage"];
  }
  playerClientPropertiesMessage = self->_playerClientPropertiesMessage;
  if (playerClientPropertiesMessage)
  {
    v165 = [(_MRPlayerClientPropertiesMessageProtobuf *)playerClientPropertiesMessage dictionaryRepresentation];
    [v3 setObject:v165 forKey:@"playerClientPropertiesMessage"];
  }
  originClientPropertiesMessage = self->_originClientPropertiesMessage;
  if (originClientPropertiesMessage)
  {
    v167 = [(_MROriginClientPropertiesMessageProtobuf *)originClientPropertiesMessage dictionaryRepresentation];
    [v3 setObject:v167 forKey:@"originClientPropertiesMessage"];
  }
  audioFadeMessage = self->_audioFadeMessage;
  if (audioFadeMessage)
  {
    v169 = [(_MRAudioFadeMessageProtobuf *)audioFadeMessage dictionaryRepresentation];
    [v3 setObject:v169 forKey:@"audioFadeMessage"];
  }
  audioFadeResponseMessage = self->_audioFadeResponseMessage;
  if (audioFadeResponseMessage)
  {
    v171 = [(_MRAudioFadeResponseMessageProtobuf *)audioFadeResponseMessage dictionaryRepresentation];
    [v3 setObject:v171 forKey:@"audioFadeResponseMessage"];
  }
  discoveryUpdateEndpointsMessage = self->_discoveryUpdateEndpointsMessage;
  if (discoveryUpdateEndpointsMessage)
  {
    v173 = [(_MRDiscoveryUpdateEndpointsProtobufMessage *)discoveryUpdateEndpointsMessage dictionaryRepresentation];
    [v3 setObject:v173 forKey:@"discoveryUpdateEndpointsMessage"];
  }
  discoveryUpdateOutputDevicesMessage = self->_discoveryUpdateOutputDevicesMessage;
  if (discoveryUpdateOutputDevicesMessage)
  {
    v175 = [(_MRDiscoveryUpdateOutputDevicesProtobufMessage *)discoveryUpdateOutputDevicesMessage dictionaryRepresentation];
    [v3 setObject:v175 forKey:@"discoveryUpdateOutputDevicesMessage"];
  }
  setListeningModeMessage = self->_setListeningModeMessage;
  if (setListeningModeMessage)
  {
    v177 = [(_MRSetListeningModeMessageProtobuf *)setListeningModeMessage dictionaryRepresentation];
    [v3 setObject:v177 forKey:@"setListeningModeMessage"];
  }
  configureConnectionMessage = self->_configureConnectionMessage;
  if (configureConnectionMessage)
  {
    v179 = [(_MRConfigureConnectionMessageProtobuf *)configureConnectionMessage dictionaryRepresentation];
    [v3 setObject:v179 forKey:@"configureConnectionMessage"];
  }
  createHostedEndpointRequest = self->_createHostedEndpointRequest;
  if (createHostedEndpointRequest)
  {
    v181 = [(_MRCreateHostedEndpointRequestProtobuf *)createHostedEndpointRequest dictionaryRepresentation];
    [v3 setObject:v181 forKey:@"createHostedEndpointRequest"];
  }
  createHostedEndpointResponse = self->_createHostedEndpointResponse;
  if (createHostedEndpointResponse)
  {
    v183 = [(_MRCreateHostedEndpointResponseProtobuf *)createHostedEndpointResponse dictionaryRepresentation];
    [v3 setObject:v183 forKey:@"createHostedEndpointResponse"];
  }
  adjustVolumeMessage = self->_adjustVolumeMessage;
  if (adjustVolumeMessage)
  {
    v185 = [(_MRAdjustVolumeMessageProtobuf *)adjustVolumeMessage dictionaryRepresentation];
    [v3 setObject:v185 forKey:@"adjustVolumeMessage"];
  }
  getVolumeMutedMessage = self->_getVolumeMutedMessage;
  if (getVolumeMutedMessage)
  {
    v187 = [(_MRGetVolumeMutedMessageProtobuf *)getVolumeMutedMessage dictionaryRepresentation];
    [v3 setObject:v187 forKey:@"getVolumeMutedMessage"];
  }
  getVolumeMutedResultMessage = self->_getVolumeMutedResultMessage;
  if (getVolumeMutedResultMessage)
  {
    v189 = [(_MRGetVolumeMutedResultMessageProtobuf *)getVolumeMutedResultMessage dictionaryRepresentation];
    [v3 setObject:v189 forKey:@"getVolumeMutedResultMessage"];
  }
  setVolumeMutedMessage = self->_setVolumeMutedMessage;
  if (setVolumeMutedMessage)
  {
    v191 = [(_MRSetVolumeMutedMessageProtobuf *)setVolumeMutedMessage dictionaryRepresentation];
    [v3 setObject:v191 forKey:@"setVolumeMutedMessage"];
  }
  volumeMutedDidChangeMessage = self->_volumeMutedDidChangeMessage;
  if (volumeMutedDidChangeMessage)
  {
    v193 = [(_MRVolumeMutedDidChangeMessageProtobuf *)volumeMutedDidChangeMessage dictionaryRepresentation];
    [v3 setObject:v193 forKey:@"volumeMutedDidChangeMessage"];
  }
  setConversationDetectionEnabledMessage = self->_setConversationDetectionEnabledMessage;
  if (setConversationDetectionEnabledMessage)
  {
    v195 = [(_MRSetConversationDetectionEnabledMessageProtobuf *)setConversationDetectionEnabledMessage dictionaryRepresentation];
    [v3 setObject:v195 forKey:@"setConversationDetectionEnabledMessage"];
  }
  playerClientParticipantsUpdateMessage = self->_playerClientParticipantsUpdateMessage;
  if (playerClientParticipantsUpdateMessage)
  {
    v197 = [(_MRPlayerClientParticipantsUpdateMessageProtobuf *)playerClientParticipantsUpdateMessage dictionaryRepresentation];
    [v3 setObject:v197 forKey:@"playerClientParticipantsUpdateMessage"];
  }
  requestGroupSessionMessage = self->_requestGroupSessionMessage;
  if (requestGroupSessionMessage)
  {
    v199 = [(_MRRequestGroupSessionMessageProtobuf *)requestGroupSessionMessage dictionaryRepresentation];
    [v3 setObject:v199 forKey:@"requestGroupSessionMessage"];
  }
  createApplicationConnectionMessage = self->_createApplicationConnectionMessage;
  if (createApplicationConnectionMessage)
  {
    v201 = [(_MRCreateApplicationConnectionMessageProtobuf *)createApplicationConnectionMessage dictionaryRepresentation];
    [v3 setObject:v201 forKey:@"createApplicationConnectionMessage"];
  }
  applicationConnectionProtocolMessage = self->_applicationConnectionProtocolMessage;
  if (applicationConnectionProtocolMessage)
  {
    v203 = [(_MRApplicationConnectionProtocolMessageProtobuf *)applicationConnectionProtocolMessage dictionaryRepresentation];
    [v3 setObject:v203 forKey:@"applicationConnectionProtocolMessage"];
  }
  invalidateApplicationConnectionMessage = self->_invalidateApplicationConnectionMessage;
  if (invalidateApplicationConnectionMessage)
  {
    v205 = [(_MRApplicationConnectionContextProtobuf *)invalidateApplicationConnectionMessage dictionaryRepresentation];
    [v3 setObject:v205 forKey:@"InvalidateApplicationConnectionMessage"];
  }
  id v206 = v3;

  return v206;
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[182] = self->_type;
    *((unsigned char *)v4 + 840) |= 4u;
  }
  id v6 = v4;
  if (self->_replyIdentifier)
  {
    objc_msgSend(v4, "setReplyIdentifier:");
    int v4 = v6;
  }
  if (self->_authenticationToken)
  {
    objc_msgSend(v6, "setAuthenticationToken:");
    int v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[40] = self->_errorCode;
    *((unsigned char *)v4 + 840) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_timestamp;
    *((unsigned char *)v4 + 840) |= 1u;
  }
  if (self->_sendCommandMessage)
  {
    objc_msgSend(v6, "setSendCommandMessage:");
    int v4 = v6;
  }
  if (self->_sendCommandResultMessage)
  {
    objc_msgSend(v6, "setSendCommandResultMessage:");
    int v4 = v6;
  }
  if (self->_getStateMessage)
  {
    objc_msgSend(v6, "setGetStateMessage:");
    int v4 = v6;
  }
  if (self->_setStateMessage)
  {
    objc_msgSend(v6, "setSetStateMessage:");
    int v4 = v6;
  }
  if (self->_setArtworkMessage)
  {
    objc_msgSend(v6, "setSetArtworkMessage:");
    int v4 = v6;
  }
  if (self->_registerHIDDeviceMessage)
  {
    objc_msgSend(v6, "setRegisterHIDDeviceMessage:");
    int v4 = v6;
  }
  if (self->_registerHIDDeviceResultMessage)
  {
    objc_msgSend(v6, "setRegisterHIDDeviceResultMessage:");
    int v4 = v6;
  }
  if (self->_sendHIDEventMessage)
  {
    objc_msgSend(v6, "setSendHIDEventMessage:");
    int v4 = v6;
  }
  if (self->_sendHIDReportMessage)
  {
    objc_msgSend(v6, "setSendHIDReportMessage:");
    int v4 = v6;
  }
  if (self->_sendVirtualTouchEventMessage)
  {
    objc_msgSend(v6, "setSendVirtualTouchEventMessage:");
    int v4 = v6;
  }
  if (self->_notificationMessage)
  {
    objc_msgSend(v6, "setNotificationMessage:");
    int v4 = v6;
  }
  if (self->_contentItemsChangedNotificationMessage)
  {
    objc_msgSend(v6, "setContentItemsChangedNotificationMessage:");
    int v4 = v6;
  }
  if (self->_deviceInfoMessage)
  {
    objc_msgSend(v6, "setDeviceInfoMessage:");
    int v4 = v6;
  }
  if (self->_clientUpdatesConfigMessage)
  {
    objc_msgSend(v6, "setClientUpdatesConfigMessage:");
    int v4 = v6;
  }
  if (self->_masterVolumeControlCapabilitiesDidChangeMessage)
  {
    objc_msgSend(v6, "setMasterVolumeControlCapabilitiesDidChangeMessage:");
    int v4 = v6;
  }
  if (self->_gameController)
  {
    objc_msgSend(v6, "setGameController:");
    int v4 = v6;
  }
  if (self->_registerGameController)
  {
    objc_msgSend(v6, "setRegisterGameController:");
    int v4 = v6;
  }
  if (self->_registerGameControllerResponse)
  {
    objc_msgSend(v6, "setRegisterGameControllerResponse:");
    int v4 = v6;
  }
  if (self->_unregisterGameController)
  {
    objc_msgSend(v6, "setUnregisterGameController:");
    int v4 = v6;
  }
  if (self->_registerForGameControllerEvents)
  {
    objc_msgSend(v6, "setRegisterForGameControllerEvents:");
    int v4 = v6;
  }
  if (self->_keyboardMessage)
  {
    objc_msgSend(v6, "setKeyboardMessage:");
    int v4 = v6;
  }
  if (self->_getKeyboardMessage)
  {
    objc_msgSend(v6, "setGetKeyboardMessage:");
    int v4 = v6;
  }
  if (self->_textInputMessage)
  {
    objc_msgSend(v6, "setTextInputMessage:");
    int v4 = v6;
  }
  if (self->_getVoiceInputDevicesMessage)
  {
    objc_msgSend(v6, "setGetVoiceInputDevicesMessage:");
    int v4 = v6;
  }
  if (self->_getVoiceInputDevicesResponseMessage)
  {
    objc_msgSend(v6, "setGetVoiceInputDevicesResponseMessage:");
    int v4 = v6;
  }
  if (self->_registerVoiceInputDeviceMessage)
  {
    objc_msgSend(v6, "setRegisterVoiceInputDeviceMessage:");
    int v4 = v6;
  }
  if (self->_registerVoiceInputDeviceResponseMessage)
  {
    objc_msgSend(v6, "setRegisterVoiceInputDeviceResponseMessage:");
    int v4 = v6;
  }
  if (self->_setRecordingStateMessage)
  {
    objc_msgSend(v6, "setSetRecordingStateMessage:");
    int v4 = v6;
  }
  if (self->_sendVoiceInputMessage)
  {
    objc_msgSend(v6, "setSendVoiceInputMessage:");
    int v4 = v6;
  }
  if (self->_playbackQueueRequest)
  {
    objc_msgSend(v6, "setPlaybackQueueRequest:");
    int v4 = v6;
  }
  if (self->_transactionPackets)
  {
    objc_msgSend(v6, "setTransactionPackets:");
    int v4 = v6;
  }
  if (self->_cryptoPairingMessage)
  {
    objc_msgSend(v6, "setCryptoPairingMessage:");
    int v4 = v6;
  }
  if (self->_gameControllerProperties)
  {
    objc_msgSend(v6, "setGameControllerProperties:");
    int v4 = v6;
  }
  if (self->_readyStateMessage)
  {
    objc_msgSend(v6, "setReadyStateMessage:");
    int v4 = v6;
  }
  if (self->_connectionState)
  {
    objc_msgSend(v6, "setConnectionState:");
    int v4 = v6;
  }
  if (self->_sendButtonEventMessage)
  {
    objc_msgSend(v6, "setSendButtonEventMessage:");
    int v4 = v6;
  }
  if (self->_setHiliteModeMessage)
  {
    objc_msgSend(v6, "setSetHiliteModeMessage:");
    int v4 = v6;
  }
  if (self->_wakeDeviceMessage)
  {
    objc_msgSend(v6, "setWakeDeviceMessage:");
    int v4 = v6;
  }
  if (self->_genericMessage)
  {
    objc_msgSend(v6, "setGenericMessage:");
    int v4 = v6;
  }
  if (self->_sendPackedVirtualTouchEventMessage)
  {
    objc_msgSend(v6, "setSendPackedVirtualTouchEventMessage:");
    int v4 = v6;
  }
  if (self->_sendLyricsEventMessage)
  {
    objc_msgSend(v6, "setSendLyricsEventMessage:");
    int v4 = v6;
  }
  if (self->_setNowPlayingClientMessage)
  {
    objc_msgSend(v6, "setSetNowPlayingClientMessage:");
    int v4 = v6;
  }
  if (self->_setNowPlayingPlayerMessage)
  {
    objc_msgSend(v6, "setSetNowPlayingPlayerMessage:");
    int v4 = v6;
  }
  if (self->_modifyOutputContextRequestMessage)
  {
    objc_msgSend(v6, "setModifyOutputContextRequestMessage:");
    int v4 = v6;
  }
  if (self->_getVolumeMessage)
  {
    objc_msgSend(v6, "setGetVolumeMessage:");
    int v4 = v6;
  }
  if (self->_getVolumeResultMessage)
  {
    objc_msgSend(v6, "setGetVolumeResultMessage:");
    int v4 = v6;
  }
  if (self->_setVolumeMessage)
  {
    objc_msgSend(v6, "setSetVolumeMessage:");
    int v4 = v6;
  }
  if (self->_volumeDidChangeMessage)
  {
    objc_msgSend(v6, "setVolumeDidChangeMessage:");
    int v4 = v6;
  }
  if (self->_removeClientMessage)
  {
    objc_msgSend(v6, "setRemoveClientMessage:");
    int v4 = v6;
  }
  if (self->_removePlayerMessage)
  {
    objc_msgSend(v6, "setRemovePlayerMessage:");
    int v4 = v6;
  }
  if (self->_updateClientMessage)
  {
    objc_msgSend(v6, "setUpdateClientMessage:");
    int v4 = v6;
  }
  if (self->_updateContentItemMessage)
  {
    objc_msgSend(v6, "setUpdateContentItemMessage:");
    int v4 = v6;
  }
  if (self->_updateContentItemArtworkMessage)
  {
    objc_msgSend(v6, "setUpdateContentItemArtworkMessage:");
    int v4 = v6;
  }
  if (self->_updatePlayerMessage)
  {
    objc_msgSend(v6, "setUpdatePlayerMessage:");
    int v4 = v6;
  }
  if (self->_promptForRouteAuthorizationMessage)
  {
    objc_msgSend(v6, "setPromptForRouteAuthorizationMessage:");
    int v4 = v6;
  }
  if (self->_promptForRouteAuthorizationResponseMessage)
  {
    objc_msgSend(v6, "setPromptForRouteAuthorizationResponseMessage:");
    int v4 = v6;
  }
  if (self->_presentRouteAuthorizationStatusMessage)
  {
    objc_msgSend(v6, "setPresentRouteAuthorizationStatusMessage:");
    int v4 = v6;
  }
  if (self->_getVolumeControlCapabilitiesMessage)
  {
    objc_msgSend(v6, "setGetVolumeControlCapabilitiesMessage:");
    int v4 = v6;
  }
  if (self->_getVolumeControlCapabilitiesResultMessage)
  {
    objc_msgSend(v6, "setGetVolumeControlCapabilitiesResultMessage:");
    int v4 = v6;
  }
  if (self->_volumeControlCapabilitiesDidChangeMessage)
  {
    objc_msgSend(v6, "setVolumeControlCapabilitiesDidChangeMessage:");
    int v4 = v6;
  }
  if (self->_updateOutputDevicesMessage)
  {
    objc_msgSend(v6, "setUpdateOutputDevicesMessage:");
    int v4 = v6;
  }
  if (self->_removeOutputDevicesMessage)
  {
    objc_msgSend(v6, "setRemoveOutputDevicesMessage:");
    int v4 = v6;
  }
  if (self->_remoteTextInputMessage)
  {
    objc_msgSend(v6, "setRemoteTextInputMessage:");
    int v4 = v6;
  }
  if (self->_getRemoteTextInputSessionMessage)
  {
    objc_msgSend(v6, "setGetRemoteTextInputSessionMessage:");
    int v4 = v6;
  }
  if (self->_playbackSessionRequestMessage)
  {
    objc_msgSend(v6, "setPlaybackSessionRequestMessage:");
    int v4 = v6;
  }
  if (self->_playbackSessionResponseMessage)
  {
    objc_msgSend(v6, "setPlaybackSessionResponseMessage:");
    int v4 = v6;
  }
  if (self->_setDefaultSupportedCommandsMessage)
  {
    objc_msgSend(v6, "setSetDefaultSupportedCommandsMessage:");
    int v4 = v6;
  }
  if (self->_playbackSessionMigrateRequestMessage)
  {
    objc_msgSend(v6, "setPlaybackSessionMigrateRequestMessage:");
    int v4 = v6;
  }
  if (self->_playbackSessionMigrateResponseMessage)
  {
    objc_msgSend(v6, "setPlaybackSessionMigrateResponseMessage:");
    int v4 = v6;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v6, "setErrorDescription:");
    int v4 = v6;
  }
  if (self->_playbackSessionMigrateBeginMessage)
  {
    objc_msgSend(v6, "setPlaybackSessionMigrateBeginMessage:");
    int v4 = v6;
  }
  if (self->_playbackSessionMigrateEndMessage)
  {
    objc_msgSend(v6, "setPlaybackSessionMigrateEndMessage:");
    int v4 = v6;
  }
  if (self->_updateActiveSystemEndpointMessage)
  {
    objc_msgSend(v6, "setUpdateActiveSystemEndpointMessage:");
    int v4 = v6;
  }
  if (self->_discoveryModeMessage)
  {
    objc_msgSend(v6, "setDiscoveryModeMessage:");
    int v4 = v6;
  }
  if (self->_updateEndpointsMessage)
  {
    objc_msgSend(v6, "setUpdateEndpointsMessage:");
    int v4 = v6;
  }
  if (self->_removeEndpointsMessage)
  {
    objc_msgSend(v6, "setRemoveEndpointsMessage:");
    int v4 = v6;
  }
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v6, "setUniqueIdentifier:");
    int v4 = v6;
  }
  if (self->_playerClientPropertiesMessage)
  {
    objc_msgSend(v6, "setPlayerClientPropertiesMessage:");
    int v4 = v6;
  }
  if (self->_originClientPropertiesMessage)
  {
    objc_msgSend(v6, "setOriginClientPropertiesMessage:");
    int v4 = v6;
  }
  if (self->_audioFadeMessage)
  {
    objc_msgSend(v6, "setAudioFadeMessage:");
    int v4 = v6;
  }
  if (self->_audioFadeResponseMessage)
  {
    objc_msgSend(v6, "setAudioFadeResponseMessage:");
    int v4 = v6;
  }
  if (self->_discoveryUpdateEndpointsMessage)
  {
    objc_msgSend(v6, "setDiscoveryUpdateEndpointsMessage:");
    int v4 = v6;
  }
  if (self->_discoveryUpdateOutputDevicesMessage)
  {
    objc_msgSend(v6, "setDiscoveryUpdateOutputDevicesMessage:");
    int v4 = v6;
  }
  if (self->_setListeningModeMessage)
  {
    objc_msgSend(v6, "setSetListeningModeMessage:");
    int v4 = v6;
  }
  if (self->_error)
  {
    objc_msgSend(v6, "setError:");
    int v4 = v6;
  }
  if (self->_configureConnectionMessage)
  {
    objc_msgSend(v6, "setConfigureConnectionMessage:");
    int v4 = v6;
  }
  if (self->_createHostedEndpointRequest)
  {
    objc_msgSend(v6, "setCreateHostedEndpointRequest:");
    int v4 = v6;
  }
  if (self->_createHostedEndpointResponse)
  {
    objc_msgSend(v6, "setCreateHostedEndpointResponse:");
    int v4 = v6;
  }
  if (self->_adjustVolumeMessage)
  {
    objc_msgSend(v6, "setAdjustVolumeMessage:");
    int v4 = v6;
  }
  if (self->_getVolumeMutedMessage)
  {
    objc_msgSend(v6, "setGetVolumeMutedMessage:");
    int v4 = v6;
  }
  if (self->_getVolumeMutedResultMessage)
  {
    objc_msgSend(v6, "setGetVolumeMutedResultMessage:");
    int v4 = v6;
  }
  if (self->_setVolumeMutedMessage)
  {
    objc_msgSend(v6, "setSetVolumeMutedMessage:");
    int v4 = v6;
  }
  if (self->_volumeMutedDidChangeMessage)
  {
    objc_msgSend(v6, "setVolumeMutedDidChangeMessage:");
    int v4 = v6;
  }
  if (self->_setConversationDetectionEnabledMessage)
  {
    objc_msgSend(v6, "setSetConversationDetectionEnabledMessage:");
    int v4 = v6;
  }
  if (self->_playerClientParticipantsUpdateMessage)
  {
    objc_msgSend(v6, "setPlayerClientParticipantsUpdateMessage:");
    int v4 = v6;
  }
  if (self->_requestGroupSessionMessage)
  {
    objc_msgSend(v6, "setRequestGroupSessionMessage:");
    int v4 = v6;
  }
  if (self->_createApplicationConnectionMessage)
  {
    objc_msgSend(v6, "setCreateApplicationConnectionMessage:");
    int v4 = v6;
  }
  if (self->_applicationConnectionProtocolMessage)
  {
    objc_msgSend(v6, "setApplicationConnectionProtocolMessage:");
    int v4 = v6;
  }
  if (self->_invalidateApplicationConnectionMessage)
  {
    objc_msgSend(v6, "setInvalidateApplicationConnectionMessage:");
    int v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 728) = self->_type;
    *(unsigned char *)(v5 + 840) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_replyIdentifier copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 536);
  *(void *)(v6 + 536) = v7;

  uint64_t v9 = [(NSString *)self->_authenticationToken copyWithZone:a3];
  v10 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v9;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_errorCode;
    *(unsigned char *)(v6 + 840) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v6 + 8) = self->_timestamp;
    *(unsigned char *)(v6 + 840) |= 1u;
  }
  id v12 = [(_MRSendCommandMessageProtobuf *)self->_sendCommandMessage copyWithZone:a3];
  v13 = *(void **)(v6 + 560);
  *(void *)(v6 + 560) = v12;

  id v14 = [(_MRSendCommandResultMessageProtobuf *)self->_sendCommandResultMessage copyWithZone:a3];
  v15 = *(void **)(v6 + 568);
  *(void *)(v6 + 568) = v14;

  id v16 = [(_MRGetStateMessageProtobuf *)self->_getStateMessage copyWithZone:a3];
  v17 = *(void **)(v6 + 216);
  *(void *)(v6 + 216) = v16;

  id v18 = [(_MRSetStateMessageProtobuf *)self->_setStateMessage copyWithZone:a3];
  v19 = *(void **)(v6 + 688);
  *(void *)(v6 + 688) = v18;

  id v20 = [(_MRSetArtworkMessageProtobuf *)self->_setArtworkMessage copyWithZone:a3];
  v21 = *(void **)(v6 + 624);
  *(void *)(v6 + 624) = v20;

  id v22 = [(_MRRegisterHIDDeviceMessageProtobuf *)self->_registerHIDDeviceMessage copyWithZone:a3];
  v23 = *(void **)(v6 + 464);
  *(void *)(v6 + 464) = v22;

  id v24 = [(_MRRegisterHIDDeviceResultMessageProtobuf *)self->_registerHIDDeviceResultMessage copyWithZone:a3];
  v25 = *(void **)(v6 + 472);
  *(void *)(v6 + 472) = v24;

  id v26 = [(_MRSendHIDEventMessageProtobuf *)self->_sendHIDEventMessage copyWithZone:a3];
  v27 = *(void **)(v6 + 576);
  *(void *)(v6 + 576) = v26;

  id v28 = [(_MRSendHIDReportMessageProtobuf *)self->_sendHIDReportMessage copyWithZone:a3];
  v29 = *(void **)(v6 + 584);
  *(void *)(v6 + 584) = v28;

  id v30 = [(_MRSendVirtualTouchEventMessageProtobuf *)self->_sendVirtualTouchEventMessage copyWithZone:a3];
  v31 = *(void **)(v6 + 608);
  *(void *)(v6 + 608) = v30;

  id v32 = [(_MRNotificationMessageProtobuf *)self->_notificationMessage copyWithZone:a3];
  v33 = *(void **)(v6 + 320);
  *(void *)(v6 + 320) = v32;

  id v34 = [(_MRPlaybackQueueProtobuf *)self->_contentItemsChangedNotificationMessage copyWithZone:a3];
  v35 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v34;

  id v36 = [(_MRDeviceInfoMessageProtobuf *)self->_deviceInfoMessage copyWithZone:a3];
  v37 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v36;

  id v38 = [(_MRClientUpdatesConfigurationProtobuf *)self->_clientUpdatesConfigMessage copyWithZone:a3];
  v39 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v38;

  id v40 = [(_MRVolumeControlAvailabilityProtobuf *)self->_masterVolumeControlCapabilitiesDidChangeMessage copyWithZone:a3];
  v41 = *(void **)(v6 + 304);
  *(void *)(v6 + 304) = v40;

  id v42 = [(_MRGameControllerMessageProtobuf *)self->_gameController copyWithZone:a3];
  v43 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v42;

  id v44 = [(_MRRegisterGameControllerMessageProtobuf *)self->_registerGameController copyWithZone:a3];
  v45 = *(void **)(v6 + 448);
  *(void *)(v6 + 448) = v44;

  id v46 = [(_MRRegisterGameControllerResponseMessageProtobuf *)self->_registerGameControllerResponse copyWithZone:a3];
  v47 = *(void **)(v6 + 456);
  *(void *)(v6 + 456) = v46;

  id v48 = [(_MRUnregisterGameControllerMessageProtobuf *)self->_unregisterGameController copyWithZone:a3];
  v49 = *(void **)(v6 + 744);
  *(void *)(v6 + 744) = v48;

  id v50 = [(_MRRegisterForGameControllerEventsMessageProtobuf *)self->_registerForGameControllerEvents copyWithZone:a3];
  v51 = *(void **)(v6 + 440);
  *(void *)(v6 + 440) = v50;

  id v52 = [(_MRKeyboardMessageProtobuf *)self->_keyboardMessage copyWithZone:a3];
  v53 = *(void **)(v6 + 296);
  *(void *)(v6 + 296) = v52;

  id v54 = [(_MRGetKeyboardSessionProtobuf *)self->_getKeyboardMessage copyWithZone:a3];
  v55 = *(void **)(v6 + 200);
  *(void *)(v6 + 200) = v54;

  id v56 = [(_MRTextInputMessageProtobuf *)self->_textInputMessage copyWithZone:a3];
  v57 = *(void **)(v6 + 712);
  *(void *)(v6 + 712) = v56;

  id v58 = [(_MRGetVoiceInputDevicesMessageProtobuf *)self->_getVoiceInputDevicesMessage copyWithZone:a3];
  v59 = *(void **)(v6 + 224);
  *(void *)(v6 + 224) = v58;

  id v60 = [(_MRGetVoiceInputDevicesResponseMessageProtobuf *)self->_getVoiceInputDevicesResponseMessage copyWithZone:a3];
  v61 = *(void **)(v6 + 232);
  *(void *)(v6 + 232) = v60;

  id v62 = [(_MRRegisterVoiceInputDeviceMessageProtobuf *)self->_registerVoiceInputDeviceMessage copyWithZone:a3];
  v63 = *(void **)(v6 + 480);
  *(void *)(v6 + 480) = v62;

  id v64 = [(_MRRegisterVoiceInputDeviceResponseMessageProtobuf *)self->_registerVoiceInputDeviceResponseMessage copyWithZone:a3];
  v65 = *(void **)(v6 + 488);
  *(void *)(v6 + 488) = v64;

  id v66 = [(_MRSetRecordingStateMessageProtobuf *)self->_setRecordingStateMessage copyWithZone:a3];
  v67 = *(void **)(v6 + 680);
  *(void *)(v6 + 680) = v66;

  id v68 = [(_MRSendVoiceInputMessageProtobuf *)self->_sendVoiceInputMessage copyWithZone:a3];
  v69 = *(void **)(v6 + 616);
  *(void *)(v6 + 616) = v68;

  id v70 = [(_MRPlaybackQueueRequestProtobuf *)self->_playbackQueueRequest copyWithZone:a3];
  v71 = *(void **)(v6 + 336);
  *(void *)(v6 + 336) = v70;

  id v72 = [(_MRTransactionMessageProtobuf *)self->_transactionPackets copyWithZone:a3];
  v73 = *(void **)(v6 + 720);
  *(void *)(v6 + 720) = v72;

  id v74 = [(_MRCryptoPairingMessageProtobuf *)self->_cryptoPairingMessage copyWithZone:a3];
  v75 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v74;

  id v76 = [(_MRGameControllerPropertiesMessageProtobuf *)self->_gameControllerProperties copyWithZone:a3];
  v77 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v76;

  id v78 = [(_MRSetReadyStateMessageProtobuf *)self->_readyStateMessage copyWithZone:a3];
  v79 = *(void **)(v6 + 432);
  *(void *)(v6 + 432) = v78;

  id v80 = [(_MRSetConnectionStateMessageProtobuf *)self->_connectionState copyWithZone:a3];
  v81 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v80;

  id v82 = [(_MRSendButtonEventMessageProtobuf *)self->_sendButtonEventMessage copyWithZone:a3];
  v83 = *(void **)(v6 + 552);
  *(void *)(v6 + 552) = v82;

  id v84 = [(_MRSetHiliteModeMessageProtobuf *)self->_setHiliteModeMessage copyWithZone:a3];
  v85 = *(void **)(v6 + 648);
  *(void *)(v6 + 648) = v84;

  id v86 = [(_MRWakeDeviceMessageProtobuf *)self->_wakeDeviceMessage copyWithZone:a3];
  v87 = *(void **)(v6 + 832);
  *(void *)(v6 + 832) = v86;

  id v88 = [(_MRGenericMessageProtobuf *)self->_genericMessage copyWithZone:a3];
  v89 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v88;

  id v90 = [(_MRSendPackedVirtualTouchEventMessageProtobuf *)self->_sendPackedVirtualTouchEventMessage copyWithZone:a3];
  v91 = *(void **)(v6 + 600);
  *(void *)(v6 + 600) = v90;

  id v92 = [(_MRSendLyricsEventMessageProtobuf *)self->_sendLyricsEventMessage copyWithZone:a3];
  v93 = *(void **)(v6 + 592);
  *(void *)(v6 + 592) = v92;

  id v94 = [(_MRSetNowPlayingClientMessageProtobuf *)self->_setNowPlayingClientMessage copyWithZone:a3];
  v95 = *(void **)(v6 + 664);
  *(void *)(v6 + 664) = v94;

  id v96 = [(_MRSetNowPlayingPlayerMessageProtobuf *)self->_setNowPlayingPlayerMessage copyWithZone:a3];
  v97 = *(void **)(v6 + 672);
  *(void *)(v6 + 672) = v96;

  id v98 = [(_MRAVModifyOutputContextRequestProtobuf *)self->_modifyOutputContextRequestMessage copyWithZone:a3];
  v99 = *(void **)(v6 + 312);
  *(void *)(v6 + 312) = v98;

  id v100 = [(_MRGetVolumeMessageProtobuf *)self->_getVolumeMessage copyWithZone:a3];
  v101 = *(void **)(v6 + 256);
  *(void *)(v6 + 256) = v100;

  id v102 = [(_MRGetVolumeResultMessageProtobuf *)self->_getVolumeResultMessage copyWithZone:a3];
  v103 = *(void **)(v6 + 280);
  *(void *)(v6 + 280) = v102;

  id v104 = [(_MRSetVolumeMessageProtobuf *)self->_setVolumeMessage copyWithZone:a3];
  v105 = *(void **)(v6 + 696);
  *(void *)(v6 + 696) = v104;

  id v106 = [(_MRVolumeDidChangeMessageProtobuf *)self->_volumeDidChangeMessage copyWithZone:a3];
  v107 = *(void **)(v6 + 816);
  *(void *)(v6 + 816) = v106;

  id v108 = [(_MRRemoveClientMessageProtobuf *)self->_removeClientMessage copyWithZone:a3];
  v109 = *(void **)(v6 + 504);
  *(void *)(v6 + 504) = v108;

  id v110 = [(_MRRemovePlayerMessageProtobuf *)self->_removePlayerMessage copyWithZone:a3];
  v111 = *(void **)(v6 + 528);
  *(void *)(v6 + 528) = v110;

  id v112 = [(_MRUpdateClientMessageProtobuf *)self->_updateClientMessage copyWithZone:a3];
  v113 = *(void **)(v6 + 760);
  *(void *)(v6 + 760) = v112;

  id v114 = [(_MRUpdateContentItemMessageProtobuf *)self->_updateContentItemMessage copyWithZone:a3];
  v115 = *(void **)(v6 + 776);
  *(void *)(v6 + 776) = v114;

  id v116 = [(_MRUpdateContentItemArtworkMessageProtobuf *)self->_updateContentItemArtworkMessage copyWithZone:a3];
  v117 = *(void **)(v6 + 768);
  *(void *)(v6 + 768) = v116;

  id v118 = [(_MRUpdatePlayerMessageProtobuf *)self->_updatePlayerMessage copyWithZone:a3];
  v119 = *(void **)(v6 + 800);
  *(void *)(v6 + 800) = v118;

  id v120 = [(_MRPromptForRouteAuthorizationMessageProtobuf *)self->_promptForRouteAuthorizationMessage copyWithZone:a3];
  v121 = *(void **)(v6 + 416);
  *(void *)(v6 + 416) = v120;

  id v122 = [(_MRPromptForRouteAuthorizationResponseMessageProtobuf *)self->_promptForRouteAuthorizationResponseMessage copyWithZone:a3];
  v123 = *(void **)(v6 + 424);
  *(void *)(v6 + 424) = v122;

  id v124 = [(_MRPresentRouteAuthorizationStatusMessageProtobuf *)self->_presentRouteAuthorizationStatusMessage copyWithZone:a3];
  v125 = *(void **)(v6 + 408);
  *(void *)(v6 + 408) = v124;

  id v126 = [(_MRGetVolumeControlCapabilitiesMessageProtobuf *)self->_getVolumeControlCapabilitiesMessage copyWithZone:a3];
  v127 = *(void **)(v6 + 240);
  *(void *)(v6 + 240) = v126;

  id v128 = [(_MRGetVolumeControlCapabilitiesResultMessageProtobuf *)self->_getVolumeControlCapabilitiesResultMessage copyWithZone:a3];
  v129 = *(void **)(v6 + 248);
  *(void *)(v6 + 248) = v128;

  id v130 = [(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf *)self->_volumeControlCapabilitiesDidChangeMessage copyWithZone:a3];
  v131 = *(void **)(v6 + 808);
  *(void *)(v6 + 808) = v130;

  id v132 = [(_MRUpdateOutputDevicesMessageProtobuf *)self->_updateOutputDevicesMessage copyWithZone:a3];
  v133 = *(void **)(v6 + 792);
  *(void *)(v6 + 792) = v132;

  id v134 = [(_MRRemoveOutputDevicesMessageProtobuf *)self->_removeOutputDevicesMessage copyWithZone:a3];
  v135 = *(void **)(v6 + 520);
  *(void *)(v6 + 520) = v134;

  id v136 = [(_MRRemoteTextInputMessageProtobuf *)self->_remoteTextInputMessage copyWithZone:a3];
  v137 = *(void **)(v6 + 496);
  *(void *)(v6 + 496) = v136;

  id v138 = [(_MRGetRemoteTextInputSessionProtobuf *)self->_getRemoteTextInputSessionMessage copyWithZone:a3];
  v139 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v138;

  id v140 = [(_MRPlaybackSessionRequestMessageProtobuf *)self->_playbackSessionRequestMessage copyWithZone:a3];
  v141 = *(void **)(v6 + 376);
  *(void *)(v6 + 376) = v140;

  id v142 = [(_MRPlaybackSessionResponseMessageProtobuf *)self->_playbackSessionResponseMessage copyWithZone:a3];
  v143 = *(void **)(v6 + 384);
  *(void *)(v6 + 384) = v142;

  id v144 = [(_MRSetStateMessageProtobuf *)self->_setDefaultSupportedCommandsMessage copyWithZone:a3];
  v145 = *(void **)(v6 + 640);
  *(void *)(v6 + 640) = v144;

  id v146 = [(_MRPlaybackSessionMigrateRequestMessageProtobuf *)self->_playbackSessionMigrateRequestMessage copyWithZone:a3];
  v147 = *(void **)(v6 + 360);
  *(void *)(v6 + 360) = v146;

  id v148 = [(_MRPlaybackSessionMigrateResponseMessageProtobuf *)self->_playbackSessionMigrateResponseMessage copyWithZone:a3];
  v149 = *(void **)(v6 + 368);
  *(void *)(v6 + 368) = v148;

  uint64_t v150 = [(NSString *)self->_errorDescription copyWithZone:a3];
  v151 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v150;

  id v152 = [(_MRPlaybackSessionMigrateBeginMessageProtobuf *)self->_playbackSessionMigrateBeginMessage copyWithZone:a3];
  v153 = *(void **)(v6 + 344);
  *(void *)(v6 + 344) = v152;

  id v154 = [(_MRPlaybackSessionMigrateEndMessageProtobuf *)self->_playbackSessionMigrateEndMessage copyWithZone:a3];
  v155 = *(void **)(v6 + 352);
  *(void *)(v6 + 352) = v154;

  id v156 = [(_MRUpdateActiveSystemEndpointMessageProtobuf *)self->_updateActiveSystemEndpointMessage copyWithZone:a3];
  v157 = *(void **)(v6 + 752);
  *(void *)(v6 + 752) = v156;

  id v158 = [(_MRSetDiscoveryModeProtobufMessage *)self->_discoveryModeMessage copyWithZone:a3];
  v159 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v158;

  id v160 = [(_MRUpdateEndpointsMessageProtobuf *)self->_updateEndpointsMessage copyWithZone:a3];
  v161 = *(void **)(v6 + 784);
  *(void *)(v6 + 784) = v160;

  id v162 = [(_MRRemoveEndpointsMessageProtobuf *)self->_removeEndpointsMessage copyWithZone:a3];
  v163 = *(void **)(v6 + 512);
  *(void *)(v6 + 512) = v162;

  uint64_t v164 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  v165 = *(void **)(v6 + 736);
  *(void *)(v6 + 736) = v164;

  id v166 = [(_MRPlayerClientPropertiesMessageProtobuf *)self->_playerClientPropertiesMessage copyWithZone:a3];
  v167 = *(void **)(v6 + 400);
  *(void *)(v6 + 400) = v166;

  id v168 = [(_MROriginClientPropertiesMessageProtobuf *)self->_originClientPropertiesMessage copyWithZone:a3];
  v169 = *(void **)(v6 + 328);
  *(void *)(v6 + 328) = v168;

  id v170 = [(_MRAudioFadeMessageProtobuf *)self->_audioFadeMessage copyWithZone:a3];
  v171 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v170;

  id v172 = [(_MRAudioFadeResponseMessageProtobuf *)self->_audioFadeResponseMessage copyWithZone:a3];
  v173 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v172;

  id v174 = [(_MRDiscoveryUpdateEndpointsProtobufMessage *)self->_discoveryUpdateEndpointsMessage copyWithZone:a3];
  v175 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v174;

  id v176 = [(_MRDiscoveryUpdateOutputDevicesProtobufMessage *)self->_discoveryUpdateOutputDevicesMessage copyWithZone:a3];
  v177 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v176;

  id v178 = [(_MRSetListeningModeMessageProtobuf *)self->_setListeningModeMessage copyWithZone:a3];
  v179 = *(void **)(v6 + 656);
  *(void *)(v6 + 656) = v178;

  id v180 = [(_MRErrorProtobuf *)self->_error copyWithZone:a3];
  v181 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v180;

  id v182 = [(_MRConfigureConnectionMessageProtobuf *)self->_configureConnectionMessage copyWithZone:a3];
  v183 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v182;

  id v184 = [(_MRCreateHostedEndpointRequestProtobuf *)self->_createHostedEndpointRequest copyWithZone:a3];
  v185 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v184;

  id v186 = [(_MRCreateHostedEndpointResponseProtobuf *)self->_createHostedEndpointResponse copyWithZone:a3];
  v187 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v186;

  id v188 = [(_MRAdjustVolumeMessageProtobuf *)self->_adjustVolumeMessage copyWithZone:a3];
  v189 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v188;

  id v190 = [(_MRGetVolumeMutedMessageProtobuf *)self->_getVolumeMutedMessage copyWithZone:a3];
  v191 = *(void **)(v6 + 264);
  *(void *)(v6 + 264) = v190;

  id v192 = [(_MRGetVolumeMutedResultMessageProtobuf *)self->_getVolumeMutedResultMessage copyWithZone:a3];
  v193 = *(void **)(v6 + 272);
  *(void *)(v6 + 272) = v192;

  id v194 = [(_MRSetVolumeMutedMessageProtobuf *)self->_setVolumeMutedMessage copyWithZone:a3];
  v195 = *(void **)(v6 + 704);
  *(void *)(v6 + 704) = v194;

  id v196 = [(_MRVolumeMutedDidChangeMessageProtobuf *)self->_volumeMutedDidChangeMessage copyWithZone:a3];
  v197 = *(void **)(v6 + 824);
  *(void *)(v6 + 824) = v196;

  id v198 = [(_MRSetConversationDetectionEnabledMessageProtobuf *)self->_setConversationDetectionEnabledMessage copyWithZone:a3];
  v199 = *(void **)(v6 + 632);
  *(void *)(v6 + 632) = v198;

  id v200 = [(_MRPlayerClientParticipantsUpdateMessageProtobuf *)self->_playerClientParticipantsUpdateMessage copyWithZone:a3];
  v201 = *(void **)(v6 + 392);
  *(void *)(v6 + 392) = v200;

  id v202 = [(_MRRequestGroupSessionMessageProtobuf *)self->_requestGroupSessionMessage copyWithZone:a3];
  v203 = *(void **)(v6 + 544);
  *(void *)(v6 + 544) = v202;

  id v204 = [(_MRCreateApplicationConnectionMessageProtobuf *)self->_createApplicationConnectionMessage copyWithZone:a3];
  v205 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v204;

  id v206 = [(_MRApplicationConnectionProtocolMessageProtobuf *)self->_applicationConnectionProtocolMessage copyWithZone:a3];
  v207 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v206;

  id v208 = [(_MRApplicationConnectionContextProtobuf *)self->_invalidateApplicationConnectionMessage copyWithZone:a3];
  v209 = *(void **)(v6 + 288);
  *(void *)(v6 + 288) = v208;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_219;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 840) & 4) == 0 || self->_type != *((_DWORD *)v4 + 182)) {
      goto LABEL_219;
    }
  }
  else if ((*((unsigned char *)v4 + 840) & 4) != 0)
  {
LABEL_219:
    char v106 = 0;
    goto LABEL_220;
  }
  replyIdentifier = self->_replyIdentifier;
  if ((unint64_t)replyIdentifier | *((void *)v4 + 67)
    && !-[NSString isEqual:](replyIdentifier, "isEqual:"))
  {
    goto LABEL_219;
  }
  authenticationToken = self->_authenticationToken;
  if ((unint64_t)authenticationToken | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](authenticationToken, "isEqual:")) {
      goto LABEL_219;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 840) & 2) == 0 || self->_errorCode != *((_DWORD *)v4 + 40)) {
      goto LABEL_219;
    }
  }
  else if ((*((unsigned char *)v4 + 840) & 2) != 0)
  {
    goto LABEL_219;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 840) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_219;
    }
  }
  else if (*((unsigned char *)v4 + 840))
  {
    goto LABEL_219;
  }
  sendCommandMessage = self->_sendCommandMessage;
  if ((unint64_t)sendCommandMessage | *((void *)v4 + 70)
    && !-[_MRSendCommandMessageProtobuf isEqual:](sendCommandMessage, "isEqual:"))
  {
    goto LABEL_219;
  }
  sendCommandResultMessage = self->_sendCommandResultMessage;
  if ((unint64_t)sendCommandResultMessage | *((void *)v4 + 71))
  {
    if (!-[_MRSendCommandResultMessageProtobuf isEqual:](sendCommandResultMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  getStateMessage = self->_getStateMessage;
  if ((unint64_t)getStateMessage | *((void *)v4 + 27))
  {
    if (!-[_MRGetStateMessageProtobuf isEqual:](getStateMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  setStateMessage = self->_setStateMessage;
  if ((unint64_t)setStateMessage | *((void *)v4 + 86))
  {
    if (!-[_MRSetStateMessageProtobuf isEqual:](setStateMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  setArtworkMessage = self->_setArtworkMessage;
  if ((unint64_t)setArtworkMessage | *((void *)v4 + 78))
  {
    if (!-[_MRSetArtworkMessageProtobuf isEqual:](setArtworkMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  registerHIDDeviceMessage = self->_registerHIDDeviceMessage;
  if ((unint64_t)registerHIDDeviceMessage | *((void *)v4 + 58))
  {
    if (!-[_MRRegisterHIDDeviceMessageProtobuf isEqual:](registerHIDDeviceMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  registerHIDDeviceResultMessage = self->_registerHIDDeviceResultMessage;
  if ((unint64_t)registerHIDDeviceResultMessage | *((void *)v4 + 59))
  {
    if (!-[_MRRegisterHIDDeviceResultMessageProtobuf isEqual:](registerHIDDeviceResultMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  sendHIDEventMessage = self->_sendHIDEventMessage;
  if ((unint64_t)sendHIDEventMessage | *((void *)v4 + 72))
  {
    if (!-[_MRSendHIDEventMessageProtobuf isEqual:](sendHIDEventMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  sendHIDReportMessage = self->_sendHIDReportMessage;
  if ((unint64_t)sendHIDReportMessage | *((void *)v4 + 73))
  {
    if (!-[_MRSendHIDReportMessageProtobuf isEqual:](sendHIDReportMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  sendVirtualTouchEventMessage = self->_sendVirtualTouchEventMessage;
  if ((unint64_t)sendVirtualTouchEventMessage | *((void *)v4 + 76))
  {
    if (!-[_MRSendVirtualTouchEventMessageProtobuf isEqual:](sendVirtualTouchEventMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  notificationMessage = self->_notificationMessage;
  if ((unint64_t)notificationMessage | *((void *)v4 + 40))
  {
    if (!-[_MRNotificationMessageProtobuf isEqual:](notificationMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  contentItemsChangedNotificationMessage = self->_contentItemsChangedNotificationMessage;
  if ((unint64_t)contentItemsChangedNotificationMessage | *((void *)v4 + 10))
  {
    if (!-[_MRPlaybackQueueProtobuf isEqual:](contentItemsChangedNotificationMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  deviceInfoMessage = self->_deviceInfoMessage;
  if ((unint64_t)deviceInfoMessage | *((void *)v4 + 15))
  {
    if (!-[_MRDeviceInfoMessageProtobuf isEqual:](deviceInfoMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  clientUpdatesConfigMessage = self->_clientUpdatesConfigMessage;
  if ((unint64_t)clientUpdatesConfigMessage | *((void *)v4 + 7))
  {
    if (!-[_MRClientUpdatesConfigurationProtobuf isEqual:](clientUpdatesConfigMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  masterVolumeControlCapabilitiesDidChangeMessage = self->_masterVolumeControlCapabilitiesDidChangeMessage;
  if ((unint64_t)masterVolumeControlCapabilitiesDidChangeMessage | *((void *)v4 + 38))
  {
    if (!-[_MRVolumeControlAvailabilityProtobuf isEqual:](masterVolumeControlCapabilitiesDidChangeMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  gameController = self->_gameController;
  if ((unint64_t)gameController | *((void *)v4 + 22))
  {
    if (!-[_MRGameControllerMessageProtobuf isEqual:](gameController, "isEqual:")) {
      goto LABEL_219;
    }
  }
  registerGameController = self->_registerGameController;
  if ((unint64_t)registerGameController | *((void *)v4 + 56))
  {
    if (!-[_MRRegisterGameControllerMessageProtobuf isEqual:](registerGameController, "isEqual:")) {
      goto LABEL_219;
    }
  }
  registerGameControllerResponse = self->_registerGameControllerResponse;
  if ((unint64_t)registerGameControllerResponse | *((void *)v4 + 57))
  {
    if (!-[_MRRegisterGameControllerResponseMessageProtobuf isEqual:](registerGameControllerResponse, "isEqual:")) {
      goto LABEL_219;
    }
  }
  unregisterGameController = self->_unregisterGameController;
  if ((unint64_t)unregisterGameController | *((void *)v4 + 93))
  {
    if (!-[_MRUnregisterGameControllerMessageProtobuf isEqual:](unregisterGameController, "isEqual:")) {
      goto LABEL_219;
    }
  }
  registerForGameControllerEvents = self->_registerForGameControllerEvents;
  if ((unint64_t)registerForGameControllerEvents | *((void *)v4 + 55))
  {
    if (!-[_MRRegisterForGameControllerEventsMessageProtobuf isEqual:](registerForGameControllerEvents, "isEqual:")) {
      goto LABEL_219;
    }
  }
  keyboardMessage = self->_keyboardMessage;
  if ((unint64_t)keyboardMessage | *((void *)v4 + 37))
  {
    if (!-[_MRKeyboardMessageProtobuf isEqual:](keyboardMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  getKeyboardMessage = self->_getKeyboardMessage;
  if ((unint64_t)getKeyboardMessage | *((void *)v4 + 25))
  {
    if (!-[_MRGetKeyboardSessionProtobuf isEqual:](getKeyboardMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  textInputMessage = self->_textInputMessage;
  if ((unint64_t)textInputMessage | *((void *)v4 + 89))
  {
    if (!-[_MRTextInputMessageProtobuf isEqual:](textInputMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  getVoiceInputDevicesMessage = self->_getVoiceInputDevicesMessage;
  if ((unint64_t)getVoiceInputDevicesMessage | *((void *)v4 + 28))
  {
    if (!-[_MRGetVoiceInputDevicesMessageProtobuf isEqual:](getVoiceInputDevicesMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  getVoiceInputDevicesResponseMessage = self->_getVoiceInputDevicesResponseMessage;
  if ((unint64_t)getVoiceInputDevicesResponseMessage | *((void *)v4 + 29))
  {
    if (!-[_MRGetVoiceInputDevicesResponseMessageProtobuf isEqual:](getVoiceInputDevicesResponseMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  registerVoiceInputDeviceMessage = self->_registerVoiceInputDeviceMessage;
  if ((unint64_t)registerVoiceInputDeviceMessage | *((void *)v4 + 60))
  {
    if (!-[_MRRegisterVoiceInputDeviceMessageProtobuf isEqual:](registerVoiceInputDeviceMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  registerVoiceInputDeviceResponseMessage = self->_registerVoiceInputDeviceResponseMessage;
  if ((unint64_t)registerVoiceInputDeviceResponseMessage | *((void *)v4 + 61))
  {
    if (!-[_MRRegisterVoiceInputDeviceResponseMessageProtobuf isEqual:](registerVoiceInputDeviceResponseMessage, "isEqual:"))goto LABEL_219; {
  }
    }
  setRecordingStateMessage = self->_setRecordingStateMessage;
  if ((unint64_t)setRecordingStateMessage | *((void *)v4 + 85))
  {
    if (!-[_MRSetRecordingStateMessageProtobuf isEqual:](setRecordingStateMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  sendVoiceInputMessage = self->_sendVoiceInputMessage;
  if ((unint64_t)sendVoiceInputMessage | *((void *)v4 + 77))
  {
    if (!-[_MRSendVoiceInputMessageProtobuf isEqual:](sendVoiceInputMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  playbackQueueRequest = self->_playbackQueueRequest;
  if ((unint64_t)playbackQueueRequest | *((void *)v4 + 42))
  {
    if (!-[_MRPlaybackQueueRequestProtobuf isEqual:](playbackQueueRequest, "isEqual:")) {
      goto LABEL_219;
    }
  }
  transactionPackets = self->_transactionPackets;
  if ((unint64_t)transactionPackets | *((void *)v4 + 90))
  {
    if (!-[_MRTransactionMessageProtobuf isEqual:](transactionPackets, "isEqual:")) {
      goto LABEL_219;
    }
  }
  cryptoPairingMessage = self->_cryptoPairingMessage;
  if ((unint64_t)cryptoPairingMessage | *((void *)v4 + 14))
  {
    if (!-[_MRCryptoPairingMessageProtobuf isEqual:](cryptoPairingMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  gameControllerProperties = self->_gameControllerProperties;
  if ((unint64_t)gameControllerProperties | *((void *)v4 + 23))
  {
    if (!-[_MRGameControllerPropertiesMessageProtobuf isEqual:](gameControllerProperties, "isEqual:")) {
      goto LABEL_219;
    }
  }
  readyStateMessage = self->_readyStateMessage;
  if ((unint64_t)readyStateMessage | *((void *)v4 + 54))
  {
    if (!-[_MRSetReadyStateMessageProtobuf isEqual:](readyStateMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  connectionState = self->_connectionState;
  if ((unint64_t)connectionState | *((void *)v4 + 9))
  {
    if (!-[_MRSetConnectionStateMessageProtobuf isEqual:](connectionState, "isEqual:")) {
      goto LABEL_219;
    }
  }
  sendButtonEventMessage = self->_sendButtonEventMessage;
  if ((unint64_t)sendButtonEventMessage | *((void *)v4 + 69))
  {
    if (!-[_MRSendButtonEventMessageProtobuf isEqual:](sendButtonEventMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  setHiliteModeMessage = self->_setHiliteModeMessage;
  if ((unint64_t)setHiliteModeMessage | *((void *)v4 + 81))
  {
    if (!-[_MRSetHiliteModeMessageProtobuf isEqual:](setHiliteModeMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  wakeDeviceMessage = self->_wakeDeviceMessage;
  if ((unint64_t)wakeDeviceMessage | *((void *)v4 + 104))
  {
    if (!-[_MRWakeDeviceMessageProtobuf isEqual:](wakeDeviceMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  genericMessage = self->_genericMessage;
  if ((unint64_t)genericMessage | *((void *)v4 + 24))
  {
    if (!-[_MRGenericMessageProtobuf isEqual:](genericMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  sendPackedVirtualTouchEventMessage = self->_sendPackedVirtualTouchEventMessage;
  if ((unint64_t)sendPackedVirtualTouchEventMessage | *((void *)v4 + 75))
  {
    if (!-[_MRSendPackedVirtualTouchEventMessageProtobuf isEqual:](sendPackedVirtualTouchEventMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  sendLyricsEventMessage = self->_sendLyricsEventMessage;
  if ((unint64_t)sendLyricsEventMessage | *((void *)v4 + 74))
  {
    if (!-[_MRSendLyricsEventMessageProtobuf isEqual:](sendLyricsEventMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  setNowPlayingClientMessage = self->_setNowPlayingClientMessage;
  if ((unint64_t)setNowPlayingClientMessage | *((void *)v4 + 83))
  {
    if (!-[_MRSetNowPlayingClientMessageProtobuf isEqual:](setNowPlayingClientMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  setNowPlayingPlayerMessage = self->_setNowPlayingPlayerMessage;
  if ((unint64_t)setNowPlayingPlayerMessage | *((void *)v4 + 84))
  {
    if (!-[_MRSetNowPlayingPlayerMessageProtobuf isEqual:](setNowPlayingPlayerMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  modifyOutputContextRequestMessage = self->_modifyOutputContextRequestMessage;
  if ((unint64_t)modifyOutputContextRequestMessage | *((void *)v4 + 39))
  {
    if (!-[_MRAVModifyOutputContextRequestProtobuf isEqual:](modifyOutputContextRequestMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  getVolumeMessage = self->_getVolumeMessage;
  if ((unint64_t)getVolumeMessage | *((void *)v4 + 32))
  {
    if (!-[_MRGetVolumeMessageProtobuf isEqual:](getVolumeMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  getVolumeResultMessage = self->_getVolumeResultMessage;
  if ((unint64_t)getVolumeResultMessage | *((void *)v4 + 35))
  {
    if (!-[_MRGetVolumeResultMessageProtobuf isEqual:](getVolumeResultMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  setVolumeMessage = self->_setVolumeMessage;
  if ((unint64_t)setVolumeMessage | *((void *)v4 + 87))
  {
    if (!-[_MRSetVolumeMessageProtobuf isEqual:](setVolumeMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  volumeDidChangeMessage = self->_volumeDidChangeMessage;
  if ((unint64_t)volumeDidChangeMessage | *((void *)v4 + 102))
  {
    if (!-[_MRVolumeDidChangeMessageProtobuf isEqual:](volumeDidChangeMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  removeClientMessage = self->_removeClientMessage;
  if ((unint64_t)removeClientMessage | *((void *)v4 + 63))
  {
    if (!-[_MRRemoveClientMessageProtobuf isEqual:](removeClientMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  removePlayerMessage = self->_removePlayerMessage;
  if ((unint64_t)removePlayerMessage | *((void *)v4 + 66))
  {
    if (!-[_MRRemovePlayerMessageProtobuf isEqual:](removePlayerMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  updateClientMessage = self->_updateClientMessage;
  if ((unint64_t)updateClientMessage | *((void *)v4 + 95))
  {
    if (!-[_MRUpdateClientMessageProtobuf isEqual:](updateClientMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  updateContentItemMessage = self->_updateContentItemMessage;
  if ((unint64_t)updateContentItemMessage | *((void *)v4 + 97))
  {
    if (!-[_MRUpdateContentItemMessageProtobuf isEqual:](updateContentItemMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  updateContentItemArtworkMessage = self->_updateContentItemArtworkMessage;
  if ((unint64_t)updateContentItemArtworkMessage | *((void *)v4 + 96))
  {
    if (!-[_MRUpdateContentItemArtworkMessageProtobuf isEqual:](updateContentItemArtworkMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  updatePlayerMessage = self->_updatePlayerMessage;
  if ((unint64_t)updatePlayerMessage | *((void *)v4 + 100))
  {
    if (!-[_MRUpdatePlayerMessageProtobuf isEqual:](updatePlayerMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  promptForRouteAuthorizationMessage = self->_promptForRouteAuthorizationMessage;
  if ((unint64_t)promptForRouteAuthorizationMessage | *((void *)v4 + 52))
  {
    if (!-[_MRPromptForRouteAuthorizationMessageProtobuf isEqual:](promptForRouteAuthorizationMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  promptForRouteAuthorizationResponseMessage = self->_promptForRouteAuthorizationResponseMessage;
  if ((unint64_t)promptForRouteAuthorizationResponseMessage | *((void *)v4 + 53))
  {
    if (!-[_MRPromptForRouteAuthorizationResponseMessageProtobuf isEqual:](promptForRouteAuthorizationResponseMessage, "isEqual:"))goto LABEL_219; {
  }
    }
  presentRouteAuthorizationStatusMessage = self->_presentRouteAuthorizationStatusMessage;
  if ((unint64_t)presentRouteAuthorizationStatusMessage | *((void *)v4 + 51))
  {
    if (!-[_MRPresentRouteAuthorizationStatusMessageProtobuf isEqual:](presentRouteAuthorizationStatusMessage, "isEqual:"))goto LABEL_219; {
  }
    }
  getVolumeControlCapabilitiesMessage = self->_getVolumeControlCapabilitiesMessage;
  if ((unint64_t)getVolumeControlCapabilitiesMessage | *((void *)v4 + 30))
  {
    if (!-[_MRGetVolumeControlCapabilitiesMessageProtobuf isEqual:](getVolumeControlCapabilitiesMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  getVolumeControlCapabilitiesResultMessage = self->_getVolumeControlCapabilitiesResultMessage;
  if ((unint64_t)getVolumeControlCapabilitiesResultMessage | *((void *)v4 + 31))
  {
    if (!-[_MRGetVolumeControlCapabilitiesResultMessageProtobuf isEqual:](getVolumeControlCapabilitiesResultMessage, "isEqual:"))goto LABEL_219; {
  }
    }
  volumeControlCapabilitiesDidChangeMessage = self->_volumeControlCapabilitiesDidChangeMessage;
  if ((unint64_t)volumeControlCapabilitiesDidChangeMessage | *((void *)v4 + 101))
  {
    if (!-[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf isEqual:](volumeControlCapabilitiesDidChangeMessage, "isEqual:"))goto LABEL_219; {
  }
    }
  updateOutputDevicesMessage = self->_updateOutputDevicesMessage;
  if ((unint64_t)updateOutputDevicesMessage | *((void *)v4 + 99))
  {
    if (!-[_MRUpdateOutputDevicesMessageProtobuf isEqual:](updateOutputDevicesMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  removeOutputDevicesMessage = self->_removeOutputDevicesMessage;
  if ((unint64_t)removeOutputDevicesMessage | *((void *)v4 + 65))
  {
    if (!-[_MRRemoveOutputDevicesMessageProtobuf isEqual:](removeOutputDevicesMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  remoteTextInputMessage = self->_remoteTextInputMessage;
  if ((unint64_t)remoteTextInputMessage | *((void *)v4 + 62))
  {
    if (!-[_MRRemoteTextInputMessageProtobuf isEqual:](remoteTextInputMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  getRemoteTextInputSessionMessage = self->_getRemoteTextInputSessionMessage;
  if ((unint64_t)getRemoteTextInputSessionMessage | *((void *)v4 + 26))
  {
    if (!-[_MRGetRemoteTextInputSessionProtobuf isEqual:](getRemoteTextInputSessionMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  playbackSessionRequestMessage = self->_playbackSessionRequestMessage;
  if ((unint64_t)playbackSessionRequestMessage | *((void *)v4 + 47))
  {
    if (!-[_MRPlaybackSessionRequestMessageProtobuf isEqual:](playbackSessionRequestMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  playbackSessionResponseMessage = self->_playbackSessionResponseMessage;
  if ((unint64_t)playbackSessionResponseMessage | *((void *)v4 + 48))
  {
    if (!-[_MRPlaybackSessionResponseMessageProtobuf isEqual:](playbackSessionResponseMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  setDefaultSupportedCommandsMessage = self->_setDefaultSupportedCommandsMessage;
  if ((unint64_t)setDefaultSupportedCommandsMessage | *((void *)v4 + 80))
  {
    if (!-[_MRSetStateMessageProtobuf isEqual:](setDefaultSupportedCommandsMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  playbackSessionMigrateRequestMessage = self->_playbackSessionMigrateRequestMessage;
  if ((unint64_t)playbackSessionMigrateRequestMessage | *((void *)v4 + 45))
  {
    if (!-[_MRPlaybackSessionMigrateRequestMessageProtobuf isEqual:](playbackSessionMigrateRequestMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  playbackSessionMigrateResponseMessage = self->_playbackSessionMigrateResponseMessage;
  if ((unint64_t)playbackSessionMigrateResponseMessage | *((void *)v4 + 46))
  {
    if (!-[_MRPlaybackSessionMigrateResponseMessageProtobuf isEqual:](playbackSessionMigrateResponseMessage, "isEqual:"))goto LABEL_219; {
  }
    }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](errorDescription, "isEqual:")) {
      goto LABEL_219;
    }
  }
  playbackSessionMigrateBeginMessage = self->_playbackSessionMigrateBeginMessage;
  if ((unint64_t)playbackSessionMigrateBeginMessage | *((void *)v4 + 43))
  {
    if (!-[_MRPlaybackSessionMigrateBeginMessageProtobuf isEqual:](playbackSessionMigrateBeginMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  playbackSessionMigrateEndMessage = self->_playbackSessionMigrateEndMessage;
  if ((unint64_t)playbackSessionMigrateEndMessage | *((void *)v4 + 44))
  {
    if (!-[_MRPlaybackSessionMigrateEndMessageProtobuf isEqual:](playbackSessionMigrateEndMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  updateActiveSystemEndpointMessage = self->_updateActiveSystemEndpointMessage;
  if ((unint64_t)updateActiveSystemEndpointMessage | *((void *)v4 + 94))
  {
    if (!-[_MRUpdateActiveSystemEndpointMessageProtobuf isEqual:](updateActiveSystemEndpointMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  discoveryModeMessage = self->_discoveryModeMessage;
  if ((unint64_t)discoveryModeMessage | *((void *)v4 + 16))
  {
    if (!-[_MRSetDiscoveryModeProtobufMessage isEqual:](discoveryModeMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  updateEndpointsMessage = self->_updateEndpointsMessage;
  if ((unint64_t)updateEndpointsMessage | *((void *)v4 + 98))
  {
    if (!-[_MRUpdateEndpointsMessageProtobuf isEqual:](updateEndpointsMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  removeEndpointsMessage = self->_removeEndpointsMessage;
  if ((unint64_t)removeEndpointsMessage | *((void *)v4 + 64))
  {
    if (!-[_MRRemoveEndpointsMessageProtobuf isEqual:](removeEndpointsMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 92))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:")) {
      goto LABEL_219;
    }
  }
  playerClientPropertiesMessage = self->_playerClientPropertiesMessage;
  if ((unint64_t)playerClientPropertiesMessage | *((void *)v4 + 50))
  {
    if (!-[_MRPlayerClientPropertiesMessageProtobuf isEqual:](playerClientPropertiesMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  originClientPropertiesMessage = self->_originClientPropertiesMessage;
  if ((unint64_t)originClientPropertiesMessage | *((void *)v4 + 41))
  {
    if (!-[_MROriginClientPropertiesMessageProtobuf isEqual:](originClientPropertiesMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  audioFadeMessage = self->_audioFadeMessage;
  if ((unint64_t)audioFadeMessage | *((void *)v4 + 4))
  {
    if (!-[_MRAudioFadeMessageProtobuf isEqual:](audioFadeMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  audioFadeResponseMessage = self->_audioFadeResponseMessage;
  if ((unint64_t)audioFadeResponseMessage | *((void *)v4 + 5))
  {
    if (!-[_MRAudioFadeResponseMessageProtobuf isEqual:](audioFadeResponseMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  discoveryUpdateEndpointsMessage = self->_discoveryUpdateEndpointsMessage;
  if ((unint64_t)discoveryUpdateEndpointsMessage | *((void *)v4 + 17))
  {
    if (!-[_MRDiscoveryUpdateEndpointsProtobufMessage isEqual:](discoveryUpdateEndpointsMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  discoveryUpdateOutputDevicesMessage = self->_discoveryUpdateOutputDevicesMessage;
  if ((unint64_t)discoveryUpdateOutputDevicesMessage | *((void *)v4 + 18))
  {
    if (!-[_MRDiscoveryUpdateOutputDevicesProtobufMessage isEqual:](discoveryUpdateOutputDevicesMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  setListeningModeMessage = self->_setListeningModeMessage;
  if ((unint64_t)setListeningModeMessage | *((void *)v4 + 82))
  {
    if (!-[_MRSetListeningModeMessageProtobuf isEqual:](setListeningModeMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 19))
  {
    if (!-[_MRErrorProtobuf isEqual:](error, "isEqual:")) {
      goto LABEL_219;
    }
  }
  configureConnectionMessage = self->_configureConnectionMessage;
  if ((unint64_t)configureConnectionMessage | *((void *)v4 + 8))
  {
    if (!-[_MRConfigureConnectionMessageProtobuf isEqual:](configureConnectionMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  createHostedEndpointRequest = self->_createHostedEndpointRequest;
  if ((unint64_t)createHostedEndpointRequest | *((void *)v4 + 12))
  {
    if (!-[_MRCreateHostedEndpointRequestProtobuf isEqual:](createHostedEndpointRequest, "isEqual:")) {
      goto LABEL_219;
    }
  }
  createHostedEndpointResponse = self->_createHostedEndpointResponse;
  if ((unint64_t)createHostedEndpointResponse | *((void *)v4 + 13))
  {
    if (!-[_MRCreateHostedEndpointResponseProtobuf isEqual:](createHostedEndpointResponse, "isEqual:")) {
      goto LABEL_219;
    }
  }
  adjustVolumeMessage = self->_adjustVolumeMessage;
  if ((unint64_t)adjustVolumeMessage | *((void *)v4 + 2))
  {
    if (!-[_MRAdjustVolumeMessageProtobuf isEqual:](adjustVolumeMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  getVolumeMutedMessage = self->_getVolumeMutedMessage;
  if ((unint64_t)getVolumeMutedMessage | *((void *)v4 + 33))
  {
    if (!-[_MRGetVolumeMutedMessageProtobuf isEqual:](getVolumeMutedMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  getVolumeMutedResultMessage = self->_getVolumeMutedResultMessage;
  if ((unint64_t)getVolumeMutedResultMessage | *((void *)v4 + 34))
  {
    if (!-[_MRGetVolumeMutedResultMessageProtobuf isEqual:](getVolumeMutedResultMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  setVolumeMutedMessage = self->_setVolumeMutedMessage;
  if ((unint64_t)setVolumeMutedMessage | *((void *)v4 + 88))
  {
    if (!-[_MRSetVolumeMutedMessageProtobuf isEqual:](setVolumeMutedMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  volumeMutedDidChangeMessage = self->_volumeMutedDidChangeMessage;
  if ((unint64_t)volumeMutedDidChangeMessage | *((void *)v4 + 103))
  {
    if (!-[_MRVolumeMutedDidChangeMessageProtobuf isEqual:](volumeMutedDidChangeMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  setConversationDetectionEnabledMessage = self->_setConversationDetectionEnabledMessage;
  if ((unint64_t)setConversationDetectionEnabledMessage | *((void *)v4 + 79))
  {
    if (!-[_MRSetConversationDetectionEnabledMessageProtobuf isEqual:](setConversationDetectionEnabledMessage, "isEqual:"))goto LABEL_219; {
  }
    }
  playerClientParticipantsUpdateMessage = self->_playerClientParticipantsUpdateMessage;
  if ((unint64_t)playerClientParticipantsUpdateMessage | *((void *)v4 + 49))
  {
    if (!-[_MRPlayerClientParticipantsUpdateMessageProtobuf isEqual:](playerClientParticipantsUpdateMessage, "isEqual:"))goto LABEL_219; {
  }
    }
  requestGroupSessionMessage = self->_requestGroupSessionMessage;
  if ((unint64_t)requestGroupSessionMessage | *((void *)v4 + 68))
  {
    if (!-[_MRRequestGroupSessionMessageProtobuf isEqual:](requestGroupSessionMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  createApplicationConnectionMessage = self->_createApplicationConnectionMessage;
  if ((unint64_t)createApplicationConnectionMessage | *((void *)v4 + 11))
  {
    if (!-[_MRCreateApplicationConnectionMessageProtobuf isEqual:](createApplicationConnectionMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  applicationConnectionProtocolMessage = self->_applicationConnectionProtocolMessage;
  if ((unint64_t)applicationConnectionProtocolMessage | *((void *)v4 + 3))
  {
    if (!-[_MRApplicationConnectionProtocolMessageProtobuf isEqual:](applicationConnectionProtocolMessage, "isEqual:")) {
      goto LABEL_219;
    }
  }
  invalidateApplicationConnectionMessage = self->_invalidateApplicationConnectionMessage;
  if ((unint64_t)invalidateApplicationConnectionMessage | *((void *)v4 + 36)) {
    char v106 = -[_MRApplicationConnectionContextProtobuf isEqual:](invalidateApplicationConnectionMessage, "isEqual:");
  }
  else {
    char v106 = 1;
  }
LABEL_220:

  return v106;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_replyIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_authenticationToken hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_errorCode;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v7 = 2654435761u * self->_timestamp;
LABEL_9:
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v9 = v7 ^ [(_MRSendCommandMessageProtobuf *)self->_sendCommandMessage hash];
  unint64_t v10 = v8 ^ v9 ^ [(_MRSendCommandResultMessageProtobuf *)self->_sendCommandResultMessage hash];
  unint64_t v11 = [(_MRGetStateMessageProtobuf *)self->_getStateMessage hash];
  unint64_t v12 = v11 ^ [(_MRSetStateMessageProtobuf *)self->_setStateMessage hash];
  unint64_t v13 = v12 ^ [(_MRSetArtworkMessageProtobuf *)self->_setArtworkMessage hash];
  unint64_t v14 = v10 ^ v13 ^ [(_MRRegisterHIDDeviceMessageProtobuf *)self->_registerHIDDeviceMessage hash];
  unint64_t v15 = [(_MRRegisterHIDDeviceResultMessageProtobuf *)self->_registerHIDDeviceResultMessage hash];
  unint64_t v16 = v15 ^ [(_MRSendHIDEventMessageProtobuf *)self->_sendHIDEventMessage hash];
  unint64_t v17 = v16 ^ [(_MRSendHIDReportMessageProtobuf *)self->_sendHIDReportMessage hash];
  unint64_t v18 = v17 ^ [(_MRSendVirtualTouchEventMessageProtobuf *)self->_sendVirtualTouchEventMessage hash];
  unint64_t v19 = v14 ^ v18 ^ [(_MRNotificationMessageProtobuf *)self->_notificationMessage hash];
  unint64_t v20 = [(_MRPlaybackQueueProtobuf *)self->_contentItemsChangedNotificationMessage hash];
  unint64_t v21 = v20 ^ [(_MRDeviceInfoMessageProtobuf *)self->_deviceInfoMessage hash];
  unint64_t v22 = v21 ^ [(_MRClientUpdatesConfigurationProtobuf *)self->_clientUpdatesConfigMessage hash];
  unint64_t v23 = v22 ^ [(_MRVolumeControlAvailabilityProtobuf *)self->_masterVolumeControlCapabilitiesDidChangeMessage hash];
  unint64_t v24 = v23 ^ [(_MRGameControllerMessageProtobuf *)self->_gameController hash];
  unint64_t v25 = v19 ^ v24 ^ [(_MRRegisterGameControllerMessageProtobuf *)self->_registerGameController hash];
  unint64_t v26 = [(_MRRegisterGameControllerResponseMessageProtobuf *)self->_registerGameControllerResponse hash];
  unint64_t v27 = v26 ^ [(_MRUnregisterGameControllerMessageProtobuf *)self->_unregisterGameController hash];
  unint64_t v28 = v27 ^ [(_MRRegisterForGameControllerEventsMessageProtobuf *)self->_registerForGameControllerEvents hash];
  unint64_t v29 = v28 ^ [(_MRKeyboardMessageProtobuf *)self->_keyboardMessage hash];
  unint64_t v30 = v29 ^ [(_MRGetKeyboardSessionProtobuf *)self->_getKeyboardMessage hash];
  unint64_t v31 = v30 ^ [(_MRTextInputMessageProtobuf *)self->_textInputMessage hash];
  unint64_t v32 = v25 ^ v31 ^ [(_MRGetVoiceInputDevicesMessageProtobuf *)self->_getVoiceInputDevicesMessage hash];
  unint64_t v33 = [(_MRGetVoiceInputDevicesResponseMessageProtobuf *)self->_getVoiceInputDevicesResponseMessage hash];
  unint64_t v34 = v33 ^ [(_MRRegisterVoiceInputDeviceMessageProtobuf *)self->_registerVoiceInputDeviceMessage hash];
  unint64_t v35 = v34 ^ [(_MRRegisterVoiceInputDeviceResponseMessageProtobuf *)self->_registerVoiceInputDeviceResponseMessage hash];
  unint64_t v36 = v35 ^ [(_MRSetRecordingStateMessageProtobuf *)self->_setRecordingStateMessage hash];
  unint64_t v37 = v36 ^ [(_MRSendVoiceInputMessageProtobuf *)self->_sendVoiceInputMessage hash];
  unint64_t v38 = v37 ^ [(_MRPlaybackQueueRequestProtobuf *)self->_playbackQueueRequest hash];
  unint64_t v39 = v38 ^ [(_MRTransactionMessageProtobuf *)self->_transactionPackets hash];
  unint64_t v40 = v32 ^ v39 ^ [(_MRCryptoPairingMessageProtobuf *)self->_cryptoPairingMessage hash];
  unint64_t v41 = [(_MRGameControllerPropertiesMessageProtobuf *)self->_gameControllerProperties hash];
  unint64_t v42 = v41 ^ [(_MRSetReadyStateMessageProtobuf *)self->_readyStateMessage hash];
  unint64_t v43 = v42 ^ [(_MRSetConnectionStateMessageProtobuf *)self->_connectionState hash];
  unint64_t v44 = v43 ^ [(_MRSendButtonEventMessageProtobuf *)self->_sendButtonEventMessage hash];
  unint64_t v45 = v44 ^ [(_MRSetHiliteModeMessageProtobuf *)self->_setHiliteModeMessage hash];
  unint64_t v46 = v45 ^ [(_MRWakeDeviceMessageProtobuf *)self->_wakeDeviceMessage hash];
  unint64_t v47 = v46 ^ [(_MRGenericMessageProtobuf *)self->_genericMessage hash];
  unint64_t v48 = v47 ^ [(_MRSendPackedVirtualTouchEventMessageProtobuf *)self->_sendPackedVirtualTouchEventMessage hash];
  unint64_t v49 = v40 ^ v48 ^ [(_MRSendLyricsEventMessageProtobuf *)self->_sendLyricsEventMessage hash];
  unint64_t v50 = [(_MRSetNowPlayingClientMessageProtobuf *)self->_setNowPlayingClientMessage hash];
  unint64_t v51 = v50 ^ [(_MRSetNowPlayingPlayerMessageProtobuf *)self->_setNowPlayingPlayerMessage hash];
  unint64_t v52 = v51 ^ [(_MRAVModifyOutputContextRequestProtobuf *)self->_modifyOutputContextRequestMessage hash];
  unint64_t v53 = v52 ^ [(_MRGetVolumeMessageProtobuf *)self->_getVolumeMessage hash];
  unint64_t v54 = v53 ^ [(_MRGetVolumeResultMessageProtobuf *)self->_getVolumeResultMessage hash];
  unint64_t v55 = v54 ^ [(_MRSetVolumeMessageProtobuf *)self->_setVolumeMessage hash];
  unint64_t v56 = v55 ^ [(_MRVolumeDidChangeMessageProtobuf *)self->_volumeDidChangeMessage hash];
  unint64_t v57 = v56 ^ [(_MRRemoveClientMessageProtobuf *)self->_removeClientMessage hash];
  unint64_t v58 = v57 ^ [(_MRRemovePlayerMessageProtobuf *)self->_removePlayerMessage hash];
  unint64_t v59 = v49 ^ v58 ^ [(_MRUpdateClientMessageProtobuf *)self->_updateClientMessage hash];
  unint64_t v60 = [(_MRUpdateContentItemMessageProtobuf *)self->_updateContentItemMessage hash];
  unint64_t v61 = v60 ^ [(_MRUpdateContentItemArtworkMessageProtobuf *)self->_updateContentItemArtworkMessage hash];
  unint64_t v62 = v61 ^ [(_MRUpdatePlayerMessageProtobuf *)self->_updatePlayerMessage hash];
  unint64_t v63 = v62 ^ [(_MRPromptForRouteAuthorizationMessageProtobuf *)self->_promptForRouteAuthorizationMessage hash];
  unint64_t v64 = v63 ^ [(_MRPromptForRouteAuthorizationResponseMessageProtobuf *)self->_promptForRouteAuthorizationResponseMessage hash];
  unint64_t v65 = v64 ^ [(_MRPresentRouteAuthorizationStatusMessageProtobuf *)self->_presentRouteAuthorizationStatusMessage hash];
  unint64_t v66 = v65 ^ [(_MRGetVolumeControlCapabilitiesMessageProtobuf *)self->_getVolumeControlCapabilitiesMessage hash];
  unint64_t v67 = v66 ^ [(_MRGetVolumeControlCapabilitiesResultMessageProtobuf *)self->_getVolumeControlCapabilitiesResultMessage hash];
  unint64_t v68 = v67 ^ [(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf *)self->_volumeControlCapabilitiesDidChangeMessage hash];
  unint64_t v69 = v68 ^ [(_MRUpdateOutputDevicesMessageProtobuf *)self->_updateOutputDevicesMessage hash];
  unint64_t v70 = v59 ^ v69 ^ [(_MRRemoveOutputDevicesMessageProtobuf *)self->_removeOutputDevicesMessage hash];
  unint64_t v71 = [(_MRRemoteTextInputMessageProtobuf *)self->_remoteTextInputMessage hash];
  unint64_t v72 = v71 ^ [(_MRGetRemoteTextInputSessionProtobuf *)self->_getRemoteTextInputSessionMessage hash];
  unint64_t v73 = v72 ^ [(_MRPlaybackSessionRequestMessageProtobuf *)self->_playbackSessionRequestMessage hash];
  unint64_t v74 = v73 ^ [(_MRPlaybackSessionResponseMessageProtobuf *)self->_playbackSessionResponseMessage hash];
  unint64_t v75 = v74 ^ [(_MRSetStateMessageProtobuf *)self->_setDefaultSupportedCommandsMessage hash];
  unint64_t v76 = v75 ^ [(_MRPlaybackSessionMigrateRequestMessageProtobuf *)self->_playbackSessionMigrateRequestMessage hash];
  unint64_t v77 = v76 ^ [(_MRPlaybackSessionMigrateResponseMessageProtobuf *)self->_playbackSessionMigrateResponseMessage hash];
  NSUInteger v78 = v77 ^ [(NSString *)self->_errorDescription hash];
  unint64_t v79 = v78 ^ [(_MRPlaybackSessionMigrateBeginMessageProtobuf *)self->_playbackSessionMigrateBeginMessage hash];
  unint64_t v80 = v79 ^ [(_MRPlaybackSessionMigrateEndMessageProtobuf *)self->_playbackSessionMigrateEndMessage hash];
  unint64_t v81 = v80 ^ [(_MRUpdateActiveSystemEndpointMessageProtobuf *)self->_updateActiveSystemEndpointMessage hash];
  unint64_t v82 = v70 ^ v81 ^ [(_MRSetDiscoveryModeProtobufMessage *)self->_discoveryModeMessage hash];
  unint64_t v83 = [(_MRUpdateEndpointsMessageProtobuf *)self->_updateEndpointsMessage hash];
  unint64_t v84 = v83 ^ [(_MRRemoveEndpointsMessageProtobuf *)self->_removeEndpointsMessage hash];
  NSUInteger v85 = v84 ^ [(NSString *)self->_uniqueIdentifier hash];
  unint64_t v86 = v85 ^ [(_MRPlayerClientPropertiesMessageProtobuf *)self->_playerClientPropertiesMessage hash];
  unint64_t v87 = v86 ^ [(_MROriginClientPropertiesMessageProtobuf *)self->_originClientPropertiesMessage hash];
  unint64_t v88 = v87 ^ [(_MRAudioFadeMessageProtobuf *)self->_audioFadeMessage hash];
  unint64_t v89 = v88 ^ [(_MRAudioFadeResponseMessageProtobuf *)self->_audioFadeResponseMessage hash];
  unint64_t v90 = v89 ^ [(_MRDiscoveryUpdateEndpointsProtobufMessage *)self->_discoveryUpdateEndpointsMessage hash];
  unint64_t v91 = v90 ^ [(_MRDiscoveryUpdateOutputDevicesProtobufMessage *)self->_discoveryUpdateOutputDevicesMessage hash];
  unint64_t v92 = v91 ^ [(_MRSetListeningModeMessageProtobuf *)self->_setListeningModeMessage hash];
  unint64_t v93 = v92 ^ [(_MRErrorProtobuf *)self->_error hash];
  unint64_t v94 = v93 ^ [(_MRConfigureConnectionMessageProtobuf *)self->_configureConnectionMessage hash];
  unint64_t v95 = v82 ^ v94 ^ [(_MRCreateHostedEndpointRequestProtobuf *)self->_createHostedEndpointRequest hash];
  unint64_t v96 = [(_MRCreateHostedEndpointResponseProtobuf *)self->_createHostedEndpointResponse hash];
  unint64_t v97 = v96 ^ [(_MRAdjustVolumeMessageProtobuf *)self->_adjustVolumeMessage hash];
  unint64_t v98 = v97 ^ [(_MRGetVolumeMutedMessageProtobuf *)self->_getVolumeMutedMessage hash];
  unint64_t v99 = v98 ^ [(_MRGetVolumeMutedResultMessageProtobuf *)self->_getVolumeMutedResultMessage hash];
  unint64_t v100 = v99 ^ [(_MRSetVolumeMutedMessageProtobuf *)self->_setVolumeMutedMessage hash];
  unint64_t v101 = v100 ^ [(_MRVolumeMutedDidChangeMessageProtobuf *)self->_volumeMutedDidChangeMessage hash];
  unint64_t v102 = v101 ^ [(_MRSetConversationDetectionEnabledMessageProtobuf *)self->_setConversationDetectionEnabledMessage hash];
  unint64_t v103 = v102 ^ [(_MRPlayerClientParticipantsUpdateMessageProtobuf *)self->_playerClientParticipantsUpdateMessage hash];
  unint64_t v104 = v103 ^ [(_MRRequestGroupSessionMessageProtobuf *)self->_requestGroupSessionMessage hash];
  unint64_t v105 = v104 ^ [(_MRCreateApplicationConnectionMessageProtobuf *)self->_createApplicationConnectionMessage hash];
  unint64_t v106 = v105 ^ [(_MRApplicationConnectionProtocolMessageProtobuf *)self->_applicationConnectionProtocolMessage hash];
  return v95 ^ v106 ^ [(_MRApplicationConnectionContextProtobuf *)self->_invalidateApplicationConnectionMessage hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  NSUInteger v5 = v4;
  if ((v4[210] & 4) != 0)
  {
    self->_type = v4[182];
    *(unsigned char *)&self->_has |= 4u;
  }
  v201 = v4;
  if (*((void *)v4 + 67))
  {
    -[_MRMediaRemoteMessageProtobuf setReplyIdentifier:](self, "setReplyIdentifier:");
    NSUInteger v5 = v201;
  }
  if (*((void *)v5 + 6))
  {
    -[_MRMediaRemoteMessageProtobuf setAuthenticationToken:](self, "setAuthenticationToken:");
    NSUInteger v5 = v201;
  }
  char v6 = *((unsigned char *)v5 + 840);
  if ((v6 & 2) != 0)
  {
    self->_errorCode = v5[40];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v5 + 840);
  }
  if (v6)
  {
    self->_timestamp = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  sendCommandMessage = self->_sendCommandMessage;
  uint64_t v8 = *((void *)v5 + 70);
  if (sendCommandMessage)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[_MRSendCommandMessageProtobuf mergeFrom:](sendCommandMessage, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[_MRMediaRemoteMessageProtobuf setSendCommandMessage:](self, "setSendCommandMessage:");
  }
  NSUInteger v5 = v201;
LABEL_17:
  sendCommandResultMessage = self->_sendCommandResultMessage;
  uint64_t v10 = *((void *)v5 + 71);
  if (sendCommandResultMessage)
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[_MRSendCommandResultMessageProtobuf mergeFrom:](sendCommandResultMessage, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[_MRMediaRemoteMessageProtobuf setSendCommandResultMessage:](self, "setSendCommandResultMessage:");
  }
  NSUInteger v5 = v201;
LABEL_23:
  getStateMessage = self->_getStateMessage;
  uint64_t v12 = *((void *)v5 + 27);
  if (getStateMessage)
  {
    if (!v12) {
      goto LABEL_29;
    }
    -[_MRGetStateMessageProtobuf mergeFrom:](getStateMessage, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_29;
    }
    -[_MRMediaRemoteMessageProtobuf setGetStateMessage:](self, "setGetStateMessage:");
  }
  NSUInteger v5 = v201;
LABEL_29:
  setStateMessage = self->_setStateMessage;
  uint64_t v14 = *((void *)v5 + 86);
  if (setStateMessage)
  {
    if (!v14) {
      goto LABEL_35;
    }
    -[_MRSetStateMessageProtobuf mergeFrom:](setStateMessage, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_35;
    }
    -[_MRMediaRemoteMessageProtobuf setSetStateMessage:](self, "setSetStateMessage:");
  }
  NSUInteger v5 = v201;
LABEL_35:
  setArtworkMessage = self->_setArtworkMessage;
  uint64_t v16 = *((void *)v5 + 78);
  if (setArtworkMessage)
  {
    if (!v16) {
      goto LABEL_41;
    }
    -[_MRSetArtworkMessageProtobuf mergeFrom:](setArtworkMessage, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_41;
    }
    -[_MRMediaRemoteMessageProtobuf setSetArtworkMessage:](self, "setSetArtworkMessage:");
  }
  NSUInteger v5 = v201;
LABEL_41:
  registerHIDDeviceMessage = self->_registerHIDDeviceMessage;
  uint64_t v18 = *((void *)v5 + 58);
  if (registerHIDDeviceMessage)
  {
    if (!v18) {
      goto LABEL_47;
    }
    -[_MRRegisterHIDDeviceMessageProtobuf mergeFrom:](registerHIDDeviceMessage, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_47;
    }
    -[_MRMediaRemoteMessageProtobuf setRegisterHIDDeviceMessage:](self, "setRegisterHIDDeviceMessage:");
  }
  NSUInteger v5 = v201;
LABEL_47:
  registerHIDDeviceResultMessage = self->_registerHIDDeviceResultMessage;
  uint64_t v20 = *((void *)v5 + 59);
  if (registerHIDDeviceResultMessage)
  {
    if (!v20) {
      goto LABEL_53;
    }
    -[_MRRegisterHIDDeviceResultMessageProtobuf mergeFrom:](registerHIDDeviceResultMessage, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_53;
    }
    -[_MRMediaRemoteMessageProtobuf setRegisterHIDDeviceResultMessage:](self, "setRegisterHIDDeviceResultMessage:");
  }
  NSUInteger v5 = v201;
LABEL_53:
  sendHIDEventMessage = self->_sendHIDEventMessage;
  uint64_t v22 = *((void *)v5 + 72);
  if (sendHIDEventMessage)
  {
    if (!v22) {
      goto LABEL_59;
    }
    -[_MRSendHIDEventMessageProtobuf mergeFrom:](sendHIDEventMessage, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_59;
    }
    -[_MRMediaRemoteMessageProtobuf setSendHIDEventMessage:](self, "setSendHIDEventMessage:");
  }
  NSUInteger v5 = v201;
LABEL_59:
  sendHIDReportMessage = self->_sendHIDReportMessage;
  uint64_t v24 = *((void *)v5 + 73);
  if (sendHIDReportMessage)
  {
    if (!v24) {
      goto LABEL_65;
    }
    -[_MRSendHIDReportMessageProtobuf mergeFrom:](sendHIDReportMessage, "mergeFrom:");
  }
  else
  {
    if (!v24) {
      goto LABEL_65;
    }
    -[_MRMediaRemoteMessageProtobuf setSendHIDReportMessage:](self, "setSendHIDReportMessage:");
  }
  NSUInteger v5 = v201;
LABEL_65:
  sendVirtualTouchEventMessage = self->_sendVirtualTouchEventMessage;
  uint64_t v26 = *((void *)v5 + 76);
  if (sendVirtualTouchEventMessage)
  {
    if (!v26) {
      goto LABEL_71;
    }
    -[_MRSendVirtualTouchEventMessageProtobuf mergeFrom:](sendVirtualTouchEventMessage, "mergeFrom:");
  }
  else
  {
    if (!v26) {
      goto LABEL_71;
    }
    -[_MRMediaRemoteMessageProtobuf setSendVirtualTouchEventMessage:](self, "setSendVirtualTouchEventMessage:");
  }
  NSUInteger v5 = v201;
LABEL_71:
  notificationMessage = self->_notificationMessage;
  uint64_t v28 = *((void *)v5 + 40);
  if (notificationMessage)
  {
    if (!v28) {
      goto LABEL_77;
    }
    -[_MRNotificationMessageProtobuf mergeFrom:](notificationMessage, "mergeFrom:");
  }
  else
  {
    if (!v28) {
      goto LABEL_77;
    }
    -[_MRMediaRemoteMessageProtobuf setNotificationMessage:](self, "setNotificationMessage:");
  }
  NSUInteger v5 = v201;
LABEL_77:
  contentItemsChangedNotificationMessage = self->_contentItemsChangedNotificationMessage;
  uint64_t v30 = *((void *)v5 + 10);
  if (contentItemsChangedNotificationMessage)
  {
    if (!v30) {
      goto LABEL_83;
    }
    -[_MRPlaybackQueueProtobuf mergeFrom:](contentItemsChangedNotificationMessage, "mergeFrom:");
  }
  else
  {
    if (!v30) {
      goto LABEL_83;
    }
    -[_MRMediaRemoteMessageProtobuf setContentItemsChangedNotificationMessage:](self, "setContentItemsChangedNotificationMessage:");
  }
  NSUInteger v5 = v201;
LABEL_83:
  deviceInfoMessage = self->_deviceInfoMessage;
  uint64_t v32 = *((void *)v5 + 15);
  if (deviceInfoMessage)
  {
    if (!v32) {
      goto LABEL_89;
    }
    -[_MRDeviceInfoMessageProtobuf mergeFrom:](deviceInfoMessage, "mergeFrom:");
  }
  else
  {
    if (!v32) {
      goto LABEL_89;
    }
    -[_MRMediaRemoteMessageProtobuf setDeviceInfoMessage:](self, "setDeviceInfoMessage:");
  }
  NSUInteger v5 = v201;
LABEL_89:
  clientUpdatesConfigMessage = self->_clientUpdatesConfigMessage;
  uint64_t v34 = *((void *)v5 + 7);
  if (clientUpdatesConfigMessage)
  {
    if (!v34) {
      goto LABEL_95;
    }
    -[_MRClientUpdatesConfigurationProtobuf mergeFrom:](clientUpdatesConfigMessage, "mergeFrom:");
  }
  else
  {
    if (!v34) {
      goto LABEL_95;
    }
    -[_MRMediaRemoteMessageProtobuf setClientUpdatesConfigMessage:](self, "setClientUpdatesConfigMessage:");
  }
  NSUInteger v5 = v201;
LABEL_95:
  masterVolumeControlCapabilitiesDidChangeMessage = self->_masterVolumeControlCapabilitiesDidChangeMessage;
  uint64_t v36 = *((void *)v5 + 38);
  if (masterVolumeControlCapabilitiesDidChangeMessage)
  {
    if (!v36) {
      goto LABEL_101;
    }
    -[_MRVolumeControlAvailabilityProtobuf mergeFrom:](masterVolumeControlCapabilitiesDidChangeMessage, "mergeFrom:");
  }
  else
  {
    if (!v36) {
      goto LABEL_101;
    }
    -[_MRMediaRemoteMessageProtobuf setMasterVolumeControlCapabilitiesDidChangeMessage:](self, "setMasterVolumeControlCapabilitiesDidChangeMessage:");
  }
  NSUInteger v5 = v201;
LABEL_101:
  gameController = self->_gameController;
  uint64_t v38 = *((void *)v5 + 22);
  if (gameController)
  {
    if (!v38) {
      goto LABEL_107;
    }
    -[_MRGameControllerMessageProtobuf mergeFrom:](gameController, "mergeFrom:");
  }
  else
  {
    if (!v38) {
      goto LABEL_107;
    }
    -[_MRMediaRemoteMessageProtobuf setGameController:](self, "setGameController:");
  }
  NSUInteger v5 = v201;
LABEL_107:
  registerGameController = self->_registerGameController;
  uint64_t v40 = *((void *)v5 + 56);
  if (registerGameController)
  {
    if (!v40) {
      goto LABEL_113;
    }
    -[_MRRegisterGameControllerMessageProtobuf mergeFrom:](registerGameController, "mergeFrom:");
  }
  else
  {
    if (!v40) {
      goto LABEL_113;
    }
    -[_MRMediaRemoteMessageProtobuf setRegisterGameController:](self, "setRegisterGameController:");
  }
  NSUInteger v5 = v201;
LABEL_113:
  registerGameControllerResponse = self->_registerGameControllerResponse;
  uint64_t v42 = *((void *)v5 + 57);
  if (registerGameControllerResponse)
  {
    if (!v42) {
      goto LABEL_119;
    }
    -[_MRRegisterGameControllerResponseMessageProtobuf mergeFrom:](registerGameControllerResponse, "mergeFrom:");
  }
  else
  {
    if (!v42) {
      goto LABEL_119;
    }
    -[_MRMediaRemoteMessageProtobuf setRegisterGameControllerResponse:](self, "setRegisterGameControllerResponse:");
  }
  NSUInteger v5 = v201;
LABEL_119:
  unregisterGameController = self->_unregisterGameController;
  uint64_t v44 = *((void *)v5 + 93);
  if (unregisterGameController)
  {
    if (!v44) {
      goto LABEL_125;
    }
    -[_MRUnregisterGameControllerMessageProtobuf mergeFrom:](unregisterGameController, "mergeFrom:");
  }
  else
  {
    if (!v44) {
      goto LABEL_125;
    }
    -[_MRMediaRemoteMessageProtobuf setUnregisterGameController:](self, "setUnregisterGameController:");
  }
  NSUInteger v5 = v201;
LABEL_125:
  registerForGameControllerEvents = self->_registerForGameControllerEvents;
  uint64_t v46 = *((void *)v5 + 55);
  if (registerForGameControllerEvents)
  {
    if (!v46) {
      goto LABEL_131;
    }
    -[_MRRegisterForGameControllerEventsMessageProtobuf mergeFrom:](registerForGameControllerEvents, "mergeFrom:");
  }
  else
  {
    if (!v46) {
      goto LABEL_131;
    }
    -[_MRMediaRemoteMessageProtobuf setRegisterForGameControllerEvents:](self, "setRegisterForGameControllerEvents:");
  }
  NSUInteger v5 = v201;
LABEL_131:
  keyboardMessage = self->_keyboardMessage;
  uint64_t v48 = *((void *)v5 + 37);
  if (keyboardMessage)
  {
    if (!v48) {
      goto LABEL_137;
    }
    -[_MRKeyboardMessageProtobuf mergeFrom:](keyboardMessage, "mergeFrom:");
  }
  else
  {
    if (!v48) {
      goto LABEL_137;
    }
    -[_MRMediaRemoteMessageProtobuf setKeyboardMessage:](self, "setKeyboardMessage:");
  }
  NSUInteger v5 = v201;
LABEL_137:
  getKeyboardMessage = self->_getKeyboardMessage;
  uint64_t v50 = *((void *)v5 + 25);
  if (getKeyboardMessage)
  {
    if (!v50) {
      goto LABEL_143;
    }
    -[_MRGetKeyboardSessionProtobuf mergeFrom:](getKeyboardMessage, "mergeFrom:");
  }
  else
  {
    if (!v50) {
      goto LABEL_143;
    }
    -[_MRMediaRemoteMessageProtobuf setGetKeyboardMessage:](self, "setGetKeyboardMessage:");
  }
  NSUInteger v5 = v201;
LABEL_143:
  textInputMessage = self->_textInputMessage;
  uint64_t v52 = *((void *)v5 + 89);
  if (textInputMessage)
  {
    if (!v52) {
      goto LABEL_149;
    }
    -[_MRTextInputMessageProtobuf mergeFrom:](textInputMessage, "mergeFrom:");
  }
  else
  {
    if (!v52) {
      goto LABEL_149;
    }
    -[_MRMediaRemoteMessageProtobuf setTextInputMessage:](self, "setTextInputMessage:");
  }
  NSUInteger v5 = v201;
LABEL_149:
  getVoiceInputDevicesMessage = self->_getVoiceInputDevicesMessage;
  uint64_t v54 = *((void *)v5 + 28);
  if (getVoiceInputDevicesMessage)
  {
    if (!v54) {
      goto LABEL_155;
    }
    -[_MRGetVoiceInputDevicesMessageProtobuf mergeFrom:](getVoiceInputDevicesMessage, "mergeFrom:");
  }
  else
  {
    if (!v54) {
      goto LABEL_155;
    }
    -[_MRMediaRemoteMessageProtobuf setGetVoiceInputDevicesMessage:](self, "setGetVoiceInputDevicesMessage:");
  }
  NSUInteger v5 = v201;
LABEL_155:
  getVoiceInputDevicesResponseMessage = self->_getVoiceInputDevicesResponseMessage;
  uint64_t v56 = *((void *)v5 + 29);
  if (getVoiceInputDevicesResponseMessage)
  {
    if (!v56) {
      goto LABEL_161;
    }
    -[_MRGetVoiceInputDevicesResponseMessageProtobuf mergeFrom:](getVoiceInputDevicesResponseMessage, "mergeFrom:");
  }
  else
  {
    if (!v56) {
      goto LABEL_161;
    }
    -[_MRMediaRemoteMessageProtobuf setGetVoiceInputDevicesResponseMessage:](self, "setGetVoiceInputDevicesResponseMessage:");
  }
  NSUInteger v5 = v201;
LABEL_161:
  registerVoiceInputDeviceMessage = self->_registerVoiceInputDeviceMessage;
  uint64_t v58 = *((void *)v5 + 60);
  if (registerVoiceInputDeviceMessage)
  {
    if (!v58) {
      goto LABEL_167;
    }
    -[_MRRegisterVoiceInputDeviceMessageProtobuf mergeFrom:](registerVoiceInputDeviceMessage, "mergeFrom:");
  }
  else
  {
    if (!v58) {
      goto LABEL_167;
    }
    -[_MRMediaRemoteMessageProtobuf setRegisterVoiceInputDeviceMessage:](self, "setRegisterVoiceInputDeviceMessage:");
  }
  NSUInteger v5 = v201;
LABEL_167:
  registerVoiceInputDeviceResponseMessage = self->_registerVoiceInputDeviceResponseMessage;
  uint64_t v60 = *((void *)v5 + 61);
  if (registerVoiceInputDeviceResponseMessage)
  {
    if (!v60) {
      goto LABEL_173;
    }
    -[_MRRegisterVoiceInputDeviceResponseMessageProtobuf mergeFrom:](registerVoiceInputDeviceResponseMessage, "mergeFrom:");
  }
  else
  {
    if (!v60) {
      goto LABEL_173;
    }
    -[_MRMediaRemoteMessageProtobuf setRegisterVoiceInputDeviceResponseMessage:](self, "setRegisterVoiceInputDeviceResponseMessage:");
  }
  NSUInteger v5 = v201;
LABEL_173:
  setRecordingStateMessage = self->_setRecordingStateMessage;
  uint64_t v62 = *((void *)v5 + 85);
  if (setRecordingStateMessage)
  {
    if (!v62) {
      goto LABEL_179;
    }
    -[_MRSetRecordingStateMessageProtobuf mergeFrom:](setRecordingStateMessage, "mergeFrom:");
  }
  else
  {
    if (!v62) {
      goto LABEL_179;
    }
    -[_MRMediaRemoteMessageProtobuf setSetRecordingStateMessage:](self, "setSetRecordingStateMessage:");
  }
  NSUInteger v5 = v201;
LABEL_179:
  sendVoiceInputMessage = self->_sendVoiceInputMessage;
  uint64_t v64 = *((void *)v5 + 77);
  if (sendVoiceInputMessage)
  {
    if (!v64) {
      goto LABEL_185;
    }
    -[_MRSendVoiceInputMessageProtobuf mergeFrom:](sendVoiceInputMessage, "mergeFrom:");
  }
  else
  {
    if (!v64) {
      goto LABEL_185;
    }
    -[_MRMediaRemoteMessageProtobuf setSendVoiceInputMessage:](self, "setSendVoiceInputMessage:");
  }
  NSUInteger v5 = v201;
LABEL_185:
  playbackQueueRequest = self->_playbackQueueRequest;
  uint64_t v66 = *((void *)v5 + 42);
  if (playbackQueueRequest)
  {
    if (!v66) {
      goto LABEL_191;
    }
    -[_MRPlaybackQueueRequestProtobuf mergeFrom:](playbackQueueRequest, "mergeFrom:");
  }
  else
  {
    if (!v66) {
      goto LABEL_191;
    }
    -[_MRMediaRemoteMessageProtobuf setPlaybackQueueRequest:](self, "setPlaybackQueueRequest:");
  }
  NSUInteger v5 = v201;
LABEL_191:
  transactionPackets = self->_transactionPackets;
  uint64_t v68 = *((void *)v5 + 90);
  if (transactionPackets)
  {
    if (!v68) {
      goto LABEL_197;
    }
    -[_MRTransactionMessageProtobuf mergeFrom:](transactionPackets, "mergeFrom:");
  }
  else
  {
    if (!v68) {
      goto LABEL_197;
    }
    -[_MRMediaRemoteMessageProtobuf setTransactionPackets:](self, "setTransactionPackets:");
  }
  NSUInteger v5 = v201;
LABEL_197:
  cryptoPairingMessage = self->_cryptoPairingMessage;
  uint64_t v70 = *((void *)v5 + 14);
  if (cryptoPairingMessage)
  {
    if (!v70) {
      goto LABEL_203;
    }
    -[_MRCryptoPairingMessageProtobuf mergeFrom:](cryptoPairingMessage, "mergeFrom:");
  }
  else
  {
    if (!v70) {
      goto LABEL_203;
    }
    -[_MRMediaRemoteMessageProtobuf setCryptoPairingMessage:](self, "setCryptoPairingMessage:");
  }
  NSUInteger v5 = v201;
LABEL_203:
  gameControllerProperties = self->_gameControllerProperties;
  uint64_t v72 = *((void *)v5 + 23);
  if (gameControllerProperties)
  {
    if (!v72) {
      goto LABEL_209;
    }
    -[_MRGameControllerPropertiesMessageProtobuf mergeFrom:](gameControllerProperties, "mergeFrom:");
  }
  else
  {
    if (!v72) {
      goto LABEL_209;
    }
    -[_MRMediaRemoteMessageProtobuf setGameControllerProperties:](self, "setGameControllerProperties:");
  }
  NSUInteger v5 = v201;
LABEL_209:
  readyStateMessage = self->_readyStateMessage;
  uint64_t v74 = *((void *)v5 + 54);
  if (readyStateMessage)
  {
    if (!v74) {
      goto LABEL_215;
    }
    -[_MRSetReadyStateMessageProtobuf mergeFrom:](readyStateMessage, "mergeFrom:");
  }
  else
  {
    if (!v74) {
      goto LABEL_215;
    }
    -[_MRMediaRemoteMessageProtobuf setReadyStateMessage:](self, "setReadyStateMessage:");
  }
  NSUInteger v5 = v201;
LABEL_215:
  connectionState = self->_connectionState;
  uint64_t v76 = *((void *)v5 + 9);
  if (connectionState)
  {
    if (!v76) {
      goto LABEL_221;
    }
    -[_MRSetConnectionStateMessageProtobuf mergeFrom:](connectionState, "mergeFrom:");
  }
  else
  {
    if (!v76) {
      goto LABEL_221;
    }
    -[_MRMediaRemoteMessageProtobuf setConnectionState:](self, "setConnectionState:");
  }
  NSUInteger v5 = v201;
LABEL_221:
  sendButtonEventMessage = self->_sendButtonEventMessage;
  uint64_t v78 = *((void *)v5 + 69);
  if (sendButtonEventMessage)
  {
    if (!v78) {
      goto LABEL_227;
    }
    -[_MRSendButtonEventMessageProtobuf mergeFrom:](sendButtonEventMessage, "mergeFrom:");
  }
  else
  {
    if (!v78) {
      goto LABEL_227;
    }
    -[_MRMediaRemoteMessageProtobuf setSendButtonEventMessage:](self, "setSendButtonEventMessage:");
  }
  NSUInteger v5 = v201;
LABEL_227:
  setHiliteModeMessage = self->_setHiliteModeMessage;
  uint64_t v80 = *((void *)v5 + 81);
  if (setHiliteModeMessage)
  {
    if (!v80) {
      goto LABEL_233;
    }
    -[_MRSetHiliteModeMessageProtobuf mergeFrom:](setHiliteModeMessage, "mergeFrom:");
  }
  else
  {
    if (!v80) {
      goto LABEL_233;
    }
    -[_MRMediaRemoteMessageProtobuf setSetHiliteModeMessage:](self, "setSetHiliteModeMessage:");
  }
  NSUInteger v5 = v201;
LABEL_233:
  wakeDeviceMessage = self->_wakeDeviceMessage;
  uint64_t v82 = *((void *)v5 + 104);
  if (wakeDeviceMessage)
  {
    if (!v82) {
      goto LABEL_239;
    }
    -[_MRWakeDeviceMessageProtobuf mergeFrom:](wakeDeviceMessage, "mergeFrom:");
  }
  else
  {
    if (!v82) {
      goto LABEL_239;
    }
    -[_MRMediaRemoteMessageProtobuf setWakeDeviceMessage:](self, "setWakeDeviceMessage:");
  }
  NSUInteger v5 = v201;
LABEL_239:
  genericMessage = self->_genericMessage;
  uint64_t v84 = *((void *)v5 + 24);
  if (genericMessage)
  {
    if (!v84) {
      goto LABEL_245;
    }
    -[_MRGenericMessageProtobuf mergeFrom:](genericMessage, "mergeFrom:");
  }
  else
  {
    if (!v84) {
      goto LABEL_245;
    }
    -[_MRMediaRemoteMessageProtobuf setGenericMessage:](self, "setGenericMessage:");
  }
  NSUInteger v5 = v201;
LABEL_245:
  sendPackedVirtualTouchEventMessage = self->_sendPackedVirtualTouchEventMessage;
  uint64_t v86 = *((void *)v5 + 75);
  if (sendPackedVirtualTouchEventMessage)
  {
    if (!v86) {
      goto LABEL_251;
    }
    -[_MRSendPackedVirtualTouchEventMessageProtobuf mergeFrom:](sendPackedVirtualTouchEventMessage, "mergeFrom:");
  }
  else
  {
    if (!v86) {
      goto LABEL_251;
    }
    -[_MRMediaRemoteMessageProtobuf setSendPackedVirtualTouchEventMessage:](self, "setSendPackedVirtualTouchEventMessage:");
  }
  NSUInteger v5 = v201;
LABEL_251:
  sendLyricsEventMessage = self->_sendLyricsEventMessage;
  uint64_t v88 = *((void *)v5 + 74);
  if (sendLyricsEventMessage)
  {
    if (!v88) {
      goto LABEL_257;
    }
    -[_MRSendLyricsEventMessageProtobuf mergeFrom:](sendLyricsEventMessage, "mergeFrom:");
  }
  else
  {
    if (!v88) {
      goto LABEL_257;
    }
    -[_MRMediaRemoteMessageProtobuf setSendLyricsEventMessage:](self, "setSendLyricsEventMessage:");
  }
  NSUInteger v5 = v201;
LABEL_257:
  setNowPlayingClientMessage = self->_setNowPlayingClientMessage;
  uint64_t v90 = *((void *)v5 + 83);
  if (setNowPlayingClientMessage)
  {
    if (!v90) {
      goto LABEL_263;
    }
    -[_MRSetNowPlayingClientMessageProtobuf mergeFrom:](setNowPlayingClientMessage, "mergeFrom:");
  }
  else
  {
    if (!v90) {
      goto LABEL_263;
    }
    -[_MRMediaRemoteMessageProtobuf setSetNowPlayingClientMessage:](self, "setSetNowPlayingClientMessage:");
  }
  NSUInteger v5 = v201;
LABEL_263:
  setNowPlayingPlayerMessage = self->_setNowPlayingPlayerMessage;
  uint64_t v92 = *((void *)v5 + 84);
  if (setNowPlayingPlayerMessage)
  {
    if (!v92) {
      goto LABEL_269;
    }
    -[_MRSetNowPlayingPlayerMessageProtobuf mergeFrom:](setNowPlayingPlayerMessage, "mergeFrom:");
  }
  else
  {
    if (!v92) {
      goto LABEL_269;
    }
    -[_MRMediaRemoteMessageProtobuf setSetNowPlayingPlayerMessage:](self, "setSetNowPlayingPlayerMessage:");
  }
  NSUInteger v5 = v201;
LABEL_269:
  modifyOutputContextRequestMessage = self->_modifyOutputContextRequestMessage;
  uint64_t v94 = *((void *)v5 + 39);
  if (modifyOutputContextRequestMessage)
  {
    if (!v94) {
      goto LABEL_275;
    }
    -[_MRAVModifyOutputContextRequestProtobuf mergeFrom:](modifyOutputContextRequestMessage, "mergeFrom:");
  }
  else
  {
    if (!v94) {
      goto LABEL_275;
    }
    -[_MRMediaRemoteMessageProtobuf setModifyOutputContextRequestMessage:](self, "setModifyOutputContextRequestMessage:");
  }
  NSUInteger v5 = v201;
LABEL_275:
  getVolumeMessage = self->_getVolumeMessage;
  uint64_t v96 = *((void *)v5 + 32);
  if (getVolumeMessage)
  {
    if (!v96) {
      goto LABEL_281;
    }
    -[_MRGetVolumeMessageProtobuf mergeFrom:](getVolumeMessage, "mergeFrom:");
  }
  else
  {
    if (!v96) {
      goto LABEL_281;
    }
    -[_MRMediaRemoteMessageProtobuf setGetVolumeMessage:](self, "setGetVolumeMessage:");
  }
  NSUInteger v5 = v201;
LABEL_281:
  getVolumeResultMessage = self->_getVolumeResultMessage;
  uint64_t v98 = *((void *)v5 + 35);
  if (getVolumeResultMessage)
  {
    if (!v98) {
      goto LABEL_287;
    }
    -[_MRGetVolumeResultMessageProtobuf mergeFrom:](getVolumeResultMessage, "mergeFrom:");
  }
  else
  {
    if (!v98) {
      goto LABEL_287;
    }
    -[_MRMediaRemoteMessageProtobuf setGetVolumeResultMessage:](self, "setGetVolumeResultMessage:");
  }
  NSUInteger v5 = v201;
LABEL_287:
  setVolumeMessage = self->_setVolumeMessage;
  uint64_t v100 = *((void *)v5 + 87);
  if (setVolumeMessage)
  {
    if (!v100) {
      goto LABEL_293;
    }
    -[_MRSetVolumeMessageProtobuf mergeFrom:](setVolumeMessage, "mergeFrom:");
  }
  else
  {
    if (!v100) {
      goto LABEL_293;
    }
    -[_MRMediaRemoteMessageProtobuf setSetVolumeMessage:](self, "setSetVolumeMessage:");
  }
  NSUInteger v5 = v201;
LABEL_293:
  volumeDidChangeMessage = self->_volumeDidChangeMessage;
  uint64_t v102 = *((void *)v5 + 102);
  if (volumeDidChangeMessage)
  {
    if (!v102) {
      goto LABEL_299;
    }
    -[_MRVolumeDidChangeMessageProtobuf mergeFrom:](volumeDidChangeMessage, "mergeFrom:");
  }
  else
  {
    if (!v102) {
      goto LABEL_299;
    }
    -[_MRMediaRemoteMessageProtobuf setVolumeDidChangeMessage:](self, "setVolumeDidChangeMessage:");
  }
  NSUInteger v5 = v201;
LABEL_299:
  removeClientMessage = self->_removeClientMessage;
  uint64_t v104 = *((void *)v5 + 63);
  if (removeClientMessage)
  {
    if (!v104) {
      goto LABEL_305;
    }
    -[_MRRemoveClientMessageProtobuf mergeFrom:](removeClientMessage, "mergeFrom:");
  }
  else
  {
    if (!v104) {
      goto LABEL_305;
    }
    -[_MRMediaRemoteMessageProtobuf setRemoveClientMessage:](self, "setRemoveClientMessage:");
  }
  NSUInteger v5 = v201;
LABEL_305:
  removePlayerMessage = self->_removePlayerMessage;
  uint64_t v106 = *((void *)v5 + 66);
  if (removePlayerMessage)
  {
    if (!v106) {
      goto LABEL_311;
    }
    -[_MRRemovePlayerMessageProtobuf mergeFrom:](removePlayerMessage, "mergeFrom:");
  }
  else
  {
    if (!v106) {
      goto LABEL_311;
    }
    -[_MRMediaRemoteMessageProtobuf setRemovePlayerMessage:](self, "setRemovePlayerMessage:");
  }
  NSUInteger v5 = v201;
LABEL_311:
  updateClientMessage = self->_updateClientMessage;
  uint64_t v108 = *((void *)v5 + 95);
  if (updateClientMessage)
  {
    if (!v108) {
      goto LABEL_317;
    }
    -[_MRUpdateClientMessageProtobuf mergeFrom:](updateClientMessage, "mergeFrom:");
  }
  else
  {
    if (!v108) {
      goto LABEL_317;
    }
    -[_MRMediaRemoteMessageProtobuf setUpdateClientMessage:](self, "setUpdateClientMessage:");
  }
  NSUInteger v5 = v201;
LABEL_317:
  updateContentItemMessage = self->_updateContentItemMessage;
  uint64_t v110 = *((void *)v5 + 97);
  if (updateContentItemMessage)
  {
    if (!v110) {
      goto LABEL_323;
    }
    -[_MRUpdateContentItemMessageProtobuf mergeFrom:](updateContentItemMessage, "mergeFrom:");
  }
  else
  {
    if (!v110) {
      goto LABEL_323;
    }
    -[_MRMediaRemoteMessageProtobuf setUpdateContentItemMessage:](self, "setUpdateContentItemMessage:");
  }
  NSUInteger v5 = v201;
LABEL_323:
  updateContentItemArtworkMessage = self->_updateContentItemArtworkMessage;
  uint64_t v112 = *((void *)v5 + 96);
  if (updateContentItemArtworkMessage)
  {
    if (!v112) {
      goto LABEL_329;
    }
    -[_MRUpdateContentItemArtworkMessageProtobuf mergeFrom:](updateContentItemArtworkMessage, "mergeFrom:");
  }
  else
  {
    if (!v112) {
      goto LABEL_329;
    }
    -[_MRMediaRemoteMessageProtobuf setUpdateContentItemArtworkMessage:](self, "setUpdateContentItemArtworkMessage:");
  }
  NSUInteger v5 = v201;
LABEL_329:
  updatePlayerMessage = self->_updatePlayerMessage;
  uint64_t v114 = *((void *)v5 + 100);
  if (updatePlayerMessage)
  {
    if (!v114) {
      goto LABEL_335;
    }
    -[_MRUpdatePlayerMessageProtobuf mergeFrom:](updatePlayerMessage, "mergeFrom:");
  }
  else
  {
    if (!v114) {
      goto LABEL_335;
    }
    -[_MRMediaRemoteMessageProtobuf setUpdatePlayerMessage:](self, "setUpdatePlayerMessage:");
  }
  NSUInteger v5 = v201;
LABEL_335:
  promptForRouteAuthorizationMessage = self->_promptForRouteAuthorizationMessage;
  uint64_t v116 = *((void *)v5 + 52);
  if (promptForRouteAuthorizationMessage)
  {
    if (!v116) {
      goto LABEL_341;
    }
    -[_MRPromptForRouteAuthorizationMessageProtobuf mergeFrom:](promptForRouteAuthorizationMessage, "mergeFrom:");
  }
  else
  {
    if (!v116) {
      goto LABEL_341;
    }
    [(_MRMediaRemoteMessageProtobuf *)self setPromptForRouteAuthorizationMessage:"setPromptForRouteAuthorizationMessage:"];
  }
  NSUInteger v5 = v201;
LABEL_341:
  promptForRouteAuthorizationResponseMessage = self->_promptForRouteAuthorizationResponseMessage;
  uint64_t v118 = *((void *)v5 + 53);
  if (promptForRouteAuthorizationResponseMessage)
  {
    if (!v118) {
      goto LABEL_347;
    }
    -[_MRPromptForRouteAuthorizationResponseMessageProtobuf mergeFrom:](promptForRouteAuthorizationResponseMessage, "mergeFrom:");
  }
  else
  {
    if (!v118) {
      goto LABEL_347;
    }
    [(_MRMediaRemoteMessageProtobuf *)self setPromptForRouteAuthorizationResponseMessage:"setPromptForRouteAuthorizationResponseMessage:"];
  }
  NSUInteger v5 = v201;
LABEL_347:
  presentRouteAuthorizationStatusMessage = self->_presentRouteAuthorizationStatusMessage;
  uint64_t v120 = *((void *)v5 + 51);
  if (presentRouteAuthorizationStatusMessage)
  {
    if (!v120) {
      goto LABEL_353;
    }
    -[_MRPresentRouteAuthorizationStatusMessageProtobuf mergeFrom:](presentRouteAuthorizationStatusMessage, "mergeFrom:");
  }
  else
  {
    if (!v120) {
      goto LABEL_353;
    }
    [(_MRMediaRemoteMessageProtobuf *)self setPresentRouteAuthorizationStatusMessage:"setPresentRouteAuthorizationStatusMessage:"];
  }
  NSUInteger v5 = v201;
LABEL_353:
  getVolumeControlCapabilitiesMessage = self->_getVolumeControlCapabilitiesMessage;
  uint64_t v122 = *((void *)v5 + 30);
  if (getVolumeControlCapabilitiesMessage)
  {
    if (!v122) {
      goto LABEL_359;
    }
    -[_MRGetVolumeControlCapabilitiesMessageProtobuf mergeFrom:](getVolumeControlCapabilitiesMessage, "mergeFrom:");
  }
  else
  {
    if (!v122) {
      goto LABEL_359;
    }
    -[_MRMediaRemoteMessageProtobuf setGetVolumeControlCapabilitiesMessage:](self, "setGetVolumeControlCapabilitiesMessage:");
  }
  NSUInteger v5 = v201;
LABEL_359:
  getVolumeControlCapabilitiesResultMessage = self->_getVolumeControlCapabilitiesResultMessage;
  uint64_t v124 = *((void *)v5 + 31);
  if (getVolumeControlCapabilitiesResultMessage)
  {
    if (!v124) {
      goto LABEL_365;
    }
    -[_MRGetVolumeControlCapabilitiesResultMessageProtobuf mergeFrom:](getVolumeControlCapabilitiesResultMessage, "mergeFrom:");
  }
  else
  {
    if (!v124) {
      goto LABEL_365;
    }
    -[_MRMediaRemoteMessageProtobuf setGetVolumeControlCapabilitiesResultMessage:](self, "setGetVolumeControlCapabilitiesResultMessage:");
  }
  NSUInteger v5 = v201;
LABEL_365:
  volumeControlCapabilitiesDidChangeMessage = self->_volumeControlCapabilitiesDidChangeMessage;
  uint64_t v126 = *((void *)v5 + 101);
  if (volumeControlCapabilitiesDidChangeMessage)
  {
    if (!v126) {
      goto LABEL_371;
    }
    -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf mergeFrom:](volumeControlCapabilitiesDidChangeMessage, "mergeFrom:");
  }
  else
  {
    if (!v126) {
      goto LABEL_371;
    }
    -[_MRMediaRemoteMessageProtobuf setVolumeControlCapabilitiesDidChangeMessage:](self, "setVolumeControlCapabilitiesDidChangeMessage:");
  }
  NSUInteger v5 = v201;
LABEL_371:
  updateOutputDevicesMessage = self->_updateOutputDevicesMessage;
  uint64_t v128 = *((void *)v5 + 99);
  if (updateOutputDevicesMessage)
  {
    if (!v128) {
      goto LABEL_377;
    }
    -[_MRUpdateOutputDevicesMessageProtobuf mergeFrom:](updateOutputDevicesMessage, "mergeFrom:");
  }
  else
  {
    if (!v128) {
      goto LABEL_377;
    }
    -[_MRMediaRemoteMessageProtobuf setUpdateOutputDevicesMessage:](self, "setUpdateOutputDevicesMessage:");
  }
  NSUInteger v5 = v201;
LABEL_377:
  removeOutputDevicesMessage = self->_removeOutputDevicesMessage;
  uint64_t v130 = *((void *)v5 + 65);
  if (removeOutputDevicesMessage)
  {
    if (!v130) {
      goto LABEL_383;
    }
    -[_MRRemoveOutputDevicesMessageProtobuf mergeFrom:](removeOutputDevicesMessage, "mergeFrom:");
  }
  else
  {
    if (!v130) {
      goto LABEL_383;
    }
    -[_MRMediaRemoteMessageProtobuf setRemoveOutputDevicesMessage:](self, "setRemoveOutputDevicesMessage:");
  }
  NSUInteger v5 = v201;
LABEL_383:
  remoteTextInputMessage = self->_remoteTextInputMessage;
  uint64_t v132 = *((void *)v5 + 62);
  if (remoteTextInputMessage)
  {
    if (!v132) {
      goto LABEL_389;
    }
    -[_MRRemoteTextInputMessageProtobuf mergeFrom:](remoteTextInputMessage, "mergeFrom:");
  }
  else
  {
    if (!v132) {
      goto LABEL_389;
    }
    -[_MRMediaRemoteMessageProtobuf setRemoteTextInputMessage:](self, "setRemoteTextInputMessage:");
  }
  NSUInteger v5 = v201;
LABEL_389:
  getRemoteTextInputSessionMessage = self->_getRemoteTextInputSessionMessage;
  uint64_t v134 = *((void *)v5 + 26);
  if (getRemoteTextInputSessionMessage)
  {
    if (!v134) {
      goto LABEL_395;
    }
    -[_MRGetRemoteTextInputSessionProtobuf mergeFrom:](getRemoteTextInputSessionMessage, "mergeFrom:");
  }
  else
  {
    if (!v134) {
      goto LABEL_395;
    }
    -[_MRMediaRemoteMessageProtobuf setGetRemoteTextInputSessionMessage:](self, "setGetRemoteTextInputSessionMessage:");
  }
  NSUInteger v5 = v201;
LABEL_395:
  playbackSessionRequestMessage = self->_playbackSessionRequestMessage;
  uint64_t v136 = *((void *)v5 + 47);
  if (playbackSessionRequestMessage)
  {
    if (!v136) {
      goto LABEL_401;
    }
    -[_MRPlaybackSessionRequestMessageProtobuf mergeFrom:](playbackSessionRequestMessage, "mergeFrom:");
  }
  else
  {
    if (!v136) {
      goto LABEL_401;
    }
    -[_MRMediaRemoteMessageProtobuf setPlaybackSessionRequestMessage:](self, "setPlaybackSessionRequestMessage:");
  }
  NSUInteger v5 = v201;
LABEL_401:
  playbackSessionResponseMessage = self->_playbackSessionResponseMessage;
  uint64_t v138 = *((void *)v5 + 48);
  if (playbackSessionResponseMessage)
  {
    if (!v138) {
      goto LABEL_407;
    }
    -[_MRPlaybackSessionResponseMessageProtobuf mergeFrom:](playbackSessionResponseMessage, "mergeFrom:");
  }
  else
  {
    if (!v138) {
      goto LABEL_407;
    }
    -[_MRMediaRemoteMessageProtobuf setPlaybackSessionResponseMessage:](self, "setPlaybackSessionResponseMessage:");
  }
  NSUInteger v5 = v201;
LABEL_407:
  setDefaultSupportedCommandsMessage = self->_setDefaultSupportedCommandsMessage;
  uint64_t v140 = *((void *)v5 + 80);
  if (setDefaultSupportedCommandsMessage)
  {
    if (!v140) {
      goto LABEL_413;
    }
    -[_MRSetStateMessageProtobuf mergeFrom:](setDefaultSupportedCommandsMessage, "mergeFrom:");
  }
  else
  {
    if (!v140) {
      goto LABEL_413;
    }
    -[_MRMediaRemoteMessageProtobuf setSetDefaultSupportedCommandsMessage:](self, "setSetDefaultSupportedCommandsMessage:");
  }
  NSUInteger v5 = v201;
LABEL_413:
  playbackSessionMigrateRequestMessage = self->_playbackSessionMigrateRequestMessage;
  uint64_t v142 = *((void *)v5 + 45);
  if (playbackSessionMigrateRequestMessage)
  {
    if (!v142) {
      goto LABEL_419;
    }
    -[_MRPlaybackSessionMigrateRequestMessageProtobuf mergeFrom:](playbackSessionMigrateRequestMessage, "mergeFrom:");
  }
  else
  {
    if (!v142) {
      goto LABEL_419;
    }
    -[_MRMediaRemoteMessageProtobuf setPlaybackSessionMigrateRequestMessage:](self, "setPlaybackSessionMigrateRequestMessage:");
  }
  NSUInteger v5 = v201;
LABEL_419:
  playbackSessionMigrateResponseMessage = self->_playbackSessionMigrateResponseMessage;
  uint64_t v144 = *((void *)v5 + 46);
  if (playbackSessionMigrateResponseMessage)
  {
    if (!v144) {
      goto LABEL_425;
    }
    -[_MRPlaybackSessionMigrateResponseMessageProtobuf mergeFrom:](playbackSessionMigrateResponseMessage, "mergeFrom:");
  }
  else
  {
    if (!v144) {
      goto LABEL_425;
    }
    -[_MRMediaRemoteMessageProtobuf setPlaybackSessionMigrateResponseMessage:](self, "setPlaybackSessionMigrateResponseMessage:");
  }
  NSUInteger v5 = v201;
LABEL_425:
  if (*((void *)v5 + 21))
  {
    -[_MRMediaRemoteMessageProtobuf setErrorDescription:](self, "setErrorDescription:");
    NSUInteger v5 = v201;
  }
  playbackSessionMigrateBeginMessage = self->_playbackSessionMigrateBeginMessage;
  uint64_t v146 = *((void *)v5 + 43);
  if (playbackSessionMigrateBeginMessage)
  {
    if (!v146) {
      goto LABEL_433;
    }
    -[_MRPlaybackSessionMigrateBeginMessageProtobuf mergeFrom:](playbackSessionMigrateBeginMessage, "mergeFrom:");
  }
  else
  {
    if (!v146) {
      goto LABEL_433;
    }
    -[_MRMediaRemoteMessageProtobuf setPlaybackSessionMigrateBeginMessage:](self, "setPlaybackSessionMigrateBeginMessage:");
  }
  NSUInteger v5 = v201;
LABEL_433:
  playbackSessionMigrateEndMessage = self->_playbackSessionMigrateEndMessage;
  uint64_t v148 = *((void *)v5 + 44);
  if (playbackSessionMigrateEndMessage)
  {
    if (!v148) {
      goto LABEL_439;
    }
    -[_MRPlaybackSessionMigrateEndMessageProtobuf mergeFrom:](playbackSessionMigrateEndMessage, "mergeFrom:");
  }
  else
  {
    if (!v148) {
      goto LABEL_439;
    }
    -[_MRMediaRemoteMessageProtobuf setPlaybackSessionMigrateEndMessage:](self, "setPlaybackSessionMigrateEndMessage:");
  }
  NSUInteger v5 = v201;
LABEL_439:
  updateActiveSystemEndpointMessage = self->_updateActiveSystemEndpointMessage;
  uint64_t v150 = *((void *)v5 + 94);
  if (updateActiveSystemEndpointMessage)
  {
    if (!v150) {
      goto LABEL_445;
    }
    -[_MRUpdateActiveSystemEndpointMessageProtobuf mergeFrom:](updateActiveSystemEndpointMessage, "mergeFrom:");
  }
  else
  {
    if (!v150) {
      goto LABEL_445;
    }
    -[_MRMediaRemoteMessageProtobuf setUpdateActiveSystemEndpointMessage:](self, "setUpdateActiveSystemEndpointMessage:");
  }
  NSUInteger v5 = v201;
LABEL_445:
  discoveryModeMessage = self->_discoveryModeMessage;
  uint64_t v152 = *((void *)v5 + 16);
  if (discoveryModeMessage)
  {
    if (!v152) {
      goto LABEL_451;
    }
    -[_MRSetDiscoveryModeProtobufMessage mergeFrom:](discoveryModeMessage, "mergeFrom:");
  }
  else
  {
    if (!v152) {
      goto LABEL_451;
    }
    -[_MRMediaRemoteMessageProtobuf setDiscoveryModeMessage:](self, "setDiscoveryModeMessage:");
  }
  NSUInteger v5 = v201;
LABEL_451:
  updateEndpointsMessage = self->_updateEndpointsMessage;
  uint64_t v154 = *((void *)v5 + 98);
  if (updateEndpointsMessage)
  {
    if (!v154) {
      goto LABEL_457;
    }
    -[_MRUpdateEndpointsMessageProtobuf mergeFrom:](updateEndpointsMessage, "mergeFrom:");
  }
  else
  {
    if (!v154) {
      goto LABEL_457;
    }
    -[_MRMediaRemoteMessageProtobuf setUpdateEndpointsMessage:](self, "setUpdateEndpointsMessage:");
  }
  NSUInteger v5 = v201;
LABEL_457:
  removeEndpointsMessage = self->_removeEndpointsMessage;
  uint64_t v156 = *((void *)v5 + 64);
  if (removeEndpointsMessage)
  {
    if (!v156) {
      goto LABEL_463;
    }
    -[_MRRemoveEndpointsMessageProtobuf mergeFrom:](removeEndpointsMessage, "mergeFrom:");
  }
  else
  {
    if (!v156) {
      goto LABEL_463;
    }
    -[_MRMediaRemoteMessageProtobuf setRemoveEndpointsMessage:](self, "setRemoveEndpointsMessage:");
  }
  NSUInteger v5 = v201;
LABEL_463:
  if (*((void *)v5 + 92))
  {
    -[_MRMediaRemoteMessageProtobuf setUniqueIdentifier:](self, "setUniqueIdentifier:");
    NSUInteger v5 = v201;
  }
  playerClientPropertiesMessage = self->_playerClientPropertiesMessage;
  uint64_t v158 = *((void *)v5 + 50);
  if (playerClientPropertiesMessage)
  {
    if (!v158) {
      goto LABEL_471;
    }
    -[_MRPlayerClientPropertiesMessageProtobuf mergeFrom:](playerClientPropertiesMessage, "mergeFrom:");
  }
  else
  {
    if (!v158) {
      goto LABEL_471;
    }
    -[_MRMediaRemoteMessageProtobuf setPlayerClientPropertiesMessage:](self, "setPlayerClientPropertiesMessage:");
  }
  NSUInteger v5 = v201;
LABEL_471:
  originClientPropertiesMessage = self->_originClientPropertiesMessage;
  uint64_t v160 = *((void *)v5 + 41);
  if (originClientPropertiesMessage)
  {
    if (!v160) {
      goto LABEL_477;
    }
    -[_MROriginClientPropertiesMessageProtobuf mergeFrom:](originClientPropertiesMessage, "mergeFrom:");
  }
  else
  {
    if (!v160) {
      goto LABEL_477;
    }
    -[_MRMediaRemoteMessageProtobuf setOriginClientPropertiesMessage:](self, "setOriginClientPropertiesMessage:");
  }
  NSUInteger v5 = v201;
LABEL_477:
  audioFadeMessage = self->_audioFadeMessage;
  uint64_t v162 = *((void *)v5 + 4);
  if (audioFadeMessage)
  {
    if (!v162) {
      goto LABEL_483;
    }
    -[_MRAudioFadeMessageProtobuf mergeFrom:](audioFadeMessage, "mergeFrom:");
  }
  else
  {
    if (!v162) {
      goto LABEL_483;
    }
    -[_MRMediaRemoteMessageProtobuf setAudioFadeMessage:](self, "setAudioFadeMessage:");
  }
  NSUInteger v5 = v201;
LABEL_483:
  audioFadeResponseMessage = self->_audioFadeResponseMessage;
  uint64_t v164 = *((void *)v5 + 5);
  if (audioFadeResponseMessage)
  {
    if (!v164) {
      goto LABEL_489;
    }
    -[_MRAudioFadeResponseMessageProtobuf mergeFrom:](audioFadeResponseMessage, "mergeFrom:");
  }
  else
  {
    if (!v164) {
      goto LABEL_489;
    }
    -[_MRMediaRemoteMessageProtobuf setAudioFadeResponseMessage:](self, "setAudioFadeResponseMessage:");
  }
  NSUInteger v5 = v201;
LABEL_489:
  discoveryUpdateEndpointsMessage = self->_discoveryUpdateEndpointsMessage;
  uint64_t v166 = *((void *)v5 + 17);
  if (discoveryUpdateEndpointsMessage)
  {
    if (!v166) {
      goto LABEL_495;
    }
    -[_MRDiscoveryUpdateEndpointsProtobufMessage mergeFrom:](discoveryUpdateEndpointsMessage, "mergeFrom:");
  }
  else
  {
    if (!v166) {
      goto LABEL_495;
    }
    -[_MRMediaRemoteMessageProtobuf setDiscoveryUpdateEndpointsMessage:](self, "setDiscoveryUpdateEndpointsMessage:");
  }
  NSUInteger v5 = v201;
LABEL_495:
  discoveryUpdateOutputDevicesMessage = self->_discoveryUpdateOutputDevicesMessage;
  uint64_t v168 = *((void *)v5 + 18);
  if (discoveryUpdateOutputDevicesMessage)
  {
    if (!v168) {
      goto LABEL_501;
    }
    -[_MRDiscoveryUpdateOutputDevicesProtobufMessage mergeFrom:](discoveryUpdateOutputDevicesMessage, "mergeFrom:");
  }
  else
  {
    if (!v168) {
      goto LABEL_501;
    }
    -[_MRMediaRemoteMessageProtobuf setDiscoveryUpdateOutputDevicesMessage:](self, "setDiscoveryUpdateOutputDevicesMessage:");
  }
  NSUInteger v5 = v201;
LABEL_501:
  setListeningModeMessage = self->_setListeningModeMessage;
  uint64_t v170 = *((void *)v5 + 82);
  if (setListeningModeMessage)
  {
    if (!v170) {
      goto LABEL_507;
    }
    -[_MRSetListeningModeMessageProtobuf mergeFrom:](setListeningModeMessage, "mergeFrom:");
  }
  else
  {
    if (!v170) {
      goto LABEL_507;
    }
    -[_MRMediaRemoteMessageProtobuf setSetListeningModeMessage:](self, "setSetListeningModeMessage:");
  }
  NSUInteger v5 = v201;
LABEL_507:
  error = self->_error;
  uint64_t v172 = *((void *)v5 + 19);
  if (error)
  {
    if (!v172) {
      goto LABEL_513;
    }
    -[_MRErrorProtobuf mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v172) {
      goto LABEL_513;
    }
    -[_MRMediaRemoteMessageProtobuf setError:](self, "setError:");
  }
  NSUInteger v5 = v201;
LABEL_513:
  configureConnectionMessage = self->_configureConnectionMessage;
  uint64_t v174 = *((void *)v5 + 8);
  if (configureConnectionMessage)
  {
    if (!v174) {
      goto LABEL_519;
    }
    -[_MRConfigureConnectionMessageProtobuf mergeFrom:](configureConnectionMessage, "mergeFrom:");
  }
  else
  {
    if (!v174) {
      goto LABEL_519;
    }
    -[_MRMediaRemoteMessageProtobuf setConfigureConnectionMessage:](self, "setConfigureConnectionMessage:");
  }
  NSUInteger v5 = v201;
LABEL_519:
  createHostedEndpointRequest = self->_createHostedEndpointRequest;
  uint64_t v176 = *((void *)v5 + 12);
  if (createHostedEndpointRequest)
  {
    if (!v176) {
      goto LABEL_525;
    }
    -[_MRCreateHostedEndpointRequestProtobuf mergeFrom:](createHostedEndpointRequest, "mergeFrom:");
  }
  else
  {
    if (!v176) {
      goto LABEL_525;
    }
    -[_MRMediaRemoteMessageProtobuf setCreateHostedEndpointRequest:](self, "setCreateHostedEndpointRequest:");
  }
  NSUInteger v5 = v201;
LABEL_525:
  createHostedEndpointResponse = self->_createHostedEndpointResponse;
  uint64_t v178 = *((void *)v5 + 13);
  if (createHostedEndpointResponse)
  {
    if (!v178) {
      goto LABEL_531;
    }
    -[_MRCreateHostedEndpointResponseProtobuf mergeFrom:](createHostedEndpointResponse, "mergeFrom:");
  }
  else
  {
    if (!v178) {
      goto LABEL_531;
    }
    -[_MRMediaRemoteMessageProtobuf setCreateHostedEndpointResponse:](self, "setCreateHostedEndpointResponse:");
  }
  NSUInteger v5 = v201;
LABEL_531:
  adjustVolumeMessage = self->_adjustVolumeMessage;
  uint64_t v180 = *((void *)v5 + 2);
  if (adjustVolumeMessage)
  {
    if (!v180) {
      goto LABEL_537;
    }
    -[_MRAdjustVolumeMessageProtobuf mergeFrom:](adjustVolumeMessage, "mergeFrom:");
  }
  else
  {
    if (!v180) {
      goto LABEL_537;
    }
    -[_MRMediaRemoteMessageProtobuf setAdjustVolumeMessage:](self, "setAdjustVolumeMessage:");
  }
  NSUInteger v5 = v201;
LABEL_537:
  getVolumeMutedMessage = self->_getVolumeMutedMessage;
  uint64_t v182 = *((void *)v5 + 33);
  if (getVolumeMutedMessage)
  {
    if (!v182) {
      goto LABEL_543;
    }
    -[_MRGetVolumeMutedMessageProtobuf mergeFrom:](getVolumeMutedMessage, "mergeFrom:");
  }
  else
  {
    if (!v182) {
      goto LABEL_543;
    }
    -[_MRMediaRemoteMessageProtobuf setGetVolumeMutedMessage:](self, "setGetVolumeMutedMessage:");
  }
  NSUInteger v5 = v201;
LABEL_543:
  getVolumeMutedResultMessage = self->_getVolumeMutedResultMessage;
  uint64_t v184 = *((void *)v5 + 34);
  if (getVolumeMutedResultMessage)
  {
    if (!v184) {
      goto LABEL_549;
    }
    -[_MRGetVolumeMutedResultMessageProtobuf mergeFrom:](getVolumeMutedResultMessage, "mergeFrom:");
  }
  else
  {
    if (!v184) {
      goto LABEL_549;
    }
    -[_MRMediaRemoteMessageProtobuf setGetVolumeMutedResultMessage:](self, "setGetVolumeMutedResultMessage:");
  }
  NSUInteger v5 = v201;
LABEL_549:
  setVolumeMutedMessage = self->_setVolumeMutedMessage;
  uint64_t v186 = *((void *)v5 + 88);
  if (setVolumeMutedMessage)
  {
    if (!v186) {
      goto LABEL_555;
    }
    -[_MRSetVolumeMutedMessageProtobuf mergeFrom:](setVolumeMutedMessage, "mergeFrom:");
  }
  else
  {
    if (!v186) {
      goto LABEL_555;
    }
    -[_MRMediaRemoteMessageProtobuf setSetVolumeMutedMessage:](self, "setSetVolumeMutedMessage:");
  }
  NSUInteger v5 = v201;
LABEL_555:
  volumeMutedDidChangeMessage = self->_volumeMutedDidChangeMessage;
  uint64_t v188 = *((void *)v5 + 103);
  if (volumeMutedDidChangeMessage)
  {
    if (!v188) {
      goto LABEL_561;
    }
    -[_MRVolumeMutedDidChangeMessageProtobuf mergeFrom:](volumeMutedDidChangeMessage, "mergeFrom:");
  }
  else
  {
    if (!v188) {
      goto LABEL_561;
    }
    -[_MRMediaRemoteMessageProtobuf setVolumeMutedDidChangeMessage:](self, "setVolumeMutedDidChangeMessage:");
  }
  NSUInteger v5 = v201;
LABEL_561:
  setConversationDetectionEnabledMessage = self->_setConversationDetectionEnabledMessage;
  uint64_t v190 = *((void *)v5 + 79);
  if (setConversationDetectionEnabledMessage)
  {
    if (!v190) {
      goto LABEL_567;
    }
    -[_MRSetConversationDetectionEnabledMessageProtobuf mergeFrom:](setConversationDetectionEnabledMessage, "mergeFrom:");
  }
  else
  {
    if (!v190) {
      goto LABEL_567;
    }
    -[_MRMediaRemoteMessageProtobuf setSetConversationDetectionEnabledMessage:](self, "setSetConversationDetectionEnabledMessage:");
  }
  NSUInteger v5 = v201;
LABEL_567:
  playerClientParticipantsUpdateMessage = self->_playerClientParticipantsUpdateMessage;
  uint64_t v192 = *((void *)v5 + 49);
  if (playerClientParticipantsUpdateMessage)
  {
    if (!v192) {
      goto LABEL_573;
    }
    -[_MRPlayerClientParticipantsUpdateMessageProtobuf mergeFrom:](playerClientParticipantsUpdateMessage, "mergeFrom:");
  }
  else
  {
    if (!v192) {
      goto LABEL_573;
    }
    -[_MRMediaRemoteMessageProtobuf setPlayerClientParticipantsUpdateMessage:](self, "setPlayerClientParticipantsUpdateMessage:");
  }
  NSUInteger v5 = v201;
LABEL_573:
  requestGroupSessionMessage = self->_requestGroupSessionMessage;
  uint64_t v194 = *((void *)v5 + 68);
  if (requestGroupSessionMessage)
  {
    if (!v194) {
      goto LABEL_579;
    }
    -[_MRRequestGroupSessionMessageProtobuf mergeFrom:](requestGroupSessionMessage, "mergeFrom:");
  }
  else
  {
    if (!v194) {
      goto LABEL_579;
    }
    -[_MRMediaRemoteMessageProtobuf setRequestGroupSessionMessage:](self, "setRequestGroupSessionMessage:");
  }
  NSUInteger v5 = v201;
LABEL_579:
  createApplicationConnectionMessage = self->_createApplicationConnectionMessage;
  uint64_t v196 = *((void *)v5 + 11);
  if (createApplicationConnectionMessage)
  {
    if (!v196) {
      goto LABEL_585;
    }
    -[_MRCreateApplicationConnectionMessageProtobuf mergeFrom:](createApplicationConnectionMessage, "mergeFrom:");
  }
  else
  {
    if (!v196) {
      goto LABEL_585;
    }
    -[_MRMediaRemoteMessageProtobuf setCreateApplicationConnectionMessage:](self, "setCreateApplicationConnectionMessage:");
  }
  NSUInteger v5 = v201;
LABEL_585:
  applicationConnectionProtocolMessage = self->_applicationConnectionProtocolMessage;
  uint64_t v198 = *((void *)v5 + 3);
  if (applicationConnectionProtocolMessage)
  {
    if (!v198) {
      goto LABEL_591;
    }
    -[_MRApplicationConnectionProtocolMessageProtobuf mergeFrom:](applicationConnectionProtocolMessage, "mergeFrom:");
  }
  else
  {
    if (!v198) {
      goto LABEL_591;
    }
    -[_MRMediaRemoteMessageProtobuf setApplicationConnectionProtocolMessage:](self, "setApplicationConnectionProtocolMessage:");
  }
  NSUInteger v5 = v201;
LABEL_591:
  invalidateApplicationConnectionMessage = self->_invalidateApplicationConnectionMessage;
  uint64_t v200 = *((void *)v5 + 36);
  if (invalidateApplicationConnectionMessage)
  {
    if (v200) {
      -[_MRApplicationConnectionContextProtobuf mergeFrom:](invalidateApplicationConnectionMessage, "mergeFrom:");
    }
  }
  else if (v200)
  {
    -[_MRMediaRemoteMessageProtobuf setInvalidateApplicationConnectionMessage:](self, "setInvalidateApplicationConnectionMessage:");
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (_MRSendCommandMessageProtobuf)sendCommandMessage
{
  return self->_sendCommandMessage;
}

- (void)setSendCommandMessage:(id)a3
{
}

- (_MRSendCommandResultMessageProtobuf)sendCommandResultMessage
{
  return self->_sendCommandResultMessage;
}

- (void)setSendCommandResultMessage:(id)a3
{
}

- (_MRSetStateMessageProtobuf)setStateMessage
{
  return self->_setStateMessage;
}

- (void)setSetStateMessage:(id)a3
{
}

- (_MRNotificationMessageProtobuf)notificationMessage
{
  return self->_notificationMessage;
}

- (void)setNotificationMessage:(id)a3
{
}

- (_MRPlaybackQueueProtobuf)contentItemsChangedNotificationMessage
{
  return self->_contentItemsChangedNotificationMessage;
}

- (void)setContentItemsChangedNotificationMessage:(id)a3
{
}

- (_MRDeviceInfoMessageProtobuf)deviceInfoMessage
{
  return self->_deviceInfoMessage;
}

- (void)setDeviceInfoMessage:(id)a3
{
}

- (_MRClientUpdatesConfigurationProtobuf)clientUpdatesConfigMessage
{
  return self->_clientUpdatesConfigMessage;
}

- (void)setClientUpdatesConfigMessage:(id)a3
{
}

- (_MRPlaybackQueueRequestProtobuf)playbackQueueRequest
{
  return self->_playbackQueueRequest;
}

- (void)setPlaybackQueueRequest:(id)a3
{
}

- (_MRSetConnectionStateMessageProtobuf)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(id)a3
{
}

- (_MRGetVolumeMessageProtobuf)getVolumeMessage
{
  return self->_getVolumeMessage;
}

- (void)setGetVolumeMessage:(id)a3
{
}

- (_MRGetVolumeResultMessageProtobuf)getVolumeResultMessage
{
  return self->_getVolumeResultMessage;
}

- (void)setGetVolumeResultMessage:(id)a3
{
}

- (_MRSetVolumeMessageProtobuf)setVolumeMessage
{
  return self->_setVolumeMessage;
}

- (void)setSetVolumeMessage:(id)a3
{
}

- (_MRVolumeDidChangeMessageProtobuf)volumeDidChangeMessage
{
  return self->_volumeDidChangeMessage;
}

- (void)setVolumeDidChangeMessage:(id)a3
{
}

- (_MRUpdateContentItemMessageProtobuf)updateContentItemMessage
{
  return self->_updateContentItemMessage;
}

- (void)setUpdateContentItemMessage:(id)a3
{
}

- (_MRSetStateMessageProtobuf)setDefaultSupportedCommandsMessage
{
  return self->_setDefaultSupportedCommandsMessage;
}

- (void)setSetDefaultSupportedCommandsMessage:(id)a3
{
}

- (_MRGetStateMessageProtobuf)getStateMessage
{
  return self->_getStateMessage;
}

- (void)setGetStateMessage:(id)a3
{
}

- (_MRErrorProtobuf)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (_MRSetArtworkMessageProtobuf)setArtworkMessage
{
  return self->_setArtworkMessage;
}

- (void)setSetArtworkMessage:(id)a3
{
}

- (_MRRegisterHIDDeviceMessageProtobuf)registerHIDDeviceMessage
{
  return self->_registerHIDDeviceMessage;
}

- (void)setRegisterHIDDeviceMessage:(id)a3
{
}

- (_MRRegisterHIDDeviceResultMessageProtobuf)registerHIDDeviceResultMessage
{
  return self->_registerHIDDeviceResultMessage;
}

- (void)setRegisterHIDDeviceResultMessage:(id)a3
{
}

- (_MRSendHIDEventMessageProtobuf)sendHIDEventMessage
{
  return self->_sendHIDEventMessage;
}

- (void)setSendHIDEventMessage:(id)a3
{
}

- (_MRSendHIDReportMessageProtobuf)sendHIDReportMessage
{
  return self->_sendHIDReportMessage;
}

- (void)setSendHIDReportMessage:(id)a3
{
}

- (_MRSendVirtualTouchEventMessageProtobuf)sendVirtualTouchEventMessage
{
  return self->_sendVirtualTouchEventMessage;
}

- (void)setSendVirtualTouchEventMessage:(id)a3
{
}

- (_MRVolumeControlAvailabilityProtobuf)masterVolumeControlCapabilitiesDidChangeMessage
{
  return self->_masterVolumeControlCapabilitiesDidChangeMessage;
}

- (void)setMasterVolumeControlCapabilitiesDidChangeMessage:(id)a3
{
}

- (_MRGameControllerMessageProtobuf)gameController
{
  return self->_gameController;
}

- (void)setGameController:(id)a3
{
}

- (_MRRegisterGameControllerMessageProtobuf)registerGameController
{
  return self->_registerGameController;
}

- (void)setRegisterGameController:(id)a3
{
}

- (_MRRegisterGameControllerResponseMessageProtobuf)registerGameControllerResponse
{
  return self->_registerGameControllerResponse;
}

- (void)setRegisterGameControllerResponse:(id)a3
{
}

- (_MRUnregisterGameControllerMessageProtobuf)unregisterGameController
{
  return self->_unregisterGameController;
}

- (void)setUnregisterGameController:(id)a3
{
}

- (_MRRegisterForGameControllerEventsMessageProtobuf)registerForGameControllerEvents
{
  return self->_registerForGameControllerEvents;
}

- (void)setRegisterForGameControllerEvents:(id)a3
{
}

- (_MRKeyboardMessageProtobuf)keyboardMessage
{
  return self->_keyboardMessage;
}

- (void)setKeyboardMessage:(id)a3
{
}

- (_MRGetKeyboardSessionProtobuf)getKeyboardMessage
{
  return self->_getKeyboardMessage;
}

- (void)setGetKeyboardMessage:(id)a3
{
}

- (_MRTextInputMessageProtobuf)textInputMessage
{
  return self->_textInputMessage;
}

- (void)setTextInputMessage:(id)a3
{
}

- (_MRGetVoiceInputDevicesMessageProtobuf)getVoiceInputDevicesMessage
{
  return self->_getVoiceInputDevicesMessage;
}

- (void)setGetVoiceInputDevicesMessage:(id)a3
{
}

- (_MRGetVoiceInputDevicesResponseMessageProtobuf)getVoiceInputDevicesResponseMessage
{
  return self->_getVoiceInputDevicesResponseMessage;
}

- (void)setGetVoiceInputDevicesResponseMessage:(id)a3
{
}

- (_MRRegisterVoiceInputDeviceMessageProtobuf)registerVoiceInputDeviceMessage
{
  return self->_registerVoiceInputDeviceMessage;
}

- (void)setRegisterVoiceInputDeviceMessage:(id)a3
{
}

- (_MRRegisterVoiceInputDeviceResponseMessageProtobuf)registerVoiceInputDeviceResponseMessage
{
  return self->_registerVoiceInputDeviceResponseMessage;
}

- (void)setRegisterVoiceInputDeviceResponseMessage:(id)a3
{
}

- (_MRSetRecordingStateMessageProtobuf)setRecordingStateMessage
{
  return self->_setRecordingStateMessage;
}

- (void)setSetRecordingStateMessage:(id)a3
{
}

- (_MRSendVoiceInputMessageProtobuf)sendVoiceInputMessage
{
  return self->_sendVoiceInputMessage;
}

- (void)setSendVoiceInputMessage:(id)a3
{
}

- (_MRTransactionMessageProtobuf)transactionPackets
{
  return self->_transactionPackets;
}

- (void)setTransactionPackets:(id)a3
{
}

- (_MRCryptoPairingMessageProtobuf)cryptoPairingMessage
{
  return self->_cryptoPairingMessage;
}

- (void)setCryptoPairingMessage:(id)a3
{
}

- (_MRGameControllerPropertiesMessageProtobuf)gameControllerProperties
{
  return self->_gameControllerProperties;
}

- (void)setGameControllerProperties:(id)a3
{
}

- (_MRSetReadyStateMessageProtobuf)readyStateMessage
{
  return self->_readyStateMessage;
}

- (void)setReadyStateMessage:(id)a3
{
}

- (_MRSendButtonEventMessageProtobuf)sendButtonEventMessage
{
  return self->_sendButtonEventMessage;
}

- (void)setSendButtonEventMessage:(id)a3
{
}

- (_MRSetHiliteModeMessageProtobuf)setHiliteModeMessage
{
  return self->_setHiliteModeMessage;
}

- (void)setSetHiliteModeMessage:(id)a3
{
}

- (_MRWakeDeviceMessageProtobuf)wakeDeviceMessage
{
  return self->_wakeDeviceMessage;
}

- (void)setWakeDeviceMessage:(id)a3
{
}

- (_MRGenericMessageProtobuf)genericMessage
{
  return self->_genericMessage;
}

- (void)setGenericMessage:(id)a3
{
}

- (_MRSendPackedVirtualTouchEventMessageProtobuf)sendPackedVirtualTouchEventMessage
{
  return self->_sendPackedVirtualTouchEventMessage;
}

- (void)setSendPackedVirtualTouchEventMessage:(id)a3
{
}

- (_MRSendLyricsEventMessageProtobuf)sendLyricsEventMessage
{
  return self->_sendLyricsEventMessage;
}

- (void)setSendLyricsEventMessage:(id)a3
{
}

- (_MRSetNowPlayingClientMessageProtobuf)setNowPlayingClientMessage
{
  return self->_setNowPlayingClientMessage;
}

- (void)setSetNowPlayingClientMessage:(id)a3
{
}

- (_MRSetNowPlayingPlayerMessageProtobuf)setNowPlayingPlayerMessage
{
  return self->_setNowPlayingPlayerMessage;
}

- (void)setSetNowPlayingPlayerMessage:(id)a3
{
}

- (_MRAVModifyOutputContextRequestProtobuf)modifyOutputContextRequestMessage
{
  return self->_modifyOutputContextRequestMessage;
}

- (void)setModifyOutputContextRequestMessage:(id)a3
{
}

- (_MRRemoveClientMessageProtobuf)removeClientMessage
{
  return self->_removeClientMessage;
}

- (void)setRemoveClientMessage:(id)a3
{
}

- (_MRRemovePlayerMessageProtobuf)removePlayerMessage
{
  return self->_removePlayerMessage;
}

- (void)setRemovePlayerMessage:(id)a3
{
}

- (_MRUpdateClientMessageProtobuf)updateClientMessage
{
  return self->_updateClientMessage;
}

- (void)setUpdateClientMessage:(id)a3
{
}

- (_MRUpdateContentItemArtworkMessageProtobuf)updateContentItemArtworkMessage
{
  return self->_updateContentItemArtworkMessage;
}

- (void)setUpdateContentItemArtworkMessage:(id)a3
{
}

- (_MRUpdatePlayerMessageProtobuf)updatePlayerMessage
{
  return self->_updatePlayerMessage;
}

- (void)setUpdatePlayerMessage:(id)a3
{
}

- (_MRPromptForRouteAuthorizationMessageProtobuf)promptForRouteAuthorizationMessage
{
  return self->_promptForRouteAuthorizationMessage;
}

- (void)setPromptForRouteAuthorizationMessage:(id)a3
{
}

- (_MRPromptForRouteAuthorizationResponseMessageProtobuf)promptForRouteAuthorizationResponseMessage
{
  return self->_promptForRouteAuthorizationResponseMessage;
}

- (void)setPromptForRouteAuthorizationResponseMessage:(id)a3
{
}

- (_MRPresentRouteAuthorizationStatusMessageProtobuf)presentRouteAuthorizationStatusMessage
{
  return self->_presentRouteAuthorizationStatusMessage;
}

- (void)setPresentRouteAuthorizationStatusMessage:(id)a3
{
}

- (_MRGetVolumeControlCapabilitiesMessageProtobuf)getVolumeControlCapabilitiesMessage
{
  return self->_getVolumeControlCapabilitiesMessage;
}

- (void)setGetVolumeControlCapabilitiesMessage:(id)a3
{
}

- (_MRGetVolumeControlCapabilitiesResultMessageProtobuf)getVolumeControlCapabilitiesResultMessage
{
  return self->_getVolumeControlCapabilitiesResultMessage;
}

- (void)setGetVolumeControlCapabilitiesResultMessage:(id)a3
{
}

- (_MRVolumeControlCapabilitiesDidChangeMessageProtobuf)volumeControlCapabilitiesDidChangeMessage
{
  return self->_volumeControlCapabilitiesDidChangeMessage;
}

- (void)setVolumeControlCapabilitiesDidChangeMessage:(id)a3
{
}

- (_MRUpdateOutputDevicesMessageProtobuf)updateOutputDevicesMessage
{
  return self->_updateOutputDevicesMessage;
}

- (void)setUpdateOutputDevicesMessage:(id)a3
{
}

- (_MRRemoveOutputDevicesMessageProtobuf)removeOutputDevicesMessage
{
  return self->_removeOutputDevicesMessage;
}

- (void)setRemoveOutputDevicesMessage:(id)a3
{
}

- (_MRRemoteTextInputMessageProtobuf)remoteTextInputMessage
{
  return self->_remoteTextInputMessage;
}

- (void)setRemoteTextInputMessage:(id)a3
{
}

- (_MRGetRemoteTextInputSessionProtobuf)getRemoteTextInputSessionMessage
{
  return self->_getRemoteTextInputSessionMessage;
}

- (void)setGetRemoteTextInputSessionMessage:(id)a3
{
}

- (_MRPlaybackSessionRequestMessageProtobuf)playbackSessionRequestMessage
{
  return self->_playbackSessionRequestMessage;
}

- (void)setPlaybackSessionRequestMessage:(id)a3
{
}

- (_MRPlaybackSessionResponseMessageProtobuf)playbackSessionResponseMessage
{
  return self->_playbackSessionResponseMessage;
}

- (void)setPlaybackSessionResponseMessage:(id)a3
{
}

- (_MRPlaybackSessionMigrateRequestMessageProtobuf)playbackSessionMigrateRequestMessage
{
  return self->_playbackSessionMigrateRequestMessage;
}

- (void)setPlaybackSessionMigrateRequestMessage:(id)a3
{
}

- (_MRPlaybackSessionMigrateResponseMessageProtobuf)playbackSessionMigrateResponseMessage
{
  return self->_playbackSessionMigrateResponseMessage;
}

- (void)setPlaybackSessionMigrateResponseMessage:(id)a3
{
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (_MRPlaybackSessionMigrateBeginMessageProtobuf)playbackSessionMigrateBeginMessage
{
  return self->_playbackSessionMigrateBeginMessage;
}

- (void)setPlaybackSessionMigrateBeginMessage:(id)a3
{
}

- (_MRPlaybackSessionMigrateEndMessageProtobuf)playbackSessionMigrateEndMessage
{
  return self->_playbackSessionMigrateEndMessage;
}

- (void)setPlaybackSessionMigrateEndMessage:(id)a3
{
}

- (_MRUpdateActiveSystemEndpointMessageProtobuf)updateActiveSystemEndpointMessage
{
  return self->_updateActiveSystemEndpointMessage;
}

- (void)setUpdateActiveSystemEndpointMessage:(id)a3
{
}

- (_MRSetDiscoveryModeProtobufMessage)discoveryModeMessage
{
  return self->_discoveryModeMessage;
}

- (void)setDiscoveryModeMessage:(id)a3
{
}

- (_MRUpdateEndpointsMessageProtobuf)updateEndpointsMessage
{
  return self->_updateEndpointsMessage;
}

- (void)setUpdateEndpointsMessage:(id)a3
{
}

- (_MRRemoveEndpointsMessageProtobuf)removeEndpointsMessage
{
  return self->_removeEndpointsMessage;
}

- (void)setRemoveEndpointsMessage:(id)a3
{
}

- (_MRPlayerClientPropertiesMessageProtobuf)playerClientPropertiesMessage
{
  return self->_playerClientPropertiesMessage;
}

- (void)setPlayerClientPropertiesMessage:(id)a3
{
}

- (_MROriginClientPropertiesMessageProtobuf)originClientPropertiesMessage
{
  return self->_originClientPropertiesMessage;
}

- (void)setOriginClientPropertiesMessage:(id)a3
{
}

- (_MRAudioFadeMessageProtobuf)audioFadeMessage
{
  return self->_audioFadeMessage;
}

- (void)setAudioFadeMessage:(id)a3
{
}

- (_MRAudioFadeResponseMessageProtobuf)audioFadeResponseMessage
{
  return self->_audioFadeResponseMessage;
}

- (void)setAudioFadeResponseMessage:(id)a3
{
}

- (_MRDiscoveryUpdateEndpointsProtobufMessage)discoveryUpdateEndpointsMessage
{
  return self->_discoveryUpdateEndpointsMessage;
}

- (void)setDiscoveryUpdateEndpointsMessage:(id)a3
{
}

- (_MRDiscoveryUpdateOutputDevicesProtobufMessage)discoveryUpdateOutputDevicesMessage
{
  return self->_discoveryUpdateOutputDevicesMessage;
}

- (void)setDiscoveryUpdateOutputDevicesMessage:(id)a3
{
}

- (_MRSetListeningModeMessageProtobuf)setListeningModeMessage
{
  return self->_setListeningModeMessage;
}

- (void)setSetListeningModeMessage:(id)a3
{
}

- (_MRConfigureConnectionMessageProtobuf)configureConnectionMessage
{
  return self->_configureConnectionMessage;
}

- (void)setConfigureConnectionMessage:(id)a3
{
}

- (_MRCreateHostedEndpointRequestProtobuf)createHostedEndpointRequest
{
  return self->_createHostedEndpointRequest;
}

- (void)setCreateHostedEndpointRequest:(id)a3
{
}

- (_MRCreateHostedEndpointResponseProtobuf)createHostedEndpointResponse
{
  return self->_createHostedEndpointResponse;
}

- (void)setCreateHostedEndpointResponse:(id)a3
{
}

- (_MRAdjustVolumeMessageProtobuf)adjustVolumeMessage
{
  return self->_adjustVolumeMessage;
}

- (void)setAdjustVolumeMessage:(id)a3
{
}

- (_MRGetVolumeMutedMessageProtobuf)getVolumeMutedMessage
{
  return self->_getVolumeMutedMessage;
}

- (void)setGetVolumeMutedMessage:(id)a3
{
}

- (_MRSetVolumeMutedMessageProtobuf)setVolumeMutedMessage
{
  return self->_setVolumeMutedMessage;
}

- (void)setSetVolumeMutedMessage:(id)a3
{
}

- (_MRVolumeMutedDidChangeMessageProtobuf)volumeMutedDidChangeMessage
{
  return self->_volumeMutedDidChangeMessage;
}

- (void)setVolumeMutedDidChangeMessage:(id)a3
{
}

- (_MRSetConversationDetectionEnabledMessageProtobuf)setConversationDetectionEnabledMessage
{
  return self->_setConversationDetectionEnabledMessage;
}

- (void)setSetConversationDetectionEnabledMessage:(id)a3
{
}

- (_MRPlayerClientParticipantsUpdateMessageProtobuf)playerClientParticipantsUpdateMessage
{
  return self->_playerClientParticipantsUpdateMessage;
}

- (void)setPlayerClientParticipantsUpdateMessage:(id)a3
{
}

- (_MRRequestGroupSessionMessageProtobuf)requestGroupSessionMessage
{
  return self->_requestGroupSessionMessage;
}

- (void)setRequestGroupSessionMessage:(id)a3
{
}

- (_MRCreateApplicationConnectionMessageProtobuf)createApplicationConnectionMessage
{
  return self->_createApplicationConnectionMessage;
}

- (void)setCreateApplicationConnectionMessage:(id)a3
{
}

- (_MRApplicationConnectionProtocolMessageProtobuf)applicationConnectionProtocolMessage
{
  return self->_applicationConnectionProtocolMessage;
}

- (void)setApplicationConnectionProtocolMessage:(id)a3
{
}

- (_MRApplicationConnectionContextProtobuf)invalidateApplicationConnectionMessage
{
  return self->_invalidateApplicationConnectionMessage;
}

- (void)setInvalidateApplicationConnectionMessage:(id)a3
{
}

@end