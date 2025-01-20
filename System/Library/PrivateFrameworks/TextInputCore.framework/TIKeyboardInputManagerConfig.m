@interface TIKeyboardInputManagerConfig
+ (id)configurationForInputMode:(id)a3;
- (BOOL)allowRelaxedOVSPolicy;
- (BOOL)allowsSpaceCorrections;
- (BOOL)completionsShouldSharePrefix;
- (BOOL)continuousPathCompletesWords;
- (BOOL)continuousPathDeleteWholeWord;
- (BOOL)continuousPathDetectPause;
- (BOOL)disableAnalytics;
- (BOOL)includeLightWeightLanguageModelMobileAssets;
- (BOOL)insertsSpaceAfterPredictiveInput;
- (BOOL)isTesting;
- (BOOL)languageAllowsCP;
- (BOOL)negativeLearningDisabled;
- (BOOL)sensorKitEnabled;
- (BOOL)shouldIgnoreCPRequirements;
- (BOOL)skipCandidateQualityFilter;
- (BOOL)skipLanguageLayoutCheckCPML;
- (BOOL)stickerSuggestionsEnabled;
- (BOOL)usesAdaptation;
- (BOOL)usesCJContinuousPath;
- (BOOL)usesContinuousPath;
- (BOOL)usesContinuousPathProgressiveCandidates;
- (BOOL)usesContinuousPathRetrocorrection;
- (BOOL)usesCustomNgramModel;
- (BOOL)usesCustomStaticDictionary;
- (BOOL)usesDODMLLogging;
- (BOOL)usesETSRescoring;
- (BOOL)usesRetrocorrection;
- (BOOL)usesStemSuffixCorrectionFactor;
- (BOOL)usesTextChecker;
- (BOOL)usesUserModelLogging;
- (BOOL)usesWordNgramModel;
- (NSArray)continuousPathEnsembleSourceScales;
- (NSArray)continuousPathEnsembleSourceWeights;
- (NSDictionary)continuousPathParams;
- (NSNumber)favoniusLanguageModelWeight;
- (NSString)dynamicResourcePath;
- (NSString)ngramModelPath;
- (NSString)shapeStoreResourceDir;
- (NSString)staticDictionaryPath;
- (NSURL)mlttBundleURL;
- (TIInputMode)inputMode;
- (double)continuousPathLanguageWeight;
- (id)propertyList;
- (int)continuousPathEnabledAlgorithms;
- (int)cpConfidenceModelType;
- (int64_t)cpCandidatesCount;
- (unint64_t)maxWordsPerPrediction;
- (unint64_t)sensorKitWordsThreshold;
- (void)setAllowRelaxedOVSPolicy:(BOOL)a3;
- (void)setAllowsSpaceCorrections:(BOOL)a3;
- (void)setCompletionsShouldSharePrefix:(BOOL)a3;
- (void)setContinuousPathCompletesWords:(BOOL)a3;
- (void)setContinuousPathDeleteWholeWord:(BOOL)a3;
- (void)setContinuousPathDetectPause:(BOOL)a3;
- (void)setContinuousPathEnabledAlgorithms:(int)a3;
- (void)setContinuousPathEnsembleSourceScales:(id)a3;
- (void)setContinuousPathEnsembleSourceWeights:(id)a3;
- (void)setContinuousPathLanguageWeight:(double)a3;
- (void)setContinuousPathParams:(id)a3;
- (void)setCpCandidatesCount:(int64_t)a3;
- (void)setCpConfidenceModelType:(int)a3;
- (void)setDisableAnalytics:(BOOL)a3;
- (void)setDynamicResourcePath:(id)a3;
- (void)setFavoniusLanguageModelWeight:(id)a3;
- (void)setIncludeLightWeightLanguageModelMobileAssets:(BOOL)a3;
- (void)setInputMode:(id)a3;
- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3;
- (void)setLanguageAllowsCP:(BOOL)a3;
- (void)setMaxWordsPerPrediction:(unint64_t)a3;
- (void)setMlttBundleURL:(id)a3;
- (void)setNegativeLearningDisabled:(BOOL)a3;
- (void)setNgramModelPath:(id)a3;
- (void)setSensorKitEnabled:(BOOL)a3;
- (void)setSensorKitWordsThreshold:(unint64_t)a3;
- (void)setShapeStoreResourceDir:(id)a3;
- (void)setShouldIgnoreCPRequirements:(BOOL)a3;
- (void)setSkipCandidateQualityFilter:(BOOL)a3;
- (void)setSkipLanguageLayoutCheckCPML:(BOOL)a3;
- (void)setStaticDictionaryPath:(id)a3;
- (void)setStickerSuggestionsEnabled:(BOOL)a3;
- (void)setTesting:(BOOL)a3;
- (void)setUsesAdaptation:(BOOL)a3;
- (void)setUsesCJContinuousPath:(BOOL)a3;
- (void)setUsesContinuousPath:(BOOL)a3;
- (void)setUsesContinuousPathProgressiveCandidates:(BOOL)a3;
- (void)setUsesContinuousPathRetrocorrection:(BOOL)a3;
- (void)setUsesCustomNgramModel:(BOOL)a3;
- (void)setUsesCustomStaticDictionary:(BOOL)a3;
- (void)setUsesDODMLLogging:(BOOL)a3;
- (void)setUsesETSRescoring:(BOOL)a3;
- (void)setUsesRetrocorrection:(BOOL)a3;
- (void)setUsesStemSuffixCorrectionFactor:(BOOL)a3;
- (void)setUsesTextChecker:(BOOL)a3;
- (void)setUsesUserModelLogging:(BOOL)a3;
- (void)setUsesWordNgramModel:(BOOL)a3;
@end

