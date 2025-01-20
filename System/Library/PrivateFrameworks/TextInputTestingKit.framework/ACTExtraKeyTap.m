@interface ACTExtraKeyTap
- (ACTExtraKeyTap)initWithTouchedKey:(id)a3 location:(CGPoint)a4 timestamp:(double)a5;
- (CGPoint)location;
- (UIKBTree)touchedKey;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTExtraKeyTap

- (void).cxx_destruct
{
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

- (UIKBTree)touchedKey
{
  return self->_touchedKey;
}

- (id)shortDescription
{
  v2 = NSString;
  v3 = [(ACTExtraKeyTap *)self touchedKey];
  v4 = [v3 displayString];
  v5 = [v2 stringWithFormat:@"ExtraKey touched: %@", v4];

  return v5;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  [(ACTExtraKeyTap *)self location];
  double v8 = v7;
  double v10 = v9;
  [(ACTExtraKeyTap *)self timestamp];
  double v12 = v11;
  v13 = [(ACTExtraKeyTap *)self touchedKey];
  id v14 = (id)objc_msgSend(v15, "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:", 0, v13, 0, 0, v6, v8, v10, v12);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(ACTExtraKeyTap *)self touchedKey];
  double v7 = [v6 representedString];
  [(ACTExtraKeyTap *)self location];
  uint64_t v9 = v8;
  [(ACTExtraKeyTap *)self location];
  uint64_t v11 = v10;
  [(ACTExtraKeyTap *)self timestamp];
  v13 = [v3 stringWithFormat:@"<%@: touchedKey=%@, loc=(%.0f,%.0f), t=%.2f>", v5, v7, v9, v11, v12];

  return v13;
}

- (ACTExtraKeyTap)initWithTouchedKey:(id)a3 location:(CGPoint)a4 timestamp:(double)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACTExtraKeyTap;
  uint64_t v11 = [(ACTExtraKeyTap *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_touchedKey, a3);
    v12->_location.CGFloat x = x;
    v12->_location.CGFloat y = y;
    v12->_timestamp = a5;
  }

  return v12;
}

@end