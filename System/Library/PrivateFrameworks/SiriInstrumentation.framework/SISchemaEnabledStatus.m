@interface SISchemaEnabledStatus
- (BOOL)assistantEnabled;
- (BOOL)assistantOnLockscreen;
- (BOOL)dictationEnabled;
- (BOOL)hardwareButtonEnabled;
- (BOOL)hasAdaptiveVolumeUserPreferences;
- (BOOL)hasAnnounceEnabledStatus;
- (BOOL)hasAssistantEnabled;
- (BOOL)hasAssistantOnLockscreen;
- (BOOL)hasDataSharingOptInStatus;
- (BOOL)hasDictationEnabled;
- (BOOL)hasHardwareButtonEnabled;
- (BOOL)hasHasHomekitHome;
- (BOOL)hasHeySiriEnabled;
- (BOOL)hasHomekitHome;
- (BOOL)hasHsHangupEnablementState;
- (BOOL)hasIsAdaptiveVolumeEnabled;
- (BOOL)hasIsAlwaysListenForHeySiriEnabled;
- (BOOL)hasIsAlwaysShowSiriCaptionsEnabled;
- (BOOL)hasIsAlwaysShowSpeechEnabled;
- (BOOL)hasIsAutoPunctuationEnabled;
- (BOOL)hasIsHSHangupEnabled;
- (BOOL)hasIsMteUploadEnabled;
- (BOOL)hasIsPreciseLocationEnabled;
- (BOOL)hasIsRemoteDarwinHeySiriEnabled;
- (BOOL)hasIsServerUserDataSyncEnabled;
- (BOOL)hasIsShowAppsBehindSiriEnabled;
- (BOOL)hasIsShowAppsBehindSiriEnabledOnCarPlay;
- (BOOL)hasIsSiriCapableDigitalCarKeyAvailable;
- (BOOL)hasIsSiriInCallEnabled;
- (BOOL)hasIsVoiceOverEnabled;
- (BOOL)hasLocationAccessPermission;
- (BOOL)hasRaiseToSpeakEnabled;
- (BOOL)hasSendWithoutConfirmation;
- (BOOL)hasShortcutsAvailable;
- (BOOL)hasSiriInCallEnablementState;
- (BOOL)hasSiriPauseTimeState;
- (BOOL)hasSiriSpeechRate;
- (BOOL)hasSiriVoiceTriggerSettings;
- (BOOL)hasSpokenNotificationsEnabled;
- (BOOL)hasTypeToSiriEnabled;
- (BOOL)hasVoiceFeedback;
- (BOOL)heySiriEnabled;
- (BOOL)isAdaptiveVolumeEnabled;
- (BOOL)isAlwaysListenForHeySiriEnabled;
- (BOOL)isAlwaysShowSiriCaptionsEnabled;
- (BOOL)isAlwaysShowSpeechEnabled;
- (BOOL)isAutoPunctuationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHSHangupEnabled;
- (BOOL)isMteUploadEnabled;
- (BOOL)isPreciseLocationEnabled;
- (BOOL)isRemoteDarwinHeySiriEnabled;
- (BOOL)isServerUserDataSyncEnabled;
- (BOOL)isShowAppsBehindSiriEnabled;
- (BOOL)isShowAppsBehindSiriEnabledOnCarPlay;
- (BOOL)isSiriCapableDigitalCarKeyAvailable;
- (BOOL)isSiriInCallEnabled;
- (BOOL)isVoiceOverEnabled;
- (BOOL)raiseToSpeakEnabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)spokenNotificationsEnabled;
- (BOOL)typeToSiriEnabled;
- (NSArray)gradingOptInStateChanges;
- (NSData)jsonData;
- (SISchemaAdaptiveVolumeUserPreferences)adaptiveVolumeUserPreferences;
- (SISchemaAnnounceEnabledStatus)announceEnabledStatus;
- (SISchemaEnabledStatus)initWithDictionary:(id)a3;
- (SISchemaEnabledStatus)initWithJSON:(id)a3;
- (SISchemaSendWithoutConfirmation)sendWithoutConfirmation;
- (SISchemaSiriVoiceTriggerSettings)siriVoiceTriggerSettings;
- (double)siriSpeechRate;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)gradingOptInStateChangesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)dataSharingOptInStatus;
- (int)hsHangupEnablementState;
- (int)locationAccessPermission;
- (int)shortcutsAvailable;
- (int)siriInCallEnablementState;
- (int)siriPauseTimeState;
- (int)voiceFeedback;
- (unint64_t)gradingOptInStateChangesCount;
- (unint64_t)hash;
- (void)addGradingOptInStateChanges:(id)a3;
- (void)clearGradingOptInStateChanges;
- (void)deleteAdaptiveVolumeUserPreferences;
- (void)deleteAnnounceEnabledStatus;
- (void)deleteAssistantEnabled;
- (void)deleteAssistantOnLockscreen;
- (void)deleteDataSharingOptInStatus;
- (void)deleteDictationEnabled;
- (void)deleteHardwareButtonEnabled;
- (void)deleteHasHomekitHome;
- (void)deleteHeySiriEnabled;
- (void)deleteHsHangupEnablementState;
- (void)deleteIsAdaptiveVolumeEnabled;
- (void)deleteIsAlwaysListenForHeySiriEnabled;
- (void)deleteIsAlwaysShowSiriCaptionsEnabled;
- (void)deleteIsAlwaysShowSpeechEnabled;
- (void)deleteIsAutoPunctuationEnabled;
- (void)deleteIsHSHangupEnabled;
- (void)deleteIsMteUploadEnabled;
- (void)deleteIsPreciseLocationEnabled;
- (void)deleteIsRemoteDarwinHeySiriEnabled;
- (void)deleteIsServerUserDataSyncEnabled;
- (void)deleteIsShowAppsBehindSiriEnabled;
- (void)deleteIsShowAppsBehindSiriEnabledOnCarPlay;
- (void)deleteIsSiriCapableDigitalCarKeyAvailable;
- (void)deleteIsSiriInCallEnabled;
- (void)deleteIsVoiceOverEnabled;
- (void)deleteLocationAccessPermission;
- (void)deleteRaiseToSpeakEnabled;
- (void)deleteSendWithoutConfirmation;
- (void)deleteShortcutsAvailable;
- (void)deleteSiriInCallEnablementState;
- (void)deleteSiriPauseTimeState;
- (void)deleteSiriSpeechRate;
- (void)deleteSiriVoiceTriggerSettings;
- (void)deleteSpokenNotificationsEnabled;
- (void)deleteTypeToSiriEnabled;
- (void)deleteVoiceFeedback;
- (void)setAdaptiveVolumeUserPreferences:(id)a3;
- (void)setAnnounceEnabledStatus:(id)a3;
- (void)setAssistantEnabled:(BOOL)a3;
- (void)setAssistantOnLockscreen:(BOOL)a3;
- (void)setDataSharingOptInStatus:(int)a3;
- (void)setDictationEnabled:(BOOL)a3;
- (void)setGradingOptInStateChanges:(id)a3;
- (void)setHardwareButtonEnabled:(BOOL)a3;
- (void)setHasAdaptiveVolumeUserPreferences:(BOOL)a3;
- (void)setHasAnnounceEnabledStatus:(BOOL)a3;
- (void)setHasAssistantEnabled:(BOOL)a3;
- (void)setHasAssistantOnLockscreen:(BOOL)a3;
- (void)setHasDataSharingOptInStatus:(BOOL)a3;
- (void)setHasDictationEnabled:(BOOL)a3;
- (void)setHasHardwareButtonEnabled:(BOOL)a3;
- (void)setHasHasHomekitHome:(BOOL)a3;
- (void)setHasHeySiriEnabled:(BOOL)a3;
- (void)setHasHomekitHome:(BOOL)a3;
- (void)setHasHsHangupEnablementState:(BOOL)a3;
- (void)setHasIsAdaptiveVolumeEnabled:(BOOL)a3;
- (void)setHasIsAlwaysListenForHeySiriEnabled:(BOOL)a3;
- (void)setHasIsAlwaysShowSiriCaptionsEnabled:(BOOL)a3;
- (void)setHasIsAlwaysShowSpeechEnabled:(BOOL)a3;
- (void)setHasIsAutoPunctuationEnabled:(BOOL)a3;
- (void)setHasIsHSHangupEnabled:(BOOL)a3;
- (void)setHasIsMteUploadEnabled:(BOOL)a3;
- (void)setHasIsPreciseLocationEnabled:(BOOL)a3;
- (void)setHasIsRemoteDarwinHeySiriEnabled:(BOOL)a3;
- (void)setHasIsServerUserDataSyncEnabled:(BOOL)a3;
- (void)setHasIsShowAppsBehindSiriEnabled:(BOOL)a3;
- (void)setHasIsShowAppsBehindSiriEnabledOnCarPlay:(BOOL)a3;
- (void)setHasIsSiriCapableDigitalCarKeyAvailable:(BOOL)a3;
- (void)setHasIsSiriInCallEnabled:(BOOL)a3;
- (void)setHasIsVoiceOverEnabled:(BOOL)a3;
- (void)setHasLocationAccessPermission:(BOOL)a3;
- (void)setHasRaiseToSpeakEnabled:(BOOL)a3;
- (void)setHasSendWithoutConfirmation:(BOOL)a3;
- (void)setHasShortcutsAvailable:(BOOL)a3;
- (void)setHasSiriInCallEnablementState:(BOOL)a3;
- (void)setHasSiriPauseTimeState:(BOOL)a3;
- (void)setHasSiriSpeechRate:(BOOL)a3;
- (void)setHasSiriVoiceTriggerSettings:(BOOL)a3;
- (void)setHasSpokenNotificationsEnabled:(BOOL)a3;
- (void)setHasTypeToSiriEnabled:(BOOL)a3;
- (void)setHasVoiceFeedback:(BOOL)a3;
- (void)setHeySiriEnabled:(BOOL)a3;
- (void)setHsHangupEnablementState:(int)a3;
- (void)setIsAdaptiveVolumeEnabled:(BOOL)a3;
- (void)setIsAlwaysListenForHeySiriEnabled:(BOOL)a3;
- (void)setIsAlwaysShowSiriCaptionsEnabled:(BOOL)a3;
- (void)setIsAlwaysShowSpeechEnabled:(BOOL)a3;
- (void)setIsAutoPunctuationEnabled:(BOOL)a3;
- (void)setIsHSHangupEnabled:(BOOL)a3;
- (void)setIsMteUploadEnabled:(BOOL)a3;
- (void)setIsPreciseLocationEnabled:(BOOL)a3;
- (void)setIsRemoteDarwinHeySiriEnabled:(BOOL)a3;
- (void)setIsServerUserDataSyncEnabled:(BOOL)a3;
- (void)setIsShowAppsBehindSiriEnabled:(BOOL)a3;
- (void)setIsShowAppsBehindSiriEnabledOnCarPlay:(BOOL)a3;
- (void)setIsSiriCapableDigitalCarKeyAvailable:(BOOL)a3;
- (void)setIsSiriInCallEnabled:(BOOL)a3;
- (void)setIsVoiceOverEnabled:(BOOL)a3;
- (void)setLocationAccessPermission:(int)a3;
- (void)setRaiseToSpeakEnabled:(BOOL)a3;
- (void)setSendWithoutConfirmation:(id)a3;
- (void)setShortcutsAvailable:(int)a3;
- (void)setSiriInCallEnablementState:(int)a3;
- (void)setSiriPauseTimeState:(int)a3;
- (void)setSiriSpeechRate:(double)a3;
- (void)setSiriVoiceTriggerSettings:(id)a3;
- (void)setSpokenNotificationsEnabled:(BOOL)a3;
- (void)setTypeToSiriEnabled:(BOOL)a3;
- (void)setVoiceFeedback:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaEnabledStatus

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SISchemaEnabledStatus;
  v5 = [(SISchemaInstrumentationMessage *)&v21 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaEnabledStatus *)self announceEnabledStatus];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaEnabledStatus *)self deleteAnnounceEnabledStatus];
  }
  v9 = [(SISchemaEnabledStatus *)self adaptiveVolumeUserPreferences];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaEnabledStatus *)self deleteAdaptiveVolumeUserPreferences];
  }
  v12 = [(SISchemaEnabledStatus *)self gradingOptInStateChanges];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(SISchemaEnabledStatus *)self setGradingOptInStateChanges:v13];

  v14 = [(SISchemaEnabledStatus *)self sendWithoutConfirmation];
  v15 = [v14 applySensitiveConditionsPolicy:v4];
  int v16 = [v15 suppressMessage];

  if (v16) {
    [(SISchemaEnabledStatus *)self deleteSendWithoutConfirmation];
  }
  v17 = [(SISchemaEnabledStatus *)self siriVoiceTriggerSettings];
  v18 = [v17 applySensitiveConditionsPolicy:v4];
  int v19 = [v18 suppressMessage];

  if (v19) {
    [(SISchemaEnabledStatus *)self deleteSiriVoiceTriggerSettings];
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
  objc_storeStrong((id *)&self->_siriVoiceTriggerSettings, 0);
  objc_storeStrong((id *)&self->_sendWithoutConfirmation, 0);
  objc_storeStrong((id *)&self->_gradingOptInStateChanges, 0);
  objc_storeStrong((id *)&self->_adaptiveVolumeUserPreferences, 0);
  objc_storeStrong((id *)&self->_announceEnabledStatus, 0);
}

