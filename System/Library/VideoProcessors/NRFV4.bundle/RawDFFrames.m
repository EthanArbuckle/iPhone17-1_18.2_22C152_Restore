@interface RawDFFrames
- (NSMutableArray)frames;
- (RawDFFrames)init;
- (RawDFFrames)initWithMetalContext:(id)a3;
- (RawDFInputFrame)referenceFrame;
- (RawDFInputFrame)sifrFrame;
- (id)getFrameWithUniqueFrameId:(int)a3;
- (int)addFrame:(id)a3;
- (int)referenceFrameIndex;
- (int)sifrFrameIndex;
- (void)releaseAll;
- (void)releaseRgbTextures;
- (void)setReferenceFrameIndex:(int)a3;
@end

@implementation RawDFFrames

- (void)setReferenceFrameIndex:(int)a3
{
  self->_referenceFrameUniqueId = a3;
  if (a3 < 0)
  {
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (int)referenceFrameIndex
{
  return self->_referenceFrameUniqueId;
}

- (RawDFFrames)init
{
  v3.receiver = self;
  v3.super_class = (Class)RawDFFrames;
  return [(RawDFFrames *)&v3 init];
}

- (RawDFFrames)initWithMetalContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)RawDFFrames;
  v4 = [(RawDFFrames *)&v9 init];
  if (v4)
  {
    if (a3
      && (uint64_t v5 = objc_opt_new(),
          frames = v4->_frames,
          v4->_frames = (NSMutableArray *)v5,
          frames,
          v4->_frames))
    {
      *(void *)&v4->_referenceFrameIndex = -1;
      v4->_sifrFrameIndex = -1;
    }
    else
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v4;
}

- (int)addFrame:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_frames addObject:v4];
  uint64_t v5 = [(NSMutableArray *)self->_frames lastObject];

  if (v5)
  {
    if (self->_referenceFrameUniqueId < 0
      || [v4 uniqueFrameId] != self->_referenceFrameUniqueId)
    {
      v7 = [v4 properties];
      v8 = [v7 meta];
      int v9 = [v8 isEVMFrame];

      int v6 = 0;
      if (v9) {
        self->_sifrFrameIndex = [(NSMutableArray *)self->_frames count] - 1;
      }
    }
    else
    {
      int v6 = 0;
      self->_referenceFrameIndex = [(NSMutableArray *)self->_frames count] - 1;
    }
  }
  else
  {
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v6 = -73325;
  }

  return v6;
}

- (id)getFrameWithUniqueFrameId:(int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_frames;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "uniqueFrameId", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (RawDFInputFrame)sifrFrame
{
  if (self->_sifrFrameIndex < 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:");
  }

  return (RawDFInputFrame *)v2;
}

- (RawDFInputFrame)referenceFrame
{
  if (self->_referenceFrameIndex < 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:");
  }

  return (RawDFInputFrame *)v2;
}

- (void)releaseRgbTextures
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_frames;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "releaseRgbTex", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)releaseAll
{
  self->_sifrFrameIndex = -1;
  *(void *)&self->_referenceFrameIndex = -1;
}

- (int)sifrFrameIndex
{
  return self->_sifrFrameIndex;
}

- (NSMutableArray)frames
{
  return self->_frames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end