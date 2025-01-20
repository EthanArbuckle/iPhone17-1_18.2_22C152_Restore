@interface PUPhotoEditPerfHUD
- (BOOL)isFirstSinceBoot;
- (BOOL)isFirstSinceLaunch;
- (NSString)detailText;
- (PUPhotoEditPerfHUD)initWithCoder:(id)a3;
- (PUPhotoEditPerfHUD)initWithFrame:(CGRect)a3;
- (PXHUDBoxedValueVisualization)firstSinceBootVisualization;
- (PXHUDBoxedValueVisualization)firstSinceLaunchVisualization;
- (PXHUDTimeIntervalVisualization)autoCalcVisualization;
- (PXHUDTimeIntervalVisualization)enterEditVisualization;
- (PXHUDTimeIntervalVisualization)exitEditVisualization;
- (PXHUDTimeIntervalVisualization)filterVisualization;
- (PXHUDTimeIntervalVisualization)resourceCheckingVisualization;
- (PXHUDTimeIntervalVisualization)resourceDownloadVisualization;
- (PXHUDTimeIntervalVisualization)resourceLoadingVisualization;
- (PXHUDView)hudView;
- (PXHUDVisualization)detailVisualization;
- (PXTimeInterval)autoCalcInterval;
- (PXTimeInterval)enterEditTimeInterval;
- (PXTimeInterval)exitEditTimeInterval;
- (PXTimeInterval)filterInterval;
- (PXTimeInterval)resourceCheckingInterval;
- (PXTimeInterval)resourceDownloadInterval;
- (PXTimeInterval)resourceLoadingInterval;
- (void)setAutoCalcInterval:(id)a3;
- (void)setAutoCalcVisualization:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setDetailVisualization:(id)a3;
- (void)setEnterEditTimeInterval:(id)a3;
- (void)setEnterEditVisualization:(id)a3;
- (void)setExitEditTimeInterval:(id)a3;
- (void)setExitEditVisualization:(id)a3;
- (void)setFilterInterval:(id)a3;
- (void)setFilterVisualization:(id)a3;
- (void)setFirstSinceBoot:(BOOL)a3;
- (void)setFirstSinceBootVisualization:(id)a3;
- (void)setFirstSinceLaunch:(BOOL)a3;
- (void)setFirstSinceLaunchVisualization:(id)a3;
- (void)setHudView:(id)a3;
- (void)setResourceCheckingInterval:(id)a3;
- (void)setResourceCheckingVisualization:(id)a3;
- (void)setResourceDownloadInterval:(id)a3;
- (void)setResourceDownloadVisualization:(id)a3;
- (void)setResourceLoadingInterval:(id)a3;
- (void)setResourceLoadingVisualization:(id)a3;
@end

@implementation PUPhotoEditPerfHUD

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitEditVisualization, 0);
  objc_storeStrong((id *)&self->_filterVisualization, 0);
  objc_storeStrong((id *)&self->_autoCalcVisualization, 0);
  objc_storeStrong((id *)&self->_resourceDownloadVisualization, 0);
  objc_storeStrong((id *)&self->_resourceCheckingVisualization, 0);
  objc_storeStrong((id *)&self->_resourceLoadingVisualization, 0);
  objc_storeStrong((id *)&self->_enterEditVisualization, 0);
  objc_storeStrong((id *)&self->_firstSinceLaunchVisualization, 0);
  objc_storeStrong((id *)&self->_firstSinceBootVisualization, 0);
  objc_storeStrong((id *)&self->_detailVisualization, 0);
  objc_storeStrong((id *)&self->_hudView, 0);
  objc_storeStrong((id *)&self->_exitEditTimeInterval, 0);
  objc_storeStrong((id *)&self->_filterInterval, 0);
  objc_storeStrong((id *)&self->_autoCalcInterval, 0);
  objc_storeStrong((id *)&self->_resourceLoadingInterval, 0);
  objc_storeStrong((id *)&self->_resourceDownloadInterval, 0);
  objc_storeStrong((id *)&self->_resourceCheckingInterval, 0);
  objc_storeStrong((id *)&self->_enterEditTimeInterval, 0);
}

- (void)setExitEditVisualization:(id)a3
{
}

- (PXHUDTimeIntervalVisualization)exitEditVisualization
{
  return self->_exitEditVisualization;
}

- (void)setFilterVisualization:(id)a3
{
}

- (PXHUDTimeIntervalVisualization)filterVisualization
{
  return self->_filterVisualization;
}

- (void)setAutoCalcVisualization:(id)a3
{
}

- (PXHUDTimeIntervalVisualization)autoCalcVisualization
{
  return self->_autoCalcVisualization;
}

- (void)setResourceDownloadVisualization:(id)a3
{
}

- (PXHUDTimeIntervalVisualization)resourceDownloadVisualization
{
  return self->_resourceDownloadVisualization;
}

- (void)setResourceCheckingVisualization:(id)a3
{
}

- (PXHUDTimeIntervalVisualization)resourceCheckingVisualization
{
  return self->_resourceCheckingVisualization;
}

- (void)setResourceLoadingVisualization:(id)a3
{
}

- (PXHUDTimeIntervalVisualization)resourceLoadingVisualization
{
  return self->_resourceLoadingVisualization;
}

- (void)setEnterEditVisualization:(id)a3
{
}

- (PXHUDTimeIntervalVisualization)enterEditVisualization
{
  return self->_enterEditVisualization;
}

- (void)setFirstSinceLaunchVisualization:(id)a3
{
}

- (PXHUDBoxedValueVisualization)firstSinceLaunchVisualization
{
  return self->_firstSinceLaunchVisualization;
}

