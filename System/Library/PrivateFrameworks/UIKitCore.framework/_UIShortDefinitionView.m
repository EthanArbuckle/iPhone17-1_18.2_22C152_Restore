@interface _UIShortDefinitionView
- (_UIDefinitionValue)definitionValue;
- (_UIShortDefinitionView)initWithFrame:(CGRect)a3;
- (void)setDefinitionValue:(id)a3;
@end

@implementation _UIShortDefinitionView

- (_UIShortDefinitionView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_UIShortDefinitionView;
  v3 = -[UIView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setClipsToBounds:1];
    [(UIView *)v4 setAutoresizingMask:18];
    [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(UIView *)v4 setUserInteractionEnabled:0];
    v5 = [UITextView alloc];
    uint64_t v6 = -[UITextView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    definitionTextView = v4->_definitionTextView;
    v4->_definitionTextView = (UITextView *)v6;

    [(UIView *)v4->_definitionTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(UITextView *)v4->_definitionTextView textContainer];
    [v8 setLineBreakMode:4];

    [(UIView *)v4 addSubview:v4->_definitionTextView];
    [(UITextView *)v4->_definitionTextView setScrollEnabled:0];
    [(UITextView *)v4->_definitionTextView setEditable:0];
    [(UITextView *)v4->_definitionTextView setMarginTop:0];
    [(UITextView *)v4->_definitionTextView _setInteractiveTextSelectionDisabled:1];
    v9 = v4->_definitionTextView;
    v10 = +[UIColor clearColor];
    [(UIView *)v9 setBackgroundColor:v10];

    v11 = [(UITextView *)v4->_definitionTextView textContainer];
    [v11 setLineFragmentPadding:0.0];

    v12 = _NSDictionaryOfVariableBindings(&cfstr_Definitiontext.isa, v4->_definitionTextView, 0);
    v13 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|-(15)-[_definitionTextView]-(15)-|" options:0 metrics:0 views:v12];
    v14 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|-[_definitionTextView]-|" options:0 metrics:0 views:v12];
    [(UIView *)v4 addConstraints:v13];
    [(UIView *)v4 addConstraints:v14];
  }
  return v4;
}

- (void)setDefinitionValue:(id)a3
{
  v5 = (_UIDefinitionValue *)a3;
  if (self->_definitionValue != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_definitionValue, a3);
    uint64_t v6 = [(_UIDefinitionValue *)self->_definitionValue definition];
    v7 = (void *)[v6 mutableCopy];

    uint64_t v8 = [v7 length];
    v9 = +[UIReferenceLibraryViewController _colorAttributes];
    objc_msgSend(v7, "addAttributes:range:", v9, 0, v8);

    objc_msgSend(v7, "removeAttribute:range:", *(void *)off_1E52D2110, 0, v8);
    [(UITextView *)self->_definitionTextView setAttributedText:v7];

    v5 = v10;
  }
}

- (_UIDefinitionValue)definitionValue
{
  return self->_definitionValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionTextView, 0);
  objc_storeStrong((id *)&self->_definitionValue, 0);
}

@end