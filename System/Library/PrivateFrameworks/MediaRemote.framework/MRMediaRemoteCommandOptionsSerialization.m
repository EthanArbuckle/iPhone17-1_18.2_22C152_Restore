@interface MRMediaRemoteCommandOptionsSerialization
@end

@implementation MRMediaRemoteCommandOptionsSerialization

uint64_t ___MRMediaRemoteCommandOptionsSerialization_block_invoke()
{
  v88[82] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MRMediaRemoteCommandOptionsSerialization___serialization;
  _MRMediaRemoteCommandOptionsSerialization___serialization = v0;

  v64 = (void *)_MRMediaRemoteCommandOptionsSerialization___serialization;
  v87[0] = @"kMRMediaRemoteOptionIsExternalPlayerCommand";
  v86 = NSStringFromSelector(sel_externalPlayerCommand);
  v88[0] = v86;
  v87[1] = @"kMRMediaRemoteOptionIsNegative";
  v85 = NSStringFromSelector(sel_negative);
  v88[1] = v85;
  v87[2] = @"kMRMediaRemoteOptionMediaType";
  v84 = NSStringFromSelector(sel_mediaType);
  v88[2] = v84;
  v87[3] = @"kMRMediaRemoteOptionPlaybackPosition";
  v83 = NSStringFromSelector(sel_playbackPosition);
  v88[3] = v83;
  v87[4] = @"kMRMediaRemoteOptionBeginSeek";
  v82 = NSStringFromSelector(sel_beginSeek);
  v88[4] = v82;
  v87[5] = @"kMRMediaRemoteOptionEndSeek";
  v81 = NSStringFromSelector(sel_endSeek);
  v88[5] = v81;
  v87[6] = @"kMRMediaRemoteOptionPlaybackRate";
  v80 = NSStringFromSelector(sel_playbackRate);
  v88[6] = v80;
  v87[7] = @"kMRMediaRemoteOptionRepeatMode";
  v79 = NSStringFromSelector(sel_repeatMode);
  v88[7] = v79;
  v87[8] = @"kMRMediaRemoteCommandInfoPreservesRepeatModeKey";
  v78 = NSStringFromSelector(sel_preservesRepeatMode);
  v88[8] = v78;
  v87[9] = @"kMRMediaRemoteOptionShuffleMode";
  v77 = NSStringFromSelector(sel_shuffleMode);
  v88[9] = v77;
  v87[10] = @"kMRMediaRemoteCommandInfoPreservesShuffleModeKey";
  v76 = NSStringFromSelector(sel_preservesShuffleMode);
  v88[10] = v76;
  v87[11] = @"kMRMediaRemoteOptionQueueEndAction";
  v75 = NSStringFromSelector(sel_queueEndAction);
  v88[11] = v75;
  v87[12] = @"kMRMediaRemoteCommandInfoPreservesQueueEndActionKey";
  v74 = NSStringFromSelector(sel_preservesQueueEndAction);
  v88[12] = v74;
  v87[13] = @"kMRMediaRemoteOptionSkipInterval";
  v73 = NSStringFromSelector(sel_skipInterval);
  v88[13] = v73;
  v87[14] = @"kMRMediaRemoteOptionSourceID";
  v72 = NSStringFromSelector(sel_sourceID);
  v88[14] = v72;
  v87[15] = @"kMRMediaRemoteOptionStationHash";
  v71 = NSStringFromSelector(sel_radioStationHash);
  v88[15] = v71;
  v87[16] = @"kMRMediaRemoteOptionStationID";
  v70 = NSStringFromSelector(sel_radioStationID);
  v88[16] = v70;
  v87[17] = @"kMRMediaRemoteOptionSystemAppPlaybackQueueData";
  v69 = NSStringFromSelector(sel_systemAppPlaybackQueueData);
  v88[17] = v69;
  v87[18] = @"MRMediaRemoteOptionSystemAppPlaybackQueue";
  v68 = NSStringFromSelector(sel_systemAppPlaybackQueue);
  v88[18] = v68;
  v87[19] = @"PQso";
  v67 = NSStringFromSelector(sel_shouldOverrideManuallyCuratedQueue);
  v88[19] = v67;
  v87[20] = @"kMRMediaRemoteOptionTrackID";
  v66 = NSStringFromSelector(sel_trackID);
  v88[20] = v66;
  v87[21] = @"kMRMediaRemoteOptionContentItemID";
  v65 = NSStringFromSelector(sel_contentItemID);
  v88[21] = v65;
  v87[22] = @"kMRMediaRemoteOptionDestinationAppDisplayID";
  v63 = NSStringFromSelector(sel_destinationAppDisplayID);
  v88[22] = v63;
  v87[23] = @"kMRMediaRemoteOptionSendOptionsNumber";
  v62 = NSStringFromSelector(sel_sendOptions);
  v88[23] = v62;
  v87[24] = @"kMRMediaRemoteOptionRequestDefermentToPlaybackQueuePosition";
  v61 = NSStringFromSelector(sel_requestDefermentToPlaybackQueuePosition);
  v88[24] = v61;
  v87[25] = @"kMRMediaRemoteOptionRating";
  v60 = NSStringFromSelector(sel_rating);
  v88[25] = v60;
  v87[26] = @"kMRMediaRemoteOptionContextID";
  v59 = NSStringFromSelector(sel_contextID);
  v88[26] = v59;
  v87[27] = @"kMRMediaRemoteOptionDesiredSessionID";
  v58 = NSStringFromSelector(sel_desiredSessionID);
  v88[27] = v58;
  v87[28] = @"kMRMediaRemoteOptionStationURL";
  v57 = NSStringFromSelector(sel_stationURL);
  v88[28] = v57;
  v87[29] = @"kMRMediaRemoteOptionShouldBeginRadioPlayback";
  v56 = NSStringFromSelector(sel_shouldBeginRadioPlayback);
  v88[29] = v56;
  v87[30] = @"kMRMediaRemoteOptionPlaybackQueueInsertionPosition";
  v55 = NSStringFromSelector(sel_playbackQueueInsertionPosition);
  v88[30] = v55;
  v87[31] = @"kMRMediaRemoteOptionPlaybackQueueOffset";
  v54 = NSStringFromSelector(sel_playbackQueueOffset);
  v88[31] = v54;
  v87[32] = @"kMRMediaRemoteOptionPlaybackQueueDestinationOffset";
  v53 = NSStringFromSelector(sel_playbackQueueDestinationOffset);
  v88[32] = v53;
  v87[33] = @"kMRMediaRemoteOptionLanguageOptionData";
  v52 = NSStringFromSelector(sel_languageOption);
  v88[33] = v52;
  v87[34] = @"kMRMediaRemoteOptionInsertAfterContentItemID";
  v51 = NSStringFromSelector(sel_insertAfterContentItemID);
  v88[34] = v51;
  v87[35] = @"kMRMediaRemoteOptionInsertBeforeContentItemID";
  v50 = NSStringFromSelector(sel_insertBeforeContentItemID);
  v88[35] = v50;
  v87[36] = @"kMRMediaRemoteOptionNowPlayingContentItemID";
  v49 = NSStringFromSelector(sel_nowPlayingContentItemID);
  v88[36] = v49;
  v87[37] = @"PQri";
  v48 = NSStringFromSelector(sel_replaceIntent);
  v88[37] = v48;
  v87[38] = @"kMRMediaRemoteOptionCommandID";
  v47 = NSStringFromSelector(sel_commandID);
  v88[38] = v47;
  v87[39] = @"kMRMediaRemoteOptionSenderID";
  v46 = NSStringFromSelector(sel_senderID);
  v88[39] = v46;
  v87[40] = @"kMRMediaRemoteOptionRemoteControlInterfaceIdentifier";
  v45 = NSStringFromSelector(sel_remoteControlInterface);
  v88[40] = v45;
  v87[41] = @"kMRMediaRemoteOptionPlaybackSessionData";
  v44 = NSStringFromSelector(sel_playbackSession);
  v88[41] = v44;
  v87[42] = @"kMRMediaRemoteOptionPlaybackSessionIdentifier";
  v43 = NSStringFromSelector(sel_playbackSessionIdentifier);
  v88[42] = v43;
  v87[43] = @"kMRMediaRemoteOptionPlaybackSessionType";
  v42 = NSStringFromSelector(sel_playbackSessionType);
  v88[43] = v42;
  v87[44] = @"kMRMediaRemoteOptionPlaybackSessionPriority";
  v41 = NSStringFromSelector(sel_playbackSessionPriority);
  v88[44] = v41;
  v87[45] = @"kMRMediaRemoteOptionPlaybackSessionFilePath";
  v40 = NSStringFromSelector(sel_playbackSessionFilePath);
  v88[45] = v40;
  v87[46] = @"kMRMediaRemoteOptionPlaybackSessionRevision";
  v39 = NSStringFromSelector(sel_playbackSessionRevision);
  v88[46] = v39;
  v87[47] = @"kMRMediaRemoteOptionPlaybackSessionMetadata";
  v38 = NSStringFromSelector(sel_playbackSessionMetadata);
  v88[47] = v38;
  v87[48] = @"kMRMediaRemoteOptionUserIdentityData";
  v37 = NSStringFromSelector(sel_userIdentityData);
  v88[48] = v37;
  v87[49] = @"kMRMediaRemoteOptionHomeKitUserIdentifier";
  v36 = NSStringFromSelector(sel_homeKitUserIdentifier);
  v88[49] = v36;
  v87[50] = @"kMRMediaRemoteOptionVerifySupportedCommands";
  v35 = NSStringFromSelector(sel_verifySupportedCommands);
  v88[50] = v35;
  v87[51] = @"kMRMediaRemoteOptionAssistantSetQueueTrueCompletion";
  v34 = NSStringFromSelector(sel_trueCompletion);
  v88[51] = v34;
  v87[52] = @"kMRMediaRemoteOptionCommandTimeout";
  v33 = NSStringFromSelector(sel_commandTimeout);
  v88[52] = v33;
  v87[53] = @"kMRMediaRemoteOptionPlaybackAuthorizationToken";
  v32 = NSStringFromSelector(sel_playbackAuthorizationToken);
  v88[53] = v32;
  v87[54] = @"kMRMediaRemoteOptionEventNoticeType";
  v31 = NSStringFromSelector(sel_eventNoticeType);
  v88[54] = v31;
  v87[55] = @"kMRMediaRemoteOptionEventNoticeIdentifier";
  v30 = NSStringFromSelector(sel_eventNoticeIdentifier);
  v88[55] = v30;
  v87[56] = @"kMRMediaRemoteOptionSharedPlaybackSessionIdentifier";
  v29 = NSStringFromSelector(sel_sharedPlaybackSessionIdentifier);
  v88[56] = v29;
  v87[57] = @"kMRMediaRemoteOptionOriginatingDeviceUID";
  v28 = NSStringFromSelector(sel_originatingDeviceUID);
  v88[57] = v28;
  v87[58] = @"kMRMediaRemoteOptionDestinationDeviceUIDs";
  v27 = NSStringFromSelector(sel_destinationDeviceUIDs);
  v88[58] = v27;
  v87[59] = @"kMRMediaRemoteOptionAlwaysIgnoreDuringCall";
  v26 = NSStringFromSelector(sel_alwaysIgnoreDuringCall);
  v88[59] = v26;
  v87[60] = @"kMRMediaRemoteOptionAlwaysIgnoreDuringSharePlay";
  v25 = NSStringFromSelector(sel_alwaysIgnoreDuringSharePlay);
  v88[60] = v25;
  v87[61] = @"kMRMediaRemoteOptionCommandSequenceUUID";
  v24 = NSStringFromSelector(sel_commandSequenceUUID);
  v88[61] = v24;
  v87[62] = @"kMRMediaRemoteOptionAssistantTTSEndTimestamp";
  v23 = NSStringFromSelector(sel_assistantTTSEndTimestamp);
  v88[62] = v23;
  v87[63] = @"kMRMediaRemoteOptionAssistantCommandSendTimestamp";
  v22 = NSStringFromSelector(sel_assistantCommandSendTimestamp);
  v88[63] = v22;
  v87[64] = @"kMRMediaRemoteOptionVocalsControlActive";
  v21 = NSStringFromSelector(sel_vocalsControlActive);
  v88[64] = v21;
  v87[65] = @"kMRMediaRemoteOptionVocalsControlLevel";
  v20 = NSStringFromSelector(sel_vocalsControlLevel);
  v88[65] = v20;
  v87[66] = @"kMRMediaRemoteOptionVocalsControlMinLevel";
  v19 = NSStringFromSelector(sel_vocalsControlMinLevel);
  v88[66] = v19;
  v87[67] = @"kMRMediaRemoteOptionVocalsControlMaxLevel";
  v18 = NSStringFromSelector(sel_vocalsControlMaxLevel);
  v88[67] = v18;
  v87[68] = @"kMRMediaRemoteOptionVocalsControlContinuous";
  v17 = NSStringFromSelector(sel_vocalsControlContinuous);
  v88[68] = v17;
  v87[69] = @"kMRMediaRemoteOptionOriginatedFromRemoteDevice";
  v16 = NSStringFromSelector(sel_originatedFromRemoteDevice);
  v88[69] = v16;
  v87[70] = @"kMRMediaRemoteOptionSiriTurnIdentifier";
  v15 = NSStringFromSelector(sel_siriTurnIdentifier);
  v88[70] = v15;
  v87[71] = @"kMRMediaRemoteOptionSiriSearchDataSetIdentifier";
  v14 = NSStringFromSelector(sel_siriSearchDataSetIdentifier);
  v88[71] = v14;
  v87[72] = @"kMRMediaRemoteOptionPrepareForSetQueueIsProactive";
  v13 = NSStringFromSelector(sel_prepareForSetQueueIsProactive);
  v88[72] = v13;
  v87[73] = @"kMRMediaRemoteOptionPrepareForSetQueueProactiveReason";
  v2 = NSStringFromSelector(sel_prepareForSetQueueProactiveReason);
  v88[73] = v2;
  v87[74] = @"MRMediaRemoteOptionPrepareForSetQueueProactiveReasonType";
  v3 = NSStringFromSelector(sel_prepareForSetQueueProactiveReasonType);
  v88[74] = v3;
  v87[75] = @"kMRMediaRemoteOptionApplicationUserIdentity";
  v4 = NSStringFromSelector(sel_applicationUserIdentity);
  v88[75] = v4;
  v87[76] = @"kMRMediaRemoteOptionAssociatedParticipantIdentifier";
  v5 = NSStringFromSelector(sel_associatedParticipantIdentifier);
  v88[76] = v5;
  v87[77] = @"kMRMediaRemoteOptionDialogOptions";
  v6 = NSStringFromSelector(sel_dialogOptions);
  v88[77] = v6;
  v87[78] = @"kMRMediaRemoteOptionClientPreferredLanguages";
  v7 = NSStringFromSelector(sel_clientPreferredLanguages);
  v88[78] = v7;
  v87[79] = @"kMRMediaRemoteOptionSleepTimerTime";
  v8 = NSStringFromSelector(sel_sleepTimerTime);
  v88[79] = v8;
  v87[80] = @"kMRMediaRemoteOptionSleepTimerStopMode";
  v9 = NSStringFromSelector(sel_sleepTimerStopMode);
  v88[80] = v9;
  v87[81] = @"kMRMediaRemoteOptionReferencePosition";
  v10 = NSStringFromSelector(sel_referencePosition);
  v88[81] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:82];
  [v64 setDictionaryKeyToProtobufKeyMapping:v11];

  [(id)_MRMediaRemoteCommandOptionsSerialization___serialization setProtobufClass:objc_opt_class()];
  [(id)_MRMediaRemoteCommandOptionsSerialization___serialization setDictionaryValueToProtobufValueTransformer:&__block_literal_global_167];
  [(id)_MRMediaRemoteCommandOptionsSerialization___serialization setProtobufValueToDictionaryValueTransformer:&__block_literal_global_177];
  return [(id)_MRMediaRemoteCommandOptionsSerialization___serialization setProtobufValueToDictionaryPostTransformer:&__block_literal_global_184_0];
}

