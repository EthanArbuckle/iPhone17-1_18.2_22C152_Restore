@interface VUINowPlayingWindowDelegateProvider
+ (id)sharedInstance;
- (BOOL)shouldNowPlayingWindowDismiss;
- (VUINowPlayingWindowDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation VUINowPlayingWindowDelegateProvider

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_31 != -1) {
    dispatch_once(&sharedInstance_onceToken_31, &__block_literal_global_135);
  }
  v2 = (void *)sharedInstance___sharedInstance_4;
  return v2;
}

void __53__VUINowPlayingWindowDelegateProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUINowPlayingWindowDelegateProvider);
  v1 = (void *)sharedInstance___sharedInstance_4;
  sharedInstance___sharedInstance_4 = (uint64_t)v0;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldNowPlayingWindowDismiss
{
  v2 = [(VUINowPlayingWindowDelegateProvider *)self delegate];
  v3 = v2;
  if (v2) {
    char v4 = [v2 shouldNowPlayingWindowDismiss];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (VUINowPlayingWindowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUINowPlayingWindowDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end