@interface VIBarcodeAnnotationItem
+ (id)annotationItemFromObservation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)normalizedBoundingBox;
- (NSString)payloadStringValue;
- (NSString)symbology;
- (VIBarcodeAnnotationItem)initWithSymbology:(id)a3 payloadStringValue:(id)a4 normalizedBoundingBox:(CGRect)a5 confidence:(float)a6;
- (float)confidence;
- (unint64_t)hash;
@end

@implementation VIBarcodeAnnotationItem

- (VIBarcodeAnnotationItem)initWithSymbology:(id)a3 payloadStringValue:(id)a4 normalizedBoundingBox:(CGRect)a5 confidence:(float)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v13 = a3;
  id v14 = a4;
  v21.receiver = self;
  v21.super_class = (Class)VIBarcodeAnnotationItem;
  v15 = [(VIBarcodeAnnotationItem *)&v21 init];
  if (v15)
  {
    uint64_t v16 = [v13 copy];
    symbologCGFloat y = v15->_symbology;
    v15->_symbologCGFloat y = (NSString *)v16;

    uint64_t v18 = [v14 copy];
    payloadStringValue = v15->_payloadStringValue;
    v15->_payloadStringValue = (NSString *)v18;

    v15->_normalizedBoundingBox.origin.CGFloat x = x;
    v15->_normalizedBoundingBox.origin.CGFloat y = y;
    v15->_normalizedBoundingBox.size.CGFloat width = width;
    v15->_normalizedBoundingBox.size.CGFloat height = height;
    v15->_confidence = a6;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VIBarcodeAnnotationItem *)a3;
  if (v4 == self)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    symbologCGFloat y = self->_symbology;
    v8 = [(VIBarcodeAnnotationItem *)v6 symbology];
    if (VIObjectIsEqual((unint64_t)symbology, (uint64_t)v8))
    {
      payloadStringValue = self->_payloadStringValue;
      v10 = [(VIBarcodeAnnotationItem *)v6 payloadStringValue];
      if (VIObjectIsEqual((unint64_t)payloadStringValue, (uint64_t)v10)
        && ([(VIBarcodeAnnotationItem *)v6 normalizedBoundingBox],
            v19.origin.CGFloat x = v11,
            v19.origin.CGFloat y = v12,
            v19.size.CGFloat width = v13,
            v19.size.CGFloat height = v14,
            CGRectEqualToRect(self->_normalizedBoundingBox, v19)))
      {
        float confidence = self->_confidence;
        [(VIBarcodeAnnotationItem *)v6 confidence];
        BOOL v17 = confidence == v16;
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_symbology hash];
  NSUInteger v4 = [(NSString *)self->_payloadStringValue hash];
  double x = self->_normalizedBoundingBox.origin.x;
  double y = self->_normalizedBoundingBox.origin.y;
  double width = self->_normalizedBoundingBox.size.width;
  double height = self->_normalizedBoundingBox.size.height;
  double v9 = -x;
  if (x >= 0.0) {
    double v9 = self->_normalizedBoundingBox.origin.x;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  double v12 = fmod(v10, 1.84467441e19);
  unint64_t v13 = 2654435761u * (unint64_t)v12;
  unint64_t v14 = v13 + (unint64_t)v11;
  if (v11 <= 0.0) {
    unint64_t v14 = 2654435761u * (unint64_t)v12;
  }
  unint64_t v15 = v13 - (unint64_t)fabs(v11);
  if (v11 < 0.0) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = v14;
  }
  if (y >= 0.0) {
    double v17 = y;
  }
  else {
    double v17 = -y;
  }
  long double v18 = floor(v17 + 0.5);
  double v19 = (v17 - v18) * 1.84467441e19;
  double v20 = fmod(v18, 1.84467441e19);
  unint64_t v21 = 2654435761u * (unint64_t)v20;
  unint64_t v22 = v21 + (unint64_t)v19;
  if (v19 <= 0.0) {
    unint64_t v22 = 2654435761u * (unint64_t)v20;
  }
  unint64_t v23 = v21 - (unint64_t)fabs(v19);
  if (v19 < 0.0) {
    unint64_t v24 = v23;
  }
  else {
    unint64_t v24 = v22;
  }
  if (width >= 0.0) {
    double v25 = width;
  }
  else {
    double v25 = -width;
  }
  long double v26 = floor(v25 + 0.5);
  double v27 = (v25 - v26) * 1.84467441e19;
  double v28 = fmod(v26, 1.84467441e19);
  unint64_t v29 = 2654435761u * (unint64_t)v28;
  unint64_t v30 = v29 + (unint64_t)v27;
  if (v27 <= 0.0) {
    unint64_t v30 = 2654435761u * (unint64_t)v28;
  }
  unint64_t v31 = v29 - (unint64_t)fabs(v27);
  if (v27 < 0.0) {
    unint64_t v32 = v31;
  }
  else {
    unint64_t v32 = v30;
  }
  if (height >= 0.0) {
    double v33 = height;
  }
  else {
    double v33 = -height;
  }
  long double v34 = floor(v33 + 0.5);
  double v35 = (v33 - v34) * 1.84467441e19;
  double v36 = fmod(v34, 1.84467441e19);
  unint64_t v37 = 2654435761u * (unint64_t)v36;
  unint64_t v38 = v37 + (unint64_t)v35;
  if (v35 <= 0.0) {
    unint64_t v38 = 2654435761u * (unint64_t)v36;
  }
  unint64_t v39 = v37 - (unint64_t)fabs(v35);
  if (v35 < 0.0) {
    unint64_t v40 = v39;
  }
  else {
    unint64_t v40 = v38;
  }
  float confidence = self->_confidence;
  float v42 = -confidence;
  if (confidence >= 0.0) {
    float v42 = self->_confidence;
  }
  float v43 = floorf(v42 + 0.5);
  float v44 = (float)(v42 - v43) * 1.8447e19;
  float v45 = fmodf(v43, 1.8447e19);
  unint64_t v46 = 2654435761u * (unint64_t)v45;
  unint64_t v47 = v46 + (unint64_t)v44;
  if (v44 <= 0.0) {
    unint64_t v47 = 2654435761u * (unint64_t)v45;
  }
  unint64_t v48 = v46 - (unint64_t)fabsf(v44);
  if (v44 >= 0.0) {
    unint64_t v48 = v47;
  }
  return v4 ^ v3 ^ v32 ^ v16 ^ v24 ^ v40 ^ v48;
}

+ (id)annotationItemFromObservation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [v3 symbology];
  v6 = [v3 payloadStringValue];
  [v3 boundingBox];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [v3 confidence];
  int v16 = v15;

  LODWORD(v17) = v16;
  long double v18 = objc_msgSend(v4, "initWithSymbology:payloadStringValue:normalizedBoundingBox:confidence:", v5, v6, v8, v10, v12, v14, v17);

  return v18;
}

- (NSString)symbology
{
  return self->_symbology;
}

- (NSString)payloadStringValue
{
  return self->_payloadStringValue;
}

- (CGRect)normalizedBoundingBox
{
  double x = self->_normalizedBoundingBox.origin.x;
  double y = self->_normalizedBoundingBox.origin.y;
  double width = self->_normalizedBoundingBox.size.width;
  double height = self->_normalizedBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadStringValue, 0);
  objc_storeStrong((id *)&self->_symbology, 0);
}

@end