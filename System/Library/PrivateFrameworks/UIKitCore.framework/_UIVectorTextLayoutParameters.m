@interface _UIVectorTextLayoutParameters
+ (id)parametersSuitableForView:(id)a3;
- (BOOL)isEqualToParameters:(id)a3;
- (CGSize)withinSize;
- (NSAttributedString)attributedText;
- (UITraitCollection)traitCollection;
- (_UIVectorTextLayoutParameters)initWithParameters:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)lineBreakMode;
- (unint64_t)numberOfLines;
- (void)_copyFromParameters:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setNumberOfLines:(unint64_t)a3;
- (void)setTraitCollection:(id)a3;
- (void)setWithinSize:(CGSize)a3;
@end

@implementation _UIVectorTextLayoutParameters

+ (id)parametersSuitableForView:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 traitCollection];
  [v4 setTraitCollection:v5];

  [v3 bounds];
  double v7 = v6;
  double v9 = v8;

  objc_msgSend(v4, "setWithinSize:", v7, v9);
  return v4;
}

- (_UIVectorTextLayoutParameters)initWithParameters:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIVectorTextLayoutParameters;
  v5 = [(_UIVectorTextLayoutParameters *)&v8 init];
  double v6 = v5;
  if (v5) {
    [(_UIVectorTextLayoutParameters *)v5 _copyFromParameters:v4];
  }

  return v6;
}

- (void)_copyFromParameters:(id)a3
{
  id v4 = a3;
  v5 = [v4 attributedText];
  [(_UIVectorTextLayoutParameters *)self setAttributedText:v5];

  -[_UIVectorTextLayoutParameters setNumberOfLines:](self, "setNumberOfLines:", [v4 numberOfLines]);
  [v4 withinSize];
  -[_UIVectorTextLayoutParameters setWithinSize:](self, "setWithinSize:");
  double v6 = [v4 traitCollection];
  [(_UIVectorTextLayoutParameters *)self setTraitCollection:v6];

  uint64_t v7 = [v4 lineBreakMode];
  [(_UIVectorTextLayoutParameters *)self setLineBreakMode:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithParameters:self];
}

- (BOOL)isEqualToParameters:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  unint64_t v5 = [(_UIVectorTextLayoutParameters *)self numberOfLines];
  if (v5 != [v4 numberOfLines]) {
    goto LABEL_7;
  }
  int64_t v6 = [(_UIVectorTextLayoutParameters *)self lineBreakMode];
  if (v6 == [v4 lineBreakMode]
    && ([(_UIVectorTextLayoutParameters *)self withinSize],
        double v8 = v7,
        [v4 withinSize],
        v8 == v9)
    && ([(_UIVectorTextLayoutParameters *)self withinSize],
        double v11 = v10,
        [v4 withinSize],
        v11 == v12))
  {
    v13 = [(_UIVectorTextLayoutParameters *)self attributedText];
    v14 = [v4 attributedText];
    char v15 = [v13 isEqualToAttributedString:v14];
  }
  else
  {
LABEL_7:
    char v15 = 0;
  }

  return v15;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
}

- (CGSize)withinSize
{
  double width = self->_withinSize.width;
  double height = self->_withinSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWithinSize:(CGSize)a3
{
  self->_withinSize = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end