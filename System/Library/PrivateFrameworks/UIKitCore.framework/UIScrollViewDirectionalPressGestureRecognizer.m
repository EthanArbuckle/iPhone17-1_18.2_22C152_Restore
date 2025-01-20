@interface UIScrollViewDirectionalPressGestureRecognizer
- (BOOL)_shouldReceivePress:(id)a3;
- (UIScrollView)scrollView;
- (UIScrollViewDirectionalPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (int64_t)activePressType;
- (void)_addToViewIfAllowed:(id)a3;
- (void)_resetToOriginalViewIfAllowed;
- (void)_setEnabledIfAllowed:(BOOL)a3;
- (void)reset;
- (void)setAllowedPressTypes:(id)a3;
- (void)setAllowedTouchTypes:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setScrollView:(id)a3;
@end

@implementation UIScrollViewDirectionalPressGestureRecognizer

- (UIScrollViewDirectionalPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIScrollViewDirectionalPressGestureRecognizer;
  v4 = [(_UIRepeatingPressGestureRecognizer *)&v9 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_activePressType = -1;
    v8.receiver = v4;
    v8.super_class = (Class)UIScrollViewDirectionalPressGestureRecognizer;
    [(UIGestureRecognizer *)&v8 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    v7.receiver = v5;
    v7.super_class = (Class)UIScrollViewDirectionalPressGestureRecognizer;
    [(UIGestureRecognizer *)&v7 setAllowedPressTypes:&unk_1ED3F1870];
  }
  return v5;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  unint64_t v4 = [a3 type];
  v5 = [(UIGestureRecognizer *)self allowedPressTypes];
  v6 = [NSNumber numberWithInteger:v4];
  int v7 = [v5 containsObject:v6];

  if (!v7) {
    return 0;
  }
  objc_super v8 = [(UIScrollViewDirectionalPressGestureRecognizer *)self scrollView];
  int v9 = [v8 _canScrollX];
  if ((([v8 _canScrollY] & 1) != 0 || v4 >= 2)
    && ((v4 & 0xFFFFFFFFFFFFFFFELL) != 2 ? (int v10 = 1) : (int v10 = v9),
        v10 == 1
     && ((int64_t activePressType = self->_activePressType, activePressType != -1) ? (v12 = activePressType == v4) : (v12 = 1),
         v12)))
  {
    self->_int64_t activePressType = v4;
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)reset
{
  self->_int64_t activePressType = -1;
}

- (void)setEnabled:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIScrollViewDirectionalPressGestureRecognizer;
  [(UIGestureRecognizer *)&v6 setEnabled:a3];
  self->_hasBeenModified = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalView);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_originalView);
    [v5 addGestureRecognizer:self];

    objc_storeWeak((id *)&self->_originalView, 0);
  }
}

- (void)_setEnabledIfAllowed:(BOOL)a3
{
  if (!self->_hasBeenModified)
  {
    v3.receiver = self;
    v3.super_class = (Class)UIScrollViewDirectionalPressGestureRecognizer;
    [(UIGestureRecognizer *)&v3 setEnabled:a3];
  }
}

- (void)_addToViewIfAllowed:(id)a3
{
  id v4 = a3;
  if (!self->_hasBeenModified)
  {
    id v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_originalView);

    if (!WeakRetained)
    {
      objc_super v6 = [(UIGestureRecognizer *)self view];
      objc_storeWeak((id *)&self->_originalView, v6);
    }
    [v7 addGestureRecognizer:self];
    id v4 = v7;
  }
}

- (void)_resetToOriginalViewIfAllowed
{
  if (!self->_hasBeenModified)
  {
    objc_super v3 = [(UIGestureRecognizer *)self view];
    [v3 removeGestureRecognizer:self];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_originalView);
    [WeakRetained addGestureRecognizer:self];
  }
}

- (void)setAllowedPressTypes:(id)a3
{
}

- (void)setAllowedTouchTypes:(id)a3
{
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (int64_t)activePressType
{
  return self->_activePressType;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_originalView);
}

@end