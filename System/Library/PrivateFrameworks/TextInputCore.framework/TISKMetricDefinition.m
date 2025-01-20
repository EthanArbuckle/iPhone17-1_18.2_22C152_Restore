@interface TISKMetricDefinition
+ (double)pointsToMM:(double)a3;
+ (id)_makeMetric:(id)a3 type:(int)a4;
+ (id)_makeMetric:(id)a3 type:(int)a4 metricDef:(id *)a5;
+ (id)_makeMetric:(id)a3 type:(int)a4 metricDef:(id *)a5 isPointMetric:(BOOL)a6;
+ (id)_makeMetric:(id)a3 type:(int)a4 metricDef:(id *)a5 size:(unint64_t)a6;
+ (id)_makeMetric:(id)a3 type:(int)a4 metricDef:(id *)a5 size:(unint64_t)a6 isPointMetric:(BOOL)a7;
+ (id)metricDefinitions;
- ($153C3A5BC4E016D58A1B9CA554FFC462)metricDefinition;
- (BOOL)isPointMetric;
- (NSString)metricName;
- (id)init:(id)a3 type:(int)a4 metricDef:(id *)a5 size:(unint64_t)a6 isPointMetric:(BOOL)a7;
- (int)metricType;
- (unint64_t)positionalSize;
@end

@implementation TISKMetricDefinition

- (void).cxx_destruct
{
}

- (BOOL)isPointMetric
{
  return self->_isPointMetric;
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)metricDefinition
{
  return self->_metricDefinition;
}

- (unint64_t)positionalSize
{
  return self->_positionalSize;
}

- (int)metricType
{
  return self->_metricType;
}

- (NSString)metricName
{
  return self->_metricName;
}

- (id)init:(id)a3 type:(int)a4 metricDef:(id *)a5 size:(unint64_t)a6 isPointMetric:(BOOL)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TISKMetricDefinition;
  v14 = [(TISKMetricDefinition *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_metricName, a3);
    v15->_metricType = a4;
    v15->_isPointMetric = a7;
    v15->_positionalSize = a6;
    v15->_metricDefinition = a5;
  }

  return v15;
}

+ (id)metricDefinitions
{
  if (metricDefinitions_onceToken != -1) {
    dispatch_once(&metricDefinitions_onceToken, &__block_literal_global_18319);
  }
  v2 = (void *)metricDefinitions_defs;

  return v2;
}

