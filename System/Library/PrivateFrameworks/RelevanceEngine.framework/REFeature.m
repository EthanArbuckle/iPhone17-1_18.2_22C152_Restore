@interface REFeature
+ (REFeature)activeEnergyCompletionFeature;
+ (REFeature)activeWorkoutFeature;
+ (REFeature)activitySummaryFeature;
+ (REFeature)appUsageFeature;
+ (REFeature)bluetoothDeviceFeature;
+ (REFeature)bulletinFeature;
+ (REFeature)companionAppUsageFeature;
+ (REFeature)conditionalFeature;
+ (REFeature)coreBehaviorAppIdentifierHashFeature;
+ (REFeature)coreBehaviorDayCoarsePredictionFeature;
+ (REFeature)coreBehaviorDayPredictionFeature;
+ (REFeature)coreBehaviorEventIdentifierHashFeature;
+ (REFeature)coreBehaviorLocationCoarsePredictionFeature;
+ (REFeature)coreBehaviorLocationPredictionFeature;
+ (REFeature)coreBehaviorShortcutTypeFeature;
+ (REFeature)coreBehaviorTimeCoarsePredictionFeature;
+ (REFeature)coreBehaviorTimePredictionFeature;
+ (REFeature)currentTimeFeature;
+ (REFeature)currentlyPlayingFromAppFeature;
+ (REFeature)currentlyPlayingMediaDonationFeature;
+ (REFeature)dailyAverageWorkoutCountFeature;
+ (REFeature)dailyRoutineFeature;
+ (REFeature)dataSourceFeature;
+ (REFeature)dateFeature;
+ (REFeature)dateInformationalFeature;
+ (REFeature)dateOccursTodayFeature;
+ (REFeature)dayOfWeekFeature;
+ (REFeature)deviceMotionFeature;
+ (REFeature)exerciseTimeCompletionFeature;
+ (REFeature)featureWithName:(id)a3 featureType:(unint64_t)a4;
+ (REFeature)geofenceFeature;
+ (REFeature)interactionFeature;
+ (REFeature)isConnectedToBluetoothSpeakerFeature;
+ (REFeature)isConnectedToCarFeature;
+ (REFeature)isDeveloperDonationFeature;
+ (REFeature)isInDailyRoutineFeature;
+ (REFeature)isSiriActionFeature;
+ (REFeature)isStationaryFeature;
+ (REFeature)isWeekendFeature;
+ (REFeature)itemIdentifierFeature;
+ (REFeature)knownLocationOfInterestFeature;
+ (REFeature)locationFeature;
+ (REFeature)locationOfInterestFeature;
+ (REFeature)motionFeature;
+ (REFeature)negativeSentimentAnalysisFeature;
+ (REFeature)noContentFeature;
+ (REFeature)nowPlayingStateFeature;
+ (REFeature)performedWorkoutCountFeature;
+ (REFeature)portraitFeature;
+ (REFeature)priorityFeature;
+ (REFeature)recentSiriActionFeature;
+ (REFeature)relevanceThresholdFeature;
+ (REFeature)sectionFeature;
+ (REFeature)sentimentAnalysisCertaintyFeature;
+ (REFeature)sentimentAnalysisFeature;
+ (REFeature)sessionFeature;
+ (REFeature)siriActionDailyAveragePerformedCountFeature;
+ (REFeature)siriActionHasRelevanceProvidersFeature;
+ (REFeature)siriActionPerformedCountFeature;
+ (REFeature)siriActionRoleFeature;
+ (REFeature)siriDomainFeature;
+ (REFeature)standHourCompletionFeature;
+ (REFeature)travelingFeature;
+ (REFeature)workoutStateFeature;
+ (id)crossedFeatureWithFeatures:(id)a3;
+ (id)featuresFromSource:(id)a3;
+ (id)featuresFromSource:(id)a3 withNames:(id)a4;
+ (id)featuresFromSourceAtPath:(id)a3;
+ (id)featuresFromSourceAtPath:(id)a3 withNames:(id)a4;
+ (id)forcedFeature;
+ (id)groupFeature;
+ (id)systemFeatureNames;
+ (id)transformedFeatureWithTransformer:(id)a3 features:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (id)_dependentFeatures;
- (id)_rootFeatures;
- (id)featureByUsingTransformer:(id)a3;
- (int64_t)_bitCount;
- (unint64_t)featureType;
- (unint64_t)hash;
@end

@implementation REFeature

- (id)_dependentFeatures
{
  return +[REFeatureSet featureSet];
}

+ (REFeature)featureWithName:(id)a3 featureType:(unint64_t)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = [[_REConcreteFeature alloc] initWithName:v5 featureType:a4];
  }
  else
  {
    v6 = 0;
  }
  return (REFeature *)v6;
}

+ (id)groupFeature
{
  if (groupFeature_onceToken != -1) {
    dispatch_once(&groupFeature_onceToken, &__block_literal_global_140);
  }
  v2 = (void *)groupFeature_SystemFeature;
  return v2;
}

