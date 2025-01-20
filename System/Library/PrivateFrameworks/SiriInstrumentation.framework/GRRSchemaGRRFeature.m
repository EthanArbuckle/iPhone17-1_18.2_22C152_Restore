@interface GRRSchemaGRRFeature
- (BOOL)canResolveContactByRelationship;
- (BOOL)contactHasRequestedAddressDetail;
- (BOOL)deviceIsPlayingAudio;
- (BOOL)hasApplicationsInForeground;
- (BOOL)hasAsrRank;
- (BOOL)hasCanResolveContactByRelationship;
- (BOOL)hasConfiguredSiriLanguage;
- (BOOL)hasContactHasRequestedAddressDetail;
- (BOOL)hasContactMatchConfidence;
- (BOOL)hasDeviceIsPlayingAudio;
- (BOOL)hasInputOrigin;
- (BOOL)hasIsActiveAlarmPresent;
- (BOOL)hasIsActiveAppointmentPresent;
- (BOOL)hasIsAnnounceEnabled;
- (BOOL)hasIsAppInstalled;
- (BOOL)hasIsAppMatchPresent;
- (BOOL)hasIsAppRunning;
- (BOOL)hasIsArtistPresent;
- (BOOL)hasIsAudioPlaying;
- (BOOL)hasIsContactNameResolved;
- (BOOL)hasIsEmailAvailable;
- (BOOL)hasIsFollowUp;
- (BOOL)hasIsMediaItemEntityPresent;
- (BOOL)hasIsMessagingPossible;
- (BOOL)hasIsMessagingPossibleForSendMessageIntent;
- (BOOL)hasIsPhoneCallPossible;
- (BOOL)hasIsPhoneCallPossibleForPhoneCallIntent;
- (BOOL)hasIsPhoneNumberAvailable;
- (BOOL)hasIsPhoneNumberContactResolvable;
- (BOOL)hasIsPreviousTurnSendEmptyMessage;
- (BOOL)hasIsSettingOn;
- (BOOL)hasIsTimerActive;
- (BOOL)hasIsVideoPlaying;
- (BOOL)hasNumberOfContactsResolved;
- (BOOL)hasPreviousFlowDomain;
- (BOOL)hasRequestTimeBeginMs;
- (BOOL)hasSharingAppActive;
- (BOOL)hasSharingEntityPresent;
- (BOOL)hasSharingRecipientPresent;
- (BOOL)hasSmsAttachmentExists;
- (BOOL)hasSmsAttributeRecipientExists;
- (BOOL)hasSmsAttributeSenderExists;
- (BOOL)hasSmsPhoneNumberMentioned;
- (BOOL)hasSmsTextPayloadExists;
- (BOOL)hasTimeSinceLastValidRequestMs;
- (BOOL)hasTopTopics;
- (BOOL)isActiveAlarmPresent;
- (BOOL)isActiveAppointmentPresent;
- (BOOL)isAnnounceEnabled;
- (BOOL)isAppInstalled;
- (BOOL)isAppMatchPresent;
- (BOOL)isAppRunning;
- (BOOL)isArtistPresent;
- (BOOL)isAudioPlaying;
- (BOOL)isContactNameResolved;
- (BOOL)isEmailAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFollowUp;
- (BOOL)isMediaItemEntityPresent;
- (BOOL)isMessagingPossible;
- (BOOL)isMessagingPossibleForSendMessageIntent;
- (BOOL)isPhoneCallPossible;
- (BOOL)isPhoneCallPossibleForPhoneCallIntent;
- (BOOL)isPhoneNumberAvailable;
- (BOOL)isPhoneNumberContactResolvable;
- (BOOL)isPreviousTurnSendEmptyMessage;
- (BOOL)isSettingOn;
- (BOOL)isTimerActive;
- (BOOL)isVideoPlaying;
- (BOOL)readFrom:(id)a3;
- (BOOL)sharingAppActive;
- (BOOL)sharingEntityPresent;
- (BOOL)sharingRecipientPresent;
- (BOOL)smsAttachmentExists;
- (BOOL)smsAttributeRecipientExists;
- (BOOL)smsAttributeSenderExists;
- (BOOL)smsPhoneNumberMentioned;
- (BOOL)smsTextPayloadExists;
- (GRRSchemaGRRFeature)initWithDictionary:(id)a3;
- (GRRSchemaGRRFeature)initWithJSON:(id)a3;
- (GRRSchemaGRRStringList)applicationsInForeground;
- (GRRSchemaGRRStringList)topTopics;
- (NSData)jsonData;
- (NSString)configuredSiriLanguage;
- (NSString)inputOrigin;
- (NSString)previousFlowDomain;
- (double)contactMatchConfidence;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)requestTimeBeginMs;
- (unint64_t)timeSinceLastValidRequestMs;
- (unint64_t)whichFeature;
- (unsigned)asrRank;
- (unsigned)numberOfContactsResolved;
- (void)deleteApplicationsInForeground;
- (void)deleteAsrRank;
- (void)deleteCanResolveContactByRelationship;
- (void)deleteConfiguredSiriLanguage;
- (void)deleteContactHasRequestedAddressDetail;
- (void)deleteContactMatchConfidence;
- (void)deleteDeviceIsPlayingAudio;
- (void)deleteInputOrigin;
- (void)deleteIsActiveAlarmPresent;
- (void)deleteIsActiveAppointmentPresent;
- (void)deleteIsAnnounceEnabled;
- (void)deleteIsAppInstalled;
- (void)deleteIsAppMatchPresent;
- (void)deleteIsAppRunning;
- (void)deleteIsArtistPresent;
- (void)deleteIsAudioPlaying;
- (void)deleteIsContactNameResolved;
- (void)deleteIsEmailAvailable;
- (void)deleteIsFollowUp;
- (void)deleteIsMediaItemEntityPresent;
- (void)deleteIsMessagingPossible;
- (void)deleteIsMessagingPossibleForSendMessageIntent;
- (void)deleteIsPhoneCallPossible;
- (void)deleteIsPhoneCallPossibleForPhoneCallIntent;
- (void)deleteIsPhoneNumberAvailable;
- (void)deleteIsPhoneNumberContactResolvable;
- (void)deleteIsPreviousTurnSendEmptyMessage;
- (void)deleteIsSettingOn;
- (void)deleteIsTimerActive;
- (void)deleteIsVideoPlaying;
- (void)deleteNumberOfContactsResolved;
- (void)deletePreviousFlowDomain;
- (void)deleteRequestTimeBeginMs;
- (void)deleteSharingAppActive;
- (void)deleteSharingEntityPresent;
- (void)deleteSharingRecipientPresent;
- (void)deleteSmsAttachmentExists;
- (void)deleteSmsAttributeRecipientExists;
- (void)deleteSmsAttributeSenderExists;
- (void)deleteSmsPhoneNumberMentioned;
- (void)deleteSmsTextPayloadExists;
- (void)deleteTimeSinceLastValidRequestMs;
- (void)deleteTopTopics;
- (void)setApplicationsInForeground:(id)a3;
- (void)setAsrRank:(unsigned int)a3;
- (void)setCanResolveContactByRelationship:(BOOL)a3;
- (void)setConfiguredSiriLanguage:(id)a3;
- (void)setContactHasRequestedAddressDetail:(BOOL)a3;
- (void)setContactMatchConfidence:(double)a3;
- (void)setDeviceIsPlayingAudio:(BOOL)a3;
- (void)setHasApplicationsInForeground:(BOOL)a3;
- (void)setHasAsrRank:(BOOL)a3;
- (void)setHasCanResolveContactByRelationship:(BOOL)a3;
- (void)setHasConfiguredSiriLanguage:(BOOL)a3;
- (void)setHasContactHasRequestedAddressDetail:(BOOL)a3;
- (void)setHasContactMatchConfidence:(BOOL)a3;
- (void)setHasDeviceIsPlayingAudio:(BOOL)a3;
- (void)setHasInputOrigin:(BOOL)a3;
- (void)setHasIsActiveAlarmPresent:(BOOL)a3;
- (void)setHasIsActiveAppointmentPresent:(BOOL)a3;
- (void)setHasIsAnnounceEnabled:(BOOL)a3;
- (void)setHasIsAppInstalled:(BOOL)a3;
- (void)setHasIsAppMatchPresent:(BOOL)a3;
- (void)setHasIsAppRunning:(BOOL)a3;
- (void)setHasIsArtistPresent:(BOOL)a3;
- (void)setHasIsAudioPlaying:(BOOL)a3;
- (void)setHasIsContactNameResolved:(BOOL)a3;
- (void)setHasIsEmailAvailable:(BOOL)a3;
- (void)setHasIsFollowUp:(BOOL)a3;
- (void)setHasIsMediaItemEntityPresent:(BOOL)a3;
- (void)setHasIsMessagingPossible:(BOOL)a3;
- (void)setHasIsMessagingPossibleForSendMessageIntent:(BOOL)a3;
- (void)setHasIsPhoneCallPossible:(BOOL)a3;
- (void)setHasIsPhoneCallPossibleForPhoneCallIntent:(BOOL)a3;
- (void)setHasIsPhoneNumberAvailable:(BOOL)a3;
- (void)setHasIsPhoneNumberContactResolvable:(BOOL)a3;
- (void)setHasIsPreviousTurnSendEmptyMessage:(BOOL)a3;
- (void)setHasIsSettingOn:(BOOL)a3;
- (void)setHasIsTimerActive:(BOOL)a3;
- (void)setHasIsVideoPlaying:(BOOL)a3;
- (void)setHasNumberOfContactsResolved:(BOOL)a3;
- (void)setHasPreviousFlowDomain:(BOOL)a3;
- (void)setHasRequestTimeBeginMs:(BOOL)a3;
- (void)setHasSharingAppActive:(BOOL)a3;
- (void)setHasSharingEntityPresent:(BOOL)a3;
- (void)setHasSharingRecipientPresent:(BOOL)a3;
- (void)setHasSmsAttachmentExists:(BOOL)a3;
- (void)setHasSmsAttributeRecipientExists:(BOOL)a3;
- (void)setHasSmsAttributeSenderExists:(BOOL)a3;
- (void)setHasSmsPhoneNumberMentioned:(BOOL)a3;
- (void)setHasSmsTextPayloadExists:(BOOL)a3;
- (void)setHasTimeSinceLastValidRequestMs:(BOOL)a3;
- (void)setHasTopTopics:(BOOL)a3;
- (void)setInputOrigin:(id)a3;
- (void)setIsActiveAlarmPresent:(BOOL)a3;
- (void)setIsActiveAppointmentPresent:(BOOL)a3;
- (void)setIsAnnounceEnabled:(BOOL)a3;
- (void)setIsAppInstalled:(BOOL)a3;
- (void)setIsAppMatchPresent:(BOOL)a3;
- (void)setIsAppRunning:(BOOL)a3;
- (void)setIsArtistPresent:(BOOL)a3;
- (void)setIsAudioPlaying:(BOOL)a3;
- (void)setIsContactNameResolved:(BOOL)a3;
- (void)setIsEmailAvailable:(BOOL)a3;
- (void)setIsFollowUp:(BOOL)a3;
- (void)setIsMediaItemEntityPresent:(BOOL)a3;
- (void)setIsMessagingPossible:(BOOL)a3;
- (void)setIsMessagingPossibleForSendMessageIntent:(BOOL)a3;
- (void)setIsPhoneCallPossible:(BOOL)a3;
- (void)setIsPhoneCallPossibleForPhoneCallIntent:(BOOL)a3;
- (void)setIsPhoneNumberAvailable:(BOOL)a3;
- (void)setIsPhoneNumberContactResolvable:(BOOL)a3;
- (void)setIsPreviousTurnSendEmptyMessage:(BOOL)a3;
- (void)setIsSettingOn:(BOOL)a3;
- (void)setIsTimerActive:(BOOL)a3;
- (void)setIsVideoPlaying:(BOOL)a3;
- (void)setNumberOfContactsResolved:(unsigned int)a3;
- (void)setPreviousFlowDomain:(id)a3;
- (void)setRequestTimeBeginMs:(unint64_t)a3;
- (void)setSharingAppActive:(BOOL)a3;
- (void)setSharingEntityPresent:(BOOL)a3;
- (void)setSharingRecipientPresent:(BOOL)a3;
- (void)setSmsAttachmentExists:(BOOL)a3;
- (void)setSmsAttributeRecipientExists:(BOOL)a3;
- (void)setSmsAttributeSenderExists:(BOOL)a3;
- (void)setSmsPhoneNumberMentioned:(BOOL)a3;
- (void)setSmsTextPayloadExists:(BOOL)a3;
- (void)setTimeSinceLastValidRequestMs:(unint64_t)a3;
- (void)setTopTopics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GRRSchemaGRRFeature

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GRRSchemaGRRFeature;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(GRRSchemaGRRFeature *)self applicationsInForeground];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(GRRSchemaGRRFeature *)self deleteApplicationsInForeground];
  }
  v9 = [(GRRSchemaGRRFeature *)self topTopics];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(GRRSchemaGRRFeature *)self deleteTopTopics];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topTopics, 0);
  objc_storeStrong((id *)&self->_previousFlowDomain, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_configuredSiriLanguage, 0);
  objc_storeStrong((id *)&self->_applicationsInForeground, 0);
}