void __41__TISKMetricDefinition_metricDefinitions__block_invoke()
{
  v261[85] = *MEMORY[0x1E4F143B8];
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v0 = (id *)getSRKeyboardMetricScalarTotalWordsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalWordsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalWordsKeySymbolLoc_ptr)
  {
    v1 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v1, "SRKeyboardMetricScalarTotalWordsKey");
    getSRKeyboardMetricScalarTotalWordsKeySymbolLoc_ptr = v258[3];
    v0 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v0) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfWordsCounter, *v0);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v2 = (id *)getSRKeyboardMetricScalarTotalAlteredWordsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalAlteredWordsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalAlteredWordsKeySymbolLoc_ptr)
  {
    v3 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v3, "SRKeyboardMetricScalarTotalAlteredWordsKey");
    getSRKeyboardMetricScalarTotalAlteredWordsKeySymbolLoc_ptr = v258[3];
    v2 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v2) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfAlteredWordsCounter, *v2);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v4 = (id *)getSRKeyboardMetricScalarTotalTapsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalTapsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalTapsKeySymbolLoc_ptr)
  {
    v5 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v5, "SRKeyboardMetricScalarTotalTapsKey");
    getSRKeyboardMetricScalarTotalTapsKeySymbolLoc_ptr = v258[3];
    v4 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v4) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfTappedKeysCounter, *v4);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v6 = (id *)getSRKeyboardMetricScalarTotalDragsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalDragsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalDragsKeySymbolLoc_ptr)
  {
    v7 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v7, "SRKeyboardMetricScalarTotalDragsKey");
    getSRKeyboardMetricScalarTotalDragsKeySymbolLoc_ptr = v258[3];
    v6 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v6) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfDragsCounter, *v6);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v8 = (id *)getSRKeyboardMetricScalarTotalDeletesKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalDeletesKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalDeletesKeySymbolLoc_ptr)
  {
    v9 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v9, "SRKeyboardMetricScalarTotalDeletesKey");
    getSRKeyboardMetricScalarTotalDeletesKeySymbolLoc_ptr = v258[3];
    v8 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v8) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfDeletesCounter, *v8);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v10 = (id *)getSRKeyboardMetricScalarTotalEmojiKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalEmojiKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalEmojiKeySymbolLoc_ptr)
  {
    v11 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v11, "SRKeyboardMetricScalarTotalEmojiKey");
    getSRKeyboardMetricScalarTotalEmojiKeySymbolLoc_ptr = v258[3];
    v10 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v10) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfEmojiCounter, *v10);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v12 = (id *)getSRKeyboardMetricScalarTotalPathsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalPathsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalPathsKeySymbolLoc_ptr)
  {
    id v13 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v13, "SRKeyboardMetricScalarTotalPathsKey");
    getSRKeyboardMetricScalarTotalPathsKeySymbolLoc_ptr = v258[3];
    v12 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v12) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfPaths, *v12);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v14 = (id *)getSRKeyboardMetricScalarTotalPathTimeKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalPathTimeKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalPathTimeKeySymbolLoc_ptr)
  {
    v15 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v15, "SRKeyboardMetricScalarTotalPathTimeKey");
    getSRKeyboardMetricScalarTotalPathTimeKeySymbolLoc_ptr = v258[3];
    v14 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v14) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKTotalPathTime, *v14);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v16 = (id *)getSRKeyboardMetricScalarTotalPathLengthKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalPathLengthKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalPathLengthKeySymbolLoc_ptr)
  {
    objc_super v17 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v17, "SRKeyboardMetricScalarTotalPathLengthKey");
    getSRKeyboardMetricScalarTotalPathLengthKeySymbolLoc_ptr = v258[3];
    v16 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v16) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKTotalPathLength, *v16);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v18 = (id *)getSRKeyboardMetricScalarTotalSessionTypingDurationKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalSessionTypingDurationKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalSessionTypingDurationKeySymbolLoc_ptr)
  {
    v19 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v19, "SRKeyboardMetricScalarTotalSessionTypingDurationKey");
    getSRKeyboardMetricScalarTotalSessionTypingDurationKeySymbolLoc_ptr = v258[3];
    v18 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v18) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKTotalSessionTypingDuration, *v18);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v20 = (id *)getSRKeyboardMetricScalarTypingPausesKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTypingPausesKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTypingPausesKeySymbolLoc_ptr)
  {
    v21 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v21, "SRKeyboardMetricScalarTypingPausesKey");
    getSRKeyboardMetricScalarTypingPausesKeySymbolLoc_ptr = v258[3];
    v20 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v20) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKTypingPauses, *v20);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v22 = (id *)getSRKeyboardMetricScalarEpisodeCountKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarEpisodeCountKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEpisodeCountKeySymbolLoc_ptr)
  {
    v23 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v23, "SRKeyboardMetricScalarEpisodeCountKey");
    getSRKeyboardMetricScalarEpisodeCountKeySymbolLoc_ptr = v258[3];
    v22 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v22) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKEpisodeCount, *v22);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v24 = (id *)getSRKeyboardMetricScalarTapTypingSpeedKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTapTypingSpeedKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTapTypingSpeedKeySymbolLoc_ptr)
  {
    v25 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v25, "SRKeyboardMetricScalarTapTypingSpeedKey");
    getSRKeyboardMetricScalarTapTypingSpeedKeySymbolLoc_ptr = v258[3];
    v24 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v24) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKTapTypingSpeed, *v24);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v26 = (id *)getSRKeyboardMetricScalarPathTypingSpeedSymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarPathTypingSpeedSymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarPathTypingSpeedSymbolLoc_ptr)
  {
    v27 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v27, "SRKeyboardMetricScalarPathTypingSpeed");
    getSRKeyboardMetricScalarPathTypingSpeedSymbolLoc_ptr = v258[3];
    v26 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v26) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKPathTypingSpeed, *v26);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v28 = (id *)getSRKeyboardMetricScalarTotalAutoCorrectionsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalAutoCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalAutoCorrectionsKeySymbolLoc_ptr)
  {
    v29 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v29, "SRKeyboardMetricScalarTotalAutoCorrectionsKey");
    getSRKeyboardMetricScalarTotalAutoCorrectionsKeySymbolLoc_ptr = v258[3];
    v28 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v28) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfAutoCorrections, *v28);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v30 = (id *)getSRKeyboardMetricScalarTotalSpaceCorrectionsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalSpaceCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalSpaceCorrectionsKeySymbolLoc_ptr)
  {
    v31 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v31, "SRKeyboardMetricScalarTotalSpaceCorrectionsKey");
    getSRKeyboardMetricScalarTotalSpaceCorrectionsKeySymbolLoc_ptr = v258[3];
    v30 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v30) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfSpaceCorrections, *v30);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v32 = (id *)getSRKeyboardMetricScalarTotalRetroCorrectionsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalRetroCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalRetroCorrectionsKeySymbolLoc_ptr)
  {
    v33 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v33, "SRKeyboardMetricScalarTotalRetroCorrectionsKey");
    getSRKeyboardMetricScalarTotalRetroCorrectionsKeySymbolLoc_ptr = v258[3];
    v32 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v32) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfRetroCorrections, *v32);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v34 = (id *)getSRKeyboardMetricScalarTotalTranspositionCorrectionsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalTranspositionCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalTranspositionCorrectionsKeySymbolLoc_ptr)
  {
    v35 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v35, "SRKeyboardMetricScalarTotalTranspositionCorrectionsKey");
    getSRKeyboardMetricScalarTotalTranspositionCorrectionsKeySymbolLoc_ptr = v258[3];
    v34 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v34) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfTranspositionCorrections, *v34);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v36 = (id *)getSRKeyboardMetricScalarTotalInsertKeyCorrectionsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalInsertKeyCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalInsertKeyCorrectionsKeySymbolLoc_ptr)
  {
    v37 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v37, "SRKeyboardMetricScalarTotalInsertKeyCorrectionsKey");
    getSRKeyboardMetricScalarTotalInsertKeyCorrectionsKeySymbolLoc_ptr = v258[3];
    v36 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v36) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfInsertKeyCorrections, *v36);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v38 = (id *)getSRKeyboardMetricScalarTotalSkipTouchCorrectionsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalSkipTouchCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalSkipTouchCorrectionsKeySymbolLoc_ptr)
  {
    v39 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v39, "SRKeyboardMetricScalarTotalSkipTouchCorrectionsKey");
    getSRKeyboardMetricScalarTotalSkipTouchCorrectionsKeySymbolLoc_ptr = v258[3];
    v38 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v38) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfSkipTouchCorrections, *v38);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v40 = (id *)getSRKeyboardMetricScalarTotalNearKeyCorrectionsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalNearKeyCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalNearKeyCorrectionsKeySymbolLoc_ptr)
  {
    v41 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v41, "SRKeyboardMetricScalarTotalNearKeyCorrectionsKey");
    getSRKeyboardMetricScalarTotalNearKeyCorrectionsKeySymbolLoc_ptr = v258[3];
    v40 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v40) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfNearKeyCorrections, *v40);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v42 = (id *)getSRKeyboardMetricScalarTotalSubstitutionCorrectionsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalSubstitutionCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalSubstitutionCorrectionsKeySymbolLoc_ptr)
  {
    v43 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v43, "SRKeyboardMetricScalarTotalSubstitutionCorrectionsKey");
    getSRKeyboardMetricScalarTotalSubstitutionCorrectionsKeySymbolLoc_ptr = v258[3];
    v42 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v42) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfSubstitutionCorrections, *v42);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v44 = (id *)getSRKeyboardMetricScalarTotalHitTestCorrectionsKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarTotalHitTestCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalHitTestCorrectionsKeySymbolLoc_ptr)
  {
    v45 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v45, "SRKeyboardMetricScalarTotalHitTestCorrectionsKey");
    getSRKeyboardMetricScalarTotalHitTestCorrectionsKeySymbolLoc_ptr = v258[3];
    v44 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v44) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKNumberOfHitTestCorrections, *v44);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v46 = (id *)getSRKeyboardMetricPositionalWordDownErrorDistanceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricPositionalWordDownErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalWordDownErrorDistanceKeySymbolLoc_ptr)
  {
    v47 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v47, "SRKeyboardMetricPositionalWordDownErrorDistanceKey");
    getSRKeyboardMetricPositionalWordDownErrorDistanceKeySymbolLoc_ptr = v258[3];
    v46 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v46) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKLongWordPositionalDownErrorDistance, *v46);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v48 = (id *)getSRKeyboardMetricPositionalWordUpErrorDistanceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricPositionalWordUpErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalWordUpErrorDistanceKeySymbolLoc_ptr)
  {
    v49 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v49, "SRKeyboardMetricPositionalWordUpErrorDistanceKey");
    getSRKeyboardMetricPositionalWordUpErrorDistanceKeySymbolLoc_ptr = v258[3];
    v48 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v48) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKLongWordPositionalUpErrorDistance, *v48);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v50 = (id *)getSRKeyboardMetricPositionalWordTouchDownUpKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricPositionalWordTouchDownUpKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalWordTouchDownUpKeySymbolLoc_ptr)
  {
    v51 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v51, "SRKeyboardMetricPositionalWordTouchDownUpKey");
    getSRKeyboardMetricPositionalWordTouchDownUpKeySymbolLoc_ptr = v258[3];
    v50 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v50) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKLongWordTouchDownUpPositionalMetric, *v50);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v52 = (id *)getSRKeyboardMetricPositionalWordTouchDownDownKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricPositionalWordTouchDownDownKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalWordTouchDownDownKeySymbolLoc_ptr)
  {
    v53 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v53, "SRKeyboardMetricPositionalWordTouchDownDownKey");
    getSRKeyboardMetricPositionalWordTouchDownDownKeySymbolLoc_ptr = v258[3];
    v52 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v52) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKLongWordTouchDownDownPositionalMetric, *v52);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v54 = (id *)getSRKeyboardMetricProbabilityUpErrorDistanceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityUpErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityUpErrorDistanceKeySymbolLoc_ptr)
  {
    v55 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v55, "SRKeyboardMetricProbabilityUpErrorDistanceKey");
    getSRKeyboardMetricProbabilityUpErrorDistanceKeySymbolLoc_ptr = v258[3];
    v54 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v54) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKUpErrorDistance, *v54);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v56 = (id *)getSRKeyboardMetricProbabilityDownErrorDistanceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityDownErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDownErrorDistanceKeySymbolLoc_ptr)
  {
    v57 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v57, "SRKeyboardMetricProbabilityDownErrorDistanceKey");
    getSRKeyboardMetricProbabilityDownErrorDistanceKeySymbolLoc_ptr = v258[3];
    v56 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v56) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKDownErrorDistance, *v56);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v58 = (id *)getSRKeyboardMetricProbabilitySpaceUpErrorDistanceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilitySpaceUpErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceUpErrorDistanceKeySymbolLoc_ptr)
  {
    v59 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v59, "SRKeyboardMetricProbabilitySpaceUpErrorDistanceKey");
    getSRKeyboardMetricProbabilitySpaceUpErrorDistanceKeySymbolLoc_ptr = v258[3];
    v58 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v58) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKSpaceUpErrorDistance, *v58);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v60 = (id *)getSRKeyboardMetricProbabilitySpaceDownErrorDistanceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilitySpaceDownErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceDownErrorDistanceKeySymbolLoc_ptr)
  {
    v61 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v61, "SRKeyboardMetricProbabilitySpaceDownErrorDistanceKey");
    getSRKeyboardMetricProbabilitySpaceDownErrorDistanceKeySymbolLoc_ptr = v258[3];
    v60 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v60) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKSpaceDownErrorDistance, *v60);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v62 = (id *)getSRKeyboardMetricProbabilityDeleteUpErrorDistanceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityDeleteUpErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteUpErrorDistanceKeySymbolLoc_ptr)
  {
    v63 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v63, "SRKeyboardMetricProbabilityDeleteUpErrorDistanceKey");
    getSRKeyboardMetricProbabilityDeleteUpErrorDistanceKeySymbolLoc_ptr = v258[3];
    v62 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v62) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKDeleteUpErrorDistance, *v62);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v64 = (id *)getSRKeyboardMetricProbabilityDeleteDownErrorDistanceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityDeleteDownErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteDownErrorDistanceKeySymbolLoc_ptr)
  {
    v65 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v65, "SRKeyboardMetricProbabilityDeleteDownErrorDistanceKey");
    getSRKeyboardMetricProbabilityDeleteDownErrorDistanceKeySymbolLoc_ptr = v258[3];
    v64 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v64) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKDeleteDownErrorDistance, *v64);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v66 = (id *)getSRKeyboardMetricProbabilityShortWordCharKeyUpErrorDistanceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityShortWordCharKeyUpErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityShortWordCharKeyUpErrorDistanceKeySymbolLoc_ptr)
  {
    v67 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v67, "SRKeyboardMetricProbabilityShortWordCharKeyUpErrorDistanceKey");
    getSRKeyboardMetricProbabilityShortWordCharKeyUpErrorDistanceKeySymbolLoc_ptr = v258[3];
    v66 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v66) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKShortWordCharUpErrorDistance, *v66);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v68 = (id *)getSRKeyboardMetricProbabilityShortWordCharKeyDownErrorDistanceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityShortWordCharKeyDownErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityShortWordCharKeyDownErrorDistanceKeySymbolLoc_ptr)
  {
    v69 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v69, "SRKeyboardMetricProbabilityShortWordCharKeyDownErrorDistanceKey");
    getSRKeyboardMetricProbabilityShortWordCharKeyDownErrorDistanceKeySymbolLoc_ptr = v258[3];
    v68 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v68) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKShortWordCharDownErrorDistance, *v68);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v70 = (id *)getSRKeyboardMetricProbabilityShortWordCharKeyToCharKeyKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityShortWordCharKeyToCharKeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityShortWordCharKeyToCharKeyKeySymbolLoc_ptr)
  {
    v71 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v71, "SRKeyboardMetricProbabilityShortWordCharKeyToCharKeyKey");
    getSRKeyboardMetricProbabilityShortWordCharKeyToCharKeyKeySymbolLoc_ptr = v258[3];
    v70 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v70) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKShortWordCharToCharMetric, *v70);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v72 = (id *)getSRKeyboardMetricProbabilityShortWordCharKeyTouchDownUpKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityShortWordCharKeyTouchDownUpKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityShortWordCharKeyTouchDownUpKeySymbolLoc_ptr)
  {
    v73 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v73, "SRKeyboardMetricProbabilityShortWordCharKeyTouchDownUpKey");
    getSRKeyboardMetricProbabilityShortWordCharKeyTouchDownUpKeySymbolLoc_ptr = v258[3];
    v72 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v72) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKShortWordCharTouchDownUpMetric, *v72);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v74 = (id *)getSRKeyboardMetricProbabilityTouchDownUpKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityTouchDownUpKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityTouchDownUpKeySymbolLoc_ptr)
  {
    v75 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v75, "SRKeyboardMetricProbabilityTouchDownUpKey");
    getSRKeyboardMetricProbabilityTouchDownUpKeySymbolLoc_ptr = v258[3];
    v74 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v74) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKTouchDownUpMetric, *v74);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v76 = (id *)getSRKeyboardMetricProbabilitySpaceTouchDownUpKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilitySpaceTouchDownUpKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceTouchDownUpKeySymbolLoc_ptr)
  {
    v77 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v77, "SRKeyboardMetricProbabilitySpaceTouchDownUpKey");
    getSRKeyboardMetricProbabilitySpaceTouchDownUpKeySymbolLoc_ptr = v258[3];
    v76 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v76) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKSpaceTouchDownUpMetric, *v76);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v78 = (id *)getSRKeyboardMetricProbabilityDeleteTouchDownUpKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityDeleteTouchDownUpKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteTouchDownUpKeySymbolLoc_ptr)
  {
    v79 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v79, "SRKeyboardMetricProbabilityDeleteTouchDownUpKey");
    getSRKeyboardMetricProbabilityDeleteTouchDownUpKeySymbolLoc_ptr = v258[3];
    v78 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v78) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKDeleteTouchDownUpMetric, *v78);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v80 = (id *)getSRKeyboardMetricProbabilityTouchDownDownKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityTouchDownDownKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityTouchDownDownKeySymbolLoc_ptr)
  {
    v81 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v81, "SRKeyboardMetricProbabilityTouchDownDownKey");
    getSRKeyboardMetricProbabilityTouchDownDownKeySymbolLoc_ptr = v258[3];
    v80 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v80) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKTouchDownDownMetric, *v80);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v82 = (id *)getSRKeyboardMetricProbabilityTouchUpDownKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityTouchUpDownKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityTouchUpDownKeySymbolLoc_ptr)
  {
    v83 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v83, "SRKeyboardMetricProbabilityTouchUpDownKey");
    getSRKeyboardMetricProbabilityTouchUpDownKeySymbolLoc_ptr = v258[3];
    v82 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v82) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKTouchUpDownMetric, *v82);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v84 = (id *)getSRKeyboardMetricPositionalWordTouchUpDownKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricPositionalWordTouchUpDownKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalWordTouchUpDownKeySymbolLoc_ptr)
  {
    v85 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v85, "SRKeyboardMetricPositionalWordTouchUpDownKey");
    getSRKeyboardMetricPositionalWordTouchUpDownKeySymbolLoc_ptr = v258[3];
    v84 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v84) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKLongWordTouchUpDownPositionalMetric, *v84);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v86 = (id *)getSRKeyboardMetricProbabilityCharKeyToPredictionKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityCharKeyToPredictionKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityCharKeyToPredictionKeySymbolLoc_ptr)
  {
    v87 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v87, "SRKeyboardMetricProbabilityCharKeyToPredictionKey");
    getSRKeyboardMetricProbabilityCharKeyToPredictionKeySymbolLoc_ptr = v258[3];
    v86 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v86) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKCharToPredictionMetric, *v86);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v88 = (id *)getSRKeyboardMetricProbabilityCharKeyToAnyTapKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityCharKeyToAnyTapKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityCharKeyToAnyTapKeySymbolLoc_ptr)
  {
    v89 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v89, "SRKeyboardMetricProbabilityCharKeyToAnyTapKey");
    getSRKeyboardMetricProbabilityCharKeyToAnyTapKeySymbolLoc_ptr = v258[3];
    v88 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v88) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKCharToAnyTapMetric, *v88);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v90 = (id *)getSRKeyboardMetricProbabilityAnyTapToCharKeyKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityAnyTapToCharKeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityAnyTapToCharKeyKeySymbolLoc_ptr)
  {
    v91 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v91, "SRKeyboardMetricProbabilityAnyTapToCharKeyKey");
    getSRKeyboardMetricProbabilityAnyTapToCharKeyKeySymbolLoc_ptr = v258[3];
    v90 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v90) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKAnyTapToCharMetric, *v90);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v92 = (id *)getSRKeyboardMetricProbabilitySpaceToCharKeyKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilitySpaceToCharKeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceToCharKeyKeySymbolLoc_ptr)
  {
    v93 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v93, "SRKeyboardMetricProbabilitySpaceToCharKeyKey");
    getSRKeyboardMetricProbabilitySpaceToCharKeyKeySymbolLoc_ptr = v258[3];
    v92 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v92) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKSpaceToCharMetric, *v92);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v94 = (id *)getSRKeyboardMetricProbabilityCharKeyToSpaceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityCharKeyToSpaceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityCharKeyToSpaceKeySymbolLoc_ptr)
  {
    v95 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v95, "SRKeyboardMetricProbabilityCharKeyToSpaceKey");
    getSRKeyboardMetricProbabilityCharKeyToSpaceKeySymbolLoc_ptr = v258[3];
    v94 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v94) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKCharToSpaceMetric, *v94);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v96 = (id *)getSRKeyboardMetricProbabilitySpaceToDeleteKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilitySpaceToDeleteKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceToDeleteKeySymbolLoc_ptr)
  {
    v97 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v97, "SRKeyboardMetricProbabilitySpaceToDeleteKey");
    getSRKeyboardMetricProbabilitySpaceToDeleteKeySymbolLoc_ptr = v258[3];
    v96 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v96) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKSpaceToDeleteMetric, *v96);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v98 = (id *)getSRKeyboardMetricProbabilityDeleteToSpaceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityDeleteToSpaceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteToSpaceKeySymbolLoc_ptr)
  {
    v99 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v99, "SRKeyboardMetricProbabilityDeleteToSpaceKey");
    getSRKeyboardMetricProbabilityDeleteToSpaceKeySymbolLoc_ptr = v258[3];
    v98 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v98) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKDeleteToSpaceMetric, *v98);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v100 = (id *)getSRKeyboardMetricProbabilitySpaceToSpaceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilitySpaceToSpaceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceToSpaceKeySymbolLoc_ptr)
  {
    v101 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v101, "SRKeyboardMetricProbabilitySpaceToSpaceKey");
    getSRKeyboardMetricProbabilitySpaceToSpaceKeySymbolLoc_ptr = v258[3];
    v100 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v100) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKSpaceToSpaceMetric, *v100);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v102 = (id *)getSRKeyboardMetricProbabilitySpaceToShiftKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilitySpaceToShiftKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceToShiftKeySymbolLoc_ptr)
  {
    v103 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v103, "SRKeyboardMetricProbabilitySpaceToShiftKey");
    getSRKeyboardMetricProbabilitySpaceToShiftKeySymbolLoc_ptr = v258[3];
    v102 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v102) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKSpaceToShiftMetric, *v102);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v104 = (id *)getSRKeyboardMetricProbabilitySpaceTo123KeyKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilitySpaceTo123KeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceTo123KeyKeySymbolLoc_ptr)
  {
    v105 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v105, "SRKeyboardMetricProbabilitySpaceTo123KeyKey");
    getSRKeyboardMetricProbabilitySpaceTo123KeyKeySymbolLoc_ptr = v258[3];
    v104 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v104) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKSpaceTo123Metric, *v104);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v106 = (id *)getSRKeyboardMetricProbabilitySpaceToPredictionKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilitySpaceToPredictionKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceToPredictionKeySymbolLoc_ptr)
  {
    v107 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v107, "SRKeyboardMetricProbabilitySpaceToPredictionKey");
    getSRKeyboardMetricProbabilitySpaceToPredictionKeySymbolLoc_ptr = v258[3];
    v106 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v106) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKSpaceToPredictionMetric, *v106);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v108 = (id *)getSRKeyboardMetricProbabilityDeleteToCharKeyKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityDeleteToCharKeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteToCharKeyKeySymbolLoc_ptr)
  {
    v109 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v109, "SRKeyboardMetricProbabilityDeleteToCharKeyKey");
    getSRKeyboardMetricProbabilityDeleteToCharKeyKeySymbolLoc_ptr = v258[3];
    v108 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v108) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKDeleteToCharMetric, *v108);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v110 = (id *)getSRKeyboardMetricProbabilityCharKeyToDeleteKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityCharKeyToDeleteKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityCharKeyToDeleteKeySymbolLoc_ptr)
  {
    v111 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v111, "SRKeyboardMetricProbabilityCharKeyToDeleteKey");
    getSRKeyboardMetricProbabilityCharKeyToDeleteKeySymbolLoc_ptr = v258[3];
    v110 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v110) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKKeyToDeleteMetric, *v110);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v112 = (id *)getSRKeyboardMetricProbabilityDeleteToDeleteKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityDeleteToDeleteKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteToDeleteKeySymbolLoc_ptr)
  {
    v113 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v113, "SRKeyboardMetricProbabilityDeleteToDeleteKey");
    getSRKeyboardMetricProbabilityDeleteToDeleteKeySymbolLoc_ptr = v258[3];
    v112 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v112) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKDeleteToDeleteMetric, *v112);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v114 = (id *)getSRKeyboardMetricProbabilityDeleteToShiftKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityDeleteToShiftKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteToShiftKeySymbolLoc_ptr)
  {
    v115 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v115, "SRKeyboardMetricProbabilityDeleteToShiftKey");
    getSRKeyboardMetricProbabilityDeleteToShiftKeySymbolLoc_ptr = v258[3];
    v114 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v114) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKDeleteToShiftMetric, *v114);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v116 = (id *)getSRKeyboardMetricProbabilityDeleteTo123KeyKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityDeleteTo123KeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteTo123KeyKeySymbolLoc_ptr)
  {
    v117 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v117, "SRKeyboardMetricProbabilityDeleteTo123KeyKey");
    getSRKeyboardMetricProbabilityDeleteTo123KeyKeySymbolLoc_ptr = v258[3];
    v116 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v116) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKDeleteTo123Metric, *v116);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v118 = (id *)getSRKeyboardMetricProbabilityPathErrorDistanceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityPathErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityPathErrorDistanceKeySymbolLoc_ptr)
  {
    v119 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v119, "SRKeyboardMetricProbabilityPathErrorDistanceKey");
    getSRKeyboardMetricProbabilityPathErrorDistanceKeySymbolLoc_ptr = v258[3];
    v118 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v118) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKPathErrorDistanceMetric, *v118);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v120 = (id *)getSRKeyboardMetricProbabilityDeleteToPathKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityDeleteToPathKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteToPathKeySymbolLoc_ptr)
  {
    v121 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v121, "SRKeyboardMetricProbabilityDeleteToPathKey");
    getSRKeyboardMetricProbabilityDeleteToPathKeySymbolLoc_ptr = v258[3];
    v120 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v120) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKDeleteToPathMetric, *v120);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v122 = (id *)getSRKeyboardMetricProbabilityPathToDeleteKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityPathToDeleteKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityPathToDeleteKeySymbolLoc_ptr)
  {
    v123 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v123, "SRKeyboardMetricProbabilityPathToDeleteKey");
    getSRKeyboardMetricProbabilityPathToDeleteKeySymbolLoc_ptr = v258[3];
    v122 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v122) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKPathToDeleteMetric, *v122);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v124 = (id *)getSRKeyboardMetricProbabilitySpaceToPathKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilitySpaceToPathKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceToPathKeySymbolLoc_ptr)
  {
    v125 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v125, "SRKeyboardMetricProbabilitySpaceToPathKey");
    getSRKeyboardMetricProbabilitySpaceToPathKeySymbolLoc_ptr = v258[3];
    v124 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v124) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKSpaceToPathMetric, *v124);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v126 = (id *)getSRKeyboardMetricProbabilityPathToSpaceKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityPathToSpaceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityPathToSpaceKeySymbolLoc_ptr)
  {
    v127 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v127, "SRKeyboardMetricProbabilityPathToSpaceKey");
    getSRKeyboardMetricProbabilityPathToSpaceKeySymbolLoc_ptr = v258[3];
    v126 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v126) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKPathSpaceMetric, *v126);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v128 = (id *)getSRKeyboardMetricProbabilityPathToPathKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityPathToPathKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityPathToPathKeySymbolLoc_ptr)
  {
    v129 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v129, "SRKeyboardMetricProbabilityPathToPathKey");
    getSRKeyboardMetricProbabilityPathToPathKeySymbolLoc_ptr = v258[3];
    v128 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v128) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKPathToPathMetric, *v128);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v130 = (id *)getSRKeyboardMetricScalarMidPathPauseKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarMidPathPauseKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarMidPathPauseKeySymbolLoc_ptr)
  {
    v131 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v131, "SRKeyboardMetricScalarMidPathPauseKey");
    getSRKeyboardMetricScalarMidPathPauseKeySymbolLoc_ptr = v258[3];
    v130 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v130) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKMidPathPause, *v130);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v132 = (id *)getSRKeyboardMetricPositionalDeleteToDeleteKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricPositionalDeleteToDeleteKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalDeleteToDeleteKeySymbolLoc_ptr)
  {
    v133 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v133, "SRKeyboardMetricPositionalDeleteToDeleteKey");
    getSRKeyboardMetricPositionalDeleteToDeleteKeySymbolLoc_ptr = v258[3];
    v132 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v132) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKDeleteToDeletePositionalMetric, *v132);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v134 = (id *)getSRKeyboardMetricProbabilityAnyTapTo123KeyKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityAnyTapTo123KeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityAnyTapTo123KeyKeySymbolLoc_ptr)
  {
    v135 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v135, "SRKeyboardMetricProbabilityAnyTapTo123KeyKey");
    getSRKeyboardMetricProbabilityAnyTapTo123KeyKeySymbolLoc_ptr = v258[3];
    v134 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v134) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKAnyTapTo123Metric, *v134);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v136 = (id *)getSRKeyboardMetricProbabilityCharKeyTo123KeyKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbabilityCharKeyTo123KeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityCharKeyTo123KeyKeySymbolLoc_ptr)
  {
    v137 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v137, "SRKeyboardMetricProbabilityCharKeyTo123KeyKey");
    getSRKeyboardMetricProbabilityCharKeyTo123KeyKeySymbolLoc_ptr = v258[3];
    v136 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v136) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKCharTo123Metric, *v136);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v138 = (id *)getSRKeyboardMetricProbability123KeyToAnyTapKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbability123KeyToAnyTapKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbability123KeyToAnyTapKeySymbolLoc_ptr)
  {
    v139 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v139, "SRKeyboardMetricProbability123KeyToAnyTapKey");
    getSRKeyboardMetricProbability123KeyToAnyTapKeySymbolLoc_ptr = v258[3];
    v138 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v138) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISK123ToAnyTapMetric, *v138);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v140 = (id *)getSRKeyboardMetricProbability123KeyToCharKeyKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricProbability123KeyToCharKeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbability123KeyToCharKeyKeySymbolLoc_ptr)
  {
    v141 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v141, "SRKeyboardMetricProbability123KeyToCharKeyKey");
    getSRKeyboardMetricProbability123KeyToCharKeyKeySymbolLoc_ptr = v258[3];
    v140 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v140) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISK123ToCharMetric, *v140);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v142 = (id *)getSRKeyboardMetricScalarlWordBucketAbsolutistKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarlWordBucketAbsolutistKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarlWordBucketAbsolutistKeySymbolLoc_ptr)
  {
    v143 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v143, "SRKeyboardMetricScalarlWordBucketAbsolutistKey");
    getSRKeyboardMetricScalarlWordBucketAbsolutistKeySymbolLoc_ptr = v258[3];
    v142 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v142) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalAbsolutistWords, *v142);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v144 = (id *)getSRKeyboardMetricScalarlWordBucketDownKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarlWordBucketDownKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarlWordBucketDownKeySymbolLoc_ptr)
  {
    v145 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v145, "SRKeyboardMetricScalarlWordBucketDownKey");
    getSRKeyboardMetricScalarlWordBucketDownKeySymbolLoc_ptr = v258[3];
    v144 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v144) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalDownWords, *v144);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v146 = (id *)getSRKeyboardMetricScalarlWordBucketDeathKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarlWordBucketDeathKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarlWordBucketDeathKeySymbolLoc_ptr)
  {
    v147 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v147, "SRKeyboardMetricScalarlWordBucketDeathKey");
    getSRKeyboardMetricScalarlWordBucketDeathKeySymbolLoc_ptr = v258[3];
    v146 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v146) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalDeathWords, *v146);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v148 = (id *)getSRKeyboardMetricScalarlWordBucketAnxietyKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarlWordBucketAnxietyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarlWordBucketAnxietyKeySymbolLoc_ptr)
  {
    v149 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v149, "SRKeyboardMetricScalarlWordBucketAnxietyKey");
    getSRKeyboardMetricScalarlWordBucketAnxietyKeySymbolLoc_ptr = v258[3];
    v148 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v148) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalAnxietyWords, *v148);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v150 = (id *)getSRKeyboardMetricScalarlWordBucketAngerKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarlWordBucketAngerKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarlWordBucketAngerKeySymbolLoc_ptr)
  {
    v151 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v151, "SRKeyboardMetricScalarlWordBucketAngerKey");
    getSRKeyboardMetricScalarlWordBucketAngerKeySymbolLoc_ptr = v258[3];
    v150 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v150) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalAngerWords, *v150);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v152 = (id *)getSRKeyboardMetricScalarlWordBucketFeelKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarlWordBucketFeelKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarlWordBucketFeelKeySymbolLoc_ptr)
  {
    v153 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v153, "SRKeyboardMetricScalarlWordBucketFeelKey");
    getSRKeyboardMetricScalarlWordBucketFeelKeySymbolLoc_ptr = v258[3];
    v152 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v152) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalHealthFeelingWords, *v152);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v154 = (id *)getSRKeyboardMetricScalarWordBucketPositiveKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarWordBucketPositiveKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarWordBucketPositiveKeySymbolLoc_ptr)
  {
    v155 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v155, "SRKeyboardMetricScalarWordBucketPositiveKey");
    getSRKeyboardMetricScalarWordBucketPositiveKeySymbolLoc_ptr = v258[3];
    v154 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v154) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalPositiveWords, *v154);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v156 = (id *)getSRKeyboardMetricScalarEmojiBucketPositiveKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarEmojiBucketPositiveKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketPositiveKeySymbolLoc_ptr)
  {
    v157 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v157, "SRKeyboardMetricScalarEmojiBucketPositiveKey");
    getSRKeyboardMetricScalarEmojiBucketPositiveKeySymbolLoc_ptr = v258[3];
    v156 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v156) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalPositiveEmoji, *v156);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v158 = (id *)getSRKeyboardMetricScalarEmojiBucketSadKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarEmojiBucketSadKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketSadKeySymbolLoc_ptr)
  {
    v159 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v159, "SRKeyboardMetricScalarEmojiBucketSadKey");
    getSRKeyboardMetricScalarEmojiBucketSadKeySymbolLoc_ptr = v258[3];
    v158 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v158) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalSadEmoji, *v158);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v160 = (id *)getSRKeyboardMetricScalarEmojiBucketAnxietyKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarEmojiBucketAnxietyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketAnxietyKeySymbolLoc_ptr)
  {
    v161 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v161, "SRKeyboardMetricScalarEmojiBucketAnxietyKey");
    getSRKeyboardMetricScalarEmojiBucketAnxietyKeySymbolLoc_ptr = v258[3];
    v160 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v160) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalAnxietyEmoji, *v160);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v162 = (id *)getSRKeyboardMetricScalarEmojiBucketAngerKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarEmojiBucketAngerKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketAngerKeySymbolLoc_ptr)
  {
    v163 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v163, "SRKeyboardMetricScalarEmojiBucketAngerKey");
    getSRKeyboardMetricScalarEmojiBucketAngerKeySymbolLoc_ptr = v258[3];
    v162 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v162) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalAngerEmoji, *v162);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v164 = (id *)getSRKeyboardMetricScalarEmojiBucketFeelKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarEmojiBucketFeelKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketFeelKeySymbolLoc_ptr)
  {
    v165 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v165, "SRKeyboardMetricScalarEmojiBucketFeelKey");
    getSRKeyboardMetricScalarEmojiBucketFeelKeySymbolLoc_ptr = v258[3];
    v164 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v164) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalFeelEmoji, *v164);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v166 = (id *)getSRKeyboardMetricScalarEmojiBucketLowEnergyKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarEmojiBucketLowEnergyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketLowEnergyKeySymbolLoc_ptr)
  {
    v167 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v167, "SRKeyboardMetricScalarEmojiBucketLowEnergyKey");
    getSRKeyboardMetricScalarEmojiBucketLowEnergyKeySymbolLoc_ptr = v258[3];
    v166 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v166) {
    goto LABEL_257;
  }
  objc_storeStrong((id *)&kTISKtotalLowEnergyEmoji, *v166);
  uint64_t v257 = 0;
  v258 = &v257;
  uint64_t v259 = 0x2020000000;
  v168 = (id *)getSRKeyboardMetricScalarEmojiBucketConfusedKeySymbolLoc_ptr;
  uint64_t v260 = getSRKeyboardMetricScalarEmojiBucketConfusedKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketConfusedKeySymbolLoc_ptr)
  {
    v169 = (void *)SensorKitLibrary();
    v258[3] = (uint64_t)dlsym(v169, "SRKeyboardMetricScalarEmojiBucketConfusedKey");
    getSRKeyboardMetricScalarEmojiBucketConfusedKeySymbolLoc_ptr = v258[3];
    v168 = (id *)v258[3];
  }
  _Block_object_dispose(&v257, 8);
  if (!v168)
  {
LABEL_257:
    dlerror();
    abort_report_np();
  }
  objc_storeStrong((id *)&kTISKtotalConfusedEmoji, *v168);
  v256 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfWordsCounter type:0];
  v261[0] = v256;
  v255 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfAlteredWordsCounter type:0];
  v261[1] = v255;
  v254 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfTappedKeysCounter type:0];
  v261[2] = v254;
  v253 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfDragsCounter type:0];
  v261[3] = v253;
  v252 = +[TISKMetricDefinition _makeMetric:kTISKTotalSessionTypingDuration type:0];
  v261[4] = v252;
  v251 = +[TISKMetricDefinition _makeMetric:kTISKTypingPauses type:0];
  v261[5] = v251;
  v250 = +[TISKMetricDefinition _makeMetric:kTISKEpisodeCount type:0];
  v261[6] = v250;
  v249 = +[TISKMetricDefinition _makeMetric:kTISKTapTypingSpeed type:2];
  v261[7] = v249;
  v248 = +[TISKMetricDefinition _makeMetric:kTISKPathTypingSpeed type:2];
  v261[8] = v248;
  v247 = +[TISKMetricDefinition _makeMetric:kTISKUpErrorDistance type:1 metricDef:&kErrorDistanceDefintion];
  v261[9] = v247;
  v246 = +[TISKMetricDefinition _makeMetric:kTISKDownErrorDistance type:1 metricDef:&kErrorDistanceDefintion];
  v261[10] = v246;
  v245 = +[TISKMetricDefinition _makeMetric:kTISKLongWordPositionalUpErrorDistance type:3 metricDef:&kErrorDistanceDefintion size:6];
  v261[11] = v245;
  v244 = +[TISKMetricDefinition _makeMetric:kTISKLongWordPositionalDownErrorDistance type:3 metricDef:&kErrorDistanceDefintion size:6 isPointMetric:1];
  v261[12] = v244;
  v243 = +[TISKMetricDefinition _makeMetric:kTISKShortWordCharUpErrorDistance type:1 metricDef:&kErrorDistanceDefintion];
  v261[13] = v243;
  v242 = +[TISKMetricDefinition _makeMetric:kTISKShortWordCharDownErrorDistance type:1 metricDef:&kErrorDistanceDefintion];
  v261[14] = v242;
  v241 = +[TISKMetricDefinition _makeMetric:kTISKSpaceUpErrorDistance type:1 metricDef:&kErrorDistanceDefintion isPointMetric:1];
  v261[15] = v241;
  v240 = +[TISKMetricDefinition _makeMetric:kTISKSpaceDownErrorDistance type:1 metricDef:&kErrorDistanceDefintion isPointMetric:1];
  v261[16] = v240;
  v239 = +[TISKMetricDefinition _makeMetric:kTISKDeleteUpErrorDistance type:1 metricDef:&kErrorDistanceDefintion isPointMetric:1];
  v261[17] = v239;
  v238 = +[TISKMetricDefinition _makeMetric:kTISKDeleteDownErrorDistance type:1 metricDef:&kErrorDistanceDefintion isPointMetric:1];
  v261[18] = v238;
  v237 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfAutoCorrections type:0];
  v261[19] = v237;
  v236 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfSpaceCorrections type:0];
  v261[20] = v236;
  v235 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfRetroCorrections type:0];
  v261[21] = v235;
  v234 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfTranspositionCorrections type:0];
  v261[22] = v234;
  v233 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfInsertKeyCorrections type:0];
  v261[23] = v233;
  v232 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfSkipTouchCorrections type:0];
  v261[24] = v232;
  v231 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfNearKeyCorrections type:0];
  v261[25] = v231;
  v230 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfSubstitutionCorrections type:0];
  v261[26] = v230;
  v229 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfHitTestCorrections type:0];
  v261[27] = v229;
  v228 = +[TISKMetricDefinition _makeMetric:kTISKTouchDownUpMetric type:1 metricDef:&kTouchDownUpDefintion];
  v261[28] = v228;
  v227 = +[TISKMetricDefinition _makeMetric:kTISKTouchDownDownMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[29] = v227;
  v226 = +[TISKMetricDefinition _makeMetric:kTISKTouchUpDownMetric type:1 metricDef:&kTouchUpDownDefintion];
  v261[30] = v226;
  v225 = +[TISKMetricDefinition _makeMetric:kTISKLongWordTouchDownUpPositionalMetric type:3 metricDef:&kTouchDownUpDefintion size:6];
  v261[31] = v225;
  v224 = +[TISKMetricDefinition _makeMetric:kTISKLongWordTouchDownDownPositionalMetric type:3 metricDef:&kTouchDownDownDefintion size:6];
  v261[32] = v224;
  v223 = +[TISKMetricDefinition _makeMetric:kTISKLongWordTouchUpDownPositionalMetric type:3 metricDef:&kTouchDownUpDefintion size:6];
  v261[33] = v223;
  v222 = +[TISKMetricDefinition _makeMetric:kTISKDeleteToDeletePositionalMetric type:3 metricDef:&kTouchDownUpDefintion size:5];
  v261[34] = v222;
  v221 = +[TISKMetricDefinition _makeMetric:kTISKShortWordCharTouchDownUpMetric type:1 metricDef:&kTouchDownUpDefintion];
  v261[35] = v221;
  v220 = +[TISKMetricDefinition _makeMetric:kTISKShortWordCharToCharMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[36] = v220;
  v219 = +[TISKMetricDefinition _makeMetric:kTISKCharToAnyTapMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[37] = v219;
  v218 = +[TISKMetricDefinition _makeMetric:kTISKAnyTapToCharMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[38] = v218;
  v217 = +[TISKMetricDefinition _makeMetric:kTISKCharToPredictionMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[39] = v217;
  v216 = +[TISKMetricDefinition _makeMetric:kTISKSpaceTouchDownUpMetric type:1 metricDef:&kTouchDownUpDefintion];
  v261[40] = v216;
  v215 = +[TISKMetricDefinition _makeMetric:kTISKSpaceToCharMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[41] = v215;
  v214 = +[TISKMetricDefinition _makeMetric:kTISKCharToSpaceMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[42] = v214;
  v213 = +[TISKMetricDefinition _makeMetric:kTISKSpaceToDeleteMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[43] = v213;
  v212 = +[TISKMetricDefinition _makeMetric:kTISKDeleteToSpaceMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[44] = v212;
  v211 = +[TISKMetricDefinition _makeMetric:kTISKSpaceToSpaceMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[45] = v211;
  v210 = +[TISKMetricDefinition _makeMetric:kTISKSpaceToPredictionMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[46] = v210;
  v209 = +[TISKMetricDefinition _makeMetric:kTISKSpaceToShiftMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[47] = v209;
  v208 = +[TISKMetricDefinition _makeMetric:kTISKSpaceTo123Metric type:1 metricDef:&kTouchDownDownDefintion];
  v261[48] = v208;
  v207 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfDeletesCounter type:0];
  v261[49] = v207;
  v206 = +[TISKMetricDefinition _makeMetric:kTISKDeleteTouchDownUpMetric type:1 metricDef:&kTouchDownUpDefintion];
  v261[50] = v206;
  v205 = +[TISKMetricDefinition _makeMetric:kTISKDeleteToCharMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[51] = v205;
  v204 = +[TISKMetricDefinition _makeMetric:kTISKKeyToDeleteMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[52] = v204;
  v203 = +[TISKMetricDefinition _makeMetric:kTISKDeleteToDeleteMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[53] = v203;
  v202 = +[TISKMetricDefinition _makeMetric:kTISKDeleteToShiftMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[54] = v202;
  v201 = +[TISKMetricDefinition _makeMetric:kTISKDeleteTo123Metric type:1 metricDef:&kTouchDownDownDefintion];
  v261[55] = v201;
  v200 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfPaths type:0];
  v261[56] = v200;
  v199 = +[TISKMetricDefinition _makeMetric:kTISKTotalPathTime type:0];
  v261[57] = v199;
  v198 = +[TISKMetricDefinition _makeMetric:kTISKTotalPathLength type:0];
  v261[58] = v198;
  v197 = +[TISKMetricDefinition _makeMetric:kTISKMidPathPause type:0];
  v261[59] = v197;
  v196 = +[TISKMetricDefinition _makeMetric:kTISKNumberOfEmojiCounter type:0];
  v261[60] = v196;
  v195 = +[TISKMetricDefinition _makeMetric:kTISKPathErrorDistanceMetric type:1 metricDef:&kPathErrorDistanceDefintion];
  v261[61] = v195;
  v194 = +[TISKMetricDefinition _makeMetric:kTISKPathToPathMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[62] = v194;
  v193 = +[TISKMetricDefinition _makeMetric:kTISKDeleteToPathMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[63] = v193;
  v192 = +[TISKMetricDefinition _makeMetric:kTISKPathToDeleteMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[64] = v192;
  v191 = +[TISKMetricDefinition _makeMetric:kTISKSpaceToPathMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[65] = v191;
  v190 = +[TISKMetricDefinition _makeMetric:kTISKPathSpaceMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[66] = v190;
  v189 = +[TISKMetricDefinition _makeMetric:kTISKAnyTapTo123Metric type:1 metricDef:&kTouchDownDownDefintion];
  v261[67] = v189;
  v188 = +[TISKMetricDefinition _makeMetric:kTISKCharTo123Metric type:1 metricDef:&kTouchDownDownDefintion];
  v261[68] = v188;
  v187 = +[TISKMetricDefinition _makeMetric:kTISK123ToAnyTapMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[69] = v187;
  v186 = +[TISKMetricDefinition _makeMetric:kTISK123ToCharMetric type:1 metricDef:&kTouchDownDownDefintion];
  v261[70] = v186;
  v185 = +[TISKMetricDefinition _makeMetric:kTISKtotalAbsolutistWords type:0];
  v261[71] = v185;
  v184 = +[TISKMetricDefinition _makeMetric:kTISKtotalDownWords type:0];
  v261[72] = v184;
  v183 = +[TISKMetricDefinition _makeMetric:kTISKtotalDeathWords type:0];
  v261[73] = v183;
  v182 = +[TISKMetricDefinition _makeMetric:kTISKtotalAnxietyWords type:0];
  v261[74] = v182;
  v170 = +[TISKMetricDefinition _makeMetric:kTISKtotalAngerWords type:0];
  v261[75] = v170;
  v171 = +[TISKMetricDefinition _makeMetric:kTISKtotalHealthFeelingWords type:0];
  v261[76] = v171;
  v172 = +[TISKMetricDefinition _makeMetric:kTISKtotalPositiveWords type:0];
  v261[77] = v172;
  v173 = +[TISKMetricDefinition _makeMetric:kTISKtotalPositiveEmoji type:0];
  v261[78] = v173;
  v174 = +[TISKMetricDefinition _makeMetric:kTISKtotalSadEmoji type:0];
  v261[79] = v174;
  v175 = +[TISKMetricDefinition _makeMetric:kTISKtotalAnxietyEmoji type:0];
  v261[80] = v175;
  v176 = +[TISKMetricDefinition _makeMetric:kTISKtotalAngerEmoji type:0];
  v261[81] = v176;
  v177 = +[TISKMetricDefinition _makeMetric:kTISKtotalFeelEmoji type:0];
  v261[82] = v177;
  v178 = +[TISKMetricDefinition _makeMetric:kTISKtotalLowEnergyEmoji type:0];
  v261[83] = v178;
  v179 = +[TISKMetricDefinition _makeMetric:kTISKtotalConfusedEmoji type:0];
  v261[84] = v179;
  uint64_t v180 = [MEMORY[0x1E4F1C978] arrayWithObjects:v261 count:85];
  v181 = (void *)metricDefinitions_defs;
  metricDefinitions_defs = v180;
}

+ (id)_makeMetric:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = [[TISKMetricDefinition alloc] init:v5 type:v4 metricDef:0 size:0 isPointMetric:0];

  return v6;
}

+ (id)_makeMetric:(id)a3 type:(int)a4 metricDef:(id *)a5 isPointMetric:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  id v10 = [[TISKMetricDefinition alloc] init:v9 type:v8 metricDef:a5 size:0 isPointMetric:v6];

  return v10;
}

+ (id)_makeMetric:(id)a3 type:(int)a4 metricDef:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = [[TISKMetricDefinition alloc] init:v7 type:v6 metricDef:a5 size:0 isPointMetric:0];

  return v8;
}

+ (id)_makeMetric:(id)a3 type:(int)a4 metricDef:(id *)a5 size:(unint64_t)a6
{
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  id v10 = [[TISKMetricDefinition alloc] init:v9 type:v8 metricDef:a5 size:a6 isPointMetric:0];

  return v10;
}

+ (id)_makeMetric:(id)a3 type:(int)a4 metricDef:(id *)a5 size:(unint64_t)a6 isPointMetric:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  id v12 = [[TISKMetricDefinition alloc] init:v11 type:v10 metricDef:a5 size:a6 isPointMetric:v7];

  return v12;
}

+ (double)pointsToMM:(double)a3
{
  unint64_t v4 = (int)MGGetSInt32Answer();
  MGGetFloat32Answer();
  return a3 * 25.3999996 * v5 / (double)v4;
}

@end