@interface RWIProtocolDOMVideoPlaybackQuality
- (RWIProtocolDOMVideoPlaybackQuality)initWithDisplayCompositedVideoFrames:(int)a3 droppedVideoFrames:(int)a4 totalVideoFrames:(int)a5;
- (int)displayCompositedVideoFrames;
- (int)droppedVideoFrames;
- (int)totalVideoFrames;
- (void)setDisplayCompositedVideoFrames:(int)a3;
- (void)setDroppedVideoFrames:(int)a3;
- (void)setTotalVideoFrames:(int)a3;
@end

@implementation RWIProtocolDOMVideoPlaybackQuality

- (RWIProtocolDOMVideoPlaybackQuality)initWithDisplayCompositedVideoFrames:(int)a3 droppedVideoFrames:(int)a4 totalVideoFrames:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  v8 = [(RWIProtocolJSONObject *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(RWIProtocolDOMVideoPlaybackQuality *)v8 setDisplayCompositedVideoFrames:v7];
    [(RWIProtocolDOMVideoPlaybackQuality *)v9 setDroppedVideoFrames:v6];
    [(RWIProtocolDOMVideoPlaybackQuality *)v9 setTotalVideoFrames:v5];
    v10 = v9;
  }

  return v9;
}

- (void)setDisplayCompositedVideoFrames:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"displayCompositedVideoFrames"];
}

- (int)displayCompositedVideoFrames
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"displayCompositedVideoFrames"];
}

- (void)setDroppedVideoFrames:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"droppedVideoFrames"];
}

- (int)droppedVideoFrames
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"droppedVideoFrames"];
}

- (void)setTotalVideoFrames:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"totalVideoFrames"];
}

- (int)totalVideoFrames
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMVideoPlaybackQuality;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"totalVideoFrames"];
}

@end