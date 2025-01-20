@interface RawDFProxyBoundInferenceResults
- (MTLTexture)personMask;
- (MTLTexture)skinMask;
- (MTLTexture)skyMask;
- (NSArray)instanceMasks;
- (RawDFProxyBoundInferenceResults)initWithResult:(id)a3 andMetal:(id)a4;
- (void)setInstanceMasks:(id)a3;
- (void)setPersonMask:(id)a3;
- (void)setSkinMask:(id)a3;
- (void)setSkyMask:(id)a3;
@end

@implementation RawDFProxyBoundInferenceResults

- (RawDFProxyBoundInferenceResults)initWithResult:(id)a3 andMetal:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)RawDFProxyBoundInferenceResults;
  v9 = [(RawDFProxyBoundInferenceResults *)&v35 init];
  if (v9)
  {
    if (v7 && v8)
    {
      int v10 = [v7 status];
      if (v10)
      {
        LODWORD(v34) = v10;
        FigDebugAssert3();
        objc_msgSend(v7, "status", v34, v4);
LABEL_32:
        v31 = 0;
        goto LABEL_26;
      }
      if (![v7 skinMask]
        || (objc_msgSend(v8, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", objc_msgSend(v7, "skinMask"), 10, 1, 0), uint64_t v11 = objc_claimAutoreleasedReturnValue(), skinMask = v9->_skinMask, v9->_skinMask = (MTLTexture *)v11, skinMask, v9->_skinMask))
      {
        if (![v7 skyMask]
          || (objc_msgSend(v8, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", objc_msgSend(v7, "skyMask"), 10, 1, 0), uint64_t v13 = objc_claimAutoreleasedReturnValue(), skyMask = v9->_skyMask, v9->_skyMask = (MTLTexture *)v13, skyMask, v9->_skyMask))
        {
          if (![v7 highResPersonMask] && !objc_msgSend(v7, "personMask")) {
            goto LABEL_17;
          }
          uint64_t v15 = [v7 highResPersonMask];
          if (!v15) {
            uint64_t v15 = [v7 personMask];
          }
          uint64_t v16 = [v7 highResPersonMask] ? 10 : 25;
          uint64_t v17 = [v8 bindPixelBufferToMTL2DTexture:v15 pixelFormat:v16 usage:1 plane:0];
          personMask = v9->_personMask;
          v9->_personMask = (MTLTexture *)v17;

          if (v9->_personMask)
          {
LABEL_17:
            v19 = [v7 lowResPersonInstanceMasks];

            if (v19)
            {
              v20 = (NSArray *)objc_opt_new();
              v21 = [v7 lowResPersonInstanceMasks];
              uint64_t v22 = [v21 count];

              if (v22)
              {
                unint64_t v23 = 0;
                do
                {
                  v24 = [v7 lowResPersonInstanceMasks];
                  v25 = [v24 objectAtIndexedSubscript:v23];

                  if (v25)
                  {
                    uint64_t v26 = [v8 bindPixelBufferToMTL2DTexture:v25 pixelFormat:25 usage:1 plane:0];
                    if (!v26)
                    {
                      v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                      os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
                      fig_log_call_emit_and_clean_up_after_send_and_compose();

                      goto LABEL_32;
                    }
                    v27 = (void *)v26;
                    [(NSArray *)v20 addObject:v26];
                  }
                  ++v23;
                  v28 = [v7 lowResPersonInstanceMasks];
                  unint64_t v29 = [v28 count];
                }
                while (v29 > v23);
              }
              instanceMasks = v9->_instanceMasks;
              v9->_instanceMasks = v20;
            }
            goto LABEL_25;
          }
        }
      }
    }
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_32;
  }
LABEL_25:
  v31 = v9;
LABEL_26:

  return v31;
}

- (MTLTexture)skinMask
{
  return self->_skinMask;
}

- (void)setSkinMask:(id)a3
{
}

- (MTLTexture)skyMask
{
  return self->_skyMask;
}

- (void)setSkyMask:(id)a3
{
}

- (MTLTexture)personMask
{
  return self->_personMask;
}

- (void)setPersonMask:(id)a3
{
}

- (NSArray)instanceMasks
{
  return self->_instanceMasks;
}

- (void)setInstanceMasks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceMasks, 0);
  objc_storeStrong((id *)&self->_personMask, 0);
  objc_storeStrong((id *)&self->_skyMask, 0);

  objc_storeStrong((id *)&self->_skinMask, 0);
}

@end