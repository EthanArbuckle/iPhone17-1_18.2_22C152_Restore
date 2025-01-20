@interface RegWarpStageArgs
- (MTLTexture)inputTex;
- (RegWarpStageArgs)initWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (SoftISPBounds)bounds;
- (SoftISPConfig)config;
- (SoftISPInputFrame)inputFrame;
- (SoftISPOutputFrame)outputFrame;
- (void)setBounds:(id)a3;
- (void)setConfig:(id)a3;
- (void)setInputFrame:(id)a3;
- (void)setInputTex:(id)a3;
- (void)setOutputFrame:(id)a3;
@end

@implementation RegWarpStageArgs

- (RegWarpStageArgs)initWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)RegWarpStageArgs;
  v15 = [(RegWarpStageArgs *)&v26 init];
  if (!v15)
  {
    FigDebugAssert3();
LABEL_12:
    v23 = 0;
    goto LABEL_9;
  }
  if (!v11 || !v12 || !v13 || !v14)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_12;
  }
  id v25 = v14;
  id v16 = v12;
  id v17 = v11;
  v18 = -[SoftISPInputFrame textures]((uint64_t)v13);
  uint64_t v19 = [v18 count];

  if (v19)
  {
    objc_storeStrong((id *)&v15->_config, a3);
    objc_storeStrong((id *)&v15->_bounds, a4);
    objc_storeStrong((id *)&v15->_inputFrame, a5);
    objc_storeStrong((id *)&v15->_outputFrame, a6);
    v20 = -[SoftISPInputFrame textures]((uint64_t)v13);
    uint64_t v21 = [v20 objectAtIndexedSubscript:0];
    inputTex = v15->_inputTex;
    v15->_inputTex = (MTLTexture *)v21;

    v23 = v15;
  }
  else
  {
    FigSignalErrorAt();
    v23 = 0;
  }
  id v11 = v17;
  id v12 = v16;
  id v14 = v25;
LABEL_9:

  return v23;
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

  objc_storeStrong((id *)&self->_inputTex, 0);
}

@end