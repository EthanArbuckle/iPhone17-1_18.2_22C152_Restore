@interface WLRecord
+ (BOOL)isInterrupted;
+ (void)startRecording;
+ (void)stopRecording;
@end

@implementation WLRecord

+ (BOOL)isInterrupted
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 objectForKey:@"record"];
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (void)startRecording
{
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v2 = [NSNumber numberWithBool:1];
  [v3 setObject:v2 forKey:@"record"];

  [v3 synchronize];
}

+ (void)stopRecording
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 removeObjectForKey:@"record"];
  [v2 synchronize];
}

@end