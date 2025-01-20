@interface UGCProactiveCallToActionButtonView
- (NSString)lookupIdentifier;
- (UGCProactiveCallToActionButtonView)initWithFrame:(CGRect)a3;
- (UGCProactiveCallToActionButtonViewDelegate)delegate;
- (UIButton)button;
- (void)_didTapOnButton;
- (void)_setupButton;
- (void)setDelegate:(id)a3;
- (void)setLookupIdentifier:(id)a3;
@end

@implementation UGCProactiveCallToActionButtonView

- (UGCProactiveCallToActionButtonView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UGCProactiveCallToActionButtonView;
  v3 = -[UGCProactiveCallToActionButtonView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(UGCProactiveCallToActionButtonView *)v3 _setupButton];
  }
  return v4;
}

- (void)_setupButton
{
  v3 = +[UIButton buttonWithType:0];
  button = self->_button;
  self->_button = v3;

  [(UIButton *)self->_button addTarget:self action:"_didTapOnButton" forControlEvents:64];
  [(UGCProactiveCallToActionButtonView *)self addSubview:self->_button];
  v5 = [[UGCRatingCategoryLikeDislikeView alloc] initWithCurrentState:0];
  [(UGCRatingCategoryLikeDislikeView *)v5 setUserInteractionEnabled:0];
  [(UIButton *)self->_button addSubview:v5];
  id v6 = [objc_alloc((Class)MUEdgeLayout) initWithItem:v5 container:self->_button];
  id v7 = [objc_alloc((Class)MUEdgeLayout) initWithItem:self->_button container:self insets:0.0, 0.0, 0.0, 0.0];
  v9[0] = v6;
  v9[1] = v7;
  v8 = +[NSArray arrayWithObjects:v9 count:2];
  +[NSLayoutConstraint _mapsui_activateLayouts:v8];
}

- (void)_didTapOnButton
{
  id v3 = [(UGCProactiveCallToActionButtonView *)self delegate];
  [v3 proactiveCallToActionButtonViewTapped:self];
}

- (NSString)lookupIdentifier
{
  return self->_lookupIdentifier;
}

- (void)setLookupIdentifier:(id)a3
{
}

- (UGCProactiveCallToActionButtonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCProactiveCallToActionButtonViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_lookupIdentifier, 0);
}

@end