id ___MRMediaRemoteCommandOptionsSerialization_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"kMRMediaRemoteOptionRepeatMode"]
    || [v5 isEqualToString:@"kMRMediaRemoteOptionShuffleMode"])
  {
    unsigned int v7 = [v6 unsignedIntValue];
    v8 = NSNumber;
    if (v7 - 1 >= 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v7;
    }
    goto LABEL_6;
  }
  if ([v5 isEqualToString:@"PQri"])
  {
    int v14 = [v6 intValue];
    v8 = NSNumber;
    if (v14 == 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2 * (v14 == 2);
    }
    goto LABEL_6;
  }
  if ([v5 isEqualToString:@"kMRMediaRemoteOptionSendOptionsNumber"])
  {
    int v15 = [v6 intValue];
    v8 = NSNumber;
    uint64_t v9 = v15 == 1;
LABEL_6:
    v10 = v8;
LABEL_7:
    uint64_t v11 = [v10 numberWithInt:v9];
LABEL_8:
    v12 = (void *)v11;

    id v6 = v12;
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"kMRMediaRemoteOptionPlaybackSessionPriority"])
  {
    uint64_t v16 = (int)[v6 intValue];
    v10 = NSNumber;
    if (v16 == 512) {
      int v17 = 512;
    }
    else {
      int v17 = 1024;
    }
    if (v16 == 1024) {
      unsigned int v18 = 1024;
    }
    else {
      unsigned int v18 = v17;
    }
    if (v16) {
      uint64_t v9 = v18;
    }
    else {
      uint64_t v9 = 0;
    }
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"kMRMediaRemoteOptionDialogOptions"])
  {
    if ((_NSIsNSDictionary() & 1) == 0)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = [NSString stringWithUTF8String:"MRProtobufSerialization *_MRMediaRemoteCommandOptionsSerialization(void)_block_invoke_2"];
      [v19 handleFailureInFunction:v20 file:@"MRProtobufUtility.m" lineNumber:485 description:@"Expected dictionary value for kMRMediaRemoteOptionDialogOptions"];
    }
    uint64_t v11 = _MRProtoUtilsProtoDictionaryFromNSDictionary(v6);
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

