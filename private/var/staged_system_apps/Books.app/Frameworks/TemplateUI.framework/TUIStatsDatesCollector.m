@interface TUIStatsDatesCollector
- (NSDate)allContentReadyDate;
- (NSDate)contentUpdateDate;
- (NSDate)creationDate;
- (NSDate)dynamicUpdateDate;
- (NSDate)initialContentReadyDate;
- (NSDate)initialLayoutStartDate;
- (NSDate)initialResourcesRenderedDate;
- (NSDate)resourcesLoadedDate;
- (NSDate)resourcesStartLoadingDate;
- (NSDate)viewWillAppearDate;
- (void)setAllContentReadyDate:(id)a3;
- (void)setContentUpdateDate:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDynamicUpdateDate:(id)a3;
- (void)setInitialContentReadyDate:(id)a3;
- (void)setInitialLayoutStartDate:(id)a3;
- (void)setInitialResourcesRenderedDate:(id)a3;
- (void)setResourcesLoadedDate:(id)a3;
- (void)setResourcesStartLoadingDate:(id)a3;
- (void)setViewWillAppearDate:(id)a3;
@end

@implementation TUIStatsDatesCollector

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)initialResourcesRenderedDate
{
  return self->_initialResourcesRenderedDate;
}

- (void)setInitialResourcesRenderedDate:(id)a3
{
}

- (NSDate)contentUpdateDate
{
  return self->_contentUpdateDate;
}

- (void)setContentUpdateDate:(id)a3
{
}

- (NSDate)initialContentReadyDate
{
  return self->_initialContentReadyDate;
}

- (void)setInitialContentReadyDate:(id)a3
{
}

- (NSDate)initialLayoutStartDate
{
  return self->_initialLayoutStartDate;
}

- (void)setInitialLayoutStartDate:(id)a3
{
}

- (NSDate)allContentReadyDate
{
  return self->_allContentReadyDate;
}

- (void)setAllContentReadyDate:(id)a3
{
}

- (NSDate)dynamicUpdateDate
{
  return self->_dynamicUpdateDate;
}

- (void)setDynamicUpdateDate:(id)a3
{
}

- (NSDate)resourcesStartLoadingDate
{
  return self->_resourcesStartLoadingDate;
}

- (void)setResourcesStartLoadingDate:(id)a3
{
}

- (NSDate)resourcesLoadedDate
{
  return self->_resourcesLoadedDate;
}

- (void)setResourcesLoadedDate:(id)a3
{
}

- (NSDate)viewWillAppearDate
{
  return self->_viewWillAppearDate;
}

- (void)setViewWillAppearDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewWillAppearDate, 0);
  objc_storeStrong((id *)&self->_resourcesLoadedDate, 0);
  objc_storeStrong((id *)&self->_resourcesStartLoadingDate, 0);
  objc_storeStrong((id *)&self->_dynamicUpdateDate, 0);
  objc_storeStrong((id *)&self->_allContentReadyDate, 0);
  objc_storeStrong((id *)&self->_initialLayoutStartDate, 0);
  objc_storeStrong((id *)&self->_initialContentReadyDate, 0);
  objc_storeStrong((id *)&self->_contentUpdateDate, 0);
  objc_storeStrong((id *)&self->_initialResourcesRenderedDate, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end