- (void)setHasSiriVoiceTriggerSettings:(BOOL)a3
{
  self->_hasSiriVoiceTriggerSettings = a3;
}

- (void)setHasSendWithoutConfirmation:(BOOL)a3
{
  self->_hasSendWithoutConfirmation = a3;
}

- (void)setHasAdaptiveVolumeUserPreferences:(BOOL)a3
{
  self->_hasAdaptiveVolumeUserPreferences = a3;
}

- (void)setHasAnnounceEnabledStatus:(BOOL)a3
{
  self->_hasAnnounceEnabledStatus = a3;
}

- (int)locationAccessPermission
{
  return self->_locationAccessPermission;
}

- (BOOL)isServerUserDataSyncEnabled
{
  return self->_isServerUserDataSyncEnabled;
}

- (BOOL)isMteUploadEnabled
{
  return self->_isMteUploadEnabled;
}

- (int)siriPauseTimeState
{
  return self->_siriPauseTimeState;
}

- (BOOL)isAlwaysListenForHeySiriEnabled
{
  return self->_isAlwaysListenForHeySiriEnabled;
}

- (BOOL)isSiriCapableDigitalCarKeyAvailable
{
  return self->_isSiriCapableDigitalCarKeyAvailable;
}

- (BOOL)isShowAppsBehindSiriEnabledOnCarPlay
{
  return self->_isShowAppsBehindSiriEnabledOnCarPlay;
}

- (void)setSiriVoiceTriggerSettings:(id)a3
{
}

- (SISchemaSiriVoiceTriggerSettings)siriVoiceTriggerSettings
{
  return self->_siriVoiceTriggerSettings;
}

- (BOOL)isVoiceOverEnabled
{
  return self->_isVoiceOverEnabled;
}

- (double)siriSpeechRate
{
  return self->_siriSpeechRate;
}

- (BOOL)isShowAppsBehindSiriEnabled
{
  return self->_isShowAppsBehindSiriEnabled;
}

- (BOOL)isAlwaysShowSpeechEnabled
{
  return self->_isAlwaysShowSpeechEnabled;
}

- (BOOL)isAlwaysShowSiriCaptionsEnabled
{
  return self->_isAlwaysShowSiriCaptionsEnabled;
}

- (int)siriInCallEnablementState
{
  return self->_siriInCallEnablementState;
}

- (int)hsHangupEnablementState
{
  return self->_hsHangupEnablementState;
}

- (BOOL)isSiriInCallEnabled
{
  return self->_isSiriInCallEnabled;
}

- (BOOL)isHSHangupEnabled
{
  return self->_isHSHangupEnabled;
}

- (void)setSendWithoutConfirmation:(id)a3
{
}

- (SISchemaSendWithoutConfirmation)sendWithoutConfirmation
{
  return self->_sendWithoutConfirmation;
}

- (BOOL)isAutoPunctuationEnabled
{
  return self->_isAutoPunctuationEnabled;
}

- (void)setGradingOptInStateChanges:(id)a3
{
}

- (NSArray)gradingOptInStateChanges
{
  return self->_gradingOptInStateChanges;
}

- (BOOL)isRemoteDarwinHeySiriEnabled
{
  return self->_isRemoteDarwinHeySiriEnabled;
}

- (void)setAdaptiveVolumeUserPreferences:(id)a3
{
}

- (SISchemaAdaptiveVolumeUserPreferences)adaptiveVolumeUserPreferences
{
  return self->_adaptiveVolumeUserPreferences;
}

- (BOOL)isAdaptiveVolumeEnabled
{
  return self->_isAdaptiveVolumeEnabled;
}

- (void)setAnnounceEnabledStatus:(id)a3
{
}

- (SISchemaAnnounceEnabledStatus)announceEnabledStatus
{
  return self->_announceEnabledStatus;
}

- (int)voiceFeedback
{
  return self->_voiceFeedback;
}

- (BOOL)isPreciseLocationEnabled
{
  return self->_isPreciseLocationEnabled;
}

- (BOOL)typeToSiriEnabled
{
  return self->_typeToSiriEnabled;
}

- (int)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (int)shortcutsAvailable
{
  return self->_shortcutsAvailable;
}

- (BOOL)hasHomekitHome
{
  return self->_hasHomekitHome;
}

- (BOOL)spokenNotificationsEnabled
{
  return self->_spokenNotificationsEnabled;
}

- (BOOL)raiseToSpeakEnabled
{
  return self->_raiseToSpeakEnabled;
}

- (BOOL)assistantOnLockscreen
{
  return self->_assistantOnLockscreen;
}

- (BOOL)heySiriEnabled
{
  return self->_heySiriEnabled;
}

- (BOOL)hardwareButtonEnabled
{
  return self->_hardwareButtonEnabled;
}

- (BOOL)dictationEnabled
{
  return self->_dictationEnabled;
}

- (BOOL)assistantEnabled
{
  return self->_assistantEnabled;
}

