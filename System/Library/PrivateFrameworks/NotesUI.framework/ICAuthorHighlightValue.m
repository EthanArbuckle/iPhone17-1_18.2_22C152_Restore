@interface ICAuthorHighlightValue
- (BOOL)isAboveImplicitHighlights;
- (BOOL)isEqual:(id)a3;
- (NSNumber)value;
- (UIColor)color;
- (id)description;
- (void)setAboveImplicitHighlights:(BOOL)a3;
- (void)setColor:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation ICAuthorHighlightValue

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ICAuthorHighlightValue *)self value];
  v7 = [(ICAuthorHighlightValue *)self color];
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthorHighlightValue isAboveImplicitHighlights](self, "isAboveImplicitHighlights"));
  v9 = [v3 stringWithFormat:@"<%@: %p, value: %@, color: %@, aboveImplicitHighlights: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = ICDynamicCast();

    v6 = [v5 value];
    v7 = [(ICAuthorHighlightValue *)self value];
    if (![v6 isEqual:v7])
    {
      LOBYTE(v17) = 0;
LABEL_22:

      return v17;
    }
    v8 = [(ICAuthorHighlightValue *)self color];
    v9 = [v5 color];
    v10 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v8) {
      v11 = 0;
    }
    else {
      v11 = v8;
    }
    unint64_t v12 = v11;
    if (v10 == v9) {
      v13 = 0;
    }
    else {
      v13 = v9;
    }
    unint64_t v14 = v13;
    if (!(v12 | v14)) {
      goto LABEL_19;
    }
    v15 = (void *)v14;
    if (v12) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
    }
    else
    {
      int v18 = [(id)v12 isEqual:v14];

      if (v18)
      {
LABEL_19:
        int v19 = [v5 isAboveImplicitHighlights];
        int v17 = v19 ^ [(ICAuthorHighlightValue *)self isAboveImplicitHighlights] ^ 1;
LABEL_21:

        goto LABEL_22;
      }
    }
    LOBYTE(v17) = 0;
    goto LABEL_21;
  }
  LOBYTE(v17) = 1;
  return v17;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (BOOL)isAboveImplicitHighlights
{
  return self->_aboveImplicitHighlights;
}

- (void)setAboveImplicitHighlights:(BOOL)a3
{
  self->_aboveImplicitHighlights = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end