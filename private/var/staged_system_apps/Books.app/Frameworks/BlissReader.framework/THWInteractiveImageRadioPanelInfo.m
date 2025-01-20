@interface THWInteractiveImageRadioPanelInfo
- (Class)layoutClass;
- (Class)repClass;
- (THWInteractiveImageRadioPanelInfo)initWithGeometry:(id)a3 widgetInfo:(id)a4;
- (THWInteractiveImageWidgetInfo)widgetInfo;
- (id)childInfos;
- (void)setWidgetInfo:(id)a3;
@end

@implementation THWInteractiveImageRadioPanelInfo

- (THWInteractiveImageRadioPanelInfo)initWithGeometry:(id)a3 widgetInfo:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THWInteractiveImageRadioPanelInfo;
  v5 = [(THWInteractiveImageRadioPanelInfo *)&v8 initWithContext:0 geometry:a3];
  v6 = v5;
  if (v5) {
    [(THWInteractiveImageRadioPanelInfo *)v5 setWidgetInfo:a4];
  }
  return v6;
}

- (id)childInfos
{
  return +[NSArray array];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (THWInteractiveImageWidgetInfo)widgetInfo
{
  return self->mWidgetInfo;
}

- (void)setWidgetInfo:(id)a3
{
  self->mWidgetInfo = (THWInteractiveImageWidgetInfo *)a3;
}

@end