@implementation TIKeyboardInputManagerConfig

+ (id)configurationForInputMode:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FAE3D8];
  id v5 = a3;
  v6 = [v4 sharedPreferencesController];
  id v7 = objc_alloc_init((Class)a1);
  [v7 setInputMode:v5];
  v8 = [v7 inputMode];
  objc_msgSend(v7, "setAllowsSpaceCorrections:", objc_msgSend(v8, "spaceAutocorrectionEnabled"));

  v9 = [v7 inputMode];
  objc_msgSend(v7, "setUsesETSRescoring:", objc_msgSend(v9, "typedStringLMRankingEnabled"));

  v10 = [v5 normalizedIdentifier];

  v11 = TIGetInputModeProperties();

  v12 = [v11 objectForKey:*MEMORY[0x1E4FAE648]];
  objc_msgSend(v7, "setUsesTextChecker:", objc_msgSend(v12, "BOOLValue"));

  if (TIGetKeyboardRetrocorrectionDisabledValue_onceToken != -1) {
    dispatch_once(&TIGetKeyboardRetrocorrectionDisabledValue_onceToken, &__block_literal_global_18800);
  }
  v13 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v14 = [v13 valueForPreferenceKey:@"KeyboardRetrocorrectionDisabled"];

  objc_msgSend(v7, "setUsesRetrocorrection:", objc_msgSend(v14, "BOOLValue") ^ 1);
  if (TIGetKeyboardWordNgramModelValue_onceToken != -1) {
    dispatch_once(&TIGetKeyboardWordNgramModelValue_onceToken, &__block_literal_global_346_18802);
  }
  v15 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v16 = [v15 valueForPreferenceKey:@"KeyboardWordNgramModel"];

  if ([v16 BOOLValue])
  {
    v17 = [v11 objectForKey:*MEMORY[0x1E4FAE6B0]];
    objc_msgSend(v7, "setUsesWordNgramModel:", objc_msgSend(v17, "BOOLValue"));
  }
  else
  {
    [v7 setUsesWordNgramModel:0];
  }

  if (TIGetKeyboardWordNgramModelAdaptationValue_onceToken != -1) {
    dispatch_once(&TIGetKeyboardWordNgramModelAdaptationValue_onceToken, &__block_literal_global_351);
  }
  v18 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v19 = [v18 valueForPreferenceKey:@"KeyboardWordNgramModelAdaptation"];

  objc_msgSend(v7, "setUsesAdaptation:", objc_msgSend(v19, "BOOLValue"));
  if (TIGetKeyboardMaxWordsPerPredictionValue_onceToken != -1) {
    dispatch_once(&TIGetKeyboardMaxWordsPerPredictionValue_onceToken, &__block_literal_global_356);
  }
  v20 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v21 = [v20 valueForPreferenceKey:@"KeyboardMaxWordsPerPrediction"];

  objc_msgSend(v7, "setMaxWordsPerPrediction:", objc_msgSend(v21, "integerValue"));
  if (TIGetKeyboardCompletionsShouldSharePrefixValue_onceToken != -1) {
    dispatch_once(&TIGetKeyboardCompletionsShouldSharePrefixValue_onceToken, &__block_literal_global_364);
  }
  v22 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v23 = [v22 valueForPreferenceKey:@"KeyboardCompletionsShouldSharePrefix"];

  objc_msgSend(v7, "setCompletionsShouldSharePrefix:", objc_msgSend(v23, "BOOLValue"));
  v24 = [v11 objectForKey:*MEMORY[0x1E4FAE748]];
  objc_msgSend(v7, "setUsesStemSuffixCorrectionFactor:", objc_msgSend(v24, "BOOLValue"));

  v25 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE880]];
  objc_msgSend(v7, "setShouldIgnoreCPRequirements:", objc_msgSend(v25, "BOOLValue"));

  v26 = [v11 objectForKey:*MEMORY[0x1E4FAE658]];
  objc_msgSend(v7, "setLanguageAllowsCP:", objc_msgSend(v26, "BOOLValue"));

  if (([v7 languageAllowsCP] & 1) != 0 || objc_msgSend(v7, "shouldIgnoreCPRequirements"))
  {
    objc_msgSend(v7, "setUsesContinuousPath:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E4FAE840]));
    v27 = [v11 objectForKey:*MEMORY[0x1E4FAE670]];
    [v7 setContinuousPathParams:v27];
  }
  v28 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE7B8]];
  objc_msgSend(v7, "setUsesCJContinuousPath:", objc_msgSend(v28, "BOOLValue"));

  v29 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE820]];
  objc_msgSend(v7, "setContinuousPathCompletesWords:", objc_msgSend(v29, "BOOLValue"));

  v30 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE848]];
  [v30 doubleValue];
  objc_msgSend(v7, "setContinuousPathLanguageWeight:");

  objc_msgSend(v7, "setContinuousPathDeleteWholeWord:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E4FAE828]));
  objc_msgSend(v7, "setContinuousPathDetectPause:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E4FAE830]));
  objc_msgSend(v7, "setInsertsSpaceAfterPredictiveInput:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E4FAE8A8]));
  v31 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE838]];
  objc_msgSend(v7, "setContinuousPathEnabledAlgorithms:", objc_msgSend(v31, "integerValue"));

  objc_msgSend(v7, "setUsesContinuousPathRetrocorrection:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E4FAE858]));
  objc_msgSend(v7, "setUsesContinuousPathProgressiveCandidates:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E4FAE850]));
  objc_msgSend(v7, "setUsesDODMLLogging:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E4FAE860]));
  objc_msgSend(v7, "setSensorKitEnabled:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E4FAE9B8]));
  v32 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE9B0]];
  objc_msgSend(v7, "setSensorKitWordsThreshold:", objc_msgSend(v32, "integerValue"));

  objc_msgSend(v7, "setUsesUserModelLogging:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E4FAEA00]));
  objc_msgSend(v7, "setAllowRelaxedOVSPolicy:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E4FAE788]));
  v33 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE7C0]];
  v34 = v33;
  if (!v33) {
    v33 = &unk_1F3FA7CD0;
  }
  objc_msgSend(v7, "setCpCandidatesCount:", objc_msgSend(v33, "integerValue"));

  objc_msgSend(v7, "setSkipCandidateQualityFilter:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E4FAE9D0]));
  v35 = [v7 inputMode];
  int v36 = [v35 isSiriMode];

  v37 = [v7 inputMode];
  v38 = v37;
  if (v36)
  {
    v39 = UIKeyboardUnigramLexiconPathForInputMode(v37);
  }
  else
  {
    v40 = [v37 normalizedIdentifier];
    char IsTransliteration = TIInputModeIsTransliteration();
    v42 = [v7 inputMode];
    v43 = v42;
    if (IsTransliteration) {
      [v42 normalizedIdentifier];
    }
    else {
    v44 = [v42 languageWithRegion];
    }

    v39 = UIKeyboardStaticUnigramsFile(v44);
    v38 = v44;
  }
  [v7 setStaticDictionaryPath:v39];

  v45 = [v7 inputMode];
  v46 = [v45 languageWithRegion];
  v47 = TINgramModelPathForInputMode();
  [v7 setNgramModelPath:v47];

  v48 = UIKeyboardUserDirectory();
  [v7 setDynamicResourcePath:v48];

  v49 = UIKeyboardUserDirectory();
  [v7 setShapeStoreResourceDir:v49];

  v50 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE7C8]];
  objc_msgSend(v7, "setCpConfidenceModelType:", objc_msgSend(v50, "integerValue"));

  v51 = [v11 objectForKey:*MEMORY[0x1E4FAE6B8]];
  objc_msgSend(v7, "setIncludeLightWeightLanguageModelMobileAssets:", objc_msgSend(v51, "BOOLValue"));

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlttBundleURL, 0);
  objc_storeStrong((id *)&self->_favoniusLanguageModelWeight, 0);
  objc_storeStrong((id *)&self->_continuousPathEnsembleSourceScales, 0);
  objc_storeStrong((id *)&self->_continuousPathEnsembleSourceWeights, 0);
  objc_storeStrong((id *)&self->_continuousPathParams, 0);
  objc_storeStrong((id *)&self->_shapeStoreResourceDir, 0);
  objc_storeStrong((id *)&self->_ngramModelPath, 0);
  objc_storeStrong((id *)&self->_dynamicResourcePath, 0);
  objc_storeStrong((id *)&self->_staticDictionaryPath, 0);

  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (void)setMlttBundleURL:(id)a3
{
}

- (NSURL)mlttBundleURL
{
  return self->_mlttBundleURL;
}

- (void)setDisableAnalytics:(BOOL)a3
{
  self->_disableAnalytics = a3;
}

- (BOOL)disableAnalytics
{
  return self->_disableAnalytics;
}

- (void)setSkipCandidateQualityFilter:(BOOL)a3
{
  self->_skipCandidateQualityFilter = a3;
}

- (BOOL)skipCandidateQualityFilter
{
  return self->_skipCandidateQualityFilter;
}

- (void)setUsesUserModelLogging:(BOOL)a3
{
  self->_usesUserModelLogging = a3;
}

- (BOOL)usesUserModelLogging
{
  return self->_usesUserModelLogging;
}

- (void)setAllowRelaxedOVSPolicy:(BOOL)a3
{
  self->_allowRelaxedOVSPolicy = a3;
}

- (BOOL)allowRelaxedOVSPolicy
{
  return self->_allowRelaxedOVSPolicy;
}

- (void)setSensorKitWordsThreshold:(unint64_t)a3
{
  self->_sensorKitWordsThreshold = a3;
}

- (unint64_t)sensorKitWordsThreshold
{
  return self->_sensorKitWordsThreshold;
}

- (void)setSensorKitEnabled:(BOOL)a3
{
  self->_sensorKitEnabled = a3;
}

- (BOOL)sensorKitEnabled
{
  return self->_sensorKitEnabled;
}

- (void)setUsesDODMLLogging:(BOOL)a3
{
  self->_usesDODMLLogging = a3;
}

- (BOOL)usesDODMLLogging
{
  return self->_usesDODMLLogging;
}

- (void)setFavoniusLanguageModelWeight:(id)a3
{
}

- (NSNumber)favoniusLanguageModelWeight
{
  return self->_favoniusLanguageModelWeight;
}

- (void)setUsesCustomStaticDictionary:(BOOL)a3
{
  self->_usesCustomStaticDictionary = a3;
}

- (BOOL)usesCustomStaticDictionary
{
  return self->_usesCustomStaticDictionary;
}

- (void)setUsesCustomNgramModel:(BOOL)a3
{
  self->_usesCustomNgramModel = a3;
}

- (BOOL)usesCustomNgramModel
{
  return self->_usesCustomNgramModel;
}

- (void)setSkipLanguageLayoutCheckCPML:(BOOL)a3
{
  self->_skipLanguageLayoutCheckCPML = a3;
}

- (BOOL)skipLanguageLayoutCheckCPML
{
  return self->_skipLanguageLayoutCheckCPML;
}

- (void)setTesting:(BOOL)a3
{
  self->_testing = a3;
}

- (BOOL)isTesting
{
  return self->_testing;
}

- (void)setStickerSuggestionsEnabled:(BOOL)a3
{
  self->_stickerSuggestionsEnabled = a3;
}

- (BOOL)stickerSuggestionsEnabled
{
  return self->_stickerSuggestionsEnabled;
}

- (void)setUsesCJContinuousPath:(BOOL)a3
{
  self->_usesCJContinuousPath = a3;
}

- (BOOL)usesCJContinuousPath
{
  return self->_usesCJContinuousPath;
}

- (void)setIncludeLightWeightLanguageModelMobileAssets:(BOOL)a3
{
  self->_includeLightWeightLanguageModelMobileAssets = a3;
}

- (BOOL)includeLightWeightLanguageModelMobileAssets
{
  return self->_includeLightWeightLanguageModelMobileAssets;
}

- (void)setCpCandidatesCount:(int64_t)a3
{
  self->_cpCandidatesCount = a3;
}

- (int64_t)cpCandidatesCount
{
  return self->_cpCandidatesCount;
}

- (void)setCpConfidenceModelType:(int)a3
{
  self->_cpConfidenceModelType = a3;
}

- (int)cpConfidenceModelType
{
  return self->_cpConfidenceModelType;
}

- (void)setShouldIgnoreCPRequirements:(BOOL)a3
{
  self->_shouldIgnoreCPRequirements = a3;
}

- (BOOL)shouldIgnoreCPRequirements
{
  return self->_shouldIgnoreCPRequirements;
}

- (void)setUsesContinuousPathRetrocorrection:(BOOL)a3
{
  self->_usesContinuousPathRetrocorrection = a3;
}

- (BOOL)usesContinuousPathRetrocorrection
{
  return self->_usesContinuousPathRetrocorrection;
}

- (void)setContinuousPathEnabledAlgorithms:(int)a3
{
  self->_continuousPathEnabledAlgorithms = a3;
}

- (int)continuousPathEnabledAlgorithms
{
  return self->_continuousPathEnabledAlgorithms;
}

- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3
{
  self->_insertsSpaceAfterPredictiveInput = a3;
}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  return self->_insertsSpaceAfterPredictiveInput;
}

