@interface PKDataReleaseElementsCell
- (_TtC9PassKitUI25PKDataReleaseElementsCell)initWithCoder:(id)a3;
- (_TtC9PassKitUI25PKDataReleaseElementsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration)dataReleaseConfiguration;
- (void)setDataReleaseConfiguration:(id)a3;
@end

@implementation PKDataReleaseElementsCell

- (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration)dataReleaseConfiguration
{
  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC9PassKitUI25PKDataReleaseElementsCell_dataReleaseConfiguration);
  swift_beginAccess();
  return (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration *)*v2;
}

- (void)setDataReleaseConfiguration:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC9PassKitUI25PKDataReleaseElementsCell_dataReleaseConfiguration);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_19FAE770C();
}

- (_TtC9PassKitUI25PKDataReleaseElementsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_1A03B4988();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC9PassKitUI25PKDataReleaseElementsCell_dataReleaseConfiguration) = 0;
    a4 = (id)sub_1A03B4958();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC9PassKitUI25PKDataReleaseElementsCell_dataReleaseConfiguration) = 0;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = [(PKDataReleaseElementsCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (_TtC9PassKitUI25PKDataReleaseElementsCell)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI25PKDataReleaseElementsCell_dataReleaseConfiguration) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(PKDataReleaseElementsCell *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI25PKDataReleaseElementsCell_dataReleaseConfiguration));
}

@end