- (SISchemaEnabledStatus)initWithDictionary:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)SISchemaEnabledStatus;
  v5 = [(SISchemaEnabledStatus *)&v91 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"assistantEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setAssistantEnabled:](v5, "setAssistantEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"dictationEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setDictationEnabled:](v5, "setDictationEnabled:", [v7 BOOLValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"hardwareButtonEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setHardwareButtonEnabled:](v5, "setHardwareButtonEnabled:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"heySiriEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setHeySiriEnabled:](v5, "setHeySiriEnabled:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"assistantOnLockscreen"];
    objc_opt_class();
    v86 = v10;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setAssistantOnLockscreen:](v5, "setAssistantOnLockscreen:", [v10 BOOLValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"raiseToSpeakEnabled"];
    objc_opt_class();
    v85 = v11;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setRaiseToSpeakEnabled:](v5, "setRaiseToSpeakEnabled:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"spokenNotificationsEnabled"];
    objc_opt_class();
    v84 = v12;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setSpokenNotificationsEnabled:](v5, "setSpokenNotificationsEnabled:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"hasHomekitHome"];
    objc_opt_class();
    v83 = v13;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setHasHomekitHome:](v5, "setHasHomekitHome:", [v13 BOOLValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"shortcutsAvailable"];
    objc_opt_class();
    v82 = v14;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setShortcutsAvailable:](v5, "setShortcutsAvailable:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"dataSharingOptInStatus"];
    objc_opt_class();
    v81 = v15;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setDataSharingOptInStatus:](v5, "setDataSharingOptInStatus:", [v15 intValue]);
    }
    int v16 = [v4 objectForKeyedSubscript:@"typeToSiriEnabled"];
    objc_opt_class();
    v80 = v16;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setTypeToSiriEnabled:](v5, "setTypeToSiriEnabled:", [v16 BOOLValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"isPreciseLocationEnabled"];
    objc_opt_class();
    v79 = v17;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsPreciseLocationEnabled:](v5, "setIsPreciseLocationEnabled:", [v17 BOOLValue]);
    }
    v63 = v9;
    v64 = v8;
    v65 = v7;
    v66 = v6;
    v18 = [v4 objectForKeyedSubscript:@"voiceFeedback"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setVoiceFeedback:](v5, "setVoiceFeedback:", [v18 intValue]);
    }
    v62 = v18;
    uint64_t v19 = [v4 objectForKeyedSubscript:@"announceEnabledStatus"];
    objc_opt_class();
    v78 = (void *)v19;
    if (objc_opt_isKindOfClass())
    {
      v20 = [[SISchemaAnnounceEnabledStatus alloc] initWithDictionary:v19];
      [(SISchemaEnabledStatus *)v5 setAnnounceEnabledStatus:v20];
    }
    objc_super v21 = [v4 objectForKeyedSubscript:@"isAdaptiveVolumeEnabled"];
    objc_opt_class();
    v77 = v21;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsAdaptiveVolumeEnabled:](v5, "setIsAdaptiveVolumeEnabled:", [v21 BOOLValue]);
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"adaptiveVolumeUserPreferences"];
    objc_opt_class();
    v76 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      v23 = [[SISchemaAdaptiveVolumeUserPreferences alloc] initWithDictionary:v22];
      [(SISchemaEnabledStatus *)v5 setAdaptiveVolumeUserPreferences:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"isRemoteDarwinHeySiriEnabled"];
    objc_opt_class();
    v75 = v24;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsRemoteDarwinHeySiriEnabled:](v5, "setIsRemoteDarwinHeySiriEnabled:", [v24 BOOLValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"gradingOptInStateChanges"];
    objc_opt_class();
    v74 = v25;
    if (objc_opt_isKindOfClass())
    {
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v26 = v25;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v87 objects:v92 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v88;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v88 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v87 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v32 = [[SISchemaGradingOptInStateChange alloc] initWithDictionary:v31];
              [(SISchemaEnabledStatus *)v5 addGradingOptInStateChanges:v32];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v87 objects:v92 count:16];
        }
        while (v28);
      }
    }
    v33 = [v4 objectForKeyedSubscript:@"isAutoPunctuationEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsAutoPunctuationEnabled:](v5, "setIsAutoPunctuationEnabled:", [v33 BOOLValue]);
    }
    uint64_t v34 = [v4 objectForKeyedSubscript:@"sendWithoutConfirmation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = [[SISchemaSendWithoutConfirmation alloc] initWithDictionary:v34];
      [(SISchemaEnabledStatus *)v5 setSendWithoutConfirmation:v35];
    }
    v36 = [v4 objectForKeyedSubscript:@"isHSHangupEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsHSHangupEnabled:](v5, "setIsHSHangupEnabled:", [v36 BOOLValue]);
    }
    v37 = [v4 objectForKeyedSubscript:@"isSiriInCallEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsSiriInCallEnabled:](v5, "setIsSiriInCallEnabled:", [v37 BOOLValue]);
    }
    v38 = [v4 objectForKeyedSubscript:@"hsHangupEnablementState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setHsHangupEnablementState:](v5, "setHsHangupEnablementState:", [v38 intValue]);
    }
    v39 = [v4 objectForKeyedSubscript:@"siriInCallEnablementState"];
    objc_opt_class();
    v73 = v39;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setSiriInCallEnablementState:](v5, "setSiriInCallEnablementState:", [v39 intValue]);
    }
    v40 = [v4 objectForKeyedSubscript:@"isAlwaysShowSiriCaptionsEnabled"];
    objc_opt_class();
    v72 = v40;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsAlwaysShowSiriCaptionsEnabled:](v5, "setIsAlwaysShowSiriCaptionsEnabled:", [v40 BOOLValue]);
    }
    v41 = [v4 objectForKeyedSubscript:@"isAlwaysShowSpeechEnabled"];
    objc_opt_class();
    v71 = v41;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsAlwaysShowSpeechEnabled:](v5, "setIsAlwaysShowSpeechEnabled:", [v41 BOOLValue]);
    }
    v42 = [v4 objectForKeyedSubscript:@"isShowAppsBehindSiriEnabled"];
    objc_opt_class();
    v70 = v42;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsShowAppsBehindSiriEnabled:](v5, "setIsShowAppsBehindSiriEnabled:", [v42 BOOLValue]);
    }
    v43 = [v4 objectForKeyedSubscript:@"siriSpeechRate"];
    objc_opt_class();
    v69 = v43;
    if (objc_opt_isKindOfClass())
    {
      [v43 doubleValue];
      -[SISchemaEnabledStatus setSiriSpeechRate:](v5, "setSiriSpeechRate:");
    }
    v44 = [v4 objectForKeyedSubscript:@"isVoiceOverEnabled"];
    objc_opt_class();
    v68 = v44;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsVoiceOverEnabled:](v5, "setIsVoiceOverEnabled:", [v44 BOOLValue]);
    }
    uint64_t v45 = [v4 objectForKeyedSubscript:@"siriVoiceTriggerSettings"];
    objc_opt_class();
    v67 = (void *)v45;
    if (objc_opt_isKindOfClass())
    {
      v46 = [[SISchemaSiriVoiceTriggerSettings alloc] initWithDictionary:v45];
      [(SISchemaEnabledStatus *)v5 setSiriVoiceTriggerSettings:v46];
    }
    v58 = v38;
    v47 = [v4 objectForKeyedSubscript:@"isShowAppsBehindSiriEnabledOnCarPlay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsShowAppsBehindSiriEnabledOnCarPlay:](v5, "setIsShowAppsBehindSiriEnabledOnCarPlay:", [v47 BOOLValue]);
    }
    v48 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isSiriCapableDigitalCarKeyAvailable", v47);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsSiriCapableDigitalCarKeyAvailable:](v5, "setIsSiriCapableDigitalCarKeyAvailable:", [v48 BOOLValue]);
    }
    v61 = v33;
    v49 = [v4 objectForKeyedSubscript:@"isAlwaysListenForHeySiriEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsAlwaysListenForHeySiriEnabled:](v5, "setIsAlwaysListenForHeySiriEnabled:", [v49 BOOLValue]);
    }
    v60 = (void *)v34;
    v50 = [v4 objectForKeyedSubscript:@"siriPauseTimeState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setSiriPauseTimeState:](v5, "setSiriPauseTimeState:", [v50 intValue]);
    }
    v59 = v37;
    v51 = [v4 objectForKeyedSubscript:@"isMteUploadEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsMteUploadEnabled:](v5, "setIsMteUploadEnabled:", [v51 BOOLValue]);
    }
    v52 = v36;
    v53 = [v4 objectForKeyedSubscript:@"isServerUserDataSyncEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setIsServerUserDataSyncEnabled:](v5, "setIsServerUserDataSyncEnabled:", [v53 BOOLValue]);
    }
    v54 = [v4 objectForKeyedSubscript:@"locationAccessPermission"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaEnabledStatus setLocationAccessPermission:](v5, "setLocationAccessPermission:", [v54 intValue]);
    }
    v55 = v5;
  }
  return v5;
}

- (SISchemaEnabledStatus)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaEnabledStatus *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaEnabledStatus *)self dictionaryRepresentation];
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
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_adaptiveVolumeUserPreferences)
  {
    id v4 = [(SISchemaEnabledStatus *)self adaptiveVolumeUserPreferences];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"adaptiveVolumeUserPreferences"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"adaptiveVolumeUserPreferences"];
    }
  }
  if (self->_announceEnabledStatus)
  {
    uint64_t v7 = [(SISchemaEnabledStatus *)self announceEnabledStatus];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"announceEnabledStatus"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"announceEnabledStatus"];
    }
  }
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v24 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus assistantEnabled](self, "assistantEnabled"));
    [v3 setObject:v24 forKeyedSubscript:@"assistantEnabled"];

    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&has & 0x200) == 0) {
        goto LABEL_14;
      }
      goto LABEL_55;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_13;
  }
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus assistantOnLockscreen](self, "assistantOnLockscreen"));
  [v3 setObject:v25 forKeyedSubscript:@"assistantOnLockscreen"];

  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_55:
  unsigned int v26 = [(SISchemaEnabledStatus *)self dataSharingOptInStatus] - 1;
  if (v26 > 2) {
    uint64_t v27 = @"UNKNOWN";
  }
  else {
    uint64_t v27 = off_1E5EB6A88[v26];
  }
  [v3 setObject:v27 forKeyedSubscript:@"dataSharingOptInStatus"];
  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_15:
    int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus dictationEnabled](self, "dictationEnabled"));
    [v3 setObject:v11 forKeyedSubscript:@"dictationEnabled"];
  }
