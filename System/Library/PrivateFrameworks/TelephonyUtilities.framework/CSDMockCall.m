@interface CSDMockCall
+ (id)mockCall;
+ (id)mockCallFromBlock:(id)a3;
+ (id)mockCallWithNotificationCenter:(id)a3;
+ (id)mockCallWithNotificationCenter:(id)a3 fromBlock:(id)a4;
- (BOOL)hasBeenRedirected;
- (BOOL)hasSentInvitation;
- (BOOL)hasStartedOutgoing;
- (BOOL)isBlocked;
- (BOOL)isConferenced;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)isConversation;
- (BOOL)isEmergency;
- (BOOL)isEndpointOnCurrentDevice;
- (BOOL)isFailureExpected;
- (BOOL)isHostedOnCurrentDevice;
- (BOOL)isKnownCaller;
- (BOOL)isLocalUserInHomeCountry;
- (BOOL)isOutgoing;
- (BOOL)isPTT;
- (BOOL)isRTT;
- (BOOL)isSOS;
- (BOOL)isScreening;
- (BOOL)isScreeningDueToUserInteraction;
- (BOOL)isSharingScreen;
- (BOOL)isThirdPartyVideo;
- (BOOL)isUplinkMuted;
- (BOOL)isUsingBaseband;
- (BOOL)isVideo;
- (BOOL)isVideoPaused;
- (BOOL)isVoicemail;
- (BOOL)mayRequireBreakBeforeMake;
- (BOOL)mockSupportsEmergencyFallback;
- (BOOL)needsManualInCallSounds;
- (BOOL)prefersExclusiveAccessToCellularNetwork;
- (BOOL)ringtoneSuppressedRemotely;
- (BOOL)screeningAnnouncementHasFinished;
- (BOOL)shouldSuppressInCallUI;
- (BOOL)shouldSuppressRingtone;
- (BOOL)supportsTTYWithVoice;
- (BOOL)uplinkWasExplicitlyMuted;
- (BOOL)wasScreened;
- (CSDMockCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4 notificationCenter:(id)a5;
- (CXAudioSessionActivationStateObserver)audioInterruptionActivationStateObserver;
- (CXCallSource)backingCallSource;
- (NSArray)contactIdentifiers;
- (NSDate)dateConnected;
- (NSDate)dateCreated;
- (NSDictionary)providerContext;
- (NSError)recordingAllowedError;
- (NSString)audioCategory;
- (NSString)audioMode;
- (NSString)blockedByExtension;
- (NSString)callDirectoryIdentityExtension;
- (NSString)callDirectoryName;
- (NSString)callUUID;
- (NSString)callerNameFromNetwork;
- (NSString)companyName;
- (NSString)displayName;
- (NSString)localizedLabel;
- (NSString)uniqueProxyIdentifier;
- (NSURL)imageURL;
- (NSUUID)callGroupUUID;
- (NSUUID)localSenderIdentityAccountUUID;
- (TUCallDisplayContext)displayContext;
- (TUCallProvider)provider;
- (TUCallRecordingSession)recordingSession;
- (TUCallScreenShareAttributes)screenShareAttributes;
- (TUHandle)handle;
- (double)callDuration;
- (id)didPerformUplinkMuted;
- (int)callRelaySupport;
- (int)callStatus;
- (int)disconnectedReason;
- (int)filteredOutReason;
- (int)service;
- (int)subtype;
- (int)ttyType;
- (int64_t)audioInterruptionProviderType;
- (int64_t)bytesOfDataUsed;
- (int64_t)callDirectoryIdentityType;
- (int64_t)junkConfidence;
- (int64_t)providerErrorCode;
- (int64_t)videoStreamToken;
- (unint64_t)initialLinkType;
- (void)answerWithRequest:(id)a3;
- (void)dialWithRequest:(id)a3 displayContext:(id)a4;
- (void)disconnectWithReason:(int)a3;
- (void)hold;
- (void)performUplinkMuted:(BOOL)a3;
- (void)setDidPerformUplinkMuted:(id)a3;
- (void)setMockAudioCategory:(id)a3;
- (void)setMockAudioInterruptionActivationStateObserver:(id)a3;
- (void)setMockAudioInterruptionProviderType:(int64_t)a3;
- (void)setMockAudioMode:(id)a3;
- (void)setMockBackingCallSource:(id)a3;
- (void)setMockBlocked:(BOOL)a3;
- (void)setMockBlockedByExtension:(id)a3;
- (void)setMockBytesOfDataUsed:(int64_t)a3;
- (void)setMockCallDirectoryIdentityExtension:(id)a3;
- (void)setMockCallDirectoryIdentityType:(int64_t)a3;
- (void)setMockCallDirectoryName:(id)a3;
- (void)setMockCallDuration:(double)a3;
- (void)setMockCallGroupUUID:(id)a3;
- (void)setMockCallRelaySupport:(int)a3;
- (void)setMockCallStatus:(int)a3;
- (void)setMockCallUUID:(id)a3;
- (void)setMockCallerNameFromNetwork:(id)a3;
- (void)setMockCompanyName:(id)a3;
- (void)setMockConferenced:(BOOL)a3;
- (void)setMockConnected:(BOOL)a3;
- (void)setMockConnecting:(BOOL)a3;
- (void)setMockContactIdentifiers:(id)a3;
- (void)setMockConversation:(BOOL)a3;
- (void)setMockDateConnected:(id)a3;
- (void)setMockDateCreated:(id)a3;
- (void)setMockDisconnectedReason:(int)a3;
- (void)setMockDisplayContext:(id)a3;
- (void)setMockDisplayName:(id)a3;
- (void)setMockEmergency:(BOOL)a3;
- (void)setMockEndpointOnCurrentDevice:(BOOL)a3;
- (void)setMockFailureExpected:(BOOL)a3;
- (void)setMockFilteredOutReason:(int)a3;
- (void)setMockHandle:(id)a3;
- (void)setMockHasBeenRedirected:(BOOL)a3;
- (void)setMockHasSentInvitation:(BOOL)a3;
- (void)setMockHasStartedOutgoing:(BOOL)a3;
- (void)setMockHostedOnCurrentDevice:(BOOL)a3;
- (void)setMockImageURL:(id)a3;
- (void)setMockInitialLinkType:(unint64_t)a3;
- (void)setMockIsThirdPartyVideo:(BOOL)a3;
- (void)setMockIsVideo:(BOOL)a3;
- (void)setMockIsVideoPaused:(BOOL)a3;
- (void)setMockJunkConfidence:(int64_t)a3;
- (void)setMockKnownCaller:(BOOL)a3;
- (void)setMockLocalSenderIdentityAccountUUID:(id)a3;
- (void)setMockLocalUserInHomeCountry:(BOOL)a3;
- (void)setMockLocalizedLabel:(id)a3;
- (void)setMockMayRequireBreakBeforeMake:(BOOL)a3;
- (void)setMockNeedsManualInCallSounds:(BOOL)a3;
- (void)setMockOutgoing:(BOOL)a3;
- (void)setMockPTT:(BOOL)a3;
- (void)setMockPrefersExclusiveAccessToCellularNetwork:(BOOL)a3;
- (void)setMockProvider:(id)a3;
- (void)setMockProviderContext:(id)a3;
- (void)setMockProviderErrorCode:(int64_t)a3;
- (void)setMockRTT:(BOOL)a3;
- (void)setMockRecordingAllowedError:(id)a3;
- (void)setMockRecordingSession:(id)a3;
- (void)setMockRingtoneSuppressedRemotely:(BOOL)a3;
- (void)setMockScreenShareAttributes:(id)a3;
- (void)setMockScreening:(BOOL)a3;
- (void)setMockScreeningAnnouncementHasFinished:(BOOL)a3;
- (void)setMockScreeningDueToUserInteraction:(BOOL)a3;
- (void)setMockService:(int)a3;
- (void)setMockSharingScreen:(BOOL)a3;
- (void)setMockShouldSuppressInCallUI:(BOOL)a3;
- (void)setMockShouldSuppressRingtone:(BOOL)a3;
- (void)setMockSubtype:(int)a3;
- (void)setMockSupportsEmergencyFallback:(BOOL)a3;
- (void)setMockSupportsTTYWithVoice:(BOOL)a3;
- (void)setMockTTYType:(int)a3;
- (void)setMockUniqueProxyIdentifier:(id)a3;
- (void)setMockUplinkWasExplicitlyMuted:(BOOL)a3;
- (void)setMockUsingBaseband:(BOOL)a3;
- (void)setMockVideoStreamToken:(int64_t)a3;
- (void)setMockVoicemail:(BOOL)a3;
- (void)setMockWasScreened:(BOOL)a3;
- (void)setSOS:(BOOL)a3;
- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4;
- (void)setUplinkMuted:(BOOL)a3;
- (void)unhold;
- (void)updateWithCall:(id)a3;
@end

@implementation CSDMockCall

+ (id)mockCall
{
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = [a1 mockCallWithNotificationCenter:v3 fromBlock:0];

  return v4;
}

+ (id)mockCallWithNotificationCenter:(id)a3
{
  return [a1 mockCallWithNotificationCenter:a3 fromBlock:0];
}

+ (id)mockCallFromBlock:(id)a3
{
  id v4 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  v6 = [a1 mockCallWithNotificationCenter:v5 fromBlock:v4];

  return v6;
}

+ (id)mockCallWithNotificationCenter:(id)a3 fromBlock:(id)a4
{
  v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithNotificationCenter:v7];

  if (v6) {
    v6[2](v6, v8);
  }

  return v8;
}

