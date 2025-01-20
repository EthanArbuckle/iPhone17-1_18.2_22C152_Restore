@interface MOSummarizationParameters
- (MOConfigurationManager)configurationManager;
- (MOSummarizationParameters)initWithConfigurationManager:(id)a3;
- (NSDateInterval)aggregationDateInterval;
- (float)activitySummary_suppressionGoodnessScoreThreshold;
- (float)coarseGranularity_contactBundleAggregationCallCountThreshold;
- (float)coarseGranularity_contactBundleAggregationCallDurationThreshold;
- (float)coarseGranularity_contactBundleAggregationMessageCountThreshold;
- (float)coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold;
- (float)coarseGranularity_contactMegaBundleLookBackDays;
- (float)coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold;
- (float)coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold;
- (float)coarseGranularity_outingBundlesAggregationDistanceThreshold;
- (float)coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold;
- (float)coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold;
- (float)coarseGranularity_outingBundlesAggregationTimeIntervalThreshold;
- (float)coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold;
- (float)dominantBundle_mainActionSelectionThreshold;
- (float)dominantBundle_mediaPlaySessionDominantFactorThreshold;
- (float)dominantBundle_mediaPlaySessionsOverlapsMinimumDistance;
- (float)dominantBundle_overlappingThreshold;
- (float)dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold;
- (float)dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold;
- (float)emotionAttachmentBundleDurationThreshold;
- (float)fineGranularity_activityBundlesAggregationTimeIntervalThreshold;
- (float)fineGranularity_activityBundlesDropForDurationThreshold;
- (float)fineGranularity_outingBundlesAggregationDistanceThreshold;
- (float)fineGranularity_outingBundlesAggregationDistanceToClusterThreshold;
- (float)fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold;
- (float)fineGranularity_outingBundlesAggregationTimeIntervalThreshold;
- (float)fineGranularity_outingBundlesExclusionGoodnessScoreThreshold;
- (float)fineGranularity_transitBundlesDestinationMaximumDistanceThreshold;
- (float)fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle;
- (float)fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian;
- (float)fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold;
- (float)fineGranularity_transitBundlesWorkoutMinimumDuration;
- (float)mediaBundleFirstPartyPlayTimePercentageThreshold;
- (float)mediaBundleMinimumTotalPlayTimeThreshold;
- (float)megaBundleDurationThresholdForAddingTimePrefix;
- (float)motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace;
- (float)motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel;
- (float)motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap;
- (int64_t)mediaBundleMaxResourcesPerBundle;
- (void)setActivitySummary_suppressionGoodnessScoreThreshold:(float)a3;
- (void)setAggregationDateInterval:(id)a3;
- (void)setCoarseGranularity_contactBundleAggregationCallCountThreshold:(float)a3;
- (void)setCoarseGranularity_contactBundleAggregationCallDurationThreshold:(float)a3;
- (void)setCoarseGranularity_contactBundleAggregationMessageCountThreshold:(float)a3;
- (void)setCoarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold:(float)a3;
- (void)setCoarseGranularity_contactMegaBundleLookBackDays:(float)a3;
- (void)setCoarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold:(float)a3;
- (void)setCoarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold:(float)a3;
- (void)setCoarseGranularity_outingBundlesAggregationDistanceThreshold:(float)a3;
- (void)setCoarseGranularity_outingBundlesAggregationDistanceToClusterThreshold:(float)a3;
- (void)setCoarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold:(float)a3;
- (void)setCoarseGranularity_outingBundlesAggregationTimeIntervalThreshold:(float)a3;
- (void)setCoarseGranularity_outingBundlesExclusionGoodnessScoreThreshold:(float)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setDominantBundle_mainActionSelectionThreshold:(float)a3;
- (void)setDominantBundle_mediaPlaySessionDominantFactorThreshold:(float)a3;
- (void)setDominantBundle_mediaPlaySessionsOverlapsMinimumDistance:(float)a3;
- (void)setDominantBundle_overlappingThreshold:(float)a3;
- (void)setDominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold:(float)a3;
- (void)setDominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold:(float)a3;
- (void)setEmotionAttachmentBundleDurationThreshold:(float)a3;
- (void)setFineGranularity_activityBundlesAggregationTimeIntervalThreshold:(float)a3;
- (void)setFineGranularity_activityBundlesDropForDurationThreshold:(float)a3;
- (void)setFineGranularity_outingBundlesAggregationDistanceThreshold:(float)a3;
- (void)setFineGranularity_outingBundlesAggregationDistanceToClusterThreshold:(float)a3;
- (void)setFineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold:(float)a3;
- (void)setFineGranularity_outingBundlesAggregationTimeIntervalThreshold:(float)a3;
- (void)setFineGranularity_outingBundlesExclusionGoodnessScoreThreshold:(float)a3;
- (void)setFineGranularity_transitBundlesDestinationMaximumDistanceThreshold:(float)a3;
- (void)setFineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle:(float)a3;
- (void)setFineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian:(float)a3;
- (void)setFineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold:(float)a3;
- (void)setFineGranularity_transitBundlesWorkoutMinimumDuration:(float)a3;
- (void)setMediaBundleFirstPartyPlayTimePercentageThreshold:(float)a3;
- (void)setMediaBundleMaxResourcesPerBundle:(int64_t)a3;
- (void)setMediaBundleMinimumTotalPlayTimeThreshold:(float)a3;
- (void)setMegaBundleDurationThresholdForAddingTimePrefix:(float)a3;
- (void)setMotionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace:(float)a3;
- (void)setMotionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel:(float)a3;
- (void)setMotionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap:(float)a3;
@end

