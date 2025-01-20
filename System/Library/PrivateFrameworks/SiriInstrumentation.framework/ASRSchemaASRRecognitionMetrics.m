@interface ASRSchemaASRRecognitionMetrics
- (ASRSchemaASREmojiMetrics)emojiMetrics;
- (ASRSchemaASRRecognitionMetrics)initWithDictionary:(id)a3;
- (ASRSchemaASRRecognitionMetrics)initWithJSON:(id)a3;
- (ASRSchemaASRRecognizerComponents)recognizerComponents;
- (ASRSchemaASRRescoringDeliberationResult)rescoringDeliberationResult;
- (BOOL)continuousListeningEnabled;
- (BOOL)eagerEnabled;
- (BOOL)hasAppleNeuralEngineCpuTimeInNs;
- (BOOL)hasAudioDurationInNs;
- (BOOL)hasAverageActiveTokensPerFrame;
- (BOOL)hasContinuousListeningEnabled;
- (BOOL)hasCpuInstructionsInMillionsPerSecond;
- (BOOL)hasCpuRealTimeFactor;
- (BOOL)hasEagerCustomerPerceivedLatencyInNs;
- (BOOL)hasEagerEnabled;
- (BOOL)hasEmojiMetrics;
- (BOOL)hasInverseTextNormalizationDurationForFinalResultInNs;
- (BOOL)hasInverseTextNormalizationDurationInNs;
- (BOOL)hasNumIngestedNeuralContextualBiasingEmbeddings;
- (BOOL)hasNumLanguageModelEnrollmentDataStreams;
- (BOOL)hasNumberOfInverseTextNormalizationRuns;
- (BOOL)hasNumberOfSecondaryPassRuns;
- (BOOL)hasPageInsWaitTimeInNs;
- (BOOL)hasPersonalizedLanguageModelAgeInNs;
- (BOOL)hasPersonalizedLanguageModelWeight;
- (BOOL)hasPhoneticMatchDecoderName;
- (BOOL)hasRecognitionDurationInNs;
- (BOOL)hasRecognitionHardware;
- (BOOL)hasRecognizerComponents;
- (BOOL)hasRescoringDeliberationResult;
- (BOOL)hasSecondaryPassDurationInNs;
- (BOOL)hasSignalToNoiseRatioInDecibels;
- (BOOL)hasUtteranceConcatenationEnabled;
- (BOOL)hasUtteranceDetectionEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)utteranceConcatenationEnabled;
- (BOOL)utteranceDetectionEnabled;
- (NSArray)languageModelInterpolationWeights;
- (NSArray)pauseReasons;
- (NSArray)pausedAudioDurationsInNs;
- (NSData)jsonData;
- (NSString)phoneticMatchDecoderName;
- (float)averageActiveTokensPerFrame;
- (float)cpuRealTimeFactor;
- (float)personalizedLanguageModelWeight;
- (float)signalToNoiseRatioInDecibels;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)languageModelInterpolationWeightsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)pauseReasonAtIndex:(unint64_t)a3;
- (int)recognitionHardware;
- (unint64_t)appleNeuralEngineCpuTimeInNs;
- (unint64_t)audioDurationInNs;
- (unint64_t)cpuInstructionsInMillionsPerSecond;
- (unint64_t)eagerCustomerPerceivedLatencyInNs;
- (unint64_t)hash;
- (unint64_t)inverseTextNormalizationDurationForFinalResultInNs;
- (unint64_t)inverseTextNormalizationDurationInNs;
- (unint64_t)languageModelInterpolationWeightsCount;
- (unint64_t)pageInsWaitTimeInNs;
- (unint64_t)pauseReasonCount;
- (unint64_t)pausedAudioDurationsInNsAtIndex:(unint64_t)a3;
- (unint64_t)pausedAudioDurationsInNsCount;
- (unint64_t)personalizedLanguageModelAgeInNs;
- (unint64_t)recognitionDurationInNs;
- (unint64_t)secondaryPassDurationInNs;
- (unsigned)numIngestedNeuralContextualBiasingEmbeddings;
- (unsigned)numLanguageModelEnrollmentDataStreams;
- (unsigned)numberOfInverseTextNormalizationRuns;
- (unsigned)numberOfSecondaryPassRuns;
- (void)addLanguageModelInterpolationWeights:(id)a3;
- (void)addPauseReason:(int)a3;
- (void)addPausedAudioDurationsInNs:(unint64_t)a3;
- (void)clearLanguageModelInterpolationWeights;
- (void)clearPauseReason;
- (void)clearPausedAudioDurationsInNs;
- (void)deleteAppleNeuralEngineCpuTimeInNs;
- (void)deleteAudioDurationInNs;
- (void)deleteAverageActiveTokensPerFrame;
- (void)deleteContinuousListeningEnabled;
- (void)deleteCpuInstructionsInMillionsPerSecond;
- (void)deleteCpuRealTimeFactor;
- (void)deleteEagerCustomerPerceivedLatencyInNs;
- (void)deleteEagerEnabled;
- (void)deleteEmojiMetrics;
- (void)deleteInverseTextNormalizationDurationForFinalResultInNs;
- (void)deleteInverseTextNormalizationDurationInNs;
- (void)deleteNumIngestedNeuralContextualBiasingEmbeddings;
- (void)deleteNumLanguageModelEnrollmentDataStreams;
- (void)deleteNumberOfInverseTextNormalizationRuns;
- (void)deleteNumberOfSecondaryPassRuns;
- (void)deletePageInsWaitTimeInNs;
- (void)deletePersonalizedLanguageModelAgeInNs;
- (void)deletePersonalizedLanguageModelWeight;
- (void)deletePhoneticMatchDecoderName;
- (void)deleteRecognitionDurationInNs;
- (void)deleteRecognitionHardware;
- (void)deleteRecognizerComponents;
- (void)deleteRescoringDeliberationResult;
- (void)deleteSecondaryPassDurationInNs;
- (void)deleteSignalToNoiseRatioInDecibels;
- (void)deleteUtteranceConcatenationEnabled;
- (void)deleteUtteranceDetectionEnabled;
- (void)setAppleNeuralEngineCpuTimeInNs:(unint64_t)a3;
- (void)setAudioDurationInNs:(unint64_t)a3;
- (void)setAverageActiveTokensPerFrame:(float)a3;
- (void)setContinuousListeningEnabled:(BOOL)a3;
- (void)setCpuInstructionsInMillionsPerSecond:(unint64_t)a3;
- (void)setCpuRealTimeFactor:(float)a3;
- (void)setEagerCustomerPerceivedLatencyInNs:(unint64_t)a3;
- (void)setEagerEnabled:(BOOL)a3;
- (void)setEmojiMetrics:(id)a3;
- (void)setHasAppleNeuralEngineCpuTimeInNs:(BOOL)a3;
- (void)setHasAudioDurationInNs:(BOOL)a3;
- (void)setHasAverageActiveTokensPerFrame:(BOOL)a3;
- (void)setHasContinuousListeningEnabled:(BOOL)a3;
- (void)setHasCpuInstructionsInMillionsPerSecond:(BOOL)a3;
- (void)setHasCpuRealTimeFactor:(BOOL)a3;
- (void)setHasEagerCustomerPerceivedLatencyInNs:(BOOL)a3;
- (void)setHasEagerEnabled:(BOOL)a3;
- (void)setHasEmojiMetrics:(BOOL)a3;
- (void)setHasInverseTextNormalizationDurationForFinalResultInNs:(BOOL)a3;
- (void)setHasInverseTextNormalizationDurationInNs:(BOOL)a3;
- (void)setHasNumIngestedNeuralContextualBiasingEmbeddings:(BOOL)a3;
- (void)setHasNumLanguageModelEnrollmentDataStreams:(BOOL)a3;
- (void)setHasNumberOfInverseTextNormalizationRuns:(BOOL)a3;
- (void)setHasNumberOfSecondaryPassRuns:(BOOL)a3;
- (void)setHasPageInsWaitTimeInNs:(BOOL)a3;
- (void)setHasPersonalizedLanguageModelAgeInNs:(BOOL)a3;
- (void)setHasPersonalizedLanguageModelWeight:(BOOL)a3;
- (void)setHasPhoneticMatchDecoderName:(BOOL)a3;
- (void)setHasRecognitionDurationInNs:(BOOL)a3;
- (void)setHasRecognitionHardware:(BOOL)a3;
- (void)setHasRecognizerComponents:(BOOL)a3;
- (void)setHasRescoringDeliberationResult:(BOOL)a3;
- (void)setHasSecondaryPassDurationInNs:(BOOL)a3;
- (void)setHasSignalToNoiseRatioInDecibels:(BOOL)a3;
- (void)setHasUtteranceConcatenationEnabled:(BOOL)a3;
- (void)setHasUtteranceDetectionEnabled:(BOOL)a3;
- (void)setInverseTextNormalizationDurationForFinalResultInNs:(unint64_t)a3;
- (void)setInverseTextNormalizationDurationInNs:(unint64_t)a3;
- (void)setLanguageModelInterpolationWeights:(id)a3;
- (void)setNumIngestedNeuralContextualBiasingEmbeddings:(unsigned int)a3;
- (void)setNumLanguageModelEnrollmentDataStreams:(unsigned int)a3;
- (void)setNumberOfInverseTextNormalizationRuns:(unsigned int)a3;
- (void)setNumberOfSecondaryPassRuns:(unsigned int)a3;
- (void)setPageInsWaitTimeInNs:(unint64_t)a3;
- (void)setPauseReasons:(id)a3;
- (void)setPausedAudioDurationsInNs:(id)a3;
- (void)setPersonalizedLanguageModelAgeInNs:(unint64_t)a3;
- (void)setPersonalizedLanguageModelWeight:(float)a3;
- (void)setPhoneticMatchDecoderName:(id)a3;
- (void)setRecognitionDurationInNs:(unint64_t)a3;
- (void)setRecognitionHardware:(int)a3;
- (void)setRecognizerComponents:(id)a3;
- (void)setRescoringDeliberationResult:(id)a3;
- (void)setSecondaryPassDurationInNs:(unint64_t)a3;
- (void)setSignalToNoiseRatioInDecibels:(float)a3;
- (void)setUtteranceConcatenationEnabled:(BOOL)a3;
- (void)setUtteranceDetectionEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRRecognitionMetrics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ASRSchemaASRRecognitionMetrics;
  v5 = [(SISchemaInstrumentationMessage *)&v18 applySensitiveConditionsPolicy:v4];
  v6 = [(ASRSchemaASRRecognitionMetrics *)self recognizerComponents];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ASRSchemaASRRecognitionMetrics *)self deleteRecognizerComponents];
  }
  v9 = [(ASRSchemaASRRecognitionMetrics *)self languageModelInterpolationWeights];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(ASRSchemaASRRecognitionMetrics *)self setLanguageModelInterpolationWeights:v10];

  v11 = [(ASRSchemaASRRecognitionMetrics *)self emojiMetrics];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(ASRSchemaASRRecognitionMetrics *)self deleteEmojiMetrics];
  }
  v14 = [(ASRSchemaASRRecognitionMetrics *)self rescoringDeliberationResult];
  v15 = [v14 applySensitiveConditionsPolicy:v4];
  int v16 = [v15 suppressMessage];

  if (v16) {
    [(ASRSchemaASRRecognitionMetrics *)self deleteRescoringDeliberationResult];
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
  objc_storeStrong((id *)&self->_rescoringDeliberationResult, 0);
  objc_storeStrong((id *)&self->_pauseReasons, 0);
  objc_storeStrong((id *)&self->_pausedAudioDurationsInNs, 0);
  objc_storeStrong((id *)&self->_emojiMetrics, 0);
  objc_storeStrong((id *)&self->_phoneticMatchDecoderName, 0);
  objc_storeStrong((id *)&self->_languageModelInterpolationWeights, 0);
  objc_storeStrong((id *)&self->_recognizerComponents, 0);
}

