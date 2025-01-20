@interface _UISecureController
- (BOOL)enchanted;
- (BOOL)shouldGetFinalContentSynchronouslyInSlotView:(id)a3;
- (BOOL)shouldLayoutSynchronously;
- (BOOL)slotView:(id)a3 shouldSetFinalContentForStyle:(id)a4 tag:(id)a5;
- (BOOL)slotView:(id)a3 shouldSetInitialContentForStyle:(id)a4 tag:(id)a5;
- (CGColor)baseBackgroundColor;
- (CGColor)baseForegroundColor;
- (CGSize)intrinsicContentSize;
- (_UISSecureControlCategory)category;
- (_UISecureController)initWithCategory:(id)a3 control:(id)a4;
- (double)cornerRadius;
- (id)_synchronousRemoteObjectProxyWithSelector:(uint64_t)a1;
- (id)currentTagForSlotView:(id)a3;
- (id)slotMachineForFinalContentInSlotView:(id)a3;
- (id)slotView:(id)a3 initialContentForStyle:(id)a4 tag:(id)a5;
- (id)slotView:(id)a3 replacementForFinalContent:(id)a4 style:(id)a5 tag:(id)a6;
- (int64_t)cornerStyle;
- (unint64_t)imagePlacement;
- (unsigned)secureName;
- (void)_updateSizeSpec:(double)a3 intrinsicContentSize:(double)a4;
- (void)dealloc;
- (void)setBaseBackgroundColor:(CGColor *)a3;
- (void)setBaseForegroundColor:(CGColor *)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCornerStyle:(int64_t)a3;
- (void)setImagePlacement:(unint64_t)a3;
- (void)setShouldLayoutSynchronously:(BOOL)a3;
- (void)updateSlotView;
- (void)updateState;
@end

@implementation _UISecureController

- (_UISecureController)initWithCategory:(id)a3 control:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UISecureController;
  v9 = [(_UISecureController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_category, a3);
    v10->_cornerStyle = 2;
    v10->_cornerRadius = 0.0;
    v10->_baseForegroundColor = 0;
    v10->_baseBackgroundColor = 0;
    v10->_imagePlacement = 2;
    v10->_enchanted = 0;
    v10->_intrinsicContentSize = (CGSize)*MEMORY[0x1E4F1DB30];
    objc_storeWeak((id *)&v10->_secureControl, v8);
    objc_storeWeak((id *)&v10->_slotView, 0);
    lastSizeSpec = v10->_lastSizeSpec;
    v10->_lastSizeSpec = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&v10->_secureControl);
    [WeakRetained setNeedsLayout];
  }
  return v10;
}

- (void)dealloc
{
  CGColorRelease(self->_baseForegroundColor);
  CGColorRelease(self->_baseBackgroundColor);
  v3.receiver = self;
  v3.super_class = (Class)_UISecureController;
  [(_UISecureController *)&v3 dealloc];
}

- (unsigned)secureName
{
  return [(_UISSecureControlCategory *)self->_category secureName];
}

- (void)updateSlotView
{
  p_slotView = &self->_slotView;
  id WeakRetained = (_UISlotView *)objc_loadWeakRetained((id *)&self->_slotView);
  if (WeakRetained)
  {
    obj = WeakRetained;
    [(_UISlotView *)WeakRetained _updateContent];
  }
  else
  {
    obj = objc_alloc_init(_UISlotView);
    [(_UISlotView *)obj _setContentDelegate:self];
    id v5 = objc_loadWeakRetained((id *)&self->_secureControl);
    [(_UISlotView *)obj _overlayView:v5 centerInView:v5];

    objc_storeWeak((id *)p_slotView, obj);
    [(_UISecureController *)self updateState];
  }
}

