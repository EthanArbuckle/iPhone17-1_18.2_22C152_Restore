@interface BCAudioBookPosition
+ (id)positionWithChapter:(int64_t)a3 time:(double)a4;
- (NSString)description;
- (double)timePosition;
- (int64_t)chapterNum;
- (int64_t)compare:(id)a3;
- (void)setChapterNum:(int64_t)a3;
- (void)setTimePosition:(double)a3;
@end

@implementation BCAudioBookPosition

+ (id)positionWithChapter:(int64_t)a3 time:(double)a4
{
  v6 = objc_alloc_init(BCAudioBookPosition);
  [(BCAudioBookPosition *)v6 setTimePosition:a4];
  [(BCAudioBookPosition *)v6 setChapterNum:a3];

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = BUDynamicCast();

  id v6 = [(BCAudioBookPosition *)self chapterNum];
  if (v6 == [v5 chapterNum])
  {
    [(BCAudioBookPosition *)self timePosition];
    double v8 = v7;
    [v5 timePosition];
    if (v8 == v9)
    {
      int64_t v13 = 0;
    }
    else
    {
      [(BCAudioBookPosition *)self timePosition];
      double v11 = v10;
      [v5 timePosition];
      if (v11 >= v12) {
        int64_t v13 = 1;
      }
      else {
        int64_t v13 = -1;
      }
    }
  }
  else
  {
    uint64_t v14 = [(BCAudioBookPosition *)self chapterNum];
    if (v14 < (uint64_t)[v5 chapterNum]) {
      int64_t v13 = -1;
    }
    else {
      int64_t v13 = 1;
    }
  }

  return v13;
}

- (NSString)description
{
  v3 = +[NSNumber numberWithInteger:[(BCAudioBookPosition *)self chapterNum]];
  [(BCAudioBookPosition *)self timePosition];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5 = +[NSString stringWithFormat:@"BCAudioBookPosition(chapter:%@ time:%@)", v3, v4];

  return (NSString *)v5;
}

- (double)timePosition
{
  return self->_timePosition;
}

- (void)setTimePosition:(double)a3
{
  self->_timePosition = a3;
}

- (int64_t)chapterNum
{
  return self->_chapterNum;
}

- (void)setChapterNum:(int64_t)a3
{
  self->_chapterNum = a3;
}

@end