@interface SLUresMitigatorIpFeats
- (AFSpeechPackage)speechPackage;
- (BOOL)didDetectAttention;
- (BOOL)didDetectGazeAtOrb;
- (BOOL)didDetectSpeechActivity;
- (BOOL)didDetectVisualActivity;
- (BOOL)isAirpodsConnected;
- (BOOL)isConversational;
- (NSDictionary)nldaMetaInfo;
- (NSNumber)acousticFTMScores;
- (NSNumber)boronScore;
- (NSNumber)checkerScore;
- (NSNumber)confidenceScore;
- (NSNumber)conversationalNldaScore;
- (NSNumber)embeddingScore;
- (NSNumber)eosLikelihood;
- (NSNumber)externalLrnnOffset;
- (NSNumber)externalLrnnScale;
- (NSNumber)inputOrigin;
- (NSNumber)lrnnScore;
- (NSNumber)lrnnThreshold;
- (NSNumber)nldaScore;
- (NSNumber)phsScore;
- (NSNumber)prevStageOutput;
- (NSNumber)speakerIDScore;
- (SLUresMitigatorIpFeats)initWithDefaults;
- (double)timeSinceLastQuery;
- (unint64_t)decisionStage;
- (void)setAcousticFTMScores:(id)a3;
- (void)setBoronScore:(id)a3;
- (void)setCheckerScore:(id)a3;
- (void)setConfidenceScore:(id)a3;
- (void)setConversationalNldaScore:(id)a3;
- (void)setDecisionStage:(unint64_t)a3;
- (void)setDidDetectAttention:(BOOL)a3;
- (void)setDidDetectGazeAtOrb:(BOOL)a3;
- (void)setDidDetectSpeechActivity:(BOOL)a3;
- (void)setDidDetectVisualActivity:(BOOL)a3;
- (void)setEmbeddingScore:(id)a3;
- (void)setEosLikelihood:(id)a3;
- (void)setExternalLrnnOffset:(id)a3;
- (void)setExternalLrnnScale:(id)a3;
- (void)setInputOrigin:(id)a3;
- (void)setIsAirpodsConnected:(BOOL)a3;
- (void)setIsConversational:(BOOL)a3;
- (void)setLrnnScore:(id)a3;
- (void)setLrnnThreshold:(id)a3;
- (void)setNldaMetaInfo:(id)a3;
- (void)setNldaScore:(id)a3;
- (void)setPhsScore:(id)a3;
- (void)setPrevStageOutput:(id)a3;
- (void)setSpeakerIDScore:(id)a3;
- (void)setSpeechPackage:(id)a3;
- (void)setTimeSinceLastQuery:(double)a3;
@end

@implementation SLUresMitigatorIpFeats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationalNldaScore, 0);
  objc_storeStrong((id *)&self->_externalLrnnOffset, 0);
  objc_storeStrong((id *)&self->_externalLrnnScale, 0);
  objc_storeStrong((id *)&self->_embeddingScore, 0);
  objc_storeStrong((id *)&self->_lrnnThreshold, 0);
  objc_storeStrong((id *)&self->_lrnnScore, 0);
  objc_storeStrong((id *)&self->_phsScore, 0);
  objc_storeStrong((id *)&self->_checkerScore, 0);
  objc_storeStrong((id *)&self->_confidenceScore, 0);
  objc_storeStrong((id *)&self->_nldaScore, 0);
  objc_storeStrong((id *)&self->_nldaMetaInfo, 0);
  objc_storeStrong((id *)&self->_eosLikelihood, 0);
  objc_storeStrong((id *)&self->_prevStageOutput, 0);
  objc_storeStrong((id *)&self->_speakerIDScore, 0);
  objc_storeStrong((id *)&self->_boronScore, 0);
  objc_storeStrong((id *)&self->_acousticFTMScores, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_speechPackage, 0);
}

- (void)setIsConversational:(BOOL)a3
{
  self->_isConversational = a3;
}

- (BOOL)isConversational
{
  return self->_isConversational;
}

- (void)setConversationalNldaScore:(id)a3
{
}

- (NSNumber)conversationalNldaScore
{
  return self->_conversationalNldaScore;
}

- (void)setExternalLrnnOffset:(id)a3
{
}

- (NSNumber)externalLrnnOffset
{
  return self->_externalLrnnOffset;
}

- (void)setExternalLrnnScale:(id)a3
{
}

- (NSNumber)externalLrnnScale
{
  return self->_externalLrnnScale;
}

- (void)setEmbeddingScore:(id)a3
{
}

- (NSNumber)embeddingScore
{
  return self->_embeddingScore;
}

- (void)setLrnnThreshold:(id)a3
{
}

- (NSNumber)lrnnThreshold
{
  return self->_lrnnThreshold;
}

- (void)setLrnnScore:(id)a3
{
}

- (NSNumber)lrnnScore
{
  return self->_lrnnScore;
}

- (void)setPhsScore:(id)a3
{
}

- (NSNumber)phsScore
{
  return self->_phsScore;
}

- (void)setCheckerScore:(id)a3
{
}

- (NSNumber)checkerScore
{
  return self->_checkerScore;
}

- (void)setConfidenceScore:(id)a3
{
}

- (NSNumber)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setNldaScore:(id)a3
{
}

- (NSNumber)nldaScore
{
  return self->_nldaScore;
}

- (void)setNldaMetaInfo:(id)a3
{
}

- (NSDictionary)nldaMetaInfo
{
  return self->_nldaMetaInfo;
}

