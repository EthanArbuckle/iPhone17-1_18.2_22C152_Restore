@interface _UIStackedImageLayerWrappingView
- (CALayerDelegate)actionDelegate;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)setActionDelegate:(id)a3;
@end

@implementation _UIStackedImageLayerWrappingView

- (void)dealloc
{
  objc_storeWeak((id *)&self->_actionDelegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIStackedImageLayerWrappingView;
  [(UIView *)&v3 dealloc];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  p_actionDelegate = &self->_actionDelegate;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_actionDelegate);
  v9 = [WeakRetained actionForLayer:v7 forKey:v6];

  return v9;
}

- (CALayerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  return (CALayerDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end