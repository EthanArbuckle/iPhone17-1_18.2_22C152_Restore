@interface CRLWPTapGestureRecognizer
- (int64_t)inputType;
- (unint64_t)tapCount;
- (void)reset;
- (void)setInputType:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation CRLWPTapGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CRLWPTapGestureRecognizer;
  id v6 = a3;
  [(CRLWPTapGestureRecognizer *)&v8 touchesBegan:v6 withEvent:a4];
  v7 = [v6 anyObject];

  self->_tapCount = (unint64_t)[v7 tapCount];
  -[CRLWPTapGestureRecognizer setInputType:](self, "setInputType:", sub_10036FEA4((BOOL)[v7 type]));
}

- (void)reset
{
  v11.receiver = self;
  v11.super_class = (Class)CRLWPTapGestureRecognizer;
  [(CRLWPTapGestureRecognizer *)&v11 reset];
  self->_tapCount = 0;
  v3 = [(CRLWPTapGestureRecognizer *)self delegate];
  v10 = sub_100246AC8(v3, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLGestureDelegate);

  [v10 didReset:self];
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (unint64_t)tapCount
{
  return self->_tapCount;
}

@end