@interface ISLivePhotoSeekBehavior
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime;
- (ISLivePhotoSeekBehavior)initWithInitialLayoutInfo:(id)a3 seekTime:(id *)a4;
- (id)seekCompletionHandler;
- (int64_t)behaviorType;
- (void)_callSeekCompletionHandler:(BOOL)a3;
- (void)_handleDidSeekToSeekTime:(BOOL)a3;
- (void)_seekIfNeeded;
- (void)activeDidChange;
- (void)setSeekCompletionHandler:(id)a3;
- (void)setSeekTime:(id *)a3;
@end

@implementation ISLivePhotoSeekBehavior

- (void).cxx_destruct
{
}

- (void)setSeekCompletionHandler:(id)a3
{
}

- (id)seekCompletionHandler
{
  return self->_seekCompletionHandler;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (int64_t)behaviorType
{
  return 5;
}

- (void)_handleDidSeekToSeekTime:(BOOL)a3
{
  BOOL v3 = a3;
  -[ISLivePhotoSeekBehavior _callSeekCompletionHandler:](self, "_callSeekCompletionHandler:");
  if (v3 && self->_needsTransitionToVideo)
  {
    self->_needsTransitionToVideo = 0;
    v5 = objc_alloc_init(ISPlayerOutputTransitionOptions);
    [(ISPlayerOutputTransitionOptions *)v5 setTransitionDuration:0.3];
    v6 = [[ISPlayerState alloc] initWithPhotoBlurRadius:@"SEEK" videoAlpha:0.0 videoBlurRadius:1.0 label:0.0];
    [(ISBehavior *)self setOutputInfo:v6 withTransitionOptions:v5 completion:0];
  }
  self->_isSeeking = 0;

  [(ISLivePhotoSeekBehavior *)self _seekIfNeeded];
}

- (void)_callSeekCompletionHandler:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ISLivePhotoSeekBehavior *)self seekCompletionHandler];

  if (v5)
  {
    v6 = [(ISLivePhotoSeekBehavior *)self seekCompletionHandler];
    v6[2](v6, v3);

    [(ISLivePhotoSeekBehavior *)self setSeekCompletionHandler:0];
  }
}

- (void)_seekIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_isSeeking && self->_needsSeek)
  {
    id v3 = MEMORY[0x1E4F14500];
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
    {
      int64_t value = self->_seekTime.value;
      int timescale = self->_seekTime.timescale;
      *(_DWORD *)buf = 134218240;
      int64_t v10 = value;
      __int16 v11 = 1024;
      int v12 = timescale;
      _os_signpost_emit_with_name_impl(&dword_1DB21E000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "com.apple.photos.LivePhotoSeekBehavior", "Seeking to  (%lld/%d)", buf, 0x12u);
    }

    self->_isSeeking = 1;
    self->_needsSeek = 0;
    objc_initWeak((id *)buf, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__ISLivePhotoSeekBehavior__seekIfNeeded__block_invoke;
    v7[3] = &unk_1E6BECDA8;
    objc_copyWeak(&v8, (id *)buf);
    v7[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __40__ISLivePhotoSeekBehavior__seekIfNeeded__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = (long long *)(v4 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__ISLivePhotoSeekBehavior__seekIfNeeded__block_invoke_2;
  v9[3] = &unk_1E6BEC7B8;
  v9[4] = v4;
  objc_copyWeak(&v10, v2);
  long long v6 = *v5;
  uint64_t v8 = *((void *)v5 + 2);
  long long v7 = v6;
  LOBYTE(v2) = [WeakRetained seekVideoPlayerToTime:&v7 completionHandler:v9];

  if ((v2 & 1) == 0) {
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  }
  objc_destroyWeak(&v10);
}

void __40__ISLivePhotoSeekBehavior__seekIfNeeded__block_invoke_2(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ISLivePhotoSeekBehavior__seekIfNeeded__block_invoke_3;
  block[3] = &unk_1E6BEC750;
  block[4] = *(void *)(a1 + 32);
  char v4 = a2;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v3);
}

void __40__ISLivePhotoSeekBehavior__seekIfNeeded__block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = MEMORY[0x1E4F14500];
  uint64_t v3 = *(void *)(a1 + 32);
  os_signpost_id_t v4 = *(void *)(v3 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    uint64_t v5 = *(void *)(v3 + 56);
    int v6 = *(_DWORD *)(v3 + 64);
    int v7 = *(unsigned __int8 *)(a1 + 48);
    int v9 = 134218496;
    uint64_t v10 = v5;
    __int16 v11 = 1024;
    int v12 = v6;
    __int16 v13 = 1024;
    int v14 = v7;
    _os_signpost_emit_with_name_impl(&dword_1DB21E000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v4, "com.apple.photos.LivePhotoSeekBehavior", "Finished seeking (%lld/%d) [%d]", (uint8_t *)&v9, 0x18u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleDidSeekToSeekTime:*(unsigned __int8 *)(a1 + 48)];
}

- (void)setSeekTime:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 seekTime = &self->_seekTime;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 seekTime = self->_seekTime;
  if (CMTimeCompare(&time1, (CMTime *)&seekTime))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_seekTime->epoch = a3->var3;
    *(_OWORD *)&p_seekTime->int64_t value = v6;
    self->_needsSeek = 1;
    [(ISLivePhotoSeekBehavior *)self _seekIfNeeded];
  }
  else
  {
    [(ISLivePhotoSeekBehavior *)self _callSeekCompletionHandler:1];
  }
}

- (void)activeDidChange
{
  if ([(ISBehavior *)self isActive])
  {
    [(ISBehavior *)self setVideoPlayRate:0.0];
    [(ISLivePhotoSeekBehavior *)self _seekIfNeeded];
  }
  else
  {
    [(ISLivePhotoSeekBehavior *)self _callSeekCompletionHandler:0];
  }
}

- (ISLivePhotoSeekBehavior)initWithInitialLayoutInfo:(id)a3 seekTime:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ISLivePhotoSeekBehavior;
  int v7 = [(ISBehavior *)&v12 initWithInitialLayoutInfo:v6];
  uint64_t v8 = (ISLivePhotoSeekBehavior *)v7;
  if (v7)
  {
    int64_t var3 = a4->var3;
    *(_OWORD *)(v7 + 56) = *(_OWORD *)&a4->var0;
    *((void *)v7 + 9) = var3;
    [v6 videoAlpha];
    v8->_needsTransitionToVideo = v10 == 0.0;
    v8->_needsSeek = 1;
    v8->_os_signpost_id_t signpostID = os_signpost_id_make_with_pointer(MEMORY[0x1E4F14500], v8);
  }

  return v8;
}

@end