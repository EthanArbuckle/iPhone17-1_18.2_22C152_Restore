@interface UINibStorage
- (BOOL)captureImplicitLoadingContextOnDecode;
- (BOOL)instantiatingForSimulator;
- (NSBundle)bundle;
- (NSData)archiveData;
- (NSString)bundleDirectoryName;
- (NSString)bundleResourceName;
- (NSString)identifierForStringsFile;
- (UINibDecoder)nibDecoder;
- (void)setArchiveData:(id)a3;
- (void)setBundle:(id)a3;
- (void)setBundleDirectoryName:(id)a3;
- (void)setBundleResourceName:(id)a3;
- (void)setCaptureImplicitLoadingContextOnDecode:(BOOL)a3;
- (void)setIdentifierForStringsFile:(id)a3;
- (void)setInstantiatingForSimulator:(BOOL)a3;
- (void)setNibDecoder:(id)a3;
@end

@implementation UINibStorage

- (void)setBundleResourceName:(id)a3
{
}

- (void)setBundleDirectoryName:(id)a3
{
}

- (void)setBundle:(id)a3
{
}

- (void)setIdentifierForStringsFile:(id)a3
{
}

- (NSBundle)bundle
{
  return self->bundle;
}

- (BOOL)instantiatingForSimulator
{
  return self->instantiatingForSimulator;
}

- (NSString)identifierForStringsFile
{
  return self->identifierForStringsFile;
}

- (void)setNibDecoder:(id)a3
{
}

- (UINibDecoder)nibDecoder
{
  return self->nibDecoder;
}

- (void)setArchiveData:(id)a3
{
}

- (NSData)archiveData
{
  return self->archiveData;
}

- (NSString)bundleResourceName
{
  return self->bundleResourceName;
}

- (NSString)bundleDirectoryName
{
  return self->bundleDirectoryName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->nibDecoder, 0);
  objc_storeStrong((id *)&self->archiveData, 0);
  objc_storeStrong((id *)&self->identifierForStringsFile, 0);
  objc_storeStrong((id *)&self->bundle, 0);
  objc_storeStrong((id *)&self->bundleDirectoryName, 0);
  objc_storeStrong((id *)&self->bundleResourceName, 0);
}

- (void)setInstantiatingForSimulator:(BOOL)a3
{
  self->instantiatingForSimulator = a3;
}

- (BOOL)captureImplicitLoadingContextOnDecode
{
  return self->captureImplicitLoadingContextOnDecode;
}

- (void)setCaptureImplicitLoadingContextOnDecode:(BOOL)a3
{
  self->captureImplicitLoadingContextOnDecode = a3;
}

@end