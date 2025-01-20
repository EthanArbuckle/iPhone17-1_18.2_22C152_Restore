@interface UIPasteControl
- (BOOL)isInternallyEnabled;
- (BOOL)shouldTrack;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIPasteControl)initWithCoder:(NSCoder *)coder;
- (UIPasteControl)initWithConfiguration:(UIPasteControlConfiguration *)configuration;
- (UIPasteControl)initWithFrame:(CGRect)frame;
- (UIPasteControlConfiguration)configuration;
- (id)_encodableSubviews;
- (id)synchronousSecureControlService;
- (id)target;
- (unsigned)_secureName;
- (void)_commonInitWithConfiguration:(void *)a3 target:;
- (void)_observePasteboard:(unsigned char *)a1;
- (void)_updateEnabledWithNotification:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setTarget:(id)target;
@end

@implementation UIPasteControl

- (UIPasteControl)initWithConfiguration:(UIPasteControlConfiguration *)configuration
{
  v4 = configuration;
  v8.receiver = self;
  v8.super_class = (Class)UIPasteControl;
  v5 = -[UIControl initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5) {
    -[UIPasteControl _commonInitWithConfiguration:target:]((uint64_t)v5, v4, 0);
  }

  return v6;
}

- (void)_commonInitWithConfiguration:(void *)a3 target:
{
  id v19 = a2;
  id v5 = a3;
  if (v19)
  {
    v6 = [_UIImmutablePasteControlConfiguration alloc];
    id v7 = v19;
    if (v6)
    {
      v20.receiver = v6;
      v20.super_class = (Class)UIPasteControlConfiguration;
      objc_super v8 = (_UIImmutablePasteControlConfiguration *)objc_msgSendSuper2(&v20, sel_init);
      v6 = v8;
      if (v8)
      {
        v8->super._displayMode = *((void *)v7 + 2);
        v8->super._cornerStyle = *((void *)v7 + 3);
        v8->super._cornerRadius = *((double *)v7 + 4);
        objc_storeStrong((id *)&v8->super._baseForegroundColor, *((id *)v7 + 6));
        objc_storeStrong((id *)&v6->super._baseBackgroundColor, *((id *)v7 + 7));
      }
    }

    v9 = *(void **)(a1 + 472);
    *(void *)(a1 + 472) = v6;
  }
  else
  {
    v10 = objc_alloc_init(_UIImmutablePasteControlConfiguration);
    v9 = *(void **)(a1 + 472);
    *(void *)(a1 + 472) = v10;
  }

  objc_storeWeak((id *)(a1 + 480), v5);
  switch([v19 displayMode])
  {
    case 0:
      id v11 = objc_alloc(MEMORY[0x1E4FB34A8]);
      uint64_t v12 = 1;
      goto LABEL_13;
    case 1:
      id v11 = objc_alloc(MEMORY[0x1E4FB34A8]);
      uint64_t v12 = 1;
      uint64_t v14 = 0;
      goto LABEL_14;
    case 2:
      id v11 = objc_alloc(MEMORY[0x1E4FB34A8]);
      uint64_t v12 = 0;
      goto LABEL_13;
    case 3:
      id v11 = objc_alloc(MEMORY[0x1E4FB34A8]);
      uint64_t v12 = 2;
LABEL_13:
      uint64_t v14 = 1;
LABEL_14:
      v13 = (void *)[v11 initWithType:1 iconIndex:v12 labelIndex:v14];
      break;
    default:
      v13 = 0;
      break;
  }
  v15 = [[_UISecureController alloc] initWithCategory:v13 control:a1];
  v16 = *(void **)(a1 + 456);
  *(void *)(a1 + 456) = v15;

  [v19 cornerRadius];
  objc_msgSend(*(id *)(a1 + 456), "setCornerRadius:");
  objc_msgSend(*(id *)(a1 + 456), "setCornerStyle:", objc_msgSend(v19, "cornerStyle"));
  id v17 = [v19 baseForegroundColor];
  objc_msgSend(*(id *)(a1 + 456), "setBaseForegroundColor:", objc_msgSend(v17, "CGColor"));

  id v18 = [v19 baseBackgroundColor];
  objc_msgSend(*(id *)(a1 + 456), "setBaseBackgroundColor:", objc_msgSend(v18, "CGColor"));

  objc_msgSend(*(id *)(a1 + 456), "setImagePlacement:", objc_msgSend(v19, "imagePlacement"));
  objc_msgSend(*(id *)(a1 + 456), "setShouldLayoutSynchronously:", objc_msgSend(v19, "_shouldLayoutSynchronously"));
  -[UIPasteControl _observePasteboard:]((unsigned char *)a1, v5 != 0);
}

