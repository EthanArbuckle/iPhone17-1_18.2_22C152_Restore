@interface PKDiscoveryInlineVideoMediaShelfView
- (PKDiscoveryInlineVideoMediaShelfView)initWithShelf:(id)a3;
- (id)playerMediaView;
@end

@implementation PKDiscoveryInlineVideoMediaShelfView

- (PKDiscoveryInlineVideoMediaShelfView)initWithShelf:(id)a3
{
  id v4 = a3;
  v5 = [PKPlayerView alloc];
  v6 = -[PKPlayerView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v14.receiver = self;
  v14.super_class = (Class)PKDiscoveryInlineVideoMediaShelfView;
  v7 = [(PKDiscoveryInlineCaptionedMediaShelfView *)&v14 initWithShelf:v4 mediaView:v6];

  if (v7)
  {
    v8 = [(PKDiscoveryMedia *)v7->super._media urls];
    v9 = [v8 allValues];
    v10 = [v9 firstObject];

    v11 = [(PKDiscoveryInlineVideoMediaShelfView *)v7 playerMediaView];
    v12 = [v10 url];
    [v11 playItemAtURL:v12];
  }
  return v7;
}

- (id)playerMediaView
{
  return self->super._mediaView;
}

@end