- (void)setContinuousPathCompletesWords:(BOOL)a3
{
  self->_continuousPathCompletesWords = a3;
}

- (BOOL)continuousPathCompletesWords
{
  return self->_continuousPathCompletesWords;
}

- (void)setContinuousPathDetectPause:(BOOL)a3
{
  self->_continuousPathDetectPause = a3;
}

- (BOOL)continuousPathDetectPause
{
  return self->_continuousPathDetectPause;
}

- (void)setContinuousPathDeleteWholeWord:(BOOL)a3
{
  self->_continuousPathDeleteWholeWord = a3;
}

- (BOOL)continuousPathDeleteWholeWord
{
  return self->_continuousPathDeleteWholeWord;
}

- (void)setContinuousPathLanguageWeight:(double)a3
{
  self->_continuousPathLanguageWeight = a3;
}

- (double)continuousPathLanguageWeight
{
  return self->_continuousPathLanguageWeight;
}

- (void)setUsesContinuousPathProgressiveCandidates:(BOOL)a3
{
  self->_usesContinuousPathProgressiveCandidates = a3;
}

- (BOOL)usesContinuousPathProgressiveCandidates
{
  return self->_usesContinuousPathProgressiveCandidates;
}

- (void)setContinuousPathEnsembleSourceScales:(id)a3
{
}

