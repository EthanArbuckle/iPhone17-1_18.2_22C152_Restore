@interface H13FastPowerBlurStageArgs
- (H13FastPowerBlurStageArgs)initWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (MTLTexture)inputChromaTex;
- (MTLTexture)inputLumaTex;
- (MTLTexture)outputChromaTex;
- (MTLTexture)outputLumaTex;
- (SoftISPBounds)bounds;
- (SoftISPConfig)config;
- (SoftISPInputFrame)inputFrame;
- (SoftISPOutputFrame)outputFrame;
- (void)dealloc;
- (void)setBounds:(id)a3;
- (void)setConfig:(id)a3;
- (void)setInputChromaTex:(id)a3;
- (void)setInputFrame:(id)a3;
- (void)setInputLumaTex:(id)a3;
- (void)setOutputChromaTex:(id)a3;
- (void)setOutputFrame:(id)a3;
- (void)setOutputLumaTex:(id)a3;
@end

@implementation H13FastPowerBlurStageArgs

- (H13FastPowerBlurStageArgs)initWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)H13FastPowerBlurStageArgs;
  v15 = [(H13FastPowerBlurStageArgs *)&v24 init];
  if (!v15)
  {
    FigDebugAssert3();
LABEL_13:
    v21 = 0;
    goto LABEL_10;
  }
  if (!v11 || !v12 || !v13 || !v14)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_13;
  }
  id v23 = v12;
  id v16 = v11;
  v17 = -[SoftISPInputFrame textures]((uint64_t)v13);
  uint64_t v18 = [v17 count];

  if (v18
    && ([v14 textures],
        v19 = objc_claimAutoreleasedReturnValue(),
        uint64_t v20 = [v19 count],
        v19,
        v20))
  {
    objc_storeStrong((id *)&v15->_config, a3);
    objc_storeStrong((id *)&v15->_bounds, a4);
    objc_storeStrong((id *)&v15->_inputFrame, a5);
    objc_storeStrong((id *)&v15->_outputFrame, a6);
    v21 = v15;
  }
  else
  {
    FigSignalErrorAt();
    v21 = 0;
  }
  id v11 = v16;
  id v12 = v23;
LABEL_10:

  return v21;
}

- (void)dealloc
{
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  v3.receiver = self;
  v3.super_class = (Class)H13FastPowerBlurStageArgs;
  [(H13FastPowerBlurStageArgs *)&v3 dealloc];
}

- (MTLTexture)inputLumaTex
{
  return self->_inputLumaTex;
}

- (void)setInputLumaTex:(id)a3
{
  id v5 = a3;
  v6 = self->_inputLumaTex;
  objc_storeStrong((id *)&self->_inputLumaTex, a3);
  if (v5) {
    FigMetalIncRef();
  }
  FigMetalDecRef();
}

- (MTLTexture)inputChromaTex
{
  return self->_inputChromaTex;
}

- (void)setInputChromaTex:(id)a3
{
  id v5 = a3;
  v6 = self->_inputChromaTex;
  objc_storeStrong((id *)&self->_inputChromaTex, a3);
  if (v5) {
    FigMetalIncRef();
  }
  FigMetalDecRef();
}

- (MTLTexture)outputLumaTex
{
  return self->_outputLumaTex;
}

- (void)setOutputLumaTex:(id)a3
{
  id v5 = a3;
  v6 = self->_outputLumaTex;
  objc_storeStrong((id *)&self->_outputLumaTex, a3);
  if (v5) {
    FigMetalIncRef();
  }
  FigMetalDecRef();
}

- (MTLTexture)outputChromaTex
{
  return self->_outputChromaTex;
}

- (void)setOutputChromaTex:(id)a3
{
  id v5 = a3;
  v6 = self->_outputChromaTex;
  objc_storeStrong((id *)&self->_outputChromaTex, a3);
  if (v5) {
    FigMetalIncRef();
  }
  FigMetalDecRef();
}

- (SoftISPConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (SoftISPBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
}

- (SoftISPInputFrame)inputFrame
{
  return self->_inputFrame;
}

- (void)setInputFrame:(id)a3
{
}

- (SoftISPOutputFrame)outputFrame
{
  return self->_outputFrame;
}

- (void)setOutputFrame:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputFrame, 0);
  objc_storeStrong((id *)&self->_inputFrame, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_outputChromaTex, 0);
  objc_storeStrong((id *)&self->_outputLumaTex, 0);
  objc_storeStrong((id *)&self->_inputChromaTex, 0);

  objc_storeStrong((id *)&self->_inputLumaTex, 0);
}

@end