- (void)updateState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slotView);
  if (WeakRetained)
  {
    id v14 = WeakRetained;
    if (self->_enchanted)
    {
      p_secureControl = &self->_secureControl;
      id v5 = objc_loadWeakRetained((id *)p_secureControl);
      if ([v5 isEnabled])
      {
        id v6 = objc_loadWeakRetained((id *)p_secureControl);
        int v7 = [v6 isInternallyEnabled];

        if (v7)
        {
          id v8 = objc_loadWeakRetained((id *)p_secureControl);
          v9 = [v8 traitCollection];
          BOOL v10 = [v9 userInterfaceStyle] == 2;

          id v11 = objc_loadWeakRetained((id *)p_secureControl);
          int v12 = [v11 isHighlighted];
          double v13 = dbl_186B935B0[v10];
          if (!v12) {
            double v13 = 1.0;
          }
          [v14 setAlpha:v13];

          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    [v14 setAlpha:0.25];
LABEL_10:
    id WeakRetained = v14;
  }
}

- (void)setCornerStyle:(int64_t)a3
{
  if (self->_cornerStyle != a3)
  {
    self->_cornerStyle = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_secureControl);
    [WeakRetained setNeedsLayout];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_secureControl);
    [WeakRetained setNeedsLayout];
  }
}

- (void)setBaseForegroundColor:(CGColor *)a3
{
  baseForegroundColor = self->_baseForegroundColor;
  if (baseForegroundColor != a3)
  {
    CGColorRelease(baseForegroundColor);
    self->_baseForegroundColor = CGColorRetain(a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_secureControl);
    [WeakRetained setNeedsLayout];
  }
}

- (void)setBaseBackgroundColor:(CGColor *)a3
{
  baseBackgroundColor = self->_baseBackgroundColor;
  if (baseBackgroundColor != a3)
  {
    CGColorRelease(baseBackgroundColor);
    self->_baseBackgroundColor = CGColorRetain(a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_secureControl);
    [WeakRetained setNeedsLayout];
  }
}

- (void)setImagePlacement:(unint64_t)a3
{
  if (self->_imagePlacement != a3)
  {
    self->_imagePlacement = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_secureControl);
    [WeakRetained setNeedsLayout];
  }
}

- (id)_synchronousRemoteObjectProxyWithSelector:(uint64_t)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v4 = [WeakRetained synchronousSecureControlService];

    id v5 = objc_getAssociatedObject(v4, a2);
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      uint64_t v10 = 0;
      id v11 = &v10;
      uint64_t v12 = 0x3032000000;
      double v13 = __Block_byref_object_copy__49;
      id v14 = __Block_byref_object_dispose__49;
      id v15 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __65___UISecureController__synchronousRemoteObjectProxyWithSelector___block_invoke;
      v9[3] = &unk_1E52E68D0;
      v9[4] = &v10;
      objc_msgSend(v4, (SEL)a2, v9);
      objc_setAssociatedObject(v4, a2, (id)v11[5], (void *)1);
      id v7 = (id)v11[5];
      _Block_object_dispose(&v10, 8);
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)_updateSizeSpec:(double)a3 intrinsicContentSize:(double)a4
{
  id v9 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 24), a2);
    *(double *)(a1 + 88) = a3;
    *(double *)(a1 + 96) = a4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    [WeakRetained invalidateIntrinsicContentSize];
  }
}

- (id)currentTagForSlotView:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4FB34B8]);
  int64_t cornerStyle = self->_cornerStyle;
  double cornerRadius = self->_cornerRadius;
  baseForegroundColor = self->_baseForegroundColor;
  baseBackgroundColor = self->_baseBackgroundColor;
  p_secureControl = &self->_secureControl;
  p_unint64_t imagePlacement = &self->_imagePlacement;
  unint64_t imagePlacement = self->_imagePlacement;
  unint64_t v11 = p_imagePlacement[1];
  id WeakRetained = objc_loadWeakRetained((id *)p_secureControl);
  [WeakRetained bounds];
  v16 = objc_msgSend(v4, "initWithCategory:cornerStyle:cornerRadius:baseForegroundColor:baseBackgroundColor:imagePlacement:size:", v11, cornerStyle, baseForegroundColor, baseBackgroundColor, imagePlacement, cornerRadius, v14, v15);

  return v16;
}