- (void)setEosLikelihood:(id)a3
{
}

- (NSNumber)eosLikelihood
{
  return self->_eosLikelihood;
}

- (void)setPrevStageOutput:(id)a3
{
}

- (NSNumber)prevStageOutput
{
  return self->_prevStageOutput;
}

- (void)setDecisionStage:(unint64_t)a3
{
  self->_decisionStage = a3;
}

- (unint64_t)decisionStage
{
  return self->_decisionStage;
}

- (void)setTimeSinceLastQuery:(double)a3
{
  self->_timeSinceLastQuery = a3;
}

- (double)timeSinceLastQuery
{
  return self->_timeSinceLastQuery;
}

- (void)setIsAirpodsConnected:(BOOL)a3
{
  self->_isAirpodsConnected = a3;
}

- (BOOL)isAirpodsConnected
{
  return self->_isAirpodsConnected;
}

- (void)setDidDetectAttention:(BOOL)a3
{
  self->_didDetectAttention = a3;
}

- (BOOL)didDetectAttention
{
  return self->_didDetectAttention;
}

- (void)setDidDetectGazeAtOrb:(BOOL)a3
{
  self->_didDetectGazeAtOrb = a3;
}

- (BOOL)didDetectGazeAtOrb
{
  return self->_didDetectGazeAtOrb;
}

- (void)setDidDetectVisualActivity:(BOOL)a3
{
  self->_didDetectVisualActivity = a3;
}

- (BOOL)didDetectVisualActivity
{
  return self->_didDetectVisualActivity;
}

- (void)setDidDetectSpeechActivity:(BOOL)a3
{
  self->_didDetectSpeechActivity = a3;
}

- (BOOL)didDetectSpeechActivity
{
  return self->_didDetectSpeechActivity;
}

- (void)setSpeakerIDScore:(id)a3
{
}

- (NSNumber)speakerIDScore
{
  return self->_speakerIDScore;
}

- (void)setBoronScore:(id)a3
{
}

- (NSNumber)boronScore
{
  return self->_boronScore;
}

- (void)setAcousticFTMScores:(id)a3
{
}

- (NSNumber)acousticFTMScores
{
  return self->_acousticFTMScores;
}

- (void)setInputOrigin:(id)a3
{
}

- (NSNumber)inputOrigin
{
  return self->_inputOrigin;
}

- (void)setSpeechPackage:(id)a3
{
}

- (AFSpeechPackage)speechPackage
{
  return self->_speechPackage;
}

- (SLUresMitigatorIpFeats)initWithDefaults
{
  v23.receiver = self;
  v23.super_class = (Class)SLUresMitigatorIpFeats;
  v2 = [(SLUresMitigatorIpFeats *)&v23 init];
  v3 = v2;
  if (v2)
  {
    inputOrigin = v2->_inputOrigin;
    v2->_inputOrigin = 0;

    speechPackage = v3->_speechPackage;
    v3->_speechPackage = 0;

    v3->_didDetectSpeechActivity = 0;
    v3->_isAirpodsConnected = 0;
    v3->_timeSinceLastQuery = 0.0;
    v3->_decisionStage = 2;
    prevStageOutput = v3->_prevStageOutput;
    v3->_prevStageOutput = (NSNumber *)&unk_26D0A2458;

    acousticFTMScores = v3->_acousticFTMScores;
    v3->_acousticFTMScores = (NSNumber *)&unk_26D0A2468;

    speakerIDScore = v3->_speakerIDScore;
    v3->_speakerIDScore = (NSNumber *)&unk_26D0A2458;

    boronScore = v3->_boronScore;
    v3->_boronScore = (NSNumber *)&unk_26D0A2468;

    eosLikelihood = v3->_eosLikelihood;
    v3->_eosLikelihood = (NSNumber *)&unk_26D0A2550;

    *(_WORD *)&v3->_didDetectVisualActivity = 0;
    v3->_didDetectAttention = 0;
    nldaScore = v3->_nldaScore;
    v3->_nldaScore = (NSNumber *)&unk_26D0A2468;

    nldaMetaInfo = v3->_nldaMetaInfo;
    v3->_nldaMetaInfo = 0;

    lrnnScore = v3->_lrnnScore;
    v3->_lrnnScore = (NSNumber *)&unk_26D0A2468;

    lrnnThreshold = v3->_lrnnThreshold;
    v3->_lrnnThreshold = (NSNumber *)&unk_26D0A2478;

    confidenceScore = v3->_confidenceScore;
    v3->_confidenceScore = (NSNumber *)&unk_26D0A2488;

    checkerScore = v3->_checkerScore;
    v3->_checkerScore = (NSNumber *)&unk_26D0A2458;

    phsScore = v3->_phsScore;
    v3->_phsScore = (NSNumber *)&unk_26D0A2458;

    embeddingScore = v3->_embeddingScore;
    v3->_embeddingScore = (NSNumber *)&unk_26D0A2468;

    externalLrnnScale = v3->_externalLrnnScale;
    v3->_externalLrnnScale = (NSNumber *)&unk_26D0A2458;

    externalLrnnOffset = v3->_externalLrnnOffset;
    v3->_externalLrnnOffset = (NSNumber *)&unk_26D0A2478;

    conversationalNldaScore = v3->_conversationalNldaScore;
    v3->_conversationalNldaScore = (NSNumber *)&unk_26D0A2468;

    v3->_isConversational = 0;
  }
  return v3;
}

@end