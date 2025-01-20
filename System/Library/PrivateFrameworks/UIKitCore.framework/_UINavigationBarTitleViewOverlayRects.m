@interface _UINavigationBarTitleViewOverlayRects
- (CGRect)backButtonRect;
- (CGRect)centerItemsRect;
- (CGRect)centerLine2Rect;
- (CGRect)centerRect;
- (CGRect)floatingTabBarRect;
- (CGRect)leadingItemsRect;
- (CGRect)leadingRect;
- (CGRect)leadingStaticItemRect;
- (CGRect)titleRect;
- (CGRect)trailingItemsRect;
- (CGRect)trailingRect;
- (CGRect)trailingStaticItemRect;
- (_UINavigationBarTitleViewOverlayRects)init;
- (id)asArray;
- (id)description;
- (int64_t)titleLocation;
- (void)reset;
- (void)setBackButtonRect:(CGRect)a3;
- (void)setCenterItemsRect:(CGRect)a3;
- (void)setFloatingTabBarRect:(CGRect)a3;
- (void)setLeadingItemsRect:(CGRect)a3;
- (void)setLeadingStaticItemRect:(CGRect)a3;
- (void)setTitleLocation:(int64_t)a3;
- (void)setTitleRect:(CGRect)a3;
- (void)setTrailingItemsRect:(CGRect)a3;
- (void)setTrailingStaticItemRect:(CGRect)a3;
@end

@implementation _UINavigationBarTitleViewOverlayRects

- (void)setTrailingStaticItemRect:(CGRect)a3
{
  self->_trailingStaticItemRect = a3;
}

- (void)setTrailingItemsRect:(CGRect)a3
{
  self->_trailingItemsRect = a3;
}

- (void)setTitleRect:(CGRect)a3
{
  self->_titleRect = a3;
}

- (void)setTitleLocation:(int64_t)a3
{
  self->_titleLocation = a3;
}

- (void)setLeadingStaticItemRect:(CGRect)a3
{
  self->_leadingStaticItemRect = a3;
}

- (void)setLeadingItemsRect:(CGRect)a3
{
  self->_leadingItemsRect = a3;
}

- (void)setFloatingTabBarRect:(CGRect)a3
{
  self->_floatingTabBarRect = a3;
}

- (void)setCenterItemsRect:(CGRect)a3
{
  self->_centerItemsRect = a3;
}

- (void)setBackButtonRect:(CGRect)a3
{
  self->_backButtonRect = a3;
}

- (id)asArray
{
  v3 = objc_opt_new();
  if (!CGRectIsNull(self->_leadingStaticItemRect))
  {
    v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_leadingStaticItemRect.origin.x, self->_leadingStaticItemRect.origin.y, self->_leadingStaticItemRect.size.width, self->_leadingStaticItemRect.size.height);
    [v3 addObject:v4];
  }
  if (!CGRectIsNull(self->_backButtonRect))
  {
    v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_backButtonRect.origin.x, self->_backButtonRect.origin.y, self->_backButtonRect.size.width, self->_backButtonRect.size.height);
    [v3 addObject:v5];
  }
  if (!CGRectIsNull(self->_leadingItemsRect))
  {
    v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_leadingItemsRect.origin.x, self->_leadingItemsRect.origin.y, self->_leadingItemsRect.size.width, self->_leadingItemsRect.size.height);
    [v3 addObject:v6];
  }
  if (!CGRectIsNull(self->_titleRect))
  {
    v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_titleRect.origin.x, self->_titleRect.origin.y, self->_titleRect.size.width, self->_titleRect.size.height);
    [v3 addObject:v7];
  }
  if (!CGRectIsNull(self->_centerItemsRect))
  {
    v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_centerItemsRect.origin.x, self->_centerItemsRect.origin.y, self->_centerItemsRect.size.width, self->_centerItemsRect.size.height);
    [v3 addObject:v8];
  }
  if (!CGRectIsNull(self->_floatingTabBarRect))
  {
    v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_floatingTabBarRect.origin.x, self->_floatingTabBarRect.origin.y, self->_floatingTabBarRect.size.width, self->_floatingTabBarRect.size.height);
    [v3 addObject:v9];
  }
  if (!CGRectIsNull(self->_trailingItemsRect))
  {
    v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_trailingItemsRect.origin.x, self->_trailingItemsRect.origin.y, self->_trailingItemsRect.size.width, self->_trailingItemsRect.size.height);
    [v3 addObject:v10];
  }
  if (!CGRectIsNull(self->_trailingStaticItemRect))
  {
    v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_trailingStaticItemRect.origin.x, self->_trailingStaticItemRect.origin.y, self->_trailingStaticItemRect.size.width, self->_trailingStaticItemRect.size.height);
    [v3 addObject:v11];
  }
  return v3;
}

