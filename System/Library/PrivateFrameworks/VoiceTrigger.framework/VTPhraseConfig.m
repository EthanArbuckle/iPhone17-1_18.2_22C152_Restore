@interface VTPhraseConfig
- (NSString)name;
- (NSString)recognizerToken;
- (VTPhraseConfig)initWithName:(id)a3 threshold:(float)a4 secondChanceThreshold:(float)a5 loggingThreshold:(float)a6 ndapiScaleFactor:(float)a7 recognizerScoreOffset:(float)a8 recognizerScoreScaleFactor:(float)a9 recognizerToken:(id)a10 twoShotFeedbackDelay:(float)a11 remoraTwoShotFeedbackDelay:(float)a12 keywordRejectLoggingThreshold:(float)a13 speakerRejectLoggingThreshold:(float)a14 preTriggerSilenceOffset:(float)a15;
- (float)keywordRejectLoggingThreshold;
- (float)loggingThreshold;
- (float)ndapiScaleFactor;
- (float)preTriggerSilenceOffset;
- (float)recognizerScoreOffset;
- (float)recognizerScoreScaleFactor;
- (float)remoraTwoShotFeedbackDelay;
- (float)secondChanceThreshold;
- (float)speakerRejectLoggingThreshold;
- (float)threshold;
- (float)twoShotFeedbackDelay;
- (id)copyWithThreshold:(float)a3 secondChanceThreshold:(float)a4 loggingThreshold:(float)a5 ndapiScaleFactor:(float)a6 recognizerScoreOffset:(float)a7 recognizerScoreScaleFactor:(float)a8 keywordRejectLoggingThreshold:(float)a9;
@end

@implementation VTPhraseConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizerToken, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (float)preTriggerSilenceOffset
{
  return self->_preTriggerSilenceOffset;
}

- (float)speakerRejectLoggingThreshold
{
  return self->_speakerRejectLoggingThreshold;
}

- (float)keywordRejectLoggingThreshold
{
  return self->_keywordRejectLoggingThreshold;
}

- (float)remoraTwoShotFeedbackDelay
{
  return self->_remoraTwoShotFeedbackDelay;
}

- (float)twoShotFeedbackDelay
{
  return self->_twoShotFeedbackDelay;
}

- (NSString)recognizerToken
{
  return self->_recognizerToken;
}

- (float)recognizerScoreScaleFactor
{
  return self->_recognizerScoreScaleFactor;
}

- (float)recognizerScoreOffset
{
  return self->_recognizerScoreOffset;
}

- (float)ndapiScaleFactor
{
  return self->_ndapiScaleFactor;
}

- (float)loggingThreshold
{
  return self->_loggingThreshold;
}

- (float)secondChanceThreshold
{
  return self->_secondChanceThreshold;
}

- (float)threshold
{
  return self->_threshold;
}

- (NSString)name
{
  return self->_name;
}

- (id)copyWithThreshold:(float)a3 secondChanceThreshold:(float)a4 loggingThreshold:(float)a5 ndapiScaleFactor:(float)a6 recognizerScoreOffset:(float)a7 recognizerScoreScaleFactor:(float)a8 keywordRejectLoggingThreshold:(float)a9
{
  v15 = [VTPhraseConfig alloc];
  v16 = [(VTPhraseConfig *)self name];
  v17 = [(VTPhraseConfig *)self recognizerToken];
  [(VTPhraseConfig *)self twoShotFeedbackDelay];
  int v19 = v18;
  [(VTPhraseConfig *)self remoraTwoShotFeedbackDelay];
  int v21 = v20;
  [(VTPhraseConfig *)self speakerRejectLoggingThreshold];
  unsigned int v23 = v22;
  [(VTPhraseConfig *)self preTriggerSilenceOffset];
  LODWORD(v35) = v24;
  *(float *)&double v25 = a3;
  *(float *)&double v26 = a4;
  *(float *)&double v27 = a5;
  *(float *)&double v28 = a6;
  *(float *)&double v29 = a7;
  *(float *)&double v30 = a8;
  LODWORD(v31) = v19;
  LODWORD(v32) = v21;
  v33 = -[VTPhraseConfig initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:](v15, "initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:", v16, v17, v25, v26, v27, v28, v29, v30, v31, v32, __PAIR64__(v23, LODWORD(a9)), v35);

  return v33;
}

- (VTPhraseConfig)initWithName:(id)a3 threshold:(float)a4 secondChanceThreshold:(float)a5 loggingThreshold:(float)a6 ndapiScaleFactor:(float)a7 recognizerScoreOffset:(float)a8 recognizerScoreScaleFactor:(float)a9 recognizerToken:(id)a10 twoShotFeedbackDelay:(float)a11 remoraTwoShotFeedbackDelay:(float)a12 keywordRejectLoggingThreshold:(float)a13 speakerRejectLoggingThreshold:(float)a14 preTriggerSilenceOffset:(float)a15
{
  id v26 = a3;
  id v27 = a10;
  v31.receiver = self;
  v31.super_class = (Class)VTPhraseConfig;
  double v28 = [(VTPhraseConfig *)&v31 init];
  double v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_name, a3);
    v29->_threshold = a4;
    v29->_secondChanceThreshold = a5;
    v29->_loggingThreshold = a6;
    v29->_ndapiScaleFactor = a7;
    v29->_recognizerScoreOffset = a8;
    v29->_recognizerScoreScaleFactor = a9;
    objc_storeStrong((id *)&v29->_recognizerToken, a10);
    v29->_twoShotFeedbackDelay = a11;
    v29->_remoraTwoShotFeedbackDelay = a12;
    v29->_keywordRejectLoggingThreshold = a13;
    v29->_speakerRejectLoggingThreshold = a14;
    v29->_preTriggerSilenceOffset = a15;
  }

  return v29;
}

@end