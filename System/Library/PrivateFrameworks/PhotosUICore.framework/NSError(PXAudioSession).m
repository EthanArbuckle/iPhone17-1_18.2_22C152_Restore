@interface NSError(PXAudioSession)
+ (id)px_audioSessionErrorWithCode:()PXAudioSession underlyingError:;
+ (id)px_audioSessionErrorWithCode:()PXAudioSession userInfo:;
+ (uint64_t)px_audioSessionErrorWithCode:()PXAudioSession;
@end

@implementation NSError(PXAudioSession)

+ (id)px_audioSessionErrorWithCode:()PXAudioSession userInfo:
{
  v5 = (objc_class *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithDomain:@"PXAudioSessionErrorDomain" code:a3 userInfo:v6];

  return v7;
}

+ (id)px_audioSessionErrorWithCode:()PXAudioSession underlyingError:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  id v7 = [v5 alloc];
  uint64_t v11 = *MEMORY[0x1E4F28A50];
  v12[0] = v6;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v9 = (void *)[v7 initWithDomain:@"PXAudioSessionErrorDomain" code:a3 userInfo:v8];
  return v9;
}

+ (uint64_t)px_audioSessionErrorWithCode:()PXAudioSession
{
  return objc_msgSend(a1, "px_audioSessionErrorWithCode:userInfo:", a3, 0);
}

@end