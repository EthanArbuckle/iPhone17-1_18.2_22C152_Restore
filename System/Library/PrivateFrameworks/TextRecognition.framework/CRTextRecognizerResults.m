@interface CRTextRecognizerResults
- (CRLatticeResults)latticeResults;
- (NSArray)codeMaps;
- (NSArray)lineFeatures;
- (NSArray)textFeatures;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSDictionary)inputOptions;
- (void)setCodeMaps:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setInputOptions:(id)a3;
- (void)setLatticeResults:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTextFeatures:(id)a3;
@end

@implementation CRTextRecognizerResults

- (NSArray)lineFeatures
{
  v2 = [(CRTextRecognizerResults *)self textFeatures];
  v3 = +[CRTextResults linesFromTextFeatures:v2];

  return (NSArray *)v3;
}

- (NSDictionary)inputOptions
{
  return self->_inputOptions;
}

- (void)setInputOptions:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (NSArray)textFeatures
{
  return self->_textFeatures;
}

- (void)setTextFeatures:(id)a3
{
}

- (NSArray)codeMaps
{
  return self->_codeMaps;
}

- (void)setCodeMaps:(id)a3
{
}

- (CRLatticeResults)latticeResults
{
  return self->_latticeResults;
}

- (void)setLatticeResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latticeResults, 0);
  objc_storeStrong((id *)&self->_codeMaps, 0);
  objc_storeStrong((id *)&self->_textFeatures, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_inputOptions, 0);
}

@end