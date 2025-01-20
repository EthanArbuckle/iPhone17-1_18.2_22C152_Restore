@interface SharingCollectionView
- (_TtC16MusicMessagesApp21SharingCollectionView)initWithCoder:(id)a3;
- (_TtC16MusicMessagesApp21SharingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
@end

@implementation SharingCollectionView

- (_TtC16MusicMessagesApp21SharingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SharingCollectionView();
  id v9 = a4;
  v10 = -[SharingCollectionView initWithFrame:collectionViewLayout:](&v13, "initWithFrame:collectionViewLayout:", v9, x, y, width, height);
  -[SharingCollectionView setDelaysContentTouches:](v10, "setDelaysContentTouches:", 0, v13.receiver, v13.super_class);
  if (qword_10059F008 != -1) {
    swift_once();
  }
  id v11 = (id)qword_1005DCEC0;
  [(SharingCollectionView *)v10 setBackgroundColor:v11];

  return v10;
}

- (_TtC16MusicMessagesApp21SharingCollectionView)initWithCoder:(id)a3
{
  result = (_TtC16MusicMessagesApp21SharingCollectionView *)sub_100485590();
  __break(1u);
  return result;
}

@end