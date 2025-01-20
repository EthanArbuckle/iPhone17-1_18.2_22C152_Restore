@interface PXPeoplePetsHomeVisibilitySource
- (PXPeoplePetsHomeVisibilitySource)init;
- (PXPeoplePetsHomeVisibilitySource)initWithPhotoLibrary:(id)a3;
- (unint64_t)visibility;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)setVisibility:(unint64_t)a3;
@end

@implementation PXPeoplePetsHomeVisibilitySource

- (unint64_t)visibility
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___PXPeoplePetsHomeVisibilitySource_visibility);
  swift_beginAccess();
  return *v2;
}

- (PXPeoplePetsHomeVisibilitySource)initWithPhotoLibrary:(id)a3
{
  return (PXPeoplePetsHomeVisibilitySource *)sub_1A9C9627C(a3);
}

- (void)setVisibility:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR___PXPeoplePetsHomeVisibilitySource_visibility);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (PXPeoplePetsHomeVisibilitySource)init
{
  result = (PXPeoplePetsHomeVisibilitySource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPeoplePetsHomeVisibilitySource_defaults);
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4 = a3;
  v5 = self;
  PeoplePetsHomeVisibilitySource.photoLibraryDidChange(onMainQueue:)((PHChange)v4);
}

@end