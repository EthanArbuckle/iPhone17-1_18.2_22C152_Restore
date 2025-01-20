@interface TSDAllTouchesDoneGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (TSDAllTouchesDoneGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)dealloc;
- (void)p_touchesEndedOrCancelled:(id)a3;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation TSDAllTouchesDoneGestureRecognizer

- (TSDAllTouchesDoneGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSDAllTouchesDoneGestureRecognizer;
  v4 = [(TSDAllTouchesDoneGestureRecognizer *)&v6 initWithTarget:a3 action:a4];
  if (v4) {
    v4->mTouches = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDAllTouchesDoneGestureRecognizer;
  [(TSDAllTouchesDoneGestureRecognizer *)&v3 dealloc];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)TSDAllTouchesDoneGestureRecognizer;
  [(TSDAllTouchesDoneGestureRecognizer *)&v3 reset];
  [(NSMutableSet *)self->mTouches removeAllObjects];
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([a3 view], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)p_touchesEndedOrCancelled:(id)a3
{
  [(NSMutableSet *)self->mTouches minusSet:a3];
  if (![(NSMutableSet *)self->mTouches count] && ![(TSDAllTouchesDoneGestureRecognizer *)self state])
  {
    [(TSDAllTouchesDoneGestureRecognizer *)self setState:3];
  }
}

@end