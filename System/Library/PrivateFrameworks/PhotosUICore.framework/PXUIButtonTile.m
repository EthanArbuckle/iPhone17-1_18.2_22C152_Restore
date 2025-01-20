@interface PXUIButtonTile
- (BOOL)_needsUpdate;
- (NSArray)_layoutConstraints;
- (NSString)title;
- (PXButtonSpec)_spec;
- (PXUIButtonTile)init;
- (PXUIButtonTileDelegate)delegate;
- (UIButton)_button;
- (UIView)_view;
- (void)_handleButton:(id)a3;
- (void)_invalidateButton;
- (void)_setLayoutConstraints:(id)a3;
- (void)_setNeedsUpdate;
- (void)_setSpec:(id)a3;
- (void)_updateButtonIfNeeded;
- (void)_updateIfNeeded;
- (void)becomeReusable;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXUIButtonTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__layoutConstraints, 0);
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->__button, 0);
  objc_storeStrong((id *)&self->__view, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSArray)_layoutConstraints
{
  return self->__layoutConstraints;
}

- (PXButtonSpec)_spec
{
  return self->__spec;
}

- (UIButton)_button
{
  return self->__button;
}

- (UIView)_view
{
  return self->__view;
}

- (NSString)title
{
  return self->_title;
}

- (void)setDelegate:(id)a3
{
}

- (PXUIButtonTileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXUIButtonTileDelegate *)WeakRetained;
}

- (void)becomeReusable
{
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  objc_msgSend(a4, "viewSpec", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PXUIButtonTile *)self _setSpec:v5];
  [(PXUIButtonTile *)self _updateIfNeeded];
}

- (void)_updateButtonIfNeeded
{
  v42[1] = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.button)
  {
    self->_needsUpdateFlags.button = 0;
    v4 = [(PXUIButtonTile *)self _button];
    id v5 = [(PXUIButtonTile *)self title];
    v6 = (void *)[v5 length];
    [v4 setHidden:v6 == 0];
    if (v6)
    {
      v6 = [MEMORY[0x1E4F1CA48] array];
      v7 = [(PXUIButtonTile *)self _spec];
      v8 = objc_msgSend(v5, "px_stringByApplyingCapitalization:", objc_msgSend(v7, "capitalization"));

      uint64_t v9 = [v7 font];
      if (v9)
      {
        if (v8)
        {
          id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
          uint64_t v41 = *MEMORY[0x1E4FB06F8];
          v42[0] = v9;
          v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
          v12 = (void *)[v10 initWithString:v8 attributes:v11];
        }
        else
        {
          v12 = 0;
        }
        [v4 setAttributedTitle:v12 forState:0];
      }
      else
      {
        [v4 setTitle:v8 forState:0];
      }
      v13 = [v7 textColor];
      if (v13) {
        [v4 setTitleColor:v13 forState:0];
      }
      v14 = objc_msgSend(v7, "highlightedTextColor", v9);

      if (v14) {
        [v4 setTitleColor:v14 forState:1];
      }
      double v15 = *((double *)off_1E5DAAF08 + 1);
      double v16 = *((double *)off_1E5DAAF08 + 3);
      objc_msgSend(v4, "setContentEdgeInsets:", *(double *)off_1E5DAAF08, v15, *((double *)off_1E5DAAF08 + 2), v16);
      [v7 contentInsets];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      v25 = [(PXUIButtonTile *)self _view];
      switch([v7 textAlignment])
      {
        case 0:
          v26 = [v25 leftAnchor];
          v27 = [v4 leftAnchor];
          double v29 = v20 - v15;
          goto LABEL_18;
        case 1:
        case 4:
          v26 = [v25 centerXAnchor];
          v27 = [v4 centerXAnchor];
          uint64_t v28 = [v26 constraintEqualToAnchor:v27];
          goto LABEL_19;
        case 2:
          v26 = [v25 rightAnchor];
          v27 = [v4 rightAnchor];
          double v29 = v24 - v16;
LABEL_18:
          uint64_t v28 = [v26 constraintEqualToAnchor:v27 constant:v29];
LABEL_19:
          v30 = (void *)v28;
          [v6 addObject:v28];

          uint64_t v31 = [v7 verticalAlignment];
          if (v31)
          {
            if (v31 == 1)
            {
              v32 = [v25 bottomAnchor];
              v33 = [v4 lastBaselineAnchor];
              v34 = v32;
              v35 = v33;
              double v36 = v22;
            }
            else
            {
              if (v31 != 2) {
                goto LABEL_27;
              }
              v32 = [v25 topAnchor];
              v33 = [v4 topAnchor];
              v34 = v32;
              v35 = v33;
              double v36 = v18;
            }
            uint64_t v37 = [v34 constraintEqualToAnchor:v35 constant:v36];
          }
          else
          {
            v32 = [v25 centerYAnchor];
            v33 = [v4 centerYAnchor];
            uint64_t v37 = [v32 constraintEqualToAnchor:v33];
          }
          v38 = (void *)v37;
          [v6 addObject:v37];

LABEL_27:
          break;
        default:
          v39 = [MEMORY[0x1E4F28B00] currentHandler];
          [v39 handleFailureInMethod:a2 object:self file:@"PXUIButtonTile.m" lineNumber:165 description:@"Code which should be unreachable has been reached"];

          abort();
      }
    }
    else
    {
      v8 = v5;
    }
    [(PXUIButtonTile *)self _setLayoutConstraints:v6];
  }
}

