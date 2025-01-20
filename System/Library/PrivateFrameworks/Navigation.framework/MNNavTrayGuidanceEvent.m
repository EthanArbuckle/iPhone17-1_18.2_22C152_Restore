@interface MNNavTrayGuidanceEvent
+ (BOOL)supportsSecureCoding;
- (GEOComposedString)detail;
- (GEOComposedString)title;
- (MNNavTrayGuidanceEvent)init;
- (MNNavTrayGuidanceEvent)initWithCoder:(id)a3;
- (MNNavTrayGuidanceEvent)initWithGuidanceEvent:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MNNavTrayGuidanceEvent

- (MNNavTrayGuidanceEvent)initWithGuidanceEvent:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)MNNavTrayGuidanceEvent;
  id v3 = a3;
  return [(MNNavTrayGuidanceEvent *)&v5 init];
}

- (GEOComposedString)title
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent), sel_navTrayTitleString);
  return (GEOComposedString *)v2;
}

- (GEOComposedString)detail
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent), sel_navTrayDetailString);
  return (GEOComposedString *)v2;
}

- (NSString)description
{
  id v2 = self;
  MNNavTrayGuidanceEvent.description.getter();

  id v3 = (void *)sub_1B5531ED0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent);
  id v5 = a3;
  v6 = self;
  id v7 = (id)sub_1B5531ED0();
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);
}

- (MNNavTrayGuidanceEvent)initWithCoder:(id)a3
{
  sub_1B5438B88(0, (unint64_t *)&unk_1E9D55008);
  id v5 = a3;
  v6 = self;
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent) = (Class)sub_1B5531FC0();

  v9.receiver = v6;
  v9.super_class = (Class)MNNavTrayGuidanceEvent;
  id v7 = [(MNNavTrayGuidanceEvent *)&v9 init];

  return v7;
}

- (MNNavTrayGuidanceEvent)init
{
  result = (MNNavTrayGuidanceEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end