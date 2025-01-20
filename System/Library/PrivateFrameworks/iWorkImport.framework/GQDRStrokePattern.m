@interface GQDRStrokePattern
+ (id)solidPattern;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (int)type;
@end

@implementation GQDRStrokePattern

+ (id)solidPattern
{
  v2 = objc_alloc_init((Class)a1);
  if (v2) {
    v2[2] = 1;
  }
  return v2;
}

- (int)type
{
  return self->mType;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  AttributeNs = xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"type", *(const xmlChar **)(qword_A35E8 + 16));
  if (AttributeNs)
  {
    v5 = AttributeNs;
    uint64_t v6 = 0;
    while (!xmlStrEqual(v5, (const xmlChar *)(&off_804F0)[v6]))
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

@end