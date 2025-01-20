@interface SAUIAudioDescription
+ (id)audioDescription;
- (NSNumber)bitsPerChannel;
- (NSNumber)bytesPerFrame;
- (NSNumber)bytesPerPacket;
- (NSNumber)channelsPerFrame;
- (NSNumber)formatFlags;
- (NSNumber)formatID;
- (NSNumber)framesPerPacket;
- (NSNumber)reserved;
- (NSNumber)sampleRate;
- (NSString)format;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBitsPerChannel:(id)a3;
- (void)setBytesPerFrame:(id)a3;
- (void)setBytesPerPacket:(id)a3;
- (void)setChannelsPerFrame:(id)a3;
- (void)setFormat:(id)a3;
- (void)setFormatFlags:(id)a3;
- (void)setFormatID:(id)a3;
- (void)setFramesPerPacket:(id)a3;
- (void)setReserved:(id)a3;
- (void)setSampleRate:(id)a3;
@end

@implementation SAUIAudioDescription

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AudioDescription";
}

+ (id)audioDescription
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)bitsPerChannel
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"bitsPerChannel"];
}

- (void)setBitsPerChannel:(id)a3
{
}

- (NSNumber)bytesPerFrame
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"bytesPerFrame"];
}

- (void)setBytesPerFrame:(id)a3
{
}

- (NSNumber)bytesPerPacket
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"bytesPerPacket"];
}

- (void)setBytesPerPacket:(id)a3
{
}

- (NSNumber)channelsPerFrame
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"channelsPerFrame"];
}

- (void)setChannelsPerFrame:(id)a3
{
}

- (NSString)format
{
  return (NSString *)[(AceObject *)self propertyForKey:@"format"];
}

- (void)setFormat:(id)a3
{
}

- (NSNumber)formatFlags
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"formatFlags"];
}

- (void)setFormatFlags:(id)a3
{
}

- (NSNumber)formatID
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"formatID"];
}

- (void)setFormatID:(id)a3
{
}

- (NSNumber)framesPerPacket
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"framesPerPacket"];
}

- (void)setFramesPerPacket:(id)a3
{
}

- (NSNumber)reserved
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"reserved"];
}

- (void)setReserved:(id)a3
{
}

- (NSNumber)sampleRate
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"sampleRate"];
}

- (void)setSampleRate:(id)a3
{
}

@end