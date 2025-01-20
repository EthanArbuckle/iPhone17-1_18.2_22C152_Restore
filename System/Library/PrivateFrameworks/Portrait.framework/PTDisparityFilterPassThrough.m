@interface PTDisparityFilterPassThrough
- (PTDisparityFilterPassThrough)initWithMetalContext:(id)a3;
- (id)debugTextures:(id)a3;
- (id)debugTexturesNames;
- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5;
- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8;
- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8;
@end

@implementation PTDisparityFilterPassThrough

- (PTDisparityFilterPassThrough)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTDisparityFilterPassThrough;
  v6 = [(PTDisparityFilterPassThrough *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    v8 = v7;
  }

  return v7;
}

- (int)prepareFilter:(id)a3 inRGBA:(id)a4 outDisplacement:(id)a5
{
  return 0;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inStatePrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 outState:(id)a8
{
  metalContext = self->_metalContext;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  v14 = [(PTMetalContext *)metalContext textureUtil];
  int v15 = [v14 copy:v13 inTex:v12 outTex:v11];

  return v15;
}

- (int)temporalDisparityFilter:(id)a3 inDisplacement:(id)a4 inDisparityPrev:(id)a5 inDisparity:(id)a6 outDisparity:(id)a7 disparityBias:(float)a8
{
  return [(PTDisparityFilterPassThrough *)self temporalDisparityFilter:a3 inDisplacement:0 inStatePrev:a4 inDisparity:a4 outDisparity:a7 outState:a7];
}

- (id)debugTextures:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)debugTexturesNames
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void).cxx_destruct
{
}

@end