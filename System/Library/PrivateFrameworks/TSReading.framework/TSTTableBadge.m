@interface TSTTableBadge
+ (id)badgeWithType:(int)a3 color:(id)a4 viewScale:(double)a5 frame:(CGRect)a6;
- (CGRect)frame;
- (TSUColor)color;
- (double)viewScale;
- (int)badgeType;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)setBadgeType:(int)a3;
- (void)setColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setViewScale:(double)a3;
@end

@implementation TSTTableBadge

+ (id)badgeWithType:(int)a3 color:(id)a4 viewScale:(double)a5 frame:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v12 = *(void *)&a3;
  v13 = objc_alloc_init(TSTTableBadge);
  [(TSTTableBadge *)v13 setBadgeType:v12];
  [(TSTTableBadge *)v13 setColor:a4];
  [(TSTTableBadge *)v13 setViewScale:a5];
  -[TSTTableBadge setFrame:](v13, "setFrame:", x, y, width, height);
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableBadge;
  [(TSTTableBadge *)&v3 dealloc];
}

- (void)drawInContext:(CGContext *)a3
{
  int v5 = [(TSTTableBadge *)self badgeType];
  switch(v5)
  {
    case 3:
      [(TSTTableBadge *)self viewScale];
      double v17 = v16;
      [(TSTTableBadge *)self frame];
      TSTTableBadgeDrawCellErrorIndicator(a3, v17, v18, v19, v20, v21);
      break;
    case 2:
      [(TSTTableBadge *)self frame];
      break;
    case 1:
      [(TSTTableBadge *)self frame];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      v14 = [(TSTTableBadge *)self color];
      CGContextSaveGState(a3);
      v15 = newTSTTableBadgeCellCommentBadgePath(v7, v9, v11, v13);
      CGContextAddPath(a3, v15);
      CGContextSetFillColorWithColor(a3, (CGColorRef)[(TSUColor *)v14 CGColor]);
      CGContextFillPath(a3);
      CGPathRelease(v15);
      CGContextRestoreGState(a3);
      break;
  }
}

- (int)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(int)a3
{
  self->_badgeType = a3;
}

- (TSUColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

@end