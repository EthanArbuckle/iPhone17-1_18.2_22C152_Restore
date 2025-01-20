@interface LongPressableButtonItem
- (BOOL)isLongPressEnabled;
- (LongPressableButtonItem)init;
- (LongPressableButtonItem)initWithCoder:(id)a3;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (void)longPressGestureRecognized:(id)a3;
- (void)setLongPressEnabled:(BOOL)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setLongPressTarget:(id)a3 action:(SEL)a4;
@end

@implementation LongPressableButtonItem

- (LongPressableButtonItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)LongPressableButtonItem;
  result = [(LongPressableButtonItem *)&v3 init];
  if (result) {
    result->_longPressEnabled = 1;
  }
  return result;
}

- (void)setLongPressTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_longPressTarget, a3);
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = 0;
  }
  self->_longPressAction = v6;
  v7 = [(LongPressableButtonItem *)self longPressGestureRecognizer];

  if (!v7)
  {
    id v11 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"longPressGestureRecognized:"];
    [v11 setEnabled:[self isLongPressEnabled]];
    [(LongPressableButtonItem *)self setLongPressGestureRecognizer:v11];
    v8 = [(LongPressableButtonItem *)self _gestureRecognizers];
    id v9 = [v8 mutableCopy];

    v10 = [(LongPressableButtonItem *)self longPressGestureRecognizer];
    [v9 addObject:v10];

    [(LongPressableButtonItem *)self _setGestureRecognizers:v9];
  }
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (BOOL)isLongPressEnabled
{
  return self->_longPressEnabled;
}

- (LongPressableButtonItem)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LongPressableButtonItem;
  result = [(LongPressableButtonItem *)&v4 initWithCoder:a3];
  if (result) {
    result->_longPressEnabled = 1;
  }
  return result;
}

- (void)longPressGestureRecognized:(id)a3
{
  id v7 = a3;
  if ([v7 state] == (id)1)
  {
    objc_super v4 = +[UIApplication sharedApplication];
    if (self->_longPressAction) {
      SEL longPressAction = self->_longPressAction;
    }
    else {
      SEL longPressAction = 0;
    }
    id WeakRetained = objc_loadWeakRetained(&self->_longPressTarget);
    [v4 sendAction:longPressAction to:WeakRetained from:self forEvent:0];
  }
}

- (void)setLongPressEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_longPressEnabled = a3;
  id v4 = [(LongPressableButtonItem *)self longPressGestureRecognizer];
  [v4 setEnabled:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);

  objc_destroyWeak(&self->_longPressTarget);
}

@end