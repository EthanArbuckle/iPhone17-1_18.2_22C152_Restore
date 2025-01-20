@interface THWAnchoredWidgetInfo
- (Class)layoutClass;
- (Class)repClass;
- (THWAnchoredWidgetInfo)initWithContext:(id)a3 widgetInfo:(id)a4;
- (THWWidgetInfo)widgetInfo;
- (id)childInfos;
- (void)dealloc;
@end

@implementation THWAnchoredWidgetInfo

- (THWAnchoredWidgetInfo)initWithContext:(id)a3 widgetInfo:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THWAnchoredWidgetInfo;
  v5 = [(THWAnchoredWidgetInfo *)&v8 initWithContext:a3];
  if (v5)
  {
    v6 = (THWWidgetInfo *)a4;
    v5->_widgetInfo = v6;
    [(THWWidgetInfo *)v6 setParentInfo:v5];
  }
  return v5;
}

- (void)dealloc
{
  [(THWWidgetInfo *)self->_widgetInfo setParentInfo:0];

  v3.receiver = self;
  v3.super_class = (Class)THWAnchoredWidgetInfo;
  [(THWAnchoredWidgetInfo *)&v3 dealloc];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (id)childInfos
{
  return 0;
}

- (THWWidgetInfo)widgetInfo
{
  return self->_widgetInfo;
}

@end