- (void)setHasRescoringDeliberationResult:(BOOL)a3
{
  self->_hasEmojiMetrics = a3;
}

- (void)setHasEmojiMetrics:(BOOL)a3
{
  self->_hasPhoneticMatchDecoderName = a3;
}

- (void)setHasPhoneticMatchDecoderName:(BOOL)a3
{
  self->_hasRecognizerComponents = a3;
}

- (void)setHasRecognizerComponents:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setRescoringDeliberationResult:(id)a3
{
}

- (ASRSchemaASRRescoringDeliberationResult)rescoringDeliberationResult
{
  return self->_rescoringDeliberationResult;
}

- (void)setPauseReasons:(id)a3
{
}

- (NSArray)pauseReasons
{
  return self->_pauseReasons;
}

- (unsigned)numIngestedNeuralContextualBiasingEmbeddings
{
  return self->_numIngestedNeuralContextualBiasingEmbeddings;
}

- (int)recognitionHardware
{
  return self->_recognitionHardware;
}

- (unint64_t)pageInsWaitTimeInNs
{
  return self->_pageInsWaitTimeInNs;
}

- (unint64_t)appleNeuralEngineCpuTimeInNs
{
  return self->_appleNeuralEngineCpuTimeInNs;
}

- (unint64_t)cpuInstructionsInMillionsPerSecond
{
  return self->_cpuInstructionsInMillionsPerSecond;
}

- (unsigned)numberOfSecondaryPassRuns
{
  return self->_numberOfSecondaryPassRuns;
}

- (unint64_t)secondaryPassDurationInNs
{
  return self->_secondaryPassDurationInNs;
}

- (unsigned)numberOfInverseTextNormalizationRuns
{
  return self->_numberOfInverseTextNormalizationRuns;
}

- (unint64_t)inverseTextNormalizationDurationForFinalResultInNs
{
  return self->_inverseTextNormalizationDurationForFinalResultInNs;
}

- (void)setPausedAudioDurationsInNs:(id)a3
{
}

- (NSArray)pausedAudioDurationsInNs
{
  return self->_pausedAudioDurationsInNs;
}

- (void)setEmojiMetrics:(id)a3
{
}

- (ASRSchemaASREmojiMetrics)emojiMetrics
{
  return self->_emojiMetrics;
}

- (unint64_t)inverseTextNormalizationDurationInNs
{
  return self->_inverseTextNormalizationDurationInNs;
}

- (void)setPhoneticMatchDecoderName:(id)a3
{
}

- (NSString)phoneticMatchDecoderName
{
  return self->_phoneticMatchDecoderName;
}

- (unsigned)numLanguageModelEnrollmentDataStreams
{
  return self->_numLanguageModelEnrollmentDataStreams;
}

- (float)cpuRealTimeFactor
{
  return self->_cpuRealTimeFactor;
}

- (unint64_t)eagerCustomerPerceivedLatencyInNs
{
  return self->_eagerCustomerPerceivedLatencyInNs;
}

- (BOOL)continuousListeningEnabled
{
  return self->_continuousListeningEnabled;
}

- (BOOL)utteranceConcatenationEnabled
{
  return self->_utteranceConcatenationEnabled;
}

- (BOOL)utteranceDetectionEnabled
{
  return self->_utteranceDetectionEnabled;
}

- (BOOL)eagerEnabled
{
  return self->_eagerEnabled;
}

- (unint64_t)audioDurationInNs
{
  return self->_audioDurationInNs;
}

- (unint64_t)recognitionDurationInNs
{
  return self->_recognitionDurationInNs;
}

- (float)signalToNoiseRatioInDecibels
{
  return self->_signalToNoiseRatioInDecibels;
}

- (void)setLanguageModelInterpolationWeights:(id)a3
{
}

- (NSArray)languageModelInterpolationWeights
{
  return self->_languageModelInterpolationWeights;
}

- (float)averageActiveTokensPerFrame
{
  return self->_averageActiveTokensPerFrame;
}

- (void)setRecognizerComponents:(id)a3
{
}

- (ASRSchemaASRRecognizerComponents)recognizerComponents
{
  return self->_recognizerComponents;
}

- (float)personalizedLanguageModelWeight
{
  return self->_personalizedLanguageModelWeight;
}

- (unint64_t)personalizedLanguageModelAgeInNs
{
  return self->_personalizedLanguageModelAgeInNs;
}