@implementation MOSummarizationParameters

- (MOSummarizationParameters)initWithConfigurationManager:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v65.receiver = self;
    v65.super_class = (Class)MOSummarizationParameters;
    v7 = [(MOSummarizationParameters *)&v65 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_configurationManager, a3);
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_DominantBundleOverlappingThreshold" withFallback:0.7];
      *(float *)&double v9 = v9;
      v8->_dominantBundle_overlappingThreshold = *(float *)&v9;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_DominantBundleMainActionSelectionThreshold" withFallback:0.6];
      *(float *)&double v10 = v10;
      v8->_dominantBundle_mainActionSelectionThreshold = *(float *)&v10;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_DominantBundleMediaPlaySessionDominantFactorThreshold" withFallback:0.8];
      *(float *)&double v11 = v11;
      v8->_dominantBundle_mediaPlaySessionDominantFactorThreshold = *(float *)&v11;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_DominantBundleMediaPlaySessionsOverlapsMinimumDistance" withFallback:0.5];
      *(float *)&double v12 = v12;
      v8->_dominantBundle_mediaPlaySessionsOverlapsMinimumDistance = *(float *)&v12;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Media_FirstPartyAppOverThirdPartyPlayTimePercentageThreshold" withFallback:0.05];
      *(float *)&double v13 = v13;
      v8->_mediaBundleFirstPartyPlayTimePercentageThreshold = *(float *)&v13;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_MediaBundleMinimumTotalPlayTimeThreshold" withFallback:60.0];
      *(float *)&double v14 = v14;
      v8->_mediaBundleMinimumTotalPlayTimeThreshold = *(float *)&v14;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_DominantBundleSuppressMediaBundleComparedWithActivityBundleThreshold" withFallback:0.8];
      *(float *)&double v15 = v15;
      v8->_dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold = *(float *)&v15;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_DominantBundleSuppressMediaBundleComparedWithHomeBundleThreshold" withFallback:0.8];
      *(float *)&double v16 = v16;
      v8->_dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold = *(float *)&v16;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_FineGranularityOutingBundlesAggregationDistanceThreshold" withFallback:1000.0];
      *(float *)&double v17 = v17;
      v8->_fineGranularity_outingBundlesAggregationDistanceThreshold = *(float *)&v17;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_FineGranularityOutingBundlesAggregationTimeIntervalThreshold" withFallback:900.0];
      *(float *)&double v18 = v18;
      v8->_fineGranularity_outingBundlesAggregationTimeIntervalThreshold = *(float *)&v18;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_FineGranularityOutingBundlesAggregationDistanceToClusterThreshold" withFallback:1500.0];
      *(float *)&double v19 = v19;
      v8->_fineGranularity_outingBundlesAggregationDistanceToClusterThreshold = *(float *)&v19;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_FineGranularityActivityBundlesAggregationTimeIntervalThreshold" withFallback:600.0];
      *(float *)&double v20 = v20;
      v8->_fineGranularity_activityBundlesAggregationTimeIntervalThreshold = *(float *)&v20;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_FineGranularityActivityBundlesDropForDurationThreshold" withFallback:0.8];
      *(float *)&double v21 = v21;
      v8->_fineGranularity_activityBundlesDropForDurationThreshold = *(float *)&v21;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_CoarseGranularityOutingBundlesAggregationDistanceThreshold" withFallback:5000.0];
      *(float *)&double v22 = v22;
      v8->_coarseGranularity_outingBundlesAggregationDistanceThreshold = *(float *)&v22;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_CoarseGranularityOutingBundlesAggregationTimeIntervalThreshold" withFallback:3600.0];
      *(float *)&double v23 = v23;
      v8->_coarseGranularity_outingBundlesAggregationTimeIntervalThreshold = *(float *)&v23;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_CoarseGranularityOutingBundlesAggregationDistanceToClusterThreshold" withFallback:8000.0];
      *(float *)&double v24 = v24;
      v8->_coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold = *(float *)&v24;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_MegaBundleDurationThresholdForAddingTimePrefix" withFallback:18000.0];
      *(float *)&double v25 = v25;
      v8->_megaBundleDurationThresholdForAddingTimePrefix = *(float *)&v25;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_CoarseGranularityContactMegaBundleLookBackDays" withFallback:7.0];
      *(float *)&double v26 = v26;
      v8->_coarseGranularity_contactMegaBundleLookBackDays = *(float *)&v26;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_CoarseGranularityContactBundleAggregationCallCountThreshold" withFallback:1.0];
      *(float *)&double v27 = v27;
      v8->_coarseGranularity_contactBundleAggregationCallCountThreshold = *(float *)&v27;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_CoarseGranularityContactBundleAggregationCallDurationThreshold" withFallback:300.0];
      *(float *)&double v28 = v28;
      v8->_coarseGranularity_contactBundleAggregationCallDurationThreshold = *(float *)&v28;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_CoarseGranularityContactBundleAggregationMessageCountThreshold" withFallback:5.0];
      *(float *)&double v29 = v29;
      v8->_coarseGranularity_contactBundleAggregationMessageCountThreshold = *(float *)&v29;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_CoarseGranularityContactBundleAggregationOutGoingMessageCountThreshold" withFallback:3.0];
      *(float *)&double v30 = v30;
      v8->_coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold = *(float *)&v30;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_CoarseGranularityMediaBundleAggregationPodcastPlayTimePercentageThreshold" withFallback:0.7];
      *(float *)&double v31 = v31;
      v8->_coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold = *(float *)&v31;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_CoarseGranularityMediaBundleAggregationPodcastTotalPlayTimeThreshold" withFallback:600.0];
      *(float *)&double v32 = v32;
      v8->_coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold = *(float *)&v32;
      [(MOConfigurationManagerBase *)v8->_configurationManager getDoubleSettingForKey:@"Summarization_MediaBundleMaxResourcesPerBundle" withFallback:26.0];
      v8->_mediaBundleMaxResourcesPerBundle = (uint64_t)v33;
      LODWORD(v33) = 1039516303;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_FineGranularityOutingBundlesExclusionGoodnessScoreThreshold" withFallback:v33];
      v8->_fineGranularity_outingBundlesExclusionGoodnessScoreThreshold = v34;
      LODWORD(v35) = 1036831949;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_FineGranularityOutingBundlesAggregationGoodnessScoreDeltaThreshold" withFallback:v35];
      v8->_fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold = v36;
      LODWORD(v37) = 1039516303;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_CoarseGranularityOutingBundlesExclusionGoodnessScoreThreshold" withFallback:v37];
      v8->_coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold = v38;
      LODWORD(v39) = 1036831949;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_CoarseGranularityOutingBundlesAggregationGoodnessScoreDeltaThreshold" withFallback:v39];
      v8->_coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold = v40;
      LODWORD(v41) = 1128792064;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_FineGranularityTransitBundlesDestinationOneWayRouteMinimumDistanceThreshold" withFallback:v41];
      v8->_fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold = v42;
      LODWORD(v43) = 1128792064;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_FineGranularityTransitBundlesDestinationMaximumDistanceThreshold" withFallback:v43];
      v8->_fineGranularity_transitBundlesDestinationMaximumDistanceThreshold = v44;
      LODWORD(v45) = 1142292480;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_FineGranularityTransitBundlesDestinationMaximumTimeThresholdPedestrian" withFallback:v45];
      v8->_fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian = v46;
      LODWORD(v47) = 1133903872;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_FineGranularityTransitBundlesDestinationMaximumTimeThresholdCycle" withFallback:v47];
      v8->_fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle = v48;
      LODWORD(v49) = 1142292480;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_FineGranularityTransitBundlesWorkoutMinimumDuration" withFallback:v49];
      v8->_fineGranularity_transitBundlesWorkoutMinimumDuration = v50;
      LODWORD(v51) = 1153138688;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_MotionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel" withFallback:v51];
      v8->_motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel = v52;
      LODWORD(v53) = 1163984896;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_MotionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace" withFallback:v53];
      v8->_motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace = v54;
      LODWORD(v55) = 1137180672;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_MotionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap" withFallback:v55];
      v8->_motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap = v56;
      LODWORD(v57) = 1041194025;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"Summarization_ActivitySummarySuppressionGoodnessScoreThreshold" withFallback:v57];
      v8->_activitySummary_suppressionGoodnessScoreThreshold = v58;
      LODWORD(v59) = 1180762112;
      [(MOConfigurationManagerBase *)v8->_configurationManager getFloatSettingForKey:@"EmotionAttachmentSummaryBundleDurationThreshold" withFallback:v59];
      v8->_emotionAttachmentBundleDurationThreshold = v60;
    }
    self = v8;
    v61 = self;
  }
  else
  {
    v62 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      -[MOSummarizationParameters initWithConfigurationManager:](v62);
    }

    v63 = +[NSAssertionHandler currentHandler];
    [v63 handleFailureInMethod:a2 object:self file:@"MOSummarizationParameters.m" lineNumber:135 description:@"Invalid parameter not satisfying: configurationManager"];

    v61 = 0;
  }

  return v61;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (float)dominantBundle_overlappingThreshold
{
  return self->_dominantBundle_overlappingThreshold;
}

