@interface ICAuthorHighlightValueAttribute
- (BOOL)isEqual:(id)a3;
- (UIColor)color;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setColor:(id)a3;
- (void)setValue:(double)a3;
@end

@implementation ICAuthorHighlightValueAttribute

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSNumber;
  [(ICAuthorHighlightValueAttribute *)self value];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v8 = [(ICAuthorHighlightValueAttribute *)self color];
  v9 = [v3 stringWithFormat:@"<%@: %p, value: %@, color: %@>", v5, self, v7, v8];

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

  [v5 value];
  double v7 = v6;
  [(ICAuthorHighlightValueAttribute *)self value];
  if (v7 == v8)
  {
    v9 = [(ICAuthorHighlightValueAttribute *)self color];
    v10 = [v5 color];
    v11 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v9) {
      v12 = 0;
    }
    else {
      v12 = v9;
    }
    unint64_t v13 = v12;
    if (v11 == v10) {
      v14 = 0;
    }
    else {
      v14 = v10;
    }
    unint64_t v15 = v14;
    v16 = (void *)v15;
    if (v13 | v15)
    {
      if (v13) {
        BOOL v17 = v15 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17) {
        char v18 = 0;
      }
      else {
        char v18 = [(id)v13 isEqual:v15];
      }
    }
    else
    {
      char v18 = 1;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  v3 = NSNumber;
  [(ICAuthorHighlightValueAttribute *)self value];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v5 = [v4 hash];
  double v6 = [(ICAuthorHighlightValueAttribute *)self color];
  char v7 = [v6 hash];
  unint64_t v15 = ICHashWithHashKeys(v5, v8, v9, v10, v11, v12, v13, v14, v7);

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[ICAuthorHighlightValueAttribute allocWithZone:a3] init];
  [(ICAuthorHighlightValueAttribute *)self value];
  -[ICAuthorHighlightValueAttribute setValue:](v4, "setValue:");
  uint64_t v5 = [(ICAuthorHighlightValueAttribute *)self color];
  [(ICAuthorHighlightValueAttribute *)v4 setColor:v5];

  return v4;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end