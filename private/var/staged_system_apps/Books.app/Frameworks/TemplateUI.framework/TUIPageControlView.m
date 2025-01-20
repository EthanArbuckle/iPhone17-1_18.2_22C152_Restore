@interface TUIPageControlView
+ (id)renderModelWithStateToRenderModel:(id)a3 pressScale:(double)a4 touchInsets:(UIEdgeInsets)a5 identifier:(id)a6 pointer:(id)a7 scrollIdentifier:(id)a8 kind:(unint64_t)a9;
+ (id)tuiReuseIdentifier;
- (BOOL)isEnabledWithRenderModel:(id)a3;
- (BOOL)showContents;
- (void)_buttonPressed:(id)a3;
- (void)_updateEnabled;
- (void)renderModelUpdated;
- (void)viewDidEndDisplay;
@end

@implementation TUIPageControlView

+ (id)renderModelWithStateToRenderModel:(id)a3 pressScale:(double)a4 touchInsets:(UIEdgeInsets)a5 identifier:(id)a6 pointer:(id)a7 scrollIdentifier:(id)a8 kind:(unint64_t)a9
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a3;
  v22 = -[_TUIRenderModelPageControl initWithStateToRenderModel:pressScale:touchInsets:identifier:pointer:scrollIdentifier:kind:]([_TUIRenderModelPageControl alloc], "initWithStateToRenderModel:pressScale:touchInsets:identifier:pointer:scrollIdentifier:kind:", v21, v20, v19, v18, a9, a4, top, left, bottom, right);

  return v22;
}

+ (id)tuiReuseIdentifier
{
  return @"TUIReuseIdentifierPageControlView";
}

- (void)renderModelUpdated
{
  v12.receiver = self;
  v12.super_class = (Class)TUIPageControlView;
  [(TUIControlView *)&v12 renderModelUpdated];
  v3 = [(TUIReusableBaseView *)self layoutAttributes];
  v4 = [v3 renderModel];

  v5 = [v4 scrollIdentifier];
  v6 = [(TUIReusableBaseView *)self tui_querySectionUUID];
  v7 = [v5 tui_identifierByPrependingUUID:v6];

  v8 = [(TUIReusableBaseView *)self feedControllerHost];
  v9 = [v8 pagedScrollableController];
  v10 = [v9 pagedScrollableWithIdentifier:v7];

  pagedScrollable = self->_pagedScrollable;
  if (v10 != pagedScrollable)
  {
    [(TUIPagedScrollable *)pagedScrollable removeObserver:self];
    objc_storeStrong((id *)&self->_pagedScrollable, v10);
    [(TUIPagedScrollable *)self->_pagedScrollable addObserver:self];
    [(TUIPageControlView *)self _updateEnabled];
  }
}

- (void)viewDidEndDisplay
{
  v4.receiver = self;
  v4.super_class = (Class)TUIPageControlView;
  [(TUIControlView *)&v4 viewDidEndDisplay];
  [(TUIPagedScrollable *)self->_pagedScrollable removeObserver:self];
  pagedScrollable = self->_pagedScrollable;
  self->_pagedScrollable = 0;
}

- (BOOL)showContents
{
  return self->_showContents;
}

- (void)_updateEnabled
{
  v3 = [(TUIReusableBaseView *)self layoutAttributes];
  id v7 = [v3 renderModel];

  if ([v7 actionKind] == (char *)&def_141F14 + 2
    && [(TUIPagedScrollable *)self->_pagedScrollable pageIndex])
  {
    uint64_t v4 = 1;
  }
  else if ([v7 actionKind] == (char *)&def_141F14 + 1)
  {
    v5 = (char *)[(TUIPagedScrollable *)self->_pagedScrollable pageIndex] + 1;
    uint64_t v4 = v5 < [(TUIPagedScrollable *)self->_pagedScrollable pageCount];
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (self->_actionEnabled != v4)
  {
    self->_actionEnabled = v4;
    [(TUIInteractiveBaseView *)self setEnabled:v4];
  }
  if ((unint64_t)[(TUIPagedScrollable *)self->_pagedScrollable pageCount] > 1) {
    BOOL v6 = v4;
  }
  else {
    BOOL v6 = 0;
  }
  if (self->_showContents != v6)
  {
    self->_showContents = v6;
    [(TUIInteractiveBaseView *)self invalidateShowContents];
  }
}

- (BOOL)isEnabledWithRenderModel:(id)a3
{
  return self->_actionEnabled;
}

- (void)_buttonPressed:(id)a3
{
  uint64_t v4 = [(TUIReusableBaseView *)self layoutAttributes];
  id v8 = [v4 renderModel];

  if ([v8 actionKind] == (char *)&def_141F14 + 2)
  {
    p_pagedScrollable = &self->_pagedScrollable;
    if ([(TUIPagedScrollable *)self->_pagedScrollable pageIndex])
    {
      uint64_t v6 = -1;
LABEL_7:
      [(TUIPagedScrollable *)*p_pagedScrollable pagedScrollableActionChangeToPageIndex:(char *)[(TUIPagedScrollable *)*p_pagedScrollable pageIndex] + v6];
      goto LABEL_8;
    }
  }
  if ([v8 actionKind] == (char *)&def_141F14 + 1)
  {
    p_pagedScrollable = &self->_pagedScrollable;
    id v7 = (char *)[(TUIPagedScrollable *)self->_pagedScrollable pageIndex] + 1;
    if (v7 < [(TUIPagedScrollable *)*p_pagedScrollable pageCount])
    {
      uint64_t v6 = 1;
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void).cxx_destruct
{
}

@end