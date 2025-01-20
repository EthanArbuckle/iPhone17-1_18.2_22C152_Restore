@interface NowPlayingQueueCell.TextView
- (_TtCC5Music19NowPlayingQueueCell8TextView)initWithCoder:(id)a3;
- (_TtCC5Music19NowPlayingQueueCell8TextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)layoutSubviews;
@end

@implementation NowPlayingQueueCell.TextView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingQueueCell.TextView();
  v2 = (char *)v5.receiver;
  [(NowPlayingQueueCell.TextView *)&v5 layoutSubviews];
  v3 = *(void (**)(uint64_t))&v2[OBJC_IVAR____TtCC5Music19NowPlayingQueueCell8TextView_didLayoutSubviews];
  if (v3)
  {
    uint64_t v4 = swift_retain();
    v3(v4);
    sub_10006ADFC((uint64_t)v3);
  }
}

- (_TtCC5Music19NowPlayingQueueCell8TextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC5Music19NowPlayingQueueCell8TextView_didLayoutSubviews);
  v11 = (objc_class *)type metadata accessor for NowPlayingQueueCell.TextView();
  void *v10 = 0;
  v10[1] = 0;
  v13.receiver = self;
  v13.super_class = v11;
  return -[NowPlayingQueueCell.TextView initWithFrame:textContainer:](&v13, "initWithFrame:textContainer:", a4, x, y, width, height);
}

- (_TtCC5Music19NowPlayingQueueCell8TextView)initWithCoder:(id)a3
{
  objc_super v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCC5Music19NowPlayingQueueCell8TextView_didLayoutSubviews);
  v6 = (objc_class *)type metadata accessor for NowPlayingQueueCell.TextView();
  *objc_super v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(NowPlayingQueueCell.TextView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtCC5Music19NowPlayingQueueCell8TextView_didLayoutSubviews));
}

@end