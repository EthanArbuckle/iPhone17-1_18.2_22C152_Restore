@interface SFSSAudioDataWrapper
- (NSArray)audioChunks;
- (SFSSAudioDataWrapper)initWithAudioChunks:(id)a3;
- (int64_t)index;
- (void)setAudioChunks:(id)a3;
- (void)setIndex:(int64_t)a3;
@end

@implementation SFSSAudioDataWrapper

- (void).cxx_destruct
{
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setAudioChunks:(id)a3
{
}

- (NSArray)audioChunks
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioChunks);
  return (NSArray *)WeakRetained;
}

- (SFSSAudioDataWrapper)initWithAudioChunks:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFSSAudioDataWrapper;
  v5 = [(SFSSAudioDataWrapper *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_index = 0;
    objc_storeWeak((id *)&v5->_audioChunks, v4);
  }

  return v6;
}

@end