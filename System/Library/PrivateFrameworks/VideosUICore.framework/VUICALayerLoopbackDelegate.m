@interface VUICALayerLoopbackDelegate
- (UIView)view;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)init:(id)a3;
- (void)setView:(id)a3;
@end

@implementation VUICALayerLoopbackDelegate

- (id)init:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUICALayerLoopbackDelegate;
  v5 = [(VUICALayerLoopbackDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_view, v4);
  }

  return v6;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  p_view = &self->_view;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  v9 = [WeakRetained actionForLayer:v7 forKey:v6];

  return v9;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end