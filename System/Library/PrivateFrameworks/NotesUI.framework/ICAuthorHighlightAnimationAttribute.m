@interface ICAuthorHighlightAnimationAttribute
- (BOOL)isAboveExistingHighlights;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemovedOnCompletion;
- (ICAuthorHighlightAnimationAttribute)initWithStartDate:(id)a3;
- (NSDate)startDate;
- (UIColor)color;
- (double)duration;
- (double)fromValue;
- (double)toValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setAboveExistingHighlights:(BOOL)a3;
- (void)setColor:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFromValue:(double)a3;
- (void)setRemovedOnCompletion:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setToValue:(double)a3;
@end

@implementation ICAuthorHighlightAnimationAttribute

- (ICAuthorHighlightAnimationAttribute)initWithStartDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICAuthorHighlightAnimationAttribute;
  v6 = [(ICAuthorHighlightAnimationAttribute *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_startDate, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(ICAuthorHighlightAnimationAttribute *)self startDate];
  v7 = NSNumber;
  [(ICAuthorHighlightAnimationAttribute *)self duration];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  objc_super v9 = NSNumber;
  [(ICAuthorHighlightAnimationAttribute *)self fromValue];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v11 = NSNumber;
  [(ICAuthorHighlightAnimationAttribute *)self toValue];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  v13 = [(ICAuthorHighlightAnimationAttribute *)self color];
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthorHighlightAnimationAttribute isAboveExistingHighlights](self, "isAboveExistingHighlights"));
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthorHighlightAnimationAttribute isRemovedOnCompletion](self, "isRemovedOnCompletion"));
  v16 = [v3 stringWithFormat:@"<%@: %p, startDate: %@, duration: %@, fromValue: %@, toValue: %@, color: %@, aboveExistingHighlights: %@, removedOnCompletion: %@>", v5, self, v6, v8, v10, v12, v13, v14, v15];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v28) = 1;
    return v28;
  }
  id v4 = a3;
  objc_opt_class();
  id v5 = ICDynamicCast();

  v6 = [v5 startDate];
  v7 = [(ICAuthorHighlightAnimationAttribute *)self startDate];
  if ([v6 isEqual:v7])
  {
    [v5 duration];
    double v9 = v8;
    [(ICAuthorHighlightAnimationAttribute *)self duration];
    if (v9 == v10)
    {
      [v5 fromValue];
      double v12 = v11;
      [(ICAuthorHighlightAnimationAttribute *)self fromValue];
      if (v12 == v13)
      {
        [v5 toValue];
        double v15 = v14;
        [(ICAuthorHighlightAnimationAttribute *)self toValue];
        if (v15 == v16)
        {
          v17 = [(ICAuthorHighlightAnimationAttribute *)self color];
          v18 = [v5 color];
          v19 = (void *)*MEMORY[0x1E4F1D260];
          if ((void *)*MEMORY[0x1E4F1D260] == v17) {
            v20 = 0;
          }
          else {
            v20 = v17;
          }
          unint64_t v21 = v20;
          if (v19 == v18) {
            v22 = 0;
          }
          else {
            v22 = v18;
          }
          unint64_t v23 = v22;
          if (!(v21 | v23)) {
            goto LABEL_16;
          }
          v24 = (void *)v23;
          if (!v21 || !v23)
          {

            goto LABEL_23;
          }
          int v25 = [(id)v21 isEqual:v23];

          if (v25)
          {
LABEL_16:
            int v26 = [v5 isAboveExistingHighlights];
            if (v26 == [(ICAuthorHighlightAnimationAttribute *)self isAboveExistingHighlights])
            {
              int v27 = [v5 isRemovedOnCompletion];
              int v28 = v27 ^ [(ICAuthorHighlightAnimationAttribute *)self isRemovedOnCompletion] ^ 1;
LABEL_24:

              goto LABEL_19;
            }
          }
LABEL_23:
          LOBYTE(v28) = 0;
          goto LABEL_24;
        }
      }
    }
  }
  LOBYTE(v28) = 0;
LABEL_19:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v23 = [(ICAuthorHighlightAnimationAttribute *)self startDate];
  uint64_t v21 = [v23 hash];
  v3 = NSNumber;
  [(ICAuthorHighlightAnimationAttribute *)self duration];
  v22 = objc_msgSend(v3, "numberWithDouble:");
  char v20 = [v22 hash];
  id v4 = NSNumber;
  [(ICAuthorHighlightAnimationAttribute *)self fromValue];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  [v5 hash];
  v6 = NSNumber;
  [(ICAuthorHighlightAnimationAttribute *)self toValue];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  [v7 hash];
  double v8 = [(ICAuthorHighlightAnimationAttribute *)self color];
  [v8 hash];
  double v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthorHighlightAnimationAttribute isAboveExistingHighlights](self, "isAboveExistingHighlights"));
  [v9 hash];
  double v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ICAuthorHighlightAnimationAttribute isRemovedOnCompletion](self, "isRemovedOnCompletion"));
  [v10 hash];
  unint64_t v18 = ICHashWithHashKeys(v21, v11, v12, v13, v14, v15, v16, v17, v20);

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[ICAuthorHighlightAnimationAttribute allocWithZone:a3] init];
  id v5 = [(ICAuthorHighlightAnimationAttribute *)self startDate];
  [(ICAuthorHighlightAnimationAttribute *)v4 setStartDate:v5];

  [(ICAuthorHighlightAnimationAttribute *)self duration];
  -[ICAuthorHighlightAnimationAttribute setDuration:](v4, "setDuration:");
  [(ICAuthorHighlightAnimationAttribute *)self fromValue];
  -[ICAuthorHighlightAnimationAttribute setFromValue:](v4, "setFromValue:");
  [(ICAuthorHighlightAnimationAttribute *)self toValue];
  -[ICAuthorHighlightAnimationAttribute setToValue:](v4, "setToValue:");
  v6 = [(ICAuthorHighlightAnimationAttribute *)self color];
  [(ICAuthorHighlightAnimationAttribute *)v4 setColor:v6];

  [(ICAuthorHighlightAnimationAttribute *)v4 setAboveExistingHighlights:[(ICAuthorHighlightAnimationAttribute *)self isAboveExistingHighlights]];
  [(ICAuthorHighlightAnimationAttribute *)v4 setRemovedOnCompletion:[(ICAuthorHighlightAnimationAttribute *)self isRemovedOnCompletion]];
  return v4;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(double)a3
{
  self->_fromValue = a3;
}

- (double)toValue
{
  return self->_toValue;
}

- (void)setToValue:(double)a3
{
  self->_toValue = a3;
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
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end