@interface MusicVideoHorizontalCell.TVShowEpisodeListCell
- (_TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell)initWithCoder:(id)a3;
- (_TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell)initWithFrame:(CGRect)a3;
@end

@implementation MusicVideoHorizontalCell.TVShowEpisodeListCell

- (_TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell *)sub_4EFEE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell)initWithCoder:(id)a3
{
  v5 = &self->super.super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell_releaseDate];
  uint64_t v6 = sub_AB0D80();
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell *)sub_AB8280();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end