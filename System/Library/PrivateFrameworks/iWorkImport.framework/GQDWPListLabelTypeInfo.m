@interface GQDWPListLabelTypeInfo
+ (const)stateForReading;
- (id)label;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (int)type;
- (void)dealloc;
@end

@implementation GQDWPListLabelTypeInfo

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A19E8;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  self->mType = 0;
  AttributeNs = xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"type", *(const xmlChar **)(qword_A35E8 + 16));
  if (AttributeNs)
  {
    v5 = AttributeNs;
    uint64_t v6 = 0;
    while (!xmlStrEqual(v5, (const xmlChar *)off_80590[v6]))
    {
      if (++v6 == 3) {
        goto LABEL_7;
      }
    }
    self->mType = v6;
LABEL_7:
    xmlFree(v5);
  }
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDWPListLabelTypeInfo;
  [(GQDWPListLabelTypeInfo *)&v3 dealloc];
}

- (int)type
{
  return self->mType;
}

- (id)label
{
  return self->mLabel;
}

@end