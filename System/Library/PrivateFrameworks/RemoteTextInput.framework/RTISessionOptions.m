@interface RTISessionOptions
+ (BOOL)supportsSecureCoding;
+ (id)defaultBeginOptions;
+ (id)defaultEndOptions;
+ (id)defaultOptions;
- (BOOL)animated;
- (BOOL)enhancedWindowingModeEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldResign;
- (RTISessionOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)offscreenDirection;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setEnhancedWindowingModeEnabled:(BOOL)a3;
- (void)setOffscreenDirection:(int64_t)a3;
- (void)setShouldResign:(BOOL)a3;
@end

@implementation RTISessionOptions

+ (id)defaultOptions
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setShouldResign:1];
  [v2 setAnimated:1];
  [v2 setOffscreenDirection:0];
  return v2;
}

+ (id)defaultBeginOptions
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setAnimated:1];
  [v2 setOffscreenDirection:0];
  return v2;
}

+ (id)defaultEndOptions
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setShouldResign:1];
  [v2 setAnimated:1];
  [v2 setOffscreenDirection:0];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeBool:self->_shouldResign forKey:@"shouldResign"];
  [v4 encodeBool:self->_animated forKey:@"animated"];
  [v4 encodeInteger:self->_offscreenDirection forKey:@"offscreenDirection"];
  [v4 encodeBool:self->_enhancedWindowingModeEnabled forKey:@"enhancedWindowingModeEnabled"];
}

- (RTISessionOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v7.receiver = self;
  v7.super_class = (Class)RTISessionOptions;
  v5 = [(RTISessionOptions *)&v7 init];
  if (v5)
  {
    v5->_shouldResign = [v4 decodeBoolForKey:@"shouldResign"];
    v5->_animated = [v4 decodeBoolForKey:@"animated"];
    v5->_offscreenDirection = [v4 decodeIntegerForKey:@"offscreenDirection"];
    v5->_enhancedWindowingModeEnabled = [v4 decodeBoolForKey:@"enhancedWindowingModeEnabled"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[RTISessionOptions allocWithZone:a3] init];
  *((unsigned char *)result + 8) = self->_shouldResign;
  *((unsigned char *)result + 9) = self->_animated;
  *((void *)result + 2) = self->_offscreenDirection;
  *((unsigned char *)result + 10) = self->_enhancedWindowingModeEnabled;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTISessionOptions *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(RTISessionOptions *)self shouldResign];
      if (v6 == [(RTISessionOptions *)v5 shouldResign]
        && (BOOL v7 = [(RTISessionOptions *)self animated], v7 == [(RTISessionOptions *)v5 animated]))
      {
        int64_t v9 = [(RTISessionOptions *)self offscreenDirection];
        BOOL v8 = v9 == [(RTISessionOptions *)v5 offscreenDirection];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  if ([(RTISessionOptions *)self shouldResign]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"; shouldResign = %@", v4];
  if ([(RTISessionOptions *)self animated]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 appendFormat:@"; animated = %@", v5];
  objc_msgSend(v3, "appendFormat:", @"; offscreenDirection = %lu",
    [(RTISessionOptions *)self offscreenDirection]);
  if ([(RTISessionOptions *)self enhancedWindowingModeEnabled]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  [v3 appendFormat:@"; enhancedWindowingModeEnabled = %@", v6];
  return v3;
}

- (BOOL)shouldResign
{
  return self->_shouldResign;
}

- (void)setShouldResign:(BOOL)a3
{
  self->_shouldResign = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (int64_t)offscreenDirection
{
  return self->_offscreenDirection;
}

- (void)setOffscreenDirection:(int64_t)a3
{
  self->_offscreenDirection = a3;
}

- (BOOL)enhancedWindowingModeEnabled
{
  return self->_enhancedWindowingModeEnabled;
}

- (void)setEnhancedWindowingModeEnabled:(BOOL)a3
{
  self->_enhancedWindowingModeEnabled = a3;
}

@end