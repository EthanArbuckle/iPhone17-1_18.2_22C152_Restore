@interface CRLLineEnd
+ (CRLLineEnd)lineEndWithIdentifier:(id)a3;
+ (CRLLineEnd)lineEndWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6;
+ (CRLLineEnd)lineEndWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7;
+ (CRLLineEnd)lineEndWithType:(int64_t)a3;
+ (id)accessibilityDescriptionFor:(int64_t)a3;
+ (id)filledArrow;
+ (id)filledCircle;
+ (id)filledDiamond;
+ (id)filledSquare;
+ (id)invertedArrow;
+ (id)line;
+ (id)none;
+ (id)openArrow;
+ (id)openCircle;
+ (id)openSquare;
+ (id)simpleArrow;
+ (int64_t)lineEndTypeFromLineEnd:(id)a3;
- (BOOL)isArrow;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFilled;
- (BOOL)isNone;
- (CGImage)newLineEndImageOnRight:(BOOL)a3 forContentsScale:(double)a4 withSize:(CGSize)a5;
- (CGPoint)endPoint;
- (CRLBezierPath)path;
- (CRLBezierPath)wrapPath;
- (CRLLineEnd)initWithBezierPath:(id)a3 wrapPath:(id)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7 lineJoin:(int)a8;
- (CRLLineEnd)initWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6;
- (CRLLineEnd)initWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7 lineJoin:(int)a8;
- (NSString)accessibilityDescription;
- (NSString)identifier;
- (double)scaleForStrokeWidth:(double)result;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)lineJoin;
- (unint64_t)hash;
@end

@implementation CRLLineEnd

+ (id)simpleArrow
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathCloseSubpath(Mutable);
  v3 = +[CRLLineEnd lineEndWithPath:Mutable, 1, @"simple arrow", 3.0, 0.0 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v3;
}

+ (id)filledCircle
{
  v11.origin.CGFloat x = 0.0;
  v11.origin.CGFloat y = 0.0;
  v11.size.CGFloat width = 6.0;
  v11.size.CGFloat height = 6.0;
  CGRect v12 = CGRectInset(v11, 0.5, 0.5);
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  Mutable = CGPathCreateMutable();
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGPathAddEllipseInRect(Mutable, 0, v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  v8 = +[CRLLineEnd lineEndWithPath:Mutable, 1, @"filled circle", MidX, CGRectGetMinY(v15) endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v8;
}

+ (id)filledDiamond
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, 3.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 3.0);
  CGPathCloseSubpath(Mutable);
  v3 = +[CRLLineEnd lineEndWithPath:Mutable, 1, @"filled diamond", 3.0, 0.331400007 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v3;
}

+ (id)openArrow
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 5.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathMoveToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 5.0);
  v3 = [[CRLLineEnd alloc] initWithPath:Mutable, 0, 0, @"open arrow", 1, 3.0, 0.0 wrapPath endPoint isFilled identifier lineJoin];
  CGPathRelease(Mutable);

  return v3;
}

+ (id)filledArrow
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 1.5);
  CGPathCloseSubpath(Mutable);
  v3 = +[CRLLineEnd lineEndWithPath:Mutable, 1, @"filled arrow", 3.0, 1.5 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v3;
}

