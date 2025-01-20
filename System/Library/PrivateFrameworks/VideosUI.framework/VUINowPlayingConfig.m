@interface VUINowPlayingConfig
- (BOOL)allowQOSReportingForiTunesLibraryPlayback;
- (BOOL)convertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero;
- (BOOL)refetchesUpNextDataForLive;
- (BOOL)refetchesUpNextDataForVOD;
- (BOOL)shouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime;
- (BOOL)shouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime;
- (BOOL)shouldSendLiveStreamStartAndEndTimesToAVKit;
- (BOOL)showsLongLoadingAlert;
- (BOOL)showsLozengeForLivePlayback;
- (BOOL)showsStillWatchingAlert;
- (BOOL)showsUpNextInHUDForLive;
- (BOOL)showsUpNextInHUDForVOD;
- (NSArray)audioIDPrefixes;
- (NSArray)mediaCharacteristicsToLocalize;
- (NSArray)mediaTypesExcludedFromReporting;
- (NSDictionary)mediaLocalizationKeyMapping;
- (VUINowPlayingConfig)init;
- (double)alertIdleTimeout;
- (double)liveSportsStartFromBeginningOffset;
- (double)liveStreamOverrunExtension;
- (double)liveStreamStartAndEndTimeBadMetadataCutoff;
- (double)liveStreamStartTimeAdjustmentSlopFactor;
- (double)longLoadingTimeout;
- (double)prerollFadeInEndOffset;
- (double)stillWatchingAlertDuration;
- (void)setAlertIdleTimeout:(double)a3;
- (void)setAllowQOSReportingForiTunesLibraryPlayback:(BOOL)a3;
- (void)setAudioIDPrefixes:(id)a3;
- (void)setConvertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero:(BOOL)a3;
- (void)setLiveSportsStartFromBeginningOffset:(double)a3;
- (void)setLiveStreamOverrunExtension:(double)a3;
- (void)setLiveStreamStartAndEndTimeBadMetadataCutoff:(double)a3;
- (void)setLiveStreamStartTimeAdjustmentSlopFactor:(double)a3;
- (void)setLongLoadingTimeout:(double)a3;
- (void)setMediaCharacteristicsToLocalize:(id)a3;
- (void)setMediaLocalizationKeyMapping:(id)a3;
- (void)setMediaTypesExcludedFromReporting:(id)a3;
- (void)setPrerollFadeInEndOffset:(double)a3;
- (void)setRefetchesUpNextDataForLive:(BOOL)a3;
- (void)setRefetchesUpNextDataForVOD:(BOOL)a3;
- (void)setShouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime:(BOOL)a3;
- (void)setShouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime:(BOOL)a3;
- (void)setShouldSendLiveStreamStartAndEndTimesToAVKit:(BOOL)a3;
- (void)setShowsLongLoadingAlert:(BOOL)a3;
- (void)setShowsLozengeForLivePlayback:(BOOL)a3;
- (void)setShowsStillWatchingAlert:(BOOL)a3;
- (void)setShowsUpNextInHUDForLive:(BOOL)a3;
- (void)setShowsUpNextInHUDForVOD:(BOOL)a3;
- (void)setStillWatchingAlertDuration:(double)a3;
@end

@implementation VUINowPlayingConfig

- (void)setShowsUpNextInHUDForVOD:(BOOL)a3
{
  self->_showsUpNextInHUDForVOD = a3;
}

- (void)setShowsUpNextInHUDForLive:(BOOL)a3
{
  self->_showsUpNextInHUDForLive = a3;
}

- (void)setShowsStillWatchingAlert:(BOOL)a3
{
  self->_showsStillWatchingAlert = a3;
}

- (void)setShowsLozengeForLivePlayback:(BOOL)a3
{
  self->_showsLozengeForLivePlayback = a3;
}

- (void)setShowsLongLoadingAlert:(BOOL)a3
{
  self->_showsLongLoadingAlert = a3;
}

- (void)setShouldSendLiveStreamStartAndEndTimesToAVKit:(BOOL)a3
{
  self->_shouldSendLiveStreamStartAndEndTimesToAVKit = a3;
}

- (void)setShouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime:(BOOL)a3
{
  self->_shouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime = a3;
}

- (void)setShouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime:(BOOL)a3
{
  self->_shouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime = a3;
}

- (void)setRefetchesUpNextDataForVOD:(BOOL)a3
{
  self->_refetchesUpNextDataForVOD = a3;
}

- (void)setRefetchesUpNextDataForLive:(BOOL)a3
{
  self->_refetchesUpNextDataForLive = a3;
}

- (void)setConvertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero:(BOOL)a3
{
  self->_convertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero = a3;
}

- (void)setAllowQOSReportingForiTunesLibraryPlayback:(BOOL)a3
{
  self->_allowQOSReportingForiTunesLibraryPlayback = a3;
}

- (void)setAlertIdleTimeout:(double)a3
{
  self->_alertIdleTimeout = a3;
}

