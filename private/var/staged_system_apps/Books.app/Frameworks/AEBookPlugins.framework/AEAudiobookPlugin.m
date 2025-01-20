@interface AEAudiobookPlugin
+ (id)associatedAssetType;
+ (id)urlScheme;
- (AEAnnotationProvider)sharedAnnotationProvider;
- (id)associatedAssetType;
- (id)helperForURL:(id)a3 withOptions:(id)a4;
- (id)supportedFileExtensions;
- (id)supportedUrlSchemes;
- (void)setSharedAnnotationProvider:(id)a3;
@end

@implementation AEAudiobookPlugin

+ (id)urlScheme
{
  return @"audiobook";
}

- (id)associatedAssetType
{
  v2 = objc_opt_class();

  return _[v2 associatedAssetType];
}

+ (id)associatedAssetType
{
  return AEHelperAssetTypeAudiobook;
}

- (id)supportedFileExtensions
{
  return 0;
}

- (id)supportedUrlSchemes
{
  v2 = +[AEAudiobookPlugin urlScheme];
  v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0);

  return v3;
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  return 0;
}

- (AEAnnotationProvider)sharedAnnotationProvider
{
  return self->_sharedAnnotationProvider;
}

- (void)setSharedAnnotationProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end