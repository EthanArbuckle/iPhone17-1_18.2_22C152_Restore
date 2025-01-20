@interface GQDRGradientStop
+ (const)stateForReading;
- (float)fraction;
- (id)color;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (void)dealloc;
@end

@implementation GQDRGradientStop

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9F078;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDRGradientStop;
  [(GQDRGradientStop *)&v3 dealloc];
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  sub_43348(a3, qword_A35E8, (xmlChar *)"fraction", &self->mFraction);
  if (v3) {
    return 1;
  }
  else {
    return 3;
  }
}

- (float)fraction
{
  return self->mFraction;
}

- (id)color
{
  return self->mColor;
}

@end