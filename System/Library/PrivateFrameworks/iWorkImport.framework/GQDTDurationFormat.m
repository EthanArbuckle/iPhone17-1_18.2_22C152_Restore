@interface GQDTDurationFormat
+ (const)stateForReading;
- (GQDTDurationFormat)initWithFormatString:(__CFString *)a3;
- (__CFString)formatString;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (void)dealloc;
@end

@implementation GQDTDurationFormat

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A3A28;
}

- (GQDTDurationFormat)initWithFormatString:(__CFString *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GQDTDurationFormat;
  v4 = [(GQDTDurationFormat *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mFormatString = a3;
    if (a3) {
      CFRetain(a3);
    }
  }
  return v5;
}

- (void)dealloc
{
  mFormatString = self->mFormatString;
  if (mFormatString) {
    CFRelease(mFormatString);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDTDurationFormat;
  [(GQDTDurationFormat *)&v4 dealloc];
}

- (__CFString)formatString
{
  return self->mFormatString;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  self->mFormatString = (__CFString *)sub_4340C(a3, qword_A35E8, (xmlChar *)"fmt");
  return 1;
}

@end