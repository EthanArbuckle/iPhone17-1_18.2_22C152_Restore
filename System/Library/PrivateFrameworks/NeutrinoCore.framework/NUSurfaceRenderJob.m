@interface NUSurfaceRenderJob
- (id)imageAccumulationNodeWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5 format:(id)a6 colorSpace:(id)a7;
- (id)result;
@end

@implementation NUSurfaceRenderJob

- (id)result
{
  v3 = objc_alloc_init(_NUSurfaceRenderResult);
  v4 = [(NUImageRenderJob *)self renderedRegion];
  [(_NUImageRenderResult *)v3 setRegion:v4];

  v5 = [(NUImageRenderJob *)self renderedImage];
  [(_NUSurfaceRenderResult *)v3 setImage:v5];

  v6 = [(NURenderJob *)self outputGeometry];
  [(_NUImageRenderResult *)v3 setGeometry:v6];

  return v3;
}

- (id)imageAccumulationNodeWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5 format:(id)a6 colorSpace:(id)a7
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  int64_t v9 = a4.var1;
  int64_t v10 = a4.var0;
  int64_t v11 = a3.var1;
  int64_t v12 = a3.var0;
  id v14 = a7;
  id v15 = a6;
  v16 = [NUSurfaceImageAccumulationNode alloc];
  v17 = [(NURenderJob *)self renderNode];
  v18 = -[NUImageAccumulationNode initWithImageSize:tileSize:borderSize:pixelFormat:colorSpace:input:](v16, "initWithImageSize:tileSize:borderSize:pixelFormat:colorSpace:input:", v12, v11, v10, v9, var0, var1, v15, v14, v17);

  return v18;
}

@end