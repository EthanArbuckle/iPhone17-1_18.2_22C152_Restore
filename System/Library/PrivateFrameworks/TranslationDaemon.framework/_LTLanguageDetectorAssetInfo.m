@interface _LTLanguageDetectorAssetInfo
- (_LTLanguageDetectorAssetInfo)initWithAssetUrl:(id)a3 featureCombinationAssetUrl:(id)a4;
- (id)featureCombinationConfigUrl;
- (id)languageDetectorModelURL;
@end

@implementation _LTLanguageDetectorAssetInfo

- (_LTLanguageDetectorAssetInfo)initWithAssetUrl:(id)a3 featureCombinationAssetUrl:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_LTLanguageDetectorAssetInfo;
  v9 = [(_LTLanguageDetectorAssetInfo *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetUrl, a3);
    objc_storeStrong((id *)&v10->_featureCombinationConfigUrl, a4);
    v11 = v10;
  }

  return v10;
}

- (id)languageDetectorModelURL
{
  return self->_assetUrl;
}

- (id)featureCombinationConfigUrl
{
  return self->_featureCombinationConfigUrl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureCombinationConfigUrl, 0);
  objc_storeStrong((id *)&self->_assetUrl, 0);
}

@end