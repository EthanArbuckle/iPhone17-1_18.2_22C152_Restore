@interface ScaleTestProcessor
- (BOOL)startPageAction:(id)a3;
- (void)doneRendering:(id)a3;
- (void)setZoomScale:(float)a3;
@end

@implementation ScaleTestProcessor

- (BOOL)startPageAction:(id)a3
{
  int v4 = *(_DWORD *)(&self->super._showRenderFps + 1);
  id v5 = a3;
  v6 = [(PageLoadTestRunner *)self browserController];
  LODWORD(v7) = v4;
  [v6 setZoomScale:v7];

  v8 = [MEMORY[0x1E4F1C9C8] date];
  [v5 startRenderTime:v8];

  [(ScaleTestProcessor *)self performSelector:sel_doneRendering_ withObject:v5 afterDelay:0.0];
  return 1;
}

- (void)setZoomScale:(float)a3
{
  *(float *)(&self->super._showRenderFps + 1) = a3;
}

- (void)doneRendering:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a3;
  id v5 = [v4 date];
  [v6 finishRenderTime:v5];

  [(PageLoadTestRunner *)self finishPage:v6 stats:0 error:0];
}

@end