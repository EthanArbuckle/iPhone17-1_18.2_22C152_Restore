@interface THWGutterInfo
- (CGRect)stageFrame;
- (Class)layoutClass;
- (Class)repClass;
- (TSDDrawableInfo)stageInfo;
- (TSDInfo)associatedInfo;
- (TSDInfo)expandedDrawableToPresent;
- (TSDShapeInfo)backgroundShape;
- (TSWPShapeInfo)titleShape;
- (TSWPopUpInfo)popUpInfo;
- (int64_t)gutterOrderCompare:(id)a3;
- (unint64_t)gutterOrder;
- (void)dealloc;
- (void)setAssociatedInfo:(id)a3;
- (void)setBackgroundShape:(id)a3;
- (void)setExpandedDrawableToPresent:(id)a3;
- (void)setGutterOrder:(unint64_t)a3;
- (void)setStageInfo:(id)a3;
- (void)setTitleShape:(id)a3;
@end

@implementation THWGutterInfo

- (void)dealloc
{
  [(THWGutterInfo *)self setAssociatedInfo:0];
  [(THWGutterInfo *)self setStageInfo:0];
  [(THWGutterInfo *)self setBackgroundShape:0];
  [(THWGutterInfo *)self setTitleShape:0];
  [(THWGutterInfo *)self setExpandedDrawableToPresent:0];
  v3.receiver = self;
  v3.super_class = (Class)THWGutterInfo;
  [(THWGutterInfo *)&v3 dealloc];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (CGRect)stageFrame
{
  id v2 = [(TSDDrawableInfo *)[(THWGutterInfo *)self stageInfo] geometry];
  if (v2)
  {
    objc_super v3 = v2;
    [v2 position];
    [v3 size];
    TSDRectWithOriginAndSize();
    TSDRoundedRectForMainScreen();
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (int64_t)gutterOrderCompare:(id)a3
{
  unint64_t v4 = [(THWGutterInfo *)self gutterOrder];
  id v5 = [a3 gutterOrder];
  int64_t v6 = -1;
  if (v4 >= (unint64_t)v5) {
    int64_t v6 = 1;
  }
  if ((id)v4 == v5) {
    return 0;
  }
  else {
    return v6;
  }
}

- (TSWPopUpInfo)popUpInfo
{
  [(THWGutterInfo *)self associatedInfo];
  id v2 = (void *)TSUProtocolCast();

  return (TSWPopUpInfo *)[v2 popUpInfo];
}

- (TSDInfo)associatedInfo
{
  return self->mAssociatedInfo;
}

- (void)setAssociatedInfo:(id)a3
{
}

- (TSDInfo)expandedDrawableToPresent
{
  return self->mExpandedDrawableToPresent;
}

- (void)setExpandedDrawableToPresent:(id)a3
{
}

- (TSDDrawableInfo)stageInfo
{
  return self->mStageInfo;
}

- (void)setStageInfo:(id)a3
{
}

- (TSDShapeInfo)backgroundShape
{
  return self->mBackgroundShape;
}

- (void)setBackgroundShape:(id)a3
{
}

- (TSWPShapeInfo)titleShape
{
  return self->mTitleShape;
}

- (void)setTitleShape:(id)a3
{
}

- (unint64_t)gutterOrder
{
  return self->mGutterOrder;
}

- (void)setGutterOrder:(unint64_t)a3
{
  self->mGutterOrder = a3;
}

@end