+ (id)filledSquare
{
  v11.origin.CGFloat x = 0.0;
  v11.origin.CGFloat y = 0.0;
  v11.size.CGFloat width = 6.0;
  v11.size.CGFloat height = 6.0;
  CGRect v12 = CGRectInset(v11, 0.5, 0.5);
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  Mutable = CGPathCreateMutable();
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  v8 = +[CRLLineEnd lineEndWithPath:Mutable, 1, @"filled square", MidX, CGRectGetMinY(v15) endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v8;
}

+ (id)openSquare
{
  v11.origin.CGFloat x = 0.0;
  v11.origin.CGFloat y = 0.0;
  v11.size.CGFloat width = 6.0;
  v11.size.CGFloat height = 6.0;
  CGRect v12 = CGRectInset(v11, 1.0, 1.0);
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  Mutable = CGPathCreateMutable();
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  v8 = +[CRLLineEnd lineEndWithPath:Mutable, 0, @"open square", MidX, CGRectGetMinY(v15) + -0.800000012 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v8;
}

+ (id)openCircle
{
  v11.origin.CGFloat x = 0.0;
  v11.origin.CGFloat y = 0.0;
  v11.size.CGFloat width = 6.0;
  v11.size.CGFloat height = 6.0;
  CGRect v12 = CGRectInset(v11, 0.5, 0.5);
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  Mutable = CGPathCreateMutable();
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGPathAddEllipseInRect(Mutable, 0, v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  v8 = +[CRLLineEnd lineEndWithPath:Mutable, 0, @"open circle", MidX, CGRectGetMinY(v15) + -0.800000012 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v8;
}

+ (id)invertedArrow
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 3.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 3.0);
  CGPathCloseSubpath(Mutable);
  v3 = +[CRLLineEnd lineEndWithPath:Mutable, 1, @"inverted arrow", 3.0, 0.331400007 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v3;
}

+ (id)line
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  v3 = +[CRLLineEnd lineEndWithPath:Mutable, 0, @"line", 3.0, -0.800000012 endPoint isFilled identifier];
  CGPathRelease(Mutable);

  return v3;
}

+ (id)none
{
  return +[CRLLineEnd lineEndWithPath:0, 0, @"none", CGPointZero.x, CGPointZero.y endPoint isFilled identifier];
}

+ (CRLLineEnd)lineEndWithType:(int64_t)a3
{
  uint64_t v17 = v8;
  uint64_t v18 = v7;
  uint64_t v19 = v6;
  uint64_t v20 = v5;
  uint64_t v21 = v4;
  uint64_t v22 = v3;
  switch(a3)
  {
    case 0:
      goto LABEL_24;
    case 1:
      a1 = +[CRLLineEnd filledCircle];
      goto LABEL_25;
    case 2:
      a1 = +[CRLLineEnd filledDiamond];
      goto LABEL_25;
    case 3:
      a1 = +[CRLLineEnd openArrow];
      goto LABEL_25;
    case 4:
      a1 = +[CRLLineEnd filledArrow];
      goto LABEL_25;
    case 5:
      a1 = +[CRLLineEnd filledSquare];
      goto LABEL_25;
    case 6:
      a1 = +[CRLLineEnd openSquare];
      goto LABEL_25;
    case 7:
      a1 = +[CRLLineEnd openCircle];
      goto LABEL_25;
    case 8:
      a1 = +[CRLLineEnd invertedArrow];
      goto LABEL_25;
    case 9:
      a1 = +[CRLLineEnd line];
      goto LABEL_25;
    case 10:
      a1 = +[CRLLineEnd none];
      goto LABEL_25;
    case 11:
      int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FE550);
      }
      CGRect v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BA094(v12, v13);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FE570);
      }
      CGRect v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v14, v12);
      }
      CGRect v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLLineEnd lineEndWithType:]", v8, v7, v6, v5, v21, v22, v9);
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLLineEnd.m"];
      +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:194 isFatal:0 description:"Should not ask for line end with this type (count)"];

LABEL_24:
      a1 = +[CRLLineEnd simpleArrow];
LABEL_25:
      break;
    default:
      break;
  }
  return (CRLLineEnd *)a1;
}

