@interface TUIFeedOverlayDebugView
- (TUIFeedOverlayDebugViewDelegate)delegate;
- (TUIRenderModelCollection)renderModel;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_updateDebugButtons;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setRenderModel:(id)a3;
@end

@implementation TUIFeedOverlayDebugView

- (void)setRenderModel:(id)a3
{
  v5 = (TUIRenderModelCollection *)a3;
  if (self->_renderModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_renderModel, a3);
    [(TUIFeedOverlayDebugView *)self setNeedsLayout];
    v5 = v6;
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUIFeedOverlayDebugView;
  [(TUIFeedOverlayDebugView *)&v3 layoutSubviews];
  [(TUIFeedOverlayDebugView *)self _updateDebugButtons];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TUIFeedOverlayDebugView;
  -[TUIFeedOverlayDebugView hitTest:withEvent:](&v7, "hitTest:withEvent:", a4, a3.x, a3.y);
  v5 = (TUIFeedOverlayDebugView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }

  return v5;
}

- (void)_updateDebugButtons
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_16BBF4;
  v13[3] = &unk_251990;
  v13[4] = self;
  +[UIView performWithoutAnimation:v13];
  objc_super v3 = [(_TUIFeedSectionDebug *)self->_debug button];
  [v3 setHidden:[self->_debug showButton] ^ 1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = [WeakRetained feedOverlayDebugViewController];
  v6 = [v5 view];
  [v6 safeAreaInsets];
  double v8 = v7;
  double v10 = v9;

  [v3 bounds];
  double v12 = v11;
  [v3 bounds];
  [v3 setFrame:CGRectMake(v10 + 5.0, v8 + 5.0, v12)];
}

- (TUIFeedOverlayDebugViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUIFeedOverlayDebugViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TUIRenderModelCollection)renderModel
{
  return self->_renderModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_debug, 0);
}

@end