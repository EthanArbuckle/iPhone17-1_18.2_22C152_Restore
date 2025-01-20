@interface GQDWPColumns
+ (const)stateForReading;
- (BOOL)equalColumns;
- (__CFArray)columns;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (void)dealloc;
@end

@implementation GQDWPColumns

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A13A0;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  self->mEqualColumns = sub_42DCC(a3, qword_A35E8, (xmlChar *)"equal-columns", 0);
  return 1;
}

- (void)dealloc
{
  mColumns = self->mColumns;
  if (mColumns) {
    CFRelease(mColumns);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPColumns;
  [(GQDWPColumns *)&v4 dealloc];
}

- (__CFArray)columns
{
  return self->mColumns;
}

- (BOOL)equalColumns
{
  return self->mEqualColumns;
}

@end