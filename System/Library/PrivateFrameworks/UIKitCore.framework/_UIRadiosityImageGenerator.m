@interface _UIRadiosityImageGenerator
+ (id)sharedInstance;
- (void)imageWithImage:(CGImage *)a3 completionHandler:(id)a4;
@end

@implementation _UIRadiosityImageGenerator

+ (id)sharedInstance
{
  if (qword_1EB264F10 != -1) {
    dispatch_once(&qword_1EB264F10, &__block_literal_global_637);
  }
  v2 = (void *)qword_1EB264F08;
  return v2;
}

- (void)imageWithImage:(CGImage *)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (qword_1EB264F18 == -1)
  {
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&qword_1EB264F18, &__block_literal_global_2_20);
    if (!v6) {
      goto LABEL_8;
    }
  }
  if (a3)
  {
    if (_MergedGlobals_1314)
    {
      size_t Width = CGImageGetWidth(a3);
      size_t Height = CGImageGetHeight(a3);
      if (Width)
      {
        if (Height)
        {
          double v9 = (double)Width;
          v10 = (void *)MEMORY[0x1E4F5E068];
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __63___UIRadiosityImageGenerator_imageWithImage_completionHandler___block_invoke_2;
          v11[3] = &unk_1E530EBB8;
          double v13 = v9;
          double v14 = (double)Height;
          id v12 = v6;
          [v10 radiosityImageWithImage:a3 displayScale:1 completionHandler:v11];
        }
      }
    }
  }
LABEL_8:
}

@end