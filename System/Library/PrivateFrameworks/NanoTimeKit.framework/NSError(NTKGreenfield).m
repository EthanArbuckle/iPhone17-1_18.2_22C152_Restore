@interface NSError(NTKGreenfield)
+ (id)greenfield_addWatchFaceErrorWithCode:()NTKGreenfield message:;
+ (id)greenfield_decodeWatchFaceErrorWithCode:()NTKGreenfield message:;
+ (id)greenfield_encodeWatchFaceErrorWithCode:()NTKGreenfield message:;
+ (uint64_t)greenfield_addWatchFaceErrorWithCode:()NTKGreenfield;
@end

@implementation NSError(NTKGreenfield)

+ (uint64_t)greenfield_addWatchFaceErrorWithCode:()NTKGreenfield
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager" code:a3 userInfo:0];
}

+ (id)greenfield_addWatchFaceErrorWithCode:()NTKGreenfield message:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v5 errorWithDomain:@"com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager" code:a3 userInfo:v8];

  return v9;
}

+ (id)greenfield_encodeWatchFaceErrorWithCode:()NTKGreenfield message:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = a4;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  id v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [v4 errorWithDomain:@"com.apple.nanotimekit.kNTKGreenfieldEncodeFaceManagerErrorDomain" code:0 userInfo:v7];

  return v8;
}

+ (id)greenfield_decodeWatchFaceErrorWithCode:()NTKGreenfield message:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = a4;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v5 errorWithDomain:@"com.apple.nanotimekit.kNTKGreenfieldDecodeFaceManagerErrorDomain" code:a3 userInfo:v8];

  return v9;
}

@end