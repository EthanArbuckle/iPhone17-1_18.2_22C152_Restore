@interface TIKBSessionTouchInfo
- (TIKeyboardTouchEvent)touch;
- (unint64_t)layoutId;
- (void)setLayoutId:(unint64_t)a3;
- (void)setTouch:(id)a3;
@end

@implementation TIKBSessionTouchInfo

- (void).cxx_destruct
{
}

- (void)setLayoutId:(unint64_t)a3
{
  self->_layoutId = a3;
}

- (unint64_t)layoutId
{
  return self->_layoutId;
}

- (void)setTouch:(id)a3
{
}

- (TIKeyboardTouchEvent)touch
{
  return self->_touch;
}

@end