LABEL_16:
  if ([(NSArray *)self->_gradingOptInStateChanges count])
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v13 = self->_gradingOptInStateChanges;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v69 objects:v73 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v70 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v69 + 1) + 8 * i) dictionaryRepresentation];
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
            [v12 addObject:v19];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v69 objects:v73 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"gradingOptInStateChanges"];
  }
  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(unsigned char *)&v20 & 4) != 0)
  {
    uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus hardwareButtonEnabled](self, "hardwareButtonEnabled"));
    [v3 setObject:v28 forKeyedSubscript:@"hardwareButtonEnabled"];

    $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
    if ((*(unsigned char *)&v20 & 0x80) == 0)
    {
LABEL_30:
      if ((*(unsigned char *)&v20 & 8) == 0) {
        goto LABEL_31;
      }
      goto LABEL_59;
    }
  }
  else if ((*(unsigned char *)&v20 & 0x80) == 0)
  {
    goto LABEL_30;
  }
  uint64_t v29 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus hasHomekitHome](self, "hasHomekitHome"));
  [v3 setObject:v29 forKeyedSubscript:@"hasHomekitHome"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(unsigned char *)&v20 & 8) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v20 & 0x40000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_60;
  }
LABEL_59:
  v30 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus heySiriEnabled](self, "heySiriEnabled"));
  [v3 setObject:v30 forKeyedSubscript:@"heySiriEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v20 & 0x2000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_67;
  }
LABEL_60:
  unsigned int v31 = [(SISchemaEnabledStatus *)self hsHangupEnablementState] - 1;
  if (v31 > 2) {
    v32 = @"HSHANGUPENABLEMENTSTATE_UNKNOWN";
  }
  else {
    v32 = off_1E5EB6AA0[v31];
  }
  [v3 setObject:v32 forKeyedSubscript:@"hsHangupEnablementState"];
  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x2000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v20 & 0x8000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_68;
  }
LABEL_67:
  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isAdaptiveVolumeEnabled](self, "isAdaptiveVolumeEnabled"));
  [v3 setObject:v33 forKeyedSubscript:@"isAdaptiveVolumeEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x8000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v20 & 0x100000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isAlwaysListenForHeySiriEnabled](self, "isAlwaysListenForHeySiriEnabled"));
  [v3 setObject:v34 forKeyedSubscript:@"isAlwaysListenForHeySiriEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x100000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v20 & 0x200000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_70;
  }
LABEL_69:
  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isAlwaysShowSiriCaptionsEnabled](self, "isAlwaysShowSiriCaptionsEnabled"));
  [v3 setObject:v35 forKeyedSubscript:@"isAlwaysShowSiriCaptionsEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x200000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v20 & 0x8000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_71;
  }
LABEL_70:
  v36 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isAlwaysShowSpeechEnabled](self, "isAlwaysShowSpeechEnabled"));
  [v3 setObject:v36 forKeyedSubscript:@"isAlwaysShowSpeechEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x8000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v20 & 0x10000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_72;
  }
LABEL_71:
  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isAutoPunctuationEnabled](self, "isAutoPunctuationEnabled"));
  [v3 setObject:v37 forKeyedSubscript:@"isAutoPunctuationEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v20 & 0x20000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_73;
  }
LABEL_72:
  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isHSHangupEnabled](self, "isHSHangupEnabled"));
  [v3 setObject:v38 forKeyedSubscript:@"isHSHangupEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x20000000) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v20 & 0x800) == 0) {
      goto LABEL_40;
    }
    goto LABEL_74;
  }
LABEL_73:
  v39 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isMteUploadEnabled](self, "isMteUploadEnabled"));
  [v3 setObject:v39 forKeyedSubscript:@"isMteUploadEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v20 & 0x4000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_75;
  }
LABEL_74:
  v40 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isPreciseLocationEnabled](self, "isPreciseLocationEnabled"));
  [v3 setObject:v40 forKeyedSubscript:@"isPreciseLocationEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x4000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v20 & 0x40000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_76;
  }
LABEL_75:
  v41 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isRemoteDarwinHeySiriEnabled](self, "isRemoteDarwinHeySiriEnabled"));
  [v3 setObject:v41 forKeyedSubscript:@"isRemoteDarwinHeySiriEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v20 & 0x400000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_77;
  }
LABEL_76:
  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isServerUserDataSyncEnabled](self, "isServerUserDataSyncEnabled"));
  [v3 setObject:v42 forKeyedSubscript:@"isServerUserDataSyncEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x400000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v20 & 0x2000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_78;
  }
LABEL_77:
  v43 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isShowAppsBehindSiriEnabled](self, "isShowAppsBehindSiriEnabled"));
  [v3 setObject:v43 forKeyedSubscript:@"isShowAppsBehindSiriEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x2000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v20 & 0x4000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_79;
  }
LABEL_78:
  v44 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isShowAppsBehindSiriEnabledOnCarPlay](self, "isShowAppsBehindSiriEnabledOnCarPlay"));
  [v3 setObject:v44 forKeyedSubscript:@"isShowAppsBehindSiriEnabledOnCarPlay"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x4000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v20 & 0x20000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v45 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isSiriCapableDigitalCarKeyAvailable](self, "isSiriCapableDigitalCarKeyAvailable"));
  [v3 setObject:v45 forKeyedSubscript:@"isSiriCapableDigitalCarKeyAvailable"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x20000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v20 & 0x1000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_81;
  }
LABEL_80:
  v46 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isSiriInCallEnabled](self, "isSiriInCallEnabled"));
  [v3 setObject:v46 forKeyedSubscript:@"isSiriInCallEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x1000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v20 & 0x80000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_82;
  }
LABEL_81:
  v47 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus isVoiceOverEnabled](self, "isVoiceOverEnabled"));
  [v3 setObject:v47 forKeyedSubscript:@"isVoiceOverEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x80000000) == 0)
  {
LABEL_48:
    if ((*(unsigned char *)&v20 & 0x20) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_82:
  unsigned int v48 = [(SISchemaEnabledStatus *)self locationAccessPermission] - 1;
  if (v48 > 5) {
    v49 = @"LOCATIONACCESSPERMISSION_UNKNOWN";
  }
  else {
    v49 = off_1E5EB6AB8[v48];
  }
  [v3 setObject:v49 forKeyedSubscript:@"locationAccessPermission"];
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_49:
    objc_super v21 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus raiseToSpeakEnabled](self, "raiseToSpeakEnabled"));
    [v3 setObject:v21 forKeyedSubscript:@"raiseToSpeakEnabled"];
  }
LABEL_50:
  if (self->_sendWithoutConfirmation)
  {
    uint64_t v22 = [(SISchemaEnabledStatus *)self sendWithoutConfirmation];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"sendWithoutConfirmation"];
    }
    else
    {
      v50 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v50 forKeyedSubscript:@"sendWithoutConfirmation"];
    }
  }
  $5F8FA149478B3F06D8A5175B937FFFE0 v51 = self->_has;
  if ((*(_WORD *)&v51 & 0x100) != 0)
  {
    v56 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaEnabledStatus shortcutsAvailable](self, "shortcutsAvailable"));
    [v3 setObject:v56 forKeyedSubscript:@"shortcutsAvailable"];

    $5F8FA149478B3F06D8A5175B937FFFE0 v51 = self->_has;
    if ((*(_DWORD *)&v51 & 0x80000) == 0)
    {
LABEL_88:
      if ((*(_DWORD *)&v51 & 0x10000000) == 0) {
        goto LABEL_89;
      }
      goto LABEL_99;
    }
  }
  else if ((*(_DWORD *)&v51 & 0x80000) == 0)
  {
    goto LABEL_88;
  }
  unsigned int v57 = [(SISchemaEnabledStatus *)self siriInCallEnablementState] - 1;
  if (v57 > 2) {
    v58 = @"SIRIINCALLENABLEMENTSTATE_UNKNOWN";
  }
  else {
    v58 = off_1E5EB6AE8[v57];
  }
  [v3 setObject:v58 forKeyedSubscript:@"siriInCallEnablementState"];
  $5F8FA149478B3F06D8A5175B937FFFE0 v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x10000000) == 0)
  {
LABEL_89:
    if ((*(_DWORD *)&v51 & 0x800000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_90;
  }
LABEL_99:
  unsigned int v59 = [(SISchemaEnabledStatus *)self siriPauseTimeState] - 1;
  if (v59 > 2) {
    v60 = @"SIRIPAUSETIMESTATE_UNKNOWN";
  }
  else {
    v60 = off_1E5EB6B00[v59];
  }
  [v3 setObject:v60 forKeyedSubscript:@"siriPauseTimeState"];
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_90:
    v52 = NSNumber;
    [(SISchemaEnabledStatus *)self siriSpeechRate];
    v53 = objc_msgSend(v52, "numberWithDouble:");
    [v3 setObject:v53 forKeyedSubscript:@"siriSpeechRate"];
  }
LABEL_91:
  if (self->_siriVoiceTriggerSettings)
  {
    v54 = [(SISchemaEnabledStatus *)self siriVoiceTriggerSettings];
    v55 = [v54 dictionaryRepresentation];
    if (v55)
    {
      [v3 setObject:v55 forKeyedSubscript:@"siriVoiceTriggerSettings"];
    }
    else
    {
      v61 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v61 forKeyedSubscript:@"siriVoiceTriggerSettings"];
    }
  }
  $5F8FA149478B3F06D8A5175B937FFFE0 v62 = self->_has;
  if ((*(unsigned char *)&v62 & 0x40) == 0)
  {
    if ((*(_WORD *)&v62 & 0x400) == 0) {
      goto LABEL_108;
    }
LABEL_111:
    v64 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus typeToSiriEnabled](self, "typeToSiriEnabled"));
    [v3 setObject:v64 forKeyedSubscript:@"typeToSiriEnabled"];

    if ((*(_DWORD *)&self->_has & 0x1000) == 0) {
      goto LABEL_116;
    }
    goto LABEL_112;
  }
  v63 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaEnabledStatus spokenNotificationsEnabled](self, "spokenNotificationsEnabled"));
  [v3 setObject:v63 forKeyedSubscript:@"spokenNotificationsEnabled"];

  $5F8FA149478B3F06D8A5175B937FFFE0 v62 = self->_has;
  if ((*(_WORD *)&v62 & 0x400) != 0) {
    goto LABEL_111;
  }
