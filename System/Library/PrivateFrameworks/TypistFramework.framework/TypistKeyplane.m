@interface TypistKeyplane
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoresShiftState;
- (BOOL)isAlphabeticPlane;
- (BOOL)isLetters;
- (BOOL)isShiftKeyplane;
- (BOOL)usesAutoShift;
- (NSString)name;
- (TypistKeyplane)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIgnoresShiftState:(BOOL)a3;
- (void)setIsAlphabeticPlane:(BOOL)a3;
- (void)setIsLetters:(BOOL)a3;
- (void)setIsShiftKeyplane:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setUsesAutoShift:(BOOL)a3;
@end

@implementation TypistKeyplane

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TypistKeyplane)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TypistKeyplane;
  v5 = [(TypistKeyplane *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_isLetters = [v4 decodeBoolForKey:@"isLetters"];
    v5->_isAlphabeticPlane = [v4 decodeBoolForKey:@"isAlphabeticPlane"];
    v5->_isShiftKeyplane = [v4 decodeBoolForKey:@"isShiftKeyplane"];
    v5->_usesAutoShift = [v4 decodeBoolForKey:@"usesAutoShift"];
    v5->_ignoresShiftState = [v4 decodeBoolForKey:@"ignoresShiftState"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  name = self->_name;
  id v6 = v4;
  if (name)
  {
    [v4 encodeObject:name forKey:@"name"];
    id v4 = v6;
  }
  [v4 encodeBool:self->_isLetters forKey:@"isLetters"];
  [v6 encodeBool:self->_isAlphabeticPlane forKey:@"isAlphabeticPlane"];
  [v6 encodeBool:self->_isShiftKeyplane forKey:@"isShiftKeyplane"];
  [v6 encodeBool:self->_usesAutoShift forKey:@"usesAutoShift"];
  [v6 encodeBool:self->_ignoresShiftState forKey:@"ignoresShiftState"];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)isLetters
{
  return self->_isLetters;
}

- (void)setIsLetters:(BOOL)a3
{
  self->_isLetters = a3;
}

- (BOOL)isAlphabeticPlane
{
  return self->_isAlphabeticPlane;
}

- (void)setIsAlphabeticPlane:(BOOL)a3
{
  self->_isAlphabeticPlane = a3;
}

- (BOOL)isShiftKeyplane
{
  return self->_isShiftKeyplane;
}

- (void)setIsShiftKeyplane:(BOOL)a3
{
  self->_isShiftKeyplane = a3;
}

- (BOOL)usesAutoShift
{
  return self->_usesAutoShift;
}

- (void)setUsesAutoShift:(BOOL)a3
{
  self->_usesAutoShift = a3;
}

- (BOOL)ignoresShiftState
{
  return self->_ignoresShiftState;
}

- (void)setIgnoresShiftState:(BOOL)a3
{
  self->_ignoresShiftState = a3;
}

- (void).cxx_destruct
{
}

@end