+ (id)forcedFeature
{
  if (forcedFeature_onceToken != -1) {
    dispatch_once(&forcedFeature_onceToken, &__block_literal_global_120);
  }
  v2 = (void *)forcedFeature_SystemFeature;
  return v2;
}

+ (REFeature)sentimentAnalysisFeature
{
  if (sentimentAnalysisFeature_onceToken != -1) {
    dispatch_once(&sentimentAnalysisFeature_onceToken, &__block_literal_global_150);
  }
  v2 = (void *)sentimentAnalysisFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)sentimentAnalysisCertaintyFeature
{
  if (sentimentAnalysisCertaintyFeature_onceToken != -1) {
    dispatch_once(&sentimentAnalysisCertaintyFeature_onceToken, &__block_literal_global_160);
  }
  v2 = (void *)sentimentAnalysisCertaintyFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)portraitFeature
{
  if (portraitFeature_onceToken != -1) {
    dispatch_once(&portraitFeature_onceToken, &__block_literal_global_165);
  }
  v2 = (void *)portraitFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)negativeSentimentAnalysisFeature
{
  if (negativeSentimentAnalysisFeature_onceToken != -1) {
    dispatch_once(&negativeSentimentAnalysisFeature_onceToken, &__block_literal_global_155);
  }
  v2 = (void *)negativeSentimentAnalysisFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)priorityFeature
{
  if (priorityFeature_onceToken != -1) {
    dispatch_once(&priorityFeature_onceToken, &__block_literal_global_75);
  }
  v2 = (void *)priorityFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)locationFeature
{
  if (locationFeature_onceToken != -1) {
    dispatch_once(&locationFeature_onceToken, &__block_literal_global_65_0);
  }
  v2 = (void *)locationFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)geofenceFeature
{
  if (geofenceFeature_onceToken != -1) {
    dispatch_once(&geofenceFeature_onceToken, &__block_literal_global_70);
  }
  v2 = (void *)geofenceFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)dateFeature
{
  if (dateFeature_onceToken != -1) {
    dispatch_once(&dateFeature_onceToken, &__block_literal_global_50_0);
  }
  v2 = (void *)dateFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)dataSourceFeature
{
  if (dataSourceFeature_onceToken != -1) {
    dispatch_once(&dataSourceFeature_onceToken, &__block_literal_global_45_0);
  }
  v2 = (void *)dataSourceFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)dailyRoutineFeature
{
  if (dailyRoutineFeature_onceToken != -1) {
    dispatch_once(&dailyRoutineFeature_onceToken, &__block_literal_global_125_0);
  }
  v2 = (void *)dailyRoutineFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (id)transformedFeatureWithTransformer:(id)a3 features:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 _validateWithFeatures:v6] & 1) == 0) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Feature Transformer %@ unable to support features %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  }
  uint64_t v13 = [v5 _featureCount];
  if (v13 != [v6 count])
  {
    v14 = (void *)*MEMORY[0x263EFF498];
    uint64_t v15 = [v5 _featureCount];
    [v6 count];
    RERaiseInternalException(v14, @"Expected %lu number of features. Received %lu.", v16, v17, v18, v19, v20, v21, v15);
  }
  v22 = [[_RETransformedFeature alloc] initWithTransformer:v5 features:v6];

  return v22;
}

+ (id)crossedFeatureWithFeatures:(id)a3
{
  id v3 = a3;
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = [[_RECrossedFeature alloc] initWithFeatures:v4];

  return v5;
}

