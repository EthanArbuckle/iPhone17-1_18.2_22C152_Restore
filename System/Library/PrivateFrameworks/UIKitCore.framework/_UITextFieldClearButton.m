@interface _UITextFieldClearButton
+ (Class)_visualProviderClassForIdiom:(int64_t)a3;
- (BOOL)_isModernButton;
- (_UITextFieldClearButtonImageProviding)imageProvider;
- (id)_defaultImageForState:(unint64_t)a3 withConfiguration:(id)a4;
- (void)setImageProvider:(id)a3;
- (void)setPointerInteractionEnabled:(BOOL)a3;
@end

@implementation _UITextFieldClearButton

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)_isModernButton
{
  return 1;
}

- (id)_defaultImageForState:(unint64_t)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  v7 = [(_UITextFieldClearButton *)self imageProvider];

  if (v7)
  {
    v8 = [(_UITextFieldClearButton *)self imageProvider];
    v9 = [v8 defaultClearButtonImageForState:a3];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UITextFieldClearButton;
    v9 = [(UIButton *)&v11 _defaultImageForState:a3 withConfiguration:v6];
  }

  return v9;
}

- (_UITextFieldClearButtonImageProviding)imageProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageProvider);
  return (_UITextFieldClearButtonImageProviding *)WeakRetained;
}

- (void)setImageProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setPointerInteractionEnabled:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldClearButton;
  -[UIControl setPointerInteractionEnabled:](&v7, sel_setPointerInteractionEnabled_);
  uint64_t v5 = [(UIButton *)self pointerStyleProvider];
  if (a3 && v5 == 0) {
    id v6 = &__block_literal_global_403;
  }
  else {
    id v6 = (void *)v5;
  }
  [(UIButton *)self setPointerStyleProvider:v6];
}

@end