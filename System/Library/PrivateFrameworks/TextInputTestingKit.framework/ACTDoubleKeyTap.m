@interface ACTDoubleKeyTap
- (ACTDoubleKeyTap)initWithFirstTap:(id)a3 secondTap:(id)a4;
- (ACTUserAction)firstTap;
- (ACTUserAction)secondTap;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTDoubleKeyTap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondTap, 0);

  objc_storeStrong((id *)&self->_firstTap, 0);
}

- (ACTUserAction)secondTap
{
  return self->_secondTap;
}

- (ACTUserAction)firstTap
{
  return self->_firstTap;
}

- (id)shortDescription
{
  v2 = NSString;
  v3 = [(ACTUserAction *)self twoKeyTapShortDescription];
  v4 = [v2 stringWithFormat:@"DoubleTap first/second: %@", v3];

  return v4;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ACTDoubleKeyTap *)self firstTap];
  [v8 applyWithTyper:v7 log:v6];

  id v9 = [(ACTDoubleKeyTap *)self secondTap];
  [v9 applyWithTyper:v7 log:v6];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(ACTDoubleKeyTap *)self firstTap];
  id v7 = [(ACTDoubleKeyTap *)self secondTap];
  v8 = [v3 stringWithFormat:@"<%@: firstTap=%@, secondTap=%@>", v5, v6, v7];

  return v8;
}

- (ACTDoubleKeyTap)initWithFirstTap:(id)a3 secondTap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACTDoubleKeyTap;
  id v9 = [(ACTDoubleKeyTap *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_firstTap, a3);
    objc_storeStrong((id *)&v10->_secondTap, a4);
  }

  return v10;
}

@end