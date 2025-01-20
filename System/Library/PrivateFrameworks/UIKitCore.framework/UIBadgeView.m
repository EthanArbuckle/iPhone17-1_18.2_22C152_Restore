@interface UIBadgeView
@end

@implementation UIBadgeView

void __33___UIBadgeView__applyTextToLabel__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init((Class)off_1E52D2D48);
  [v0 setAlignment:1];
  v5[0] = *(void *)off_1E52D2048;
  v1 = +[UIColor whiteColor];
  v6[0] = v1;
  v5[1] = *(void *)off_1E52D21B8;
  v2 = (void *)[v0 copy];
  v6[1] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v4 = (void *)qword_1EB25BC98;
  qword_1EB25BC98 = v3;
}

@end