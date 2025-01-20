@interface PTBoxFilter
- (PTBoxFilter)initWithMetalContext:(id)a3 options:(int)a4;
- (int)boxFilter1Channel:(id)a3 inTex:(id)a4 intermediate:(id)a5 outTex:(id)a6 kernelWidth:(int)a7 outputRemapping:;
@end

@implementation PTBoxFilter

- (PTBoxFilter)initWithMetalContext:(id)a3 options:(int)a4
{
  id v7 = a3;
  int v19 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PTBoxFilter;
  v8 = [(PTBoxFilter *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metalContext, a3);
    v10 = objc_opt_new();
    [v10 setConstantValue:&v19 type:29 withName:@"kBoxFilterOutputMapping"];
    uint64_t v11 = [v7 computePipelineStateFor:@"boxFilter1ChannelHorizontal" withConstants:v10];
    boxFilter1ChannelHorizontal = v9->_boxFilter1ChannelHorizontal;
    v9->_boxFilter1ChannelHorizontal = (MTLComputePipelineState *)v11;

    if (v9->_boxFilter1ChannelHorizontal)
    {
      uint64_t v13 = [v7 computePipelineStateFor:@"boxFilter1ChannelVertical" withConstants:v10];
      boxFilter1ChannelVertical = v9->_boxFilter1ChannelVertical;
      v9->_boxFilter1ChannelVertical = (MTLComputePipelineState *)v13;

      if (v9->_boxFilter1ChannelVertical)
      {
        v15 = v9;
LABEL_11:

        goto LABEL_12;
      }
      v16 = _PTLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PTBoxFilter initWithMetalContext:options:](v16);
      }
    }
    else
    {
      v16 = _PTLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PTBoxFilter initWithMetalContext:options:](v16);
      }
    }

    v15 = 0;
    goto LABEL_11;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (int)boxFilter1Channel:(id)a3 inTex:(id)a4 intermediate:(id)a5 outTex:(id)a6 kernelWidth:(int)a7 outputRemapping:
{
  uint64_t v8 = v7;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  int v25 = a7;
  uint64_t v24 = v8;
  if ((a7 & 0x80000001) == 1)
  {
    v17 = [a3 computeCommandEncoder];
    [v17 setComputePipelineState:self->_boxFilter1ChannelVertical];
    [v17 setTexture:v14 atIndex:0];
    [v17 setTexture:v15 atIndex:1];
    [v17 setBytes:&v25 length:4 atIndex:0];
    v23[0] = [v15 width];
    v23[1] = [v15 height];
    v23[2] = 1;
    long long v21 = xmmword_1D081FE90;
    uint64_t v22 = 1;
    [v17 dispatchThreads:v23 threadsPerThreadgroup:&v21];
    [v17 setComputePipelineState:self->_boxFilter1ChannelHorizontal];
    [v17 setTexture:v15 atIndex:0];
    [v17 setTexture:v16 atIndex:1];
    [v17 setBytes:&v25 length:4 atIndex:0];
    [v17 setBytes:&v24 length:8 atIndex:1];
    v20[0] = [v16 width];
    v20[1] = [v16 height];
    v20[2] = 1;
    long long v21 = xmmword_1D081FE90;
    uint64_t v22 = 1;
    [v17 dispatchThreads:v20 threadsPerThreadgroup:&v21];
    [v17 endEncoding];
    int v18 = 0;
  }
  else
  {
    v17 = _PTLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PTBoxFilter boxFilter1Channel:inTex:intermediate:outTex:kernelWidth:outputRemapping:](v17);
    }
    int v18 = -10;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxFilter1ChannelVertical, 0);
  objc_storeStrong((id *)&self->_boxFilter1ChannelHorizontal, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(os_log_t)log options:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "_boxFilter1ChannelHorizontal";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)initWithMetalContext:(os_log_t)log options:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "_boxFilter1ChannelVertical";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)boxFilter1Channel:(os_log_t)log inTex:intermediate:outTex:kernelWidth:outputRemapping:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "kernelWidth must be uneven", v1, 2u);
}

@end