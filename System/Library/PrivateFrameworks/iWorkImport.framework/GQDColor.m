@interface GQDColor
+ (const)stateForReading;
+ (id)blackColor;
+ (id)cmykColorFromReader:(_xmlTextReader *)a3;
+ (id)colorWithCalibratedRed:(double)a3 green:(double)a4 blue:(double)a5;
+ (id)rgbColorFromReader:(_xmlTextReader *)a3 calibrated:(BOOL)a4;
+ (id)whiteColorFromReader:(_xmlTextReader *)a3 calibrated:(BOOL)a4;
+ (void)readColorFromProcessor:(id)a3 reader:(_xmlTextReader *)a4;
- (GQDColor)initWithCalibratedRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (NSString)description;
- (double)alphaComponent;
- (double)blueComponent;
- (double)greenComponent;
- (double)redComponent;
- (id)blendedColorWithFraction:(double)a3 ofColor:(id)a4;
- (int)htmlBlue;
- (int)htmlGreen;
- (int)htmlRed;
- (void)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6;
@end

@implementation GQDColor

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9E7A0;
}

+ (id)blackColor
{
  return [a1 colorWithCalibratedRed:0.0 green:0.0 blue:0.0];
}

+ (id)colorWithCalibratedRed:(double)a3 green:(double)a4 blue:(double)a5
{
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithCalibratedRed:a3 green:a4 blue:a5 alpha:1.0];
  return v5;
}

- (GQDColor)initWithCalibratedRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)GQDColor;
  result = [(GQDColor *)&v11 init];
  if (result)
  {
    result->mRed = a3;
    result->mGreen = a4;
    result->mBlue = a5;
    result->mAlpha = a6;
  }
  return result;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@ %p: r=%f g=%f b=%f a=%f>", objc_opt_class(), self, *(void *)&self->mRed, *(void *)&self->mGreen, *(void *)&self->mBlue, *(void *)&self->mAlpha];
}

- (void)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  if (a3) {
    *a3 = self->mRed;
  }
  if (a4) {
    *a4 = self->mGreen;
  }
  if (a5) {
    *a5 = self->mBlue;
  }
  if (a6) {
    *a6 = self->mAlpha;
  }
}

- (double)redComponent
{
  return self->mRed;
}

- (double)greenComponent
{
  return self->mGreen;
}

- (double)blueComponent
{
  return self->mBlue;
}

- (double)alphaComponent
{
  return self->mAlpha;
}

- (id)blendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  double v7 = 1.0 - a3;
  [a4 redComponent];
  double v9 = v7 * self->mRed + v8 * a3;
  [a4 greenComponent];
  double v11 = v7 * self->mGreen + v10 * a3;
  [a4 blueComponent];
  double v13 = v7 * self->mBlue + v12 * a3;
  [a4 alphaComponent];
  v15 = [[GQDColor alloc] initWithCalibratedRed:v9 green:v11 blue:v13 alpha:v7 * self->mAlpha + v14 * a3];
  return v15;
}

