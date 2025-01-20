@interface _UITAMICAdaptorView
+ (BOOL)shouldWrapView:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIView)view;
- (_UITAMICAdaptorView)initWithView:(id)a3;
- (_UITAMICAdaptorViewDelegate)delegate;
- (float)sizingPriority;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_updateTraitsAndLayoutSizeIfNecessary;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setSizingPriority:(float)a3;
- (void)updateForAvailableSize;
@end

@implementation _UITAMICAdaptorView

- (void)layoutSubviews
{
  BOOL v3 = +[UIView areAnimationsEnabled];
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    +[UIView setAnimationsEnabled:0];
  }
  self->_inLayout = 1;
  v4.receiver = self;
  v4.super_class = (Class)_UITAMICAdaptorView;
  [(UIView *)&v4 layoutSubviews];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_view, "setFrame:");
  self->_inLayout = 0;
  +[UIView setAnimationsEnabled:v3];
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  v5 = (UIView *)a4;
  if (self->_view == v5 && !self->_inLayout)
  {
    v6 = v5;
    [(_UITAMICAdaptorView *)self updateForAvailableSize];
    v5 = v6;
  }
}

+ (BOOL)shouldWrapView:(id)a3
{
  id v3 = a3;
  if ([v3 _hasLayoutArrangements])
  {
    BOOL v4 = 0;
  }
  else
  {
    if (UIApp)
    {
      char v5 = 0;
    }
    else
    {
      double v6 = *MEMORY[0x1E4F1DB30];
      double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], v7);
      double v9 = v8;
      double v11 = v10;
      int v12 = [v3 _wantsAutolayout];
      BOOL v13 = v11 == v7 && v9 == v6;
      if (v12) {
        char v5 = v13;
      }
      else {
        char v5 = 0;
      }
    }
    v14 = [v3 _constraintsExceptingSubviewAutoresizingConstraints];
    uint64_t v15 = [v14 count];

    int v16 = [v3 translatesAutoresizingMaskIntoConstraints];
    if (v15) {
      char v17 = v5;
    }
    else {
      char v17 = 1;
    }
    if (v16) {
      BOOL v4 = v17;
    }
    else {
      BOOL v4 = 0;
    }
  }

  return v4;
}

- (UIView)view
{
  return self->_view;
}

- (_UITAMICAdaptorView)initWithView:(id)a3
{
  id v6 = a3;
  if (([v6 translatesAutoresizingMaskIntoConstraints] & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_UITAMICAdaptorView.m", 50, @"_UITAMICAdaptorView only works with views that have .translatesAutoresizingMaskIntoConstraints=YES (%@)", v6 object file lineNumber description];
  }
  [v6 frame];
  v20.receiver = self;
  v20.super_class = (Class)_UITAMICAdaptorView;
  double v7 = -[UIView initWithFrame:](&v20, sel_initWithFrame_);
  double v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_view, a3);
    [(UIView *)v8 addSubview:v8->_view];
    [(UIView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v8 setAutoresizesSubviews:0];
    v8->_float sizingPriority = 900.0;
    double v9 = [(UIView *)v8 widthAnchor];
    uint64_t v10 = [v9 constraintEqualToConstant:0.0];
    width = v8->_width;
    v8->_width = (NSLayoutConstraint *)v10;

    float sizingPriority = v8->_sizingPriority;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 contentCompressionResistancePriorityForAxis:0];
      *(float *)&double v13 = fmaxf(*(float *)&v13, 51.0);
      if (*(float *)&v13 <= 999.0) {
        float sizingPriority = *(float *)&v13;
      }
      else {
        float sizingPriority = 999.0;
      }
    }
    *(float *)&double v13 = sizingPriority;
    [(NSLayoutConstraint *)v8->_width setPriority:v13];
    [(NSLayoutConstraint *)v8->_width setActive:1];
    v14 = [(UIView *)v8 heightAnchor];
    uint64_t v15 = [v14 constraintEqualToConstant:0.0];
    height = v8->_height;
    v8->_height = (NSLayoutConstraint *)v15;

    *(float *)&double v17 = v8->_sizingPriority;
    [(NSLayoutConstraint *)v8->_height setPriority:v17];
    [(NSLayoutConstraint *)v8->_height setActive:1];
  }

  return v8;
}

- (void)setSizingPriority:(float)a3
{
  if (self->_sizingPriority != a3)
  {
    self->_float sizingPriority = a3;
    -[NSLayoutConstraint setPriority:](self->_width, "setPriority:");
    *(float *)&double v4 = self->_sizingPriority;
    height = self->_height;
    [(NSLayoutConstraint *)height setPriority:v4];
  }
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  [(_UITAMICAdaptorView *)self _updateTraitsAndLayoutSizeIfNecessary];
  v14.receiver = self;
  v14.super_class = (Class)_UITAMICAdaptorView;
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)_updateTraitsAndLayoutSizeIfNecessary
{
  if ((*((void *)&self->super._viewFlags + 1) & 0x800000000000) != 0)
  {
    id v3 = [(UIView *)self _window];

    if (v3)
    {
      [(UIView *)self updateTraitsIfNeeded];
      [(_UITAMICAdaptorView *)self updateForAvailableSize];
    }
  }
}

- (void)didMoveToWindow
{
  id v3 = [(UIView *)self window];
  if (v3)
  {
    [(_UITAMICAdaptorView *)self updateForAvailableSize];
    -[UIView _addGeometryChangeObserver:](&self->_view->super.super.isa, self);
  }
  else
  {
    -[UIView _removeGeometryChangeObserver:](&self->_view->super.super.isa, self);
  }
}

- (void)updateForAvailableSize
{
  self->_inLayout = 1;
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v19 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "availableSizeForAdaptor:proposedSize:", self, v4, v6);
    double v4 = v8;
    double v6 = v9;
  }
  -[UIView systemLayoutSizeFittingSize:](self->_view, "systemLayoutSizeFittingSize:", v4, v6);
  double v11 = v10;
  double v13 = v12;
  [(UIView *)self->_view frame];
  if (v14 >= v11) {
    double v16 = v14;
  }
  else {
    double v16 = v11;
  }
  if (v15 >= v13) {
    double v17 = v15;
  }
  else {
    double v17 = v13;
  }
  if (v16 != self->_layoutSize.width || v17 != self->_layoutSize.height)
  {
    self->_layoutSize.double width = v16;
    self->_layoutSize.double height = v17;
    -[NSLayoutConstraint setConstant:](self->_width, "setConstant:");
    [(NSLayoutConstraint *)self->_height setConstant:self->_layoutSize.height];
  }
  self->_inLayout = 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(_UITAMICAdaptorView *)self _updateTraitsAndLayoutSizeIfNecessary];
  double width = self->_layoutSize.width;
  double height = self->_layoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (float)sizingPriority
{
  return self->_sizingPriority;
}

- (_UITAMICAdaptorViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITAMICAdaptorViewDelegate *)WeakRetained;
}

@end