@interface MailActionCatchUpFeedbackCell
+ (NSString)reusableIdentifier;
- (BOOL)_disableRasterizeInAnimations;
- (_TtC10MobileMail29MailActionCatchUpFeedbackCell)initWithCoder:(id)a3;
- (_TtC10MobileMail29MailActionCatchUpFeedbackCell)initWithFrame:(CGRect)a3;
- (_TtP10MobileMail37MailActionCatchUpFeedbackCellDelegate_)delegate;
- (void)handleThumbsDownWithSender:(id)a3;
- (void)handleThumbsUpWithSender:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MailActionCatchUpFeedbackCell

- (_TtP10MobileMail37MailActionCatchUpFeedbackCellDelegate_)delegate
{
  v2 = self;
  id v5 = (id)sub_100340270();

  return (_TtP10MobileMail37MailActionCatchUpFeedbackCellDelegate_ *)v5;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100340328();
}

+ (NSString)reusableIdentifier
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  sub_1003409D0();
  id v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC10MobileMail29MailActionCatchUpFeedbackCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail29MailActionCatchUpFeedbackCell *)sub_100340A10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail29MailActionCatchUpFeedbackCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100340BE4();
}

- (BOOL)_disableRasterizeInAnimations
{
  v2 = self;
  sub_100340D28();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)handleThumbsUpWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10034112C((uint64_t)a3);
}

- (void)handleThumbsDownWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100341228((uint64_t)a3);
}

- (void).cxx_destruct
{
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail29MailActionCatchUpFeedbackCell____lazy_storage___thumbsUpButton));
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail29MailActionCatchUpFeedbackCell____lazy_storage___thumbsDownButton));
}

@end