+ (void)readColorFromProcessor:(id)a3 reader:(_xmlTextReader *)a4
{
  AttributeNs = xmlTextReaderGetAttributeNs(a4, (const xmlChar *)"type", *(const xmlChar **)(qword_A35F0 + 16));
  if (!AttributeNs) {
    return;
  }
  double v8 = AttributeNs;
  if (xmlStrEqual(AttributeNs, (const xmlChar *)"sfa:calibrated-rgb-color-type"))
  {
    id v9 = a1;
    double v10 = a4;
    uint64_t v11 = 1;
LABEL_6:
    double v12 = (GQDColor *)[v9 rgbColorFromReader:v10 calibrated:v11];
LABEL_7:
    double v13 = v12;
    goto LABEL_8;
  }
  if (xmlStrEqual(v8, (const xmlChar *)"sfa:device-rgb-color-type"))
  {
    id v9 = a1;
    double v10 = a4;
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  if (xmlStrEqual(v8, (const xmlChar *)"sfa:calibrated-white-color-type"))
  {
    id v15 = a1;
    v16 = a4;
    uint64_t v17 = 1;
LABEL_17:
    double v12 = (GQDColor *)[v15 whiteColorFromReader:v16 calibrated:v17];
    goto LABEL_7;
  }
  if (xmlStrEqual(v8, (const xmlChar *)"sfa:device-white-color-type"))
  {
    id v15 = a1;
    v16 = a4;
    uint64_t v17 = 0;
    goto LABEL_17;
  }
  if (xmlStrEqual(v8, (const xmlChar *)"sfa:device-cmyk-color-type"))
  {
    double v12 = (GQDColor *)[a1 cmykColorFromReader:a4];
    goto LABEL_7;
  }
  if (xmlStrEqual(v8, (const xmlChar *)"sfa:named-color-type"))
  {
    v18 = (GQDColor *)[a1 rgbColorFromReader:a4 calibrated:1];
    if (v18)
    {
      double v13 = v18;
      xmlFree(v8);
LABEL_9:
      id v14 = [a3 documentState];
      [v14 pushObject:v13];
      return;
    }
    v19 = xmlTextReaderGetAttributeNs(a4, (const xmlChar *)"catalog", *(const xmlChar **)(qword_A35E0 + 16));
    if (v19)
    {
      v20 = v19;
      if (!xmlStrEqual(v19, (const xmlChar *)"System"))
      {
        double v13 = 0;
LABEL_38:
        xmlFree(v20);
LABEL_8:
        xmlFree(v8);
        if (!v13) {
          return;
        }
        goto LABEL_9;
      }
      v21 = xmlTextReaderGetAttributeNs(a4, (const xmlChar *)"name", *(const xmlChar **)(qword_A35E0 + 16));
      v22 = v21;
      if (v21)
      {
        if (xmlStrEqual(v21, (const xmlChar *)"windowBackgroundColor")
          || xmlStrEqual(v22, (const xmlChar *)"controlColor"))
        {
          v23 = [GQDColor alloc];
          double v24 = 0.909803927;
          double v25 = 1.0;
          double v26 = 0.909803927;
          double v27 = 0.909803927;
LABEL_29:
          double v13 = [(GQDColor *)v23 initWithCalibratedRed:v24 green:v26 blue:v27 alpha:v25];
LABEL_37:
          xmlFree(v22);
          goto LABEL_38;
        }
        if (xmlStrEqual(v22, (const xmlChar *)"selectedMenuItemColor"))
        {
          v23 = [GQDColor alloc];
          double v24 = 0.105882354;
          double v26 = 0.266666681;
          double v27 = 0.952941179;
          double v25 = 1.0;
          goto LABEL_29;
        }
      }
      double v13 = 0;
      goto LABEL_37;
    }
  }
  xmlFreeFunc v28 = xmlFree;
  ((void (*)(xmlChar *))v28)(v8);
}

+ (id)rgbColorFromReader:(_xmlTextReader *)a3 calibrated:(BOOL)a4
{
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  BOOL v5 = sub_43164(a3, qword_A35E0, (xmlChar *)"r", &v11);
  id result = 0;
  if (v5)
  {
    if (sub_43164(a3, qword_A35E0, (xmlChar *)"g", &v10)
      && sub_43164(a3, qword_A35E0, (xmlChar *)"b", &v9)
      && sub_43164(a3, qword_A35E0, (xmlChar *)"a", &v8))
    {
      double v7 = [GQDColor alloc];
      return [(GQDColor *)v7 initWithCalibratedRed:v11 green:v10 blue:v9 alpha:v8];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (id)whiteColorFromReader:(_xmlTextReader *)a3 calibrated:(BOOL)a4
{
  double v8 = 0.0;
  double v9 = 0.0;
  BOOL v5 = sub_43164(a3, qword_A35E0, (xmlChar *)"w", &v9);
  id result = 0;
  if (v5)
  {
    if (sub_43164(a3, qword_A35E0, (xmlChar *)"a", &v8))
    {
      double v7 = [GQDColor alloc];
      return [(GQDColor *)v7 initWithCalibratedRed:v9 green:v9 blue:v9 alpha:v8];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (id)cmykColorFromReader:(_xmlTextReader *)a3
{
  CGFloat v15 = 0.0;
  CGFloat v16 = 0.0;
  CGFloat v13 = 0.0;
  CGFloat v14 = 0.0;
  CGFloat v12 = 0.0;
  v4 = 0;
  if (sub_43164(a3, qword_A35E0, (xmlChar *)"c", &v16))
  {
    if (!sub_43164(a3, qword_A35E0, (xmlChar *)"m", &v15)) {
      return 0;
    }
    if (!sub_43164(a3, qword_A35E0, (xmlChar *)"y", &v14)) {
      return 0;
    }
    if (!sub_43164(a3, qword_A35E0, (xmlChar *)"k", &v13)) {
      return 0;
    }
    if (!sub_43164(a3, qword_A35E0, (xmlChar *)"a", &v12)) {
      return 0;
    }
    DeviceCMYK = CGColorSpaceCreateDeviceCMYK();
    components[0] = v16;
    components[1] = v15;
    components[2] = v14;
    components[3] = v13;
    components[4] = v12;
    v6 = CGColorCreate(DeviceCMYK, components);
    CGColorSpaceRelease(DeviceCMYK);
    if (v6)
    {
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
      if (DeviceRGB)
      {
        double v8 = DeviceRGB;
        if (CGColorTransformCreate())
        {
          double v9 = (CGColor *)CGColorTransformConvertColor();
          v4 = v9;
          if (v9)
          {
            if (CGColorGetNumberOfComponents(v9) == 4)
            {
              double v10 = CGColorGetComponents(v4);
              v4 = [[GQDColor alloc] initWithCalibratedRed:*v10 green:v10[1] blue:v10[2] alpha:v10[3]];
            }
            else
            {
              v4 = 0;
            }
          }
          CGColorTransformRelease();
        }
        else
        {
          v4 = 0;
        }
        CGColorSpaceRelease(v8);
      }
      else
      {
        v4 = 0;
      }
      CGColorRelease(v6);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (int)htmlRed
{
  return llround(self->mRed * 255.0);
}

- (int)htmlGreen
{
  return llround(self->mGreen * 255.0);
}

- (int)htmlBlue
{
  return llround(self->mBlue * 255.0);
}

@end