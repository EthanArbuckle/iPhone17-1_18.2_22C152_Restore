@interface PNPPencilMovieView
@end

@implementation PNPPencilMovieView

void __61___PNPPencilMovieView_completeRevolutionWithCompletionBlock___block_invoke(uint64_t a1)
{
  memset(&v12, 0, sizeof(v12));
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2) {
    [v2 duration];
  }
  CMTime time = v12;
  double Seconds = CMTimeGetSeconds(&time);
  memset(&time, 0, sizeof(time));
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4) {
    [v4 currentTime];
  }
  CMTime v10 = time;
  double v5 = CMTimeGetSeconds(&v10);
  if (v5 >= Seconds * 0.25) {
    double v6 = Seconds - v5;
  }
  else {
    double v6 = -v5;
  }
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(fmin((Seconds * 0.25 + v6) * (1.0 / *(float *)(a1 + 48)), 2.4) * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___PNPPencilMovieView_completeRevolutionWithCompletionBlock___block_invoke_2;
  block[3] = &unk_264DA5768;
  id v9 = *(id *)(a1 + 32);
  dispatch_after(v7, MEMORY[0x263EF83A0], block);
}

uint64_t __61___PNPPencilMovieView_completeRevolutionWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end