- (CSDMockCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4 notificationCenter:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSDMockCall;
  v10 = [(CSDMockCall *)&v15 initWithUniqueProxyIdentifier:v9 endpointOnCurrentDevice:v6 notificationCenter:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mockUniqueProxyIdentifier, a3);
    v11->_mockShouldSuppressRingtone = 1;
    v11->_mockHostedOnCurrentDevice = 1;
    v11->_mockEndpointOnCurrentDevice = 1;
    v11->_mockAudioInterruptionProviderType = 1;
    id v12 = objc_alloc_init((Class)TUMutableCallDisplayContext);
    [v12 setName:@"name"];
    mockDisplayContext = v11->_mockDisplayContext;
    v11->_mockDisplayContext = (TUCallDisplayContext *)v12;
  }
  return v11;
}

- (void)updateWithCall:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CSDMockCall;
  id v4 = a3;
  [(CSDMockCall *)&v16 updateWithCall:v4];
  v5 = objc_msgSend(v4, "provider", v16.receiver, v16.super_class);
  [(CSDMockCall *)self setMockProvider:v5];

  BOOL v6 = [v4 handle];
  [(CSDMockCall *)self setMockHandle:v6];

  -[CSDMockCall setMockCallStatus:](self, "setMockCallStatus:", [v4 callStatus]);
  -[CSDCall setTransitionStatus:](self, "setTransitionStatus:", [v4 transitionStatus]);
  -[CSDCall setDisconnectedReason:](self, "setDisconnectedReason:", [v4 disconnectedReason]);
  id v7 = [v4 uniqueProxyIdentifier];
  [(CSDMockCall *)self setMockUniqueProxyIdentifier:v7];

  id v8 = [v4 callUUID];
  [(CSDMockCall *)self setMockCallUUID:v8];

  -[CSDMockCall setMockHostedOnCurrentDevice:](self, "setMockHostedOnCurrentDevice:", [v4 isHostedOnCurrentDevice]);
  -[CSDMockCall setMockScreening:](self, "setMockScreening:", [v4 isScreening]);
  -[CSDMockCall setMockWasScreened:](self, "setMockWasScreened:", [v4 wasScreened]);
  -[CSDMockCall setMockScreeningAnnouncementHasFinished:](self, "setMockScreeningAnnouncementHasFinished:", [v4 screeningAnnouncementHasFinished]);
  -[CSDMockCall setEndpointOnCurrentDevice:](self, "setEndpointOnCurrentDevice:", [v4 isEndpointOnCurrentDevice]);
  id v9 = [v4 callerNameFromNetwork];
  [(CSDMockCall *)self setMockCallerNameFromNetwork:v9];

  v10 = [v4 sourceIdentifier];
  [(CSDMockCall *)self setSourceIdentifier:v10];

  -[CSDMockCall setMockUsingBaseband:](self, "setMockUsingBaseband:", [v4 isUsingBaseband]);
  -[CSDMockCall setMockVoicemail:](self, "setMockVoicemail:", [v4 isVoicemail]);
  v11 = [v4 contactIdentifiers];
  [(CSDMockCall *)self setMockContactIdentifiers:v11];

  -[CSDMockCall setMockNeedsManualInCallSounds:](self, "setMockNeedsManualInCallSounds:", [v4 needsManualInCallSounds]);
  -[CSDMockCall setMockPrefersExclusiveAccessToCellularNetwork:](self, "setMockPrefersExclusiveAccessToCellularNetwork:", [v4 prefersExclusiveAccessToCellularNetwork]);
  -[CSDMockCall setMockTTYType:](self, "setMockTTYType:", [v4 ttyType]);
  -[CSDMockCall setMockSupportsTTYWithVoice:](self, "setMockSupportsTTYWithVoice:", [v4 supportsTTYWithVoice]);
  -[CSDMockCall setMockIsThirdPartyVideo:](self, "setMockIsThirdPartyVideo:", [v4 isThirdPartyVideo]);
  -[CSDMockCall setMockVideoStreamToken:](self, "setMockVideoStreamToken:", [v4 videoStreamToken]);
  -[CSDMockCall setMockConversation:](self, "setMockConversation:", [v4 isConversation]);
  -[CSDMockCall setMockFailureExpected:](self, "setMockFailureExpected:", [v4 isFailureExpected]);
  -[CSDMockCall setMockSupportsEmergencyFallback:](self, "setMockSupportsEmergencyFallback:", [v4 supportsEmergencyFallback]);
  -[CSDMockCall setMockSharingScreen:](self, "setMockSharingScreen:", [v4 isSharingScreen]);
  id v12 = [v4 screenShareAttributes];
  [(CSDMockCall *)self setMockScreenShareAttributes:v12];

  -[CSDMockCall setMockHasBeenRedirected:](self, "setMockHasBeenRedirected:", [v4 hasBeenRedirected]);
  -[CSDMockCall setMockShouldSuppressRingtone:](self, "setMockShouldSuppressRingtone:", [v4 shouldSuppressRingtone]);
  v13 = [v4 blockedByExtension];
  [(CSDMockCall *)self setMockBlockedByExtension:v13];

  v14 = [v4 callDirectoryIdentityExtension];
  [(CSDMockCall *)self setMockCallDirectoryIdentityExtension:v14];

  -[CSDMockCall setMockFilteredOutReason:](self, "setMockFilteredOutReason:", [v4 filteredOutReason]);
  objc_super v15 = [v4 recordingSession];

  [(CSDMockCall *)self setMockRecordingSession:v15];
  [(CSDCall *)self propertiesChanged];
}

