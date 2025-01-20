@interface _UISearchTextFieldCanvasView
- (double)_uiatom_currentScreenScale;
- (void)_updateTokenViews;
- (void)layoutSubviews;
@end

@implementation _UISearchTextFieldCanvasView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UISearchTextFieldCanvasView;
  [(_UITextCanvasView *)&v3 layoutSubviews];
  [(_UISearchTextFieldCanvasView *)self _updateTokenViews];
}

- (double)_uiatom_currentScreenScale
{
  v2 = [(UIView *)self window];
  objc_super v3 = [v2 screen];

  if (!v3)
  {
    objc_super v3 = +[UIScreen mainScreen];
  }
  [v3 scale];
  double v5 = v4;

  return v5;
}

- (void)_updateTokenViews
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  atomViews = self->_atomViews;
  if (atomViews)
  {
    double v4 = (void *)[(NSMutableSet *)atomViews mutableCopy];
    [(NSMutableSet *)self->_atomViews removeAllObjects];
  }
  else
  {
    double v5 = (NSMutableSet *)objc_opt_new();
    v6 = self->_atomViews;
    self->_atomViews = v5;

    double v4 = objc_opt_new();
  }
  v7 = [(_UITextCanvasView *)self context];
  [v7 textContainerOrigin];
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  [(_UISearchTextFieldCanvasView *)self _uiatom_currentScreenScale];
  uint64_t v13 = v12;
  v14 = [(_UITextCanvasView *)self context];
  v15 = [v14 layoutManager];

  v16 = [(_UITextCanvasView *)self context];
  v17 = [v16 textContainer];

  v18 = [v15 textStorage];
  uint64_t v19 = [v18 length];
  uint64_t v20 = *(void *)off_1E52D1F50;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __49___UISearchTextFieldCanvasView__updateTokenViews__block_invoke;
  v33[3] = &unk_1E530AF60;
  id v21 = v15;
  id v34 = v21;
  id v22 = v17;
  id v35 = v22;
  id v23 = v4;
  id v36 = v23;
  v37 = self;
  uint64_t v38 = v13;
  uint64_t v39 = v9;
  uint64_t v40 = v11;
  objc_msgSend(v18, "enumerateAttribute:inRange:options:usingBlock:", v20, 0, v19, 0, v33);
  if ([v23 count])
  {
    [(NSMutableSet *)self->_atomViews minusSet:v23];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v24 = v23;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v30;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(v24);
          }
          objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v28++), "removeFromSuperview", (void)v29);
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v26);
    }
  }
}

- (void).cxx_destruct
{
}

@end