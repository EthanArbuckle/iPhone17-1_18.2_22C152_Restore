@interface ICCheckmarkAuthorHighlightValueAttribute
- (BOOL)isEqual:(id)a3;
- (ICCheckmarkAuthorHighlightValueAttribute)init;
- (UIColor)highlightColor;
- (double)foregroundAlpha;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setForegroundAlpha:(double)a3;
- (void)setHighlightColor:(id)a3;
@end

@implementation ICCheckmarkAuthorHighlightValueAttribute

- (ICCheckmarkAuthorHighlightValueAttribute)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICCheckmarkAuthorHighlightValueAttribute;
  result = [(ICCheckmarkAuthorHighlightValueAttribute *)&v3 init];
  if (result) {
    result->_foregroundAlpha = 1.0;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSNumber;
  [(ICCheckmarkAuthorHighlightValueAttribute *)self foregroundAlpha];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v8 = [(ICCheckmarkAuthorHighlightValueAttribute *)self highlightColor];
  v9 = [v3 stringWithFormat:@"<%@: %p, foregroundAlpha: %@, highlightColor: %@>", v5, self, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();

  [v5 foregroundAlpha];
  double v7 = v6;
  [(ICCheckmarkAuthorHighlightValueAttribute *)self foregroundAlpha];
  if (v7 == v8)
  {
    v9 = [v5 highlightColor];
    v10 = [(ICCheckmarkAuthorHighlightValueAttribute *)self highlightColor];
    char v11 = [v9 isEqual:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  objc_super v3 = NSNumber;
  [(ICCheckmarkAuthorHighlightValueAttribute *)self foregroundAlpha];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v5 = [v4 hash];
  double v6 = [(ICCheckmarkAuthorHighlightValueAttribute *)self highlightColor];
  char v7 = [v6 hash];
  unint64_t v15 = ICHashWithHashKeys(v5, v8, v9, v10, v11, v12, v13, v14, v7);

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[ICCheckmarkAuthorHighlightValueAttribute allocWithZone:a3] init];
  [(ICCheckmarkAuthorHighlightValueAttribute *)self foregroundAlpha];
  -[ICCheckmarkAuthorHighlightValueAttribute setForegroundAlpha:](v4, "setForegroundAlpha:");
  uint64_t v5 = [(ICCheckmarkAuthorHighlightValueAttribute *)self highlightColor];
  [(ICCheckmarkAuthorHighlightValueAttribute *)v4 setHighlightColor:v5];

  return v4;
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (void)setForegroundAlpha:(double)a3
{
  self->_foregroundAlpha = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end