- (void)setHasTopTopics:(BOOL)a3
{
  self->_hasTopTopics = a3;
}

- (BOOL)hasTopTopics
{
  return self->_hasTopTopics;
}

- (void)setHasTimeSinceLastValidRequestMs:(BOOL)a3
{
  self->_hasTimeSinceLastValidRequestMs = a3;
}

- (BOOL)hasTimeSinceLastValidRequestMs
{
  return self->_hasTimeSinceLastValidRequestMs;
}

- (void)setHasSmsTextPayloadExists:(BOOL)a3
{
  self->_hasSmsTextPayloadExists = a3;
}

- (BOOL)hasSmsTextPayloadExists
{
  return self->_hasSmsTextPayloadExists;
}

- (void)setHasSmsPhoneNumberMentioned:(BOOL)a3
{
  self->_hasSmsPhoneNumberMentioned = a3;
}

- (BOOL)hasSmsPhoneNumberMentioned
{
  return self->_hasSmsPhoneNumberMentioned;
}

- (void)setHasSmsAttributeSenderExists:(BOOL)a3
{
  self->_hasSmsAttributeSenderExists = a3;
}

- (BOOL)hasSmsAttributeSenderExists
{
  return self->_hasSmsAttributeSenderExists;
}

- (void)setHasSmsAttributeRecipientExists:(BOOL)a3
{
  self->_hasSmsAttributeRecipientExists = a3;
}

- (BOOL)hasSmsAttributeRecipientExists
{
  return self->_hasSmsAttributeRecipientExists;
}

- (void)setHasSmsAttachmentExists:(BOOL)a3
{
  self->_hasSmsAttachmentExists = a3;
}

- (BOOL)hasSmsAttachmentExists
{
  return self->_hasSmsAttachmentExists;
}

- (void)setHasSharingRecipientPresent:(BOOL)a3
{
  self->_hasSharingRecipientPresent = a3;
}

- (BOOL)hasSharingRecipientPresent
{
  return self->_hasSharingRecipientPresent;
}

- (void)setHasSharingEntityPresent:(BOOL)a3
{
  self->_hasSharingEntityPresent = a3;
}

- (BOOL)hasSharingEntityPresent
{
  return self->_hasSharingEntityPresent;
}

- (void)setHasSharingAppActive:(BOOL)a3
{
  self->_hasSharingAppActive = a3;
}

- (BOOL)hasSharingAppActive
{
  return self->_hasSharingAppActive;
}

- (void)setHasRequestTimeBeginMs:(BOOL)a3
{
  self->_hasRequestTimeBeginMs = a3;
}

- (BOOL)hasRequestTimeBeginMs
{
  return self->_hasRequestTimeBeginMs;
}

- (void)setHasPreviousFlowDomain:(BOOL)a3
{
  self->_hasPreviousFlowDomain = a3;
}

- (BOOL)hasPreviousFlowDomain
{
  return self->_hasPreviousFlowDomain;
}

- (void)setHasNumberOfContactsResolved:(BOOL)a3
{
  self->_hasNumberOfContactsResolved = a3;
}

- (BOOL)hasNumberOfContactsResolved
{
  return self->_hasNumberOfContactsResolved;
}

- (void)setHasIsVideoPlaying:(BOOL)a3
{
  self->_hasIsVideoPlaying = a3;
}

- (BOOL)hasIsVideoPlaying
{
  return self->_hasIsVideoPlaying;
}

- (void)setHasIsTimerActive:(BOOL)a3
{
  self->_hasIsTimerActive = a3;
}

- (BOOL)hasIsTimerActive
{
  return self->_hasIsTimerActive;
}

- (void)setHasIsSettingOn:(BOOL)a3
{
  self->_hasIsSettingOn = a3;
}

- (BOOL)hasIsSettingOn
{
  return self->_hasIsSettingOn;
}

- (void)setHasIsPreviousTurnSendEmptyMessage:(BOOL)a3
{
  self->_hasIsPreviousTurnSendEmptyMessage = a3;
}

- (BOOL)hasIsPreviousTurnSendEmptyMessage
{
  return self->_hasIsPreviousTurnSendEmptyMessage;
}

- (void)setHasIsPhoneNumberContactResolvable:(BOOL)a3
{
  self->_hasIsPhoneNumberContactResolvable = a3;
}

- (BOOL)hasIsPhoneNumberContactResolvable
{
  return self->_hasIsPhoneNumberContactResolvable;
}

- (void)setHasIsPhoneNumberAvailable:(BOOL)a3
{
  self->_hasIsPhoneNumberAvailable = a3;
}

- (BOOL)hasIsPhoneNumberAvailable
{
  return self->_hasIsPhoneNumberAvailable;
}

- (void)setHasIsPhoneCallPossibleForPhoneCallIntent:(BOOL)a3
{
  self->_hasIsPhoneCallPossibleForPhoneCallIntent = a3;
}

- (BOOL)hasIsPhoneCallPossibleForPhoneCallIntent
{
  return self->_hasIsPhoneCallPossibleForPhoneCallIntent;
}

- (void)setHasIsPhoneCallPossible:(BOOL)a3
{
  self->_hasIsPhoneCallPossible = a3;
}

- (BOOL)hasIsPhoneCallPossible
{
  return self->_hasIsPhoneCallPossible;
}

- (void)setHasIsMessagingPossibleForSendMessageIntent:(BOOL)a3
{
  self->_hasIsMessagingPossibleForSendMessageIntent = a3;
}

- (BOOL)hasIsMessagingPossibleForSendMessageIntent
{
  return self->_hasIsMessagingPossibleForSendMessageIntent;
}

- (void)setHasIsMessagingPossible:(BOOL)a3
{
  self->_hasIsMessagingPossible = a3;
}

- (BOOL)hasIsMessagingPossible
{
  return self->_hasIsMessagingPossible;
}

- (void)setHasIsMediaItemEntityPresent:(BOOL)a3
{
  self->_hasIsMediaItemEntityPresent = a3;
}

- (BOOL)hasIsMediaItemEntityPresent
{
  return self->_hasIsMediaItemEntityPresent;
}

- (void)setHasIsFollowUp:(BOOL)a3
{
  self->_hasIsFollowUp = a3;
}

- (BOOL)hasIsFollowUp
{
  return self->_hasIsFollowUp;
}

- (void)setHasIsEmailAvailable:(BOOL)a3
{
  self->_hasIsEmailAvailable = a3;
}

- (BOOL)hasIsEmailAvailable
{
  return self->_hasIsEmailAvailable;
}

- (void)setHasIsContactNameResolved:(BOOL)a3
{
  self->_hasIsContactNameResolved = a3;
}

- (BOOL)hasIsContactNameResolved
{
  return self->_hasIsContactNameResolved;
}

- (void)setHasIsArtistPresent:(BOOL)a3
{
  self->_hasIsArtistPresent = a3;
}

- (BOOL)hasIsArtistPresent
{
  return self->_hasIsArtistPresent;
}

- (void)setHasIsAppRunning:(BOOL)a3
{
  self->_hasIsAppRunning = a3;
}

- (BOOL)hasIsAppRunning
{
  return self->_hasIsAppRunning;
}

- (void)setHasIsAppMatchPresent:(BOOL)a3
{
  self->_hasIsAppMatchPresent = a3;
}

- (BOOL)hasIsAppMatchPresent
{
  return self->_hasIsAppMatchPresent;
}

- (void)setHasIsAppInstalled:(BOOL)a3
{
  self->_hasIsAppInstalled = a3;
}

- (BOOL)hasIsAppInstalled
{
  return self->_hasIsAppInstalled;
}

- (void)setHasIsAudioPlaying:(BOOL)a3
{
  self->_hasIsAudioPlaying = a3;
}

- (BOOL)hasIsAudioPlaying
{
  return self->_hasIsAudioPlaying;
}

- (void)setHasIsAnnounceEnabled:(BOOL)a3
{
  self->_hasIsAnnounceEnabled = a3;
}

- (BOOL)hasIsAnnounceEnabled
{
  return self->_hasIsAnnounceEnabled;
}

- (void)setHasIsActiveAppointmentPresent:(BOOL)a3
{
  self->_hasIsActiveAppointmentPresent = a3;
}

- (BOOL)hasIsActiveAppointmentPresent
{
  return self->_hasIsActiveAppointmentPresent;
}

- (void)setHasIsActiveAlarmPresent:(BOOL)a3
{
  self->_hasIsActiveAlarmPresent = a3;
}

- (BOOL)hasIsActiveAlarmPresent
{
  return self->_hasIsActiveAlarmPresent;
}

- (void)setHasInputOrigin:(BOOL)a3
{
  self->_hasInputOrigin = a3;
}

- (BOOL)hasInputOrigin
{
  return self->_hasInputOrigin;
}

- (void)setHasDeviceIsPlayingAudio:(BOOL)a3
{
  self->_hasDeviceIsPlayingAudio = a3;
}

