@interface UICanvasCanvasSystemTypeFromFrameType
@end

@implementation UICanvasCanvasSystemTypeFromFrameType

void ___UICanvasCanvasSystemTypeFromFrameType_block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UIWindowSceneSessionRoleApplication";
  v2[1] = @"UIWindowSceneSessionRoleExternalDisplayNonInteractive";
  v3[0] = &unk_1ED3F3678;
  v3[1] = &unk_1ED3F3690;
  v2[2] = @"UIWindowSceneSessionRoleCarPlay";
  v2[3] = @"UIWindowSceneSessionTypeCoverSheet";
  v3[2] = &unk_1ED3F36A8;
  v3[3] = &unk_1ED3F36C0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)_MergedGlobals_983;
  _MergedGlobals_983 = v0;
}

@end