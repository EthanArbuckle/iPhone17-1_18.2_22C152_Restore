@interface GQDTTextCell
- (__CFString)stringValue;
- (id)layoutStorage;
- (int)readContentForTCell:(_xmlTextReader *)a3;
- (int)readContentForTextCell:(_xmlTextReader *)a3;
- (void)dealloc;
@end

@implementation GQDTTextCell

- (void)dealloc
{
  mStringValue = self->mStringValue;
  if (mStringValue) {
    CFRelease(mStringValue);
  }

  v4.receiver = self;
  v4.super_class = (Class)GQDTTextCell;
  [(GQDTCell *)&v4 dealloc];
}

- (__CFString)stringValue
{
  return self->mStringValue;
}

- (id)layoutStorage
{
  return self->mLayoutStorage;
}

- (int)readContentForTextCell:(_xmlTextReader *)a3
{
  self->mStringValue = (__CFString *)sub_4340C(a3, qword_A35E0, (xmlChar *)"string");
  return 1;
}

- (int)readContentForTCell:(_xmlTextReader *)a3
{
  self->mStringValue = (__CFString *)sub_4340C(a3, qword_A35E0, (xmlChar *)"s");
  return 1;
}

@end