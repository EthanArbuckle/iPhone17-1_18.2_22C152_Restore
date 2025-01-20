@interface PXEDRGainLayer
+ (id)layer;
@end

@implementation PXEDRGainLayer

+ (id)layer
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F39BE8] layer];
  v13[0] = @"backgroundColor";
  v3 = [MEMORY[0x1E4F1CA98] null];
  v14[0] = v3;
  v13[1] = @"bounds";
  v4 = [MEMORY[0x1E4F1CA98] null];
  v14[1] = v4;
  v13[2] = @"position";
  v5 = [MEMORY[0x1E4F1CA98] null];
  v14[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  [v2 setActions:v6];

  v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0B8]];
  [v7 setValue:&unk_1F02D8920 forKey:*MEMORY[0x1E4F3A100]];
  [v7 setValue:&unk_1F02D8938 forKey:*MEMORY[0x1E4F3A1F0]];
  [v7 setName:@"modulationFilter"];
  v12 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v2 setFilters:v8];

  v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A298]];
  [v2 setCompositingFilter:v9];

  id v10 = [MEMORY[0x1E4FB1618] whiteColor];
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

  return v2;
}

@end