- (TUCallDisplayContext)displayContext
{
  mockDisplayContext = self->_mockDisplayContext;
  if (mockDisplayContext)
  {
    v3 = mockDisplayContext;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSDMockCall;
    v3 = [(CSDCall *)&v5 displayContext];
  }

  return v3;
}

- (void)setMockCallStatus:(int)a3
{
  self->_mockCallStatus = a3;
  if (a3 == 1)
  {
    id v4 = [(CSDMockCall *)self dateConnected];

    if (!v4)
    {
      id v5 = +[NSDate date];
      [(CSDMockCall *)self setMockDateConnected:v5];
    }
  }
}

- (void)hold
{
}

- (void)unhold
{
}

- (void)answerWithRequest:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSDMockCall;
  [(CSDMockCall *)&v6 answerWithRequest:a3];
  [(CSDMockCall *)self setMockCallStatus:1];
  id v4 = +[NSDate date];
  [(CSDCall *)self setDateStartedConnecting:v4];

  id v5 = +[NSDate date];
  [(CSDCall *)self setDateConnected:v5];

  [(CSDCall *)self propertiesChanged];
}

- (void)performUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  -[CSDMockCall setUplinkMuted:](self, "setUplinkMuted:");
  id v5 = [(CSDMockCall *)self didPerformUplinkMuted];

  if (v5)
  {
    objc_super v6 = [(CSDMockCall *)self didPerformUplinkMuted];
    v6[2](v6, v3);
  }
}