- (BOOL)hasDeviceIsPlayingAudio
{
  return self->_hasDeviceIsPlayingAudio;
}

- (void)setHasContactMatchConfidence:(BOOL)a3
{
  self->_hasContactMatchConfidence = a3;
}

- (BOOL)hasContactMatchConfidence
{
  return self->_hasContactMatchConfidence;
}

- (void)setHasContactHasRequestedAddressDetail:(BOOL)a3
{
  self->_hasContactHasRequestedAddressDetail = a3;
}

- (BOOL)hasContactHasRequestedAddressDetail
{
  return self->_hasContactHasRequestedAddressDetail;
}

- (void)setHasConfiguredSiriLanguage:(BOOL)a3
{
  self->_hasConfiguredSiriLanguage = a3;
}

- (BOOL)hasConfiguredSiriLanguage
{
  return self->_hasConfiguredSiriLanguage;
}

- (void)setHasCanResolveContactByRelationship:(BOOL)a3
{
  self->_hasCanResolveContactByRelationship = a3;
}

- (BOOL)hasCanResolveContactByRelationship
{
  return self->_hasCanResolveContactByRelationship;
}

- (void)setHasAsrRank:(BOOL)a3
{
  self->_hasAsrRank = a3;
}

- (BOOL)hasAsrRank
{
  return self->_hasAsrRank;
}

- (void)setHasApplicationsInForeground:(BOOL)a3
{
  self->_hasApplicationsInForeground = a3;
}

- (BOOL)hasApplicationsInForeground
{
  return self->_hasApplicationsInForeground;
}

- (unint64_t)whichFeature
{
  return self->_whichFeature;
}

- (GRRSchemaGRRFeature)initWithDictionary:(id)a3
{
  id v4 = a3;
  v95.receiver = self;
  v95.super_class = (Class)GRRSchemaGRRFeature;
  v5 = [(GRRSchemaGRRFeature *)&v95 init];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"applicationsInForeground"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[GRRSchemaGRRStringList alloc] initWithDictionary:v6];
      [(GRRSchemaGRRFeature *)v5 setApplicationsInForeground:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"asrRank"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setAsrRank:](v5, "setAsrRank:", [v8 unsignedIntValue]);
    }
    v67 = (void *)v6;
    v9 = [v4 objectForKeyedSubscript:@"canResolveContactByRelationship"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setCanResolveContactByRelationship:](v5, "setCanResolveContactByRelationship:", [v9 BOOLValue]);
    }
    v65 = v9;
    v10 = [v4 objectForKeyedSubscript:@"configuredSiriLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(GRRSchemaGRRFeature *)v5 setConfiguredSiriLanguage:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"contactHasRequestedAddressDetail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setContactHasRequestedAddressDetail:](v5, "setContactHasRequestedAddressDetail:", [v12 BOOLValue]);
    }
    objc_super v13 = [v4 objectForKeyedSubscript:@"contactMatchConfidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      -[GRRSchemaGRRFeature setContactMatchConfidence:](v5, "setContactMatchConfidence:");
    }
    v14 = [v4 objectForKeyedSubscript:@"deviceIsPlayingAudio"];
    objc_opt_class();
    v94 = v14;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setDeviceIsPlayingAudio:](v5, "setDeviceIsPlayingAudio:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"inputOrigin"];
    objc_opt_class();
    v93 = v15;
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(GRRSchemaGRRFeature *)v5 setInputOrigin:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"isActiveAlarmPresent"];
    objc_opt_class();
    v92 = v17;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsActiveAlarmPresent:](v5, "setIsActiveAlarmPresent:", [v17 BOOLValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"isActiveAppointmentPresent"];
    objc_opt_class();
    v91 = v18;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsActiveAppointmentPresent:](v5, "setIsActiveAppointmentPresent:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"isAnnounceEnabled"];
    objc_opt_class();
    v90 = v19;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsAnnounceEnabled:](v5, "setIsAnnounceEnabled:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"isAudioPlaying"];
    objc_opt_class();
    v89 = v20;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsAudioPlaying:](v5, "setIsAudioPlaying:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"isAppInstalled"];
    objc_opt_class();
    v88 = v21;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsAppInstalled:](v5, "setIsAppInstalled:", [v21 BOOLValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"isAppMatchPresent"];
    objc_opt_class();
    v87 = v22;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsAppMatchPresent:](v5, "setIsAppMatchPresent:", [v22 BOOLValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"isAppRunning"];
    objc_opt_class();
    v86 = v23;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsAppRunning:](v5, "setIsAppRunning:", [v23 BOOLValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"isArtistPresent"];
    objc_opt_class();
    v85 = v24;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsArtistPresent:](v5, "setIsArtistPresent:", [v24 BOOLValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"isContactNameResolved"];
    objc_opt_class();
    v84 = v25;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsContactNameResolved:](v5, "setIsContactNameResolved:", [v25 BOOLValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"isEmailAvailable"];
    objc_opt_class();
    v83 = v26;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsEmailAvailable:](v5, "setIsEmailAvailable:", [v26 BOOLValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"isFollowUp"];
    objc_opt_class();
    v82 = v27;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsFollowUp:](v5, "setIsFollowUp:", [v27 BOOLValue]);
    }
    v28 = [v4 objectForKeyedSubscript:@"isMediaItemEntityPresent"];
    objc_opt_class();
    v81 = v28;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsMediaItemEntityPresent:](v5, "setIsMediaItemEntityPresent:", [v28 BOOLValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"isMessagingPossible"];
    objc_opt_class();
    v80 = v29;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsMessagingPossible:](v5, "setIsMessagingPossible:", [v29 BOOLValue]);
    }
    v30 = [v4 objectForKeyedSubscript:@"isMessagingPossibleForSendMessageIntent"];
    objc_opt_class();
    v79 = v30;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsMessagingPossibleForSendMessageIntent:](v5, "setIsMessagingPossibleForSendMessageIntent:", [v30 BOOLValue]);
    }
    v31 = [v4 objectForKeyedSubscript:@"isPhoneCallPossible"];
    objc_opt_class();
    v78 = v31;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsPhoneCallPossible:](v5, "setIsPhoneCallPossible:", [v31 BOOLValue]);
    }
    v32 = [v4 objectForKeyedSubscript:@"isPhoneCallPossibleForPhoneCallIntent"];
    objc_opt_class();
    v77 = v32;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsPhoneCallPossibleForPhoneCallIntent:](v5, "setIsPhoneCallPossibleForPhoneCallIntent:", [v32 BOOLValue]);
    }
    v33 = [v4 objectForKeyedSubscript:@"isPhoneNumberAvailable"];
    objc_opt_class();
    v76 = v33;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsPhoneNumberAvailable:](v5, "setIsPhoneNumberAvailable:", [v33 BOOLValue]);
    }
    v34 = [v4 objectForKeyedSubscript:@"isPhoneNumberContactResolvable"];
    objc_opt_class();
    v75 = v34;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsPhoneNumberContactResolvable:](v5, "setIsPhoneNumberContactResolvable:", [v34 BOOLValue]);
    }
    v35 = [v4 objectForKeyedSubscript:@"isPreviousTurnSendEmptyMessage"];
    objc_opt_class();
    v74 = v35;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsPreviousTurnSendEmptyMessage:](v5, "setIsPreviousTurnSendEmptyMessage:", [v35 BOOLValue]);
    }
    v36 = [v4 objectForKeyedSubscript:@"isSettingOn"];
    objc_opt_class();
    v73 = v36;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsSettingOn:](v5, "setIsSettingOn:", [v36 BOOLValue]);
    }
    v37 = [v4 objectForKeyedSubscript:@"isTimerActive"];
    objc_opt_class();
    v72 = v37;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsTimerActive:](v5, "setIsTimerActive:", [v37 BOOLValue]);
    }
    v38 = [v4 objectForKeyedSubscript:@"isVideoPlaying"];
    objc_opt_class();
    v71 = v38;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setIsVideoPlaying:](v5, "setIsVideoPlaying:", [v38 BOOLValue]);
    }
    v39 = [v4 objectForKeyedSubscript:@"numberOfContactsResolved"];
    objc_opt_class();
    v70 = v39;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setNumberOfContactsResolved:](v5, "setNumberOfContactsResolved:", [v39 unsignedIntValue]);
    }
    v40 = [v4 objectForKeyedSubscript:@"previousFlowDomain"];
    objc_opt_class();
    v69 = v40;
    if (objc_opt_isKindOfClass())
    {
      v41 = (void *)[v40 copy];
      [(GRRSchemaGRRFeature *)v5 setPreviousFlowDomain:v41];
    }
    v42 = [v4 objectForKeyedSubscript:@"requestTimeBeginMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setRequestTimeBeginMs:](v5, "setRequestTimeBeginMs:", [v42 unsignedLongLongValue]);
    }
    v43 = [v4 objectForKeyedSubscript:@"sharingAppActive"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setSharingAppActive:](v5, "setSharingAppActive:", [v43 BOOLValue]);
    }
    v44 = [v4 objectForKeyedSubscript:@"sharingEntityPresent"];
    objc_opt_class();
    v68 = v44;
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setSharingEntityPresent:](v5, "setSharingEntityPresent:", [v44 BOOLValue]);
    }
    v66 = v8;
    v45 = [v4 objectForKeyedSubscript:@"sharingRecipientPresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setSharingRecipientPresent:](v5, "setSharingRecipientPresent:", [v45 BOOLValue]);
    }
    v64 = v10;
    v46 = [v4 objectForKeyedSubscript:@"smsAttachmentExists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setSmsAttachmentExists:](v5, "setSmsAttachmentExists:", [v46 BOOLValue]);
    }
    v63 = v12;
    v47 = [v4 objectForKeyedSubscript:@"smsAttributeRecipientExists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setSmsAttributeRecipientExists:](v5, "setSmsAttributeRecipientExists:", [v47 BOOLValue]);
    }
    v62 = v13;
    v48 = [v4 objectForKeyedSubscript:@"smsAttributeSenderExists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setSmsAttributeSenderExists:](v5, "setSmsAttributeSenderExists:", [v48 BOOLValue]);
    }
    v61 = v42;
    v49 = [v4 objectForKeyedSubscript:@"smsPhoneNumberMentioned"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setSmsPhoneNumberMentioned:](v5, "setSmsPhoneNumberMentioned:", [v49 BOOLValue]);
    }
    v60 = v43;
    v50 = [v4 objectForKeyedSubscript:@"smsTextPayloadExists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setSmsTextPayloadExists:](v5, "setSmsTextPayloadExists:", [v50 BOOLValue]);
    }
    v51 = [v4 objectForKeyedSubscript:@"timeSinceLastValidRequestMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRFeature setTimeSinceLastValidRequestMs:](v5, "setTimeSinceLastValidRequestMs:", [v51 unsignedLongLongValue]);
    }
    v52 = [v4 objectForKeyedSubscript:@"topTopics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v59 = v48;
      v53 = v47;
      v54 = v46;
      v55 = v45;
      v56 = [[GRRSchemaGRRStringList alloc] initWithDictionary:v52];
      [(GRRSchemaGRRFeature *)v5 setTopTopics:v56];

      v45 = v55;
      v46 = v54;
      v47 = v53;
      v48 = v59;
    }
    v57 = v5;
  }
  return v5;
}

