@interface PGHolidayClassifier
- (BOOL)isCelebratingForDateScore:(double)a3 sceneScore:(double)a4 locationScore:(double)a5;
- (PGHolidayClassifier)init;
- (double)celebrationThreshold;
- (double)dateWeight;
- (double)edgeCaseSceneWeight;
- (double)imperativeSceneWeight;
- (double)importantSceneWeight;
- (double)localeLocationWeight;
- (double)locationWeight;
- (double)mediumSceneWeight;
- (double)momentLocationWeight;
- (double)sceneWeight;
- (double)scoreForHolidayDetectedScenes:(id)a3;
- (id)description;
@end

@implementation PGHolidayClassifier

- (double)celebrationThreshold
{
  return self->_celebrationThreshold;
}

- (double)imperativeSceneWeight
{
  return self->_imperativeSceneWeight;
}

- (double)importantSceneWeight
{
  return self->_importantSceneWeight;
}

- (double)mediumSceneWeight
{
  return self->_mediumSceneWeight;
}

- (double)edgeCaseSceneWeight
{
  return self->_edgeCaseSceneWeight;
}

- (double)momentLocationWeight
{
  return self->_momentLocationWeight;
}

- (double)localeLocationWeight
{
  return self->_localeLocationWeight;
}

- (double)sceneWeight
{
  return self->_sceneWeight;
}

- (double)dateWeight
{
  return self->_dateWeight;
}

- (double)locationWeight
{
  return self->_locationWeight;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)PGHolidayClassifier;
  v4 = [(PGHolidayClassifier *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@\n", v4];

  [v5 appendFormat:@" %@: %f\n", @"LocationWeight", *(void *)&self->_locationWeight];
  [v5 appendFormat:@" %@: %f\n", @"DateWeight", *(void *)&self->_dateWeight];
  [v5 appendFormat:@" %@: %f\n", @"SceneWeight", *(void *)&self->_sceneWeight];
  [v5 appendFormat:@" %@: %f\n", @"LocaleLocationWeight", *(void *)&self->_localeLocationWeight];
  [v5 appendFormat:@" %@: %f\n", @"MomentLocationWeight", *(void *)&self->_momentLocationWeight];
  [v5 appendFormat:@" %@: %f\n", @"EdgeCaseSceneWeight", *(void *)&self->_edgeCaseSceneWeight];
  [v5 appendFormat:@" %@: %f\n", @"MediumSceneWeight", *(void *)&self->_mediumSceneWeight];
  [v5 appendFormat:@" %@: %f\n", @"ImportantSceneWeight", *(void *)&self->_importantSceneWeight];
  [v5 appendFormat:@" %@: %f\n", @"ImperativeSceneWeight", *(void *)&self->_imperativeSceneWeight];
  [v5 appendFormat:@" %@: %f\n", @"CelebrationThreshold", *(void *)&self->_celebrationThreshold];
  return v5;
}

- (double)scoreForHolidayDetectedScenes:(id)a3
{
  id v4 = a3;
  double v5 = (double)(unint64_t)[v4 detectedSceneEdgeCaseCount];
  double edgeCaseSceneWeight = self->_edgeCaseSceneWeight;
  double v7 = self->_mediumSceneWeight * (double)(unint64_t)[v4 detectedSceneMediumCount]
     + v5 * edgeCaseSceneWeight;
  double v8 = v7 + (double)(unint64_t)[v4 detectedSceneImportantCount] * self->_importantSceneWeight;
  unint64_t v9 = [v4 detectedSceneImperativeCount];

  double result = v8 + (double)v9 * self->_imperativeSceneWeight;
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (BOOL)isCelebratingForDateScore:(double)a3 sceneScore:(double)a4 locationScore:(double)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 == 0.0) {
    return 0;
  }
  double v7 = self->_dateWeight * a3 + self->_locationWeight * a5 + self->_sceneWeight * a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134217984;
    double v9 = v7;
    _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[HolidayProcessor] celebrationScore: %f", (uint8_t *)&v8, 0xCu);
  }
  return v7 > self->_celebrationThreshold;
}

- (PGHolidayClassifier)init
{
  v15.receiver = self;
  v15.super_class = (Class)PGHolidayClassifier;
  v2 = [(PGHolidayClassifier *)&v15 init];
  if (v2)
  {
    v3 = [[PGRemoteConfiguration alloc] initWithTrialNamespace:5 onDiskResourceFile:0];
    [(PGRemoteConfiguration *)v3 doubleValueForKey:@"LocationWeight" withFallbackValue:0.25];
    v2->_locationWeight = v4;
    [(PGRemoteConfiguration *)v3 doubleValueForKey:@"DateWeight" withFallbackValue:0.15];
    v2->_dateWeight = v5;
    [(PGRemoteConfiguration *)v3 doubleValueForKey:@"SceneWeight" withFallbackValue:0.6];
    v2->_sceneWeight = v6;
    [(PGRemoteConfiguration *)v3 doubleValueForKey:@"LocaleLocationWeight" withFallbackValue:0.4];
    v2->_localeLocationWeight = v7;
    [(PGRemoteConfiguration *)v3 doubleValueForKey:@"MomentLocationWeight" withFallbackValue:0.6];
    v2->_momentLocationWeight = v8;
    [(PGRemoteConfiguration *)v3 doubleValueForKey:@"EdgeCaseSceneWeight" withFallbackValue:0.3];
    v2->_double edgeCaseSceneWeight = v9;
    [(PGRemoteConfiguration *)v3 doubleValueForKey:@"MediumSceneWeight" withFallbackValue:0.4];
    v2->_mediumSceneWeight = v10;
    [(PGRemoteConfiguration *)v3 doubleValueForKey:@"ImportantSceneWeight" withFallbackValue:0.6];
    v2->_importantSceneWeight = v11;
    [(PGRemoteConfiguration *)v3 doubleValueForKey:@"ImperativeSceneWeight" withFallbackValue:1.0];
    v2->_imperativeSceneWeight = v12;
    [(PGRemoteConfiguration *)v3 doubleValueForKey:@"CelebrationThreshold" withFallbackValue:0.8];
    v2->_celebrationThreshold = v13;
  }
  return v2;
}

@end