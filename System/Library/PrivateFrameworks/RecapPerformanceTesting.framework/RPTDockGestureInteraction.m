@interface RPTDockGestureInteraction
- (RPTDockGestureInteraction)initWithGestureStyle:(unint64_t)a3;
- (double)amplitude;
- (id)interactionByScalingBy:(double)a3;
- (id)reversedInteraction;
- (unint64_t)gestureStyle;
- (void)invokeWithComposer:(id)a3 duration:(double)a4;
- (void)setAmplitude:(double)a3;
- (void)setGestureStyle:(unint64_t)a3;
@end

@implementation RPTDockGestureInteraction

- (RPTDockGestureInteraction)initWithGestureStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RPTDockGestureInteraction;
  result = [(RPTDockGestureInteraction *)&v5 init];
  if (result)
  {
    result->_gestureStyle = a3;
    result->_amplitude = 1.0;
  }
  return result;
}

- (void)invokeWithComposer:(id)a3 duration:(double)a4
{
  id v6 = a3;
  unint64_t v7 = [(RPTDockGestureInteraction *)self gestureStyle] - 1;
  double v8 = 1.0;
  if (v7 <= 4) {
    double v8 = dbl_1B627D378[v7];
  }
  unint64_t v9 = [(RPTDockGestureInteraction *)self gestureStyle] & 0xFFFFFFFFFFFFFFFELL;
  v10 = [v6 interactionOptions];
  uint64_t v11 = [v10 pointerFrequency];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__RPTDockGestureInteraction_invokeWithComposer_duration___block_invoke;
  v13[3] = &unk_1E613DFA8;
  v13[4] = self;
  *(double *)&v13[5] = v8;
  *(double *)&v13[6] = a4;
  if (v9 == 4) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 2;
  }
  [v6 composeDockGestureInMotion:v12 frequency:v11 actionBlock:v13];
}

void __57__RPTDockGestureInteraction_invokeWithComposer_duration___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  v4 = *(void **)(a1 + 32);
  id v6 = a2;
  [v4 amplitude];
  [v6 updateProgressTo:v3 * v5 duration:*(double *)(a1 + 48)];
}

- (id)reversedInteraction
{
  double v3 = [RPTDockGestureInteraction alloc];
  unint64_t gestureStyle = self->_gestureStyle;
  if (gestureStyle > 5) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_1B627D3A0[gestureStyle];
  }
  id v6 = [(RPTDockGestureInteraction *)v3 initWithGestureStyle:v5];
  return v6;
}

- (id)interactionByScalingBy:(double)a3
{
  uint64_t v5 = [[RPTDockGestureInteraction alloc] initWithGestureStyle:self->_gestureStyle];
  [(RPTDockGestureInteraction *)self amplitude];
  [(RPTDockGestureInteraction *)v5 setAmplitude:v6 * a3];
  return v5;
}

- (unint64_t)gestureStyle
{
  return self->_gestureStyle;
}

- (void)setGestureStyle:(unint64_t)a3
{
  self->_unint64_t gestureStyle = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

@end