- (NSArray)continuousPathEnsembleSourceScales
{
  return self->_continuousPathEnsembleSourceScales;
}

- (void)setContinuousPathEnsembleSourceWeights:(id)a3
{
}

- (NSArray)continuousPathEnsembleSourceWeights
{
  return self->_continuousPathEnsembleSourceWeights;
}

- (void)setContinuousPathParams:(id)a3
{
}

- (NSDictionary)continuousPathParams
{
  return self->_continuousPathParams;
}

- (void)setUsesContinuousPath:(BOOL)a3
{
  self->_usesContinuousPath = a3;
}

- (BOOL)usesContinuousPath
{
  return self->_usesContinuousPath;
}

- (void)setLanguageAllowsCP:(BOOL)a3
{
  self->_languageAllowsCP = a3;
}

- (BOOL)languageAllowsCP
{
  return self->_languageAllowsCP;
}

- (void)setUsesETSRescoring:(BOOL)a3
{
  self->_usesETSRescoring = a3;
}

- (BOOL)usesETSRescoring
{
  return self->_usesETSRescoring;
}

- (void)setUsesStemSuffixCorrectionFactor:(BOOL)a3
{
  self->_usesStemSuffixCorrectionFactor = a3;
}

- (BOOL)usesStemSuffixCorrectionFactor
{
  return self->_usesStemSuffixCorrectionFactor;
}

