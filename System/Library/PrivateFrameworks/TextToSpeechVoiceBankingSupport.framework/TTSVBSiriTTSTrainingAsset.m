@interface TTSVBSiriTTSTrainingAsset
- (NSNumber)diskSize;
- (NSString)factor;
- (NSString)language;
- (NSString)name;
- (NSString)path;
- (SiriTTSTrainingAsset)asset;
- (TTSVBSiriTTSTrainingAsset)initWithSiriTTSTrainingAsset:(id)a3;
- (void)setAsset:(id)a3;
@end

@implementation TTSVBSiriTTSTrainingAsset

- (NSString)factor
{
  v2 = [(TTSVBSiriTTSTrainingAsset *)self asset];
  v3 = [v2 factor];

  return (NSString *)v3;
}

- (NSString)path
{
  v2 = [(TTSVBSiriTTSTrainingAsset *)self asset];
  v3 = [v2 path];

  return (NSString *)v3;
}

- (NSString)language
{
  v2 = [(TTSVBSiriTTSTrainingAsset *)self asset];
  v3 = [v2 language];

  return (NSString *)v3;
}

- (NSString)name
{
  v2 = [(TTSVBSiriTTSTrainingAsset *)self asset];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (NSNumber)diskSize
{
  return 0;
}

- (SiriTTSTrainingAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (void).cxx_destruct
{
}

- (TTSVBSiriTTSTrainingAsset)initWithSiriTTSTrainingAsset:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TTSVBSiriTTSTrainingAsset;
  v5 = [(TTSVBSiriTTSTrainingAsset *)&v8 init];
  v6 = v5;
  if (v5) {
    [(TTSVBSiriTTSTrainingAsset *)v5 setAsset:v4];
  }

  return v6;
}

@end