LABEL_108:
  if ((*(_WORD *)&v62 & 0x1000) == 0) {
    goto LABEL_116;
  }
LABEL_112:
  unsigned int v65 = [(SISchemaEnabledStatus *)self voiceFeedback] - 1;
  if (v65 > 5) {
    v66 = @"VOICEFEEDBACK_UNKNOWN_VOICE_FEEDBACK";
  }
  else {
    v66 = off_1E5EB6B18[v65];
  }
  [v3 setObject:v66 forKeyedSubscript:@"voiceFeedback"];
LABEL_116:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v67 = v3;

  return v67;
}

- (unint64_t)hash
{
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if (*(unsigned char *)&has)
  {
    uint64_t v47 = 2654435761 * self->_assistantEnabled;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_3:
      uint64_t v46 = 2654435761 * self->_dictationEnabled;
      if ((*(unsigned char *)&has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v47 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v46 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_4:
    uint64_t v45 = 2654435761 * self->_hardwareButtonEnabled;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v45 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_5:
    uint64_t v44 = 2654435761 * self->_heySiriEnabled;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v44 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v43 = 2654435761 * self->_assistantOnLockscreen;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v43 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v42 = 2654435761 * self->_raiseToSpeakEnabled;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v42 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v41 = 2654435761 * self->_spokenNotificationsEnabled;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v41 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v40 = 2654435761 * self->_hasHomekitHome;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v40 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v39 = 2654435761 * self->_shortcutsAvailable;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v39 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v38 = 2654435761 * self->_dataSharingOptInStatus;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v38 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    uint64_t v37 = 2654435761 * self->_typeToSiriEnabled;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v36 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_25:
  uint64_t v37 = 0;
  if ((*(_WORD *)&has & 0x800) == 0) {
    goto LABEL_26;
  }
LABEL_13:
  uint64_t v36 = 2654435761 * self->_isPreciseLocationEnabled;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v35 = 2654435761 * self->_voiceFeedback;
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v35 = 0;
LABEL_28:
  unint64_t v34 = [(SISchemaAnnounceEnabledStatus *)self->_announceEnabledStatus hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    uint64_t v33 = 2654435761 * self->_isAdaptiveVolumeEnabled;
  }
  else {
    uint64_t v33 = 0;
  }
  unint64_t v32 = [(SISchemaAdaptiveVolumeUserPreferences *)self->_adaptiveVolumeUserPreferences hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    uint64_t v31 = 2654435761 * self->_isRemoteDarwinHeySiriEnabled;
  }
  else {
    uint64_t v31 = 0;
  }
  uint64_t v30 = [(NSArray *)self->_gradingOptInStateChanges hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    uint64_t v29 = 2654435761 * self->_isAutoPunctuationEnabled;
  }
  else {
    uint64_t v29 = 0;
  }
  unint64_t v28 = [(SISchemaSendWithoutConfirmation *)self->_sendWithoutConfirmation hash];
  $5F8FA149478B3F06D8A5175B937FFFE0 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
    uint64_t v27 = 2654435761 * self->_isHSHangupEnabled;
    if ((*(_DWORD *)&v4 & 0x20000) != 0)
    {
LABEL_39:
      uint64_t v26 = 2654435761 * self->_isSiriInCallEnabled;
      if ((*(_DWORD *)&v4 & 0x40000) != 0) {
        goto LABEL_40;
      }
      goto LABEL_51;
    }
  }
  else
  {
    uint64_t v27 = 0;
    if ((*(_DWORD *)&v4 & 0x20000) != 0) {
      goto LABEL_39;
    }
  }
  uint64_t v26 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_40:
    uint64_t v5 = 2654435761 * self->_hsHangupEnablementState;
    if ((*(_DWORD *)&v4 & 0x80000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
LABEL_41:
    uint64_t v6 = 2654435761 * self->_siriInCallEnablementState;
    if ((*(_DWORD *)&v4 & 0x100000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_42:
    uint64_t v7 = 2654435761 * self->_isAlwaysShowSiriCaptionsEnabled;
    if ((*(_DWORD *)&v4 & 0x200000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&v4 & 0x200000) != 0)
  {
LABEL_43:
    uint64_t v8 = 2654435761 * self->_isAlwaysShowSpeechEnabled;
    if ((*(_DWORD *)&v4 & 0x400000) != 0) {
      goto LABEL_44;
    }
LABEL_55:
    uint64_t v9 = 0;
    if ((*(_DWORD *)&v4 & 0x800000) != 0) {
      goto LABEL_45;
    }
LABEL_56:
    unint64_t v14 = 0;
    goto LABEL_59;
  }
LABEL_54:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) == 0) {
    goto LABEL_55;
  }
LABEL_44:
  uint64_t v9 = 2654435761 * self->_isShowAppsBehindSiriEnabled;
  if ((*(_DWORD *)&v4 & 0x800000) == 0) {
    goto LABEL_56;
  }
LABEL_45:
  double siriSpeechRate = self->_siriSpeechRate;
  double v11 = -siriSpeechRate;
  if (siriSpeechRate >= 0.0) {
    double v11 = self->_siriSpeechRate;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_59:
  if ((*(_DWORD *)&v4 & 0x1000000) != 0) {
    uint64_t v15 = 2654435761 * self->_isVoiceOverEnabled;
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v16 = [(SISchemaSiriVoiceTriggerSettings *)self->_siriVoiceTriggerSettings hash];
  $5F8FA149478B3F06D8A5175B937FFFE0 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x2000000) != 0)
  {
    uint64_t v18 = 2654435761 * self->_isShowAppsBehindSiriEnabledOnCarPlay;
    if ((*(_DWORD *)&v17 & 0x4000000) != 0)
    {
LABEL_64:
      uint64_t v19 = 2654435761 * self->_isSiriCapableDigitalCarKeyAvailable;
      if ((*(_DWORD *)&v17 & 0x8000000) != 0) {
        goto LABEL_65;
      }
      goto LABEL_72;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((*(_DWORD *)&v17 & 0x4000000) != 0) {
      goto LABEL_64;
    }
  }
  uint64_t v19 = 0;
  if ((*(_DWORD *)&v17 & 0x8000000) != 0)
  {
LABEL_65:
    uint64_t v20 = 2654435761 * self->_isAlwaysListenForHeySiriEnabled;
    if ((*(_DWORD *)&v17 & 0x10000000) != 0) {
      goto LABEL_66;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&v17 & 0x10000000) != 0)
  {
LABEL_66:
    uint64_t v21 = 2654435761 * self->_siriPauseTimeState;
    if ((*(_DWORD *)&v17 & 0x20000000) != 0) {
      goto LABEL_67;
    }
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v21 = 0;
  if ((*(_DWORD *)&v17 & 0x20000000) != 0)
  {
LABEL_67:
    uint64_t v22 = 2654435761 * self->_isMteUploadEnabled;
    if ((*(_DWORD *)&v17 & 0x40000000) != 0) {
      goto LABEL_68;
    }
LABEL_75:
    uint64_t v23 = 0;
    if ((*(_DWORD *)&v17 & 0x80000000) != 0) {
      goto LABEL_69;
    }
LABEL_76:
    uint64_t v24 = 0;
    return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
  }
LABEL_74:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&v17 & 0x40000000) == 0) {
    goto LABEL_75;
  }
LABEL_68:
  uint64_t v23 = 2654435761 * self->_isServerUserDataSyncEnabled;
  if ((*(_DWORD *)&v17 & 0x80000000) == 0) {
    goto LABEL_76;
  }
LABEL_69:
  uint64_t v24 = 2654435761 * self->_locationAccessPermission;
  return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (BOOL)isEqual:(id)a3
{
  $5F8FA149478B3F06D8A5175B937FFFE0 v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_122;
  }
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  unsigned int v6 = v4[36];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_122;
  }
  if (*(unsigned char *)&has)
  {
    int assistantEnabled = self->_assistantEnabled;
    if (assistantEnabled != [v4 assistantEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_122;
  }
  if (v8)
  {
    int dictationEnabled = self->_dictationEnabled;
    if (dictationEnabled != [v4 dictationEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_122;
  }
  if (v10)
  {
    int hardwareButtonEnabled = self->_hardwareButtonEnabled;
    if (hardwareButtonEnabled != [v4 hardwareButtonEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_122;
  }
  if (v12)
  {
    int heySiriEnabled = self->_heySiriEnabled;
    if (heySiriEnabled != [v4 heySiriEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_122;
  }
  if (v14)
  {
    int assistantOnLockscreen = self->_assistantOnLockscreen;
    if (assistantOnLockscreen != [v4 assistantOnLockscreen]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_122;
  }
  if (v16)
  {
    int raiseToSpeakEnabled = self->_raiseToSpeakEnabled;
    if (raiseToSpeakEnabled != [v4 raiseToSpeakEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_122;
  }
  if (v18)
  {
    int spokenNotificationsEnabled = self->_spokenNotificationsEnabled;
    if (spokenNotificationsEnabled != [v4 spokenNotificationsEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_122;
  }
  if (v20)
  {
    int hasHomekitHome = self->_hasHomekitHome;
    if (hasHomekitHome != [v4 hasHomekitHome]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_122;
  }
  if (v22)
  {
    int shortcutsAvailable = self->_shortcutsAvailable;
    if (shortcutsAvailable != [v4 shortcutsAvailable]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1)) {
    goto LABEL_122;
  }
  if (v24)
  {
    int dataSharingOptInStatus = self->_dataSharingOptInStatus;
    if (dataSharingOptInStatus != [v4 dataSharingOptInStatus]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1)) {
    goto LABEL_122;
  }
  if (v26)
  {
    int typeToSiriEnabled = self->_typeToSiriEnabled;
    if (typeToSiriEnabled != [v4 typeToSiriEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1)) {
    goto LABEL_122;
  }
  if (v28)
  {
    int isPreciseLocationEnabled = self->_isPreciseLocationEnabled;
    if (isPreciseLocationEnabled != [v4 isPreciseLocationEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1)) {
    goto LABEL_122;
  }
  if (v30)
  {
    int voiceFeedback = self->_voiceFeedback;
    if (voiceFeedback != [v4 voiceFeedback]) {
      goto LABEL_122;
    }
  }
  unint64_t v32 = [(SISchemaEnabledStatus *)self announceEnabledStatus];
  uint64_t v33 = [v4 announceEnabledStatus];
  if ((v32 == 0) == (v33 != 0)) {
    goto LABEL_121;
  }
  uint64_t v34 = [(SISchemaEnabledStatus *)self announceEnabledStatus];
  if (v34)
  {
    uint64_t v35 = (void *)v34;
    uint64_t v36 = [(SISchemaEnabledStatus *)self announceEnabledStatus];
    uint64_t v37 = [v4 announceEnabledStatus];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_122;
    }
  }
  else
  {
  }
  int v39 = (*(_DWORD *)&self->_has >> 13) & 1;
  if (v39 != ((v4[36] >> 13) & 1)) {
    goto LABEL_122;
  }
  if (v39)
  {
    int isAdaptiveVolumeEnabled = self->_isAdaptiveVolumeEnabled;
    if (isAdaptiveVolumeEnabled != [v4 isAdaptiveVolumeEnabled]) {
      goto LABEL_122;
    }
  }
  unint64_t v32 = [(SISchemaEnabledStatus *)self adaptiveVolumeUserPreferences];
  uint64_t v33 = [v4 adaptiveVolumeUserPreferences];
  if ((v32 == 0) == (v33 != 0)) {
    goto LABEL_121;
  }
  uint64_t v41 = [(SISchemaEnabledStatus *)self adaptiveVolumeUserPreferences];
  if (v41)
  {
    uint64_t v42 = (void *)v41;
    uint64_t v43 = [(SISchemaEnabledStatus *)self adaptiveVolumeUserPreferences];
    uint64_t v44 = [v4 adaptiveVolumeUserPreferences];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_122;
    }
  }
  else
  {
  }
  int v46 = (*(_DWORD *)&self->_has >> 14) & 1;
  if (v46 != ((v4[36] >> 14) & 1)) {
    goto LABEL_122;
  }
  if (v46)
  {
    int isRemoteDarwinHeySiriEnabled = self->_isRemoteDarwinHeySiriEnabled;
    if (isRemoteDarwinHeySiriEnabled != [v4 isRemoteDarwinHeySiriEnabled]) {
      goto LABEL_122;
    }
  }
  unint64_t v32 = [(SISchemaEnabledStatus *)self gradingOptInStateChanges];
  uint64_t v33 = [v4 gradingOptInStateChanges];
  if ((v32 == 0) == (v33 != 0)) {
    goto LABEL_121;
  }
  uint64_t v48 = [(SISchemaEnabledStatus *)self gradingOptInStateChanges];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(SISchemaEnabledStatus *)self gradingOptInStateChanges];
    $5F8FA149478B3F06D8A5175B937FFFE0 v51 = [v4 gradingOptInStateChanges];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_122;
    }
  }
  else
  {
  }
  int v53 = (*(_DWORD *)&self->_has >> 15) & 1;
  if (v53 != ((v4[36] >> 15) & 1)) {
    goto LABEL_122;
  }
  if (v53)
  {
    int isAutoPunctuationEnabled = self->_isAutoPunctuationEnabled;
    if (isAutoPunctuationEnabled != [v4 isAutoPunctuationEnabled]) {
      goto LABEL_122;
    }
  }
  unint64_t v32 = [(SISchemaEnabledStatus *)self sendWithoutConfirmation];
  uint64_t v33 = [v4 sendWithoutConfirmation];
  if ((v32 == 0) == (v33 != 0)) {
    goto LABEL_121;
  }
  uint64_t v55 = [(SISchemaEnabledStatus *)self sendWithoutConfirmation];
  if (v55)
  {
    v56 = (void *)v55;
    unsigned int v57 = [(SISchemaEnabledStatus *)self sendWithoutConfirmation];
    v58 = [v4 sendWithoutConfirmation];
    int v59 = [v57 isEqual:v58];

    if (!v59) {
      goto LABEL_122;
    }
  }
  else
  {
  }
  $5F8FA149478B3F06D8A5175B937FFFE0 v60 = self->_has;
  int v61 = HIWORD(*(unsigned int *)&v60) & 1;
  unsigned int v62 = v4[36];
  if (v61 != (HIWORD(v62) & 1)) {
    goto LABEL_122;
  }
  if (v61)
  {
    int isHSHangupEnabled = self->_isHSHangupEnabled;
    if (isHSHangupEnabled != [v4 isHSHangupEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 v60 = self->_has;
    unsigned int v62 = v4[36];
  }
  int v64 = (*(unsigned int *)&v60 >> 17) & 1;
  if (v64 != ((v62 >> 17) & 1)) {
    goto LABEL_122;
  }
  if (v64)
  {
    int isSiriInCallEnabled = self->_isSiriInCallEnabled;
    if (isSiriInCallEnabled != [v4 isSiriInCallEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 v60 = self->_has;
    unsigned int v62 = v4[36];
  }
  int v66 = (*(unsigned int *)&v60 >> 18) & 1;
  if (v66 != ((v62 >> 18) & 1)) {
    goto LABEL_122;
  }
  if (v66)
  {
    int hsHangupEnablementState = self->_hsHangupEnablementState;
    if (hsHangupEnablementState != [v4 hsHangupEnablementState]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 v60 = self->_has;
    unsigned int v62 = v4[36];
  }
  int v68 = (*(unsigned int *)&v60 >> 19) & 1;
  if (v68 != ((v62 >> 19) & 1)) {
    goto LABEL_122;
  }
  if (v68)
  {
    int siriInCallEnablementState = self->_siriInCallEnablementState;
    if (siriInCallEnablementState != [v4 siriInCallEnablementState]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 v60 = self->_has;
    unsigned int v62 = v4[36];
  }
  int v70 = (*(unsigned int *)&v60 >> 20) & 1;
  if (v70 != ((v62 >> 20) & 1)) {
    goto LABEL_122;
  }
  if (v70)
  {
    int isAlwaysShowSiriCaptionsEnabled = self->_isAlwaysShowSiriCaptionsEnabled;
    if (isAlwaysShowSiriCaptionsEnabled != [v4 isAlwaysShowSiriCaptionsEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 v60 = self->_has;
    unsigned int v62 = v4[36];
  }
  int v72 = (*(unsigned int *)&v60 >> 21) & 1;
  if (v72 != ((v62 >> 21) & 1)) {
    goto LABEL_122;
  }
  if (v72)
  {
    int isAlwaysShowSpeechEnabled = self->_isAlwaysShowSpeechEnabled;
    if (isAlwaysShowSpeechEnabled != [v4 isAlwaysShowSpeechEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 v60 = self->_has;
    unsigned int v62 = v4[36];
  }
  int v74 = (*(unsigned int *)&v60 >> 22) & 1;
  if (v74 != ((v62 >> 22) & 1)) {
    goto LABEL_122;
  }
  if (v74)
  {
    int isShowAppsBehindSiriEnabled = self->_isShowAppsBehindSiriEnabled;
    if (isShowAppsBehindSiriEnabled != [v4 isShowAppsBehindSiriEnabled]) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 v60 = self->_has;
    unsigned int v62 = v4[36];
  }
  int v76 = (*(unsigned int *)&v60 >> 23) & 1;
  if (v76 != ((v62 >> 23) & 1)) {
    goto LABEL_122;
  }
  if (v76)
  {
    double siriSpeechRate = self->_siriSpeechRate;
    [v4 siriSpeechRate];
    if (siriSpeechRate != v78) {
      goto LABEL_122;
    }
    $5F8FA149478B3F06D8A5175B937FFFE0 v60 = self->_has;
    unsigned int v62 = v4[36];
  }
  int v79 = HIBYTE(*(unsigned int *)&v60) & 1;
  if (v79 != (HIBYTE(v62) & 1)) {
    goto LABEL_122;
  }
  if (v79)
  {
    int isVoiceOverEnabled = self->_isVoiceOverEnabled;
    if (isVoiceOverEnabled != [v4 isVoiceOverEnabled]) {
      goto LABEL_122;
    }
  }
  unint64_t v32 = [(SISchemaEnabledStatus *)self siriVoiceTriggerSettings];
  uint64_t v33 = [v4 siriVoiceTriggerSettings];
  if ((v32 == 0) == (v33 != 0))
  {
LABEL_121:

    goto LABEL_122;
  }
  uint64_t v81 = [(SISchemaEnabledStatus *)self siriVoiceTriggerSettings];
  if (v81)
  {
    v82 = (void *)v81;
    v83 = [(SISchemaEnabledStatus *)self siriVoiceTriggerSettings];
    v84 = [v4 siriVoiceTriggerSettings];
    int v85 = [v83 isEqual:v84];

    if (!v85) {
      goto LABEL_122;
    }
  }
  else
  {
  }
  $5F8FA149478B3F06D8A5175B937FFFE0 v88 = self->_has;
  int v89 = (*(unsigned int *)&v88 >> 25) & 1;
  unsigned int v90 = v4[36];
  if (v89 == ((v90 >> 25) & 1))
  {
    if (v89)
    {
      int isShowAppsBehindSiriEnabledOnCarPlay = self->_isShowAppsBehindSiriEnabledOnCarPlay;
      if (isShowAppsBehindSiriEnabledOnCarPlay != [v4 isShowAppsBehindSiriEnabledOnCarPlay])goto LABEL_122; {
      $5F8FA149478B3F06D8A5175B937FFFE0 v88 = self->_has;
      }
      unsigned int v90 = v4[36];
    }
    int v92 = (*(unsigned int *)&v88 >> 26) & 1;
    if (v92 == ((v90 >> 26) & 1))
    {
      if (v92)
      {
        int isSiriCapableDigitalCarKeyAvailable = self->_isSiriCapableDigitalCarKeyAvailable;
        if (isSiriCapableDigitalCarKeyAvailable != [v4 isSiriCapableDigitalCarKeyAvailable])goto LABEL_122; {
        $5F8FA149478B3F06D8A5175B937FFFE0 v88 = self->_has;
        }
        unsigned int v90 = v4[36];
      }
      int v94 = (*(unsigned int *)&v88 >> 27) & 1;
      if (v94 == ((v90 >> 27) & 1))
      {
        if (v94)
        {
          int isAlwaysListenForHeySiriEnabled = self->_isAlwaysListenForHeySiriEnabled;
          if (isAlwaysListenForHeySiriEnabled != [v4 isAlwaysListenForHeySiriEnabled]) {
            goto LABEL_122;
          }
          $5F8FA149478B3F06D8A5175B937FFFE0 v88 = self->_has;
          unsigned int v90 = v4[36];
        }
        int v96 = (*(unsigned int *)&v88 >> 28) & 1;
        if (v96 == ((v90 >> 28) & 1))
        {
          if (v96)
          {
            int siriPauseTimeState = self->_siriPauseTimeState;
            if (siriPauseTimeState != [v4 siriPauseTimeState]) {
              goto LABEL_122;
            }
            $5F8FA149478B3F06D8A5175B937FFFE0 v88 = self->_has;
            unsigned int v90 = v4[36];
          }
          int v98 = (*(unsigned int *)&v88 >> 29) & 1;
          if (v98 == ((v90 >> 29) & 1))
          {
            if (v98)
            {
              int isMteUploadEnabled = self->_isMteUploadEnabled;
              if (isMteUploadEnabled != [v4 isMteUploadEnabled]) {
                goto LABEL_122;
              }
              $5F8FA149478B3F06D8A5175B937FFFE0 v88 = self->_has;
              unsigned int v90 = v4[36];
            }
            int v100 = (*(unsigned int *)&v88 >> 30) & 1;
            if (v100 == ((v90 >> 30) & 1))
            {
              if (v100)
              {
                int isServerUserDataSyncEnabled = self->_isServerUserDataSyncEnabled;
                if (isServerUserDataSyncEnabled != [v4 isServerUserDataSyncEnabled]) {
                  goto LABEL_122;
                }
                $5F8FA149478B3F06D8A5175B937FFFE0 v88 = self->_has;
                unsigned int v90 = v4[36];
              }
              if (((v90 ^ *(_DWORD *)&v88) & 0x80000000) == 0)
              {
                if ((*(_DWORD *)&v88 & 0x80000000) == 0
                  || (int locationAccessPermission = self->_locationAccessPermission,
                      locationAccessPermission == [v4 locationAccessPermission]))
                {
                  BOOL v86 = 1;
                  goto LABEL_123;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_122:
  BOOL v86 = 0;
LABEL_123:

  return v86;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteBOOLField();
    $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_56;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_65:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_14:
  }
    PBDataWriterWriteInt32Field();
LABEL_15:
  unsigned int v6 = [(SISchemaEnabledStatus *)self announceEnabledStatus];

  if (v6)
  {
    uint64_t v7 = [(SISchemaEnabledStatus *)self announceEnabledStatus];
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  int v8 = [(SISchemaEnabledStatus *)self adaptiveVolumeUserPreferences];

  if (v8)
  {
    uint64_t v9 = [(SISchemaEnabledStatus *)self adaptiveVolumeUserPreferences];
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v10 = self->_gradingOptInStateChanges;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v15 = [(SISchemaEnabledStatus *)self sendWithoutConfirmation];

  if (v15)
  {
    int v16 = [(SISchemaEnabledStatus *)self sendWithoutConfirmation];
    PBDataWriterWriteSubmessage();
  }
  $5F8FA149478B3F06D8A5175B937FFFE0 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $5F8FA149478B3F06D8A5175B937FFFE0 v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x20000) == 0)
    {
LABEL_36:
      if ((*(_DWORD *)&v17 & 0x40000) == 0) {
        goto LABEL_37;
      }
      goto LABEL_69;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x20000) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x40000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v17 & 0x80000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  $5F8FA149478B3F06D8A5175B937FFFE0 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x80000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v17 & 0x100000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  $5F8FA149478B3F06D8A5175B937FFFE0 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x100000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v17 & 0x200000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x200000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v17 & 0x400000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x400000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v17 & 0x800000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x800000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v17 & 0x1000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_74:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x1000000) != 0) {
LABEL_43:
  }
    PBDataWriterWriteBOOLField();
LABEL_44:
  int v18 = [(SISchemaEnabledStatus *)self siriVoiceTriggerSettings];

  if (v18)
  {
    uint64_t v19 = [(SISchemaEnabledStatus *)self siriVoiceTriggerSettings];
    PBDataWriterWriteSubmessage();
  }
  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
    if ((*(_DWORD *)&v20 & 0x4000000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v20 & 0x8000000) == 0) {
        goto LABEL_49;
      }
      goto LABEL_78;
    }
  }
  else if ((*(_DWORD *)&v20 & 0x4000000) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x8000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v20 & 0x10000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v20 & 0x20000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt32Field();
  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x20000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v20 & 0x40000000) == 0) {
      goto LABEL_52;
    }
LABEL_81:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_has & 0x80000000) == 0) {
      goto LABEL_53;
    }
LABEL_82:
    PBDataWriterWriteInt32Field();
    goto LABEL_53;
  }
LABEL_80:
  PBDataWriterWriteBOOLField();
  $5F8FA149478B3F06D8A5175B937FFFE0 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000000) != 0) {
    goto LABEL_81;
  }
LABEL_52:
  if ((*(_DWORD *)&v20 & 0x80000000) != 0) {
    goto LABEL_82;
  }
LABEL_53:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaEnabledStatusReadFrom(self, (uint64_t)a3);
}

- (void)deleteLocationAccessPermission
{
  *(_DWORD *)&self->_has &= ~0x80000000;
}

- (void)setHasLocationAccessPermission:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = 0x80000000;
  }
  else {
    unsigned int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(v3 & 0x80000000 | *(_DWORD *)&self->_has & 0x7FFFFFFF);
}

- (BOOL)hasLocationAccessPermission
{
  return *(_DWORD *)&self->_has >> 31;
}

- (void)setLocationAccessPermission:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_int locationAccessPermission = a3;
}

- (void)deleteIsServerUserDataSyncEnabled
{
  *(_DWORD *)&self->_has &= ~0x40000000u;
}

- (void)setHasIsServerUserDataSyncEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasIsServerUserDataSyncEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setIsServerUserDataSyncEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_int isServerUserDataSyncEnabled = a3;
}

- (void)deleteIsMteUploadEnabled
{
  *(_DWORD *)&self->_has &= ~0x20000000u;
}

- (void)setHasIsMteUploadEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasIsMteUploadEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setIsMteUploadEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_int isMteUploadEnabled = a3;
}

- (void)deleteSiriPauseTimeState
{
  *(_DWORD *)&self->_has &= ~0x10000000u;
}

- (void)setHasSiriPauseTimeState:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasSiriPauseTimeState
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setSiriPauseTimeState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_int siriPauseTimeState = a3;
}

- (void)deleteIsAlwaysListenForHeySiriEnabled
{
  *(_DWORD *)&self->_has &= ~0x8000000u;
}

- (void)setHasIsAlwaysListenForHeySiriEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIsAlwaysListenForHeySiriEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setIsAlwaysListenForHeySiriEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_int isAlwaysListenForHeySiriEnabled = a3;
}

- (void)deleteIsSiriCapableDigitalCarKeyAvailable
{
  *(_DWORD *)&self->_has &= ~0x4000000u;
}

- (void)setHasIsSiriCapableDigitalCarKeyAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIsSiriCapableDigitalCarKeyAvailable
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIsSiriCapableDigitalCarKeyAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_int isSiriCapableDigitalCarKeyAvailable = a3;
}

- (void)deleteIsShowAppsBehindSiriEnabledOnCarPlay
{
  *(_DWORD *)&self->_has &= ~0x2000000u;
}

- (void)setHasIsShowAppsBehindSiriEnabledOnCarPlay:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsShowAppsBehindSiriEnabledOnCarPlay
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIsShowAppsBehindSiriEnabledOnCarPlay:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_int isShowAppsBehindSiriEnabledOnCarPlay = a3;
}

- (void)deleteSiriVoiceTriggerSettings
{
}

- (BOOL)hasSiriVoiceTriggerSettings
{
  return self->_siriVoiceTriggerSettings != 0;
}

- (void)deleteIsVoiceOverEnabled
{
  *(_DWORD *)&self->_has &= ~0x1000000u;
}

- (void)setHasIsVoiceOverEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsVoiceOverEnabled
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setIsVoiceOverEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_int isVoiceOverEnabled = a3;
}

- (void)deleteSiriSpeechRate
{
  *(_DWORD *)&self->_has &= ~0x800000u;
}

- (void)setHasSiriSpeechRate:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSiriSpeechRate
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSiriSpeechRate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_double siriSpeechRate = a3;
}

- (void)deleteIsShowAppsBehindSiriEnabled
{
  *(_DWORD *)&self->_has &= ~0x400000u;
}

- (void)setHasIsShowAppsBehindSiriEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIsShowAppsBehindSiriEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIsShowAppsBehindSiriEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_int isShowAppsBehindSiriEnabled = a3;
}

- (void)deleteIsAlwaysShowSpeechEnabled
{
  *(_DWORD *)&self->_has &= ~0x200000u;
}

- (void)setHasIsAlwaysShowSpeechEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsAlwaysShowSpeechEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setIsAlwaysShowSpeechEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_int isAlwaysShowSpeechEnabled = a3;
}

- (void)deleteIsAlwaysShowSiriCaptionsEnabled
{
  *(_DWORD *)&self->_has &= ~0x100000u;
}

- (void)setHasIsAlwaysShowSiriCaptionsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsAlwaysShowSiriCaptionsEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setIsAlwaysShowSiriCaptionsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_int isAlwaysShowSiriCaptionsEnabled = a3;
}

- (void)deleteSiriInCallEnablementState
{
  *(_DWORD *)&self->_has &= ~0x80000u;
}

- (void)setHasSiriInCallEnablementState:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSiriInCallEnablementState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSiriInCallEnablementState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_int siriInCallEnablementState = a3;
}

- (void)deleteHsHangupEnablementState
{
  *(_DWORD *)&self->_has &= ~0x40000u;
}

- (void)setHasHsHangupEnablementState:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasHsHangupEnablementState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHsHangupEnablementState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_int hsHangupEnablementState = a3;
}

- (void)deleteIsSiriInCallEnabled
{
  *(_DWORD *)&self->_has &= ~0x20000u;
}

- (void)setHasIsSiriInCallEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsSiriInCallEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsSiriInCallEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_int isSiriInCallEnabled = a3;
}

- (void)deleteIsHSHangupEnabled
{
  *(_DWORD *)&self->_has &= ~0x10000u;
}

- (void)setHasIsHSHangupEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsHSHangupEnabled
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setIsHSHangupEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_int isHSHangupEnabled = a3;
}

- (void)deleteSendWithoutConfirmation
{
}

- (BOOL)hasSendWithoutConfirmation
{
  return self->_sendWithoutConfirmation != 0;
}

- (void)deleteIsAutoPunctuationEnabled
{
  *(_DWORD *)&self->_has &= ~0x8000u;
}

- (void)setHasIsAutoPunctuationEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsAutoPunctuationEnabled
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIsAutoPunctuationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_int isAutoPunctuationEnabled = a3;
}

- (id)gradingOptInStateChangesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_gradingOptInStateChanges objectAtIndexedSubscript:a3];
}

- (unint64_t)gradingOptInStateChangesCount
{
  return [(NSArray *)self->_gradingOptInStateChanges count];
}

- (void)addGradingOptInStateChanges:(id)a3
{
  id v4 = a3;
  gradingOptInStateChanges = self->_gradingOptInStateChanges;
  id v8 = v4;
  if (!gradingOptInStateChanges)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_gradingOptInStateChanges;
    self->_gradingOptInStateChanges = v6;

    id v4 = v8;
    gradingOptInStateChanges = self->_gradingOptInStateChanges;
  }
  [(NSArray *)gradingOptInStateChanges addObject:v4];
}

