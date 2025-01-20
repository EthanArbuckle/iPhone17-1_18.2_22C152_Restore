@interface PBUIPosterFloatingLayerReplica
- (BOOL)isFloatingLayerObserver;
- (BOOL)isFloatingLayerStandin;
- (PBUIPosterFloatingLayerReplica)initWithFrame:(CGRect)a3;
- (void)setFloatingLayerStandin:(BOOL)a3;
@end

@implementation PBUIPosterFloatingLayerReplica

- (PBUIPosterFloatingLayerReplica)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PBUIPosterFloatingLayerReplica;
  v3 = -[PBUIPortalReplicaView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PBUIPortalReplicaView *)v3 setShouldMatchWallpaperPosition:1];
    [(PBUIPortalReplicaView *)v4 setHidesSourceView:1];
    v5 = [(PBUIPortalReplicaView *)v4 debugView];

    if (v5)
    {
      v6 = [(PBUIPortalReplicaView *)v4 debugView];
      v7 = [MEMORY[0x1E4F428B8] yellowColor];
      v8 = [v7 colorWithAlphaComponent:0.2];
      [v6 setColor:v8];
    }
  }
  return v4;
}

- (void)setFloatingLayerStandin:(BOOL)a3
{
  if (self->_floatingLayerStandin != a3)
  {
    self->_floatingLayerStandin = a3;
    [(PBUIPortalReplicaView *)self setNeedsSourceUpdate];
  }
}

- (BOOL)isFloatingLayerObserver
{
  return 1;
}

- (BOOL)isFloatingLayerStandin
{
  return self->_floatingLayerStandin;
}

@end