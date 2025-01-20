@interface SummaryBannerViewController
- (_TtC9SeymourUI27SummaryBannerViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI27SummaryBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9SeymourUI27SummaryBannerViewController)initWithRequest:(id)a3;
- (_TtC9SeymourUI27SummaryBannerViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (uint64_t)messageViewController:(double)a1 didUpdateSize:(double)a2;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
@end

@implementation SummaryBannerViewController

- (_TtC9SeymourUI27SummaryBannerViewController)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI27SummaryBannerViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI27SummaryBannerViewController)initWithRequest:(id)a3
{
  id v3 = a3;
  result = (_TtC9SeymourUI27SummaryBannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI27SummaryBannerViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = a5;
  result = (_TtC9SeymourUI27SummaryBannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI27SummaryBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI27SummaryBannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23A2DAD90(v7);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_23A2DB08C(a4);
}

- (uint64_t)messageViewController:(double)a1 didUpdateSize:(double)a2
{
  uint64_t v4 = sub_23A7FEE28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7FE7E8();
  id v8 = sub_23A7FEE18();
  os_log_type_t v9 = sub_23A8001D8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134349312;
    double v13 = a1;
    sub_23A800918();
    *(_WORD *)(v10 + 12) = 2050;
    double v13 = a2;
    sub_23A800918();
    _os_log_impl(&dword_239C0A000, v8, v9, "[UM] Summary Banner size: %{public}f x %{public}f", (uint8_t *)v10, 0x16u);
    MEMORY[0x23ECB8500](v10, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end