- (void)clearGradingOptInStateChanges
{
}

- (void)deleteIsRemoteDarwinHeySiriEnabled
{
  *(_DWORD *)&self->_has &= ~0x4000u;
}

- (void)setHasIsRemoteDarwinHeySiriEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsRemoteDarwinHeySiriEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsRemoteDarwinHeySiriEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_int isRemoteDarwinHeySiriEnabled = a3;
}

- (void)deleteAdaptiveVolumeUserPreferences
{
}

- (BOOL)hasAdaptiveVolumeUserPreferences
{
  return self->_adaptiveVolumeUserPreferences != 0;
}

- (void)deleteIsAdaptiveVolumeEnabled
{
  *(_DWORD *)&self->_has &= ~0x2000u;
}

- (void)setHasIsAdaptiveVolumeEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsAdaptiveVolumeEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsAdaptiveVolumeEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_int isAdaptiveVolumeEnabled = a3;
}

- (void)deleteAnnounceEnabledStatus
{
}

- (BOOL)hasAnnounceEnabledStatus
{
  return self->_announceEnabledStatus != 0;
}

- (void)deleteVoiceFeedback
{
  *(_DWORD *)&self->_has &= ~0x1000u;
}

- (void)setHasVoiceFeedback:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasVoiceFeedback
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setVoiceFeedback:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_int voiceFeedback = a3;
}

