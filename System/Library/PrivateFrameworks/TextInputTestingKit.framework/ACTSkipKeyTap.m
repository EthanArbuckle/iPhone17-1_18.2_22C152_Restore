@interface ACTSkipKeyTap
- (ACTSkipKeyTap)initWithIntendedKey:(id)a3 timestamp:(double)a4;
- (UIKBTree)intendedKey;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTSkipKeyTap

- (void).cxx_destruct
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (UIKBTree)intendedKey
{
  return self->_intendedKey;
}

- (id)shortDescription
{
  v2 = NSString;
  v3 = [(ACTSkipKeyTap *)self intendedKey];
  v4 = [v3 representedString];
  v5 = [v2 stringWithFormat:@"SkipKey intended: %@", v4];

  return v5;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ACTSkipKeyTap *)self timestamp];
  double v9 = v8;
  id v10 = [(ACTSkipKeyTap *)self intendedKey];
  [v7 _skipTapTimestamp:v10 intendedKey:v6 typingLog:v9];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(ACTSkipKeyTap *)self intendedKey];
  id v7 = [v6 representedString];
  [(ACTSkipKeyTap *)self timestamp];
  double v9 = [v3 stringWithFormat:@"<%@: intended=%@, t=%.2f>", v5, v7, v8];

  return v9;
}

- (ACTSkipKeyTap)initWithIntendedKey:(id)a3 timestamp:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACTSkipKeyTap;
  uint64_t v8 = [(ACTSkipKeyTap *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_intendedKey, a3);
    v9->_timestamp = a4;
  }

  return v9;
}

@end