- (void)dialWithRequest:(id)a3 displayContext:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CSDMockCall;
  id v6 = a3;
  [(CSDCall *)&v11 dialWithRequest:v6 displayContext:a4];
  -[CSDMockCall setMockCallStatus:](self, "setMockCallStatus:", 1, v11.receiver, v11.super_class);
  id v7 = [v6 provider];
  [(CSDMockCall *)self setMockProvider:v7];

  id v8 = [v6 handle];
  [(CSDMockCall *)self setMockHandle:v8];

  -[CSDMockCall setMockHostedOnCurrentDevice:](self, "setMockHostedOnCurrentDevice:", [v6 hostOnCurrentDevice]);
  id v9 = [v6 endpointOnCurrentDevice];

  [(CSDMockCall *)self setMockEndpointOnCurrentDevice:v9];
  v10 = +[NSDate date];
  [(CSDCall *)self setDateStartedConnecting:v10];

  [(CSDCall *)self setSoundRegion:1];
  [(CSDMockCall *)self setMockNeedsManualInCallSounds:0];
  [(CSDCall *)self propertiesChanged];
}

- (void)disconnectWithReason:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSDMockCall;
  [(CSDMockCall *)&v4 disconnectWithReason:*(void *)&a3];
  [(CSDMockCall *)self setMockCallStatus:6];
  [(CSDCall *)self propertiesChanged];
}

- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(CSDMockCall *)self setMockSharingScreen:v4];
  [(CSDMockCall *)self setMockScreenShareAttributes:v6];

  [(CSDCall *)self propertiesChanged];
}

- (NSError)recordingAllowedError
{
  return self->_mockRecordingAllowedError;
}

- (void)setMockRecordingAllowedError:(id)a3
{
}

- (int)service
{
  return self->_mockService;
}

- (void)setMockService:(int)a3
{
  self->_mockService = a3;
}

- (int)callStatus
{
  return self->_mockCallStatus;
}

- (NSString)uniqueProxyIdentifier
{
  return self->_mockUniqueProxyIdentifier;
}

- (void)setMockUniqueProxyIdentifier:(id)a3
{
}

- (BOOL)isPTT
{
  return self->_mockPTT;
}

- (void)setMockPTT:(BOOL)a3
{
  self->_mockPTT = a3;
}

- (BOOL)isRTT
{
  return self->_mockRTT;
}

- (void)setMockRTT:(BOOL)a3
{
  self->_mockRTT = a3;
}

- (BOOL)isVideo
{
  return self->_mockIsVideo;
}

- (void)setMockIsVideo:(BOOL)a3
{
  self->_mockIsVideo = a3;
}

- (BOOL)isVideoPaused
{
  return self->_mockIsVideoPaused;
}

- (void)setMockIsVideoPaused:(BOOL)a3
{
  self->_mockIsVideoPaused = a3;
}

- (BOOL)isHostedOnCurrentDevice
{
  return self->_mockHostedOnCurrentDevice;
}

- (void)setMockHostedOnCurrentDevice:(BOOL)a3
{
  self->_mockHostedOnCurrentDevice = a3;
}

- (BOOL)isEndpointOnCurrentDevice
{
  return self->_mockEndpointOnCurrentDevice;
}

- (void)setMockEndpointOnCurrentDevice:(BOOL)a3
{
  self->_mockEndpointOnCurrentDevice = a3;
}

- (BOOL)isScreening
{
  return self->_mockScreening;
}

- (void)setMockScreening:(BOOL)a3
{
  self->_mockScreening = a3;
}

- (BOOL)wasScreened
{
  return self->_mockWasScreened;
}

- (void)setMockWasScreened:(BOOL)a3
{
  self->_mockWasScreened = a3;
}

- (BOOL)isScreeningDueToUserInteraction
{
  return self->_mockScreeningDueToUserInteraction;
}

- (void)setMockScreeningDueToUserInteraction:(BOOL)a3
{
  self->_mockScreeningDueToUserInteraction = a3;
}

- (BOOL)screeningAnnouncementHasFinished
{
  return self->_mockScreeningAnnouncementHasFinished;
}

- (void)setMockScreeningAnnouncementHasFinished:(BOOL)a3
{
  self->_mockScreeningAnnouncementHasFinished = a3;
}

- (BOOL)isBlocked
{
  return self->_mockBlocked;
}

- (void)setMockBlocked:(BOOL)a3
{
  self->_mockBlocked = a3;
}

- (BOOL)isVoicemail
{
  return self->_mockVoicemail;
}

- (void)setMockVoicemail:(BOOL)a3
{
  self->_mockVoicemail = a3;
}

- (double)callDuration
{
  return self->_mockCallDuration;
}

- (void)setMockCallDuration:(double)a3
{
  self->_mockCallDuration = a3;
}

- (BOOL)isEmergency
{
  return self->_mockEmergency;
}

- (void)setMockEmergency:(BOOL)a3
{
  self->_mockEmergency = a3;
}

- (BOOL)isFailureExpected
{
  return self->_mockFailureExpected;
}

- (void)setMockFailureExpected:(BOOL)a3
{
  self->_mockFailureExpected = a3;
}

- (BOOL)mockSupportsEmergencyFallback
{
  return self->_mockSupportsEmergencyFallback;
}

- (void)setMockSupportsEmergencyFallback:(BOOL)a3
{
  self->_mockSupportsEmergencyFallback = a3;
}

