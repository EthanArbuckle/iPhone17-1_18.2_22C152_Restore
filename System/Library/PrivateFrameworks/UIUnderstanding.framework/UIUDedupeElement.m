@interface UIUDedupeElement
- (BOOL)isDuplicate;
- (CGRect)rect;
- (DedupeElementCompat)underlyingObject;
- (UIUDedupeElement)initWithContents:(id)a3;
- (void)setIsDuplicate:(BOOL)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation UIUDedupeElement

- (UIUDedupeElement)initWithContents:(id)a3
{
  v4 = (DedupeElementCompat *)a3;
  v8.receiver = self;
  v8.super_class = (Class)UIUDedupeElement;
  v5 = [(UIUDedupeElement *)&v8 init];
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (BOOL)isDuplicate
{
  v2 = [(UIUDedupeElement *)self underlyingObject];
  char v3 = [v2 isDuplicate];

  return v3;
}

- (CGRect)rect
{
  v2 = [(UIUDedupeElement *)self underlyingObject];
  char v3 = [v2 uiObject];
  v4 = [v3 boundingBox];
  [v4 rect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setIsDuplicate:(BOOL)a3
{
  self->_isDuplicate = a3;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (DedupeElementCompat)underlyingObject
{
  return (DedupeElementCompat *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end