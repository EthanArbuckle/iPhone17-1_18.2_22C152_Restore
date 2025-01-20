@interface REMCustomSmartListFilterDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor)init;
- (_TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMCustomSmartListFilterDescriptor

- (_TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor)init
{
  return (_TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor *)REMCustomSmartListFilterDescriptor.init()();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  REMCustomSmartListFilterDescriptor.encode(with:)((NSCoder)v4);
}

- (_TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor)initWithCoder:(id)a3
{
  return (_TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor *)REMCustomSmartListFilterDescriptor.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A7573330();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = REMCustomSmartListFilterDescriptor.isEqual(_:)((uint64_t)v8);

  sub_1A72CB560((uint64_t)v8, &qword_1EB705938);
  return v6 & 1;
}

- (NSString)description
{
  v2 = self;
  REMCustomSmartListFilterDescriptor.description.getter();

  v3 = (void *)sub_1A75725E0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  sub_1A7384C20(*(unint64_t *)((char *)&self->super.isa
                                    + OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_hashtags));
  sub_1A72CB560((uint64_t)self + OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_date, (uint64_t *)&unk_1E96F2370);
  swift_bridgeObjectRelease();
  sub_1A7384C44(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location), *(void *)&self->operation[OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location], *(void *)&self->hashtags[OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location + 7], *(void *)&self->hashtags[OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location + 15], *(void *)&self->priorities[OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location + 5], *(void *)&self->location[OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location + 4], self->location[OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_location + 12]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC19ReminderKitInternal34REMCustomSmartListFilterDescriptor_lists);

  sub_1A7384C58(v3);
}

@end