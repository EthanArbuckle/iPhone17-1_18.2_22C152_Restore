@interface SBHAddWidgetSheetConfiguration
- (BOOL)applicationCellIncludesGalleryListView;
- (BOOL)contentContainsInteractiveUIControls;
- (BOOL)wantsCustomApplicationsSection;
- (NSString)gridSizeClassForContentWidth;
- (NSString)searchPlaceholderText;
- (SBHAddWidgetSheetConfiguration)init;
- (SBHIconGridSizeClassDomain)gridSizeClassDomain;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconViewProviding)iconViewProvider;
- (UIColor)searchTintColor;
- (id)copyWithZone:(void *)a3;
- (int64_t)backgroundMaterial;
- (unint64_t)style;
- (void)setApplicationCellIncludesGalleryListView:(BOOL)a3;
- (void)setBackgroundMaterial:(int64_t)a3;
- (void)setContentContainsInteractiveUIControls:(BOOL)a3;
- (void)setGridSizeClassDomain:(id)a3;
- (void)setGridSizeClassForContentWidth:(id)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setSearchPlaceholderText:(id)a3;
- (void)setSearchTintColor:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setWantsCustomApplicationsSection:(BOOL)a3;
@end

@implementation SBHAddWidgetSheetConfiguration

- (SBIconListLayoutProvider)listLayoutProvider
{
  v2 = (void *)swift_unknownObjectRetain();
  return (SBIconListLayoutProvider *)v2;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (SBIconViewProviding)iconViewProvider
{
  v2 = (void *)swift_unknownObjectRetain();
  return (SBIconViewProviding *)v2;
}

- (void)setIconViewProvider:(id)a3
{
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  return (SBHIconGridSizeClassDomain *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassDomain));
}

- (void)setGridSizeClassDomain:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassDomain);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassDomain) = (Class)a3;
  id v3 = a3;
}

- (NSString)gridSizeClassForContentWidth
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassForContentWidth));
}

- (void)setGridSizeClassForContentWidth:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassForContentWidth);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassForContentWidth) = (Class)a3;
  id v3 = a3;
}

- (unint64_t)style
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_style);
}

- (void)setStyle:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_style) = (Class)a3;
}

- (int64_t)backgroundMaterial
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_backgroundMaterial);
}

- (void)setBackgroundMaterial:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_backgroundMaterial) = (Class)a3;
}

- (NSString)searchPlaceholderText
{
  if (*(void *)&self->listLayoutProvider[OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchPlaceholderText])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1D81B1F58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setSearchPlaceholderText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1D81B1F68();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchPlaceholderText);
  uint64_t *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (UIColor)searchTintColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchTintColor));
}

- (void)setSearchTintColor:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchTintColor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchTintColor) = (Class)a3;
  id v3 = a3;
}

- (BOOL)applicationCellIncludesGalleryListView
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_applicationCellIncludesGalleryListView);
}

- (void)setApplicationCellIncludesGalleryListView:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_applicationCellIncludesGalleryListView) = a3;
}

- (BOOL)contentContainsInteractiveUIControls
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_contentContainsInteractiveUIControls);
}

- (void)setContentContainsInteractiveUIControls:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_contentContainsInteractiveUIControls) = a3;
}

- (BOOL)wantsCustomApplicationsSection
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_wantsCustomApplicationsSection);
}

- (void)setWantsCustomApplicationsSection:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_wantsCustomApplicationsSection) = a3;
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  sub_1D81AA4E4(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  id v4 = (void *)sub_1D81B2048();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (SBHAddWidgetSheetConfiguration)init
{
  return (SBHAddWidgetSheetConfiguration *)SBHAddWidgetSheetConfiguration.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchTintColor);
}

@end