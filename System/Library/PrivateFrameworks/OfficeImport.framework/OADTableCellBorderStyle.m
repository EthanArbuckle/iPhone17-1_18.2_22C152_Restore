@interface OADTableCellBorderStyle
+ (id)defaultAxisParallelStroke;
+ (id)defaultObliqueStroke;
+ (id)defaultStyle;
- (id)bottomLeftToTopRightStroke;
- (id)bottomStroke;
- (id)description;
- (id)horzInsideStroke;
- (id)leftStroke;
- (id)rightStroke;
- (id)shallowCopy;
- (id)stroke:(int)a3;
- (id)topLeftToBottomRightStroke;
- (id)topStroke;
- (id)vertInsideStroke;
- (void)applyOverridesFrom:(id)a3;
- (void)setBottomLeftToTopRightStroke:(id)a3;
- (void)setBottomStroke:(id)a3;
- (void)setHorzInsideStroke:(id)a3;
- (void)setLeftStroke:(id)a3;
- (void)setRightStroke:(id)a3;
- (void)setStrokeOfType:(int)a3 toValue:(id)a4;
- (void)setTopLeftToBottomRightStroke:(id)a3;
- (void)setTopStroke:(id)a3;
- (void)setVertInsideStroke:(id)a3;
@end

@implementation OADTableCellBorderStyle

- (void)setLeftStroke:(id)a3
{
}

- (void)setRightStroke:(id)a3
{
}

- (void)setTopStroke:(id)a3
{
}

- (void)setBottomStroke:(id)a3
{
}

- (void)setHorzInsideStroke:(id)a3
{
}

- (void)setVertInsideStroke:(id)a3
{
}

- (id)topStroke
{
  return self->mTopStroke;
}

- (id)bottomStroke
{
  return self->mBottomStroke;
}

- (id)horzInsideStroke
{
  return self->mHorzInsideStroke;
}

- (id)leftStroke
{
  return self->mLeftStroke;
}

- (id)rightStroke
{
  return self->mRightStroke;
}

- (id)vertInsideStroke
{
  return self->mVertInsideStroke;
}

- (id)stroke:(int)a3
{
  switch(a3)
  {
    case 1:
      v5 = [(OADTableCellBorderStyle *)self leftStroke];
      goto LABEL_13;
    case 2:
      v5 = [(OADTableCellBorderStyle *)self rightStroke];
      goto LABEL_13;
    case 3:
      v5 = [(OADTableCellBorderStyle *)self topStroke];
      goto LABEL_13;
    case 4:
      v5 = [(OADTableCellBorderStyle *)self bottomStroke];
      goto LABEL_13;
    case 5:
      v5 = [(OADTableCellBorderStyle *)self horzInsideStroke];
      goto LABEL_13;
    case 6:
      v5 = [(OADTableCellBorderStyle *)self vertInsideStroke];
      goto LABEL_13;
    case 7:
      v5 = [(OADTableCellBorderStyle *)self topLeftToBottomRightStroke];
      goto LABEL_13;
    case 8:
      v5 = [(OADTableCellBorderStyle *)self bottomLeftToTopRightStroke];
LABEL_13:
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)setStrokeOfType:(int)a3 toValue:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 1:
      [(OADTableCellBorderStyle *)self setLeftStroke:v6];
      break;
    case 2:
      [(OADTableCellBorderStyle *)self setRightStroke:v6];
      break;
    case 3:
      [(OADTableCellBorderStyle *)self setTopStroke:v6];
      break;
    case 4:
      [(OADTableCellBorderStyle *)self setBottomStroke:v6];
      break;
    case 5:
      [(OADTableCellBorderStyle *)self setHorzInsideStroke:v6];
      break;
    case 6:
      [(OADTableCellBorderStyle *)self setVertInsideStroke:v6];
      break;
    case 7:
      [(OADTableCellBorderStyle *)self setTopLeftToBottomRightStroke:v6];
      break;
    case 8:
      [(OADTableCellBorderStyle *)self setBottomLeftToTopRightStroke:v6];
      break;
    default:
      break;
  }
}

- (id)topLeftToBottomRightStroke
{
  return self->mTopLeftToBottomRightStroke;
}

- (void)setTopLeftToBottomRightStroke:(id)a3
{
}

- (id)bottomLeftToTopRightStroke
{
  return self->mBottomLeftToTopRightStroke;
}

- (void)setBottomLeftToTopRightStroke:(id)a3
{
}

+ (id)defaultAxisParallelStroke
{
  v2 = (void *)+[OADTableCellBorderStyle defaultAxisParallelStroke]::defaultAxisParallelStroke;
  if (!+[OADTableCellBorderStyle defaultAxisParallelStroke]::defaultAxisParallelStroke)
  {
    uint64_t v3 = +[OADStroke blackStroke];
    uint64_t v4 = [v3 copy];
    v5 = (void *)+[OADTableCellBorderStyle defaultAxisParallelStroke]::defaultAxisParallelStroke;
    +[OADTableCellBorderStyle defaultAxisParallelStroke]::defaultAxisParallelStroke = v4;

    LODWORD(v6) = 1.0;
    [(id)+[OADTableCellBorderStyle defaultAxisParallelStroke]::defaultAxisParallelStroke setWidth:v6];
    v2 = (void *)+[OADTableCellBorderStyle defaultAxisParallelStroke]::defaultAxisParallelStroke;
  }
  return v2;
}

