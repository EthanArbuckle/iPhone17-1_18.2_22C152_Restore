@interface TraceNavBookmarkRow
- (TraceNavBookmarkRow)initWithBookmarkIndex:(unint64_t)a3 time:(double)a4;
- (unint64_t)bookmarkIndex;
@end

@implementation TraceNavBookmarkRow

- (TraceNavBookmarkRow)initWithBookmarkIndex:(unint64_t)a3 time:(double)a4
{
  v7 = +[NSString stringWithFormat:@"Nav Bookmark %ld", a3 + 1];
  v8 = +[NSString stringWithFormat:@"%lu:%02lu", (unint64_t)a4 / 0x3C, (unint64_t)a4 % 0x3C];
  v9 = +[NSString stringWithFormat:@"At time: %@", v8];

  v13.receiver = self;
  v13.super_class = (Class)TraceNavBookmarkRow;
  v10 = [(TraceBookmarkRow *)&v13 initWithName:v7 detail:v9];
  v11 = v10;
  if (v10) {
    v10->_bookmarkIndex = a3;
  }

  return v11;
}

- (unint64_t)bookmarkIndex
{
  return self->_bookmarkIndex;
}

@end