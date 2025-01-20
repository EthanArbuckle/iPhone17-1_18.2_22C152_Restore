@interface PXStoryMiroVideoInfo
- (PXStoryMiroVideoInfo)initWithData:(id)a3;
- (id)token;
@end

@implementation PXStoryMiroVideoInfo

- (PXStoryMiroVideoInfo)initWithData:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryMiroVideoInfo;
  v5 = [(PXStoryMiroAssetInfo *)&v13 initWithData:v4];
  if (v5)
  {
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * [v4 length] - 0x3333333333333334, 1) <= 0x1999999999999999uLL)
    {
      v6 = objc_msgSend(v4, "subdataWithRange:", 0, 4);
      v7 = [(PXStoryMiroVideoInfo *)v5 token];
      int v8 = [v6 isEqualToData:v7];

      if (v8)
      {
        if ((unint64_t)[v4 length] >= 5)
        {
          unint64_t v9 = 4;
          while (1)
          {
            v10 = objc_msgSend(v4, "subdataWithRange:", v9, 10);
            v11 = [[PXStoryMiroVideoRangeInfo alloc] initWithData:v10];
            if ([(PXStoryMiroAssetInfo *)v11 isUsed]) {
              break;
            }
            v9 += 10;

            if (v9 >= [v4 length]) {
              goto LABEL_10;
            }
          }
          [(PXStoryMiroAssetInfo *)v5 setIsUsed:1];
        }
      }
    }
  }
LABEL_10:

  return v5;
}

- (id)token
{
  if (token_once != -1) {
    dispatch_once(&token_once, &__block_literal_global_73632);
  }
  v2 = (void *)token_token;
  return v2;
}

void __29__PXStoryMiroVideoInfo_token__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"MVFI" length:4];
  v1 = (void *)token_token;
  token_token = v0;
}

@end