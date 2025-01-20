@interface SPContext
+ (BOOL)supportsSecureCoding;
- (SPContext)initWithCoder:(id)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)locationCategory;
- (unsigned)noiseLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setLocationCategory:(unsigned __int8)a3;
@end

@implementation SPContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPContext *)self init];
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_locationCategory = 0;
    }
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_locationCategory) {
    [a3 encodeInteger:self->_locationCategory forKey:@"loCt"];
  }
}

- (id)description
{
  return [(SPContext *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4 = a3;
  NSAppendPrintF_safe();
  id v5 = 0;
  v6 = v5;
  if (self->_locationCategory)
  {
    v10 = v5;
    NSAppendPrintF_safe();
    id v7 = v10;

    v6 = v7;
  }
  if (v4 < 0x15)
  {
    NSAppendPrintF_safe();
    id v8 = v6;

    v6 = v8;
  }

  return v6;
}

- (unsigned)locationCategory
{
  return self->_locationCategory;
}

- (void)setLocationCategory:(unsigned __int8)a3
{
  self->_locationCategory = a3;
}

- (unsigned)noiseLevel
{
  return self->_noiseLevel;
}

@end