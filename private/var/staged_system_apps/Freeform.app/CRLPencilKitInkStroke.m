@interface CRLPencilKitInkStroke
+ (BOOL)isMoreOptimalToDrawWithOtherStrokesIfPossible;
+ (BOOL)requiresCustomBoundsMeasurement;
+ (CGRect)boundsOfStrokes:(id)a3;
+ (Class)mutableClass;
+ (double)adjustedStrokeWidthFromWidth:(double)a3 forInkType:(id)a4;
+ (double)unadjustedStrokeWidthFromAdjustedWidth:(double)a3 forInkType:(id)a4;
+ (void)drawStrokes:(id)a3 inContext:(CGContext *)a4 overTransparentCanvas:(BOOL)a5;
- (BOOL)canDrawWithOtherStroke:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFountainPenInkV2;
- (BOOL)shouldRender;
- (CRLPencilKitInkStroke)initWithInk:(id)a3 adjustedWidth:(double)a4;
- (CRLPencilKitInkStroke)initWithInk:(id)a3 unadjustedPencilKitWidth:(double)a4;
- (CRLPencilKitInkStroke)initWithInkType:(id)a3 color:(id)a4 adjustedWidth:(double)a5;
- (CRLPencilKitInkStroke)initWithInkType:(id)a3 color:(id)a4 adjustedWidth:(double)a5 isFountainPenInkV2:(BOOL)a6;
- (CRLPencilKitInkStroke)initWithInkType:(id)a3 color:(id)a4 unadjustedPencilKitWidth:(double)a5;
- (CRLSmartStroke)fallbackSmartStrokeForPersistence;
- (NSString)inkType;
- (double)widthForDefaultAndDowngradePersistence;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8;
@end

@implementation CRLPencilKitInkStroke

- (CRLPencilKitInkStroke)initWithInkType:(id)a3 color:(id)a4 adjustedWidth:(double)a5 isFountainPenInkV2:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = +[CRLStrokePattern solidPattern];
  if (([v11 isEqualToString:PKInkTypePencil] & 1) != 0
    || [v11 isEqualToString:PKInkTypeCrayon])
  {
    uint64_t v14 = 0;
    double v15 = 1.0;
  }
  else
  {
    double v15 = 4.0;
    uint64_t v14 = 1;
  }
  v19.receiver = self;
  v19.super_class = (Class)CRLPencilKitInkStroke;
  v16 = [(CRLStroke *)&v19 initWithColor:v12 width:1 cap:v14 join:v13 pattern:a5 miterLimit:v15];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_inkType, a3);
    v17->_isFountainPenInkV2 = a6;
  }

  return v17;
}

- (CRLPencilKitInkStroke)initWithInkType:(id)a3 color:(id)a4 adjustedWidth:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = -[CRLPencilKitInkStroke initWithInkType:color:adjustedWidth:isFountainPenInkV2:](self, "initWithInkType:color:adjustedWidth:isFountainPenInkV2:", v9, v8, [v9 isEqualToString:PKInkTypeFountainPen], a5);

  return v10;
}

- (CRLPencilKitInkStroke)initWithInkType:(id)a3 color:(id)a4 unadjustedPencilKitWidth:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  +[CRLPencilKitInkStroke adjustedStrokeWidthFromWidth:v9 forInkType:a5];
  id v11 = -[CRLPencilKitInkStroke initWithInkType:color:adjustedWidth:isFountainPenInkV2:](self, "initWithInkType:color:adjustedWidth:isFountainPenInkV2:", v9, v8, [v9 isEqualToString:PKInkTypeFountainPen], v10);

  return v11;
}

- (CRLPencilKitInkStroke)initWithInk:(id)a3 adjustedWidth:(double)a4
{
  id v6 = a3;
  v7 = [v6 color];
  id v8 = +[CRLColor colorWithUIColor:v7];

  id v9 = [v6 _isFountainPenInkV2];
  double v10 = [v6 inkType];

  id v11 = [(CRLPencilKitInkStroke *)self initWithInkType:v10 color:v8 adjustedWidth:v9 isFountainPenInkV2:a4];
  return v11;
}

- (CRLPencilKitInkStroke)initWithInk:(id)a3 unadjustedPencilKitWidth:(double)a4
{
  id v6 = a3;
  v7 = [v6 inkType];
  +[CRLPencilKitInkStroke adjustedStrokeWidthFromWidth:v7 forInkType:a4];
  double v9 = v8;

  double v10 = [(CRLPencilKitInkStroke *)self initWithInk:v6 adjustedWidth:v9];
  return v10;
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)requiresCustomBoundsMeasurement
{
  return 1;
}

+ (BOOL)isMoreOptimalToDrawWithOtherStrokesIfPossible
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CRLMutablePencilKitInkStroke alloc];
  v5 = [(CRLPencilKitInkStroke *)self inkType];
  id v6 = [(CRLStroke *)self color];
  [(CRLStroke *)self width];
  v7 = -[CRLPencilKitInkStroke initWithInkType:color:adjustedWidth:](v4, "initWithInkType:color:adjustedWidth:", v5, v6);

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(CRLPencilKitInkStroke *)self inkType];
  [(CRLStroke *)self width];
  v7 = +[NSString stringWithFormat:@"<%@ %p inkType='%@' width=%f>", v4, self, v5, v6];

  return v7;
}