- (GRRSchemaGRRFeature)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GRRSchemaGRRFeature *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GRRSchemaGRRFeature *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_applicationsInForeground)
  {
    id v4 = [(GRRSchemaGRRFeature *)self applicationsInForeground];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"applicationsInForeground"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"applicationsInForeground"];
    }
  }
  unint64_t whichFeature = self->_whichFeature;
  if (whichFeature == 2)
  {
    int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GRRSchemaGRRFeature asrRank](self, "asrRank"));
    [v3 setObject:v8 forKeyedSubscript:@"asrRank"];

    unint64_t whichFeature = self->_whichFeature;
  }
  if (whichFeature == 3)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature canResolveContactByRelationship](self, "canResolveContactByRelationship"));
    [v3 setObject:v9 forKeyedSubscript:@"canResolveContactByRelationship"];
  }
  if (self->_configuredSiriLanguage)
  {
    v10 = [(GRRSchemaGRRFeature *)self configuredSiriLanguage];
    int v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"configuredSiriLanguage"];
  }
  unint64_t v12 = self->_whichFeature;
  if (v12 == 5)
  {
    objc_super v13 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature contactHasRequestedAddressDetail](self, "contactHasRequestedAddressDetail"));
    [v3 setObject:v13 forKeyedSubscript:@"contactHasRequestedAddressDetail"];

    unint64_t v12 = self->_whichFeature;
  }
  if (v12 == 6)
  {
    v14 = NSNumber;
    [(GRRSchemaGRRFeature *)self contactMatchConfidence];
    v15 = objc_msgSend(v14, "numberWithDouble:");
    [v3 setObject:v15 forKeyedSubscript:@"contactMatchConfidence"];

    unint64_t v12 = self->_whichFeature;
  }
  if (v12 == 7)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature deviceIsPlayingAudio](self, "deviceIsPlayingAudio"));
    [v3 setObject:v16 forKeyedSubscript:@"deviceIsPlayingAudio"];
  }
  if (self->_inputOrigin)
  {
    v17 = [(GRRSchemaGRRFeature *)self inputOrigin];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"inputOrigin"];
  }
  unint64_t v19 = self->_whichFeature;
  if (v19 == 9)
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isActiveAlarmPresent](self, "isActiveAlarmPresent"));
    [v3 setObject:v20 forKeyedSubscript:@"isActiveAlarmPresent"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 10)
  {
    v21 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isActiveAppointmentPresent](self, "isActiveAppointmentPresent"));
    [v3 setObject:v21 forKeyedSubscript:@"isActiveAppointmentPresent"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 11)
  {
    v22 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isAnnounceEnabled](self, "isAnnounceEnabled"));
    [v3 setObject:v22 forKeyedSubscript:@"isAnnounceEnabled"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 13)
  {
    v23 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isAppInstalled](self, "isAppInstalled"));
    [v3 setObject:v23 forKeyedSubscript:@"isAppInstalled"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 14)
  {
    v24 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isAppMatchPresent](self, "isAppMatchPresent"));
    [v3 setObject:v24 forKeyedSubscript:@"isAppMatchPresent"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 15)
  {
    v25 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isAppRunning](self, "isAppRunning"));
    [v3 setObject:v25 forKeyedSubscript:@"isAppRunning"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 16)
  {
    v26 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isArtistPresent](self, "isArtistPresent"));
    [v3 setObject:v26 forKeyedSubscript:@"isArtistPresent"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 12)
  {
    v27 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isAudioPlaying](self, "isAudioPlaying"));
    [v3 setObject:v27 forKeyedSubscript:@"isAudioPlaying"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 17)
  {
    v28 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isContactNameResolved](self, "isContactNameResolved"));
    [v3 setObject:v28 forKeyedSubscript:@"isContactNameResolved"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 18)
  {
    v29 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isEmailAvailable](self, "isEmailAvailable"));
    [v3 setObject:v29 forKeyedSubscript:@"isEmailAvailable"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 19)
  {
    v30 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isFollowUp](self, "isFollowUp"));
    [v3 setObject:v30 forKeyedSubscript:@"isFollowUp"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 20)
  {
    v31 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isMediaItemEntityPresent](self, "isMediaItemEntityPresent"));
    [v3 setObject:v31 forKeyedSubscript:@"isMediaItemEntityPresent"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 21)
  {
    v32 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isMessagingPossible](self, "isMessagingPossible"));
    [v3 setObject:v32 forKeyedSubscript:@"isMessagingPossible"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 22)
  {
    v33 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isMessagingPossibleForSendMessageIntent](self, "isMessagingPossibleForSendMessageIntent"));
    [v3 setObject:v33 forKeyedSubscript:@"isMessagingPossibleForSendMessageIntent"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 23)
  {
    v34 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isPhoneCallPossible](self, "isPhoneCallPossible"));
    [v3 setObject:v34 forKeyedSubscript:@"isPhoneCallPossible"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 24)
  {
    v35 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isPhoneCallPossibleForPhoneCallIntent](self, "isPhoneCallPossibleForPhoneCallIntent"));
    [v3 setObject:v35 forKeyedSubscript:@"isPhoneCallPossibleForPhoneCallIntent"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 25)
  {
    v36 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isPhoneNumberAvailable](self, "isPhoneNumberAvailable"));
    [v3 setObject:v36 forKeyedSubscript:@"isPhoneNumberAvailable"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 26)
  {
    v37 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isPhoneNumberContactResolvable](self, "isPhoneNumberContactResolvable"));
    [v3 setObject:v37 forKeyedSubscript:@"isPhoneNumberContactResolvable"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 27)
  {
    v38 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isPreviousTurnSendEmptyMessage](self, "isPreviousTurnSendEmptyMessage"));
    [v3 setObject:v38 forKeyedSubscript:@"isPreviousTurnSendEmptyMessage"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 28)
  {
    v39 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isSettingOn](self, "isSettingOn"));
    [v3 setObject:v39 forKeyedSubscript:@"isSettingOn"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 29)
  {
    v40 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isTimerActive](self, "isTimerActive"));
    [v3 setObject:v40 forKeyedSubscript:@"isTimerActive"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 30)
  {
    v41 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature isVideoPlaying](self, "isVideoPlaying"));
    [v3 setObject:v41 forKeyedSubscript:@"isVideoPlaying"];

    unint64_t v19 = self->_whichFeature;
  }
  if (v19 == 31)
  {
    v42 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GRRSchemaGRRFeature numberOfContactsResolved](self, "numberOfContactsResolved"));
    [v3 setObject:v42 forKeyedSubscript:@"numberOfContactsResolved"];
  }
  if (self->_previousFlowDomain)
  {
    v43 = [(GRRSchemaGRRFeature *)self previousFlowDomain];
    v44 = (void *)[v43 copy];
    [v3 setObject:v44 forKeyedSubscript:@"previousFlowDomain"];
  }
  unint64_t v45 = self->_whichFeature;
  if (v45 == 33)
  {
    v46 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[GRRSchemaGRRFeature requestTimeBeginMs](self, "requestTimeBeginMs"));
    [v3 setObject:v46 forKeyedSubscript:@"requestTimeBeginMs"];

    unint64_t v45 = self->_whichFeature;
  }
  if (v45 == 34)
  {
    v47 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature sharingAppActive](self, "sharingAppActive"));
    [v3 setObject:v47 forKeyedSubscript:@"sharingAppActive"];

    unint64_t v45 = self->_whichFeature;
  }
  if (v45 == 35)
  {
    v48 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature sharingEntityPresent](self, "sharingEntityPresent"));
    [v3 setObject:v48 forKeyedSubscript:@"sharingEntityPresent"];

    unint64_t v45 = self->_whichFeature;
  }
  if (v45 == 36)
  {
    v49 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature sharingRecipientPresent](self, "sharingRecipientPresent"));
    [v3 setObject:v49 forKeyedSubscript:@"sharingRecipientPresent"];

    unint64_t v45 = self->_whichFeature;
  }
  if (v45 == 37)
  {
    v50 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature smsAttachmentExists](self, "smsAttachmentExists"));
    [v3 setObject:v50 forKeyedSubscript:@"smsAttachmentExists"];

    unint64_t v45 = self->_whichFeature;
  }
  if (v45 == 38)
  {
    v51 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature smsAttributeRecipientExists](self, "smsAttributeRecipientExists"));
    [v3 setObject:v51 forKeyedSubscript:@"smsAttributeRecipientExists"];

    unint64_t v45 = self->_whichFeature;
  }
  if (v45 == 39)
  {
    v52 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature smsAttributeSenderExists](self, "smsAttributeSenderExists"));
    [v3 setObject:v52 forKeyedSubscript:@"smsAttributeSenderExists"];

    unint64_t v45 = self->_whichFeature;
  }
  if (v45 == 40)
  {
    v53 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature smsPhoneNumberMentioned](self, "smsPhoneNumberMentioned"));
    [v3 setObject:v53 forKeyedSubscript:@"smsPhoneNumberMentioned"];

    unint64_t v45 = self->_whichFeature;
  }
  if (v45 == 41)
  {
    v54 = objc_msgSend(NSNumber, "numberWithBool:", -[GRRSchemaGRRFeature smsTextPayloadExists](self, "smsTextPayloadExists"));
    [v3 setObject:v54 forKeyedSubscript:@"smsTextPayloadExists"];

    unint64_t v45 = self->_whichFeature;
  }
  if (v45 == 42)
  {
    v55 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[GRRSchemaGRRFeature timeSinceLastValidRequestMs](self, "timeSinceLastValidRequestMs"));
    [v3 setObject:v55 forKeyedSubscript:@"timeSinceLastValidRequestMs"];
  }
  if (self->_topTopics)
  {
    v56 = [(GRRSchemaGRRFeature *)self topTopics];
    v57 = [v56 dictionaryRepresentation];
    if (v57)
    {
      [v3 setObject:v57 forKeyedSubscript:@"topTopics"];
    }
    else
    {
      v58 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v58 forKeyedSubscript:@"topTopics"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v59 = v3;

  return v59;
}

- (unint64_t)hash
{
  unint64_t v31 = [(GRRSchemaGRRStringList *)self->_applicationsInForeground hash];
  unint64_t whichFeature = self->_whichFeature;
  if (whichFeature == 3)
  {
    uint64_t v4 = 0;
    uint64_t v30 = 2654435761 * self->_canResolveContactByRelationship;
  }
  else if (whichFeature == 2)
  {
    uint64_t v30 = 0;
    uint64_t v4 = 2654435761 * self->_asrRank;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v30 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_configuredSiriLanguage hash];
  unint64_t v6 = self->_whichFeature;
  NSUInteger v28 = v5;
  switch(v6)
  {
    case 7uLL:
      unint64_t v7 = 0;
      uint64_t v9 = 0;
      uint64_t v8 = 2654435761 * self->_deviceIsPlayingAudio;
      goto LABEL_19;
    case 6uLL:
      double contactMatchConfidence = self->_contactMatchConfidence;
      double v11 = -contactMatchConfidence;
      if (contactMatchConfidence >= 0.0) {
        double v11 = self->_contactMatchConfidence;
      }
      long double v12 = floor(v11 + 0.5);
      double v13 = (v11 - v12) * 1.84467441e19;
      unint64_t v7 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
      if (v13 < 0.0)
      {
        uint64_t v9 = 0;
        uint64_t v8 = 0;
        v7 -= (unint64_t)fabs(v13);
        goto LABEL_19;
      }
      if (v13 > 0.0)
      {
        uint64_t v9 = 0;
        uint64_t v8 = 0;
        v7 += (unint64_t)v13;
        goto LABEL_19;
      }
      break;
    case 5uLL:
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 2654435761 * self->_contactHasRequestedAddressDetail;
      goto LABEL_19;
    default:
      unint64_t v7 = 0;
      break;
  }
  uint64_t v9 = 0;
  uint64_t v8 = 0;
LABEL_19:
  NSUInteger v14 = [(NSString *)self->_inputOrigin hash];
  unint64_t v15 = self->_whichFeature;
  switch(v15)
  {
    case 9uLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v48 = 2654435761 * self->_isActiveAlarmPresent;
      uint64_t v49 = 0;
      break;
    case 0xAuLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v49 = 2654435761 * self->_isActiveAppointmentPresent;
      break;
    case 0xBuLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v47 = 2654435761 * self->_isAnnounceEnabled;
      break;
    case 0xCuLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v50 = 2654435761 * self->_isAudioPlaying;
      uint64_t v51 = 0;
      break;
    case 0xDuLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v46 = 2654435761 * self->_isAppInstalled;
      uint64_t v47 = 0;
      break;
    case 0xEuLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v51 = 2654435761 * self->_isAppMatchPresent;
      break;
    case 0xFuLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v45 = 2654435761 * self->_isAppRunning;
      break;
    case 0x10uLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v52 = 2654435761 * self->_isArtistPresent;
      break;
    case 0x11uLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v44 = 2654435761 * self->_isContactNameResolved;
      uint64_t v45 = 0;
      break;
    case 0x12uLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v53 = 2654435761 * self->_isEmailAvailable;
      break;
    case 0x13uLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v43 = 2654435761 * self->_isFollowUp;
      break;
    case 0x14uLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v54 = 2654435761 * self->_isMediaItemEntityPresent;
      break;
    case 0x15uLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v42 = 2654435761 * self->_isMessagingPossible;
      uint64_t v43 = 0;
      break;
    case 0x16uLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      uint64_t v52 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v55 = 2654435761 * self->_isMessagingPossibleForSendMessageIntent;
      break;
    case 0x17uLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v41 = 2654435761 * self->_isPhoneCallPossible;
      break;
    case 0x18uLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v56 = 2654435761 * self->_isPhoneCallPossibleForPhoneCallIntent;
      break;
    case 0x19uLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v40 = 2654435761 * self->_isPhoneNumberAvailable;
      uint64_t v41 = 0;
      break;
    case 0x1AuLL:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v55 = 0;
      uint64_t v56 = 0;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      uint64_t v52 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v37 = 0;
      uint64_t v57 = 2654435761 * self->_isPhoneNumberContactResolvable;
      break;
    default:
      switch(v15)
      {
        case 0x1BuLL:
          uint64_t v16 = 0;
          uint64_t v17 = 0;
          uint64_t v56 = 0;
          uint64_t v57 = 0;
          uint64_t v54 = 0;
          uint64_t v55 = 0;
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          uint64_t v50 = 0;
          uint64_t v51 = 0;
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          uint64_t v46 = 0;
          uint64_t v47 = 0;
          uint64_t v44 = 0;
          uint64_t v45 = 0;
          uint64_t v42 = 0;
          uint64_t v43 = 0;
          uint64_t v40 = 0;
          uint64_t v41 = 0;
          uint64_t v37 = 0;
          uint64_t v38 = 0;
          uint64_t v39 = 2654435761 * self->_isPreviousTurnSendEmptyMessage;
          break;
        case 0x1CuLL:
          uint64_t v16 = 0;
          uint64_t v56 = 0;
          uint64_t v57 = 0;
          uint64_t v54 = 0;
          uint64_t v55 = 0;
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          uint64_t v50 = 0;
          uint64_t v51 = 0;
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          uint64_t v46 = 0;
          uint64_t v47 = 0;
          uint64_t v44 = 0;
          uint64_t v45 = 0;
          uint64_t v42 = 0;
          uint64_t v43 = 0;
          uint64_t v40 = 0;
          uint64_t v41 = 0;
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          uint64_t v37 = 0;
          uint64_t v17 = 2654435761 * self->_isSettingOn;
          break;
        case 0x1DuLL:
          uint64_t v16 = 0;
          uint64_t v17 = 0;
          uint64_t v56 = 0;
          uint64_t v57 = 0;
          uint64_t v54 = 0;
          uint64_t v55 = 0;
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          uint64_t v50 = 0;
          uint64_t v51 = 0;
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          uint64_t v46 = 0;
          uint64_t v47 = 0;
          uint64_t v44 = 0;
          uint64_t v45 = 0;
          uint64_t v42 = 0;
          uint64_t v43 = 0;
          uint64_t v40 = 0;
          uint64_t v41 = 0;
          uint64_t v37 = 0;
          uint64_t v38 = 2654435761 * self->_isTimerActive;
          uint64_t v39 = 0;
          break;
        case 0x1EuLL:
          uint64_t v17 = 0;
          uint64_t v56 = 0;
          uint64_t v57 = 0;
          uint64_t v54 = 0;
          uint64_t v55 = 0;
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          uint64_t v50 = 0;
          uint64_t v51 = 0;
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          uint64_t v46 = 0;
          uint64_t v47 = 0;
          uint64_t v44 = 0;
          uint64_t v45 = 0;
          uint64_t v42 = 0;
          uint64_t v43 = 0;
          uint64_t v40 = 0;
          uint64_t v41 = 0;
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          uint64_t v37 = 0;
          uint64_t v16 = 2654435761 * self->_isVideoPlaying;
          break;
        case 0x1FuLL:
          uint64_t v16 = 0;
          uint64_t v17 = 0;
          uint64_t v56 = 0;
          uint64_t v57 = 0;
          uint64_t v54 = 0;
          uint64_t v55 = 0;
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          uint64_t v50 = 0;
          uint64_t v51 = 0;
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          uint64_t v46 = 0;
          uint64_t v47 = 0;
          uint64_t v44 = 0;
          uint64_t v45 = 0;
          uint64_t v42 = 0;
          uint64_t v43 = 0;
          uint64_t v40 = 0;
          uint64_t v41 = 0;
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          uint64_t v37 = 2654435761 * self->_numberOfContactsResolved;
          break;
        default:
          uint64_t v16 = 0;
          uint64_t v17 = 0;
          uint64_t v56 = 0;
          uint64_t v57 = 0;
          uint64_t v54 = 0;
          uint64_t v55 = 0;
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          uint64_t v50 = 0;
          uint64_t v51 = 0;
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          uint64_t v46 = 0;
          uint64_t v47 = 0;
          uint64_t v44 = 0;
          uint64_t v45 = 0;
          uint64_t v42 = 0;
          uint64_t v43 = 0;
          uint64_t v40 = 0;
          uint64_t v41 = 0;
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          uint64_t v37 = 0;
          break;
      }
      break;
  }
  NSUInteger v18 = [(NSString *)self->_previousFlowDomain hash];
  unint64_t v19 = self->_whichFeature;
  uint64_t v59 = v16;
  NSUInteger v60 = v14;
  uint64_t v58 = v17;
  uint64_t v20 = v8;
  unint64_t v21 = v7;
  switch(v19)
  {
    case '!':
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      unint64_t v32 = 2654435761u * self->_requestTimeBeginMs;
      break;
    case '""':
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      unint64_t v32 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      uint64_t v22 = 2654435761 * self->_sharingAppActive;
      break;
    case '#':
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      unint64_t v32 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      uint64_t v33 = 2654435761 * self->_sharingEntityPresent;
      uint64_t v34 = 0;
      break;
    case '$':
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      unint64_t v32 = 0;
      uint64_t v22 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      uint64_t v23 = 2654435761 * self->_sharingRecipientPresent;
      break;
    case '%':
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      unint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      uint64_t v34 = 2654435761 * self->_smsAttachmentExists;
      break;
    default:
      switch(v19)
      {
        case '&':
          uint64_t v20 = v8;
          unint64_t v21 = v7;
          uint64_t v35 = 0;
          uint64_t v36 = 0;
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          unint64_t v32 = 0;
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          uint64_t v25 = 0;
          unint64_t v26 = 0;
          uint64_t v24 = 2654435761 * self->_smsAttributeRecipientExists;
          break;
        case '\'':
          uint64_t v20 = v8;
          unint64_t v21 = v7;
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          unint64_t v32 = 0;
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          uint64_t v24 = 0;
          uint64_t v25 = 0;
          unint64_t v26 = 0;
          uint64_t v35 = 2654435761 * self->_smsAttributeSenderExists;
          uint64_t v36 = 0;
          break;
        case '(':
          uint64_t v20 = v8;
          unint64_t v21 = v7;
          uint64_t v35 = 0;
          uint64_t v36 = 0;
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          unint64_t v32 = 0;
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          uint64_t v24 = 0;
          unint64_t v26 = 0;
          uint64_t v25 = 2654435761 * self->_smsPhoneNumberMentioned;
          break;
        case ')':
          uint64_t v20 = v8;
          unint64_t v21 = v7;
          uint64_t v34 = 0;
          uint64_t v35 = 0;
          unint64_t v32 = 0;
          uint64_t v33 = 0;
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          uint64_t v24 = 0;
          uint64_t v25 = 0;
          unint64_t v26 = 0;
          uint64_t v36 = 2654435761 * self->_smsTextPayloadExists;
          break;
        case '*':
          uint64_t v20 = v8;
          unint64_t v21 = v7;
          uint64_t v35 = 0;
          uint64_t v36 = 0;
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          unint64_t v32 = 0;
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          uint64_t v24 = 0;
          uint64_t v25 = 0;
          unint64_t v26 = 2654435761u * self->_timeSinceLastValidRequestMs;
          break;
        default:
          uint64_t v20 = v8;
          unint64_t v21 = v7;
          uint64_t v35 = 0;
          uint64_t v36 = 0;
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          unint64_t v32 = 0;
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          uint64_t v24 = 0;
          uint64_t v25 = 0;
          unint64_t v26 = 0;
          break;
      }
      break;
  }
  return v4 ^ v31 ^ v30 ^ v29 ^ v60 ^ v59 ^ v21 ^ v9 ^ v20 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v18 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ [(GRRSchemaGRRStringList *)self->_topTopics hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_66;
  }
  unint64_t whichFeature = self->_whichFeature;
  if (whichFeature != [v4 whichFeature]) {
    goto LABEL_66;
  }
  unint64_t v6 = [(GRRSchemaGRRFeature *)self applicationsInForeground];
  unint64_t v7 = [v4 applicationsInForeground];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_65;
  }
  uint64_t v8 = [(GRRSchemaGRRFeature *)self applicationsInForeground];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    v10 = [(GRRSchemaGRRFeature *)self applicationsInForeground];
    double v11 = [v4 applicationsInForeground];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_66;
    }
  }
  else
  {
  }
  unsigned int asrRank = self->_asrRank;
  if (asrRank != [v4 asrRank]) {
    goto LABEL_66;
  }
  int canResolveContactByRelationship = self->_canResolveContactByRelationship;
  if (canResolveContactByRelationship != [v4 canResolveContactByRelationship]) {
    goto LABEL_66;
  }
  unint64_t v6 = [(GRRSchemaGRRFeature *)self configuredSiriLanguage];
  unint64_t v7 = [v4 configuredSiriLanguage];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_65;
  }
  uint64_t v15 = [(GRRSchemaGRRFeature *)self configuredSiriLanguage];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    uint64_t v17 = [(GRRSchemaGRRFeature *)self configuredSiriLanguage];
    NSUInteger v18 = [v4 configuredSiriLanguage];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_66;
    }
  }
  else
  {
  }
  int contactHasRequestedAddressDetail = self->_contactHasRequestedAddressDetail;
  if (contactHasRequestedAddressDetail != [v4 contactHasRequestedAddressDetail]) {
    goto LABEL_66;
  }
  double contactMatchConfidence = self->_contactMatchConfidence;
  [v4 contactMatchConfidence];
  if (contactMatchConfidence != v22) {
    goto LABEL_66;
  }
  int deviceIsPlayingAudio = self->_deviceIsPlayingAudio;
  if (deviceIsPlayingAudio != [v4 deviceIsPlayingAudio]) {
    goto LABEL_66;
  }
  unint64_t v6 = [(GRRSchemaGRRFeature *)self inputOrigin];
  unint64_t v7 = [v4 inputOrigin];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_65;
  }
  uint64_t v24 = [(GRRSchemaGRRFeature *)self inputOrigin];
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    unint64_t v26 = [(GRRSchemaGRRFeature *)self inputOrigin];
    v27 = [v4 inputOrigin];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_66;
    }
  }
  else
  {
  }
  int isActiveAlarmPresent = self->_isActiveAlarmPresent;
  if (isActiveAlarmPresent != [v4 isActiveAlarmPresent]) {
    goto LABEL_66;
  }
  int isActiveAppointmentPresent = self->_isActiveAppointmentPresent;
  if (isActiveAppointmentPresent != [v4 isActiveAppointmentPresent]) {
    goto LABEL_66;
  }
  int isAnnounceEnabled = self->_isAnnounceEnabled;
  if (isAnnounceEnabled != [v4 isAnnounceEnabled]) {
    goto LABEL_66;
  }
  int isAudioPlaying = self->_isAudioPlaying;
  if (isAudioPlaying != [v4 isAudioPlaying]) {
    goto LABEL_66;
  }
  int isAppInstalled = self->_isAppInstalled;
  if (isAppInstalled != [v4 isAppInstalled]) {
    goto LABEL_66;
  }
  int isAppMatchPresent = self->_isAppMatchPresent;
  if (isAppMatchPresent != [v4 isAppMatchPresent]) {
    goto LABEL_66;
  }
  int isAppRunning = self->_isAppRunning;
  if (isAppRunning != [v4 isAppRunning]) {
    goto LABEL_66;
  }
  int isArtistPresent = self->_isArtistPresent;
  if (isArtistPresent != [v4 isArtistPresent]) {
    goto LABEL_66;
  }
  int isContactNameResolved = self->_isContactNameResolved;
  if (isContactNameResolved != [v4 isContactNameResolved]) {
    goto LABEL_66;
  }
  int isEmailAvailable = self->_isEmailAvailable;
  if (isEmailAvailable != [v4 isEmailAvailable]) {
    goto LABEL_66;
  }
  int isFollowUp = self->_isFollowUp;
  if (isFollowUp != [v4 isFollowUp]) {
    goto LABEL_66;
  }
  int isMediaItemEntityPresent = self->_isMediaItemEntityPresent;
  if (isMediaItemEntityPresent != [v4 isMediaItemEntityPresent]) {
    goto LABEL_66;
  }
  int isMessagingPossible = self->_isMessagingPossible;
  if (isMessagingPossible != [v4 isMessagingPossible]) {
    goto LABEL_66;
  }
  int isMessagingPossibleForSendMessageIntent = self->_isMessagingPossibleForSendMessageIntent;
  if (isMessagingPossibleForSendMessageIntent != [v4 isMessagingPossibleForSendMessageIntent])goto LABEL_66; {
  int isPhoneCallPossible = self->_isPhoneCallPossible;
  }
  if (isPhoneCallPossible != [v4 isPhoneCallPossible]) {
    goto LABEL_66;
  }
  int isPhoneCallPossibleForPhoneCallIntent = self->_isPhoneCallPossibleForPhoneCallIntent;
  if (isPhoneCallPossibleForPhoneCallIntent != [v4 isPhoneCallPossibleForPhoneCallIntent]) {
    goto LABEL_66;
  }
  int isPhoneNumberAvailable = self->_isPhoneNumberAvailable;
  if (isPhoneNumberAvailable != [v4 isPhoneNumberAvailable]) {
    goto LABEL_66;
  }
  int isPhoneNumberContactResolvable = self->_isPhoneNumberContactResolvable;
  if (isPhoneNumberContactResolvable != [v4 isPhoneNumberContactResolvable]) {
    goto LABEL_66;
  }
  int isPreviousTurnSendEmptyMessage = self->_isPreviousTurnSendEmptyMessage;
  if (isPreviousTurnSendEmptyMessage != [v4 isPreviousTurnSendEmptyMessage]) {
    goto LABEL_66;
  }
  int isSettingOn = self->_isSettingOn;
  if (isSettingOn != [v4 isSettingOn]) {
    goto LABEL_66;
  }
  int isTimerActive = self->_isTimerActive;
  if (isTimerActive != [v4 isTimerActive]) {
    goto LABEL_66;
  }
  int isVideoPlaying = self->_isVideoPlaying;
  if (isVideoPlaying != [v4 isVideoPlaying]) {
    goto LABEL_66;
  }
  unsigned int numberOfContactsResolved = self->_numberOfContactsResolved;
  if (numberOfContactsResolved != [v4 numberOfContactsResolved]) {
    goto LABEL_66;
  }
  unint64_t v6 = [(GRRSchemaGRRFeature *)self previousFlowDomain];
  unint64_t v7 = [v4 previousFlowDomain];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_65;
  }
  uint64_t v52 = [(GRRSchemaGRRFeature *)self previousFlowDomain];
  if (v52)
  {
    uint64_t v53 = (void *)v52;
    uint64_t v54 = [(GRRSchemaGRRFeature *)self previousFlowDomain];
    uint64_t v55 = [v4 previousFlowDomain];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_66;
    }
  }
  else
  {
  }
  unint64_t requestTimeBeginMs = self->_requestTimeBeginMs;
  if (requestTimeBeginMs != [v4 requestTimeBeginMs]) {
    goto LABEL_66;
  }
  int sharingAppActive = self->_sharingAppActive;
  if (sharingAppActive != [v4 sharingAppActive]) {
    goto LABEL_66;
  }
  int sharingEntityPresent = self->_sharingEntityPresent;
  if (sharingEntityPresent != [v4 sharingEntityPresent]) {
    goto LABEL_66;
  }
  int sharingRecipientPresent = self->_sharingRecipientPresent;
  if (sharingRecipientPresent != [v4 sharingRecipientPresent]) {
    goto LABEL_66;
  }
  int smsAttachmentExists = self->_smsAttachmentExists;
  if (smsAttachmentExists != [v4 smsAttachmentExists]) {
    goto LABEL_66;
  }
  int smsAttributeRecipientExists = self->_smsAttributeRecipientExists;
  if (smsAttributeRecipientExists != [v4 smsAttributeRecipientExists]) {
    goto LABEL_66;
  }
  int smsAttributeSenderExists = self->_smsAttributeSenderExists;
  if (smsAttributeSenderExists != [v4 smsAttributeSenderExists]) {
    goto LABEL_66;
  }
  int smsPhoneNumberMentioned = self->_smsPhoneNumberMentioned;
  if (smsPhoneNumberMentioned != [v4 smsPhoneNumberMentioned]) {
    goto LABEL_66;
  }
  int smsTextPayloadExists = self->_smsTextPayloadExists;
  if (smsTextPayloadExists != [v4 smsTextPayloadExists]) {
    goto LABEL_66;
  }
  unint64_t timeSinceLastValidRequestMs = self->_timeSinceLastValidRequestMs;
  if (timeSinceLastValidRequestMs != [v4 timeSinceLastValidRequestMs]) {
    goto LABEL_66;
  }
  unint64_t v6 = [(GRRSchemaGRRFeature *)self topTopics];
  unint64_t v7 = [v4 topTopics];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v67 = [(GRRSchemaGRRFeature *)self topTopics];
    if (!v67)
    {

LABEL_69:
      BOOL v72 = 1;
      goto LABEL_67;
    }
    v68 = (void *)v67;
    v69 = [(GRRSchemaGRRFeature *)self topTopics];
    v70 = [v4 topTopics];
    char v71 = [v69 isEqual:v70];

    if (v71) {
      goto LABEL_69;
    }
  }
  else
  {
LABEL_65:
  }