- (BOOL)isSOS
{
  return self->_mockSOS;
}

- (void)setSOS:(BOOL)a3
{
  self->_mockSOS = a3;
}

- (BOOL)isOutgoing
{
  return self->_mockOutgoing;
}

- (void)setMockOutgoing:(BOOL)a3
{
  self->_mockOutgoing = a3;
}

- (BOOL)isConferenced
{
  return self->_mockConferenced;
}

- (void)setMockConferenced:(BOOL)a3
{
  self->_mockConferenced = a3;
}

- (BOOL)isUsingBaseband
{
  return self->_mockUsingBaseband;
}

- (void)setMockUsingBaseband:(BOOL)a3
{
  self->_mockUsingBaseband = a3;
}

- (int)ttyType
{
  return self->_mockTTYType;
}

- (void)setMockTTYType:(int)a3
{
  self->_mockTTYType = a3;
}

- (BOOL)supportsTTYWithVoice
{
  return self->_mockSupportsTTYWithVoice;
}

- (void)setMockSupportsTTYWithVoice:(BOOL)a3
{
  self->_mockSupportsTTYWithVoice = a3;
}

- (int)disconnectedReason
{
  return self->_mockDisconnectedReason;
}

- (void)setMockDisconnectedReason:(int)a3
{
  self->_mockDisconnectedReason = a3;
}

- (TUHandle)handle
{
  return self->_mockHandle;
}

- (void)setMockHandle:(id)a3
{
}

- (NSString)localizedLabel
{
  return self->_mockLocalizedLabel;
}

- (void)setMockLocalizedLabel:(id)a3
{
}

- (NSString)callDirectoryName
{
  return self->_mockCallDirectoryName;
}

- (void)setMockCallDirectoryName:(id)a3
{
}

- (NSString)companyName
{
  return self->_mockCompanyName;
}

- (void)setMockCompanyName:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_mockImageURL;
}

- (void)setMockImageURL:(id)a3
{
}

- (NSString)callUUID
{
  return self->_mockCallUUID;
}

- (void)setMockCallUUID:(id)a3
{
}

- (NSString)callerNameFromNetwork
{
  return self->_mockCallerNameFromNetwork;
}

- (void)setMockCallerNameFromNetwork:(id)a3
{
}

- (int64_t)bytesOfDataUsed
{
  return self->_mockBytesOfDataUsed;
}

- (void)setMockBytesOfDataUsed:(int64_t)a3
{
  self->_mockBytesOfDataUsed = a3;
}

- (int)subtype
{
  return self->_mockSubtype;
}

- (void)setMockSubtype:(int)a3
{
  self->_mockSubtype = a3;
}

- (BOOL)needsManualInCallSounds
{
  return self->_mockNeedsManualInCallSounds;
}

- (void)setMockNeedsManualInCallSounds:(BOOL)a3
{
  self->_mockNeedsManualInCallSounds = a3;
}

- (NSString)audioCategory
{
  return self->_mockAudioCategory;
}

- (void)setMockAudioCategory:(id)a3
{
}

- (NSString)audioMode
{
  return self->_mockAudioMode;
}

- (void)setMockAudioMode:(id)a3
{
}

- (NSUUID)callGroupUUID
{
  return self->_mockCallGroupUUID;
}

- (void)setMockCallGroupUUID:(id)a3
{
}

- (TUCallProvider)provider
{
  return self->_mockProvider;
}

- (void)setMockProvider:(id)a3
{
}

- (NSDictionary)providerContext
{
  return self->_mockProviderContext;
}

- (void)setMockProviderContext:(id)a3
{
}

- (int64_t)providerErrorCode
{
  return self->_mockProviderErrorCode;
}

- (void)setMockProviderErrorCode:(int64_t)a3
{
  self->_mockProviderErrorCode = a3;
}

- (void)setMockDisplayContext:(id)a3
{
}

- (BOOL)hasStartedOutgoing
{
  return self->_mockHasStartedOutgoing;
}

- (void)setMockHasStartedOutgoing:(BOOL)a3
{
  self->_mockHasStartedOutgoing = a3;
}

- (BOOL)hasSentInvitation
{
  return self->_mockHasSentInvitation;
}

- (void)setMockHasSentInvitation:(BOOL)a3
{
  self->_mockHasSentInvitation = a3;
}

- (BOOL)isConnecting
{
  return self->_mockConnecting;
}

