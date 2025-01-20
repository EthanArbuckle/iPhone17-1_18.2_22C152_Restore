@interface GQDWPPageStart
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (int64_t)index;
@end

@implementation GQDWPPageStart

- (int64_t)index
{
  return self->mIndex;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  if (sub_42E14(a3, qword_A35E8, (xmlChar *)"page-index", &self->mIndex)) {
    return 1;
  }
  else {
    return 3;
  }
}

@end