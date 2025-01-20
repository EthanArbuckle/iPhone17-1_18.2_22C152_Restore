@interface PUPhotoEditImageValues
- (BOOL)isComplete;
- (NSDictionary)apertureValues;
- (NSDictionary)autoCropValues;
- (NSDictionary)autoPerspectiveValues;
- (NSDictionary)portraitValues;
- (NSDictionary)semanticStyleStatistics;
- (NSDictionary)smartColorStatistics;
- (NSDictionary)smartToneStatistics;
- (double)smartColorAutoSuggestion;
- (double)smartToneAutoSuggestion;
- (void)setApertureValues:(id)a3;
- (void)setAutoCropValues:(id)a3;
- (void)setAutoPerspectiveValues:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setPortraitValues:(id)a3;
- (void)setSemanticStyleStatistics:(id)a3;
- (void)setSmartColorAutoSuggestion:(double)a3;
- (void)setSmartColorStatistics:(id)a3;
- (void)setSmartToneAutoSuggestion:(double)a3;
- (void)setSmartToneStatistics:(id)a3;
@end

@implementation PUPhotoEditImageValues

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apertureValues, 0);
  objc_storeStrong((id *)&self->_portraitValues, 0);
  objc_storeStrong((id *)&self->_autoPerspectiveValues, 0);
  objc_storeStrong((id *)&self->_autoCropValues, 0);
  objc_storeStrong((id *)&self->_semanticStyleStatistics, 0);
  objc_storeStrong((id *)&self->_smartColorStatistics, 0);
  objc_storeStrong((id *)&self->_smartToneStatistics, 0);
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setApertureValues:(id)a3
{
}

- (NSDictionary)apertureValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPortraitValues:(id)a3
{
}

- (NSDictionary)portraitValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAutoPerspectiveValues:(id)a3
{
}

- (NSDictionary)autoPerspectiveValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAutoCropValues:(id)a3
{
}

- (NSDictionary)autoCropValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSmartColorAutoSuggestion:(double)a3
{
  self->_smartColorAutoSuggestion = a3;
}

- (double)smartColorAutoSuggestion
{
  return self->_smartColorAutoSuggestion;
}

- (void)setSmartToneAutoSuggestion:(double)a3
{
  self->_smartToneAutoSuggestion = a3;
}

- (double)smartToneAutoSuggestion
{
  return self->_smartToneAutoSuggestion;
}

- (void)setSemanticStyleStatistics:(id)a3
{
}

- (NSDictionary)semanticStyleStatistics
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSmartColorStatistics:(id)a3
{
}

- (NSDictionary)smartColorStatistics
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSmartToneStatistics:(id)a3
{
}

- (NSDictionary)smartToneStatistics
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

@end