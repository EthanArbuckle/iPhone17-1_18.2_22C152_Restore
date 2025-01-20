@interface AccountPageViewController
- (BOOL)shouldAutorotate;
- (_TtC5JSApp25AccountPageViewController)initWithAccountURL:(id)a3;
- (_TtC5JSApp25AccountPageViewController)initWithCoder:(id)a3;
- (_TtC5JSApp25AccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)accountPageViewControllerDidFinish:(id)a3;
@end

@implementation AccountPageViewController

- (_TtC5JSApp25AccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_86860();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC5JSApp25AccountPageViewController *)sub_726BC(v5, v7, a4);
}

- (_TtC5JSApp25AccountPageViewController)initWithCoder:(id)a3
{
  self->SKAccountPageViewController_opaque[OBJC_IVAR____TtC5JSApp25AccountPageViewController_pageType] = 0;
  v4 = &self->SKAccountPageViewController_opaque[OBJC_IVAR____TtC5JSApp25AccountPageViewController_contentID];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = &self->SKAccountPageViewController_opaque[OBJC_IVAR____TtC5JSApp25AccountPageViewController_onFinish];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  id v6 = a3;

  result = (_TtC5JSApp25AccountPageViewController *)sub_86F70();
  __break(1u);
  return result;
}

- (BOOL)shouldAutorotate
{
  v3 = self;
  v4 = self;
  id v5 = [v3 currentDevice];
  id v6 = (char *)[v5 userInterfaceIdiom];

  return v6 == (unsigned char *)&dword_0 + 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = self;
  v4 = self;
  id v5 = [v3 currentDevice];
  id v6 = (char *)[v5 userInterfaceIdiom];

  if (v6 == (unsigned char *)&dword_0 + 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (_TtC5JSApp25AccountPageViewController)initWithAccountURL:(id)a3
{
  uint64_t v4 = sub_2D920((uint64_t *)&unk_CD040);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_85E60();
    uint64_t v7 = sub_85EB0();
    uint64_t v9 = 0;
    id v8 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  }
  else
  {
    uint64_t v7 = sub_85EB0();
    id v8 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = 1;
  }
  (*v8)(v6, v9, 1, v7);
  result = (_TtC5JSApp25AccountPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)&self->SKAccountPageViewController_opaque[OBJC_IVAR____TtC5JSApp25AccountPageViewController_onFinish];

  sub_31BA8(v3);
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_72B20(v4);
}

@end