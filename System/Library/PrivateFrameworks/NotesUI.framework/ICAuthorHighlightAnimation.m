@interface ICAuthorHighlightAnimation
- (BOOL)isAboveExistingHighlights;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemovedOnCompletion;
- (NSNumber)duration;
- (NSNumber)fromValue;
- (NSNumber)toValue;
- (UIColor)color;
- (id)description;
- (void)setAboveExistingHighlights:(BOOL)a3;
- (void)setColor:(id)a3;
- (void)setDuration:(id)a3;
- (void)setFromValue:(id)a3;
- (void)setRemovedOnCompletion:(BOOL)a3;
- (void)setToValue:(id)a3;
@end

@implementation ICAuthorHighlightAnimation

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ICAuthorHighlightAnimation *)self duration];
  v7 = [(ICAuthorHighlightAnimation *)self fromValue];
  v8 = [(ICAuthorHighlightAnimation *)self toValue];
  v9 = [(ICAuthorHighlightAnimation *)self color];
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthorHighlightAnimation isAboveExistingHighlights](self, "isAboveExistingHighlights"));
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthorHighlightAnimation isRemovedOnCompletion](self, "isRemovedOnCompletion"));
  v12 = [v3 stringWithFormat:@"<%@: %p, duration: %@, fromValue: %@, toValue: %@, color: %@, aboveExistingHighlights: %@, removedOnCompletion: %@>", v5, self, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = ICDynamicCast();

    v6 = [v5 duration];
    v7 = [(ICAuthorHighlightAnimation *)self duration];
    if (![v6 isEqual:v7])
    {
      LOBYTE(v23) = 0;
LABEL_26:

      return v23;
    }
    v8 = [v5 fromValue];
    v9 = [(ICAuthorHighlightAnimation *)self fromValue];
    if (![v8 isEqual:v9])
    {
      LOBYTE(v23) = 0;
LABEL_25:

      goto LABEL_26;
    }
    v10 = [v5 toValue];
    v11 = [(ICAuthorHighlightAnimation *)self toValue];
    if (![v10 isEqual:v11])
    {
      LOBYTE(v23) = 0;
LABEL_24:

      goto LABEL_25;
    }
    v25 = v10;
    uint64_t v12 = [(ICAuthorHighlightAnimation *)self color];
    uint64_t v13 = [v5 color];
    uint64_t v14 = *MEMORY[0x1E4F1D260];
    v27 = (void *)v12;
    if (*MEMORY[0x1E4F1D260] == v12) {
      v15 = 0;
    }
    else {
      v15 = (void *)v12;
    }
    unint64_t v16 = v15;
    v26 = (void *)v13;
    if (v14 == v13) {
      v17 = 0;
    }
    else {
      v17 = (void *)v13;
    }
    unint64_t v18 = v17;
    if (!(v16 | v18)) {
      goto LABEL_15;
    }
    v19 = (void *)v18;
    if (!v16 || !v18)
    {

      goto LABEL_22;
    }
    int v20 = [(id)v16 isEqual:v18];

    if (v20)
    {
LABEL_15:
      int v21 = [v5 isAboveExistingHighlights];
      if (v21 == [(ICAuthorHighlightAnimation *)self isAboveExistingHighlights])
      {
        int v22 = [v5 isRemovedOnCompletion];
        int v23 = v22 ^ [(ICAuthorHighlightAnimation *)self isRemovedOnCompletion] ^ 1;
LABEL_23:
        v10 = v25;

        goto LABEL_24;
      }
    }
LABEL_22:
    LOBYTE(v23) = 0;
    goto LABEL_23;
  }
  LOBYTE(v23) = 1;
  return v23;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSNumber)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(id)a3
{
}

- (NSNumber)toValue
{
  return self->_toValue;
}

- (void)setToValue:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (BOOL)isAboveExistingHighlights
{
  return self->_aboveExistingHighlights;
}

- (void)setAboveExistingHighlights:(BOOL)a3
{
  self->_aboveExistingHighlights = a3;
}

- (BOOL)isRemovedOnCompletion
{
  return self->_removedOnCompletion;
}

- (void)setRemovedOnCompletion:(BOOL)a3
{
  self->_removedOnCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_toValue, 0);
  objc_storeStrong((id *)&self->_fromValue, 0);
  objc_storeStrong((id *)&self->_duration, 0);
}

@end