@interface StoryExportActivityPreviewViewController
- (_TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController)initWithCoder:(id)a3;
- (_TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation StoryExportActivityPreviewViewController

- (_TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEB97F48();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AEB9801C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AEB984F4(a3, (SEL *)&selRef_viewDidAppear_, 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1AEB984F4(a3, (SEL *)&selRef_viewDidDisappear_, 0);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AEB985E4();
}

- (_TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AEF96DE0();
  }
  id v5 = a4;
  sub_1AEB98BD0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController_exportActivityItemProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController_storyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate40StoryExportActivityPreviewViewController_storyTraitCollection));
  swift_unknownObjectRelease();
}

@end