- (void)setMockConnecting:(BOOL)a3
{
  self->_mockConnecting = a3;
}

- (BOOL)isConnected
{
  return self->_mockConnected;
}

- (void)setMockConnected:(BOOL)a3
{
  self->_mockConnected = a3;
}

- (BOOL)isUplinkMuted
{
  return self->_mockUplinkMuted;
}

- (void)setUplinkMuted:(BOOL)a3
{
  self->_mockUplinkMuted = a3;
}

- (BOOL)uplinkWasExplicitlyMuted
{
  return self->_mockUplinkWasExplicitlyMuted;
}

- (void)setMockUplinkWasExplicitlyMuted:(BOOL)a3
{
  self->_mockUplinkWasExplicitlyMuted = a3;
}

- (int64_t)videoStreamToken
{
  return self->_mockVideoStreamToken;
}

- (void)setMockVideoStreamToken:(int64_t)a3
{
  self->_mockVideoStreamToken = a3;
}

- (BOOL)mayRequireBreakBeforeMake
{
  return self->_mockMayRequireBreakBeforeMake;
}

- (void)setMockMayRequireBreakBeforeMake:(BOOL)a3
{
  self->_mockMayRequireBreakBeforeMake = a3;
}

- (int64_t)audioInterruptionProviderType
{
  return self->_mockAudioInterruptionProviderType;
}

- (void)setMockAudioInterruptionProviderType:(int64_t)a3
{
  self->_mockAudioInterruptionProviderType = a3;
}

- (NSString)displayName
{
  return self->_mockDisplayName;
}

- (void)setMockDisplayName:(id)a3
{
}

- (BOOL)prefersExclusiveAccessToCellularNetwork
{
  return self->_mockPrefersExclusiveAccessToCellularNetwork;
}

- (void)setMockPrefersExclusiveAccessToCellularNetwork:(BOOL)a3
{
  self->_mockPrefersExclusiveAccessToCellularNetwork = a3;
}

- (NSArray)contactIdentifiers
{
  return self->_mockContactIdentifiers;
}

- (void)setMockContactIdentifiers:(id)a3
{
}

- (NSDate)dateCreated
{
  return self->_mockDateCreated;
}

- (void)setMockDateCreated:(id)a3
{
}

- (NSDate)dateConnected
{
  return self->_mockDateConnected;
}

- (void)setMockDateConnected:(id)a3
{
}

- (CXAudioSessionActivationStateObserver)audioInterruptionActivationStateObserver
{
  return self->_mockAudioInterruptionActivationStateObserver;
}

- (void)setMockAudioInterruptionActivationStateObserver:(id)a3
{
}

- (CXCallSource)backingCallSource
{
  return self->_mockBackingCallSource;
}

- (void)setMockBackingCallSource:(id)a3
{
}

- (BOOL)isThirdPartyVideo
{
  return self->_mockIsThirdPartyVideo;
}

- (void)setMockIsThirdPartyVideo:(BOOL)a3
{
  self->_mockIsThirdPartyVideo = a3;
}

- (unint64_t)initialLinkType
{
  return self->_mockInitialLinkType;
}

- (void)setMockInitialLinkType:(unint64_t)a3
{
  self->_mockInitialLinkType = a3;
}

- (int)callRelaySupport
{
  return self->_mockCallRelaySupport;
}

- (void)setMockCallRelaySupport:(int)a3
{
  self->_mockCallRelaySupport = a3;
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_mockShouldSuppressInCallUI;
}

- (void)setMockShouldSuppressInCallUI:(BOOL)a3
{
  self->_mockShouldSuppressInCallUI = a3;
}

- (int64_t)junkConfidence
{
  return self->_mockJunkConfidence;
}

- (void)setMockJunkConfidence:(int64_t)a3
{
  self->_mockJunkConfidence = a3;
}

- (BOOL)isKnownCaller
{
  return self->_mockKnownCaller;
}

- (void)setMockKnownCaller:(BOOL)a3
{
  self->_mockKnownCaller = a3;
}

- (BOOL)isConversation
{
  return self->_mockConversation;
}

- (void)setMockConversation:(BOOL)a3
{
  self->_mockConversation = a3;
}

- (BOOL)isSharingScreen
{
  return self->_mockSharingScreen;
}

- (void)setMockSharingScreen:(BOOL)a3
{
  self->_mockSharingScreen = a3;
}

- (TUCallScreenShareAttributes)screenShareAttributes
{
  return self->_mockScreenShareAttributes;
}

