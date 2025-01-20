@interface StoryCardMediaView
- (_TtC8AppStore18StoryCardMediaView)initWithCoder:(id)a3;
- (_TtC8AppStore18StoryCardMediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation StoryCardMediaView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(StoryCardMediaView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore18StoryCardMediaView_revealingImageView];
  [v2 bounds];
  [v3 setFrame:];
  v4 = *(void **)&v2[OBJC_IVAR____TtC8AppStore18StoryCardMediaView_revealingVideoView];
  [v2 bounds];
  [v4 setFrame:];
}

- (_TtC8AppStore18StoryCardMediaView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore18StoryCardMediaView *)sub_100051B68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore18StoryCardMediaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10070CCCC();
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore18StoryCardMediaView_pageGrid, (uint64_t *)&unk_100983860);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18StoryCardMediaView_revealingImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18StoryCardMediaView_revealingVideoView);
}

@end