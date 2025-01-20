@interface RawDFPostDemosaicTuningParams
- (PostDemosaicTuningParams)tuningEVMinus;
- (PostDemosaicTuningParams)tuningEVZero;
- (PostDemosaicTuningParams)tuningLong;
- (PostDemosaicTuningParams)tuningQuadra48EVZero;
- (id)readPlist:(id)a3 withFrameType:(int)a4 withFrameTypeString:(id)a5;
- (int)readPlist:(id)a3;
@end

@implementation RawDFPostDemosaicTuningParams

- (id)readPlist:(id)a3 withFrameType:(int)a4 withFrameTypeString:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v8 = objc_opt_new();
  if (v8
    && ([v6 objectForKeyedSubscript:@"Default"], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9;
    v11 = [v6 objectForKeyedSubscript:v7];
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = objc_msgSend(v11, "cmi_dictionaryMergedWithDefaultDict:", v10);

      v10 = v13;
    }
    if (![v8 readPlist:v10])
    {
      id v14 = v8;

      goto LABEL_7;
    }
    FigDebugAssert3();
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  id v14 = 0;
LABEL_7:

  return v14;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263E64AA0]();
  id v6 = [(RawDFPostDemosaicTuningParams *)self readPlist:v4 withFrameType:0 withFrameTypeString:@"EVZero"];
  tuningEVZero = self->_tuningEVZero;
  self->_tuningEVZero = v6;

  if (!self->_tuningEVZero) {
    goto LABEL_11;
  }
  v8 = [(RawDFPostDemosaicTuningParams *)self readPlist:v4 withFrameType:1 withFrameTypeString:@"EVMinus"];
  tuningEVMinus = self->_tuningEVMinus;
  self->_tuningEVMinus = v8;

  if (!self->_tuningEVMinus) {
    goto LABEL_11;
  }
  v10 = [(RawDFPostDemosaicTuningParams *)self readPlist:v4 withFrameType:2 withFrameTypeString:@"Long"];
  tuningLong = self->_tuningLong;
  self->_tuningLong = v10;

  if (!self->_tuningLong) {
    goto LABEL_11;
  }
  v12 = (PostDemosaicTuningParams *)objc_opt_new();
  tuningQuadra48EVZero = self->_tuningQuadra48EVZero;
  self->_tuningQuadra48EVZero = v12;

  if (self->_tuningQuadra48EVZero
    && ([v4 objectForKeyedSubscript:@"Default"], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v15 = (void *)v14;
    v16 = [v4 objectForKeyedSubscript:@"Quadra48_EVZero"];
    if (v16)
    {
      v17 = v16;
      v18 = objc_msgSend(v16, "cmi_dictionaryMergedWithDefaultDict:", v15);

      int v19 = [(PostDemosaicTuningParams *)self->_tuningQuadra48EVZero readPlist:v18];
      if (v19)
      {
        FigDebugAssert3();
        v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      v18 = 0;
      int v19 = 0;
    }
  }
  else
  {
LABEL_11:
    v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    int v19 = -73313;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v15 = 0;
    v18 = 0;
  }

  return v19;
}

- (PostDemosaicTuningParams)tuningEVZero
{
  return self->_tuningEVZero;
}

- (PostDemosaicTuningParams)tuningEVMinus
{
  return self->_tuningEVMinus;
}

- (PostDemosaicTuningParams)tuningLong
{
  return self->_tuningLong;
}

- (PostDemosaicTuningParams)tuningQuadra48EVZero
{
  return self->_tuningQuadra48EVZero;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningQuadra48EVZero, 0);
  objc_storeStrong((id *)&self->_tuningLong, 0);
  objc_storeStrong((id *)&self->_tuningEVMinus, 0);

  objc_storeStrong((id *)&self->_tuningEVZero, 0);
}

@end