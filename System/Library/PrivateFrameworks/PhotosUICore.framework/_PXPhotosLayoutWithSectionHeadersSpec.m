@interface _PXPhotosLayoutWithSectionHeadersSpec
- (_PXPhotosLayoutWithSectionHeadersSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 gridStyle:(int64_t)a5 wantsToggleSidebarButton:(BOOL)a6 shouldMakeSpaceForLeadingChrome:(BOOL)a7;
- (id)sectionHeaderSpec;
@end

@implementation _PXPhotosLayoutWithSectionHeadersSpec

- (void).cxx_destruct
{
}

- (id)sectionHeaderSpec
{
  return self->_sectionHeaderSpec;
}

- (_PXPhotosLayoutWithSectionHeadersSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 gridStyle:(int64_t)a5 wantsToggleSidebarButton:(BOOL)a6 shouldMakeSpaceForLeadingChrome:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_PXPhotosLayoutWithSectionHeadersSpec;
  v13 = [(PXPhotosLayoutSpec *)&v17 initWithExtendedTraitCollection:v12 options:a4 gridStyle:a5 wantsToggleSidebarButton:v8 shouldMakeSpaceForLeadingChrome:v7];
  if (v13)
  {
    v14 = [[PXPhotosSectionHeaderLayoutSpec alloc] initWithExtendedTraitCollection:v12 options:a4];
    sectionHeaderSpec = v13->_sectionHeaderSpec;
    v13->_sectionHeaderSpec = v14;
  }
  return v13;
}

@end