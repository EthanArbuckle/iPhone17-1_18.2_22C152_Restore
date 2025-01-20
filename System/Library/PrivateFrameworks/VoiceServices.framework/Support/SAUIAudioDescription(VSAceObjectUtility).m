@interface SAUIAudioDescription(VSAceObjectUtility)
- (id)vsDescription;
@end

@implementation SAUIAudioDescription(VSAceObjectUtility)

- (id)vsDescription
{
  v2 = [a1 formatID];
  unsigned int v3 = [v2 intValue];

  uint64_t v4 = HIBYTE(v3);
  v5 = NSString;
  uint64_t v6 = BYTE2(v3);
  uint64_t v7 = BYTE1(v3);
  uint64_t v8 = v3;
  v9 = [a1 sampleRate];
  [v9 floatValue];
  double v11 = v10;
  v12 = [a1 bitsPerChannel];
  uint64_t v13 = [v12 intValue];
  v14 = [a1 framesPerPacket];
  v15 = [v5 stringWithFormat:@"'%c%c%c%c', %.0fhz, %d bits, %d FPP, ", v4, v6, v7, v8, *(void *)&v11, v13, objc_msgSend(v14, "intValue")];

  return v15;
}

@end