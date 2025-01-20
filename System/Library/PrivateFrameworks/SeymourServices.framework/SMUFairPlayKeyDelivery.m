@interface SMUFairPlayKeyDelivery
- (id)remoteServerPlaybackContextForCertificate:(id)a3 error:(id *)a4;
- (id)serverPlaybackContextForPlaybackContext:(id)a3 remoteContextIdentifier:(unsigned int)a4 error:(id *)a5;
@end

@implementation SMUFairPlayKeyDelivery

- (id)remoteServerPlaybackContextForCertificate:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionaryWithCapacity:2];
  v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  v9 = [NSString stringWithCString:"gaX8gT7e" encoding:4];
  [v7 setObject:&unk_1F2E9BA70 forKey:v9];

  v10 = [NSString stringWithCString:"Y7bdIsnh7" encoding:4];
  [v7 setObject:v6 forKey:v10];

  int v11 = nS1Q9ljw9esy9((uint64_t)v7, (uint64_t)v8);
  if (v11)
  {
    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28A50];
    v21[0] = v12;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v15 = [v13 errorWithDomain:@"SMUFairPlayKeyDeliveryErrorDomain" code:0 userInfo:v14];
  }
  else
  {
    v17 = [NSString stringWithCString:"xNJu5eepP" encoding:4];
    v12 = [v8 objectForKey:v17];

    if (v12)
    {
      v18 = [NSString stringWithCString:"rGLU5bt2" encoding:4];
      id v15 = [v8 objectForKey:v18];

      if (v15)
      {
        v16 = -[SMUFairPlayRemoteServerPlaybackContext initWithBlob:identifier:]([SMUFairPlayRemoteServerPlaybackContext alloc], "initWithBlob:identifier:", v12, [v15 unsignedIntValue]);

        id v15 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SMUFairPlayKeyDeliveryErrorDomain" code:1 userInfo:0];
    }
  }

  if (a4)
  {
    id v15 = v15;
    v16 = 0;
    *a4 = v15;
  }
  else
  {
    v16 = 0;
  }
LABEL_9:

  return v16;
}

- (id)serverPlaybackContextForPlaybackContext:(id)a3 remoteContextIdentifier:(unsigned int)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  unsigned int v16 = 0;
  CFDataRef v7 = (const __CFData *)a3;
  BytePtr = CFDataGetBytePtr(v7);
  int Length = CFDataGetLength(v7);

  int v10 = f5zGmdURga6BZ(a4, (uint64_t)BytePtr, Length, (uint64_t)&v17, (uint64_t)&v16);
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
    v12 = (void *)v11;
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28A50];
      v19[0] = v11;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      *a5 = [v13 errorWithDomain:@"SMUFairPlayKeyDeliveryErrorDomain" code:0 userInfo:v14];

      a5 = 0;
    }
  }
  else
  {
    a5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v17 length:v16];
    v12 = 0;
  }

  return a5;
}

@end