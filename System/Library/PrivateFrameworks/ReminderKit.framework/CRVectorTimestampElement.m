@interface CRVectorTimestampElement
+ (BOOL)supportsSecureCoding;
- (CRVectorTimestampElement)initWithCoder:(id)a3;
- (int64_t)rem_compareToVectorTimestampElement:(id)a3;
- (unint64_t)clock;
- (unint64_t)subclock;
- (void)encodeWithCoder:(id)a3;
- (void)setClock:(unint64_t)a3;
- (void)setSubclock:(unint64_t)a3;
@end

@implementation CRVectorTimestampElement

- (int64_t)rem_compareToVectorTimestampElement:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CRVectorTimestampElement *)self clock];
  if (v5 < [v4 clock])
  {
LABEL_5:
    int64_t v7 = -1;
    goto LABEL_6;
  }
  unint64_t v6 = [(CRVectorTimestampElement *)self clock];
  if (v6 <= [v4 clock])
  {
    unint64_t v8 = [(CRVectorTimestampElement *)self subclock];
    if (v8 >= [v4 subclock])
    {
      unint64_t v10 = [(CRVectorTimestampElement *)self subclock];
      int64_t v7 = v10 > [v4 subclock];
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int64_t v7 = 1;
LABEL_6:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRVectorTimestampElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CRVectorTimestampElement;
  unint64_t v5 = [(CRVectorTimestampElement *)&v7 init];
  if (v5)
  {
    -[CRVectorTimestampElement setClock:](v5, "setClock:", [v4 decodeInt64ForKey:@"clock"]);
    -[CRVectorTimestampElement setSubclock:](v5, "setSubclock:", [v4 decodeInt64ForKey:@"subclock"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[CRVectorTimestampElement clock](self, "clock"), @"clock");
  objc_msgSend(v4, "encodeInt64:forKey:", -[CRVectorTimestampElement subclock](self, "subclock"), @"subclock");
}

- (unint64_t)clock
{
  return self->_clock;
}

- (void)setClock:(unint64_t)a3
{
  self->_clock = a3;
}

- (unint64_t)subclock
{
  return self->_subclock;
}

- (void)setSubclock:(unint64_t)a3
{
  self->_subclock = a3;
}

@end