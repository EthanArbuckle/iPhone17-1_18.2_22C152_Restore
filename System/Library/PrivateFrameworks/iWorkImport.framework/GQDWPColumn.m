@interface GQDWPColumn
+ (const)stateForReading;
- (BOOL)hasSpacing;
- (float)spacing;
- (float)width;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (int64_t)index;
@end

@implementation GQDWPColumn

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A1318;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  int v5 = 3;
  if (sub_42E14(a3, qword_A35E8, (xmlChar *)"index", &self->mIndex))
  {
    sub_43348(a3, qword_A35E8, (xmlChar *)"width", &self->mWidth);
    if (v6) {
      int v5 = 1;
    }
    else {
      int v5 = 3;
    }
  }
  sub_43348(a3, qword_A35E8, (xmlChar *)"spacing", &self->mSpacing);
  self->mHasSpacing = v7;
  return v5;
}

- (int64_t)index
{
  return self->mIndex;
}

- (float)width
{
  return self->mWidth;
}

- (BOOL)hasSpacing
{
  return self->mHasSpacing;
}

- (float)spacing
{
  return self->mSpacing;
}

@end