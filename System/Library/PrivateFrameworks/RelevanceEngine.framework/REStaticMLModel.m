@interface REStaticMLModel
+ (unint64_t)featureBitWidth;
- (float)_relevanceForFeatureMap:(id)a3;
- (float)_usageForFeatureSet:(id)a3;
- (id)_predictWithFeatures:(id)a3;
@end

@implementation REStaticMLModel

- (float)_relevanceForFeatureMap:(id)a3
{
  id v3 = a3;
  v4 = +[REFeature forcedFeature];
  v5 = (void *)[v3 valueForFeature:v4];
  double v7 = REDoubleValueForTaggedPointer(v5, v6);

  if (v7 <= 0.0)
  {
    v12 = +[REFeature dateFeature];
    int v13 = [v3 hasValueForFeature:v12];

    if (v13)
    {
      v14 = +[REFeature dateFeature];
      v15 = (void *)[v3 valueForFeature:v14];
      float v17 = REDoubleValueForTaggedPointer(v15, v16) * 0.0;

      uint64_t v18 = 1;
    }
    else
    {
      uint64_t v18 = 0;
      float v17 = 1.0;
    }
    v19 = +[REFeature locationFeature];
    int v20 = [v3 hasValueForFeature:v19];

    if (v20)
    {
      v21 = +[REFeature locationFeature];
      v22 = (void *)[v3 valueForFeature:v21];
      float v24 = REDoubleValueForTaggedPointer(v22, v23);

      float v25 = sqrt(v24 * 2.79999995 + 0.159999982 - (float)(v24 * v24)) + -1.39999998 + 1.0;
      float v17 = v17 + (float)(v25 * 0.0);
      ++v18;
    }
    v26 = +[REFeature geofenceFeature];
    int v27 = [v3 hasValueForFeature:v26];

    if (v27)
    {
      v28 = +[REFeature geofenceFeature];
      v29 = (void *)[v3 valueForFeature:v28];
      float v17 = REDoubleValueForTaggedPointer(v29, v30) * 0.0 * v17;

      ++v18;
    }
    v31 = +[REFeature conditionalFeature];
    int v32 = [v3 hasValueForFeature:v31];

    if (v32)
    {
      v33 = +[REFeature conditionalFeature];
      v34 = (void *)[v3 valueForFeature:v33];
      float v17 = REDoubleValueForTaggedPointer(v34, v35) * v17;

      ++v18;
    }
    v36 = +[REFeature dailyRoutineFeature];
    uint64_t v37 = [v3 hasValueForFeature:v36];

    float v38 = sqrtf(v17);
    if (v18 == v37 << 63 >> 63) {
      float v11 = 0.0;
    }
    else {
      float v11 = v38;
    }
  }
  else
  {
    v8 = +[REFeature forcedFeature];
    v9 = (void *)[v3 valueForFeature:v8];
    float v11 = REDoubleValueForTaggedPointer(v9, v10);
  }
  return v11;
}

- (float)_usageForFeatureSet:(id)a3
{
  id v3 = a3;
  v4 = +[REFeature appUsageFeature];
  int v5 = [v3 hasValueForFeature:v4];

  float v6 = 0.0;
  if (v5)
  {
    double v7 = +[REFeature appUsageFeature];
    v8 = (void *)[v3 valueForFeature:v7];
    float v6 = REDoubleValueForTaggedPointer(v8, v9) * 0.00999999978 + 0.0;
  }
  v10 = +[REFeature siriDomainFeature];
  int v11 = [v3 hasValueForFeature:v10];

  if (v11)
  {
    v12 = +[REFeature siriDomainFeature];
    int v13 = (void *)[v3 valueForFeature:v12];
    float v6 = v6 + REDoubleValueForTaggedPointer(v13, v14) * 0.00999999978;
  }
  return v6;
}

- (id)_predictWithFeatures:(id)a3
{
  id v4 = a3;
  [(REStaticMLModel *)self _relevanceForFeatureMap:v4];
  float v6 = v5;
  if (!RERelevanceEqualToRelevance(v5, 0.0))
  {
    [(REStaticMLModel *)self _usageForFeatureSet:v4];
    float v6 = v6 + v7;
  }
  double v8 = v6;
  if (v6 < 0.0) {
    double v8 = 0.0;
  }
  double v9 = fmin(v8, 1.0);
  *(float *)&double v9 = v9;
  v10 = +[REMLPrediction predictionWithProbability:v9 mean:0.0 variance:0.0 pessimistic:0.0];

  return v10;
}

+ (unint64_t)featureBitWidth
{
  return 64;
}

@end