@interface SUOverlayTransition
+ (BOOL)supportsSecureCoding;
+ (int64_t)transitionTypeFromString:(id)a3;
- (SUDOMElement)sourceElement;
- (SUOverlayTransition)init;
- (SUOverlayTransition)initWithCoder:(id)a3;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setSourceElement:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SUOverlayTransition

- (SUOverlayTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUOverlayTransition;
  result = [(SUOverlayTransition *)&v3 init];
  if (result) {
    result->_duration = 0.5;
  }
  return result;
}

- (SUOverlayTransition)initWithCoder:(id)a3
{
  v4 = [(SUOverlayTransition *)self init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"duration"];
    v4->_duration = v5;
    v4->_type = [a3 decodeIntegerForKey:@"type"];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  self->_sourceElement = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUOverlayTransition;
  [(SUOverlayTransition *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 8) = self->_duration;
  *(void *)(v4 + 16) = self->_sourceElement;
  *(void *)(v4 + 24) = self->_type;
  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeDouble:@"duration" forKey:self->_duration];
  int64_t type = self->_type;

  [a3 encodeInteger:type forKey:@"type"];
}

+ (int64_t)transitionTypeFromString:(id)a3
{
  if ([a3 isEqualToString:@"flip"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"slide-from-right"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"slide-from-bottom"]) {
    return 3;
  }
  return 0;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (SUDOMElement)sourceElement
{
  return self->_sourceElement;
}

- (void)setSourceElement:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

@end