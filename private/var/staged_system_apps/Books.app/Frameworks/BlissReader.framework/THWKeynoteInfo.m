@interface THWKeynoteInfo
- (BOOL)showTransportControls;
- (Class)layoutClass;
- (Class)repClass;
- (NSString)progressKitID;
- (NSString)progressKitSectionID;
- (THWAutoplayConfig)autoplayConfig;
- (THWKeynoteInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 showInfo:(id)a6 adornmentInfo:(id)a7 showTransportControls:(BOOL)a8 autoPlayConfig:(id)a9;
- (THWKeynoteShowInfo)showInfo;
- (THWWidgetAdornmentInfo)adornmentInfo;
- (id)childEnumerator;
- (id)childInfos;
- (void)dealloc;
- (void)setAdornmentInfo:(id)a3;
- (void)setAutoplayConfig:(id)a3;
- (void)setProgressKitID:(id)a3;
- (void)setProgressKitSectionID:(id)a3;
- (void)setShowInfo:(id)a3;
- (void)setShowTransportControls:(BOOL)a3;
@end

@implementation THWKeynoteInfo

- (THWKeynoteInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 showInfo:(id)a6 adornmentInfo:(id)a7 showTransportControls:(BOOL)a8 autoPlayConfig:(id)a9
{
  BOOL v9 = a8;
  v15.receiver = self;
  v15.super_class = (Class)THWKeynoteInfo;
  v12 = -[THWKeynoteInfo initWithContext:geometry:](&v15, "initWithContext:geometry:", a3, a4, a5);
  v13 = v12;
  if (v12)
  {
    [(THWKeynoteInfo *)v12 setShowInfo:a6];
    [(THWKeynoteInfo *)v13 setAdornmentInfo:a7];
    [(THWKeynoteInfo *)v13 setShowTransportControls:v9];
    [(THWKeynoteInfo *)v13 setAutoplayConfig:a9];
    [a7 updateParentInfo:v13];
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteInfo;
  [(THWKeynoteInfo *)&v3 dealloc];
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
  adornmentInfo = self->_adornmentInfo;
  showInfo = (NSArray *)self->_showInfo;
  if (showInfo) {
    showInfo = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:");
  }

  return [(THWWidgetAdornmentInfo *)adornmentInfo interleavedInfosWithInfos:showInfo];
}

- (id)childEnumerator
{
  id v2 = [(THWKeynoteInfo *)self childInfos];

  return [v2 objectEnumerator];
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
}

- (THWWidgetAdornmentInfo)adornmentInfo
{
  return self->_adornmentInfo;
}

- (void)setAdornmentInfo:(id)a3
{
}

- (THWKeynoteShowInfo)showInfo
{
  return self->_showInfo;
}

- (void)setShowInfo:(id)a3
{
}

- (BOOL)showTransportControls
{
  return self->_showTransportControls;
}

- (void)setShowTransportControls:(BOOL)a3
{
  self->_showTransportControls = a3;
}

- (THWAutoplayConfig)autoplayConfig
{
  return self->_autoplayConfig;
}

- (void)setAutoplayConfig:(id)a3
{
}

@end