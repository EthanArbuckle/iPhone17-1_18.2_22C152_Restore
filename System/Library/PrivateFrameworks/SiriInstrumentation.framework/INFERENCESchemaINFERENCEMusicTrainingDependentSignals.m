@interface INFERENCESchemaINFERENCEMusicTrainingDependentSignals
- (BOOL)hasCommonForegroundBundleApp;
- (BOOL)hasCompoundActiveBundleScore;
- (BOOL)hasCompoundMediaTypeBundleScore;
- (BOOL)hasEntitySearchBundleRecencyS;
- (BOOL)hasEntitySearchBundleScore;
- (BOOL)hasEntitySearchBundleScoreRemote;
- (BOOL)hasIsAppFirstParty;
- (BOOL)hasIsBoltEnabled;
- (BOOL)hasIsClientForegroundActiveBundle;
- (BOOL)hasIsCommonForegroundApp;
- (BOOL)hasIsDisambiguationSelectedApp;
- (BOOL)hasIsForegroundBundle;
- (BOOL)hasIsModelPredictedApp;
- (BOOL)hasIsNowPlayingBundle;
- (BOOL)hasIsNowPlayingBundlePSE1;
- (BOOL)hasIsNowPlayingBundlePSE2;
- (BOOL)hasIsNowPlayingLastBundle;
- (BOOL)hasIsRawLastNowPlaying;
- (BOOL)hasIsRawLastNowPlayingBoolean;
- (BOOL)hasIsRawLastNowPlayingCoreDuet;
- (BOOL)hasIsRawMediaCategoryAudiobookSignal;
- (BOOL)hasIsRawMediaCategoryMusicSignal;
- (BOOL)hasIsRawMediaCategoryPodcastSignal;
- (BOOL)hasIsRawMediaCategoryRadioSignal;
- (BOOL)hasIsRawMediaCategoryVideoSignal;
- (BOOL)hasIsRawNowPlayingBundle;
- (BOOL)hasIsRequestedApp;
- (BOOL)hasIsSupportedFlag;
- (BOOL)hasIsSupportedUnicornMatchFlag;
- (BOOL)hasIsUnicornFlag;
- (BOOL)hasNowPlayingBundleCount;
- (BOOL)hasNowPlayingBundleRecencyS;
- (BOOL)hasNowPlayingBundleScore;
- (BOOL)hasNowPlayingUsage14Days;
- (BOOL)hasNowPlayingUsage1Day;
- (BOOL)hasNowPlayingUsage7Days;
- (BOOL)hasRawEntitySearchRecency;
- (BOOL)hasRawLastNowPlayingRecency;
- (BOOL)hasRawMediaTypeUsageSignalBook;
- (BOOL)hasRawMediaTypeUsageSignalMusic;
- (BOOL)hasRawMediaTypeUsageSignalMusicWithoutRadio;
- (BOOL)hasRawMediaTypeUsageSignalPodcast;
- (BOOL)hasRawMediaTypeUsageSignalRadio;
- (BOOL)hasRawMediaTypeUsageSignalVideo;
- (BOOL)hasRawNowPlaying10Minutes;
- (BOOL)hasRawNowPlaying1Day;
- (BOOL)hasRawNowPlaying1Hour;
- (BOOL)hasRawNowPlaying28Days;
- (BOOL)hasRawNowPlaying2Minutes;
- (BOOL)hasRawNowPlaying6Hours;
- (BOOL)hasRawNowPlaying7Days;
- (BOOL)hasRawNowPlayingBundleScore;
- (BOOL)hasRawNowPlayingCountCoreDuet10Min;
- (BOOL)hasRawNowPlayingCountCoreDuet1Day;
- (BOOL)hasRawNowPlayingCountCoreDuet1Hr;
- (BOOL)hasRawNowPlayingCountCoreDuet28Day;
- (BOOL)hasRawNowPlayingCountCoreDuet2Min;
- (BOOL)hasRawNowPlayingCountCoreDuet6Hr;
- (BOOL)hasRawNowPlayingCountCoreDuet7Day;
- (BOOL)hasRawNowPlayingRecencyCD;
- (BOOL)hasRawNowPlayingTotal;
- (BOOL)hasSubscriptionStatus;
- (BOOL)hasUsageScoreBooks;
- (BOOL)hasUsageScoreBooksRemote;
- (BOOL)hasUsageScoreMusic;
- (BOOL)hasUsageScoreMusicRemote;
- (BOOL)hasUsageScoreMusicWithoutRadio;
- (BOOL)hasUsageScoreMusicWithoutRadioRemote;
- (BOOL)hasUsageScorePodcasts;
- (BOOL)hasUsageScorePodcastsRemote;
- (BOOL)hasUsageScoreRadio;
- (BOOL)hasUsageScoreRadioRemote;
- (BOOL)hasVq21Score;
- (BOOL)isAppFirstParty;
- (BOOL)isBoltEnabled;
- (BOOL)isClientForegroundActiveBundle;
- (BOOL)isCommonForegroundApp;
- (BOOL)isDisambiguationSelectedApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForegroundBundle;
- (BOOL)isModelPredictedApp;
- (BOOL)isNowPlayingBundle;
- (BOOL)isNowPlayingBundlePSE1;
- (BOOL)isNowPlayingBundlePSE2;
- (BOOL)isNowPlayingLastBundle;
- (BOOL)isRawLastNowPlayingBoolean;
- (BOOL)isRawLastNowPlayingCoreDuet;
- (BOOL)isRawMediaCategoryAudiobookSignal;
- (BOOL)isRawMediaCategoryMusicSignal;
- (BOOL)isRawMediaCategoryPodcastSignal;
- (BOOL)isRawMediaCategoryRadioSignal;
- (BOOL)isRawMediaCategoryVideoSignal;
- (BOOL)isRawNowPlayingBundle;
- (BOOL)isRequestedApp;
- (BOOL)isSupportedFlag;
- (BOOL)isSupportedUnicornMatchFlag;
- (BOOL)isUnicornFlag;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEMusicTrainingDependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEMusicTrainingDependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)compoundActiveBundleScore;
- (double)compoundMediaTypeBundleScore;
- (double)entitySearchBundleRecencyS;
- (double)entitySearchBundleScore;
- (double)entitySearchBundleScoreRemote;
- (double)isRawLastNowPlaying;
- (double)nowPlayingBundleRecencyS;
- (double)nowPlayingBundleScore;
- (double)rawNowPlayingBundleScore;
- (double)usageScoreBooks;
- (double)usageScoreBooksRemote;
- (double)usageScoreMusic;
- (double)usageScoreMusicRemote;
- (double)usageScoreMusicWithoutRadio;
- (double)usageScoreMusicWithoutRadioRemote;
- (double)usageScorePodcasts;
- (double)usageScorePodcastsRemote;
- (double)usageScoreRadio;
- (double)usageScoreRadioRemote;
- (double)vq21Score;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)commonForegroundBundleApp;
- (int)nowPlayingBundleCount;
- (int)nowPlayingUsage14Days;
- (int)nowPlayingUsage1Day;
- (int)nowPlayingUsage7Days;
- (int)rawEntitySearchRecency;
- (int)rawLastNowPlayingRecency;
- (int)rawMediaTypeUsageSignalBook;
- (int)rawMediaTypeUsageSignalMusic;
- (int)rawMediaTypeUsageSignalMusicWithoutRadio;
- (int)rawMediaTypeUsageSignalPodcast;
- (int)rawMediaTypeUsageSignalRadio;
- (int)rawMediaTypeUsageSignalVideo;
- (int)rawNowPlaying10Minutes;
- (int)rawNowPlaying1Day;
- (int)rawNowPlaying1Hour;
- (int)rawNowPlaying28Days;
- (int)rawNowPlaying2Minutes;
- (int)rawNowPlaying6Hours;
- (int)rawNowPlaying7Days;
- (int)rawNowPlayingCountCoreDuet10Min;
- (int)rawNowPlayingCountCoreDuet1Day;
- (int)rawNowPlayingCountCoreDuet1Hr;
- (int)rawNowPlayingCountCoreDuet28Day;
- (int)rawNowPlayingCountCoreDuet2Min;
- (int)rawNowPlayingCountCoreDuet6Hr;
- (int)rawNowPlayingCountCoreDuet7Day;
- (int)rawNowPlayingRecencyCD;
- (int)rawNowPlayingTotal;
- (int)subscriptionStatus;
- (unint64_t)hash;
- (void)deleteCommonForegroundBundleApp;
- (void)deleteCompoundActiveBundleScore;
- (void)deleteCompoundMediaTypeBundleScore;
- (void)deleteEntitySearchBundleRecencyS;
- (void)deleteEntitySearchBundleScore;
- (void)deleteEntitySearchBundleScoreRemote;
- (void)deleteIsAppFirstParty;
- (void)deleteIsBoltEnabled;
- (void)deleteIsClientForegroundActiveBundle;
- (void)deleteIsCommonForegroundApp;
- (void)deleteIsDisambiguationSelectedApp;
- (void)deleteIsForegroundBundle;
- (void)deleteIsModelPredictedApp;
- (void)deleteIsNowPlayingBundle;
- (void)deleteIsNowPlayingBundlePSE1;
- (void)deleteIsNowPlayingBundlePSE2;
- (void)deleteIsNowPlayingLastBundle;
- (void)deleteIsRawLastNowPlaying;
- (void)deleteIsRawLastNowPlayingBoolean;
- (void)deleteIsRawLastNowPlayingCoreDuet;
- (void)deleteIsRawMediaCategoryAudiobookSignal;
- (void)deleteIsRawMediaCategoryMusicSignal;
- (void)deleteIsRawMediaCategoryPodcastSignal;
- (void)deleteIsRawMediaCategoryRadioSignal;
- (void)deleteIsRawMediaCategoryVideoSignal;
- (void)deleteIsRawNowPlayingBundle;
- (void)deleteIsRequestedApp;
- (void)deleteIsSupportedFlag;
- (void)deleteIsSupportedUnicornMatchFlag;
- (void)deleteIsUnicornFlag;
- (void)deleteNowPlayingBundleCount;
- (void)deleteNowPlayingBundleRecencyS;
- (void)deleteNowPlayingBundleScore;
- (void)deleteNowPlayingUsage14Days;
- (void)deleteNowPlayingUsage1Day;
- (void)deleteNowPlayingUsage7Days;
- (void)deleteRawEntitySearchRecency;
- (void)deleteRawLastNowPlayingRecency;
- (void)deleteRawMediaTypeUsageSignalBook;
- (void)deleteRawMediaTypeUsageSignalMusic;
- (void)deleteRawMediaTypeUsageSignalMusicWithoutRadio;
- (void)deleteRawMediaTypeUsageSignalPodcast;
- (void)deleteRawMediaTypeUsageSignalRadio;
- (void)deleteRawMediaTypeUsageSignalVideo;
- (void)deleteRawNowPlaying10Minutes;
- (void)deleteRawNowPlaying1Day;
- (void)deleteRawNowPlaying1Hour;
- (void)deleteRawNowPlaying28Days;
- (void)deleteRawNowPlaying2Minutes;
- (void)deleteRawNowPlaying6Hours;
- (void)deleteRawNowPlaying7Days;
- (void)deleteRawNowPlayingBundleScore;
- (void)deleteRawNowPlayingCountCoreDuet10Min;
- (void)deleteRawNowPlayingCountCoreDuet1Day;
- (void)deleteRawNowPlayingCountCoreDuet1Hr;
- (void)deleteRawNowPlayingCountCoreDuet28Day;
- (void)deleteRawNowPlayingCountCoreDuet2Min;
- (void)deleteRawNowPlayingCountCoreDuet6Hr;
- (void)deleteRawNowPlayingCountCoreDuet7Day;
- (void)deleteRawNowPlayingRecencyCD;
- (void)deleteRawNowPlayingTotal;
- (void)deleteSubscriptionStatus;
- (void)deleteUsageScoreBooks;
- (void)deleteUsageScoreBooksRemote;
- (void)deleteUsageScoreMusic;
- (void)deleteUsageScoreMusicRemote;
- (void)deleteUsageScoreMusicWithoutRadio;
- (void)deleteUsageScoreMusicWithoutRadioRemote;
- (void)deleteUsageScorePodcasts;
- (void)deleteUsageScorePodcastsRemote;
- (void)deleteUsageScoreRadio;
- (void)deleteUsageScoreRadioRemote;
- (void)deleteVq21Score;
- (void)setCommonForegroundBundleApp:(int)a3;
- (void)setCompoundActiveBundleScore:(double)a3;
- (void)setCompoundMediaTypeBundleScore:(double)a3;
- (void)setEntitySearchBundleRecencyS:(double)a3;
- (void)setEntitySearchBundleScore:(double)a3;
- (void)setEntitySearchBundleScoreRemote:(double)a3;
- (void)setHasCommonForegroundBundleApp:(BOOL)a3;
- (void)setHasCompoundActiveBundleScore:(BOOL)a3;
- (void)setHasCompoundMediaTypeBundleScore:(BOOL)a3;
- (void)setHasEntitySearchBundleRecencyS:(BOOL)a3;
- (void)setHasEntitySearchBundleScore:(BOOL)a3;
- (void)setHasEntitySearchBundleScoreRemote:(BOOL)a3;
- (void)setHasIsAppFirstParty:(BOOL)a3;
- (void)setHasIsBoltEnabled:(BOOL)a3;
- (void)setHasIsClientForegroundActiveBundle:(BOOL)a3;
- (void)setHasIsCommonForegroundApp:(BOOL)a3;
- (void)setHasIsDisambiguationSelectedApp:(BOOL)a3;
- (void)setHasIsForegroundBundle:(BOOL)a3;
- (void)setHasIsModelPredictedApp:(BOOL)a3;
- (void)setHasIsNowPlayingBundle:(BOOL)a3;
- (void)setHasIsNowPlayingBundlePSE1:(BOOL)a3;
- (void)setHasIsNowPlayingBundlePSE2:(BOOL)a3;
- (void)setHasIsNowPlayingLastBundle:(BOOL)a3;
- (void)setHasIsRawLastNowPlaying:(BOOL)a3;
- (void)setHasIsRawLastNowPlayingBoolean:(BOOL)a3;
- (void)setHasIsRawLastNowPlayingCoreDuet:(BOOL)a3;
- (void)setHasIsRawMediaCategoryAudiobookSignal:(BOOL)a3;
- (void)setHasIsRawMediaCategoryMusicSignal:(BOOL)a3;
- (void)setHasIsRawMediaCategoryPodcastSignal:(BOOL)a3;
- (void)setHasIsRawMediaCategoryRadioSignal:(BOOL)a3;
- (void)setHasIsRawMediaCategoryVideoSignal:(BOOL)a3;
- (void)setHasIsRawNowPlayingBundle:(BOOL)a3;
- (void)setHasIsRequestedApp:(BOOL)a3;
- (void)setHasIsSupportedFlag:(BOOL)a3;
- (void)setHasIsSupportedUnicornMatchFlag:(BOOL)a3;
- (void)setHasIsUnicornFlag:(BOOL)a3;
- (void)setHasNowPlayingBundleCount:(BOOL)a3;
- (void)setHasNowPlayingBundleRecencyS:(BOOL)a3;
- (void)setHasNowPlayingBundleScore:(BOOL)a3;
- (void)setHasNowPlayingUsage14Days:(BOOL)a3;
- (void)setHasNowPlayingUsage1Day:(BOOL)a3;
- (void)setHasNowPlayingUsage7Days:(BOOL)a3;
- (void)setHasRawEntitySearchRecency:(BOOL)a3;
- (void)setHasRawLastNowPlayingRecency:(BOOL)a3;
- (void)setHasRawMediaTypeUsageSignalBook:(BOOL)a3;
- (void)setHasRawMediaTypeUsageSignalMusic:(BOOL)a3;
- (void)setHasRawMediaTypeUsageSignalMusicWithoutRadio:(BOOL)a3;
- (void)setHasRawMediaTypeUsageSignalPodcast:(BOOL)a3;
- (void)setHasRawMediaTypeUsageSignalRadio:(BOOL)a3;
- (void)setHasRawMediaTypeUsageSignalVideo:(BOOL)a3;
- (void)setHasRawNowPlaying10Minutes:(BOOL)a3;
- (void)setHasRawNowPlaying1Day:(BOOL)a3;
- (void)setHasRawNowPlaying1Hour:(BOOL)a3;
- (void)setHasRawNowPlaying28Days:(BOOL)a3;
- (void)setHasRawNowPlaying2Minutes:(BOOL)a3;
- (void)setHasRawNowPlaying6Hours:(BOOL)a3;
- (void)setHasRawNowPlaying7Days:(BOOL)a3;
- (void)setHasRawNowPlayingBundleScore:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet10Min:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet1Day:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet1Hr:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet28Day:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet2Min:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet6Hr:(BOOL)a3;
- (void)setHasRawNowPlayingCountCoreDuet7Day:(BOOL)a3;
- (void)setHasRawNowPlayingRecencyCD:(BOOL)a3;
- (void)setHasRawNowPlayingTotal:(BOOL)a3;
- (void)setHasSubscriptionStatus:(BOOL)a3;
- (void)setHasUsageScoreBooks:(BOOL)a3;
- (void)setHasUsageScoreBooksRemote:(BOOL)a3;
- (void)setHasUsageScoreMusic:(BOOL)a3;
- (void)setHasUsageScoreMusicRemote:(BOOL)a3;
- (void)setHasUsageScoreMusicWithoutRadio:(BOOL)a3;
- (void)setHasUsageScoreMusicWithoutRadioRemote:(BOOL)a3;
- (void)setHasUsageScorePodcasts:(BOOL)a3;
- (void)setHasUsageScorePodcastsRemote:(BOOL)a3;
- (void)setHasUsageScoreRadio:(BOOL)a3;
- (void)setHasUsageScoreRadioRemote:(BOOL)a3;
- (void)setHasVq21Score:(BOOL)a3;
- (void)setIsAppFirstParty:(BOOL)a3;
- (void)setIsBoltEnabled:(BOOL)a3;
- (void)setIsClientForegroundActiveBundle:(BOOL)a3;
- (void)setIsCommonForegroundApp:(BOOL)a3;
- (void)setIsDisambiguationSelectedApp:(BOOL)a3;
- (void)setIsForegroundBundle:(BOOL)a3;
- (void)setIsModelPredictedApp:(BOOL)a3;
- (void)setIsNowPlayingBundle:(BOOL)a3;
- (void)setIsNowPlayingBundlePSE1:(BOOL)a3;
- (void)setIsNowPlayingBundlePSE2:(BOOL)a3;
- (void)setIsNowPlayingLastBundle:(BOOL)a3;
- (void)setIsRawLastNowPlaying:(double)a3;
- (void)setIsRawLastNowPlayingBoolean:(BOOL)a3;
- (void)setIsRawLastNowPlayingCoreDuet:(BOOL)a3;
- (void)setIsRawMediaCategoryAudiobookSignal:(BOOL)a3;
- (void)setIsRawMediaCategoryMusicSignal:(BOOL)a3;
- (void)setIsRawMediaCategoryPodcastSignal:(BOOL)a3;
- (void)setIsRawMediaCategoryRadioSignal:(BOOL)a3;
- (void)setIsRawMediaCategoryVideoSignal:(BOOL)a3;
- (void)setIsRawNowPlayingBundle:(BOOL)a3;
- (void)setIsRequestedApp:(BOOL)a3;
- (void)setIsSupportedFlag:(BOOL)a3;
- (void)setIsSupportedUnicornMatchFlag:(BOOL)a3;
- (void)setIsUnicornFlag:(BOOL)a3;
- (void)setNowPlayingBundleCount:(int)a3;
- (void)setNowPlayingBundleRecencyS:(double)a3;
- (void)setNowPlayingBundleScore:(double)a3;
- (void)setNowPlayingUsage14Days:(int)a3;
- (void)setNowPlayingUsage1Day:(int)a3;
- (void)setNowPlayingUsage7Days:(int)a3;
- (void)setRawEntitySearchRecency:(int)a3;
- (void)setRawLastNowPlayingRecency:(int)a3;
- (void)setRawMediaTypeUsageSignalBook:(int)a3;
- (void)setRawMediaTypeUsageSignalMusic:(int)a3;
- (void)setRawMediaTypeUsageSignalMusicWithoutRadio:(int)a3;
- (void)setRawMediaTypeUsageSignalPodcast:(int)a3;
- (void)setRawMediaTypeUsageSignalRadio:(int)a3;
- (void)setRawMediaTypeUsageSignalVideo:(int)a3;
- (void)setRawNowPlaying10Minutes:(int)a3;
- (void)setRawNowPlaying1Day:(int)a3;
- (void)setRawNowPlaying1Hour:(int)a3;
- (void)setRawNowPlaying28Days:(int)a3;
- (void)setRawNowPlaying2Minutes:(int)a3;
- (void)setRawNowPlaying6Hours:(int)a3;
- (void)setRawNowPlaying7Days:(int)a3;
- (void)setRawNowPlayingBundleScore:(double)a3;
- (void)setRawNowPlayingCountCoreDuet10Min:(int)a3;
- (void)setRawNowPlayingCountCoreDuet1Day:(int)a3;
- (void)setRawNowPlayingCountCoreDuet1Hr:(int)a3;
- (void)setRawNowPlayingCountCoreDuet28Day:(int)a3;
- (void)setRawNowPlayingCountCoreDuet2Min:(int)a3;
- (void)setRawNowPlayingCountCoreDuet6Hr:(int)a3;
- (void)setRawNowPlayingCountCoreDuet7Day:(int)a3;
- (void)setRawNowPlayingRecencyCD:(int)a3;
- (void)setRawNowPlayingTotal:(int)a3;
- (void)setSubscriptionStatus:(int)a3;
- (void)setUsageScoreBooks:(double)a3;
- (void)setUsageScoreBooksRemote:(double)a3;
- (void)setUsageScoreMusic:(double)a3;
- (void)setUsageScoreMusicRemote:(double)a3;
- (void)setUsageScoreMusicWithoutRadio:(double)a3;
- (void)setUsageScoreMusicWithoutRadioRemote:(double)a3;
- (void)setUsageScorePodcasts:(double)a3;
- (void)setUsageScorePodcastsRemote:(double)a3;
- (void)setUsageScoreRadio:(double)a3;
- (void)setUsageScoreRadioRemote:(double)a3;
- (void)setVq21Score:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEMusicTrainingDependentSignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)usageScoreMusicRemote
{
  return self->_usageScoreMusicRemote;
}

- (double)entitySearchBundleScoreRemote
{
  return self->_entitySearchBundleScoreRemote;
}

- (double)usageScorePodcastsRemote
{
  return self->_usageScorePodcastsRemote;
}

- (double)usageScoreRadioRemote
{
  return self->_usageScoreRadioRemote;
}

- (double)usageScoreBooksRemote
{
  return self->_usageScoreBooksRemote;
}

- (double)usageScoreMusicWithoutRadioRemote
{
  return self->_usageScoreMusicWithoutRadioRemote;
}

- (BOOL)isBoltEnabled
{
  return self->_isBoltEnabled;
}

- (BOOL)isCommonForegroundApp
{
  return self->_isCommonForegroundApp;
}

- (BOOL)isRawLastNowPlayingBoolean
{
  return self->_isRawLastNowPlayingBoolean;
}

- (int)commonForegroundBundleApp
{
  return self->_commonForegroundBundleApp;
}

- (int)rawLastNowPlayingRecency
{
  return self->_rawLastNowPlayingRecency;
}

- (int)rawNowPlaying28Days
{
  return self->_rawNowPlaying28Days;
}

- (int)rawNowPlaying7Days
{
  return self->_rawNowPlaying7Days;
}

- (int)rawNowPlaying1Day
{
  return self->_rawNowPlaying1Day;
}

- (int)rawNowPlaying6Hours
{
  return self->_rawNowPlaying6Hours;
}

- (int)rawNowPlaying1Hour
{
  return self->_rawNowPlaying1Hour;
}

- (int)rawNowPlaying10Minutes
{
  return self->_rawNowPlaying10Minutes;
}

- (int)rawNowPlaying2Minutes
{
  return self->_rawNowPlaying2Minutes;
}

- (double)isRawLastNowPlaying
{
  return self->_isRawLastNowPlaying;
}

- (double)rawNowPlayingBundleScore
{
  return self->_rawNowPlayingBundleScore;
}

- (int)rawNowPlayingTotal
{
  return self->_rawNowPlayingTotal;
}

- (BOOL)isRawNowPlayingBundle
{
  return self->_isRawNowPlayingBundle;
}

- (int)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (int)rawMediaTypeUsageSignalMusicWithoutRadio
{
  return self->_rawMediaTypeUsageSignalMusicWithoutRadio;
}

- (int)rawMediaTypeUsageSignalRadio
{
  return self->_rawMediaTypeUsageSignalRadio;
}

- (double)usageScoreMusicWithoutRadio
{
  return self->_usageScoreMusicWithoutRadio;
}

- (double)usageScoreRadio
{
  return self->_usageScoreRadio;
}

- (BOOL)isModelPredictedApp
{
  return self->_isModelPredictedApp;
}

- (BOOL)isDisambiguationSelectedApp
{
  return self->_isDisambiguationSelectedApp;
}

- (BOOL)isSupportedUnicornMatchFlag
{
  return self->_isSupportedUnicornMatchFlag;
}

- (BOOL)isUnicornFlag
{
  return self->_isUnicornFlag;
}

- (BOOL)isSupportedFlag
{
  return self->_isSupportedFlag;
}

- (double)vq21Score
{
  return self->_vq21Score;
}

- (BOOL)isNowPlayingBundlePSE2
{
  return self->_isNowPlayingBundlePSE2;
}

- (BOOL)isNowPlayingBundlePSE1
{
  return self->_isNowPlayingBundlePSE1;
}

- (BOOL)isRequestedApp
{
  return self->_isRequestedApp;
}

- (BOOL)isAppFirstParty
{
  return self->_isAppFirstParty;
}

- (double)usageScorePodcasts
{
  return self->_usageScorePodcasts;
}

- (double)usageScoreMusic
{
  return self->_usageScoreMusic;
}

- (double)usageScoreBooks
{
  return self->_usageScoreBooks;
}

- (int)rawEntitySearchRecency
{
  return self->_rawEntitySearchRecency;
}

- (int)rawNowPlayingRecencyCD
{
  return self->_rawNowPlayingRecencyCD;
}

- (int)rawNowPlayingCountCoreDuet7Day
{
  return self->_rawNowPlayingCountCoreDuet7Day;
}

- (int)rawNowPlayingCountCoreDuet6Hr
{
  return self->_rawNowPlayingCountCoreDuet6Hr;
}

- (int)rawNowPlayingCountCoreDuet2Min
{
  return self->_rawNowPlayingCountCoreDuet2Min;
}

- (int)rawNowPlayingCountCoreDuet28Day
{
  return self->_rawNowPlayingCountCoreDuet28Day;
}

- (int)rawNowPlayingCountCoreDuet1Hr
{
  return self->_rawNowPlayingCountCoreDuet1Hr;
}

- (int)rawNowPlayingCountCoreDuet1Day
{
  return self->_rawNowPlayingCountCoreDuet1Day;
}

- (int)rawNowPlayingCountCoreDuet10Min
{
  return self->_rawNowPlayingCountCoreDuet10Min;
}

- (int)rawMediaTypeUsageSignalVideo
{
  return self->_rawMediaTypeUsageSignalVideo;
}

- (int)rawMediaTypeUsageSignalPodcast
{
  return self->_rawMediaTypeUsageSignalPodcast;
}

- (int)rawMediaTypeUsageSignalMusic
{
  return self->_rawMediaTypeUsageSignalMusic;
}

- (int)rawMediaTypeUsageSignalBook
{
  return self->_rawMediaTypeUsageSignalBook;
}

- (BOOL)isRawMediaCategoryVideoSignal
{
  return self->_isRawMediaCategoryVideoSignal;
}

- (BOOL)isRawMediaCategoryRadioSignal
{
  return self->_isRawMediaCategoryRadioSignal;
}

- (BOOL)isRawMediaCategoryPodcastSignal
{
  return self->_isRawMediaCategoryPodcastSignal;
}

- (BOOL)isRawMediaCategoryMusicSignal
{
  return self->_isRawMediaCategoryMusicSignal;
}

- (BOOL)isRawMediaCategoryAudiobookSignal
{
  return self->_isRawMediaCategoryAudiobookSignal;
}

- (BOOL)isRawLastNowPlayingCoreDuet
{
  return self->_isRawLastNowPlayingCoreDuet;
}

- (int)nowPlayingUsage14Days
{
  return self->_nowPlayingUsage14Days;
}

- (int)nowPlayingUsage7Days
{
  return self->_nowPlayingUsage7Days;
}

- (int)nowPlayingUsage1Day
{
  return self->_nowPlayingUsage1Day;
}

- (BOOL)isNowPlayingLastBundle
{
  return self->_isNowPlayingLastBundle;
}

- (double)nowPlayingBundleScore
{
  return self->_nowPlayingBundleScore;
}

- (double)nowPlayingBundleRecencyS
{
  return self->_nowPlayingBundleRecencyS;
}

- (int)nowPlayingBundleCount
{
  return self->_nowPlayingBundleCount;
}

- (BOOL)isNowPlayingBundle
{
  return self->_isNowPlayingBundle;
}

- (BOOL)isForegroundBundle
{
  return self->_isForegroundBundle;
}

- (double)entitySearchBundleScore
{
  return self->_entitySearchBundleScore;
}

- (double)entitySearchBundleRecencyS
{
  return self->_entitySearchBundleRecencyS;
}

- (double)compoundMediaTypeBundleScore
{
  return self->_compoundMediaTypeBundleScore;
}

- (double)compoundActiveBundleScore
{
  return self->_compoundActiveBundleScore;
}

- (BOOL)isClientForegroundActiveBundle
{
  return self->_isClientForegroundActiveBundle;
}