- (void)setMockScreenShareAttributes:(id)a3
{
}

- (BOOL)hasBeenRedirected
{
  return self->_mockHasBeenRedirected;
}

- (void)setMockHasBeenRedirected:(BOOL)a3
{
  self->_mockHasBeenRedirected = a3;
}

- (NSUUID)localSenderIdentityAccountUUID
{
  return self->_mockLocalSenderIdentityAccountUUID;
}

- (void)setMockLocalSenderIdentityAccountUUID:(id)a3
{
}

- (BOOL)isLocalUserInHomeCountry
{
  return self->_mockLocalUserInHomeCountry;
}

- (void)setMockLocalUserInHomeCountry:(BOOL)a3
{
  self->_mockLocalUserInHomeCountry = a3;
}

- (BOOL)ringtoneSuppressedRemotely
{
  return self->_mockRingtoneSuppressedRemotely;
}

- (void)setMockRingtoneSuppressedRemotely:(BOOL)a3
{
  self->_mockRingtoneSuppressedRemotely = a3;
}

- (BOOL)shouldSuppressRingtone
{
  return self->_mockShouldSuppressRingtone;
}

- (void)setMockShouldSuppressRingtone:(BOOL)a3
{
  self->_mockShouldSuppressRingtone = a3;
}

- (NSString)blockedByExtension
{
  return self->_mockBlockedByExtension;
}

- (void)setMockBlockedByExtension:(id)a3
{
}

- (NSString)callDirectoryIdentityExtension
{
  return self->_mockCallDirectoryIdentityExtension;
}

- (void)setMockCallDirectoryIdentityExtension:(id)a3
{
}

- (int)filteredOutReason
{
  return self->_mockFilteredOutReason;
}

- (void)setMockFilteredOutReason:(int)a3
{
  self->_mockFilteredOutReason = a3;
}

- (int64_t)callDirectoryIdentityType
{
  return self->_mockCallDirectoryIdentityType;
}

- (void)setMockCallDirectoryIdentityType:(int64_t)a3
{
  self->_mockCallDirectoryIdentityType = a3;
}

- (TUCallRecordingSession)recordingSession
{
  return self->_mockRecordingSession;
}

- (void)setMockRecordingSession:(id)a3
{
}

- (id)didPerformUplinkMuted
{
  return self->_didPerformUplinkMuted;
}

- (void)setDidPerformUplinkMuted:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didPerformUplinkMuted, 0);
  objc_storeStrong((id *)&self->_mockRecordingSession, 0);
  objc_storeStrong((id *)&self->_mockCallDirectoryIdentityExtension, 0);
  objc_storeStrong((id *)&self->_mockBlockedByExtension, 0);
  objc_storeStrong((id *)&self->_mockLocalSenderIdentityAccountUUID, 0);
  objc_storeStrong((id *)&self->_mockScreenShareAttributes, 0);
  objc_storeStrong((id *)&self->_mockBackingCallSource, 0);
  objc_storeStrong((id *)&self->_mockAudioInterruptionActivationStateObserver, 0);
  objc_storeStrong((id *)&self->_mockDateConnected, 0);
  objc_storeStrong((id *)&self->_mockDateCreated, 0);
  objc_storeStrong((id *)&self->_mockContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_mockDisplayName, 0);
  objc_storeStrong((id *)&self->_mockDisplayContext, 0);
  objc_storeStrong((id *)&self->_mockProviderContext, 0);
  objc_storeStrong((id *)&self->_mockProvider, 0);
  objc_storeStrong((id *)&self->_mockCallGroupUUID, 0);
  objc_storeStrong((id *)&self->_mockAudioMode, 0);
  objc_storeStrong((id *)&self->_mockAudioCategory, 0);
  objc_storeStrong((id *)&self->_mockCallerNameFromNetwork, 0);
  objc_storeStrong((id *)&self->_mockCallUUID, 0);
  objc_storeStrong((id *)&self->_mockImageURL, 0);
  objc_storeStrong((id *)&self->_mockCompanyName, 0);
  objc_storeStrong((id *)&self->_mockCallDirectoryName, 0);
  objc_storeStrong((id *)&self->_mockLocalizedLabel, 0);
  objc_storeStrong((id *)&self->_mockHandle, 0);
  objc_storeStrong((id *)&self->_mockUniqueProxyIdentifier, 0);

  objc_storeStrong((id *)&self->_mockRecordingAllowedError, 0);
}

@end