- (ASRSchemaASRRecognitionMetrics)initWithDictionary:(id)a3
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)ASRSchemaASRRecognitionMetrics;
  v5 = [(ASRSchemaASRRecognitionMetrics *)&v104 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"personalizedLanguageModelAgeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setPersonalizedLanguageModelAgeInNs:](v5, "setPersonalizedLanguageModelAgeInNs:", [v6 unsignedLongLongValue]);
    }
    v72 = v6;
    v7 = [v4 objectForKeyedSubscript:@"personalizedLanguageModelWeight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[ASRSchemaASRRecognitionMetrics setPersonalizedLanguageModelWeight:](v5, "setPersonalizedLanguageModelWeight:");
    }
    v71 = v7;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"recognizerComponents"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ASRSchemaASRRecognizerComponents alloc] initWithDictionary:v8];
      [(ASRSchemaASRRecognitionMetrics *)v5 setRecognizerComponents:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"averageActiveTokensPerFrame"];
    objc_opt_class();
    v90 = v10;
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[ASRSchemaASRRecognitionMetrics setAverageActiveTokensPerFrame:](v5, "setAverageActiveTokensPerFrame:");
    }
    v11 = [v4 objectForKeyedSubscript:@"languageModelInterpolationWeights"];
    objc_opt_class();
    v89 = v11;
    v91 = (void *)v8;
    if (objc_opt_isKindOfClass())
    {
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v100 objects:v107 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v101;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v101 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v100 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_super v18 = [[ASRSchemaASRInterpolationWeightBundle alloc] initWithDictionary:v17];
              [(ASRSchemaASRRecognitionMetrics *)v5 addLanguageModelInterpolationWeights:v18];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v100 objects:v107 count:16];
        }
        while (v14);
      }

      uint64_t v8 = (uint64_t)v91;
    }
    v19 = [v4 objectForKeyedSubscript:@"signalToNoiseRatioInDecibels"];
    objc_opt_class();
    v88 = v19;
    if (objc_opt_isKindOfClass())
    {
      [v19 floatValue];
      -[ASRSchemaASRRecognitionMetrics setSignalToNoiseRatioInDecibels:](v5, "setSignalToNoiseRatioInDecibels:");
    }
    v20 = [v4 objectForKeyedSubscript:@"recognitionDurationInNs"];
    objc_opt_class();
    v87 = v20;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setRecognitionDurationInNs:](v5, "setRecognitionDurationInNs:", [v20 unsignedLongLongValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"audioDurationInNs"];
    objc_opt_class();
    v86 = v21;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setAudioDurationInNs:](v5, "setAudioDurationInNs:", [v21 unsignedLongLongValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"eagerEnabled"];
    objc_opt_class();
    v85 = v22;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setEagerEnabled:](v5, "setEagerEnabled:", [v22 BOOLValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"utteranceDetectionEnabled"];
    objc_opt_class();
    v84 = v23;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setUtteranceDetectionEnabled:](v5, "setUtteranceDetectionEnabled:", [v23 BOOLValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"utteranceConcatenationEnabled"];
    objc_opt_class();
    v83 = v24;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setUtteranceConcatenationEnabled:](v5, "setUtteranceConcatenationEnabled:", [v24 BOOLValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"continuousListeningEnabled"];
    objc_opt_class();
    v82 = v25;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setContinuousListeningEnabled:](v5, "setContinuousListeningEnabled:", [v25 BOOLValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"eagerCustomerPerceivedLatencyInNs"];
    objc_opt_class();
    v81 = v26;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setEagerCustomerPerceivedLatencyInNs:](v5, "setEagerCustomerPerceivedLatencyInNs:", [v26 unsignedLongLongValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"cpuRealTimeFactor"];
    objc_opt_class();
    v80 = v27;
    if (objc_opt_isKindOfClass())
    {
      [v27 floatValue];
      -[ASRSchemaASRRecognitionMetrics setCpuRealTimeFactor:](v5, "setCpuRealTimeFactor:");
    }
    v28 = [v4 objectForKeyedSubscript:@"numLanguageModelEnrollmentDataStreams"];
    objc_opt_class();
    v79 = v28;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setNumLanguageModelEnrollmentDataStreams:](v5, "setNumLanguageModelEnrollmentDataStreams:", [v28 unsignedIntValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"phoneticMatchDecoderName"];
    objc_opt_class();
    v78 = v29;
    if (objc_opt_isKindOfClass())
    {
      v30 = (void *)[v29 copy];
      [(ASRSchemaASRRecognitionMetrics *)v5 setPhoneticMatchDecoderName:v30];
    }
    v31 = [v4 objectForKeyedSubscript:@"inverseTextNormalizationDurationInNs"];
    objc_opt_class();
    v77 = v31;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setInverseTextNormalizationDurationInNs:](v5, "setInverseTextNormalizationDurationInNs:", [v31 unsignedLongLongValue]);
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"emojiMetrics"];
    objc_opt_class();
    v76 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      v33 = [[ASRSchemaASREmojiMetrics alloc] initWithDictionary:v32];
      [(ASRSchemaASRRecognitionMetrics *)v5 setEmojiMetrics:v33];
    }
    v34 = [v4 objectForKeyedSubscript:@"pausedAudioDurationsInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      v35 = v34;
      id v36 = v34;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v96 objects:v106 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v97;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v97 != v39) {
              objc_enumerationMutation(v36);
            }
            v41 = *(void **)(*((void *)&v96 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[ASRSchemaASRRecognitionMetrics addPausedAudioDurationsInNs:](v5, "addPausedAudioDurationsInNs:", [v41 unsignedLongLongValue]);
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v96 objects:v106 count:16];
        }
        while (v38);
      }

      uint64_t v8 = (uint64_t)v91;
      v34 = v35;
    }
    v42 = [v4 objectForKeyedSubscript:@"inverseTextNormalizationDurationForFinalResultInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setInverseTextNormalizationDurationForFinalResultInNs:](v5, "setInverseTextNormalizationDurationForFinalResultInNs:", [v42 unsignedLongLongValue]);
    }
    v43 = [v4 objectForKeyedSubscript:@"numberOfInverseTextNormalizationRuns"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setNumberOfInverseTextNormalizationRuns:](v5, "setNumberOfInverseTextNormalizationRuns:", [v43 unsignedIntValue]);
    }
    v44 = [v4 objectForKeyedSubscript:@"secondaryPassDurationInNs"];
    objc_opt_class();
    v75 = v44;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setSecondaryPassDurationInNs:](v5, "setSecondaryPassDurationInNs:", [v44 unsignedLongLongValue]);
    }
    v45 = [v4 objectForKeyedSubscript:@"numberOfSecondaryPassRuns"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setNumberOfSecondaryPassRuns:](v5, "setNumberOfSecondaryPassRuns:", [v45 unsignedIntValue]);
    }
    v69 = v45;
    uint64_t v46 = [v4 objectForKeyedSubscript:@"cpuInstructionsInMillionsPerSecond"];
    objc_opt_class();
    v74 = (void *)v46;
    v47 = (void *)v8;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setCpuInstructionsInMillionsPerSecond:](v5, "setCpuInstructionsInMillionsPerSecond:", [v74 unsignedLongLongValue]);
    }
    v48 = [v4 objectForKeyedSubscript:@"appleNeuralEngineCpuTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setAppleNeuralEngineCpuTimeInNs:](v5, "setAppleNeuralEngineCpuTimeInNs:", [v48 unsignedLongLongValue]);
    }
    v49 = [v4 objectForKeyedSubscript:@"pageInsWaitTimeInNs"];
    objc_opt_class();
    v73 = v49;
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setPageInsWaitTimeInNs:](v5, "setPageInsWaitTimeInNs:", [v49 unsignedLongLongValue]);
    }
    v50 = [v4 objectForKeyedSubscript:@"recognitionHardware"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setRecognitionHardware:](v5, "setRecognitionHardware:", [v50 intValue]);
    }
    v68 = v50;
    v70 = v43;
    v51 = [v4 objectForKeyedSubscript:@"numIngestedNeuralContextualBiasingEmbeddings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRRecognitionMetrics setNumIngestedNeuralContextualBiasingEmbeddings:](v5, "setNumIngestedNeuralContextualBiasingEmbeddings:", [v51 unsignedIntValue]);
    }
    v67 = v51;
    v52 = [v4 objectForKeyedSubscript:@"pauseReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v64 = v48;
      v65 = v42;
      v66 = v34;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v53 = v52;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v92 objects:v105 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v93;
        do
        {
          for (uint64_t k = 0; k != v55; ++k)
          {
            if (*(void *)v93 != v56) {
              objc_enumerationMutation(v53);
            }
            v58 = *(void **)(*((void *)&v92 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[ASRSchemaASRRecognitionMetrics addPauseReason:](v5, "addPauseReason:", [v58 intValue]);
            }
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v92 objects:v105 count:16];
        }
        while (v55);
      }

      v47 = v91;
      v42 = v65;
      v34 = v66;
      v48 = v64;
    }
    v59 = objc_msgSend(v4, "objectForKeyedSubscript:", @"rescoringDeliberationResult", v64, v65, v66);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v60 = v48;
      v61 = [[ASRSchemaASRRescoringDeliberationResult alloc] initWithDictionary:v59];
      [(ASRSchemaASRRecognitionMetrics *)v5 setRescoringDeliberationResult:v61];

      v48 = v60;
    }
    v62 = v5;
  }
  return v5;
}

- (ASRSchemaASRRecognitionMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRRecognitionMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRRecognitionMetrics *)self dictionaryRepresentation];
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
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v4 & 0x80000) != 0)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics appleNeuralEngineCpuTimeInNs](self, "appleNeuralEngineCpuTimeInNs"));
    [v3 setObject:v8 forKeyedSubscript:@"appleNeuralEngineCpuTimeInNs"];

    $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
    int v4 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics audioDurationInNs](self, "audioDurationInNs"));
  [v3 setObject:v10 forKeyedSubscript:@"audioDurationInNs"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_4:
    if ((v4 & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v11 = NSNumber;
  [(ASRSchemaASRRecognitionMetrics *)self averageActiveTokensPerFrame];
  id v12 = objc_msgSend(v11, "numberWithFloat:");
  [v3 setObject:v12 forKeyedSubscript:@"averageActiveTokensPerFrame"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_5:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRRecognitionMetrics continuousListeningEnabled](self, "continuousListeningEnabled"));
  [v3 setObject:v13 forKeyedSubscript:@"continuousListeningEnabled"];

  int v4 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v4 & 0x40000) == 0)
  {
LABEL_6:
    if ((v4 & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics cpuInstructionsInMillionsPerSecond](self, "cpuInstructionsInMillionsPerSecond"));
  [v3 setObject:v14 forKeyedSubscript:@"cpuInstructionsInMillionsPerSecond"];

  LOWORD(v4) = self->_has;
  if ((v4 & 0x800) == 0)
  {
LABEL_7:
    if ((v4 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v15 = NSNumber;
  [(ASRSchemaASRRecognitionMetrics *)self cpuRealTimeFactor];
  int v16 = objc_msgSend(v15, "numberWithFloat:");
  [v3 setObject:v16 forKeyedSubscript:@"cpuRealTimeFactor"];

  LOWORD(v4) = self->_has;
  if ((v4 & 0x400) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics eagerCustomerPerceivedLatencyInNs](self, "eagerCustomerPerceivedLatencyInNs"));
  [v3 setObject:v17 forKeyedSubscript:@"eagerCustomerPerceivedLatencyInNs"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRRecognitionMetrics eagerEnabled](self, "eagerEnabled"));
    [v3 setObject:v5 forKeyedSubscript:@"eagerEnabled"];
  }
LABEL_10:
  if (self->_emojiMetrics)
  {
    v6 = [(ASRSchemaASRRecognitionMetrics *)self emojiMetrics];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"emojiMetrics"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"emojiMetrics"];
    }
  }
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 0x4000) != 0)
  {
    v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics inverseTextNormalizationDurationForFinalResultInNs](self, "inverseTextNormalizationDurationForFinalResultInNs"));
    [v3 setObject:v20 forKeyedSubscript:@"inverseTextNormalizationDurationForFinalResultInNs"];

    __int16 v19 = (__int16)self->_has;
  }
  if ((v19 & 0x2000) != 0)
  {
    v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics inverseTextNormalizationDurationInNs](self, "inverseTextNormalizationDurationInNs"));
    [v3 setObject:v21 forKeyedSubscript:@"inverseTextNormalizationDurationInNs"];
  }
  if ([(NSArray *)self->_languageModelInterpolationWeights count])
  {
    v22 = [MEMORY[0x1E4F1CA48] array];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v23 = self->_languageModelInterpolationWeights;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v68 objects:v72 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v69 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v68 + 1) + 8 * i) dictionaryRepresentation];
          if (v28)
          {
            [v22 addObject:v28];
          }
          else
          {
            v29 = [MEMORY[0x1E4F1CA98] null];
            [v22 addObject:v29];
          }
        }
        uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v68 objects:v72 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKeyedSubscript:@"languageModelInterpolationWeights"];
  }
  int v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v30 & 0x400000) != 0)
  {
    v50 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ASRSchemaASRRecognitionMetrics numIngestedNeuralContextualBiasingEmbeddings](self, "numIngestedNeuralContextualBiasingEmbeddings"));
    [v3 setObject:v50 forKeyedSubscript:@"numIngestedNeuralContextualBiasingEmbeddings"];

    $E30954924D96ED8F3D7A4FB9D02E1EA5 v51 = self->_has;
    int v30 = *(_DWORD *)&v51 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(_WORD *)&v51 & 0x1000) == 0)
    {
LABEL_41:
      if ((v30 & 0x8000) == 0) {
        goto LABEL_42;
      }
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_41;
  }
  v52 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ASRSchemaASRRecognitionMetrics numLanguageModelEnrollmentDataStreams](self, "numLanguageModelEnrollmentDataStreams"));
  [v3 setObject:v52 forKeyedSubscript:@"numLanguageModelEnrollmentDataStreams"];

  int v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_42:
    if ((v30 & 0x20000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_70;
  }
LABEL_69:
  id v53 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ASRSchemaASRRecognitionMetrics numberOfInverseTextNormalizationRuns](self, "numberOfInverseTextNormalizationRuns"));
  [v3 setObject:v53 forKeyedSubscript:@"numberOfInverseTextNormalizationRuns"];

  int v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v30 & 0x20000) == 0)
  {
LABEL_43:
    if ((v30 & 0x100000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_70:
  uint64_t v54 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ASRSchemaASRRecognitionMetrics numberOfSecondaryPassRuns](self, "numberOfSecondaryPassRuns"));
  [v3 setObject:v54 forKeyedSubscript:@"numberOfSecondaryPassRuns"];

  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x100000) != 0)
  {
LABEL_44:
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics pageInsWaitTimeInNs](self, "pageInsWaitTimeInNs"));
    [v3 setObject:v31 forKeyedSubscript:@"pageInsWaitTimeInNs"];
  }
LABEL_45:
  if ([(NSArray *)self->_pauseReasons count])
  {
    uint64_t v32 = [(ASRSchemaASRRecognitionMetrics *)self pauseReasons];
    v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"pauseReason"];
  }
  if ([(NSArray *)self->_pausedAudioDurationsInNs count])
  {
    v34 = [(ASRSchemaASRRecognitionMetrics *)self pausedAudioDurationsInNs];
    v35 = (void *)[v34 copy];
    [v3 setObject:v35 forKeyedSubscript:@"pausedAudioDurationsInNs"];
  }
  LOBYTE(v36) = self->_has;
  if (*(_WORD *)&self->_has)
  {
    uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics personalizedLanguageModelAgeInNs](self, "personalizedLanguageModelAgeInNs"));
    [v3 setObject:v37 forKeyedSubscript:@"personalizedLanguageModelAgeInNs"];

    __int16 v36 = (__int16)self->_has;
  }
  if ((v36 & 2) != 0)
  {
    uint64_t v38 = NSNumber;
    [(ASRSchemaASRRecognitionMetrics *)self personalizedLanguageModelWeight];
    uint64_t v39 = objc_msgSend(v38, "numberWithFloat:");
    [v3 setObject:v39 forKeyedSubscript:@"personalizedLanguageModelWeight"];
  }
  if (self->_phoneticMatchDecoderName)
  {
    v40 = [(ASRSchemaASRRecognitionMetrics *)self phoneticMatchDecoderName];
    v41 = (void *)[v40 copy];
    [v3 setObject:v41 forKeyedSubscript:@"phoneticMatchDecoderName"];
  }
  $E30954924D96ED8F3D7A4FB9D02E1EA5 v42 = self->_has;
  int v43 = *(_DWORD *)&v42 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(unsigned char *)&v42 & 0x10) != 0)
  {
    v44 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics recognitionDurationInNs](self, "recognitionDurationInNs"));
    [v3 setObject:v44 forKeyedSubscript:@"recognitionDurationInNs"];

    int v43 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  }
  if ((v43 & 0x200000) != 0)
  {
    int v45 = [(ASRSchemaASRRecognitionMetrics *)self recognitionHardware];
    uint64_t v46 = @"ASRSPEECHRECOGNITIONHARDWARE_UNKNOWN";
    if (v45 == 1) {
      uint64_t v46 = @"ASRSPEECHRECOGNITIONHARDWARE_CPU";
    }
    if (v45 == 2) {
      v47 = @"ASRSPEECHRECOGNITIONHARDWARE_APPLE_NEURAL_ENGINE";
    }
    else {
      v47 = v46;
    }
    [v3 setObject:v47 forKeyedSubscript:@"recognitionHardware"];
  }
  if (self->_recognizerComponents)
  {
    v48 = [(ASRSchemaASRRecognitionMetrics *)self recognizerComponents];
    v49 = [v48 dictionaryRepresentation];
    if (v49)
    {
      [v3 setObject:v49 forKeyedSubscript:@"recognizerComponents"];
    }
    else
    {
      uint64_t v55 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v55 forKeyedSubscript:@"recognizerComponents"];
    }
  }
  if (self->_rescoringDeliberationResult)
  {
    uint64_t v56 = [(ASRSchemaASRRecognitionMetrics *)self rescoringDeliberationResult];
    v57 = [v56 dictionaryRepresentation];
    if (v57)
    {
      [v3 setObject:v57 forKeyedSubscript:@"rescoringDeliberationResult"];
    }
    else
    {
      v58 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v58 forKeyedSubscript:@"rescoringDeliberationResult"];
    }
  }
  p_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = &self->_has;
  int v60 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v60 & 0x10000) != 0)
  {
    v64 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ASRSchemaASRRecognitionMetrics secondaryPassDurationInNs](self, "secondaryPassDurationInNs"));
    [v3 setObject:v64 forKeyedSubscript:@"secondaryPassDurationInNs"];

    LOWORD(v60) = *(_WORD *)p_has;
    if ((*(_WORD *)p_has & 8) == 0)
    {
LABEL_81:
      if ((v60 & 0x100) == 0) {
        goto LABEL_82;
      }
LABEL_87:
      v67 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRRecognitionMetrics utteranceConcatenationEnabled](self, "utteranceConcatenationEnabled"));
      [v3 setObject:v67 forKeyedSubscript:@"utteranceConcatenationEnabled"];

      if ((*(_WORD *)&self->_has & 0x80) == 0) {
        goto LABEL_84;
      }
      goto LABEL_83;
    }
  }
  else if ((*(_WORD *)&self->_has & 8) == 0)
  {
    goto LABEL_81;
  }
  v65 = NSNumber;
  [(ASRSchemaASRRecognitionMetrics *)self signalToNoiseRatioInDecibels];
  v66 = objc_msgSend(v65, "numberWithFloat:");
  [v3 setObject:v66 forKeyedSubscript:@"signalToNoiseRatioInDecibels"];

  LOWORD(v60) = self->_has;
  if ((v60 & 0x100) != 0) {
    goto LABEL_87;
  }
LABEL_82:
  if ((v60 & 0x80) != 0)
  {
LABEL_83:
    v61 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRRecognitionMetrics utteranceDetectionEnabled](self, "utteranceDetectionEnabled"));
    [v3 setObject:v61 forKeyedSubscript:@"utteranceDetectionEnabled"];
  }
