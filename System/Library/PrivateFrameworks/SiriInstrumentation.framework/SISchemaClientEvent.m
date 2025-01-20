@interface SISchemaClientEvent
+ (Class)getEventTypeClassForTag:(int)a3;
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (id)getTagForEventTypeClass:(Class)a3;
+ (int)joinability;
- (BOOL)hasAnnounceCarPlayBannerTapped;
- (BOOL)hasAnnounceCarPlayGlyphSettingToggled;
- (BOOL)hasAudioFirstBufferRecorded;
- (BOOL)hasAudioStopRecording;
- (BOOL)hasAudioStopRecordingStarted;
- (BOOL)hasCarPlayHeadUnitContext;
- (BOOL)hasCasinoRelationship;
- (BOOL)hasClientConversationTrace;
- (BOOL)hasClientFlow;
- (BOOL)hasDeviceDynamicContext;
- (BOOL)hasDeviceFixedContext;
- (BOOL)hasDeviceLockStateChanged;
- (BOOL)hasDialogOutput;
- (BOOL)hasDictationAlternativeSelected;
- (BOOL)hasDictationAlternativesSelected;
- (BOOL)hasDictationAlternativesViewed;
- (BOOL)hasDictationContentEdited;
- (BOOL)hasDictationContext;
- (BOOL)hasDictationEndPointCancel;
- (BOOL)hasDictationEndPointStop;
- (BOOL)hasDictationTranscriptionMetadata;
- (BOOL)hasEngagedAccessoryContext;
- (BOOL)hasEventMetadata;
- (BOOL)hasHostPlatformViewAppearContext;
- (BOOL)hasHostPlatformViewDisappearContext;
- (BOOL)hasIntercomMessageRecorded;
- (BOOL)hasInvocation;
- (BOOL)hasKeyboardDismissed;
- (BOOL)hasLocation;
- (BOOL)hasPnrFatalError;
- (BOOL)hasPnrSpeechRecognitionSourceContext;
- (BOOL)hasPnrTextToSpeechRequestReceived;
- (BOOL)hasPreferredAudioRouteChanged;
- (BOOL)hasPunchOut;
- (BOOL)hasSiriCue;
- (BOOL)hasSpeechTranscription;
- (BOOL)hasTextToSpeechBegin;
- (BOOL)hasTextToSpeechEnd;
- (BOOL)hasTransportMetadata;
- (BOOL)hasTurnMTERequest;
- (BOOL)hasTypingRequestTrace;
- (BOOL)hasUeiDictationAlternativeTextPairsSelected;
- (BOOL)hasUeiDictationContentEditedTier1;
- (BOOL)hasUeiDictationEnablementPromptShown;
- (BOOL)hasUeiDictationEuclidAlternativesEvent;
- (BOOL)hasUeiDictationEuclidAlternativesEventTier1;
- (BOOL)hasUeiDictationEuclidSpeechAlternativesSelected;
- (BOOL)hasUeiDictationEuclidSpeechAlternativesSelectedTier1;
- (BOOL)hasUeiDictationInputModeSwitchContext;
- (BOOL)hasUeiDictationPartialResultUpdated;
- (BOOL)hasUeiDictationToolTipDisplayContext;
- (BOOL)hasUeiDictationTranscriptionTokenized;
- (BOOL)hasUeiDictationVoiceCommandDisambiguationAction;
- (BOOL)hasUeiDictationVoiceCommandExecuted;
- (BOOL)hasUeiDictationVoiceCommandKeyboardAction;
- (BOOL)hasUeiDictationVoiceCommandUndoTapAction;
- (BOOL)hasUeiInvocationTier1;
- (BOOL)hasUeiLaunchContext;
- (BOOL)hasUeiRequestCategorization;
- (BOOL)hasUeiSiriCarCommandContext;
- (BOOL)hasUeiSiriWasUnavailable;
- (BOOL)hasUeiUIRenderingContext;
- (BOOL)hasUeiUUFRReady;
- (BOOL)hasUeiUserBargeInDetected;
- (BOOL)hasUeiUserSpeakingContext;
- (BOOL)hasUeiVisionSnippetDismissed;
- (BOOL)hasUiStateTransition;
- (BOOL)hasUserViewRegionInteraction;
- (BOOL)hasUufrCompletion;
- (BOOL)hasUufrFatalError;
- (BOOL)hasUufrPresented;
- (BOOL)hasUufrSaid;
- (BOOL)hasUufrSelected;
- (BOOL)hasUufrShown;
- (BOOL)hasUufrShownTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaAnnounceCarPlayBannerTapped)announceCarPlayBannerTapped;
- (SISchemaAnnounceCarPlayGlyphSettingToggled)announceCarPlayGlyphSettingToggled;
- (SISchemaAudioFirstBufferRecorded)audioFirstBufferRecorded;
- (SISchemaAudioStopRecording)audioStopRecording;
- (SISchemaAudioStopRecordingStarted)audioStopRecordingStarted;
- (SISchemaBluetoothCarPreferredAudioRouteChanged)preferredAudioRouteChanged;
- (SISchemaCarPlayHeadUnitContext)carPlayHeadUnitContext;
- (SISchemaCasinoRelationship)casinoRelationship;
- (SISchemaClientEvent)initWithDictionary:(id)a3;
- (SISchemaClientEvent)initWithJSON:(id)a3;
- (SISchemaClientEventMetadata)eventMetadata;
- (SISchemaClientFlow)clientFlow;
- (SISchemaClientTransportEventMetadata)transportMetadata;
- (SISchemaConversationTrace)clientConversationTrace;
- (SISchemaDeviceDynamicContext)deviceDynamicContext;
- (SISchemaDeviceFixedContext)deviceFixedContext;
- (SISchemaDeviceLockStateChanged)deviceLockStateChanged;
- (SISchemaDialogOutput)dialogOutput;
- (SISchemaDictationAlternativeSelected)dictationAlternativeSelected;
- (SISchemaDictationAlternativesViewed)dictationAlternativesViewed;
- (SISchemaDictationContentEdited)dictationContentEdited;
- (SISchemaDictationContext)dictationContext;
- (SISchemaDictationEndPointCancel)dictationEndPointCancel;
- (SISchemaDictationEndPointStop)dictationEndPointStop;
- (SISchemaDictationTranscriptionMetadata)dictationTranscriptionMetadata;
- (SISchemaEngagedAccessoryContext)engagedAccessoryContext;
- (SISchemaInstrumentationMessage)innerEvent;
- (SISchemaIntercomMessageRecorded)intercomMessageRecorded;
- (SISchemaInvocation)invocation;
- (SISchemaKeyboardDismissed)keyboardDismissed;
- (SISchemaLocation)location;
- (SISchemaPNRFatalError)pnrFatalError;
- (SISchemaPNRSpeechRecognitionSourceContext)pnrSpeechRecognitionSourceContext;
- (SISchemaPNRTextToSpeechRequestReceived)pnrTextToSpeechRequestReceived;
- (SISchemaPunchOut)punchOut;
- (SISchemaSiriCue)siriCue;
- (SISchemaSpeechTranscription)speechTranscription;
- (SISchemaTextToSpeechBegin)textToSpeechBegin;
- (SISchemaTextToSpeechEnd)textToSpeechEnd;
- (SISchemaTurnMTERequest)turnMTERequest;
- (SISchemaTypingRequestTrace)typingRequestTrace;
- (SISchemaUEIDictationAlternativeConfusionPairsSelected)dictationAlternativesSelected;
- (SISchemaUEIDictationAlternativeTextPairsSelected)ueiDictationAlternativeTextPairsSelected;
- (SISchemaUEIDictationContentEditedTier1)ueiDictationContentEditedTier1;
- (SISchemaUEIDictationDiscoveryToolTipDisplayContext)ueiDictationToolTipDisplayContext;
- (SISchemaUEIDictationEnablementPromptShown)ueiDictationEnablementPromptShown;
- (SISchemaUEIDictationEuclidAlternativesEvent)ueiDictationEuclidAlternativesEvent;
- (SISchemaUEIDictationEuclidAlternativesEventTier1)ueiDictationEuclidAlternativesEventTier1;
- (SISchemaUEIDictationEuclidSpeechAlternativesSelected)ueiDictationEuclidSpeechAlternativesSelected;
- (SISchemaUEIDictationEuclidSpeechAlternativesSelectedTier1)ueiDictationEuclidSpeechAlternativesSelectedTier1;
- (SISchemaUEIDictationInputModeSwitchContext)ueiDictationInputModeSwitchContext;
- (SISchemaUEIDictationPartialResultUpdated)ueiDictationPartialResultUpdated;
- (SISchemaUEIDictationTranscriptionTokenized)ueiDictationTranscriptionTokenized;
- (SISchemaUEIDictationVoiceCommandDisambiguationAction)ueiDictationVoiceCommandDisambiguationAction;
- (SISchemaUEIDictationVoiceCommandExecuted)ueiDictationVoiceCommandExecuted;
- (SISchemaUEIDictationVoiceCommandKeyboardAction)ueiDictationVoiceCommandKeyboardAction;
- (SISchemaUEIDictationVoiceCommandUndoTapAction)ueiDictationVoiceCommandUndoTapAction;
- (SISchemaUEIHostingPlatformViewAppearContext)hostPlatformViewAppearContext;
- (SISchemaUEIHostingPlatformViewDisappearContext)hostPlatformViewDisappearContext;
- (SISchemaUEIInvocationTier1)ueiInvocationTier1;
- (SISchemaUEILaunchContext)ueiLaunchContext;
- (SISchemaUEIRequestCategorization)ueiRequestCategorization;
- (SISchemaUEISiriCarCommandContext)ueiSiriCarCommandContext;
- (SISchemaUEISiriWasUnavailable)ueiSiriWasUnavailable;
- (SISchemaUEIUIRenderingContext)ueiUIRenderingContext;
- (SISchemaUEIUUFRReady)ueiUUFRReady;
- (SISchemaUEIUserBargeInDetected)ueiUserBargeInDetected;
- (SISchemaUEIUserSpeakingContext)ueiUserSpeakingContext;
- (SISchemaUEIVisionSnippetDismissed)ueiVisionSnippetDismissed;
- (SISchemaUIStateTransition)uiStateTransition;
- (SISchemaUUFRCompletion)uufrCompletion;
- (SISchemaUUFRFatalError)uufrFatalError;
- (SISchemaUUFRPresented)uufrPresented;
- (SISchemaUUFRSaid)uufrSaid;
- (SISchemaUUFRSelected)uufrSelected;
- (SISchemaUUFRShown)uufrShown;
- (SISchemaUUFRShownTier1)uufrShownTier1;
- (SISchemaUserViewRegionInteraction)userViewRegionInteraction;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)getEventType;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteAnnounceCarPlayBannerTapped;
- (void)deleteAnnounceCarPlayGlyphSettingToggled;
- (void)deleteAudioFirstBufferRecorded;
- (void)deleteAudioStopRecording;
- (void)deleteAudioStopRecordingStarted;
- (void)deleteCarPlayHeadUnitContext;
- (void)deleteCasinoRelationship;
- (void)deleteClientConversationTrace;
- (void)deleteClientFlow;
- (void)deleteDeviceDynamicContext;
- (void)deleteDeviceFixedContext;
- (void)deleteDeviceLockStateChanged;
- (void)deleteDialogOutput;
- (void)deleteDictationAlternativeSelected;
- (void)deleteDictationAlternativesSelected;
- (void)deleteDictationAlternativesViewed;
- (void)deleteDictationContentEdited;
- (void)deleteDictationContext;
- (void)deleteDictationEndPointCancel;
- (void)deleteDictationEndPointStop;
- (void)deleteDictationTranscriptionMetadata;
- (void)deleteEngagedAccessoryContext;
- (void)deleteEventMetadata;
- (void)deleteHostPlatformViewAppearContext;
- (void)deleteHostPlatformViewDisappearContext;
- (void)deleteIntercomMessageRecorded;
- (void)deleteInvocation;
- (void)deleteKeyboardDismissed;
- (void)deleteLocation;
- (void)deletePnrFatalError;
- (void)deletePnrSpeechRecognitionSourceContext;
- (void)deletePnrTextToSpeechRequestReceived;
- (void)deletePreferredAudioRouteChanged;
- (void)deletePunchOut;
- (void)deleteSiriCue;
- (void)deleteSpeechTranscription;
- (void)deleteTextToSpeechBegin;
- (void)deleteTextToSpeechEnd;
- (void)deleteTransportMetadata;
- (void)deleteTurnMTERequest;
- (void)deleteTypingRequestTrace;
- (void)deleteUeiDictationAlternativeTextPairsSelected;
- (void)deleteUeiDictationContentEditedTier1;
- (void)deleteUeiDictationEnablementPromptShown;
- (void)deleteUeiDictationEuclidAlternativesEvent;
- (void)deleteUeiDictationEuclidAlternativesEventTier1;
- (void)deleteUeiDictationEuclidSpeechAlternativesSelected;
- (void)deleteUeiDictationEuclidSpeechAlternativesSelectedTier1;
- (void)deleteUeiDictationInputModeSwitchContext;
- (void)deleteUeiDictationPartialResultUpdated;
- (void)deleteUeiDictationToolTipDisplayContext;
- (void)deleteUeiDictationTranscriptionTokenized;
- (void)deleteUeiDictationVoiceCommandDisambiguationAction;
- (void)deleteUeiDictationVoiceCommandExecuted;
- (void)deleteUeiDictationVoiceCommandKeyboardAction;
- (void)deleteUeiDictationVoiceCommandUndoTapAction;
- (void)deleteUeiInvocationTier1;
- (void)deleteUeiLaunchContext;
- (void)deleteUeiRequestCategorization;
- (void)deleteUeiSiriCarCommandContext;
- (void)deleteUeiSiriWasUnavailable;
- (void)deleteUeiUIRenderingContext;
- (void)deleteUeiUUFRReady;
- (void)deleteUeiUserBargeInDetected;
- (void)deleteUeiUserSpeakingContext;
- (void)deleteUeiVisionSnippetDismissed;
- (void)deleteUiStateTransition;
- (void)deleteUserViewRegionInteraction;
- (void)deleteUufrCompletion;
- (void)deleteUufrFatalError;
- (void)deleteUufrPresented;
- (void)deleteUufrSaid;
- (void)deleteUufrSelected;
- (void)deleteUufrShown;
- (void)deleteUufrShownTier1;
- (void)setAnnounceCarPlayBannerTapped:(id)a3;
- (void)setAnnounceCarPlayGlyphSettingToggled:(id)a3;
- (void)setAudioFirstBufferRecorded:(id)a3;
- (void)setAudioStopRecording:(id)a3;
- (void)setAudioStopRecordingStarted:(id)a3;
- (void)setCarPlayHeadUnitContext:(id)a3;
- (void)setCasinoRelationship:(id)a3;
- (void)setClientConversationTrace:(id)a3;
- (void)setClientFlow:(id)a3;
- (void)setDeviceDynamicContext:(id)a3;
- (void)setDeviceFixedContext:(id)a3;
- (void)setDeviceLockStateChanged:(id)a3;
- (void)setDialogOutput:(id)a3;
- (void)setDictationAlternativeSelected:(id)a3;
- (void)setDictationAlternativesSelected:(id)a3;
- (void)setDictationAlternativesViewed:(id)a3;
- (void)setDictationContentEdited:(id)a3;
- (void)setDictationContext:(id)a3;
- (void)setDictationEndPointCancel:(id)a3;
- (void)setDictationEndPointStop:(id)a3;
- (void)setDictationTranscriptionMetadata:(id)a3;
- (void)setEngagedAccessoryContext:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setEventType:(id)a3;
- (void)setHasAnnounceCarPlayBannerTapped:(BOOL)a3;
- (void)setHasAnnounceCarPlayGlyphSettingToggled:(BOOL)a3;
- (void)setHasAudioFirstBufferRecorded:(BOOL)a3;
- (void)setHasAudioStopRecording:(BOOL)a3;
- (void)setHasAudioStopRecordingStarted:(BOOL)a3;
- (void)setHasCarPlayHeadUnitContext:(BOOL)a3;
- (void)setHasCasinoRelationship:(BOOL)a3;
- (void)setHasClientConversationTrace:(BOOL)a3;
- (void)setHasClientFlow:(BOOL)a3;
- (void)setHasDeviceDynamicContext:(BOOL)a3;
- (void)setHasDeviceFixedContext:(BOOL)a3;
- (void)setHasDeviceLockStateChanged:(BOOL)a3;
- (void)setHasDialogOutput:(BOOL)a3;
- (void)setHasDictationAlternativeSelected:(BOOL)a3;
- (void)setHasDictationAlternativesSelected:(BOOL)a3;
- (void)setHasDictationAlternativesViewed:(BOOL)a3;
- (void)setHasDictationContentEdited:(BOOL)a3;
- (void)setHasDictationContext:(BOOL)a3;
- (void)setHasDictationEndPointCancel:(BOOL)a3;
- (void)setHasDictationEndPointStop:(BOOL)a3;
- (void)setHasDictationTranscriptionMetadata:(BOOL)a3;
- (void)setHasEngagedAccessoryContext:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasHostPlatformViewAppearContext:(BOOL)a3;
- (void)setHasHostPlatformViewDisappearContext:(BOOL)a3;
- (void)setHasIntercomMessageRecorded:(BOOL)a3;
- (void)setHasInvocation:(BOOL)a3;
- (void)setHasKeyboardDismissed:(BOOL)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setHasPnrFatalError:(BOOL)a3;
- (void)setHasPnrSpeechRecognitionSourceContext:(BOOL)a3;
- (void)setHasPnrTextToSpeechRequestReceived:(BOOL)a3;
- (void)setHasPreferredAudioRouteChanged:(BOOL)a3;
- (void)setHasPunchOut:(BOOL)a3;
- (void)setHasSiriCue:(BOOL)a3;
- (void)setHasSpeechTranscription:(BOOL)a3;
- (void)setHasTextToSpeechBegin:(BOOL)a3;
- (void)setHasTextToSpeechEnd:(BOOL)a3;
- (void)setHasTransportMetadata:(BOOL)a3;
- (void)setHasTurnMTERequest:(BOOL)a3;
- (void)setHasTypingRequestTrace:(BOOL)a3;
- (void)setHasUeiDictationAlternativeTextPairsSelected:(BOOL)a3;
- (void)setHasUeiDictationContentEditedTier1:(BOOL)a3;
- (void)setHasUeiDictationEnablementPromptShown:(BOOL)a3;
- (void)setHasUeiDictationEuclidAlternativesEvent:(BOOL)a3;
- (void)setHasUeiDictationEuclidAlternativesEventTier1:(BOOL)a3;
- (void)setHasUeiDictationEuclidSpeechAlternativesSelected:(BOOL)a3;
- (void)setHasUeiDictationEuclidSpeechAlternativesSelectedTier1:(BOOL)a3;
- (void)setHasUeiDictationInputModeSwitchContext:(BOOL)a3;
- (void)setHasUeiDictationPartialResultUpdated:(BOOL)a3;
- (void)setHasUeiDictationToolTipDisplayContext:(BOOL)a3;
- (void)setHasUeiDictationTranscriptionTokenized:(BOOL)a3;
- (void)setHasUeiDictationVoiceCommandDisambiguationAction:(BOOL)a3;
- (void)setHasUeiDictationVoiceCommandExecuted:(BOOL)a3;
- (void)setHasUeiDictationVoiceCommandKeyboardAction:(BOOL)a3;
- (void)setHasUeiDictationVoiceCommandUndoTapAction:(BOOL)a3;
- (void)setHasUeiInvocationTier1:(BOOL)a3;
- (void)setHasUeiLaunchContext:(BOOL)a3;
- (void)setHasUeiRequestCategorization:(BOOL)a3;
- (void)setHasUeiSiriCarCommandContext:(BOOL)a3;
- (void)setHasUeiSiriWasUnavailable:(BOOL)a3;
- (void)setHasUeiUIRenderingContext:(BOOL)a3;
- (void)setHasUeiUUFRReady:(BOOL)a3;
- (void)setHasUeiUserBargeInDetected:(BOOL)a3;
- (void)setHasUeiUserSpeakingContext:(BOOL)a3;
- (void)setHasUeiVisionSnippetDismissed:(BOOL)a3;
- (void)setHasUiStateTransition:(BOOL)a3;
- (void)setHasUserViewRegionInteraction:(BOOL)a3;
- (void)setHasUufrCompletion:(BOOL)a3;
- (void)setHasUufrFatalError:(BOOL)a3;
- (void)setHasUufrPresented:(BOOL)a3;
- (void)setHasUufrSaid:(BOOL)a3;
- (void)setHasUufrSelected:(BOOL)a3;
- (void)setHasUufrShown:(BOOL)a3;
- (void)setHasUufrShownTier1:(BOOL)a3;
- (void)setHostPlatformViewAppearContext:(id)a3;
- (void)setHostPlatformViewDisappearContext:(id)a3;
- (void)setIntercomMessageRecorded:(id)a3;
- (void)setInvocation:(id)a3;
- (void)setKeyboardDismissed:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPnrFatalError:(id)a3;
- (void)setPnrSpeechRecognitionSourceContext:(id)a3;
- (void)setPnrTextToSpeechRequestReceived:(id)a3;
- (void)setPreferredAudioRouteChanged:(id)a3;
- (void)setPunchOut:(id)a3;
- (void)setSiriCue:(id)a3;
- (void)setSpeechTranscription:(id)a3;
- (void)setTextToSpeechBegin:(id)a3;
- (void)setTextToSpeechEnd:(id)a3;
- (void)setTransportMetadata:(id)a3;
- (void)setTurnMTERequest:(id)a3;
- (void)setTypingRequestTrace:(id)a3;
- (void)setUeiDictationAlternativeTextPairsSelected:(id)a3;
- (void)setUeiDictationContentEditedTier1:(id)a3;
- (void)setUeiDictationEnablementPromptShown:(id)a3;
- (void)setUeiDictationEuclidAlternativesEvent:(id)a3;
- (void)setUeiDictationEuclidAlternativesEventTier1:(id)a3;
- (void)setUeiDictationEuclidSpeechAlternativesSelected:(id)a3;
- (void)setUeiDictationEuclidSpeechAlternativesSelectedTier1:(id)a3;
- (void)setUeiDictationInputModeSwitchContext:(id)a3;
- (void)setUeiDictationPartialResultUpdated:(id)a3;
- (void)setUeiDictationToolTipDisplayContext:(id)a3;
- (void)setUeiDictationTranscriptionTokenized:(id)a3;
- (void)setUeiDictationVoiceCommandDisambiguationAction:(id)a3;
- (void)setUeiDictationVoiceCommandExecuted:(id)a3;
- (void)setUeiDictationVoiceCommandKeyboardAction:(id)a3;
- (void)setUeiDictationVoiceCommandUndoTapAction:(id)a3;
- (void)setUeiInvocationTier1:(id)a3;
- (void)setUeiLaunchContext:(id)a3;
- (void)setUeiRequestCategorization:(id)a3;
- (void)setUeiSiriCarCommandContext:(id)a3;
- (void)setUeiSiriWasUnavailable:(id)a3;
- (void)setUeiUIRenderingContext:(id)a3;
- (void)setUeiUUFRReady:(id)a3;
- (void)setUeiUserBargeInDetected:(id)a3;
- (void)setUeiUserSpeakingContext:(id)a3;
- (void)setUeiVisionSnippetDismissed:(id)a3;
- (void)setUiStateTransition:(id)a3;
- (void)setUserViewRegionInteraction:(id)a3;
- (void)setUufrCompletion:(id)a3;
- (void)setUufrFatalError:(id)a3;
- (void)setUufrPresented:(id)a3;
- (void)setUufrSaid:(id)a3;
- (void)setUufrSelected:(id)a3;
- (void)setUufrShown:(id)a3;
- (void)setUufrShownTier1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaClientEvent

- (int)componentName
{
  v3 = [SISchemaUUID alloc];
  v4 = [(SISchemaClientEvent *)self eventMetadata];
  v5 = [v4 turnID];
  v6 = [(SISchemaUUID *)v3 initWithBytesAsData:v5];

  if (v6)
  {
    v7 = [(SISchemaUUID *)v6 value];
    if (v7)
    {
      v8 = [(SISchemaUUID *)v6 value];
      BOOL v9 = [v8 length] != 0;

      LODWORD(v7) = 2 * v9;
    }
  }
  else
  {
    LODWORD(v7) = 0;
  }

  return (int)v7;
}

