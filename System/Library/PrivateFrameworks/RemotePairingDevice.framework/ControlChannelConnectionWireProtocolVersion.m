@interface ControlChannelConnectionWireProtocolVersion
+ (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion)current;
+ (void)setCurrent:(id)a3;
- (NSString)description;
- (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion)init;
- (int64_t)rawValue;
@end

@implementation ControlChannelConnectionWireProtocolVersion

- (NSString)description
{
  v2 = self;
  sub_1D758AF48();

  v3 = (void *)sub_1D7660AE0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion)current
{
  id v2 = static ControlChannelConnectionWireProtocolVersion.current.getter();
  return (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion *)v2;
}

+ (void)setCurrent:(id)a3
{
}

- (int64_t)rawValue
{
  return ControlChannelConnectionWireProtocolVersion.rawValue.getter();
}

- (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion)init
{
}

@end