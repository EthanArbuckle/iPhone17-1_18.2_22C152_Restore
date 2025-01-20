@interface TSUCustomFormatWrapper
- (TSUCustomFormatWrapper)initWithCustomFormat:(void *)a3;
- (const)conditionalFormatDataForValue:(double)a3;
- (const)defaultFormatData;
- (const)pointerToTSUCustomFormat;
- (id)formatName;
- (int)formatType;
@end

@implementation TSUCustomFormatWrapper

- (TSUCustomFormatWrapper)initWithCustomFormat:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSUCustomFormatWrapper;
  result = [(TSUCustomFormatWrapper *)&v5 init];
  if (result) {
    result->mCustomFormat = a3;
  }
  return result;
}

- (const)pointerToTSUCustomFormat
{
  return self->mCustomFormat;
}

- (id)formatName
{
  return (id)TSUCustomFormat::formatName((TSUCustomFormat *)self->mCustomFormat);
}

- (int)formatType
{
  return TSUCustomFormat::type((TSUCustomFormat *)self->mCustomFormat);
}

- (const)defaultFormatData
{
  return (const $541BF66048AE1D4B37D4F3D49CF3468B *)TSUCustomFormat::defaultFormatData((TSUCustomFormat *)self->mCustomFormat);
}

- (const)conditionalFormatDataForValue:(double)a3
{
  return (const $541BF66048AE1D4B37D4F3D49CF3468B *)TSUCustomFormat::formatByEvaluatingConditionsWithDouble((TSUCustomFormat *)self->mCustomFormat, a3);
}

@end