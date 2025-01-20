@interface QuadraBinConfig
- (QuadraBinConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputCompressionLevel:(int)a5 downstreamStage:(id)a6;
- (SoftISPConfig)downstreamConfig;
- (SoftISPStage)downstreamStage;
@end

@implementation QuadraBinConfig

- (QuadraBinConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputCompressionLevel:(int)a5 downstreamStage:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = v12;
  if (!v10 || !v11 || !v12)
  {
    FigDebugAssert3();
LABEL_15:

    self = 0;
    goto LABEL_9;
  }
  v23.receiver = self;
  v23.super_class = (Class)QuadraBinConfig;
  self = [(SoftISPConfig *)&v23 initWithStaticParameters:v10];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_9;
  }
  v14 = objc_alloc_init(SoftISPPrepareDescriptor);
  -[SoftISPPrepareDescriptor setInputPixelFormat:](v14, "setInputPixelFormat:", [v11 inputPixelFormat]);
  -[SoftISPPrepareDescriptor setSensorID:](v14, "setSensorID:", [v11 sensorID]);
  -[SoftISPPrepareDescriptor setMaximumWidth:](v14, "setMaximumWidth:", (unint64_t)[v11 maximumWidth] >> 1);
  -[SoftISPPrepareDescriptor setMaximumHeight:](v14, "setMaximumHeight:", (unint64_t)[v11 maximumHeight] >> 1);
  -[SoftISPPrepareDescriptor setStageConfigMode:](v14, "setStageConfigMode:", [v11 stageConfigMode]);
  objc_storeStrong((id *)&self->_downstreamStage, a6);
  v15 = [(SoftISPStage *)self->_downstreamStage configForPrepareDescriptor:v14 outputCompressionLevel:v7];
  downstreamConfig = self->_downstreamConfig;
  self->_downstreamConfig = v15;

  v17 = self->_downstreamConfig;
  if (!v17)
  {
    FigSignalErrorAt();
LABEL_14:

    goto LABEL_15;
  }
  [(SoftISPConfig *)self setMaximumOutputDimensions:[(SoftISPConfig *)v17 maximumOutputDimensions]];
  [(SoftISPConfig *)self setInputPixelFormat:[(SoftISPConfig *)self->_downstreamConfig inputPixelFormat]];
  v18 = [(SoftISPConfig *)self->_downstreamConfig inputMTLPixelFormatForPlane];
  [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:v18];

  v19 = [(SoftISPConfig *)self inputMTLPixelFormatForPlane];

  if (!v19) {
    goto LABEL_13;
  }
  [(SoftISPConfig *)self setOutputPixelFormat:[(SoftISPConfig *)self->_downstreamConfig outputPixelFormat]];
  v20 = [(SoftISPConfig *)self->_downstreamConfig outputMTLPixelFormatForPlane];
  [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v20];

  v21 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

  if (!v21)
  {
LABEL_13:
    FigDebugAssert3();
    goto LABEL_14;
  }
  -[SoftISPConfig setStageConfigMode:](self, "setStageConfigMode:", [v11 stageConfigMode]);
  self = self;

LABEL_9:
  return self;
}

- (SoftISPStage)downstreamStage
{
  return self->_downstreamStage;
}

- (SoftISPConfig)downstreamConfig
{
  return self->_downstreamConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downstreamConfig, 0);

  objc_storeStrong((id *)&self->_downstreamStage, 0);
}

@end