@interface PGMusicBag
- (PGMusicBag)init;
- (PGMusicBag)initWithCache:(id)a3;
@end

@implementation PGMusicBag

- (PGMusicBag)initWithCache:(id)a3
{
  id v4 = a3;
  v5 = (PGMusicBag *)sub_1D18EF970(a3);

  return v5;
}

- (PGMusicBag)init
{
  result = (PGMusicBag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGMusicBag_cache);
}

@end