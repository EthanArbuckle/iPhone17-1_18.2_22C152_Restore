@interface ACTSubstituteKeyTap
- (ACTSubstituteKeyTap)initWithIntendedKey:(id)a3 touchedKey:(id)a4 error:(id)a5 location:(CGPoint)a6 timestamp:(double)a7;
- (CGPoint)location;
- (TIPointError)error;
- (UIKBTree)intendedKey;
- (UIKBTree)touchedKey;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTSubstituteKeyTap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_touchedKey, 0);
  objc_storeStrong((id *)&self->_intendedKey, 0);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (TIPointError)error
{
  return self->_error;
}

- (UIKBTree)touchedKey
{
  return self->_touchedKey;
}

- (UIKBTree)intendedKey
{
  return self->_intendedKey;
}

- (id)shortDescription
{
  v3 = NSString;
  v4 = [(ACTSubstituteKeyTap *)self intendedKey];
  v5 = [v4 displayString];
  v6 = [v5 stringByPaddingToLength:7 withString:@" " startingAtIndex:0];
  v7 = [(ACTSubstituteKeyTap *)self touchedKey];
  v8 = [v7 displayString];
  v9 = [v8 stringByPaddingToLength:7 withString:@" " startingAtIndex:0];
  v10 = [v3 stringWithFormat:@"SubstituteKeyTap intended/touched: %@ %@", v6, v9];

  return v10;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  [(ACTSubstituteKeyTap *)self location];
  double v8 = v7;
  double v10 = v9;
  [(ACTSubstituteKeyTap *)self timestamp];
  double v12 = v11;
  v13 = [(ACTSubstituteKeyTap *)self intendedKey];
  v14 = [(ACTSubstituteKeyTap *)self touchedKey];
  v15 = [(ACTSubstituteKeyTap *)self error];
  id v16 = (id)objc_msgSend(v17, "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:", v13, v14, 0, v15, v6, v8, v10, v12);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(ACTSubstituteKeyTap *)self intendedKey];
  double v7 = [v6 representedString];
  double v8 = [(ACTSubstituteKeyTap *)self touchedKey];
  double v9 = [v8 representedString];
  double v10 = [(ACTSubstituteKeyTap *)self error];
  [(ACTSubstituteKeyTap *)self location];
  uint64_t v12 = v11;
  [(ACTSubstituteKeyTap *)self location];
  uint64_t v14 = v13;
  [(ACTSubstituteKeyTap *)self timestamp];
  id v16 = [v3 stringWithFormat:@"<%@: intended=%@, touched=%@, error=%@, loc=(%.0f,%.0f), t=%.2f>", v5, v7, v9, v10, v12, v14, v15];

  return v16;
}

- (ACTSubstituteKeyTap)initWithIntendedKey:(id)a3 touchedKey:(id)a4 error:(id)a5 location:(CGPoint)a6 timestamp:(double)a7
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ACTSubstituteKeyTap;
  id v17 = [(ACTSubstituteKeyTap *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_intendedKey, a3);
    objc_storeStrong((id *)&v18->_touchedKey, a4);
    objc_storeStrong((id *)&v18->_error, a5);
    v18->_location.CGFloat x = x;
    v18->_location.CGFloat y = y;
    v18->_timestamp = a7;
  }

  return v18;
}

@end