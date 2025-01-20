@interface _NUSurfaceRenderResult
- (NSString)debugDescription;
- (NUSurfaceImage)image;
- (void)setImage:(id)a3;
@end

@implementation _NUSurfaceRenderResult

- (void).cxx_destruct
{
}

- (void)setImage:(id)a3
{
}

- (NUSurfaceImage)image
{
  return (NUSurfaceImage *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_NUImageRenderResult *)self region];
  v6 = [(_NUSurfaceRenderResult *)self image];
  v7 = [(_NUSurfaceRenderResult *)self image];
  v8 = [v7 validRegion];
  v9 = [(_NUImageRenderResult *)self geometry];
  v10 = [v3 stringWithFormat:@"<%@: %p> region=%@, image=%@ (%@), geometry=%@", v4, self, v5, v6, v8, v9];

  return (NSString *)v10;
}

@end