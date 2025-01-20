@interface ICKeyboardNotificationListener
+ (id)sharedListener;
- (CGRect)keyboardFrame;
- (ICKeyboardNotificationListener)init;
- (void)dealloc;
- (void)handleKeyboardWillHide:(id)a3;
- (void)handleKeyboardWillShow:(id)a3;
- (void)setKeyboardFrame:(CGRect)a3;
@end

@implementation ICKeyboardNotificationListener

uint64_t __48__ICKeyboardNotificationListener_sharedListener__block_invoke()
{
  sharedListener_listener = objc_alloc_init(ICKeyboardNotificationListener);
  return MEMORY[0x1F41817F8]();
}

- (ICKeyboardNotificationListener)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICKeyboardNotificationListener;
  v2 = [(ICKeyboardNotificationListener *)&v8 init];
  v3 = (ICKeyboardNotificationListener *)v2;
  if (v2)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v2 + 8) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v2 + 24) = v4;
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v3 selector:sel_handleKeyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel_handleKeyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  }
  return v3;
}

+ (id)sharedListener
{
  if (sharedListener_onceToken != -1) {
    dispatch_once(&sharedListener_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)sharedListener_listener;
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICKeyboardNotificationListener;
  [(ICKeyboardNotificationListener *)&v4 dealloc];
}

- (void)handleKeyboardWillShow:(id)a3
{
  objc_super v4 = [a3 userInfo];
  v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[ICKeyboardNotificationListener setKeyboardFrame:](self, "setKeyboardFrame:", v7, v9, v11, v13);
}

- (void)handleKeyboardWillHide:(id)a3
{
}

- (CGRect)keyboardFrame
{
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

@end