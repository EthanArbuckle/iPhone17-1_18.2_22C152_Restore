@interface PUPickerOnboardingHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PUPickerOnboardingHeaderView)initWithClientDisplayName:(id)a3 isLimitedLibraryPicker:(BOOL)a4 closeAction:(id)a5;
- (PUPickerOnboardingHeaderView)initWithCoder:(id)a3;
- (PUPickerOnboardingHeaderView)initWithFrame:(CGRect)a3;
- (PUPickerOnboardingHeaderViewDelegate)delegate;
- (void)didMoveToWindow;
- (void)hovering:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PUPickerOnboardingHeaderView

- (PUPickerOnboardingHeaderViewDelegate)delegate
{
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AEA47F90();
}

- (PUPickerOnboardingHeaderView)initWithClientDisplayName:(id)a3 isLimitedLibraryPicker:(BOOL)a4 closeAction:(id)a5
{
  BOOL v6 = a4;
  if (a3)
  {
    uint64_t v7 = sub_1AEF96DE0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  return (PUPickerOnboardingHeaderView *)sub_1AEA47FD8(v7, v9, v6, a5);
}

- (PUPickerOnboardingHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEA4A4F0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_1AEA4A580(width, height, v6, v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_1AEA4A5F4();
}

- (void)hovering:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEA4A980(v4);
}

- (PUPickerOnboardingHeaderView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUPickerOnboardingHeaderView_separatorHeightConstraint));

  id v3 = (char *)self + OBJC_IVAR___PUPickerOnboardingHeaderView_delegate;
  sub_1AEA2489C((uint64_t)v3);
}

@end