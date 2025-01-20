@interface VUIMutableBookmark
+ (BOOL)supportsSecureCoding;
- (void)setBookmarkTime:(double)a3;
- (void)setBookmarkTimestamp:(id)a3;
@end

@implementation VUIMutableBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setBookmarkTime:(double)a3
{
  [(VUIBookmark *)self _setBookmarkTimeWithoutUpdatingTimestamp:a3];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  [(VUIBookmark *)self _setBookmarkTimestamp:v4];

  [(VUIBookmark *)self setHasFakeTimestamp:1];
}

- (void)setBookmarkTimestamp:(id)a3
{
  [(VUIBookmark *)self _setBookmarkTimestamp:a3];
  [(VUIBookmark *)self setHasFakeTimestamp:0];
}

@end