@interface KeyboardObserver
+ (id)sharedInstance;
- (CGRect)keyboardFrame;
- (KeyboardObserver)init;
- (void)keyboardWillOrDidChangeFrame:(id)a3;
- (void)setKeyboardFrame:(CGRect)a3;
@end

@implementation KeyboardObserver

- (KeyboardObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)KeyboardObserver;
  v2 = [(KeyboardObserver *)&v8 init];
  v3 = v2;
  if (v2)
  {
    CGSize size = CGRectNull.size;
    v2->_keyboardFrame.origin = CGRectNull.origin;
    v2->_keyboardFrame.CGSize size = size;
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"keyboardWillOrDidChangeFrame:" name:UIKeyboardWillChangeFrameNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v3 selector:"keyboardWillOrDidChangeFrame:" name:UIKeyboardDidChangeFrameNotification object:0];
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_1016102D8 != -1) {
    dispatch_once(&qword_1016102D8, &stru_101313158);
  }
  v2 = (void *)qword_1016102E0;

  return v2;
}

- (void)keyboardWillOrDidChangeFrame:(id)a3
{
  v4 = [a3 userInfo];
  id v9 = [v4 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];

  if (v9)
  {
    [v9 CGRectValue];
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  -[KeyboardObserver setKeyboardFrame:](self, "setKeyboardFrame:", x, y, width, height);
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