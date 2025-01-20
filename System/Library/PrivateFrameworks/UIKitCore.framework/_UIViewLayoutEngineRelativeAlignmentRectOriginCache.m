@interface _UIViewLayoutEngineRelativeAlignmentRectOriginCache
- (BOOL)isValid;
- (CGPoint)origin;
- (NSISEngine)cacheEngine;
- (UIView)delegate;
- (_UIViewLayoutEngineRelativeAlignmentRectOriginCache)initWithDelegate:(id)a3;
- (unint64_t)variableChangeCount;
- (void)setCacheEngine:(id)a3;
- (void)setVariableChangeCount:(unint64_t)a3;
@end

@implementation _UIViewLayoutEngineRelativeAlignmentRectOriginCache

- (CGPoint)origin
{
  BOOL v3 = [(_UIViewLayoutEngineRelativeAlignmentRectOriginCache *)self isValid];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (v3)
  {
    int v6 = [WeakRetained _canBecomeLayoutEngineDelegate];
    p_cachedOrigin = &self->_cachedOrigin;
    p_y = &self->_cachedOrigin.y;
    if (v6)
    {
      p_y = (CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
      p_cachedOrigin = (CGPoint *)MEMORY[0x1E4F1DAD8];
    }
    double x = p_cachedOrigin->x;
    double v10 = *p_y;
    goto LABEL_11;
  }
  v11 = [WeakRetained _layoutEngine];

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = [v12 _layoutEngine];

    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = [v13 superview];

    v15 = [v14 _layoutEngine];

    if (v15 == v5)
    {
      v18 = -[UIView _alignmentRectOriginCacheCreateIfNecessary:](v14, 1);
      [v18 origin];
      double v16 = v19;
      double v17 = v20;
    }
    else
    {
      double v16 = *MEMORY[0x1E4F1DAD8];
      double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    v22 = objc_msgSend(v21, "nsli_minXVariable");
    [v5 valueForVariable:v22];
    double x = v16 + round(v23);

    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
    v25 = objc_msgSend(v24, "nsli_minYVariable");
    [v5 valueForVariable:v25];
    double v10 = v17 + round(v26);

    self->_cachedOrigin.double x = x;
    self->_cachedOrigin.y = v10;
    [(_UIViewLayoutEngineRelativeAlignmentRectOriginCache *)self setCacheEngine:v5];
    self->_variableChangeCount = [v5 variableChangeCount];

LABEL_11:
    goto LABEL_12;
  }
  double x = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
LABEL_12:
  double v27 = x;
  double v28 = v10;
  result.y = v28;
  result.double x = v27;
  return result;
}

- (BOOL)isValid
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained _layoutEngine];

  id v6 = objc_loadWeakRetained((id *)p_delegate);
  if ([v6 _canBecomeLayoutEngineDelegate])
  {
    BOOL v7 = 1;
  }
  else if (v5)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_cacheEngine);
    if (v5 == v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_cacheEngine);
      uint64_t v10 = [v9 variableChangeCount];
      BOOL v7 = v10 == [(_UIViewLayoutEngineRelativeAlignmentRectOriginCache *)self variableChangeCount];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)variableChangeCount
{
  return self->_variableChangeCount;
}

- (void)setCacheEngine:(id)a3
{
}

- (_UIViewLayoutEngineRelativeAlignmentRectOriginCache)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIViewLayoutEngineRelativeAlignmentRectOriginCache;
  id v5 = [(_UIViewLayoutEngineRelativeAlignmentRectOriginCache *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cacheEngine);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UIView)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIView *)WeakRetained;
}

- (NSISEngine)cacheEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cacheEngine);
  return (NSISEngine *)WeakRetained;
}

- (void)setVariableChangeCount:(unint64_t)a3
{
  self->_variableChangeCount = a3;
}

@end