- (void)setDominantBundle_overlappingThreshold:(float)a3
{
  self->_dominantBundle_overlappingThreshold = a3;
}

- (float)dominantBundle_mainActionSelectionThreshold
{
  return self->_dominantBundle_mainActionSelectionThreshold;
}

- (void)setDominantBundle_mainActionSelectionThreshold:(float)a3
{
  self->_dominantBundle_mainActionSelectionThreshold = a3;
}

- (float)dominantBundle_mediaPlaySessionDominantFactorThreshold
{
  return self->_dominantBundle_mediaPlaySessionDominantFactorThreshold;
}

- (void)setDominantBundle_mediaPlaySessionDominantFactorThreshold:(float)a3
{
  self->_dominantBundle_mediaPlaySessionDominantFactorThreshold = a3;
}

- (float)dominantBundle_mediaPlaySessionsOverlapsMinimumDistance
{
  return self->_dominantBundle_mediaPlaySessionsOverlapsMinimumDistance;
}

- (void)setDominantBundle_mediaPlaySessionsOverlapsMinimumDistance:(float)a3
{
  self->_dominantBundle_mediaPlaySessionsOverlapsMinimumDistance = a3;
}

- (float)dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold
{
  return self->_dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold;
}

- (void)setDominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold:(float)a3
{
  self->_dominantBundle_suppressMediaBundleComparedWithActivityBundleThreshold = a3;
}

