@interface DescriptionModal.Content
- (_TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content)initWithCoder:(id)a3;
- (_TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissAnimated;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation DescriptionModal.Content

- (_TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content_heightNeeded) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content____lazy_storage___descriptionTextView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content____lazy_storage___maskView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content____lazy_storage___blurView) = 0;
  id v4 = a3;

  result = (_TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10068BFD0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10068C9F8();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10068DA08();
}

- (void)dismissAnimated
{
}

- (_TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content____lazy_storage___descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content____lazy_storage___maskView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC5Music16DescriptionModalP33_0EAC1E89AC1A8ECCCD684CECC329D23C7Content____lazy_storage___blurView);
}

@end