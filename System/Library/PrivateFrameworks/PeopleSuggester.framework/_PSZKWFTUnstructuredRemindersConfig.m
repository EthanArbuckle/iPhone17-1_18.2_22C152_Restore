@interface _PSZKWFTUnstructuredRemindersConfig
- (BOOL)isEnabled;
- (_PSZKWFTUnstructuredRemindersConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4;
- (_PSZKWFTUnstructuredRemindersConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4 startSecondsFromQuery:(double)a5 endSecondsFromQuery:(double)a6 priorScoreThreshold:(float)a7;
- (double)endSecondsFromQuery;
- (double)startSecondsFromQuery;
- (float)priorScoreThreshold;
- (int64_t)defaultConfidenceCategory;
@end

@implementation _PSZKWFTUnstructuredRemindersConfig

- (_PSZKWFTUnstructuredRemindersConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4 startSecondsFromQuery:(double)a5 endSecondsFromQuery:(double)a6 priorScoreThreshold:(float)a7
{
  v13.receiver = self;
  v13.super_class = (Class)_PSZKWFTUnstructuredRemindersConfig;
  result = [(_PSZKWFTUnstructuredRemindersConfig *)&v13 init];
  if (result)
  {
    result->_isEnabled = a3;
    result->_defaultConfidenceCategory = a4;
    result->_startSecondsFromQuery = a5;
    result->_endSecondsFromQuery = a6;
    result->_priorScoreThreshold = a7;
  }
  return result;
}

- (_PSZKWFTUnstructuredRemindersConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4
{
  LODWORD(v4) = 0.5;
  return [(_PSZKWFTUnstructuredRemindersConfig *)self initWithIsEnabled:a3 defaultConfidenceCategory:a4 startSecondsFromQuery:600.0 endSecondsFromQuery:600.0 priorScoreThreshold:v4];
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (int64_t)defaultConfidenceCategory
{
  return self->_defaultConfidenceCategory;
}

- (double)startSecondsFromQuery
{
  return self->_startSecondsFromQuery;
}

- (double)endSecondsFromQuery
{
  return self->_endSecondsFromQuery;
}

- (float)priorScoreThreshold
{
  return self->_priorScoreThreshold;
}

@end