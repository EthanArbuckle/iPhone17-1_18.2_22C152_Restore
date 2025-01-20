@interface SemiExpandedMessageHeaderSubjectBlock
- (_TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock)initWithFrame:(CGRect)a3;
- (_TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock)initWithHandler:(id)a3;
- (void)createPrimaryViews;
- (void)displayMessageUsingViewModel:(id)a3;
- (void)tappedHeader:(id)a3;
@end

@implementation SemiExpandedMessageHeaderSubjectBlock

- (_TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock)initWithHandler:(id)a3
{
  v5 = _Block_copy(a3);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v5;
  return (_TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock *)sub_1004029CC((uint64_t)sub_1003CC0B4, v3);
}

- (void)displayMessageUsingViewModel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100402D98(a3);
}

- (void)createPrimaryViews
{
  v2 = self;
  sub_100403160();
}

- (void)tappedHeader:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10040463C();
}

- (_TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock *)sub_10040493C();
}

- (void).cxx_destruct
{
  sub_10024C328((id *)&self->MFMessageHeaderViewBlock_opaque[OBJC_IVAR____TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock_tappedRecognizer]);
  swift_release();
}

@end