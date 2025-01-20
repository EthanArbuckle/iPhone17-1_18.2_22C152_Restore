@interface UIPointerRegion
+ (UIPointerRegion)regionWithRect:(CGRect)rect identifier:(id)identifier;
- (BOOL)_isLatching;
- (BOOL)isEqual:(id)a3;
- (CGRect)rect;
- (NSString)description;
- (UIAxis)latchingAxes;
- (UIView)referenceView;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (unint64_t)generationID;
- (unint64_t)hash;
- (void)setGenerationID:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setLatchingAxes:(UIAxis)latchingAxes;
- (void)setRect:(CGRect)a3;
- (void)setReferenceView:(id)a3;
@end

@implementation UIPointerRegion

+ (UIPointerRegion)regionWithRect:(CGRect)rect identifier:(id)identifier
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  id v8 = identifier;
  v9 = objc_opt_new();
  objc_msgSend(v9, "setRect:", x, y, width, height);
  [v9 setIdentifier:v8];

  return (UIPointerRegion *)v9;
}

- (BOOL)_isLatching
{
  return [(UIPointerRegion *)self latchingAxes] != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  [(UIPointerRegion *)self rect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(UIPointerRegion *)self identifier];
  v14 = objc_msgSend(v4, "regionWithRect:identifier:", v13, v6, v8, v10, v12);

  v15 = [(UIPointerRegion *)self referenceView];
  [v14 setReferenceView:v15];

  objc_msgSend(v14, "setGenerationID:", -[UIPointerRegion generationID](self, "generationID"));
  objc_msgSend(v14, "setLatchingAxes:", -[UIPointerRegion latchingAxes](self, "latchingAxes"));
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIPointerRegion *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      double v6 = [(UIPointerRegion *)v5 identifier];
      double v7 = [(UIPointerRegion *)self identifier];
      id v8 = v6;
      id v9 = v7;
      double v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        BOOL v11 = 0;
        id v12 = v8;
        if (!v8 || !v9)
        {
LABEL_18:

          goto LABEL_19;
        }
        int v13 = [v8 isEqual:v9];

        if (!v13)
        {
          BOOL v11 = 0;
LABEL_19:

          goto LABEL_20;
        }
      }
      id v12 = [(UIPointerRegion *)v5 referenceView];
      id v9 = [(UIPointerRegion *)self referenceView];
      if (v12 == v9)
      {
        [(UIPointerRegion *)v5 rect];
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        [(UIPointerRegion *)self rect];
        v30.origin.double x = v22;
        v30.origin.double y = v23;
        v30.size.double width = v24;
        v30.size.double height = v25;
        v29.origin.double x = v15;
        v29.origin.double y = v17;
        v29.size.double width = v19;
        v29.size.double height = v21;
        if (CGRectEqualToRect(v29, v30)
          && (uint64_t v26 = [(UIPointerRegion *)v5 generationID],
              v26 == [(UIPointerRegion *)self generationID]))
        {
          uint64_t v27 = [(UIPointerRegion *)v5 latchingAxes];
          BOOL v11 = v27 == [(UIPointerRegion *)self latchingAxes];
        }
        else
        {
          BOOL v11 = 0;
        }
        id v9 = v12;
      }
      else
      {
        BOOL v11 = 0;
      }
      goto LABEL_18;
    }
    BOOL v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  [(UIPointerRegion *)self rect];
  int v4 = (int)v3;
  [(UIPointerRegion *)self rect];
  int v6 = (int)v5 ^ v4;
  [(UIPointerRegion *)self rect];
  int v8 = (int)v7;
  [(UIPointerRegion *)self rect];
  uint64_t v10 = v6 ^ v8 ^ (int)v9;
  BOOL v11 = [(UIPointerRegion *)self identifier];
  uint64_t v12 = [v11 hash];
  int v13 = [(UIPointerRegion *)self referenceView];
  uint64_t v14 = [v13 hash];
  unint64_t v15 = [(UIPointerRegion *)self generationID];
  UIAxis v16 = v12 ^ v14 ^ v15 ^ [(UIPointerRegion *)self latchingAxes] ^ v10;

  return v16;
}

- (NSString)description
{
  double v3 = NSString;
  [(UIPointerRegion *)self rect];
  uint64_t v5 = v4;
  [(UIPointerRegion *)self rect];
  uint64_t v7 = v6;
  [(UIPointerRegion *)self rect];
  uint64_t v9 = v8;
  [(UIPointerRegion *)self rect];
  BOOL v11 = objc_msgSend(v3, "stringWithFormat:", @"(%g %g %g %g)", v5, v7, v9, v10);;
  uint64_t v12 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p rect = %@", objc_opt_class(), self, v11];;
  int v13 = [(UIPointerRegion *)self identifier];

  if (v13)
  {
    uint64_t v14 = [(UIPointerRegion *)self identifier];
    [v12 appendFormat:@"; identifier = %@", v14];
  }
  UIAxis v15 = [(UIPointerRegion *)self latchingAxes] - 1;
  if (v15 <= 2) {
    [v12 appendString:off_1E530AEA8[v15]];
  }
  [v12 appendString:@">"];

  return (NSString *)v12;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UIAxis)latchingAxes
{
  return self->_latchingAxes;
}

- (void)setLatchingAxes:(UIAxis)latchingAxes
{
  self->_latchingAxes = latchingAxes;
}

- (unint64_t)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(unint64_t)a3
{
  self->_generationID = a3;
}

- (UIView)referenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceView);
  return (UIView *)WeakRetained;
}

- (void)setReferenceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_referenceView);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end