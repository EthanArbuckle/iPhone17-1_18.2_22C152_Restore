@interface UIAutoscroll
- (BOOL)active;
- (BOOL)disabled;
- (BOOL)startAutoscroll:(id)a3 scrollContainer:(id)a4 point:(CGPoint)a5 directions:(int)a6 repeatInterval:(double)a7;
- (CGPoint)point;
- (UIAutoscrollContainer)scrollContainer;
- (double)repeatInterval;
- (id)target;
- (int)directions;
- (unint64_t)count;
- (void)dealloc;
- (void)invalidate;
- (void)setActive:(BOOL)a3;
- (void)setCount:(unint64_t)a3;
- (void)setDirections:(int)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setPoint:(CGPoint)a3;
- (void)setRepeatInterval:(double)a3;
- (void)setScrollContainer:(id)a3;
- (void)setTarget:(id)a3;
- (void)timerFired:(id)a3;
@end

@implementation UIAutoscroll

- (void)dealloc
{
  [(UIAutoscroll *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UIAutoscroll;
  [(UIAutoscroll *)&v3 dealloc];
}

- (BOOL)startAutoscroll:(id)a3 scrollContainer:(id)a4 point:(CGPoint)a5 directions:(int)a6 repeatInterval:(double)a7
{
  uint64_t v8 = *(void *)&a6;
  double y = a5.y;
  double x = a5.x;
  id v13 = a3;
  id v14 = a4;
  v15 = [(UIAutoscroll *)self scrollContainer];
  [(UIAutoscroll *)self point];
  objc_msgSend(v15, "convertPoint:toView:", 0);
  double v17 = v16;
  double v19 = v18;

  objc_msgSend(v14, "convertPoint:toView:", 0, x, y);
  if (!self->m_timer) {
    goto LABEL_10;
  }
  double v22 = v20;
  double v23 = v21;
  id v24 = [(UIAutoscroll *)self target];
  if (v24 != v13)
  {
LABEL_9:

    goto LABEL_10;
  }
  id v25 = [(UIAutoscroll *)self scrollContainer];
  if (v25 != v14
    || sqrt((v22 - v17) * (v22 - v17) + (v23 - v19) * (v23 - v19)) >= 70.0
    || [(UIAutoscroll *)self directions] != v8)
  {

    id v24 = v13;
    goto LABEL_9;
  }
  [(UIAutoscroll *)self repeatInterval];
  double v27 = v26;

  if (v27 == a7)
  {
    -[UIAutoscroll setPoint:](self, "setPoint:", x, y);
    BOOL v28 = 1;
    goto LABEL_13;
  }
LABEL_10:
  if ((objc_opt_respondsToSelector() & 1) == 0 || [(UIAutoscroll *)self disabled]) {
    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector())
  {
    char v30 = [v14 shouldAutoscroll];
    if (!v14 || (v30 & 1) == 0) {
      goto LABEL_12;
    }
  }
  else if (!v14)
  {
LABEL_12:
    [(UIAutoscroll *)self invalidate];
    BOOL v28 = 0;
    goto LABEL_13;
  }
  if (!v8 || a7 == 0.0) {
    goto LABEL_12;
  }
  v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:0.0];
  m_timer = self->m_timer;
  if (m_timer)
  {
    [(NSTimer *)m_timer setFireDate:v31];
  }
  else
  {
    v33 = (NSTimer *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v31 interval:self target:sel_timerFired_ selector:0 userInfo:1 repeats:a7];
    v34 = self->m_timer;
    self->m_timer = v33;

    v35 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v35 addTimer:self->m_timer forMode:*MEMORY[0x1E4F1C3A0]];
  }
  if ([(UIAutoscroll *)self directions] != v8) {
    [(UIAutoscroll *)self setCount:0];
  }
  [(UIAutoscroll *)self setTarget:v13];
  [(UIAutoscroll *)self setScrollContainer:v14];
  -[UIAutoscroll setPoint:](self, "setPoint:", x, y);
  [(UIAutoscroll *)self setDirections:v8];
  [(UIAutoscroll *)self setRepeatInterval:a7];
  BOOL v28 = 1;
  [(UIAutoscroll *)self setActive:1];

LABEL_13:
  return v28;
}

- (void)invalidate
{
  if (pthread_main_np())
  {
    m_timer = self->m_timer;
    if (m_timer)
    {
      self->m_timer = 0;
      v5 = m_timer;

      [(NSTimer *)v5 invalidate];
    }
    [(UIAutoscroll *)self setTarget:0];
    -[UIAutoscroll setPoint:](self, "setPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [(UIAutoscroll *)self setScrollContainer:0];
    [(UIAutoscroll *)self setDirections:0];
    [(UIAutoscroll *)self setRepeatInterval:0.0];
    [(UIAutoscroll *)self setActive:0];
    [(UIAutoscroll *)self setCount:0];
  }
  else
  {
    [(UIAutoscroll *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (void)timerFired:(id)a3
{
  id v4 = [(UIAutoscroll *)self target];
  if (v4)
  {
    [(UIAutoscroll *)self setCount:[(UIAutoscroll *)self count] + 1];
    [v4 updateAutoscroll:self];
  }
  else
  {
    [(UIAutoscroll *)self invalidate];
  }
}

- (UIAutoscrollContainer)scrollContainer
{
  return self->m_scrollContainer;
}

- (void)setScrollContainer:(id)a3
{
}

- (CGPoint)point
{
  double x = self->m_point.x;
  double y = self->m_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->m_point = a3;
}

- (int)directions
{
  return self->m_directions;
}

- (void)setDirections:(int)a3
{
  self->m_directions = a3;
}

- (double)repeatInterval
{
  return self->m_repeatInterval;
}

- (void)setRepeatInterval:(double)a3
{
  self->m_repeatInterval = a3;
}

- (unint64_t)count
{
  return self->m_count;
}

- (void)setCount:(unint64_t)a3
{
  self->m_count = a3;
}

- (BOOL)active
{
  return self->m_active;
}

- (void)setActive:(BOOL)a3
{
  self->m_active = a3;
}

- (BOOL)disabled
{
  return self->m_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->m_disabled = a3;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->m_timer, 0);
  objc_storeStrong((id *)&self->m_scrollContainer, 0);
  objc_storeStrong(&self->m_target, 0);
}

@end