LABEL_66:
  BOOL v72 = 0;
LABEL_67:

  return v72;
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  id v4 = [(GRRSchemaGRRFeature *)self applicationsInForeground];

  if (v4)
  {
    NSUInteger v5 = [(GRRSchemaGRRFeature *)self applicationsInForeground];
    PBDataWriterWriteSubmessage();
  }
  unint64_t whichFeature = self->_whichFeature;
  if (whichFeature == 2)
  {
    PBDataWriterWriteUint32Field();
    unint64_t whichFeature = self->_whichFeature;
  }
  if (whichFeature == 3) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v7 = [(GRRSchemaGRRFeature *)self configuredSiriLanguage];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  unint64_t v8 = self->_whichFeature;
  if (v8 == 5)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v8 = self->_whichFeature;
  }
  if (v8 == 6)
  {
    PBDataWriterWriteDoubleField();
    unint64_t v8 = self->_whichFeature;
  }
  if (v8 == 7) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v9 = [(GRRSchemaGRRFeature *)self inputOrigin];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  unint64_t v10 = self->_whichFeature;
  if (v10 == 9)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 10)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 11)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 12)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 13)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 14)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 15)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 16)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 17)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 18)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 19)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 20)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 21)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 22)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 23)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 24)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 25)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 26)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 27)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 28)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 29)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 30)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v10 = self->_whichFeature;
  }
  if (v10 == 31) {
    PBDataWriterWriteUint32Field();
  }
  double v11 = [(GRRSchemaGRRFeature *)self previousFlowDomain];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  unint64_t v12 = self->_whichFeature;
  if (v12 == 33)
  {
    PBDataWriterWriteUint64Field();
    unint64_t v12 = self->_whichFeature;
  }
  if (v12 == 34)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v12 = self->_whichFeature;
  }
  if (v12 == 35)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v12 = self->_whichFeature;
  }
  if (v12 == 36)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v12 = self->_whichFeature;
  }
  if (v12 == 37)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v12 = self->_whichFeature;
  }
  if (v12 == 38)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v12 = self->_whichFeature;
  }
  if (v12 == 39)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v12 = self->_whichFeature;
  }
  if (v12 == 40)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v12 = self->_whichFeature;
  }
  if (v12 == 41)
  {
    PBDataWriterWriteBOOLField();
    unint64_t v12 = self->_whichFeature;
  }
  if (v12 == 42) {
    PBDataWriterWriteUint64Field();
  }
  double v13 = [(GRRSchemaGRRFeature *)self topTopics];

  NSUInteger v14 = v16;
  if (v13)
  {
    uint64_t v15 = [(GRRSchemaGRRFeature *)self topTopics];
    PBDataWriterWriteSubmessage();

    NSUInteger v14 = v16;
  }
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRFeatureReadFrom(self, (uint64_t)a3);
}

