@interface SBHIconGridSizeClassDomain
@end

@implementation SBHIconGridSizeClassDomain

void __68__SBHIconGridSizeClassDomain_PRWidgetGridUtilities__pr_widgetDomain__block_invoke()
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4FA6280]);
  v19[0] = @"PRIconGridSizeClassCircular";
  uint64_t v2 = *MEMORY[0x1E4FA6558];
  v15[0] = *MEMORY[0x1E4FA6550];
  uint64_t v1 = v15[0];
  v15[1] = v2;
  v18[0] = @"circular";
  v18[1] = @"C";
  uint64_t v4 = *MEMORY[0x1E4FA6548];
  uint64_t v16 = *MEMORY[0x1E4FA6540];
  uint64_t v3 = v16;
  uint64_t v17 = v4;
  v18[2] = @"small";
  v18[3] = &unk_1ED9EEF68;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v15 count:4];
  v20[0] = v5;
  v19[1] = @"PRIconGridSizeClassRectangular";
  v13[0] = v1;
  v13[1] = v2;
  v14[0] = @"rectangular";
  v14[1] = @"R";
  v13[2] = v3;
  v13[3] = v4;
  v14[2] = @"medium";
  v14[3] = &unk_1ED9EEF80;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  v20[1] = v6;
  v19[2] = @"PRIconGridSizeClassSystemSmall";
  v11[0] = v1;
  v11[1] = v2;
  v12[0] = @"system small";
  v12[1] = @"S";
  v11[2] = v3;
  v11[3] = v4;
  v12[2] = @"large";
  v12[3] = &unk_1ED9EEF98;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v20[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  uint64_t v9 = [v0 initWithGridSizeClasses:v8];
  v10 = (void *)pr_widgetDomain_domain;
  pr_widgetDomain_domain = v9;
}

@end