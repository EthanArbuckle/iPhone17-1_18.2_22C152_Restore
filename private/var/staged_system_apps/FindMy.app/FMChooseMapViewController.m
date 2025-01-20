@interface FMChooseMapViewController
- (_TtC6FindMy25FMChooseMapViewController)initWithCoder:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewLayoutMarginsDidChange;
@end

@implementation FMChooseMapViewController

- (_TtC6FindMy25FMChooseMapViewController)initWithCoder:(id)a3
{
  result = (_TtC6FindMy25FMChooseMapViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = (char *)v8.receiver;
  id v5 = a3;
  [(FMBaseContentViewController *)&v8 traitCollectionDidChange:v5];
  id v6 = [v4 view];
  if (v6)
  {
    v7 = v6;
    [v6 invalidateIntrinsicContentSize];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(FMChooseMapViewController *)&v3 viewLayoutMarginsDidChange];
  [*(id *)&v2[OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_scrollView] layoutIfNeeded];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMChooseMapViewController_hostingViewController));
}

@end