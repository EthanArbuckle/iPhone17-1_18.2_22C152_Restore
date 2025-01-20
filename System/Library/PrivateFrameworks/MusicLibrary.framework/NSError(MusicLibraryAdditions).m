@interface NSError(MusicLibraryAdditions)
+ (id)ml_errorWithCode:()MusicLibraryAdditions description:;
+ (uint64_t)ml_errorWithCode:()MusicLibraryAdditions;
@end

@implementation NSError(MusicLibraryAdditions)

+ (id)ml_errorWithCode:()MusicLibraryAdditions description:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (v10)
  {
    v16 = &a9;
    uint64_t v11 = [[NSString alloc] initWithFormat:v10 arguments:&a9];
    v12 = (void *)v11;
    if (v11)
    {
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18[0] = v11;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      goto LABEL_6;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = 0;
LABEL_6:
  v14 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"MLMusicLibraryErrorDomain", a3, v13, v16);

  return v14;
}

+ (uint64_t)ml_errorWithCode:()MusicLibraryAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "ml_errorWithCode:description:", a3, 0);
}

@end