@interface H13UtilityConvertConfig
- (H13UtilityConvertConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 inputPixelFormat:(int)a5 outputPixelFormat:(int)a6 outputCompressionLevel:(int)a7;
- (int)getConfigForInputFrame:(id)a3 outputFrame:(id)a4 config:(id *)a5;
@end

@implementation H13UtilityConvertConfig

- (H13UtilityConvertConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 inputPixelFormat:(int)a5 outputPixelFormat:(int)a6 outputCompressionLevel:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = v13;
  if (v12
    && v13
    && a5
    && a6
    && (v24.receiver = self,
        v24.super_class = (Class)H13UtilityConvertConfig,
        (self = [(SoftISPConfig *)&v24 initWithStaticParameters:v12]) != 0))
  {
    -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", [v14 maximumWidth] | ((unint64_t)objc_msgSend(v14, "maximumHeight") << 32));
    uint64_t v15 = 0;
    v16 = 0;
    unsigned int PixelForCVPixelFormat = -1;
    v18 = &unk_270E981E8;
    if (!(!v20 & v19))
    {
      switch(a5)
      {
        case 1:
          goto LABEL_17;
        case 2:
          goto LABEL_10;
        case 3:
          goto LABEL_11;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          goto LABEL_35;
        case 10:
          goto LABEL_15;
        case 11:
          goto LABEL_16;
        default:
LABEL_39:
          JUMPOUT(0);
      }
    }
    switch(a5)
    {
      case 20:
        goto LABEL_17;
      case 21:
LABEL_10:
        v18 = &unk_270E98218;
        uint64_t v15 = 1651519798;
        goto LABEL_17;
      case 22:
LABEL_11:
        unsigned int PixelForCVPixelFormat = determineFirstPixelForCVPixelFormat(objc_msgSend(v14, "inputPixelFormat", 0));
        if (PixelForCVPixelFormat == -1) {
          unsigned int PixelForCVPixelFormat = objc_msgSend(v12, "firstPixelForSensorID:", objc_msgSend(v14, "sensorID"));
        }
        if (PixelForCVPixelFormat >= 4) {
          goto LABEL_34;
        }
        uint64_t v15 = *(unsigned int *)&a4brg4ggr4ggb4r[4 * PixelForCVPixelFormat];
        v18 = &unk_270E98200;
        goto LABEL_17;
      case 30:
LABEL_15:
        uint64_t v15 = 0;
        v18 = &unk_270E98230;
        goto LABEL_17;
      case 31:
LABEL_16:
        uint64_t v15 = 0;
        v18 = &unk_270E98248;
LABEL_17:
        [(SoftISPConfig *)self setInputPixelFormat:v15];
        [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:v18];
        v16 = 0;
        if (!(!v20 & v19))
        {
          switch(a6)
          {
            case 1:
              goto LABEL_21;
            case 2:
              goto LABEL_23;
            case 3:
              goto LABEL_25;
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
              goto LABEL_35;
            case 10:
              goto LABEL_30;
            case 11:
              goto LABEL_31;
            default:
              goto LABEL_39;
          }
        }
        switch(a6)
        {
          case 20:
LABEL_21:
            if (a7) {
              goto LABEL_33;
            }
            uint64_t v21 = 0;
            v22 = &unk_270E98260;
            goto LABEL_32;
          case 21:
LABEL_23:
            if (a7) {
              goto LABEL_33;
            }
            uint64_t v21 = 1651519798;
            v22 = &unk_270E98290;
            goto LABEL_32;
          case 22:
LABEL_25:
            if (a7) {
              goto LABEL_33;
            }
            if (PixelForCVPixelFormat == -1) {
              unsigned int PixelForCVPixelFormat = determineFirstPixelForCVPixelFormat([v14 inputPixelFormat]);
            }
            if (PixelForCVPixelFormat >= 4) {
              goto LABEL_34;
            }
            uint64_t v21 = *(unsigned int *)&a4brg4ggr4ggb4r[4 * PixelForCVPixelFormat];
            v22 = &unk_270E98278;
            goto LABEL_32;
          case 30:
LABEL_30:
            uint64_t v21 = determineCompressedOutputPixelFormat(1651926376, a7);
            v22 = &unk_270E982A8;
            goto LABEL_32;
          case 31:
LABEL_31:
            uint64_t v21 = determineCompressedOutputPixelFormat(1647719528, a7);
            v22 = &unk_270E982C0;
LABEL_32:
            [(SoftISPConfig *)self setOutputPixelFormat:v21];
            [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v22];
            self = self;
            v16 = self;
            break;
          default:
            goto LABEL_35;
        }
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_33:
    FigDebugAssert3();
LABEL_34:
    v16 = 0;
  }
LABEL_35:

  return v16;
}

- (int)getConfigForInputFrame:(id)a3 outputFrame:(id)a4 config:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7 || !v8 || !a5)
  {
    FigDebugAssert3();
LABEL_9:
    int v13 = FigSignalErrorAt();
    goto LABEL_7;
  }
  int Pixel = -[SoftISPInputFrame firstPixel]((uint64_t)v7);
  if (Pixel == -1)
  {
    v11 = (__CVBuffer *)[v9 pixelBuffer];
    id v12 = [v9 metadata];
    int Pixel = determineFirstPixel(v11, v12);

    if (Pixel == -1) {
      goto LABEL_9;
    }
  }
  a5->var1 = Pixel;
  int v13 = 0;
  a5->var0 = (float)(int)-[SoftISPInputFrame pipelineBlackLevel]((uint64_t)v7) / 65535.0;
LABEL_7:

  return v13;
}

@end