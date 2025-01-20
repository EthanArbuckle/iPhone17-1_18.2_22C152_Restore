@interface CLSCuratedLibrarySimilarityModel
+ (id)name;
+ (unint64_t)latestVersion;
- (CLSCuratedLibrarySimilarityModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (double)identicalSimilarityDistanceThreshold;
- (double)identicalSimilarityWithPeopleDistanceThreshold;
- (double)semanticalSimilarityDistanceThreshold;
- (double)semanticalSimilarityWithPeopleDistanceThreshold;
- (double)semanticalSimilarityWithPersonDistanceThreshold;
- (id)initForTesting;
- (unint64_t)metric;
- (unint64_t)version;
- (void)setupVersion33;
- (void)setupVersion80;
- (void)setupVersion84;
@end

@implementation CLSCuratedLibrarySimilarityModel

- (double)semanticalSimilarityWithPersonDistanceThreshold
{
  return self->_semanticalSimilarityWithPersonDistanceThreshold;
}

- (double)semanticalSimilarityWithPeopleDistanceThreshold
{
  return self->_semanticalSimilarityWithPeopleDistanceThreshold;
}

- (double)semanticalSimilarityDistanceThreshold
{
  return self->_semanticalSimilarityDistanceThreshold;
}

- (double)identicalSimilarityWithPeopleDistanceThreshold
{
  return self->_identicalSimilarityWithPeopleDistanceThreshold;
}

- (double)identicalSimilarityDistanceThreshold
{
  return self->_identicalSimilarityDistanceThreshold;
}

- (unint64_t)metric
{
  return self->_metric;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setupVersion84
{
  *(_OWORD *)&self->_version = xmmword_25995A410;
  *(_OWORD *)&self->_identicalSimilarityDistanceThreshold = xmmword_25995A470;
  *(int64x2_t *)&self->_semanticalSimilarityDistanceThreshold = vdupq_n_s64(0x3FC3205E293205E3uLL);
  self->_semanticalSimilarityWithPersonDistanceThreshold = 0.0810810811;
}

- (void)setupVersion80
{
  *(_OWORD *)&self->_version = xmmword_25995A420;
  *(int64x2_t *)&self->_identicalSimilarityDistanceThreshold = vdupq_n_s64(0x3FBBB51018A5B761uLL);
  *(int64x2_t *)&self->_semanticalSimilarityDistanceThreshold = vdupq_n_s64(0x3FCACB8920F04E57uLL);
  self->_semanticalSimilarityWithPersonDistanceThreshold = 0.209336415;
}

- (void)setupVersion33
{
  *(_OWORD *)&self->_version = xmmword_25995A430;
  *(int64x2_t *)&self->_identicalSimilarityDistanceThreshold = vdupq_n_s64(0x3FE4FDF3B645A1CBuLL);
  *(int64x2_t *)&self->_semanticalSimilarityDistanceThreshold = vdupq_n_s64(0x3FEE5E353F7CED91uLL);
  self->_semanticalSimilarityWithPersonDistanceThreshold = 0.8;
}

- (id)initForTesting
{
  return [(CLSCuratedLibrarySimilarityModel *)self initWithSceneAnalysisVersion:84];
}

- (CLSCuratedLibrarySimilarityModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSCuratedLibrarySimilarityModel;
  v4 = [(CLSCuratedLibrarySimilarityModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x54)
    {
      if (a3 < 0x50)
      {
        if (a3 < 0x21)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v6 = objc_opt_class();
            *(_DWORD *)buf = 67109378;
            int v10 = a3;
            __int16 v11 = 2112;
            uint64_t v12 = v6;
            _os_log_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
          }

          return 0;
        }
        else
        {
          [(CLSCuratedLibrarySimilarityModel *)v4 setupVersion33];
        }
      }
      else
      {
        [(CLSCuratedLibrarySimilarityModel *)v4 setupVersion80];
      }
    }
    else
    {
      [(CLSCuratedLibrarySimilarityModel *)v4 setupVersion84];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 84;
}

+ (id)name
{
  return @"Curated Library Similarity";
}

@end