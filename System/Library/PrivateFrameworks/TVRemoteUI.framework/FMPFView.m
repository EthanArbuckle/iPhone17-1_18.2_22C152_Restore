@interface FMPFView
- (NSString)description;
- (_TtC10TVRemoteUI8FMPFView)initWithCoder:(id)a3;
- (_TtC10TVRemoteUI8FMPFView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)thermalStateDidChangeWithNotification:(id)a3;
@end

@implementation FMPFView

- (_TtC10TVRemoteUI8FMPFView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized FMPFView.init(coder:)();
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = FMR1HapticsController.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x22A677130](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI8FMPFView_ecoModeObservation);
  uint64_t v4 = self;
  if (v3)
  {
    id v5 = v3;
    dispatch thunk of NSKeyValueObservation.invalidate()();
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMPFView();
  [(FMPFView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  outlined init with take of FMPFSKPatternNodeConfig?((uint64_t)self + OBJC_IVAR____TtC10TVRemoteUI8FMPFView_config, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for FMPFSKPatternNodeConfig?);
  outlined retain of FMPFSKPatternNodeConfig?((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))outlined consume of FMPFSKPatternNodeConfig?);

  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI8FMPFView_backdropRGBAColorSprings);
  uint64_t v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC10TVRemoteUI8FMPFView_backdropRGBAColorSprings);
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC10TVRemoteUI8FMPFView_backdropRGBAColorSprings));

  outlined destroy of weak FMPFSKPatternNodeDelegate?((uint64_t)self + OBJC_IVAR____TtC10TVRemoteUI8FMPFView_fmpfdelegate);
}

- (void)thermalStateDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  FMPFView.thermalStateDidChange(notification:)((NSNotification)v4);
}

- (_TtC10TVRemoteUI8FMPFView)initWithFrame:(CGRect)a3
{
  result = (_TtC10TVRemoteUI8FMPFView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end