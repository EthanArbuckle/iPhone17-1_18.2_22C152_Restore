@interface VMUHeapAndVMAggregatorOptions
- (BOOL)guessNonObjects;
- (BOOL)separateByZone;
- (BOOL)showRawClassNames;
- (BOOL)showSizes;
- (BOOL)showZoneHistograms;
- (BOOL)showZoneSummaries;
- (BOOL)sumObjectFields;
- (NSString)classesPattern;
- (VMUClassPatternMatcher)classFilterPatternMatcher;
- (VMUClassPatternMatcher)classesPatternMatcher;
- (VMUDebugTimer)debugTimer;
- (VMUHeapAndVMAggregatorOptions)init;
- (int)scope;
- (void)setClassFilterPatternMatcher:(id)a3;
- (void)setClassesPattern:(id)a3;
- (void)setClassesPatternMatcher:(id)a3;
- (void)setDebugTimer:(id)a3;
- (void)setGuessNonObjects:(BOOL)a3;
- (void)setScope:(int)a3;
- (void)setSeparateByZone:(BOOL)a3;
- (void)setShowRawClassNames:(BOOL)a3;
- (void)setShowSizes:(BOOL)a3;
- (void)setShowZoneHistograms:(BOOL)a3;
- (void)setShowZoneSummaries:(BOOL)a3;
- (void)setSumObjectFields:(BOOL)a3;
@end

@implementation VMUHeapAndVMAggregatorOptions

- (VMUHeapAndVMAggregatorOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)VMUHeapAndVMAggregatorOptions;
  return [(VMUHeapAndVMAggregatorOptions *)&v3 init];
}

- (int)scope
{
  return self->_scope;
}

- (void)setScope:(int)a3
{
  self->_scope = a3;
}

- (BOOL)separateByZone
{
  return self->_separateByZone;
}

- (void)setSeparateByZone:(BOOL)a3
{
  self->_separateByZone = a3;
}

- (BOOL)showZoneSummaries
{
  return self->_showZoneSummaries;
}

- (void)setShowZoneSummaries:(BOOL)a3
{
  self->_showZoneSummaries = a3;
}

- (BOOL)showZoneHistograms
{
  return self->_showZoneHistograms;
}

- (void)setShowZoneHistograms:(BOOL)a3
{
  self->_showZoneHistograms = a3;
}

- (BOOL)guessNonObjects
{
  return self->_guessNonObjects;
}

- (void)setGuessNonObjects:(BOOL)a3
{
  self->_guessNonObjects = a3;
}

- (BOOL)sumObjectFields
{
  return self->_sumObjectFields;
}

- (void)setSumObjectFields:(BOOL)a3
{
  self->_sumObjectFields = a3;
}

- (BOOL)showSizes
{
  return self->_showSizes;
}

- (void)setShowSizes:(BOOL)a3
{
  self->_showSizes = a3;
}

- (BOOL)showRawClassNames
{
  return self->_showRawClassNames;
}

- (void)setShowRawClassNames:(BOOL)a3
{
  self->_showRawClassNames = a3;
}

- (VMUClassPatternMatcher)classesPatternMatcher
{
  return self->_classesPatternMatcher;
}

- (void)setClassesPatternMatcher:(id)a3
{
}

- (VMUClassPatternMatcher)classFilterPatternMatcher
{
  return self->_classFilterPatternMatcher;
}

- (void)setClassFilterPatternMatcher:(id)a3
{
}

- (NSString)classesPattern
{
  return self->_classesPattern;
}

- (void)setClassesPattern:(id)a3
{
}

- (VMUDebugTimer)debugTimer
{
  return self->_debugTimer;
}

- (void)setDebugTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugTimer, 0);
  objc_storeStrong((id *)&self->_classesPattern, 0);
  objc_storeStrong((id *)&self->_classFilterPatternMatcher, 0);

  objc_storeStrong((id *)&self->_classesPatternMatcher, 0);
}

@end