- (void)deleteTopTopics
{
  if (self->_whichFeature == 43)
  {
    self->_unint64_t whichFeature = 0;
    self->_topTopics = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GRRSchemaGRRStringList)topTopics
{
  if (self->_whichFeature == 43) {
    v2 = self->_topTopics;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTopTopics:(id)a3
{
  id v4 = (GRRSchemaGRRStringList *)a3;
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  unint64_t v9 = 43;
  if (!v4) {
    unint64_t v9 = 0;
  }
  self->_unint64_t whichFeature = v9;
  topTopics = self->_topTopics;
  self->_topTopics = v4;
}

- (void)deleteTimeSinceLastValidRequestMs
{
  if (self->_whichFeature == 42)
  {
    self->_unint64_t whichFeature = 0;
    self->_unint64_t timeSinceLastValidRequestMs = 0;
  }
}

- (unint64_t)timeSinceLastValidRequestMs
{
  if (self->_whichFeature == 42) {
    return self->_timeSinceLastValidRequestMs;
  }
  else {
    return 0;
  }
}

- (void)setTimeSinceLastValidRequestMs:(unint64_t)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 42;
  self->_unint64_t timeSinceLastValidRequestMs = a3;
}

- (void)deleteSmsTextPayloadExists
{
  if (self->_whichFeature == 41)
  {
    self->_unint64_t whichFeature = 0;
    self->_int smsTextPayloadExists = 0;
  }
}

- (BOOL)smsTextPayloadExists
{
  return self->_whichFeature == 41 && self->_smsTextPayloadExists;
}

- (void)setSmsTextPayloadExists:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 41;
  self->_int smsTextPayloadExists = a3;
}

- (void)deleteSmsPhoneNumberMentioned
{
  if (self->_whichFeature == 40)
  {
    self->_unint64_t whichFeature = 0;
    self->_int smsPhoneNumberMentioned = 0;
  }
}

- (BOOL)smsPhoneNumberMentioned
{
  return self->_whichFeature == 40 && self->_smsPhoneNumberMentioned;
}

- (void)setSmsPhoneNumberMentioned:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 40;
  self->_int smsPhoneNumberMentioned = a3;
}

