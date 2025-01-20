@interface PXBasicTileAnimationOptions
+ (id)defaultAnimationOptions;
- (BOOL)shouldNotifyTiles;
- (BOOL)shouldSnapshotDynamicContents;
- (PXBasicTileAnimationOptions)init;
- (double)delay;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)style;
- (unint64_t)flags;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setShouldNotifyTiles:(BOOL)a3;
- (void)setShouldSnapshotDynamicContents:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation PXBasicTileAnimationOptions

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setShouldSnapshotDynamicContents:(BOOL)a3
{
  self->_shouldSnapshotDynamicContents = a3;
}

- (BOOL)shouldSnapshotDynamicContents
{
  return self->_shouldSnapshotDynamicContents;
}

- (void)setShouldNotifyTiles:(BOOL)a3
{
  self->_shouldNotifyTiles = a3;
}

- (BOOL)shouldNotifyTiles
{
  return self->_shouldNotifyTiles;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)delay
{
  return self->_delay;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)PXBasicTileAnimationOptions;
  v3 = [(PXBasicTileAnimationOptions *)&v9 description];
  [(PXBasicTileAnimationOptions *)self duration];
  uint64_t v5 = v4;
  [(PXBasicTileAnimationOptions *)self delay];
  v7 = [v3 stringByAppendingFormat:@" duration:%.2f delay:%.2f style:%ld>", v5, v6, -[PXBasicTileAnimationOptions style](self, "style")];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 3) = *(void *)&self->_duration;
  *((void *)result + 2) = *(void *)&self->_delay;
  *((void *)result + 4) = self->_style;
  *((unsigned char *)result + 8) = self->_shouldNotifyTiles;
  *((unsigned char *)result + 9) = self->_shouldSnapshotDynamicContents;
  *((void *)result + 5) = self->_flags;
  return result;
}

- (PXBasicTileAnimationOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXBasicTileAnimationOptions;
  return [(PXBasicTileAnimationOptions *)&v3 init];
}

+ (id)defaultAnimationOptions
{
  v2 = objc_alloc_init(PXBasicTileAnimationOptions);
  [(PXBasicTileAnimationOptions *)v2 setStyle:2];
  [(PXBasicTileAnimationOptions *)v2 setDuration:0.3];
  return v2;
}

@end