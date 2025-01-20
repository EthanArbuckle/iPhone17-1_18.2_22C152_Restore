@interface _SEHostingUpdateCoordinator
+ (BOOL)supportsSecureCoding;
- (_SEHostingUpdateCoordinator)init;
- (_SEHostingUpdateCoordinator)initWithCoder:(id)a3;
- (id)initFromXPCRepresentation:(id)a3;
- (id)xpcRepresentation;
- (void)addHostable:(id)a3;
- (void)addHostingView:(id)a3;
- (void)commit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SEHostingUpdateCoordinator

- (_SEHostingUpdateCoordinator)init
{
  return (_SEHostingUpdateCoordinator *)_SEHostingUpdateCoordinator.init()();
}

- (id)initFromXPCRepresentation:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = sub_25C220AF4((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (id)xpcRepresentation
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____SEHostingUpdateCoordinator__fence);
  if (v2) {
    id v2 = objc_msgSend(v2, sel_createXPCRepresentation);
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SEHostingUpdateCoordinator)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_SEHostingUpdateCoordinator *)sub_25C220BF8();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____SEHostingUpdateCoordinator__fence);
  id v5 = a3;
  v6 = self;
  id v7 = (id)sub_25C2219D8();
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);
}

- (void)dealloc
{
  id v2 = self;
  _SEHostingUpdateCoordinator.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)addHostable:(id)a3
{
  uint64_t v4 = (char *)a3;
  id v5 = self;
  _SEHostingUpdateCoordinator.add(_:)(v4);
}

- (void)addHostingView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _SEHostingUpdateCoordinator.add(_:)(v4);
}

- (void)commit
{
  id v2 = self;
  _SEHostingUpdateCoordinator.commit()();
}

@end