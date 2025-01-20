@interface MTSyncedEpisodeObserver
+ (id)observerWithBlock:(id)a3;
- (MTSyncedEpisodeObserver)initWithBlock:(id)a3;
- (id)block;
- (void)setBlock:(id)a3;
@end

@implementation MTSyncedEpisodeObserver

+ (id)observerWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithBlock:v4];

  return v5;
}

- (MTSyncedEpisodeObserver)initWithBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTSyncedEpisodeObserver;
  id v5 = [(MTSyncedEpisodeObserver *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MTSyncedEpisodeObserver *)v5 setBlock:v4];
  }

  return v6;
}

- (void)setBlock:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
}

@end