+ (id)defaultObliqueStroke
{
  return +[OADStroke nullStroke];
}

+ (id)defaultStyle
{
  uint64_t v3 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
  if (!+[OADTableCellBorderStyle defaultStyle]::defaultStyle)
  {
    uint64_t v4 = objc_alloc_init(OADTableCellBorderStyle);
    v5 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    +[OADTableCellBorderStyle defaultStyle]::defaultStyle = (uint64_t)v4;

    double v6 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    v7 = [a1 defaultAxisParallelStroke];
    [v6 setLeftStroke:v7];

    v8 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    v9 = [a1 defaultAxisParallelStroke];
    [v8 setRightStroke:v9];

    v10 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    v11 = [a1 defaultAxisParallelStroke];
    [v10 setTopStroke:v11];

    v12 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    v13 = [a1 defaultAxisParallelStroke];
    [v12 setBottomStroke:v13];

    v14 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    v15 = [a1 defaultAxisParallelStroke];
    [v14 setHorzInsideStroke:v15];

    v16 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    v17 = [a1 defaultAxisParallelStroke];
    [v16 setVertInsideStroke:v17];

    v18 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    v19 = [a1 defaultObliqueStroke];
    [v18 setTopLeftToBottomRightStroke:v19];

    v20 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    v21 = [a1 defaultObliqueStroke];
    [v20 setBottomLeftToTopRightStroke:v21];

    uint64_t v3 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
  }
  return v3;
}

- (id)shallowCopy
{
  uint64_t v3 = objc_alloc_init(OADTableCellBorderStyle);
  uint64_t v4 = [(OADTableCellBorderStyle *)self leftStroke];
  [(OADTableCellBorderStyle *)v3 setLeftStroke:v4];

  v5 = [(OADTableCellBorderStyle *)self rightStroke];
  [(OADTableCellBorderStyle *)v3 setRightStroke:v5];

  double v6 = [(OADTableCellBorderStyle *)self topStroke];
  [(OADTableCellBorderStyle *)v3 setTopStroke:v6];

  v7 = [(OADTableCellBorderStyle *)self bottomStroke];
  [(OADTableCellBorderStyle *)v3 setBottomStroke:v7];

  v8 = [(OADTableCellBorderStyle *)self horzInsideStroke];
  [(OADTableCellBorderStyle *)v3 setHorzInsideStroke:v8];

  v9 = [(OADTableCellBorderStyle *)self vertInsideStroke];
  [(OADTableCellBorderStyle *)v3 setVertInsideStroke:v9];

  v10 = [(OADTableCellBorderStyle *)self topLeftToBottomRightStroke];
  [(OADTableCellBorderStyle *)v3 setTopLeftToBottomRightStroke:v10];

  v11 = [(OADTableCellBorderStyle *)self bottomLeftToTopRightStroke];
  [(OADTableCellBorderStyle *)v3 setBottomLeftToTopRightStroke:v11];

  return v3;
}

- (void)applyOverridesFrom:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v21 = v4;
    v5 = [v4 leftStroke];

    if (v5)
    {
      double v6 = [v21 leftStroke];
      [(OADTableCellBorderStyle *)self setLeftStroke:v6];
    }
    v7 = [v21 rightStroke];

    if (v7)
    {
      v8 = [v21 rightStroke];
      [(OADTableCellBorderStyle *)self setRightStroke:v8];
    }
    v9 = [v21 topStroke];

    if (v9)
    {
      v10 = [v21 topStroke];
      [(OADTableCellBorderStyle *)self setTopStroke:v10];
    }
    v11 = [v21 bottomStroke];

    if (v11)
    {
      v12 = [v21 bottomStroke];
      [(OADTableCellBorderStyle *)self setBottomStroke:v12];
    }
    v13 = [v21 horzInsideStroke];

    if (v13)
    {
      v14 = [v21 horzInsideStroke];
      [(OADTableCellBorderStyle *)self setHorzInsideStroke:v14];
    }
    v15 = [v21 vertInsideStroke];

    if (v15)
    {
      v16 = [v21 vertInsideStroke];
      [(OADTableCellBorderStyle *)self setVertInsideStroke:v16];
    }
    v17 = [v21 topLeftToBottomRightStroke];

    if (v17)
    {
      v18 = [v21 topLeftToBottomRightStroke];
      [(OADTableCellBorderStyle *)self setTopLeftToBottomRightStroke:v18];
    }
    v19 = [v21 bottomLeftToTopRightStroke];

    id v4 = v21;
    if (v19)
    {
      v20 = [v21 bottomLeftToTopRightStroke];
      [(OADTableCellBorderStyle *)self setBottomLeftToTopRightStroke:v20];

      id v4 = v21;
    }
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTableCellBorderStyle;
  v2 = [(OADTableCellBorderStyle *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBottomLeftToTopRightStroke, 0);
  objc_storeStrong((id *)&self->mTopLeftToBottomRightStroke, 0);
  objc_storeStrong((id *)&self->mVertInsideStroke, 0);
  objc_storeStrong((id *)&self->mHorzInsideStroke, 0);
  objc_storeStrong((id *)&self->mBottomStroke, 0);
  objc_storeStrong((id *)&self->mTopStroke, 0);
  objc_storeStrong((id *)&self->mRightStroke, 0);
  objc_storeStrong((id *)&self->mLeftStroke, 0);
}

@end