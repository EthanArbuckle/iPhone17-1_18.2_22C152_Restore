@interface SoftISPModuleCalibration_BlackLevelShadingThumbnail
- (MTLTexture)thumbnailTex;
- (SoftISPModuleCalibration_BlackLevelShadingThumbnail)initWithThumbnailDict:(id)a3 metalContext:(id)a4;
- (__n128)biasValues;
- (float)analogGain;
- (float)exposureTime;
- (float)maxValue;
- (float)minValue;
- (float)temperature;
- (unsigned)thumbnailHeight;
- (unsigned)thumbnailWidth;
@end

@implementation SoftISPModuleCalibration_BlackLevelShadingThumbnail

- (SoftISPModuleCalibration_BlackLevelShadingThumbnail)initWithThumbnailDict:(id)a3 metalContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  char v30 = 0;
  if (!v6 || !v7)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_22:

    self = 0;
    goto LABEL_18;
  }
  v29.receiver = self;
  v29.super_class = (Class)SoftISPModuleCalibration_BlackLevelShadingThumbnail;
  self = [(SoftISPModuleCalibration_BlackLevelShadingThumbnail *)&v29 init];
  if (!self)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_18;
  }
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F588], &v30, 0.0);
  self->_temperature = v9;
  if (!v30) {
    goto LABEL_21;
  }
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F580], &v30, 0.0);
  self->_exposureTime = v10;
  if (!v30) {
    goto LABEL_21;
  }
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F578], &v30, 0.0);
  self->_analogGain = v11;
  if (!v30) {
    goto LABEL_21;
  }
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F250], &v30, 0.0);
  self->_minValue = v12;
  if (!v30) {
    goto LABEL_21;
  }
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F248], &v30, 0.0);
  self->_maxValue = v13;
  if (!v30
    || (objc_msgSend(v6, "cmi_simdFloat4ValueForKey:defaultValue:found:", *MEMORY[0x263F2F258], &v30, 0.0),
        *(_OWORD *)self->_biasValues = v14,
        !v30)
    || (self->_thumbnailWidth = objc_msgSend(v6, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F270], 0, &v30), !v30)|| (unsigned __int16 v15 = objc_msgSend(v6, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F268], 0, &v30), self->_thumbnailHeight = v15, !v30)|| !self->_thumbnailWidth|| !v15|| (objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x263F2F260]), (v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_21:
    FigDebugAssert3();
    goto LABEL_22;
  }
  v17 = (void *)v16;
  v18 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:10 width:self->_thumbnailWidth height:self->_thumbnailHeight mipmapped:0];
  if (!v18)
  {
    FigDebugAssert3();
LABEL_25:

    goto LABEL_22;
  }
  v19 = v18;
  [v18 setTextureType:2];
  [v19 setUsage:17];
  v20 = [v8 device];
  v21 = (MTLTexture *)[v20 newTextureWithDescriptor:v19];
  thumbnailTex = self->_thumbnailTex;
  self->_thumbnailTex = v21;

  v23 = self->_thumbnailTex;
  if (!v23)
  {
    FigDebugAssert3();

    goto LABEL_25;
  }
  uint64_t thumbnailWidth = self->_thumbnailWidth;
  uint64_t thumbnailHeight = self->_thumbnailHeight;
  memset(v28, 0, 24);
  v28[3] = thumbnailWidth;
  v28[4] = thumbnailHeight;
  v28[5] = 1;
  id v26 = v17;
  -[MTLTexture replaceRegion:mipmapLevel:withBytes:bytesPerRow:](v23, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v28, 0, [v26 bytes], self->_thumbnailWidth);
  self = self;

LABEL_18:
  return self;
}

- (float)temperature
{
  return self->_temperature;
}

- (float)exposureTime
{
  return self->_exposureTime;
}

- (float)analogGain
{
  return self->_analogGain;
}

- (float)minValue
{
  return self->_minValue;
}

- (float)maxValue
{
  return self->_maxValue;
}

- (__n128)biasValues
{
  return a1[3];
}

- (unsigned)thumbnailWidth
{
  return self->_thumbnailWidth;
}

- (unsigned)thumbnailHeight
{
  return self->_thumbnailHeight;
}

- (MTLTexture)thumbnailTex
{
  return self->_thumbnailTex;
}

- (void).cxx_destruct
{
}

@end