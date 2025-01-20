@interface NSError
@end

@implementation NSError

uint64_t __46__NSError_TSUAdditions__tsu_isOutOfSpaceError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (a3 == 2)
  {
    v9 = @"com.apple.iWork.TSUtility";
  }
  else
  {
    if (a3 == 28)
    {
      v8 = (__CFString **)MEMORY[0x263F08438];
    }
    else
    {
      if (a3 != 640)
      {
        uint64_t v10 = 0;
        goto LABEL_10;
      }
      v8 = (__CFString **)MEMORY[0x263F07F70];
    }
    v9 = *v8;
  }
  uint64_t v10 = [v6 isEqualToString:v9];
LABEL_10:

  return v10;
}

uint64_t __42__NSError_TSUAdditions__tsu_isCancelError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (a3 == 3072)
  {
    if (([v6 isEqualToString:*MEMORY[0x263F07F70]] & 1) == 0)
    {
      v8 = @"_OnDemandResourcesErrorDomain";
      goto LABEL_8;
    }
    uint64_t v9 = 1;
  }
  else
  {
    if (a3 == -999)
    {
      v8 = (__CFString *)*MEMORY[0x263F08570];
LABEL_8:
      uint64_t v9 = [v6 isEqualToString:v8];
      goto LABEL_9;
    }
    uint64_t v9 = 0;
  }
LABEL_9:

  return v9;
}

uint64_t __46__NSError_TSUAdditions__tsu_isNoSuchFileError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (a3 == 2)
  {
    v8 = (void *)MEMORY[0x263F08438];
  }
  else
  {
    if (a3 != 260 && a3 != 4)
    {
      uint64_t v9 = 0;
      goto LABEL_8;
    }
    v8 = (void *)MEMORY[0x263F07F70];
  }
  uint64_t v9 = [v6 isEqualToString:*v8];
LABEL_8:

  return v9;
}

uint64_t __33__NSError_TSUIO__tsu_isReadError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (a3 == 256 && ([v6 isEqualToString:*MEMORY[0x263F07F70]] & 1) != 0)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:@"TSUIOErrorType"];
    uint64_t v8 = [v9 isEqual:&unk_26EC80C78];
  }
  return v8;
}

uint64_t __38__NSError_TSUIO__tsu_isCorruptedError__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3 == 259) {
    return [a2 isEqualToString:*MEMORY[0x263F07F70]];
  }
  else {
    return 0;
  }
}

uint64_t __34__NSError_TSUIO__tsu_isWriteError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (a3 == 512 && ([v6 isEqualToString:*MEMORY[0x263F07F70]] & 1) != 0)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:@"TSUIOErrorType"];
    uint64_t v8 = [v9 isEqual:&unk_26EC80C90];
  }
  return v8;
}

@end