- (void)deleteSmsAttributeSenderExists
{
  if (self->_whichFeature == 39)
  {
    self->_unint64_t whichFeature = 0;
    self->_int smsAttributeSenderExists = 0;
  }
}

- (BOOL)smsAttributeSenderExists
{
  return self->_whichFeature == 39 && self->_smsAttributeSenderExists;
}

- (void)setSmsAttributeSenderExists:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 39;
  self->_int smsAttributeSenderExists = a3;
}

- (void)deleteSmsAttributeRecipientExists
{
  if (self->_whichFeature == 38)
  {
    self->_unint64_t whichFeature = 0;
    self->_int smsAttributeRecipientExists = 0;
  }
}

- (BOOL)smsAttributeRecipientExists
{
  return self->_whichFeature == 38 && self->_smsAttributeRecipientExists;
}

- (void)setSmsAttributeRecipientExists:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 38;
  self->_int smsAttributeRecipientExists = a3;
}

- (void)deleteSmsAttachmentExists
{
  if (self->_whichFeature == 37)
  {
    self->_unint64_t whichFeature = 0;
    self->_int smsAttachmentExists = 0;
  }
}

- (BOOL)smsAttachmentExists
{
  return self->_whichFeature == 37 && self->_smsAttachmentExists;
}

- (void)setSmsAttachmentExists:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 37;
  self->_int smsAttachmentExists = a3;
}

- (void)deleteSharingRecipientPresent
{
  if (self->_whichFeature == 36)
  {
    self->_unint64_t whichFeature = 0;
    self->_int sharingRecipientPresent = 0;
  }
}

- (BOOL)sharingRecipientPresent
{
  return self->_whichFeature == 36 && self->_sharingRecipientPresent;
}

- (void)setSharingRecipientPresent:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 36;
  self->_int sharingRecipientPresent = a3;
}

- (void)deleteSharingEntityPresent
{
  if (self->_whichFeature == 35)
  {
    self->_unint64_t whichFeature = 0;
    self->_int sharingEntityPresent = 0;
  }
}

- (BOOL)sharingEntityPresent
{
  return self->_whichFeature == 35 && self->_sharingEntityPresent;
}

- (void)setSharingEntityPresent:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 35;
  self->_int sharingEntityPresent = a3;
}

- (void)deleteSharingAppActive
{
  if (self->_whichFeature == 34)
  {
    self->_unint64_t whichFeature = 0;
    self->_int sharingAppActive = 0;
  }
}

- (BOOL)sharingAppActive
{
  return self->_whichFeature == 34 && self->_sharingAppActive;
}

- (void)setSharingAppActive:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 34;
  self->_int sharingAppActive = a3;
}

- (void)deleteRequestTimeBeginMs
{
  if (self->_whichFeature == 33)
  {
    self->_unint64_t whichFeature = 0;
    self->_unint64_t requestTimeBeginMs = 0;
  }
}

- (unint64_t)requestTimeBeginMs
{
  if (self->_whichFeature == 33) {
    return self->_requestTimeBeginMs;
  }
  else {
    return 0;
  }
}

- (void)setRequestTimeBeginMs:(unint64_t)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 33;
  self->_unint64_t requestTimeBeginMs = a3;
}

- (void)deletePreviousFlowDomain
{
  if (self->_whichFeature == 32)
  {
    self->_unint64_t whichFeature = 0;
    self->_previousFlowDomain = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)previousFlowDomain
{
  if (self->_whichFeature == 32) {
    v2 = self->_previousFlowDomain;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPreviousFlowDomain:(id)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;
  id v10 = a3;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 32 * (v10 != 0);
  unint64_t v8 = (NSString *)[v10 copy];
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = v8;
}

- (void)deleteNumberOfContactsResolved
{
  if (self->_whichFeature == 31)
  {
    self->_unint64_t whichFeature = 0;
    self->_unsigned int numberOfContactsResolved = 0;
  }
}

- (unsigned)numberOfContactsResolved
{
  if (self->_whichFeature == 31) {
    return self->_numberOfContactsResolved;
  }
  else {
    return 0;
  }
}

- (void)setNumberOfContactsResolved:(unsigned int)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 31;
  self->_unsigned int numberOfContactsResolved = a3;
}

- (void)deleteIsVideoPlaying
{
  if (self->_whichFeature == 30)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isVideoPlaying = 0;
  }
}

- (BOOL)isVideoPlaying
{
  return self->_whichFeature == 30 && self->_isVideoPlaying;
}

- (void)setIsVideoPlaying:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 30;
  self->_int isVideoPlaying = a3;
}

- (void)deleteIsTimerActive
{
  if (self->_whichFeature == 29)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isTimerActive = 0;
  }
}

- (BOOL)isTimerActive
{
  return self->_whichFeature == 29 && self->_isTimerActive;
}

- (void)setIsTimerActive:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 29;
  self->_int isTimerActive = a3;
}

- (void)deleteIsSettingOn
{
  if (self->_whichFeature == 28)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isSettingOn = 0;
  }
}

- (BOOL)isSettingOn
{
  return self->_whichFeature == 28 && self->_isSettingOn;
}

- (void)setIsSettingOn:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 28;
  self->_int isSettingOn = a3;
}

- (void)deleteIsPreviousTurnSendEmptyMessage
{
  if (self->_whichFeature == 27)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isPreviousTurnSendEmptyMessage = 0;
  }
}

- (BOOL)isPreviousTurnSendEmptyMessage
{
  return self->_whichFeature == 27 && self->_isPreviousTurnSendEmptyMessage;
}

- (void)setIsPreviousTurnSendEmptyMessage:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 27;
  self->_int isPreviousTurnSendEmptyMessage = a3;
}

- (void)deleteIsPhoneNumberContactResolvable
{
  if (self->_whichFeature == 26)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isPhoneNumberContactResolvable = 0;
  }
}

- (BOOL)isPhoneNumberContactResolvable
{
  return self->_whichFeature == 26 && self->_isPhoneNumberContactResolvable;
}

- (void)setIsPhoneNumberContactResolvable:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 26;
  self->_int isPhoneNumberContactResolvable = a3;
}

- (void)deleteIsPhoneNumberAvailable
{
  if (self->_whichFeature == 25)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isPhoneNumberAvailable = 0;
  }
}

- (BOOL)isPhoneNumberAvailable
{
  return self->_whichFeature == 25 && self->_isPhoneNumberAvailable;
}

- (void)setIsPhoneNumberAvailable:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 25;
  self->_int isPhoneNumberAvailable = a3;
}

- (void)deleteIsPhoneCallPossibleForPhoneCallIntent
{
  if (self->_whichFeature == 24)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  }
}

- (BOOL)isPhoneCallPossibleForPhoneCallIntent
{
  return self->_whichFeature == 24 && self->_isPhoneCallPossibleForPhoneCallIntent;
}

- (void)setIsPhoneCallPossibleForPhoneCallIntent:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 24;
  self->_int isPhoneCallPossibleForPhoneCallIntent = a3;
}

- (void)deleteIsPhoneCallPossible
{
  if (self->_whichFeature == 23)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isPhoneCallPossible = 0;
  }
}

- (BOOL)isPhoneCallPossible
{
  return self->_whichFeature == 23 && self->_isPhoneCallPossible;
}

- (void)setIsPhoneCallPossible:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 23;
  self->_int isPhoneCallPossible = a3;
}

- (void)deleteIsMessagingPossibleForSendMessageIntent
{
  if (self->_whichFeature == 22)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isMessagingPossibleForSendMessageIntent = 0;
  }
}

- (BOOL)isMessagingPossibleForSendMessageIntent
{
  return self->_whichFeature == 22 && self->_isMessagingPossibleForSendMessageIntent;
}

