@interface UIApplicationIsSystemApplication
@end

@implementation UIApplicationIsSystemApplication

void ___UIApplicationIsSystemApplication_block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v16 = [v0 bundleURL];

  int v1 = [v16 isFileURL];
  v2 = v16;
  if (v1)
  {
    v3 = [v16 path];
    v4 = [v3 stringByResolvingSymlinksInPath];

    v5 = [v4 pathComponents];
    if ([v4 isAbsolutePath])
    {
      unint64_t v6 = [v5 count];
      if (v6 >= 2)
      {
        unint64_t v7 = v6;
        v8 = [v5 objectAtIndex:v6 - 2];
        char v9 = [v8 isEqualToString:@"Applications"];
        v10 = (void *)(v7 - 2);
        if (v7 == 2 || (v9 & 1) != 0)
        {
          byte_1EB25B50A = v9;
LABEL_20:

          goto LABEL_21;
        }
        v11 = [v5 objectAtIndex:v7 - 3];
        int v12 = [v11 isEqualToString:@"AppleInternal"];
        char v13 = v12;
        if (v12)
        {
          v10 = [v5 objectAtIndex:v7 - 2];
          if ([v10 isEqualToString:@"Applications"])
          {
            char v14 = 1;
LABEL_17:
            byte_1EB25B50A = v14;
LABEL_18:

            goto LABEL_19;
          }
          if (v7 <= 4)
          {
            char v14 = 0;
            goto LABEL_17;
          }
        }
        else if (v7 <= 4)
        {
          byte_1EB25B50A = 0;
LABEL_19:

          goto LABEL_20;
        }
        v15 = [v5 objectAtIndex:v7 - 4];
        byte_1EB25B50A = [v15 isEqualToString:@"Applications"];

        if ((v13 & 1) == 0) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      byte_1EB25B50A = 0;
    }
LABEL_21:

    v2 = v16;
  }
}

@end