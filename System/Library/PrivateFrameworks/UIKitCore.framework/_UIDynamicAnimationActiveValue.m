@interface _UIDynamicAnimationActiveValue
+ (id)activeValue:(double)a3 ofType:(int)a4;
+ (id)lowerBoundary:(double)a3 ofType:(int)a4;
+ (id)upperBoundary:(double)a3 ofType:(int)a4;
- (BOOL)_isLowerBoundary;
- (BOOL)_isUpperBoundary;
- (_UIDynamicAnimationActiveValue)init;
- (double)_boundaryPull;
- (double)maximumActiveValue;
- (double)minimumActiveValue;
- (double)value;
- (id)_applier;
- (id)description;
- (int)type;
- (void)_appendDescriptionToString:(id)a3 atLevel:(int)a4;
- (void)_setBoundaryPull:(double)a3;
- (void)dealloc;
- (void)setMaximumActiveValue:(double)a3;
- (void)setMinimumActiveValue:(double)a3;
- (void)setType:(int)a3;
- (void)setValue:(double)a3;
@end

@implementation _UIDynamicAnimationActiveValue

+ (id)lowerBoundary:(double)a3 ofType:(int)a4
{
  id result = (id)[(id)objc_opt_class() activeValue:*(void *)&a4 ofType:a3];
  *((unsigned char *)result + 56) |= 1u;
  *((double *)result + 3) = a3;
  return result;
}

+ (id)upperBoundary:(double)a3 ofType:(int)a4
{
  id result = (id)[(id)objc_opt_class() activeValue:*(void *)&a4 ofType:a3];
  *((unsigned char *)result + 56) |= 2u;
  *((double *)result + 2) = a3;
  return result;
}

+ (id)activeValue:(double)a3 ofType:(int)a4
{
  v6 = (double *)objc_alloc_init((Class)a1);
  if (v6)
  {
    v6[1] = a3;
    *((_DWORD *)v6 + 8) = a4;
  }
  return v6;
}

- (_UIDynamicAnimationActiveValue)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicAnimationActiveValue;
  id result = [(_UIDynamicAnimationActiveValue *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_minimumActiveValue = xmmword_186B929F0;
    result->_type = 0;
    result->_boundaryPull = 0.12;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicAnimationActiveValue;
  [(_UIDynamicAnimationActiveValue *)&v3 dealloc];
}

- (id)_applier
{
  id result = self->_applier;
  if (!result)
  {
    uint64_t type = self->_type;
    if (type > 3)
    {
      return 0;
    }
    else
    {
      id result = (id)[*(&off_1E52DC700 + type) copy];
      self->_applier = result;
    }
  }
  return result;
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    char v3 = *((unsigned char *)self + 56);
    if ((v3 & 2) != 0) {
      self->_minimumActiveValue = a3;
    }
    if (v3) {
      self->_maximumActiveValue = a3;
    }
  }
}

- (void)setMinimumActiveValue:(double)a3
{
  if ((*((unsigned char *)self + 56) & 3) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"The minimum active value for a boundary is based on the target value and can not be changed"];
  }
  self->_minimumActiveValue = a3;
}

- (void)setMaximumActiveValue:(double)a3
{
  if ((*((unsigned char *)self + 56) & 3) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"The maximum active value for a boundary is based on the target value and can not be changed"];
  }
  self->_maximumActiveValue = a3;
}

- (void)setType:(int)a3
{
  if (self->_type != a3)
  {
    [(_UIDynamicAnimationActiveValue *)self willChangeValueForKey:@"type"];
    self->_uint64_t type = a3;

    self->_applier = 0;
    [(_UIDynamicAnimationActiveValue *)self didChangeValueForKey:@"type"];
  }
}

- (double)_boundaryPull
{
  return self->_boundaryPull;
}

- (void)_setBoundaryPull:(double)a3
{
  self->_boundaryPull = a3;
}

- (BOOL)_isLowerBoundary
{
  return *((unsigned char *)self + 56) & 1;
}

- (BOOL)_isUpperBoundary
{
  return (*((unsigned __int8 *)self + 56) >> 1) & 1;
}

- (void)_appendDescriptionToString:(id)a3 atLevel:(int)a4
{
  id v13 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if ([a3 length]) {
    [a3 appendString:@"\n"];
  }
  if (a4)
  {
    unint64_t v7 = 1;
    do
    {
      [a3 appendString:@"    "];
      ++v7;
    }
    while (v7 <= a4);
  }
  [a3 appendFormat:@"<%@: %p", objc_opt_class(), self];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  for (i = objc_opt_class();
        [MEMORY[0x1E4F28B50] bundleForClass:i] != v8;
        i = (void *)[i superclass])
  {
    if (i == objc_opt_class()) {
      break;
    }
  }
  if (objc_opt_class() != i) {
    [a3 appendFormat:@"; baseClass = %@", NSStringFromClass((Class)i)];
  }
  uint64_t type = self->_type;
  if (type > 3) {
    v11 = 0;
  }
  else {
    v11 = off_1E52DC720[type];
  }
  [a3 appendFormat:@"; uint64_t type = %@", v11];
  objc_msgSend(a3, "appendFormat:", @"; value = %f", *(void *)&self->_value);
  char v12 = *((unsigned char *)self + 56);
  if (v12)
  {
    [a3 appendString:@"; lower boundary"];
    char v12 = *((unsigned char *)self + 56);
  }
  if ((v12 & 2) != 0) {
    [a3 appendString:@"; upper boundary"];
  }
  if (self->_minimumActiveValue != -1.79769313e308 && (*((unsigned char *)self + 56) & 2) == 0) {
    objc_msgSend(a3, "appendFormat:", @"; min = %f", *(void *)&self->_minimumActiveValue);
  }
  if (self->_maximumActiveValue != 1.79769313e308 && (*((unsigned char *)self + 56) & 1) == 0) {
    objc_msgSend(a3, "appendFormat:", @"; min = %f", *(void *)&self->_maximumActiveValue);
  }
  if (self->_boundaryPull != 0.12) {
    objc_msgSend(a3, "appendFormat:", @"; pull = %f", *(void *)&self->_boundaryPull);
  }
  [a3 appendFormat:@">"];
}

- (id)description
{
  char v3 = (void *)[MEMORY[0x1E4F28E78] string];
  [(_UIDynamicAnimationActiveValue *)self _appendDescriptionToString:v3 atLevel:0];
  return v3;
}

- (double)value
{
  return self->_value;
}

- (double)minimumActiveValue
{
  return self->_minimumActiveValue;
}

- (double)maximumActiveValue
{
  return self->_maximumActiveValue;
}

- (int)type
{
  return self->_type;
}

@end