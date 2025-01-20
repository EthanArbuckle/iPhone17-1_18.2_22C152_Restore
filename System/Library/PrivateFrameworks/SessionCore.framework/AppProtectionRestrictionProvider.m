@interface AppProtectionRestrictionProvider
- (_TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332AppProtectionRestrictionProvider)init;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
@end

@implementation AppProtectionRestrictionProvider

- (_TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332AppProtectionRestrictionProvider)init
{
  return (_TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332AppProtectionRestrictionProvider *)sub_1C7CB9668();
}

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332AppProtectionRestrictionProvider_subjectMonitorSubscription);
  v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_invalidate);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AppProtectionRestrictionProvider();
  [(AppProtectionRestrictionProvider *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  swift_unknownObjectRetain();
  objc_super v5 = self;
  sub_1C7CB98C0();
  swift_unknownObjectRelease();
}

@end