@interface BlockingThreadElement
- (BlockingThreadElement)init;
- (int64_t)compareCumulativeTime:(id)a3;
- (int64_t)compareMaxBlockingTime:(id)a3;
- (unint64_t)cumulativeTime;
- (unint64_t)endThreadTime;
- (unint64_t)maxBlockingTime;
- (unint64_t)startThreadTime;
- (void)setCumulativeTime:(unint64_t)a3;
- (void)setEndThreadTime:(unint64_t)a3;
- (void)setMaxBlockingTime:(unint64_t)a3;
- (void)setStartThreadTime:(unint64_t)a3;
@end

@implementation BlockingThreadElement

- (BlockingThreadElement)init
{
  v5.receiver = self;
  v5.super_class = (Class)BlockingThreadElement;
  v2 = [(BlockingThreadElement *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(BlockingThreadElement *)v2 setCumulativeTime:0];
    [(BlockingThreadElement *)v3 setMaxBlockingTime:0];
    [(BlockingThreadElement *)v3 setStartThreadTime:0];
    [(BlockingThreadElement *)v3 setEndThreadTime:0];
  }
  return v3;
}

- (int64_t)compareCumulativeTime:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BlockingThreadElement *)self cumulativeTime];
  if (v5 <= (unint64_t)[v4 cumulativeTime])
  {
    unint64_t v7 = [(BlockingThreadElement *)self cumulativeTime];
    if (v7 >= (unint64_t)[v4 cumulativeTime]) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = -1;
    }
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (int64_t)compareMaxBlockingTime:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BlockingThreadElement *)self maxBlockingTime];
  if (v5 <= (unint64_t)[v4 maxBlockingTime])
  {
    unint64_t v7 = [(BlockingThreadElement *)self maxBlockingTime];
    if (v7 >= (unint64_t)[v4 maxBlockingTime]) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = -1;
    }
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (unint64_t)cumulativeTime
{
  return self->_cumulativeTime;
}

- (void)setCumulativeTime:(unint64_t)a3
{
  self->_cumulativeTime = a3;
}

- (unint64_t)maxBlockingTime
{
  return self->_maxBlockingTime;
}

- (void)setMaxBlockingTime:(unint64_t)a3
{
  self->_maxBlockingTime = a3;
}

- (unint64_t)startThreadTime
{
  return self->_startThreadTime;
}

- (void)setStartThreadTime:(unint64_t)a3
{
  self->_startThreadTime = a3;
}

- (unint64_t)endThreadTime
{
  return self->_endThreadTime;
}

- (void)setEndThreadTime:(unint64_t)a3
{
  self->_endThreadTime = a3;
}

@end