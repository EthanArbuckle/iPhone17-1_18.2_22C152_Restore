@interface GQDRStroke
+ (const)stateForReading;
- (float)miterLimit;
- (float)width;
- (id)color;
- (id)pattern;
- (int)cap;
- (int)join;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (void)dealloc;
@end

@implementation GQDRStroke

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9F1C0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDRStroke;
  [(GQDRStroke *)&v3 dealloc];
}

- (float)miterLimit
{
  return self->mMiterLimit;
}

- (float)width
{
  return self->mWidth;
}

- (int)cap
{
  return self->mCap;
}

- (int)join
{
  return self->mJoin;
}

- (id)color
{
  return self->mColor;
}

- (id)pattern
{
  return self->mPattern;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  double v13 = 0.0;
  if (!sub_43164(a3, qword_A35E8, (xmlChar *)"width", &v13)) {
    return 3;
  }
  float v5 = v13;
  self->mWidth = v5;
  if (!sub_43164(a3, qword_A35E8, (xmlChar *)"miter-limit", &v13)) {
    return 3;
  }
  float v6 = v13;
  self->mMiterLimit = v6;
  AttributeNs = xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"cap", *(const xmlChar **)(qword_A35E8 + 16));
  if (!AttributeNs)
  {
    self->mCap = 0;
LABEL_12:
    AttributeNs = xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"join", *(const xmlChar **)(qword_A35E8 + 16));
    if (!AttributeNs)
    {
      self->mJoin = 0;
      return 1;
    }
    int v10 = *AttributeNs;
    switch(v10)
    {
      case 'b':
        int v11 = 2;
        goto LABEL_23;
      case 'm':
        int v11 = 0;
        goto LABEL_23;
      case 'r':
        int v11 = 1;
LABEL_23:
        self->mJoin = v11;
        xmlFree(AttributeNs);
        return 1;
    }
    goto LABEL_18;
  }
  int v8 = *AttributeNs;
  switch(v8)
  {
    case 'b':
      int v9 = 0;
      goto LABEL_11;
    case 's':
      int v9 = 2;
      goto LABEL_11;
    case 'r':
      int v9 = 1;
LABEL_11:
      self->mCap = v9;
      xmlFree(AttributeNs);
      goto LABEL_12;
  }
LABEL_18:
  xmlFree(AttributeNs);
  return 3;
}

@end