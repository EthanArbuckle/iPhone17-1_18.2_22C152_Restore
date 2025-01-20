@interface UIObject
- (BOOL)clickabilityDetection;
- (BOOL)focusDetection;
- (CGRect)boundingBox;
- (NSArray)children;
- (NSString)elementDetectionLabel;
- (NSString)elementDetectionText;
- (NSString)iconDetectionLabel;
- (NSUUID)uuid;
- (UIObject)initWithCompat:(id)a3;
- (UIObjectCompat)underlyingObject;
- (float)clickabilityConfidence;
- (float)elementDetectionConfidence;
- (float)focusConfidence;
- (float)iconDetectionConfidence;
- (id)init:(int64_t)a3 confidence:(double)a4 text:(id)a5 boundingBox:(id)a6 children:(id)a7 clickable:(BOOL)a8 focused:(BOOL)a9;
@end

@implementation UIObject

- (id)init:(int64_t)a3 confidence:(double)a4 text:(id)a5 boundingBox:(id)a6 children:(id)a7 clickable:(BOOL)a8 focused:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  v19 = [[UIObjectCompat alloc] initWithLabel:a3 confidence:v18 text:v17 boundingBox:v16 children:v10 clickable:v9 focused:a4];

  v20 = [(UIObject *)self initWithCompat:v19];
  return v20;
}

- (UIObject)initWithCompat:(id)a3
{
  v4 = (UIObjectCompat *)a3;
  v8.receiver = self;
  v8.super_class = (Class)UIObject;
  v5 = [(UIObject *)&v8 init];
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (NSUUID)uuid
{
  v2 = [(UIObject *)self underlyingObject];
  v3 = [v2 id];

  return (NSUUID *)v3;
}

- (CGRect)boundingBox
{
  v2 = [(UIObject *)self underlyingObject];
  v3 = [v2 boundingBox];
  [v3 rect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (NSString)elementDetectionLabel
{
  v2 = [(UIObject *)self underlyingObject];
  v3 = [v2 detection];
  double v4 = [v3 labelString];

  return (NSString *)v4;
}

- (NSString)elementDetectionText
{
  v2 = [(UIObject *)self underlyingObject];
  v3 = [v2 detection];
  double v4 = [v3 text];

  return (NSString *)v4;
}

- (float)elementDetectionConfidence
{
  v2 = [(UIObject *)self underlyingObject];
  v3 = [v2 detection];
  [v3 confidence];
  float v5 = v4;

  return v5;
}

- (NSString)iconDetectionLabel
{
  v3 = [(UIObject *)self underlyingObject];
  double v4 = [v3 iconDetection];

  if (v4)
  {
    float v5 = [(UIObject *)self underlyingObject];
    double v6 = [v5 iconDetection];
    double v7 = [v6 labelString];
  }
  else
  {
    double v7 = 0;
  }

  return (NSString *)v7;
}

- (float)iconDetectionConfidence
{
  v3 = [(UIObject *)self underlyingObject];
  double v4 = [v3 iconDetection];

  if (!v4) {
    return 0.0;
  }
  float v5 = [(UIObject *)self underlyingObject];
  double v6 = [v5 iconDetection];
  [v6 confidence];
  float v8 = v7;

  return v8;
}

- (BOOL)clickabilityDetection
{
  v3 = [(UIObject *)self underlyingObject];
  double v4 = [v3 clickDetection];

  if (!v4) {
    return 0;
  }
  float v5 = [(UIObject *)self underlyingObject];
  double v6 = [v5 clickDetection];
  char v7 = [v6 clickable];

  return v7;
}

- (float)clickabilityConfidence
{
  v3 = [(UIObject *)self underlyingObject];
  double v4 = [v3 clickDetection];

  if (!v4) {
    return 0.0;
  }
  float v5 = [(UIObject *)self underlyingObject];
  double v6 = [v5 clickDetection];
  [v6 confidence];
  float v8 = v7;

  return v8;
}

- (BOOL)focusDetection
{
  v3 = [(UIObject *)self underlyingObject];
  double v4 = [v3 focusDetection];

  if (!v4) {
    return 0;
  }
  float v5 = [(UIObject *)self underlyingObject];
  double v6 = [v5 focusDetection];
  char v7 = [v6 focused];

  return v7;
}

- (float)focusConfidence
{
  v3 = [(UIObject *)self underlyingObject];
  double v4 = [v3 focusDetection];

  if (!v4) {
    return 0.0;
  }
  float v5 = [(UIObject *)self underlyingObject];
  double v6 = [v5 focusDetection];
  [v6 confidence];
  float v8 = v7;

  return v8;
}

- (NSArray)children
{
  return self->_children;
}

- (UIObjectCompat)underlyingObject
{
  return (UIObjectCompat *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

@end