- (VUINowPlayingConfig)init
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VUINowPlayingConfig;
  v2 = [(VUINowPlayingConfig *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2[19] = 0;
    *((_DWORD *)v2 + 2) = 16843009;
    v2[12] = 1;
    *(_OWORD *)(v2 + 24) = xmmword_1E38FDFB0;
    uint64_t v4 = *MEMORY[0x1E4FAA208];
    v12[0] = *MEMORY[0x1E4FAA1F0];
    v12[1] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    v6 = (void *)*((void *)v3 + 5);
    *((void *)v3 + 5) = v5;

    *(_WORD *)(v3 + 13) = 257;
    v7 = (void *)*((void *)v3 + 6);
    *((void *)v3 + 6) = &unk_1F3F3E3A8;

    v8 = (void *)*((void *)v3 + 8);
    *((void *)v3 + 8) = &unk_1F3F3E7D8;

    v9 = (void *)*((void *)v3 + 7);
    *((void *)v3 + 7) = &unk_1F3F3E3C0;

    *(_OWORD *)(v3 + 72) = xmmword_1E38FDFC0;
    *(_OWORD *)(v3 + 88) = xmmword_1E38FDFD0;
    *(_DWORD *)(v3 + 15) = 16843009;
    *(_OWORD *)(v3 + 104) = xmmword_1E38FDFE0;
  }
  return (VUINowPlayingConfig *)v3;
}

- (double)stillWatchingAlertDuration
{
  v3 = +[VUIFeaturesConfiguration defaultsNumberValueForKey:@"stillWatchingAlertDuration"];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double stillWatchingAlertDuration = v5;
  }
  else
  {
    double stillWatchingAlertDuration = self->_stillWatchingAlertDuration;
  }

  return stillWatchingAlertDuration;
}

- (BOOL)showsUpNextInHUDForVOD
{
  return self->_showsUpNextInHUDForVOD;
}

- (BOOL)refetchesUpNextDataForLive
{
  return self->_refetchesUpNextDataForLive;
}

- (BOOL)refetchesUpNextDataForVOD
{
  return self->_refetchesUpNextDataForVOD;
}

- (BOOL)showsUpNextInHUDForLive
{
  return self->_showsUpNextInHUDForLive;
}

- (BOOL)showsStillWatchingAlert
{
  return self->_showsStillWatchingAlert;
}

- (void)setStillWatchingAlertDuration:(double)a3
{
  self->_double stillWatchingAlertDuration = a3;
}

- (double)alertIdleTimeout
{
  return self->_alertIdleTimeout;
}

- (NSArray)mediaTypesExcludedFromReporting
{
  return self->_mediaTypesExcludedFromReporting;
}

- (void)setMediaTypesExcludedFromReporting:(id)a3
{
}

- (BOOL)allowQOSReportingForiTunesLibraryPlayback
{
  return self->_allowQOSReportingForiTunesLibraryPlayback;
}

- (BOOL)convertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero
{
  return self->_convertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero;
}

- (NSArray)mediaCharacteristicsToLocalize
{
  return self->_mediaCharacteristicsToLocalize;
}

- (void)setMediaCharacteristicsToLocalize:(id)a3
{
}

- (NSArray)audioIDPrefixes
{
  return self->_audioIDPrefixes;
}

- (void)setAudioIDPrefixes:(id)a3
{
}

- (NSDictionary)mediaLocalizationKeyMapping
{
  return self->_mediaLocalizationKeyMapping;
}

- (void)setMediaLocalizationKeyMapping:(id)a3
{
}

- (double)liveSportsStartFromBeginningOffset
{
  return self->_liveSportsStartFromBeginningOffset;
}

- (void)setLiveSportsStartFromBeginningOffset:(double)a3
{
  self->_liveSportsStartFromBeginningOffset = a3;
}

- (BOOL)shouldSendLiveStreamStartAndEndTimesToAVKit
{
  return self->_shouldSendLiveStreamStartAndEndTimesToAVKit;
}

- (BOOL)shouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime
{
  return self->_shouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime;
}

- (BOOL)shouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime
{
  return self->_shouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime;
}

- (double)liveStreamStartTimeAdjustmentSlopFactor
{
  return self->_liveStreamStartTimeAdjustmentSlopFactor;
}

- (void)setLiveStreamStartTimeAdjustmentSlopFactor:(double)a3
{
  self->_liveStreamStartTimeAdjustmentSlopFactor = a3;
}

- (double)liveStreamStartAndEndTimeBadMetadataCutoff
{
  return self->_liveStreamStartAndEndTimeBadMetadataCutoff;
}

- (void)setLiveStreamStartAndEndTimeBadMetadataCutoff:(double)a3
{
  self->_liveStreamStartAndEndTimeBadMetadataCutoff = a3;
}

- (double)liveStreamOverrunExtension
{
  return self->_liveStreamOverrunExtension;
}

- (void)setLiveStreamOverrunExtension:(double)a3
{
  self->_liveStreamOverrunExtension = a3;
}

- (double)prerollFadeInEndOffset
{
  return self->_prerollFadeInEndOffset;
}

- (void)setPrerollFadeInEndOffset:(double)a3
{
  self->_prerollFadeInEndOffset = a3;
}

- (BOOL)showsLongLoadingAlert
{
  return self->_showsLongLoadingAlert;
}

- (double)longLoadingTimeout
{
  return self->_longLoadingTimeout;
}

- (void)setLongLoadingTimeout:(double)a3
{
  self->_longLoadingTimeout = a3;
}

- (BOOL)showsLozengeForLivePlayback
{
  return self->_showsLozengeForLivePlayback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLocalizationKeyMapping, 0);
  objc_storeStrong((id *)&self->_audioIDPrefixes, 0);
  objc_storeStrong((id *)&self->_mediaCharacteristicsToLocalize, 0);
  objc_storeStrong((id *)&self->_mediaTypesExcludedFromReporting, 0);
}

@end