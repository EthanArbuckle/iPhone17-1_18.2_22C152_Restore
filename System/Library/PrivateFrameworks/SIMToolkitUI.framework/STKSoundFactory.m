@interface STKSoundFactory
+ (id)class0SMSSound;
+ (id)soundForOptions:(id)a3;
+ (id)soundForRingToneWithDuration:(double)a3;
+ (id)soundForSystemSoundID:(unsigned int)a3 duration:(double)a4;
@end

@implementation STKSoundFactory

+ (id)soundForOptions:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F031F0];
  id v5 = a3;
  v6 = (const void *)objc_msgSend(v5, "bs_safeStringForKey:", v4);
  v7 = objc_msgSend(v5, "bs_safeNumberForKey:", *MEMORY[0x263F03220]);

  [v7 doubleValue];
  double v9 = v8;

  if (v6)
  {
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F03268]) || CFEqual(v6, (CFTypeRef)*MEMORY[0x263F03258]))
    {
      v10 = [a1 soundForRingToneWithDuration:v9];
      goto LABEL_29;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F031F8]))
    {
      id v11 = a1;
      uint64_t v12 = 1070;
LABEL_27:
      v10 = [v11 soundForSystemSoundID:v12 duration:v9];
      goto LABEL_29;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F03210]))
    {
      id v11 = a1;
      uint64_t v12 = 1071;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F03250]))
    {
      id v11 = a1;
      uint64_t v12 = 1072;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F03228]))
    {
      id v11 = a1;
      uint64_t v12 = 1073;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F03208]))
    {
      id v11 = a1;
      uint64_t v12 = 1074;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F03218]))
    {
      id v11 = a1;
      uint64_t v12 = 1075;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F03200]))
    {
      id v11 = a1;
      uint64_t v12 = 1051;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F03230]))
    {
      id v11 = a1;
      uint64_t v12 = 1052;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F03248]))
    {
      id v11 = a1;
      uint64_t v12 = 1054;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F03238]))
    {
      id v11 = a1;
      uint64_t v12 = 1053;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F03260]))
    {
      id v11 = a1;
      uint64_t v12 = 1055;
      goto LABEL_27;
    }
  }
  v10 = 0;
LABEL_29:

  return v10;
}

+ (id)soundForRingToneWithDuration:(double)a3
{
  v3 = [[STKToneAlertSound alloc] initWithType:1 duration:a3];

  return v3;
}

+ (id)class0SMSSound
{
  v2 = [[STKToneAlertSound alloc] initWithType:2 duration:0.0];

  return v2;
}

+ (id)soundForSystemSoundID:(unsigned int)a3 duration:(double)a4
{
  id v4 = [[STKSystemSound alloc] initForSystemSoundID:*(void *)&a3 duration:a4];

  return v4;
}

@end