- (void)deleteIsPreciseLocationEnabled
{
  *(_DWORD *)&self->_has &= ~0x800u;
}

- (void)setHasIsPreciseLocationEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsPreciseLocationEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsPreciseLocationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_int isPreciseLocationEnabled = a3;
}

- (void)deleteTypeToSiriEnabled
{
  *(_DWORD *)&self->_has &= ~0x400u;
}

- (void)setHasTypeToSiriEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTypeToSiriEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTypeToSiriEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_int typeToSiriEnabled = a3;
}

- (void)deleteDataSharingOptInStatus
{
  *(_DWORD *)&self->_has &= ~0x200u;
}

- (void)setHasDataSharingOptInStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasDataSharingOptInStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setDataSharingOptInStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_int dataSharingOptInStatus = a3;
}

- (void)deleteShortcutsAvailable
{
  *(_DWORD *)&self->_has &= ~0x100u;
}

- (void)setHasShortcutsAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasShortcutsAvailable
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setShortcutsAvailable:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_int shortcutsAvailable = a3;
}

- (void)deleteHasHomekitHome
{
  *(_DWORD *)&self->_has &= ~0x80u;
}

- (void)setHasHasHomekitHome:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHasHomekitHome
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasHomekitHome:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_int hasHomekitHome = a3;
}

