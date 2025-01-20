@interface VIImageRegionDomainInfo
- (BOOL)barcodeResultsRequired;
- (BOOL)hasFocalPoint;
- (BOOL)isCornerGlyph;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowConfidence;
- (BOOL)ocrResultsRequired;
- (BOOL)shouldShowDynamicGlyph;
- (CGPoint)focalPoint;
- (NSString)displayLabel;
- (NSString)displayMessage;
- (NSString)domainKey;
- (NSString)glyphName;
- (NSString)labelName;
- (VIImageRegionDomainInfo)initWithDomainKey:(id)a3 labelName:(id)a4 glyphName:(id)a5 displayLabel:(id)a6 displayMessage:(id)a7 hasFocalPoint:(BOOL)a8 focalPoint:(CGPoint)a9 isCornerGlyph:(BOOL)a10 ocrResultsRequired:(BOOL)a11 barcodeResultsRequired:(BOOL)a12 isLowConfidence:(BOOL)a13 shouldShowDynamicGlyph:(BOOL)a14;
- (unint64_t)hash;
@end

@implementation VIImageRegionDomainInfo

- (VIImageRegionDomainInfo)initWithDomainKey:(id)a3 labelName:(id)a4 glyphName:(id)a5 displayLabel:(id)a6 displayMessage:(id)a7 hasFocalPoint:(BOOL)a8 focalPoint:(CGPoint)a9 isCornerGlyph:(BOOL)a10 ocrResultsRequired:(BOOL)a11 barcodeResultsRequired:(BOOL)a12 isLowConfidence:(BOOL)a13 shouldShowDynamicGlyph:(BOOL)a14
{
  CGFloat y = a9.y;
  CGFloat x = a9.x;
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v26 = a7;
  v39.receiver = self;
  v39.super_class = (Class)VIImageRegionDomainInfo;
  v27 = [(VIImageRegionDomainInfo *)&v39 init];
  if (v27)
  {
    uint64_t v28 = [v22 copy];
    domainKeCGFloat y = v27->_domainKey;
    v27->_domainKeCGFloat y = (NSString *)v28;

    uint64_t v30 = [v23 copy];
    labelName = v27->_labelName;
    v27->_labelName = (NSString *)v30;

    uint64_t v32 = [v24 copy];
    glyphName = v27->_glyphName;
    v27->_glyphName = (NSString *)v32;

    uint64_t v34 = [v25 copy];
    displayLabel = v27->_displayLabel;
    v27->_displayLabel = (NSString *)v34;

    uint64_t v36 = [v26 copy];
    displayMessage = v27->_displayMessage;
    v27->_displayMessage = (NSString *)v36;

    v27->_hasFocalPoint = a8;
    v27->_focalPoint.CGFloat x = x;
    v27->_focalPoint.CGFloat y = y;
    v27->_isCornerGlyph = a10;
    v27->_ocrResultsRequired = a11;
    v27->_barcodeResultsRequired = a12;
    v27->_isLowConfidence = a13;
    v27->_shouldShowDynamicGlyph = a14;
  }

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VIImageRegionDomainInfo *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    domainKeCGFloat y = self->_domainKey;
    v8 = [(VIImageRegionDomainInfo *)v6 domainKey];
    if (!VIObjectIsEqual((unint64_t)domainKey, (uint64_t)v8))
    {
      BOOL v19 = 0;
LABEL_28:

      goto LABEL_29;
    }
    labelName = self->_labelName;
    v10 = [(VIImageRegionDomainInfo *)v6 labelName];
    if (!VIObjectIsEqual((unint64_t)labelName, (uint64_t)v10))
    {
      BOOL v19 = 0;
LABEL_27:

      goto LABEL_28;
    }
    glyphName = self->_glyphName;
    v12 = [(VIImageRegionDomainInfo *)v6 glyphName];
    if (!VIObjectIsEqual((unint64_t)glyphName, (uint64_t)v12))
    {
      BOOL v19 = 0;
LABEL_26:

      goto LABEL_27;
    }
    displayLabel = self->_displayLabel;
    v14 = [(VIImageRegionDomainInfo *)v6 displayLabel];
    if (!VIObjectIsEqual((unint64_t)displayLabel, (uint64_t)v14))
    {
      BOOL v19 = 0;
LABEL_25:

      goto LABEL_26;
    }
    displayMessage = self->_displayMessage;
    v16 = [(VIImageRegionDomainInfo *)v6 displayMessage];
    if (!VIObjectIsEqual((unint64_t)displayMessage, (uint64_t)v16)) {
      goto LABEL_23;
    }
    BOOL hasFocalPoint = self->_hasFocalPoint;
    if (hasFocalPoint != [(VIImageRegionDomainInfo *)v6 hasFocalPoint]) {
      goto LABEL_23;
    }
    [(VIImageRegionDomainInfo *)v6 focalPoint];
    BOOL v19 = 0;
    if (self->_focalPoint.x != v20 || self->_focalPoint.y != v18) {
      goto LABEL_24;
    }
    BOOL isCornerGlyph = self->_isCornerGlyph;
    if (isCornerGlyph == [(VIImageRegionDomainInfo *)v6 isCornerGlyph]
      && (BOOL ocrResultsRequired = self->_ocrResultsRequired,
          ocrResultsRequired == [(VIImageRegionDomainInfo *)v6 ocrResultsRequired])
      && (BOOL barcodeResultsRequired = self->_barcodeResultsRequired,
          barcodeResultsRequired == [(VIImageRegionDomainInfo *)v6 barcodeResultsRequired])
      && (BOOL isLowConfidence = self->_isLowConfidence,
          isLowConfidence == [(VIImageRegionDomainInfo *)v6 isLowConfidence]))
    {
      BOOL shouldShowDynamicGlyph = self->_shouldShowDynamicGlyph;
      BOOL v19 = shouldShowDynamicGlyph == [(VIImageRegionDomainInfo *)v6 shouldShowDynamicGlyph];
    }
    else
    {
LABEL_23:
      BOOL v19 = 0;
    }
LABEL_24:

    goto LABEL_25;
  }
  BOOL v19 = 1;
