@interface MTPodcastCellAccessoryView
- (int64_t)unplayedCount;
- (void)setUnplayedCount:(int64_t)a3;
@end

@implementation MTPodcastCellAccessoryView

- (int64_t)unplayedCount
{
  return self->_unplayedCount;
}

- (void)setUnplayedCount:(int64_t)a3
{
  self->_unplayedCount = a3;
}

@end