@interface _SSScreenCaptureResults
- (NSString)failureReasonIfImageIsNil;
- (UIImage)image;
- (void)setFailureReasonIfImageIsNil:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation _SSScreenCaptureResults

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)failureReasonIfImageIsNil
{
  return self->_failureReasonIfImageIsNil;
}

- (void)setFailureReasonIfImageIsNil:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureReasonIfImageIsNil, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end