id ___MRMediaRemoteCommandOptionsSerialization_block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = NSStringFromSelector(sel_repeatMode);
  int v8 = [v5 isEqualToString:v7];

  if (v8
    || (NSStringFromSelector(sel_shuffleMode),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v5 isEqualToString:v9],
        v9,
        v10))
  {
    unsigned int v11 = [v6 unsignedIntValue];
    v12 = NSNumber;
    if (v11 - 1 >= 3) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v11;
    }
LABEL_6:
    uint64_t v14 = [v12 numberWithInt:v13];
LABEL_7:
    int v15 = (void *)v14;

    id v6 = v15;
    goto LABEL_8;
  }
  int v17 = NSStringFromSelector(sel_replaceIntent);
  int v18 = [v5 isEqualToString:v17];

  if (v18)
  {
    int v19 = [v6 unsignedIntValue];
    v12 = NSNumber;
    if (v19 == 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2 * (v19 == 2);
    }
    goto LABEL_6;
  }
  v20 = NSStringFromSelector(sel_sendOptions);
  int v21 = [v5 isEqualToString:v20];

  if (v21)
  {
    BOOL v22 = [v6 intValue] == 1;
    uint64_t v14 = [NSNumber numberWithUnsignedInt:v22];
    goto LABEL_7;
  }
  v23 = NSStringFromSelector(sel_playbackSessionPriority);
  int v24 = [v5 isEqualToString:v23];

  if (v24)
  {
    int v25 = [v6 intValue];
    if (v25)
    {
      if (v25 == 512) {
        uint64_t v26 = 512;
      }
      else {
        uint64_t v26 = 1024;
      }
    }
    else
    {
      uint64_t v26 = 0;
    }
    uint64_t v14 = [NSNumber numberWithInteger:v26];
    goto LABEL_7;
  }
  v27 = NSStringFromSelector(sel_dialogOptions);
  int v28 = [v5 isEqualToString:v27];

  if (v28)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      v30 = [NSString stringWithUTF8String:"MRProtobufSerialization *_MRMediaRemoteCommandOptionsSerialization(void)_block_invoke_3"];
      [v29 handleFailureInFunction:v30, @"MRProtobufUtility.m", 508, @"Expected DictionaryProtobuf value for kMRMediaRemoteOptionDialogOptions: %@", v6 file lineNumber description];
    }
    uint64_t v14 = _MRProtoUtilsNSDictionaryFromProtoDictionary(v6);
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

void ___MRMediaRemoteCommandOptionsSerialization_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v4 = a3;
  id v5 = [v9 systemAppPlaybackQueue];

  if (v5)
  {
    id v6 = [v9 systemAppPlaybackQueue];
    unsigned int v7 = MRSystemAppPlaybackQueueCreateFromProtobuf(v6);

    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation(*MEMORY[0x1E4F1CF80], (uint64_t)v7);
    [v9 setSystemAppPlaybackQueueData:ExternalRepresentation];
    [v4 setObject:ExternalRepresentation forKeyedSubscript:@"kMRMediaRemoteOptionSystemAppPlaybackQueueData"];
    [v4 setObject:0 forKeyedSubscript:@"MRMediaRemoteOptionSystemAppPlaybackQueue"];
    MRSystemAppPlaybackQueueDestroy(v7);
  }
}

@end