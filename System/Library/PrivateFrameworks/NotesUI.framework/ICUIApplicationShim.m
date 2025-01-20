@interface ICUIApplicationShim
+ (ICUIApplicationShim)sharedInstance;
- (BOOL)isQuickNoteSessionActive;
- (BOOL)isSecureScreenShowing;
- (ICUIApplicationShimDelegate)delegate;
- (UIWindow)keyWindow;
- (void)setDelegate:(id)a3;
@end

@implementation ICUIApplicationShim

- (void)setDelegate:(id)a3
{
}

uint64_t __37__ICUIApplicationShim_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(ICUIApplicationShim);
  return MEMORY[0x1F41817F8]();
}

+ (ICUIApplicationShim)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_20);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return (ICUIApplicationShim *)v2;
}

- (UIWindow)keyWindow
{
  v2 = [(ICUIApplicationShim *)self delegate];
  v3 = [v2 keyWindow];

  return (UIWindow *)v3;
}

- (BOOL)isSecureScreenShowing
{
  v2 = [(ICUIApplicationShim *)self delegate];
  char v3 = [v2 isSecureScreenShowing];

  return v3;
}

- (BOOL)isQuickNoteSessionActive
{
  v2 = [(ICUIApplicationShim *)self delegate];
  char v3 = [v2 isQuickNoteSessionActive];

  return v3;
}

- (ICUIApplicationShimDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
}

@end