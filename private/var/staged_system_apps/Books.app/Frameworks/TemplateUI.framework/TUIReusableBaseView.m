@interface TUIReusableBaseView
- (BOOL)shouldResetBoundsOriginWhenApplyingLayoutAttributes;
- (NSString)reuseIdentifier;
- (TUILayoutAttributes)layoutAttributes;
- (id)descendentViewWithIdentifier:(id)a3;
- (id)descendentViewWithRefId:(id)a3;
- (id)feedControllerHost;
- (id)tui_querySectionUID;
- (id)tui_querySectionUUID;
- (id)viewStateSave;
- (void)prepareForReuse;
- (void)setLayoutAttributes:(id)a3;
- (void)setReuseIdentifier:(id)a3;
@end

@implementation TUIReusableBaseView

- (void)prepareForReuse
{
  v3 = [(TUIReusableBaseView *)self layer];
  [v3 setFlipsHorizontalAxis:0];

  [(TUIReusableBaseView *)self _removeAllAnimations:1];
}

- (id)descendentViewWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(TUIReusableBaseView *)self layoutAttributes];
  v6 = [v5 renderModel];
  v7 = [v6 identifier];
  unsigned int v8 = [v7 isEqual:v4];

  if (v8) {
    v9 = self;
  }
  else {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

- (id)descendentViewWithRefId:(id)a3
{
  id v4 = a3;
  v5 = [(TUIReusableBaseView *)self layoutAttributes];
  v6 = [v5 refId];
  unsigned int v7 = [v6 isEqualToString:v4];

  if (v7) {
    unsigned int v8 = self;
  }
  else {
    unsigned int v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (BOOL)shouldResetBoundsOriginWhenApplyingLayoutAttributes
{
  return 1;
}

- (id)viewStateSave
{
  return 0;
}

- (id)feedControllerHost
{
  objc_opt_class();
  v3 = TUIPlatformAncestorOfClass(self);
  id v4 = [v3 controllerHost];

  return v4;
}

- (id)tui_querySectionUUID
{
  v2 = [(TUIReusableBaseView *)self renderViewHost];
  v3 = [v2 tui_querySectionUUID];

  return v3;
}

- (id)tui_querySectionUID
{
  v2 = [(TUIReusableBaseView *)self renderViewHost];
  v3 = [v2 tui_querySectionUID];

  return v3;
}

- (TUILayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setLayoutAttributes:(id)a3
{
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)setReuseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);

  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

@end