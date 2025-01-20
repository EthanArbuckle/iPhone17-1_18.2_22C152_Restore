@interface SFSSTTSEngineCallbackResult
- (AudioStreamBasicDescription)asbd;
- (NSError)error;
- (SFSSTTSEngineCallbackResult)initWithBeginCallback:(id)a3 chunkCallback:(id)a4 endCallback:(id)a5;
- (id).cxx_construct;
- (id)beginCallback;
- (id)chunkCallback;
- (id)endCallback;
- (id)pcmData;
- (int)synthesisCallback:(int)a3;
- (void)marker;
- (void)pcmDataBuffer;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setBeginCallback:(id)a3;
- (void)setChunkCallback:(id)a3;
- (void)setEndCallback:(id)a3;
@end

@implementation SFSSTTSEngineCallbackResult

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_endCallback, 0);
  objc_storeStrong(&self->_chunkCallback, 0);
  objc_storeStrong(&self->_beginCallback, 0);
  objc_storeStrong((id *)&self->_error, 0);
  begin = self->_marker.__begin_;
  if (begin)
  {
    end = self->_marker.__end_;
    v5 = self->_marker.__begin_;
    if (end != begin)
    {
      do
      {
        if ((char)end[-1].markerName[255] < 0) {
          operator delete(*(void **)&end[-1].markerName[232]);
        }
        end = (Marker *)((char *)end - 56);
      }
      while (end != begin);
      v5 = self->_marker.__begin_;
    }
    self->_marker.__end_ = begin;
    operator delete(v5);
  }
  v6 = self->_pcmDataBuffer.__begin_;
  if (v6)
  {
    self->_pcmDataBuffer.__end_ = v6;
    operator delete(v6);
  }
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_asbd.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[2].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[2].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[3].mSampleRate;
  return self;
}

- (void)setEndCallback:(id)a3
{
}

- (id)endCallback
{
  return self->_endCallback;
}

- (void)setChunkCallback:(id)a3
{
}

- (id)chunkCallback
{
  return self->_chunkCallback;
}

- (void)setBeginCallback:(id)a3
{
}

- (id)beginCallback
{
  return self->_beginCallback;
}

- (NSError)error
{
  return self->_error;
}

- (id)pcmData
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:self->_pcmDataBuffer.__begin_ length:self->_pcmDataBuffer.__end_ - self->_pcmDataBuffer.__begin_];
}

- (void)marker
{
  return &self->_marker;
}

- (void)pcmDataBuffer
{
  return &self->_pcmDataBuffer;
}

- (int)synthesisCallback:(int)a3
{
  switch(a3)
  {
    case 4:
      (*((void (**)(void))self->_chunkCallback + 2))();
      v5 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v5;

      self->_pcmDataBuffer.__end_ = self->_pcmDataBuffer.__begin_;
      break;
    case 1:
      endCallback = (void (**)(id, SFSSTTSEngineCallbackResult *))self->_endCallback;
      goto LABEL_7;
    case 0:
      endCallback = (void (**)(id, SFSSTTSEngineCallbackResult *))self->_beginCallback;
LABEL_7:
      endCallback[2](endCallback, self);
      v7 = (NSError *)objc_claimAutoreleasedReturnValue();
      v8 = self->_error;
      self->_error = v7;

      break;
  }
  return [(NSError *)self->_error code];
}

- (SFSSTTSEngineCallbackResult)initWithBeginCallback:(id)a3 chunkCallback:(id)a4 endCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SFSSTTSEngineCallbackResult;
  v11 = [(SFSSTTSEngineCallbackResult *)&v19 init];
  if (v11)
  {
    uint64_t v12 = MEMORY[0x230F4BDC0](v8);
    id beginCallback = v11->_beginCallback;
    v11->_id beginCallback = (id)v12;

    uint64_t v14 = MEMORY[0x230F4BDC0](v9);
    id chunkCallback = v11->_chunkCallback;
    v11->_id chunkCallback = (id)v14;

    uint64_t v16 = MEMORY[0x230F4BDC0](v10);
    id endCallback = v11->_endCallback;
    v11->_id endCallback = (id)v16;
  }
  return v11;
}

@end