@interface TLKTableViewScrollTester
- (BOOL)directionUp;
- (BOOL)finishedFirstScroll;
- (TLKTableViewScrollTester)init;
- (UIScrollView)tableView;
- (double)scrollTime;
- (double)startTime;
- (id)completion;
- (id)firstScroll;
- (void)finishFirstScrollIfNeeded;
- (void)fire:(id)a3;
- (void)performScrollTestOnTableView:(id)a3 completion:(id)a4;
- (void)performScrollTestOnTableView:(id)a3 firstScroll:(id)a4 completion:(id)a5;
- (void)setCompletion:(id)a3;
- (void)setDirectionUp:(BOOL)a3;
- (void)setFinishedFirstScroll:(BOOL)a3;
- (void)setFirstScroll:(id)a3;
- (void)setScrollTime:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setTableView:(id)a3;
@end

@implementation TLKTableViewScrollTester

- (TLKTableViewScrollTester)init
{
  v4.receiver = self;
  v4.super_class = (Class)TLKTableViewScrollTester;
  v2 = [(TLKTableViewScrollTester *)&v4 init];
  [(TLKTableViewScrollTester *)v2 setScrollTime:30.0];
  return v2;
}

- (void)performScrollTestOnTableView:(id)a3 completion:(id)a4
{
}

- (void)performScrollTestOnTableView:(id)a3 firstScroll:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(TLKTableViewScrollTester *)self setFinishedFirstScroll:0];
  [(TLKTableViewScrollTester *)self setTableView:v10];

  [(TLKTableViewScrollTester *)self setStartTime:CACurrentMediaTime()];
  id v12 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel_fire_];
  v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v12 addToRunLoop:v11 forMode:*MEMORY[0x1E4F1C4B0]];

  [(TLKTableViewScrollTester *)self setFirstScroll:v9];
  [(TLKTableViewScrollTester *)self setCompletion:v8];
}

- (void)fire:(id)a3
{
  id v29 = a3;
  double v4 = CACurrentMediaTime();
  [(TLKTableViewScrollTester *)self startTime];
  double v6 = v4 - v5;
  [(TLKTableViewScrollTester *)self scrollTime];
  if (v6 <= v7)
  {
    id v10 = [(TLKTableViewScrollTester *)self tableView];
    [v10 bounds];
    double v12 = v11;

    v13 = [(TLKTableViewScrollTester *)self tableView];
    [v13 contentSize];
    double v15 = v14;

    v16 = [(TLKTableViewScrollTester *)self tableView];
    [v16 contentInset];
    double v18 = v17;
    double v20 = v19;

    v21 = [(TLKTableViewScrollTester *)self tableView];
    [v21 contentOffset];
    double v23 = v22;
    double v25 = v24;

    if ([(TLKTableViewScrollTester *)self directionUp])
    {
      double v26 = v25 + -24.5;
      if (v25 + -24.5 <= 0.0) {
        [(TLKTableViewScrollTester *)self setDirectionUp:0];
      }
    }
    else
    {
      double v27 = v15 - v12 - v18 - v20;
      double v26 = v25 + 24.5;
      if (v25 + 24.5 >= v27)
      {
        [(TLKTableViewScrollTester *)self setDirectionUp:1];
        [(TLKTableViewScrollTester *)self finishFirstScrollIfNeeded];
      }
    }
    v28 = [(TLKTableViewScrollTester *)self tableView];
    objc_msgSend(v28, "setContentOffset:animated:", 0, v23, v26);
  }
  else
  {
    [(TLKTableViewScrollTester *)self finishFirstScrollIfNeeded];
    id v8 = [(TLKTableViewScrollTester *)self completion];

    if (v8)
    {
      id v9 = [(TLKTableViewScrollTester *)self completion];
      v9[2]();
    }
    [v29 invalidate];
    [(TLKTableViewScrollTester *)self setCompletion:0];
  }
}

- (void)finishFirstScrollIfNeeded
{
  if (![(TLKTableViewScrollTester *)self finishedFirstScroll])
  {
    v3 = [(TLKTableViewScrollTester *)self firstScroll];

    if (v3)
    {
      [(TLKTableViewScrollTester *)self setFinishedFirstScroll:1];
      double v4 = [(TLKTableViewScrollTester *)self firstScroll];
      v4[2]();
    }
  }
}

- (double)scrollTime
{
  return self->_scrollTime;
}

- (void)setScrollTime:(double)a3
{
  self->_scrollTime = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)firstScroll
{
  return self->_firstScroll;
}

- (void)setFirstScroll:(id)a3
{
}

- (UIScrollView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (BOOL)directionUp
{
  return self->_directionUp;
}

- (void)setDirectionUp:(BOOL)a3
{
  self->_directionUp = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (BOOL)finishedFirstScroll
{
  return self->_finishedFirstScroll;
}

- (void)setFinishedFirstScroll:(BOOL)a3
{
  self->_finishedFirstScroll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong(&self->_firstScroll, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end