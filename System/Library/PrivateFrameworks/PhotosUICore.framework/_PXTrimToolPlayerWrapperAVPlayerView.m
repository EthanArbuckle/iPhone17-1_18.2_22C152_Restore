@interface _PXTrimToolPlayerWrapperAVPlayerView
+ (Class)layerClass;
- (_PXTrimToolPlayerWrapperAVPlayerView)initWithPlayer:(id)a3;
@end

@implementation _PXTrimToolPlayerWrapperAVPlayerView

- (_PXTrimToolPlayerWrapperAVPlayerView)initWithPlayer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXTrimToolPlayerWrapperAVPlayerView;
  v5 = [(_PXTrimToolPlayerWrapperAVPlayerView *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(_PXTrimToolPlayerWrapperAVPlayerView *)v5 playerLayer];
    [v7 setPlayer:v4];
  }
  return v6;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end