- (_UINavigationBarTitleViewOverlayRects)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarTitleViewOverlayRects;
  result = [(_UINavigationBarTitleViewOverlayRects *)&v5 init];
  if (result)
  {
    CGPoint v3 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_leadingStaticItemRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_leadingStaticItemRect.size = v4;
    result->_backButtonRect.origin = v3;
    result->_backButtonRect.size = v4;
    result->_leadingItemsRect.origin = v3;
    result->_leadingItemsRect.size = v4;
    result->_titleRect.origin = v3;
    result->_titleRect.size = v4;
    result->_centerItemsRect.origin = v3;
    result->_centerItemsRect.size = v4;
    result->_trailingItemsRect.origin = v3;
    result->_trailingItemsRect.size = v4;
    result->_trailingStaticItemRect.origin = v3;
    result->_trailingStaticItemRect.size = v4;
    result->_floatingTabBarRect.origin = v3;
    result->_floatingTabBarRect.size = v4;
  }
  return result;
}

- (CGRect)titleRect
{
  double x = self->_titleRect.origin.x;
  double y = self->_titleRect.origin.y;
  double width = self->_titleRect.size.width;
  double height = self->_titleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)reset
{
  CGPoint v2 = (CGPoint)*MEMORY[0x1E4F1DB20];
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_leadingStaticItemRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_leadingStaticItemRect.size = v3;
  self->_backButtonRect.origin = v2;
  self->_backButtonRect.size = v3;
  self->_leadingItemsRect.origin = v2;
  self->_leadingItemsRect.size = v3;
  self->_titleRect.origin = v2;
  self->_titleRect.size = v3;
  self->_titleLocation = 0;
  self->_centerItemsRect.origin = v2;
  self->_centerItemsRect.size = v3;
  self->_trailingItemsRect.origin = v2;
  self->_trailingItemsRect.size = v3;
  self->_trailingStaticItemRect.origin = v2;
  self->_trailingStaticItemRect.size = v3;
  self->_floatingTabBarRect.origin = v2;
  self->_floatingTabBarRect.size = v3;
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)_UINavigationBarTitleViewOverlayRects;
  CGSize v3 = [(_UINavigationBarTitleViewOverlayRects *)&v16 description];
  CGSize v4 = (void *)[v3 mutableCopy];

  if (!CGRectIsNull(self->_leadingStaticItemRect))
  {
    objc_super v5 = NSStringFromCGRect(self->_leadingStaticItemRect);
    [v4 appendFormat:@" %s=%@", "leadingStaticItemRect", v5];
  }
  if (!CGRectIsNull(self->_backButtonRect))
  {
    v6 = NSStringFromCGRect(self->_backButtonRect);
    [v4 appendFormat:@" %s=%@", "backButtonRect", v6];
  }
  if (!CGRectIsNull(self->_leadingItemsRect))
  {
    v7 = NSStringFromCGRect(self->_leadingItemsRect);
    [v4 appendFormat:@" %s=%@", "leadingItemsRect", v7];
  }
  if (!CGRectIsNull(self->_titleRect))
  {
    v8 = NSStringFromCGRect(self->_titleRect);
    [v4 appendFormat:@" %s=%@", "titleRect", v8];
  }
  if (!CGRectIsNull(self->_titleRect))
  {
    v9 = NSStringFromCGRect(self->_titleRect);
    [v4 appendFormat:@" titleRect=%@", v9];

    switch(self->_titleLocation)
    {
      case 0:
        v10 = @" location=unknown";
        goto LABEL_16;
      case 1:
        v10 = @" location=centered";
        goto LABEL_16;
      case 2:
        v10 = @" location=leading";
        goto LABEL_16;
      case 3:
        v10 = @" location=2ndLine";
LABEL_16:
        [v4 appendString:v10];
        break;
      default:
        objc_msgSend(v4, "appendFormat:", @" location=%li", self->_titleLocation);
        break;
    }
  }
  if (!CGRectIsNull(self->_centerItemsRect))
  {
    v11 = NSStringFromCGRect(self->_centerItemsRect);
    [v4 appendFormat:@" %s=%@", "centerItemsRect", v11];
  }
  if (!CGRectIsNull(self->_floatingTabBarRect))
  {
    v12 = NSStringFromCGRect(self->_floatingTabBarRect);
    [v4 appendFormat:@" %s=%@", "floatingTabBarRect", v12];
  }
  if (!CGRectIsNull(self->_trailingItemsRect))
  {
    v13 = NSStringFromCGRect(self->_trailingItemsRect);
    [v4 appendFormat:@" %s=%@", "trailingItemsRect", v13];
  }
  if (!CGRectIsNull(self->_trailingStaticItemRect))
  {
    v14 = NSStringFromCGRect(self->_trailingStaticItemRect);
    [v4 appendFormat:@" %s=%@", "trailingStaticItemRect", v14];
  }
  return v4;
}

