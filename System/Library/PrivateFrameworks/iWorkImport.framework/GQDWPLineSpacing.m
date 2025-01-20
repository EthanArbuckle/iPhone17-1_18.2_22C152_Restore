@interface GQDWPLineSpacing
+ (const)stateForReading;
- (GQDWPLineSpacing)init;
- (float)amount;
- (int)mode;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
@end

@implementation GQDWPLineSpacing

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A17D8;
}

- (GQDWPLineSpacing)init
{
  v3.receiver = self;
  v3.super_class = (Class)GQDWPLineSpacing;
  result = [(GQDWPLineSpacing *)&v3 init];
  if (result) {
    *(void *)&result->mMode = 0x3F80000000000000;
  }
  return result;
}

- (int)mode
{
  return self->mMode;
}

- (float)amount
{
  return self->mAmount;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  int v6 = 3;
  if (sub_43A9C(a3, qword_A35E8, (xmlChar *)"mode", (uint64_t)&dword_A4240, &self->mMode))
  {
    sub_43348(a3, qword_A35E8, (xmlChar *)"amt", &self->mAmount);
    if (v7) {
      return 1;
    }
    else {
      return 3;
    }
  }
  return v6;
}

@end