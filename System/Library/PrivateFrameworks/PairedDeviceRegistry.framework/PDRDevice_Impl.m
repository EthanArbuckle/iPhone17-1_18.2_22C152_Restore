@interface PDRDevice_Impl
- (BOOL)supportsCapabilityRaw:(unsigned int)a3;
- (NSUUID)pairingID;
- (PDRDevice_Impl)init;
- (id)propertyNames;
- (id)valueForProperty:(id)a3;
@end

@implementation PDRDevice_Impl

- (NSUUID)pairingID
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  return (NSUUID *)v2.super.isa;
}

- (id)valueForProperty:(id)a3
{
  id v4 = a3;
  v5 = self;
  Device_Impl.valueFor(property:)((uint64_t)v13);

  uint64_t v6 = v14;
  if (v14)
  {
    v7 = __swift_project_boxed_opaque_existential_0(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    MEMORY[0x270FA5388](v7);
    v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    v11 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)propertyNames
{
  NSUUID v2 = self;
  Device_Impl.propertyNames()();

  type metadata accessor for PDRDevicePropertyKey(0);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v3.super.isa;
}

- (BOOL)supportsCapabilityRaw:(unsigned int)a3
{
  id v4 = self;
  LOBYTE(a3) = Device_Impl.supportsCapabilityRaw(_:)(a3);

  return a3 & 1;
}

- (PDRDevice_Impl)init
{
  result = (PDRDevice_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSArray v3 = (char *)self + OBJC_IVAR___PDRDevice_Impl_uuid_;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = *(id *)&self->_anon_0[OBJC_IVAR___PDRDevice_Impl_registryState];
}

@end