- (float)dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold
{
  return self->_dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold;
}

- (void)setDominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold:(float)a3
{
  self->_dominantBundle_suppressMediaBundleComparedWithHomeBundleThreshold = a3;
}

- (float)fineGranularity_outingBundlesAggregationDistanceThreshold
{
  return self->_fineGranularity_outingBundlesAggregationDistanceThreshold;
}

- (void)setFineGranularity_outingBundlesAggregationDistanceThreshold:(float)a3
{
  self->_fineGranularity_outingBundlesAggregationDistanceThreshold = a3;
}

- (float)fineGranularity_outingBundlesAggregationTimeIntervalThreshold
{
  return self->_fineGranularity_outingBundlesAggregationTimeIntervalThreshold;
}

- (void)setFineGranularity_outingBundlesAggregationTimeIntervalThreshold:(float)a3
{
  self->_fineGranularity_outingBundlesAggregationTimeIntervalThreshold = a3;
}

- (float)fineGranularity_outingBundlesAggregationDistanceToClusterThreshold
{
  return self->_fineGranularity_outingBundlesAggregationDistanceToClusterThreshold;
}

- (void)setFineGranularity_outingBundlesAggregationDistanceToClusterThreshold:(float)a3
{
  self->_fineGranularity_outingBundlesAggregationDistanceToClusterThreshold = a3;
}

- (float)fineGranularity_activityBundlesAggregationTimeIntervalThreshold
{
  return self->_fineGranularity_activityBundlesAggregationTimeIntervalThreshold;
}

