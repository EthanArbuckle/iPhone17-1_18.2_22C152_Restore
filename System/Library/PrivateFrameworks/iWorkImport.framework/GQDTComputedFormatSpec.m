@interface GQDTComputedFormatSpec
- (BOOL)isDateFormat;
- (BOOL)isDurationFormat;
- (BOOL)isNumberFormat;
- (id)format;
- (void)dealloc;
@end

@implementation GQDTComputedFormatSpec

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDTComputedFormatSpec;
  [(GQDTComputedFormatSpec *)&v3 dealloc];
}

- (id)format
{
  return self->mFormat;
}

- (BOOL)isDateFormat
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isDurationFormat
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNumberFormat
{
  return objc_opt_isKindOfClass() & 1;
}

@end