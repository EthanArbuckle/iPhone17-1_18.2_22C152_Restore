@interface THWDrawablesWidgetInfo
- (BOOL)containerWrap;
- (BOOL)isExpandedOnly;
- (Class)layoutClass;
- (Class)repClass;
- (THWDrawablesWidgetInfo)initWithContext:(id)a3 geometry:(id)a4;
- (THWWidgetAdornmentInfo)adornmentInfo;
- (TSDInfo)expandedStageDrawable;
- (TSDInfo)stageDrawable;
- (TSWPopUpInfo)popUpInfo;
- (id)childEnumerator;
- (id)childInfos;
- (void)dealloc;
- (void)setAdornmentInfo:(id)a3;
- (void)setContainerWrap:(BOOL)a3;
- (void)setExpandedOnly:(BOOL)a3;
- (void)setExpandedStageDrawable:(id)a3;
- (void)setStageDrawable:(id)a3;
@end

@implementation THWDrawablesWidgetInfo

- (THWDrawablesWidgetInfo)initWithContext:(id)a3 geometry:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THWDrawablesWidgetInfo;
  result = [(THWDrawablesWidgetInfo *)&v5 initWithContext:a3 geometry:a4];
  if (result) {
    result->_containerWrap = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWDrawablesWidgetInfo;
  [(THWDrawablesWidgetInfo *)&v3 dealloc];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (void)setStageDrawable:(id)a3
{
  stageDrawable = self->_stageDrawable;
  if (stageDrawable != a3)
  {
    [(TSDInfo *)stageDrawable setParentInfo:0];

    v6 = (TSDInfo *)a3;
    self->_stageDrawable = v6;
    [(TSDInfo *)v6 setParentInfo:self];
    v7 = (void *)TSUProtocolCast();
    v8 = [(THWDrawablesWidgetInfo *)self adornmentInfo];
    [v7 setPanelContentProvider:v8];
  }
}

- (void)setExpandedStageDrawable:(id)a3
{
  expandedStageDrawable = self->_expandedStageDrawable;
  if (expandedStageDrawable != a3)
  {
    [(TSDInfo *)expandedStageDrawable setParentInfo:0];

    v6 = (TSDInfo *)a3;
    self->_expandedStageDrawable = v6;
    [(TSDInfo *)v6 setParentInfo:self];
    v7 = (void *)TSUProtocolCast();
    v8 = [(THWDrawablesWidgetInfo *)self adornmentInfo];
    [v7 setPanelContentProvider:v8];
  }
}

- (void)setAdornmentInfo:(id)a3
{
  adornmentInfo = self->_adornmentInfo;
  if (adornmentInfo != a3)
  {

    self->_adornmentInfo = (THWWidgetAdornmentInfo *)a3;
    [TSUProtocolCast() setPanelContentProvider:[self adornmentInfo]];
    v6 = (void *)TSUProtocolCast();
    v7 = [(THWDrawablesWidgetInfo *)self adornmentInfo];
    [v6 setPanelContentProvider:v7];
  }
}

- (id)childInfos
{
  objc_super v3 = [(THWDrawablesWidgetInfo *)self adornmentInfo];
  if ([(THWDrawablesWidgetInfo *)self stageDrawable])
  {
    v6 = [(THWDrawablesWidgetInfo *)self stageDrawable];
    v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    v4 = (NSArray *)&__NSArray0__struct;
  }
  return [(THWWidgetAdornmentInfo *)v3 interleavedInfosWithInfos:v4];
}

- (TSWPopUpInfo)popUpInfo
{
  [(THWDrawablesWidgetInfo *)self stageDrawable];
  v2 = (void *)TSUProtocolCast();

  return (TSWPopUpInfo *)[v2 popUpInfo];
}

- (id)childEnumerator
{
  id v2 = [(THWDrawablesWidgetInfo *)self childInfos];

  return [v2 objectEnumerator];
}

- (BOOL)isExpandedOnly
{
  return self->expandedOnly;
}

- (void)setExpandedOnly:(BOOL)a3
{
  self->expandedOnly = a3;
}

- (THWWidgetAdornmentInfo)adornmentInfo
{
  return self->_adornmentInfo;
}

- (TSDInfo)stageDrawable
{
  return self->_stageDrawable;
}

- (TSDInfo)expandedStageDrawable
{
  return self->_expandedStageDrawable;
}

- (BOOL)containerWrap
{
  return self->_containerWrap;
}

- (void)setContainerWrap:(BOOL)a3
{
  self->_containerWrap = a3;
}

@end