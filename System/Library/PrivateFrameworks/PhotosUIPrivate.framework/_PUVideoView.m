@interface _PUVideoView
+ (Class)layerClass;
- (id)player;
- (void)setPlayer:(id)a3;
@end

@implementation _PUVideoView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

- (void)setPlayer:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_player, a3);
  v5 = [(_PUVideoView *)self layer];
  [v8 attachToPlayerLayerIfNeeded:v5];

  v6 = v8;
  if (!v8)
  {
    v7 = [(_PUVideoView *)self layer];
    [v7 setWrappedPlayer:0];

    v6 = 0;
  }
}

- (id)player
{
  return self->_player;
}

@end