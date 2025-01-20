@interface GQDWPListLabelGeometry
+ (const)stateForReading;
- (BOOL)scaleWithText;
- (float)baselineOffset;
- (float)scale;
- (int)labelAlignment;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
@end

@implementation GQDWPListLabelGeometry

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A1938;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  sub_433CC(a3, qword_A35E8, (xmlChar *)"scale");
  *(float *)&double v5 = v5;
  self->mScale = *(float *)&v5;
  sub_433CC(a3, qword_A35E8, (xmlChar *)"offset");
  *(float *)&double v6 = v6;
  self->mBaselineOffset = *(float *)&v6;
  self->mScaleWithText = sub_42DCC(a3, qword_A35E8, (xmlChar *)"scale-with-text", 0);
  self->mLabelAlignment = 0;
  AttributeNs = xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"align", *(const xmlChar **)(qword_A35E8 + 16));
  if (AttributeNs)
  {
    v8 = AttributeNs;
    uint64_t v9 = 0;
    while (!xmlStrEqual(v8, (const xmlChar *)off_80578[v9]))
    {
      if (++v9 == 3) {
        goto LABEL_7;
      }
    }
    self->mLabelAlignment = v9;
LABEL_7:
    xmlFree(v8);
  }
  return 1;
}

- (float)scale
{
  return self->mScale;
}

- (float)baselineOffset
{
  return self->mBaselineOffset;
}

- (BOOL)scaleWithText
{
  return self->mScaleWithText;
}

- (int)labelAlignment
{
  return self->mLabelAlignment;
}

@end