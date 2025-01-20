@interface GDCConfig
- (GDCConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5;
- (int)getWarpConfigForInputFrame:(id)a3 bounds:(id)a4 warpConfig:(CMIWarpConfig *)a5;
@end

@implementation GDCConfig

- (GDCConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8 || !v9 || !v5) {
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)GDCConfig;
  self = [(SoftISPConfig *)&v14 initWithStaticParameters:v8];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_6;
  }
  -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", [v10 maximumWidth] | ((unint64_t)objc_msgSend(v10, "maximumHeight") << 32));
  [(SoftISPConfig *)self setInputPixelFormat:0];
  [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:MEMORY[0x263EFFA68]];
  [(SoftISPConfig *)self setOutputPixelFormat:v5];
  v11 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self outputPixelFormat]);
  [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v11];

  v12 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

  if (!v12)
  {
LABEL_11:
    FigDebugAssert3();

    self = 0;
  }
LABEL_6:

  return self;
}

- (int)getWarpConfigForInputFrame:(id)a3 bounds:(id)a4 warpConfig:(CMIWarpConfig *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7 && v8 && a5 && (-[SoftISPInputFrame metadata]((uint64_t)v7), (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    uint64_t v12 = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v9);
    int8x8_t v21 = vand_s8((int8x8_t)-[SoftISPInputFrame sensorCropRect]((uint64_t)v7), (int8x8_t)0xFFFF0000FFFFLL);
    int32x2_t v13 = (int32x2_t)vand_s8((int8x8_t)vdup_n_s32(-[SoftISPInputFrame quadraBinningFactor]((uint64_t)v7)), (int8x8_t)0xFFFF0000FFFFLL);
    v13.i32[0] = v21.i32[0] / (unsigned __int32)v13.i32[0];
    v13.i32[1] = v21.i32[1] / (unsigned __int32)v13.i32[1];
    int32x2_t v14 = vsub_s32((int32x2_t)v12, v13);
    *((_WORD *)a5 + 1) = v14.i16[2];
    *(_WORD *)a5 = v14.i16[0];
    -[SoftISPInputFrame sensorCropRect]((uint64_t)v7);
    uint64_t v22 = v15;
    unsigned int v16 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v7);
    *((_WORD *)a5 + 3) = HIDWORD(v22) / v16;
    *((_WORD *)a5 + 2) = v22 / v16;
    -[SoftISPBounds processingRegionWithinOutputBufferInPixels]((uint64_t)v9);
    *((_WORD *)a5 + 9) = v17;
    *((_WORD *)a5 + 8) = v18;

    int v19 = 0;
  }
  else
  {
    int v19 = FigSignalErrorAt();
  }

  return v19;
}

@end