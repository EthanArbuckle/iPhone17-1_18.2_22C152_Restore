@interface PISliderNetBaseRequest
- (IHKSliderNetCPModel)sliderNetModel;
- (NSData)assetScenePrint;
- (NUColorSpace)colorSpace;
- (NUScalePolicy)scalePolicy;
- (PISliderNetBaseRequest)initWithComposition:(id)a3 sliderNetModel:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAssetScenePrint:(id)a3;
- (void)setColorSpace:(id)a3;
- (void)setScalePolicy:(id)a3;
- (void)setSliderNetModel:(id)a3;
@end

@implementation PISliderNetBaseRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetScenePrint, 0);
  objc_storeStrong((id *)&self->_sliderNetModel, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_scalePolicy, 0);
}

- (void)setAssetScenePrint:(id)a3
{
}

- (NSData)assetScenePrint
{
  return self->_assetScenePrint;
}

- (void)setSliderNetModel:(id)a3
{
}

- (IHKSliderNetCPModel)sliderNetModel
{
  return self->_sliderNetModel;
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PISliderNetBaseRequest;
  v4 = [(NURenderRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 21, self->_sliderNetModel);
    objc_storeStrong(v5 + 19, self->_scalePolicy);
    objc_storeStrong(v5 + 20, self->_colorSpace);
    objc_storeStrong(v5 + 22, self->_assetScenePrint);
  }
  return v5;
}

- (PISliderNetBaseRequest)initWithComposition:(id)a3 sliderNetModel:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PISliderNetBaseRequest;
  v8 = [(NURenderRequest *)&v15 initWithComposition:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sliderNetModel, a4);
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A458]), "initWithTargetPixelSize:", 256, 256);
    scalePolicy = v9->_scalePolicy;
    v9->_scalePolicy = (NUScalePolicy *)v10;

    uint64_t v12 = [MEMORY[0x1E4F7A400] sRGBColorSpace];
    colorSpace = v9->_colorSpace;
    v9->_colorSpace = (NUColorSpace *)v12;
  }
  return v9;
}

@end