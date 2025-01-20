@interface SoftISPPipelineArgs
- (MTLTexture)inputChromaTex;
- (MTLTexture)inputLumaTex;
- (MTLTexture)inputTex;
- (MTLTexture)outputChromaTex;
- (MTLTexture)outputLumaTex;
- (MTLTexture)outputTex;
- (SoftISPBounds)bounds;
- (SoftISPConfig)config;
- (SoftISPInputFrame)inputFrame;
- (SoftISPOutputFrame)outputFrame;
- (SoftISPPipelineArgs)initWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (void)dealloc;
- (void)setBounds:(id)a3;
- (void)setConfig:(id)a3;
- (void)setInputChromaTex:(id)a3;
- (void)setInputFrame:(id)a3;
- (void)setInputLumaTex:(id)a3;
- (void)setInputTex:(id)a3;
- (void)setOutputChromaTex:(id)a3;
- (void)setOutputFrame:(id)a3;
- (void)setOutputLumaTex:(id)a3;
- (void)setOutputTex:(id)a3;
@end

@implementation SoftISPPipelineArgs

- (SoftISPPipelineArgs)initWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (!v11 || !v12 || !v13 || !v14)
  {
    FigDebugAssert3();
    FigSignalErrorAt();

    v22 = 0;
    goto LABEL_10;
  }
  uint64_t v16 = (uint64_t)v13;
  v17 = self;
  v25 = (void *)v16;
  id v26 = v12;
  id v18 = v11;
  v19 = -[SoftISPInputFrame textures](v16);
  uint64_t v20 = [v19 count];

  if (v20)
  {
    v21 = [v15 textures];
    v22 = (SoftISPPipelineArgs *)[v21 count];

    if (v22)
    {
      v27.receiver = v17;
      v27.super_class = (Class)SoftISPPipelineArgs;
      v23 = [(SoftISPPipelineArgs *)&v27 init];
      v22 = v23;
      id v11 = v18;
      if (v23)
      {
        objc_storeStrong((id *)&v23->_config, a3);
        objc_storeStrong((id *)&v22->_bounds, a4);
        objc_storeStrong((id *)&v22->_inputFrame, a5);
        objc_storeStrong((id *)&v22->_outputFrame, a6);
      }
      else
      {
        FigDebugAssert3();
        FigSignalErrorAt();
      }
      goto LABEL_9;
    }
    FigSignalErrorAt();
  }
  else
  {
    FigSignalErrorAt();

    v22 = 0;
  }
  id v11 = v18;
LABEL_9:
  id v13 = v25;
  id v12 = v26;
LABEL_10:

  return v22;
}

- (void)dealloc
{
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  v3.receiver = self;
  v3.super_class = (Class)SoftISPPipelineArgs;
  [(SoftISPPipelineArgs *)&v3 dealloc];
}

- (MTLTexture)inputTex
{
  return self->_inputTex;
}

- (void)setInputTex:(id)a3
{
  id v5 = a3;
  v6 = self->_inputTex;
  objc_storeStrong((id *)&self->_inputTex, a3);
  if (v5) {
    FigMetalIncRef();
  }
  FigMetalDecRef();
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

- (MTLTexture)outputTex
{
  return self->_outputTex;
}

- (void)setOutputTex:(id)a3
{
  id v5 = a3;
  v6 = self->_outputTex;
  objc_storeStrong((id *)&self->_outputTex, a3);
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
  objc_storeStrong((id *)&self->_outputTex, 0);
  objc_storeStrong((id *)&self->_inputChromaTex, 0);
  objc_storeStrong((id *)&self->_inputLumaTex, 0);

  objc_storeStrong((id *)&self->_inputTex, 0);
}

@end