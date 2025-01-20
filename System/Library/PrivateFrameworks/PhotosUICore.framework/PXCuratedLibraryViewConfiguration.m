@interface PXCuratedLibraryViewConfiguration
- (BOOL)enableDays;
- (BOOL)enableFooter;
- (BOOL)enableNavigationHeader;
- (BOOL)enableSecondaryToolbarContainerView;
- (BOOL)isExpandedInitially;
- (BOOL)isZoomLevelEnabled:(int64_t)a3;
- (PHPhotoLibrary)photoLibrary;
- (PXCuratedLibraryViewConfiguration)init;
- (PXCuratedLibraryViewConfiguration)initWithPhotoLibrary:(id)a3;
- (PXLemonadeFeatureAvailabilityMonitor)featureAvailabilityMonitor;
- (PXPhotosViewOptionsModel)viewOptionsModel;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)initialZoomLevel;
- (int64_t)overrideDefaultNumberOfColumns;
- (unint64_t)allowedInteractiveDismissBehaviors;
- (unint64_t)layoutStyle;
- (unint64_t)secondaryToolbarStyle;
- (void)setAllowedInteractiveDismissBehaviors:(unint64_t)a3;
- (void)setEnableDays:(BOOL)a3;
- (void)setEnableFooter:(BOOL)a3;
- (void)setEnableNavigationHeader:(BOOL)a3;
- (void)setEnableSecondaryToolbarContainerView:(BOOL)a3;
- (void)setInitialZoomLevel:(int64_t)a3;
- (void)setIsExpandedInitially:(BOOL)a3;
- (void)setLayoutStyle:(unint64_t)a3;
- (void)setOverrideDefaultNumberOfColumns:(int64_t)a3;
- (void)setSecondaryToolbarStyle:(unint64_t)a3;
- (void)setViewOptionsModel:(id)a3;
- (void)swift_copyPropertiesFromConfiguration:(id)a3;
- (void)swift_propagateEnvironmentValuesToExtendedTraitCollection:(id)a3;
@end

@implementation PXCuratedLibraryViewConfiguration

- (void)swift_copyPropertiesFromConfiguration:(id)a3
{
}

- (unint64_t)secondaryToolbarStyle
{
  return self->_secondaryToolbarStyle;
}

- (BOOL)isExpandedInitially
{
  return self->_isExpandedInitially;
}

- (BOOL)enableFooter
{
  return self->_enableFooter;
}

- (PXPhotosViewOptionsModel)viewOptionsModel
{
  return self->_viewOptionsModel;
}

- (int64_t)overrideDefaultNumberOfColumns
{
  return self->_overrideDefaultNumberOfColumns;
}

- (BOOL)isZoomLevelEnabled:(int64_t)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 == 3) {
    return [(PXCuratedLibraryViewConfiguration *)self enableDays];
  }
  return 1;
}

- (BOOL)enableNavigationHeader
{
  return self->_enableNavigationHeader;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PXCuratedLibraryViewConfiguration alloc];
  v5 = [(PXCuratedLibraryViewConfiguration *)self photoLibrary];
  v6 = [(PXCuratedLibraryViewConfiguration *)v4 initWithPhotoLibrary:v5];

  [(PXCuratedLibraryViewConfiguration *)v6 setInitialZoomLevel:[(PXCuratedLibraryViewConfiguration *)self initialZoomLevel]];
  [(PXCuratedLibraryViewConfiguration *)v6 setEnableDays:[(PXCuratedLibraryViewConfiguration *)self enableDays]];
  [(PXCuratedLibraryViewConfiguration *)v6 setEnableFooter:[(PXCuratedLibraryViewConfiguration *)self enableFooter]];
  [(PXCuratedLibraryViewConfiguration *)v6 setEnableNavigationHeader:[(PXCuratedLibraryViewConfiguration *)self enableNavigationHeader]];
  [(PXCuratedLibraryViewConfiguration *)v6 setIsExpandedInitially:[(PXCuratedLibraryViewConfiguration *)self isExpandedInitially]];
  [(PXCuratedLibraryViewConfiguration *)v6 setAllowedInteractiveDismissBehaviors:[(PXCuratedLibraryViewConfiguration *)self allowedInteractiveDismissBehaviors]];
  [(PXCuratedLibraryViewConfiguration *)v6 setOverrideDefaultNumberOfColumns:[(PXCuratedLibraryViewConfiguration *)self overrideDefaultNumberOfColumns]];
  [(PXCuratedLibraryViewConfiguration *)v6 setSecondaryToolbarStyle:[(PXCuratedLibraryViewConfiguration *)self secondaryToolbarStyle]];
  v7 = [(PXCuratedLibraryViewConfiguration *)self viewOptionsModel];
  [(PXCuratedLibraryViewConfiguration *)v6 setViewOptionsModel:v7];

  [(PXCuratedLibraryViewConfiguration *)v6 setEnableSecondaryToolbarContainerView:[(PXCuratedLibraryViewConfiguration *)self enableSecondaryToolbarContainerView]];
  [(PXCuratedLibraryViewConfiguration *)v6 swift_copyPropertiesFromConfiguration:self];
  return v6;
}