- (CGRect)leadingRect
{
  CGRect v12 = CGRectUnion(self->_backButtonRect, self->_leadingItemsRect);
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  CGFloat v7 = self->_leadingStaticItemRect.origin.x;
  CGFloat v8 = self->_leadingStaticItemRect.origin.y;
  CGFloat v9 = self->_leadingStaticItemRect.size.width;
  CGFloat v10 = self->_leadingStaticItemRect.size.height;
  return CGRectUnion(*(CGRect *)&v7, *(CGRect *)&x);
}

- (CGRect)centerRect
{
  int64_t titleLocation = self->_titleLocation;
  switch(titleLocation)
  {
    case 1:
      CGRect result = self->_titleRect;
      break;
    case 3:
      CGRect result = self->_floatingTabBarRect;
      break;
    case 2:
      CGRect result = CGRectUnion(self->_floatingTabBarRect, self->_centerItemsRect);
      break;
    default:
      CGRect result = *(CGRect *)*(void *)&MEMORY[0x1E4F1DB20];
      break;
  }
  return result;
}

- (CGRect)centerLine2Rect
{
  p_CGFloat height = (CGFloat *)(MEMORY[0x1E4F1DB20] + 24);
  p_CGFloat y = (CGFloat *)(MEMORY[0x1E4F1DB20] + 8);
  p_titleRect = &self->_titleRect;
  if (self->_titleLocation == 3)
  {
    p_CGFloat y = &self->_titleRect.origin.y;
    p_size = &self->_titleRect.size;
  }
  else
  {
    p_titleRect = (CGRect *)MEMORY[0x1E4F1DB20];
    p_size = (CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  }
  if (self->_titleLocation == 3) {
    p_CGFloat height = &self->_titleRect.size.height;
  }
  double v6 = *p_height;
  double width = p_size->width;
  double x = p_titleRect->origin.x;
  double v9 = *p_y;
  result.size.CGFloat height = v6;
  result.size.double width = width;
  result.origin.CGFloat y = v9;
  result.origin.double x = x;
  return result;
}

- (CGRect)trailingRect
{
  return CGRectUnion(self->_trailingItemsRect, self->_trailingStaticItemRect);
}

- (CGRect)leadingStaticItemRect
{
  double x = self->_leadingStaticItemRect.origin.x;
  double y = self->_leadingStaticItemRect.origin.y;
  double width = self->_leadingStaticItemRect.size.width;
  double height = self->_leadingStaticItemRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)backButtonRect
{
  double x = self->_backButtonRect.origin.x;
  double y = self->_backButtonRect.origin.y;
  double width = self->_backButtonRect.size.width;
  double height = self->_backButtonRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)leadingItemsRect
{
  double x = self->_leadingItemsRect.origin.x;
  double y = self->_leadingItemsRect.origin.y;
  double width = self->_leadingItemsRect.size.width;
  double height = self->_leadingItemsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)titleLocation
{
  return self->_titleLocation;
}

- (CGRect)centerItemsRect
{
  double x = self->_centerItemsRect.origin.x;
  double y = self->_centerItemsRect.origin.y;
  double width = self->_centerItemsRect.size.width;
  double height = self->_centerItemsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)floatingTabBarRect
{
  double x = self->_floatingTabBarRect.origin.x;
  double y = self->_floatingTabBarRect.origin.y;
  double width = self->_floatingTabBarRect.size.width;
  double height = self->_floatingTabBarRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)trailingItemsRect
{
  double x = self->_trailingItemsRect.origin.x;
  double y = self->_trailingItemsRect.origin.y;
  double width = self->_trailingItemsRect.size.width;
  double height = self->_trailingItemsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)trailingStaticItemRect
{
  double x = self->_trailingStaticItemRect.origin.x;
  double y = self->_trailingStaticItemRect.origin.y;
  double width = self->_trailingStaticItemRect.size.width;
  double height = self->_trailingStaticItemRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end