- (INFERENCESchemaINFERENCEMusicTrainingDependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v157.receiver = self;
  v157.super_class = (Class)INFERENCESchemaINFERENCEMusicTrainingDependentSignals;
  v5 = [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)&v157 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isClientForegroundActiveBundle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsClientForegroundActiveBundle:](v5, "setIsClientForegroundActiveBundle:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"compoundActiveBundleScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setCompoundActiveBundleScore:](v5, "setCompoundActiveBundleScore:");
    }
    v8 = [v4 objectForKeyedSubscript:@"compoundMediaTypeBundleScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setCompoundMediaTypeBundleScore:](v5, "setCompoundMediaTypeBundleScore:");
    }
    v9 = [v4 objectForKeyedSubscript:@"entitySearchBundleRecencyS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setEntitySearchBundleRecencyS:](v5, "setEntitySearchBundleRecencyS:");
    }
    v10 = [v4 objectForKeyedSubscript:@"entitySearchBundleScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setEntitySearchBundleScore:](v5, "setEntitySearchBundleScore:");
    }
    v11 = [v4 objectForKeyedSubscript:@"isForegroundBundle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsForegroundBundle:](v5, "setIsForegroundBundle:", [v11 BOOLValue]);
    }
    v123 = v6;
    v12 = [v4 objectForKeyedSubscript:@"isNowPlayingBundle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsNowPlayingBundle:](v5, "setIsNowPlayingBundle:", [v12 BOOLValue]);
    }
    v117 = v12;
    v13 = [v4 objectForKeyedSubscript:@"nowPlayingBundleCount"];
    objc_opt_class();
    v156 = v13;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingBundleCount:](v5, "setNowPlayingBundleCount:", [v13 intValue]);
    }
    v122 = v7;
    v14 = [v4 objectForKeyedSubscript:@"nowPlayingBundleRecencyS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingBundleRecencyS:](v5, "setNowPlayingBundleRecencyS:");
    }
    v15 = [v4 objectForKeyedSubscript:@"nowPlayingBundleScore"];
    objc_opt_class();
    v155 = v15;
    if (objc_opt_isKindOfClass())
    {
      [v15 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingBundleScore:](v5, "setNowPlayingBundleScore:");
    }
    v121 = v8;
    v16 = [v4 objectForKeyedSubscript:@"isNowPlayingLastBundle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsNowPlayingLastBundle:](v5, "setIsNowPlayingLastBundle:", [v16 BOOLValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"nowPlayingUsage1Day"];
    objc_opt_class();
    v154 = v17;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingUsage1Day:](v5, "setNowPlayingUsage1Day:", [v17 intValue]);
    }
    v120 = v9;
    v18 = [v4 objectForKeyedSubscript:@"nowPlayingUsage7Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingUsage7Days:](v5, "setNowPlayingUsage7Days:", [v18 intValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"nowPlayingUsage14Days"];
    objc_opt_class();
    v153 = v19;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setNowPlayingUsage14Days:](v5, "setNowPlayingUsage14Days:", [v19 intValue]);
    }
    v20 = v10;
    v21 = [v4 objectForKeyedSubscript:@"isRawLastNowPlayingCoreDuet"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawLastNowPlayingCoreDuet:](v5, "setIsRawLastNowPlayingCoreDuet:", [v21 BOOLValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"isRawMediaCategoryAudiobookSignal"];
    objc_opt_class();
    v152 = v22;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryAudiobookSignal:](v5, "setIsRawMediaCategoryAudiobookSignal:", [v22 BOOLValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"isRawMediaCategoryMusicSignal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryMusicSignal:](v5, "setIsRawMediaCategoryMusicSignal:", [v23 BOOLValue]);
    }
    v112 = v23;
    v24 = [v4 objectForKeyedSubscript:@"isRawMediaCategoryPodcastSignal"];
    objc_opt_class();
    v151 = v24;
    v119 = v20;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryPodcastSignal:](v5, "setIsRawMediaCategoryPodcastSignal:", [v24 BOOLValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"isRawMediaCategoryRadioSignal"];
    objc_opt_class();
    v150 = v25;
    v118 = v11;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryRadioSignal:](v5, "setIsRawMediaCategoryRadioSignal:", [v25 BOOLValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"isRawMediaCategoryVideoSignal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawMediaCategoryVideoSignal:](v5, "setIsRawMediaCategoryVideoSignal:", [v26 BOOLValue]);
    }
    v111 = v26;
    v27 = v21;
    v28 = [v4 objectForKeyedSubscript:@"rawMediaTypeUsageSignalBook"];
    objc_opt_class();
    v149 = v28;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalBook:](v5, "setRawMediaTypeUsageSignalBook:", [v28 intValue]);
    }
    v29 = v18;
    v30 = [v4 objectForKeyedSubscript:@"rawMediaTypeUsageSignalMusic"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalMusic:](v5, "setRawMediaTypeUsageSignalMusic:", [v30 intValue]);
    }
    v110 = v30;
    v31 = v16;
    v32 = [v4 objectForKeyedSubscript:@"rawMediaTypeUsageSignalPodcast"];
    objc_opt_class();
    v148 = v32;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalPodcast:](v5, "setRawMediaTypeUsageSignalPodcast:", [v32 intValue]);
    }
    v33 = v14;
    v34 = [v4 objectForKeyedSubscript:@"rawMediaTypeUsageSignalVideo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalVideo:](v5, "setRawMediaTypeUsageSignalVideo:", [v34 intValue]);
    }
    v109 = v34;
    v35 = [v4 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet10Min"];
    objc_opt_class();
    v147 = v35;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet10Min:](v5, "setRawNowPlayingCountCoreDuet10Min:", [v35 intValue]);
    }
    v36 = [v4 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet1Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet1Day:](v5, "setRawNowPlayingCountCoreDuet1Day:", [v36 intValue]);
    }
    v108 = v36;
    v37 = [v4 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet1Hr"];
    objc_opt_class();
    v146 = v37;
    v116 = v33;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet1Hr:](v5, "setRawNowPlayingCountCoreDuet1Hr:", [v37 intValue]);
    }
    v38 = [v4 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet28Day"];
    objc_opt_class();
    v145 = v38;
    v115 = v31;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet28Day:](v5, "setRawNowPlayingCountCoreDuet28Day:", [v38 intValue]);
    }
    v39 = [v4 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet2Min"];
    objc_opt_class();
    v144 = v39;
    v114 = v29;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet2Min:](v5, "setRawNowPlayingCountCoreDuet2Min:", [v39 intValue]);
    }
    v40 = [v4 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet6Hr"];
    objc_opt_class();
    v143 = v40;
    v113 = v27;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet6Hr:](v5, "setRawNowPlayingCountCoreDuet6Hr:", [v40 intValue]);
    }
    v41 = [v4 objectForKeyedSubscript:@"rawNowPlayingCountCoreDuet7Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingCountCoreDuet7Day:](v5, "setRawNowPlayingCountCoreDuet7Day:", [v41 intValue]);
    }
    v107 = v41;
    v42 = [v4 objectForKeyedSubscript:@"rawNowPlayingRecencyCD"];
    objc_opt_class();
    v142 = v42;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingRecencyCD:](v5, "setRawNowPlayingRecencyCD:", [v42 intValue]);
    }
    v43 = [v4 objectForKeyedSubscript:@"rawEntitySearchRecency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawEntitySearchRecency:](v5, "setRawEntitySearchRecency:", [v43 intValue]);
    }
    v44 = [v4 objectForKeyedSubscript:@"usageScoreBooks"];
    objc_opt_class();
    v141 = v44;
    if (objc_opt_isKindOfClass())
    {
      [v44 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreBooks:](v5, "setUsageScoreBooks:");
    }
    v45 = [v4 objectForKeyedSubscript:@"usageScoreMusic"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v45 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreMusic:](v5, "setUsageScoreMusic:");
    }
    v46 = [v4 objectForKeyedSubscript:@"usageScorePodcasts"];
    objc_opt_class();
    v140 = v46;
    if (objc_opt_isKindOfClass())
    {
      [v46 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScorePodcasts:](v5, "setUsageScorePodcasts:");
    }
    v47 = [v4 objectForKeyedSubscript:@"isAppFirstParty"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsAppFirstParty:](v5, "setIsAppFirstParty:", [v47 BOOLValue]);
    }
    v48 = [v4 objectForKeyedSubscript:@"isRequestedApp"];
    objc_opt_class();
    v139 = v48;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRequestedApp:](v5, "setIsRequestedApp:", [v48 BOOLValue]);
    }
    v49 = [v4 objectForKeyedSubscript:@"isNowPlayingBundlePSE1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsNowPlayingBundlePSE1:](v5, "setIsNowPlayingBundlePSE1:", [v49 BOOLValue]);
    }
    v50 = [v4 objectForKeyedSubscript:@"isNowPlayingBundlePSE2"];
    objc_opt_class();
    v138 = v50;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsNowPlayingBundlePSE2:](v5, "setIsNowPlayingBundlePSE2:", [v50 BOOLValue]);
    }
    v51 = [v4 objectForKeyedSubscript:@"vq21Score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v51 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setVq21Score:](v5, "setVq21Score:");
    }
    v102 = v51;
    v52 = v49;
    v53 = [v4 objectForKeyedSubscript:@"isSupportedFlag"];
    objc_opt_class();
    v137 = v53;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsSupportedFlag:](v5, "setIsSupportedFlag:", [v53 BOOLValue]);
    }
    v54 = v47;
    v55 = [v4 objectForKeyedSubscript:@"isUnicornFlag"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsUnicornFlag:](v5, "setIsUnicornFlag:", [v55 BOOLValue]);
    }
    v101 = v55;
    v56 = v45;
    v57 = [v4 objectForKeyedSubscript:@"isSupportedUnicornMatchFlag"];
    objc_opt_class();
    v136 = v57;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsSupportedUnicornMatchFlag:](v5, "setIsSupportedUnicornMatchFlag:", [v57 BOOLValue]);
    }
    v58 = v43;
    v59 = [v4 objectForKeyedSubscript:@"isDisambiguationSelectedApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsDisambiguationSelectedApp:](v5, "setIsDisambiguationSelectedApp:", [v59 BOOLValue]);
    }
    v100 = v59;
    v60 = [v4 objectForKeyedSubscript:@"isModelPredictedApp"];
    objc_opt_class();
    v135 = v60;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsModelPredictedApp:](v5, "setIsModelPredictedApp:", [v60 BOOLValue]);
    }
    v61 = [v4 objectForKeyedSubscript:@"usageScoreRadio"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v61 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreRadio:](v5, "setUsageScoreRadio:");
    }
    v99 = v61;
    v62 = [v4 objectForKeyedSubscript:@"usageScoreMusicWithoutRadio"];
    objc_opt_class();
    v134 = v62;
    v106 = v58;
    if (objc_opt_isKindOfClass())
    {
      [v62 doubleValue];
      [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)v5 setUsageScoreMusicWithoutRadio:"setUsageScoreMusicWithoutRadio:"];
    }
    v63 = [v4 objectForKeyedSubscript:@"rawMediaTypeUsageSignalRadio"];
    objc_opt_class();
    v133 = v63;
    v105 = v56;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalRadio:](v5, "setRawMediaTypeUsageSignalRadio:", [v63 intValue]);
    }
    v64 = [v4 objectForKeyedSubscript:@"rawMediaTypeUsageSignalMusicWithoutRadio"];
    objc_opt_class();
    v132 = v64;
    v104 = v54;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawMediaTypeUsageSignalMusicWithoutRadio:](v5, "setRawMediaTypeUsageSignalMusicWithoutRadio:", [v64 intValue]);
    }
    v65 = [v4 objectForKeyedSubscript:@"subscriptionStatus"];
    objc_opt_class();
    v131 = v65;
    v103 = v52;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setSubscriptionStatus:](v5, "setSubscriptionStatus:", [v65 intValue]);
    }
    v66 = [v4 objectForKeyedSubscript:@"isRawNowPlayingBundle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawNowPlayingBundle:](v5, "setIsRawNowPlayingBundle:", [v66 BOOLValue]);
    }
    v98 = v66;
    v67 = [v4 objectForKeyedSubscript:@"rawNowPlayingTotal"];
    objc_opt_class();
    v130 = v67;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingTotal:](v5, "setRawNowPlayingTotal:", [v67 intValue]);
    }
    v68 = [v4 objectForKeyedSubscript:@"rawNowPlayingBundleScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v68 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlayingBundleScore:](v5, "setRawNowPlayingBundleScore:");
    }
    v69 = [v4 objectForKeyedSubscript:@"isRawLastNowPlaying"];
    objc_opt_class();
    v129 = v69;
    if (objc_opt_isKindOfClass())
    {
      [v69 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawLastNowPlaying:](v5, "setIsRawLastNowPlaying:");
    }
    v70 = [v4 objectForKeyedSubscript:@"rawNowPlaying2Minutes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying2Minutes:](v5, "setRawNowPlaying2Minutes:", [v70 intValue]);
    }
    v71 = [v4 objectForKeyedSubscript:@"rawNowPlaying10Minutes"];
    objc_opt_class();
    v128 = v71;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying10Minutes:](v5, "setRawNowPlaying10Minutes:", [v71 intValue]);
    }
    v72 = [v4 objectForKeyedSubscript:@"rawNowPlaying1Hour"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying1Hour:](v5, "setRawNowPlaying1Hour:", [v72 intValue]);
    }
    v73 = [v4 objectForKeyedSubscript:@"rawNowPlaying6Hours"];
    objc_opt_class();
    v127 = v73;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying6Hours:](v5, "setRawNowPlaying6Hours:", [v73 intValue]);
    }
    v74 = [v4 objectForKeyedSubscript:@"rawNowPlaying1Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying1Day:](v5, "setRawNowPlaying1Day:", [v74 intValue]);
    }
    v75 = [v4 objectForKeyedSubscript:@"rawNowPlaying7Days"];
    objc_opt_class();
    v126 = v75;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying7Days:](v5, "setRawNowPlaying7Days:", [v75 intValue]);
    }
    v76 = [v4 objectForKeyedSubscript:@"rawNowPlaying28Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawNowPlaying28Days:](v5, "setRawNowPlaying28Days:", [v76 intValue]);
    }
    v77 = [v4 objectForKeyedSubscript:@"rawLastNowPlayingRecency"];
    objc_opt_class();
    v125 = v77;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setRawLastNowPlayingRecency:](v5, "setRawLastNowPlayingRecency:", [v77 intValue]);
    }
    v78 = [v4 objectForKeyedSubscript:@"commonForegroundBundleApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setCommonForegroundBundleApp:](v5, "setCommonForegroundBundleApp:", [v78 intValue]);
    }
    v79 = [v4 objectForKeyedSubscript:@"isRawLastNowPlayingBoolean"];
    objc_opt_class();
    v124 = v79;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsRawLastNowPlayingBoolean:](v5, "setIsRawLastNowPlayingBoolean:", [v79 BOOLValue]);
    }
    v96 = v70;
    v80 = [v4 objectForKeyedSubscript:@"isCommonForegroundApp"];
    objc_opt_class();
    v81 = v68;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsCommonForegroundApp:](v5, "setIsCommonForegroundApp:", [v80 BOOLValue]);
    }
    v91 = v80;
    v95 = v72;
    v82 = [v4 objectForKeyedSubscript:@"isBoltEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setIsBoltEnabled:](v5, "setIsBoltEnabled:", [v82 BOOLValue]);
    }
    v94 = v74;
    v83 = [v4 objectForKeyedSubscript:@"usageScoreMusicWithoutRadioRemote"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v83 doubleValue];
      [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)v5 setUsageScoreMusicWithoutRadioRemote:"setUsageScoreMusicWithoutRadioRemote:"];
    }
    v84 = [v4 objectForKeyedSubscript:@"usageScoreBooksRemote"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v84 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreBooksRemote:](v5, "setUsageScoreBooksRemote:");
    }
    v93 = v76;
    v85 = [v4 objectForKeyedSubscript:@"usageScoreRadioRemote"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v85 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreRadioRemote:](v5, "setUsageScoreRadioRemote:");
    }
    v92 = v78;
    v86 = [v4 objectForKeyedSubscript:@"usageScorePodcastsRemote"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v86 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScorePodcastsRemote:](v5, "setUsageScorePodcastsRemote:");
    }
    v97 = v81;
    v87 = [v4 objectForKeyedSubscript:@"entitySearchBundleScoreRemote"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v87 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setEntitySearchBundleScoreRemote:](v5, "setEntitySearchBundleScoreRemote:");
    }
    v88 = [v4 objectForKeyedSubscript:@"usageScoreMusicRemote"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v88 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals setUsageScoreMusicRemote:](v5, "setUsageScoreMusicRemote:");
    }
    v89 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEMusicTrainingDependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self dictionaryRepresentation];
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
  uint64_t has = (uint64_t)self->_has;
  if (has < 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals commonForegroundBundleApp](self, "commonForegroundBundleApp"));
    [v3 setObject:v5 forKeyedSubscript:@"commonForegroundBundleApp"];

    uint64_t has = (uint64_t)self->_has;
  }
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 2) != 0)
  {
    v11 = NSNumber;
    [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self compoundActiveBundleScore];
    v12 = objc_msgSend(v11, "numberWithDouble:");
    [v3 setObject:v12 forKeyedSubscript:@"compoundActiveBundleScore"];

    uint64_t has = (uint64_t)self->_has;
    __int16 v6 = *((_WORD *)&self->_has + 4);
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_79;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  v13 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self compoundMediaTypeBundleScore];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  [v3 setObject:v14 forKeyedSubscript:@"compoundMediaTypeBundleScore"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_80;
  }
LABEL_79:
  v15 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self entitySearchBundleRecencyS];
  v16 = objc_msgSend(v15, "numberWithDouble:");
  [v3 setObject:v16 forKeyedSubscript:@"entitySearchBundleRecencyS"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_81;
  }
LABEL_80:
  v17 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self entitySearchBundleScore];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  [v3 setObject:v18 forKeyedSubscript:@"entitySearchBundleScore"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_82;
  }
LABEL_81:
  v19 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self entitySearchBundleScoreRemote];
  v20 = objc_msgSend(v19, "numberWithDouble:");
  [v3 setObject:v20 forKeyedSubscript:@"entitySearchBundleScoreRemote"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000000) == 0)
  {
LABEL_9:
    if ((v6 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_83;
  }
LABEL_82:
  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isAppFirstParty](self, "isAppFirstParty"));
  [v3 setObject:v21 forKeyedSubscript:@"isAppFirstParty"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 4) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_84;
  }
LABEL_83:
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isBoltEnabled](self, "isBoltEnabled"));
  [v3 setObject:v22 forKeyedSubscript:@"isBoltEnabled"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((v6 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_85;
  }
LABEL_84:
  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isClientForegroundActiveBundle](self, "isClientForegroundActiveBundle"));
  [v3 setObject:v23 forKeyedSubscript:@"isClientForegroundActiveBundle"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_86;
  }
LABEL_85:
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isCommonForegroundApp](self, "isCommonForegroundApp"));
  [v3 setObject:v24 forKeyedSubscript:@"isCommonForegroundApp"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000000) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_87;
  }
LABEL_86:
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isDisambiguationSelectedApp](self, "isDisambiguationSelectedApp"));
  [v3 setObject:v25 forKeyedSubscript:@"isDisambiguationSelectedApp"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_88;
  }
LABEL_87:
  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isForegroundBundle](self, "isForegroundBundle"));
  [v3 setObject:v26 forKeyedSubscript:@"isForegroundBundle"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000000000) == 0)
  {
LABEL_15:
    if ((has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_89;
  }
LABEL_88:
  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isModelPredictedApp](self, "isModelPredictedApp"));
  [v3 setObject:v27 forKeyedSubscript:@"isModelPredictedApp"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40) == 0)
  {
LABEL_16:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_90;
  }
LABEL_89:
  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isNowPlayingBundle](self, "isNowPlayingBundle"));
  [v3 setObject:v28 forKeyedSubscript:@"isNowPlayingBundle"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000000) == 0)
  {
LABEL_17:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_91;
  }
LABEL_90:
  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isNowPlayingBundlePSE1](self, "isNowPlayingBundlePSE1"));
  [v3 setObject:v29 forKeyedSubscript:@"isNowPlayingBundlePSE1"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000000000) == 0)
  {
LABEL_18:
    if ((has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_92;
  }
LABEL_91:
  v30 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isNowPlayingBundlePSE2](self, "isNowPlayingBundlePSE2"));
  [v3 setObject:v30 forKeyedSubscript:@"isNowPlayingBundlePSE2"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400) == 0)
  {
LABEL_19:
    if ((has & 0x40000000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_93;
  }
LABEL_92:
  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isNowPlayingLastBundle](self, "isNowPlayingLastBundle"));
  [v3 setObject:v31 forKeyedSubscript:@"isNowPlayingLastBundle"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_20:
    if ((v6 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_94;
  }
LABEL_93:
  v32 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self isRawLastNowPlaying];
  v33 = objc_msgSend(v32, "numberWithDouble:");
  [v3 setObject:v33 forKeyedSubscript:@"isRawLastNowPlaying"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 1) == 0)
  {
LABEL_21:
    if ((has & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_95;
  }
LABEL_94:
  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawLastNowPlayingBoolean](self, "isRawLastNowPlayingBoolean"));
  [v3 setObject:v34 forKeyedSubscript:@"isRawLastNowPlayingBoolean"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000) == 0)
  {
LABEL_22:
    if ((has & 0x8000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_96;
  }
LABEL_95:
  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawLastNowPlayingCoreDuet](self, "isRawLastNowPlayingCoreDuet"));
  [v3 setObject:v35 forKeyedSubscript:@"isRawLastNowPlayingCoreDuet"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000) == 0)
  {
LABEL_23:
    if ((has & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_97;
  }
LABEL_96:
  v36 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawMediaCategoryAudiobookSignal](self, "isRawMediaCategoryAudiobookSignal"));
  [v3 setObject:v36 forKeyedSubscript:@"isRawMediaCategoryAudiobookSignal"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000) == 0)
  {
LABEL_24:
    if ((has & 0x20000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_98;
  }
LABEL_97:
  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawMediaCategoryMusicSignal](self, "isRawMediaCategoryMusicSignal"));
  [v3 setObject:v37 forKeyedSubscript:@"isRawMediaCategoryMusicSignal"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000) == 0)
  {
LABEL_25:
    if ((has & 0x40000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_99;
  }
LABEL_98:
  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawMediaCategoryPodcastSignal](self, "isRawMediaCategoryPodcastSignal"));
  [v3 setObject:v38 forKeyedSubscript:@"isRawMediaCategoryPodcastSignal"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000) == 0)
  {
LABEL_26:
    if ((has & 0x80000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_100;
  }
LABEL_99:
  v39 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawMediaCategoryRadioSignal](self, "isRawMediaCategoryRadioSignal"));
  [v3 setObject:v39 forKeyedSubscript:@"isRawMediaCategoryRadioSignal"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000) == 0)
  {
LABEL_27:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_101;
  }
LABEL_100:
  v40 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawMediaCategoryVideoSignal](self, "isRawMediaCategoryVideoSignal"));
  [v3 setObject:v40 forKeyedSubscript:@"isRawMediaCategoryVideoSignal"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_28:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_102;
  }
LABEL_101:
  v41 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRawNowPlayingBundle](self, "isRawNowPlayingBundle"));
  [v3 setObject:v41 forKeyedSubscript:@"isRawNowPlayingBundle"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000000) == 0)
  {
LABEL_29:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_103;
  }
LABEL_102:
  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isRequestedApp](self, "isRequestedApp"));
  [v3 setObject:v42 forKeyedSubscript:@"isRequestedApp"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000000000) == 0)
  {
LABEL_30:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_104;
  }
LABEL_103:
  v43 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isSupportedFlag](self, "isSupportedFlag"));
  [v3 setObject:v43 forKeyedSubscript:@"isSupportedFlag"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000000000) == 0)
  {
LABEL_31:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_105;
  }
LABEL_104:
  v44 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isSupportedUnicornMatchFlag](self, "isSupportedUnicornMatchFlag"));
  [v3 setObject:v44 forKeyedSubscript:@"isSupportedUnicornMatchFlag"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000000000) == 0)
  {
LABEL_32:
    if ((has & 0x80) == 0) {
      goto LABEL_33;
    }
    goto LABEL_106;
  }
LABEL_105:
  v45 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals isUnicornFlag](self, "isUnicornFlag"));
  [v3 setObject:v45 forKeyedSubscript:@"isUnicornFlag"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80) == 0)
  {
LABEL_33:
    if ((has & 0x100) == 0) {
      goto LABEL_34;
    }
    goto LABEL_107;
  }
LABEL_106:
  v46 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals nowPlayingBundleCount](self, "nowPlayingBundleCount"));
  [v3 setObject:v46 forKeyedSubscript:@"nowPlayingBundleCount"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100) == 0)
  {
LABEL_34:
    if ((has & 0x200) == 0) {
      goto LABEL_35;
    }
    goto LABEL_108;
  }
LABEL_107:
  v47 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self nowPlayingBundleRecencyS];
  v48 = objc_msgSend(v47, "numberWithDouble:");
  [v3 setObject:v48 forKeyedSubscript:@"nowPlayingBundleRecencyS"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200) == 0)
  {
LABEL_35:
    if ((has & 0x2000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_109;
  }
LABEL_108:
  v49 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self nowPlayingBundleScore];
  v50 = objc_msgSend(v49, "numberWithDouble:");
  [v3 setObject:v50 forKeyedSubscript:@"nowPlayingBundleScore"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000) == 0)
  {
LABEL_36:
    if ((has & 0x800) == 0) {
      goto LABEL_37;
    }
    goto LABEL_110;
  }
LABEL_109:
  v51 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals nowPlayingUsage14Days](self, "nowPlayingUsage14Days"));
  [v3 setObject:v51 forKeyedSubscript:@"nowPlayingUsage14Days"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800) == 0)
  {
LABEL_37:
    if ((has & 0x1000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_111;
  }
LABEL_110:
  v52 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals nowPlayingUsage1Day](self, "nowPlayingUsage1Day"));
  [v3 setObject:v52 forKeyedSubscript:@"nowPlayingUsage1Day"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000) == 0)
  {
LABEL_38:
    if ((has & 0x100000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_112;
  }
LABEL_111:
  v53 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals nowPlayingUsage7Days](self, "nowPlayingUsage7Days"));
  [v3 setObject:v53 forKeyedSubscript:@"nowPlayingUsage7Days"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000) == 0)
  {
LABEL_39:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_113;
  }
LABEL_112:
  v54 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawEntitySearchRecency](self, "rawEntitySearchRecency"));
  [v3 setObject:v54 forKeyedSubscript:@"rawEntitySearchRecency"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_40:
    if ((has & 0x100000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_114;
  }
LABEL_113:
  v55 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawLastNowPlayingRecency](self, "rawLastNowPlayingRecency"));
  [v3 setObject:v55 forKeyedSubscript:@"rawLastNowPlayingRecency"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000) == 0)
  {
LABEL_41:
    if ((has & 0x200000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_115;
  }
LABEL_114:
  v56 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawMediaTypeUsageSignalBook](self, "rawMediaTypeUsageSignalBook"));
  [v3 setObject:v56 forKeyedSubscript:@"rawMediaTypeUsageSignalBook"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000) == 0)
  {
LABEL_42:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_116;
  }
LABEL_115:
  v57 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawMediaTypeUsageSignalMusic](self, "rawMediaTypeUsageSignalMusic"));
  [v3 setObject:v57 forKeyedSubscript:@"rawMediaTypeUsageSignalMusic"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_43:
    if ((has & 0x400000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_117;
  }
LABEL_116:
  v58 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawMediaTypeUsageSignalMusicWithoutRadio](self, "rawMediaTypeUsageSignalMusicWithoutRadio"));
  [v3 setObject:v58 forKeyedSubscript:@"rawMediaTypeUsageSignalMusicWithoutRadio"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000) == 0)
  {
LABEL_44:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_118;
  }
LABEL_117:
  v59 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawMediaTypeUsageSignalPodcast](self, "rawMediaTypeUsageSignalPodcast"));
  [v3 setObject:v59 forKeyedSubscript:@"rawMediaTypeUsageSignalPodcast"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_45:
    if ((has & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_119;
  }
LABEL_118:
  v60 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawMediaTypeUsageSignalRadio](self, "rawMediaTypeUsageSignalRadio"));
  [v3 setObject:v60 forKeyedSubscript:@"rawMediaTypeUsageSignalRadio"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000) == 0)
  {
LABEL_46:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_120;
  }
LABEL_119:
  v61 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawMediaTypeUsageSignalVideo](self, "rawMediaTypeUsageSignalVideo"));
  [v3 setObject:v61 forKeyedSubscript:@"rawMediaTypeUsageSignalVideo"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_47:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_121;
  }
LABEL_120:
  v62 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying10Minutes](self, "rawNowPlaying10Minutes"));
  [v3 setObject:v62 forKeyedSubscript:@"rawNowPlaying10Minutes"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_48:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_122;
  }
LABEL_121:
  v63 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying1Day](self, "rawNowPlaying1Day"));
  [v3 setObject:v63 forKeyedSubscript:@"rawNowPlaying1Day"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_49:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_123;
  }
LABEL_122:
  v64 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying1Hour](self, "rawNowPlaying1Hour"));
  [v3 setObject:v64 forKeyedSubscript:@"rawNowPlaying1Hour"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_50:
    if ((has & 0x80000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_124;
  }
LABEL_123:
  v65 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying28Days](self, "rawNowPlaying28Days"));
  [v3 setObject:v65 forKeyedSubscript:@"rawNowPlaying28Days"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x400000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_125;
  }
LABEL_124:
  v66 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying2Minutes](self, "rawNowPlaying2Minutes"));
  [v3 setObject:v66 forKeyedSubscript:@"rawNowPlaying2Minutes"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_52:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_126;
  }
LABEL_125:
  v67 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying6Hours](self, "rawNowPlaying6Hours"));
  [v3 setObject:v67 forKeyedSubscript:@"rawNowPlaying6Hours"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_53:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_127;
  }
LABEL_126:
  v68 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlaying7Days](self, "rawNowPlaying7Days"));
  [v3 setObject:v68 forKeyedSubscript:@"rawNowPlaying7Days"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x1000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_128;
  }
LABEL_127:
  v69 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self rawNowPlayingBundleScore];
  v70 = objc_msgSend(v69, "numberWithDouble:");
  [v3 setObject:v70 forKeyedSubscript:@"rawNowPlayingBundleScore"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000) == 0)
  {
LABEL_55:
    if ((has & 0x2000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_129;
  }
LABEL_128:
  v71 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet10Min](self, "rawNowPlayingCountCoreDuet10Min"));
  [v3 setObject:v71 forKeyedSubscript:@"rawNowPlayingCountCoreDuet10Min"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000) == 0)
  {
LABEL_56:
    if ((has & 0x4000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_130;
  }
LABEL_129:
  v72 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet1Day](self, "rawNowPlayingCountCoreDuet1Day"));
  [v3 setObject:v72 forKeyedSubscript:@"rawNowPlayingCountCoreDuet1Day"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000) == 0)
  {
LABEL_57:
    if ((has & 0x8000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_131;
  }
LABEL_130:
  v73 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet1Hr](self, "rawNowPlayingCountCoreDuet1Hr"));
  [v3 setObject:v73 forKeyedSubscript:@"rawNowPlayingCountCoreDuet1Hr"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000000) == 0)
  {
LABEL_58:
    if ((has & 0x10000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_132;
  }
LABEL_131:
  v74 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet28Day](self, "rawNowPlayingCountCoreDuet28Day"));
  [v3 setObject:v74 forKeyedSubscript:@"rawNowPlayingCountCoreDuet28Day"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000000) == 0)
  {
LABEL_59:
    if ((has & 0x20000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_133;
  }
LABEL_132:
  v75 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet2Min](self, "rawNowPlayingCountCoreDuet2Min"));
  [v3 setObject:v75 forKeyedSubscript:@"rawNowPlayingCountCoreDuet2Min"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000000) == 0)
  {
LABEL_60:
    if ((has & 0x40000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_134;
  }
LABEL_133:
  v76 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet6Hr](self, "rawNowPlayingCountCoreDuet6Hr"));
  [v3 setObject:v76 forKeyedSubscript:@"rawNowPlayingCountCoreDuet6Hr"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000000) == 0)
  {
LABEL_61:
    if ((has & 0x80000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_135;
  }
LABEL_134:
  v77 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingCountCoreDuet7Day](self, "rawNowPlayingCountCoreDuet7Day"));
  [v3 setObject:v77 forKeyedSubscript:@"rawNowPlayingCountCoreDuet7Day"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000000) == 0)
  {
LABEL_62:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_136;
  }
