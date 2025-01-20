@interface VTNovDetectorResult
- (BOOL)earlyWarning;
- (BOOL)isRescoring;
- (NSDictionary)dictionary;
- (VTNovDetectorResult)initWithResult:(id)a3;
- (float)bestScore;
- (unint64_t)bestEnd;
- (unint64_t)bestPhrase;
- (unint64_t)bestStart;
- (unint64_t)sampleFed;
- (void)setBestEnd:(unint64_t)a3;
- (void)setBestPhrase:(unint64_t)a3;
- (void)setBestScore:(float)a3;
- (void)setBestStart:(unint64_t)a3;
- (void)setEarlyWarning:(BOOL)a3;
- (void)setIsRescoring:(BOOL)a3;
- (void)setSampleFed:(unint64_t)a3;
@end

@implementation VTNovDetectorResult

- (void)setIsRescoring:(BOOL)a3
{
  self->_isRescoring = a3;
}

- (BOOL)isRescoring
{
  return self->_isRescoring;
}

- (void)setEarlyWarning:(BOOL)a3
{
  self->_earlyWarning = a3;
}

- (BOOL)earlyWarning
{
  return self->_earlyWarning;
}

- (void)setBestScore:(float)a3
{
  self->_bestScore = a3;
}

- (float)bestScore
{
  return self->_bestScore;
}

- (void)setBestEnd:(unint64_t)a3
{
  self->_bestEnd = a3;
}

- (unint64_t)bestEnd
{
  return self->_bestEnd;
}

- (void)setBestStart:(unint64_t)a3
{
  self->_bestStart = a3;
}

- (unint64_t)bestStart
{
  return self->_bestStart;
}

- (void)setBestPhrase:(unint64_t)a3
{
  self->_bestPhrase = a3;
}

- (unint64_t)bestPhrase
{
  return self->_bestPhrase;
}

- (void)setSampleFed:(unint64_t)a3
{
  self->_sampleFed = a3;
}

- (unint64_t)sampleFed
{
  return self->_sampleFed;
}

- (NSDictionary)dictionary
{
  v14[7] = *MEMORY[0x263EF8340];
  v13[0] = @"samples_fed";
  v3 = [NSNumber numberWithUnsignedInteger:self->_sampleFed];
  v14[0] = v3;
  v13[1] = @"best_phrase";
  v4 = [NSNumber numberWithUnsignedInteger:self->_bestPhrase];
  v14[1] = v4;
  v13[2] = @"best_start";
  v5 = [NSNumber numberWithUnsignedInteger:self->_bestStart];
  v14[2] = v5;
  v13[3] = @"best_end";
  v6 = [NSNumber numberWithUnsignedInteger:self->_bestEnd];
  v14[3] = v6;
  v13[4] = @"best_score";
  *(float *)&double v7 = self->_bestScore;
  v8 = [NSNumber numberWithFloat:v7];
  v14[4] = v8;
  v13[5] = @"early_warning";
  v9 = [NSNumber numberWithBool:self->_earlyWarning];
  v14[5] = v9;
  v13[6] = @"is_rescoring";
  v10 = [NSNumber numberWithBool:self->_isRescoring];
  v14[6] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:7];

  return (NSDictionary *)v11;
}

- (VTNovDetectorResult)initWithResult:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VTNovDetectorResult;
  v5 = [(VTNovDetectorResult *)&v8 init];
  if (v5)
  {
    v5->_sampleFed = [v4 sampleFed];
    v5->_bestPhrase = [v4 bestPhrase];
    v5->_bestStart = [v4 bestStart];
    v5->_bestEnd = [v4 bestEnd];
    [v4 bestScore];
    v5->_bestScore = v6;
    v5->_earlyWarning = [v4 earlyWarning];
  }

  return v5;
}

@end