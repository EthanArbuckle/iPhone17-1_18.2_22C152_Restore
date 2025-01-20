@interface RWIProtocolDOMVideoMediaStats
- (NSString)codec;
- (NSString)humanReadableCodecString;
- (RWIProtocolDOMVideoColorSpace)colorSpace;
- (RWIProtocolDOMVideoMediaStats)initWithBitrate:(int)a3 codec:(id)a4 humanReadableCodecString:(id)a5 colorSpace:(id)a6 framerate:(double)a7 height:(int)a8 width:(int)a9;
- (double)framerate;
- (int)bitrate;
- (int)height;
- (int)width;
- (void)setBitrate:(int)a3;
- (void)setCodec:(id)a3;
- (void)setColorSpace:(id)a3;
- (void)setFramerate:(double)a3;
- (void)setHeight:(int)a3;
- (void)setHumanReadableCodecString:(id)a3;
- (void)setWidth:(int)a3;
@end

@implementation RWIProtocolDOMVideoMediaStats

- (RWIProtocolDOMVideoMediaStats)initWithBitrate:(int)a3 codec:(id)a4 humanReadableCodecString:(id)a5 colorSpace:(id)a6 framerate:(double)a7 height:(int)a8 width:(int)a9
{
  uint64_t v9 = *(void *)&a9;
  uint64_t v10 = *(void *)&a8;
  uint64_t v14 = *(void *)&a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  v19 = [(RWIProtocolJSONObject *)&v22 init];
  if (v19)
  {
    if (!v16) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"codec" format];
    }
    if (!v17) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"humanReadableCodecString" format];
    }
    if (!v18) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"colorSpace" format];
    }
    [(RWIProtocolDOMVideoMediaStats *)v19 setBitrate:v14];
    [(RWIProtocolDOMVideoMediaStats *)v19 setCodec:v16];
    [(RWIProtocolDOMVideoMediaStats *)v19 setHumanReadableCodecString:v17];
    [(RWIProtocolDOMVideoMediaStats *)v19 setColorSpace:v18];
    [(RWIProtocolDOMVideoMediaStats *)v19 setFramerate:a7];
    [(RWIProtocolDOMVideoMediaStats *)v19 setHeight:v10];
    [(RWIProtocolDOMVideoMediaStats *)v19 setWidth:v9];
    v20 = v19;
  }

  return v19;
}

- (void)setBitrate:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"bitrate"];
}

- (int)bitrate
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"bitrate"];
}

- (void)setCodec:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"codec"];
}

- (NSString)codec
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"codec"];
  return (NSString *)v2;
}

- (void)setHumanReadableCodecString:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"humanReadableCodecString"];
}

- (NSString)humanReadableCodecString
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"humanReadableCodecString"];
  return (NSString *)v2;
}

- (void)setColorSpace:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"colorSpace"];
}

- (RWIProtocolDOMVideoColorSpace)colorSpace
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"colorSpace"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolDOMVideoColorSpace alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMVideoMediaStats;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"colorSpace"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v8;
      }
    }
    uint64_t v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v9;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setFramerate:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"framerate" forKey:a3];
}

- (double)framerate
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"framerate"];
  return result;
}

- (void)setHeight:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"height"];
}

- (int)height
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"height"];
}

- (void)setWidth:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"width"];
}

- (int)width
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoMediaStats;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"width"];
}

@end