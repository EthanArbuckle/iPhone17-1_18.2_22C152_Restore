@interface H13FastCanvasConfig
- (H13FastCanvasConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5;
- (int)getCanvasQueueForOutputFrame:(id)a3 canvasQueue:(id *)a4;
@end

@implementation H13FastCanvasConfig

- (H13FastCanvasConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9 && v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)H13FastCanvasConfig;
    self = [(SoftISPConfig *)&v15 initWithStaticParameters:v8];
    if (!self) {
      goto LABEL_8;
    }
    -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", [v10 maximumWidth] | ((unint64_t)objc_msgSend(v10, "maximumHeight") << 32));
    [(SoftISPConfig *)self setInputPixelFormat:0];
    [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:MEMORY[0x263EFFA68]];
    [(SoftISPConfig *)self setOutputPixelFormat:v5];
    v12 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self outputPixelFormat]);
    [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v12];

    v13 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

    if (v13)
    {
      self = self;
      v11 = self;
    }
    else
    {
LABEL_8:
      v11 = 0;
    }
  }

  return v11;
}

- (int)getCanvasQueueForOutputFrame:(id)a3 canvasQueue:(id *)a4
{
  uint64_t v5 = [a3 metadata];
  *a4 = [v5 objectForKeyedSubscript:@"CanvasQueue"];

  return 0;
}

@end