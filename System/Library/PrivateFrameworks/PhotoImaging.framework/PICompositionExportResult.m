@interface PICompositionExportResult
- ($0AC6E346AE4835514AAA8AC86D8F4844)inputSize;
- (NSString)digest;
- (NSURL)exportedFileURL;
- (NSURL)sidecarDataURL;
- (NUImageGeometry)geometry;
- (void)setDigest:(id)a3;
- (void)setExportedFileURL:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setInputSize:(id)a3;
- (void)setSidecarDataURL:(id)a3;
@end

@implementation PICompositionExportResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidecarDataURL, 0);
  objc_storeStrong((id *)&self->_exportedFileURL, 0);
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
}

- (void)setSidecarDataURL:(id)a3
{
}

- (NSURL)sidecarDataURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExportedFileURL:(id)a3
{
}

- (NSURL)exportedFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDigest:(id)a3
{
}

- (NSString)digest
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInputSize:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = a3;
  objc_copyStruct(&self->_inputSize, &v3, 16, 1, 0);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)inputSize
{
  objc_copyStruct(v4, &self->_inputSize, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setGeometry:(id)a3
{
}

- (NUImageGeometry)geometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 8, 1);
}

@end