+ (CRLLineEnd)lineEndWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"simple arrow"])
  {
    uint64_t v4 = +[CRLLineEnd simpleArrow];
LABEL_23:
    uint64_t v5 = (void *)v4;
    goto LABEL_24;
  }
  if ([v3 isEqualToString:@"filled circle"])
  {
    uint64_t v4 = +[CRLLineEnd filledCircle];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"filled diamond"])
  {
    uint64_t v4 = +[CRLLineEnd filledDiamond];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"open arrow"])
  {
    uint64_t v4 = +[CRLLineEnd openArrow];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"filled arrow"])
  {
    uint64_t v4 = +[CRLLineEnd filledArrow];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"filled square"])
  {
    uint64_t v4 = +[CRLLineEnd filledSquare];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"open square"])
  {
    uint64_t v4 = +[CRLLineEnd openSquare];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"open circle"])
  {
    uint64_t v4 = +[CRLLineEnd openCircle];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"inverted arrow"])
  {
    uint64_t v4 = +[CRLLineEnd invertedArrow];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"line"])
  {
    uint64_t v4 = +[CRLLineEnd line];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"none"])
  {
    uint64_t v4 = +[CRLLineEnd none];
    goto LABEL_23;
  }
  uint64_t v5 = 0;
LABEL_24:

  return (CRLLineEnd *)v5;
}

+ (int64_t)lineEndTypeFromLineEnd:(id)a3
{
  id v3 = [a3 identifier];
  if ([v3 isEqualToString:@"simple arrow"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"filled circle"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"filled diamond"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"open arrow"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"filled arrow"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"filled square"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"open square"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"open circle"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"inverted arrow"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"line"])
  {
    int64_t v4 = 9;
  }
  else
  {
    [v3 isEqualToString:@"none"];
    int64_t v4 = 10;
  }

  return v4;
}

- (NSString)accessibilityDescription
{
  int64_t v2 = +[CRLLineEnd lineEndTypeFromLineEnd:self];

  return (NSString *)+[CRLLineEnd accessibilityDescriptionFor:v2];
}

+ (id)accessibilityDescriptionFor:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Simple arrow";
      goto LABEL_13;
    case 1:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Filled circle";
      goto LABEL_13;
    case 2:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Filled diamond";
      goto LABEL_13;
    case 3:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Open arrow";
      goto LABEL_13;
    case 4:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Filled arrow";
      goto LABEL_13;
    case 5:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Filled square";
      goto LABEL_13;
    case 6:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Open square";
      goto LABEL_13;
    case 7:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Open circle";
      goto LABEL_13;
    case 8:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Inverted arrow";
      goto LABEL_13;
    case 9:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Line";
LABEL_13:
      CFStringRef v7 = 0;
      goto LABEL_14;
    case 10:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"NONE_ACCESSIBILITY_LABEL";
      CFStringRef v7 = @"None";
LABEL_14:
      uint64_t v6 = [v3 localizedStringForKey:v5 value:v7 table:0];

      break;
    default:
      uint64_t v6 = 0;
      break;
  }

  return v6;
}

+ (CRLLineEnd)lineEndWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6
{
  BOOL v6 = a5;
  double y = a4.y;
  double x = a4.x;
  id v10 = a6;
  id v11 = [objc_alloc((Class)objc_opt_class()) initWithPath:a3 endPoint:v6 isFilled:v10 identifier:x y];

  return (CRLLineEnd *)v11;
}

+ (CRLLineEnd)lineEndWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7
{
  BOOL v7 = a6;
  double y = a5.y;
  double x = a5.x;
  id v12 = a7;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithPath:a3 wrapPath:a4 endPoint:v7 isFilled:v12 identifier:0 lineJoin:x, y];

  return (CRLLineEnd *)v13;
}

- (CRLLineEnd)initWithBezierPath:(id)a3 wrapPath:(id)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7 lineJoin:(int)a8
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CRLLineEnd;
  uint64_t v18 = [(CRLLineEnd *)&v26 init];
  if (v18)
  {
    uint64_t v19 = (NSString *)[v17 copy];
    identifier = v18->_identifier;
    v18->_identifier = v19;

    v18->_lineJoin = a8;
    uint64_t v21 = (CRLBezierPath *)[v15 copy];
    path = v18->_path;
    v18->_path = v21;

    v23 = (CRLBezierPath *)[v16 copy];
    wrapPath = v18->_wrapPath;
    v18->_wrapPath = v23;

    v18->_endPoint.CGFloat x = x;
    v18->_endPoint.CGFloat y = y;
    v18->_isFilled = a6;
  }

  return v18;
}

