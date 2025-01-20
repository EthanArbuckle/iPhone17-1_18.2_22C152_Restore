@interface NUMaskTransformerResult
- (CIImage)image;
- (NSError)error;
- (NUImageGeometry)geometry;
- (void)setError:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation NUMaskTransformerResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setGeometry:(id)a3
{
}

- (NUImageGeometry)geometry
{
  return self->_geometry;
}

- (void)setImage:(id)a3
{
}

- (CIImage)image
{
  return self->_image;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

@end