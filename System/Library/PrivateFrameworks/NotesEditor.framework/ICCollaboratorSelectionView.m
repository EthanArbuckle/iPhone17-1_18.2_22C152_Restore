@interface ICCollaboratorSelectionView
- (BOOL)isAccessibilityElement;
- (ICCollaboratorSelectionView)initWithCoder:(id)a3;
- (ICCollaboratorSelectionView)initWithFrame:(CGRect)a3;
- (ICCollaboratorSelectionView)initWithImage:(id)a3;
- (ICCollaboratorSelectionView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation ICCollaboratorSelectionView

- (ICCollaboratorSelectionView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICCollaboratorSelectionView_color) = 0;

  result = (ICCollaboratorSelectionView *)sub_20C163BD0();
  __break(1u);
  return result;
}

- (ICCollaboratorSelectionView)initWithImage:(id)a3
{
  id v3 = a3;
  result = (ICCollaboratorSelectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (ICCollaboratorSelectionView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (ICCollaboratorSelectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (ICCollaboratorSelectionView)initWithFrame:(CGRect)a3
{
  result = (ICCollaboratorSelectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)isAccessibilityElement
{
  return _AXSAutomationEnabled() != 0;
}

@end