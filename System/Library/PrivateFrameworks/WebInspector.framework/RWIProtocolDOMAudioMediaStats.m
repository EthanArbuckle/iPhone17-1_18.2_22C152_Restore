@interface RWIProtocolDOMAudioMediaStats
- (NSString)codec;
- (NSString)humanReadableCodecString;
- (RWIProtocolDOMAudioMediaStats)initWithBitrate:(int)a3 codec:(id)a4 humanReadableCodecString:(id)a5 numberOfChannels:(int)a6 sampleRate:(double)a7;
- (double)sampleRate;
- (int)bitrate;
- (int)numberOfChannels;
- (void)setBitrate:(int)a3;
- (void)setCodec:(id)a3;
- (void)setHumanReadableCodecString:(id)a3;
- (void)setNumberOfChannels:(int)a3;
- (void)setSampleRate:(double)a3;
@end

@implementation RWIProtocolDOMAudioMediaStats

- (RWIProtocolDOMAudioMediaStats)initWithBitrate:(int)a3 codec:(id)a4 humanReadableCodecString:(id)a5 numberOfChannels:(int)a6 sampleRate:(double)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  v14 = [(RWIProtocolJSONObject *)&v17 init];
  if (v14)
  {
    if (!v12) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"codec" format];
    }
    if (!v13) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"humanReadableCodecString" format];
    }
    [(RWIProtocolDOMAudioMediaStats *)v14 setBitrate:v10];
    [(RWIProtocolDOMAudioMediaStats *)v14 setCodec:v12];
    [(RWIProtocolDOMAudioMediaStats *)v14 setHumanReadableCodecString:v13];
    [(RWIProtocolDOMAudioMediaStats *)v14 setNumberOfChannels:v8];
    [(RWIProtocolDOMAudioMediaStats *)v14 setSampleRate:a7];
    v15 = v14;
  }

  return v14;
}

- (void)setBitrate:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"bitrate"];
}

- (int)bitrate
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"bitrate"];
}

- (void)setCodec:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"codec"];
}

- (NSString)codec
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"codec"];
  return (NSString *)v2;
}

- (void)setHumanReadableCodecString:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"humanReadableCodecString"];
}

- (NSString)humanReadableCodecString
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"humanReadableCodecString"];
  return (NSString *)v2;
}

- (void)setNumberOfChannels:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"numberOfChannels"];
}

- (int)numberOfChannels
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"numberOfChannels"];
}

- (void)setSampleRate:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"sampleRate" forKey:a3];
}

- (double)sampleRate
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAudioMediaStats;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"sampleRate"];
  return result;
}

@end