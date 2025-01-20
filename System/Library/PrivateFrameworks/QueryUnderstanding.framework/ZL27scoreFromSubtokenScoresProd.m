@interface ZL27scoreFromSubtokenScoresProd
@end

@implementation ZL27scoreFromSubtokenScoresProd

float _ZL27scoreFromSubtokenScoresProd_block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  v21[4] = *MEMORY[0x263EF8340];
  id v20 = a2;
  if (a6 < 1)
  {
    float v11 = 1.0;
  }
  else
  {
    int v10 = a6 + a5;
    float v11 = 1.0;
    do
    {
      v12 = objc_msgSend(NSNumber, "numberWithInt:", a3, v20, &unk_270891F18);
      v21[1] = v12;
      v13 = [NSNumber numberWithInt:a5];
      v21[2] = v13;
      v14 = [NSNumber numberWithInt:a4];
      v21[3] = v14;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
      v16 = [v20 objectForKeyedSubscript:v15];
      [v16 floatValue];
      float v18 = v17;

      float v11 = v11 * v18;
      a5 = (a5 + 1);
    }
    while ((int)a5 < v10);
  }

  return v11;
}

@end