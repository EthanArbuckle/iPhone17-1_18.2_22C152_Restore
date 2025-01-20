@interface TVCardFloatingContentView
@end

@implementation TVCardFloatingContentView

uint64_t __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(double *)(v2 + 848) != 1.0)
  {
    [MEMORY[0x263F1CB60] inheritedAnimationDuration];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke_2;
    v8[3] = &unk_264BA6878;
    v8[4] = *(void *)(a1 + 32);
    char v9 = *(unsigned char *)(a1 + 40);
    [MEMORY[0x263F1CB60] animateWithDuration:32 delay:v8 options:0 animations:v3 * 0.3 completion:0.0];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  double v4 = 0.0;
  double v5 = 0.0;
  if (*(unsigned char *)(a1 + 40)) {
    double v5 = *(double *)(v2 + 872);
  }
  [*(id *)(v2 + 840) setAlpha:v5];
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(a1 + 40)) {
    double v4 = *(double *)(v6 + 864);
  }
  return [*(id *)(v6 + 832) setAlpha:v4];
}

uint64_t __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(double **)(a1 + 32);
  double v3 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = v2[106];
  }
  return [v2 setAlpha:v3];
}

uint64_t __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setSelected:*(unsigned __int8 *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 41) withAnimationCoordinator:*(void *)(a1 + 32)];
}

@end