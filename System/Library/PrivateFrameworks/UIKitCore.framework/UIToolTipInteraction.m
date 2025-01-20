@interface UIToolTipInteraction
+ (NSCopying)visualStyleRegistryIdentity;
+ (id)_defaultToolTipInteractionFromInteractions:(id)a3;
+ (id)_newDefaultToolTipInteraction;
- (BOOL)isEnabled;
- (NSString)defaultToolTip;
- (UIToolTipInteraction)init;
- (UIToolTipInteraction)initWithDefaultToolTip:(NSString *)defaultToolTip;
- (UIView)view;
- (id)delegate;
- (id)toolTipAtPoint:(CGPoint)a3 boundingRect:(CGRect *)a4;
- (void)_refreshStyle;
- (void)_updateStyleForInteractionProperties;
- (void)didMoveToView:(id)a3;
- (void)setDefaultToolTip:(NSString *)defaultToolTip;
- (void)setDelegate:(id)delegate;
- (void)setEnabled:(BOOL)enabled;
- (void)willMoveToView:(id)a3;
@end

@implementation UIToolTipInteraction

- (void)willMoveToView:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  [(UIToolTipInteraction *)self _refreshStyle];
}

void __28__UIToolTipInteraction_init__block_invoke()
{
  id v1 = +[_UIVisualStyleRegistry defaultRegistry];
  uint64_t v0 = objc_opt_class();
  [v1 registerVisualStyleClass:v0 forStylableClass:objc_opt_class()];
}

- (void)_refreshStyle
{
  style = self->_style;
  self->_style = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_view);
    v6 = [v5 traitCollection];
    uint64_t v7 = [v6 userInterfaceIdiom];

    v8 = +[_UIVisualStyleRegistry registryForIdiom:v7];
    v9 = (objc_class *)[v8 visualStyleClassForStylableClass:objc_opt_class()];

    id v10 = [v9 alloc];
    id v11 = objc_loadWeakRetained((id *)&self->_view);
    v12 = (_UIToolTipInteractionStyle *)[v10 initWithView:v11 provider:self];

    v13 = self->_style;
    self->_style = v12;

    [(UIToolTipInteraction *)self _updateStyleForInteractionProperties];
  }
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"UIToolTipInteraction";
}

- (void)setDelegate:(id)delegate
{
  id obj = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateImplementsToolTipAtPoint = objc_opt_respondsToSelector() & 1;

    [(UIToolTipInteraction *)self _updateStyleForInteractionProperties];
  }
}

- (void)_updateStyleForInteractionProperties
{
}

- (UIToolTipInteraction)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIToolTipInteraction;
  v2 = [(UIToolTipInteraction *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    if (init_onceToken[0] != -1) {
      dispatch_once(init_onceToken, &__block_literal_global_531);
    }
  }
  return v3;
}

- (NSString)defaultToolTip
{
  return self->_defaultToolTip;
}

- (void)setDefaultToolTip:(NSString *)defaultToolTip
{
  objc_super v5 = defaultToolTip;
  v6 = self->_defaultToolTip;
  uint64_t v7 = v5;
  v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [(NSString *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_defaultToolTip, defaultToolTip);
    [(UIToolTipInteraction *)self _updateStyleForInteractionProperties];
  }
LABEL_9:
}

+ (id)_defaultToolTipInteractionFromInteractions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = v8;
          id v10 = v9;
          if (v9[9]) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

+ (id)_newDefaultToolTipInteraction
{
  id result = (id)objc_opt_new();
  *((unsigned char *)result + 9) = 1;
  return result;
}

- (UIToolTipInteraction)initWithDefaultToolTip:(NSString *)defaultToolTip
{
  uint64_t v5 = defaultToolTip;
  uint64_t v6 = [(UIToolTipInteraction *)self init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_defaultToolTip, defaultToolTip);
  }

  return v7;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    [(UIToolTipInteraction *)self _updateStyleForInteractionProperties];
  }
}

- (id)toolTipAtPoint:(CGPoint)a3 boundingRect:(CGRect *)a4
{
  double y = a3.y;
  double x = a3.x;
  if (!a4)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"UIToolTipInteraction.m" lineNumber:99 description:@"boundingRect must not be nil"];
  }
  if (self->_enabled)
  {
    if (self->_delegateImplementsToolTipAtPoint)
    {
      char v8 = [(UIToolTipInteraction *)self delegate];
      v9 = objc_msgSend(v8, "toolTipInteraction:configurationAtPoint:", self, x, y);

      if (v9)
      {
        [v9 sourceRect];
        if (CGRectIsNull(v29))
        {
          id v10 = [(UIToolTipInteraction *)self view];
          [v10 bounds];
          a4->origin.double x = v11;
          a4->origin.double y = v12;
          a4->size.width = v13;
          a4->size.height = v14;
        }
        else
        {
          [v9 sourceRect];
          a4->origin.double x = v21;
          a4->origin.double y = v22;
          a4->size.width = v23;
          a4->size.height = v24;
        }
        long long v15 = [v9 toolTip];
      }
      else
      {
        long long v15 = 0;
      }
    }
    else
    {
      v16 = [(UIToolTipInteraction *)self view];
      [v16 bounds];
      a4->origin.double x = v17;
      a4->origin.double y = v18;
      a4->size.width = v19;
      a4->size.height = v20;

      long long v15 = [(UIToolTipInteraction *)self defaultToolTip];
    }
  }
  else
  {
    long long v15 = 0;
  }
  return v15;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_defaultToolTip, 0);
}

@end