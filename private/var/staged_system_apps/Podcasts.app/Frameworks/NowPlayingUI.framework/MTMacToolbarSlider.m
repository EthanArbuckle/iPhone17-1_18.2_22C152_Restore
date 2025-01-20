@interface MTMacToolbarSlider
- (_MTNSSlider)_internalNSSlider;
- (void)_installVisualElement:(id)a3;
- (void)set_internalNSSlider:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MTMacToolbarSlider

- (void)_installVisualElement:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTMacToolbarSlider;
  if ([(MTMacToolbarSlider *)&v20 respondsToSelector:a2])
  {
    v19.receiver = self;
    v19.super_class = (Class)MTMacToolbarSlider;
    [(MTMacToolbarSlider *)&v19 _installVisualElement:v5];
    NSClassFromString(@"_UISliderMacVisualElement");
    if (objc_opt_isKindOfClass())
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v6 = [v5 subviews];
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v16;
LABEL_5:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
          NSClassFromString(@"_UINSView");
          if (objc_opt_isKindOfClass()) {
            break;
          }
          if (v8 == (id)++v10)
          {
            id v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
            if (v8) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v12 = v11;

        if (v12)
        {
          if (objc_opt_respondsToSelector())
          {
            v13 = [v12 contentNSView];
            NSClassFromString(@"NSSlider");
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v6 = [v12 contentNSView];
              [v6 setControlSize:2];
              [v6 _setSemanticContext:4];
              [(MTMacToolbarSlider *)self set_internalNSSlider:v6];
              goto LABEL_12;
            }
          }
        }
      }
      else
      {
LABEL_11:
        id v12 = 0;
LABEL_12:
      }
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MTMacToolbarSlider;
  [(MTMacToolbarSlider *)&v11 traitCollectionDidChange:a3];
  v4 = [(MTMacToolbarSlider *)self _internalNSSlider];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(MTMacToolbarSlider *)self traitCollection];
    id v7 = (char *)[v6 userInterfaceStyle];
    id v8 = @"plusD";
    if (v7 == (unsigned char *)&dword_0 + 2) {
      id v8 = @"plusL";
    }
    uint64_t v9 = v8;

    uint64_t v10 = [(MTMacToolbarSlider *)self _internalNSSlider];
    [v10 setCompositingFilter:v9];
  }
}

- (_MTNSSlider)_internalNSSlider
{
  return self->__internalNSSlider;
}

- (void)set_internalNSSlider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end