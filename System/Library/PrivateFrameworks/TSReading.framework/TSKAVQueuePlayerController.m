@interface TSKAVQueuePlayerController
- (TSKAVQueuePlayerController)initWithQueuePlayer:(id)a3 delegate:(id)a4 assets:(id)a5;
- (TSKAVQueuePlayerController)initWithQueuePlayer:(id)a3 delegate:(id)a4 assets:(id)a5 initialAssetIndex:(unint64_t)a6;
- (void)dealloc;
- (void)p_enqueueAssetsFromIndex:(unint64_t)a3;
- (void)playerItemDidPlayToEndTimeAtRate:(float)a3;
- (void)skipToAssetAtIndex:(unint64_t)a3;
@end

@implementation TSKAVQueuePlayerController

- (TSKAVQueuePlayerController)initWithQueuePlayer:(id)a3 delegate:(id)a4 assets:(id)a5
{
  return [(TSKAVQueuePlayerController *)self initWithQueuePlayer:a3 delegate:a4 assets:a5 initialAssetIndex:0];
}

- (TSKAVQueuePlayerController)initWithQueuePlayer:(id)a3 delegate:(id)a4 assets:(id)a5 initialAssetIndex:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)TSKAVQueuePlayerController;
  v9 = [(TSKAVPlayerController *)&v11 initWithPlayer:a3 delegate:a4];
  if (v9)
  {
    v9->mAssets = (NSArray *)[a5 copy];
    [a3 setActionAtItemEnd:0];
    [(TSKAVQueuePlayerController *)v9 p_enqueueAssetsFromIndex:a6];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKAVQueuePlayerController;
  [(TSKAVPlayerController *)&v3 dealloc];
}

- (void)playerItemDidPlayToEndTimeAtRate:(float)a3
{
  v4 = [(TSKAVPlayerController *)self player];
  if (objc_msgSend((id)-[AVPlayer items](v4, "items"), "count") == 1)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSKAVPlayerControllerDidPlayToEndNotification", self);
    if ([(TSKAVPlayerController *)self repeatMode] == 1)
    {
      [(TSKAVQueuePlayerController *)self p_enqueueAssetsFromIndex:0];
      *(float *)&double v5 = a3;
      [(AVPlayer *)v4 setRate:v5];
    }
    else
    {
      v6 = self;
      [(AVPlayer *)v4 setRate:0.0];
      [(TSKAVPlayerControllerDelegate *)[(TSKAVPlayerController *)self delegate] playbackDidStopForPlayerController:self];
    }
  }
}

- (void)skipToAssetAtIndex:(unint64_t)a3
{
  [(TSKAVPlayerController *)self setPlaying:0];
  [[(TSKAVPlayerController *)self player] removeAllItems];

  [(TSKAVQueuePlayerController *)self p_enqueueAssetsFromIndex:a3];
}

- (void)p_enqueueAssetsFromIndex:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  double v5 = [(TSKAVPlayerController *)self player];
  NSUInteger v6 = [(NSArray *)self->mAssets count];
  if (v6 > a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = -[NSArray subarrayWithRange:](self->mAssets, "subarrayWithRange:", a3, v6 - a3, 0);
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[AVPlayer insertItem:afterItem:](v5, "insertItem:afterItem:", [MEMORY[0x263EFA800] playerItemWithAsset:*(void *)(*((void *)&v12 + 1) + 8 * i)], 0);
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

@end