- (BOOL)slotView:(id)a3 shouldSetInitialContentForStyle:(id)a4 tag:(id)a5
{
  return 0;
}

- (id)slotView:(id)a3 initialContentForStyle:(id)a4 tag:(id)a5
{
  return 0;
}

- (BOOL)slotView:(id)a3 shouldSetFinalContentForStyle:(id)a4 tag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([(_UISSecureControlSizeSpec *)self->_lastSizeSpec isEquivalentToStyle:v9 tag:v10] & 1) == 0)
  {
    unint64_t v11 = [MEMORY[0x1E4FB34B0] specWithStyle:v9 tag:v10];
    objc_initWeak(&location, self);
    uint64_t v12 = -[_UISecureController _synchronousRemoteObjectProxyWithSelector:]((uint64_t)self, sel_getSizeToolWithReply_);
    if (self->_shouldLayoutSynchronously)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke;
      v25[3] = &unk_1E52E68F8;
      objc_copyWeak(&v27, &location);
      id v26 = v11;
      [v12 getIntrinsicContentSizeForSpec:v26 reply:v25];

      objc_destroyWeak(&v27);
    }
    else
    {
      double v13 = dispatch_get_global_queue(33, 0);
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke_2;
      v21 = &unk_1E52E6948;
      id v22 = v12;
      id v23 = v11;
      objc_copyWeak(&v24, &location);
      dispatch_async(v13, &v18);

      objc_destroyWeak(&v24);
    }

    objc_destroyWeak(&location);
  }
  objc_msgSend(v10, "size", v18, v19, v20, v21);
  BOOL v16 = v15 > 0.0 && v14 > 0.0;

  return v16;
}

- (id)slotMachineForFinalContentInSlotView:(id)a3
{
  return -[_UISecureController _synchronousRemoteObjectProxyWithSelector:]((uint64_t)self, sel_getSlotMachineWithReply_);
}

- (BOOL)shouldGetFinalContentSynchronouslyInSlotView:(id)a3
{
  return self->_shouldLayoutSynchronously;
}

- (id)slotView:(id)a3 replacementForFinalContent:(id)a4 style:(id)a5 tag:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v9)
  {
    self->_enchanted = 1;
    [(_UISecureController *)self updateState];
    id v12 = v9;
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4FB3420]);
    [v11 size];
    BOOL v16 = objc_msgSend(v13, "initWithRectSize:fillColor:", objc_msgSend(v10, "tintColor"), v14, v15);
    self->_enchanted = 0;
    [(_UISecureController *)self updateState];
    id v12 = [MEMORY[0x1E4FB3478] contentWithDrawing:v16 style:v10];
  }
  return v12;
}

- (int64_t)cornerStyle
{
  return self->_cornerStyle;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGColor)baseForegroundColor
{
  return self->_baseForegroundColor;
}

- (CGColor)baseBackgroundColor
{
  return self->_baseBackgroundColor;
}

- (unint64_t)imagePlacement
{
  return self->_imagePlacement;
}

- (BOOL)shouldLayoutSynchronously
{
  return self->_shouldLayoutSynchronously;
}

- (void)setShouldLayoutSynchronously:(BOOL)a3
{
  self->_shouldLayoutSynchronously = a3;
}

- (_UISSecureControlCategory)category
{
  return self->_category;
}

- (BOOL)enchanted
{
  return self->_enchanted;
}

- (CGSize)intrinsicContentSize
{
  double width = self->_intrinsicContentSize.width;
  double height = self->_intrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_lastSizeSpec, 0);
  objc_destroyWeak((id *)&self->_slotView);
  objc_destroyWeak((id *)&self->_secureControl);
}

@end