- (void)_invalidateButton
{
  self->_needsUpdateFlags.button = 1;
  [(PXUIButtonTile *)self _setNeedsUpdate];
}

- (void)_updateIfNeeded
{
  self->_hasScheduledUpdate = 0;
  if ([(PXUIButtonTile *)self _needsUpdate])
  {
    [(PXUIButtonTile *)self _updateButtonIfNeeded];
  }
}

- (void)_setNeedsUpdate
{
  if (!self->_hasScheduledUpdate)
  {
    self->_hasScheduledUpdate = 1;
    objc_initWeak(&location, self);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __33__PXUIButtonTile__setNeedsUpdate__block_invoke;
    v2[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v3, &location);
    dispatch_async(MEMORY[0x1E4F14428], v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

void __33__PXUIButtonTile__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateIfNeeded];
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.button;
}

- (void)_handleButton:(id)a3
{
  id v4 = [(PXUIButtonTile *)self delegate];
  [v4 buttonTileTapped:self];
}

- (void)_setLayoutConstraints:(id)a3
{
  v8 = (NSArray *)a3;
  id v4 = self->__layoutConstraints;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      if (self->__layoutConstraints) {
        objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
      }
      v6 = (NSArray *)[(NSArray *)v8 copy];
      layoutConstraints = self->__layoutConstraints;
      self->__layoutConstraints = v6;

      if (self->__layoutConstraints) {
        objc_msgSend(MEMORY[0x1E4F28DC8], "activateConstraints:");
      }
    }
  }
}

- (void)_setSpec:(id)a3
{
  char v5 = (PXButtonSpec *)a3;
  if (self->__spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__spec, a3);
    [(PXUIButtonTile *)self _invalidateButton];
    char v5 = v6;
  }
}

- (void)setTitle:(id)a3
{
  v8 = (NSString *)a3;
  id v4 = self->_title;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      title = self->_title;
      self->_title = v6;

      [(PXUIButtonTile *)self _invalidateButton];
    }
  }
}

- (PXUIButtonTile)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXUIButtonTile;
  v2 = [(PXUIButtonTile *)&v10 init];
  if (v2)
  {
    id v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    view = v2->__view;
    v2->__view = v3;

    uint64_t v5 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    button = v2->__button;
    v2->__button = (UIButton *)v5;

    [(UIButton *)v2->__button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v2->__button addTarget:v2 action:sel__handleButton_ forControlEvents:0x2000];
    [(UIView *)v2->__view addSubview:v2->__button];
    v7 = objc_alloc_init(PXButtonSpec);
    spec = v2->__spec;
    v2->__spec = v7;
  }
  return v2;
}

@end