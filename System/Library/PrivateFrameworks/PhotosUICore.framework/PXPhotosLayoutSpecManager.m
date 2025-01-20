@interface PXPhotosLayoutSpecManager
- (BOOL)sectionHeadersEnabled;
- (BOOL)shouldMakeSpaceForLeadingChrome;
- (BOOL)shouldUpdateSpecForExtendedTraitCollection:(id)a3 change:(unint64_t)a4;
- (BOOL)wantsToggleSidebarButton;
- (Class)specClass;
- (NSArray)availableThumbnailSizes;
- (PXPhotosHeaderCustomizationModel)headerCustomizationModel;
- (PXPhotosLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXPhotosLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 enableSectionHeaders:(BOOL)a5;
- (id)createSpec;
- (int64_t)gridStyle;
- (void)setAvailableThumbnailSizes:(id)a3;
- (void)setGridStyle:(int64_t)a3;
- (void)setShouldMakeSpaceForLeadingChrome:(BOOL)a3;
- (void)setWantsToggleSidebarButton:(BOOL)a3;
@end

@implementation PXPhotosLayoutSpecManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerCustomizationModel, 0);
  objc_storeStrong((id *)&self->_availableThumbnailSizes, 0);
}

- (PXPhotosHeaderCustomizationModel)headerCustomizationModel
{
  return self->_headerCustomizationModel;
}

- (BOOL)shouldMakeSpaceForLeadingChrome
{
  return self->_shouldMakeSpaceForLeadingChrome;
}

- (BOOL)wantsToggleSidebarButton
{
  return self->_wantsToggleSidebarButton;
}

- (BOOL)sectionHeadersEnabled
{
  return self->_sectionHeadersEnabled;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (void)setAvailableThumbnailSizes:(id)a3
{
}

- (NSArray)availableThumbnailSizes
{
  return self->_availableThumbnailSizes;
}

- (BOOL)shouldUpdateSpecForExtendedTraitCollection:(id)a3 change:(unint64_t)a4
{
  id v6 = a3;
  if (([(PXFeatureSpecManager *)self options] & 2) != 0)
  {
    unsigned __int8 v7 = (([(PXFeatureSpecManager *)self defaultChangesToUpdateFor] & 0xFFFFFFFFFFFF5CFFLL | 0xA000) & a4) != 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXPhotosLayoutSpecManager;
    unsigned __int8 v7 = [(PXFeatureSpecManager *)&v9 shouldUpdateSpecForExtendedTraitCollection:v6 change:a4];
  }

  return v7;
}

- (void)setShouldMakeSpaceForLeadingChrome:(BOOL)a3
{
  if (self->_shouldMakeSpaceForLeadingChrome != a3)
  {
    self->_shouldMakeSpaceForLeadingChrome = a3;
    [(PXFeatureSpecManager *)self invalidateSpec];
  }
}

- (void)setWantsToggleSidebarButton:(BOOL)a3
{
  if (self->_wantsToggleSidebarButton != a3)
  {
    self->_wantsToggleSidebarButton = a3;
    [(PXFeatureSpecManager *)self invalidateSpec];
  }
}

- (void)setGridStyle:(int64_t)a3
{
  if (self->_gridStyle != a3)
  {
    self->_gridStyle = a3;
    [(PXFeatureSpecManager *)self invalidateSpec];
  }
}

- (id)createSpec
{
  v3 = [(PXFeatureSpecManager *)self extendedTraitCollection];
  v4 = objc_msgSend(objc_alloc(-[PXPhotosLayoutSpecManager specClass](self, "specClass")), "initWithExtendedTraitCollection:options:gridStyle:wantsToggleSidebarButton:shouldMakeSpaceForLeadingChrome:", v3, -[PXFeatureSpecManager options](self, "options"), -[PXPhotosLayoutSpecManager gridStyle](self, "gridStyle"), -[PXPhotosLayoutSpecManager wantsToggleSidebarButton](self, "wantsToggleSidebarButton"), -[PXPhotosLayoutSpecManager shouldMakeSpaceForLeadingChrome](self, "shouldMakeSpaceForLeadingChrome"));

  return v4;
}

- (Class)specClass
{
  [(PXPhotosLayoutSpecManager *)self sectionHeadersEnabled];
  id v2 = (id)objc_opt_class();
  return (Class)v2;
}

- (PXPhotosLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXPhotosLayoutSpecManager *)self initWithExtendedTraitCollection:a3 options:a4 enableSectionHeaders:0];
}

- (PXPhotosLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 enableSectionHeaders:(BOOL)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXPhotosLayoutSpecManager;
  objc_super v9 = [(PXFeatureSpecManager *)&v14 initWithExtendedTraitCollection:v8 options:a4];
  v10 = v9;
  if (v9)
  {
    v9->_sectionHeadersEnabled = a5;
    uint64_t v11 = [v8 headerCustomizationModel];
    headerCustomizationModel = v10->_headerCustomizationModel;
    v10->_headerCustomizationModel = (PXPhotosHeaderCustomizationModel *)v11;
  }
  return v10;
}

@end