- (void)setFineGranularity_activityBundlesAggregationTimeIntervalThreshold:(float)a3
{
  self->_fineGranularity_activityBundlesAggregationTimeIntervalThreshold = a3;
}

- (float)fineGranularity_activityBundlesDropForDurationThreshold
{
  return self->_fineGranularity_activityBundlesDropForDurationThreshold;
}

- (void)setFineGranularity_activityBundlesDropForDurationThreshold:(float)a3
{
  self->_fineGranularity_activityBundlesDropForDurationThreshold = a3;
}

- (float)fineGranularity_outingBundlesExclusionGoodnessScoreThreshold
{
  return self->_fineGranularity_outingBundlesExclusionGoodnessScoreThreshold;
}

- (void)setFineGranularity_outingBundlesExclusionGoodnessScoreThreshold:(float)a3
{
  self->_fineGranularity_outingBundlesExclusionGoodnessScoreThreshold = a3;
}

- (float)fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold
{
  return self->_fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold;
}

- (void)setFineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold:(float)a3
{
  self->_fineGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold = a3;
}

- (float)fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold
{
  return self->_fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold;
}

- (void)setFineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold:(float)a3
{
  self->_fineGranularity_transitBundlesDestinationOneWayRouteMinimumDistanceThreshold = a3;
}

- (float)fineGranularity_transitBundlesDestinationMaximumDistanceThreshold
{
  return self->_fineGranularity_transitBundlesDestinationMaximumDistanceThreshold;
}

- (void)setFineGranularity_transitBundlesDestinationMaximumDistanceThreshold:(float)a3
{
  self->_fineGranularity_transitBundlesDestinationMaximumDistanceThreshold = a3;
}

- (float)fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian
{
  return self->_fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian;
}

- (void)setFineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian:(float)a3
{
  self->_fineGranularity_transitBundlesDestinationMaximumTimeThresholdPedestrian = a3;
}

- (float)fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle
{
  return self->_fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle;
}

- (void)setFineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle:(float)a3
{
  self->_fineGranularity_transitBundlesDestinationMaximumTimeThresholdCycle = a3;
}

- (float)fineGranularity_transitBundlesWorkoutMinimumDuration
{
  return self->_fineGranularity_transitBundlesWorkoutMinimumDuration;
}

- (void)setFineGranularity_transitBundlesWorkoutMinimumDuration:(float)a3
{
  self->_fineGranularity_transitBundlesWorkoutMinimumDuration = a3;
}

- (float)motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel
{
  return self->_motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel;
}

- (void)setMotionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel:(float)a3
{
  self->_motionActivityWalkBundlesMinimumDurationForNoAssetsOrPlaceLabel = a3;
}

- (float)motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace
{
  return self->_motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace;
}

- (void)setMotionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace:(float)a3
{
  self->_motionActivityWalkBundlesMaximumDurationBetweenWalksAtSamePlace = a3;
}

- (float)motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap
{
  return self->_motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap;
}

- (void)setMotionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap:(float)a3
{
  self->_motionActivityWalkBundlesMinimumRangeOfLocationForWalkAreaMap = a3;
}

- (float)coarseGranularity_outingBundlesAggregationDistanceThreshold
{
  return self->_coarseGranularity_outingBundlesAggregationDistanceThreshold;
}

- (void)setCoarseGranularity_outingBundlesAggregationDistanceThreshold:(float)a3
{
  self->_coarseGranularity_outingBundlesAggregationDistanceThreshold = a3;
}

- (float)coarseGranularity_outingBundlesAggregationTimeIntervalThreshold
{
  return self->_coarseGranularity_outingBundlesAggregationTimeIntervalThreshold;
}

- (void)setCoarseGranularity_outingBundlesAggregationTimeIntervalThreshold:(float)a3
{
  self->_coarseGranularity_outingBundlesAggregationTimeIntervalThreshold = a3;
}

- (float)coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold
{
  return self->_coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold;
}

- (void)setCoarseGranularity_outingBundlesAggregationDistanceToClusterThreshold:(float)a3
{
  self->_coarseGranularity_outingBundlesAggregationDistanceToClusterThreshold = a3;
}

- (float)coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold
{
  return self->_coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold;
}

- (void)setCoarseGranularity_outingBundlesExclusionGoodnessScoreThreshold:(float)a3
{
  self->_coarseGranularity_outingBundlesExclusionGoodnessScoreThreshold = a3;
}

