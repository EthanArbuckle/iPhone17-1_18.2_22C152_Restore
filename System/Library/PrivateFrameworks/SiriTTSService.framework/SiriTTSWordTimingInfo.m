@interface SiriTTSWordTimingInfo
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SiriTTSWordTimingInfo)init;
- (SiriTTSWordTimingInfo)initWithCoder:(id)a3;
- (SiriTTSWordTimingInfo)initWithStartTiming:(double)a3 textRange:(_NSRange)a4;
- (_NSRange)textRange;
- (double)startTime;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTextRange:(_NSRange)a3;
@end

@implementation SiriTTSWordTimingInfo

+ (BOOL)supportsSecureCoding
{
  return static WordTimingInfo.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (double)startTime
{
  return sub_19CDCA8A8();
}

- (void)setStartTime:(double)a3
{
}

- (_NSRange)textRange
{
  NSUInteger v2 = sub_19CDCA9C4();
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
}

- (SiriTTSWordTimingInfo)init
{
  return (SiriTTSWordTimingInfo *)WordTimingInfo.init()();
}

- (SiriTTSWordTimingInfo)initWithStartTiming:(double)a3 textRange:(_NSRange)a4
{
  return (SiriTTSWordTimingInfo *)WordTimingInfo.init(startTiming:textRange:)(a4.location, a4.length, a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDCAC84(v4);
}

- (SiriTTSWordTimingInfo)initWithCoder:(id)a3
{
  return (SiriTTSWordTimingInfo *)WordTimingInfo.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19CDD8FE8(self, (uint64_t)a2, (void (*)(void))sub_19CDCAF8C);
}

- (BOOL)isEqual:(id)a3
{
  return sub_19CDD7844(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))WordTimingInfo.isEqual(_:));
}

- (int64_t)hash
{
  return WordTimingInfo.hash.getter();
}

@end