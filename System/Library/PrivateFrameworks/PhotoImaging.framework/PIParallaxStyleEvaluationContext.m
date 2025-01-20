@interface PIParallaxStyleEvaluationContext
- (CGRect)visibleRect;
- (CIImage)backgroundImage;
- (CIImage)guideImage;
- (CIImage)inputImage;
- (CIImage)lightMapImage;
- (CIImage)matteImage;
- (CIImage)outputImage;
- (NSDictionary)localLightData;
- (NSDictionary)parameters;
- (PIParallaxFilterCache)cache;
- (double)renderScale;
- (id)debugDescription;
- (void)setBackgroundImage:(id)a3;
- (void)setCache:(id)a3;
- (void)setGuideImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setLocalLightData:(id)a3;
- (void)setMatteImage:(id)a3;
- (void)setOutputImage:(id)a3;
- (void)setParameters:(id)a3;
- (void)setRenderScale:(double)a3;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation PIParallaxStyleEvaluationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_localLightData, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_matteImage, 0);
  objc_storeStrong((id *)&self->_guideImage, 0);
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)setRenderScale:(double)a3
{
  self->_renderScale = a3;
}

- (double)renderScale
{
  return self->_renderScale;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCache:(id)a3
{
}

- (PIParallaxFilterCache)cache
{
  return self->_cache;
}

- (void)setLocalLightData:(id)a3
{
}

- (NSDictionary)localLightData
{
  return self->_localLightData;
}

- (void)setBackgroundImage:(id)a3
{
}

- (CIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setMatteImage:(id)a3
{
}

- (CIImage)matteImage
{
  return self->_matteImage;
}

- (void)setGuideImage:(id)a3
{
}

- (CIImage)guideImage
{
  return self->_guideImage;
}

- (void)setOutputImage:(id)a3
{
}

- (CIImage)outputImage
{
  return self->_outputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setParameters:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (CIImage)lightMapImage
{
  v3 = [(PIParallaxStyleEvaluationContext *)self guideImage];

  if (v3)
  {
    v4 = [(PIParallaxStyleEvaluationContext *)self localLightData];
    if (v4)
    {
      v5 = +[PICoreImageUtilities loadFilterWithName:@"_PIDynamicLocalLightMapPrepare"];
      v6 = [(PIParallaxStyleEvaluationContext *)self guideImage];
      [v5 setValue:v6 forKey:@"inputGuideImage"];

      v7 = [v4 objectForKeyedSubscript:@"lightMap"];
      [v5 setValue:v7 forKey:@"inputLightMap"];

      v8 = [v4 objectForKeyedSubscript:@"lightMapWidth"];
      [v5 setValue:v8 forKey:@"inputLightMapWidth"];

      v9 = [v4 objectForKeyedSubscript:@"lightMapHeight"];
      [v5 setValue:v9 forKey:@"inputLightMapHeight"];

      v10 = [v5 outputImage];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  return (CIImage *)v10;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PIParallaxStyleEvaluationContext *)self parameters];
  v6 = [v3 stringWithFormat:@"<%@: %p parameters = %@>", v4, self, v5];;

  return v6;
}

@end