- (id)getComponentId
{
  v3 = [SISchemaUUID alloc];
  v4 = [(SISchemaClientEvent *)self eventMetadata];
  v5 = [v4 turnID];
  v6 = [(SISchemaUUID *)v3 initWithBytesAsData:v5];

  if (!v6) {
    goto LABEL_5;
  }
  v7 = [(SISchemaUUID *)v6 value];
  if (!v7) {
    goto LABEL_6;
  }
  v8 = [(SISchemaUUID *)v6 value];
  uint64_t v9 = [v8 length];

  if (v9) {
    v7 = v6;
  }
  else {
LABEL_5:
  }
    v7 = 0;
LABEL_6:

  return v7;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v233.receiver = self;
  v233.super_class = (Class)SISchemaClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v233 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(SISchemaClientEvent *)self deleteUufrShownTier1];
    [(SISchemaClientEvent *)self deleteDictationAlternativesSelected];
    [(SISchemaClientEvent *)self deleteUeiDictationAlternativeTextPairsSelected];
    [(SISchemaClientEvent *)self deleteUeiDictationContentEditedTier1];
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidAlternativesEventTier1];
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidSpeechAlternativesSelectedTier1];
    [(SISchemaClientEvent *)self deleteUeiInvocationTier1];
  }
  if ([v4 isConditionSet:4])
  {
    [(SISchemaClientEvent *)self deleteUufrShownTier1];
    [(SISchemaClientEvent *)self deleteDictationAlternativesSelected];
    [(SISchemaClientEvent *)self deleteUufrSelected];
    [(SISchemaClientEvent *)self deleteUeiDictationAlternativeTextPairsSelected];
    [(SISchemaClientEvent *)self deleteUeiDictationContentEditedTier1];
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidAlternativesEventTier1];
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidSpeechAlternativesSelectedTier1];
    [(SISchemaClientEvent *)self deleteUeiInvocationTier1];
  }
  if ([v4 isConditionSet:5])
  {
    [(SISchemaClientEvent *)self deleteUufrShownTier1];
    [(SISchemaClientEvent *)self deleteDictationAlternativesSelected];
    [(SISchemaClientEvent *)self deleteUeiDictationAlternativeTextPairsSelected];
    [(SISchemaClientEvent *)self deleteUeiDictationContentEditedTier1];
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidAlternativesEventTier1];
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidSpeechAlternativesSelectedTier1];
    [(SISchemaClientEvent *)self deleteUeiInvocationTier1];
  }
  if ([v4 isConditionSet:6])
  {
    [(SISchemaClientEvent *)self deleteUufrShownTier1];
    [(SISchemaClientEvent *)self deleteDictationAlternativesSelected];
    [(SISchemaClientEvent *)self deleteUeiDictationAlternativeTextPairsSelected];
    [(SISchemaClientEvent *)self deleteUeiDictationContentEditedTier1];
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidAlternativesEventTier1];
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidSpeechAlternativesSelectedTier1];
    [(SISchemaClientEvent *)self deleteUeiInvocationTier1];
  }
  if ([v4 isConditionSet:7])
  {
    [(SISchemaClientEvent *)self deleteUufrShownTier1];
    [(SISchemaClientEvent *)self deleteDictationAlternativesSelected];
    [(SISchemaClientEvent *)self deleteUeiDictationAlternativeTextPairsSelected];
    [(SISchemaClientEvent *)self deleteUeiDictationContentEditedTier1];
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidAlternativesEventTier1];
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidSpeechAlternativesSelectedTier1];
    [(SISchemaClientEvent *)self deleteUeiInvocationTier1];
  }
  v6 = [(SISchemaClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaClientEvent *)self deleteEventMetadata];
  }
  uint64_t v9 = [(SISchemaClientEvent *)self transportMetadata];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaClientEvent *)self deleteTransportMetadata];
  }
  v12 = [(SISchemaClientEvent *)self audioFirstBufferRecorded];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SISchemaClientEvent *)self deleteAudioFirstBufferRecorded];
  }
  v15 = [(SISchemaClientEvent *)self audioStopRecording];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SISchemaClientEvent *)self deleteAudioStopRecording];
  }
  v18 = [(SISchemaClientEvent *)self clientConversationTrace];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(SISchemaClientEvent *)self deleteClientConversationTrace];
  }
  v21 = [(SISchemaClientEvent *)self deviceDynamicContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(SISchemaClientEvent *)self deleteDeviceDynamicContext];
  }
  v24 = [(SISchemaClientEvent *)self deviceFixedContext];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(SISchemaClientEvent *)self deleteDeviceFixedContext];
  }
  v27 = [(SISchemaClientEvent *)self dictationContext];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(SISchemaClientEvent *)self deleteDictationContext];
  }
  v30 = [(SISchemaClientEvent *)self invocation];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(SISchemaClientEvent *)self deleteInvocation];
  }
  v33 = [(SISchemaClientEvent *)self location];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(SISchemaClientEvent *)self deleteLocation];
  }
  v36 = [(SISchemaClientEvent *)self punchOut];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(SISchemaClientEvent *)self deletePunchOut];
  }
  v39 = [(SISchemaClientEvent *)self siriCue];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(SISchemaClientEvent *)self deleteSiriCue];
  }
  v42 = [(SISchemaClientEvent *)self uufrPresented];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(SISchemaClientEvent *)self deleteUufrPresented];
  }
  v45 = [(SISchemaClientEvent *)self speechTranscription];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(SISchemaClientEvent *)self deleteSpeechTranscription];
  }
  v48 = [(SISchemaClientEvent *)self textToSpeechBegin];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(SISchemaClientEvent *)self deleteTextToSpeechBegin];
  }
  v51 = [(SISchemaClientEvent *)self textToSpeechEnd];
  v52 = [v51 applySensitiveConditionsPolicy:v4];
  int v53 = [v52 suppressMessage];

  if (v53) {
    [(SISchemaClientEvent *)self deleteTextToSpeechEnd];
  }
  v54 = [(SISchemaClientEvent *)self uiStateTransition];
  v55 = [v54 applySensitiveConditionsPolicy:v4];
  int v56 = [v55 suppressMessage];

  if (v56) {
    [(SISchemaClientEvent *)self deleteUiStateTransition];
  }
  v57 = [(SISchemaClientEvent *)self clientFlow];
  v58 = [v57 applySensitiveConditionsPolicy:v4];
  int v59 = [v58 suppressMessage];

  if (v59) {
    [(SISchemaClientEvent *)self deleteClientFlow];
  }
  v60 = [(SISchemaClientEvent *)self dialogOutput];
  v61 = [v60 applySensitiveConditionsPolicy:v4];
  int v62 = [v61 suppressMessage];

  if (v62) {
    [(SISchemaClientEvent *)self deleteDialogOutput];
  }
  v63 = [(SISchemaClientEvent *)self dictationEndPointStop];
  v64 = [v63 applySensitiveConditionsPolicy:v4];
  int v65 = [v64 suppressMessage];

  if (v65) {
    [(SISchemaClientEvent *)self deleteDictationEndPointStop];
  }
  v66 = [(SISchemaClientEvent *)self dictationEndPointCancel];
  v67 = [v66 applySensitiveConditionsPolicy:v4];
  int v68 = [v67 suppressMessage];

  if (v68) {
    [(SISchemaClientEvent *)self deleteDictationEndPointCancel];
  }
  v69 = [(SISchemaClientEvent *)self dictationAlternativeSelected];
  v70 = [v69 applySensitiveConditionsPolicy:v4];
  int v71 = [v70 suppressMessage];

  if (v71) {
    [(SISchemaClientEvent *)self deleteDictationAlternativeSelected];
  }
  v72 = [(SISchemaClientEvent *)self dictationTranscriptionMetadata];
  v73 = [v72 applySensitiveConditionsPolicy:v4];
  int v74 = [v73 suppressMessage];

  if (v74) {
    [(SISchemaClientEvent *)self deleteDictationTranscriptionMetadata];
  }
  v75 = [(SISchemaClientEvent *)self carPlayHeadUnitContext];
  v76 = [v75 applySensitiveConditionsPolicy:v4];
  int v77 = [v76 suppressMessage];

  if (v77) {
    [(SISchemaClientEvent *)self deleteCarPlayHeadUnitContext];
  }
  v78 = [(SISchemaClientEvent *)self uufrCompletion];
  v79 = [v78 applySensitiveConditionsPolicy:v4];
  int v80 = [v79 suppressMessage];

  if (v80) {
    [(SISchemaClientEvent *)self deleteUufrCompletion];
  }
  v81 = [(SISchemaClientEvent *)self uufrShown];
  v82 = [v81 applySensitiveConditionsPolicy:v4];
  int v83 = [v82 suppressMessage];

  if (v83) {
    [(SISchemaClientEvent *)self deleteUufrShown];
  }
  v84 = [(SISchemaClientEvent *)self uufrSaid];
  v85 = [v84 applySensitiveConditionsPolicy:v4];
  int v86 = [v85 suppressMessage];

  if (v86) {
    [(SISchemaClientEvent *)self deleteUufrSaid];
  }
  v87 = [(SISchemaClientEvent *)self uufrFatalError];
  v88 = [v87 applySensitiveConditionsPolicy:v4];
  int v89 = [v88 suppressMessage];

  if (v89) {
    [(SISchemaClientEvent *)self deleteUufrFatalError];
  }
  v90 = [(SISchemaClientEvent *)self dictationAlternativesViewed];
  v91 = [v90 applySensitiveConditionsPolicy:v4];
  int v92 = [v91 suppressMessage];

  if (v92) {
    [(SISchemaClientEvent *)self deleteDictationAlternativesViewed];
  }
  v93 = [(SISchemaClientEvent *)self intercomMessageRecorded];
  v94 = [v93 applySensitiveConditionsPolicy:v4];
  int v95 = [v94 suppressMessage];

  if (v95) {
    [(SISchemaClientEvent *)self deleteIntercomMessageRecorded];
  }
  v96 = [(SISchemaClientEvent *)self casinoRelationship];
  v97 = [v96 applySensitiveConditionsPolicy:v4];
  int v98 = [v97 suppressMessage];

  if (v98) {
    [(SISchemaClientEvent *)self deleteCasinoRelationship];
  }
  v99 = [(SISchemaClientEvent *)self userViewRegionInteraction];
  v100 = [v99 applySensitiveConditionsPolicy:v4];
  int v101 = [v100 suppressMessage];

  if (v101) {
    [(SISchemaClientEvent *)self deleteUserViewRegionInteraction];
  }
  v102 = [(SISchemaClientEvent *)self deviceLockStateChanged];
  v103 = [v102 applySensitiveConditionsPolicy:v4];
  int v104 = [v103 suppressMessage];

  if (v104) {
    [(SISchemaClientEvent *)self deleteDeviceLockStateChanged];
  }
  v105 = [(SISchemaClientEvent *)self ueiRequestCategorization];
  v106 = [v105 applySensitiveConditionsPolicy:v4];
  int v107 = [v106 suppressMessage];

  if (v107) {
    [(SISchemaClientEvent *)self deleteUeiRequestCategorization];
  }
  v108 = [(SISchemaClientEvent *)self audioStopRecordingStarted];
  v109 = [v108 applySensitiveConditionsPolicy:v4];
  int v110 = [v109 suppressMessage];

  if (v110) {
    [(SISchemaClientEvent *)self deleteAudioStopRecordingStarted];
  }
  v111 = [(SISchemaClientEvent *)self ueiLaunchContext];
  v112 = [v111 applySensitiveConditionsPolicy:v4];
  int v113 = [v112 suppressMessage];

  if (v113) {
    [(SISchemaClientEvent *)self deleteUeiLaunchContext];
  }
  v114 = [(SISchemaClientEvent *)self ueiUserSpeakingContext];
  v115 = [v114 applySensitiveConditionsPolicy:v4];
  int v116 = [v115 suppressMessage];

  if (v116) {
    [(SISchemaClientEvent *)self deleteUeiUserSpeakingContext];
  }
  v117 = [(SISchemaClientEvent *)self ueiUUFRReady];
  v118 = [v117 applySensitiveConditionsPolicy:v4];
  int v119 = [v118 suppressMessage];

  if (v119) {
    [(SISchemaClientEvent *)self deleteUeiUUFRReady];
  }
  v120 = [(SISchemaClientEvent *)self ueiUIRenderingContext];
  v121 = [v120 applySensitiveConditionsPolicy:v4];
  int v122 = [v121 suppressMessage];

  if (v122) {
    [(SISchemaClientEvent *)self deleteUeiUIRenderingContext];
  }
  v123 = [(SISchemaClientEvent *)self pnrTextToSpeechRequestReceived];
  v124 = [v123 applySensitiveConditionsPolicy:v4];
  int v125 = [v124 suppressMessage];

  if (v125) {
    [(SISchemaClientEvent *)self deletePnrTextToSpeechRequestReceived];
  }
  v126 = [(SISchemaClientEvent *)self pnrSpeechRecognitionSourceContext];
  v127 = [v126 applySensitiveConditionsPolicy:v4];
  int v128 = [v127 suppressMessage];

  if (v128) {
    [(SISchemaClientEvent *)self deletePnrSpeechRecognitionSourceContext];
  }
  v129 = [(SISchemaClientEvent *)self pnrFatalError];
  v130 = [v129 applySensitiveConditionsPolicy:v4];
  int v131 = [v130 suppressMessage];

  if (v131) {
    [(SISchemaClientEvent *)self deletePnrFatalError];
  }
  v132 = [(SISchemaClientEvent *)self turnMTERequest];
  v133 = [v132 applySensitiveConditionsPolicy:v4];
  int v134 = [v133 suppressMessage];

  if (v134) {
    [(SISchemaClientEvent *)self deleteTurnMTERequest];
  }
  v135 = [(SISchemaClientEvent *)self keyboardDismissed];
  v136 = [v135 applySensitiveConditionsPolicy:v4];
  int v137 = [v136 suppressMessage];

  if (v137) {
    [(SISchemaClientEvent *)self deleteKeyboardDismissed];
  }
  v138 = [(SISchemaClientEvent *)self engagedAccessoryContext];
  v139 = [v138 applySensitiveConditionsPolicy:v4];
  int v140 = [v139 suppressMessage];

  if (v140) {
    [(SISchemaClientEvent *)self deleteEngagedAccessoryContext];
  }
  v141 = [(SISchemaClientEvent *)self announceCarPlayBannerTapped];
  v142 = [v141 applySensitiveConditionsPolicy:v4];
  int v143 = [v142 suppressMessage];

  if (v143) {
    [(SISchemaClientEvent *)self deleteAnnounceCarPlayBannerTapped];
  }
  v144 = [(SISchemaClientEvent *)self announceCarPlayGlyphSettingToggled];
  v145 = [v144 applySensitiveConditionsPolicy:v4];
  int v146 = [v145 suppressMessage];

  if (v146) {
    [(SISchemaClientEvent *)self deleteAnnounceCarPlayGlyphSettingToggled];
  }
  v147 = [(SISchemaClientEvent *)self dictationContentEdited];
  v148 = [v147 applySensitiveConditionsPolicy:v4];
  int v149 = [v148 suppressMessage];

  if (v149) {
    [(SISchemaClientEvent *)self deleteDictationContentEdited];
  }
  v150 = [(SISchemaClientEvent *)self uufrShownTier1];
  v151 = [v150 applySensitiveConditionsPolicy:v4];
  int v152 = [v151 suppressMessage];

  if (v152) {
    [(SISchemaClientEvent *)self deleteUufrShownTier1];
  }
  v153 = [(SISchemaClientEvent *)self ueiDictationPartialResultUpdated];
  v154 = [v153 applySensitiveConditionsPolicy:v4];
  int v155 = [v154 suppressMessage];

  if (v155) {
    [(SISchemaClientEvent *)self deleteUeiDictationPartialResultUpdated];
  }
  v156 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandExecuted];
  v157 = [v156 applySensitiveConditionsPolicy:v4];
  int v158 = [v157 suppressMessage];

  if (v158) {
    [(SISchemaClientEvent *)self deleteUeiDictationVoiceCommandExecuted];
  }
  v159 = [(SISchemaClientEvent *)self ueiDictationInputModeSwitchContext];
  v160 = [v159 applySensitiveConditionsPolicy:v4];
  int v161 = [v160 suppressMessage];

  if (v161) {
    [(SISchemaClientEvent *)self deleteUeiDictationInputModeSwitchContext];
  }
  v162 = [(SISchemaClientEvent *)self ueiDictationToolTipDisplayContext];
  v163 = [v162 applySensitiveConditionsPolicy:v4];
  int v164 = [v163 suppressMessage];

  if (v164) {
    [(SISchemaClientEvent *)self deleteUeiDictationToolTipDisplayContext];
  }
  v165 = [(SISchemaClientEvent *)self hostPlatformViewAppearContext];
  v166 = [v165 applySensitiveConditionsPolicy:v4];
  int v167 = [v166 suppressMessage];

  if (v167) {
    [(SISchemaClientEvent *)self deleteHostPlatformViewAppearContext];
  }
  v168 = [(SISchemaClientEvent *)self hostPlatformViewDisappearContext];
  v169 = [v168 applySensitiveConditionsPolicy:v4];
  int v170 = [v169 suppressMessage];

  if (v170) {
    [(SISchemaClientEvent *)self deleteHostPlatformViewDisappearContext];
  }
  v171 = [(SISchemaClientEvent *)self ueiDictationTranscriptionTokenized];
  v172 = [v171 applySensitiveConditionsPolicy:v4];
  int v173 = [v172 suppressMessage];

  if (v173) {
    [(SISchemaClientEvent *)self deleteUeiDictationTranscriptionTokenized];
  }
  v174 = [(SISchemaClientEvent *)self dictationAlternativesSelected];
  v175 = [v174 applySensitiveConditionsPolicy:v4];
  int v176 = [v175 suppressMessage];

  if (v176) {
    [(SISchemaClientEvent *)self deleteDictationAlternativesSelected];
  }
  v177 = [(SISchemaClientEvent *)self uufrSelected];
  v178 = [v177 applySensitiveConditionsPolicy:v4];
  int v179 = [v178 suppressMessage];

  if (v179) {
    [(SISchemaClientEvent *)self deleteUufrSelected];
  }
  v180 = [(SISchemaClientEvent *)self ueiDictationAlternativeTextPairsSelected];
  v181 = [v180 applySensitiveConditionsPolicy:v4];
  int v182 = [v181 suppressMessage];

  if (v182) {
    [(SISchemaClientEvent *)self deleteUeiDictationAlternativeTextPairsSelected];
  }
  v183 = [(SISchemaClientEvent *)self ueiUserBargeInDetected];
  v184 = [v183 applySensitiveConditionsPolicy:v4];
  int v185 = [v184 suppressMessage];

  if (v185) {
    [(SISchemaClientEvent *)self deleteUeiUserBargeInDetected];
  }
  v186 = [(SISchemaClientEvent *)self ueiDictationEnablementPromptShown];
  v187 = [v186 applySensitiveConditionsPolicy:v4];
  int v188 = [v187 suppressMessage];

  if (v188) {
    [(SISchemaClientEvent *)self deleteUeiDictationEnablementPromptShown];
  }
  v189 = [(SISchemaClientEvent *)self ueiSiriCarCommandContext];
  v190 = [v189 applySensitiveConditionsPolicy:v4];
  int v191 = [v190 suppressMessage];

  if (v191) {
    [(SISchemaClientEvent *)self deleteUeiSiriCarCommandContext];
  }
  v192 = [(SISchemaClientEvent *)self ueiVisionSnippetDismissed];
  v193 = [v192 applySensitiveConditionsPolicy:v4];
  int v194 = [v193 suppressMessage];

  if (v194) {
    [(SISchemaClientEvent *)self deleteUeiVisionSnippetDismissed];
  }
  v195 = [(SISchemaClientEvent *)self ueiSiriWasUnavailable];
  v196 = [v195 applySensitiveConditionsPolicy:v4];
  int v197 = [v196 suppressMessage];

  if (v197) {
    [(SISchemaClientEvent *)self deleteUeiSiriWasUnavailable];
  }
  v198 = [(SISchemaClientEvent *)self preferredAudioRouteChanged];
  v199 = [v198 applySensitiveConditionsPolicy:v4];
  int v200 = [v199 suppressMessage];

  if (v200) {
    [(SISchemaClientEvent *)self deletePreferredAudioRouteChanged];
  }
  v201 = [(SISchemaClientEvent *)self ueiDictationContentEditedTier1];
  v202 = [v201 applySensitiveConditionsPolicy:v4];
  int v203 = [v202 suppressMessage];

  if (v203) {
    [(SISchemaClientEvent *)self deleteUeiDictationContentEditedTier1];
  }
  v204 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandUndoTapAction];
  v205 = [v204 applySensitiveConditionsPolicy:v4];
  int v206 = [v205 suppressMessage];

  if (v206) {
    [(SISchemaClientEvent *)self deleteUeiDictationVoiceCommandUndoTapAction];
  }
  v207 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandDisambiguationAction];
  v208 = [v207 applySensitiveConditionsPolicy:v4];
  int v209 = [v208 suppressMessage];

  if (v209) {
    [(SISchemaClientEvent *)self deleteUeiDictationVoiceCommandDisambiguationAction];
  }
  v210 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandKeyboardAction];
  v211 = [v210 applySensitiveConditionsPolicy:v4];
  int v212 = [v211 suppressMessage];

  if (v212) {
    [(SISchemaClientEvent *)self deleteUeiDictationVoiceCommandKeyboardAction];
  }
  v213 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEvent];
  v214 = [v213 applySensitiveConditionsPolicy:v4];
  int v215 = [v214 suppressMessage];

  if (v215) {
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidAlternativesEvent];
  }
  v216 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEventTier1];
  v217 = [v216 applySensitiveConditionsPolicy:v4];
  int v218 = [v217 suppressMessage];

  if (v218) {
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidAlternativesEventTier1];
  }
  v219 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelected];
  v220 = [v219 applySensitiveConditionsPolicy:v4];
  int v221 = [v220 suppressMessage];

  if (v221) {
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidSpeechAlternativesSelected];
  }
  v222 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelectedTier1];
  v223 = [v222 applySensitiveConditionsPolicy:v4];
  int v224 = [v223 suppressMessage];

  if (v224) {
    [(SISchemaClientEvent *)self deleteUeiDictationEuclidSpeechAlternativesSelectedTier1];
  }
  v225 = [(SISchemaClientEvent *)self typingRequestTrace];
  v226 = [v225 applySensitiveConditionsPolicy:v4];
  int v227 = [v226 suppressMessage];

  if (v227) {
    [(SISchemaClientEvent *)self deleteTypingRequestTrace];
  }
  v228 = [(SISchemaClientEvent *)self ueiInvocationTier1];
  v229 = [v228 applySensitiveConditionsPolicy:v4];
  int v230 = [v229 suppressMessage];

  if (v230) {
    [(SISchemaClientEvent *)self deleteUeiInvocationTier1];
  }
  id v231 = v5;

  return v231;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(SISchemaClientEvent *)self whichEvent_Type];
  id v4 = 0;
  unint64_t v5 = v3 - 101;
  v6 = &OBJC_IVAR___SISchemaClientEvent__audioFirstBufferRecorded;
  switch(v5)
  {
    case 0uLL:
      goto LABEL_74;
    case 1uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__audioStopRecording;
      goto LABEL_74;
    case 2uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__clientConversationTrace;
      goto LABEL_74;
    case 3uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__deviceDynamicContext;
      goto LABEL_74;
    case 4uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__deviceFixedContext;
      goto LABEL_74;
    case 5uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__dictationContext;
      goto LABEL_74;
    case 6uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__invocation;
      goto LABEL_74;
    case 7uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__location;
      goto LABEL_74;
    case 8uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__punchOut;
      goto LABEL_74;
    case 0xAuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__siriCue;
      goto LABEL_74;
    case 0xBuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__uufrPresented;
      goto LABEL_74;
    case 0xCuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__speechTranscription;
      goto LABEL_74;
    case 0xDuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__textToSpeechBegin;
      goto LABEL_74;
    case 0xEuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__textToSpeechEnd;
      goto LABEL_74;
    case 0xFuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__uiStateTransition;
      goto LABEL_74;
    case 0x10uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__clientFlow;
      goto LABEL_74;
    case 0x11uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__dialogOutput;
      goto LABEL_74;
    case 0x12uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__dictationEndPointStop;
      goto LABEL_74;
    case 0x13uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__dictationEndPointCancel;
      goto LABEL_74;
    case 0x14uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__dictationAlternativeSelected;
      goto LABEL_74;
    case 0x15uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__dictationTranscriptionMetadata;
      goto LABEL_74;
    case 0x16uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__carPlayHeadUnitContext;
      goto LABEL_74;
    case 0x17uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__uufrCompletion;
      goto LABEL_74;
    case 0x18uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__uufrShown;
      goto LABEL_74;
    case 0x19uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__uufrSaid;
      goto LABEL_74;
    case 0x1AuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__uufrFatalError;
      goto LABEL_74;
    case 0x1BuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__dictationAlternativesViewed;
      goto LABEL_74;
    case 0x1CuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__intercomMessageRecorded;
      goto LABEL_74;
    case 0x1DuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__casinoRelationship;
      goto LABEL_74;
    case 0x1EuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__userViewRegionInteraction;
      goto LABEL_74;
    case 0x1FuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__deviceLockStateChanged;
      goto LABEL_74;
    case 0x20uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiRequestCategorization;
      goto LABEL_74;
    case 0x21uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__audioStopRecordingStarted;
      goto LABEL_74;
    case 0x22uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiLaunchContext;
      goto LABEL_74;
    case 0x23uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiUserSpeakingContext;
      goto LABEL_74;
    case 0x24uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiUUFRReady;
      goto LABEL_74;
    case 0x25uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiUIRenderingContext;
      goto LABEL_74;
    case 0x26uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__pnrTextToSpeechRequestReceived;
      goto LABEL_74;
    case 0x27uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__pnrSpeechRecognitionSourceContext;
      goto LABEL_74;
    case 0x28uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__pnrFatalError;
      goto LABEL_74;
    case 0x29uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__turnMTERequest;
      goto LABEL_74;
    case 0x2AuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__keyboardDismissed;
      goto LABEL_74;
    case 0x2BuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__engagedAccessoryContext;
      goto LABEL_74;
    case 0x2CuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__announceCarPlayBannerTapped;
      goto LABEL_74;
    case 0x2DuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__announceCarPlayGlyphSettingToggled;
      goto LABEL_74;
    case 0x2EuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__dictationContentEdited;
      goto LABEL_74;
    case 0x2FuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__uufrShownTier1;
      goto LABEL_74;
    case 0x31uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationPartialResultUpdated;
      goto LABEL_74;
    case 0x32uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationVoiceCommandExecuted;
      goto LABEL_74;
    case 0x33uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationInputModeSwitchContext;
      goto LABEL_74;
    case 0x34uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationToolTipDisplayContext;
      goto LABEL_74;
    case 0x35uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__hostPlatformViewAppearContext;
      goto LABEL_74;
    case 0x36uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__hostPlatformViewDisappearContext;
      goto LABEL_74;
    case 0x37uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationTranscriptionTokenized;
      goto LABEL_74;
    case 0x38uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__dictationAlternativesSelected;
      goto LABEL_74;
    case 0x39uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__uufrSelected;
      goto LABEL_74;
    case 0x3AuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationAlternativeTextPairsSelected;
      goto LABEL_74;
    case 0x3BuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiUserBargeInDetected;
      goto LABEL_74;
    case 0x3CuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationEnablementPromptShown;
      goto LABEL_74;
    case 0x3DuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiSiriCarCommandContext;
      goto LABEL_74;
    case 0x3EuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiVisionSnippetDismissed;
      goto LABEL_74;
    case 0x3FuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiSiriWasUnavailable;
      goto LABEL_74;
    case 0x40uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__preferredAudioRouteChanged;
      goto LABEL_74;
    case 0x41uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationContentEditedTier1;
      goto LABEL_74;
    case 0x42uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationVoiceCommandUndoTapAction;
      goto LABEL_74;
    case 0x43uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationVoiceCommandDisambiguationAction;
      goto LABEL_74;
    case 0x44uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationVoiceCommandKeyboardAction;
      goto LABEL_74;
    case 0x45uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationEuclidAlternativesEvent;
      goto LABEL_74;
    case 0x46uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationEuclidAlternativesEventTier1;
      goto LABEL_74;
    case 0x47uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationEuclidSpeechAlternativesSelected;
      goto LABEL_74;
    case 0x48uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationEuclidSpeechAlternativesSelectedTier1;
      goto LABEL_74;
    case 0x49uLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__typingRequestTrace;
      goto LABEL_74;
    case 0x4AuLL:
      v6 = &OBJC_IVAR___SISchemaClientEvent__ueiInvocationTier1;
LABEL_74:
      id v4 = *(id *)((char *)&self->super.super.super.super.isa + *v6);
      break;
    default:
      break;
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0x4A) {
    return 0;
  }
  else {
    return off_1E5EAA190[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ueiInvocationTier1, 0);
  objc_storeStrong((id *)&self->_typingRequestTrace, 0);
  objc_storeStrong((id *)&self->_ueiDictationEuclidSpeechAlternativesSelectedTier1, 0);
  objc_storeStrong((id *)&self->_ueiDictationEuclidSpeechAlternativesSelected, 0);
  objc_storeStrong((id *)&self->_ueiDictationEuclidAlternativesEventTier1, 0);
  objc_storeStrong((id *)&self->_ueiDictationEuclidAlternativesEvent, 0);
  objc_storeStrong((id *)&self->_ueiDictationVoiceCommandKeyboardAction, 0);
  objc_storeStrong((id *)&self->_ueiDictationVoiceCommandDisambiguationAction, 0);
  objc_storeStrong((id *)&self->_ueiDictationVoiceCommandUndoTapAction, 0);
  objc_storeStrong((id *)&self->_ueiDictationContentEditedTier1, 0);
  objc_storeStrong((id *)&self->_preferredAudioRouteChanged, 0);
  objc_storeStrong((id *)&self->_ueiSiriWasUnavailable, 0);
  objc_storeStrong((id *)&self->_ueiVisionSnippetDismissed, 0);
  objc_storeStrong((id *)&self->_ueiSiriCarCommandContext, 0);
  objc_storeStrong((id *)&self->_ueiDictationEnablementPromptShown, 0);
  objc_storeStrong((id *)&self->_ueiUserBargeInDetected, 0);
  objc_storeStrong((id *)&self->_ueiDictationAlternativeTextPairsSelected, 0);
  objc_storeStrong((id *)&self->_uufrSelected, 0);
  objc_storeStrong((id *)&self->_dictationAlternativesSelected, 0);
  objc_storeStrong((id *)&self->_ueiDictationTranscriptionTokenized, 0);
  objc_storeStrong((id *)&self->_hostPlatformViewDisappearContext, 0);
  objc_storeStrong((id *)&self->_hostPlatformViewAppearContext, 0);
  objc_storeStrong((id *)&self->_ueiDictationToolTipDisplayContext, 0);
  objc_storeStrong((id *)&self->_ueiDictationInputModeSwitchContext, 0);
  objc_storeStrong((id *)&self->_ueiDictationVoiceCommandExecuted, 0);
  objc_storeStrong((id *)&self->_ueiDictationPartialResultUpdated, 0);
  objc_storeStrong((id *)&self->_uufrShownTier1, 0);
  objc_storeStrong((id *)&self->_dictationContentEdited, 0);
  objc_storeStrong((id *)&self->_announceCarPlayGlyphSettingToggled, 0);
  objc_storeStrong((id *)&self->_announceCarPlayBannerTapped, 0);
  objc_storeStrong((id *)&self->_engagedAccessoryContext, 0);
  objc_storeStrong((id *)&self->_keyboardDismissed, 0);
  objc_storeStrong((id *)&self->_turnMTERequest, 0);
  objc_storeStrong((id *)&self->_pnrFatalError, 0);
  objc_storeStrong((id *)&self->_pnrSpeechRecognitionSourceContext, 0);
  objc_storeStrong((id *)&self->_pnrTextToSpeechRequestReceived, 0);
  objc_storeStrong((id *)&self->_ueiUIRenderingContext, 0);
  objc_storeStrong((id *)&self->_ueiUUFRReady, 0);
  objc_storeStrong((id *)&self->_ueiUserSpeakingContext, 0);
  objc_storeStrong((id *)&self->_ueiLaunchContext, 0);
  objc_storeStrong((id *)&self->_audioStopRecordingStarted, 0);
  objc_storeStrong((id *)&self->_ueiRequestCategorization, 0);
  objc_storeStrong((id *)&self->_deviceLockStateChanged, 0);
  objc_storeStrong((id *)&self->_userViewRegionInteraction, 0);
  objc_storeStrong((id *)&self->_casinoRelationship, 0);
  objc_storeStrong((id *)&self->_intercomMessageRecorded, 0);
  objc_storeStrong((id *)&self->_dictationAlternativesViewed, 0);
  objc_storeStrong((id *)&self->_uufrFatalError, 0);
  objc_storeStrong((id *)&self->_uufrSaid, 0);
  objc_storeStrong((id *)&self->_uufrShown, 0);
  objc_storeStrong((id *)&self->_uufrCompletion, 0);
  objc_storeStrong((id *)&self->_carPlayHeadUnitContext, 0);
  objc_storeStrong((id *)&self->_dictationTranscriptionMetadata, 0);
  objc_storeStrong((id *)&self->_dictationAlternativeSelected, 0);
  objc_storeStrong((id *)&self->_dictationEndPointCancel, 0);
  objc_storeStrong((id *)&self->_dictationEndPointStop, 0);
  objc_storeStrong((id *)&self->_dialogOutput, 0);
  objc_storeStrong((id *)&self->_clientFlow, 0);
  objc_storeStrong((id *)&self->_uiStateTransition, 0);
  objc_storeStrong((id *)&self->_textToSpeechEnd, 0);
  objc_storeStrong((id *)&self->_textToSpeechBegin, 0);
  objc_storeStrong((id *)&self->_speechTranscription, 0);
  objc_storeStrong((id *)&self->_uufrPresented, 0);
  objc_storeStrong((id *)&self->_siriCue, 0);
  objc_storeStrong((id *)&self->_punchOut, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_invocation, 0);
  objc_storeStrong((id *)&self->_dictationContext, 0);
  objc_storeStrong((id *)&self->_deviceFixedContext, 0);
  objc_storeStrong((id *)&self->_deviceDynamicContext, 0);
  objc_storeStrong((id *)&self->_clientConversationTrace, 0);
  objc_storeStrong((id *)&self->_audioStopRecording, 0);
  objc_storeStrong((id *)&self->_audioFirstBufferRecorded, 0);
  objc_storeStrong((id *)&self->_transportMetadata, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasUeiInvocationTier1:(BOOL)a3
{
  self->_hasUeiInvocationTier1 = a3;
}

- (BOOL)hasUeiInvocationTier1
{
  return self->_hasUeiInvocationTier1;
}

- (void)setHasTypingRequestTrace:(BOOL)a3
{
  self->_hasTypingRequestTrace = a3;
}

- (BOOL)hasTypingRequestTrace
{
  return self->_hasTypingRequestTrace;
}

- (void)setHasUeiDictationEuclidSpeechAlternativesSelectedTier1:(BOOL)a3
{
  self->_hasUeiDictationEuclidSpeechAlternativesSelectedTier1 = a3;
}

- (BOOL)hasUeiDictationEuclidSpeechAlternativesSelectedTier1
{
  return self->_hasUeiDictationEuclidSpeechAlternativesSelectedTier1;
}

- (void)setHasUeiDictationEuclidSpeechAlternativesSelected:(BOOL)a3
{
  self->_hasUeiDictationEuclidSpeechAlternativesSelected = a3;
}

- (BOOL)hasUeiDictationEuclidSpeechAlternativesSelected
{
  return self->_hasUeiDictationEuclidSpeechAlternativesSelected;
}

- (void)setHasUeiDictationEuclidAlternativesEventTier1:(BOOL)a3
{
  self->_hasUeiDictationEuclidAlternativesEventTier1 = a3;
}

- (BOOL)hasUeiDictationEuclidAlternativesEventTier1
{
  return self->_hasUeiDictationEuclidAlternativesEventTier1;
}

- (void)setHasUeiDictationEuclidAlternativesEvent:(BOOL)a3
{
  self->_hasUeiDictationEuclidAlternativesEvent = a3;
}

- (BOOL)hasUeiDictationEuclidAlternativesEvent
{
  return self->_hasUeiDictationEuclidAlternativesEvent;
}

- (void)setHasUeiDictationVoiceCommandKeyboardAction:(BOOL)a3
{
  self->_hasUeiDictationVoiceCommandKeyboardAction = a3;
}

- (BOOL)hasUeiDictationVoiceCommandKeyboardAction
{
  return self->_hasUeiDictationVoiceCommandKeyboardAction;
}

- (void)setHasUeiDictationVoiceCommandDisambiguationAction:(BOOL)a3
{
  self->_hasUeiDictationVoiceCommandDisambiguationAction = a3;
}

- (BOOL)hasUeiDictationVoiceCommandDisambiguationAction
{
  return self->_hasUeiDictationVoiceCommandDisambiguationAction;
}

- (void)setHasUeiDictationVoiceCommandUndoTapAction:(BOOL)a3
{
  self->_hasUeiDictationVoiceCommandUndoTapAction = a3;
}

- (BOOL)hasUeiDictationVoiceCommandUndoTapAction
{
  return self->_hasUeiDictationVoiceCommandUndoTapAction;
}

- (void)setHasUeiDictationContentEditedTier1:(BOOL)a3
{
  self->_hasUeiDictationContentEditedTier1 = a3;
}

- (BOOL)hasUeiDictationContentEditedTier1
{
  return self->_hasUeiDictationContentEditedTier1;
}

- (void)setHasPreferredAudioRouteChanged:(BOOL)a3
{
  self->_hasPreferredAudioRouteChanged = a3;
}

- (BOOL)hasPreferredAudioRouteChanged
{
  return self->_hasPreferredAudioRouteChanged;
}

- (void)setHasUeiSiriWasUnavailable:(BOOL)a3
{
  self->_hasUeiSiriWasUnavailable = a3;
}

- (BOOL)hasUeiSiriWasUnavailable
{
  return self->_hasUeiSiriWasUnavailable;
}

- (void)setHasUeiVisionSnippetDismissed:(BOOL)a3
{
  self->_hasUeiVisionSnippetDismissed = a3;
}

- (BOOL)hasUeiVisionSnippetDismissed
{
  return self->_hasUeiVisionSnippetDismissed;
}

- (void)setHasUeiSiriCarCommandContext:(BOOL)a3
{
  self->_hasUeiSiriCarCommandContext = a3;
}

- (BOOL)hasUeiSiriCarCommandContext
{
  return self->_hasUeiSiriCarCommandContext;
}

- (void)setHasUeiDictationEnablementPromptShown:(BOOL)a3
{
  self->_hasUeiDictationEnablementPromptShown = a3;
}

- (BOOL)hasUeiDictationEnablementPromptShown
{
  return self->_hasUeiDictationEnablementPromptShown;
}

- (void)setHasUeiUserBargeInDetected:(BOOL)a3
{
  self->_hasUeiUserBargeInDetected = a3;
}

- (BOOL)hasUeiUserBargeInDetected
{
  return self->_hasUeiUserBargeInDetected;
}

- (void)setHasUeiDictationAlternativeTextPairsSelected:(BOOL)a3
{
  self->_hasUeiDictationAlternativeTextPairsSelected = a3;
}

- (BOOL)hasUeiDictationAlternativeTextPairsSelected
{
  return self->_hasUeiDictationAlternativeTextPairsSelected;
}

- (void)setHasUufrSelected:(BOOL)a3
{
  self->_hasUufrSelected = a3;
}

- (BOOL)hasUufrSelected
{
  return self->_hasUufrSelected;
}

- (void)setHasDictationAlternativesSelected:(BOOL)a3
{
  self->_hasDictationAlternativesSelected = a3;
}

- (BOOL)hasDictationAlternativesSelected
{
  return self->_hasDictationAlternativesSelected;
}

- (void)setHasUeiDictationTranscriptionTokenized:(BOOL)a3
{
  self->_hasUeiDictationTranscriptionTokenized = a3;
}

- (BOOL)hasUeiDictationTranscriptionTokenized
{
  return self->_hasUeiDictationTranscriptionTokenized;
}

- (void)setHasHostPlatformViewDisappearContext:(BOOL)a3
{
  self->_hasHostPlatformViewDisappearContext = a3;
}

- (BOOL)hasHostPlatformViewDisappearContext
{
  return self->_hasHostPlatformViewDisappearContext;
}

- (void)setHasHostPlatformViewAppearContext:(BOOL)a3
{
  self->_hasHostPlatformViewAppearContext = a3;
}

- (BOOL)hasHostPlatformViewAppearContext
{
  return self->_hasHostPlatformViewAppearContext;
}

- (void)setHasUeiDictationToolTipDisplayContext:(BOOL)a3
{
  self->_hasUeiDictationToolTipDisplayContext = a3;
}

- (BOOL)hasUeiDictationToolTipDisplayContext
{
  return self->_hasUeiDictationToolTipDisplayContext;
}

- (void)setHasUeiDictationInputModeSwitchContext:(BOOL)a3
{
  self->_hasUeiDictationInputModeSwitchContext = a3;
}

- (BOOL)hasUeiDictationInputModeSwitchContext
{
  return self->_hasUeiDictationInputModeSwitchContext;
}

- (void)setHasUeiDictationVoiceCommandExecuted:(BOOL)a3
{
  self->_hasUeiDictationVoiceCommandExecuted = a3;
}

- (BOOL)hasUeiDictationVoiceCommandExecuted
{
  return self->_hasUeiDictationVoiceCommandExecuted;
}

- (void)setHasUeiDictationPartialResultUpdated:(BOOL)a3
{
  self->_hasUeiDictationPartialResultUpdated = a3;
}

- (BOOL)hasUeiDictationPartialResultUpdated
{
  return self->_hasUeiDictationPartialResultUpdated;
}

- (void)setHasUufrShownTier1:(BOOL)a3
{
  self->_hasUufrShownTier1 = a3;
}

- (BOOL)hasUufrShownTier1
{
  return self->_hasUufrShownTier1;
}

- (void)setHasDictationContentEdited:(BOOL)a3
{
  self->_hasDictationContentEdited = a3;
}

- (BOOL)hasDictationContentEdited
{
  return self->_hasDictationContentEdited;
}

- (void)setHasAnnounceCarPlayGlyphSettingToggled:(BOOL)a3
{
  self->_hasAnnounceCarPlayGlyphSettingToggled = a3;
}

- (BOOL)hasAnnounceCarPlayGlyphSettingToggled
{
  return self->_hasAnnounceCarPlayGlyphSettingToggled;
}

- (void)setHasAnnounceCarPlayBannerTapped:(BOOL)a3
{
  self->_hasAnnounceCarPlayBannerTapped = a3;
}

- (BOOL)hasAnnounceCarPlayBannerTapped
{
  return self->_hasAnnounceCarPlayBannerTapped;
}

- (void)setHasEngagedAccessoryContext:(BOOL)a3
{
  self->_hasEngagedAccessoryContext = a3;
}

- (BOOL)hasEngagedAccessoryContext
{
  return self->_hasEngagedAccessoryContext;
}

- (void)setHasKeyboardDismissed:(BOOL)a3
{
  self->_hasKeyboardDismissed = a3;
}

- (BOOL)hasKeyboardDismissed
{
  return self->_hasKeyboardDismissed;
}

- (void)setHasTurnMTERequest:(BOOL)a3
{
  self->_hasTurnMTERequest = a3;
}

- (BOOL)hasTurnMTERequest
{
  return self->_hasTurnMTERequest;
}

- (void)setHasPnrFatalError:(BOOL)a3
{
  self->_hasPnrFatalError = a3;
}

- (BOOL)hasPnrFatalError
{
  return self->_hasPnrFatalError;
}

- (void)setHasPnrSpeechRecognitionSourceContext:(BOOL)a3
{
  self->_hasPnrSpeechRecognitionSourceContext = a3;
}

- (BOOL)hasPnrSpeechRecognitionSourceContext
{
  return self->_hasPnrSpeechRecognitionSourceContext;
}

- (void)setHasPnrTextToSpeechRequestReceived:(BOOL)a3
{
  self->_hasPnrTextToSpeechRequestReceived = a3;
}

- (BOOL)hasPnrTextToSpeechRequestReceived
{
  return self->_hasPnrTextToSpeechRequestReceived;
}

- (void)setHasUeiUIRenderingContext:(BOOL)a3
{
  self->_hasUeiUIRenderingContext = a3;
}

- (BOOL)hasUeiUIRenderingContext
{
  return self->_hasUeiUIRenderingContext;
}

- (void)setHasUeiUUFRReady:(BOOL)a3
{
  self->_hasUeiUUFRReady = a3;
}

- (BOOL)hasUeiUUFRReady
{
  return self->_hasUeiUUFRReady;
}

- (void)setHasUeiUserSpeakingContext:(BOOL)a3
{
  self->_hasUeiUserSpeakingContext = a3;
}

- (BOOL)hasUeiUserSpeakingContext
{
  return self->_hasUeiUserSpeakingContext;
}

- (void)setHasUeiLaunchContext:(BOOL)a3
{
  self->_hasUeiLaunchContext = a3;
}

- (BOOL)hasUeiLaunchContext
{
  return self->_hasUeiLaunchContext;
}

- (void)setHasAudioStopRecordingStarted:(BOOL)a3
{
  self->_hasAudioStopRecordingStarted = a3;
}

- (BOOL)hasAudioStopRecordingStarted
{
  return self->_hasAudioStopRecordingStarted;
}

- (void)setHasUeiRequestCategorization:(BOOL)a3
{
  self->_hasUeiRequestCategorization = a3;
}

- (BOOL)hasUeiRequestCategorization
{
  return self->_hasUeiRequestCategorization;
}

- (void)setHasDeviceLockStateChanged:(BOOL)a3
{
  self->_hasDeviceLockStateChanged = a3;
}

- (BOOL)hasDeviceLockStateChanged
{
  return self->_hasDeviceLockStateChanged;
}

- (void)setHasUserViewRegionInteraction:(BOOL)a3
{
  self->_hasUserViewRegionInteraction = a3;
}

- (BOOL)hasUserViewRegionInteraction
{
  return self->_hasUserViewRegionInteraction;
}

- (void)setHasCasinoRelationship:(BOOL)a3
{
  self->_hasCasinoRelationship = a3;
}

- (BOOL)hasCasinoRelationship
{
  return self->_hasCasinoRelationship;
}

- (void)setHasIntercomMessageRecorded:(BOOL)a3
{
  self->_hasIntercomMessageRecorded = a3;
}

- (BOOL)hasIntercomMessageRecorded
{
  return self->_hasIntercomMessageRecorded;
}

- (void)setHasDictationAlternativesViewed:(BOOL)a3
{
  self->_hasDictationAlternativesViewed = a3;
}

- (BOOL)hasDictationAlternativesViewed
{
  return self->_hasDictationAlternativesViewed;
}

- (void)setHasUufrFatalError:(BOOL)a3
{
  self->_hasUufrFatalError = a3;
}

- (BOOL)hasUufrFatalError
{
  return self->_hasUufrFatalError;
}

- (void)setHasUufrSaid:(BOOL)a3
{
  self->_hasUufrSaid = a3;
}

- (BOOL)hasUufrSaid
{
  return self->_hasUufrSaid;
}

- (void)setHasUufrShown:(BOOL)a3
{
  self->_hasUufrShown = a3;
}

- (BOOL)hasUufrShown
{
  return self->_hasUufrShown;
}

- (void)setHasUufrCompletion:(BOOL)a3
{
  self->_hasUufrCompletion = a3;
}

- (BOOL)hasUufrCompletion
{
  return self->_hasUufrCompletion;
}

- (void)setHasCarPlayHeadUnitContext:(BOOL)a3
{
  self->_hasCarPlayHeadUnitContext = a3;
}

- (BOOL)hasCarPlayHeadUnitContext
{
  return self->_hasCarPlayHeadUnitContext;
}

- (void)setHasDictationTranscriptionMetadata:(BOOL)a3
{
  self->_hasDictationTranscriptionMetadata = a3;
}

- (BOOL)hasDictationTranscriptionMetadata
{
  return self->_hasDictationTranscriptionMetadata;
}

- (void)setHasDictationAlternativeSelected:(BOOL)a3
{
  self->_hasDictationAlternativeSelected = a3;
}

- (BOOL)hasDictationAlternativeSelected
{
  return self->_hasDictationAlternativeSelected;
}

- (void)setHasDictationEndPointCancel:(BOOL)a3
{
  self->_hasDictationEndPointCancel = a3;
}

- (BOOL)hasDictationEndPointCancel
{
  return self->_hasDictationEndPointCancel;
}

- (void)setHasDictationEndPointStop:(BOOL)a3
{
  self->_hasDictationEndPointStop = a3;
}

- (BOOL)hasDictationEndPointStop
{
  return self->_hasDictationEndPointStop;
}

- (void)setHasDialogOutput:(BOOL)a3
{
  self->_hasDialogOutput = a3;
}

- (BOOL)hasDialogOutput
{
  return self->_hasDialogOutput;
}

- (void)setHasClientFlow:(BOOL)a3
{
  self->_hasClientFlow = a3;
}

- (BOOL)hasClientFlow
{
  return self->_hasClientFlow;
}

- (void)setHasUiStateTransition:(BOOL)a3
{
  self->_hasUiStateTransition = a3;
}

- (BOOL)hasUiStateTransition
{
  return self->_hasUiStateTransition;
}

- (void)setHasTextToSpeechEnd:(BOOL)a3
{
  self->_hasTextToSpeechEnd = a3;
}

- (BOOL)hasTextToSpeechEnd
{
  return self->_hasTextToSpeechEnd;
}

- (void)setHasTextToSpeechBegin:(BOOL)a3
{
  self->_hasTextToSpeechBegin = a3;
}

- (BOOL)hasTextToSpeechBegin
{
  return self->_hasTextToSpeechBegin;
}

- (void)setHasSpeechTranscription:(BOOL)a3
{
  self->_hasSpeechTranscription = a3;
}

- (BOOL)hasSpeechTranscription
{
  return self->_hasSpeechTranscription;
}

- (void)setHasUufrPresented:(BOOL)a3
{
  self->_hasUufrPresented = a3;
}

- (BOOL)hasUufrPresented
{
  return self->_hasUufrPresented;
}

- (void)setHasSiriCue:(BOOL)a3
{
  self->_hasSiriCue = a3;
}

- (BOOL)hasSiriCue
{
  return self->_hasSiriCue;
}

- (void)setHasPunchOut:(BOOL)a3
{
  self->_hasPunchOut = a3;
}

- (BOOL)hasPunchOut
{
  return self->_hasPunchOut;
}

- (void)setHasLocation:(BOOL)a3
{
  self->_hasLocation = a3;
}

- (BOOL)hasLocation
{
  return self->_hasLocation;
}

- (void)setHasInvocation:(BOOL)a3
{
  self->_hasInvocation = a3;
}

- (BOOL)hasInvocation
{
  return self->_hasInvocation;
}

- (void)setHasDictationContext:(BOOL)a3
{
  self->_hasDictationContext = a3;
}

- (BOOL)hasDictationContext
{
  return self->_hasDictationContext;
}

- (void)setHasDeviceFixedContext:(BOOL)a3
{
  self->_hasDeviceFixedContext = a3;
}

- (BOOL)hasDeviceFixedContext
{
  return self->_hasDeviceFixedContext;
}

- (void)setHasDeviceDynamicContext:(BOOL)a3
{
  self->_hasDeviceDynamicContext = a3;
}

- (BOOL)hasDeviceDynamicContext
{
  return self->_hasDeviceDynamicContext;
}

- (void)setHasClientConversationTrace:(BOOL)a3
{
  self->_hasClientConversationTrace = a3;
}

- (BOOL)hasClientConversationTrace
{
  return self->_hasClientConversationTrace;
}

- (void)setHasAudioStopRecording:(BOOL)a3
{
  self->_hasAudioStopRecording = a3;
}

- (BOOL)hasAudioStopRecording
{
  return self->_hasAudioStopRecording;
}

- (void)setHasAudioFirstBufferRecorded:(BOOL)a3
{
  self->_hasAudioFirstBufferRecorded = a3;
}

- (BOOL)hasAudioFirstBufferRecorded
{
  return self->_hasAudioFirstBufferRecorded;
}

- (void)setHasTransportMetadata:(BOOL)a3
{
  self->_hasTransportMetadata = a3;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setTransportMetadata:(id)a3
{
}

- (SISchemaClientTransportEventMetadata)transportMetadata
{
  return self->_transportMetadata;
}

- (void)setEventMetadata:(id)a3
{
}

- (SISchemaClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (id)getEventType
{
  id v2 = 0;
  unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__audioFirstBufferRecorded;
  switch(self->_whichEvent_Type)
  {
    case 0x65uLL:
      goto LABEL_74;
    case 0x66uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__audioStopRecording;
      goto LABEL_74;
    case 0x67uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__clientConversationTrace;
      goto LABEL_74;
    case 0x68uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__deviceDynamicContext;
      goto LABEL_74;
    case 0x69uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__deviceFixedContext;
      goto LABEL_74;
    case 0x6AuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__dictationContext;
      goto LABEL_74;
    case 0x6BuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__invocation;
      goto LABEL_74;
    case 0x6CuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__location;
      goto LABEL_74;
    case 0x6DuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__punchOut;
      goto LABEL_74;
    case 0x6FuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__siriCue;
      goto LABEL_74;
    case 0x70uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__uufrPresented;
      goto LABEL_74;
    case 0x71uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__speechTranscription;
      goto LABEL_74;
    case 0x72uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__textToSpeechBegin;
      goto LABEL_74;
    case 0x73uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__textToSpeechEnd;
      goto LABEL_74;
    case 0x74uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__uiStateTransition;
      goto LABEL_74;
    case 0x75uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__clientFlow;
      goto LABEL_74;
    case 0x76uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__dialogOutput;
      goto LABEL_74;
    case 0x77uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__dictationEndPointStop;
      goto LABEL_74;
    case 0x78uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__dictationEndPointCancel;
      goto LABEL_74;
    case 0x79uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__dictationAlternativeSelected;
      goto LABEL_74;
    case 0x7AuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__dictationTranscriptionMetadata;
      goto LABEL_74;
    case 0x7BuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__carPlayHeadUnitContext;
      goto LABEL_74;
    case 0x7CuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__uufrCompletion;
      goto LABEL_74;
    case 0x7DuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__uufrShown;
      goto LABEL_74;
    case 0x7EuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__uufrSaid;
      goto LABEL_74;
    case 0x7FuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__uufrFatalError;
      goto LABEL_74;
    case 0x80uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__dictationAlternativesViewed;
      goto LABEL_74;
    case 0x81uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__intercomMessageRecorded;
      goto LABEL_74;
    case 0x82uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__casinoRelationship;
      goto LABEL_74;
    case 0x83uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__userViewRegionInteraction;
      goto LABEL_74;
    case 0x84uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__deviceLockStateChanged;
      goto LABEL_74;
    case 0x85uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiRequestCategorization;
      goto LABEL_74;
    case 0x86uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__audioStopRecordingStarted;
      goto LABEL_74;
    case 0x87uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiLaunchContext;
      goto LABEL_74;
    case 0x88uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiUserSpeakingContext;
      goto LABEL_74;
    case 0x89uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiUUFRReady;
      goto LABEL_74;
    case 0x8AuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiUIRenderingContext;
      goto LABEL_74;
    case 0x8BuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__pnrTextToSpeechRequestReceived;
      goto LABEL_74;
    case 0x8CuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__pnrSpeechRecognitionSourceContext;
      goto LABEL_74;
    case 0x8DuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__pnrFatalError;
      goto LABEL_74;
    case 0x8EuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__turnMTERequest;
      goto LABEL_74;
    case 0x8FuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__keyboardDismissed;
      goto LABEL_74;
    case 0x90uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__engagedAccessoryContext;
      goto LABEL_74;
    case 0x91uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__announceCarPlayBannerTapped;
      goto LABEL_74;
    case 0x92uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__announceCarPlayGlyphSettingToggled;
      goto LABEL_74;
    case 0x93uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__dictationContentEdited;
      goto LABEL_74;
    case 0x94uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__uufrShownTier1;
      goto LABEL_74;
    case 0x96uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationPartialResultUpdated;
      goto LABEL_74;
    case 0x97uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationVoiceCommandExecuted;
      goto LABEL_74;
    case 0x98uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationInputModeSwitchContext;
      goto LABEL_74;
    case 0x99uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationToolTipDisplayContext;
      goto LABEL_74;
    case 0x9AuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__hostPlatformViewAppearContext;
      goto LABEL_74;
    case 0x9BuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__hostPlatformViewDisappearContext;
      goto LABEL_74;
    case 0x9CuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationTranscriptionTokenized;
      goto LABEL_74;
    case 0x9DuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__dictationAlternativesSelected;
      goto LABEL_74;
    case 0x9EuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__uufrSelected;
      goto LABEL_74;
    case 0x9FuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationAlternativeTextPairsSelected;
      goto LABEL_74;
    case 0xA0uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiUserBargeInDetected;
      goto LABEL_74;
    case 0xA1uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationEnablementPromptShown;
      goto LABEL_74;
    case 0xA2uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiSiriCarCommandContext;
      goto LABEL_74;
    case 0xA3uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiVisionSnippetDismissed;
      goto LABEL_74;
    case 0xA4uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiSiriWasUnavailable;
      goto LABEL_74;
    case 0xA5uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__preferredAudioRouteChanged;
      goto LABEL_74;
    case 0xA6uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationContentEditedTier1;
      goto LABEL_74;
    case 0xA7uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationVoiceCommandUndoTapAction;
      goto LABEL_74;
    case 0xA8uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationVoiceCommandDisambiguationAction;
      goto LABEL_74;
    case 0xA9uLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationVoiceCommandKeyboardAction;
      goto LABEL_74;
    case 0xAAuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationEuclidAlternativesEvent;
      goto LABEL_74;
    case 0xABuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationEuclidAlternativesEventTier1;
      goto LABEL_74;
    case 0xACuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationEuclidSpeechAlternativesSelected;
      goto LABEL_74;
    case 0xADuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiDictationEuclidSpeechAlternativesSelectedTier1;
      goto LABEL_74;
    case 0xAEuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__typingRequestTrace;
      goto LABEL_74;
    case 0xAFuLL:
      unint64_t v3 = &OBJC_IVAR___SISchemaClientEvent__ueiInvocationTier1;
LABEL_74:
      id v2 = *(id *)((char *)&self->super.super.super.super.isa + *v3);
      break;
    default:
      break;
  }
  return v2;
}

- (void)setEventType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SISchemaClientEvent *)self setAudioFirstBufferRecorded:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SISchemaClientEvent *)self setAudioStopRecording:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(SISchemaClientEvent *)self setClientConversationTrace:v4];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(SISchemaClientEvent *)self setDeviceDynamicContext:v4];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(SISchemaClientEvent *)self setDeviceFixedContext:v4];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(SISchemaClientEvent *)self setDictationContext:v4];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [(SISchemaClientEvent *)self setInvocation:v4];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [(SISchemaClientEvent *)self setLocation:v4];
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [(SISchemaClientEvent *)self setPunchOut:v4];
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [(SISchemaClientEvent *)self setSiriCue:v4];
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [(SISchemaClientEvent *)self setUufrPresented:v4];
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          [(SISchemaClientEvent *)self setSpeechTranscription:v4];
                        }
                        else
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            [(SISchemaClientEvent *)self setTextToSpeechBegin:v4];
                          }
                          else
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              [(SISchemaClientEvent *)self setTextToSpeechEnd:v4];
                            }
                            else
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                [(SISchemaClientEvent *)self setUiStateTransition:v4];
                              }
                              else
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  [(SISchemaClientEvent *)self setClientFlow:v4];
                                }
                                else
                                {
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    [(SISchemaClientEvent *)self setDialogOutput:v4];
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      [(SISchemaClientEvent *)self setDictationEndPointStop:v4];
                                    }
                                    else
                                    {
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        [(SISchemaClientEvent *)self setDictationEndPointCancel:v4];
                                      }
                                      else
                                      {
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          [(SISchemaClientEvent *)self setDictationAlternativeSelected:v4];
                                        }
                                        else
                                        {
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            [(SISchemaClientEvent *)self setDictationTranscriptionMetadata:v4];
                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              [(SISchemaClientEvent *)self setCarPlayHeadUnitContext:v4];
                                            }
                                            else
                                            {
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                [(SISchemaClientEvent *)self setUufrCompletion:v4];
                                              }
                                              else
                                              {
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  [(SISchemaClientEvent *)self setUufrShown:v4];
                                                }
                                                else
                                                {
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    [(SISchemaClientEvent *)self setUufrSaid:v4];
                                                  }
                                                  else
                                                  {
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      [(SISchemaClientEvent *)self setUufrFatalError:v4];
                                                    }
                                                    else
                                                    {
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        [(SISchemaClientEvent *)self setDictationAlternativesViewed:v4];
                                                      }
                                                      else
                                                      {
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          [(SISchemaClientEvent *)self setIntercomMessageRecorded:v4];
                                                        }
                                                        else
                                                        {
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            [(SISchemaClientEvent *)self setCasinoRelationship:v4];
                                                          }
                                                          else
                                                          {
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              [(SISchemaClientEvent *)self setUserViewRegionInteraction:v4];
                                                            }
                                                            else
                                                            {
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                [(SISchemaClientEvent *)self setDeviceLockStateChanged:v4];
                                                              }
                                                              else
                                                              {
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  [(SISchemaClientEvent *)self setUeiRequestCategorization:v4];
                                                                }
                                                                else
                                                                {
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    [(SISchemaClientEvent *)self setAudioStopRecordingStarted:v4];
                                                                  }
                                                                  else
                                                                  {
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      [(SISchemaClientEvent *)self setUeiLaunchContext:v4];
                                                                    }
                                                                    else
                                                                    {
                                                                      objc_opt_class();
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        [(SISchemaClientEvent *)self setUeiUserSpeakingContext:v4];
                                                                      }
                                                                      else
                                                                      {
                                                                        objc_opt_class();
                                                                        if (objc_opt_isKindOfClass())
                                                                        {
                                                                          [(SISchemaClientEvent *)self setUeiUUFRReady:v4];
                                                                        }
                                                                        else
                                                                        {
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            [(SISchemaClientEvent *)self setUeiUIRenderingContext:v4];
                                                                          }
                                                                          else
                                                                          {
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              [(SISchemaClientEvent *)self setPnrTextToSpeechRequestReceived:v4];
                                                                            }
                                                                            else
                                                                            {
                                                                              objc_opt_class();
                                                                              if (objc_opt_isKindOfClass())
                                                                              {
                                                                                [(SISchemaClientEvent *)self setPnrSpeechRecognitionSourceContext:v4];
                                                                              }
                                                                              else
                                                                              {
                                                                                objc_opt_class();
                                                                                if (objc_opt_isKindOfClass())
                                                                                {
                                                                                  [(SISchemaClientEvent *)self setPnrFatalError:v4];
                                                                                }
                                                                                else
                                                                                {
                                                                                  objc_opt_class();
                                                                                  if (objc_opt_isKindOfClass())
                                                                                  {
                                                                                    [(SISchemaClientEvent *)self setTurnMTERequest:v4];
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    objc_opt_class();
                                                                                    if (objc_opt_isKindOfClass())
                                                                                    {
                                                                                      [(SISchemaClientEvent *)self setKeyboardDismissed:v4];
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      objc_opt_class();
                                                                                      if (objc_opt_isKindOfClass())
                                                                                      {
                                                                                        [(SISchemaClientEvent *)self setEngagedAccessoryContext:v4];
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if (objc_opt_isKindOfClass())
                                                                                        {
                                                                                          [(SISchemaClientEvent *)self setAnnounceCarPlayBannerTapped:v4];
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          objc_opt_class();
                                                                                          if (objc_opt_isKindOfClass())
                                                                                          {
                                                                                            [(SISchemaClientEvent *)self setAnnounceCarPlayGlyphSettingToggled:v4];
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            objc_opt_class();
                                                                                            if (objc_opt_isKindOfClass())
                                                                                            {
                                                                                              [(SISchemaClientEvent *)self setDictationContentEdited:v4];
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              objc_opt_class();
                                                                                              if (objc_opt_isKindOfClass())
                                                                                              {
                                                                                                [(SISchemaClientEvent *)self setUufrShownTier1:v4];
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                objc_opt_class();
                                                                                                if (objc_opt_isKindOfClass())
                                                                                                {
                                                                                                  [(SISchemaClientEvent *)self setUeiDictationPartialResultUpdated:v4];
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  objc_opt_class();
                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                  {
                                                                                                    [(SISchemaClientEvent *)self setUeiDictationVoiceCommandExecuted:v4];
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    objc_opt_class();
                                                                                                    if (objc_opt_isKindOfClass())
                                                                                                    {
                                                                                                      [(SISchemaClientEvent *)self setUeiDictationInputModeSwitchContext:v4];
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        [(SISchemaClientEvent *)self setUeiDictationToolTipDisplayContext:v4];
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                        {
                                                                                                          [(SISchemaClientEvent *)self setHostPlatformViewAppearContext:v4];
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          objc_opt_class();
                                                                                                          if (objc_opt_isKindOfClass())
                                                                                                          {
                                                                                                            [(SISchemaClientEvent *)self setHostPlatformViewDisappearContext:v4];
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            objc_opt_class();
                                                                                                            if (objc_opt_isKindOfClass())
                                                                                                            {
                                                                                                              [(SISchemaClientEvent *)self setUeiDictationTranscriptionTokenized:v4];
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              objc_opt_class();
                                                                                                              if (objc_opt_isKindOfClass())
                                                                                                              {
                                                                                                                [(SISchemaClientEvent *)self setDictationAlternativesSelected:v4];
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                objc_opt_class();
                                                                                                                if (objc_opt_isKindOfClass())
                                                                                                                {
                                                                                                                  [(SISchemaClientEvent *)self setUufrSelected:v4];
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  objc_opt_class();
                                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                                  {
                                                                                                                    [(SISchemaClientEvent *)self setUeiDictationAlternativeTextPairsSelected:v4];
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    objc_opt_class();
                                                                                                                    if (objc_opt_isKindOfClass())
                                                                                                                    {
                                                                                                                      [(SISchemaClientEvent *)self setUeiUserBargeInDetected:v4];
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      objc_opt_class();
                                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                                      {
                                                                                                                        [(SISchemaClientEvent *)self setUeiDictationEnablementPromptShown:v4];
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        objc_opt_class();
                                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                                        {
                                                                                                                          [(SISchemaClientEvent *)self setUeiSiriCarCommandContext:v4];
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          objc_opt_class();
                                                                                                                          if (objc_opt_isKindOfClass())
                                                                                                                          {
                                                                                                                            [(SISchemaClientEvent *)self setUeiVisionSnippetDismissed:v4];
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            objc_opt_class();
                                                                                                                            if (objc_opt_isKindOfClass())
                                                                                                                            {
                                                                                                                              [(SISchemaClientEvent *)self setUeiSiriWasUnavailable:v4];
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              objc_opt_class();
                                                                                                                              if (objc_opt_isKindOfClass())
                                                                                                                              {
                                                                                                                                [(SISchemaClientEvent *)self setPreferredAudioRouteChanged:v4];
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                objc_opt_class();
                                                                                                                                if (objc_opt_isKindOfClass())
                                                                                                                                {
                                                                                                                                  [(SISchemaClientEvent *)self setUeiDictationContentEditedTier1:v4];
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  objc_opt_class();
                                                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                                                  {
                                                                                                                                    [(SISchemaClientEvent *)self setUeiDictationVoiceCommandUndoTapAction:v4];
                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    objc_opt_class();
                                                                                                                                    if (objc_opt_isKindOfClass())
                                                                                                                                    {
                                                                                                                                      [(SISchemaClientEvent *)self setUeiDictationVoiceCommandDisambiguationAction:v4];
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      objc_opt_class();
                                                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                                                      {
                                                                                                                                        [(SISchemaClientEvent *)self setUeiDictationVoiceCommandKeyboardAction:v4];
                                                                                                                                      }
                                                                                                                                      else
                                                                                                                                      {
                                                                                                                                        objc_opt_class();
                                                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                                                        {
                                                                                                                                          [(SISchemaClientEvent *)self setUeiDictationEuclidAlternativesEvent:v4];
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                          objc_opt_class();
                                                                                                                                          if (objc_opt_isKindOfClass())
                                                                                                                                          {
                                                                                                                                            [(SISchemaClientEvent *)self setUeiDictationEuclidAlternativesEventTier1:v4];
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                            objc_opt_class();
                                                                                                                                            if (objc_opt_isKindOfClass())
                                                                                                                                            {
                                                                                                                                              [(SISchemaClientEvent *)self setUeiDictationEuclidSpeechAlternativesSelected:v4];
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                              objc_opt_class();
                                                                                                                                              if (objc_opt_isKindOfClass())
                                                                                                                                              {
                                                                                                                                                [(SISchemaClientEvent *)self setUeiDictationEuclidSpeechAlternativesSelectedTier1:v4];
                                                                                                                                              }
                                                                                                                                              else
                                                                                                                                              {
                                                                                                                                                objc_opt_class();
                                                                                                                                                if (objc_opt_isKindOfClass())
                                                                                                                                                {
                                                                                                                                                  [(SISchemaClientEvent *)self setTypingRequestTrace:v4];
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                  objc_opt_class();
                                                                                                                                                  if (objc_opt_isKindOfClass()) {
                                                                                                                                                    [(SISchemaClientEvent *)self setUeiInvocationTier1:v4];
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (SISchemaClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v226.receiver = self;
  v226.super_class = (Class)SISchemaClientEvent;
  unint64_t v5 = [(SISchemaClientEvent *)&v226 init];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaClientEventMetadata alloc] initWithDictionary:v6];
      [(SISchemaClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"transportMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [[SISchemaClientTransportEventMetadata alloc] initWithDictionary:v8];
      [(SISchemaClientEvent *)v5 setTransportMetadata:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"audioFirstBufferRecorded"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaAudioFirstBufferRecorded alloc] initWithDictionary:v10];
      [(SISchemaClientEvent *)v5 setAudioFirstBufferRecorded:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"audioStopRecording"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaAudioStopRecording alloc] initWithDictionary:v12];
      [(SISchemaClientEvent *)v5 setAudioStopRecording:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"clientConversationTrace"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaConversationTrace alloc] initWithDictionary:v14];
      [(SISchemaClientEvent *)v5 setClientConversationTrace:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"deviceDynamicContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[SISchemaDeviceDynamicContext alloc] initWithDictionary:v16];
      [(SISchemaClientEvent *)v5 setDeviceDynamicContext:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"deviceFixedContext"];
    objc_opt_class();
    v225 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[SISchemaDeviceFixedContext alloc] initWithDictionary:v18];
      [(SISchemaClientEvent *)v5 setDeviceFixedContext:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"dictationContext"];
    objc_opt_class();
    int v224 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[SISchemaDictationContext alloc] initWithDictionary:v20];
      [(SISchemaClientEvent *)v5 setDictationContext:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"invocation"];
    objc_opt_class();
    v223 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[SISchemaInvocation alloc] initWithDictionary:v22];
      [(SISchemaClientEvent *)v5 setInvocation:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"location"];
    objc_opt_class();
    v222 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[SISchemaLocation alloc] initWithDictionary:v24];
      [(SISchemaClientEvent *)v5 setLocation:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"punchOut"];
    objc_opt_class();
    int v221 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[SISchemaPunchOut alloc] initWithDictionary:v26];
      [(SISchemaClientEvent *)v5 setPunchOut:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"siriCue"];
    objc_opt_class();
    v220 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[SISchemaSiriCue alloc] initWithDictionary:v28];
      [(SISchemaClientEvent *)v5 setSiriCue:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"uufrPresented"];
    objc_opt_class();
    v219 = (void *)v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = [[SISchemaUUFRPresented alloc] initWithDictionary:v30];
      [(SISchemaClientEvent *)v5 setUufrPresented:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"speechTranscription"];
    objc_opt_class();
    int v218 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      v33 = [[SISchemaSpeechTranscription alloc] initWithDictionary:v32];
      [(SISchemaClientEvent *)v5 setSpeechTranscription:v33];
    }
    uint64_t v34 = [v4 objectForKeyedSubscript:@"textToSpeechBegin"];
    objc_opt_class();
    v217 = (void *)v34;
    if (objc_opt_isKindOfClass())
    {
      int v35 = [[SISchemaTextToSpeechBegin alloc] initWithDictionary:v34];
      [(SISchemaClientEvent *)v5 setTextToSpeechBegin:v35];
    }
    uint64_t v36 = [v4 objectForKeyedSubscript:@"textToSpeechEnd"];
    objc_opt_class();
    v216 = (void *)v36;
    if (objc_opt_isKindOfClass())
    {
      v37 = [[SISchemaTextToSpeechEnd alloc] initWithDictionary:v36];
      [(SISchemaClientEvent *)v5 setTextToSpeechEnd:v37];
    }
    uint64_t v38 = [v4 objectForKeyedSubscript:@"uiStateTransition"];
    objc_opt_class();
    int v215 = (void *)v38;
    if (objc_opt_isKindOfClass())
    {
      v39 = [[SISchemaUIStateTransition alloc] initWithDictionary:v38];
      [(SISchemaClientEvent *)v5 setUiStateTransition:v39];
    }
    uint64_t v40 = [v4 objectForKeyedSubscript:@"clientFlow"];
    objc_opt_class();
    v214 = (void *)v40;
    if (objc_opt_isKindOfClass())
    {
      int v41 = [[SISchemaClientFlow alloc] initWithDictionary:v40];
      [(SISchemaClientEvent *)v5 setClientFlow:v41];
    }
    uint64_t v42 = [v4 objectForKeyedSubscript:@"dialogOutput"];
    objc_opt_class();
    v213 = (void *)v42;
    if (objc_opt_isKindOfClass())
    {
      v43 = [[SISchemaDialogOutput alloc] initWithDictionary:v42];
      [(SISchemaClientEvent *)v5 setDialogOutput:v43];
    }
    uint64_t v44 = [v4 objectForKeyedSubscript:@"dictationEndPointStop"];
    objc_opt_class();
    int v212 = (void *)v44;
    if (objc_opt_isKindOfClass())
    {
      v45 = [[SISchemaDictationEndPointStop alloc] initWithDictionary:v44];
      [(SISchemaClientEvent *)v5 setDictationEndPointStop:v45];
    }
    uint64_t v46 = [v4 objectForKeyedSubscript:@"dictationEndPointCancel"];
    objc_opt_class();
    v211 = (void *)v46;
    if (objc_opt_isKindOfClass())
    {
      int v47 = [[SISchemaDictationEndPointCancel alloc] initWithDictionary:v46];
      [(SISchemaClientEvent *)v5 setDictationEndPointCancel:v47];
    }
    uint64_t v48 = [v4 objectForKeyedSubscript:@"dictationAlternativeSelected"];
    objc_opt_class();
    v210 = (void *)v48;
    if (objc_opt_isKindOfClass())
    {
      v49 = [[SISchemaDictationAlternativeSelected alloc] initWithDictionary:v48];
      [(SISchemaClientEvent *)v5 setDictationAlternativeSelected:v49];
    }
    uint64_t v50 = [v4 objectForKeyedSubscript:@"dictationTranscriptionMetadata"];
    objc_opt_class();
    int v209 = (void *)v50;
    if (objc_opt_isKindOfClass())
    {
      v51 = [[SISchemaDictationTranscriptionMetadata alloc] initWithDictionary:v50];
      [(SISchemaClientEvent *)v5 setDictationTranscriptionMetadata:v51];
    }
    uint64_t v52 = [v4 objectForKeyedSubscript:@"carPlayHeadUnitContext"];
    objc_opt_class();
    v208 = (void *)v52;
    if (objc_opt_isKindOfClass())
    {
      int v53 = [[SISchemaCarPlayHeadUnitContext alloc] initWithDictionary:v52];
      [(SISchemaClientEvent *)v5 setCarPlayHeadUnitContext:v53];
    }
    uint64_t v54 = [v4 objectForKeyedSubscript:@"uufrCompletion"];
    objc_opt_class();
    v207 = (void *)v54;
    if (objc_opt_isKindOfClass())
    {
      v55 = [[SISchemaUUFRCompletion alloc] initWithDictionary:v54];
      [(SISchemaClientEvent *)v5 setUufrCompletion:v55];
    }
    uint64_t v56 = [v4 objectForKeyedSubscript:@"uufrShown"];
    objc_opt_class();
    int v206 = (void *)v56;
    if (objc_opt_isKindOfClass())
    {
      v57 = [[SISchemaUUFRShown alloc] initWithDictionary:v56];
      [(SISchemaClientEvent *)v5 setUufrShown:v57];
    }
    uint64_t v58 = [v4 objectForKeyedSubscript:@"uufrSaid"];
    objc_opt_class();
    v205 = (void *)v58;
    if (objc_opt_isKindOfClass())
    {
      int v59 = [[SISchemaUUFRSaid alloc] initWithDictionary:v58];
      [(SISchemaClientEvent *)v5 setUufrSaid:v59];
    }
    uint64_t v60 = [v4 objectForKeyedSubscript:@"uufrFatalError"];
    objc_opt_class();
    v204 = (void *)v60;
    if (objc_opt_isKindOfClass())
    {
      v61 = [[SISchemaUUFRFatalError alloc] initWithDictionary:v60];
      [(SISchemaClientEvent *)v5 setUufrFatalError:v61];
    }
    uint64_t v62 = [v4 objectForKeyedSubscript:@"dictationAlternativesViewed"];
    objc_opt_class();
    int v203 = (void *)v62;
    if (objc_opt_isKindOfClass())
    {
      v63 = [[SISchemaDictationAlternativesViewed alloc] initWithDictionary:v62];
      [(SISchemaClientEvent *)v5 setDictationAlternativesViewed:v63];
    }
    uint64_t v64 = [v4 objectForKeyedSubscript:@"intercomMessageRecorded"];
    objc_opt_class();
    v202 = (void *)v64;
    if (objc_opt_isKindOfClass())
    {
      int v65 = [[SISchemaIntercomMessageRecorded alloc] initWithDictionary:v64];
      [(SISchemaClientEvent *)v5 setIntercomMessageRecorded:v65];
    }
    uint64_t v66 = [v4 objectForKeyedSubscript:@"casinoRelationship"];
    objc_opt_class();
    v201 = (void *)v66;
    if (objc_opt_isKindOfClass())
    {
      v67 = [[SISchemaCasinoRelationship alloc] initWithDictionary:v66];
      [(SISchemaClientEvent *)v5 setCasinoRelationship:v67];
    }
    uint64_t v68 = [v4 objectForKeyedSubscript:@"userViewRegionInteraction"];
    objc_opt_class();
    int v200 = (void *)v68;
    if (objc_opt_isKindOfClass())
    {
      v69 = [[SISchemaUserViewRegionInteraction alloc] initWithDictionary:v68];
      [(SISchemaClientEvent *)v5 setUserViewRegionInteraction:v69];
    }
    uint64_t v70 = [v4 objectForKeyedSubscript:@"deviceLockStateChanged"];
    objc_opt_class();
    v199 = (void *)v70;
    if (objc_opt_isKindOfClass())
    {
      int v71 = [[SISchemaDeviceLockStateChanged alloc] initWithDictionary:v70];
      [(SISchemaClientEvent *)v5 setDeviceLockStateChanged:v71];
    }
    uint64_t v72 = [v4 objectForKeyedSubscript:@"ueiRequestCategorization"];
    objc_opt_class();
    v198 = (void *)v72;
    if (objc_opt_isKindOfClass())
    {
      v73 = [[SISchemaUEIRequestCategorization alloc] initWithDictionary:v72];
      [(SISchemaClientEvent *)v5 setUeiRequestCategorization:v73];
    }
    uint64_t v74 = [v4 objectForKeyedSubscript:@"audioStopRecordingStarted"];
    objc_opt_class();
    int v197 = (void *)v74;
    if (objc_opt_isKindOfClass())
    {
      v75 = [[SISchemaAudioStopRecordingStarted alloc] initWithDictionary:v74];
      [(SISchemaClientEvent *)v5 setAudioStopRecordingStarted:v75];
    }
    uint64_t v76 = [v4 objectForKeyedSubscript:@"ueiLaunchContext"];
    objc_opt_class();
    v196 = (void *)v76;
    if (objc_opt_isKindOfClass())
    {
      int v77 = [[SISchemaUEILaunchContext alloc] initWithDictionary:v76];
      [(SISchemaClientEvent *)v5 setUeiLaunchContext:v77];
    }
    uint64_t v78 = [v4 objectForKeyedSubscript:@"ueiUserSpeakingContext"];
    objc_opt_class();
    v195 = (void *)v78;
    if (objc_opt_isKindOfClass())
    {
      v79 = [[SISchemaUEIUserSpeakingContext alloc] initWithDictionary:v78];
      [(SISchemaClientEvent *)v5 setUeiUserSpeakingContext:v79];
    }
    uint64_t v80 = [v4 objectForKeyedSubscript:@"ueiUUFRReady"];
    objc_opt_class();
    int v194 = (void *)v80;
    if (objc_opt_isKindOfClass())
    {
      v81 = [[SISchemaUEIUUFRReady alloc] initWithDictionary:v80];
      [(SISchemaClientEvent *)v5 setUeiUUFRReady:v81];
    }
    uint64_t v82 = [v4 objectForKeyedSubscript:@"ueiUIRenderingContext"];
    objc_opt_class();
    v193 = (void *)v82;
    if (objc_opt_isKindOfClass())
    {
      int v83 = [[SISchemaUEIUIRenderingContext alloc] initWithDictionary:v82];
      [(SISchemaClientEvent *)v5 setUeiUIRenderingContext:v83];
    }
    uint64_t v84 = [v4 objectForKeyedSubscript:@"pnrTextToSpeechRequestReceived"];
    objc_opt_class();
    v192 = (void *)v84;
    if (objc_opt_isKindOfClass())
    {
      v85 = [[SISchemaPNRTextToSpeechRequestReceived alloc] initWithDictionary:v84];
      [(SISchemaClientEvent *)v5 setPnrTextToSpeechRequestReceived:v85];
    }
    uint64_t v86 = [v4 objectForKeyedSubscript:@"pnrSpeechRecognitionSourceContext"];
    objc_opt_class();
    int v191 = (void *)v86;
    if (objc_opt_isKindOfClass())
    {
      v87 = [[SISchemaPNRSpeechRecognitionSourceContext alloc] initWithDictionary:v86];
      [(SISchemaClientEvent *)v5 setPnrSpeechRecognitionSourceContext:v87];
    }
    uint64_t v88 = [v4 objectForKeyedSubscript:@"pnrFatalError"];
    objc_opt_class();
    v190 = (void *)v88;
    if (objc_opt_isKindOfClass())
    {
      int v89 = [[SISchemaPNRFatalError alloc] initWithDictionary:v88];
      [(SISchemaClientEvent *)v5 setPnrFatalError:v89];
    }
    uint64_t v90 = [v4 objectForKeyedSubscript:@"turnMTERequest"];
    objc_opt_class();
    v189 = (void *)v90;
    if (objc_opt_isKindOfClass())
    {
      v91 = [[SISchemaTurnMTERequest alloc] initWithDictionary:v90];
      [(SISchemaClientEvent *)v5 setTurnMTERequest:v91];
    }
    uint64_t v92 = [v4 objectForKeyedSubscript:@"keyboardDismissed"];
    objc_opt_class();
    int v188 = (void *)v92;
    if (objc_opt_isKindOfClass())
    {
      v93 = [[SISchemaKeyboardDismissed alloc] initWithDictionary:v92];
      [(SISchemaClientEvent *)v5 setKeyboardDismissed:v93];
    }
    uint64_t v94 = [v4 objectForKeyedSubscript:@"engagedAccessoryContext"];
    objc_opt_class();
    v187 = (void *)v94;
    if (objc_opt_isKindOfClass())
    {
      int v95 = [[SISchemaEngagedAccessoryContext alloc] initWithDictionary:v94];
      [(SISchemaClientEvent *)v5 setEngagedAccessoryContext:v95];
    }
    uint64_t v96 = [v4 objectForKeyedSubscript:@"announceCarPlayBannerTapped"];
    objc_opt_class();
    v186 = (void *)v96;
    if (objc_opt_isKindOfClass())
    {
      v97 = [[SISchemaAnnounceCarPlayBannerTapped alloc] initWithDictionary:v96];
      [(SISchemaClientEvent *)v5 setAnnounceCarPlayBannerTapped:v97];
    }
    uint64_t v98 = [v4 objectForKeyedSubscript:@"announceCarPlayGlyphSettingToggled"];
    objc_opt_class();
    int v185 = (void *)v98;
    if (objc_opt_isKindOfClass())
    {
      v99 = [[SISchemaAnnounceCarPlayGlyphSettingToggled alloc] initWithDictionary:v98];
      [(SISchemaClientEvent *)v5 setAnnounceCarPlayGlyphSettingToggled:v99];
    }
    uint64_t v100 = [v4 objectForKeyedSubscript:@"dictationContentEdited"];
    objc_opt_class();
    v184 = (void *)v100;
    if (objc_opt_isKindOfClass())
    {
      int v101 = [[SISchemaDictationContentEdited alloc] initWithDictionary:v100];
      [(SISchemaClientEvent *)v5 setDictationContentEdited:v101];
    }
    uint64_t v102 = [v4 objectForKeyedSubscript:@"uufrShownTier1"];
    objc_opt_class();
    v183 = (void *)v102;
    if (objc_opt_isKindOfClass())
    {
      v103 = [[SISchemaUUFRShownTier1 alloc] initWithDictionary:v102];
      [(SISchemaClientEvent *)v5 setUufrShownTier1:v103];
    }
    uint64_t v104 = [v4 objectForKeyedSubscript:@"ueiDictationPartialResultUpdated"];
    objc_opt_class();
    int v182 = (void *)v104;
    if (objc_opt_isKindOfClass())
    {
      v105 = [[SISchemaUEIDictationPartialResultUpdated alloc] initWithDictionary:v104];
      [(SISchemaClientEvent *)v5 setUeiDictationPartialResultUpdated:v105];
    }
    uint64_t v106 = [v4 objectForKeyedSubscript:@"ueiDictationVoiceCommandExecuted"];
    objc_opt_class();
    v181 = (void *)v106;
    if (objc_opt_isKindOfClass())
    {
      int v107 = [[SISchemaUEIDictationVoiceCommandExecuted alloc] initWithDictionary:v106];
      [(SISchemaClientEvent *)v5 setUeiDictationVoiceCommandExecuted:v107];
    }
    uint64_t v108 = [v4 objectForKeyedSubscript:@"ueiDictationInputModeSwitchContext"];
    objc_opt_class();
    v180 = (void *)v108;
    if (objc_opt_isKindOfClass())
    {
      v109 = [[SISchemaUEIDictationInputModeSwitchContext alloc] initWithDictionary:v108];
      [(SISchemaClientEvent *)v5 setUeiDictationInputModeSwitchContext:v109];
    }
    uint64_t v110 = [v4 objectForKeyedSubscript:@"ueiDictationToolTipDisplayContext"];
    objc_opt_class();
    int v179 = (void *)v110;
    if (objc_opt_isKindOfClass())
    {
      v111 = [[SISchemaUEIDictationDiscoveryToolTipDisplayContext alloc] initWithDictionary:v110];
      [(SISchemaClientEvent *)v5 setUeiDictationToolTipDisplayContext:v111];
    }
    uint64_t v112 = [v4 objectForKeyedSubscript:@"hostPlatformViewAppearContext"];
    objc_opt_class();
    v178 = (void *)v112;
    if (objc_opt_isKindOfClass())
    {
      int v113 = [[SISchemaUEIHostingPlatformViewAppearContext alloc] initWithDictionary:v112];
      [(SISchemaClientEvent *)v5 setHostPlatformViewAppearContext:v113];
    }
    uint64_t v114 = [v4 objectForKeyedSubscript:@"hostPlatformViewDisappearContext"];
    objc_opt_class();
    v177 = (void *)v114;
    if (objc_opt_isKindOfClass())
    {
      v115 = [[SISchemaUEIHostingPlatformViewDisappearContext alloc] initWithDictionary:v114];
      [(SISchemaClientEvent *)v5 setHostPlatformViewDisappearContext:v115];
    }
    uint64_t v116 = [v4 objectForKeyedSubscript:@"ueiDictationTranscriptionTokenized"];
    objc_opt_class();
    int v176 = (void *)v116;
    if (objc_opt_isKindOfClass())
    {
      v117 = [[SISchemaUEIDictationTranscriptionTokenized alloc] initWithDictionary:v116];
      [(SISchemaClientEvent *)v5 setUeiDictationTranscriptionTokenized:v117];
    }
    uint64_t v118 = [v4 objectForKeyedSubscript:@"dictationAlternativesSelected"];
    objc_opt_class();
    v175 = (void *)v118;
    if (objc_opt_isKindOfClass())
    {
      int v119 = [[SISchemaUEIDictationAlternativeConfusionPairsSelected alloc] initWithDictionary:v118];
      [(SISchemaClientEvent *)v5 setDictationAlternativesSelected:v119];
    }
    uint64_t v120 = [v4 objectForKeyedSubscript:@"uufrSelected"];
    objc_opt_class();
    v174 = (void *)v120;
    if (objc_opt_isKindOfClass())
    {
      v121 = [[SISchemaUUFRSelected alloc] initWithDictionary:v120];
      [(SISchemaClientEvent *)v5 setUufrSelected:v121];
    }
    uint64_t v122 = [v4 objectForKeyedSubscript:@"ueiDictationAlternativeTextPairsSelected"];
    objc_opt_class();
    int v173 = (void *)v122;
    if (objc_opt_isKindOfClass())
    {
      v123 = [[SISchemaUEIDictationAlternativeTextPairsSelected alloc] initWithDictionary:v122];
      [(SISchemaClientEvent *)v5 setUeiDictationAlternativeTextPairsSelected:v123];
    }
    uint64_t v124 = [v4 objectForKeyedSubscript:@"ueiUserBargeInDetected"];
    objc_opt_class();
    v172 = (void *)v124;
    if (objc_opt_isKindOfClass())
    {
      int v125 = [[SISchemaUEIUserBargeInDetected alloc] initWithDictionary:v124];
      [(SISchemaClientEvent *)v5 setUeiUserBargeInDetected:v125];
    }
    uint64_t v126 = [v4 objectForKeyedSubscript:@"ueiDictationEnablementPromptShown"];
    objc_opt_class();
    v171 = (void *)v126;
    if (objc_opt_isKindOfClass())
    {
      v127 = [[SISchemaUEIDictationEnablementPromptShown alloc] initWithDictionary:v126];
      [(SISchemaClientEvent *)v5 setUeiDictationEnablementPromptShown:v127];
    }
    uint64_t v128 = [v4 objectForKeyedSubscript:@"ueiSiriCarCommandContext"];
    objc_opt_class();
    int v170 = (void *)v128;
    if (objc_opt_isKindOfClass())
    {
      v129 = [[SISchemaUEISiriCarCommandContext alloc] initWithDictionary:v128];
      [(SISchemaClientEvent *)v5 setUeiSiriCarCommandContext:v129];
    }
    uint64_t v130 = [v4 objectForKeyedSubscript:@"ueiVisionSnippetDismissed"];
    objc_opt_class();
    v169 = (void *)v130;
    if (objc_opt_isKindOfClass())
    {
      int v131 = [[SISchemaUEIVisionSnippetDismissed alloc] initWithDictionary:v130];
      [(SISchemaClientEvent *)v5 setUeiVisionSnippetDismissed:v131];
    }
    uint64_t v132 = [v4 objectForKeyedSubscript:@"ueiSiriWasUnavailable"];
    objc_opt_class();
    v168 = (void *)v132;
    if (objc_opt_isKindOfClass())
    {
      v133 = [[SISchemaUEISiriWasUnavailable alloc] initWithDictionary:v132];
      [(SISchemaClientEvent *)v5 setUeiSiriWasUnavailable:v133];
    }
    uint64_t v134 = [v4 objectForKeyedSubscript:@"preferredAudioRouteChanged"];
    objc_opt_class();
    int v167 = (void *)v134;
    if (objc_opt_isKindOfClass())
    {
      v135 = [[SISchemaBluetoothCarPreferredAudioRouteChanged alloc] initWithDictionary:v134];
      [(SISchemaClientEvent *)v5 setPreferredAudioRouteChanged:v135];
    }
    uint64_t v136 = [v4 objectForKeyedSubscript:@"ueiDictationContentEditedTier1"];
    objc_opt_class();
    v166 = (void *)v136;
    if (objc_opt_isKindOfClass())
    {
      int v137 = [[SISchemaUEIDictationContentEditedTier1 alloc] initWithDictionary:v136];
      [(SISchemaClientEvent *)v5 setUeiDictationContentEditedTier1:v137];
    }
    uint64_t v138 = [v4 objectForKeyedSubscript:@"ueiDictationVoiceCommandUndoTapAction"];
    objc_opt_class();
    v165 = (void *)v138;
    if (objc_opt_isKindOfClass())
    {
      v139 = [[SISchemaUEIDictationVoiceCommandUndoTapAction alloc] initWithDictionary:v138];
      [(SISchemaClientEvent *)v5 setUeiDictationVoiceCommandUndoTapAction:v139];
    }
    v162 = (void *)v10;
    uint64_t v140 = [v4 objectForKeyedSubscript:@"ueiDictationVoiceCommandDisambiguationAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v141 = [[SISchemaUEIDictationVoiceCommandDisambiguationAction alloc] initWithDictionary:v140];
      [(SISchemaClientEvent *)v5 setUeiDictationVoiceCommandDisambiguationAction:v141];
    }
    int v158 = (void *)v140;
    int v161 = (void *)v12;
    v142 = [v4 objectForKeyedSubscript:@"ueiDictationVoiceCommandKeyboardAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v143 = [[SISchemaUEIDictationVoiceCommandKeyboardAction alloc] initWithDictionary:v142];
      [(SISchemaClientEvent *)v5 setUeiDictationVoiceCommandKeyboardAction:v143];
    }
    v160 = (void *)v14;
    v144 = [v4 objectForKeyedSubscript:@"ueiDictationEuclidAlternativesEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v145 = [[SISchemaUEIDictationEuclidAlternativesEvent alloc] initWithDictionary:v144];
      [(SISchemaClientEvent *)v5 setUeiDictationEuclidAlternativesEvent:v145];
    }
    v159 = (void *)v16;
    int v146 = [v4 objectForKeyedSubscript:@"ueiDictationEuclidAlternativesEventTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v147 = [[SISchemaUEIDictationEuclidAlternativesEventTier1 alloc] initWithDictionary:v146];
      [(SISchemaClientEvent *)v5 setUeiDictationEuclidAlternativesEventTier1:v147];
    }
    int v164 = (void *)v6;
    v148 = [v4 objectForKeyedSubscript:@"ueiDictationEuclidSpeechAlternativesSelected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v149 = [[SISchemaUEIDictationEuclidSpeechAlternativesSelected alloc] initWithDictionary:v148];
      [(SISchemaClientEvent *)v5 setUeiDictationEuclidSpeechAlternativesSelected:v149];
    }
    v163 = (void *)v8;
    v150 = [v4 objectForKeyedSubscript:@"ueiDictationEuclidSpeechAlternativesSelectedTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v151 = [[SISchemaUEIDictationEuclidSpeechAlternativesSelectedTier1 alloc] initWithDictionary:v150];
      [(SISchemaClientEvent *)v5 setUeiDictationEuclidSpeechAlternativesSelectedTier1:v151];
    }
    int v152 = [v4 objectForKeyedSubscript:@"typingRequestTrace"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v153 = [[SISchemaTypingRequestTrace alloc] initWithDictionary:v152];
      [(SISchemaClientEvent *)v5 setTypingRequestTrace:v153];
    }
    v154 = [v4 objectForKeyedSubscript:@"ueiInvocationTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v155 = [[SISchemaUEIInvocationTier1 alloc] initWithDictionary:v154];
      [(SISchemaClientEvent *)v5 setUeiInvocationTier1:v155];
    }
    v156 = v5;
  }
  return v5;
}

- (SISchemaClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v5 = 0;
  }
  else
  {
    self = [(SISchemaClientEvent *)self initWithDictionary:v4];
    unint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  id v2 = [(SISchemaClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_announceCarPlayBannerTapped)
  {
    id v4 = [(SISchemaClientEvent *)self announceCarPlayBannerTapped];
    unint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"announceCarPlayBannerTapped"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"announceCarPlayBannerTapped"];
    }
  }
  if (self->_announceCarPlayGlyphSettingToggled)
  {
    uint64_t v7 = [(SISchemaClientEvent *)self announceCarPlayGlyphSettingToggled];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"announceCarPlayGlyphSettingToggled"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"announceCarPlayGlyphSettingToggled"];
    }
  }
  if (self->_audioFirstBufferRecorded)
  {
    uint64_t v10 = [(SISchemaClientEvent *)self audioFirstBufferRecorded];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"audioFirstBufferRecorded"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"audioFirstBufferRecorded"];
    }
  }
  if (self->_audioStopRecording)
  {
    v13 = [(SISchemaClientEvent *)self audioStopRecording];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"audioStopRecording"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"audioStopRecording"];
    }
  }
  if (self->_audioStopRecordingStarted)
  {
    uint64_t v16 = [(SISchemaClientEvent *)self audioStopRecordingStarted];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"audioStopRecordingStarted"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"audioStopRecordingStarted"];
    }
  }
  if (self->_carPlayHeadUnitContext)
  {
    v19 = [(SISchemaClientEvent *)self carPlayHeadUnitContext];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"carPlayHeadUnitContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"carPlayHeadUnitContext"];
    }
  }
  if (self->_casinoRelationship)
  {
    uint64_t v22 = [(SISchemaClientEvent *)self casinoRelationship];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"casinoRelationship"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"casinoRelationship"];
    }
  }
  if (self->_clientConversationTrace)
  {
    v25 = [(SISchemaClientEvent *)self clientConversationTrace];
    uint64_t v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"clientConversationTrace"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"clientConversationTrace"];
    }
  }
  if (self->_clientFlow)
  {
    uint64_t v28 = [(SISchemaClientEvent *)self clientFlow];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"clientFlow"];
    }
    else
    {
      uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"clientFlow"];
    }
  }
  if (self->_deviceDynamicContext)
  {
    v31 = [(SISchemaClientEvent *)self deviceDynamicContext];
    uint64_t v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"deviceDynamicContext"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"deviceDynamicContext"];
    }
  }
  if (self->_deviceFixedContext)
  {
    uint64_t v34 = [(SISchemaClientEvent *)self deviceFixedContext];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"deviceFixedContext"];
    }
    else
    {
      uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"deviceFixedContext"];
    }
  }
  if (self->_deviceLockStateChanged)
  {
    v37 = [(SISchemaClientEvent *)self deviceLockStateChanged];
    uint64_t v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"deviceLockStateChanged"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"deviceLockStateChanged"];
    }
  }
  if (self->_dialogOutput)
  {
    uint64_t v40 = [(SISchemaClientEvent *)self dialogOutput];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"dialogOutput"];
    }
    else
    {
      uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"dialogOutput"];
    }
  }
  if (self->_dictationAlternativeSelected)
  {
    v43 = [(SISchemaClientEvent *)self dictationAlternativeSelected];
    uint64_t v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"dictationAlternativeSelected"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"dictationAlternativeSelected"];
    }
  }
  if (self->_dictationAlternativesSelected)
  {
    uint64_t v46 = [(SISchemaClientEvent *)self dictationAlternativesSelected];
    int v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"dictationAlternativesSelected"];
    }
    else
    {
      uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"dictationAlternativesSelected"];
    }
  }
  if (self->_dictationAlternativesViewed)
  {
    v49 = [(SISchemaClientEvent *)self dictationAlternativesViewed];
    uint64_t v50 = [v49 dictionaryRepresentation];
    if (v50)
    {
      [v3 setObject:v50 forKeyedSubscript:@"dictationAlternativesViewed"];
    }
    else
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v51 forKeyedSubscript:@"dictationAlternativesViewed"];
    }
  }
  if (self->_dictationContentEdited)
  {
    uint64_t v52 = [(SISchemaClientEvent *)self dictationContentEdited];
    int v53 = [v52 dictionaryRepresentation];
    if (v53)
    {
      [v3 setObject:v53 forKeyedSubscript:@"dictationContentEdited"];
    }
    else
    {
      uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v54 forKeyedSubscript:@"dictationContentEdited"];
    }
  }
  if (self->_dictationContext)
  {
    v55 = [(SISchemaClientEvent *)self dictationContext];
    uint64_t v56 = [v55 dictionaryRepresentation];
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"dictationContext"];
    }
    else
    {
      v57 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v57 forKeyedSubscript:@"dictationContext"];
    }
  }
  if (self->_dictationEndPointCancel)
  {
    uint64_t v58 = [(SISchemaClientEvent *)self dictationEndPointCancel];
    int v59 = [v58 dictionaryRepresentation];
    if (v59)
    {
      [v3 setObject:v59 forKeyedSubscript:@"dictationEndPointCancel"];
    }
    else
    {
      uint64_t v60 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v60 forKeyedSubscript:@"dictationEndPointCancel"];
    }
  }
  if (self->_dictationEndPointStop)
  {
    v61 = [(SISchemaClientEvent *)self dictationEndPointStop];
    uint64_t v62 = [v61 dictionaryRepresentation];
    if (v62)
    {
      [v3 setObject:v62 forKeyedSubscript:@"dictationEndPointStop"];
    }
    else
    {
      v63 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v63 forKeyedSubscript:@"dictationEndPointStop"];
    }
  }
  if (self->_dictationTranscriptionMetadata)
  {
    uint64_t v64 = [(SISchemaClientEvent *)self dictationTranscriptionMetadata];
    int v65 = [v64 dictionaryRepresentation];
    if (v65)
    {
      [v3 setObject:v65 forKeyedSubscript:@"dictationTranscriptionMetadata"];
    }
    else
    {
      uint64_t v66 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v66 forKeyedSubscript:@"dictationTranscriptionMetadata"];
    }
  }
  if (self->_engagedAccessoryContext)
  {
    v67 = [(SISchemaClientEvent *)self engagedAccessoryContext];
    uint64_t v68 = [v67 dictionaryRepresentation];
    if (v68)
    {
      [v3 setObject:v68 forKeyedSubscript:@"engagedAccessoryContext"];
    }
    else
    {
      v69 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v69 forKeyedSubscript:@"engagedAccessoryContext"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v70 = [(SISchemaClientEvent *)self eventMetadata];
    int v71 = [v70 dictionaryRepresentation];
    if (v71)
    {
      [v3 setObject:v71 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      uint64_t v72 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v72 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_hostPlatformViewAppearContext)
  {
    v73 = [(SISchemaClientEvent *)self hostPlatformViewAppearContext];
    uint64_t v74 = [v73 dictionaryRepresentation];
    if (v74)
    {
      [v3 setObject:v74 forKeyedSubscript:@"hostPlatformViewAppearContext"];
    }
    else
    {
      v75 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v75 forKeyedSubscript:@"hostPlatformViewAppearContext"];
    }
  }
  if (self->_hostPlatformViewDisappearContext)
  {
    uint64_t v76 = [(SISchemaClientEvent *)self hostPlatformViewDisappearContext];
    int v77 = [v76 dictionaryRepresentation];
    if (v77)
    {
      [v3 setObject:v77 forKeyedSubscript:@"hostPlatformViewDisappearContext"];
    }
    else
    {
      uint64_t v78 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v78 forKeyedSubscript:@"hostPlatformViewDisappearContext"];
    }
  }
  if (self->_intercomMessageRecorded)
  {
    v79 = [(SISchemaClientEvent *)self intercomMessageRecorded];
    uint64_t v80 = [v79 dictionaryRepresentation];
    if (v80)
    {
      [v3 setObject:v80 forKeyedSubscript:@"intercomMessageRecorded"];
    }
    else
    {
      v81 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v81 forKeyedSubscript:@"intercomMessageRecorded"];
    }
  }
  if (self->_invocation)
  {
    uint64_t v82 = [(SISchemaClientEvent *)self invocation];
    int v83 = [v82 dictionaryRepresentation];
    if (v83)
    {
      [v3 setObject:v83 forKeyedSubscript:@"invocation"];
    }
    else
    {
      uint64_t v84 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v84 forKeyedSubscript:@"invocation"];
    }
  }
  if (self->_keyboardDismissed)
  {
    v85 = [(SISchemaClientEvent *)self keyboardDismissed];
    uint64_t v86 = [v85 dictionaryRepresentation];
    if (v86)
    {
      [v3 setObject:v86 forKeyedSubscript:@"keyboardDismissed"];
    }
    else
    {
      v87 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v87 forKeyedSubscript:@"keyboardDismissed"];
    }
  }
  if (self->_location)
  {
    uint64_t v88 = [(SISchemaClientEvent *)self location];
    int v89 = [v88 dictionaryRepresentation];
    if (v89)
    {
      [v3 setObject:v89 forKeyedSubscript:@"location"];
    }
    else
    {
      uint64_t v90 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v90 forKeyedSubscript:@"location"];
    }
  }
  if (self->_pnrFatalError)
  {
    v91 = [(SISchemaClientEvent *)self pnrFatalError];
    uint64_t v92 = [v91 dictionaryRepresentation];
    if (v92)
    {
      [v3 setObject:v92 forKeyedSubscript:@"pnrFatalError"];
    }
    else
    {
      v93 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v93 forKeyedSubscript:@"pnrFatalError"];
    }
  }
  if (self->_pnrSpeechRecognitionSourceContext)
  {
    uint64_t v94 = [(SISchemaClientEvent *)self pnrSpeechRecognitionSourceContext];
    int v95 = [v94 dictionaryRepresentation];
    if (v95)
    {
      [v3 setObject:v95 forKeyedSubscript:@"pnrSpeechRecognitionSourceContext"];
    }
    else
    {
      uint64_t v96 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v96 forKeyedSubscript:@"pnrSpeechRecognitionSourceContext"];
    }
  }
  if (self->_pnrTextToSpeechRequestReceived)
  {
    v97 = [(SISchemaClientEvent *)self pnrTextToSpeechRequestReceived];
    uint64_t v98 = [v97 dictionaryRepresentation];
    if (v98)
    {
      [v3 setObject:v98 forKeyedSubscript:@"pnrTextToSpeechRequestReceived"];
    }
    else
    {
      v99 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v99 forKeyedSubscript:@"pnrTextToSpeechRequestReceived"];
    }
  }
  if (self->_preferredAudioRouteChanged)
  {
    uint64_t v100 = [(SISchemaClientEvent *)self preferredAudioRouteChanged];
    int v101 = [v100 dictionaryRepresentation];
    if (v101)
    {
      [v3 setObject:v101 forKeyedSubscript:@"preferredAudioRouteChanged"];
    }
    else
    {
      uint64_t v102 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v102 forKeyedSubscript:@"preferredAudioRouteChanged"];
    }
  }
  if (self->_punchOut)
  {
    v103 = [(SISchemaClientEvent *)self punchOut];
    uint64_t v104 = [v103 dictionaryRepresentation];
    if (v104)
    {
      [v3 setObject:v104 forKeyedSubscript:@"punchOut"];
    }
    else
    {
      v105 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v105 forKeyedSubscript:@"punchOut"];
    }
  }
  if (self->_siriCue)
  {
    uint64_t v106 = [(SISchemaClientEvent *)self siriCue];
    int v107 = [v106 dictionaryRepresentation];
    if (v107)
    {
      [v3 setObject:v107 forKeyedSubscript:@"siriCue"];
    }
    else
    {
      uint64_t v108 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v108 forKeyedSubscript:@"siriCue"];
    }
  }
  if (self->_speechTranscription)
  {
    v109 = [(SISchemaClientEvent *)self speechTranscription];
    uint64_t v110 = [v109 dictionaryRepresentation];
    if (v110)
    {
      [v3 setObject:v110 forKeyedSubscript:@"speechTranscription"];
    }
    else
    {
      v111 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v111 forKeyedSubscript:@"speechTranscription"];
    }
  }
  if (self->_textToSpeechBegin)
  {
    uint64_t v112 = [(SISchemaClientEvent *)self textToSpeechBegin];
    int v113 = [v112 dictionaryRepresentation];
    if (v113)
    {
      [v3 setObject:v113 forKeyedSubscript:@"textToSpeechBegin"];
    }
    else
    {
      uint64_t v114 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v114 forKeyedSubscript:@"textToSpeechBegin"];
    }
  }
  if (self->_textToSpeechEnd)
  {
    v115 = [(SISchemaClientEvent *)self textToSpeechEnd];
    uint64_t v116 = [v115 dictionaryRepresentation];
    if (v116)
    {
      [v3 setObject:v116 forKeyedSubscript:@"textToSpeechEnd"];
    }
    else
    {
      v117 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v117 forKeyedSubscript:@"textToSpeechEnd"];
    }
  }
  if (self->_transportMetadata)
  {
    uint64_t v118 = [(SISchemaClientEvent *)self transportMetadata];
    int v119 = [v118 dictionaryRepresentation];
    if (v119)
    {
      [v3 setObject:v119 forKeyedSubscript:@"transportMetadata"];
    }
    else
    {
      uint64_t v120 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v120 forKeyedSubscript:@"transportMetadata"];
    }
  }
  if (self->_turnMTERequest)
  {
    v121 = [(SISchemaClientEvent *)self turnMTERequest];
    uint64_t v122 = [v121 dictionaryRepresentation];
    if (v122)
    {
      [v3 setObject:v122 forKeyedSubscript:@"turnMTERequest"];
    }
    else
    {
      v123 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v123 forKeyedSubscript:@"turnMTERequest"];
    }
  }
  if (self->_typingRequestTrace)
  {
    uint64_t v124 = [(SISchemaClientEvent *)self typingRequestTrace];
    int v125 = [v124 dictionaryRepresentation];
    if (v125)
    {
      [v3 setObject:v125 forKeyedSubscript:@"typingRequestTrace"];
    }
    else
    {
      uint64_t v126 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v126 forKeyedSubscript:@"typingRequestTrace"];
    }
  }
  if (self->_ueiDictationAlternativeTextPairsSelected)
  {
    v127 = [(SISchemaClientEvent *)self ueiDictationAlternativeTextPairsSelected];
    uint64_t v128 = [v127 dictionaryRepresentation];
    if (v128)
    {
      [v3 setObject:v128 forKeyedSubscript:@"ueiDictationAlternativeTextPairsSelected"];
    }
    else
    {
      v129 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v129 forKeyedSubscript:@"ueiDictationAlternativeTextPairsSelected"];
    }
  }
  if (self->_ueiDictationContentEditedTier1)
  {
    uint64_t v130 = [(SISchemaClientEvent *)self ueiDictationContentEditedTier1];
    int v131 = [v130 dictionaryRepresentation];
    if (v131)
    {
      [v3 setObject:v131 forKeyedSubscript:@"ueiDictationContentEditedTier1"];
    }
    else
    {
      uint64_t v132 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v132 forKeyedSubscript:@"ueiDictationContentEditedTier1"];
    }
  }
  if (self->_ueiDictationEnablementPromptShown)
  {
    v133 = [(SISchemaClientEvent *)self ueiDictationEnablementPromptShown];
    uint64_t v134 = [v133 dictionaryRepresentation];
    if (v134)
    {
      [v3 setObject:v134 forKeyedSubscript:@"ueiDictationEnablementPromptShown"];
    }
    else
    {
      v135 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v135 forKeyedSubscript:@"ueiDictationEnablementPromptShown"];
    }
  }
  if (self->_ueiDictationEuclidAlternativesEvent)
  {
    uint64_t v136 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEvent];
    int v137 = [v136 dictionaryRepresentation];
    if (v137)
    {
      [v3 setObject:v137 forKeyedSubscript:@"ueiDictationEuclidAlternativesEvent"];
    }
    else
    {
      uint64_t v138 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v138 forKeyedSubscript:@"ueiDictationEuclidAlternativesEvent"];
    }
  }
  if (self->_ueiDictationEuclidAlternativesEventTier1)
  {
    v139 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEventTier1];
    uint64_t v140 = [v139 dictionaryRepresentation];
    if (v140)
    {
      [v3 setObject:v140 forKeyedSubscript:@"ueiDictationEuclidAlternativesEventTier1"];
    }
    else
    {
      v141 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v141 forKeyedSubscript:@"ueiDictationEuclidAlternativesEventTier1"];
    }
  }
  if (self->_ueiDictationEuclidSpeechAlternativesSelected)
  {
    v142 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelected];
    int v143 = [v142 dictionaryRepresentation];
    if (v143)
    {
      [v3 setObject:v143 forKeyedSubscript:@"ueiDictationEuclidSpeechAlternativesSelected"];
    }
    else
    {
      v144 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v144 forKeyedSubscript:@"ueiDictationEuclidSpeechAlternativesSelected"];
    }
  }
  if (self->_ueiDictationEuclidSpeechAlternativesSelectedTier1)
  {
    v145 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelectedTier1];
    int v146 = [v145 dictionaryRepresentation];
    if (v146)
    {
      [v3 setObject:v146 forKeyedSubscript:@"ueiDictationEuclidSpeechAlternativesSelectedTier1"];
    }
    else
    {
      v147 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v147 forKeyedSubscript:@"ueiDictationEuclidSpeechAlternativesSelectedTier1"];
    }
  }
  if (self->_ueiDictationInputModeSwitchContext)
  {
    v148 = [(SISchemaClientEvent *)self ueiDictationInputModeSwitchContext];
    int v149 = [v148 dictionaryRepresentation];
    if (v149)
    {
      [v3 setObject:v149 forKeyedSubscript:@"ueiDictationInputModeSwitchContext"];
    }
    else
    {
      v150 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v150 forKeyedSubscript:@"ueiDictationInputModeSwitchContext"];
    }
  }
  if (self->_ueiDictationPartialResultUpdated)
  {
    v151 = [(SISchemaClientEvent *)self ueiDictationPartialResultUpdated];
    int v152 = [v151 dictionaryRepresentation];
    if (v152)
    {
      [v3 setObject:v152 forKeyedSubscript:@"ueiDictationPartialResultUpdated"];
    }
    else
    {
      v153 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v153 forKeyedSubscript:@"ueiDictationPartialResultUpdated"];
    }
  }
  if (self->_ueiDictationToolTipDisplayContext)
  {
    v154 = [(SISchemaClientEvent *)self ueiDictationToolTipDisplayContext];
    int v155 = [v154 dictionaryRepresentation];
    if (v155)
    {
      [v3 setObject:v155 forKeyedSubscript:@"ueiDictationToolTipDisplayContext"];
    }
    else
    {
      v156 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v156 forKeyedSubscript:@"ueiDictationToolTipDisplayContext"];
    }
  }
  if (self->_ueiDictationTranscriptionTokenized)
  {
    v157 = [(SISchemaClientEvent *)self ueiDictationTranscriptionTokenized];
    int v158 = [v157 dictionaryRepresentation];
    if (v158)
    {
      [v3 setObject:v158 forKeyedSubscript:@"ueiDictationTranscriptionTokenized"];
    }
    else
    {
      v159 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v159 forKeyedSubscript:@"ueiDictationTranscriptionTokenized"];
    }
  }
  if (self->_ueiDictationVoiceCommandDisambiguationAction)
  {
    v160 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandDisambiguationAction];
    int v161 = [v160 dictionaryRepresentation];
    if (v161)
    {
      [v3 setObject:v161 forKeyedSubscript:@"ueiDictationVoiceCommandDisambiguationAction"];
    }
    else
    {
      v162 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v162 forKeyedSubscript:@"ueiDictationVoiceCommandDisambiguationAction"];
    }
  }
  if (self->_ueiDictationVoiceCommandExecuted)
  {
    v163 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandExecuted];
    int v164 = [v163 dictionaryRepresentation];
    if (v164)
    {
      [v3 setObject:v164 forKeyedSubscript:@"ueiDictationVoiceCommandExecuted"];
    }
    else
    {
      v165 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v165 forKeyedSubscript:@"ueiDictationVoiceCommandExecuted"];
    }
  }
  if (self->_ueiDictationVoiceCommandKeyboardAction)
  {
    v166 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandKeyboardAction];
    int v167 = [v166 dictionaryRepresentation];
    if (v167)
    {
      [v3 setObject:v167 forKeyedSubscript:@"ueiDictationVoiceCommandKeyboardAction"];
    }
    else
    {
      v168 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v168 forKeyedSubscript:@"ueiDictationVoiceCommandKeyboardAction"];
    }
  }
  if (self->_ueiDictationVoiceCommandUndoTapAction)
  {
    v169 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandUndoTapAction];
    int v170 = [v169 dictionaryRepresentation];
    if (v170)
    {
      [v3 setObject:v170 forKeyedSubscript:@"ueiDictationVoiceCommandUndoTapAction"];
    }
    else
    {
      v171 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v171 forKeyedSubscript:@"ueiDictationVoiceCommandUndoTapAction"];
    }
  }
  if (self->_ueiInvocationTier1)
  {
    v172 = [(SISchemaClientEvent *)self ueiInvocationTier1];
    int v173 = [v172 dictionaryRepresentation];
    if (v173)
    {
      [v3 setObject:v173 forKeyedSubscript:@"ueiInvocationTier1"];
    }
    else
    {
      v174 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v174 forKeyedSubscript:@"ueiInvocationTier1"];
    }
  }
  if (self->_ueiLaunchContext)
  {
    v175 = [(SISchemaClientEvent *)self ueiLaunchContext];
    int v176 = [v175 dictionaryRepresentation];
    if (v176)
    {
      [v3 setObject:v176 forKeyedSubscript:@"ueiLaunchContext"];
    }
    else
    {
      v177 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v177 forKeyedSubscript:@"ueiLaunchContext"];
    }
  }
  if (self->_ueiRequestCategorization)
  {
    v178 = [(SISchemaClientEvent *)self ueiRequestCategorization];
    int v179 = [v178 dictionaryRepresentation];
    if (v179)
    {
      [v3 setObject:v179 forKeyedSubscript:@"ueiRequestCategorization"];
    }
    else
    {
      v180 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v180 forKeyedSubscript:@"ueiRequestCategorization"];
    }
  }
  if (self->_ueiSiriCarCommandContext)
  {
    v181 = [(SISchemaClientEvent *)self ueiSiriCarCommandContext];
    int v182 = [v181 dictionaryRepresentation];
    if (v182)
    {
      [v3 setObject:v182 forKeyedSubscript:@"ueiSiriCarCommandContext"];
    }
    else
    {
      v183 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v183 forKeyedSubscript:@"ueiSiriCarCommandContext"];
    }
  }
  if (self->_ueiSiriWasUnavailable)
  {
    v184 = [(SISchemaClientEvent *)self ueiSiriWasUnavailable];
    int v185 = [v184 dictionaryRepresentation];
    if (v185)
    {
      [v3 setObject:v185 forKeyedSubscript:@"ueiSiriWasUnavailable"];
    }
    else
    {
      v186 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v186 forKeyedSubscript:@"ueiSiriWasUnavailable"];
    }
  }
  if (self->_ueiUIRenderingContext)
  {
    v187 = [(SISchemaClientEvent *)self ueiUIRenderingContext];
    int v188 = [v187 dictionaryRepresentation];
    if (v188)
    {
      [v3 setObject:v188 forKeyedSubscript:@"ueiUIRenderingContext"];
    }
    else
    {
      v189 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v189 forKeyedSubscript:@"ueiUIRenderingContext"];
    }
  }
  if (self->_ueiUUFRReady)
  {
    v190 = [(SISchemaClientEvent *)self ueiUUFRReady];
    int v191 = [v190 dictionaryRepresentation];
    if (v191)
    {
      [v3 setObject:v191 forKeyedSubscript:@"ueiUUFRReady"];
    }
    else
    {
      v192 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v192 forKeyedSubscript:@"ueiUUFRReady"];
    }
  }
  if (self->_ueiUserBargeInDetected)
  {
    v193 = [(SISchemaClientEvent *)self ueiUserBargeInDetected];
    int v194 = [v193 dictionaryRepresentation];
    if (v194)
    {
      [v3 setObject:v194 forKeyedSubscript:@"ueiUserBargeInDetected"];
    }
    else
    {
      v195 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v195 forKeyedSubscript:@"ueiUserBargeInDetected"];
    }
  }
  if (self->_ueiUserSpeakingContext)
  {
    v196 = [(SISchemaClientEvent *)self ueiUserSpeakingContext];
    int v197 = [v196 dictionaryRepresentation];
    if (v197)
    {
      [v3 setObject:v197 forKeyedSubscript:@"ueiUserSpeakingContext"];
    }
    else
    {
      v198 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v198 forKeyedSubscript:@"ueiUserSpeakingContext"];
    }
  }
  if (self->_ueiVisionSnippetDismissed)
  {
    v199 = [(SISchemaClientEvent *)self ueiVisionSnippetDismissed];
    int v200 = [v199 dictionaryRepresentation];
    if (v200)
    {
      [v3 setObject:v200 forKeyedSubscript:@"ueiVisionSnippetDismissed"];
    }
    else
    {
      v201 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v201 forKeyedSubscript:@"ueiVisionSnippetDismissed"];
    }
  }
  if (self->_uiStateTransition)
  {
    v202 = [(SISchemaClientEvent *)self uiStateTransition];
    int v203 = [v202 dictionaryRepresentation];
    if (v203)
    {
      [v3 setObject:v203 forKeyedSubscript:@"uiStateTransition"];
    }
    else
    {
      v204 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v204 forKeyedSubscript:@"uiStateTransition"];
    }
  }
  if (self->_userViewRegionInteraction)
  {
    v205 = [(SISchemaClientEvent *)self userViewRegionInteraction];
    int v206 = [v205 dictionaryRepresentation];
    if (v206)
    {
      [v3 setObject:v206 forKeyedSubscript:@"userViewRegionInteraction"];
    }
    else
    {
      v207 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v207 forKeyedSubscript:@"userViewRegionInteraction"];
    }
  }
  if (self->_uufrCompletion)
  {
    v208 = [(SISchemaClientEvent *)self uufrCompletion];
    int v209 = [v208 dictionaryRepresentation];
    if (v209)
    {
      [v3 setObject:v209 forKeyedSubscript:@"uufrCompletion"];
    }
    else
    {
      v210 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v210 forKeyedSubscript:@"uufrCompletion"];
    }
  }
  if (self->_uufrFatalError)
  {
    v211 = [(SISchemaClientEvent *)self uufrFatalError];
    int v212 = [v211 dictionaryRepresentation];
    if (v212)
    {
      [v3 setObject:v212 forKeyedSubscript:@"uufrFatalError"];
    }
    else
    {
      v213 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v213 forKeyedSubscript:@"uufrFatalError"];
    }
  }
  if (self->_uufrPresented)
  {
    v214 = [(SISchemaClientEvent *)self uufrPresented];
    int v215 = [v214 dictionaryRepresentation];
    if (v215)
    {
      [v3 setObject:v215 forKeyedSubscript:@"uufrPresented"];
    }
    else
    {
      v216 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v216 forKeyedSubscript:@"uufrPresented"];
    }
  }
  if (self->_uufrSaid)
  {
    v217 = [(SISchemaClientEvent *)self uufrSaid];
    int v218 = [v217 dictionaryRepresentation];
    if (v218)
    {
      [v3 setObject:v218 forKeyedSubscript:@"uufrSaid"];
    }
    else
    {
      v219 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v219 forKeyedSubscript:@"uufrSaid"];
    }
  }
  if (self->_uufrSelected)
  {
    v220 = [(SISchemaClientEvent *)self uufrSelected];
    int v221 = [v220 dictionaryRepresentation];
    if (v221)
    {
      [v3 setObject:v221 forKeyedSubscript:@"uufrSelected"];
    }
    else
    {
      v222 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v222 forKeyedSubscript:@"uufrSelected"];
    }
  }
  if (self->_uufrShown)
  {
    v223 = [(SISchemaClientEvent *)self uufrShown];
    int v224 = [v223 dictionaryRepresentation];
    if (v224)
    {
      [v3 setObject:v224 forKeyedSubscript:@"uufrShown"];
    }
    else
    {
      v225 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v225 forKeyedSubscript:@"uufrShown"];
    }
  }
  if (self->_uufrShownTier1)
  {
    objc_super v226 = [(SISchemaClientEvent *)self uufrShownTier1];
    int v227 = [v226 dictionaryRepresentation];
    if (v227)
    {
      [v3 setObject:v227 forKeyedSubscript:@"uufrShownTier1"];
    }
    else
    {
      v228 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v228 forKeyedSubscript:@"uufrShownTier1"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v229 = v3;

  return v229;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(SISchemaClientTransportEventMetadata *)self->_transportMetadata hash] ^ v3;
  unint64_t v5 = [(SISchemaAudioFirstBufferRecorded *)self->_audioFirstBufferRecorded hash];
  unint64_t v6 = v4 ^ v5 ^ [(SISchemaAudioStopRecording *)self->_audioStopRecording hash];
  unint64_t v7 = [(SISchemaConversationTrace *)self->_clientConversationTrace hash];
  unint64_t v8 = v7 ^ [(SISchemaDeviceDynamicContext *)self->_deviceDynamicContext hash];
  unint64_t v9 = v6 ^ v8 ^ [(SISchemaDeviceFixedContext *)self->_deviceFixedContext hash];
  unint64_t v10 = [(SISchemaDictationContext *)self->_dictationContext hash];
  unint64_t v11 = v10 ^ [(SISchemaInvocation *)self->_invocation hash];
  unint64_t v12 = v11 ^ [(SISchemaLocation *)self->_location hash];
  unint64_t v13 = v9 ^ v12 ^ [(SISchemaPunchOut *)self->_punchOut hash];
  unint64_t v14 = [(SISchemaSiriCue *)self->_siriCue hash];
  unint64_t v15 = v14 ^ [(SISchemaUUFRPresented *)self->_uufrPresented hash];
  unint64_t v16 = v15 ^ [(SISchemaSpeechTranscription *)self->_speechTranscription hash];
  unint64_t v17 = v16 ^ [(SISchemaTextToSpeechBegin *)self->_textToSpeechBegin hash];
  unint64_t v18 = v13 ^ v17 ^ [(SISchemaTextToSpeechEnd *)self->_textToSpeechEnd hash];
  unint64_t v19 = [(SISchemaUIStateTransition *)self->_uiStateTransition hash];
  unint64_t v20 = v19 ^ [(SISchemaClientFlow *)self->_clientFlow hash];
  unint64_t v21 = v20 ^ [(SISchemaDialogOutput *)self->_dialogOutput hash];
  unint64_t v22 = v21 ^ [(SISchemaDictationEndPointStop *)self->_dictationEndPointStop hash];
  unint64_t v23 = v22 ^ [(SISchemaDictationEndPointCancel *)self->_dictationEndPointCancel hash];
  unint64_t v24 = v18 ^ v23 ^ [(SISchemaDictationAlternativeSelected *)self->_dictationAlternativeSelected hash];
  unint64_t v25 = [(SISchemaDictationTranscriptionMetadata *)self->_dictationTranscriptionMetadata hash];
  unint64_t v26 = v25 ^ [(SISchemaCarPlayHeadUnitContext *)self->_carPlayHeadUnitContext hash];
  unint64_t v27 = v26 ^ [(SISchemaUUFRCompletion *)self->_uufrCompletion hash];
  unint64_t v28 = v27 ^ [(SISchemaUUFRShown *)self->_uufrShown hash];
  unint64_t v29 = v28 ^ [(SISchemaUUFRSaid *)self->_uufrSaid hash];
  unint64_t v30 = v29 ^ [(SISchemaUUFRFatalError *)self->_uufrFatalError hash];
  unint64_t v31 = v24 ^ v30 ^ [(SISchemaDictationAlternativesViewed *)self->_dictationAlternativesViewed hash];
  unint64_t v32 = [(SISchemaIntercomMessageRecorded *)self->_intercomMessageRecorded hash];
  unint64_t v33 = v32 ^ [(SISchemaCasinoRelationship *)self->_casinoRelationship hash];
  unint64_t v34 = v33 ^ [(SISchemaUserViewRegionInteraction *)self->_userViewRegionInteraction hash];
  unint64_t v35 = v34 ^ [(SISchemaDeviceLockStateChanged *)self->_deviceLockStateChanged hash];
  unint64_t v36 = v35 ^ [(SISchemaUEIRequestCategorization *)self->_ueiRequestCategorization hash];
  unint64_t v37 = v36 ^ [(SISchemaAudioStopRecordingStarted *)self->_audioStopRecordingStarted hash];
  unint64_t v38 = v37 ^ [(SISchemaUEILaunchContext *)self->_ueiLaunchContext hash];
  unint64_t v39 = v31 ^ v38 ^ [(SISchemaUEIUserSpeakingContext *)self->_ueiUserSpeakingContext hash];
  unint64_t v40 = [(SISchemaUEIUUFRReady *)self->_ueiUUFRReady hash];
  unint64_t v41 = v40 ^ [(SISchemaUEIUIRenderingContext *)self->_ueiUIRenderingContext hash];
  unint64_t v42 = v41 ^ [(SISchemaPNRTextToSpeechRequestReceived *)self->_pnrTextToSpeechRequestReceived hash];
  unint64_t v43 = v42 ^ [(SISchemaPNRSpeechRecognitionSourceContext *)self->_pnrSpeechRecognitionSourceContext hash];
  unint64_t v44 = v43 ^ [(SISchemaPNRFatalError *)self->_pnrFatalError hash];
  unint64_t v45 = v44 ^ [(SISchemaTurnMTERequest *)self->_turnMTERequest hash];
  unint64_t v46 = v45 ^ [(SISchemaKeyboardDismissed *)self->_keyboardDismissed hash];
  unint64_t v47 = v46 ^ [(SISchemaEngagedAccessoryContext *)self->_engagedAccessoryContext hash];
  unint64_t v48 = v39 ^ v47 ^ [(SISchemaAnnounceCarPlayBannerTapped *)self->_announceCarPlayBannerTapped hash];
  unint64_t v49 = [(SISchemaAnnounceCarPlayGlyphSettingToggled *)self->_announceCarPlayGlyphSettingToggled hash];
  unint64_t v50 = v49 ^ [(SISchemaDictationContentEdited *)self->_dictationContentEdited hash];
  unint64_t v51 = v50 ^ [(SISchemaUUFRShownTier1 *)self->_uufrShownTier1 hash];
  unint64_t v52 = v51 ^ [(SISchemaUEIDictationPartialResultUpdated *)self->_ueiDictationPartialResultUpdated hash];
  unint64_t v53 = v52 ^ [(SISchemaUEIDictationVoiceCommandExecuted *)self->_ueiDictationVoiceCommandExecuted hash];
  unint64_t v54 = v53 ^ [(SISchemaUEIDictationInputModeSwitchContext *)self->_ueiDictationInputModeSwitchContext hash];
  unint64_t v55 = v54 ^ [(SISchemaUEIDictationDiscoveryToolTipDisplayContext *)self->_ueiDictationToolTipDisplayContext hash];
  unint64_t v56 = v55 ^ [(SISchemaUEIHostingPlatformViewAppearContext *)self->_hostPlatformViewAppearContext hash];
  unint64_t v57 = v56 ^ [(SISchemaUEIHostingPlatformViewDisappearContext *)self->_hostPlatformViewDisappearContext hash];
  unint64_t v58 = v48 ^ v57 ^ [(SISchemaUEIDictationTranscriptionTokenized *)self->_ueiDictationTranscriptionTokenized hash];
  unint64_t v59 = [(SISchemaUEIDictationAlternativeConfusionPairsSelected *)self->_dictationAlternativesSelected hash];
  unint64_t v60 = v59 ^ [(SISchemaUUFRSelected *)self->_uufrSelected hash];
  unint64_t v61 = v60 ^ [(SISchemaUEIDictationAlternativeTextPairsSelected *)self->_ueiDictationAlternativeTextPairsSelected hash];
  unint64_t v62 = v61 ^ [(SISchemaUEIUserBargeInDetected *)self->_ueiUserBargeInDetected hash];
  unint64_t v63 = v62 ^ [(SISchemaUEIDictationEnablementPromptShown *)self->_ueiDictationEnablementPromptShown hash];
  unint64_t v64 = v63 ^ [(SISchemaUEISiriCarCommandContext *)self->_ueiSiriCarCommandContext hash];
  unint64_t v65 = v64 ^ [(SISchemaUEIVisionSnippetDismissed *)self->_ueiVisionSnippetDismissed hash];
  unint64_t v66 = v65 ^ [(SISchemaUEISiriWasUnavailable *)self->_ueiSiriWasUnavailable hash];
  unint64_t v67 = v66 ^ [(SISchemaBluetoothCarPreferredAudioRouteChanged *)self->_preferredAudioRouteChanged hash];
  unint64_t v68 = v67 ^ [(SISchemaUEIDictationContentEditedTier1 *)self->_ueiDictationContentEditedTier1 hash];
  unint64_t v69 = v58 ^ v68 ^ [(SISchemaUEIDictationVoiceCommandUndoTapAction *)self->_ueiDictationVoiceCommandUndoTapAction hash];
  unint64_t v70 = [(SISchemaUEIDictationVoiceCommandDisambiguationAction *)self->_ueiDictationVoiceCommandDisambiguationAction hash];
  unint64_t v71 = v70 ^ [(SISchemaUEIDictationVoiceCommandKeyboardAction *)self->_ueiDictationVoiceCommandKeyboardAction hash];
  unint64_t v72 = v71 ^ [(SISchemaUEIDictationEuclidAlternativesEvent *)self->_ueiDictationEuclidAlternativesEvent hash];
  unint64_t v73 = v72 ^ [(SISchemaUEIDictationEuclidAlternativesEventTier1 *)self->_ueiDictationEuclidAlternativesEventTier1 hash];
  unint64_t v74 = v73 ^ [(SISchemaUEIDictationEuclidSpeechAlternativesSelected *)self->_ueiDictationEuclidSpeechAlternativesSelected hash];
  unint64_t v75 = v74 ^ [(SISchemaUEIDictationEuclidSpeechAlternativesSelectedTier1 *)self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 hash];
  unint64_t v76 = v75 ^ [(SISchemaTypingRequestTrace *)self->_typingRequestTrace hash];
  return v69 ^ v76 ^ [(SISchemaUEIInvocationTier1 *)self->_ueiInvocationTier1 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_378;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_378;
  }
  unint64_t v6 = [(SISchemaClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v8 = [(SISchemaClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(SISchemaClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self transportMetadata];
  unint64_t v7 = [v4 transportMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v13 = [(SISchemaClientEvent *)self transportMetadata];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(SISchemaClientEvent *)self transportMetadata];
    unint64_t v16 = [v4 transportMetadata];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self audioFirstBufferRecorded];
  unint64_t v7 = [v4 audioFirstBufferRecorded];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v18 = [(SISchemaClientEvent *)self audioFirstBufferRecorded];
  if (v18)
  {
    unint64_t v19 = (void *)v18;
    unint64_t v20 = [(SISchemaClientEvent *)self audioFirstBufferRecorded];
    unint64_t v21 = [v4 audioFirstBufferRecorded];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self audioStopRecording];
  unint64_t v7 = [v4 audioStopRecording];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v23 = [(SISchemaClientEvent *)self audioStopRecording];
  if (v23)
  {
    unint64_t v24 = (void *)v23;
    unint64_t v25 = [(SISchemaClientEvent *)self audioStopRecording];
    unint64_t v26 = [v4 audioStopRecording];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self clientConversationTrace];
  unint64_t v7 = [v4 clientConversationTrace];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v28 = [(SISchemaClientEvent *)self clientConversationTrace];
  if (v28)
  {
    unint64_t v29 = (void *)v28;
    unint64_t v30 = [(SISchemaClientEvent *)self clientConversationTrace];
    unint64_t v31 = [v4 clientConversationTrace];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self deviceDynamicContext];
  unint64_t v7 = [v4 deviceDynamicContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v33 = [(SISchemaClientEvent *)self deviceDynamicContext];
  if (v33)
  {
    unint64_t v34 = (void *)v33;
    unint64_t v35 = [(SISchemaClientEvent *)self deviceDynamicContext];
    unint64_t v36 = [v4 deviceDynamicContext];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self deviceFixedContext];
  unint64_t v7 = [v4 deviceFixedContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v38 = [(SISchemaClientEvent *)self deviceFixedContext];
  if (v38)
  {
    unint64_t v39 = (void *)v38;
    unint64_t v40 = [(SISchemaClientEvent *)self deviceFixedContext];
    unint64_t v41 = [v4 deviceFixedContext];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self dictationContext];
  unint64_t v7 = [v4 dictationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v43 = [(SISchemaClientEvent *)self dictationContext];
  if (v43)
  {
    unint64_t v44 = (void *)v43;
    unint64_t v45 = [(SISchemaClientEvent *)self dictationContext];
    unint64_t v46 = [v4 dictationContext];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self invocation];
  unint64_t v7 = [v4 invocation];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v48 = [(SISchemaClientEvent *)self invocation];
  if (v48)
  {
    unint64_t v49 = (void *)v48;
    unint64_t v50 = [(SISchemaClientEvent *)self invocation];
    unint64_t v51 = [v4 invocation];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self location];
  unint64_t v7 = [v4 location];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v53 = [(SISchemaClientEvent *)self location];
  if (v53)
  {
    unint64_t v54 = (void *)v53;
    unint64_t v55 = [(SISchemaClientEvent *)self location];
    unint64_t v56 = [v4 location];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self punchOut];
  unint64_t v7 = [v4 punchOut];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v58 = [(SISchemaClientEvent *)self punchOut];
  if (v58)
  {
    unint64_t v59 = (void *)v58;
    unint64_t v60 = [(SISchemaClientEvent *)self punchOut];
    unint64_t v61 = [v4 punchOut];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self siriCue];
  unint64_t v7 = [v4 siriCue];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v63 = [(SISchemaClientEvent *)self siriCue];
  if (v63)
  {
    unint64_t v64 = (void *)v63;
    unint64_t v65 = [(SISchemaClientEvent *)self siriCue];
    unint64_t v66 = [v4 siriCue];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self uufrPresented];
  unint64_t v7 = [v4 uufrPresented];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v68 = [(SISchemaClientEvent *)self uufrPresented];
  if (v68)
  {
    unint64_t v69 = (void *)v68;
    unint64_t v70 = [(SISchemaClientEvent *)self uufrPresented];
    unint64_t v71 = [v4 uufrPresented];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self speechTranscription];
  unint64_t v7 = [v4 speechTranscription];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v73 = [(SISchemaClientEvent *)self speechTranscription];
  if (v73)
  {
    unint64_t v74 = (void *)v73;
    unint64_t v75 = [(SISchemaClientEvent *)self speechTranscription];
    unint64_t v76 = [v4 speechTranscription];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self textToSpeechBegin];
  unint64_t v7 = [v4 textToSpeechBegin];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v78 = [(SISchemaClientEvent *)self textToSpeechBegin];
  if (v78)
  {
    v79 = (void *)v78;
    uint64_t v80 = [(SISchemaClientEvent *)self textToSpeechBegin];
    v81 = [v4 textToSpeechBegin];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self textToSpeechEnd];
  unint64_t v7 = [v4 textToSpeechEnd];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v83 = [(SISchemaClientEvent *)self textToSpeechEnd];
  if (v83)
  {
    uint64_t v84 = (void *)v83;
    v85 = [(SISchemaClientEvent *)self textToSpeechEnd];
    uint64_t v86 = [v4 textToSpeechEnd];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self uiStateTransition];
  unint64_t v7 = [v4 uiStateTransition];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v88 = [(SISchemaClientEvent *)self uiStateTransition];
  if (v88)
  {
    int v89 = (void *)v88;
    uint64_t v90 = [(SISchemaClientEvent *)self uiStateTransition];
    v91 = [v4 uiStateTransition];
    int v92 = [v90 isEqual:v91];

    if (!v92) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self clientFlow];
  unint64_t v7 = [v4 clientFlow];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v93 = [(SISchemaClientEvent *)self clientFlow];
  if (v93)
  {
    uint64_t v94 = (void *)v93;
    int v95 = [(SISchemaClientEvent *)self clientFlow];
    uint64_t v96 = [v4 clientFlow];
    int v97 = [v95 isEqual:v96];

    if (!v97) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self dialogOutput];
  unint64_t v7 = [v4 dialogOutput];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v98 = [(SISchemaClientEvent *)self dialogOutput];
  if (v98)
  {
    v99 = (void *)v98;
    uint64_t v100 = [(SISchemaClientEvent *)self dialogOutput];
    int v101 = [v4 dialogOutput];
    int v102 = [v100 isEqual:v101];

    if (!v102) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self dictationEndPointStop];
  unint64_t v7 = [v4 dictationEndPointStop];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v103 = [(SISchemaClientEvent *)self dictationEndPointStop];
  if (v103)
  {
    uint64_t v104 = (void *)v103;
    v105 = [(SISchemaClientEvent *)self dictationEndPointStop];
    uint64_t v106 = [v4 dictationEndPointStop];
    int v107 = [v105 isEqual:v106];

    if (!v107) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self dictationEndPointCancel];
  unint64_t v7 = [v4 dictationEndPointCancel];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v108 = [(SISchemaClientEvent *)self dictationEndPointCancel];
  if (v108)
  {
    v109 = (void *)v108;
    uint64_t v110 = [(SISchemaClientEvent *)self dictationEndPointCancel];
    v111 = [v4 dictationEndPointCancel];
    int v112 = [v110 isEqual:v111];

    if (!v112) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self dictationAlternativeSelected];
  unint64_t v7 = [v4 dictationAlternativeSelected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v113 = [(SISchemaClientEvent *)self dictationAlternativeSelected];
  if (v113)
  {
    uint64_t v114 = (void *)v113;
    v115 = [(SISchemaClientEvent *)self dictationAlternativeSelected];
    uint64_t v116 = [v4 dictationAlternativeSelected];
    int v117 = [v115 isEqual:v116];

    if (!v117) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self dictationTranscriptionMetadata];
  unint64_t v7 = [v4 dictationTranscriptionMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v118 = [(SISchemaClientEvent *)self dictationTranscriptionMetadata];
  if (v118)
  {
    int v119 = (void *)v118;
    uint64_t v120 = [(SISchemaClientEvent *)self dictationTranscriptionMetadata];
    v121 = [v4 dictationTranscriptionMetadata];
    int v122 = [v120 isEqual:v121];

    if (!v122) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self carPlayHeadUnitContext];
  unint64_t v7 = [v4 carPlayHeadUnitContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v123 = [(SISchemaClientEvent *)self carPlayHeadUnitContext];
  if (v123)
  {
    uint64_t v124 = (void *)v123;
    int v125 = [(SISchemaClientEvent *)self carPlayHeadUnitContext];
    uint64_t v126 = [v4 carPlayHeadUnitContext];
    int v127 = [v125 isEqual:v126];

    if (!v127) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self uufrCompletion];
  unint64_t v7 = [v4 uufrCompletion];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v128 = [(SISchemaClientEvent *)self uufrCompletion];
  if (v128)
  {
    v129 = (void *)v128;
    uint64_t v130 = [(SISchemaClientEvent *)self uufrCompletion];
    int v131 = [v4 uufrCompletion];
    int v132 = [v130 isEqual:v131];

    if (!v132) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self uufrShown];
  unint64_t v7 = [v4 uufrShown];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v133 = [(SISchemaClientEvent *)self uufrShown];
  if (v133)
  {
    uint64_t v134 = (void *)v133;
    v135 = [(SISchemaClientEvent *)self uufrShown];
    uint64_t v136 = [v4 uufrShown];
    int v137 = [v135 isEqual:v136];

    if (!v137) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self uufrSaid];
  unint64_t v7 = [v4 uufrSaid];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v138 = [(SISchemaClientEvent *)self uufrSaid];
  if (v138)
  {
    v139 = (void *)v138;
    uint64_t v140 = [(SISchemaClientEvent *)self uufrSaid];
    v141 = [v4 uufrSaid];
    int v142 = [v140 isEqual:v141];

    if (!v142) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self uufrFatalError];
  unint64_t v7 = [v4 uufrFatalError];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v143 = [(SISchemaClientEvent *)self uufrFatalError];
  if (v143)
  {
    v144 = (void *)v143;
    v145 = [(SISchemaClientEvent *)self uufrFatalError];
    int v146 = [v4 uufrFatalError];
    int v147 = [v145 isEqual:v146];

    if (!v147) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self dictationAlternativesViewed];
  unint64_t v7 = [v4 dictationAlternativesViewed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v148 = [(SISchemaClientEvent *)self dictationAlternativesViewed];
  if (v148)
  {
    int v149 = (void *)v148;
    v150 = [(SISchemaClientEvent *)self dictationAlternativesViewed];
    v151 = [v4 dictationAlternativesViewed];
    int v152 = [v150 isEqual:v151];

    if (!v152) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self intercomMessageRecorded];
  unint64_t v7 = [v4 intercomMessageRecorded];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v153 = [(SISchemaClientEvent *)self intercomMessageRecorded];
  if (v153)
  {
    v154 = (void *)v153;
    int v155 = [(SISchemaClientEvent *)self intercomMessageRecorded];
    v156 = [v4 intercomMessageRecorded];
    int v157 = [v155 isEqual:v156];

    if (!v157) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self casinoRelationship];
  unint64_t v7 = [v4 casinoRelationship];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v158 = [(SISchemaClientEvent *)self casinoRelationship];
  if (v158)
  {
    v159 = (void *)v158;
    v160 = [(SISchemaClientEvent *)self casinoRelationship];
    int v161 = [v4 casinoRelationship];
    int v162 = [v160 isEqual:v161];

    if (!v162) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self userViewRegionInteraction];
  unint64_t v7 = [v4 userViewRegionInteraction];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v163 = [(SISchemaClientEvent *)self userViewRegionInteraction];
  if (v163)
  {
    int v164 = (void *)v163;
    v165 = [(SISchemaClientEvent *)self userViewRegionInteraction];
    v166 = [v4 userViewRegionInteraction];
    int v167 = [v165 isEqual:v166];

    if (!v167) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self deviceLockStateChanged];
  unint64_t v7 = [v4 deviceLockStateChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v168 = [(SISchemaClientEvent *)self deviceLockStateChanged];
  if (v168)
  {
    v169 = (void *)v168;
    int v170 = [(SISchemaClientEvent *)self deviceLockStateChanged];
    v171 = [v4 deviceLockStateChanged];
    int v172 = [v170 isEqual:v171];

    if (!v172) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiRequestCategorization];
  unint64_t v7 = [v4 ueiRequestCategorization];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v173 = [(SISchemaClientEvent *)self ueiRequestCategorization];
  if (v173)
  {
    v174 = (void *)v173;
    v175 = [(SISchemaClientEvent *)self ueiRequestCategorization];
    int v176 = [v4 ueiRequestCategorization];
    int v177 = [v175 isEqual:v176];

    if (!v177) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self audioStopRecordingStarted];
  unint64_t v7 = [v4 audioStopRecordingStarted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v178 = [(SISchemaClientEvent *)self audioStopRecordingStarted];
  if (v178)
  {
    int v179 = (void *)v178;
    v180 = [(SISchemaClientEvent *)self audioStopRecordingStarted];
    v181 = [v4 audioStopRecordingStarted];
    int v182 = [v180 isEqual:v181];

    if (!v182) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiLaunchContext];
  unint64_t v7 = [v4 ueiLaunchContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v183 = [(SISchemaClientEvent *)self ueiLaunchContext];
  if (v183)
  {
    v184 = (void *)v183;
    int v185 = [(SISchemaClientEvent *)self ueiLaunchContext];
    v186 = [v4 ueiLaunchContext];
    int v187 = [v185 isEqual:v186];

    if (!v187) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiUserSpeakingContext];
  unint64_t v7 = [v4 ueiUserSpeakingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v188 = [(SISchemaClientEvent *)self ueiUserSpeakingContext];
  if (v188)
  {
    v189 = (void *)v188;
    v190 = [(SISchemaClientEvent *)self ueiUserSpeakingContext];
    int v191 = [v4 ueiUserSpeakingContext];
    int v192 = [v190 isEqual:v191];

    if (!v192) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiUUFRReady];
  unint64_t v7 = [v4 ueiUUFRReady];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v193 = [(SISchemaClientEvent *)self ueiUUFRReady];
  if (v193)
  {
    int v194 = (void *)v193;
    v195 = [(SISchemaClientEvent *)self ueiUUFRReady];
    v196 = [v4 ueiUUFRReady];
    int v197 = [v195 isEqual:v196];

    if (!v197) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiUIRenderingContext];
  unint64_t v7 = [v4 ueiUIRenderingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v198 = [(SISchemaClientEvent *)self ueiUIRenderingContext];
  if (v198)
  {
    v199 = (void *)v198;
    int v200 = [(SISchemaClientEvent *)self ueiUIRenderingContext];
    v201 = [v4 ueiUIRenderingContext];
    int v202 = [v200 isEqual:v201];

    if (!v202) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self pnrTextToSpeechRequestReceived];
  unint64_t v7 = [v4 pnrTextToSpeechRequestReceived];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v203 = [(SISchemaClientEvent *)self pnrTextToSpeechRequestReceived];
  if (v203)
  {
    v204 = (void *)v203;
    v205 = [(SISchemaClientEvent *)self pnrTextToSpeechRequestReceived];
    int v206 = [v4 pnrTextToSpeechRequestReceived];
    int v207 = [v205 isEqual:v206];

    if (!v207) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self pnrSpeechRecognitionSourceContext];
  unint64_t v7 = [v4 pnrSpeechRecognitionSourceContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v208 = [(SISchemaClientEvent *)self pnrSpeechRecognitionSourceContext];
  if (v208)
  {
    int v209 = (void *)v208;
    v210 = [(SISchemaClientEvent *)self pnrSpeechRecognitionSourceContext];
    v211 = [v4 pnrSpeechRecognitionSourceContext];
    int v212 = [v210 isEqual:v211];

    if (!v212) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self pnrFatalError];
  unint64_t v7 = [v4 pnrFatalError];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v213 = [(SISchemaClientEvent *)self pnrFatalError];
  if (v213)
  {
    v214 = (void *)v213;
    int v215 = [(SISchemaClientEvent *)self pnrFatalError];
    v216 = [v4 pnrFatalError];
    int v217 = [v215 isEqual:v216];

    if (!v217) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self turnMTERequest];
  unint64_t v7 = [v4 turnMTERequest];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v218 = [(SISchemaClientEvent *)self turnMTERequest];
  if (v218)
  {
    v219 = (void *)v218;
    v220 = [(SISchemaClientEvent *)self turnMTERequest];
    int v221 = [v4 turnMTERequest];
    int v222 = [v220 isEqual:v221];

    if (!v222) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self keyboardDismissed];
  unint64_t v7 = [v4 keyboardDismissed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v223 = [(SISchemaClientEvent *)self keyboardDismissed];
  if (v223)
  {
    int v224 = (void *)v223;
    v225 = [(SISchemaClientEvent *)self keyboardDismissed];
    objc_super v226 = [v4 keyboardDismissed];
    int v227 = [v225 isEqual:v226];

    if (!v227) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self engagedAccessoryContext];
  unint64_t v7 = [v4 engagedAccessoryContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v228 = [(SISchemaClientEvent *)self engagedAccessoryContext];
  if (v228)
  {
    id v229 = (void *)v228;
    int v230 = [(SISchemaClientEvent *)self engagedAccessoryContext];
    id v231 = [v4 engagedAccessoryContext];
    int v232 = [v230 isEqual:v231];

    if (!v232) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self announceCarPlayBannerTapped];
  unint64_t v7 = [v4 announceCarPlayBannerTapped];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v233 = [(SISchemaClientEvent *)self announceCarPlayBannerTapped];
  if (v233)
  {
    v234 = (void *)v233;
    v235 = [(SISchemaClientEvent *)self announceCarPlayBannerTapped];
    v236 = [v4 announceCarPlayBannerTapped];
    int v237 = [v235 isEqual:v236];

    if (!v237) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self announceCarPlayGlyphSettingToggled];
  unint64_t v7 = [v4 announceCarPlayGlyphSettingToggled];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v238 = [(SISchemaClientEvent *)self announceCarPlayGlyphSettingToggled];
  if (v238)
  {
    v239 = (void *)v238;
    v240 = [(SISchemaClientEvent *)self announceCarPlayGlyphSettingToggled];
    v241 = [v4 announceCarPlayGlyphSettingToggled];
    int v242 = [v240 isEqual:v241];

    if (!v242) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self dictationContentEdited];
  unint64_t v7 = [v4 dictationContentEdited];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v243 = [(SISchemaClientEvent *)self dictationContentEdited];
  if (v243)
  {
    v244 = (void *)v243;
    v245 = [(SISchemaClientEvent *)self dictationContentEdited];
    v246 = [v4 dictationContentEdited];
    int v247 = [v245 isEqual:v246];

    if (!v247) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self uufrShownTier1];
  unint64_t v7 = [v4 uufrShownTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v248 = [(SISchemaClientEvent *)self uufrShownTier1];
  if (v248)
  {
    v249 = (void *)v248;
    v250 = [(SISchemaClientEvent *)self uufrShownTier1];
    v251 = [v4 uufrShownTier1];
    int v252 = [v250 isEqual:v251];

    if (!v252) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationPartialResultUpdated];
  unint64_t v7 = [v4 ueiDictationPartialResultUpdated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v253 = [(SISchemaClientEvent *)self ueiDictationPartialResultUpdated];
  if (v253)
  {
    v254 = (void *)v253;
    v255 = [(SISchemaClientEvent *)self ueiDictationPartialResultUpdated];
    v256 = [v4 ueiDictationPartialResultUpdated];
    int v257 = [v255 isEqual:v256];

    if (!v257) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandExecuted];
  unint64_t v7 = [v4 ueiDictationVoiceCommandExecuted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v258 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandExecuted];
  if (v258)
  {
    v259 = (void *)v258;
    v260 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandExecuted];
    v261 = [v4 ueiDictationVoiceCommandExecuted];
    int v262 = [v260 isEqual:v261];

    if (!v262) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationInputModeSwitchContext];
  unint64_t v7 = [v4 ueiDictationInputModeSwitchContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v263 = [(SISchemaClientEvent *)self ueiDictationInputModeSwitchContext];
  if (v263)
  {
    v264 = (void *)v263;
    v265 = [(SISchemaClientEvent *)self ueiDictationInputModeSwitchContext];
    v266 = [v4 ueiDictationInputModeSwitchContext];
    int v267 = [v265 isEqual:v266];

    if (!v267) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationToolTipDisplayContext];
  unint64_t v7 = [v4 ueiDictationToolTipDisplayContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v268 = [(SISchemaClientEvent *)self ueiDictationToolTipDisplayContext];
  if (v268)
  {
    v269 = (void *)v268;
    v270 = [(SISchemaClientEvent *)self ueiDictationToolTipDisplayContext];
    v271 = [v4 ueiDictationToolTipDisplayContext];
    int v272 = [v270 isEqual:v271];

    if (!v272) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self hostPlatformViewAppearContext];
  unint64_t v7 = [v4 hostPlatformViewAppearContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v273 = [(SISchemaClientEvent *)self hostPlatformViewAppearContext];
  if (v273)
  {
    v274 = (void *)v273;
    v275 = [(SISchemaClientEvent *)self hostPlatformViewAppearContext];
    v276 = [v4 hostPlatformViewAppearContext];
    int v277 = [v275 isEqual:v276];

    if (!v277) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self hostPlatformViewDisappearContext];
  unint64_t v7 = [v4 hostPlatformViewDisappearContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v278 = [(SISchemaClientEvent *)self hostPlatformViewDisappearContext];
  if (v278)
  {
    v279 = (void *)v278;
    v280 = [(SISchemaClientEvent *)self hostPlatformViewDisappearContext];
    v281 = [v4 hostPlatformViewDisappearContext];
    int v282 = [v280 isEqual:v281];

    if (!v282) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationTranscriptionTokenized];
  unint64_t v7 = [v4 ueiDictationTranscriptionTokenized];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v283 = [(SISchemaClientEvent *)self ueiDictationTranscriptionTokenized];
  if (v283)
  {
    v284 = (void *)v283;
    v285 = [(SISchemaClientEvent *)self ueiDictationTranscriptionTokenized];
    v286 = [v4 ueiDictationTranscriptionTokenized];
    int v287 = [v285 isEqual:v286];

    if (!v287) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self dictationAlternativesSelected];
  unint64_t v7 = [v4 dictationAlternativesSelected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v288 = [(SISchemaClientEvent *)self dictationAlternativesSelected];
  if (v288)
  {
    v289 = (void *)v288;
    v290 = [(SISchemaClientEvent *)self dictationAlternativesSelected];
    v291 = [v4 dictationAlternativesSelected];
    int v292 = [v290 isEqual:v291];

    if (!v292) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self uufrSelected];
  unint64_t v7 = [v4 uufrSelected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v293 = [(SISchemaClientEvent *)self uufrSelected];
  if (v293)
  {
    v294 = (void *)v293;
    v295 = [(SISchemaClientEvent *)self uufrSelected];
    v296 = [v4 uufrSelected];
    int v297 = [v295 isEqual:v296];

    if (!v297) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationAlternativeTextPairsSelected];
  unint64_t v7 = [v4 ueiDictationAlternativeTextPairsSelected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v298 = [(SISchemaClientEvent *)self ueiDictationAlternativeTextPairsSelected];
  if (v298)
  {
    v299 = (void *)v298;
    v300 = [(SISchemaClientEvent *)self ueiDictationAlternativeTextPairsSelected];
    v301 = [v4 ueiDictationAlternativeTextPairsSelected];
    int v302 = [v300 isEqual:v301];

    if (!v302) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiUserBargeInDetected];
  unint64_t v7 = [v4 ueiUserBargeInDetected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v303 = [(SISchemaClientEvent *)self ueiUserBargeInDetected];
  if (v303)
  {
    v304 = (void *)v303;
    v305 = [(SISchemaClientEvent *)self ueiUserBargeInDetected];
    v306 = [v4 ueiUserBargeInDetected];
    int v307 = [v305 isEqual:v306];

    if (!v307) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationEnablementPromptShown];
  unint64_t v7 = [v4 ueiDictationEnablementPromptShown];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v308 = [(SISchemaClientEvent *)self ueiDictationEnablementPromptShown];
  if (v308)
  {
    v309 = (void *)v308;
    v310 = [(SISchemaClientEvent *)self ueiDictationEnablementPromptShown];
    v311 = [v4 ueiDictationEnablementPromptShown];
    int v312 = [v310 isEqual:v311];

    if (!v312) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiSiriCarCommandContext];
  unint64_t v7 = [v4 ueiSiriCarCommandContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v313 = [(SISchemaClientEvent *)self ueiSiriCarCommandContext];
  if (v313)
  {
    v314 = (void *)v313;
    v315 = [(SISchemaClientEvent *)self ueiSiriCarCommandContext];
    v316 = [v4 ueiSiriCarCommandContext];
    int v317 = [v315 isEqual:v316];

    if (!v317) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiVisionSnippetDismissed];
  unint64_t v7 = [v4 ueiVisionSnippetDismissed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v318 = [(SISchemaClientEvent *)self ueiVisionSnippetDismissed];
  if (v318)
  {
    v319 = (void *)v318;
    v320 = [(SISchemaClientEvent *)self ueiVisionSnippetDismissed];
    v321 = [v4 ueiVisionSnippetDismissed];
    int v322 = [v320 isEqual:v321];

    if (!v322) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiSiriWasUnavailable];
  unint64_t v7 = [v4 ueiSiriWasUnavailable];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v323 = [(SISchemaClientEvent *)self ueiSiriWasUnavailable];
  if (v323)
  {
    v324 = (void *)v323;
    v325 = [(SISchemaClientEvent *)self ueiSiriWasUnavailable];
    v326 = [v4 ueiSiriWasUnavailable];
    int v327 = [v325 isEqual:v326];

    if (!v327) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self preferredAudioRouteChanged];
  unint64_t v7 = [v4 preferredAudioRouteChanged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v328 = [(SISchemaClientEvent *)self preferredAudioRouteChanged];
  if (v328)
  {
    v329 = (void *)v328;
    v330 = [(SISchemaClientEvent *)self preferredAudioRouteChanged];
    v331 = [v4 preferredAudioRouteChanged];
    int v332 = [v330 isEqual:v331];

    if (!v332) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationContentEditedTier1];
  unint64_t v7 = [v4 ueiDictationContentEditedTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v333 = [(SISchemaClientEvent *)self ueiDictationContentEditedTier1];
  if (v333)
  {
    v334 = (void *)v333;
    v335 = [(SISchemaClientEvent *)self ueiDictationContentEditedTier1];
    v336 = [v4 ueiDictationContentEditedTier1];
    int v337 = [v335 isEqual:v336];

    if (!v337) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandUndoTapAction];
  unint64_t v7 = [v4 ueiDictationVoiceCommandUndoTapAction];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v338 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandUndoTapAction];
  if (v338)
  {
    v339 = (void *)v338;
    v340 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandUndoTapAction];
    v341 = [v4 ueiDictationVoiceCommandUndoTapAction];
    int v342 = [v340 isEqual:v341];

    if (!v342) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandDisambiguationAction];
  unint64_t v7 = [v4 ueiDictationVoiceCommandDisambiguationAction];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v343 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandDisambiguationAction];
  if (v343)
  {
    v344 = (void *)v343;
    v345 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandDisambiguationAction];
    v346 = [v4 ueiDictationVoiceCommandDisambiguationAction];
    int v347 = [v345 isEqual:v346];

    if (!v347) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandKeyboardAction];
  unint64_t v7 = [v4 ueiDictationVoiceCommandKeyboardAction];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v348 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandKeyboardAction];
  if (v348)
  {
    v349 = (void *)v348;
    v350 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandKeyboardAction];
    v351 = [v4 ueiDictationVoiceCommandKeyboardAction];
    int v352 = [v350 isEqual:v351];

    if (!v352) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEvent];
  unint64_t v7 = [v4 ueiDictationEuclidAlternativesEvent];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v353 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEvent];
  if (v353)
  {
    v354 = (void *)v353;
    v355 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEvent];
    v356 = [v4 ueiDictationEuclidAlternativesEvent];
    int v357 = [v355 isEqual:v356];

    if (!v357) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEventTier1];
  unint64_t v7 = [v4 ueiDictationEuclidAlternativesEventTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v358 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEventTier1];
  if (v358)
  {
    v359 = (void *)v358;
    v360 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEventTier1];
    v361 = [v4 ueiDictationEuclidAlternativesEventTier1];
    int v362 = [v360 isEqual:v361];

    if (!v362) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelected];
  unint64_t v7 = [v4 ueiDictationEuclidSpeechAlternativesSelected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v363 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelected];
  if (v363)
  {
    v364 = (void *)v363;
    v365 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelected];
    v366 = [v4 ueiDictationEuclidSpeechAlternativesSelected];
    int v367 = [v365 isEqual:v366];

    if (!v367) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelectedTier1];
  unint64_t v7 = [v4 ueiDictationEuclidSpeechAlternativesSelectedTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v368 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelectedTier1];
  if (v368)
  {
    v369 = (void *)v368;
    v370 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelectedTier1];
    v371 = [v4 ueiDictationEuclidSpeechAlternativesSelectedTier1];
    int v372 = [v370 isEqual:v371];

    if (!v372) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self typingRequestTrace];
  unint64_t v7 = [v4 typingRequestTrace];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_377;
  }
  uint64_t v373 = [(SISchemaClientEvent *)self typingRequestTrace];
  if (v373)
  {
    v374 = (void *)v373;
    v375 = [(SISchemaClientEvent *)self typingRequestTrace];
    v376 = [v4 typingRequestTrace];
    int v377 = [v375 isEqual:v376];

    if (!v377) {
      goto LABEL_378;
    }
  }
  else
  {
  }
  unint64_t v6 = [(SISchemaClientEvent *)self ueiInvocationTier1];
  unint64_t v7 = [v4 ueiInvocationTier1];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_377:

    goto LABEL_378;
  }
  uint64_t v378 = [(SISchemaClientEvent *)self ueiInvocationTier1];
  if (!v378)
  {

LABEL_381:
    BOOL v383 = 1;
    goto LABEL_379;
  }
  v379 = (void *)v378;
  v380 = [(SISchemaClientEvent *)self ueiInvocationTier1];
  v381 = [v4 ueiInvocationTier1];
  char v382 = [v380 isEqual:v381];

  if (v382) {
    goto LABEL_381;
  }
LABEL_378:
  BOOL v383 = 0;
LABEL_379:

  return v383;
}

- (void)writeTo:(id)a3
{
  id v154 = a3;
  id v4 = [(SISchemaClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(SISchemaClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(SISchemaClientEvent *)self transportMetadata];

  if (v6)
  {
    unint64_t v7 = [(SISchemaClientEvent *)self transportMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(SISchemaClientEvent *)self audioFirstBufferRecorded];

  if (v8)
  {
    unint64_t v9 = [(SISchemaClientEvent *)self audioFirstBufferRecorded];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(SISchemaClientEvent *)self audioStopRecording];

  if (v10)
  {
    unint64_t v11 = [(SISchemaClientEvent *)self audioStopRecording];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(SISchemaClientEvent *)self clientConversationTrace];

  if (v12)
  {
    uint64_t v13 = [(SISchemaClientEvent *)self clientConversationTrace];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(SISchemaClientEvent *)self deviceDynamicContext];

  if (v14)
  {
    unint64_t v15 = [(SISchemaClientEvent *)self deviceDynamicContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(SISchemaClientEvent *)self deviceFixedContext];

  if (v16)
  {
    int v17 = [(SISchemaClientEvent *)self deviceFixedContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(SISchemaClientEvent *)self dictationContext];

  if (v18)
  {
    unint64_t v19 = [(SISchemaClientEvent *)self dictationContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v20 = [(SISchemaClientEvent *)self invocation];

  if (v20)
  {
    unint64_t v21 = [(SISchemaClientEvent *)self invocation];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(SISchemaClientEvent *)self location];

  if (v22)
  {
    uint64_t v23 = [(SISchemaClientEvent *)self location];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v24 = [(SISchemaClientEvent *)self punchOut];

  if (v24)
  {
    unint64_t v25 = [(SISchemaClientEvent *)self punchOut];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v26 = [(SISchemaClientEvent *)self siriCue];

  if (v26)
  {
    int v27 = [(SISchemaClientEvent *)self siriCue];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(SISchemaClientEvent *)self uufrPresented];

  if (v28)
  {
    unint64_t v29 = [(SISchemaClientEvent *)self uufrPresented];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v30 = [(SISchemaClientEvent *)self speechTranscription];

  if (v30)
  {
    unint64_t v31 = [(SISchemaClientEvent *)self speechTranscription];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(SISchemaClientEvent *)self textToSpeechBegin];

  if (v32)
  {
    uint64_t v33 = [(SISchemaClientEvent *)self textToSpeechBegin];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v34 = [(SISchemaClientEvent *)self textToSpeechEnd];

  if (v34)
  {
    unint64_t v35 = [(SISchemaClientEvent *)self textToSpeechEnd];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v36 = [(SISchemaClientEvent *)self uiStateTransition];

  if (v36)
  {
    int v37 = [(SISchemaClientEvent *)self uiStateTransition];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v38 = [(SISchemaClientEvent *)self clientFlow];

  if (v38)
  {
    unint64_t v39 = [(SISchemaClientEvent *)self clientFlow];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v40 = [(SISchemaClientEvent *)self dialogOutput];

  if (v40)
  {
    unint64_t v41 = [(SISchemaClientEvent *)self dialogOutput];
    PBDataWriterWriteSubmessage();
  }
  int v42 = [(SISchemaClientEvent *)self dictationEndPointStop];

  if (v42)
  {
    uint64_t v43 = [(SISchemaClientEvent *)self dictationEndPointStop];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v44 = [(SISchemaClientEvent *)self dictationEndPointCancel];

  if (v44)
  {
    unint64_t v45 = [(SISchemaClientEvent *)self dictationEndPointCancel];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v46 = [(SISchemaClientEvent *)self dictationAlternativeSelected];

  if (v46)
  {
    int v47 = [(SISchemaClientEvent *)self dictationAlternativeSelected];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v48 = [(SISchemaClientEvent *)self dictationTranscriptionMetadata];

  if (v48)
  {
    unint64_t v49 = [(SISchemaClientEvent *)self dictationTranscriptionMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v50 = [(SISchemaClientEvent *)self carPlayHeadUnitContext];

  if (v50)
  {
    unint64_t v51 = [(SISchemaClientEvent *)self carPlayHeadUnitContext];
    PBDataWriterWriteSubmessage();
  }
  int v52 = [(SISchemaClientEvent *)self uufrCompletion];

  if (v52)
  {
    uint64_t v53 = [(SISchemaClientEvent *)self uufrCompletion];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v54 = [(SISchemaClientEvent *)self uufrShown];

  if (v54)
  {
    unint64_t v55 = [(SISchemaClientEvent *)self uufrShown];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v56 = [(SISchemaClientEvent *)self uufrSaid];

  if (v56)
  {
    int v57 = [(SISchemaClientEvent *)self uufrSaid];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v58 = [(SISchemaClientEvent *)self uufrFatalError];

  if (v58)
  {
    unint64_t v59 = [(SISchemaClientEvent *)self uufrFatalError];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v60 = [(SISchemaClientEvent *)self dictationAlternativesViewed];

  if (v60)
  {
    unint64_t v61 = [(SISchemaClientEvent *)self dictationAlternativesViewed];
    PBDataWriterWriteSubmessage();
  }
  int v62 = [(SISchemaClientEvent *)self intercomMessageRecorded];

  if (v62)
  {
    uint64_t v63 = [(SISchemaClientEvent *)self intercomMessageRecorded];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v64 = [(SISchemaClientEvent *)self casinoRelationship];

  if (v64)
  {
    unint64_t v65 = [(SISchemaClientEvent *)self casinoRelationship];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v66 = [(SISchemaClientEvent *)self userViewRegionInteraction];

  if (v66)
  {
    int v67 = [(SISchemaClientEvent *)self userViewRegionInteraction];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v68 = [(SISchemaClientEvent *)self deviceLockStateChanged];

  if (v68)
  {
    unint64_t v69 = [(SISchemaClientEvent *)self deviceLockStateChanged];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v70 = [(SISchemaClientEvent *)self ueiRequestCategorization];

  if (v70)
  {
    unint64_t v71 = [(SISchemaClientEvent *)self ueiRequestCategorization];
    PBDataWriterWriteSubmessage();
  }
  int v72 = [(SISchemaClientEvent *)self audioStopRecordingStarted];

  if (v72)
  {
    uint64_t v73 = [(SISchemaClientEvent *)self audioStopRecordingStarted];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v74 = [(SISchemaClientEvent *)self ueiLaunchContext];

  if (v74)
  {
    unint64_t v75 = [(SISchemaClientEvent *)self ueiLaunchContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v76 = [(SISchemaClientEvent *)self ueiUserSpeakingContext];

  if (v76)
  {
    int v77 = [(SISchemaClientEvent *)self ueiUserSpeakingContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v78 = [(SISchemaClientEvent *)self ueiUUFRReady];

  if (v78)
  {
    v79 = [(SISchemaClientEvent *)self ueiUUFRReady];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v80 = [(SISchemaClientEvent *)self ueiUIRenderingContext];

  if (v80)
  {
    v81 = [(SISchemaClientEvent *)self ueiUIRenderingContext];
    PBDataWriterWriteSubmessage();
  }
  int v82 = [(SISchemaClientEvent *)self pnrTextToSpeechRequestReceived];

  if (v82)
  {
    uint64_t v83 = [(SISchemaClientEvent *)self pnrTextToSpeechRequestReceived];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v84 = [(SISchemaClientEvent *)self pnrSpeechRecognitionSourceContext];

  if (v84)
  {
    v85 = [(SISchemaClientEvent *)self pnrSpeechRecognitionSourceContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v86 = [(SISchemaClientEvent *)self pnrFatalError];

  if (v86)
  {
    int v87 = [(SISchemaClientEvent *)self pnrFatalError];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v88 = [(SISchemaClientEvent *)self turnMTERequest];

  if (v88)
  {
    int v89 = [(SISchemaClientEvent *)self turnMTERequest];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v90 = [(SISchemaClientEvent *)self keyboardDismissed];

  if (v90)
  {
    v91 = [(SISchemaClientEvent *)self keyboardDismissed];
    PBDataWriterWriteSubmessage();
  }
  int v92 = [(SISchemaClientEvent *)self engagedAccessoryContext];

  if (v92)
  {
    uint64_t v93 = [(SISchemaClientEvent *)self engagedAccessoryContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v94 = [(SISchemaClientEvent *)self announceCarPlayBannerTapped];

  if (v94)
  {
    int v95 = [(SISchemaClientEvent *)self announceCarPlayBannerTapped];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v96 = [(SISchemaClientEvent *)self announceCarPlayGlyphSettingToggled];

  if (v96)
  {
    int v97 = [(SISchemaClientEvent *)self announceCarPlayGlyphSettingToggled];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v98 = [(SISchemaClientEvent *)self dictationContentEdited];

  if (v98)
  {
    v99 = [(SISchemaClientEvent *)self dictationContentEdited];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v100 = [(SISchemaClientEvent *)self uufrShownTier1];

  if (v100)
  {
    int v101 = [(SISchemaClientEvent *)self uufrShownTier1];
    PBDataWriterWriteSubmessage();
  }
  int v102 = [(SISchemaClientEvent *)self ueiDictationPartialResultUpdated];

  if (v102)
  {
    uint64_t v103 = [(SISchemaClientEvent *)self ueiDictationPartialResultUpdated];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v104 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandExecuted];

  if (v104)
  {
    v105 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandExecuted];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v106 = [(SISchemaClientEvent *)self ueiDictationInputModeSwitchContext];

  if (v106)
  {
    int v107 = [(SISchemaClientEvent *)self ueiDictationInputModeSwitchContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v108 = [(SISchemaClientEvent *)self ueiDictationToolTipDisplayContext];

  if (v108)
  {
    v109 = [(SISchemaClientEvent *)self ueiDictationToolTipDisplayContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v110 = [(SISchemaClientEvent *)self hostPlatformViewAppearContext];

  if (v110)
  {
    v111 = [(SISchemaClientEvent *)self hostPlatformViewAppearContext];
    PBDataWriterWriteSubmessage();
  }
  int v112 = [(SISchemaClientEvent *)self hostPlatformViewDisappearContext];

  if (v112)
  {
    uint64_t v113 = [(SISchemaClientEvent *)self hostPlatformViewDisappearContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v114 = [(SISchemaClientEvent *)self ueiDictationTranscriptionTokenized];

  if (v114)
  {
    v115 = [(SISchemaClientEvent *)self ueiDictationTranscriptionTokenized];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v116 = [(SISchemaClientEvent *)self dictationAlternativesSelected];

  if (v116)
  {
    int v117 = [(SISchemaClientEvent *)self dictationAlternativesSelected];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v118 = [(SISchemaClientEvent *)self uufrSelected];

  if (v118)
  {
    int v119 = [(SISchemaClientEvent *)self uufrSelected];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v120 = [(SISchemaClientEvent *)self ueiDictationAlternativeTextPairsSelected];

  if (v120)
  {
    v121 = [(SISchemaClientEvent *)self ueiDictationAlternativeTextPairsSelected];
    PBDataWriterWriteSubmessage();
  }
  int v122 = [(SISchemaClientEvent *)self ueiUserBargeInDetected];

  if (v122)
  {
    uint64_t v123 = [(SISchemaClientEvent *)self ueiUserBargeInDetected];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v124 = [(SISchemaClientEvent *)self ueiDictationEnablementPromptShown];

  if (v124)
  {
    int v125 = [(SISchemaClientEvent *)self ueiDictationEnablementPromptShown];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v126 = [(SISchemaClientEvent *)self ueiSiriCarCommandContext];

  if (v126)
  {
    int v127 = [(SISchemaClientEvent *)self ueiSiriCarCommandContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v128 = [(SISchemaClientEvent *)self ueiVisionSnippetDismissed];

  if (v128)
  {
    v129 = [(SISchemaClientEvent *)self ueiVisionSnippetDismissed];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v130 = [(SISchemaClientEvent *)self ueiSiriWasUnavailable];

  if (v130)
  {
    int v131 = [(SISchemaClientEvent *)self ueiSiriWasUnavailable];
    PBDataWriterWriteSubmessage();
  }
  int v132 = [(SISchemaClientEvent *)self preferredAudioRouteChanged];

  if (v132)
  {
    uint64_t v133 = [(SISchemaClientEvent *)self preferredAudioRouteChanged];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v134 = [(SISchemaClientEvent *)self ueiDictationContentEditedTier1];

  if (v134)
  {
    v135 = [(SISchemaClientEvent *)self ueiDictationContentEditedTier1];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v136 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandUndoTapAction];

  if (v136)
  {
    int v137 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandUndoTapAction];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v138 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandDisambiguationAction];

  if (v138)
  {
    v139 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandDisambiguationAction];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v140 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandKeyboardAction];

  if (v140)
  {
    v141 = [(SISchemaClientEvent *)self ueiDictationVoiceCommandKeyboardAction];
    PBDataWriterWriteSubmessage();
  }
  int v142 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEvent];

  if (v142)
  {
    uint64_t v143 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEvent];
    PBDataWriterWriteSubmessage();
  }
  v144 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEventTier1];

  if (v144)
  {
    v145 = [(SISchemaClientEvent *)self ueiDictationEuclidAlternativesEventTier1];
    PBDataWriterWriteSubmessage();
  }
  int v146 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelected];

  if (v146)
  {
    int v147 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelected];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v148 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelectedTier1];

  if (v148)
  {
    int v149 = [(SISchemaClientEvent *)self ueiDictationEuclidSpeechAlternativesSelectedTier1];
    PBDataWriterWriteSubmessage();
  }
  v150 = [(SISchemaClientEvent *)self typingRequestTrace];

  if (v150)
  {
    v151 = [(SISchemaClientEvent *)self typingRequestTrace];
    PBDataWriterWriteSubmessage();
  }
  int v152 = [(SISchemaClientEvent *)self ueiInvocationTier1];

  if (v152)
  {
    uint64_t v153 = [(SISchemaClientEvent *)self ueiInvocationTier1];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteUeiInvocationTier1
{
  if (self->_whichEvent_Type == 175)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiInvocationTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIInvocationTier1)ueiInvocationTier1
{
  if (self->_whichEvent_Type == 175) {
    id v2 = self->_ueiInvocationTier1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiInvocationTier1:(id)a3
{
  id v4 = (SISchemaUEIInvocationTier1 *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  unint64_t v77 = 175;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = v4;
}

- (void)deleteTypingRequestTrace
{
  if (self->_whichEvent_Type == 174)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_typingRequestTrace = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaTypingRequestTrace)typingRequestTrace
{
  if (self->_whichEvent_Type == 174) {
    id v2 = self->_typingRequestTrace;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setTypingRequestTrace:(id)a3
{
  id v4 = (SISchemaTypingRequestTrace *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 174;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = v4;
}

- (void)deleteUeiDictationEuclidSpeechAlternativesSelectedTier1
{
  if (self->_whichEvent_Type == 173)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationEuclidSpeechAlternativesSelectedTier1)ueiDictationEuclidSpeechAlternativesSelectedTier1
{
  if (self->_whichEvent_Type == 173) {
    id v2 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationEuclidSpeechAlternativesSelectedTier1:(id)a3
{
  id v4 = (SISchemaUEIDictationEuclidSpeechAlternativesSelectedTier1 *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 173;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = v4;
}

- (void)deleteUeiDictationEuclidSpeechAlternativesSelected
{
  if (self->_whichEvent_Type == 172)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationEuclidSpeechAlternativesSelected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationEuclidSpeechAlternativesSelected)ueiDictationEuclidSpeechAlternativesSelected
{
  if (self->_whichEvent_Type == 172) {
    id v2 = self->_ueiDictationEuclidSpeechAlternativesSelected;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationEuclidSpeechAlternativesSelected:(id)a3
{
  id v4 = (SISchemaUEIDictationEuclidSpeechAlternativesSelected *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 172;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = v4;
}

- (void)deleteUeiDictationEuclidAlternativesEventTier1
{
  if (self->_whichEvent_Type == 171)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationEuclidAlternativesEventTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationEuclidAlternativesEventTier1)ueiDictationEuclidAlternativesEventTier1
{
  if (self->_whichEvent_Type == 171) {
    id v2 = self->_ueiDictationEuclidAlternativesEventTier1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationEuclidAlternativesEventTier1:(id)a3
{
  id v4 = (SISchemaUEIDictationEuclidAlternativesEventTier1 *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 171;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = v4;
}

- (void)deleteUeiDictationEuclidAlternativesEvent
{
  if (self->_whichEvent_Type == 170)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationEuclidAlternativesEvent = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationEuclidAlternativesEvent)ueiDictationEuclidAlternativesEvent
{
  if (self->_whichEvent_Type == 170) {
    id v2 = self->_ueiDictationEuclidAlternativesEvent;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationEuclidAlternativesEvent:(id)a3
{
  id v4 = (SISchemaUEIDictationEuclidAlternativesEvent *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 170;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = v4;
}

- (void)deleteUeiDictationVoiceCommandKeyboardAction
{
  if (self->_whichEvent_Type == 169)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationVoiceCommandKeyboardAction = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationVoiceCommandKeyboardAction)ueiDictationVoiceCommandKeyboardAction
{
  if (self->_whichEvent_Type == 169) {
    id v2 = self->_ueiDictationVoiceCommandKeyboardAction;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationVoiceCommandKeyboardAction:(id)a3
{
  id v4 = (SISchemaUEIDictationVoiceCommandKeyboardAction *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 169;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = v4;
}

- (void)deleteUeiDictationVoiceCommandDisambiguationAction
{
  if (self->_whichEvent_Type == 168)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationVoiceCommandDisambiguationAction = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationVoiceCommandDisambiguationAction)ueiDictationVoiceCommandDisambiguationAction
{
  if (self->_whichEvent_Type == 168) {
    id v2 = self->_ueiDictationVoiceCommandDisambiguationAction;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationVoiceCommandDisambiguationAction:(id)a3
{
  id v4 = (SISchemaUEIDictationVoiceCommandDisambiguationAction *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 168;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = v4;
}

- (void)deleteUeiDictationVoiceCommandUndoTapAction
{
  if (self->_whichEvent_Type == 167)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationVoiceCommandUndoTapAction = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationVoiceCommandUndoTapAction)ueiDictationVoiceCommandUndoTapAction
{
  if (self->_whichEvent_Type == 167) {
    id v2 = self->_ueiDictationVoiceCommandUndoTapAction;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationVoiceCommandUndoTapAction:(id)a3
{
  id v4 = (SISchemaUEIDictationVoiceCommandUndoTapAction *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 167;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = v4;
}

- (void)deleteUeiDictationContentEditedTier1
{
  if (self->_whichEvent_Type == 166)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationContentEditedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationContentEditedTier1)ueiDictationContentEditedTier1
{
  if (self->_whichEvent_Type == 166) {
    id v2 = self->_ueiDictationContentEditedTier1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationContentEditedTier1:(id)a3
{
  id v4 = (SISchemaUEIDictationContentEditedTier1 *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 166;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = v4;
}

- (void)deletePreferredAudioRouteChanged
{
  if (self->_whichEvent_Type == 165)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_preferredAudioRouteChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaBluetoothCarPreferredAudioRouteChanged)preferredAudioRouteChanged
{
  if (self->_whichEvent_Type == 165) {
    id v2 = self->_preferredAudioRouteChanged;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setPreferredAudioRouteChanged:(id)a3
{
  id v4 = (SISchemaBluetoothCarPreferredAudioRouteChanged *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 165;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = v4;
}

- (void)deleteUeiSiriWasUnavailable
{
  if (self->_whichEvent_Type == 164)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiSiriWasUnavailable = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEISiriWasUnavailable)ueiSiriWasUnavailable
{
  if (self->_whichEvent_Type == 164) {
    id v2 = self->_ueiSiriWasUnavailable;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiSiriWasUnavailable:(id)a3
{
  id v4 = (SISchemaUEISiriWasUnavailable *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 164;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = v4;
}

- (void)deleteUeiVisionSnippetDismissed
{
  if (self->_whichEvent_Type == 163)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiVisionSnippetDismissed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIVisionSnippetDismissed)ueiVisionSnippetDismissed
{
  if (self->_whichEvent_Type == 163) {
    id v2 = self->_ueiVisionSnippetDismissed;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiVisionSnippetDismissed:(id)a3
{
  id v4 = (SISchemaUEIVisionSnippetDismissed *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 163;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = v4;
}

- (void)deleteUeiSiriCarCommandContext
{
  if (self->_whichEvent_Type == 162)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiSiriCarCommandContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEISiriCarCommandContext)ueiSiriCarCommandContext
{
  if (self->_whichEvent_Type == 162) {
    id v2 = self->_ueiSiriCarCommandContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiSiriCarCommandContext:(id)a3
{
  id v4 = (SISchemaUEISiriCarCommandContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 162;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = v4;
}

- (void)deleteUeiDictationEnablementPromptShown
{
  if (self->_whichEvent_Type == 161)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationEnablementPromptShown = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationEnablementPromptShown)ueiDictationEnablementPromptShown
{
  if (self->_whichEvent_Type == 161) {
    id v2 = self->_ueiDictationEnablementPromptShown;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationEnablementPromptShown:(id)a3
{
  id v4 = (SISchemaUEIDictationEnablementPromptShown *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 161;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = v4;
}

- (void)deleteUeiUserBargeInDetected
{
  if (self->_whichEvent_Type == 160)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiUserBargeInDetected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIUserBargeInDetected)ueiUserBargeInDetected
{
  if (self->_whichEvent_Type == 160) {
    id v2 = self->_ueiUserBargeInDetected;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiUserBargeInDetected:(id)a3
{
  id v4 = (SISchemaUEIUserBargeInDetected *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 160;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = v4;
}

- (void)deleteUeiDictationAlternativeTextPairsSelected
{
  if (self->_whichEvent_Type == 159)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationAlternativeTextPairsSelected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationAlternativeTextPairsSelected)ueiDictationAlternativeTextPairsSelected
{
  if (self->_whichEvent_Type == 159) {
    id v2 = self->_ueiDictationAlternativeTextPairsSelected;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationAlternativeTextPairsSelected:(id)a3
{
  id v4 = (SISchemaUEIDictationAlternativeTextPairsSelected *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 159;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = v4;
}

- (void)deleteUufrSelected
{
  if (self->_whichEvent_Type == 158)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_uufrSelected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUUFRSelected)uufrSelected
{
  if (self->_whichEvent_Type == 158) {
    id v2 = self->_uufrSelected;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUufrSelected:(id)a3
{
  id v4 = (SISchemaUUFRSelected *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 158;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = v4;
}

- (void)deleteDictationAlternativesSelected
{
  if (self->_whichEvent_Type == 157)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dictationAlternativesSelected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationAlternativeConfusionPairsSelected)dictationAlternativesSelected
{
  if (self->_whichEvent_Type == 157) {
    id v2 = self->_dictationAlternativesSelected;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setDictationAlternativesSelected:(id)a3
{
  id v4 = (SISchemaUEIDictationAlternativeConfusionPairsSelected *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 157;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = v4;
}

- (void)deleteUeiDictationTranscriptionTokenized
{
  if (self->_whichEvent_Type == 156)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationTranscriptionTokenized = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationTranscriptionTokenized)ueiDictationTranscriptionTokenized
{
  if (self->_whichEvent_Type == 156) {
    id v2 = self->_ueiDictationTranscriptionTokenized;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationTranscriptionTokenized:(id)a3
{
  id v4 = (SISchemaUEIDictationTranscriptionTokenized *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 156;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = v4;
}

- (void)deleteHostPlatformViewDisappearContext
{
  if (self->_whichEvent_Type == 155)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_hostPlatformViewDisappearContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIHostingPlatformViewDisappearContext)hostPlatformViewDisappearContext
{
  if (self->_whichEvent_Type == 155) {
    id v2 = self->_hostPlatformViewDisappearContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setHostPlatformViewDisappearContext:(id)a3
{
  id v4 = (SISchemaUEIHostingPlatformViewDisappearContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 155;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = v4;
}

- (void)deleteHostPlatformViewAppearContext
{
  if (self->_whichEvent_Type == 154)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_hostPlatformViewAppearContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIHostingPlatformViewAppearContext)hostPlatformViewAppearContext
{
  if (self->_whichEvent_Type == 154) {
    id v2 = self->_hostPlatformViewAppearContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setHostPlatformViewAppearContext:(id)a3
{
  id v4 = (SISchemaUEIHostingPlatformViewAppearContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 154;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = v4;
}

- (void)deleteUeiDictationToolTipDisplayContext
{
  if (self->_whichEvent_Type == 153)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationToolTipDisplayContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationDiscoveryToolTipDisplayContext)ueiDictationToolTipDisplayContext
{
  if (self->_whichEvent_Type == 153) {
    id v2 = self->_ueiDictationToolTipDisplayContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationToolTipDisplayContext:(id)a3
{
  id v4 = (SISchemaUEIDictationDiscoveryToolTipDisplayContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 153;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = v4;
}

- (void)deleteUeiDictationInputModeSwitchContext
{
  if (self->_whichEvent_Type == 152)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationInputModeSwitchContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationInputModeSwitchContext)ueiDictationInputModeSwitchContext
{
  if (self->_whichEvent_Type == 152) {
    id v2 = self->_ueiDictationInputModeSwitchContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationInputModeSwitchContext:(id)a3
{
  id v4 = (SISchemaUEIDictationInputModeSwitchContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 152;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = v4;
}

- (void)deleteUeiDictationVoiceCommandExecuted
{
  if (self->_whichEvent_Type == 151)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationVoiceCommandExecuted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationVoiceCommandExecuted)ueiDictationVoiceCommandExecuted
{
  if (self->_whichEvent_Type == 151) {
    id v2 = self->_ueiDictationVoiceCommandExecuted;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationVoiceCommandExecuted:(id)a3
{
  id v4 = (SISchemaUEIDictationVoiceCommandExecuted *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 151;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = v4;
}

- (void)deleteUeiDictationPartialResultUpdated
{
  if (self->_whichEvent_Type == 150)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiDictationPartialResultUpdated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIDictationPartialResultUpdated)ueiDictationPartialResultUpdated
{
  if (self->_whichEvent_Type == 150) {
    id v2 = self->_ueiDictationPartialResultUpdated;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiDictationPartialResultUpdated:(id)a3
{
  id v4 = (SISchemaUEIDictationPartialResultUpdated *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 150;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = v4;
}

- (void)deleteUufrShownTier1
{
  if (self->_whichEvent_Type == 148)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_uufrShownTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUUFRShownTier1)uufrShownTier1
{
  if (self->_whichEvent_Type == 148) {
    id v2 = self->_uufrShownTier1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUufrShownTier1:(id)a3
{
  id v4 = (SISchemaUUFRShownTier1 *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 148;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = v4;
}

- (void)deleteDictationContentEdited
{
  if (self->_whichEvent_Type == 147)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dictationContentEdited = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaDictationContentEdited)dictationContentEdited
{
  if (self->_whichEvent_Type == 147) {
    id v2 = self->_dictationContentEdited;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setDictationContentEdited:(id)a3
{
  id v4 = (SISchemaDictationContentEdited *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 147;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = v4;
}

- (void)deleteAnnounceCarPlayGlyphSettingToggled
{
  if (self->_whichEvent_Type == 146)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_announceCarPlayGlyphSettingToggled = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaAnnounceCarPlayGlyphSettingToggled)announceCarPlayGlyphSettingToggled
{
  if (self->_whichEvent_Type == 146) {
    id v2 = self->_announceCarPlayGlyphSettingToggled;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setAnnounceCarPlayGlyphSettingToggled:(id)a3
{
  id v4 = (SISchemaAnnounceCarPlayGlyphSettingToggled *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 146;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = v4;
}

- (void)deleteAnnounceCarPlayBannerTapped
{
  if (self->_whichEvent_Type == 145)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_announceCarPlayBannerTapped = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaAnnounceCarPlayBannerTapped)announceCarPlayBannerTapped
{
  if (self->_whichEvent_Type == 145) {
    id v2 = self->_announceCarPlayBannerTapped;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setAnnounceCarPlayBannerTapped:(id)a3
{
  id v4 = (SISchemaAnnounceCarPlayBannerTapped *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 145;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = v4;
}

- (void)deleteEngagedAccessoryContext
{
  if (self->_whichEvent_Type == 144)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_engagedAccessoryContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaEngagedAccessoryContext)engagedAccessoryContext
{
  if (self->_whichEvent_Type == 144) {
    id v2 = self->_engagedAccessoryContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setEngagedAccessoryContext:(id)a3
{
  id v4 = (SISchemaEngagedAccessoryContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 144;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = v4;
}

- (void)deleteKeyboardDismissed
{
  if (self->_whichEvent_Type == 143)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_keyboardDismissed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaKeyboardDismissed)keyboardDismissed
{
  if (self->_whichEvent_Type == 143) {
    id v2 = self->_keyboardDismissed;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setKeyboardDismissed:(id)a3
{
  id v4 = (SISchemaKeyboardDismissed *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 143;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = v4;
}

- (void)deleteTurnMTERequest
{
  if (self->_whichEvent_Type == 142)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_turnMTERequest = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaTurnMTERequest)turnMTERequest
{
  if (self->_whichEvent_Type == 142) {
    id v2 = self->_turnMTERequest;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setTurnMTERequest:(id)a3
{
  id v4 = (SISchemaTurnMTERequest *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 142;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = v4;
}

- (void)deletePnrFatalError
{
  if (self->_whichEvent_Type == 141)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pnrFatalError = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaPNRFatalError)pnrFatalError
{
  if (self->_whichEvent_Type == 141) {
    id v2 = self->_pnrFatalError;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setPnrFatalError:(id)a3
{
  id v4 = (SISchemaPNRFatalError *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 141;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = v4;
}

- (void)deletePnrSpeechRecognitionSourceContext
{
  if (self->_whichEvent_Type == 140)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pnrSpeechRecognitionSourceContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaPNRSpeechRecognitionSourceContext)pnrSpeechRecognitionSourceContext
{
  if (self->_whichEvent_Type == 140) {
    id v2 = self->_pnrSpeechRecognitionSourceContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setPnrSpeechRecognitionSourceContext:(id)a3
{
  id v4 = (SISchemaPNRSpeechRecognitionSourceContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 140;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = v4;
}

- (void)deletePnrTextToSpeechRequestReceived
{
  if (self->_whichEvent_Type == 139)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pnrTextToSpeechRequestReceived = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaPNRTextToSpeechRequestReceived)pnrTextToSpeechRequestReceived
{
  if (self->_whichEvent_Type == 139) {
    id v2 = self->_pnrTextToSpeechRequestReceived;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setPnrTextToSpeechRequestReceived:(id)a3
{
  id v4 = (SISchemaPNRTextToSpeechRequestReceived *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 139;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = v4;
}

- (void)deleteUeiUIRenderingContext
{
  if (self->_whichEvent_Type == 138)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiUIRenderingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIUIRenderingContext)ueiUIRenderingContext
{
  if (self->_whichEvent_Type == 138) {
    id v2 = self->_ueiUIRenderingContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiUIRenderingContext:(id)a3
{
  id v4 = (SISchemaUEIUIRenderingContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 138;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = v4;
}

- (void)deleteUeiUUFRReady
{
  if (self->_whichEvent_Type == 137)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiUUFRReady = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIUUFRReady)ueiUUFRReady
{
  if (self->_whichEvent_Type == 137) {
    id v2 = self->_ueiUUFRReady;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiUUFRReady:(id)a3
{
  id v4 = (SISchemaUEIUUFRReady *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 137;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = v4;
}

- (void)deleteUeiUserSpeakingContext
{
  if (self->_whichEvent_Type == 136)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiUserSpeakingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIUserSpeakingContext)ueiUserSpeakingContext
{
  if (self->_whichEvent_Type == 136) {
    id v2 = self->_ueiUserSpeakingContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiUserSpeakingContext:(id)a3
{
  id v4 = (SISchemaUEIUserSpeakingContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 136;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = v4;
}

- (void)deleteUeiLaunchContext
{
  if (self->_whichEvent_Type == 135)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiLaunchContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEILaunchContext)ueiLaunchContext
{
  if (self->_whichEvent_Type == 135) {
    id v2 = self->_ueiLaunchContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiLaunchContext:(id)a3
{
  id v4 = (SISchemaUEILaunchContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 135;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = v4;
}

- (void)deleteAudioStopRecordingStarted
{
  if (self->_whichEvent_Type == 134)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_audioStopRecordingStarted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaAudioStopRecordingStarted)audioStopRecordingStarted
{
  if (self->_whichEvent_Type == 134) {
    id v2 = self->_audioStopRecordingStarted;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setAudioStopRecordingStarted:(id)a3
{
  id v4 = (SISchemaAudioStopRecordingStarted *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 134;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = v4;
}

- (void)deleteUeiRequestCategorization
{
  if (self->_whichEvent_Type == 133)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ueiRequestCategorization = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUEIRequestCategorization)ueiRequestCategorization
{
  if (self->_whichEvent_Type == 133) {
    id v2 = self->_ueiRequestCategorization;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUeiRequestCategorization:(id)a3
{
  id v4 = (SISchemaUEIRequestCategorization *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 133;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = v4;
}

- (void)deleteDeviceLockStateChanged
{
  if (self->_whichEvent_Type == 132)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_deviceLockStateChanged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaDeviceLockStateChanged)deviceLockStateChanged
{
  if (self->_whichEvent_Type == 132) {
    id v2 = self->_deviceLockStateChanged;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setDeviceLockStateChanged:(id)a3
{
  id v4 = (SISchemaDeviceLockStateChanged *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 132;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = v4;
}

- (void)deleteUserViewRegionInteraction
{
  if (self->_whichEvent_Type == 131)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_userViewRegionInteraction = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUserViewRegionInteraction)userViewRegionInteraction
{
  if (self->_whichEvent_Type == 131) {
    id v2 = self->_userViewRegionInteraction;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUserViewRegionInteraction:(id)a3
{
  id v4 = (SISchemaUserViewRegionInteraction *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 131;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = v4;
}

- (void)deleteCasinoRelationship
{
  if (self->_whichEvent_Type == 130)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_casinoRelationship = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaCasinoRelationship)casinoRelationship
{
  if (self->_whichEvent_Type == 130) {
    id v2 = self->_casinoRelationship;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setCasinoRelationship:(id)a3
{
  id v4 = (SISchemaCasinoRelationship *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 130;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = v4;
}

- (void)deleteIntercomMessageRecorded
{
  if (self->_whichEvent_Type == 129)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_intercomMessageRecorded = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaIntercomMessageRecorded)intercomMessageRecorded
{
  if (self->_whichEvent_Type == 129) {
    id v2 = self->_intercomMessageRecorded;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setIntercomMessageRecorded:(id)a3
{
  id v4 = (SISchemaIntercomMessageRecorded *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 129;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = v4;
}

- (void)deleteDictationAlternativesViewed
{
  if (self->_whichEvent_Type == 128)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dictationAlternativesViewed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaDictationAlternativesViewed)dictationAlternativesViewed
{
  if (self->_whichEvent_Type == 128) {
    id v2 = self->_dictationAlternativesViewed;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setDictationAlternativesViewed:(id)a3
{
  id v4 = (SISchemaDictationAlternativesViewed *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  self->_unint64_t whichEvent_Type = (unint64_t)(v4 != 0) << 7;
  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = v4;
}

- (void)deleteUufrFatalError
{
  if (self->_whichEvent_Type == 127)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_uufrFatalError = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUUFRFatalError)uufrFatalError
{
  if (self->_whichEvent_Type == 127) {
    id v2 = self->_uufrFatalError;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUufrFatalError:(id)a3
{
  id v4 = (SISchemaUUFRFatalError *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 127;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = v4;
}

- (void)deleteUufrSaid
{
  if (self->_whichEvent_Type == 126)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_uufrSaid = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUUFRSaid)uufrSaid
{
  if (self->_whichEvent_Type == 126) {
    id v2 = self->_uufrSaid;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUufrSaid:(id)a3
{
  id v4 = (SISchemaUUFRSaid *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 126;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = v4;
}

- (void)deleteUufrShown
{
  if (self->_whichEvent_Type == 125)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_uufrShown = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUUFRShown)uufrShown
{
  if (self->_whichEvent_Type == 125) {
    id v2 = self->_uufrShown;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUufrShown:(id)a3
{
  id v4 = (SISchemaUUFRShown *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 125;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  uufrShown = self->_uufrShown;
  self->_uufrShown = v4;
}

- (void)deleteUufrCompletion
{
  if (self->_whichEvent_Type == 124)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_uufrCompletion = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUUFRCompletion)uufrCompletion
{
  if (self->_whichEvent_Type == 124) {
    id v2 = self->_uufrCompletion;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUufrCompletion:(id)a3
{
  id v4 = (SISchemaUUFRCompletion *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 124;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = v4;
}

- (void)deleteCarPlayHeadUnitContext
{
  if (self->_whichEvent_Type == 123)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_carPlayHeadUnitContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaCarPlayHeadUnitContext)carPlayHeadUnitContext
{
  if (self->_whichEvent_Type == 123) {
    id v2 = self->_carPlayHeadUnitContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setCarPlayHeadUnitContext:(id)a3
{
  id v4 = (SISchemaCarPlayHeadUnitContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 123;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = v4;
}

- (void)deleteDictationTranscriptionMetadata
{
  if (self->_whichEvent_Type == 122)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dictationTranscriptionMetadata = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaDictationTranscriptionMetadata)dictationTranscriptionMetadata
{
  if (self->_whichEvent_Type == 122) {
    id v2 = self->_dictationTranscriptionMetadata;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setDictationTranscriptionMetadata:(id)a3
{
  id v4 = (SISchemaDictationTranscriptionMetadata *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 122;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = v4;
}

- (void)deleteDictationAlternativeSelected
{
  if (self->_whichEvent_Type == 121)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dictationAlternativeSelected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaDictationAlternativeSelected)dictationAlternativeSelected
{
  if (self->_whichEvent_Type == 121) {
    id v2 = self->_dictationAlternativeSelected;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setDictationAlternativeSelected:(id)a3
{
  id v4 = (SISchemaDictationAlternativeSelected *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 121;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = v4;
}

- (void)deleteDictationEndPointCancel
{
  if (self->_whichEvent_Type == 120)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dictationEndPointCancel = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaDictationEndPointCancel)dictationEndPointCancel
{
  if (self->_whichEvent_Type == 120) {
    id v2 = self->_dictationEndPointCancel;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setDictationEndPointCancel:(id)a3
{
  id v4 = (SISchemaDictationEndPointCancel *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 120;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = v4;
}

- (void)deleteDictationEndPointStop
{
  if (self->_whichEvent_Type == 119)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dictationEndPointStop = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaDictationEndPointStop)dictationEndPointStop
{
  if (self->_whichEvent_Type == 119) {
    id v2 = self->_dictationEndPointStop;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setDictationEndPointStop:(id)a3
{
  id v4 = (SISchemaDictationEndPointStop *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 119;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = v4;
}

- (void)deleteDialogOutput
{
  if (self->_whichEvent_Type == 118)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dialogOutput = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaDialogOutput)dialogOutput
{
  if (self->_whichEvent_Type == 118) {
    id v2 = self->_dialogOutput;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setDialogOutput:(id)a3
{
  id v4 = (SISchemaDialogOutput *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 118;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = v4;
}

- (void)deleteClientFlow
{
  if (self->_whichEvent_Type == 117)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_clientFlow = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaClientFlow)clientFlow
{
  if (self->_whichEvent_Type == 117) {
    id v2 = self->_clientFlow;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setClientFlow:(id)a3
{
  id v4 = (SISchemaClientFlow *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 117;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  clientFlow = self->_clientFlow;
  self->_clientFlow = v4;
}

- (void)deleteUiStateTransition
{
  if (self->_whichEvent_Type == 116)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_uiStateTransition = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUIStateTransition)uiStateTransition
{
  if (self->_whichEvent_Type == 116) {
    id v2 = self->_uiStateTransition;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUiStateTransition:(id)a3
{
  id v4 = (SISchemaUIStateTransition *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 116;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = v4;
}

- (void)deleteTextToSpeechEnd
{
  if (self->_whichEvent_Type == 115)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_textToSpeechEnd = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaTextToSpeechEnd)textToSpeechEnd
{
  if (self->_whichEvent_Type == 115) {
    id v2 = self->_textToSpeechEnd;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setTextToSpeechEnd:(id)a3
{
  id v4 = (SISchemaTextToSpeechEnd *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 115;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = v4;
}

- (void)deleteTextToSpeechBegin
{
  if (self->_whichEvent_Type == 114)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_textToSpeechBegin = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaTextToSpeechBegin)textToSpeechBegin
{
  if (self->_whichEvent_Type == 114) {
    id v2 = self->_textToSpeechBegin;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setTextToSpeechBegin:(id)a3
{
  id v4 = (SISchemaTextToSpeechBegin *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 114;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = v4;
}

- (void)deleteSpeechTranscription
{
  if (self->_whichEvent_Type == 113)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_speechTranscription = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaSpeechTranscription)speechTranscription
{
  if (self->_whichEvent_Type == 113) {
    id v2 = self->_speechTranscription;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setSpeechTranscription:(id)a3
{
  id v4 = (SISchemaSpeechTranscription *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 113;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = v4;
}

- (void)deleteUufrPresented
{
  if (self->_whichEvent_Type == 112)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_uufrPresented = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUUFRPresented)uufrPresented
{
  if (self->_whichEvent_Type == 112) {
    id v2 = self->_uufrPresented;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setUufrPresented:(id)a3
{
  id v4 = (SISchemaUUFRPresented *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 112;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = v4;
}

- (void)deleteSiriCue
{
  if (self->_whichEvent_Type == 111)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_siriCue = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaSiriCue)siriCue
{
  if (self->_whichEvent_Type == 111) {
    id v2 = self->_siriCue;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setSiriCue:(id)a3
{
  id v4 = (SISchemaSiriCue *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 111;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  siriCue = self->_siriCue;
  self->_siriCue = v4;
}

- (void)deletePunchOut
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_punchOut = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaPunchOut)punchOut
{
  if (self->_whichEvent_Type == 109) {
    id v2 = self->_punchOut;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setPunchOut:(id)a3
{
  id v4 = (SISchemaPunchOut *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 109;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  punchOut = self->_punchOut;
  self->_punchOut = v4;
}

- (void)deleteLocation
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_location = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaLocation)location
{
  if (self->_whichEvent_Type == 108) {
    id v2 = self->_location;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setLocation:(id)a3
{
  id v4 = (SISchemaLocation *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 108;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  location = self->_location;
  self->_location = v4;
}

- (void)deleteInvocation
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_invocation = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaInvocation)invocation
{
  if (self->_whichEvent_Type == 107) {
    id v2 = self->_invocation;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setInvocation:(id)a3
{
  id v4 = (SISchemaInvocation *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 107;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  invocation = self->_invocation;
  self->_invocation = v4;
}

- (void)deleteDictationContext
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_dictationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaDictationContext)dictationContext
{
  if (self->_whichEvent_Type == 106) {
    id v2 = self->_dictationContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setDictationContext:(id)a3
{
  id v4 = (SISchemaDictationContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 106;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  dictationContext = self->_dictationContext;
  self->_dictationContext = v4;
}

- (void)deleteDeviceFixedContext
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_deviceFixedContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaDeviceFixedContext)deviceFixedContext
{
  if (self->_whichEvent_Type == 105) {
    id v2 = self->_deviceFixedContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setDeviceFixedContext:(id)a3
{
  id v4 = (SISchemaDeviceFixedContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 105;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = v4;
}

- (void)deleteDeviceDynamicContext
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_deviceDynamicContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaDeviceDynamicContext)deviceDynamicContext
{
  if (self->_whichEvent_Type == 104) {
    id v2 = self->_deviceDynamicContext;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setDeviceDynamicContext:(id)a3
{
  id v4 = (SISchemaDeviceDynamicContext *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 104;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = v4;
}

- (void)deleteClientConversationTrace
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_clientConversationTrace = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaConversationTrace)clientConversationTrace
{
  if (self->_whichEvent_Type == 103) {
    id v2 = self->_clientConversationTrace;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setClientConversationTrace:(id)a3
{
  id v4 = (SISchemaConversationTrace *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 103;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = v4;
}

- (void)deleteAudioStopRecording
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_audioStopRecording = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaAudioStopRecording)audioStopRecording
{
  if (self->_whichEvent_Type == 102) {
    id v2 = self->_audioStopRecording;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setAudioStopRecording:(id)a3
{
  id v4 = (SISchemaAudioStopRecording *)a3;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 102;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = v4;
}

- (void)deleteAudioFirstBufferRecorded
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_audioFirstBufferRecorded = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaAudioFirstBufferRecorded)audioFirstBufferRecorded
{
  if (self->_whichEvent_Type == 101) {
    id v2 = self->_audioFirstBufferRecorded;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)setAudioFirstBufferRecorded:(id)a3
{
  id v4 = (SISchemaAudioFirstBufferRecorded *)a3;
  audioStopRecording = self->_audioStopRecording;
  self->_audioStopRecording = 0;

  clientConversationTrace = self->_clientConversationTrace;
  self->_clientConversationTrace = 0;

  deviceDynamicContext = self->_deviceDynamicContext;
  self->_deviceDynamicContext = 0;

  deviceFixedContext = self->_deviceFixedContext;
  self->_deviceFixedContext = 0;

  dictationContext = self->_dictationContext;
  self->_dictationContext = 0;

  invocation = self->_invocation;
  self->_invocation = 0;

  location = self->_location;
  self->_location = 0;

  punchOut = self->_punchOut;
  self->_punchOut = 0;

  siriCue = self->_siriCue;
  self->_siriCue = 0;

  uufrPresented = self->_uufrPresented;
  self->_uufrPresented = 0;

  speechTranscription = self->_speechTranscription;
  self->_speechTranscription = 0;

  textToSpeechBegin = self->_textToSpeechBegin;
  self->_textToSpeechBegin = 0;

  textToSpeechEnd = self->_textToSpeechEnd;
  self->_textToSpeechEnd = 0;

  uiStateTransition = self->_uiStateTransition;
  self->_uiStateTransition = 0;

  clientFlow = self->_clientFlow;
  self->_clientFlow = 0;

  dialogOutput = self->_dialogOutput;
  self->_dialogOutput = 0;

  dictationEndPointStop = self->_dictationEndPointStop;
  self->_dictationEndPointStop = 0;

  dictationEndPointCancel = self->_dictationEndPointCancel;
  self->_dictationEndPointCancel = 0;

  dictationAlternativeSelected = self->_dictationAlternativeSelected;
  self->_dictationAlternativeSelected = 0;

  dictationTranscriptionMetadata = self->_dictationTranscriptionMetadata;
  self->_dictationTranscriptionMetadata = 0;

  carPlayHeadUnitContext = self->_carPlayHeadUnitContext;
  self->_carPlayHeadUnitContext = 0;

  uufrCompletion = self->_uufrCompletion;
  self->_uufrCompletion = 0;

  uufrShown = self->_uufrShown;
  self->_uufrShown = 0;

  uufrSaid = self->_uufrSaid;
  self->_uufrSaid = 0;

  uufrFatalError = self->_uufrFatalError;
  self->_uufrFatalError = 0;

  dictationAlternativesViewed = self->_dictationAlternativesViewed;
  self->_dictationAlternativesViewed = 0;

  intercomMessageRecorded = self->_intercomMessageRecorded;
  self->_intercomMessageRecorded = 0;

  casinoRelationship = self->_casinoRelationship;
  self->_casinoRelationship = 0;

  userViewRegionInteraction = self->_userViewRegionInteraction;
  self->_userViewRegionInteraction = 0;

  deviceLockStateChanged = self->_deviceLockStateChanged;
  self->_deviceLockStateChanged = 0;

  ueiRequestCategorization = self->_ueiRequestCategorization;
  self->_ueiRequestCategorization = 0;

  audioStopRecordingStarted = self->_audioStopRecordingStarted;
  self->_audioStopRecordingStarted = 0;

  ueiLaunchContext = self->_ueiLaunchContext;
  self->_ueiLaunchContext = 0;

  ueiUserSpeakingContext = self->_ueiUserSpeakingContext;
  self->_ueiUserSpeakingContext = 0;

  ueiUUFRReady = self->_ueiUUFRReady;
  self->_ueiUUFRReady = 0;

  ueiUIRenderingContext = self->_ueiUIRenderingContext;
  self->_ueiUIRenderingContext = 0;

  pnrTextToSpeechRequestReceived = self->_pnrTextToSpeechRequestReceived;
  self->_pnrTextToSpeechRequestReceived = 0;

  pnrSpeechRecognitionSourceContext = self->_pnrSpeechRecognitionSourceContext;
  self->_pnrSpeechRecognitionSourceContext = 0;

  pnrFatalError = self->_pnrFatalError;
  self->_pnrFatalError = 0;

  turnMTERequest = self->_turnMTERequest;
  self->_turnMTERequest = 0;

  keyboardDismissed = self->_keyboardDismissed;
  self->_keyboardDismissed = 0;

  engagedAccessoryContext = self->_engagedAccessoryContext;
  self->_engagedAccessoryContext = 0;

  announceCarPlayBannerTapped = self->_announceCarPlayBannerTapped;
  self->_announceCarPlayBannerTapped = 0;

  announceCarPlayGlyphSettingToggled = self->_announceCarPlayGlyphSettingToggled;
  self->_announceCarPlayGlyphSettingToggled = 0;

  dictationContentEdited = self->_dictationContentEdited;
  self->_dictationContentEdited = 0;

  uufrShownTier1 = self->_uufrShownTier1;
  self->_uufrShownTier1 = 0;

  ueiDictationPartialResultUpdated = self->_ueiDictationPartialResultUpdated;
  self->_ueiDictationPartialResultUpdated = 0;

  ueiDictationVoiceCommandExecuted = self->_ueiDictationVoiceCommandExecuted;
  self->_ueiDictationVoiceCommandExecuted = 0;

  ueiDictationInputModeSwitchContext = self->_ueiDictationInputModeSwitchContext;
  self->_ueiDictationInputModeSwitchContext = 0;

  ueiDictationToolTipDisplayContext = self->_ueiDictationToolTipDisplayContext;
  self->_ueiDictationToolTipDisplayContext = 0;

  hostPlatformViewAppearContext = self->_hostPlatformViewAppearContext;
  self->_hostPlatformViewAppearContext = 0;

  hostPlatformViewDisappearContext = self->_hostPlatformViewDisappearContext;
  self->_hostPlatformViewDisappearContext = 0;

  ueiDictationTranscriptionTokenized = self->_ueiDictationTranscriptionTokenized;
  self->_ueiDictationTranscriptionTokenized = 0;

  dictationAlternativesSelected = self->_dictationAlternativesSelected;
  self->_dictationAlternativesSelected = 0;

  uufrSelected = self->_uufrSelected;
  self->_uufrSelected = 0;

  ueiDictationAlternativeTextPairsSelected = self->_ueiDictationAlternativeTextPairsSelected;
  self->_ueiDictationAlternativeTextPairsSelected = 0;

  ueiUserBargeInDetected = self->_ueiUserBargeInDetected;
  self->_ueiUserBargeInDetected = 0;

  ueiDictationEnablementPromptShown = self->_ueiDictationEnablementPromptShown;
  self->_ueiDictationEnablementPromptShown = 0;

  ueiSiriCarCommandContext = self->_ueiSiriCarCommandContext;
  self->_ueiSiriCarCommandContext = 0;

  ueiVisionSnippetDismissed = self->_ueiVisionSnippetDismissed;
  self->_ueiVisionSnippetDismissed = 0;

  ueiSiriWasUnavailable = self->_ueiSiriWasUnavailable;
  self->_ueiSiriWasUnavailable = 0;

  preferredAudioRouteChanged = self->_preferredAudioRouteChanged;
  self->_preferredAudioRouteChanged = 0;

  ueiDictationContentEditedTier1 = self->_ueiDictationContentEditedTier1;
  self->_ueiDictationContentEditedTier1 = 0;

  ueiDictationVoiceCommandUndoTapAction = self->_ueiDictationVoiceCommandUndoTapAction;
  self->_ueiDictationVoiceCommandUndoTapAction = 0;

  ueiDictationVoiceCommandDisambiguationAction = self->_ueiDictationVoiceCommandDisambiguationAction;
  self->_ueiDictationVoiceCommandDisambiguationAction = 0;

  ueiDictationVoiceCommandKeyboardAction = self->_ueiDictationVoiceCommandKeyboardAction;
  self->_ueiDictationVoiceCommandKeyboardAction = 0;

  ueiDictationEuclidAlternativesEvent = self->_ueiDictationEuclidAlternativesEvent;
  self->_ueiDictationEuclidAlternativesEvent = 0;

  ueiDictationEuclidAlternativesEventTier1 = self->_ueiDictationEuclidAlternativesEventTier1;
  self->_ueiDictationEuclidAlternativesEventTier1 = 0;

  ueiDictationEuclidSpeechAlternativesSelected = self->_ueiDictationEuclidSpeechAlternativesSelected;
  self->_ueiDictationEuclidSpeechAlternativesSelected = 0;

  ueiDictationEuclidSpeechAlternativesSelectedTier1 = self->_ueiDictationEuclidSpeechAlternativesSelectedTier1;
  self->_ueiDictationEuclidSpeechAlternativesSelectedTier1 = 0;

  typingRequestTrace = self->_typingRequestTrace;
  self->_typingRequestTrace = 0;

  ueiInvocationTier1 = self->_ueiInvocationTier1;
  self->_ueiInvocationTier1 = 0;

  unint64_t v77 = 101;
  if (!v4) {
    unint64_t v77 = 0;
  }
  self->_unint64_t whichEvent_Type = v77;
  audioFirstBufferRecorded = self->_audioFirstBufferRecorded;
  self->_audioFirstBufferRecorded = v4;
}

- (void)deleteTransportMetadata
{
}

- (BOOL)hasTransportMetadata
{
  return self->_transportMetadata != 0;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(SISchemaClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 0x4A) {
    return @"com.apple.aiml.siri.uei.ClientEvent";
  }
  else {
    return off_1E5EB5CD8[v2 - 101];
  }
}

+ (id)getTagForEventTypeClass:(Class)a3
{
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06072F0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607308;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607320;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607338;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607350;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607368;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607380;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607398;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06073B0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06073C8;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06073E0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06073F8;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607410;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607428;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607440;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607458;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607470;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607488;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06074A0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06074B8;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06074D0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06074E8;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607500;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607518;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607530;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607548;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607560;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607578;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607590;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06075A8;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06075C0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06075D8;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06075F0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607608;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607620;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607638;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607650;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607668;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607680;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607698;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06076B0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06076C8;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06076E0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06076F8;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607710;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607728;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607740;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607758;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607770;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607788;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06077A0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06077B8;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06077D0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06077E8;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607800;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607818;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607830;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607848;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607860;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607878;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607890;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06078A8;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06078C0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06078D8;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06078F0;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607908;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607920;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607938;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607950;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607968;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607980;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F0607998;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return &unk_1F06079B0;
  }
  return 0;
}

+ (Class)getEventTypeClassForTag:(int)a3
{
  id v4 = 0;
  switch(a3)
  {
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
      id v4 = objc_opt_class();
      break;
    default:
      break;
  }
  return (Class)v4;
}

- (int)getAnyEventType
{
  return 1;
}

@end