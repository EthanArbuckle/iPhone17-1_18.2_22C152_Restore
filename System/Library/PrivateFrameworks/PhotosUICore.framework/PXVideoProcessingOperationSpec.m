@interface PXVideoProcessingOperationSpec
- (NSURL)debugInfoOutputURL;
- (NSURL)inputVideoURL;
- (NSURL)outputURL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDebugInfoOutputURL:(id)a3;
- (void)setInputVideoURL:(id)a3;
- (void)setOutputURL:(id)a3;
@end

@implementation PXVideoProcessingOperationSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfoOutputURL, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_inputVideoURL, 0);
}

- (void)setDebugInfoOutputURL:(id)a3
{
}

- (NSURL)debugInfoOutputURL
{
  return self->_debugInfoOutputURL;
}

- (void)setOutputURL:(id)a3
{
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setInputVideoURL:(id)a3
{
}

- (NSURL)inputVideoURL
{
  return self->_inputVideoURL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->_inputVideoURL);
  return v4;
}

@end