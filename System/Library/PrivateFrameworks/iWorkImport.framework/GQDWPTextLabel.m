@interface GQDWPTextLabel
- (__CFString)format;
- (int)first;
- (int)labelType;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (void)dealloc;
@end

@implementation GQDWPTextLabel

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  v5 = (__CFString *)sub_4340C(a3, qword_A35E8, (xmlChar *)"format");
  self->mFormat = v5;
  uint64_t v11 = 0;
  if (v5 && (sub_42E14(a3, qword_A35E8, (xmlChar *)"first", &v11) & 1) != 0)
  {
    int v6 = v11;
    self->mLabelType = 15;
    self->mFirst = v6;
    AttributeNs = xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"type", *(const xmlChar **)(qword_A35E8 + 16));
    if (AttributeNs)
    {
      v8 = AttributeNs;
      uint64_t v9 = 0;
      while (!xmlStrEqual(v8, (const xmlChar *)off_805C8[v9]))
      {
        if (++v9 == 15) {
          goto LABEL_10;
        }
      }
      self->mLabelType = v9;
LABEL_10:
      xmlFree(v8);
    }
    if (self->mLabelType == 15) {
      return 3;
    }
    else {
      return 1;
    }
  }
  else
  {
    self->mLabelType = 15;
    return 3;
  }
}

- (void)dealloc
{
  CFRelease(self->mFormat);
  v3.receiver = self;
  v3.super_class = (Class)GQDWPTextLabel;
  [(GQDWPTextLabel *)&v3 dealloc];
}

- (__CFString)format
{
  return self->mFormat;
}

- (int)labelType
{
  return self->mLabelType;
}

- (int)first
{
  return self->mFirst;
}

@end