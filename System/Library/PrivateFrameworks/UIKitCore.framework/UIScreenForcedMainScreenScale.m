@interface UIScreenForcedMainScreenScale
@end

@implementation UIScreenForcedMainScreenScale

void ___UIScreenForcedMainScreenScale_block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 32);
  +[UIApplication _classicMode];
  if (v1 <= 2.0 || dyld_program_sdk_at_least())
  {
    qword_1EB25C5E0 = 0;
  }
  else
  {
    qword_1EB25C5E0 = 0x4000000000000000;
    qword_1EB25C5D0 = (uint64_t)_dyld_get_image_name(0);
    id v6 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:qword_1EB25C5D0 isDirectory:0 relativeToURL:0];
    v2 = [v6 URLByResolvingSymlinksInPath];
    v3 = [v2 URLByDeletingLastPathComponent];
    uint64_t v4 = [v3 absoluteString];
    v5 = (void *)qword_1EB25C5D8;
    qword_1EB25C5D8 = v4;
  }
}

@end