- (void)setViewOptionsModel:(id)a3
{
}

- (void)setSecondaryToolbarStyle:(unint64_t)a3
{
  self->_secondaryToolbarStyle = a3;
}

- (void)setIsExpandedInitially:(BOOL)a3
{
  self->_isExpandedInitially = a3;
}

- (void)setInitialZoomLevel:(int64_t)a3
{
  self->_initialZoomLevel = a3;
}

- (void)setEnableSecondaryToolbarContainerView:(BOOL)a3
{
  self->_enableSecondaryToolbarContainerView = a3;
}

- (void)setEnableNavigationHeader:(BOOL)a3
{
  self->_enableNavigationHeader = a3;
}

- (void)setEnableFooter:(BOOL)a3
{
  self->_enableFooter = a3;
}

- (void)setEnableDays:(BOOL)a3
{
  self->_enableDays = a3;
}

- (void)setAllowedInteractiveDismissBehaviors:(unint64_t)a3
{
  self->_allowedInteractiveDismissBehaviors = a3;
}

- (PXCuratedLibraryViewConfiguration)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibraryViewConfiguration;
  v6 = [(PXCuratedLibraryViewConfiguration *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v7->_initialZoomLevel = 0;
    v7->_secondaryToolbarStyle = 0;
    *(_DWORD *)&v7->_enableDays = 16843009;
    v7->_enableSecondaryToolbarContainerView = 0;
    v7->_overrideDefaultNumberOfColumns = 0;
    v7->_allowedInteractiveDismissBehaviors = 0;
  }

  return v7;
}

- (BOOL)enableDays
{
  return self->_enableDays;
}

- (int64_t)initialZoomLevel
{
  return self->_initialZoomLevel;
}

- (void)setOverrideDefaultNumberOfColumns:(int64_t)a3
{
  self->_overrideDefaultNumberOfColumns = a3;
}

- (unint64_t)allowedInteractiveDismissBehaviors
{
  return self->_allowedInteractiveDismissBehaviors;
}

- (BOOL)enableSecondaryToolbarContainerView
{
  return self->_enableSecondaryToolbarContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewOptionsModel, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)swift_propagateEnvironmentValuesToExtendedTraitCollection:(id)a3
{
}

- (PXLemonadeFeatureAvailabilityMonitor)featureAvailabilityMonitor
{
  type metadata accessor for LemonadeFeatureAvailabilityMonitor();
  char v7 = 6;
  v3 = self;
  v4 = [(PXCuratedLibraryViewConfiguration *)v3 photoLibrary];
  id v5 = (void *)static LemonadeFeatureAvailabilityMonitor.sharedStatus(feature:for:)(&v7, v4);

  return (PXLemonadeFeatureAvailabilityMonitor *)v5;
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (PXCuratedLibraryViewConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryViewConfiguration.m", 34, @"%s is not available as initializer", "-[PXCuratedLibraryViewConfiguration init]");

  abort();
}

@end