uint64_t __56__REFeature_coreBehaviorLocationCoarsePredictionFeature__block_invoke()
{
  coreBehaviorLocationCoarsePredictionFeature_SystemFeature = +[REFeature featureWithName:@"coreBehaviorLocationCoarsePrediction" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __52__REFeature_coreBehaviorTimeCoarsePredictionFeature__block_invoke()
{
  coreBehaviorTimeCoarsePredictionFeature_SystemFeature = +[REFeature featureWithName:@"coreBehaviorTimeCoarsePrediction" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __51__REFeature_coreBehaviorDayCoarsePredictionFeature__block_invoke()
{
  coreBehaviorDayCoarsePredictionFeature_SystemFeature = +[REFeature featureWithName:@"coreBehaviorDayCoarsePrediction" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __50__REFeature_coreBehaviorLocationPredictionFeature__block_invoke()
{
  coreBehaviorLocationPredictionFeature_SystemFeature = +[REFeature featureWithName:@"coreBehaviorLocationPrediction" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __49__REFeature_isConnectedToBluetoothSpeakerFeature__block_invoke()
{
  isConnectedToBluetoothSpeakerFeature_SystemFeature = +[REFeature featureWithName:@"isConnectedToBluetoothSpeaker" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __49__REFeature_currentlyPlayingMediaDonationFeature__block_invoke()
{
  currentlyPlayingMediaDonationFeature_SystemFeature = +[REFeature featureWithName:@"currentlyPlayingMediaDonation" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __46__REFeature_sentimentAnalysisCertaintyFeature__block_invoke()
{
  sentimentAnalysisCertaintyFeature_SystemFeature = +[REFeature featureWithName:@"sentimentAnalysisCertainty" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __46__REFeature_coreBehaviorTimePredictionFeature__block_invoke()
{
  coreBehaviorTimePredictionFeature_SystemFeature = +[REFeature featureWithName:@"coreBehaviorTimePrediction" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __45__REFeature_negativeSentimentAnalysisFeature__block_invoke()
{
  negativeSentimentAnalysisFeature_SystemFeature = +[REFeature featureWithName:@"negativeSentimentAnalysis" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __45__REFeature_coreBehaviorDayPredictionFeature__block_invoke()
{
  coreBehaviorDayPredictionFeature_SystemFeature = +[REFeature featureWithName:@"coreBehaviorDayPrediction" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __44__REFeature_siriActionPerformedCountFeature__block_invoke()
{
  siriActionPerformedCountFeature_SystemFeature = +[REFeature featureWithName:@"siriActionPerformedCount" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __44__REFeature_dailyAverageWorkoutCountFeature__block_invoke()
{
  dailyAverageWorkoutCountFeature_SystemFeature = +[REFeature featureWithName:@"dailyAverageWorkoutCount" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __43__REFeature_knownLocationOfInterestFeature__block_invoke()
{
  knownLocationOfInterestFeature_SystemFeature = +[REFeature featureWithName:@"knownLocationOfInterest" featureType:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __43__REFeature_currentlyPlayingFromAppFeature__block_invoke()
{
  currentlyPlayingFromAppFeature_SystemFeature = +[REFeature featureWithName:@"currentlyPlayingFromApp" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __42__REFeature_exerciseTimeCompletionFeature__block_invoke()
{
  exerciseTimeCompletionFeature_SystemFeature = +[REFeature featureWithName:@"exerciseTimeCompletion" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __42__REFeature_activeEnergyCompletionFeature__block_invoke()
{
  activeEnergyCompletionFeature_SystemFeature = +[REFeature featureWithName:@"activeEnergyCompletion" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __41__REFeature_performedWorkoutCountFeature__block_invoke()
{
  performedWorkoutCountFeature_SystemFeature = +[REFeature featureWithName:@"performedWorkoutCount" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __39__REFeature_standHourCompletionFeature__block_invoke()
{
  standHourCompletionFeature_SystemFeature = +[REFeature featureWithName:@"standHourCompletion" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __38__REFeature_relevanceThresholdFeature__block_invoke()
{
  relevanceThresholdFeature_SystemFeature = +[REFeature featureWithName:@"relevanceThreshold" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __38__REFeature_locationOfInterestFeature__block_invoke()
{
  locationOfInterestFeature_SystemFeature = +[REFeature featureWithName:@"locationOfInterest" featureType:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __37__REFeature_sentimentAnalysisFeature__block_invoke()
{
  sentimentAnalysisFeature_SystemFeature = +[REFeature featureWithName:@"sentimentAnalysis" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __37__REFeature_dateInformationalFeature__block_invoke()
{
  dateInformationalFeature_SystemFeature = +[REFeature featureWithName:@"dateInformational" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __36__REFeature_recentSiriActionFeature__block_invoke()
{
  recentSiriActionFeature_SystemFeature = +[REFeature featureWithName:@"recentSiriAction" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __36__REFeature_isInDailyRoutineFeature__block_invoke()
{
  isInDailyRoutineFeature_SystemFeature = +[REFeature featureWithName:@"isInDailyRoutine" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __36__REFeature_isConnectedToCarFeature__block_invoke()
{
  isConnectedToCarFeature_SystemFeature = +[REFeature featureWithName:@"isConnectedToCar" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __35__REFeature_nowPlayingStateFeature__block_invoke()
{
  nowPlayingStateFeature_SystemFeature = +[REFeature featureWithName:@"nowPlayingState" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __35__REFeature_dateOccursTodayFeature__block_invoke()
{
  dateOccursTodayFeature_SystemFeature = +[REFeature featureWithName:@"dateOccursToday" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __35__REFeature_bluetoothDeviceFeature__block_invoke()
{
  bluetoothDeviceFeature_SystemFeature = +[REFeature featureWithName:@"bluetoothDevice" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __35__REFeature_activitySummaryFeature__block_invoke()
{
  activitySummaryFeature_SystemFeature = +[REFeature featureWithName:@"activitySummary" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __33__REFeature_activeWorkoutFeature__block_invoke()
{
  activeWorkoutFeature_SystemFeature = +[REFeature featureWithName:@"activeWorkout" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __32__REFeature_workoutStateFeature__block_invoke()
{
  workoutStateFeature_SystemFeature = +[REFeature featureWithName:@"workoutState" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __32__REFeature_isStationaryFeature__block_invoke()
{
  isStationaryFeature_SystemFeature = +[REFeature featureWithName:@"isStationary" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __32__REFeature_deviceMotionFeature__block_invoke()
{
  deviceMotionFeature_SystemFeature = +[REFeature featureWithName:@"deviceMotion" featureType:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __32__REFeature_dailyRoutineFeature__block_invoke()
{
  dailyRoutineFeature_SystemFeature = +[REFeature featureWithName:@"dailyRoutine" featureType:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __31__REFeature_interactionFeature__block_invoke()
{
  interactionFeature_SystemFeature = +[REFeature featureWithName:@"interaction" featureType:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __31__REFeature_currentTimeFeature__block_invoke()
{
  currentTimeFeature_SystemFeature = +[REFeature featureWithName:@"currentTime" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __31__REFeature_conditionalFeature__block_invoke()
{
  conditionalFeature_SystemFeature = +[REFeature featureWithName:@"conditional" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __30__REFeature_siriDomainFeature__block_invoke()
{
  siriDomainFeature_SystemFeature = +[REFeature featureWithName:@"siriDomain" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __30__REFeature_dataSourceFeature__block_invoke()
{
  dataSourceFeature_SystemFeature = +[REFeature featureWithName:@"dataSource" featureType:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __29__REFeature_travelingFeature__block_invoke()
{
  travelingFeature_SystemFeature = +[REFeature featureWithName:@"traveling" featureType:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __29__REFeature_noContentFeature__block_invoke()
{
  noContentFeature_SystemFeature = +[REFeature featureWithName:@"noContent" featureType:0];
  return MEMORY[0x270F9A758]();
}

uint64_t __29__REFeature_isWeekendFeature__block_invoke()
{
  isWeekendFeature_SystemFeature = +[REFeature featureWithName:@"isWeekend" featureType:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __29__REFeature_dayOfWeekFeature__block_invoke()
{
  dayOfWeekFeature_SystemFeature = +[REFeature featureWithName:@"dayOfWeek" featureType:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __28__REFeature_priorityFeature__block_invoke()
{
  priorityFeature_SystemFeature = +[REFeature featureWithName:@"priority" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __28__REFeature_portraitFeature__block_invoke()
{
  portraitFeature_SystemFeature = +[REFeature featureWithName:@"portrait" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __28__REFeature_locationFeature__block_invoke()
{
  locationFeature_SystemFeature = +[REFeature featureWithName:@"location" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __28__REFeature_geofenceFeature__block_invoke()
{
  geofenceFeature_SystemFeature = +[REFeature featureWithName:@"geofence" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __28__REFeature_appUsageFeature__block_invoke()
{
  appUsageFeature_SystemFeature = +[REFeature featureWithName:@"appUsage" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __27__REFeature_sessionFeature__block_invoke()
{
  sessionFeature_SystemFeature = +[REFeature featureWithName:@"session" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __27__REFeature_sectionFeature__block_invoke()
{
  sectionFeature_SystemFeature = +[REFeature featureWithName:@"section" featureType:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __26__REFeature_motionFeature__block_invoke()
{
  motionFeature_SystemFeature = +[REFeature featureWithName:@"motion" featureType:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __26__REFeature_forcedFeature__block_invoke()
{
  forcedFeature_SystemFeature = +[REFeature featureWithName:@"forced" featureType:2];
  return MEMORY[0x270F9A758]();
}

uint64_t __25__REFeature_groupFeature__block_invoke()
{
  groupFeature_SystemFeature = +[REFeature featureWithName:@"group" featureType:1];
  return MEMORY[0x270F9A758]();
}

uint64_t __24__REFeature_dateFeature__block_invoke()
{
  dateFeature_SystemFeature = +[REFeature featureWithName:@"date" featureType:2];
  return MEMORY[0x270F9A758]();
}

+ (REFeature)workoutStateFeature
{
  if (workoutStateFeature_onceToken != -1) {
    dispatch_once(&workoutStateFeature_onceToken, &__block_literal_global_260);
  }
  v2 = (void *)workoutStateFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)travelingFeature
{
  if (travelingFeature_onceToken != -1) {
    dispatch_once(&travelingFeature_onceToken, &__block_literal_global_185);
  }
  v2 = (void *)travelingFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)standHourCompletionFeature
{
  if (standHourCompletionFeature_onceToken != -1) {
    dispatch_once(&standHourCompletionFeature_onceToken, &__block_literal_global_285);
  }
  v2 = (void *)standHourCompletionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)siriDomainFeature
{
  if (siriDomainFeature_onceToken != -1) {
    dispatch_once(&siriDomainFeature_onceToken, &__block_literal_global_115_0);
  }
  v2 = (void *)siriDomainFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)siriActionPerformedCountFeature
{
  if (siriActionPerformedCountFeature_onceToken != -1) {
    dispatch_once(&siriActionPerformedCountFeature_onceToken, &__block_literal_global_230);
  }
  v2 = (void *)siriActionPerformedCountFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)sessionFeature
{
  if (sessionFeature_onceToken != -1) {
    dispatch_once(&sessionFeature_onceToken, &__block_literal_global_135);
  }
  v2 = (void *)sessionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)sectionFeature
{
  if (sectionFeature_onceToken != -1) {
    dispatch_once(&sectionFeature_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)sectionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)relevanceThresholdFeature
{
  if (relevanceThresholdFeature_onceToken != -1) {
    dispatch_once(&relevanceThresholdFeature_onceToken, &__block_literal_global_170);
  }
  v2 = (void *)relevanceThresholdFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)recentSiriActionFeature
{
  if (recentSiriActionFeature_onceToken != -1) {
    dispatch_once(&recentSiriActionFeature_onceToken, &__block_literal_global_145_0);
  }
  v2 = (void *)recentSiriActionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)performedWorkoutCountFeature
{
  if (performedWorkoutCountFeature_onceToken != -1) {
    dispatch_once(&performedWorkoutCountFeature_onceToken, &__block_literal_global_270);
  }
  v2 = (void *)performedWorkoutCountFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)nowPlayingStateFeature
{
  if (nowPlayingStateFeature_onceToken != -1) {
    dispatch_once(&nowPlayingStateFeature_onceToken, &__block_literal_global_235);
  }
  v2 = (void *)nowPlayingStateFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)noContentFeature
{
  if (noContentFeature_onceToken != -1) {
    dispatch_once(&noContentFeature_onceToken, &__block_literal_global_105);
  }
  v2 = (void *)noContentFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)motionFeature
{
  if (motionFeature_onceToken != -1) {
    dispatch_once(&motionFeature_onceToken, &__block_literal_global_200);
  }
  v2 = (void *)motionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)locationOfInterestFeature
{
  if (locationOfInterestFeature_onceToken != -1) {
    dispatch_once(&locationOfInterestFeature_onceToken, &__block_literal_global_175);
  }
  v2 = (void *)locationOfInterestFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)knownLocationOfInterestFeature
{
  if (knownLocationOfInterestFeature_onceToken != -1) {
    dispatch_once(&knownLocationOfInterestFeature_onceToken, &__block_literal_global_180);
  }
  v2 = (void *)knownLocationOfInterestFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)isWeekendFeature
{
  if (isWeekendFeature_onceToken != -1) {
    dispatch_once(&isWeekendFeature_onceToken, &__block_literal_global_100);
  }
  v2 = (void *)isWeekendFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)isStationaryFeature
{
  if (isStationaryFeature_onceToken != -1) {
    dispatch_once(&isStationaryFeature_onceToken, &__block_literal_global_190);
  }
  v2 = (void *)isStationaryFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)isInDailyRoutineFeature
{
  if (isInDailyRoutineFeature_onceToken != -1) {
    dispatch_once(&isInDailyRoutineFeature_onceToken, &__block_literal_global_130);
  }
  v2 = (void *)isInDailyRoutineFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)isConnectedToCarFeature
{
  if (isConnectedToCarFeature_onceToken != -1) {
    dispatch_once(&isConnectedToCarFeature_onceToken, &__block_literal_global_305);
  }
  v2 = (void *)isConnectedToCarFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)isConnectedToBluetoothSpeakerFeature
{
  if (isConnectedToBluetoothSpeakerFeature_onceToken != -1) {
    dispatch_once(&isConnectedToBluetoothSpeakerFeature_onceToken, &__block_literal_global_310);
  }
  v2 = (void *)isConnectedToBluetoothSpeakerFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)interactionFeature
{
  if (interactionFeature_onceToken != -1) {
    dispatch_once(&interactionFeature_onceToken, &__block_literal_global_80);
  }
  v2 = (void *)interactionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)exerciseTimeCompletionFeature
{
  if (exerciseTimeCompletionFeature_onceToken != -1) {
    dispatch_once(&exerciseTimeCompletionFeature_onceToken, &__block_literal_global_280);
  }
  v2 = (void *)exerciseTimeCompletionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)deviceMotionFeature
{
  if (deviceMotionFeature_onceToken != -1) {
    dispatch_once(&deviceMotionFeature_onceToken, &__block_literal_global_195);
  }
  v2 = (void *)deviceMotionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)dayOfWeekFeature
{
  if (dayOfWeekFeature_onceToken != -1) {
    dispatch_once(&dayOfWeekFeature_onceToken, &__block_literal_global_95_0);
  }
  v2 = (void *)dayOfWeekFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)dateOccursTodayFeature
{
  if (dateOccursTodayFeature_onceToken != -1) {
    dispatch_once(&dateOccursTodayFeature_onceToken, &__block_literal_global_60_0);
  }
  v2 = (void *)dateOccursTodayFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)dateInformationalFeature
{
  if (dateInformationalFeature_onceToken != -1) {
    dispatch_once(&dateInformationalFeature_onceToken, &__block_literal_global_55);
  }
  v2 = (void *)dateInformationalFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)dailyAverageWorkoutCountFeature
{
  if (dailyAverageWorkoutCountFeature_onceToken != -1) {
    dispatch_once(&dailyAverageWorkoutCountFeature_onceToken, &__block_literal_global_265);
  }
  v2 = (void *)dailyAverageWorkoutCountFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)currentlyPlayingMediaDonationFeature
{
  if (currentlyPlayingMediaDonationFeature_onceToken != -1) {
    dispatch_once(&currentlyPlayingMediaDonationFeature_onceToken, &__block_literal_global_240);
  }
  v2 = (void *)currentlyPlayingMediaDonationFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)currentlyPlayingFromAppFeature
{
  if (currentlyPlayingFromAppFeature_onceToken != -1) {
    dispatch_once(&currentlyPlayingFromAppFeature_onceToken, &__block_literal_global_245);
  }
  v2 = (void *)currentlyPlayingFromAppFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)currentTimeFeature
{
  if (currentTimeFeature_onceToken != -1) {
    dispatch_once(&currentTimeFeature_onceToken, &__block_literal_global_90_0);
  }
  v2 = (void *)currentTimeFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)coreBehaviorTimePredictionFeature
{
  if (coreBehaviorTimePredictionFeature_onceToken != -1) {
    dispatch_once(&coreBehaviorTimePredictionFeature_onceToken, &__block_literal_global_335_0);
  }
  v2 = (void *)coreBehaviorTimePredictionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)coreBehaviorTimeCoarsePredictionFeature
{
  if (coreBehaviorTimeCoarsePredictionFeature_onceToken != -1) {
    dispatch_once(&coreBehaviorTimeCoarsePredictionFeature_onceToken, &__block_literal_global_340);
  }
  v2 = (void *)coreBehaviorTimeCoarsePredictionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)coreBehaviorLocationPredictionFeature
{
  if (coreBehaviorLocationPredictionFeature_onceToken != -1) {
    dispatch_once(&coreBehaviorLocationPredictionFeature_onceToken, &__block_literal_global_355);
  }
  v2 = (void *)coreBehaviorLocationPredictionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)coreBehaviorLocationCoarsePredictionFeature
{
  if (coreBehaviorLocationCoarsePredictionFeature_onceToken != -1) {
    dispatch_once(&coreBehaviorLocationCoarsePredictionFeature_onceToken, &__block_literal_global_360);
  }
  v2 = (void *)coreBehaviorLocationCoarsePredictionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)coreBehaviorDayPredictionFeature
{
  if (coreBehaviorDayPredictionFeature_onceToken != -1) {
    dispatch_once(&coreBehaviorDayPredictionFeature_onceToken, &__block_literal_global_345);
  }
  v2 = (void *)coreBehaviorDayPredictionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)coreBehaviorDayCoarsePredictionFeature
{
  if (coreBehaviorDayCoarsePredictionFeature_onceToken != -1) {
    dispatch_once(&coreBehaviorDayCoarsePredictionFeature_onceToken, &__block_literal_global_350);
  }
  v2 = (void *)coreBehaviorDayCoarsePredictionFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)conditionalFeature
{
  if (conditionalFeature_onceToken != -1) {
    dispatch_once(&conditionalFeature_onceToken, &__block_literal_global_110);
  }
  v2 = (void *)conditionalFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)bluetoothDeviceFeature
{
  if (bluetoothDeviceFeature_onceToken != -1) {
    dispatch_once(&bluetoothDeviceFeature_onceToken, &__block_literal_global_315);
  }
  v2 = (void *)bluetoothDeviceFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)appUsageFeature
{
  if (appUsageFeature_onceToken != -1) {
    dispatch_once(&appUsageFeature_onceToken, &__block_literal_global_85);
  }
  v2 = (void *)appUsageFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)activitySummaryFeature
{
  if (activitySummaryFeature_onceToken != -1) {
    dispatch_once(&activitySummaryFeature_onceToken, &__block_literal_global_290);
  }
  v2 = (void *)activitySummaryFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)activeWorkoutFeature
{
  if (activeWorkoutFeature_onceToken != -1) {
    dispatch_once(&activeWorkoutFeature_onceToken, &__block_literal_global_255);
  }
  v2 = (void *)activeWorkoutFeature_SystemFeature;
  return (REFeature *)v2;
}

+ (REFeature)activeEnergyCompletionFeature
{
  if (activeEnergyCompletionFeature_onceToken != -1) {
    dispatch_once(&activeEnergyCompletionFeature_onceToken, &__block_literal_global_275);
  }
  v2 = (void *)activeEnergyCompletionFeature_SystemFeature;
  return (REFeature *)v2;
}

- (id)featureByUsingTransformer:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v8 = self;
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:&v8 count:1];
  id v6 = +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v4, v5, v8, v9);

  return v6;
}

- (NSString)name
{
  return (NSString *)&stru_26CFA57D0;
}

- (unint64_t)featureType
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REFeature *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(REFeature *)self name];
      id v7 = [(REFeature *)v5 name];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8)
        {
          BOOL v9 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      unint64_t v10 = [(REFeature *)self featureType];
      BOOL v9 = v10 == [(REFeature *)v5 featureType];
      goto LABEL_10;
    }
    BOOL v9 = 0;
  }
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  id v3 = [(REFeature *)self name];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(REFeature *)self featureType] ^ v4;

  return v5;
}

- (int64_t)_bitCount
{
  return -1;
}

- (id)_rootFeatures
{
  return +[REFeatureSet featureSet];
}

+ (REFeature)itemIdentifierFeature
{
  if (itemIdentifierFeature_onceToken != -1) {
    dispatch_once(&itemIdentifierFeature_onceToken, &__block_literal_global_205);
  }
  v2 = (void *)itemIdentifierFeature_SystemFeature;
  return (REFeature *)v2;
}

uint64_t __34__REFeature_itemIdentifierFeature__block_invoke()
{
  uint64_t v0 = +[REFeature featureWithName:@"itemIdentifier" featureType:1];
  uint64_t v1 = itemIdentifierFeature_SystemFeature;
  itemIdentifierFeature_SystemFeature = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (REFeature)isSiriActionFeature
{
  if (isSiriActionFeature_onceToken != -1) {
    dispatch_once(&isSiriActionFeature_onceToken, &__block_literal_global_210);
  }
  v2 = (void *)isSiriActionFeature_SystemFeature;
  return (REFeature *)v2;
}

uint64_t __32__REFeature_isSiriActionFeature__block_invoke()
{
  uint64_t v0 = +[REFeature featureWithName:@"isSiriAction" featureType:0];
  uint64_t v1 = isSiriActionFeature_SystemFeature;
  isSiriActionFeature_SystemFeature = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (REFeature)isDeveloperDonationFeature
{
  if (isDeveloperDonationFeature_onceToken != -1) {
    dispatch_once(&isDeveloperDonationFeature_onceToken, &__block_literal_global_215);
  }
  v2 = (void *)isDeveloperDonationFeature_SystemFeature;
  return (REFeature *)v2;
}

uint64_t __39__REFeature_isDeveloperDonationFeature__block_invoke()
{
  uint64_t v0 = +[REFeature featureWithName:@"isDeveloperDonation" featureType:0];
  uint64_t v1 = isDeveloperDonationFeature_SystemFeature;
  isDeveloperDonationFeature_SystemFeature = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (REFeature)siriActionHasRelevanceProvidersFeature
{
  if (siriActionHasRelevanceProvidersFeature_onceToken != -1) {
    dispatch_once(&siriActionHasRelevanceProvidersFeature_onceToken, &__block_literal_global_220);
  }
  v2 = (void *)siriActionHasRelevanceProvidersFeature_SystemFeature;
  return (REFeature *)v2;
}

uint64_t __51__REFeature_siriActionHasRelevanceProvidersFeature__block_invoke()
{
  uint64_t v0 = +[REFeature featureWithName:@"siriActionHasRelevanceProviders" featureType:0];
  uint64_t v1 = siriActionHasRelevanceProvidersFeature_SystemFeature;
  siriActionHasRelevanceProvidersFeature_SystemFeature = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (REFeature)siriActionDailyAveragePerformedCountFeature
{
  if (siriActionDailyAveragePerformedCountFeature_onceToken != -1) {
    dispatch_once(&siriActionDailyAveragePerformedCountFeature_onceToken, &__block_literal_global_225);
  }
  v2 = (void *)siriActionDailyAveragePerformedCountFeature_SystemFeature;
  return (REFeature *)v2;
}

uint64_t __56__REFeature_siriActionDailyAveragePerformedCountFeature__block_invoke()
{
  uint64_t v0 = +[REFeature featureWithName:@"siriActionDailyAveragePerformedCount" featureType:2];
  uint64_t v1 = siriActionDailyAveragePerformedCountFeature_SystemFeature;
  siriActionDailyAveragePerformedCountFeature_SystemFeature = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (REFeature)siriActionRoleFeature
{
  if (siriActionRoleFeature_onceToken != -1) {
    dispatch_once(&siriActionRoleFeature_onceToken, &__block_literal_global_250);
  }
  v2 = (void *)siriActionRoleFeature_SystemFeature;
  return (REFeature *)v2;
}

uint64_t __34__REFeature_siriActionRoleFeature__block_invoke()
{
  uint64_t v0 = +[REFeature featureWithName:@"siriActionRole" featureType:1];
  uint64_t v1 = siriActionRoleFeature_SystemFeature;
  siriActionRoleFeature_SystemFeature = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (REFeature)bulletinFeature
{
  if (bulletinFeature_onceToken != -1) {
    dispatch_once(&bulletinFeature_onceToken, &__block_literal_global_295);
  }
  v2 = (void *)bulletinFeature_SystemFeature;
  return (REFeature *)v2;
}

uint64_t __28__REFeature_bulletinFeature__block_invoke()
{
  uint64_t v0 = +[REFeature featureWithName:@"bulletin" featureType:0];
  uint64_t v1 = bulletinFeature_SystemFeature;
  bulletinFeature_SystemFeature = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (REFeature)companionAppUsageFeature
{
  if (companionAppUsageFeature_onceToken != -1) {
    dispatch_once(&companionAppUsageFeature_onceToken, &__block_literal_global_300);
  }
  v2 = (void *)companionAppUsageFeature_SystemFeature;
  return (REFeature *)v2;
}

uint64_t __37__REFeature_companionAppUsageFeature__block_invoke()
{
  uint64_t v0 = +[REFeature featureWithName:@"companionAppUsage" featureType:2];
  uint64_t v1 = companionAppUsageFeature_SystemFeature;
  companionAppUsageFeature_SystemFeature = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (REFeature)coreBehaviorShortcutTypeFeature
{
  if (coreBehaviorShortcutTypeFeature_onceToken != -1) {
    dispatch_once(&coreBehaviorShortcutTypeFeature_onceToken, &__block_literal_global_320);
  }
  v2 = (void *)coreBehaviorShortcutTypeFeature_SystemFeature;
  return (REFeature *)v2;
}

uint64_t __44__REFeature_coreBehaviorShortcutTypeFeature__block_invoke()
{
  uint64_t v0 = +[REFeature featureWithName:@"coreBehaviorShortcutType" featureType:1];
  uint64_t v1 = coreBehaviorShortcutTypeFeature_SystemFeature;
  coreBehaviorShortcutTypeFeature_SystemFeature = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (REFeature)coreBehaviorEventIdentifierHashFeature
{
  if (coreBehaviorEventIdentifierHashFeature_onceToken != -1) {
    dispatch_once(&coreBehaviorEventIdentifierHashFeature_onceToken, &__block_literal_global_325);
  }
  v2 = (void *)coreBehaviorEventIdentifierHashFeature_SystemFeature;
  return (REFeature *)v2;
}

uint64_t __51__REFeature_coreBehaviorEventIdentifierHashFeature__block_invoke()
{
  uint64_t v0 = +[REFeature featureWithName:@"coreBehaviorEventIdentifierHash" featureType:1];
  uint64_t v1 = coreBehaviorEventIdentifierHashFeature_SystemFeature;
  coreBehaviorEventIdentifierHashFeature_SystemFeature = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (REFeature)coreBehaviorAppIdentifierHashFeature
{
  if (coreBehaviorAppIdentifierHashFeature_onceToken != -1) {
    dispatch_once(&coreBehaviorAppIdentifierHashFeature_onceToken, &__block_literal_global_330);
  }
  v2 = (void *)coreBehaviorAppIdentifierHashFeature_SystemFeature;
  return (REFeature *)v2;
}

uint64_t __49__REFeature_coreBehaviorAppIdentifierHashFeature__block_invoke()
{
  uint64_t v0 = +[REFeature featureWithName:@"coreBehaviorAppIdentifierHash" featureType:1];
  uint64_t v1 = coreBehaviorAppIdentifierHashFeature_SystemFeature;
  coreBehaviorAppIdentifierHashFeature_SystemFeature = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)systemFeatureNames
{
  if (systemFeatureNames_onceToken != -1) {
    dispatch_once(&systemFeatureNames_onceToken, &__block_literal_global_365);
  }
  v2 = (void *)systemFeatureNames_FeatureNames;
  return v2;
}

uint64_t __31__REFeature_systemFeatureNames__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithArray:&unk_26CFCD758];
  uint64_t v1 = systemFeatureNames_FeatureNames;
  systemFeatureNames_FeatureNames = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)featuresFromSource:(id)a3
{
  id v3 = +[REScriptProcessor processorWithSource:a3];
  uint64_t v4 = [v3 features];
  unint64_t v5 = +[REFeatureSet featureSetWithFeatures:v4];

  return v5;
}

+ (id)featuresFromSource:(id)a3 withNames:(id)a4
{
  id v5 = a4;
  id v6 = +[REScriptProcessor processorWithSource:a3];
  id v7 = [MEMORY[0x263EFFA08] setWithArray:v5];

  int v8 = [v6 featuresWithNames:v7];

  BOOL v9 = +[REFeatureSet featureSetWithFeatures:v8];

  return v9;
}

+ (id)featuresFromSourceAtPath:(id)a3
{
  id v3 = +[REScriptProcessor processorWithPath:a3];
  uint64_t v4 = [v3 features];
  id v5 = +[REFeatureSet featureSetWithFeatures:v4];

  return v5;
}

+ (id)featuresFromSourceAtPath:(id)a3 withNames:(id)a4
{
  id v5 = a4;
  id v6 = +[REScriptProcessor processorWithPath:a3];
  id v7 = [MEMORY[0x263EFFA08] setWithArray:v5];

  int v8 = [v6 featuresWithNames:v7];

  BOOL v9 = +[REFeatureSet featureSetWithFeatures:v8];

  return v9;
}

@end