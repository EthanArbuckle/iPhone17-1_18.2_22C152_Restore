@interface DebugFormatUploadDiffView
- (_TtC8NewsFeed25DebugFormatUploadDiffView)initWithCoder:(id)a3;
- (_TtC8NewsFeed25DebugFormatUploadDiffView)initWithFrame:(CGRect)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)layoutSubviews;
@end

@implementation DebugFormatUploadDiffView

- (_TtC8NewsFeed25DebugFormatUploadDiffView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0E87EC4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C0E871FC();
}

- (_TtC8NewsFeed25DebugFormatUploadDiffView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed25DebugFormatUploadDiffView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed25DebugFormatUploadDiffView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25DebugFormatUploadDiffView_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25DebugFormatUploadDiffView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25DebugFormatUploadDiffView_tableView));
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v5 = (unint64_t *)((char *)self + OBJC_IVAR____TtC8NewsFeed25DebugFormatUploadDiffView_changeSet);
  swift_beginAccess();
  unint64_t v6 = *v5;
  if (!(v6 >> 62)) {
    return *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v9 = a3;
  v10 = self;
  swift_bridgeObjectRetain();
  int64_t v7 = sub_1C15204BC();

  swift_bridgeObjectRelease();
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8NewsFeed25DebugFormatUploadDiffView_changeSet);
  swift_beginAccess();
  uint64_t v8 = *v7;
  if ((v8 & 0xC000000000000001) == 0)
  {
    if (a4 < 0)
    {
      __break(1u);
    }
    else if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
    {
      uint64_t v9 = *(void *)(v8 + 8 * a4 + 32);
      id v10 = a3;
      v11 = self;
      swift_retain();
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_11;
  }
  id v15 = a3;
  v16 = self;
  uint64_t v9 = MEMORY[0x1C18C7CB0](a4, v8);
LABEL_5:
  swift_endAccess();
  unint64_t v12 = *(void *)(v9 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  if (v12 >> 62)
  {
LABEL_11:
    swift_bridgeObjectRetain();
    int64_t v13 = sub_1C15204BC();

    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  int64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);

LABEL_7:
  swift_bridgeObjectRelease();

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  v11 = self;
  unint64_t v12 = (void *)sub_1C0E87660();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1C0E87FE4(a4);
  uint64_t v9 = v8;

  if (v9)
  {
    id v10 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

@end