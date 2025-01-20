@interface BKLibraryCollectionTitleView
- (BKLibraryCollectionTitleView)initWithCoder:(id)a3;
- (BKLibraryCollectionTitleView)initWithFrame:(CGRect)a3;
- (BKLibraryCollectionTitleViewDelegate)delegate;
- (void)contentDidChange;
- (void)setDelegate:(id)a3;
@end

@implementation BKLibraryCollectionTitleView

- (BKLibraryCollectionTitleViewDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BKLibraryCollectionTitleViewDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (void)contentDidChange
{
  v2 = self;
  LibraryCollectionTitleView.contentDidChange()();
}

- (BKLibraryCollectionTitleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR___BKLibraryCollectionTitleView_minHeightThatCountsAsVisible] = 0x4034000000000000;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for LibraryCollectionTitleView();
  return -[BKLibraryCollectionTitleView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (BKLibraryCollectionTitleView)initWithCoder:(id)a3
{
  *(void *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR___BKLibraryCollectionTitleView_minHeightThatCountsAsVisible] = 0x4034000000000000;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LibraryCollectionTitleView();
  return [(BKLibraryCollectionTitleView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end