- (void)setIsMessagingPossibleForSendMessageIntent:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 22;
  self->_int isMessagingPossibleForSendMessageIntent = a3;
}

- (void)deleteIsMessagingPossible
{
  if (self->_whichFeature == 21)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isMessagingPossible = 0;
  }
}

- (BOOL)isMessagingPossible
{
  return self->_whichFeature == 21 && self->_isMessagingPossible;
}

- (void)setIsMessagingPossible:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 21;
  self->_int isMessagingPossible = a3;
}

- (void)deleteIsMediaItemEntityPresent
{
  if (self->_whichFeature == 20)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isMediaItemEntityPresent = 0;
  }
}

- (BOOL)isMediaItemEntityPresent
{
  return self->_whichFeature == 20 && self->_isMediaItemEntityPresent;
}

- (void)setIsMediaItemEntityPresent:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 20;
  self->_int isMediaItemEntityPresent = a3;
}

- (void)deleteIsFollowUp
{
  if (self->_whichFeature == 19)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isFollowUp = 0;
  }
}

- (BOOL)isFollowUp
{
  return self->_whichFeature == 19 && self->_isFollowUp;
}

- (void)setIsFollowUp:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 19;
  self->_int isFollowUp = a3;
}

- (void)deleteIsEmailAvailable
{
  if (self->_whichFeature == 18)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isEmailAvailable = 0;
  }
}

- (BOOL)isEmailAvailable
{
  return self->_whichFeature == 18 && self->_isEmailAvailable;
}

- (void)setIsEmailAvailable:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 18;
  self->_int isEmailAvailable = a3;
}

- (void)deleteIsContactNameResolved
{
  if (self->_whichFeature == 17)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isContactNameResolved = 0;
  }
}

- (BOOL)isContactNameResolved
{
  return self->_whichFeature == 17 && self->_isContactNameResolved;
}

- (void)setIsContactNameResolved:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 17;
  self->_int isContactNameResolved = a3;
}

- (void)deleteIsArtistPresent
{
  if (self->_whichFeature == 16)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isArtistPresent = 0;
  }
}

- (BOOL)isArtistPresent
{
  return self->_whichFeature == 16 && self->_isArtistPresent;
}

- (void)setIsArtistPresent:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 16;
  self->_int isArtistPresent = a3;
}

- (void)deleteIsAppRunning
{
  if (self->_whichFeature == 15)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isAppRunning = 0;
  }
}

- (BOOL)isAppRunning
{
  return self->_whichFeature == 15 && self->_isAppRunning;
}

- (void)setIsAppRunning:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 15;
  self->_int isAppRunning = a3;
}

- (void)deleteIsAppMatchPresent
{
  if (self->_whichFeature == 14)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isAppMatchPresent = 0;
  }
}

- (BOOL)isAppMatchPresent
{
  return self->_whichFeature == 14 && self->_isAppMatchPresent;
}

- (void)setIsAppMatchPresent:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 14;
  self->_int isAppMatchPresent = a3;
}

- (void)deleteIsAppInstalled
{
  if (self->_whichFeature == 13)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isAppInstalled = 0;
  }
}

- (BOOL)isAppInstalled
{
  return self->_whichFeature == 13 && self->_isAppInstalled;
}

- (void)setIsAppInstalled:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 13;
  self->_int isAppInstalled = a3;
}

- (void)deleteIsAudioPlaying
{
  if (self->_whichFeature == 12)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isAudioPlaying = 0;
  }
}

- (BOOL)isAudioPlaying
{
  return self->_whichFeature == 12 && self->_isAudioPlaying;
}

- (void)setIsAudioPlaying:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 12;
  self->_int isAudioPlaying = a3;
}

- (void)deleteIsAnnounceEnabled
{
  if (self->_whichFeature == 11)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isAnnounceEnabled = 0;
  }
}

- (BOOL)isAnnounceEnabled
{
  return self->_whichFeature == 11 && self->_isAnnounceEnabled;
}

- (void)setIsAnnounceEnabled:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 11;
  self->_int isAnnounceEnabled = a3;
}

- (void)deleteIsActiveAppointmentPresent
{
  if (self->_whichFeature == 10)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isActiveAppointmentPresent = 0;
  }
}

- (BOOL)isActiveAppointmentPresent
{
  return self->_whichFeature == 10 && self->_isActiveAppointmentPresent;
}

- (void)setIsActiveAppointmentPresent:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 10;
  self->_int isActiveAppointmentPresent = a3;
}

- (void)deleteIsActiveAlarmPresent
{
  if (self->_whichFeature == 9)
  {
    self->_unint64_t whichFeature = 0;
    self->_int isActiveAlarmPresent = 0;
  }
}

- (BOOL)isActiveAlarmPresent
{
  return self->_whichFeature == 9 && self->_isActiveAlarmPresent;
}

- (void)setIsActiveAlarmPresent:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 9;
  self->_int isActiveAlarmPresent = a3;
}

- (void)deleteInputOrigin
{
  if (self->_whichFeature == 8)
  {
    self->_unint64_t whichFeature = 0;
    self->_inputOrigin = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)inputOrigin
{
  if (self->_whichFeature == 8) {
    v2 = self->_inputOrigin;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setInputOrigin:(id)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;
  id v10 = a3;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 8 * (v10 != 0);
  unint64_t v8 = (NSString *)[v10 copy];
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = v8;
}

- (void)deleteDeviceIsPlayingAudio
{
  if (self->_whichFeature == 7)
  {
    self->_unint64_t whichFeature = 0;
    self->_int deviceIsPlayingAudio = 0;
  }
}

- (BOOL)deviceIsPlayingAudio
{
  return self->_whichFeature == 7 && self->_deviceIsPlayingAudio;
}

- (void)setDeviceIsPlayingAudio:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 7;
  self->_int deviceIsPlayingAudio = a3;
}

- (void)deleteContactMatchConfidence
{
  if (self->_whichFeature == 6)
  {
    self->_unint64_t whichFeature = 0;
    self->_double contactMatchConfidence = 0.0;
  }
}

- (double)contactMatchConfidence
{
  double result = 0.0;
  if (self->_whichFeature == 6) {
    return self->_contactMatchConfidence;
  }
  return result;
}

- (void)setContactMatchConfidence:(double)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 6;
  self->_double contactMatchConfidence = a3;
}

- (void)deleteContactHasRequestedAddressDetail
{
  if (self->_whichFeature == 5)
  {
    self->_unint64_t whichFeature = 0;
    self->_int contactHasRequestedAddressDetail = 0;
  }
}

- (BOOL)contactHasRequestedAddressDetail
{
  return self->_whichFeature == 5 && self->_contactHasRequestedAddressDetail;
}

- (void)setContactHasRequestedAddressDetail:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 5;
  self->_int contactHasRequestedAddressDetail = a3;
}

- (void)deleteConfiguredSiriLanguage
{
  if (self->_whichFeature == 4)
  {
    self->_unint64_t whichFeature = 0;
    self->_configuredSiriLanguage = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)configuredSiriLanguage
{
  if (self->_whichFeature == 4) {
    v2 = self->_configuredSiriLanguage;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setConfiguredSiriLanguage:(id)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;
  id v10 = a3;

  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 4 * (v10 != 0);
  unint64_t v8 = (NSString *)[v10 copy];
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = v8;
}

- (void)deleteCanResolveContactByRelationship
{
  if (self->_whichFeature == 3)
  {
    self->_unint64_t whichFeature = 0;
    self->_int canResolveContactByRelationship = 0;
  }
}

- (BOOL)canResolveContactByRelationship
{
  return self->_whichFeature == 3 && self->_canResolveContactByRelationship;
}

- (void)setCanResolveContactByRelationship:(BOOL)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_unsigned int asrRank = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 3;
  self->_int canResolveContactByRelationship = a3;
}

- (void)deleteAsrRank
{
  if (self->_whichFeature == 2)
  {
    self->_unint64_t whichFeature = 0;
    self->_unsigned int asrRank = 0;
  }
}

- (unsigned)asrRank
{
  if (self->_whichFeature == 2) {
    return self->_asrRank;
  }
  else {
    return 0;
  }
}

- (void)setAsrRank:(unsigned int)a3
{
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = 0;

  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = 2;
  self->_unsigned int asrRank = a3;
}

- (void)deleteApplicationsInForeground
{
  if (self->_whichFeature == 1)
  {
    self->_unint64_t whichFeature = 0;
    self->_applicationsInForeground = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GRRSchemaGRRStringList)applicationsInForeground
{
  if (self->_whichFeature == 1) {
    v2 = self->_applicationsInForeground;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setApplicationsInForeground:(id)a3
{
  id v4 = (GRRSchemaGRRStringList *)a3;
  self->_unsigned int asrRank = 0;
  self->_int canResolveContactByRelationship = 0;
  configuredSiriLanguage = self->_configuredSiriLanguage;
  self->_configuredSiriLanguage = 0;

  self->_int contactHasRequestedAddressDetail = 0;
  self->_double contactMatchConfidence = 0.0;
  self->_int deviceIsPlayingAudio = 0;
  inputOrigin = self->_inputOrigin;
  self->_inputOrigin = 0;

  self->_int isActiveAlarmPresent = 0;
  self->_int isActiveAppointmentPresent = 0;
  self->_int isAnnounceEnabled = 0;
  self->_int isAudioPlaying = 0;
  self->_int isAppInstalled = 0;
  self->_int isAppMatchPresent = 0;
  self->_int isAppRunning = 0;
  self->_int isArtistPresent = 0;
  self->_int isContactNameResolved = 0;
  self->_int isEmailAvailable = 0;
  self->_int isFollowUp = 0;
  self->_int isMediaItemEntityPresent = 0;
  self->_int isMessagingPossible = 0;
  self->_int isMessagingPossibleForSendMessageIntent = 0;
  self->_int isPhoneCallPossible = 0;
  self->_int isPhoneCallPossibleForPhoneCallIntent = 0;
  self->_int isPhoneNumberAvailable = 0;
  self->_int isPhoneNumberContactResolvable = 0;
  self->_int isPreviousTurnSendEmptyMessage = 0;
  self->_int isSettingOn = 0;
  self->_int isTimerActive = 0;
  self->_int isVideoPlaying = 0;
  self->_unsigned int numberOfContactsResolved = 0;
  previousFlowDomain = self->_previousFlowDomain;
  self->_previousFlowDomain = 0;

  self->_unint64_t requestTimeBeginMs = 0;
  self->_int sharingAppActive = 0;
  self->_int sharingEntityPresent = 0;
  self->_int sharingRecipientPresent = 0;
  self->_int smsAttachmentExists = 0;
  self->_int smsAttributeRecipientExists = 0;
  self->_int smsAttributeSenderExists = 0;
  self->_int smsPhoneNumberMentioned = 0;
  self->_int smsTextPayloadExists = 0;
  self->_unint64_t timeSinceLastValidRequestMs = 0;
  topTopics = self->_topTopics;
  self->_topTopics = 0;

  self->_unint64_t whichFeature = v4 != 0;
  applicationsInForeground = self->_applicationsInForeground;
  self->_applicationsInForeground = v4;
}

@end