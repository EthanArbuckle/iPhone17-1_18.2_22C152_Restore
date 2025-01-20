@interface MNNavigationServiceCallback_DidUpdateNavTrayGuidance
+ (BOOL)supportsSecureCoding;
- (MNNavTrayGuidanceEvent)navTrayGuidanceEvent;
- (_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance)init;
- (_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance)initWithCoder:(id)a3;
- (_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance)initWithNavTrayGuidanceEvent:(id)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MNNavigationServiceCallback_DidUpdateNavTrayGuidance

- (MNNavTrayGuidanceEvent)navTrayGuidanceEvent
{
  return (MNNavTrayGuidanceEvent *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent));
}

- (_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance)initWithNavTrayGuidanceEvent:(id)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance();
  id v4 = a3;
  return [(MNNavigationServiceCallback_DidUpdateNavTrayGuidance *)&v6 init];
}

- (unint64_t)type
{
  return 8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance)initWithCoder:(id)a3
{
  type metadata accessor for MNNavTrayGuidanceEvent(0);
  id v5 = a3;
  objc_super v6 = self;
  *(Class *)((char *)&v6->super.super.isa
           + OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent) = (Class)sub_1B5531FC0();

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance();
  v7 = [(MNNavigationServiceCallbackParameters *)&v9 initWithCoder:v5];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance();
  id v4 = a3;
  id v5 = (char *)v8.receiver;
  [(MNNavigationServiceCallbackParameters *)&v8 encodeWithCoder:v4];
  uint64_t v6 = *(void *)&v5[OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent];
  v7 = (void *)sub_1B5531ED0();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7, v8.receiver, v8.super_class);
}

- (_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance)init
{
  result = (_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent));
}

@end