- (void)setCompletionsShouldSharePrefix:(BOOL)a3
{
  self->_completionsShouldSharePrefix = a3;
}

- (BOOL)completionsShouldSharePrefix
{
  return self->_completionsShouldSharePrefix;
}

- (void)setMaxWordsPerPrediction:(unint64_t)a3
{
  self->_maxWordsPerPrediction = a3;
}

- (unint64_t)maxWordsPerPrediction
{
  return self->_maxWordsPerPrediction;
}

- (void)setNegativeLearningDisabled:(BOOL)a3
{
  self->_negativeLearningDisabled = a3;
}

- (BOOL)negativeLearningDisabled
{
  return self->_negativeLearningDisabled;
}

- (void)setUsesAdaptation:(BOOL)a3
{
  self->_usesAdaptation = a3;
}

- (BOOL)usesAdaptation
{
  return self->_usesAdaptation;
}

- (void)setUsesWordNgramModel:(BOOL)a3
{
  self->_usesWordNgramModel = a3;
}

- (BOOL)usesWordNgramModel
{
  return self->_usesWordNgramModel;
}

- (void)setUsesRetrocorrection:(BOOL)a3
{
  self->_usesRetrocorrection = a3;
}

- (BOOL)usesRetrocorrection
{
  return self->_usesRetrocorrection;
}

