@interface THImageInfo
- (Class)layoutClass;
- (Class)repClass;
- (THWPanelContentProvider)panelContentProvider;
- (TSWPopUpInfo)popUpInfo;
- (void)dealloc;
- (void)setPanelContentProvider:(id)a3;
- (void)setPopUpInfo:(id)a3;
@end

@implementation THImageInfo

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THImageInfo;
  [(THImageInfo *)&v3 dealloc];
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (void)setPopUpInfo:(id)a3
{
  mPopUpInfo = self->mPopUpInfo;
  if (mPopUpInfo != a3)
  {

    self->mPopUpInfo = (TSWPopUpInfo *)a3;
  }
}

- (TSWPopUpInfo)popUpInfo
{
  return self->mPopUpInfo;
}

- (THWPanelContentProvider)panelContentProvider
{
  return self->_panelContentProvider;
}

- (void)setPanelContentProvider:(id)a3
{
  self->_panelContentProvider = (THWPanelContentProvider *)a3;
}

@end