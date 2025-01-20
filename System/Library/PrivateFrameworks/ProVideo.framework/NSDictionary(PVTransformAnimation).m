@interface NSDictionary(PVTransformAnimation)
+ (id)dictionaryWithPVTransformAnimationInfo:()PVTransformAnimation;
- (void)PVTransformAnimationInfo;
@end

@implementation NSDictionary(PVTransformAnimation)

+ (id)dictionaryWithPVTransformAnimationInfo:()PVTransformAnimation
{
  v13[6] = *MEMORY[0x1E4F143B8];
  v12[0] = @"tV";
  v4 = [NSNumber numberWithLongLong:*(void *)a3];
  v13[0] = v4;
  v12[1] = @"tS";
  v5 = [NSNumber numberWithInt:*(unsigned int *)(a3 + 8)];
  v13[1] = v5;
  v12[2] = @"X";
  v6 = [NSNumber numberWithDouble:*(double *)(a3 + 24)];
  v13[2] = v6;
  v12[3] = @"Y";
  v7 = [NSNumber numberWithDouble:*(double *)(a3 + 32)];
  v13[3] = v7;
  v12[4] = @"S";
  v8 = [NSNumber numberWithDouble:*(double *)(a3 + 40)];
  v13[4] = v8;
  v12[5] = @"R";
  v9 = [NSNumber numberWithDouble:*(double *)(a3 + 48)];
  v13[5] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];

  return v10;
}

- (void)PVTransformAnimationInfo
{
  uint64_t v4 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)a2 = *MEMORY[0x1E4F1FA48];
  *(void *)(a2 + 16) = *(void *)(v4 + 16);
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)(a2 + 40) = xmmword_1B7E733D0;
  v5 = [a1 objectForKeyedSubscript:@"tV"];
  v6 = [a1 objectForKeyedSubscript:@"tS"];
  CMTimeMake(&v15, [v5 longLongValue], objc_msgSend(v6, "intValue"));
  *(CMTime *)a2 = v15;
  v7 = [a1 objectForKeyedSubscript:@"X"];

  [v7 doubleValue];
  *(void *)(a2 + 24) = v8;
  v9 = [a1 objectForKeyedSubscript:@"Y"];

  [v9 doubleValue];
  *(void *)(a2 + 32) = v10;
  v11 = [a1 objectForKeyedSubscript:@"S"];

  [v11 doubleValue];
  *(void *)(a2 + 40) = v12;
  v13 = [a1 objectForKeyedSubscript:@"R"];

  [v13 doubleValue];
  *(void *)(a2 + 48) = v14;
}

@end