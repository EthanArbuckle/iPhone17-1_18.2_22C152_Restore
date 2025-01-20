@interface GlobalsImpl
+ (_TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl)shared;
- (BOOL)isInternalInstall;
- (NSString)localDeviceAssistantIdentifier;
- (_TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl)init;
- (double)historyLengthSeconds;
- (void)setHistoryLengthSeconds:(double)a3;
- (void)setLocalDeviceAssistantIdentifier:(id)a3;
@end

@implementation GlobalsImpl

- (double)historyLengthSeconds
{
  return sub_25C76BDD0();
}

- (void)setHistoryLengthSeconds:(double)a3
{
}

+ (_TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl)shared
{
  id v2 = static GlobalsImpl.shared.getter();

  return (_TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl *)v2;
}

- (BOOL)isInternalInstall
{
  id v2 = self;
  unsigned __int8 v3 = sub_25C76BFE0();

  return v3 & 1;
}

- (NSString)localDeviceAssistantIdentifier
{
  sub_25C76C07C();
  if (v2)
  {
    unsigned __int8 v3 = (void *)sub_25C7B4CF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setLocalDeviceAssistantIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_25C7B4D00();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_25C76C140(v4, v6);
}

- (_TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl)init
{
  return (_TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl *)GlobalsImpl.init()();
}

- (void).cxx_destruct
{
}

@end