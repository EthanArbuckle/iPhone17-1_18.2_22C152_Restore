@interface UIPrintWebKitThumbnailGenerationOperation
- (NSThread)currentWebKitThumbnailGenerationThread;
- (UIPrintWebKitThumbnailGenerationOperation)initWithPagesController:(id)a3;
- (void)main;
- (void)setCurrentWebKitThumbnailGenerationThread:(id)a3;
@end

@implementation UIPrintWebKitThumbnailGenerationOperation

- (UIPrintWebKitThumbnailGenerationOperation)initWithPagesController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIPrintWebKitThumbnailGenerationOperation;
  v5 = [(NSBlockOperation *)&v8 init];
  if (v5)
  {
    v6 = [v4 webKitThumbnailGenerationThread];
    [(UIPrintWebKitThumbnailGenerationOperation *)v5 setCurrentWebKitThumbnailGenerationThread:v6];
  }
  return v5;
}

- (void)main
{
  uint64_t v3 = [(UIPrintWebKitThumbnailGenerationOperation *)self currentWebKitThumbnailGenerationThread];
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      v5 = [(UIPrintWebKitThumbnailGenerationOperation *)self currentWebKitThumbnailGenerationThread];
      char v6 = [v5 isFinished];

      if (v6) {
        break;
      }
      usleep(0);
      id v4 = [(UIPrintWebKitThumbnailGenerationOperation *)self currentWebKitThumbnailGenerationThread];
    }
    while (v4);
  }
  if (([(UIPrintWebKitThumbnailGenerationOperation *)self isCancelled] & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIPrintWebKitThumbnailGenerationOperation;
    [(NSBlockOperation *)&v7 main];
  }
}

- (NSThread)currentWebKitThumbnailGenerationThread
{
  return (NSThread *)objc_getProperty(self, a2, 264, 1);
}

- (void)setCurrentWebKitThumbnailGenerationThread:(id)a3
{
}

- (void).cxx_destruct
{
}

@end