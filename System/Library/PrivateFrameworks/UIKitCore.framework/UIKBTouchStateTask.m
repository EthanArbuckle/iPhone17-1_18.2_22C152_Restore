@interface UIKBTouchStateTask
+ (id)touchStateTaskForTouchState:(id)a3 andTask:(id)a4;
- (BOOL)isBusy;
- (UIKBTouchState)touchState;
- (UIKBTouchStateTask)initWithTouchState:(id)a3 andTask:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)task;
- (int64_t)compare:(id)a3;
- (void)setIsBusy:(BOOL)a3;
@end

@implementation UIKBTouchStateTask

+ (id)touchStateTaskForTouchState:(id)a3 andTask:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[UIKBTouchStateTask alloc] initWithTouchState:v6 andTask:v5];

  return v7;
}

- (UIKBTouchStateTask)initWithTouchState:(id)a3 andTask:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIKBTouchStateTask;
  v9 = [(UIKBTouchStateTask *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_touchState, a3);
    uint64_t v11 = [v8 copy];
    id task = v10->_task;
    v10->_id task = (id)v11;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(UIKBTouchStateTask);
  objc_storeStrong((id *)&v4->_touchState, self->_touchState);
  uint64_t v5 = [self->_task copy];
  id task = v4->_task;
  v4->_id task = (id)v5;

  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int v5 = [(UIKBTouchState *)self->_touchState phase];
  id v6 = [v4 touchState];
  int v7 = v5 - [v6 phase];

  if (v7 <= 0)
  {
    if (v7 < 0)
    {
      int64_t v8 = -1;
    }
    else
    {
      [(UIKBTouchState *)self->_touchState timestamp];
      double v10 = v9;
      uint64_t v11 = [v4 touchState];
      [v11 timestamp];
      double v13 = v10 - v12;

      if (v13 >= 0.0) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = -1;
      }
      if (v13 > 0.0) {
        int64_t v8 = 1;
      }
      else {
        int64_t v8 = v14;
      }
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (UIKBTouchState)touchState
{
  return self->_touchState;
}

- (id)task
{
  return self->_task;
}

- (BOOL)isBusy
{
  return self->_isBusy;
}

- (void)setIsBusy:(BOOL)a3
{
  self->_isBusy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_task, 0);
  objc_storeStrong((id *)&self->_touchState, 0);
}

@end