- (void)deleteSpokenNotificationsEnabled
{
  *(_DWORD *)&self->_has &= ~0x40u;
}

- (void)setHasSpokenNotificationsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasSpokenNotificationsEnabled
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setSpokenNotificationsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_int spokenNotificationsEnabled = a3;
}

- (void)deleteRaiseToSpeakEnabled
{
  *(_DWORD *)&self->_has &= ~0x20u;
}

- (void)setHasRaiseToSpeakEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasRaiseToSpeakEnabled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setRaiseToSpeakEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_int raiseToSpeakEnabled = a3;
}

- (void)deleteAssistantOnLockscreen
{
  *(_DWORD *)&self->_has &= ~0x10u;
}

- (void)setHasAssistantOnLockscreen:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAssistantOnLockscreen
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAssistantOnLockscreen:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_int assistantOnLockscreen = a3;
}

- (void)deleteHeySiriEnabled
{
  *(_DWORD *)&self->_has &= ~8u;
}

- (void)setHasHeySiriEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasHeySiriEnabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHeySiriEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_int heySiriEnabled = a3;
}

- (void)deleteHardwareButtonEnabled
{
  *(_DWORD *)&self->_has &= ~4u;
}

- (void)setHasHardwareButtonEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasHardwareButtonEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHardwareButtonEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_int hardwareButtonEnabled = a3;
}

- (void)deleteDictationEnabled
{
  *(_DWORD *)&self->_has &= ~2u;
}

- (void)setHasDictationEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDictationEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDictationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_int dictationEnabled = a3;
}

- (void)deleteAssistantEnabled
{
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setHasAssistantEnabled:(BOOL)a3
{
  self->_$5F8FA149478B3F06D8A5175B937FFFE0 has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAssistantEnabled
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAssistantEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_int assistantEnabled = a3;
}

@end