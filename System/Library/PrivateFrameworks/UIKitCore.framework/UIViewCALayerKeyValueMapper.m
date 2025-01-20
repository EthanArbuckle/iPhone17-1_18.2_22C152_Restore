@interface UIViewCALayerKeyValueMapper
@end

@implementation UIViewCALayerKeyValueMapper

void __63___UIViewCALayerKeyValueMapper_CALayerKeyPathForUIViewKeyPath___block_invoke()
{
  v0 = (void *)qword_1EB265008;
  qword_1EB265008 = (uint64_t)&unk_1ED3F7CA8;

  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:&unk_1ED3F7CA8];
  v2 = (void *)_MergedGlobals_1324;
  _MergedGlobals_1324 = v1;
}

void __72___UIViewCALayerKeyValueMapper_CALayerValueForUIViewValue_forUIViewKey___block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"backgroundColor";
  v0 = (void *)[&__block_literal_global_41_4 copy];
  v4[1] = @"transform";
  v5[0] = v0;
  uint64_t v1 = (void *)[&__block_literal_global_47_4 copy];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)qword_1EB265018;
  qword_1EB265018 = v2;
}

uint64_t __72___UIViewCALayerKeyValueMapper_CALayerValueForUIViewValue_forUIViewKey___block_invoke_2(int a1, id a2)
{
  id v2 = a2;
  return [v2 CGColor];
}

id __72___UIViewCALayerKeyValueMapper_CALayerValueForUIViewValue_forUIViewKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F29238];
  if (a2) {
    [a2 CGAffineTransformValue];
  }
  else {
    memset(&v5, 0, sizeof(v5));
  }
  CATransform3DMakeAffineTransform(&v6, &v5);
  v3 = [v2 valueWithCATransform3D:&v6];
  return v3;
}

@end