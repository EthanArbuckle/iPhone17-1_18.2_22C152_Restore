@interface PAEDisplace
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (PAEDisplace)initWithAPIManager:(id)a3;
- (id)properties;
- (void)filteredEdges:(BOOL *)a3 withInfo:(id *)a4;
- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4;
@end

@implementation PAEDisplace

- (PAEDisplace)initWithAPIManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEDisplace;
  return [(PAESharedDefaultBase *)&v4 initWithAPIManager:a3];
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (void)filteredEdges:(BOOL *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:0];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = [NSNumber numberWithBool:0];
  uint64_t v8 = [NSNumber numberWithInt:3];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"MayRemapTime", v5, @"SupportsLargeRenderScale", v6, @"SupportsHeliumRendering", v7, @"InputSizeLimit", v8, @"PixelTransformSupport", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 3), @"AutoColorProcessingSupport", 0);
}

- (BOOL)addParameters
{
  v6.receiver = self;
  v6.super_class = (Class)PAEDisplace;
  [(PAESharedDefaultBase *)&v6 addParameters];
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (v3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_msgSend(v3, "addImageReferenceWithName:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Displace::Map Image", 0, 0), 1, 0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Displace::Horizontal Scale", 0, 0), 3, 0, 0.1, -1.0, 1.0, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Displace::Vertical Scale", 0, 0), 4, 0, 0.1, -1.0, 1.0, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", @"Displace::Repeat Edges", 0, 0), 5, 0, 1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  if (!v9) {
    return 0;
  }
  v10 = v9;
  char v33 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  [v9 getFloatValue:&v32 fromParm:3 atFxTime:a5->var0.var1];
  [v10 getFloatValue:&v31 fromParm:4 atFxTime:a5->var0.var1];
  [v10 getBoolValue:&v33 fromParm:5 atFxTime:a5->var0.var1];
  uint64_t v11 = [a3 imageType];
  if ([(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1]) {
    BOOL v12 = v11 == 3;
  }
  else {
    BOOL v12 = 0;
  }
  BOOL v13 = v12;
  if (v12)
  {
    id v30 = 0;
    long long v14 = *(_OWORD *)&a5->var2;
    long long v15 = *(_OWORD *)&a5->var4;
    v29[0] = *(_OWORD *)&a5->var0.var0;
    v29[1] = v14;
    v29[2] = v15;
    [(PAESharedDefaultBase *)self getHeliumImage:&v30 layerOffsetX:0 layerOffsetY:0 requestInfo:v29 fromParm:1 atTime:a5->var0.var1];
    if (v30)
    {
      [v30 heliumRef];
      uint64_t v16 = v26;
      unint64_t v17 = [v30 width];
      unint64_t v18 = [v30 height];
    }
    else
    {
      uint64_t v16 = 0;
      unint64_t v17 = 0;
      unint64_t v18 = 0;
    }
    [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
    [(PAESharedDefaultBase *)self getInversePixelTransformForImage:a4];
    if (v16 && v17 && v18)
    {
      [(PAESharedDefaultBase *)self getImageBoundary:a4];
      float v19 = v27;
      float v20 = v28;
      HGTransform::HGTransform((HGTransform *)&v26);
      float v21 = (double)v17 / a5->var3;
      float v22 = (double)v18 / a5->var4;
      HGTransform::Scale((HGTransform *)&v26, v19 / (v21 + 4.0), v20 / (v22 + 4.0), 1.0);
      v23 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v23);
      (*(void (**)(HGXForm *, uint64_t *))(*(void *)v23 + 576))(v23, &v26);
      (*(void (**)(HGXForm *, void, uint64_t))(*(void *)v23 + 120))(v23, 0, v16);
      (*(void (**)(HGXForm *, void, uint64_t))(*(void *)v23 + 136))(v23, 0, 32);
      if (a4) {
        [a4 heliumRef];
      }
      v24 = (HgcDisplace *)HGObject::operator new(0x1A0uLL);
      HgcDisplace::HgcDisplace(v24);
    }
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v26 = 0;
    }
    [a3 setHeliumRef:&v26];
    if (v26) {
      (*(void (**)(uint64_t))(*(void *)v26 + 24))(v26);
    }
    if (v16) {
      (*(void (**)(uint64_t))(*(void *)v16 + 24))(v16);
    }
  }
  return v13;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 0;
  *a5 = 0;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

@end