- (UIPasteControl)initWithCoder:(NSCoder *)coder
{
  v4 = coder;
  v9.receiver = self;
  v9.super_class = (Class)UIPasteControl;
  id v5 = [(UIControl *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [(NSCoder *)v4 decodeObjectForKey:@"UIPasteControlConfiguration"];
    id v7 = [(NSCoder *)v4 decodeObjectForKey:@"UIPasteControlTarget"];
    -[UIPasteControl _commonInitWithConfiguration:target:]((uint64_t)v5, v6, v7);
  }
  return v5;
}

- (UIPasteControl)initWithFrame:(CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)UIPasteControl;
  v3 = -[UIControl initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v4 = v3;
  if (v3) {
    -[UIPasteControl _commonInitWithConfiguration:target:]((uint64_t)v3, 0, 0);
  }
  return v4;
}

- (void)_observePasteboard:(unsigned char *)a1
{
  if (!a1) {
    return;
  }
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if (a1[464]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = a2 == 0;
  }
  id v7 = v4;
  if (!v5)
  {
    [v4 addObserver:a1 selector:sel__updateEnabledWithNotification_ name:0x1ED154F80 object:0];
    char v6 = 1;
LABEL_10:
    a1[464] = v6;
    goto LABEL_11;
  }
  if (a1[464] && (a2 & 1) == 0)
  {
    [v4 removeObserver:a1 name:0x1ED154F80 object:0];
    char v6 = 0;
    goto LABEL_10;
  }
LABEL_11:
  [a1 _updateEnabledWithNotification:0];
}

- (id)_encodableSubviews
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIPasteControl;
  id v4 = a3;
  [(UIControl *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, @"UIPasteControlConfiguration", v6.receiver, v6.super_class);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  [v4 encodeObject:WeakRetained forKey:@"UIPasteControlTarget"];
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v7 _authenticationMessage];
  +[UIPasteboard _attemptAuthenticationWithMessage:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  if (WeakRetained)
  {
    v10 = +[UIPasteboard generalPasteboard];
    id v11 = [v10 itemProviders];

    id v12 = WeakRetained;
    id v13 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v12;
      do
      {
        if (objc_opt_respondsToSelector() & 1) != 0 && ([v14 canPasteItemProviders:v13]) {
          break;
        }
        uint64_t v15 = [v14 _nextResponderUsingTraversalStrategy:2];

        id v14 = (id)v15;
      }
      while (v15);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0 && [v12 canPasteItemProviders:v13])
    {
      id v14 = v12;
    }
    else
    {
      id v14 = 0;
    }

    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v14;
        uint64_t v17 = [v16 _dataOwnerForPaste];
        if ([v16 canBecomeFirstResponder]) {
          [v16 becomeFirstResponder];
        }
      }
      else
      {
        uint64_t v17 = 0;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __49__UIPasteControl_endTrackingWithTouch_withEvent___block_invoke;
      v19[3] = &unk_1E52D9F98;
      id v20 = v14;
      id v21 = v13;
      +[UIPasteboard _performAsDataOwner:v17 block:v19];
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)UIPasteControl;
  [(UIControl *)&v18 endTrackingWithTouch:v6 withEvent:v7];
}

uint64_t __49__UIPasteControl_endTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pasteItemProviders:*(void *)(a1 + 40)];
}

- (unsigned)_secureName
{
  return [(_UISecureController *)self->_secureController secureName];
}

- (void)setTarget:(id)target
{
  id obj = target;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_target, obj);
    -[UIPasteControl _observePasteboard:](self, obj != 0);
  }
}

- (void)_updateEnabledWithNotification:(id)a3
{
  p_target = &self->_target;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_target);
    id v6 = +[UIPasteboard generalPasteboard];
    id v7 = [v6 itemProviders];
    id v8 = v5;
    id v9 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v8;
      if (v10)
      {
        do
        {
          if (objc_opt_respondsToSelector() & 1) != 0 && ([v10 canPasteItemProviders:v9]) {
            break;
          }
          uint64_t v11 = [v10 _nextResponderUsingTraversalStrategy:2];

          id v10 = (id)v11;
        }
        while (v11);
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0 && [v8 canPasteItemProviders:v9])
    {
      id v10 = v8;
    }
    else
    {
      id v10 = 0;
    }

    BOOL v12 = v10 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  if (self->_internallyEnabled != v12)
  {
    self->_internallyEnabled = v12;
    [(_UISecureController *)self->_secureController updateState];
  }
}

- (BOOL)isInternallyEnabled
{
  return self->_internallyEnabled;
}

- (CGSize)intrinsicContentSize
{
  [(_UISecureController *)self->_secureController intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  [(_UISecureController *)self->_secureController updateSlotView];
  v3.receiver = self;
  v3.super_class = (Class)UIPasteControl;
  [(UIView *)&v3 layoutSubviews];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIPasteControl;
  [(UIControl *)&v4 setEnabled:a3];
  [(_UISecureController *)self->_secureController updateState];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIPasteControl;
  [(UIControl *)&v4 setHighlighted:a3];
  [(_UISecureController *)self->_secureController updateState];
}

- (BOOL)shouldTrack
{
  BOOL v3 = [(_UISecureController *)self->_secureController enchanted];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIPasteControl;
    LOBYTE(v3) = [(UIControl *)&v5 shouldTrack];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(_UISecureController *)self->_secureController intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)synchronousSecureControlService
{
  return (id)MEMORY[0x1F4167170](self, a2);
}

- (UIPasteControlConfiguration)configuration
{
  return self->_configuration;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_secureController, 0);
}

@end