@interface VITextAnnotation
- (BOOL)isEqual:(id)a3;
- (CGRect)normalizedBoundingBox;
- (NSString)description;
- (NSString)text;
- (VITextAnnotation)initWithText:(id)a3 normalizedBoundingBox:(CGRect)a4 confidence:(float)a5;
- (float)confidence;
- (unint64_t)hash;
@end

@implementation VITextAnnotation

- (VITextAnnotation)initWithText:(id)a3 normalizedBoundingBox:(CGRect)a4 confidence:(float)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VITextAnnotation;
  v12 = [(VITextAnnotation *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    text = v12->_text;
    v12->_text = (NSString *)v13;

    v12->_normalizedBoundingBox.origin.CGFloat x = x;
    v12->_normalizedBoundingBox.origin.CGFloat y = y;
    v12->_normalizedBoundingBox.size.CGFloat width = width;
    v12->_normalizedBoundingBox.size.CGFloat height = height;
    v12->_confidence = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VITextAnnotation *)a3;
  if (v4 == self)
  {
    char IsEqual = 1;
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
    float confidence = self->_confidence;
    [(VITextAnnotation *)v6 confidence];
    if (confidence == v8
      && ([(VITextAnnotation *)v6 normalizedBoundingBox],
          v17.origin.CGFloat x = v9,
          v17.origin.CGFloat y = v10,
          v17.size.CGFloat width = v11,
          v17.size.CGFloat height = v12,
          CGRectEqualToRect(self->_normalizedBoundingBox, v17)))
    {
      text = self->_text;
      v14 = [(VITextAnnotation *)v6 text];
      char IsEqual = VIObjectIsEqual((unint64_t)text, (uint64_t)v14);
    }
    else
    {
      char IsEqual = 0;
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  float confidence = self->_confidence;
  float v4 = -confidence;
  if (confidence >= 0.0) {
    float v4 = self->_confidence;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmodf(v5, 1.8447e19);
  unint64_t v8 = v7 + (unint64_t)v6;
  float v9 = fabsf(v6);
  if (v6 <= 0.0) {
    unint64_t v8 = v7;
  }
  unint64_t v10 = v7 - (unint64_t)v9;
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v8;
  }
  double x = self->_normalizedBoundingBox.origin.x;
  double y = self->_normalizedBoundingBox.origin.y;
  double width = self->_normalizedBoundingBox.size.width;
  double height = self->_normalizedBoundingBox.size.height;
  double v16 = -x;
  if (x >= 0.0) {
    double v16 = self->_normalizedBoundingBox.origin.x;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  double v19 = fmod(v17, 1.84467441e19);
  unint64_t v20 = 2654435761u * (unint64_t)v19;
  unint64_t v21 = v20 + (unint64_t)v18;
  if (v18 <= 0.0) {
    unint64_t v21 = 2654435761u * (unint64_t)v19;
  }
  unint64_t v22 = v20 - (unint64_t)fabs(v18);
  if (v18 < 0.0) {
    unint64_t v23 = v22;
  }
  else {
    unint64_t v23 = v21;
  }
  if (y >= 0.0) {
    double v24 = y;
  }
  else {
    double v24 = -y;
  }
  long double v25 = floor(v24 + 0.5);
  double v26 = (v24 - v25) * 1.84467441e19;
  double v27 = fmod(v25, 1.84467441e19);
  unint64_t v28 = 2654435761u * (unint64_t)v27;
  unint64_t v29 = v28 + (unint64_t)v26;
  if (v26 <= 0.0) {
    unint64_t v29 = 2654435761u * (unint64_t)v27;
  }
  unint64_t v30 = v28 - (unint64_t)fabs(v26);
  if (v26 < 0.0) {
    unint64_t v31 = v30;
  }
  else {
    unint64_t v31 = v29;
  }
  if (width >= 0.0) {
    double v32 = width;
  }
  else {
    double v32 = -width;
  }
  long double v33 = floor(v32 + 0.5);
  double v34 = (v32 - v33) * 1.84467441e19;
  double v35 = fmod(v33, 1.84467441e19);
  unint64_t v36 = 2654435761u * (unint64_t)v35;
  unint64_t v37 = v36 + (unint64_t)v34;
  if (v34 <= 0.0) {
    unint64_t v37 = 2654435761u * (unint64_t)v35;
  }
  unint64_t v38 = v36 - (unint64_t)fabs(v34);
  if (v34 < 0.0) {
    unint64_t v39 = v38;
  }
  else {
    unint64_t v39 = v37;
  }
  if (height >= 0.0) {
    double v40 = height;
  }
  else {
    double v40 = -height;
  }
  long double v41 = floor(v40 + 0.5);
  double v42 = (v40 - v41) * 1.84467441e19;
  double v43 = fmod(v41, 1.84467441e19);
  unint64_t v44 = 2654435761u * (unint64_t)v43;
  unint64_t v45 = v44 + (unint64_t)v42;
  if (v42 <= 0.0) {
    unint64_t v45 = 2654435761u * (unint64_t)v43;
  }
  unint64_t v46 = v44 - (unint64_t)fabs(v42);
  if (v42 >= 0.0) {
    unint64_t v46 = v45;
  }
  return v23 ^ v11 ^ v31 ^ v39 ^ v46;
}

- (NSString)text
{
  return self->_text;
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
}

- (NSString)description
{
  return (NSString *)sub_1DCF16018(self, (uint64_t)a2, (void (*)(void))VITextAnnotation.description.getter);
}

@end