LABEL_84:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v62 = v3;

  return v62;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v55 = 2654435761u * self->_personalizedLanguageModelAgeInNs;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  unint64_t v55 = 0;
  if ((has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float personalizedLanguageModelWeight = self->_personalizedLanguageModelWeight;
  double v5 = personalizedLanguageModelWeight;
  if (personalizedLanguageModelWeight < 0.0) {
    double v5 = -personalizedLanguageModelWeight;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  unint64_t v54 = v8;
  unint64_t v53 = [(ASRSchemaASRRecognizerComponents *)self->_recognizerComponents hash];
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    float averageActiveTokensPerFrame = self->_averageActiveTokensPerFrame;
    double v11 = averageActiveTokensPerFrame;
    if (averageActiveTokensPerFrame < 0.0) {
      double v11 = -averageActiveTokensPerFrame;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v52 = v9;
  uint64_t v51 = [(NSArray *)self->_languageModelInterpolationWeights hash];
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 8) != 0)
  {
    float signalToNoiseRatioInDecibels = self->_signalToNoiseRatioInDecibels;
    double v17 = signalToNoiseRatioInDecibels;
    if (signalToNoiseRatioInDecibels < 0.0) {
      double v17 = -signalToNoiseRatioInDecibels;
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
  if ((v14 & 0x10) != 0)
  {
    unint64_t v50 = 2654435761u * self->_recognitionDurationInNs;
    if ((v14 & 0x20) != 0)
    {
LABEL_29:
      unint64_t v49 = 2654435761u * self->_audioDurationInNs;
      if ((v14 & 0x40) != 0) {
        goto LABEL_30;
      }
      goto LABEL_41;
    }
  }
  else
  {
    unint64_t v50 = 0;
    if ((v14 & 0x20) != 0) {
      goto LABEL_29;
    }
  }
  unint64_t v49 = 0;
  if ((v14 & 0x40) != 0)
  {
LABEL_30:
    uint64_t v48 = 2654435761 * self->_eagerEnabled;
    if ((v14 & 0x80) != 0) {
      goto LABEL_31;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v48 = 0;
  if ((v14 & 0x80) != 0)
  {
LABEL_31:
    uint64_t v47 = 2654435761 * self->_utteranceDetectionEnabled;
    if ((v14 & 0x100) != 0) {
      goto LABEL_32;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v47 = 0;
  if ((v14 & 0x100) != 0)
  {
LABEL_32:
    uint64_t v46 = 2654435761 * self->_utteranceConcatenationEnabled;
    if ((v14 & 0x200) != 0) {
      goto LABEL_33;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v46 = 0;
  if ((v14 & 0x200) != 0)
  {
LABEL_33:
    uint64_t v45 = 2654435761 * self->_continuousListeningEnabled;
    if ((v14 & 0x400) != 0) {
      goto LABEL_34;
    }
LABEL_45:
    unint64_t v20 = 0;
    if ((v14 & 0x800) != 0) {
      goto LABEL_35;
    }
LABEL_46:
    unint64_t v25 = 0;
    goto LABEL_49;
  }
LABEL_44:
  uint64_t v45 = 0;
  if ((v14 & 0x400) == 0) {
    goto LABEL_45;
  }
LABEL_34:
  unint64_t v20 = 2654435761u * self->_eagerCustomerPerceivedLatencyInNs;
  if ((v14 & 0x800) == 0) {
    goto LABEL_46;
  }
LABEL_35:
  float cpuRealTimeFactor = self->_cpuRealTimeFactor;
  double v22 = cpuRealTimeFactor;
  if (cpuRealTimeFactor < 0.0) {
    double v22 = -cpuRealTimeFactor;
  }
  long double v23 = floor(v22 + 0.5);
  double v24 = (v22 - v23) * 1.84467441e19;
  unint64_t v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
  if (v24 >= 0.0)
  {
    if (v24 > 0.0) {
      v25 += (unint64_t)v24;
    }
  }
  else
  {
    v25 -= (unint64_t)fabs(v24);
  }
LABEL_49:
  if ((v14 & 0x1000) != 0) {
    uint64_t v26 = 2654435761 * self->_numLanguageModelEnrollmentDataStreams;
  }
  else {
    uint64_t v26 = 0;
  }
  NSUInteger v27 = [(NSString *)self->_phoneticMatchDecoderName hash];
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    unint64_t v28 = 2654435761u * self->_inverseTextNormalizationDurationInNs;
  }
  else {
    unint64_t v28 = 0;
  }
  unint64_t v29 = [(ASRSchemaASREmojiMetrics *)self->_emojiMetrics hash];
  uint64_t v30 = [(NSArray *)self->_pausedAudioDurationsInNs hash];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 v31 = self->_has;
  int v32 = *(_DWORD *)&v31 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&v31 & 0x4000) != 0)
  {
    unint64_t v33 = 2654435761u * self->_inverseTextNormalizationDurationForFinalResultInNs;
    if ((*(_WORD *)&v31 & 0x8000) != 0)
    {
LABEL_57:
      uint64_t v34 = 2654435761 * self->_numberOfInverseTextNormalizationRuns;
      if ((v32 & 0x10000) != 0) {
        goto LABEL_58;
      }
      goto LABEL_67;
    }
  }
  else
  {
    unint64_t v33 = 0;
    if ((*(_WORD *)&v31 & 0x8000) != 0) {
      goto LABEL_57;
    }
  }
  uint64_t v34 = 0;
  if ((v32 & 0x10000) != 0)
  {
LABEL_58:
    unint64_t v35 = 2654435761u * self->_secondaryPassDurationInNs;
    if ((v32 & 0x20000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_68;
  }
LABEL_67:
  unint64_t v35 = 0;
  if ((v32 & 0x20000) != 0)
  {
LABEL_59:
    uint64_t v36 = 2654435761 * self->_numberOfSecondaryPassRuns;
    if ((v32 & 0x40000) != 0) {
      goto LABEL_60;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v36 = 0;
  if ((v32 & 0x40000) != 0)
  {
LABEL_60:
    unint64_t v37 = 2654435761u * self->_cpuInstructionsInMillionsPerSecond;
    if ((v32 & 0x80000) != 0) {
      goto LABEL_61;
    }
    goto LABEL_70;
  }
LABEL_69:
  unint64_t v37 = 0;
  if ((v32 & 0x80000) != 0)
  {
LABEL_61:
    unint64_t v38 = 2654435761u * self->_appleNeuralEngineCpuTimeInNs;
    if ((v32 & 0x100000) != 0) {
      goto LABEL_62;
    }
    goto LABEL_71;
  }
LABEL_70:
  unint64_t v38 = 0;
  if ((v32 & 0x100000) != 0)
  {
LABEL_62:
    unint64_t v39 = 2654435761u * self->_pageInsWaitTimeInNs;
    if ((v32 & 0x200000) != 0) {
      goto LABEL_63;
    }
LABEL_72:
    uint64_t v40 = 0;
    if ((v32 & 0x400000) != 0) {
      goto LABEL_64;
    }
LABEL_73:
    uint64_t v41 = 0;
    goto LABEL_74;
  }
LABEL_71:
  unint64_t v39 = 0;
  if ((v32 & 0x200000) == 0) {
    goto LABEL_72;
  }
LABEL_63:
  uint64_t v40 = 2654435761 * self->_recognitionHardware;
  if ((v32 & 0x400000) == 0) {
    goto LABEL_73;
  }
LABEL_64:
  uint64_t v41 = 2654435761 * self->_numIngestedNeuralContextualBiasingEmbeddings;
LABEL_74:
  unint64_t v42 = v54 ^ v55 ^ v52 ^ v53 ^ v51 ^ v15 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v33 ^ v34;
  uint64_t v43 = v35 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41 ^ [(NSArray *)self->_pauseReasons hash];
  return v42 ^ v43 ^ [(ASRSchemaASRRescoringDeliberationResult *)self->_rescoringDeliberationResult hash];
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_126;
  }
  unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  int v6 = *(_WORD *)&self->_has & 1;
  unsigned int v7 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  if (v6 != (v4[104] & 1)) {
    goto LABEL_126;
  }
  if (v6)
  {
    unint64_t personalizedLanguageModelAgeInNs = self->_personalizedLanguageModelAgeInNs;
    if (personalizedLanguageModelAgeInNs != [v4 personalizedLanguageModelAgeInNs]) {
      goto LABEL_126;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v9 = (v5 >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1)) {
    goto LABEL_126;
  }
  if (v9)
  {
    float personalizedLanguageModelWeight = self->_personalizedLanguageModelWeight;
    [v4 personalizedLanguageModelWeight];
    if (personalizedLanguageModelWeight != v11) {
      goto LABEL_126;
    }
  }
  long double v12 = [(ASRSchemaASRRecognitionMetrics *)self recognizerComponents];
  double v13 = [v4 recognizerComponents];
  if ((v12 == 0) == (v13 != 0)) {
    goto LABEL_125;
  }
  uint64_t v14 = [(ASRSchemaASRRecognitionMetrics *)self recognizerComponents];
  if (v14)
  {
    unint64_t v15 = (void *)v14;
    int v16 = [(ASRSchemaASRRecognitionMetrics *)self recognizerComponents];
    double v17 = [v4 recognizerComponents];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_126;
    }
  }
  else
  {
  }
  int v19 = (*(_WORD *)&self->_has >> 2) & 1;
  if (v19 != ((v4[104] >> 2) & 1)) {
    goto LABEL_126;
  }
  if (v19)
  {
    float averageActiveTokensPerFrame = self->_averageActiveTokensPerFrame;
    [v4 averageActiveTokensPerFrame];
    if (averageActiveTokensPerFrame != v21) {
      goto LABEL_126;
    }
  }
  long double v12 = [(ASRSchemaASRRecognitionMetrics *)self languageModelInterpolationWeights];
  double v13 = [v4 languageModelInterpolationWeights];
  if ((v12 == 0) == (v13 != 0)) {
    goto LABEL_125;
  }
  uint64_t v22 = [(ASRSchemaASRRecognitionMetrics *)self languageModelInterpolationWeights];
  if (v22)
  {
    long double v23 = (void *)v22;
    double v24 = [(ASRSchemaASRRecognitionMetrics *)self languageModelInterpolationWeights];
    unint64_t v25 = [v4 languageModelInterpolationWeights];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_126;
    }
  }
  else
  {
  }
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  int v28 = (*(unsigned int *)&has >> 3) & 1;
  unsigned int v29 = v4[104];
  if (v28 != ((v29 >> 3) & 1)) {
    goto LABEL_126;
  }
  if (v28)
  {
    float signalToNoiseRatioInDecibels = self->_signalToNoiseRatioInDecibels;
    [v4 signalToNoiseRatioInDecibels];
    if (signalToNoiseRatioInDecibels != v33) {
      goto LABEL_126;
    }
    unsigned int v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v31 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  else
  {
    unsigned int v30 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v31 = v29 | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v34 = (v30 >> 4) & 1;
  if (v34 != ((v31 >> 4) & 1)) {
    goto LABEL_126;
  }
  if (v34)
  {
    unint64_t recognitionDurationInNs = self->_recognitionDurationInNs;
    if (recognitionDurationInNs != [v4 recognitionDurationInNs]) {
      goto LABEL_126;
    }
    unsigned int v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v31 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v36 = (v30 >> 5) & 1;
  if (v36 != ((v31 >> 5) & 1)) {
    goto LABEL_126;
  }
  if (v36)
  {
    unint64_t audioDurationInNs = self->_audioDurationInNs;
    if (audioDurationInNs != [v4 audioDurationInNs]) {
      goto LABEL_126;
    }
    unsigned int v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v31 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v38 = (v30 >> 6) & 1;
  if (v38 != ((v31 >> 6) & 1)) {
    goto LABEL_126;
  }
  if (v38)
  {
    int eagerEnabled = self->_eagerEnabled;
    if (eagerEnabled != [v4 eagerEnabled]) {
      goto LABEL_126;
    }
    unsigned int v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v31 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v40 = (v30 >> 7) & 1;
  if (v40 != ((v31 >> 7) & 1)) {
    goto LABEL_126;
  }
  if (v40)
  {
    int utteranceDetectionEnabled = self->_utteranceDetectionEnabled;
    if (utteranceDetectionEnabled != [v4 utteranceDetectionEnabled]) {
      goto LABEL_126;
    }
    unsigned int v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v31 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v42 = (v30 >> 8) & 1;
  if (v42 != ((v31 >> 8) & 1)) {
    goto LABEL_126;
  }
  if (v42)
  {
    int utteranceConcatenationEnabled = self->_utteranceConcatenationEnabled;
    if (utteranceConcatenationEnabled != [v4 utteranceConcatenationEnabled]) {
      goto LABEL_126;
    }
    unsigned int v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v31 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v44 = (v30 >> 9) & 1;
  if (v44 != ((v31 >> 9) & 1)) {
    goto LABEL_126;
  }
  if (v44)
  {
    int continuousListeningEnabled = self->_continuousListeningEnabled;
    if (continuousListeningEnabled != [v4 continuousListeningEnabled]) {
      goto LABEL_126;
    }
    unsigned int v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v31 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v46 = (v30 >> 10) & 1;
  if (v46 != ((v31 >> 10) & 1)) {
    goto LABEL_126;
  }
  if (v46)
  {
    unint64_t eagerCustomerPerceivedLatencyInNs = self->_eagerCustomerPerceivedLatencyInNs;
    if (eagerCustomerPerceivedLatencyInNs != [v4 eagerCustomerPerceivedLatencyInNs]) {
      goto LABEL_126;
    }
    unsigned int v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v31 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v48 = (v30 >> 11) & 1;
  if (v48 != ((v31 >> 11) & 1)) {
    goto LABEL_126;
  }
  if (v48)
  {
    float cpuRealTimeFactor = self->_cpuRealTimeFactor;
    [v4 cpuRealTimeFactor];
    if (cpuRealTimeFactor != v50) {
      goto LABEL_126;
    }
    unsigned int v30 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v31 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v51 = (v30 >> 12) & 1;
  if (v51 != ((v31 >> 12) & 1)) {
    goto LABEL_126;
  }
  if (v51)
  {
    unsigned int numLanguageModelEnrollmentDataStreams = self->_numLanguageModelEnrollmentDataStreams;
    if (numLanguageModelEnrollmentDataStreams != [v4 numLanguageModelEnrollmentDataStreams])goto LABEL_126; {
  }
    }
  long double v12 = [(ASRSchemaASRRecognitionMetrics *)self phoneticMatchDecoderName];
  double v13 = [v4 phoneticMatchDecoderName];
  if ((v12 == 0) == (v13 != 0)) {
    goto LABEL_125;
  }
  uint64_t v53 = [(ASRSchemaASRRecognitionMetrics *)self phoneticMatchDecoderName];
  if (v53)
  {
    unint64_t v54 = (void *)v53;
    unint64_t v55 = [(ASRSchemaASRRecognitionMetrics *)self phoneticMatchDecoderName];
    uint64_t v56 = [v4 phoneticMatchDecoderName];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_126;
    }
  }
  else
  {
  }
  int v58 = (*(_WORD *)&self->_has >> 13) & 1;
  if (v58 != ((v4[104] >> 13) & 1)) {
    goto LABEL_126;
  }
  if (v58)
  {
    unint64_t inverseTextNormalizationDurationInNs = self->_inverseTextNormalizationDurationInNs;
    if (inverseTextNormalizationDurationInNs != [v4 inverseTextNormalizationDurationInNs]) {
      goto LABEL_126;
    }
  }
  long double v12 = [(ASRSchemaASRRecognitionMetrics *)self emojiMetrics];
  double v13 = [v4 emojiMetrics];
  if ((v12 == 0) == (v13 != 0)) {
    goto LABEL_125;
  }
  uint64_t v60 = [(ASRSchemaASRRecognitionMetrics *)self emojiMetrics];
  if (v60)
  {
    v61 = (void *)v60;
    id v62 = [(ASRSchemaASRRecognitionMetrics *)self emojiMetrics];
    v63 = [v4 emojiMetrics];
    int v64 = [v62 isEqual:v63];

    if (!v64) {
      goto LABEL_126;
    }
  }
  else
  {
  }
  long double v12 = [(ASRSchemaASRRecognitionMetrics *)self pausedAudioDurationsInNs];
  double v13 = [v4 pausedAudioDurationsInNs];
  if ((v12 == 0) == (v13 != 0)) {
    goto LABEL_125;
  }
  uint64_t v65 = [(ASRSchemaASRRecognitionMetrics *)self pausedAudioDurationsInNs];
  if (v65)
  {
    v66 = (void *)v65;
    v67 = [(ASRSchemaASRRecognitionMetrics *)self pausedAudioDurationsInNs];
    long long v68 = [v4 pausedAudioDurationsInNs];
    int v69 = [v67 isEqual:v68];

    if (!v69) {
      goto LABEL_126;
    }
  }
  else
  {
  }
  $E30954924D96ED8F3D7A4FB9D02E1EA5 v70 = self->_has;
  int v71 = (*(unsigned int *)&v70 >> 14) & 1;
  unsigned int v72 = v4[104];
  if (v71 != ((v72 >> 14) & 1)) {
    goto LABEL_126;
  }
  if (v71)
  {
    unint64_t inverseTextNormalizationDurationForFinalResultInNs = self->_inverseTextNormalizationDurationForFinalResultInNs;
    if (inverseTextNormalizationDurationForFinalResultInNs != [v4 inverseTextNormalizationDurationForFinalResultInNs])goto LABEL_126; {
    unsigned int v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    }
    unsigned int v74 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  else
  {
    unsigned int v73 = *(_DWORD *)&v70 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v74 = v72 | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v76 = (v73 >> 15) & 1;
  if (v76 != ((v74 >> 15) & 1)) {
    goto LABEL_126;
  }
  if (v76)
  {
    unsigned int numberOfInverseTextNormalizationRuns = self->_numberOfInverseTextNormalizationRuns;
    if (numberOfInverseTextNormalizationRuns != [v4 numberOfInverseTextNormalizationRuns]) {
      goto LABEL_126;
    }
    unsigned int v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v74 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v78 = HIWORD(v73) & 1;
  if (v78 != (HIWORD(v74) & 1)) {
    goto LABEL_126;
  }
  if (v78)
  {
    unint64_t secondaryPassDurationInNs = self->_secondaryPassDurationInNs;
    if (secondaryPassDurationInNs != [v4 secondaryPassDurationInNs]) {
      goto LABEL_126;
    }
    unsigned int v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v74 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v80 = (v73 >> 17) & 1;
  if (v80 != ((v74 >> 17) & 1)) {
    goto LABEL_126;
  }
  if (v80)
  {
    unsigned int numberOfSecondaryPassRuns = self->_numberOfSecondaryPassRuns;
    if (numberOfSecondaryPassRuns != [v4 numberOfSecondaryPassRuns]) {
      goto LABEL_126;
    }
    unsigned int v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v74 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v82 = (v73 >> 18) & 1;
  if (v82 != ((v74 >> 18) & 1)) {
    goto LABEL_126;
  }
  if (v82)
  {
    unint64_t cpuInstructionsInMillionsPerSecond = self->_cpuInstructionsInMillionsPerSecond;
    if (cpuInstructionsInMillionsPerSecond != [v4 cpuInstructionsInMillionsPerSecond]) {
      goto LABEL_126;
    }
    unsigned int v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v74 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v84 = (v73 >> 19) & 1;
  if (v84 != ((v74 >> 19) & 1)) {
    goto LABEL_126;
  }
  if (v84)
  {
    unint64_t appleNeuralEngineCpuTimeInNs = self->_appleNeuralEngineCpuTimeInNs;
    if (appleNeuralEngineCpuTimeInNs != [v4 appleNeuralEngineCpuTimeInNs]) {
      goto LABEL_126;
    }
    unsigned int v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v74 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v86 = (v73 >> 20) & 1;
  if (v86 != ((v74 >> 20) & 1)) {
    goto LABEL_126;
  }
  if (v86)
  {
    unint64_t pageInsWaitTimeInNs = self->_pageInsWaitTimeInNs;
    if (pageInsWaitTimeInNs != [v4 pageInsWaitTimeInNs]) {
      goto LABEL_126;
    }
    unsigned int v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v74 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v88 = (v73 >> 21) & 1;
  if (v88 != ((v74 >> 21) & 1)) {
    goto LABEL_126;
  }
  if (v88)
  {
    int recognitionHardware = self->_recognitionHardware;
    if (recognitionHardware != [v4 recognitionHardware]) {
      goto LABEL_126;
    }
    unsigned int v73 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v74 = v4[104] | (*((unsigned __int8 *)v4 + 210) << 16);
  }
  int v90 = (v73 >> 22) & 1;
  if (v90 != ((v74 >> 22) & 1)) {
    goto LABEL_126;
  }
  if (v90)
  {
    unsigned int numIngestedNeuralContextualBiasingEmbeddings = self->_numIngestedNeuralContextualBiasingEmbeddings;
    if (numIngestedNeuralContextualBiasingEmbeddings != [v4 numIngestedNeuralContextualBiasingEmbeddings])goto LABEL_126; {
  }
    }
  long double v12 = [(ASRSchemaASRRecognitionMetrics *)self pauseReasons];
  double v13 = [v4 pauseReasons];
  if ((v12 == 0) == (v13 != 0)) {
    goto LABEL_125;
  }
  uint64_t v92 = [(ASRSchemaASRRecognitionMetrics *)self pauseReasons];
  if (v92)
  {
    long long v93 = (void *)v92;
    long long v94 = [(ASRSchemaASRRecognitionMetrics *)self pauseReasons];
    long long v95 = [v4 pauseReasons];
    int v96 = [v94 isEqual:v95];

    if (!v96) {
      goto LABEL_126;
    }
  }
  else
  {
  }
  long double v12 = [(ASRSchemaASRRecognitionMetrics *)self rescoringDeliberationResult];
  double v13 = [v4 rescoringDeliberationResult];
  if ((v12 == 0) == (v13 != 0))
  {
LABEL_125:

    goto LABEL_126;
  }
  uint64_t v97 = [(ASRSchemaASRRecognitionMetrics *)self rescoringDeliberationResult];
  if (!v97)
  {

LABEL_129:
    BOOL v102 = 1;
    goto LABEL_127;
  }
  long long v98 = (void *)v97;
  long long v99 = [(ASRSchemaASRRecognitionMetrics *)self rescoringDeliberationResult];
  long long v100 = [v4 rescoringDeliberationResult];
  char v101 = [v99 isEqual:v100];

  if (v101) {
    goto LABEL_129;
  }
LABEL_126:
  BOOL v102 = 0;
LABEL_127:

  return v102;
}

- (void)writeTo:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  LOBYTE(has) = self->_has;
  if (*(_WORD *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
  int v6 = [(ASRSchemaASRRecognitionMetrics *)self recognizerComponents];

  if (v6)
  {
    unsigned int v7 = [(ASRSchemaASRRecognitionMetrics *)self recognizerComponents];
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 4) != 0) {
    PBDataWriterWriteFloatField();
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v8 = self->_languageModelInterpolationWeights;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v10);
  }

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x10) == 0)
    {
LABEL_18:
      if ((v13 & 0x20) == 0) {
        goto LABEL_19;
      }
      goto LABEL_62;
    }
  }
  else if ((v13 & 0x10) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint64Field();
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
LABEL_19:
    if ((v13 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x40) == 0)
  {
LABEL_20:
    if ((v13 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteBOOLField();
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x80) == 0)
  {
LABEL_21:
    if ((v13 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x100) == 0)
  {
LABEL_22:
    if ((v13 & 0x200) == 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteBOOLField();
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x200) == 0)
  {
LABEL_23:
    if ((v13 & 0x400) == 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteBOOLField();
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x400) == 0)
  {
LABEL_24:
    if ((v13 & 0x800) == 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint64Field();
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x800) == 0)
  {
LABEL_25:
    if ((v13 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_68:
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
LABEL_26:
  }
    PBDataWriterWriteUint32Field();
LABEL_27:
  uint64_t v14 = [(ASRSchemaASRRecognitionMetrics *)self phoneticMatchDecoderName];

  if (v14) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    PBDataWriterWriteUint64Field();
  }
  unint64_t v15 = [(ASRSchemaASRRecognitionMetrics *)self emojiMetrics];

  if (v15)
  {
    int v16 = [(ASRSchemaASRRecognitionMetrics *)self emojiMetrics];
    PBDataWriterWriteSubmessage();
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  double v17 = self->_pausedAudioDurationsInNs;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * j) unsignedLongLongValue];
        PBDataWriterWriteUint64Field();
      }
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v19);
  }

  $E30954924D96ED8F3D7A4FB9D02E1EA5 v22 = self->_has;
  int v23 = *(_DWORD *)&v22 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&v22 & 0x4000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $E30954924D96ED8F3D7A4FB9D02E1EA5 v31 = self->_has;
    int v23 = *(_DWORD *)&v31 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(_WORD *)&v31 & 0x8000) == 0)
    {
LABEL_42:
      if ((v23 & 0x10000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_72;
    }
  }
  else if ((*(_WORD *)&v22 & 0x8000) == 0)
  {
    goto LABEL_42;
  }
  PBDataWriterWriteUint32Field();
  int v23 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v23 & 0x10000) == 0)
  {
LABEL_43:
    if ((v23 & 0x20000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  int v23 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v23 & 0x20000) == 0)
  {
LABEL_44:
    if ((v23 & 0x40000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  int v23 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v23 & 0x40000) == 0)
  {
LABEL_45:
    if ((v23 & 0x80000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  int v23 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v23 & 0x80000) == 0)
  {
LABEL_46:
    if ((v23 & 0x100000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  int v23 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v23 & 0x100000) == 0)
  {
LABEL_47:
    if ((v23 & 0x200000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint64Field();
  int v23 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v23 & 0x200000) == 0)
  {
LABEL_48:
    if ((v23 & 0x400000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_77:
  PBDataWriterWriteInt32Field();
  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x400000) != 0) {
LABEL_49:
  }
    PBDataWriterWriteUint32Field();
LABEL_50:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v24 = self->_pauseReasons;
  uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * k), "intValue", (void)v32);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v26);
  }

  unsigned int v29 = [(ASRSchemaASRRecognitionMetrics *)self rescoringDeliberationResult];

  if (v29)
  {
    unsigned int v30 = [(ASRSchemaASRRecognitionMetrics *)self rescoringDeliberationResult];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRRecognitionMetricsReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteRescoringDeliberationResult
{
}

- (BOOL)hasRescoringDeliberationResult
{
  return self->_rescoringDeliberationResult != 0;
}

- (int)pauseReasonAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_pauseReasons objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)pauseReasonCount
{
  return [(NSArray *)self->_pauseReasons count];
}

- (void)addPauseReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  pauseReasons = self->_pauseReasons;
  if (!pauseReasons)
  {
    int v6 = [MEMORY[0x1E4F1CA48] array];
    unsigned int v7 = self->_pauseReasons;
    self->_pauseReasons = v6;

    pauseReasons = self->_pauseReasons;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)pauseReasons addObject:v8];
}

- (void)clearPauseReason
{
}

- (void)deleteNumIngestedNeuralContextualBiasingEmbeddings
{
  [(ASRSchemaASRRecognitionMetrics *)self setNumIngestedNeuralContextualBiasingEmbeddings:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFBFFFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumIngestedNeuralContextualBiasingEmbeddings:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFBFFFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasNumIngestedNeuralContextualBiasingEmbeddings
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setNumIngestedNeuralContextualBiasingEmbeddings:(unsigned int)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x400000u) >> 16;
  self->_unsigned int numIngestedNeuralContextualBiasingEmbeddings = a3;
}

- (void)deleteRecognitionHardware
{
  [(ASRSchemaASRRecognitionMetrics *)self setRecognitionHardware:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFDFFFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasRecognitionHardware:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFDFFFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasRecognitionHardware
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setRecognitionHardware:(int)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x200000u) >> 16;
  self->_int recognitionHardware = a3;
}

- (void)deletePageInsWaitTimeInNs
{
  [(ASRSchemaASRRecognitionMetrics *)self setPageInsWaitTimeInNs:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFEFFFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasPageInsWaitTimeInNs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFEFFFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasPageInsWaitTimeInNs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setPageInsWaitTimeInNs:(unint64_t)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x100000u) >> 16;
  self->_unint64_t pageInsWaitTimeInNs = a3;
}

- (void)deleteAppleNeuralEngineCpuTimeInNs
{
  [(ASRSchemaASRRecognitionMetrics *)self setAppleNeuralEngineCpuTimeInNs:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasAppleNeuralEngineCpuTimeInNs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFF7FFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasAppleNeuralEngineCpuTimeInNs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAppleNeuralEngineCpuTimeInNs:(unint64_t)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x80000u) >> 16;
  self->_unint64_t appleNeuralEngineCpuTimeInNs = a3;
}

- (void)deleteCpuInstructionsInMillionsPerSecond
{
  [(ASRSchemaASRRecognitionMetrics *)self setCpuInstructionsInMillionsPerSecond:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasCpuInstructionsInMillionsPerSecond:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFBFFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasCpuInstructionsInMillionsPerSecond
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCpuInstructionsInMillionsPerSecond:(unint64_t)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x40000u) >> 16;
  self->_unint64_t cpuInstructionsInMillionsPerSecond = a3;
}

- (void)deleteNumberOfSecondaryPassRuns
{
  [(ASRSchemaASRRecognitionMetrics *)self setNumberOfSecondaryPassRuns:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumberOfSecondaryPassRuns:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasNumberOfSecondaryPassRuns
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setNumberOfSecondaryPassRuns:(unsigned int)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x20000u) >> 16;
  self->_unsigned int numberOfSecondaryPassRuns = a3;
}

- (void)deleteSecondaryPassDurationInNs
{
  [(ASRSchemaASRRecognitionMetrics *)self setSecondaryPassDurationInNs:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasSecondaryPassDurationInNs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasSecondaryPassDurationInNs
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setSecondaryPassDurationInNs:(unint64_t)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x10000u) >> 16;
  self->_unint64_t secondaryPassDurationInNs = a3;
}

- (void)deleteNumberOfInverseTextNormalizationRuns
{
  [(ASRSchemaASRRecognitionMetrics *)self setNumberOfInverseTextNormalizationRuns:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFF7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0x7FFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumberOfInverseTextNormalizationRuns:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0x7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0x7FFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumberOfInverseTextNormalizationRuns
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setNumberOfInverseTextNormalizationRuns:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_unsigned int numberOfInverseTextNormalizationRuns = a3;
}

- (void)deleteInverseTextNormalizationDurationForFinalResultInNs
{
  [(ASRSchemaASRRecognitionMetrics *)self setInverseTextNormalizationDurationForFinalResultInNs:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xBFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasInverseTextNormalizationDurationForFinalResultInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xBFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasInverseTextNormalizationDurationForFinalResultInNs
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setInverseTextNormalizationDurationForFinalResultInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_unint64_t inverseTextNormalizationDurationForFinalResultInNs = a3;
}

- (unint64_t)pausedAudioDurationsInNsAtIndex:(unint64_t)a3
{
  __int16 v3 = [(NSArray *)self->_pausedAudioDurationsInNs objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)pausedAudioDurationsInNsCount
{
  return [(NSArray *)self->_pausedAudioDurationsInNs count];
}

- (void)addPausedAudioDurationsInNs:(unint64_t)a3
{
  pausedAudioDurationsInNs = self->_pausedAudioDurationsInNs;
  if (!pausedAudioDurationsInNs)
  {
    int v6 = [MEMORY[0x1E4F1CA48] array];
    unsigned int v7 = self->_pausedAudioDurationsInNs;
    self->_pausedAudioDurationsInNs = v6;

    pausedAudioDurationsInNs = self->_pausedAudioDurationsInNs;
  }
  id v8 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSArray *)pausedAudioDurationsInNs addObject:v8];
}

- (void)clearPausedAudioDurationsInNs
{
}

- (void)deleteEmojiMetrics
{
}

- (BOOL)hasEmojiMetrics
{
  return self->_emojiMetrics != 0;
}

- (void)deleteInverseTextNormalizationDurationInNs
{
  [(ASRSchemaASRRecognitionMetrics *)self setInverseTextNormalizationDurationInNs:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xDFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasInverseTextNormalizationDurationInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xDFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasInverseTextNormalizationDurationInNs
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setInverseTextNormalizationDurationInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_unint64_t inverseTextNormalizationDurationInNs = a3;
}

- (void)deletePhoneticMatchDecoderName
{
}

- (BOOL)hasPhoneticMatchDecoderName
{
  return self->_phoneticMatchDecoderName != 0;
}

- (void)deleteNumLanguageModelEnrollmentDataStreams
{
  [(ASRSchemaASRRecognitionMetrics *)self setNumLanguageModelEnrollmentDataStreams:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xEFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasNumLanguageModelEnrollmentDataStreams:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xEFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNumLanguageModelEnrollmentDataStreams
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setNumLanguageModelEnrollmentDataStreams:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_unsigned int numLanguageModelEnrollmentDataStreams = a3;
}

- (void)deleteCpuRealTimeFactor
{
  [(ASRSchemaASRRecognitionMetrics *)self setCpuRealTimeFactor:0.0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xF7FF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasCpuRealTimeFactor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xF7FF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasCpuRealTimeFactor
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setCpuRealTimeFactor:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_float cpuRealTimeFactor = a3;
}

- (void)deleteEagerCustomerPerceivedLatencyInNs
{
  [(ASRSchemaASRRecognitionMetrics *)self setEagerCustomerPerceivedLatencyInNs:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xFBFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasEagerCustomerPerceivedLatencyInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xFBFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasEagerCustomerPerceivedLatencyInNs
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setEagerCustomerPerceivedLatencyInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_unint64_t eagerCustomerPerceivedLatencyInNs = a3;
}

- (void)deleteContinuousListeningEnabled
{
  [(ASRSchemaASRRecognitionMetrics *)self setContinuousListeningEnabled:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xFDFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasContinuousListeningEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xFDFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasContinuousListeningEnabled
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setContinuousListeningEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int continuousListeningEnabled = a3;
}

- (void)deleteUtteranceConcatenationEnabled
{
  [(ASRSchemaASRRecognitionMetrics *)self setUtteranceConcatenationEnabled:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xFEFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasUtteranceConcatenationEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xFEFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasUtteranceConcatenationEnabled
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setUtteranceConcatenationEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int utteranceConcatenationEnabled = a3;
}

- (void)deleteUtteranceDetectionEnabled
{
  [(ASRSchemaASRRecognitionMetrics *)self setUtteranceDetectionEnabled:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xFF7F;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasUtteranceDetectionEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xFF7F | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasUtteranceDetectionEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setUtteranceDetectionEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int utteranceDetectionEnabled = a3;
}

- (void)deleteEagerEnabled
{
  [(ASRSchemaASRRecognitionMetrics *)self setEagerEnabled:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xFFBF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasEagerEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xFFBF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasEagerEnabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setEagerEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int eagerEnabled = a3;
}

- (void)deleteAudioDurationInNs
{
  [(ASRSchemaASRRecognitionMetrics *)self setAudioDurationInNs:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xFFDF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasAudioDurationInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xFFDF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasAudioDurationInNs
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAudioDurationInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unint64_t audioDurationInNs = a3;
}

- (void)deleteRecognitionDurationInNs
{
  [(ASRSchemaASRRecognitionMetrics *)self setRecognitionDurationInNs:0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xFFEF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasRecognitionDurationInNs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xFFEF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasRecognitionDurationInNs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRecognitionDurationInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unint64_t recognitionDurationInNs = a3;
}

- (void)deleteSignalToNoiseRatioInDecibels
{
  [(ASRSchemaASRRecognitionMetrics *)self setSignalToNoiseRatioInDecibels:0.0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xFFF7;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasSignalToNoiseRatioInDecibels:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasSignalToNoiseRatioInDecibels
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSignalToNoiseRatioInDecibels:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_float signalToNoiseRatioInDecibels = a3;
}

- (id)languageModelInterpolationWeightsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_languageModelInterpolationWeights objectAtIndexedSubscript:a3];
}

- (unint64_t)languageModelInterpolationWeightsCount
{
  return [(NSArray *)self->_languageModelInterpolationWeights count];
}

- (void)addLanguageModelInterpolationWeights:(id)a3
{
  id v4 = a3;
  languageModelInterpolationWeights = self->_languageModelInterpolationWeights;
  id v8 = v4;
  if (!languageModelInterpolationWeights)
  {
    int v6 = [MEMORY[0x1E4F1CA48] array];
    unsigned int v7 = self->_languageModelInterpolationWeights;
    self->_languageModelInterpolationWeights = v6;

    id v4 = v8;
    languageModelInterpolationWeights = self->_languageModelInterpolationWeights;
  }
  [(NSArray *)languageModelInterpolationWeights addObject:v4];
}

- (void)clearLanguageModelInterpolationWeights
{
}

- (void)deleteAverageActiveTokensPerFrame
{
  [(ASRSchemaASRRecognitionMetrics *)self setAverageActiveTokensPerFrame:0.0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xFFFB;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasAverageActiveTokensPerFrame:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xFFFB | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasAverageActiveTokensPerFrame
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAverageActiveTokensPerFrame:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_float averageActiveTokensPerFrame = a3;
}

- (void)deleteRecognizerComponents
{
}

- (BOOL)hasRecognizerComponents
{
  return self->_recognizerComponents != 0;
}

- (void)deletePersonalizedLanguageModelWeight
{
  [(ASRSchemaASRRecognitionMetrics *)self setPersonalizedLanguageModelWeight:0.0];
  $E30954924D96ED8F3D7A4FB9D02E1EA5 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&has & 0xFFFD;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasPersonalizedLanguageModelWeight:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xFFFD | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasPersonalizedLanguageModelWeight
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPersonalizedLanguageModelWeight:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_float personalizedLanguageModelWeight = a3;
}

- (void)deletePersonalizedLanguageModelAgeInNs
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasPersonalizedLanguageModelAgeInNs:(BOOL)a3
{
  *(_WORD *)&self->_$E30954924D96ED8F3D7A4FB9D02E1EA5 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasPersonalizedLanguageModelAgeInNs
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPersonalizedLanguageModelAgeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unint64_t personalizedLanguageModelAgeInNs = a3;
}

@end