- (void)setUsesTextChecker:(BOOL)a3
{
  self->_usesTextChecker = a3;
}

- (BOOL)usesTextChecker
{
  return self->_usesTextChecker;
}

- (void)setAllowsSpaceCorrections:(BOOL)a3
{
  self->_allowsSpaceCorrections = a3;
}

- (BOOL)allowsSpaceCorrections
{
  return self->_allowsSpaceCorrections;
}

- (void)setShapeStoreResourceDir:(id)a3
{
}

- (NSString)shapeStoreResourceDir
{
  return self->_shapeStoreResourceDir;
}

- (void)setNgramModelPath:(id)a3
{
}

- (NSString)ngramModelPath
{
  return self->_ngramModelPath;
}

- (void)setDynamicResourcePath:(id)a3
{
}

- (NSString)dynamicResourcePath
{
  return self->_dynamicResourcePath;
}

- (void)setStaticDictionaryPath:(id)a3
{
}

- (NSString)staticDictionaryPath
{
  return self->_staticDictionaryPath;
}

- (void)setInputMode:(id)a3
{
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (id)propertyList
{
  v43[23] = *MEMORY[0x1E4F143B8];
  v42[0] = @"normalizedInputMode";
  v41 = [(TIKeyboardInputManagerConfig *)self inputMode];
  if (v41)
  {
    v26 = [(TIKeyboardInputManagerConfig *)self inputMode];
    v3 = [v26 normalizedIdentifier];
  }
  else
  {
    v3 = &stru_1F3F7A998;
  }
  v27 = v3;
  v43[0] = v3;
  v42[1] = @"staticDictionaryPath";
  uint64_t v4 = [(TIKeyboardInputManagerConfig *)self staticDictionaryPath];
  v40 = (void *)v4;
  if (v4) {
    id v5 = (__CFString *)v4;
  }
  else {
    id v5 = &stru_1F3F7A998;
  }
  v43[1] = v5;
  v42[2] = @"dynamicResourcePath";
  uint64_t v6 = [(TIKeyboardInputManagerConfig *)self dynamicResourcePath];
  v39 = (void *)v6;
  if (v6) {
    id v7 = (__CFString *)v6;
  }
  else {
    id v7 = &stru_1F3F7A998;
  }
  v43[2] = v7;
  v42[3] = @"ngramModelPath";
  uint64_t v8 = [(TIKeyboardInputManagerConfig *)self ngramModelPath];
  v38 = (void *)v8;
  if (v8) {
    v9 = (__CFString *)v8;
  }
  else {
    v9 = &stru_1F3F7A998;
  }
  v43[3] = v9;
  v42[4] = @"allowsSpaceCorrections";
  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig allowsSpaceCorrections](self, "allowsSpaceCorrections"));
  v43[4] = v37;
  v42[5] = @"usesTextChecker";
  int v36 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig usesTextChecker](self, "usesTextChecker"));
  v43[5] = v36;
  v42[6] = @"usesRetrocorrection";
  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig usesRetrocorrection](self, "usesRetrocorrection"));
  v43[6] = v35;
  v42[7] = @"usesWordNgramModel";
  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig usesWordNgramModel](self, "usesWordNgramModel"));
  v43[7] = v34;
  v42[8] = @"usesAdaptation";
  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig usesAdaptation](self, "usesAdaptation"));
  v43[8] = v33;
  v42[9] = @"maxWordsPerPrediction";
  v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TIKeyboardInputManagerConfig maxWordsPerPrediction](self, "maxWordsPerPrediction"));
  v43[9] = v32;
  v42[10] = @"completionsShouldSharePrefix";
  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig completionsShouldSharePrefix](self, "completionsShouldSharePrefix"));
  v43[10] = v31;
  v42[11] = @"usesContinuousPath";
  v30 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig usesContinuousPath](self, "usesContinuousPath"));
  v43[11] = v30;
  v42[12] = @"usesContinuousPathProgressiveCandidates";
  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig usesContinuousPathProgressiveCandidates](self, "usesContinuousPathProgressiveCandidates"));
  v43[12] = v29;
  v42[13] = @"continuousPathCompletesWords";
  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig continuousPathCompletesWords](self, "continuousPathCompletesWords"));
  v43[13] = v28;
  v42[14] = @"continuousPathLanguageWeight";
  v10 = NSNumber;
  [(TIKeyboardInputManagerConfig *)self continuousPathLanguageWeight];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v43[14] = v11;
  v42[15] = *MEMORY[0x1E4FAE828];
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig continuousPathDeleteWholeWord](self, "continuousPathDeleteWholeWord"));
  v43[15] = v12;
  v42[16] = *MEMORY[0x1E4FAE830];
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig continuousPathDetectPause](self, "continuousPathDetectPause"));
  v43[16] = v13;
  v42[17] = @"continuousPathParameters";
  uint64_t v14 = [(TIKeyboardInputManagerConfig *)self continuousPathParams];
  v15 = (void *)v14;
  uint64_t v16 = MEMORY[0x1E4F1CC08];
  if (v14) {
    uint64_t v16 = v14;
  }
  v43[17] = v16;
  v42[18] = @"insertsSpaceAfterPredictiveInput";
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig insertsSpaceAfterPredictiveInput](self, "insertsSpaceAfterPredictiveInput"));
  v43[18] = v17;
  v42[19] = @"usesCJContinuousPath";
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig usesCJContinuousPath](self, "usesCJContinuousPath"));
  v43[19] = v18;
  v42[20] = @"testing";
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig isTesting](self, "isTesting"));
  v43[20] = v19;
  v42[21] = @"usesDODMLLogging";
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardInputManagerConfig usesDODMLLogging](self, "usesDODMLLogging"));
  v43[21] = v20;
  v42[22] = @"shapeStoreResourceDir";
  uint64_t v21 = [(TIKeyboardInputManagerConfig *)self shapeStoreResourceDir];
  v22 = (void *)v21;
  v23 = &stru_1F3F7A998;
  if (v21) {
    v23 = (__CFString *)v21;
  }
  v43[22] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:23];

  if (v41)
  {
  }

  return v24;
}

@end