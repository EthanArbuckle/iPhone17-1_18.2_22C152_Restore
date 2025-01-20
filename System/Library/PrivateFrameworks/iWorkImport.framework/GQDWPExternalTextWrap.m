@interface GQDWPExternalTextWrap
+ (const)stateForReading;
- (BOOL)floatingWrapEnabled;
- (BOOL)inlineWrapEnabled;
- (float)alphaThreshold;
- (float)margin;
- (int)attachmentWrapType;
- (int)floatingWrapType;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (int)wrapDirection;
- (int)wrapStyle;
@end

@implementation GQDWPExternalTextWrap

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A1498;
}

- (BOOL)floatingWrapEnabled
{
  return self->mFloatingWrapEnabled;
}

- (BOOL)inlineWrapEnabled
{
  return self->mInlineWrapEnabled;
}

- (float)margin
{
  return self->mMargin;
}

- (float)alphaThreshold
{
  return self->mAlphaThreshold;
}

- (int)wrapStyle
{
  return self->mWrapStyle;
}

- (int)wrapDirection
{
  return self->mWrapDirection;
}

- (int)floatingWrapType
{
  return self->mFloatingWrapType;
}

- (int)attachmentWrapType
{
  return self->mAttachmentWrapType;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  self->mFloatingWrapEnabled = sub_42DCC(a3, qword_A35E8, (xmlChar *)"floating-wrap-enabled", 0);
  self->mInlineWrapEnabled = sub_42DCC(a3, qword_A35E8, (xmlChar *)"inline-wrap-enabled", 0);
  double v9 = 0.0;
  if (!sub_43164(a3, qword_A35E8, (xmlChar *)"margin", &v9)) {
    return 3;
  }
  float v5 = v9;
  self->mMargin = v5;
  if (!sub_43164(a3, qword_A35E8, (xmlChar *)"alpha-threshold", &v9)) {
    return 3;
  }
  float v6 = v9;
  self->mAlphaThreshold = v6;
  if (!sub_43A9C(a3, qword_A35E8, (xmlChar *)"wrap-style", (uint64_t)&dword_A4160, &self->mWrapStyle)
    || !sub_43A9C(a3, qword_A35E8, (xmlChar *)"direction", (uint64_t)&dword_A4190, &self->mWrapDirection))
  {
    return 3;
  }
  int v7 = 3;
  if (sub_43A9C(a3, qword_A35E8, (xmlChar *)"attachment-wrap-type", (uint64_t)&dword_A41D0, &self->mAttachmentWrapType))
  {
    if (sub_43A9C(a3, qword_A35E8, (xmlChar *)"floating-wrap-type", (uint64_t)&dword_A4200, &self->mFloatingWrapType))return 1; {
    else
    }
      return 3;
  }
  return v7;
}

@end