- (void)setFirstSinceBootVisualization:(id)a3
{
}

- (PXHUDBoxedValueVisualization)firstSinceBootVisualization
{
  return self->_firstSinceBootVisualization;
}

- (void)setDetailVisualization:(id)a3
{
}

- (PXHUDVisualization)detailVisualization
{
  return self->_detailVisualization;
}

- (void)setHudView:(id)a3
{
}

- (PXHUDView)hudView
{
  return self->_hudView;
}

- (PXTimeInterval)exitEditTimeInterval
{
  return self->_exitEditTimeInterval;
}

- (PXTimeInterval)filterInterval
{
  return self->_filterInterval;
}

- (PXTimeInterval)autoCalcInterval
{
  return self->_autoCalcInterval;
}

- (PXTimeInterval)resourceLoadingInterval
{
  return self->_resourceLoadingInterval;
}

- (PXTimeInterval)resourceDownloadInterval
{
  return self->_resourceDownloadInterval;
}

- (PXTimeInterval)resourceCheckingInterval
{
  return self->_resourceCheckingInterval;
}

- (PXTimeInterval)enterEditTimeInterval
{
  return self->_enterEditTimeInterval;
}

- (BOOL)isFirstSinceLaunch
{
  return self->_firstSinceLaunch;
}

- (BOOL)isFirstSinceBoot
{
  return self->_firstSinceBoot;
}

- (void)setExitEditTimeInterval:(id)a3
{
  v6 = (PXTimeInterval *)a3;
  if (self->_exitEditTimeInterval != v6)
  {
    objc_storeStrong((id *)&self->_exitEditTimeInterval, a3);
    v5 = [(PUPhotoEditPerfHUD *)self exitEditVisualization];
    [v5 setTimeInterval:v6];
  }
}

- (void)setFilterInterval:(id)a3
{
  v6 = (PXTimeInterval *)a3;
  if (self->_filterInterval != v6)
  {
    objc_storeStrong((id *)&self->_filterInterval, a3);
    v5 = [(PUPhotoEditPerfHUD *)self filterVisualization];
    [v5 setTimeInterval:v6];
  }
}

- (void)setAutoCalcInterval:(id)a3
{
  v6 = (PXTimeInterval *)a3;
  if (self->_autoCalcInterval != v6)
  {
    objc_storeStrong((id *)&self->_autoCalcInterval, a3);
    v5 = [(PUPhotoEditPerfHUD *)self autoCalcVisualization];
    [v5 setTimeInterval:v6];
  }
}

- (void)setResourceLoadingInterval:(id)a3
{
  v6 = (PXTimeInterval *)a3;
  if (self->_resourceLoadingInterval != v6)
  {
    objc_storeStrong((id *)&self->_resourceLoadingInterval, a3);
    v5 = [(PUPhotoEditPerfHUD *)self resourceLoadingVisualization];
    [v5 setTimeInterval:v6];
  }
}

- (void)setResourceDownloadInterval:(id)a3
{
  v6 = (PXTimeInterval *)a3;
  if (self->_resourceDownloadInterval != v6)
  {
    objc_storeStrong((id *)&self->_resourceDownloadInterval, a3);
    v5 = [(PUPhotoEditPerfHUD *)self resourceDownloadVisualization];
    [v5 setTimeInterval:v6];
  }
}

- (void)setResourceCheckingInterval:(id)a3
{
  v6 = (PXTimeInterval *)a3;
  if (self->_resourceCheckingInterval != v6)
  {
    objc_storeStrong((id *)&self->_resourceCheckingInterval, a3);
    v5 = [(PUPhotoEditPerfHUD *)self resourceCheckingVisualization];
    [v5 setTimeInterval:v6];
  }
}

- (void)setEnterEditTimeInterval:(id)a3
{
  v6 = (PXTimeInterval *)a3;
  if (self->_enterEditTimeInterval != v6)
  {
    objc_storeStrong((id *)&self->_enterEditTimeInterval, a3);
    v5 = [(PUPhotoEditPerfHUD *)self enterEditVisualization];
    [v5 setTimeInterval:v6];
  }
}

- (void)setDetailText:(id)a3
{
  id v6 = a3;
  if ((unint64_t)[v6 length] >= 0x11)
  {
    v4 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v6, "length") - 16);

    id v6 = [@"…" stringByAppendingString:v4];
  }
  v5 = [(PUPhotoEditPerfHUD *)self detailVisualization];
  [v5 setTitle:v6];
}

- (NSString)detailText
{
  v2 = [(PUPhotoEditPerfHUD *)self detailVisualization];
  v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setFirstSinceLaunch:(BOOL)a3
{
  self->_firstSinceLaunch = a3;
  objc_msgSend(NSNumber, "numberWithBool:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(PUPhotoEditPerfHUD *)self firstSinceLaunchVisualization];
  [v4 setValue:v5];
}

- (void)setFirstSinceBoot:(BOOL)a3
{
  self->_firstSinceBoot = a3;
  objc_msgSend(NSNumber, "numberWithBool:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(PUPhotoEditPerfHUD *)self firstSinceBootVisualization];
  [v4 setValue:v5];
}

- (PUPhotoEditPerfHUD)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditPerfHUD;
  v3 = -[PUPhotoEditPerfHUD initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    commonInit_56080(v3);
  }
  return v4;
}

- (PUPhotoEditPerfHUD)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditPerfHUD;
  v3 = [(PUPhotoEditPerfHUD *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    commonInit_56080(v3);
  }
  return v4;
}

@end