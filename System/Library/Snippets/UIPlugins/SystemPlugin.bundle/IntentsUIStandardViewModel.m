@interface IntentsUIStandardViewModel
- (_TtC12SystemPlugin26IntentsUIStandardViewModel)init;
- (id)maximumSizesBySystemVersionForRemoteViewController:(id)a3;
@end

@implementation IntentsUIStandardViewModel

- (_TtC12SystemPlugin26IntentsUIStandardViewModel)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC12SystemPlugin26IntentsUIStandardViewModel_dataModel;
  sub_32F78();
  sub_9408();
  (*(void (**)(char *))(v4 + 8))(v3);
  v5 = (char *)self + OBJC_IVAR____TtC12SystemPlugin26IntentsUIStandardViewModel__resolvedViews;
  sub_63C4(&qword_41358);
  sub_9408();
  (*(void (**)(char *))(v6 + 8))(v5);
  swift_release();

  swift_bridgeObjectRelease();
}

- (id)maximumSizesBySystemVersionForRemoteViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_60C0();

  sub_752C(0, &qword_41338);
  sub_752C(0, &qword_41340);
  sub_6BD0(&qword_41348, &qword_41338);
  v6.super.isa = sub_339C8().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

@end