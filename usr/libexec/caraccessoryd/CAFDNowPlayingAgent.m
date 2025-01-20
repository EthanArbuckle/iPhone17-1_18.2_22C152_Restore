@interface CAFDNowPlayingAgent
- (_TtC13caraccessoryd19CAFDNowPlayingAgent)initWithCarManager:(id)a3;
- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdateAccessories:(id)a3;
- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4;
- (void)mediaSourceService:(id)a3 didUpdateCurrentFrequency:(unsigned int)a4;
- (void)nowPlayingService:(id)a3 didUpdateAlbum:(id)a4;
- (void)nowPlayingService:(id)a3 didUpdateArtwork:(id)a4;
- (void)nowPlayingService:(id)a3 didUpdateCurrentMediaSourceIdentifier:(id)a4;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
@end

@implementation CAFDNowPlayingAgent

- (_TtC13caraccessoryd19CAFDNowPlayingAgent)initWithCarManager:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13caraccessoryd19CAFDNowPlayingAgent *)specialized CAFDNowPlayingAgent.init(carManager:)(v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4 = a3;
  v5 = self;
  CAFDNowPlayingAgent.carDidUpdateAccessories(_:)(v4);
}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  CAFDNowPlayingAgent.accessoryDidUpdate(_:receivedAllValues:)(v6, a4);
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized CAFDNowPlayingAgent.carManager(_:didUpdateCurrentCar:)(a4);
}

- (void)nowPlayingService:(id)a3 didUpdateCurrentMediaSourceIdentifier:(id)a4
{
  v5 = (objc_class *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = v6;
  v8 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier);
  BOOL v9 = v5 == *(objc_class **)((char *)&self->super.super.isa
                            + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier)
    && v6 == *(objc_class **)&self->super.listener[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier];
  if (v9 || (v10 = v5, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    id v11 = a3;
  }
  else
  {
    _TtC13caraccessoryd19CAFDNowPlayingAgent *v8 = v10;
    v8[1] = v7;
    id v12 = a3;
    v13 = self;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    CAFDNowPlayingAgent.lastMediaSourceIdentifier.didset();
  }
  swift_bridgeObjectRelease();
}

- (void)nowPlayingService:(id)a3 didUpdateAlbum:(id)a4
{
  id v5 = a3;
  id v6 = self;
  CAFDNowPlayingAgent.updateNowPlaying()();
}

- (void)nowPlayingService:(id)a3 didUpdateArtwork:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  CAFDNowPlayingAgent.updateNowPlaying()();
  outlined consume of Data._Representation(v8, v10);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  CAFDNowPlayingAgent.serviceDidUpdate(_:receivedAllValues:)(v6, a4);
}

- (void)mediaSourceService:(id)a3 didUpdateCurrentFrequency:(unsigned int)a4
{
  id v5 = a3;
  id v6 = self;
  CAFDNowPlayingAgent.updateNowPlaying()();
}

@end