@interface UIView(NCHighFrameRate)
+ (id)nc_applyHighFrameRate:()NCHighFrameRate;
@end

@implementation UIView(NCHighFrameRate)

+ (id)nc_applyHighFrameRate:()NCHighFrameRate
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__UIView_NCHighFrameRate__nc_applyHighFrameRate___block_invoke;
  aBlock[3] = &unk_1E6A91DF0;
  id v9 = v3;
  id v4 = v3;
  v5 = _Block_copy(aBlock);
  v6 = _Block_copy(v5);

  return v6;
}

@end