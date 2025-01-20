@interface CLSCurationModelSpecification
- (BOOL)isEqual:(id)a3;
- (CLSCurationModelSpecification)initWithAsset:(id)a3;
- (CLSCurationModelSpecification)initWithItemInfo:(id)a3 options:(id)a4;
- (CLSCurationModelSpecification)initWithSceneAnalysisVersion:(unint64_t)a3 mediaAnalysisVersion:(unint64_t)a4 faceAnalysisVersion:(unint64_t)a5;
- (unint64_t)faceAnalysisVersion;
- (unint64_t)hash;
- (unint64_t)mediaAnalysisVersion;
- (unint64_t)sceneAnalysisVersion;
@end

@implementation CLSCurationModelSpecification

- (unint64_t)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- (unint64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (unint64_t)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLSCurationModelSpecification *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      BOOL v6 = self->_sceneAnalysisVersion == v7->_sceneAnalysisVersion
        && self->_mediaAnalysisVersion == v7->_mediaAnalysisVersion
        && self->_faceAnalysisVersion == v7->_faceAnalysisVersion;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return (self->_mediaAnalysisVersion << 16) | (self->_sceneAnalysisVersion << 32) | self->_faceAnalysisVersion;
}

- (CLSCurationModelSpecification)initWithItemInfo:(id)a3 options:(id)a4
{
  id v5 = a3;
  BOOL v6 = [v5 objectForKeyedSubscript:@"sceneAnalysisVersion"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  v8 = [v5 objectForKeyedSubscript:@"mediaAnalysisVersion"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [v5 objectForKeyedSubscript:@"faceAnalysisVersion"];

  uint64_t v11 = [v10 unsignedIntegerValue];
  return [(CLSCurationModelSpecification *)self initWithSceneAnalysisVersion:v7 mediaAnalysisVersion:v9 faceAnalysisVersion:v11];
}

- (CLSCurationModelSpecification)initWithAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sceneAnalysisProperties];
  uint64_t v6 = (int)[v5 sceneAnalysisVersion];
  uint64_t v7 = [v4 mediaAnalysisProperties];
  uint64_t v8 = [v7 mediaAnalysisVersion];
  int v9 = [v4 faceAnalysisVersion];

  v10 = [(CLSCurationModelSpecification *)self initWithSceneAnalysisVersion:v6 mediaAnalysisVersion:v8 faceAnalysisVersion:v9];
  return v10;
}

- (CLSCurationModelSpecification)initWithSceneAnalysisVersion:(unint64_t)a3 mediaAnalysisVersion:(unint64_t)a4 faceAnalysisVersion:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLSCurationModelSpecification;
  result = [(CLSCurationModelSpecification *)&v9 init];
  if (result)
  {
    result->_sceneAnalysisVersion = a3;
    result->_mediaAnalysisVersion = a4;
    result->_faceAnalysisVersion = a5;
  }
  return result;
}

@end