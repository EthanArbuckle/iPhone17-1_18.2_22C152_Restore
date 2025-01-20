@interface PreviewViewController
- (_TtC18QuickLookExtension21PreviewViewController)initWithCoder:(id)a3;
- (_TtC18QuickLookExtension21PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4;
@end

@implementation PreviewViewController

- (void)loadView
{
  v2 = self;
  sub_100002AAC();
}

- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4
{
  sub_1000060F8();
  sub_100005F60();
  __chkstk_darwin();
  sub_100005FB8();
  v7 = _Block_copy(a4);
  sub_1000060E8();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v9 = self;
  sub_100002CB4(v4, (uint64_t)sub_100004740, v8);

  swift_release();
  sub_100006020();
  v10();
}

- (_TtC18QuickLookExtension21PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100006368();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18QuickLookExtension21PreviewViewController *)sub_100003020(v5, v7, a4);
}

- (_TtC18QuickLookExtension21PreviewViewController)initWithCoder:(id)a3
{
  return (_TtC18QuickLookExtension21PreviewViewController *)sub_10000310C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18QuickLookExtension21PreviewViewController____lazy_storage___hostingView));
}

@end