- (CRLLineEnd)initWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7 lineJoin:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  BOOL v9 = a6;
  double y = a5.y;
  double x = a5.x;
  id v15 = a7;
  if (a3)
  {
    a3 = +[CRLBezierPath bezierPathWithCGPath:a3];
  }
  if (a4)
  {
    a4 = +[CRLBezierPath bezierPathWithCGPath:a4];
  }
  id v16 = -[CRLLineEnd initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:](self, "initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, a4, v9, v15, v8, x, y);

  return v16;
}

- (CRLLineEnd)initWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6
{
  return -[CRLLineEnd initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:](self, "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, 0, a5, a6, 0, a4.x, a4.y);
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (CRLLineEnd *)a3;
  if (self == v4)
  {
    CFStringRef v5 = 0;
LABEL_10:
    unsigned __int8 v12 = 1;
    goto LABEL_16;
  }
  if (![(CRLLineEnd *)v4 isMemberOfClass:objc_opt_class()])
  {
    unsigned __int8 v12 = 0;
    CFStringRef v5 = 0;
    goto LABEL_16;
  }
  CFStringRef v5 = v4;
  if ([(NSString *)self->_identifier isEqualToString:@"none"])
  {
    BOOL v6 = [(CRLLineEnd *)v5 identifier];
    unsigned __int8 v7 = [v6 isEqualToString:@"none"];

    if (v7) {
      goto LABEL_10;
    }
  }
  int lineJoin = self->_lineJoin;
  if (lineJoin == [(CRLLineEnd *)v5 lineJoin])
  {
    identifier = self->_identifier;
    id v10 = [(CRLLineEnd *)v5 identifier];
    if ([(NSString *)identifier isEqualToString:v10])
    {
      path = self->_path;
      if ((unint64_t)path | (unint64_t)v5->_path) {
        unsigned __int8 v12 = -[CRLBezierPath isEqual:](path, "isEqual:");
      }
      else {
        unsigned __int8 v12 = 1;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }
LABEL_16:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  path = self->_path;
  wrapPath = self->_wrapPath;
  BOOL isFilled = self->_isFilled;
  identifier = self->_identifier;
  uint64_t lineJoin = self->_lineJoin;
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;

  return [v4 initWithBezierPath:path wrapPath:wrapPath endPoint:isFilled:identifier:lineJoin:x, y];
}

- (CGImage)newLineEndImageOnRight:(BOOL)a3 forContentsScale:(double)a4 withSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  BOOL v8 = a3;
  id v10 = sub_100455AA8(11, a5.width * a4, a5.height * a4);
  CGContextScaleCTM(v10, a4, a4);
  CGContextSetRGBFillColor(v10, 0.0, 0.0, 0.0, 1.0);
  CGContextSetRGBStrokeColor(v10, 0.0, 0.0, 0.0, 1.0);
  long long v11 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v32.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v32.c = v12;
  long long v13 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&v32.tCGFloat x = v13;
  double v14 = -width;
  if (v8)
  {
    *(_OWORD *)&transform.a = v11;
    *(_OWORD *)&transform.c = v12;
    *(_OWORD *)&transform.tCGFloat x = v13;
    CGAffineTransformScale(&v32, &transform, -1.0, 1.0);
    CGAffineTransform v30 = v32;
    CGAffineTransformTranslate(&transform, &v30, v14, 0.0);
    CGAffineTransform v32 = transform;
  }
  CGAffineTransform v30 = v32;
  CGAffineTransformTranslate(&transform, &v30, 3.0, 1.0);
  CGAffineTransform v32 = transform;
  if (![(CRLLineEnd *)self isFilled])
  {
    CGAffineTransform v30 = v32;
    CGAffineTransformTranslate(&transform, &v30, 0.5, 0.0);
    CGAffineTransform v32 = transform;
  }
  BoundingBoCGFloat x = CGPathGetBoundingBox([(CRLBezierPath *)self->_path CGPath]);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat v17 = BoundingBox.size.width;
  CGFloat v18 = BoundingBox.size.height;
  CGFloat MaxX = 0.0;
  if (CGRectGetMinX(BoundingBox) < 0.0)
  {
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.double width = v17;
    v34.size.double height = v18;
    CGFloat MaxX = CGRectGetMaxX(v34);
  }
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.double width = v17;
  v35.size.double height = v18;
  CGFloat MaxY = CGRectGetMaxY(v35);
  CGAffineTransform v30 = v32;
  CGAffineTransformTranslate(&transform, &v30, MaxY, MaxX);
  CGAffineTransform v32 = transform;
  CGAffineTransform v30 = transform;
  CGAffineTransformRotate(&transform, &v30, 1.57079633);
  CGAffineTransform v32 = transform;
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.double width = v17;
  v36.size.double height = v18;
  double v21 = CGRectGetHeight(v36);
  double v22 = 1.5;
  if (v21 * 1.5 > height)
  {
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.double width = v17;
    v37.size.double height = v18;
    double v22 = height / (CGRectGetHeight(v37) * 1.5) * 1.5;
  }
  CGAffineTransform v30 = v32;
  CGAffineTransformScale(&transform, &v30, v22, v22);
  CGAffineTransform v32 = transform;
  CGContextConcatCTM(v10, &transform);
  CGContextSetLineJoin(v10, (CGLineJoin)[(CRLLineEnd *)self lineJoin]);
  CGContextSetLineWidth(v10, 0.5);
  id v23 = [(CRLLineEnd *)self path];
  CGContextAddPath(v10, (CGPathRef)[v23 CGPath]);

  if ([(CRLLineEnd *)self isFilled]) {
    CGContextFillPath(v10);
  }
  else {
    CGContextStrokePath(v10);
  }
  [(CRLLineEnd *)self endPoint];
  CGFloat v25 = v24;
  [(CRLLineEnd *)self endPoint];
  CGContextMoveToPoint(v10, v25, v26 + 1.0);
  [(CRLLineEnd *)self endPoint];
  CGContextAddLineToPoint(v10, v27, v14);
  CGContextStrokePath(v10);
  Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  return Image;
}

- (CRLBezierPath)wrapPath
{
  wrapPath = self->_wrapPath;
  if (!wrapPath) {
    wrapPath = self->_path;
  }
  id v4 = [(CRLBezierPath *)wrapPath copy];

  return (CRLBezierPath *)v4;
}

- (BOOL)isNone
{
  int64_t v2 = [(CRLLineEnd *)self identifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"none"];

  return v3;
}

- (BOOL)isArrow
{
  unsigned __int8 v3 = [(CRLLineEnd *)self identifier];
  if ([v3 isEqualToString:@"simple arrow"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    CFStringRef v5 = [(CRLLineEnd *)self identifier];
    if ([v5 isEqualToString:@"open arrow"])
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      BOOL v6 = [(CRLLineEnd *)self identifier];
      unsigned __int8 v4 = [v6 isEqualToString:@"filled arrow"];
    }
  }

  return v4;
}

- (id)description
{
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  unsigned __int8 v4 = NSStringFromClass(v3);
  CFStringRef v5 = [(CRLLineEnd *)self identifier];
  BOOL v6 = +[NSString stringWithFormat:@"<%@ %p %@>", v4, self, v5];

  return v6;
}

- (double)scaleForStrokeWidth:(double)result
{
  if (result > 1.0) {
    return (result + -1.0) * 0.6 + 1.0;
  }
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CRLBezierPath)path
{
  return self->_path;
}

- (CGPoint)endPoint
{
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isFilled
{
  return self->_isFilled;
}

- (int)lineJoin
{
  return self->_lineJoin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_wrapPath, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end