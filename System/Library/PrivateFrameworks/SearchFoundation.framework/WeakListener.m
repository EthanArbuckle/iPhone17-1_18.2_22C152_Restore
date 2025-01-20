@interface WeakListener
- (SFFeedbackListener)strongListener;
- (WeakListener)initWithListener:(id)a3;
@end

@implementation WeakListener

- (void).cxx_destruct
{
}

- (SFFeedbackListener)strongListener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakListener);
  return (SFFeedbackListener *)WeakRetained;
}

- (WeakListener)initWithListener:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WeakListener;
  v5 = [(WeakListener *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_weakListener, v4);
  }

  return v6;
}

@end