- (float)coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold
{
  return self->_coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold;
}

- (void)setCoarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold:(float)a3
{
  self->_coarseGranularity_outingBundlesAggregationGoodnessScoreDeltaThreshold = a3;
}

- (float)megaBundleDurationThresholdForAddingTimePrefix
{
  return self->_megaBundleDurationThresholdForAddingTimePrefix;
}

- (void)setMegaBundleDurationThresholdForAddingTimePrefix:(float)a3
{
  self->_megaBundleDurationThresholdForAddingTimePrefix = a3;
}

- (NSDateInterval)aggregationDateInterval
{
  return self->_aggregationDateInterval;
}

- (void)setAggregationDateInterval:(id)a3
{
}

- (float)coarseGranularity_contactMegaBundleLookBackDays
{
  return self->_coarseGranularity_contactMegaBundleLookBackDays;
}

- (void)setCoarseGranularity_contactMegaBundleLookBackDays:(float)a3
{
  self->_coarseGranularity_contactMegaBundleLookBackDays = a3;
}

- (float)coarseGranularity_contactBundleAggregationCallCountThreshold
{
  return self->_coarseGranularity_contactBundleAggregationCallCountThreshold;
}

- (void)setCoarseGranularity_contactBundleAggregationCallCountThreshold:(float)a3
{
  self->_coarseGranularity_contactBundleAggregationCallCountThreshold = a3;
}

- (float)coarseGranularity_contactBundleAggregationCallDurationThreshold
{
  return self->_coarseGranularity_contactBundleAggregationCallDurationThreshold;
}

- (void)setCoarseGranularity_contactBundleAggregationCallDurationThreshold:(float)a3
{
  self->_coarseGranularity_contactBundleAggregationCallDurationThreshold = a3;
}

- (float)coarseGranularity_contactBundleAggregationMessageCountThreshold
{
  return self->_coarseGranularity_contactBundleAggregationMessageCountThreshold;
}

- (void)setCoarseGranularity_contactBundleAggregationMessageCountThreshold:(float)a3
{
  self->_coarseGranularity_contactBundleAggregationMessageCountThreshold = a3;
}

- (float)coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold
{
  return self->_coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold;
}

- (void)setCoarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold:(float)a3
{
  self->_coarseGranularity_contactBundleAggregationOutGoingMessageCountThreshold = a3;
}

- (float)coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold
{
  return self->_coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold;
}

- (void)setCoarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold:(float)a3
{
  self->_coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold = a3;
}

- (float)coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold
{
  return self->_coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold;
}

- (void)setCoarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold:(float)a3
{
  self->_coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold = a3;
}

- (int64_t)mediaBundleMaxResourcesPerBundle
{
  return self->_mediaBundleMaxResourcesPerBundle;
}

- (void)setMediaBundleMaxResourcesPerBundle:(int64_t)a3
{
  self->_mediaBundleMaxResourcesPerBundle = a3;
}

- (float)activitySummary_suppressionGoodnessScoreThreshold
{
  return self->_activitySummary_suppressionGoodnessScoreThreshold;
}

- (void)setActivitySummary_suppressionGoodnessScoreThreshold:(float)a3
{
  self->_activitySummary_suppressionGoodnessScoreThreshold = a3;
}

- (float)mediaBundleFirstPartyPlayTimePercentageThreshold
{
  return self->_mediaBundleFirstPartyPlayTimePercentageThreshold;
}

- (void)setMediaBundleFirstPartyPlayTimePercentageThreshold:(float)a3
{
  self->_mediaBundleFirstPartyPlayTimePercentageThreshold = a3;
}

- (float)mediaBundleMinimumTotalPlayTimeThreshold
{
  return self->_mediaBundleMinimumTotalPlayTimeThreshold;
}

- (void)setMediaBundleMinimumTotalPlayTimeThreshold:(float)a3
{
  self->_mediaBundleMinimumTotalPlayTimeThreshold = a3;
}

- (float)emotionAttachmentBundleDurationThreshold
{
  return self->_emotionAttachmentBundleDurationThreshold;
}

- (void)setEmotionAttachmentBundleDurationThreshold:(float)a3
{
  self->_emotionAttachmentBundleDurationThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregationDateInterval, 0);

  objc_storeStrong((id *)&self->_configurationManager, 0);
}

- (void)initWithConfigurationManager:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configurationManager", v1, 2u);
}

@end