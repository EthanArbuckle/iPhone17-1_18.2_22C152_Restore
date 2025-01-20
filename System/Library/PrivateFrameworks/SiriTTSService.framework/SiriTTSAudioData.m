@interface SiriTTSAudioData
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (AudioStreamBasicDescription)asbd;
- (BOOL)isEqual:(id)a3;
- (NSData)audioData;
- (NSData)packetDescriptions;
- (NSString)description;
- (SiriTTSAudioData)init;
- (SiriTTSAudioData)initWithCoder:(id)a3;
- (int64_t)hash;
- (int64_t)packetCount;
- (void)encodeWithCoder:(id)a3;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setAudioData:(id)a3;
- (void)setPacketCount:(int64_t)a3;
- (void)setPacketDescriptions:(id)a3;
@end

@implementation SiriTTSAudioData

- (AudioStreamBasicDescription)asbd
{
  sub_19CDB71B4((uint64_t)&v7);
  long long v5 = v8;
  long long v6 = v9;
  retstr->mSampleRate = v7;
  *(_OWORD *)&retstr->mFormatID = v5;
  *(_OWORD *)&retstr->mBytesPerFrame = v6;
  return result;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  Float64 mSampleRate = a3->mSampleRate;
  long long v3 = *(_OWORD *)&a3->mBytesPerFrame;
  long long v5 = *(_OWORD *)&a3->mFormatID;
  long long v6 = v3;
  sub_19CDB7250((uint64_t)&mSampleRate);
}

- (NSData)audioData
{
  return (NSData *)sub_19CDB7630((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CDB7344);
}

- (void)setAudioData:(id)a3
{
}

- (int64_t)packetCount
{
  return sub_19CDB74D8();
}

- (void)setPacketCount:(int64_t)a3
{
}

- (NSData)packetDescriptions
{
  return (NSData *)sub_19CDB7630((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CDB768C);
}

- (void)setPacketDescriptions:(id)a3
{
}

- (SiriTTSAudioData)init
{
  return (SiriTTSAudioData *)AudioData.init()();
}

+ (BOOL)supportsSecureCoding
{
  return static AudioData.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  sub_19CDB7A70(v4);
}

- (SiriTTSAudioData)initWithCoder:(id)a3
{
  return (SiriTTSAudioData *)AudioData.init(coder:)(a3);
}

- (NSString)description
{
  v2 = self;
  sub_19CDB7FF0();

  long long v3 = (void *)sub_19CED5230();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  sub_19CDB73CC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSAudioData_audioData), *(void *)&self->asbd[OBJC_IVAR___SiriTTSAudioData_audioData]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSAudioData_packetDescriptions);
  unint64_t v4 = *(void *)&self->asbd[OBJC_IVAR___SiriTTSAudioData_packetDescriptions];
  sub_19CDB73CC(v3, v4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    unint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_19CED5AB0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    long long v5 = self;
  }
  char v6 = AudioData.isEqual(_:)((uint64_t)v8);

  sub_19CDAE760((uint64_t)v8, (uint64_t *)&unk_1EB534C40);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = AudioData.hash.getter();

  return v3;
}

@end