LABEL_135:
  v78 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingRecencyCD](self, "rawNowPlayingRecencyCD"));
  [v3 setObject:v78 forKeyedSubscript:@"rawNowPlayingRecencyCD"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_63:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_137;
  }
LABEL_136:
  v79 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingDependentSignals rawNowPlayingTotal](self, "rawNowPlayingTotal"));
  [v3 setObject:v79 forKeyedSubscript:@"rawNowPlayingTotal"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_64:
    if ((has & 0x200000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_143;
  }
LABEL_137:
  int v80 = [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self subscriptionStatus];
  v81 = @"INFERENCEMEDIASUBSCRIPTIONSTATUS_UNKNOWN";
  if (v80 == 1) {
    v81 = @"INFERENCEMEDIASUBSCRIPTIONSTATUS_NOT_SUBSCRIBED";
  }
  if (v80 == 2) {
    v82 = @"INFERENCEMEDIASUBSCRIPTIONSTATUS_SUBSCRIBED";
  }
  else {
    v82 = v81;
  }
  [v3 setObject:v82 forKeyedSubscript:@"subscriptionStatus"];
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000000) == 0)
  {
LABEL_65:
    if ((v6 & 0x10) == 0) {
      goto LABEL_66;
    }
    goto LABEL_144;
  }
LABEL_143:
  v83 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self usageScoreBooks];
  v84 = objc_msgSend(v83, "numberWithDouble:");
  [v3 setObject:v84 forKeyedSubscript:@"usageScoreBooks"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x10) == 0)
  {
LABEL_66:
    if ((has & 0x400000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_145;
  }
LABEL_144:
  v85 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self usageScoreBooksRemote];
  v86 = objc_msgSend(v85, "numberWithDouble:");
  [v3 setObject:v86 forKeyedSubscript:@"usageScoreBooksRemote"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000000) == 0)
  {
LABEL_67:
    if ((v6 & 0x100) == 0) {
      goto LABEL_68;
    }
    goto LABEL_146;
  }
LABEL_145:
  v87 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self usageScoreMusic];
  v88 = objc_msgSend(v87, "numberWithDouble:");
  [v3 setObject:v88 forKeyedSubscript:@"usageScoreMusic"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x100) == 0)
  {
LABEL_68:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_147;
  }
LABEL_146:
  v89 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self usageScoreMusicRemote];
  v90 = objc_msgSend(v89, "numberWithDouble:");
  [v3 setObject:v90 forKeyedSubscript:@"usageScoreMusicRemote"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000000000) == 0)
  {
LABEL_69:
    if ((v6 & 8) == 0) {
      goto LABEL_70;
    }
    goto LABEL_148;
  }
LABEL_147:
  v91 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self usageScoreMusicWithoutRadio];
  v92 = objc_msgSend(v91, "numberWithDouble:");
  [v3 setObject:v92 forKeyedSubscript:@"usageScoreMusicWithoutRadio"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 8) == 0)
  {
LABEL_70:
    if ((has & 0x800000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_149;
  }
LABEL_148:
  v93 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self usageScoreMusicWithoutRadioRemote];
  v94 = objc_msgSend(v93, "numberWithDouble:");
  [v3 setObject:v94 forKeyedSubscript:@"usageScoreMusicWithoutRadioRemote"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000000) == 0)
  {
LABEL_71:
    if ((v6 & 0x40) == 0) {
      goto LABEL_72;
    }
    goto LABEL_150;
  }
LABEL_149:
  v95 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self usageScorePodcasts];
  v96 = objc_msgSend(v95, "numberWithDouble:");
  [v3 setObject:v96 forKeyedSubscript:@"usageScorePodcasts"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x40) == 0)
  {
LABEL_72:
    if ((has & 0x400000000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_151;
  }
LABEL_150:
  v97 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self usageScorePodcastsRemote];
  v98 = objc_msgSend(v97, "numberWithDouble:");
  [v3 setObject:v98 forKeyedSubscript:@"usageScorePodcastsRemote"];

  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000000000) == 0)
  {
LABEL_73:
    if ((v6 & 0x20) == 0) {
      goto LABEL_74;
    }
LABEL_152:
    v101 = NSNumber;
    [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self usageScoreRadioRemote];
    v102 = objc_msgSend(v101, "numberWithDouble:");
    [v3 setObject:v102 forKeyedSubscript:@"usageScoreRadioRemote"];

    if ((*(void *)&self->_has & 0x10000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_151:
  v99 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self usageScoreRadio];
  v100 = objc_msgSend(v99, "numberWithDouble:");
  [v3 setObject:v100 forKeyedSubscript:@"usageScoreRadio"];

  uint64_t has = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x20) != 0) {
    goto LABEL_152;
  }
LABEL_74:
  if ((has & 0x10000000000) != 0)
  {
LABEL_75:
    uint64_t v7 = NSNumber;
    [(INFERENCESchemaINFERENCEMusicTrainingDependentSignals *)self vq21Score];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKeyedSubscript:@"vq21Score"];
  }
LABEL_76:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v9 = v3;

  return v9;
}

