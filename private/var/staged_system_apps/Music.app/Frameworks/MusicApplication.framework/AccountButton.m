@interface AccountButton
- (CGSize)intrinsicContentSize;
- (_TtC16MusicApplication13AccountButton)init;
- (_TtC16MusicApplication13AccountButton)initWithCoder:(id)a3;
- (_TtC16MusicApplication13AccountButton)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AccountButton

- (_TtC16MusicApplication13AccountButton)init
{
  if (qword_DBD788 != -1) {
    swift_once();
  }
  long long v3 = xmmword_DC2FF0;

  return -[AccountButton initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v3);
}

- (_TtC16MusicApplication13AccountButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13AccountButton *)sub_98D10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13AccountButton)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC16MusicApplication13AccountButton *)sub_9B610();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_DBD7B8;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_E49D78;
  long long v9 = xmmword_AEE120;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  v7 = v5;
  sub_4358B0((uint64_t)&v9, (uint64_t)v7, v6);

  v8.receiver = v7;
  v8.super_class = ObjectType;
  [(AccountButton *)&v8 dealloc];
}

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication13AccountButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13AccountButton_profilePerson));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13AccountButton_loadedArtworkCatalog));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13AccountButton_accountButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication13AccountButton_notificationBadgeView);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_9A6B4((uint64_t)a3);
}

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication13AccountButton_size);
  double v3 = *(double *)&self->delegate[OBJC_IVAR____TtC16MusicApplication13AccountButton_size];
  result.height = v3;
  result.width = v2;
  return result;
}

@end