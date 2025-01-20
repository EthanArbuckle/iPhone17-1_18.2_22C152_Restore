@interface _UISearchBarFieldEditor
- (BOOL)layoutManager:(id)a3 shouldSetLineFragmentRect:(CGRect *)a4 lineFragmentUsedRect:(CGRect *)a5 baselineOffset:(double *)a6 inTextContainer:(id)a7 forGlyphRange:(_NSRange)a8;
- (id)selectionRectsForRange:(id)a3;
- (void)_updateTokenViews;
- (void)activateEditor;
- (void)deactivateEditorDiscardingEdits:(BOOL)a3;
- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5;
- (void)layoutSubviews;
@end

@implementation _UISearchBarFieldEditor

- (void)_updateTokenViews
{
  v2 = [(UIFieldEditor *)self textField];
  id v3 = [v2 _textCanvasView];

  if (objc_opt_respondsToSelector()) {
    [v3 _updateTokenViews];
  }
}

- (id)selectionRectsForRange:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = objc_opt_new();
  v7 = [(UIFieldEditor *)self _textLayoutController];
  [v7 characterRangeForTextRange:v4];

  v8 = [(UIFieldEditor *)self textStorage];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50___UISearchBarFieldEditor_selectionRectsForRange___block_invoke;
  v15[3] = &unk_1E52DEBB8;
  v15[4] = self;
  id v16 = v4;
  id v17 = v6;
  id v9 = v5;
  id v18 = v9;
  id v10 = v6;
  id v11 = v4;
  [v8 coordinateReading:v15];

  v12 = v18;
  id v13 = v9;

  return v13;
}

- (void)layoutSubviews
{
  char flags = (char)self->_flags;
  if ((flags & 1) == 0) {
    *(unsigned char *)&self->_char flags = flags | 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)_UISearchBarFieldEditor;
  [(UIFieldEditor *)&v5 layoutSubviews];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41___UISearchBarFieldEditor_layoutSubviews__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  +[UIView performWithoutAnimation:v4];
  if ((flags & 1) == 0) {
    *(unsigned char *)&self->_flags &= ~1u;
  }
}

- (void)activateEditor
{
  v4.receiver = self;
  v4.super_class = (Class)_UISearchBarFieldEditor;
  [(UIFieldEditor *)&v4 activateEditor];
  id v3 = [(UIFieldEditor *)self textField];
  [v3 _updateAtomViewSelection:1];
}

- (void)deactivateEditorDiscardingEdits:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(UIFieldEditor *)self textField];
  [v5 _updateAtomViewSelection:0];

  v6.receiver = self;
  v6.super_class = (Class)_UISearchBarFieldEditor;
  [(UIFieldEditor *)&v6 deactivateEditorDiscardingEdits:v3];
}

- (BOOL)layoutManager:(id)a3 shouldSetLineFragmentRect:(CGRect *)a4 lineFragmentUsedRect:(CGRect *)a5 baselineOffset:(double *)a6 inTextContainer:(id)a7 forGlyphRange:(_NSRange)a8
{
  id v11 = [(UIFieldEditor *)self _textStorage];
  v12 = [v11 font];

  [v12 ascender];
  *(void *)a6 = v13;
  [v12 lineHeight];
  a5->size.height = v14;
  a4->size.height = v14;

  return 1;
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v8 = a4;
  if (v5 && (*(unsigned char *)&self->_flags & 1) == 0) {
    [(UIScrollView *)self setNeedsLayout];
  }
}

@end