LABEL_29:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domainKey hash];
  NSUInteger v4 = [(NSString *)self->_labelName hash];
  NSUInteger v5 = [(NSString *)self->_glyphName hash];
  NSUInteger v6 = [(NSString *)self->_displayLabel hash];
  NSUInteger v7 = [(NSString *)self->_displayMessage hash];
  BOOL hasFocalPoint = self->_hasFocalPoint;
  double x = self->_focalPoint.x;
  double y = self->_focalPoint.y;
  double v11 = -x;
  if (x >= 0.0) {
    double v11 = self->_focalPoint.x;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  double v14 = fmod(v12, 1.84467441e19);
  unint64_t v15 = 2654435761u * (unint64_t)v14;
  unint64_t v16 = v15 + (unint64_t)v13;
  if (v13 <= 0.0) {
    unint64_t v16 = 2654435761u * (unint64_t)v14;
  }
  unint64_t v17 = v15 - (unint64_t)fabs(v13);
  if (v13 < 0.0) {
    unint64_t v18 = v17;
  }
  else {
    unint64_t v18 = v16;
  }
  if (y >= 0.0) {
    double v19 = y;
  }
  else {
    double v19 = -y;
  }
  long double v20 = floor(v19 + 0.5);
  double v21 = (v19 - v20) * 1.84467441e19;
  double v22 = fmod(v20, 1.84467441e19);
  unint64_t v23 = 2654435761u * (unint64_t)v22;
  unint64_t v24 = v23 + (unint64_t)v21;
  if (v21 <= 0.0) {
    unint64_t v24 = 2654435761u * (unint64_t)v22;
  }
  unint64_t v25 = v23 - (unint64_t)fabs(v21);
  if (v21 >= 0.0) {
    unint64_t v25 = v24;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v25 ^ (2654435761 * hasFocalPoint) ^ v18 ^ (2654435761 * self->_isCornerGlyph) ^ (2654435761 * self->_ocrResultsRequired) ^ (2654435761 * self->_barcodeResultsRequired) ^ (2654435761 * self->_isLowConfidence) ^ (2654435761 * self->_shouldShowDynamicGlyph);
}

- (NSString)domainKey
{
  return self->_domainKey;
}

- (NSString)labelName
{
  return self->_labelName;
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (BOOL)shouldShowDynamicGlyph
{
  return self->_shouldShowDynamicGlyph;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (NSString)displayMessage
{
  return self->_displayMessage;
}

- (BOOL)hasFocalPoint
{
  return self->_hasFocalPoint;
}

- (CGPoint)focalPoint
{
  double x = self->_focalPoint.x;
  double y = self->_focalPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isCornerGlyph
{
  return self->_isCornerGlyph;
}

- (BOOL)ocrResultsRequired
{
  return self->_ocrResultsRequired;
}

- (BOOL)barcodeResultsRequired
{
  return self->_barcodeResultsRequired;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMessage, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_domainKey, 0);
}

@end