- (unint64_t)hash
{
  __int16 v3 = *((_WORD *)&self->_has + 4);
  uint64_t has = (uint64_t)self->_has;
  if (has)
  {
    uint64_t v178 = 2654435761 * self->_isClientForegroundActiveBundle;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v178 = 0;
  if ((has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double compoundActiveBundleScore = self->_compoundActiveBundleScore;
  double v6 = -compoundActiveBundleScore;
  if (compoundActiveBundleScore >= 0.0) {
    double v6 = self->_compoundActiveBundleScore;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    double compoundMediaTypeBundleScore = self->_compoundMediaTypeBundleScore;
    double v12 = -compoundMediaTypeBundleScore;
    if (compoundMediaTypeBundleScore >= 0.0) {
      double v12 = self->_compoundMediaTypeBundleScore;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 8) != 0)
  {
    double entitySearchBundleRecencyS = self->_entitySearchBundleRecencyS;
    double v17 = -entitySearchBundleRecencyS;
    if (entitySearchBundleRecencyS >= 0.0) {
      double v17 = self->_entitySearchBundleRecencyS;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ((has & 0x10) != 0)
  {
    double entitySearchBundleScore = self->_entitySearchBundleScore;
    double v22 = -entitySearchBundleScore;
    if (entitySearchBundleScore >= 0.0) {
      double v22 = self->_entitySearchBundleScore;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((has & 0x20) != 0)
  {
    uint64_t v176 = 2654435761 * self->_isForegroundBundle;
    if ((has & 0x40) != 0)
    {
LABEL_37:
      uint64_t v175 = 2654435761 * self->_isNowPlayingBundle;
      if ((has & 0x80) != 0) {
        goto LABEL_38;
      }
LABEL_45:
      uint64_t v174 = 0;
      if ((has & 0x100) != 0) {
        goto LABEL_39;
      }
LABEL_46:
      unint64_t v29 = 0;
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v176 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_37;
    }
  }
  uint64_t v175 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_45;
  }
LABEL_38:
  uint64_t v174 = 2654435761 * self->_nowPlayingBundleCount;
  if ((has & 0x100) == 0) {
    goto LABEL_46;
  }
LABEL_39:
  double nowPlayingBundleRecencyS = self->_nowPlayingBundleRecencyS;
  double v26 = -nowPlayingBundleRecencyS;
  if (nowPlayingBundleRecencyS >= 0.0) {
    double v26 = self->_nowPlayingBundleRecencyS;
  }
  long double v27 = floor(v26 + 0.5);
  double v28 = (v26 - v27) * 1.84467441e19;
  unint64_t v29 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
  if (v28 >= 0.0)
  {
    if (v28 > 0.0) {
      v29 += (unint64_t)v28;
    }
  }
  else
  {
    v29 -= (unint64_t)fabs(v28);
  }
LABEL_49:
  if ((has & 0x200) != 0)
  {
    double nowPlayingBundleScore = self->_nowPlayingBundleScore;
    double v32 = -nowPlayingBundleScore;
    if (nowPlayingBundleScore >= 0.0) {
      double v32 = self->_nowPlayingBundleScore;
    }
    long double v33 = floor(v32 + 0.5);
    double v34 = (v32 - v33) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  if ((has & 0x400) != 0)
  {
    uint64_t v172 = 2654435761 * self->_isNowPlayingLastBundle;
    if ((has & 0x800) != 0)
    {
LABEL_59:
      uint64_t v171 = 2654435761 * self->_nowPlayingUsage1Day;
      if ((has & 0x1000) != 0) {
        goto LABEL_60;
      }
      goto LABEL_87;
    }
  }
  else
  {
    uint64_t v172 = 0;
    if ((has & 0x800) != 0) {
      goto LABEL_59;
    }
  }
  uint64_t v171 = 0;
  if ((has & 0x1000) != 0)
  {
LABEL_60:
    uint64_t v170 = 2654435761 * self->_nowPlayingUsage7Days;
    if ((has & 0x2000) != 0) {
      goto LABEL_61;
    }
    goto LABEL_88;
  }
LABEL_87:
  uint64_t v170 = 0;
  if ((has & 0x2000) != 0)
  {
LABEL_61:
    uint64_t v169 = 2654435761 * self->_nowPlayingUsage14Days;
    if ((has & 0x4000) != 0) {
      goto LABEL_62;
    }
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v169 = 0;
  if ((has & 0x4000) != 0)
  {
LABEL_62:
    uint64_t v168 = 2654435761 * self->_isRawLastNowPlayingCoreDuet;
    if ((has & 0x8000) != 0) {
      goto LABEL_63;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v168 = 0;
  if ((has & 0x8000) != 0)
  {
LABEL_63:
    uint64_t v167 = 2654435761 * self->_isRawMediaCategoryAudiobookSignal;
    if ((has & 0x10000) != 0) {
      goto LABEL_64;
    }
    goto LABEL_91;
  }
LABEL_90:
  uint64_t v167 = 0;
  if ((has & 0x10000) != 0)
  {
LABEL_64:
    uint64_t v166 = 2654435761 * self->_isRawMediaCategoryMusicSignal;
    if ((has & 0x20000) != 0) {
      goto LABEL_65;
    }
    goto LABEL_92;
  }
LABEL_91:
  uint64_t v166 = 0;
  if ((has & 0x20000) != 0)
  {
LABEL_65:
    uint64_t v165 = 2654435761 * self->_isRawMediaCategoryPodcastSignal;
    if ((has & 0x40000) != 0) {
      goto LABEL_66;
    }
    goto LABEL_93;
  }
LABEL_92:
  uint64_t v165 = 0;
  if ((has & 0x40000) != 0)
  {
LABEL_66:
    uint64_t v164 = 2654435761 * self->_isRawMediaCategoryRadioSignal;
    if ((has & 0x80000) != 0) {
      goto LABEL_67;
    }
    goto LABEL_94;
  }
LABEL_93:
  uint64_t v164 = 0;
  if ((has & 0x80000) != 0)
  {
LABEL_67:
    uint64_t v163 = 2654435761 * self->_isRawMediaCategoryVideoSignal;
    if ((has & 0x100000) != 0) {
      goto LABEL_68;
    }
    goto LABEL_95;
  }
LABEL_94:
  uint64_t v163 = 0;
  if ((has & 0x100000) != 0)
  {
LABEL_68:
    uint64_t v162 = 2654435761 * self->_rawMediaTypeUsageSignalBook;
    if ((has & 0x200000) != 0) {
      goto LABEL_69;
    }
    goto LABEL_96;
  }
LABEL_95:
  uint64_t v162 = 0;
  if ((has & 0x200000) != 0)
  {
LABEL_69:
    uint64_t v161 = 2654435761 * self->_rawMediaTypeUsageSignalMusic;
    if ((has & 0x400000) != 0) {
      goto LABEL_70;
    }
    goto LABEL_97;
  }
LABEL_96:
  uint64_t v161 = 0;
  if ((has & 0x400000) != 0)
  {
LABEL_70:
    uint64_t v160 = 2654435761 * self->_rawMediaTypeUsageSignalPodcast;
    if ((has & 0x800000) != 0) {
      goto LABEL_71;
    }
    goto LABEL_98;
  }
LABEL_97:
  uint64_t v160 = 0;
  if ((has & 0x800000) != 0)
  {
LABEL_71:
    uint64_t v159 = 2654435761 * self->_rawMediaTypeUsageSignalVideo;
    if ((has & 0x1000000) != 0) {
      goto LABEL_72;
    }
    goto LABEL_99;
  }
LABEL_98:
  uint64_t v159 = 0;
  if ((has & 0x1000000) != 0)
  {
LABEL_72:
    uint64_t v158 = 2654435761 * self->_rawNowPlayingCountCoreDuet10Min;
    if ((has & 0x2000000) != 0) {
      goto LABEL_73;
    }
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v158 = 0;
  if ((has & 0x2000000) != 0)
  {
LABEL_73:
    uint64_t v157 = 2654435761 * self->_rawNowPlayingCountCoreDuet1Day;
    if ((has & 0x4000000) != 0) {
      goto LABEL_74;
    }
    goto LABEL_101;
  }
LABEL_100:
  uint64_t v157 = 0;
  if ((has & 0x4000000) != 0)
  {
LABEL_74:
    uint64_t v156 = 2654435761 * self->_rawNowPlayingCountCoreDuet1Hr;
    if ((has & 0x8000000) != 0) {
      goto LABEL_75;
    }
    goto LABEL_102;
  }
LABEL_101:
  uint64_t v156 = 0;
  if ((has & 0x8000000) != 0)
  {
LABEL_75:
    uint64_t v155 = 2654435761 * self->_rawNowPlayingCountCoreDuet28Day;
    if ((has & 0x10000000) != 0) {
      goto LABEL_76;
    }
    goto LABEL_103;
  }
LABEL_102:
  uint64_t v155 = 0;
  if ((has & 0x10000000) != 0)
  {
LABEL_76:
    uint64_t v154 = 2654435761 * self->_rawNowPlayingCountCoreDuet2Min;
    if ((has & 0x20000000) != 0) {
      goto LABEL_77;
    }
    goto LABEL_104;
  }
LABEL_103:
  uint64_t v154 = 0;
  if ((has & 0x20000000) != 0)
  {
LABEL_77:
    uint64_t v153 = 2654435761 * self->_rawNowPlayingCountCoreDuet6Hr;
    if ((has & 0x40000000) != 0) {
      goto LABEL_78;
    }
    goto LABEL_105;
  }
LABEL_104:
  uint64_t v153 = 0;
  if ((has & 0x40000000) != 0)
  {
LABEL_78:
    uint64_t v152 = 2654435761 * self->_rawNowPlayingCountCoreDuet7Day;
    if ((has & 0x80000000) != 0) {
      goto LABEL_79;
    }
    goto LABEL_106;
  }
LABEL_105:
  uint64_t v152 = 0;
  if ((has & 0x80000000) != 0)
  {
LABEL_79:
    uint64_t v151 = 2654435761 * self->_rawNowPlayingRecencyCD;
    if ((has & 0x100000000) != 0) {
      goto LABEL_80;
    }
    goto LABEL_107;
  }
LABEL_106:
  uint64_t v151 = 0;
  if ((has & 0x100000000) != 0)
  {
LABEL_80:
    uint64_t v150 = 2654435761 * self->_rawEntitySearchRecency;
    if ((has & 0x200000000) != 0) {
      goto LABEL_81;
    }
LABEL_108:
    unint64_t v182 = 0;
    goto LABEL_112;
  }
LABEL_107:
  uint64_t v150 = 0;
  if ((has & 0x200000000) == 0) {
    goto LABEL_108;
  }
LABEL_81:
  double usageScoreBooks = self->_usageScoreBooks;
  double v36 = -usageScoreBooks;
  if (usageScoreBooks >= 0.0) {
    double v36 = self->_usageScoreBooks;
  }
  long double v37 = floor(v36 + 0.5);
  double v38 = (v36 - v37) * 1.84467441e19;
  unint64_t v39 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
  if (v38 >= 0.0)
  {
    unint64_t v182 = v39;
    if (v38 <= 0.0) {
      goto LABEL_112;
    }
    unint64_t v40 = v39 + (unint64_t)v38;
  }
  else
  {
    unint64_t v40 = v39 - (unint64_t)fabs(v38);
  }
  unint64_t v182 = v40;
LABEL_112:
  if ((has & 0x400000000) == 0)
  {
    unint64_t v181 = 0;
    goto LABEL_121;
  }
  double usageScoreMusic = self->_usageScoreMusic;
  double v42 = -usageScoreMusic;
  if (usageScoreMusic >= 0.0) {
    double v42 = self->_usageScoreMusic;
  }
  long double v43 = floor(v42 + 0.5);
  double v44 = (v42 - v43) * 1.84467441e19;
  unint64_t v45 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
  if (v44 >= 0.0)
  {
    unint64_t v181 = v45;
    if (v44 <= 0.0) {
      goto LABEL_121;
    }
    unint64_t v46 = v45 + (unint64_t)v44;
  }
  else
  {
    unint64_t v46 = v45 - (unint64_t)fabs(v44);
  }
  unint64_t v181 = v46;
LABEL_121:
  if ((has & 0x800000000) != 0)
  {
    double usageScorePodcasts = self->_usageScorePodcasts;
    double v49 = -usageScorePodcasts;
    if (usageScorePodcasts >= 0.0) {
      double v49 = self->_usageScorePodcasts;
    }
    long double v50 = floor(v49 + 0.5);
    double v51 = (v49 - v50) * 1.84467441e19;
    unint64_t v47 = 2654435761u * (unint64_t)fmod(v50, 1.84467441e19);
    if (v51 >= 0.0)
    {
      if (v51 > 0.0) {
        v47 += (unint64_t)v51;
      }
    }
    else
    {
      v47 -= (unint64_t)fabs(v51);
    }
  }
  else
  {
    unint64_t v47 = 0;
  }
  unint64_t v149 = v47;
  if ((has & 0x1000000000) != 0)
  {
    uint64_t v148 = 2654435761 * self->_isAppFirstParty;
    if ((has & 0x2000000000) != 0)
    {
LABEL_131:
      uint64_t v147 = 2654435761 * self->_isRequestedApp;
      if ((has & 0x4000000000) != 0) {
        goto LABEL_132;
      }
      goto LABEL_140;
    }
  }
  else
  {
    uint64_t v148 = 0;
    if ((has & 0x2000000000) != 0) {
      goto LABEL_131;
    }
  }
  uint64_t v147 = 0;
  if ((has & 0x4000000000) != 0)
  {
LABEL_132:
    uint64_t v146 = 2654435761 * self->_isNowPlayingBundlePSE1;
    if ((has & 0x8000000000) != 0) {
      goto LABEL_133;
    }
LABEL_141:
    uint64_t v145 = 0;
    if ((has & 0x10000000000) != 0) {
      goto LABEL_134;
    }
LABEL_142:
    unint64_t v56 = 0;
    goto LABEL_145;
  }
LABEL_140:
  uint64_t v146 = 0;
  if ((has & 0x8000000000) == 0) {
    goto LABEL_141;
  }
LABEL_133:
  uint64_t v145 = 2654435761 * self->_isNowPlayingBundlePSE2;
  if ((has & 0x10000000000) == 0) {
    goto LABEL_142;
  }
LABEL_134:
  double vq21Score = self->_vq21Score;
  double v53 = -vq21Score;
  if (vq21Score >= 0.0) {
    double v53 = self->_vq21Score;
  }
  long double v54 = floor(v53 + 0.5);
  double v55 = (v53 - v54) * 1.84467441e19;
  unint64_t v56 = 2654435761u * (unint64_t)fmod(v54, 1.84467441e19);
  if (v55 >= 0.0)
  {
    if (v55 > 0.0) {
      v56 += (unint64_t)v55;
    }
  }
  else
  {
    v56 -= (unint64_t)fabs(v55);
  }
LABEL_145:
  unint64_t v144 = v56;
  if ((has & 0x20000000000) != 0)
  {
    uint64_t v143 = 2654435761 * self->_isSupportedFlag;
    if ((has & 0x40000000000) != 0)
    {
LABEL_147:
      uint64_t v142 = 2654435761 * self->_isUnicornFlag;
      if ((has & 0x80000000000) != 0) {
        goto LABEL_148;
      }
      goto LABEL_157;
    }
  }
  else
  {
    uint64_t v143 = 0;
    if ((has & 0x40000000000) != 0) {
      goto LABEL_147;
    }
  }
  uint64_t v142 = 0;
  if ((has & 0x80000000000) != 0)
  {
LABEL_148:
    uint64_t v141 = 2654435761 * self->_isSupportedUnicornMatchFlag;
    if ((has & 0x100000000000) != 0) {
      goto LABEL_149;
    }
    goto LABEL_158;
  }
LABEL_157:
  uint64_t v141 = 0;
  if ((has & 0x100000000000) != 0)
  {
LABEL_149:
    uint64_t v140 = 2654435761 * self->_isDisambiguationSelectedApp;
    if ((has & 0x200000000000) != 0) {
      goto LABEL_150;
    }
    goto LABEL_159;
  }
LABEL_158:
  uint64_t v140 = 0;
  if ((has & 0x200000000000) != 0)
  {
LABEL_150:
    uint64_t v139 = 2654435761 * self->_isModelPredictedApp;
    if ((has & 0x400000000000) != 0) {
      goto LABEL_151;
    }
LABEL_160:
    unint64_t v180 = 0;
    goto LABEL_164;
  }
LABEL_159:
  uint64_t v139 = 0;
  if ((has & 0x400000000000) == 0) {
    goto LABEL_160;
  }
LABEL_151:
  double usageScoreRadio = self->_usageScoreRadio;
  double v58 = -usageScoreRadio;
  if (usageScoreRadio >= 0.0) {
    double v58 = self->_usageScoreRadio;
  }
  long double v59 = floor(v58 + 0.5);
  double v60 = (v58 - v59) * 1.84467441e19;
  unint64_t v61 = 2654435761u * (unint64_t)fmod(v59, 1.84467441e19);
  if (v60 >= 0.0)
  {
    unint64_t v180 = v61;
    if (v60 <= 0.0) {
      goto LABEL_164;
    }
    unint64_t v62 = v61 + (unint64_t)v60;
  }
  else
  {
    unint64_t v62 = v61 - (unint64_t)fabs(v60);
  }
  unint64_t v180 = v62;
LABEL_164:
  if ((has & 0x800000000000) != 0)
  {
    double usageScoreMusicWithoutRadio = self->_usageScoreMusicWithoutRadio;
    double v65 = -usageScoreMusicWithoutRadio;
    if (usageScoreMusicWithoutRadio >= 0.0) {
      double v65 = self->_usageScoreMusicWithoutRadio;
    }
    long double v66 = floor(v65 + 0.5);
    double v67 = (v65 - v66) * 1.84467441e19;
    unint64_t v63 = 2654435761u * (unint64_t)fmod(v66, 1.84467441e19);
    if (v67 >= 0.0)
    {
      if (v67 > 0.0) {
        v63 += (unint64_t)v67;
      }
    }
    else
    {
      v63 -= (unint64_t)fabs(v67);
    }
  }
  else
  {
    unint64_t v63 = 0;
  }
  unint64_t v138 = v63;
  if ((has & 0x1000000000000) != 0)
  {
    uint64_t v137 = 2654435761 * self->_rawMediaTypeUsageSignalRadio;
    if ((has & 0x2000000000000) != 0)
    {
LABEL_174:
      uint64_t v136 = 2654435761 * self->_rawMediaTypeUsageSignalMusicWithoutRadio;
      if ((has & 0x4000000000000) != 0) {
        goto LABEL_175;
      }
      goto LABEL_184;
    }
  }
  else
  {
    uint64_t v137 = 0;
    if ((has & 0x2000000000000) != 0) {
      goto LABEL_174;
    }
  }
  uint64_t v136 = 0;
  if ((has & 0x4000000000000) != 0)
  {
LABEL_175:
    uint64_t v135 = 2654435761 * self->_subscriptionStatus;
    if ((has & 0x8000000000000) != 0) {
      goto LABEL_176;
    }
    goto LABEL_185;
  }
LABEL_184:
  uint64_t v135 = 0;
  if ((has & 0x8000000000000) != 0)
  {
LABEL_176:
    uint64_t v134 = 2654435761 * self->_isRawNowPlayingBundle;
    if ((has & 0x10000000000000) != 0) {
      goto LABEL_177;
    }
    goto LABEL_186;
  }
LABEL_185:
  uint64_t v134 = 0;
  if ((has & 0x10000000000000) != 0)
  {
LABEL_177:
    uint64_t v133 = 2654435761 * self->_rawNowPlayingTotal;
    if ((has & 0x20000000000000) != 0) {
      goto LABEL_178;
    }
LABEL_187:
    unint64_t v179 = 0;
    goto LABEL_191;
  }
LABEL_186:
  uint64_t v133 = 0;
  if ((has & 0x20000000000000) == 0) {
    goto LABEL_187;
  }
LABEL_178:
  double rawNowPlayingBundleScore = self->_rawNowPlayingBundleScore;
  double v69 = -rawNowPlayingBundleScore;
  if (rawNowPlayingBundleScore >= 0.0) {
    double v69 = self->_rawNowPlayingBundleScore;
  }
  long double v70 = floor(v69 + 0.5);
  double v71 = (v69 - v70) * 1.84467441e19;
  unint64_t v72 = 2654435761u * (unint64_t)fmod(v70, 1.84467441e19);
  if (v71 >= 0.0)
  {
    unint64_t v179 = v72;
    if (v71 <= 0.0) {
      goto LABEL_191;
    }
    unint64_t v73 = v72 + (unint64_t)v71;
  }
  else
  {
    unint64_t v73 = v72 - (unint64_t)fabs(v71);
  }
  unint64_t v179 = v73;
LABEL_191:
  if ((has & 0x40000000000000) != 0)
  {
    double isRawLastNowPlaying = self->_isRawLastNowPlaying;
    double v76 = -isRawLastNowPlaying;
    if (isRawLastNowPlaying >= 0.0) {
      double v76 = self->_isRawLastNowPlaying;
    }
    long double v77 = floor(v76 + 0.5);
    double v78 = (v76 - v77) * 1.84467441e19;
    unint64_t v74 = 2654435761u * (unint64_t)fmod(v77, 1.84467441e19);
    if (v78 >= 0.0)
    {
      if (v78 > 0.0) {
        v74 += (unint64_t)v78;
      }
    }
    else
    {
      v74 -= (unint64_t)fabs(v78);
    }
  }
  else
  {
    unint64_t v74 = 0;
  }
  unint64_t v132 = v74;
  if ((has & 0x80000000000000) != 0)
  {
    uint64_t v131 = 2654435761 * self->_rawNowPlaying2Minutes;
    if ((has & 0x100000000000000) != 0)
    {
LABEL_201:
      uint64_t v130 = 2654435761 * self->_rawNowPlaying10Minutes;
      if ((has & 0x200000000000000) != 0) {
        goto LABEL_202;
      }
      goto LABEL_212;
    }
  }
  else
  {
    uint64_t v131 = 0;
    if ((has & 0x100000000000000) != 0) {
      goto LABEL_201;
    }
  }
  uint64_t v130 = 0;
  if ((has & 0x200000000000000) != 0)
  {
LABEL_202:
    uint64_t v129 = 2654435761 * self->_rawNowPlaying1Hour;
    if ((has & 0x400000000000000) != 0) {
      goto LABEL_203;
    }
    goto LABEL_213;
  }
LABEL_212:
  uint64_t v129 = 0;
  if ((has & 0x400000000000000) != 0)
  {
LABEL_203:
    uint64_t v128 = 2654435761 * self->_rawNowPlaying6Hours;
    if ((has & 0x800000000000000) != 0) {
      goto LABEL_204;
    }
    goto LABEL_214;
  }
LABEL_213:
  uint64_t v128 = 0;
  if ((has & 0x800000000000000) != 0)
  {
LABEL_204:
    uint64_t v127 = 2654435761 * self->_rawNowPlaying1Day;
    if ((has & 0x1000000000000000) != 0) {
      goto LABEL_205;
    }
    goto LABEL_215;
  }
LABEL_214:
  uint64_t v127 = 0;
  if ((has & 0x1000000000000000) != 0)
  {
LABEL_205:
    uint64_t v126 = 2654435761 * self->_rawNowPlaying7Days;
    if ((has & 0x2000000000000000) != 0) {
      goto LABEL_206;
    }
    goto LABEL_216;
  }
LABEL_215:
  uint64_t v126 = 0;
  if ((has & 0x2000000000000000) != 0)
  {
LABEL_206:
    uint64_t v125 = 2654435761 * self->_rawNowPlaying28Days;
    if ((has & 0x4000000000000000) != 0) {
      goto LABEL_207;
    }
    goto LABEL_217;
  }
LABEL_216:
  uint64_t v125 = 0;
  if ((has & 0x4000000000000000) != 0)
  {
LABEL_207:
    uint64_t v124 = 2654435761 * self->_rawLastNowPlayingRecency;
    if (has < 0) {
      goto LABEL_208;
    }
LABEL_218:
    uint64_t v123 = 0;
    if (v3) {
      goto LABEL_209;
    }
    goto LABEL_219;
  }
LABEL_217:
  uint64_t v124 = 0;
  if ((has & 0x8000000000000000) == 0) {
    goto LABEL_218;
  }
LABEL_208:
  uint64_t v123 = 2654435761 * self->_commonForegroundBundleApp;
  if (v3)
  {
LABEL_209:
    uint64_t v122 = 2654435761 * self->_isRawLastNowPlayingBoolean;
    goto LABEL_220;
  }
LABEL_219:
  uint64_t v122 = 0;
LABEL_220:
  unint64_t v177 = v9;
  if ((v3 & 2) == 0)
  {
    uint64_t v121 = 0;
    if ((v3 & 4) != 0) {
      goto LABEL_222;
    }
LABEL_228:
    uint64_t v120 = 0;
    if ((v3 & 8) != 0) {
      goto LABEL_223;
    }
LABEL_229:
    unint64_t v83 = 0;
    goto LABEL_232;
  }
  uint64_t v121 = 2654435761 * self->_isCommonForegroundApp;
  if ((v3 & 4) == 0) {
    goto LABEL_228;
  }
LABEL_222:
  uint64_t v120 = 2654435761 * self->_isBoltEnabled;
  if ((v3 & 8) == 0) {
    goto LABEL_229;
  }
LABEL_223:
  double usageScoreMusicWithoutRadioRemote = self->_usageScoreMusicWithoutRadioRemote;
  double v80 = -usageScoreMusicWithoutRadioRemote;
  if (usageScoreMusicWithoutRadioRemote >= 0.0) {
    double v80 = self->_usageScoreMusicWithoutRadioRemote;
  }
  long double v81 = floor(v80 + 0.5);
  double v82 = (v80 - v81) * 1.84467441e19;
  unint64_t v83 = 2654435761u * (unint64_t)fmod(v81, 1.84467441e19);
  if (v82 >= 0.0)
  {
    if (v82 > 0.0) {
      v83 += (unint64_t)v82;
    }
  }
  else
  {
    v83 -= (unint64_t)fabs(v82);
  }
LABEL_232:
  unint64_t v173 = v29;
  if ((v3 & 0x10) != 0)
  {
    double usageScoreBooksRemote = self->_usageScoreBooksRemote;
    double v86 = -usageScoreBooksRemote;
    if (usageScoreBooksRemote >= 0.0) {
      double v86 = self->_usageScoreBooksRemote;
    }
    long double v87 = floor(v86 + 0.5);
    double v88 = (v86 - v87) * 1.84467441e19;
    unint64_t v84 = 2654435761u * (unint64_t)fmod(v87, 1.84467441e19);
    if (v88 >= 0.0)
    {
      if (v88 > 0.0) {
        v84 += (unint64_t)v88;
      }
    }
    else
    {
      v84 -= (unint64_t)fabs(v88);
    }
  }
  else
  {
    unint64_t v84 = 0;
  }
  unint64_t v119 = v83;
  if ((v3 & 0x20) != 0)
  {
    double usageScoreRadioRemote = self->_usageScoreRadioRemote;
    double v91 = -usageScoreRadioRemote;
    if (usageScoreRadioRemote >= 0.0) {
      double v91 = self->_usageScoreRadioRemote;
    }
    long double v92 = floor(v91 + 0.5);
    double v93 = (v91 - v92) * 1.84467441e19;
    unint64_t v89 = 2654435761u * (unint64_t)fmod(v92, 1.84467441e19);
    if (v93 >= 0.0)
    {
      if (v93 > 0.0) {
        v89 += (unint64_t)v93;
      }
    }
    else
    {
      v89 -= (unint64_t)fabs(v93);
    }
  }
  else
  {
    unint64_t v89 = 0;
  }
  unint64_t v118 = v84;
  unint64_t v94 = v30;
  unint64_t v95 = v20;
  if ((v3 & 0x40) != 0)
  {
    double usageScorePodcastsRemote = self->_usageScorePodcastsRemote;
    double v99 = -usageScorePodcastsRemote;
    if (usageScorePodcastsRemote >= 0.0) {
      double v99 = self->_usageScorePodcastsRemote;
    }
    long double v100 = floor(v99 + 0.5);
    double v101 = (v99 - v100) * 1.84467441e19;
    unint64_t v97 = 2654435761u * (unint64_t)fmod(v100, 1.84467441e19);
    unint64_t v96 = v15;
    if (v101 >= 0.0)
    {
      if (v101 > 0.0) {
        v97 += (unint64_t)v101;
      }
    }
    else
    {
      v97 -= (unint64_t)fabs(v101);
    }
  }
  else
  {
    unint64_t v96 = v15;
    unint64_t v97 = 0;
  }
  unint64_t v102 = v10;
  if ((v3 & 0x80) != 0)
  {
    double entitySearchBundleScoreRemote = self->_entitySearchBundleScoreRemote;
    double v105 = -entitySearchBundleScoreRemote;
    if (entitySearchBundleScoreRemote >= 0.0) {
      double v105 = self->_entitySearchBundleScoreRemote;
    }
    long double v106 = floor(v105 + 0.5);
    double v107 = (v105 - v106) * 1.84467441e19;
    unint64_t v103 = 2654435761u * (unint64_t)fmod(v106, 1.84467441e19);
    if (v107 >= 0.0)
    {
      if (v107 > 0.0) {
        v103 += (unint64_t)v107;
      }
    }
    else
    {
      v103 -= (unint64_t)fabs(v107);
    }
  }
  else
  {
    unint64_t v103 = 0;
  }
  if ((v3 & 0x100) == 0)
  {
    unint64_t v108 = 0;
LABEL_270:
    unint64_t v114 = v181;
    unint64_t v113 = v182;
    unint64_t v116 = v179;
    unint64_t v115 = v180;
    return v177 ^ v178 ^ v102 ^ v96 ^ v95 ^ v176 ^ v175 ^ v174 ^ v173 ^ v94 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v113 ^ v114 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v115 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v116 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v89 ^ v97 ^ v103 ^ v108;
  }
  double usageScoreMusicRemote = self->_usageScoreMusicRemote;
  double v110 = -usageScoreMusicRemote;
  if (usageScoreMusicRemote >= 0.0) {
    double v110 = self->_usageScoreMusicRemote;
  }
  long double v111 = floor(v110 + 0.5);
  double v112 = (v110 - v111) * 1.84467441e19;
  unint64_t v108 = 2654435761u * (unint64_t)fmod(v111, 1.84467441e19);
  if (v112 < 0.0)
  {
    v108 -= (unint64_t)fabs(v112);
    goto LABEL_270;
  }
  unint64_t v114 = v181;
  unint64_t v113 = v182;
  unint64_t v116 = v179;
  unint64_t v115 = v180;
  if (v112 > 0.0) {
    v108 += (unint64_t)v112;
  }
  return v177 ^ v178 ^ v102 ^ v96 ^ v95 ^ v176 ^ v175 ^ v174 ^ v173 ^ v94 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v113 ^ v114 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v115 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v116 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v89 ^ v97 ^ v103 ^ v108;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unint64_t *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_295;
  }
  unint64_t has = (unint64_t)self->_has;
  unint64_t v6 = v4[43];
  if ((has & 1) != (v4[43] & 1)) {
    goto LABEL_295;
  }
  if (has)
  {
    int isClientForegroundActiveBundle = self->_isClientForegroundActiveBundle;
    if (isClientForegroundActiveBundle != [v4 isClientForegroundActiveBundle]) {
      goto LABEL_295;
    }
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
    unint64_t has = (unint64_t)self->_has;
    int v8 = *((unsigned __int16 *)v4 + 176);
    unint64_t v6 = v4[43];
  }
  else
  {
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
    int v8 = *((unsigned __int16 *)v4 + 176);
  }
  unsigned int v10 = (has >> 1) & 1;
  if (v10 == ((v6 >> 1) & 1))
  {
    if (v10)
    {
      double compoundActiveBundleScore = self->_compoundActiveBundleScore;
      [v4 compoundActiveBundleScore];
      if (compoundActiveBundleScore != v12) {
        goto LABEL_295;
      }
      LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
      unint64_t has = (unint64_t)self->_has;
      int v8 = *((unsigned __int16 *)v4 + 176);
      unint64_t v6 = v4[43];
    }
    unsigned int v13 = (has >> 2) & 1;
    if (v13 == ((v6 >> 2) & 1))
    {
      if (v13)
      {
        double compoundMediaTypeBundleScore = self->_compoundMediaTypeBundleScore;
        [v4 compoundMediaTypeBundleScore];
        if (compoundMediaTypeBundleScore != v15) {
          goto LABEL_295;
        }
        LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
        unint64_t has = (unint64_t)self->_has;
        int v8 = *((unsigned __int16 *)v4 + 176);
        unint64_t v6 = v4[43];
      }
      unsigned int v16 = (has >> 3) & 1;
      if (v16 == ((v6 >> 3) & 1))
      {
        if (v16)
        {
          double entitySearchBundleRecencyS = self->_entitySearchBundleRecencyS;
          [v4 entitySearchBundleRecencyS];
          if (entitySearchBundleRecencyS != v18) {
            goto LABEL_295;
          }
          LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
          unint64_t has = (unint64_t)self->_has;
          int v8 = *((unsigned __int16 *)v4 + 176);
          unint64_t v6 = v4[43];
        }
        unsigned int v19 = (has >> 4) & 1;
        if (v19 == ((v6 >> 4) & 1))
        {
          if (v19)
          {
            double entitySearchBundleScore = self->_entitySearchBundleScore;
            [v4 entitySearchBundleScore];
            if (entitySearchBundleScore != v21) {
              goto LABEL_295;
            }
            LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
            unint64_t has = (unint64_t)self->_has;
            int v8 = *((unsigned __int16 *)v4 + 176);
            unint64_t v6 = v4[43];
          }
          unsigned int v22 = (has >> 5) & 1;
          if (v22 == ((v6 >> 5) & 1))
          {
            if (v22)
            {
              int isForegroundBundle = self->_isForegroundBundle;
              if (isForegroundBundle != [v4 isForegroundBundle]) {
                goto LABEL_295;
              }
              LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
              unint64_t has = (unint64_t)self->_has;
              int v8 = *((unsigned __int16 *)v4 + 176);
              unint64_t v6 = v4[43];
            }
            unsigned int v24 = (has >> 6) & 1;
            if (v24 == ((v6 >> 6) & 1))
            {
              if (v24)
              {
                int isNowPlayingBundle = self->_isNowPlayingBundle;
                if (isNowPlayingBundle != [v4 isNowPlayingBundle]) {
                  goto LABEL_295;
                }
                LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                unint64_t has = (unint64_t)self->_has;
                int v8 = *((unsigned __int16 *)v4 + 176);
                unint64_t v6 = v4[43];
              }
              unsigned int v26 = (has >> 7) & 1;
              if (v26 == ((v6 >> 7) & 1))
              {
                if (v26)
                {
                  int nowPlayingBundleCount = self->_nowPlayingBundleCount;
                  if (nowPlayingBundleCount != [v4 nowPlayingBundleCount]) {
                    goto LABEL_295;
                  }
                  LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                  unint64_t has = (unint64_t)self->_has;
                  int v8 = *((unsigned __int16 *)v4 + 176);
                  unint64_t v6 = v4[43];
                }
                unsigned int v28 = (has >> 8) & 1;
                if (v28 == ((v6 >> 8) & 1))
                {
                  if (v28)
                  {
                    double nowPlayingBundleRecencyS = self->_nowPlayingBundleRecencyS;
                    [v4 nowPlayingBundleRecencyS];
                    if (nowPlayingBundleRecencyS != v30) {
                      goto LABEL_295;
                    }
                    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                    unint64_t has = (unint64_t)self->_has;
                    int v8 = *((unsigned __int16 *)v4 + 176);
                    unint64_t v6 = v4[43];
                  }
                  unsigned int v31 = (has >> 9) & 1;
                  if (v31 == ((v6 >> 9) & 1))
                  {
                    if (v31)
                    {
                      double nowPlayingBundleScore = self->_nowPlayingBundleScore;
                      [v4 nowPlayingBundleScore];
                      if (nowPlayingBundleScore != v33) {
                        goto LABEL_295;
                      }
                      LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                      unint64_t has = (unint64_t)self->_has;
                      int v8 = *((unsigned __int16 *)v4 + 176);
                      unint64_t v6 = v4[43];
                    }
                    unsigned int v34 = (has >> 10) & 1;
                    if (v34 == ((v6 >> 10) & 1))
                    {
                      if (v34)
                      {
                        int isNowPlayingLastBundle = self->_isNowPlayingLastBundle;
                        if (isNowPlayingLastBundle != [v4 isNowPlayingLastBundle]) {
                          goto LABEL_295;
                        }
                        LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                        unint64_t has = (unint64_t)self->_has;
                        int v8 = *((unsigned __int16 *)v4 + 176);
                        unint64_t v6 = v4[43];
                      }
                      unsigned int v36 = (has >> 11) & 1;
                      if (v36 == ((v6 >> 11) & 1))
                      {
                        if (v36)
                        {
                          int nowPlayingUsage1Day = self->_nowPlayingUsage1Day;
                          if (nowPlayingUsage1Day != [v4 nowPlayingUsage1Day]) {
                            goto LABEL_295;
                          }
                          LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                          unint64_t has = (unint64_t)self->_has;
                          int v8 = *((unsigned __int16 *)v4 + 176);
                          unint64_t v6 = v4[43];
                        }
                        unsigned int v38 = (has >> 12) & 1;
                        if (v38 == ((v6 >> 12) & 1))
                        {
                          if (v38)
                          {
                            int nowPlayingUsage7Days = self->_nowPlayingUsage7Days;
                            if (nowPlayingUsage7Days != [v4 nowPlayingUsage7Days]) {
                              goto LABEL_295;
                            }
                            LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                            unint64_t has = (unint64_t)self->_has;
                            int v8 = *((unsigned __int16 *)v4 + 176);
                            unint64_t v6 = v4[43];
                          }
                          unsigned int v40 = (has >> 13) & 1;
                          if (v40 == ((v6 >> 13) & 1))
                          {
                            if (v40)
                            {
                              int nowPlayingUsage14Days = self->_nowPlayingUsage14Days;
                              if (nowPlayingUsage14Days != [v4 nowPlayingUsage14Days]) {
                                goto LABEL_295;
                              }
                              LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                              unint64_t has = (unint64_t)self->_has;
                              int v8 = *((unsigned __int16 *)v4 + 176);
                              unint64_t v6 = v4[43];
                            }
                            unsigned int v42 = (has >> 14) & 1;
                            if (v42 == ((v6 >> 14) & 1))
                            {
                              if (v42)
                              {
                                int isRawLastNowPlayingCoreDuet = self->_isRawLastNowPlayingCoreDuet;
                                if (isRawLastNowPlayingCoreDuet != [v4 isRawLastNowPlayingCoreDuet])goto LABEL_295; {
                                LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                }
                                unint64_t has = (unint64_t)self->_has;
                                int v8 = *((unsigned __int16 *)v4 + 176);
                                unint64_t v6 = v4[43];
                              }
                              unsigned int v44 = (has >> 15) & 1;
                              if (v44 == ((v6 >> 15) & 1))
                              {
                                if (v44)
                                {
                                  int isRawMediaCategoryAudiobookSignal = self->_isRawMediaCategoryAudiobookSignal;
                                  if (isRawMediaCategoryAudiobookSignal != [v4 isRawMediaCategoryAudiobookSignal])goto LABEL_295; {
                                  LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                  }
                                  unint64_t has = (unint64_t)self->_has;
                                  int v8 = *((unsigned __int16 *)v4 + 176);
                                  unint64_t v6 = v4[43];
                                }
                                unsigned int v46 = WORD1(has) & 1;
                                if (v46 == (WORD1(v6) & 1))
                                {
                                  if (v46)
                                  {
                                    int isRawMediaCategoryMusicSignal = self->_isRawMediaCategoryMusicSignal;
                                    if (isRawMediaCategoryMusicSignal != [v4 isRawMediaCategoryMusicSignal])goto LABEL_295; {
                                    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                    }
                                    unint64_t has = (unint64_t)self->_has;
                                    int v8 = *((unsigned __int16 *)v4 + 176);
                                    unint64_t v6 = v4[43];
                                  }
                                  unsigned int v48 = (has >> 17) & 1;
                                  if (v48 == ((v6 >> 17) & 1))
                                  {
                                    if (v48)
                                    {
                                      int isRawMediaCategoryPodcastSignal = self->_isRawMediaCategoryPodcastSignal;
                                      if (isRawMediaCategoryPodcastSignal != [v4 isRawMediaCategoryPodcastSignal])goto LABEL_295; {
                                      LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                      }
                                      unint64_t has = (unint64_t)self->_has;
                                      int v8 = *((unsigned __int16 *)v4 + 176);
                                      unint64_t v6 = v4[43];
                                    }
                                    unsigned int v50 = (has >> 18) & 1;
                                    if (v50 == ((v6 >> 18) & 1))
                                    {
                                      if (v50)
                                      {
                                        int isRawMediaCategoryRadioSignal = self->_isRawMediaCategoryRadioSignal;
                                        if (isRawMediaCategoryRadioSignal != [v4 isRawMediaCategoryRadioSignal])goto LABEL_295; {
                                        LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                        }
                                        unint64_t has = (unint64_t)self->_has;
                                        int v8 = *((unsigned __int16 *)v4 + 176);
                                        unint64_t v6 = v4[43];
                                      }
                                      unsigned int v52 = (has >> 19) & 1;
                                      if (v52 == ((v6 >> 19) & 1))
                                      {
                                        if (v52)
                                        {
                                          int isRawMediaCategoryVideoSignal = self->_isRawMediaCategoryVideoSignal;
                                          if (isRawMediaCategoryVideoSignal != [v4 isRawMediaCategoryVideoSignal])goto LABEL_295; {
                                          LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                          }
                                          unint64_t has = (unint64_t)self->_has;
                                          int v8 = *((unsigned __int16 *)v4 + 176);
                                          unint64_t v6 = v4[43];
                                        }
                                        unsigned int v54 = (has >> 20) & 1;
                                        if (v54 == ((v6 >> 20) & 1))
                                        {
                                          if (v54)
                                          {
                                            int rawMediaTypeUsageSignalBook = self->_rawMediaTypeUsageSignalBook;
                                            if (rawMediaTypeUsageSignalBook != [v4 rawMediaTypeUsageSignalBook])goto LABEL_295; {
                                            LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                            }
                                            unint64_t has = (unint64_t)self->_has;
                                            int v8 = *((unsigned __int16 *)v4 + 176);
                                            unint64_t v6 = v4[43];
                                          }
                                          unsigned int v56 = (has >> 21) & 1;
                                          if (v56 == ((v6 >> 21) & 1))
                                          {
                                            if (v56)
                                            {
                                              int rawMediaTypeUsageSignalMusic = self->_rawMediaTypeUsageSignalMusic;
                                              if (rawMediaTypeUsageSignalMusic != [v4 rawMediaTypeUsageSignalMusic])goto LABEL_295; {
                                              LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                              }
                                              unint64_t has = (unint64_t)self->_has;
                                              int v8 = *((unsigned __int16 *)v4 + 176);
                                              unint64_t v6 = v4[43];
                                            }
                                            unsigned int v58 = (has >> 22) & 1;
                                            if (v58 == ((v6 >> 22) & 1))
                                            {
                                              if (v58)
                                              {
                                                int rawMediaTypeUsageSignalPodcast = self->_rawMediaTypeUsageSignalPodcast;
                                                if (rawMediaTypeUsageSignalPodcast != [v4 rawMediaTypeUsageSignalPodcast]) {
                                                  goto LABEL_295;
                                                }
                                                LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                unint64_t has = (unint64_t)self->_has;
                                                int v8 = *((unsigned __int16 *)v4 + 176);
                                                unint64_t v6 = v4[43];
                                              }
                                              unsigned int v60 = (has >> 23) & 1;
                                              if (v60 == ((v6 >> 23) & 1))
                                              {
                                                if (v60)
                                                {
                                                  int rawMediaTypeUsageSignalVideo = self->_rawMediaTypeUsageSignalVideo;
                                                  if (rawMediaTypeUsageSignalVideo != [v4 rawMediaTypeUsageSignalVideo]) {
                                                    goto LABEL_295;
                                                  }
                                                  LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                  unint64_t has = (unint64_t)self->_has;
                                                  int v8 = *((unsigned __int16 *)v4 + 176);
                                                  unint64_t v6 = v4[43];
                                                }
                                                unsigned int v62 = BYTE3(has) & 1;
                                                if (v62 == (BYTE3(v6) & 1))
                                                {
                                                  if (v62)
                                                  {
                                                    int rawNowPlayingCountCoreDuet10Min = self->_rawNowPlayingCountCoreDuet10Min;
                                                    if (rawNowPlayingCountCoreDuet10Min != [v4 rawNowPlayingCountCoreDuet10Min]) {
                                                      goto LABEL_295;
                                                    }
                                                    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                    unint64_t has = (unint64_t)self->_has;
                                                    int v8 = *((unsigned __int16 *)v4 + 176);
                                                    unint64_t v6 = v4[43];
                                                  }
                                                  unsigned int v64 = (has >> 25) & 1;
                                                  if (v64 == ((v6 >> 25) & 1))
                                                  {
                                                    if (v64)
                                                    {
                                                      int rawNowPlayingCountCoreDuet1Day = self->_rawNowPlayingCountCoreDuet1Day;
                                                      if (rawNowPlayingCountCoreDuet1Day != [v4 rawNowPlayingCountCoreDuet1Day]) {
                                                        goto LABEL_295;
                                                      }
                                                      LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                      unint64_t has = (unint64_t)self->_has;
                                                      int v8 = *((unsigned __int16 *)v4 + 176);
                                                      unint64_t v6 = v4[43];
                                                    }
                                                    unsigned int v66 = (has >> 26) & 1;
                                                    if (v66 == ((v6 >> 26) & 1))
                                                    {
                                                      if (v66)
                                                      {
                                                        int rawNowPlayingCountCoreDuet1Hr = self->_rawNowPlayingCountCoreDuet1Hr;
                                                        if (rawNowPlayingCountCoreDuet1Hr != [v4 rawNowPlayingCountCoreDuet1Hr]) {
                                                          goto LABEL_295;
                                                        }
                                                        LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                        unint64_t has = (unint64_t)self->_has;
                                                        int v8 = *((unsigned __int16 *)v4 + 176);
                                                        unint64_t v6 = v4[43];
                                                      }
                                                      unsigned int v68 = (has >> 27) & 1;
                                                      if (v68 == ((v6 >> 27) & 1))
                                                      {
                                                        if (v68)
                                                        {
                                                          int rawNowPlayingCountCoreDuet28Day = self->_rawNowPlayingCountCoreDuet28Day;
                                                          if (rawNowPlayingCountCoreDuet28Day != [v4 rawNowPlayingCountCoreDuet28Day]) {
                                                            goto LABEL_295;
                                                          }
                                                          LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                          unint64_t has = (unint64_t)self->_has;
                                                          int v8 = *((unsigned __int16 *)v4 + 176);
                                                          unint64_t v6 = v4[43];
                                                        }
                                                        unsigned int v70 = (has >> 28) & 1;
                                                        if (v70 == ((v6 >> 28) & 1))
                                                        {
                                                          if (v70)
                                                          {
                                                            int rawNowPlayingCountCoreDuet2Min = self->_rawNowPlayingCountCoreDuet2Min;
                                                            if (rawNowPlayingCountCoreDuet2Min != [v4 rawNowPlayingCountCoreDuet2Min]) {
                                                              goto LABEL_295;
                                                            }
                                                            LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                            unint64_t has = (unint64_t)self->_has;
                                                            int v8 = *((unsigned __int16 *)v4 + 176);
                                                            unint64_t v6 = v4[43];
                                                          }
                                                          unsigned int v72 = (has >> 29) & 1;
                                                          if (v72 == ((v6 >> 29) & 1))
                                                          {
                                                            if (v72)
                                                            {
                                                              int rawNowPlayingCountCoreDuet6Hr = self->_rawNowPlayingCountCoreDuet6Hr;
                                                              if (rawNowPlayingCountCoreDuet6Hr != [v4 rawNowPlayingCountCoreDuet6Hr]) {
                                                                goto LABEL_295;
                                                              }
                                                              LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                              unint64_t has = (unint64_t)self->_has;
                                                              int v8 = *((unsigned __int16 *)v4 + 176);
                                                              unint64_t v6 = v4[43];
                                                            }
                                                            unsigned int v74 = (has >> 30) & 1;
                                                            if (v74 == ((v6 >> 30) & 1))
                                                            {
                                                              if (v74)
                                                              {
                                                                int rawNowPlayingCountCoreDuet7Day = self->_rawNowPlayingCountCoreDuet7Day;
                                                                if (rawNowPlayingCountCoreDuet7Day != [v4 rawNowPlayingCountCoreDuet7Day]) {
                                                                  goto LABEL_295;
                                                                }
                                                                unint64_t has = (unint64_t)self->_has;
                                                                LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4);
                                                                unint64_t v6 = v4[43];
                                                                int v8 = *((unsigned __int16 *)v4 + 176);
                                                              }
                                                              if (((v6 ^ has) & 0x80000000) == 0)
                                                              {
                                                                if ((has & 0x80000000) != 0)
                                                                {
                                                                  int rawNowPlayingRecencyCD = self->_rawNowPlayingRecencyCD;
                                                                  if (rawNowPlayingRecencyCD != [v4 rawNowPlayingRecencyCD]) {
                                                                    goto LABEL_295;
                                                                  }
                                                                  unint64_t v102 = v4[43];
                                                                  unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                  unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                  uint64_t v77 = (v102 >> 33) | (v76 << 31);
                                                                  unint64_t v103 = (unint64_t)self->_has;
                                                                  char v78 = v102 >> 34;
                                                                  char v79 = v102 >> 35;
                                                                  char v80 = v102 >> 36;
                                                                  char v81 = v102 >> 37;
                                                                  char v82 = v102 >> 38;
                                                                  char v296 = v102 >> 39;
                                                                  char v295 = BYTE5(v102);
                                                                  char v265 = v102 >> 41;
                                                                  char v255 = v102 >> 42;
                                                                  char v253 = v102 >> 43;
                                                                  char v256 = v102 >> 44;
                                                                  char v257 = v102 >> 45;
                                                                  char v259 = v102 >> 46;
                                                                  char v261 = v102 >> 47;
                                                                  char v263 = BYTE6(v102);
                                                                  char v266 = v102 >> 49;
                                                                  char v268 = v102 >> 50;
                                                                  char v270 = v102 >> 51;
                                                                  char v272 = v102 >> 52;
                                                                  char v274 = v102 >> 53;
                                                                  char v276 = v102 >> 54;
                                                                  char v278 = v102 >> 55;
                                                                  char v280 = HIBYTE(v102);
                                                                  char v282 = (v102 >> 57) | ((_BYTE)v76 << 7);
                                                                  char v284 = (v102 >> 58) | ((_BYTE)v76 << 6);
                                                                  char v286 = (v102 >> 59) | (32 * v76);
                                                                  char v288 = (v102 >> 60) | (16 * v76);
                                                                  char v290 = (v102 >> 61) | (8 * v76);
                                                                  unint64_t v83 = HIDWORD(v102);
                                                                  char v291 = (v102 >> 62) | (4 * v76);
                                                                  char v292 = ((v102 & 0x8000000000000000) != 0) | (2 * v76);
                                                                  char v84 = v103 >> 33;
                                                                  char v85 = v103 >> 34;
                                                                  uint64_t v86 = (v103 >> 35) | (v96 << 29);
                                                                  char v87 = v103 >> 36;
                                                                  char v88 = v103 >> 37;
                                                                  char v89 = v103 >> 38;
                                                                  char v90 = v103 >> 39;
                                                                  char v91 = BYTE5(v103);
                                                                  char v92 = v103 >> 41;
                                                                  char v93 = v103 >> 42;
                                                                  char v94 = v103 >> 43;
                                                                  char v95 = v103 >> 44;
                                                                  char v254 = v103 >> 45;
                                                                  char v258 = v103 >> 46;
                                                                  char v260 = v103 >> 47;
                                                                  char v262 = BYTE6(v103);
                                                                  char v264 = v103 >> 49;
                                                                  char v267 = v103 >> 50;
                                                                  char v269 = v103 >> 51;
                                                                  char v271 = v103 >> 52;
                                                                  char v273 = v103 >> 53;
                                                                  char v275 = v103 >> 54;
                                                                  char v277 = v103 >> 55;
                                                                  char v279 = HIBYTE(v103);
                                                                  char v281 = (v103 >> 57) | ((_BYTE)v96 << 7);
                                                                  char v283 = (v103 >> 58) | ((_BYTE)v96 << 6);
                                                                  char v285 = (v103 >> 59) | (32 * v96);
                                                                  char v287 = (v103 >> 60) | (16 * v96);
                                                                  char v289 = (v103 >> 61) | (8 * v96);
                                                                  char v97 = (v103 >> 62) | (4 * v96);
                                                                  unint64_t v293 = v76 >> 1;
                                                                  unint64_t v294 = v76 >> 2;
                                                                  unint64_t v98 = HIDWORD(v103);
                                                                  char v100 = ((v103 & 0x8000000000000000) != 0) | (2 * v96);
                                                                  unint64_t has = v96 >> 1;
                                                                  unint64_t v7 = v96 >> 2;
                                                                }
                                                                else
                                                                {
                                                                  LOBYTE(v76) = v8;
                                                                  uint64_t v77 = (v6 >> 33) | (v8 << 31);
                                                                  char v78 = v6 >> 34;
                                                                  char v79 = v6 >> 35;
                                                                  char v80 = v6 >> 36;
                                                                  char v81 = v6 >> 37;
                                                                  char v82 = v6 >> 38;
                                                                  char v295 = BYTE5(v6);
                                                                  char v296 = v6 >> 39;
                                                                  char v265 = v6 >> 41;
                                                                  char v253 = v6 >> 43;
                                                                  char v255 = v6 >> 42;
                                                                  char v256 = v6 >> 44;
                                                                  char v257 = v6 >> 45;
                                                                  char v259 = v6 >> 46;
                                                                  char v261 = v6 >> 47;
                                                                  char v263 = BYTE6(v6);
                                                                  char v266 = v6 >> 49;
                                                                  char v268 = v6 >> 50;
                                                                  char v270 = v6 >> 51;
                                                                  char v272 = v6 >> 52;
                                                                  char v274 = v6 >> 53;
                                                                  char v276 = v6 >> 54;
                                                                  char v278 = v6 >> 55;
                                                                  char v280 = HIBYTE(v6);
                                                                  char v282 = (v6 >> 57) | ((_BYTE)v8 << 7);
                                                                  char v284 = (v6 >> 58) | ((_BYTE)v8 << 6);
                                                                  char v286 = (v6 >> 59) | (32 * v8);
                                                                  char v288 = (v6 >> 60) | (16 * v8);
                                                                  char v290 = (v6 >> 61) | (8 * v8);
                                                                  char v291 = (v6 >> 62) | (4 * v8);
                                                                  unint64_t v83 = HIDWORD(v6);
                                                                  char v292 = ((v6 & 0x8000000000000000) != 0) | (2 * v8);
                                                                  LOWORD(v293) = (unsigned __int16)v8 >> 1;
                                                                  LOWORD(v294) = (unsigned __int16)v8 >> 2;
                                                                  char v84 = has >> 33;
                                                                  char v85 = has >> 34;
                                                                  uint64_t v86 = (has >> 35) | (v7 << 29);
                                                                  char v87 = has >> 36;
                                                                  char v88 = has >> 37;
                                                                  char v89 = has >> 38;
                                                                  char v90 = has >> 39;
                                                                  char v91 = BYTE5(has);
                                                                  char v92 = has >> 41;
                                                                  char v93 = has >> 42;
                                                                  char v94 = has >> 43;
                                                                  char v95 = has >> 44;
                                                                  char v254 = has >> 45;
                                                                  char v258 = has >> 46;
                                                                  char v260 = has >> 47;
                                                                  char v262 = BYTE6(has);
                                                                  LOBYTE(v96) = v7;
                                                                  char v264 = has >> 49;
                                                                  char v267 = has >> 50;
                                                                  char v269 = has >> 51;
                                                                  char v271 = has >> 52;
                                                                  char v273 = has >> 53;
                                                                  char v275 = has >> 54;
                                                                  char v277 = has >> 55;
                                                                  char v279 = HIBYTE(has);
                                                                  char v281 = (has >> 57) | ((_BYTE)v7 << 7);
                                                                  char v283 = (has >> 58) | ((_BYTE)v7 << 6);
                                                                  char v285 = (has >> 59) | (32 * v7);
                                                                  char v287 = (has >> 60) | (16 * v7);
                                                                  char v289 = (has >> 61) | (8 * v7);
                                                                  char v97 = (has >> 62) | (4 * v7);
                                                                  unint64_t v98 = HIDWORD(has);
                                                                  unint64_t v99 = has >> 63;
                                                                  LOWORD(has) = (unsigned __int16)v7 >> 1;
                                                                  LOWORD(v7) = (unsigned __int16)v7 >> 2;
                                                                  char v100 = v99 | (2 * v96);
                                                                }
                                                                int v104 = v98 & 1;
                                                                if (v104 == (v83 & 1))
                                                                {
                                                                  if (v104)
                                                                  {
                                                                    int rawEntitySearchRecency = self->_rawEntitySearchRecency;
                                                                    if (rawEntitySearchRecency != objc_msgSend(v4, "rawEntitySearchRecency", v86, v77)) {
                                                                      goto LABEL_295;
                                                                    }
                                                                    unint64_t v106 = v4[43];
                                                                    unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                    unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                    LOBYTE(v77) = v106 >> 33;
                                                                    unint64_t v107 = (unint64_t)self->_has;
                                                                    char v78 = v106 >> 34;
                                                                    char v79 = v106 >> 35;
                                                                    char v80 = v106 >> 36;
                                                                    char v81 = v106 >> 37;
                                                                    char v82 = v106 >> 38;
                                                                    char v296 = v106 >> 39;
                                                                    char v295 = BYTE5(v106);
                                                                    char v265 = v106 >> 41;
                                                                    char v255 = v106 >> 42;
                                                                    char v253 = v106 >> 43;
                                                                    char v256 = v106 >> 44;
                                                                    char v257 = v106 >> 45;
                                                                    char v259 = v106 >> 46;
                                                                    char v261 = v106 >> 47;
                                                                    char v263 = BYTE6(v106);
                                                                    char v266 = v106 >> 49;
                                                                    char v268 = v106 >> 50;
                                                                    char v270 = v106 >> 51;
                                                                    char v272 = v106 >> 52;
                                                                    char v274 = v106 >> 53;
                                                                    char v276 = v106 >> 54;
                                                                    char v278 = v106 >> 55;
                                                                    char v280 = HIBYTE(v106);
                                                                    char v282 = (v106 >> 57) | ((_BYTE)v76 << 7);
                                                                    char v284 = (v106 >> 58) | ((_BYTE)v76 << 6);
                                                                    char v286 = (v106 >> 59) | (32 * v76);
                                                                    char v288 = (v106 >> 60) | (16 * v76);
                                                                    char v290 = (v106 >> 61) | (8 * v76);
                                                                    char v291 = (v106 >> 62) | (4 * v76);
                                                                    char v292 = ((v106 & 0x8000000000000000) != 0) | (2 * v76);
                                                                    char v84 = v107 >> 33;
                                                                    char v85 = v107 >> 34;
                                                                    uint64_t v86 = (v107 >> 35) | (v96 << 29);
                                                                    char v87 = v107 >> 36;
                                                                    char v88 = v107 >> 37;
                                                                    char v89 = v107 >> 38;
                                                                    char v90 = v107 >> 39;
                                                                    char v91 = BYTE5(v107);
                                                                    char v92 = v107 >> 41;
                                                                    char v93 = v107 >> 42;
                                                                    char v94 = v107 >> 43;
                                                                    char v95 = v107 >> 44;
                                                                    char v254 = v107 >> 45;
                                                                    char v258 = v107 >> 46;
                                                                    char v260 = v107 >> 47;
                                                                    char v262 = BYTE6(v107);
                                                                    char v264 = v107 >> 49;
                                                                    char v267 = v107 >> 50;
                                                                    char v269 = v107 >> 51;
                                                                    char v271 = v107 >> 52;
                                                                    char v273 = v107 >> 53;
                                                                    char v275 = v107 >> 54;
                                                                    char v277 = v107 >> 55;
                                                                    char v279 = HIBYTE(v107);
                                                                    char v281 = (v107 >> 57) | ((_BYTE)v96 << 7);
                                                                    char v283 = (v107 >> 58) | ((_BYTE)v96 << 6);
                                                                    char v285 = (v107 >> 59) | (32 * v96);
                                                                    char v287 = (v107 >> 60) | (16 * v96);
                                                                    char v289 = (v107 >> 61) | (8 * v96);
                                                                    char v97 = (v107 >> 62) | (4 * v96);
                                                                    unint64_t v293 = v76 >> 1;
                                                                    unint64_t v294 = v76 >> 2;
                                                                    char v100 = ((v107 & 0x8000000000000000) != 0) | (2 * v96);
                                                                    unint64_t has = v96 >> 1;
                                                                    unint64_t v7 = v96 >> 2;
                                                                  }
                                                                  int v108 = v84 & 1;
                                                                  if (v108 == (v77 & 1))
                                                                  {
                                                                    if (v108)
                                                                    {
                                                                      double usageScoreBooks = self->_usageScoreBooks;
                                                                      objc_msgSend(v4, "usageScoreBooks", v86);
                                                                      if (usageScoreBooks != v110) {
                                                                        goto LABEL_295;
                                                                      }
                                                                      unint64_t v111 = v4[43];
                                                                      unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                      unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                      char v78 = v111 >> 34;
                                                                      unint64_t v112 = (unint64_t)self->_has;
                                                                      char v79 = v111 >> 35;
                                                                      char v80 = v111 >> 36;
                                                                      char v81 = v111 >> 37;
                                                                      char v82 = v111 >> 38;
                                                                      char v296 = v111 >> 39;
                                                                      char v295 = BYTE5(v111);
                                                                      char v265 = v111 >> 41;
                                                                      char v255 = v111 >> 42;
                                                                      char v253 = v111 >> 43;
                                                                      char v256 = v111 >> 44;
                                                                      char v257 = v111 >> 45;
                                                                      char v259 = v111 >> 46;
                                                                      char v261 = v111 >> 47;
                                                                      char v263 = BYTE6(v111);
                                                                      char v266 = v111 >> 49;
                                                                      char v268 = v111 >> 50;
                                                                      char v270 = v111 >> 51;
                                                                      char v272 = v111 >> 52;
                                                                      char v274 = v111 >> 53;
                                                                      char v276 = v111 >> 54;
                                                                      char v278 = v111 >> 55;
                                                                      char v280 = HIBYTE(v111);
                                                                      char v282 = (v111 >> 57) | ((_BYTE)v76 << 7);
                                                                      char v284 = (v111 >> 58) | ((_BYTE)v76 << 6);
                                                                      char v286 = (v111 >> 59) | (32 * v76);
                                                                      char v288 = (v111 >> 60) | (16 * v76);
                                                                      char v290 = (v111 >> 61) | (8 * v76);
                                                                      char v291 = (v111 >> 62) | (4 * v76);
                                                                      char v292 = ((v111 & 0x8000000000000000) != 0) | (2 * v76);
                                                                      char v85 = v112 >> 34;
                                                                      uint64_t v86 = (v112 >> 35) | (v96 << 29);
                                                                      char v87 = v112 >> 36;
                                                                      char v88 = v112 >> 37;
                                                                      char v89 = v112 >> 38;
                                                                      char v90 = v112 >> 39;
                                                                      char v91 = BYTE5(v112);
                                                                      char v92 = v112 >> 41;
                                                                      char v93 = v112 >> 42;
                                                                      char v94 = v112 >> 43;
                                                                      char v95 = v112 >> 44;
                                                                      char v254 = v112 >> 45;
                                                                      char v258 = v112 >> 46;
                                                                      char v260 = v112 >> 47;
                                                                      char v262 = BYTE6(v112);
                                                                      char v264 = v112 >> 49;
                                                                      char v267 = v112 >> 50;
                                                                      char v269 = v112 >> 51;
                                                                      char v271 = v112 >> 52;
                                                                      char v273 = v112 >> 53;
                                                                      char v275 = v112 >> 54;
                                                                      char v277 = v112 >> 55;
                                                                      char v279 = HIBYTE(v112);
                                                                      char v281 = (v112 >> 57) | ((_BYTE)v96 << 7);
                                                                      char v283 = (v112 >> 58) | ((_BYTE)v96 << 6);
                                                                      char v285 = (v112 >> 59) | (32 * v96);
                                                                      char v287 = (v112 >> 60) | (16 * v96);
                                                                      char v289 = (v112 >> 61) | (8 * v96);
                                                                      char v97 = (v112 >> 62) | (4 * v96);
                                                                      unint64_t v293 = v76 >> 1;
                                                                      unint64_t v294 = v76 >> 2;
                                                                      char v100 = ((v112 & 0x8000000000000000) != 0) | (2 * v96);
                                                                      unint64_t has = v96 >> 1;
                                                                      unint64_t v7 = v96 >> 2;
                                                                    }
                                                                    if ((v85 & 1) == (v78 & 1))
                                                                    {
                                                                      if (v85)
                                                                      {
                                                                        double usageScoreMusic = self->_usageScoreMusic;
                                                                        objc_msgSend(v4, "usageScoreMusic", v86);
                                                                        if (usageScoreMusic != v114) {
                                                                          goto LABEL_295;
                                                                        }
                                                                        unint64_t v115 = v4[43];
                                                                        unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                        unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                        char v79 = v115 >> 35;
                                                                        unint64_t v116 = (unint64_t)self->_has;
                                                                        char v80 = v115 >> 36;
                                                                        char v81 = v115 >> 37;
                                                                        char v82 = v115 >> 38;
                                                                        char v296 = v115 >> 39;
                                                                        char v295 = BYTE5(v115);
                                                                        char v265 = v115 >> 41;
                                                                        char v255 = v115 >> 42;
                                                                        char v253 = v115 >> 43;
                                                                        char v256 = v115 >> 44;
                                                                        char v257 = v115 >> 45;
                                                                        char v259 = v115 >> 46;
                                                                        char v261 = v115 >> 47;
                                                                        char v263 = BYTE6(v115);
                                                                        char v266 = v115 >> 49;
                                                                        char v268 = v115 >> 50;
                                                                        char v270 = v115 >> 51;
                                                                        char v272 = v115 >> 52;
                                                                        char v274 = v115 >> 53;
                                                                        char v276 = v115 >> 54;
                                                                        char v278 = v115 >> 55;
                                                                        char v280 = HIBYTE(v115);
                                                                        char v282 = (v115 >> 57) | ((_BYTE)v76 << 7);
                                                                        char v284 = (v115 >> 58) | ((_BYTE)v76 << 6);
                                                                        char v286 = (v115 >> 59) | (32 * v76);
                                                                        char v288 = (v115 >> 60) | (16 * v76);
                                                                        char v290 = (v115 >> 61) | (8 * v76);
                                                                        char v291 = (v115 >> 62) | (4 * v76);
                                                                        char v292 = ((v115 & 0x8000000000000000) != 0) | (2 * v76);
                                                                        LOBYTE(v86) = v116 >> 35;
                                                                        char v87 = v116 >> 36;
                                                                        char v88 = v116 >> 37;
                                                                        char v89 = v116 >> 38;
                                                                        char v90 = v116 >> 39;
                                                                        char v91 = BYTE5(v116);
                                                                        char v92 = v116 >> 41;
                                                                        char v93 = v116 >> 42;
                                                                        char v94 = v116 >> 43;
                                                                        char v95 = v116 >> 44;
                                                                        char v254 = v116 >> 45;
                                                                        char v258 = v116 >> 46;
                                                                        char v260 = v116 >> 47;
                                                                        char v262 = BYTE6(v116);
                                                                        char v264 = v116 >> 49;
                                                                        char v267 = v116 >> 50;
                                                                        char v269 = v116 >> 51;
                                                                        char v271 = v116 >> 52;
                                                                        char v273 = v116 >> 53;
                                                                        char v275 = v116 >> 54;
                                                                        char v277 = v116 >> 55;
                                                                        char v279 = HIBYTE(v116);
                                                                        char v281 = (v116 >> 57) | ((_BYTE)v96 << 7);
                                                                        char v283 = (v116 >> 58) | ((_BYTE)v96 << 6);
                                                                        char v285 = (v116 >> 59) | (32 * v96);
                                                                        char v287 = (v116 >> 60) | (16 * v96);
                                                                        char v289 = (v116 >> 61) | (8 * v96);
                                                                        char v97 = (v116 >> 62) | (4 * v96);
                                                                        unint64_t v293 = v76 >> 1;
                                                                        unint64_t v294 = v76 >> 2;
                                                                        char v100 = ((v116 & 0x8000000000000000) != 0) | (2 * v96);
                                                                        unint64_t has = v96 >> 1;
                                                                        unint64_t v7 = v96 >> 2;
                                                                      }
                                                                      if ((v86 & 1) == (v79 & 1))
                                                                      {
                                                                        if (v86)
                                                                        {
                                                                          double usageScorePodcasts = self->_usageScorePodcasts;
                                                                          [v4 usageScorePodcasts];
                                                                          if (usageScorePodcasts != v118) {
                                                                            goto LABEL_295;
                                                                          }
                                                                          unint64_t v119 = v4[43];
                                                                          unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                          unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                          char v80 = v119 >> 36;
                                                                          unint64_t v120 = (unint64_t)self->_has;
                                                                          char v81 = v119 >> 37;
                                                                          char v82 = v119 >> 38;
                                                                          char v296 = v119 >> 39;
                                                                          char v295 = BYTE5(v119);
                                                                          char v265 = v119 >> 41;
                                                                          char v255 = v119 >> 42;
                                                                          char v253 = v119 >> 43;
                                                                          char v256 = v119 >> 44;
                                                                          char v257 = v119 >> 45;
                                                                          char v259 = v119 >> 46;
                                                                          char v261 = v119 >> 47;
                                                                          char v263 = BYTE6(v119);
                                                                          char v266 = v119 >> 49;
                                                                          char v268 = v119 >> 50;
                                                                          char v270 = v119 >> 51;
                                                                          char v272 = v119 >> 52;
                                                                          char v274 = v119 >> 53;
                                                                          char v276 = v119 >> 54;
                                                                          char v278 = v119 >> 55;
                                                                          char v280 = HIBYTE(v119);
                                                                          char v282 = (v119 >> 57) | ((_BYTE)v76 << 7);
                                                                          char v284 = (v119 >> 58) | ((_BYTE)v76 << 6);
                                                                          char v286 = (v119 >> 59) | (32 * v76);
                                                                          char v288 = (v119 >> 60) | (16 * v76);
                                                                          char v290 = (v119 >> 61) | (8 * v76);
                                                                          char v291 = (v119 >> 62) | (4 * v76);
                                                                          char v292 = ((v119 & 0x8000000000000000) != 0) | (2 * v76);
                                                                          char v87 = v120 >> 36;
                                                                          char v88 = v120 >> 37;
                                                                          char v89 = v120 >> 38;
                                                                          char v90 = v120 >> 39;
                                                                          char v91 = BYTE5(v120);
                                                                          char v92 = v120 >> 41;
                                                                          char v93 = v120 >> 42;
                                                                          char v94 = v120 >> 43;
                                                                          char v95 = v120 >> 44;
                                                                          char v254 = v120 >> 45;
                                                                          char v258 = v120 >> 46;
                                                                          char v260 = v120 >> 47;
                                                                          char v262 = BYTE6(v120);
                                                                          char v264 = v120 >> 49;
                                                                          char v267 = v120 >> 50;
                                                                          char v269 = v120 >> 51;
                                                                          char v271 = v120 >> 52;
                                                                          char v273 = v120 >> 53;
                                                                          char v275 = v120 >> 54;
                                                                          char v277 = v120 >> 55;
                                                                          char v279 = HIBYTE(v120);
                                                                          char v281 = (v120 >> 57) | ((_BYTE)v96 << 7);
                                                                          char v283 = (v120 >> 58) | ((_BYTE)v96 << 6);
                                                                          char v285 = (v120 >> 59) | (32 * v96);
                                                                          char v287 = (v120 >> 60) | (16 * v96);
                                                                          char v289 = (v120 >> 61) | (8 * v96);
                                                                          char v97 = (v120 >> 62) | (4 * v96);
                                                                          unint64_t v293 = v76 >> 1;
                                                                          unint64_t v294 = v76 >> 2;
                                                                          char v100 = ((v120 & 0x8000000000000000) != 0) | (2 * v96);
                                                                          unint64_t has = v96 >> 1;
                                                                          unint64_t v7 = v96 >> 2;
                                                                        }
                                                                        if ((v87 & 1) == (v80 & 1))
                                                                        {
                                                                          if (v87)
                                                                          {
                                                                            int isAppFirstParty = self->_isAppFirstParty;
                                                                            if (isAppFirstParty != [v4 isAppFirstParty]) {
                                                                              goto LABEL_295;
                                                                            }
                                                                            unint64_t v122 = v4[43];
                                                                            unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                            unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                            char v81 = v122 >> 37;
                                                                            unint64_t v123 = (unint64_t)self->_has;
                                                                            char v82 = v122 >> 38;
                                                                            char v296 = v122 >> 39;
                                                                            char v295 = BYTE5(v122);
                                                                            char v265 = v122 >> 41;
                                                                            char v255 = v122 >> 42;
                                                                            char v253 = v122 >> 43;
                                                                            char v256 = v122 >> 44;
                                                                            char v257 = v122 >> 45;
                                                                            char v259 = v122 >> 46;
                                                                            char v261 = v122 >> 47;
                                                                            char v263 = BYTE6(v122);
                                                                            char v266 = v122 >> 49;
                                                                            char v268 = v122 >> 50;
                                                                            char v270 = v122 >> 51;
                                                                            char v272 = v122 >> 52;
                                                                            char v274 = v122 >> 53;
                                                                            char v276 = v122 >> 54;
                                                                            char v278 = v122 >> 55;
                                                                            char v280 = HIBYTE(v122);
                                                                            char v282 = (v122 >> 57) | ((_BYTE)v76 << 7);
                                                                            char v284 = (v122 >> 58) | ((_BYTE)v76 << 6);
                                                                            char v286 = (v122 >> 59) | (32 * v76);
                                                                            char v288 = (v122 >> 60) | (16 * v76);
                                                                            char v290 = (v122 >> 61) | (8 * v76);
                                                                            char v291 = (v122 >> 62) | (4 * v76);
                                                                            char v292 = ((v122 & 0x8000000000000000) != 0) | (2 * v76);
                                                                            char v88 = v123 >> 37;
                                                                            char v89 = v123 >> 38;
                                                                            char v90 = v123 >> 39;
                                                                            char v91 = BYTE5(v123);
                                                                            char v92 = v123 >> 41;
                                                                            char v93 = v123 >> 42;
                                                                            char v94 = v123 >> 43;
                                                                            char v95 = v123 >> 44;
                                                                            char v254 = v123 >> 45;
                                                                            char v258 = v123 >> 46;
                                                                            char v260 = v123 >> 47;
                                                                            char v262 = BYTE6(v123);
                                                                            char v264 = v123 >> 49;
                                                                            char v267 = v123 >> 50;
                                                                            char v269 = v123 >> 51;
                                                                            char v271 = v123 >> 52;
                                                                            char v273 = v123 >> 53;
                                                                            char v275 = v123 >> 54;
                                                                            char v277 = v123 >> 55;
                                                                            char v279 = HIBYTE(v123);
                                                                            char v281 = (v123 >> 57) | ((_BYTE)v96 << 7);
                                                                            char v283 = (v123 >> 58) | ((_BYTE)v96 << 6);
                                                                            char v285 = (v123 >> 59) | (32 * v96);
                                                                            char v287 = (v123 >> 60) | (16 * v96);
                                                                            char v289 = (v123 >> 61) | (8 * v96);
                                                                            char v97 = (v123 >> 62) | (4 * v96);
                                                                            unint64_t v293 = v76 >> 1;
                                                                            unint64_t v294 = v76 >> 2;
                                                                            char v100 = ((v123 & 0x8000000000000000) != 0) | (2 * v96);
                                                                            unint64_t has = v96 >> 1;
                                                                            unint64_t v7 = v96 >> 2;
                                                                          }
                                                                          if ((v88 & 1) == (v81 & 1))
                                                                          {
                                                                            if (v88)
                                                                            {
                                                                              int isRequestedApp = self->_isRequestedApp;
                                                                              if (isRequestedApp != [v4 isRequestedApp]) {
                                                                                goto LABEL_295;
                                                                              }
                                                                              unint64_t v125 = v4[43];
                                                                              unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                              unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                              char v82 = v125 >> 38;
                                                                              unint64_t v126 = (unint64_t)self->_has;
                                                                              char v295 = BYTE5(v125);
                                                                              char v296 = v125 >> 39;
                                                                              char v265 = v125 >> 41;
                                                                              char v253 = v125 >> 43;
                                                                              char v255 = v125 >> 42;
                                                                              char v256 = v125 >> 44;
                                                                              char v257 = v125 >> 45;
                                                                              char v259 = v125 >> 46;
                                                                              char v261 = v125 >> 47;
                                                                              char v263 = BYTE6(v125);
                                                                              char v266 = v125 >> 49;
                                                                              char v268 = v125 >> 50;
                                                                              char v270 = v125 >> 51;
                                                                              char v272 = v125 >> 52;
                                                                              char v274 = v125 >> 53;
                                                                              char v276 = v125 >> 54;
                                                                              char v278 = v125 >> 55;
                                                                              char v280 = HIBYTE(v125);
                                                                              char v282 = (v125 >> 57) | ((_BYTE)v76 << 7);
                                                                              char v284 = (v125 >> 58) | ((_BYTE)v76 << 6);
                                                                              char v286 = (v125 >> 59) | (32 * v76);
                                                                              char v288 = (v125 >> 60) | (16 * v76);
                                                                              char v290 = (v125 >> 61) | (8 * v76);
                                                                              char v291 = (v125 >> 62) | (4 * v76);
                                                                              char v292 = ((v125 & 0x8000000000000000) != 0) | (2 * v76);
                                                                              char v89 = v126 >> 38;
                                                                              char v90 = v126 >> 39;
                                                                              char v91 = BYTE5(v126);
                                                                              char v92 = v126 >> 41;
                                                                              char v93 = v126 >> 42;
                                                                              char v94 = v126 >> 43;
                                                                              char v95 = v126 >> 44;
                                                                              char v254 = v126 >> 45;
                                                                              char v258 = v126 >> 46;
                                                                              char v260 = v126 >> 47;
                                                                              char v262 = BYTE6(v126);
                                                                              char v264 = v126 >> 49;
                                                                              char v267 = v126 >> 50;
                                                                              char v269 = v126 >> 51;
                                                                              char v271 = v126 >> 52;
                                                                              char v273 = v126 >> 53;
                                                                              char v275 = v126 >> 54;
                                                                              char v277 = v126 >> 55;
                                                                              char v279 = HIBYTE(v126);
                                                                              char v281 = (v126 >> 57) | ((_BYTE)v96 << 7);
                                                                              char v283 = (v126 >> 58) | ((_BYTE)v96 << 6);
                                                                              char v285 = (v126 >> 59) | (32 * v96);
                                                                              char v287 = (v126 >> 60) | (16 * v96);
                                                                              char v289 = (v126 >> 61) | (8 * v96);
                                                                              char v97 = (v126 >> 62) | (4 * v96);
                                                                              unint64_t v293 = v76 >> 1;
                                                                              unint64_t v294 = v76 >> 2;
                                                                              char v100 = ((v126 & 0x8000000000000000) != 0) | (2 * v96);
                                                                              unint64_t has = v96 >> 1;
                                                                              unint64_t v7 = v96 >> 2;
                                                                            }
                                                                            if ((v89 & 1) == (v82 & 1))
                                                                            {
                                                                              if (v89)
                                                                              {
                                                                                int isNowPlayingBundlePSE1 = self->_isNowPlayingBundlePSE1;
                                                                                if (isNowPlayingBundlePSE1 != [v4 isNowPlayingBundlePSE1]) {
                                                                                  goto LABEL_295;
                                                                                }
                                                                                unint64_t v128 = v4[43];
                                                                                unint64_t v96 = *((unsigned __int16 *)&self->_has
                                                                                      + 4);
                                                                                unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                char v296 = v128 >> 39;
                                                                                unint64_t v129 = (unint64_t)self->_has;
                                                                                char v295 = BYTE5(v128);
                                                                                char v265 = v128 >> 41;
                                                                                char v253 = v128 >> 43;
                                                                                char v255 = v128 >> 42;
                                                                                char v256 = v128 >> 44;
                                                                                char v257 = v128 >> 45;
                                                                                char v259 = v128 >> 46;
                                                                                char v261 = v128 >> 47;
                                                                                char v263 = BYTE6(v128);
                                                                                char v266 = v128 >> 49;
                                                                                char v268 = v128 >> 50;
                                                                                char v270 = v128 >> 51;
                                                                                char v272 = v128 >> 52;
                                                                                char v274 = v128 >> 53;
                                                                                char v276 = v128 >> 54;
                                                                                char v278 = v128 >> 55;
                                                                                char v280 = HIBYTE(v128);
                                                                                char v282 = (v128 >> 57) | ((_BYTE)v76 << 7);
                                                                                char v284 = (v128 >> 58) | ((_BYTE)v76 << 6);
                                                                                char v286 = (v128 >> 59) | (32 * v76);
                                                                                char v288 = (v128 >> 60) | (16 * v76);
                                                                                char v290 = (v128 >> 61) | (8 * v76);
                                                                                char v291 = (v128 >> 62) | (4 * v76);
                                                                                char v292 = ((v128 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                char v90 = v129 >> 39;
                                                                                char v91 = BYTE5(v129);
                                                                                char v92 = v129 >> 41;
                                                                                char v93 = v129 >> 42;
                                                                                char v94 = v129 >> 43;
                                                                                char v95 = v129 >> 44;
                                                                                char v254 = v129 >> 45;
                                                                                char v258 = v129 >> 46;
                                                                                char v260 = v129 >> 47;
                                                                                char v262 = BYTE6(v129);
                                                                                char v264 = v129 >> 49;
                                                                                char v267 = v129 >> 50;
                                                                                char v269 = v129 >> 51;
                                                                                char v271 = v129 >> 52;
                                                                                char v273 = v129 >> 53;
                                                                                char v275 = v129 >> 54;
                                                                                char v277 = v129 >> 55;
                                                                                char v279 = HIBYTE(v129);
                                                                                char v281 = (v129 >> 57) | ((_BYTE)v96 << 7);
                                                                                char v283 = (v129 >> 58) | ((_BYTE)v96 << 6);
                                                                                char v285 = (v129 >> 59) | (32 * v96);
                                                                                char v287 = (v129 >> 60) | (16 * v96);
                                                                                char v289 = (v129 >> 61) | (8 * v96);
                                                                                char v97 = (v129 >> 62) | (4 * v96);
                                                                                unint64_t v293 = v76 >> 1;
                                                                                unint64_t v294 = v76 >> 2;
                                                                                char v100 = ((v129 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                unint64_t has = v96 >> 1;
                                                                                unint64_t v7 = v96 >> 2;
                                                                              }
                                                                              if ((v90 & 1) == (v296 & 1))
                                                                              {
                                                                                if (v90)
                                                                                {
                                                                                  int isNowPlayingBundlePSE2 = self->_isNowPlayingBundlePSE2;
                                                                                  if (isNowPlayingBundlePSE2 != [v4 isNowPlayingBundlePSE2]) {
                                                                                    goto LABEL_295;
                                                                                  }
                                                                                  unint64_t v131 = v4[43];
                                                                                  unint64_t v96 = *((unsigned __int16 *)&self->_has
                                                                                        + 4);
                                                                                  unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                  char v295 = BYTE5(v131);
                                                                                  unint64_t v132 = (unint64_t)self->_has;
                                                                                  char v265 = v131 >> 41;
                                                                                  char v253 = v131 >> 43;
                                                                                  char v255 = v131 >> 42;
                                                                                  char v256 = v131 >> 44;
                                                                                  char v257 = v131 >> 45;
                                                                                  char v259 = v131 >> 46;
                                                                                  char v261 = v131 >> 47;
                                                                                  char v263 = BYTE6(v131);
                                                                                  char v266 = v131 >> 49;
                                                                                  char v268 = v131 >> 50;
                                                                                  char v270 = v131 >> 51;
                                                                                  char v272 = v131 >> 52;
                                                                                  char v274 = v131 >> 53;
                                                                                  char v276 = v131 >> 54;
                                                                                  char v278 = v131 >> 55;
                                                                                  char v280 = HIBYTE(v131);
                                                                                  char v282 = (v131 >> 57) | ((_BYTE)v76 << 7);
                                                                                  char v284 = (v131 >> 58) | ((_BYTE)v76 << 6);
                                                                                  char v286 = (v131 >> 59) | (32 * v76);
                                                                                  char v288 = (v131 >> 60) | (16 * v76);
                                                                                  char v290 = (v131 >> 61) | (8 * v76);
                                                                                  char v291 = (v131 >> 62) | (4 * v76);
                                                                                  char v292 = ((v131 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                  char v91 = BYTE5(v132);
                                                                                  char v92 = v132 >> 41;
                                                                                  char v93 = v132 >> 42;
                                                                                  char v94 = v132 >> 43;
                                                                                  char v95 = v132 >> 44;
                                                                                  char v254 = v132 >> 45;
                                                                                  char v258 = v132 >> 46;
                                                                                  char v260 = v132 >> 47;
                                                                                  char v262 = BYTE6(v132);
                                                                                  char v264 = v132 >> 49;
                                                                                  char v267 = v132 >> 50;
                                                                                  char v269 = v132 >> 51;
                                                                                  char v271 = v132 >> 52;
                                                                                  char v273 = v132 >> 53;
                                                                                  char v275 = v132 >> 54;
                                                                                  char v277 = v132 >> 55;
                                                                                  char v279 = HIBYTE(v132);
                                                                                  char v281 = (v132 >> 57) | ((_BYTE)v96 << 7);
                                                                                  char v283 = (v132 >> 58) | ((_BYTE)v96 << 6);
                                                                                  char v285 = (v132 >> 59) | (32 * v96);
                                                                                  char v287 = (v132 >> 60) | (16 * v96);
                                                                                  char v289 = (v132 >> 61) | (8 * v96);
                                                                                  char v97 = (v132 >> 62) | (4 * v96);
                                                                                  unint64_t v293 = v76 >> 1;
                                                                                  unint64_t v294 = v76 >> 2;
                                                                                  char v100 = ((v132 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                  unint64_t has = v96 >> 1;
                                                                                  unint64_t v7 = v96 >> 2;
                                                                                }
                                                                                if ((v91 & 1) == (v295 & 1))
                                                                                {
                                                                                  if (v91)
                                                                                  {
                                                                                    double vq21Score = self->_vq21Score;
                                                                                    [v4 vq21Score];
                                                                                    if (vq21Score != v134) {
                                                                                      goto LABEL_295;
                                                                                    }
                                                                                    unint64_t v135 = v4[43];
                                                                                    unint64_t v96 = *((unsigned __int16 *)&self->_has
                                                                                          + 4);
                                                                                    unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                    char v265 = v135 >> 41;
                                                                                    unint64_t v136 = (unint64_t)self->_has;
                                                                                    char v253 = v135 >> 43;
                                                                                    char v255 = v135 >> 42;
                                                                                    char v256 = v135 >> 44;
                                                                                    char v257 = v135 >> 45;
                                                                                    char v259 = v135 >> 46;
                                                                                    char v261 = v135 >> 47;
                                                                                    char v263 = BYTE6(v135);
                                                                                    char v266 = v135 >> 49;
                                                                                    char v268 = v135 >> 50;
                                                                                    char v270 = v135 >> 51;
                                                                                    char v272 = v135 >> 52;
                                                                                    char v274 = v135 >> 53;
                                                                                    char v276 = v135 >> 54;
                                                                                    char v278 = v135 >> 55;
                                                                                    char v280 = HIBYTE(v135);
                                                                                    char v282 = (v135 >> 57) | ((_BYTE)v76 << 7);
                                                                                    char v284 = (v135 >> 58) | ((_BYTE)v76 << 6);
                                                                                    char v286 = (v135 >> 59) | (32 * v76);
                                                                                    char v288 = (v135 >> 60) | (16 * v76);
                                                                                    char v290 = (v135 >> 61) | (8 * v76);
                                                                                    char v291 = (v135 >> 62) | (4 * v76);
                                                                                    char v292 = ((v135 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                    char v92 = v136 >> 41;
                                                                                    char v93 = v136 >> 42;
                                                                                    char v94 = v136 >> 43;
                                                                                    char v95 = v136 >> 44;
                                                                                    char v254 = v136 >> 45;
                                                                                    char v258 = v136 >> 46;
                                                                                    char v260 = v136 >> 47;
                                                                                    char v262 = BYTE6(v136);
                                                                                    char v264 = v136 >> 49;
                                                                                    char v267 = v136 >> 50;
                                                                                    char v269 = v136 >> 51;
                                                                                    char v271 = v136 >> 52;
                                                                                    char v273 = v136 >> 53;
                                                                                    char v275 = v136 >> 54;
                                                                                    char v277 = v136 >> 55;
                                                                                    char v279 = HIBYTE(v136);
                                                                                    char v281 = (v136 >> 57) | ((_BYTE)v96 << 7);
                                                                                    char v283 = (v136 >> 58) | ((_BYTE)v96 << 6);
                                                                                    char v285 = (v136 >> 59) | (32 * v96);
                                                                                    char v287 = (v136 >> 60) | (16 * v96);
                                                                                    char v289 = (v136 >> 61) | (8 * v96);
                                                                                    char v97 = (v136 >> 62) | (4 * v96);
                                                                                    unint64_t v293 = v76 >> 1;
                                                                                    unint64_t v294 = v76 >> 2;
                                                                                    char v100 = ((v136 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                    unint64_t has = v96 >> 1;
                                                                                    unint64_t v7 = v96 >> 2;
                                                                                  }
                                                                                  int v137 = v92 & 1;
                                                                                  if (v137 == (v265 & 1))
                                                                                  {
                                                                                    if (v137)
                                                                                    {
                                                                                      int isSupportedFlag = self->_isSupportedFlag;
                                                                                      if (isSupportedFlag != [v4 isSupportedFlag]) {
                                                                                        goto LABEL_295;
                                                                                      }
                                                                                      unint64_t v139 = v4[43];
                                                                                      unint64_t v96 = *((unsigned __int16 *)&self->_has
                                                                                            + 4);
                                                                                      unint64_t v76 = *((unsigned __int16 *)v4
                                                                                            + 176);
                                                                                      char v255 = v139 >> 42;
                                                                                      unint64_t v140 = (unint64_t)self->_has;
                                                                                      char v253 = v139 >> 43;
                                                                                      char v256 = v139 >> 44;
                                                                                      char v257 = v139 >> 45;
                                                                                      char v259 = v139 >> 46;
                                                                                      char v261 = v139 >> 47;
                                                                                      char v263 = BYTE6(v139);
                                                                                      char v266 = v139 >> 49;
                                                                                      char v268 = v139 >> 50;
                                                                                      char v270 = v139 >> 51;
                                                                                      char v272 = v139 >> 52;
                                                                                      char v274 = v139 >> 53;
                                                                                      char v276 = v139 >> 54;
                                                                                      char v278 = v139 >> 55;
                                                                                      char v280 = HIBYTE(v139);
                                                                                      char v282 = (v139 >> 57) | ((_BYTE)v76 << 7);
                                                                                      char v284 = (v139 >> 58) | ((_BYTE)v76 << 6);
                                                                                      char v286 = (v139 >> 59) | (32 * v76);
                                                                                      char v288 = (v139 >> 60) | (16 * v76);
                                                                                      char v290 = (v139 >> 61) | (8 * v76);
                                                                                      char v291 = (v139 >> 62) | (4 * v76);
                                                                                      char v292 = ((v139 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                      char v93 = v140 >> 42;
                                                                                      char v94 = v140 >> 43;
                                                                                      char v95 = v140 >> 44;
                                                                                      char v254 = v140 >> 45;
                                                                                      char v258 = v140 >> 46;
                                                                                      char v260 = v140 >> 47;
                                                                                      char v262 = BYTE6(v140);
                                                                                      char v264 = v140 >> 49;
                                                                                      char v267 = v140 >> 50;
                                                                                      char v269 = v140 >> 51;
                                                                                      char v271 = v140 >> 52;
                                                                                      char v273 = v140 >> 53;
                                                                                      char v275 = v140 >> 54;
                                                                                      char v277 = v140 >> 55;
                                                                                      char v279 = HIBYTE(v140);
                                                                                      char v281 = (v140 >> 57) | ((_BYTE)v96 << 7);
                                                                                      char v283 = (v140 >> 58) | ((_BYTE)v96 << 6);
                                                                                      char v285 = (v140 >> 59) | (32 * v96);
                                                                                      char v287 = (v140 >> 60) | (16 * v96);
                                                                                      char v289 = (v140 >> 61) | (8 * v96);
                                                                                      char v97 = (v140 >> 62) | (4 * v96);
                                                                                      unint64_t v293 = v76 >> 1;
                                                                                      unint64_t v294 = v76 >> 2;
                                                                                      char v100 = ((v140 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                      unint64_t has = v96 >> 1;
                                                                                      unint64_t v7 = v96 >> 2;
                                                                                    }
                                                                                    if ((v93 & 1) == (v255 & 1))
                                                                                    {
                                                                                      if (v93)
                                                                                      {
                                                                                        int isUnicornFlag = self->_isUnicornFlag;
                                                                                        if (isUnicornFlag != [v4 isUnicornFlag]) {
                                                                                          goto LABEL_295;
                                                                                        }
                                                                                        unint64_t v142 = v4[43];
                                                                                        unint64_t v96 = *((unsigned __int16 *)&self->_has
                                                                                              + 4);
                                                                                        unint64_t v76 = *((unsigned __int16 *)v4
                                                                                              + 176);
                                                                                        char v253 = v142 >> 43;
                                                                                        unint64_t v143 = (unint64_t)self->_has;
                                                                                        char v256 = v142 >> 44;
                                                                                        char v257 = v142 >> 45;
                                                                                        char v259 = v142 >> 46;
                                                                                        char v261 = v142 >> 47;
                                                                                        char v263 = BYTE6(v142);
                                                                                        char v266 = v142 >> 49;
                                                                                        char v268 = v142 >> 50;
                                                                                        char v270 = v142 >> 51;
                                                                                        char v272 = v142 >> 52;
                                                                                        char v274 = v142 >> 53;
                                                                                        char v276 = v142 >> 54;
                                                                                        char v278 = v142 >> 55;
                                                                                        char v280 = HIBYTE(v142);
                                                                                        char v282 = (v142 >> 57) | ((_BYTE)v76 << 7);
                                                                                        char v284 = (v142 >> 58) | ((_BYTE)v76 << 6);
                                                                                        char v286 = (v142 >> 59) | (32 * v76);
                                                                                        char v288 = (v142 >> 60) | (16 * v76);
                                                                                        char v290 = (v142 >> 61) | (8 * v76);
                                                                                        char v291 = (v142 >> 62) | (4 * v76);
                                                                                        char v292 = ((v142 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                        char v94 = v143 >> 43;
                                                                                        char v95 = v143 >> 44;
                                                                                        char v254 = v143 >> 45;
                                                                                        char v258 = v143 >> 46;
                                                                                        char v260 = v143 >> 47;
                                                                                        char v262 = BYTE6(v143);
                                                                                        char v264 = v143 >> 49;
                                                                                        char v267 = v143 >> 50;
                                                                                        char v269 = v143 >> 51;
                                                                                        char v271 = v143 >> 52;
                                                                                        char v273 = v143 >> 53;
                                                                                        char v275 = v143 >> 54;
                                                                                        char v277 = v143 >> 55;
                                                                                        char v279 = HIBYTE(v143);
                                                                                        char v281 = (v143 >> 57) | ((_BYTE)v96 << 7);
                                                                                        char v283 = (v143 >> 58) | ((_BYTE)v96 << 6);
                                                                                        char v285 = (v143 >> 59) | (32 * v96);
                                                                                        char v287 = (v143 >> 60) | (16 * v96);
                                                                                        char v289 = (v143 >> 61) | (8 * v96);
                                                                                        char v97 = (v143 >> 62) | (4 * v96);
                                                                                        unint64_t v293 = v76 >> 1;
                                                                                        unint64_t v294 = v76 >> 2;
                                                                                        char v100 = ((v143 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                        unint64_t has = v96 >> 1;
                                                                                        unint64_t v7 = v96 >> 2;
                                                                                      }
                                                                                      if ((v94 & 1) == (v253 & 1))
                                                                                      {
                                                                                        if (v94)
                                                                                        {
                                                                                          int isSupportedUnicornMatchFlag = self->_isSupportedUnicornMatchFlag;
                                                                                          if (isSupportedUnicornMatchFlag != [v4 isSupportedUnicornMatchFlag]) {
                                                                                            goto LABEL_295;
                                                                                          }
                                                                                          unint64_t v145 = v4[43];
                                                                                          unint64_t v96 = *((unsigned __int16 *)&self->_has
                                                                                                + 4);
                                                                                          unint64_t v76 = *((unsigned __int16 *)v4
                                                                                                + 176);
                                                                                          char v256 = v145 >> 44;
                                                                                          unint64_t v146 = (unint64_t)self->_has;
                                                                                          char v257 = v145 >> 45;
                                                                                          char v259 = v145 >> 46;
                                                                                          char v261 = v145 >> 47;
                                                                                          char v263 = BYTE6(v145);
                                                                                          char v266 = v145 >> 49;
                                                                                          char v268 = v145 >> 50;
                                                                                          char v270 = v145 >> 51;
                                                                                          char v272 = v145 >> 52;
                                                                                          char v274 = v145 >> 53;
                                                                                          char v276 = v145 >> 54;
                                                                                          char v278 = v145 >> 55;
                                                                                          char v280 = HIBYTE(v145);
                                                                                          char v282 = (v145 >> 57) | ((_BYTE)v76 << 7);
                                                                                          char v284 = (v145 >> 58) | ((_BYTE)v76 << 6);
                                                                                          char v286 = (v145 >> 59) | (32 * v76);
                                                                                          char v288 = (v145 >> 60) | (16 * v76);
                                                                                          char v290 = (v145 >> 61) | (8 * v76);
                                                                                          char v291 = (v145 >> 62) | (4 * v76);
                                                                                          char v292 = ((v145 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                          char v95 = v146 >> 44;
                                                                                          char v254 = v146 >> 45;
                                                                                          char v258 = v146 >> 46;
                                                                                          char v260 = v146 >> 47;
                                                                                          char v262 = BYTE6(v146);
                                                                                          char v264 = v146 >> 49;
                                                                                          char v267 = v146 >> 50;
                                                                                          char v269 = v146 >> 51;
                                                                                          char v271 = v146 >> 52;
                                                                                          char v273 = v146 >> 53;
                                                                                          char v275 = v146 >> 54;
                                                                                          char v277 = v146 >> 55;
                                                                                          char v279 = HIBYTE(v146);
                                                                                          char v281 = (v146 >> 57) | ((_BYTE)v96 << 7);
                                                                                          char v283 = (v146 >> 58) | ((_BYTE)v96 << 6);
                                                                                          char v285 = (v146 >> 59) | (32 * v96);
                                                                                          char v287 = (v146 >> 60) | (16 * v96);
                                                                                          char v289 = (v146 >> 61) | (8 * v96);
                                                                                          char v97 = (v146 >> 62) | (4 * v96);
                                                                                          unint64_t v293 = v76 >> 1;
                                                                                          unint64_t v294 = v76 >> 2;
                                                                                          char v100 = ((v146 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                          unint64_t has = v96 >> 1;
                                                                                          unint64_t v7 = v96 >> 2;
                                                                                        }
                                                                                        if ((v95 & 1) == (v256 & 1))
                                                                                        {
                                                                                          if (v95)
                                                                                          {
                                                                                            int isDisambiguationSelectedApp = self->_isDisambiguationSelectedApp;
                                                                                            if (isDisambiguationSelectedApp != [v4 isDisambiguationSelectedApp]) {
                                                                                              goto LABEL_295;
                                                                                            }
                                                                                            unint64_t v148 = v4[43];
                                                                                            unint64_t v96 = *((unsigned __int16 *)&self->_has
                                                                                                  + 4);
                                                                                            unint64_t v76 = *((unsigned __int16 *)v4
                                                                                                  + 176);
                                                                                            char v257 = v148 >> 45;
                                                                                            unint64_t v149 = (unint64_t)self->_has;
                                                                                            char v259 = v148 >> 46;
                                                                                            char v261 = v148 >> 47;
                                                                                            char v263 = BYTE6(v148);
                                                                                            char v266 = v148 >> 49;
                                                                                            char v268 = v148 >> 50;
                                                                                            char v270 = v148 >> 51;
                                                                                            char v272 = v148 >> 52;
                                                                                            char v274 = v148 >> 53;
                                                                                            char v276 = v148 >> 54;
                                                                                            char v278 = v148 >> 55;
                                                                                            char v280 = HIBYTE(v148);
                                                                                            char v282 = (v148 >> 57) | ((_BYTE)v76 << 7);
                                                                                            char v284 = (v148 >> 58) | ((_BYTE)v76 << 6);
                                                                                            char v286 = (v148 >> 59) | (32 * v76);
                                                                                            char v288 = (v148 >> 60) | (16 * v76);
                                                                                            char v290 = (v148 >> 61) | (8 * v76);
                                                                                            char v291 = (v148 >> 62) | (4 * v76);
                                                                                            char v292 = ((v148 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                            char v254 = v149 >> 45;
                                                                                            char v258 = v149 >> 46;
                                                                                            char v260 = v149 >> 47;
                                                                                            char v262 = BYTE6(v149);
                                                                                            char v264 = v149 >> 49;
                                                                                            char v267 = v149 >> 50;
                                                                                            char v269 = v149 >> 51;
                                                                                            char v271 = v149 >> 52;
                                                                                            char v273 = v149 >> 53;
                                                                                            char v275 = v149 >> 54;
                                                                                            char v277 = v149 >> 55;
                                                                                            char v279 = HIBYTE(v149);
                                                                                            char v281 = (v149 >> 57) | ((_BYTE)v96 << 7);
                                                                                            char v283 = (v149 >> 58) | ((_BYTE)v96 << 6);
                                                                                            char v285 = (v149 >> 59) | (32 * v96);
                                                                                            char v287 = (v149 >> 60) | (16 * v96);
                                                                                            char v289 = (v149 >> 61) | (8 * v96);
                                                                                            char v97 = (v149 >> 62) | (4 * v96);
                                                                                            unint64_t v293 = v76 >> 1;
                                                                                            unint64_t v294 = v76 >> 2;
                                                                                            char v100 = ((v149 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                            unint64_t has = v96 >> 1;
                                                                                            unint64_t v7 = v96 >> 2;
                                                                                          }
                                                                                          if ((v254 & 1) == (v257 & 1))
                                                                                          {
                                                                                            if (v254)
                                                                                            {
                                                                                              int isModelPredictedApp = self->_isModelPredictedApp;
                                                                                              if (isModelPredictedApp != [v4 isModelPredictedApp]) {
                                                                                                goto LABEL_295;
                                                                                              }
                                                                                              unint64_t v151 = v4[43];
                                                                                              unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                              unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                              char v259 = v151 >> 46;
                                                                                              unint64_t v152 = (unint64_t)self->_has;
                                                                                              char v261 = v151 >> 47;
                                                                                              char v263 = BYTE6(v151);
                                                                                              char v266 = v151 >> 49;
                                                                                              char v268 = v151 >> 50;
                                                                                              char v270 = v151 >> 51;
                                                                                              char v272 = v151 >> 52;
                                                                                              char v274 = v151 >> 53;
                                                                                              char v276 = v151 >> 54;
                                                                                              char v278 = v151 >> 55;
                                                                                              char v280 = HIBYTE(v151);
                                                                                              char v282 = (v151 >> 57) | ((_BYTE)v76 << 7);
                                                                                              char v284 = (v151 >> 58) | ((_BYTE)v76 << 6);
                                                                                              char v286 = (v151 >> 59) | (32 * v76);
                                                                                              char v288 = (v151 >> 60) | (16 * v76);
                                                                                              char v290 = (v151 >> 61) | (8 * v76);
                                                                                              char v291 = (v151 >> 62) | (4 * v76);
                                                                                              char v292 = ((v151 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                              char v258 = v152 >> 46;
                                                                                              char v260 = v152 >> 47;
                                                                                              char v262 = BYTE6(v152);
                                                                                              char v264 = v152 >> 49;
                                                                                              char v267 = v152 >> 50;
                                                                                              char v269 = v152 >> 51;
                                                                                              char v271 = v152 >> 52;
                                                                                              char v273 = v152 >> 53;
                                                                                              char v275 = v152 >> 54;
                                                                                              char v277 = v152 >> 55;
                                                                                              char v279 = HIBYTE(v152);
                                                                                              char v281 = (v152 >> 57) | ((_BYTE)v96 << 7);
                                                                                              char v283 = (v152 >> 58) | ((_BYTE)v96 << 6);
                                                                                              char v285 = (v152 >> 59) | (32 * v96);
                                                                                              char v287 = (v152 >> 60) | (16 * v96);
                                                                                              char v289 = (v152 >> 61) | (8 * v96);
                                                                                              char v97 = (v152 >> 62) | (4 * v96);
                                                                                              unint64_t v293 = v76 >> 1;
                                                                                              unint64_t v294 = v76 >> 2;
                                                                                              char v100 = ((v152 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                              unint64_t has = v96 >> 1;
                                                                                              unint64_t v7 = v96 >> 2;
                                                                                            }
                                                                                            if ((v258 & 1) == (v259 & 1))
                                                                                            {
                                                                                              if (v258)
                                                                                              {
                                                                                                double usageScoreRadio = self->_usageScoreRadio;
                                                                                                [v4 usageScoreRadio];
                                                                                                if (usageScoreRadio != v154) {
                                                                                                  goto LABEL_295;
                                                                                                }
                                                                                                unint64_t v155 = v4[43];
                                                                                                unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                char v261 = v155 >> 47;
                                                                                                unint64_t v156 = (unint64_t)self->_has;
                                                                                                char v263 = BYTE6(v155);
                                                                                                char v266 = v155 >> 49;
                                                                                                char v268 = v155 >> 50;
                                                                                                char v270 = v155 >> 51;
                                                                                                char v272 = v155 >> 52;
                                                                                                char v274 = v155 >> 53;
                                                                                                char v276 = v155 >> 54;
                                                                                                char v278 = v155 >> 55;
                                                                                                char v280 = HIBYTE(v155);
                                                                                                char v282 = (v155 >> 57) | ((_BYTE)v76 << 7);
                                                                                                char v284 = (v155 >> 58) | ((_BYTE)v76 << 6);
                                                                                                char v286 = (v155 >> 59) | (32 * v76);
                                                                                                char v288 = (v155 >> 60) | (16 * v76);
                                                                                                char v290 = (v155 >> 61) | (8 * v76);
                                                                                                char v291 = (v155 >> 62) | (4 * v76);
                                                                                                char v292 = ((v155 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                char v260 = v156 >> 47;
                                                                                                char v262 = BYTE6(v156);
                                                                                                char v264 = v156 >> 49;
                                                                                                char v267 = v156 >> 50;
                                                                                                char v269 = v156 >> 51;
                                                                                                char v271 = v156 >> 52;
                                                                                                char v273 = v156 >> 53;
                                                                                                char v275 = v156 >> 54;
                                                                                                char v277 = v156 >> 55;
                                                                                                char v279 = HIBYTE(v156);
                                                                                                char v281 = (v156 >> 57) | ((_BYTE)v96 << 7);
                                                                                                char v283 = (v156 >> 58) | ((_BYTE)v96 << 6);
                                                                                                char v285 = (v156 >> 59) | (32 * v96);
                                                                                                char v287 = (v156 >> 60) | (16 * v96);
                                                                                                char v289 = (v156 >> 61) | (8 * v96);
                                                                                                char v97 = (v156 >> 62) | (4 * v96);
                                                                                                unint64_t v293 = v76 >> 1;
                                                                                                unint64_t v294 = v76 >> 2;
                                                                                                char v100 = ((v156 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                unint64_t has = v96 >> 1;
                                                                                                unint64_t v7 = v96 >> 2;
                                                                                              }
                                                                                              if ((v260 & 1) == (v261 & 1))
                                                                                              {
                                                                                                if (v260)
                                                                                                {
                                                                                                  double usageScoreMusicWithoutRadio = self->_usageScoreMusicWithoutRadio;
                                                                                                  [v4 usageScoreMusicWithoutRadio];
                                                                                                  if (usageScoreMusicWithoutRadio != v158) {
                                                                                                    goto LABEL_295;
                                                                                                  }
                                                                                                  unint64_t v159 = v4[43];
                                                                                                  unint64_t v160 = (unint64_t)self->_has;
                                                                                                  unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                  char v263 = BYTE6(v159);
                                                                                                  unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                  char v266 = v159 >> 49;
                                                                                                  char v268 = v159 >> 50;
                                                                                                  char v270 = v159 >> 51;
                                                                                                  char v272 = v159 >> 52;
                                                                                                  char v274 = v159 >> 53;
                                                                                                  char v276 = v159 >> 54;
                                                                                                  char v278 = v159 >> 55;
                                                                                                  char v280 = HIBYTE(v159);
                                                                                                  char v282 = (v159 >> 57) | ((_BYTE)v76 << 7);
                                                                                                  char v284 = (v159 >> 58) | ((_BYTE)v76 << 6);
                                                                                                  char v286 = (v159 >> 59) | (32 * v76);
                                                                                                  char v288 = (v159 >> 60) | (16 * v76);
                                                                                                  char v290 = (v159 >> 61) | (8 * v76);
                                                                                                  char v291 = (v159 >> 62) | (4 * v76);
                                                                                                  char v292 = ((v159 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                  char v262 = BYTE6(v160);
                                                                                                  char v264 = v160 >> 49;
                                                                                                  char v267 = v160 >> 50;
                                                                                                  char v269 = v160 >> 51;
                                                                                                  char v271 = v160 >> 52;
                                                                                                  char v273 = v160 >> 53;
                                                                                                  char v275 = v160 >> 54;
                                                                                                  char v277 = v160 >> 55;
                                                                                                  char v279 = HIBYTE(v160);
                                                                                                  char v281 = (v160 >> 57) | ((_BYTE)v96 << 7);
                                                                                                  char v283 = (v160 >> 58) | ((_BYTE)v96 << 6);
                                                                                                  char v285 = (v160 >> 59) | (32 * v96);
                                                                                                  char v287 = (v160 >> 60) | (16 * v96);
                                                                                                  char v289 = (v160 >> 61) | (8 * v96);
                                                                                                  char v97 = (v160 >> 62) | (4 * v96);
                                                                                                  unint64_t v293 = v76 >> 1;
                                                                                                  unint64_t v294 = v76 >> 2;
                                                                                                  char v100 = ((v160 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                  unint64_t has = v96 >> 1;
                                                                                                  unint64_t v7 = v96 >> 2;
                                                                                                }
                                                                                                if ((v262 & 1) == (v263 & 1))
                                                                                                {
                                                                                                  if (v262)
                                                                                                  {
                                                                                                    int rawMediaTypeUsageSignalRadio = self->_rawMediaTypeUsageSignalRadio;
                                                                                                    if (rawMediaTypeUsageSignalRadio != [v4 rawMediaTypeUsageSignalRadio]) {
                                                                                                      goto LABEL_295;
                                                                                                    }
                                                                                                    unint64_t v162 = v4[43];
                                                                                                    unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                    unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                    char v266 = v162 >> 49;
                                                                                                    unint64_t v163 = (unint64_t)self->_has;
                                                                                                    char v268 = v162 >> 50;
                                                                                                    char v270 = v162 >> 51;
                                                                                                    char v272 = v162 >> 52;
                                                                                                    char v274 = v162 >> 53;
                                                                                                    char v276 = v162 >> 54;
                                                                                                    char v278 = v162 >> 55;
                                                                                                    char v280 = HIBYTE(v162);
                                                                                                    char v282 = (v162 >> 57) | ((_BYTE)v76 << 7);
                                                                                                    char v284 = (v162 >> 58) | ((_BYTE)v76 << 6);
                                                                                                    char v286 = (v162 >> 59) | (32 * v76);
                                                                                                    char v288 = (v162 >> 60) | (16 * v76);
                                                                                                    char v290 = (v162 >> 61) | (8 * v76);
                                                                                                    char v291 = (v162 >> 62) | (4 * v76);
                                                                                                    char v292 = ((v162 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                    char v264 = v163 >> 49;
                                                                                                    char v267 = v163 >> 50;
                                                                                                    char v269 = v163 >> 51;
                                                                                                    char v271 = v163 >> 52;
                                                                                                    char v273 = v163 >> 53;
                                                                                                    char v275 = v163 >> 54;
                                                                                                    char v277 = v163 >> 55;
                                                                                                    char v279 = HIBYTE(v163);
                                                                                                    char v281 = (v163 >> 57) | ((_BYTE)v96 << 7);
                                                                                                    char v283 = (v163 >> 58) | ((_BYTE)v96 << 6);
                                                                                                    char v285 = (v163 >> 59) | (32 * v96);
                                                                                                    char v287 = (v163 >> 60) | (16 * v96);
                                                                                                    char v289 = (v163 >> 61) | (8 * v96);
                                                                                                    char v97 = (v163 >> 62) | (4 * v96);
                                                                                                    unint64_t v293 = v76 >> 1;
                                                                                                    unint64_t v294 = v76 >> 2;
                                                                                                    char v100 = ((v163 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                    unint64_t has = v96 >> 1;
                                                                                                    unint64_t v7 = v96 >> 2;
                                                                                                  }
                                                                                                  if ((v264 & 1) == (v266 & 1))
                                                                                                  {
                                                                                                    if (v264)
                                                                                                    {
                                                                                                      int rawMediaTypeUsageSignalMusicWithoutRadio = self->_rawMediaTypeUsageSignalMusicWithoutRadio;
                                                                                                      if (rawMediaTypeUsageSignalMusicWithoutRadio != [v4 rawMediaTypeUsageSignalMusicWithoutRadio]) {
                                                                                                        goto LABEL_295;
                                                                                                      }
                                                                                                      unint64_t v165 = v4[43];
                                                                                                      unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                      unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                      char v268 = v165 >> 50;
                                                                                                      unint64_t v166 = (unint64_t)self->_has;
                                                                                                      char v270 = v165 >> 51;
                                                                                                      char v272 = v165 >> 52;
                                                                                                      char v274 = v165 >> 53;
                                                                                                      char v276 = v165 >> 54;
                                                                                                      char v278 = v165 >> 55;
                                                                                                      char v280 = HIBYTE(v165);
                                                                                                      char v282 = (v165 >> 57) | ((_BYTE)v76 << 7);
                                                                                                      char v284 = (v165 >> 58) | ((_BYTE)v76 << 6);
                                                                                                      char v286 = (v165 >> 59) | (32 * v76);
                                                                                                      char v288 = (v165 >> 60) | (16 * v76);
                                                                                                      char v290 = (v165 >> 61) | (8 * v76);
                                                                                                      char v291 = (v165 >> 62) | (4 * v76);
                                                                                                      char v292 = ((v165 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                      char v267 = v166 >> 50;
                                                                                                      char v269 = v166 >> 51;
                                                                                                      char v271 = v166 >> 52;
                                                                                                      char v273 = v166 >> 53;
                                                                                                      char v275 = v166 >> 54;
                                                                                                      char v277 = v166 >> 55;
                                                                                                      char v279 = HIBYTE(v166);
                                                                                                      char v281 = (v166 >> 57) | ((_BYTE)v96 << 7);
                                                                                                      char v283 = (v166 >> 58) | ((_BYTE)v96 << 6);
                                                                                                      char v285 = (v166 >> 59) | (32 * v96);
                                                                                                      char v287 = (v166 >> 60) | (16 * v96);
                                                                                                      char v289 = (v166 >> 61) | (8 * v96);
                                                                                                      char v97 = (v166 >> 62) | (4 * v96);
                                                                                                      unint64_t v293 = v76 >> 1;
                                                                                                      unint64_t v294 = v76 >> 2;
                                                                                                      char v100 = ((v166 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                      unint64_t has = v96 >> 1;
                                                                                                      unint64_t v7 = v96 >> 2;
                                                                                                    }
                                                                                                    if ((v267 & 1) == (v268 & 1))
                                                                                                    {
                                                                                                      if (v267)
                                                                                                      {
                                                                                                        int subscriptionStatus = self->_subscriptionStatus;
                                                                                                        if (subscriptionStatus != [v4 subscriptionStatus]) {
                                                                                                          goto LABEL_295;
                                                                                                        }
                                                                                                        unint64_t v168 = v4[43];
                                                                                                        unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                        unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                        char v270 = v168 >> 51;
                                                                                                        unint64_t v169 = (unint64_t)self->_has;
                                                                                                        char v272 = v168 >> 52;
                                                                                                        char v274 = v168 >> 53;
                                                                                                        char v276 = v168 >> 54;
                                                                                                        char v278 = v168 >> 55;
                                                                                                        char v280 = HIBYTE(v168);
                                                                                                        char v282 = (v168 >> 57) | ((_BYTE)v76 << 7);
                                                                                                        char v284 = (v168 >> 58) | ((_BYTE)v76 << 6);
                                                                                                        char v286 = (v168 >> 59) | (32 * v76);
                                                                                                        char v288 = (v168 >> 60) | (16 * v76);
                                                                                                        char v290 = (v168 >> 61) | (8 * v76);
                                                                                                        char v291 = (v168 >> 62) | (4 * v76);
                                                                                                        char v292 = ((v168 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                        char v269 = v169 >> 51;
                                                                                                        char v271 = v169 >> 52;
                                                                                                        char v273 = v169 >> 53;
                                                                                                        char v275 = v169 >> 54;
                                                                                                        char v277 = v169 >> 55;
                                                                                                        char v279 = HIBYTE(v169);
                                                                                                        char v281 = (v169 >> 57) | ((_BYTE)v96 << 7);
                                                                                                        char v283 = (v169 >> 58) | ((_BYTE)v96 << 6);
                                                                                                        char v285 = (v169 >> 59) | (32 * v96);
                                                                                                        char v287 = (v169 >> 60) | (16 * v96);
                                                                                                        char v289 = (v169 >> 61) | (8 * v96);
                                                                                                        unint64_t v293 = v76 >> 1;
                                                                                                        unint64_t v294 = v76 >> 2;
                                                                                                        char v97 = (v169 >> 62) | (4 * v96);
                                                                                                        char v100 = ((v169 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                        unint64_t v7 = v96 >> 2;
                                                                                                        unint64_t has = v96 >> 1;
                                                                                                      }
                                                                                                      if ((v269 & 1) == (v270 & 1))
                                                                                                      {
                                                                                                        if (v269)
                                                                                                        {
                                                                                                          int isRawNowPlayingBundle = self->_isRawNowPlayingBundle;
                                                                                                          if (isRawNowPlayingBundle != [v4 isRawNowPlayingBundle]) {
                                                                                                            goto LABEL_295;
                                                                                                          }
                                                                                                          unint64_t v171 = v4[43];
                                                                                                          unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                          unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                          char v272 = v171 >> 52;
                                                                                                          unint64_t v172 = (unint64_t)self->_has;
                                                                                                          char v274 = v171 >> 53;
                                                                                                          char v276 = v171 >> 54;
                                                                                                          char v278 = v171 >> 55;
                                                                                                          char v280 = HIBYTE(v171);
                                                                                                          char v282 = (v171 >> 57) | ((_BYTE)v76 << 7);
                                                                                                          char v284 = (v171 >> 58) | ((_BYTE)v76 << 6);
                                                                                                          char v286 = (v171 >> 59) | (32 * v76);
                                                                                                          char v288 = (v171 >> 60) | (16 * v76);
                                                                                                          char v290 = (v171 >> 61) | (8 * v76);
                                                                                                          char v291 = (v171 >> 62) | (4 * v76);
                                                                                                          char v292 = ((v171 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                          char v271 = v172 >> 52;
                                                                                                          char v273 = v172 >> 53;
                                                                                                          char v275 = v172 >> 54;
                                                                                                          char v277 = v172 >> 55;
                                                                                                          char v279 = HIBYTE(v172);
                                                                                                          char v281 = (v172 >> 57) | ((_BYTE)v96 << 7);
                                                                                                          char v283 = (v172 >> 58) | ((_BYTE)v96 << 6);
                                                                                                          char v285 = (v172 >> 59) | (32 * v96);
                                                                                                          char v287 = (v172 >> 60) | (16 * v96);
                                                                                                          char v289 = (v172 >> 61) | (8 * v96);
                                                                                                          unint64_t v293 = v76 >> 1;
                                                                                                          unint64_t v294 = v76 >> 2;
                                                                                                          char v97 = (v172 >> 62) | (4 * v96);
                                                                                                          char v100 = ((v172 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                          unint64_t has = v96 >> 1;
                                                                                                          unint64_t v7 = v96 >> 2;
                                                                                                        }
                                                                                                        if ((v271 & 1) == (v272 & 1))
                                                                                                        {
                                                                                                          if (v271)
                                                                                                          {
                                                                                                            int rawNowPlayingTotal = self->_rawNowPlayingTotal;
                                                                                                            if (rawNowPlayingTotal != [v4 rawNowPlayingTotal]) {
                                                                                                              goto LABEL_295;
                                                                                                            }
                                                                                                            unint64_t v174 = v4[43];
                                                                                                            unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                            unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                            char v274 = v174 >> 53;
                                                                                                            unint64_t v175 = (unint64_t)self->_has;
                                                                                                            char v276 = v174 >> 54;
                                                                                                            char v278 = v174 >> 55;
                                                                                                            char v280 = HIBYTE(v174);
                                                                                                            char v282 = (v174 >> 57) | ((_BYTE)v76 << 7);
                                                                                                            char v284 = (v174 >> 58) | ((_BYTE)v76 << 6);
                                                                                                            char v286 = (v174 >> 59) | (32 * v76);
                                                                                                            char v288 = (v174 >> 60) | (16 * v76);
                                                                                                            char v290 = (v174 >> 61) | (8 * v76);
                                                                                                            char v291 = (v174 >> 62) | (4 * v76);
                                                                                                            char v292 = ((v174 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                            char v273 = v175 >> 53;
                                                                                                            char v275 = v175 >> 54;
                                                                                                            char v277 = v175 >> 55;
                                                                                                            char v279 = HIBYTE(v175);
                                                                                                            char v281 = (v175 >> 57) | ((_BYTE)v96 << 7);
                                                                                                            char v283 = (v175 >> 58) | ((_BYTE)v96 << 6);
                                                                                                            char v285 = (v175 >> 59) | (32 * v96);
                                                                                                            char v287 = (v175 >> 60) | (16 * v96);
                                                                                                            char v289 = (v175 >> 61) | (8 * v96);
                                                                                                            unint64_t v293 = v76 >> 1;
                                                                                                            unint64_t v294 = v76 >> 2;
                                                                                                            char v97 = (v175 >> 62) | (4 * v96);
                                                                                                            char v100 = ((v175 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                            unint64_t has = v96 >> 1;
                                                                                                            unint64_t v7 = v96 >> 2;
                                                                                                          }
                                                                                                          if ((v273 & 1) == (v274 & 1))
                                                                                                          {
                                                                                                            if (v273)
                                                                                                            {
                                                                                                              double rawNowPlayingBundleScore = self->_rawNowPlayingBundleScore;
                                                                                                              [v4 rawNowPlayingBundleScore];
                                                                                                              if (rawNowPlayingBundleScore != v177) {
                                                                                                                goto LABEL_295;
                                                                                                              }
                                                                                                              unint64_t v178 = v4[43];
                                                                                                              unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                              unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                              char v276 = v178 >> 54;
                                                                                                              unint64_t v179 = (unint64_t)self->_has;
                                                                                                              char v278 = v178 >> 55;
                                                                                                              char v280 = HIBYTE(v178);
                                                                                                              char v282 = (v178 >> 57) | ((_BYTE)v76 << 7);
                                                                                                              char v284 = (v178 >> 58) | ((_BYTE)v76 << 6);
                                                                                                              char v286 = (v178 >> 59) | (32 * v76);
                                                                                                              char v288 = (v178 >> 60) | (16 * v76);
                                                                                                              char v290 = (v178 >> 61) | (8 * v76);
                                                                                                              char v291 = (v178 >> 62) | (4 * v76);
                                                                                                              char v292 = ((v178 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                              char v275 = v179 >> 54;
                                                                                                              char v277 = v179 >> 55;
                                                                                                              char v279 = HIBYTE(v179);
                                                                                                              char v281 = (v179 >> 57) | ((_BYTE)v96 << 7);
                                                                                                              char v283 = (v179 >> 58) | ((_BYTE)v96 << 6);
                                                                                                              char v285 = (v179 >> 59) | (32 * v96);
                                                                                                              char v287 = (v179 >> 60) | (16 * v96);
                                                                                                              char v289 = (v179 >> 61) | (8 * v96);
                                                                                                              unint64_t v293 = v76 >> 1;
                                                                                                              unint64_t v294 = v76 >> 2;
                                                                                                              char v97 = (v179 >> 62) | (4 * v96);
                                                                                                              char v100 = ((v179 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                              unint64_t has = v96 >> 1;
                                                                                                              unint64_t v7 = v96 >> 2;
                                                                                                            }
                                                                                                            if ((v275 & 1) == (v276 & 1))
                                                                                                            {
                                                                                                              if (v275)
                                                                                                              {
                                                                                                                double isRawLastNowPlaying = self->_isRawLastNowPlaying;
                                                                                                                [v4 isRawLastNowPlaying];
                                                                                                                if (isRawLastNowPlaying != v181) {
                                                                                                                  goto LABEL_295;
                                                                                                                }
                                                                                                                unint64_t v182 = v4[43];
                                                                                                                unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                char v278 = v182 >> 55;
                                                                                                                unint64_t v183 = (unint64_t)self->_has;
                                                                                                                char v280 = HIBYTE(v182);
                                                                                                                char v282 = (v182 >> 57) | ((_BYTE)v76 << 7);
                                                                                                                char v284 = (v182 >> 58) | ((_BYTE)v76 << 6);
                                                                                                                char v286 = (v182 >> 59) | (32 * v76);
                                                                                                                char v288 = (v182 >> 60) | (16 * v76);
                                                                                                                char v290 = (v182 >> 61) | (8 * v76);
                                                                                                                char v291 = (v182 >> 62) | (4 * v76);
                                                                                                                char v292 = ((v182 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                char v277 = v183 >> 55;
                                                                                                                char v279 = HIBYTE(v183);
                                                                                                                char v281 = (v183 >> 57) | ((_BYTE)v96 << 7);
                                                                                                                char v283 = (v183 >> 58) | ((_BYTE)v96 << 6);
                                                                                                                char v285 = (v183 >> 59) | (32 * v96);
                                                                                                                char v287 = (v183 >> 60) | (16 * v96);
                                                                                                                char v289 = (v183 >> 61) | (8 * v96);
                                                                                                                unint64_t v293 = v76 >> 1;
                                                                                                                unint64_t v294 = v76 >> 2;
                                                                                                                char v97 = (v183 >> 62) | (4 * v96);
                                                                                                                char v100 = ((v183 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                                unint64_t has = v96 >> 1;
                                                                                                                unint64_t v7 = v96 >> 2;
                                                                                                              }
                                                                                                              if ((v277 & 1) == (v278 & 1))
                                                                                                              {
                                                                                                                if (v277)
                                                                                                                {
                                                                                                                  int rawNowPlaying2Minutes = self->_rawNowPlaying2Minutes;
                                                                                                                  if (rawNowPlaying2Minutes != [v4 rawNowPlaying2Minutes]) {
                                                                                                                    goto LABEL_295;
                                                                                                                  }
                                                                                                                  unint64_t v185 = v4[43];
                                                                                                                  unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                  unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                  char v280 = HIBYTE(v185);
                                                                                                                  unint64_t v186 = (unint64_t)self->_has;
                                                                                                                  char v282 = (v185 >> 57) | ((_BYTE)v76 << 7);
                                                                                                                  char v284 = (v185 >> 58) | ((_BYTE)v76 << 6);
                                                                                                                  char v286 = (v185 >> 59) | (32 * v76);
                                                                                                                  char v288 = (v185 >> 60) | (16 * v76);
                                                                                                                  char v290 = (v185 >> 61) | (8 * v76);
                                                                                                                  char v291 = (v185 >> 62) | (4 * v76);
                                                                                                                  char v292 = ((v185 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                  char v279 = HIBYTE(v186);
                                                                                                                  char v281 = (v186 >> 57) | ((_BYTE)v96 << 7);
                                                                                                                  char v283 = (v186 >> 58) | ((_BYTE)v96 << 6);
                                                                                                                  char v285 = (v186 >> 59) | (32 * v96);
                                                                                                                  char v287 = (v186 >> 60) | (16 * v96);
                                                                                                                  char v289 = (v186 >> 61) | (8 * v96);
                                                                                                                  unint64_t v293 = v76 >> 1;
                                                                                                                  unint64_t v294 = v76 >> 2;
                                                                                                                  char v97 = (v186 >> 62) | (4 * v96);
                                                                                                                  char v100 = ((v186 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                                  unint64_t has = v96 >> 1;
                                                                                                                  unint64_t v7 = v96 >> 2;
                                                                                                                }
                                                                                                                if ((v279 & 1) == (v280 & 1))
                                                                                                                {
                                                                                                                  if (v279)
                                                                                                                  {
                                                                                                                    int rawNowPlaying10Minutes = self->_rawNowPlaying10Minutes;
                                                                                                                    if (rawNowPlaying10Minutes != [v4 rawNowPlaying10Minutes]) {
                                                                                                                      goto LABEL_295;
                                                                                                                    }
                                                                                                                    unint64_t v188 = v4[43];
                                                                                                                    unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                    unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                    char v282 = (v188 >> 57) | ((_BYTE)v76 << 7);
                                                                                                                    unint64_t v189 = (unint64_t)self->_has;
                                                                                                                    char v284 = (v188 >> 58) | ((_BYTE)v76 << 6);
                                                                                                                    char v286 = (v188 >> 59) | (32 * v76);
                                                                                                                    char v288 = (v188 >> 60) | (16 * v76);
                                                                                                                    char v290 = (v188 >> 61) | (8 * v76);
                                                                                                                    char v291 = (v188 >> 62) | (4 * v76);
                                                                                                                    char v292 = ((v188 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                    char v281 = (v189 >> 57) | ((_BYTE)v96 << 7);
                                                                                                                    char v283 = (v189 >> 58) | ((_BYTE)v96 << 6);
                                                                                                                    char v285 = (v189 >> 59) | (32 * v96);
                                                                                                                    char v287 = (v189 >> 60) | (16 * v96);
                                                                                                                    char v289 = (v189 >> 61) | (8 * v96);
                                                                                                                    unint64_t v293 = v76 >> 1;
                                                                                                                    unint64_t v294 = v76 >> 2;
                                                                                                                    char v97 = (v189 >> 62) | (4 * v96);
                                                                                                                    char v100 = ((v189 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                                    unint64_t has = v96 >> 1;
                                                                                                                    unint64_t v7 = v96 >> 2;
                                                                                                                  }
                                                                                                                  if ((v281 & 1) == (v282 & 1))
                                                                                                                  {
                                                                                                                    if (v281)
                                                                                                                    {
                                                                                                                      int rawNowPlaying1Hour = self->_rawNowPlaying1Hour;
                                                                                                                      if (rawNowPlaying1Hour != [v4 rawNowPlaying1Hour]) {
                                                                                                                        goto LABEL_295;
                                                                                                                      }
                                                                                                                      unint64_t v191 = v4[43];
                                                                                                                      unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                      unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                      char v284 = (v191 >> 58) | ((_BYTE)v76 << 6);
                                                                                                                      unint64_t v192 = (unint64_t)self->_has;
                                                                                                                      char v286 = (v191 >> 59) | (32 * v76);
                                                                                                                      char v288 = (v191 >> 60) | (16 * v76);
                                                                                                                      char v290 = (v191 >> 61) | (8 * v76);
                                                                                                                      char v291 = (v191 >> 62) | (4 * v76);
                                                                                                                      char v292 = ((v191 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                      char v283 = (v192 >> 58) | ((_BYTE)v96 << 6);
                                                                                                                      char v285 = (v192 >> 59) | (32 * v96);
                                                                                                                      char v287 = (v192 >> 60) | (16 * v96);
                                                                                                                      char v289 = (v192 >> 61) | (8 * v96);
                                                                                                                      unint64_t v293 = v76 >> 1;
                                                                                                                      unint64_t v294 = v76 >> 2;
                                                                                                                      char v97 = (v192 >> 62) | (4 * v96);
                                                                                                                      char v100 = ((v192 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                                      unint64_t has = v96 >> 1;
                                                                                                                      unint64_t v7 = v96 >> 2;
                                                                                                                    }
                                                                                                                    if ((v283 & 1) == (v284 & 1))
                                                                                                                    {
                                                                                                                      if (v283)
                                                                                                                      {
                                                                                                                        int rawNowPlaying6Hours = self->_rawNowPlaying6Hours;
                                                                                                                        if (rawNowPlaying6Hours != [v4 rawNowPlaying6Hours]) {
                                                                                                                          goto LABEL_295;
                                                                                                                        }
                                                                                                                        unint64_t v194 = v4[43];
                                                                                                                        unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                        unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                        char v286 = (v194 >> 59) | (32 * v76);
                                                                                                                        unint64_t v195 = (unint64_t)self->_has;
                                                                                                                        char v288 = (v194 >> 60) | (16 * v76);
                                                                                                                        char v290 = (v194 >> 61) | (8 * v76);
                                                                                                                        char v291 = (v194 >> 62) | (4 * v76);
                                                                                                                        char v292 = ((v194 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                        char v285 = (v195 >> 59) | (32 * v96);
                                                                                                                        char v287 = (v195 >> 60) | (16 * v96);
                                                                                                                        char v289 = (v195 >> 61) | (8 * v96);
                                                                                                                        unint64_t v293 = v76 >> 1;
                                                                                                                        unint64_t v294 = v76 >> 2;
                                                                                                                        char v97 = (v195 >> 62) | (4 * v96);
                                                                                                                        char v100 = ((v195 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                                        unint64_t has = v96 >> 1;
                                                                                                                        unint64_t v7 = v96 >> 2;
                                                                                                                      }
                                                                                                                      if ((v285 & 1) == (v286 & 1))
                                                                                                                      {
                                                                                                                        if (v285)
                                                                                                                        {
                                                                                                                          int rawNowPlaying1Day = self->_rawNowPlaying1Day;
                                                                                                                          if (rawNowPlaying1Day != [v4 rawNowPlaying1Day]) {
                                                                                                                            goto LABEL_295;
                                                                                                                          }
                                                                                                                          unint64_t v197 = v4[43];
                                                                                                                          unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                          unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                          char v288 = (v197 >> 60) | (16 * v76);
                                                                                                                          unint64_t v198 = (unint64_t)self->_has;
                                                                                                                          char v290 = (v197 >> 61) | (8 * v76);
                                                                                                                          char v291 = (v197 >> 62) | (4 * v76);
                                                                                                                          char v292 = ((v197 & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                          char v287 = (v198 >> 60) | (16 * v96);
                                                                                                                          char v289 = (v198 >> 61) | (8 * v96);
                                                                                                                          unint64_t v293 = v76 >> 1;
                                                                                                                          unint64_t v294 = v76 >> 2;
                                                                                                                          char v97 = (v198 >> 62) | (4 * v96);
                                                                                                                          char v100 = ((v198 & 0x8000000000000000) != 0) | (2 * v96);
                                                                                                                          unint64_t has = v96 >> 1;
                                                                                                                          unint64_t v7 = v96 >> 2;
                                                                                                                        }
                                                                                                                        if ((v287 & 1) == (v288 & 1))
                                                                                                                        {
                                                                                                                          if (v287)
                                                                                                                          {
                                                                                                                            int rawNowPlaying7Days = self->_rawNowPlaying7Days;
                                                                                                                            if (rawNowPlaying7Days != [v4 rawNowPlaying7Days]) {
                                                                                                                              goto LABEL_295;
                                                                                                                            }
                                                                                                                            uint64_t v200 = v4[43];
                                                                                                                            unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                            unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                            char v290 = ((unint64_t)v200 >> 61) | (8 * v76);
                                                                                                                            uint64_t v201 = (uint64_t)self->_has;
                                                                                                                            char v291 = ((unint64_t)v200 >> 62) | (4 * v76);
                                                                                                                            char v292 = (v200 < 0) | (2 * v76);
                                                                                                                            char v289 = ((unint64_t)v201 >> 61) | (8 * v96);
                                                                                                                            unint64_t v293 = v76 >> 1;
                                                                                                                            unint64_t v294 = v76 >> 2;
                                                                                                                            char v97 = ((unint64_t)v201 >> 62) | (4 * v96);
                                                                                                                            char v100 = (v201 < 0) | (2 * v96);
                                                                                                                            unint64_t has = v96 >> 1;
                                                                                                                            unint64_t v7 = v96 >> 2;
                                                                                                                          }
                                                                                                                          if ((v289 & 1) == (v290 & 1))
                                                                                                                          {
                                                                                                                            if (v289)
                                                                                                                            {
                                                                                                                              int rawNowPlaying28Days = self->_rawNowPlaying28Days;
                                                                                                                              if (rawNowPlaying28Days != [v4 rawNowPlaying28Days]) {
                                                                                                                                goto LABEL_295;
                                                                                                                              }
                                                                                                                              uint64_t v203 = v4[43];
                                                                                                                              unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                              unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                              char v291 = ((unint64_t)v203 >> 62) | (4 * v76);
                                                                                                                              uint64_t v204 = (uint64_t)self->_has;
                                                                                                                              char v292 = (v203 < 0) | (2 * v76);
                                                                                                                              char v97 = ((unint64_t)v204 >> 62) | (4 * v96);
                                                                                                                              unint64_t v293 = v76 >> 1;
                                                                                                                              unint64_t v294 = v76 >> 2;
                                                                                                                              char v100 = (v204 < 0) | (2 * v96);
                                                                                                                              unint64_t has = v96 >> 1;
                                                                                                                              unint64_t v7 = v96 >> 2;
                                                                                                                            }
                                                                                                                            if ((v97 & 1) == (v291 & 1))
                                                                                                                            {
                                                                                                                              if (v97)
                                                                                                                              {
                                                                                                                                int rawLastNowPlayingRecency = self->_rawLastNowPlayingRecency;
                                                                                                                                if (rawLastNowPlayingRecency != [v4 rawLastNowPlayingRecency]) {
                                                                                                                                  goto LABEL_295;
                                                                                                                                }
                                                                                                                                unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                char v292 = ((v4[43] & 0x8000000000000000) != 0) | (2 * v76);
                                                                                                                                unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                char v100 = (*(void *)&self->_has < 0) | (2 * v96);
                                                                                                                                unint64_t v293 = v76 >> 1;
                                                                                                                                unint64_t v294 = v76 >> 2;
                                                                                                                                unint64_t has = v96 >> 1;
                                                                                                                                unint64_t v7 = v96 >> 2;
                                                                                                                              }
                                                                                                                              if ((v100 & 1) == (v292 & 1))
                                                                                                                              {
                                                                                                                                if (v100)
                                                                                                                                {
                                                                                                                                  int commonForegroundBundleApp = self->_commonForegroundBundleApp;
                                                                                                                                  if (commonForegroundBundleApp != [v4 commonForegroundBundleApp]) {
                                                                                                                                    goto LABEL_295;
                                                                                                                                  }
                                                                                                                                  unint64_t v76 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                  unint64_t v96 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                  unint64_t v293 = v76 >> 1;
                                                                                                                                  unint64_t v294 = v76 >> 2;
                                                                                                                                  unint64_t has = v96 >> 1;
                                                                                                                                  unint64_t v7 = v96 >> 2;
                                                                                                                                }
                                                                                                                                if ((v96 & 1) == (v76 & 1))
                                                                                                                                {
                                                                                                                                  if (v96)
                                                                                                                                  {
                                                                                                                                    int isRawLastNowPlayingBoolean = self->_isRawLastNowPlayingBoolean;
                                                                                                                                    if (isRawLastNowPlayingBoolean != [v4 isRawLastNowPlayingBoolean]) {
                                                                                                                                      goto LABEL_295;
                                                                                                                                    }
                                                                                                                                    unint64_t v208 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                    unint64_t v209 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                    unint64_t v293 = v209 >> 1;
                                                                                                                                    unint64_t v294 = v209 >> 2;
                                                                                                                                    unint64_t has = v208 >> 1;
                                                                                                                                    unint64_t v7 = v208 >> 2;
                                                                                                                                  }
                                                                                                                                  if ((has & 1) == (v293 & 1))
                                                                                                                                  {
                                                                                                                                    if (has)
                                                                                                                                    {
                                                                                                                                      int isCommonForegroundApp = self->_isCommonForegroundApp;
                                                                                                                                      if (isCommonForegroundApp != [v4 isCommonForegroundApp]) {
                                                                                                                                        goto LABEL_295;
                                                                                                                                      }
                                                                                                                                      unint64_t v7 = (unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 2;
                                                                                                                                      unint64_t v294 = (unint64_t)*((unsigned __int16 *)v4 + 176) >> 2;
                                                                                                                                    }
                                                                                                                                    if ((v7 & 1) != (v294 & 1)) {
                                                                                                                                      goto LABEL_295;
                                                                                                                                    }
                                                                                                                                    if (v7)
                                                                                                                                    {
                                                                                                                                      int isBoltEnabled = self->_isBoltEnabled;
                                                                                                                                      if (isBoltEnabled != [v4 isBoltEnabled]) {
                                                                                                                                        goto LABEL_295;
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                    unint64_t v212 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                    unsigned int v213 = (v212 >> 3) & 1;
                                                                                                                                    unint64_t v214 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                    if (v213 != ((v214 >> 3) & 1)) {
                                                                                                                                      goto LABEL_295;
                                                                                                                                    }
                                                                                                                                    if (v213)
                                                                                                                                    {
                                                                                                                                      double usageScoreMusicWithoutRadioRemote = self->_usageScoreMusicWithoutRadioRemote;
                                                                                                                                      [v4 usageScoreMusicWithoutRadioRemote];
                                                                                                                                      if (usageScoreMusicWithoutRadioRemote != v226) {
                                                                                                                                        goto LABEL_295;
                                                                                                                                      }
                                                                                                                                      unint64_t v227 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                      unint64_t v215 = v227 >> 4;
                                                                                                                                      unint64_t v216 = v227 >> 5;
                                                                                                                                      unint64_t v217 = v227 >> 6;
                                                                                                                                      unint64_t v223 = v227 >> 8;
                                                                                                                                      unint64_t v219 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                      unint64_t v220 = v219 >> 4;
                                                                                                                                      unint64_t v221 = v219 >> 5;
                                                                                                                                      unint64_t v222 = v219 >> 6;
                                                                                                                                      unint64_t v228 = v219 >> 7;
                                                                                                                                      unint64_t v229 = v219 >> 8;
                                                                                                                                      unint64_t v218 = v227 >> 7;
                                                                                                                                      LOBYTE(v219) = v223;
                                                                                                                                      LOBYTE(v223) = v228;
                                                                                                                                      LOBYTE(v224) = v229;
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      unint64_t v215 = v214 >> 4;
                                                                                                                                      unint64_t v216 = v214 >> 5;
                                                                                                                                      unint64_t v217 = v214 >> 6;
                                                                                                                                      unint64_t v218 = v214 >> 7;
                                                                                                                                      unint64_t v219 = v214 >> 8;
                                                                                                                                      unint64_t v220 = v212 >> 4;
                                                                                                                                      unint64_t v221 = v212 >> 5;
                                                                                                                                      unint64_t v222 = v212 >> 6;
                                                                                                                                      unint64_t v223 = v212 >> 7;
                                                                                                                                      unint64_t v224 = v212 >> 8;
                                                                                                                                    }
                                                                                                                                    int v230 = v220 & 1;
                                                                                                                                    if (v230 == (v215 & 1))
                                                                                                                                    {
                                                                                                                                      if (v230)
                                                                                                                                      {
                                                                                                                                        double usageScoreBooksRemote = self->_usageScoreBooksRemote;
                                                                                                                                        [v4 usageScoreBooksRemote];
                                                                                                                                        if (usageScoreBooksRemote != v232) {
                                                                                                                                          goto LABEL_295;
                                                                                                                                        }
                                                                                                                                        unint64_t v233 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                        unint64_t v216 = v233 >> 5;
                                                                                                                                        unint64_t v217 = v233 >> 6;
                                                                                                                                        unint64_t v223 = v233 >> 8;
                                                                                                                                        unint64_t v219 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                        unint64_t v221 = v219 >> 5;
                                                                                                                                        unint64_t v222 = v219 >> 6;
                                                                                                                                        unint64_t v234 = v219 >> 7;
                                                                                                                                        unint64_t v235 = v219 >> 8;
                                                                                                                                        unint64_t v218 = v233 >> 7;
                                                                                                                                        LOBYTE(v219) = v223;
                                                                                                                                        LOBYTE(v223) = v234;
                                                                                                                                        LOBYTE(v224) = v235;
                                                                                                                                      }
                                                                                                                                      int v236 = v221 & 1;
                                                                                                                                      if (v236 == (v216 & 1))
                                                                                                                                      {
                                                                                                                                        if (v236)
                                                                                                                                        {
                                                                                                                                          double usageScoreRadioRemote = self->_usageScoreRadioRemote;
                                                                                                                                          [v4 usageScoreRadioRemote];
                                                                                                                                          if (usageScoreRadioRemote != v238) {
                                                                                                                                            goto LABEL_295;
                                                                                                                                          }
                                                                                                                                          unint64_t v239 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                          unint64_t v217 = v239 >> 6;
                                                                                                                                          unint64_t v223 = v239 >> 8;
                                                                                                                                          unint64_t v219 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                          unint64_t v222 = v219 >> 6;
                                                                                                                                          unint64_t v240 = v219 >> 7;
                                                                                                                                          unint64_t v241 = v219 >> 8;
                                                                                                                                          unint64_t v218 = v239 >> 7;
                                                                                                                                          LOBYTE(v219) = v223;
                                                                                                                                          LOBYTE(v223) = v240;
                                                                                                                                          LOBYTE(v224) = v241;
                                                                                                                                        }
                                                                                                                                        if ((v222 & 1) == (v217 & 1))
                                                                                                                                        {
                                                                                                                                          if (v222)
                                                                                                                                          {
                                                                                                                                            double usageScorePodcastsRemote = self->_usageScorePodcastsRemote;
                                                                                                                                            [v4 usageScorePodcastsRemote];
                                                                                                                                            if (usageScorePodcastsRemote != v243) {
                                                                                                                                              goto LABEL_295;
                                                                                                                                            }
                                                                                                                                            unint64_t v219 = *((unsigned __int16 *)&self->_has + 4);
                                                                                                                                            unint64_t v244 = *((unsigned __int16 *)v4 + 176);
                                                                                                                                            unint64_t v245 = v244 >> 8;
                                                                                                                                            unint64_t v223 = v219 >> 7;
                                                                                                                                            unint64_t v246 = v219 >> 8;
                                                                                                                                            unint64_t v218 = v244 >> 7;
                                                                                                                                            LOBYTE(v219) = v245;
                                                                                                                                            LOBYTE(v224) = v246;
                                                                                                                                          }
                                                                                                                                          if ((v223 & 1) == (v218 & 1))
                                                                                                                                          {
                                                                                                                                            if (v223)
                                                                                                                                            {
                                                                                                                                              double entitySearchBundleScoreRemote = self->_entitySearchBundleScoreRemote;
                                                                                                                                              [v4 entitySearchBundleScoreRemote];
                                                                                                                                              if (entitySearchBundleScoreRemote != v248) {
                                                                                                                                                goto LABEL_295;
                                                                                                                                              }
                                                                                                                                              LOBYTE(v224) = *((unsigned char *)&self->_has + 9);
                                                                                                                                              LOBYTE(v219) = *((unsigned char *)v4 + 353);
                                                                                                                                            }
                                                                                                                                            if ((v224 & 1) == (v219 & 1))
                                                                                                                                            {
                                                                                                                                              if ((v224 & 1) == 0 || (double usageScoreMusicRemote = self->_usageScoreMusicRemote, [v4 usageScoreMusicRemote], usageScoreMusicRemote == v250))
                                                                                                                                              {
                                                                                                                                                BOOL v251 = 1;
                                                                                                                                                goto LABEL_296;
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
LABEL_295:
  BOOL v251 = 0;
LABEL_296:

  return v251;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  uint64_t has = (uint64_t)self->_has;
  id v7 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    uint64_t has = (uint64_t)self->_has;
  }
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    uint64_t has = (uint64_t)self->_has;
    __int16 v6 = *((_WORD *)&self->_has + 4);
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_81;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400) == 0)
  {
LABEL_13:
    if ((has & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000) == 0)
  {
LABEL_15:
    if ((has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000) == 0)
  {
LABEL_16:
    if ((has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000) == 0)
  {
LABEL_17:
    if ((has & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000) == 0)
  {
LABEL_18:
    if ((has & 0x10000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000) == 0)
  {
LABEL_19:
    if ((has & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000) == 0)
  {
LABEL_20:
    if ((has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000) == 0)
  {
LABEL_21:
    if ((has & 0x80000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000) == 0)
  {
LABEL_22:
    if ((has & 0x100000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000) == 0)
  {
LABEL_23:
    if ((has & 0x200000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000) == 0)
  {
LABEL_24:
    if ((has & 0x400000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000) == 0)
  {
LABEL_25:
    if ((has & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000) == 0)
  {
LABEL_26:
    if ((has & 0x1000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000) == 0)
  {
LABEL_27:
    if ((has & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000) == 0)
  {
LABEL_28:
    if ((has & 0x4000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000) == 0)
  {
LABEL_29:
    if ((has & 0x8000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000000) == 0)
  {
LABEL_30:
    if ((has & 0x10000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000000) == 0)
  {
LABEL_31:
    if ((has & 0x20000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000000) == 0)
  {
LABEL_32:
    if ((has & 0x40000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000000) == 0)
  {
LABEL_33:
    if ((has & 0x80000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000000) == 0)
  {
LABEL_34:
    if ((has & 0x100000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000) == 0)
  {
LABEL_35:
    if ((has & 0x200000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000000) == 0)
  {
LABEL_36:
    if ((has & 0x400000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000000) == 0)
  {
LABEL_37:
    if ((has & 0x800000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000000) == 0)
  {
LABEL_38:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000000) == 0)
  {
LABEL_39:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000000) == 0)
  {
LABEL_40:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000000) == 0)
  {
LABEL_41:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000000000) == 0)
  {
LABEL_42:
    if ((has & 0x10000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000000000) == 0)
  {
LABEL_43:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000000000) == 0)
  {
LABEL_44:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000000000) == 0)
  {
LABEL_45:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000000000) == 0)
  {
LABEL_46:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000000) == 0)
  {
LABEL_47:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000000000) == 0)
  {
LABEL_48:
    if ((has & 0x400000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000000000) == 0)
  {
LABEL_49:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000000000) == 0)
  {
LABEL_50:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_52:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_53:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_55:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_56:
    if ((has & 0x40000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_57:
    if ((has & 0x80000000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_58:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_59:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_60:
    if ((has & 0x400000000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_61:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_62:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_63:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_64:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  uint64_t has = (uint64_t)self->_has;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_65:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x8000000000000000) == 0)
  {
LABEL_66:
    if ((v6 & 1) == 0) {
      goto LABEL_67;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 1) == 0)
  {
LABEL_67:
    if ((v6 & 2) == 0) {
      goto LABEL_68;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 2) == 0)
  {
LABEL_68:
    if ((v6 & 4) == 0) {
      goto LABEL_69;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 4) == 0)
  {
LABEL_69:
    if ((v6 & 8) == 0) {
      goto LABEL_70;
    }
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 8) == 0)
  {
LABEL_70:
    if ((v6 & 0x10) == 0) {
      goto LABEL_71;
    }
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x10) == 0)
  {
LABEL_71:
    if ((v6 & 0x20) == 0) {
      goto LABEL_72;
    }
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x20) == 0)
  {
LABEL_72:
    if ((v6 & 0x40) == 0) {
      goto LABEL_73;
    }
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x40) == 0)
  {
LABEL_73:
    if ((v6 & 0x80) == 0) {
      goto LABEL_74;
    }
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 v6 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x80) == 0)
  {
LABEL_74:
    if ((v6 & 0x100) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_149:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_75:
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
LABEL_76:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEMusicTrainingDependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteUsageScoreMusicRemote
{
  *((_WORD *)&self->_has + 4) &= ~0x100u;
}

- (void)setHasUsageScoreMusicRemote:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFEFF | v3;
}

- (BOOL)hasUsageScoreMusicRemote
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 8) & 1;
}

- (void)setUsageScoreMusicRemote:(double)a3
{
  *((_WORD *)&self->_has + 4) |= 0x100u;
  self->_double usageScoreMusicRemote = a3;
}

- (void)deleteEntitySearchBundleScoreRemote
{
  *((_WORD *)&self->_has + 4) &= ~0x80u;
}

- (void)setHasEntitySearchBundleScoreRemote:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFF7F | v3;
}

- (BOOL)hasEntitySearchBundleScoreRemote
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 7) & 1;
}

- (void)setEntitySearchBundleScoreRemote:(double)a3
{
  *((_WORD *)&self->_has + 4) |= 0x80u;
  self->_double entitySearchBundleScoreRemote = a3;
}

- (void)deleteUsageScorePodcastsRemote
{
  *((_WORD *)&self->_has + 4) &= ~0x40u;
}

- (void)setHasUsageScorePodcastsRemote:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFBF | v3;
}

- (BOOL)hasUsageScorePodcastsRemote
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 6) & 1;
}

- (void)setUsageScorePodcastsRemote:(double)a3
{
  *((_WORD *)&self->_has + 4) |= 0x40u;
  self->_double usageScorePodcastsRemote = a3;
}

- (void)deleteUsageScoreRadioRemote
{
  *((_WORD *)&self->_has + 4) &= ~0x20u;
}

- (void)setHasUsageScoreRadioRemote:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFDF | v3;
}

- (BOOL)hasUsageScoreRadioRemote
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 5) & 1;
}

- (void)setUsageScoreRadioRemote:(double)a3
{
  *((_WORD *)&self->_has + 4) |= 0x20u;
  self->_double usageScoreRadioRemote = a3;
}

- (void)deleteUsageScoreBooksRemote
{
  *((_WORD *)&self->_has + 4) &= ~0x10u;
}

- (void)setHasUsageScoreBooksRemote:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFEF | v3;
}

- (BOOL)hasUsageScoreBooksRemote
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 4) & 1;
}

- (void)setUsageScoreBooksRemote:(double)a3
{
  *((_WORD *)&self->_has + 4) |= 0x10u;
  self->_double usageScoreBooksRemote = a3;
}

- (void)deleteUsageScoreMusicWithoutRadioRemote
{
  *((_WORD *)&self->_has + 4) &= ~8u;
}

- (void)setHasUsageScoreMusicWithoutRadioRemote:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFF7 | v3;
}

- (BOOL)hasUsageScoreMusicWithoutRadioRemote
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 3) & 1;
}

- (void)setUsageScoreMusicWithoutRadioRemote:(double)a3
{
  *((_WORD *)&self->_has + 4) |= 8u;
  self->_double usageScoreMusicWithoutRadioRemote = a3;
}

- (void)deleteIsBoltEnabled
{
  *((_WORD *)&self->_has + 4) &= ~4u;
}

- (void)setHasIsBoltEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFB | v3;
}

- (BOOL)hasIsBoltEnabled
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 2) & 1;
}

- (void)setIsBoltEnabled:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 4u;
  self->_int isBoltEnabled = a3;
}

- (void)deleteIsCommonForegroundApp
{
  *((_WORD *)&self->_has + 4) &= ~2u;
}

- (void)setHasIsCommonForegroundApp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFD | v3;
}

- (BOOL)hasIsCommonForegroundApp
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 1) & 1;
}

- (void)setIsCommonForegroundApp:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 2u;
  self->_int isCommonForegroundApp = a3;
}

- (void)deleteIsRawLastNowPlayingBoolean
{
  *((_WORD *)&self->_has + 4) &= ~1u;
}

- (void)setHasIsRawLastNowPlayingBoolean:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFE | a3;
}

- (BOOL)hasIsRawLastNowPlayingBoolean
{
  return *((_WORD *)&self->_has + 4) & 1;
}

- (void)setIsRawLastNowPlayingBoolean:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 1u;
  self->_int isRawLastNowPlayingBoolean = a3;
}

- (void)deleteCommonForegroundBundleApp
{
  *(void *)&self->_has &= ~0x8000000000000000;
}

- (void)setHasCommonForegroundBundleApp:(BOOL)a3
{
  unint64_t v3 = 0x8000000000000000;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = v3 & 0x8000000000000000 | *(void *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasCommonForegroundBundleApp
{
  return *(void *)&self->_has >> 63;
}

- (void)setCommonForegroundBundleApp:(int)a3
{
  *(void *)&self->_has |= 0x8000000000000000;
  self->_int commonForegroundBundleApp = a3;
}

- (void)deleteRawLastNowPlayingRecency
{
  *(void *)&self->_has &= ~0x4000000000000000uLL;
}

- (void)setHasRawLastNowPlayingRecency:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRawLastNowPlayingRecency
{
  return (*(void *)&self->_has >> 62) & 1;
}

- (void)setRawLastNowPlayingRecency:(int)a3
{
  *(void *)&self->_has |= 0x4000000000000000uLL;
  self->_int rawLastNowPlayingRecency = a3;
}

- (void)deleteRawNowPlaying28Days
{
  *(void *)&self->_has &= ~0x2000000000000000uLL;
}

- (void)setHasRawNowPlaying28Days:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlaying28Days
{
  return (*(void *)&self->_has >> 61) & 1;
}

- (void)setRawNowPlaying28Days:(int)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_int rawNowPlaying28Days = a3;
}

- (void)deleteRawNowPlaying7Days
{
  *(void *)&self->_has &= ~0x1000000000000000uLL;
}

- (void)setHasRawNowPlaying7Days:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlaying7Days
{
  return (*(void *)&self->_has >> 60) & 1;
}

- (void)setRawNowPlaying7Days:(int)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_int rawNowPlaying7Days = a3;
}

- (void)deleteRawNowPlaying1Day
{
  *(void *)&self->_has &= ~0x800000000000000uLL;
}

- (void)setHasRawNowPlaying1Day:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlaying1Day
{
  return (*(void *)&self->_has >> 59) & 1;
}

- (void)setRawNowPlaying1Day:(int)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_int rawNowPlaying1Day = a3;
}

- (void)deleteRawNowPlaying6Hours
{
  *(void *)&self->_has &= ~0x400000000000000uLL;
}

- (void)setHasRawNowPlaying6Hours:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlaying6Hours
{
  return (*(void *)&self->_has >> 58) & 1;
}

- (void)setRawNowPlaying6Hours:(int)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_int rawNowPlaying6Hours = a3;
}

- (void)deleteRawNowPlaying1Hour
{
  *(void *)&self->_has &= ~0x200000000000000uLL;
}

- (void)setHasRawNowPlaying1Hour:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlaying1Hour
{
  return (*(void *)&self->_has >> 57) & 1;
}

- (void)setRawNowPlaying1Hour:(int)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_int rawNowPlaying1Hour = a3;
}

- (void)deleteRawNowPlaying10Minutes
{
  *(void *)&self->_has &= ~0x100000000000000uLL;
}

- (void)setHasRawNowPlaying10Minutes:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlaying10Minutes
{
  return HIBYTE(*(void *)&self->_has) & 1;
}

- (void)setRawNowPlaying10Minutes:(int)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_int rawNowPlaying10Minutes = a3;
}

- (void)deleteRawNowPlaying2Minutes
{
  *(void *)&self->_has &= ~0x80000000000000uLL;
}

- (void)setHasRawNowPlaying2Minutes:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlaying2Minutes
{
  return (*(void *)&self->_has >> 55) & 1;
}

- (void)setRawNowPlaying2Minutes:(int)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_int rawNowPlaying2Minutes = a3;
}

- (void)deleteIsRawLastNowPlaying
{
  *(void *)&self->_has &= ~0x40000000000000uLL;
}

- (void)setHasIsRawLastNowPlaying:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsRawLastNowPlaying
{
  return (*(void *)&self->_has >> 54) & 1;
}

- (void)setIsRawLastNowPlaying:(double)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_double isRawLastNowPlaying = a3;
}

- (void)deleteRawNowPlayingBundleScore
{
  *(void *)&self->_has &= ~0x20000000000000uLL;
}

- (void)setHasRawNowPlayingBundleScore:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlayingBundleScore
{
  return (*(void *)&self->_has >> 53) & 1;
}

- (void)setRawNowPlayingBundleScore:(double)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_double rawNowPlayingBundleScore = a3;
}

- (void)deleteRawNowPlayingTotal
{
  *(void *)&self->_has &= ~0x10000000000000uLL;
}

- (void)setHasRawNowPlayingTotal:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlayingTotal
{
  return (*(void *)&self->_has >> 52) & 1;
}

- (void)setRawNowPlayingTotal:(int)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_int rawNowPlayingTotal = a3;
}

- (void)deleteIsRawNowPlayingBundle
{
  *(void *)&self->_has &= ~0x8000000000000uLL;
}

- (void)setHasIsRawNowPlayingBundle:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsRawNowPlayingBundle
{
  return (*(void *)&self->_has >> 51) & 1;
}

- (void)setIsRawNowPlayingBundle:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_int isRawNowPlayingBundle = a3;
}

- (void)deleteSubscriptionStatus
{
  *(void *)&self->_has &= ~0x4000000000000uLL;
}

- (void)setHasSubscriptionStatus:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubscriptionStatus
{
  return (*(void *)&self->_has >> 50) & 1;
}

- (void)setSubscriptionStatus:(int)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_int subscriptionStatus = a3;
}

- (void)deleteRawMediaTypeUsageSignalMusicWithoutRadio
{
  *(void *)&self->_has &= ~0x2000000000000uLL;
}

- (void)setHasRawMediaTypeUsageSignalMusicWithoutRadio:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRawMediaTypeUsageSignalMusicWithoutRadio
{
  return (*(void *)&self->_has >> 49) & 1;
}

- (void)setRawMediaTypeUsageSignalMusicWithoutRadio:(int)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_int rawMediaTypeUsageSignalMusicWithoutRadio = a3;
}

- (void)deleteRawMediaTypeUsageSignalRadio
{
  *(void *)&self->_has &= ~0x1000000000000uLL;
}

- (void)setHasRawMediaTypeUsageSignalRadio:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRawMediaTypeUsageSignalRadio
{
  return HIWORD(*(void *)&self->_has) & 1;
}

- (void)setRawMediaTypeUsageSignalRadio:(int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_int rawMediaTypeUsageSignalRadio = a3;
}

- (void)deleteUsageScoreMusicWithoutRadio
{
  *(void *)&self->_has &= ~0x800000000000uLL;
}

- (void)setHasUsageScoreMusicWithoutRadio:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasUsageScoreMusicWithoutRadio
{
  return (*(void *)&self->_has >> 47) & 1;
}

- (void)setUsageScoreMusicWithoutRadio:(double)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_double usageScoreMusicWithoutRadio = a3;
}

- (void)deleteUsageScoreRadio
{
  *(void *)&self->_has &= ~0x400000000000uLL;
}

- (void)setHasUsageScoreRadio:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasUsageScoreRadio
{
  return (*(void *)&self->_has >> 46) & 1;
}

- (void)setUsageScoreRadio:(double)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_double usageScoreRadio = a3;
}

- (void)deleteIsModelPredictedApp
{
  *(void *)&self->_has &= ~0x200000000000uLL;
}

- (void)setHasIsModelPredictedApp:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsModelPredictedApp
{
  return (*(void *)&self->_has >> 45) & 1;
}

- (void)setIsModelPredictedApp:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_int isModelPredictedApp = a3;
}

- (void)deleteIsDisambiguationSelectedApp
{
  *(void *)&self->_has &= ~0x100000000000uLL;
}

- (void)setHasIsDisambiguationSelectedApp:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsDisambiguationSelectedApp
{
  return (*(void *)&self->_has >> 44) & 1;
}

- (void)setIsDisambiguationSelectedApp:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_int isDisambiguationSelectedApp = a3;
}

- (void)deleteIsSupportedUnicornMatchFlag
{
  *(void *)&self->_has &= ~0x80000000000uLL;
}

- (void)setHasIsSupportedUnicornMatchFlag:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasIsSupportedUnicornMatchFlag
{
  return (*(void *)&self->_has >> 43) & 1;
}

- (void)setIsSupportedUnicornMatchFlag:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_int isSupportedUnicornMatchFlag = a3;
}

- (void)deleteIsUnicornFlag
{
  *(void *)&self->_has &= ~0x40000000000uLL;
}

- (void)setHasIsUnicornFlag:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsUnicornFlag
{
  return (*(void *)&self->_has >> 42) & 1;
}

- (void)setIsUnicornFlag:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_int isUnicornFlag = a3;
}

- (void)deleteIsSupportedFlag
{
  *(void *)&self->_has &= ~0x20000000000uLL;
}

- (void)setHasIsSupportedFlag:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsSupportedFlag
{
  return (*(void *)&self->_has >> 41) & 1;
}

- (void)setIsSupportedFlag:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_int isSupportedFlag = a3;
}

- (void)deleteVq21Score
{
  *(void *)&self->_has &= ~0x10000000000uLL;
}

- (void)setHasVq21Score:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasVq21Score
{
  return (*(void *)&self->_has >> 40) & 1;
}

- (void)setVq21Score:(double)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_double vq21Score = a3;
}

- (void)deleteIsNowPlayingBundlePSE2
{
  *(void *)&self->_has &= ~0x8000000000uLL;
}

- (void)setHasIsNowPlayingBundlePSE2:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasIsNowPlayingBundlePSE2
{
  return (*(void *)&self->_has >> 39) & 1;
}

- (void)setIsNowPlayingBundlePSE2:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_int isNowPlayingBundlePSE2 = a3;
}

- (void)deleteIsNowPlayingBundlePSE1
{
  *(void *)&self->_has &= ~0x4000000000uLL;
}

- (void)setHasIsNowPlayingBundlePSE1:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasIsNowPlayingBundlePSE1
{
  return (*(void *)&self->_has >> 38) & 1;
}

- (void)setIsNowPlayingBundlePSE1:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_int isNowPlayingBundlePSE1 = a3;
}

- (void)deleteIsRequestedApp
{
  *(void *)&self->_has &= ~0x2000000000uLL;
}

- (void)setHasIsRequestedApp:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasIsRequestedApp
{
  return (*(void *)&self->_has >> 37) & 1;
}

- (void)setIsRequestedApp:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_int isRequestedApp = a3;
}

- (void)deleteIsAppFirstParty
{
  *(void *)&self->_has &= ~0x1000000000uLL;
}

- (void)setHasIsAppFirstParty:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasIsAppFirstParty
{
  return (*(void *)&self->_has >> 36) & 1;
}

- (void)setIsAppFirstParty:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_int isAppFirstParty = a3;
}

- (void)deleteUsageScorePodcasts
{
  *(void *)&self->_has &= ~0x800000000uLL;
}

- (void)setHasUsageScorePodcasts:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasUsageScorePodcasts
{
  return (*(void *)&self->_has >> 35) & 1;
}

- (void)setUsageScorePodcasts:(double)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_double usageScorePodcasts = a3;
}

- (void)deleteUsageScoreMusic
{
  *(void *)&self->_has &= ~0x400000000uLL;
}

- (void)setHasUsageScoreMusic:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasUsageScoreMusic
{
  return (*(void *)&self->_has >> 34) & 1;
}

- (void)setUsageScoreMusic:(double)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_double usageScoreMusic = a3;
}

- (void)deleteUsageScoreBooks
{
  *(void *)&self->_has &= ~0x200000000uLL;
}

- (void)setHasUsageScoreBooks:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasUsageScoreBooks
{
  return (*(void *)&self->_has >> 33) & 1;
}

- (void)setUsageScoreBooks:(double)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_double usageScoreBooks = a3;
}

- (void)deleteRawEntitySearchRecency
{
  *(void *)&self->_has &= ~0x100000000uLL;
}

- (void)setHasRawEntitySearchRecency:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasRawEntitySearchRecency
{
  return HIDWORD(*(void *)&self->_has) & 1;
}

- (void)setRawEntitySearchRecency:(int)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_int rawEntitySearchRecency = a3;
}

- (void)deleteRawNowPlayingRecencyCD
{
  *(void *)&self->_has &= ~0x80000000uLL;
}

- (void)setHasRawNowPlayingRecencyCD:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlayingRecencyCD
{
  return (*(void *)&self->_has >> 31) & 1;
}

- (void)setRawNowPlayingRecencyCD:(int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_int rawNowPlayingRecencyCD = a3;
}

- (void)deleteRawNowPlayingCountCoreDuet7Day
{
  *(void *)&self->_has &= ~0x40000000uLL;
}

- (void)setHasRawNowPlayingCountCoreDuet7Day:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet7Day
{
  return (*(void *)&self->_has >> 30) & 1;
}

- (void)setRawNowPlayingCountCoreDuet7Day:(int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_int rawNowPlayingCountCoreDuet7Day = a3;
}

- (void)deleteRawNowPlayingCountCoreDuet6Hr
{
  *(void *)&self->_has &= ~0x20000000uLL;
}

- (void)setHasRawNowPlayingCountCoreDuet6Hr:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet6Hr
{
  return (*(void *)&self->_has >> 29) & 1;
}

- (void)setRawNowPlayingCountCoreDuet6Hr:(int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_int rawNowPlayingCountCoreDuet6Hr = a3;
}

- (void)deleteRawNowPlayingCountCoreDuet2Min
{
  *(void *)&self->_has &= ~0x10000000uLL;
}

- (void)setHasRawNowPlayingCountCoreDuet2Min:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet2Min
{
  return (*(void *)&self->_has >> 28) & 1;
}

- (void)setRawNowPlayingCountCoreDuet2Min:(int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_int rawNowPlayingCountCoreDuet2Min = a3;
}

- (void)deleteRawNowPlayingCountCoreDuet28Day
{
  *(void *)&self->_has &= ~0x8000000uLL;
}

- (void)setHasRawNowPlayingCountCoreDuet28Day:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet28Day
{
  return (*(void *)&self->_has >> 27) & 1;
}

- (void)setRawNowPlayingCountCoreDuet28Day:(int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_int rawNowPlayingCountCoreDuet28Day = a3;
}

- (void)deleteRawNowPlayingCountCoreDuet1Hr
{
  *(void *)&self->_has &= ~0x4000000uLL;
}

- (void)setHasRawNowPlayingCountCoreDuet1Hr:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet1Hr
{
  return (*(void *)&self->_has >> 26) & 1;
}

- (void)setRawNowPlayingCountCoreDuet1Hr:(int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_int rawNowPlayingCountCoreDuet1Hr = a3;
}

- (void)deleteRawNowPlayingCountCoreDuet1Day
{
  *(void *)&self->_has &= ~0x2000000uLL;
}

- (void)setHasRawNowPlayingCountCoreDuet1Day:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet1Day
{
  return (*(void *)&self->_has >> 25) & 1;
}

- (void)setRawNowPlayingCountCoreDuet1Day:(int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_int rawNowPlayingCountCoreDuet1Day = a3;
}

- (void)deleteRawNowPlayingCountCoreDuet10Min
{
  *(void *)&self->_has &= ~0x1000000uLL;
}

- (void)setHasRawNowPlayingCountCoreDuet10Min:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasRawNowPlayingCountCoreDuet10Min
{
  return (*(void *)&self->_has >> 24) & 1;
}

- (void)setRawNowPlayingCountCoreDuet10Min:(int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_int rawNowPlayingCountCoreDuet10Min = a3;
}

- (void)deleteRawMediaTypeUsageSignalVideo
{
  *(void *)&self->_has &= ~0x800000uLL;
}

- (void)setHasRawMediaTypeUsageSignalVideo:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasRawMediaTypeUsageSignalVideo
{
  return (*(void *)&self->_has >> 23) & 1;
}

- (void)setRawMediaTypeUsageSignalVideo:(int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_int rawMediaTypeUsageSignalVideo = a3;
}

- (void)deleteRawMediaTypeUsageSignalPodcast
{
  *(void *)&self->_has &= ~0x400000uLL;
}

- (void)setHasRawMediaTypeUsageSignalPodcast:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasRawMediaTypeUsageSignalPodcast
{
  return (*(void *)&self->_has >> 22) & 1;
}

- (void)setRawMediaTypeUsageSignalPodcast:(int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_int rawMediaTypeUsageSignalPodcast = a3;
}

- (void)deleteRawMediaTypeUsageSignalMusic
{
  *(void *)&self->_has &= ~0x200000uLL;
}

- (void)setHasRawMediaTypeUsageSignalMusic:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasRawMediaTypeUsageSignalMusic
{
  return (*(void *)&self->_has >> 21) & 1;
}

- (void)setRawMediaTypeUsageSignalMusic:(int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_int rawMediaTypeUsageSignalMusic = a3;
}

- (void)deleteRawMediaTypeUsageSignalBook
{
  *(void *)&self->_has &= ~0x100000uLL;
}

- (void)setHasRawMediaTypeUsageSignalBook:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasRawMediaTypeUsageSignalBook
{
  return (*(void *)&self->_has >> 20) & 1;
}

- (void)setRawMediaTypeUsageSignalBook:(int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_int rawMediaTypeUsageSignalBook = a3;
}

- (void)deleteIsRawMediaCategoryVideoSignal
{
  *(void *)&self->_has &= ~0x80000uLL;
}

- (void)setHasIsRawMediaCategoryVideoSignal:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasIsRawMediaCategoryVideoSignal
{
  return (*(void *)&self->_has >> 19) & 1;
}

- (void)setIsRawMediaCategoryVideoSignal:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_int isRawMediaCategoryVideoSignal = a3;
}

- (void)deleteIsRawMediaCategoryRadioSignal
{
  *(void *)&self->_has &= ~0x40000uLL;
}

- (void)setHasIsRawMediaCategoryRadioSignal:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasIsRawMediaCategoryRadioSignal
{
  return (*(void *)&self->_has >> 18) & 1;
}

- (void)setIsRawMediaCategoryRadioSignal:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_int isRawMediaCategoryRadioSignal = a3;
}

- (void)deleteIsRawMediaCategoryPodcastSignal
{
  *(void *)&self->_has &= ~0x20000uLL;
}

- (void)setHasIsRawMediaCategoryPodcastSignal:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasIsRawMediaCategoryPodcastSignal
{
  return (*(void *)&self->_has >> 17) & 1;
}

- (void)setIsRawMediaCategoryPodcastSignal:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_int isRawMediaCategoryPodcastSignal = a3;
}

- (void)deleteIsRawMediaCategoryMusicSignal
{
  *(void *)&self->_has &= ~0x10000uLL;
}

- (void)setHasIsRawMediaCategoryMusicSignal:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasIsRawMediaCategoryMusicSignal
{
  return (*(void *)&self->_has >> 16) & 1;
}

- (void)setIsRawMediaCategoryMusicSignal:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_int isRawMediaCategoryMusicSignal = a3;
}

- (void)deleteIsRawMediaCategoryAudiobookSignal
{
  *(void *)&self->_has &= ~0x8000uLL;
}

- (void)setHasIsRawMediaCategoryAudiobookSignal:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasIsRawMediaCategoryAudiobookSignal
{
  return (*(void *)&self->_has >> 15) & 1;
}

- (void)setIsRawMediaCategoryAudiobookSignal:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_int isRawMediaCategoryAudiobookSignal = a3;
}

- (void)deleteIsRawLastNowPlayingCoreDuet
{
  *(void *)&self->_has &= ~0x4000uLL;
}

- (void)setHasIsRawLastNowPlayingCoreDuet:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasIsRawLastNowPlayingCoreDuet
{
  return (*(void *)&self->_has >> 14) & 1;
}

- (void)setIsRawLastNowPlayingCoreDuet:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_int isRawLastNowPlayingCoreDuet = a3;
}

- (void)deleteNowPlayingUsage14Days
{
  *(void *)&self->_has &= ~0x2000uLL;
}

- (void)setHasNowPlayingUsage14Days:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasNowPlayingUsage14Days
{
  return (*(void *)&self->_has >> 13) & 1;
}

- (void)setNowPlayingUsage14Days:(int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_int nowPlayingUsage14Days = a3;
}

- (void)deleteNowPlayingUsage7Days
{
  *(void *)&self->_has &= ~0x1000uLL;
}

- (void)setHasNowPlayingUsage7Days:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasNowPlayingUsage7Days
{
  return (*(void *)&self->_has >> 12) & 1;
}

- (void)setNowPlayingUsage7Days:(int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_int nowPlayingUsage7Days = a3;
}

- (void)deleteNowPlayingUsage1Day
{
  *(void *)&self->_has &= ~0x800uLL;
}

- (void)setHasNowPlayingUsage1Day:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasNowPlayingUsage1Day
{
  return (*(void *)&self->_has >> 11) & 1;
}

- (void)setNowPlayingUsage1Day:(int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_int nowPlayingUsage1Day = a3;
}

- (void)deleteIsNowPlayingLastBundle
{
  *(void *)&self->_has &= ~0x400uLL;
}

- (void)setHasIsNowPlayingLastBundle:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasIsNowPlayingLastBundle
{
  return (*(void *)&self->_has >> 10) & 1;
}

- (void)setIsNowPlayingLastBundle:(BOOL)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_int isNowPlayingLastBundle = a3;
}

- (void)deleteNowPlayingBundleScore
{
  *(void *)&self->_has &= ~0x200uLL;
}

- (void)setHasNowPlayingBundleScore:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasNowPlayingBundleScore
{
  return (*(void *)&self->_has >> 9) & 1;
}

- (void)setNowPlayingBundleScore:(double)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_double nowPlayingBundleScore = a3;
}

- (void)deleteNowPlayingBundleRecencyS
{
  *(void *)&self->_has &= ~0x100uLL;
}

- (void)setHasNowPlayingBundleRecencyS:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasNowPlayingBundleRecencyS
{
  return (*(void *)&self->_has >> 8) & 1;
}

- (void)setNowPlayingBundleRecencyS:(double)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_double nowPlayingBundleRecencyS = a3;
}

- (void)deleteNowPlayingBundleCount
{
  *(void *)&self->_has &= ~0x80uLL;
}

- (void)setHasNowPlayingBundleCount:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasNowPlayingBundleCount
{
  return (*(void *)&self->_has >> 7) & 1;
}

- (void)setNowPlayingBundleCount:(int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_int nowPlayingBundleCount = a3;
}

- (void)deleteIsNowPlayingBundle
{
  *(void *)&self->_has &= ~0x40uLL;
}

- (void)setHasIsNowPlayingBundle:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasIsNowPlayingBundle
{
  return (*(void *)&self->_has >> 6) & 1;
}

- (void)setIsNowPlayingBundle:(BOOL)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_int isNowPlayingBundle = a3;
}

- (void)deleteIsForegroundBundle
{
  *(void *)&self->_has &= ~0x20uLL;
}

- (void)setHasIsForegroundBundle:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasIsForegroundBundle
{
  return (*(void *)&self->_has >> 5) & 1;
}

- (void)setIsForegroundBundle:(BOOL)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_int isForegroundBundle = a3;
}

- (void)deleteEntitySearchBundleScore
{
  *(void *)&self->_has &= ~0x10uLL;
}

- (void)setHasEntitySearchBundleScore:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasEntitySearchBundleScore
{
  return (*(void *)&self->_has >> 4) & 1;
}

- (void)setEntitySearchBundleScore:(double)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_double entitySearchBundleScore = a3;
}

- (void)deleteEntitySearchBundleRecencyS
{
  *(void *)&self->_has &= ~8uLL;
}

- (void)setHasEntitySearchBundleRecencyS:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasEntitySearchBundleRecencyS
{
  return (*(void *)&self->_has >> 3) & 1;
}

- (void)setEntitySearchBundleRecencyS:(double)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_double entitySearchBundleRecencyS = a3;
}

- (void)deleteCompoundMediaTypeBundleScore
{
  *(void *)&self->_has &= ~4uLL;
}

- (void)setHasCompoundMediaTypeBundleScore:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasCompoundMediaTypeBundleScore
{
  return (*(void *)&self->_has >> 2) & 1;
}

- (void)setCompoundMediaTypeBundleScore:(double)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_double compoundMediaTypeBundleScore = a3;
}

- (void)deleteCompoundActiveBundleScore
{
  *(void *)&self->_has &= ~2uLL;
}

- (void)setHasCompoundActiveBundleScore:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasCompoundActiveBundleScore
{
  return (*(void *)&self->_has >> 1) & 1;
}

- (void)setCompoundActiveBundleScore:(double)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_double compoundActiveBundleScore = a3;
}

- (void)deleteIsClientForegroundActiveBundle
{
  *(void *)&self->_has &= ~1uLL;
}

- (void)setHasIsClientForegroundActiveBundle:(BOOL)a3
{
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasIsClientForegroundActiveBundle
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIsClientForegroundActiveBundle:(BOOL)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_int isClientForegroundActiveBundle = a3;
}

@end