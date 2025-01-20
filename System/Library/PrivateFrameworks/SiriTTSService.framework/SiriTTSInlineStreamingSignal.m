@interface SiriTTSInlineStreamingSignal
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)text;
- (SiriTTSInlineStreamingSignal)init;
- (SiriTTSInlineStreamingSignal)initWithCoder:(id)a3;
- (SiriTTSInlineStreamingSignal)initWithText:(id)a3 identifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriTTSInlineStreamingSignal

- (NSString)text
{
  return (NSString *)sub_19CE8D6AC((uint64_t)self, (uint64_t)a2, (void (*)(void))InlineStreamingSignal.text.getter);
}

- (NSString)identifier
{
  return (NSString *)sub_19CE8D6AC((uint64_t)self, (uint64_t)a2, (void (*)(void))InlineStreamingSignal.identifier.getter);
}

- (SiriTTSInlineStreamingSignal)initWithText:(id)a3 identifier:(id)a4
{
  uint64_t v4 = sub_19CED5260();
  uint64_t v6 = v5;
  uint64_t v7 = sub_19CED5260();
  return (SiriTTSInlineStreamingSignal *)InlineStreamingSignal.init(text:identifier:)(v4, v6, v7, v8);
}

+ (BOOL)supportsSecureCoding
{
  return static InlineStreamingSignal.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_19CE8D92C(v4);
}

- (SiriTTSInlineStreamingSignal)initWithCoder:(id)a3
{
  return (SiriTTSInlineStreamingSignal *)InlineStreamingSignal.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19CE8DBF8(self, (uint64_t)a2, (void (*)(void))sub_19CE8DC68);
}

- (SiriTTSInlineStreamingSignal)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end