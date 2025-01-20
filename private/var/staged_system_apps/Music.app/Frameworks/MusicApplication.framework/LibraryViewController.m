@interface LibraryViewController
- (_TtC16MusicApplication21LibraryViewController)initWithCoder:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LibraryViewController

- (_TtC16MusicApplication21LibraryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10C0D0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10B278();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryViewController();
  v4 = v5.receiver;
  [(VerticalStackViewController *)&v5 viewDidAppear:v3];
  if (v4[OBJC_IVAR____TtC16MusicApplication21LibraryViewController_shouldRecordPageMetrics] == 1) {
    sub_10BCCC();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LibraryViewController();
  v4 = v7.receiver;
  [(VerticalStackViewController *)&v7 viewWillDisappear:v3];
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication21LibraryViewController_shouldSkipRecordingPageMetricsForEditingStateChange;
  char v6 = v4[OBJC_IVAR____TtC16MusicApplication21LibraryViewController_shouldSkipRecordingPageMetricsForEditingStateChange];
  v4[OBJC_IVAR____TtC16MusicApplication21LibraryViewController_shouldSkipRecordingPageMetricsForEditingStateChange] = 1;
  [v4 setEditing:0 animated:0];
  v4[v5] = v6;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  char v6 = self;
  sub_10B4BC(a3, a4);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LibraryViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(LibraryViewController *)&v6 traitCollectionDidChange:v4];
  sub_10B6C8(0);
  sub_10BA00();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21LibraryViewController____lazy_storage___accountButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_menuTableViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21LibraryViewController_recentlyAddedViewController));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication21LibraryViewController____lazy_storage___dropIndicationView);
}

@end