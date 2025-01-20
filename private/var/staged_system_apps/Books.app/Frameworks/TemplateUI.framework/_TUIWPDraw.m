@interface _TUIWPDraw
- (BOOL)clipContainerForCrossfade;
- (BOOL)enableContext;
- (BOOL)isEqualToDraw:(id)a3;
- (CAFilter)compositingFilter;
- (NSArray)columns;
- (NSString)compositingFilterType;
- (UIColor)shadingColor;
- (_TUIWPDraw)initWithColumns:(id)a3 yOffset:(double)a4 compositingFilterType:(id)a5;
- (double)yOffset;
- (void)drawInContext:(CGContext *)a3;
- (void)setYOffset:(double)a3;
@end

@implementation _TUIWPDraw

- (_TUIWPDraw)initWithColumns:(id)a3 yOffset:(double)a4 compositingFilterType:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_TUIWPDraw;
  v11 = [(_TUIWPDraw *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_columns, a3);
    v12->_yOffset = a4;
    v13 = (NSString *)[v10 copy];
    compositingFilterType = v12->_compositingFilterType;
    v12->_compositingFilterType = v13;

    id v15 = +[TSWPColumn computeSingleColorWithColumns:v9];
    if (v15)
    {
      uint64_t v16 = +[UIColor colorWithCGColor:v15];
      shadingColor = v12->_shadingColor;
      v12->_shadingColor = (UIColor *)v16;
    }
  }

  return v12;
}

- (CAFilter)compositingFilter
{
  if (self->_compositingFilterType)
  {
    v2 = +[CAFilter filterWithType:](CAFilter, "filterWithType:");
  }
  else
  {
    v2 = 0;
  }

  return (CAFilter *)v2;
}

- (BOOL)enableContext
{
  return 0;
}

- (BOOL)isEqualToDraw:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  v7 = v6;
  v8 = v7;
  if (v7 == self) {
    goto LABEL_13;
  }
  if (v7)
  {
    if (self->_columns == v7->_columns && self->_yOffset == v7->_yOffset)
    {
      shadingColor = self->_shadingColor;
      if (shadingColor == v8->_shadingColor || -[UIColor isEqual:](shadingColor, "isEqual:"))
      {
        compositingFilterType = self->_compositingFilterType;
        if (compositingFilterType != v8->_compositingFilterType)
        {
          unsigned __int8 v9 = -[NSString isEqual:](compositingFilterType, "isEqual:");
          goto LABEL_14;
        }
LABEL_13:
        unsigned __int8 v9 = 1;
        goto LABEL_14;
      }
    }
  }
  unsigned __int8 v9 = 0;
LABEL_14:

  return v9;
}

- (void)drawInContext:(CGContext *)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_B32D0;
  v3[3] = &unk_251A30;
  v3[4] = self;
  v3[5] = a3;
  TUIPlatformRenderInContext(a3, v3);
}

- (BOOL)clipContainerForCrossfade
{
  return 1;
}

- (UIColor)shadingColor
{
  return self->_shadingColor;
}

- (NSArray)columns
{
  return self->_columns;
}

- (double)yOffset
{
  return self->_yOffset;
}

- (void)setYOffset:(double)a3
{
  self->_yOffset = a3;
}

- (NSString)compositingFilterType
{
  return self->_compositingFilterType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositingFilterType, 0);
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_shadingColor, 0);
}

@end