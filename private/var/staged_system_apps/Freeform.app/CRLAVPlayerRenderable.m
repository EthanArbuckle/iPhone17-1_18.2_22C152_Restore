@interface CRLAVPlayerRenderable
+ (id)renderable;
+ (id)renderableFromAVPlayerLayer:(id)a3;
- (CRLAVPlayerRenderable)initWithAVPlayerLayer:(id)a3;
- (id)p_avPlayerLayer;
- (void)addReadyToDisplayObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5;
- (void)removeReadyToDisplayObserver:(id)a3 context:(void *)a4;
@end

@implementation CRLAVPlayerRenderable

- (CRLAVPlayerRenderable)initWithAVPlayerLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLAVPlayerRenderable;
  return [(CRLCanvasRenderable *)&v4 initWithCALayer:a3];
}

+ (id)renderableFromAVPlayerLayer:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithAVPlayerLayer:v4];

  return v5;
}

+ (id)renderable
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[AVPlayerLayer layer];
  id v4 = [v2 initWithAVPlayerLayer:v3];

  return v4;
}

- (id)p_avPlayerLayer
{
  v4.receiver = self;
  v4.super_class = (Class)CRLAVPlayerRenderable;
  id v2 = [(CRLCanvasRenderable *)&v4 layer];

  return v2;
}

- (void)addReadyToDisplayObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  id v9 = [(CRLCanvasRenderable *)self layer];
  [v9 addObserver:v8 forKeyPath:@"readyForDisplay" options:a4 context:a5];
}

- (void)removeReadyToDisplayObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  id v7 = [(CRLCanvasRenderable *)self layer];
  [v7 removeObserver:v6 forKeyPath:@"readyForDisplay" context:a4];
}

@end