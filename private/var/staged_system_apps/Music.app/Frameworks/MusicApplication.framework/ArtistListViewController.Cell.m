@interface ArtistListViewController.Cell
- (_TtCC16MusicApplication24ArtistListViewController4Cell)initWithCoder:(id)a3;
- (_TtCC16MusicApplication24ArtistListViewController4Cell)initWithFrame:(CGRect)a3;
@end

@implementation ArtistListViewController.Cell

- (_TtCC16MusicApplication24ArtistListViewController4Cell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ArtistListViewController.Cell();
  return -[ArtistListViewController.Cell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC16MusicApplication24ArtistListViewController4Cell)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ArtistListViewController.Cell();
  id v4 = a3;
  v5 = [(ArtistListViewController.Cell *)&v7 initWithCoder:v4];

  return v5;
}

@end