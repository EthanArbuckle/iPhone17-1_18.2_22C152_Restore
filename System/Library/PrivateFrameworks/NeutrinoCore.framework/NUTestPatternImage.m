@interface NUTestPatternImage
- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9;
@end

@implementation NUTestPatternImage

- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9
{
  id v35 = a9;
  v15 = [v35 objectForKeyedSubscript:@"width"];
  int v16 = [v15 intValue];

  v17 = [v35 objectForKeyedSubscript:@"height"];
  int v18 = [v17 intValue];

  if (a8)
  {
    uint64_t v19 = 0;
    uint64_t v20 = v16 - 1;
    uint64_t v21 = v18 - 1;
    v22 = (char *)a3 + 3;
    char v23 = a6;
    do
    {
      if (a7)
      {
        uint64_t v24 = v19 + a6;
        unint64_t v25 = (v19 + a6) & 1;
        v26 = v22;
        unint64_t v27 = a5;
        unint64_t v28 = a7;
        do
        {
          *(v26 - 3) = -1;
          int v32 = (v27 & 1) == 0 && v24 != 0 && v24 != v21 && v25 == 0;
          if (v20 == v27) {
            int v32 = 0;
          }
          if (!v27) {
            int v32 = 0;
          }
          int v33 = v25 & v27;
          if (v20 == v27) {
            int v33 = 0;
          }
          *(v26 - 2) = v32 << 31 >> 31;
          *(v26 - 1) = -((v23 + v27) & 1);
          if (v24 == v21) {
            int v34 = 0;
          }
          else {
            int v34 = v33;
          }
          unsigned char *v26 = v34 << 31 >> 31;
          v26 += 4;
          ++v27;
          --v28;
        }
        while (v28);
      }
      ++v19;
      ++v23;
      v22 += a4;
    }
    while (v19 != a8);
  }
}

@end