- (BOOL)shouldRender
{
  return 1;
}

- (BOOL)canDrawWithOtherStroke:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CRLSmartStroke)fallbackSmartStrokeForPersistence
{
  id v3 = [(CRLPencilKitInkStroke *)self inkType];
  unsigned int v4 = [v3 isEqualToString:PKInkTypePencil];

  if (v4)
  {
    v5 = &off_1014E2958;
LABEL_5:
    double v8 = *v5;
    double v9 = [(CRLStroke *)self color];
    [(CRLStroke *)self i_width];
    double v10 = +[CRLSmartStroke strokeWithName:color:width:](CRLBrushStroke, "strokeWithName:color:width:", v8, v9);

    goto LABEL_7;
  }
  uint64_t v6 = [(CRLPencilKitInkStroke *)self inkType];
  unsigned int v7 = [v6 isEqualToString:PKInkTypeCrayon];

  if (v7)
  {
    v5 = &off_1014E2960;
    goto LABEL_5;
  }
  double v10 = 0;
LABEL_7:

  return (CRLSmartStroke *)v10;
}

- (double)widthForDefaultAndDowngradePersistence
{
  v8.receiver = self;
  v8.super_class = (Class)CRLPencilKitInkStroke;
  [(CRLStroke *)&v8 widthForDefaultAndDowngradePersistence];
  double v4 = v3;
  v5 = [(CRLPencilKitInkStroke *)self inkType];
  unsigned int v6 = [v5 isEqualToString:PKInkTypeWatercolor];

  double result = v4 * 0.25;
  if (!v6) {
    return v4;
  }
  return result;
}

+ (double)adjustedStrokeWidthFromWidth:(double)a3 forInkType:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:PKInkTypeMonoline])
  {
    a3 = a3 + a3;
  }
  else if (([v5 isEqualToString:PKInkTypePen] & 1) != 0 {
         || ([v5 isEqualToString:PKInkTypeCrayon] & 1) != 0
  }
         || [v5 isEqualToString:PKInkTypeMarker])
  {
    double v6 = sub_100407E48((a3 + -5.0) / 21.0, 0.0, 1.0);
    a3 = sub_100407E68(1.0, 0.5, v6) * a3;
  }

  return a3;
}

+ (double)unadjustedStrokeWidthFromAdjustedWidth:(double)a3 forInkType:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:PKInkTypeMonoline])
  {
    double v6 = a3 * 0.5;
  }
  else
  {
    if (([v5 isEqualToString:PKInkTypePen] & 1) == 0
      && ([v5 isEqualToString:PKInkTypeCrayon] & 1) == 0
      && ![v5 isEqualToString:PKInkTypeMarker])
    {
      goto LABEL_11;
    }
    double v6 = 0.0;
    if (a3 < 0.0) {
      goto LABEL_14;
    }
    if (a3 <= 5.0)
    {
LABEL_11:
      double v6 = a3;
      goto LABEL_14;
    }
    if (a3 <= 13.0)
    {
      double v6 = (47.0 - sqrt(a3 * -168.0 + 2209.0)) * 0.5;
    }
    else if (a3 <= 13.1488095)
    {
      double v6 = 23.5;
    }
    else
    {
      double v6 = a3 + a3;
    }
  }
LABEL_14:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = sub_1002469D0(v5, v4);

  if (v6
    && ([v6 inkType],
        unsigned int v7 = objc_claimAutoreleasedReturnValue(),
        [(CRLPencilKitInkStroke *)self inkType],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v7 isEqual:v8],
        v8,
        v7,
        v9))
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLPencilKitInkStroke;
    BOOL v10 = [(CRLStroke *)&v12 isEqual:v6];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)CRLPencilKitInkStroke;
  unint64_t v3 = [(CRLStroke *)&v7 hash];
  id v4 = [(CRLPencilKitInkStroke *)self inkType];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

+ (CGRect)boundsOfStrokes:(id)a3
{
  id v3 = a3;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v11) renderBounds];
        v29.origin.CGFloat x = v12;
        v29.origin.CGFloat y = v13;
        v29.size.CGFloat width = v14;
        v29.size.CGFloat height = v15;
        v25.origin.CGFloat x = x;
        v25.origin.CGFloat y = y;
        v25.size.CGFloat width = width;
        v25.size.CGFloat height = height;
        CGRect v26 = CGRectUnion(v25, v29);
        CGFloat x = v26.origin.x;
        CGFloat y = v26.origin.y;
        CGFloat width = v26.size.width;
        CGFloat height = v26.size.height;
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  if (CGRectIsNull(v27))
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011501C;
  block[3] = &unk_1014CC280;
  id v9 = &stru_1014D6FC8;
  if (qword_1016A90C8 != -1) {
    dispatch_once(&qword_1016A90C8, block);
  }
}

+ (void)drawStrokes:(id)a3 inContext:(CGContext *)a4 overTransparentCanvas:(BOOL)a5
{
}

- (NSString)inkType
{
  return self->_inkType;
}

- (BOOL)isFountainPenInkV2
{
  return self->_isFountainPenInkV2;
}

- (void).cxx_destruct
{
}

@end