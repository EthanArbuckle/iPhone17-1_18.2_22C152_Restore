@interface PXPointAnimator
- (BOOL)isAnimating;
- (CGPoint)approximateVelocity;
- (CGPoint)presentationValue;
- (CGPoint)value;
- (NSString)description;
- (NSString)label;
- (PXMutableNumberAnimator)xAnimator;
- (PXMutableNumberAnimator)yAnimator;
- (PXPointAnimator)init;
- (PXPointAnimator)initWithValue:(CGPoint)a3;
- (PXPointAnimator)initWithValue:(CGPoint)a3 epsilon:(double)a4;
- (double)currentTime;
- (double)epsilon;
- (void)_setInternalValue:(CGPoint)a3;
- (void)_update;
- (void)didPerformChanges;
- (void)handleDisplayLink:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)performChangesUsingDefaultSpringAnimationWithInitialVelocity:(CGPoint)a3 changes:(id)a4;
- (void)performChangesUsingSpringAnimationWithStiffness:(double)a3 dampingRatio:(double)a4 initialVelocity:(CGPoint)a5 changes:(id)a6;
- (void)performChangesWithDuration:(double)a3 curve:(int64_t)a4 changes:(id)a5;
- (void)performChangesWithoutAnimation:(id)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setPresentationValue:(CGPoint)a3;
- (void)setValue:(CGPoint)a3;
@end

@implementation PXPointAnimator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_yAnimator, 0);

  objc_storeStrong((id *)&self->_xAnimator, 0);
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (CGPoint)presentationValue
{
  double x = self->_presentationValue.x;
  double y = self->_presentationValue.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)value
{
  double x = self->_value.x;
  double y = self->_value.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)handleDisplayLink:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__PXPointAnimator_handleDisplayLink___block_invoke;
  v7[3] = &unk_26545B728;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PXPointAnimator;
  id v5 = v4;
  [(PXObservable *)&v6 performChanges:v7];
}

uint64_t __37__PXPointAnimator_handleDisplayLink___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) handleDisplayLink:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 104);

  return [v3 handleDisplayLink:v2];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v5.receiver = self;
  v5.super_class = (Class)PXPointAnimator;
  -[PXObservable performChanges:](&v5, sel_performChanges_, &__block_literal_global_7513, a4, a5);
}

- (PXMutableNumberAnimator)yAnimator
{
  return self->_yAnimator;
}

- (PXMutableNumberAnimator)xAnimator
{
  return self->_xAnimator;
}

- (void)setValue:(CGPoint)a3
{
  double y = a3.y;
  [(PXMutableNumberAnimator *)self->_xAnimator setValue:a3.x];
  yAnimator = self->_yAnimator;

  [(PXMutableNumberAnimator *)yAnimator setValue:y];
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXPointAnimator;
  [(PXObservable *)&v3 didPerformChanges];
  [(PXPointAnimator *)self _update];
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__PXPointAnimator_performChanges___block_invoke;
  v7[3] = &unk_26545B640;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PXPointAnimator;
  id v5 = v4;
  [(PXObservable *)&v6 performChanges:v7];
}

void __34__PXPointAnimator_performChanges___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 96);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34__PXPointAnimator_performChanges___block_invoke_2;
  v3[3] = &unk_26545B618;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 performChanges:v3];
}

void __34__PXPointAnimator_performChanges___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__PXPointAnimator_performChanges___block_invoke_3;
  v4[3] = &unk_26545B618;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performChanges:v4];
}

uint64_t __34__PXPointAnimator_performChanges___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  objc_super v6 = [NSString stringWithFormat:@"x_%@", v5];
  [(PXMutableNumberAnimator *)self->_xAnimator setLabel:v6];

  id v7 = [NSString stringWithFormat:@"y_%@", v5];
  [(PXMutableNumberAnimator *)self->_yAnimator setLabel:v7];
}

- (void)performChangesUsingSpringAnimationWithStiffness:(double)a3 dampingRatio:(double)a4 initialVelocity:(CGPoint)a5 changes:(id)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __104__PXPointAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke;
  v14[3] = &unk_26545B6E0;
  double v16 = a3;
  double v17 = a4;
  CGFloat v18 = x;
  CGFloat v19 = y;
  v14[4] = self;
  id v15 = v11;
  v13.receiver = self;
  v13.super_class = (Class)PXPointAnimator;
  id v12 = v11;
  [(PXObservable *)&v13 performChanges:v14];
}

void __104__PXPointAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 96);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __104__PXPointAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke_2;
  v6[3] = &unk_26545B6B8;
  v6[4] = v1;
  double v8 = v3;
  double v9 = v4;
  long long v10 = *(_OWORD *)(a1 + 64);
  id v7 = *(id *)(a1 + 40);
  [v2 performChangesUsingSpringAnimationWithStiffness:v6 dampingRatio:v3 initialVelocity:v4 changes:v5];
}

void __104__PXPointAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 72);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __104__PXPointAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke_3;
  v7[3] = &unk_26545B618;
  id v6 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v2 performChangesUsingSpringAnimationWithStiffness:v7 dampingRatio:v3 initialVelocity:v4 changes:v5];
}

uint64_t __104__PXPointAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)performChangesUsingDefaultSpringAnimationWithInitialVelocity:(CGPoint)a3 changes:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __88__PXPointAnimator_performChangesUsingDefaultSpringAnimationWithInitialVelocity_changes___block_invoke;
  v10[3] = &unk_26545B690;
  CGFloat v12 = x;
  CGFloat v13 = y;
  v10[4] = self;
  id v11 = v7;
  v9.receiver = self;
  v9.super_class = (Class)PXPointAnimator;
  id v8 = v7;
  [(PXObservable *)&v9 performChanges:v10];
}

void __88__PXPointAnimator_performChangesUsingDefaultSpringAnimationWithInitialVelocity_changes___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 96);
  double v3 = *(double *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __88__PXPointAnimator_performChangesUsingDefaultSpringAnimationWithInitialVelocity_changes___block_invoke_2;
  v4[3] = &unk_26545B668;
  v4[4] = v1;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  [v2 performChangesUsingDefaultSpringAnimationWithInitialVelocity:v4 changes:v3];
}

void __88__PXPointAnimator_performChangesUsingDefaultSpringAnimationWithInitialVelocity_changes___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  double v3 = *(double *)(a1 + 56);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __88__PXPointAnimator_performChangesUsingDefaultSpringAnimationWithInitialVelocity_changes___block_invoke_3;
  v5[3] = &unk_26545B618;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 performChangesUsingDefaultSpringAnimationWithInitialVelocity:v5 changes:v3];
}

uint64_t __88__PXPointAnimator_performChangesUsingDefaultSpringAnimationWithInitialVelocity_changes___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)performChangesWithDuration:(double)a3 curve:(int64_t)a4 changes:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__PXPointAnimator_performChangesWithDuration_curve_changes___block_invoke;
  v11[3] = &unk_26545B690;
  double v13 = a3;
  int64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  v10.receiver = self;
  v10.super_class = (Class)PXPointAnimator;
  id v9 = v8;
  [(PXObservable *)&v10 performChanges:v11];
}

void __60__PXPointAnimator_performChangesWithDuration_curve_changes___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 96);
  double v3 = *(double *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__PXPointAnimator_performChangesWithDuration_curve_changes___block_invoke_2;
  v5[3] = &unk_26545B668;
  v5[4] = v1;
  double v7 = v3;
  uint64_t v8 = v4;
  id v6 = *(id *)(a1 + 40);
  [v2 performChangesWithDuration:v4 curve:v5 changes:v3];
}

void __60__PXPointAnimator_performChangesWithDuration_curve_changes___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  double v3 = *(double *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__PXPointAnimator_performChangesWithDuration_curve_changes___block_invoke_3;
  v6[3] = &unk_26545B618;
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 performChangesWithDuration:v4 curve:v6 changes:v3];
}

uint64_t __60__PXPointAnimator_performChangesWithDuration_curve_changes___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)performChangesWithoutAnimation:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__PXPointAnimator_performChangesWithoutAnimation___block_invoke;
  v7[3] = &unk_26545B640;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PXPointAnimator;
  id v5 = v4;
  [(PXObservable *)&v6 performChanges:v7];
}

void __50__PXPointAnimator_performChangesWithoutAnimation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 96);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__PXPointAnimator_performChangesWithoutAnimation___block_invoke_2;
  v3[3] = &unk_26545B618;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 performChangesWithoutAnimation:v3];
}

void __50__PXPointAnimator_performChangesWithoutAnimation___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__PXPointAnimator_performChangesWithoutAnimation___block_invoke_3;
  v4[3] = &unk_26545B618;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performChangesWithoutAnimation:v4];
}

uint64_t __50__PXPointAnimator_performChangesWithoutAnimation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    [(PXObservable *)self signalChange:4];
  }
}

- (void)setPresentationValue:(CGPoint)a3
{
  if (self->_presentationValue.x != a3.x || self->_presentationValue.y != a3.y)
  {
    self->_presentationValue = a3;
    [(PXObservable *)self signalChange:2];
  }
}

- (void)_setInternalValue:(CGPoint)a3
{
  if (self->_value.x != a3.x || self->_value.y != a3.y)
  {
    self->_value = a3;
    [(PXObservable *)self signalChange:1];
  }
}

- (void)_update
{
  [(PXMutableNumberAnimator *)self->_xAnimator value];
  double v4 = v3;
  [(PXMutableNumberAnimator *)self->_yAnimator value];
  -[PXPointAnimator _setInternalValue:](self, "_setInternalValue:", v4, v5);
  [(PXMutableNumberAnimator *)self->_xAnimator presentationValue];
  double v7 = v6;
  [(PXMutableNumberAnimator *)self->_yAnimator presentationValue];
  -[PXPointAnimator setPresentationValue:](self, "setPresentationValue:", v7, v8);
  if ([(PXMutableNumberAnimator *)self->_xAnimator isAnimating]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = [(PXMutableNumberAnimator *)self->_yAnimator isAnimating];
  }

  [(PXPointAnimator *)self setIsAnimating:v9];
}

- (CGPoint)approximateVelocity
{
  [(PXMutableNumberAnimator *)self->_xAnimator approximateVelocity];
  double v4 = v3;
  [(PXMutableNumberAnimator *)self->_yAnimator approximateVelocity];
  double v6 = v5;
  double v7 = v4;
  result.CGFloat y = v6;
  result.CGFloat x = v7;
  return result;
}

- (double)currentTime
{
  [(PXMutableNumberAnimator *)self->_xAnimator currentTime];
  return result;
}

- (double)epsilon
{
  [(PXMutableNumberAnimator *)self->_xAnimator epsilon];
  return result;
}

- (NSString)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [(PXPointAnimator *)self xAnimator];
  double v7 = [(PXPointAnimator *)self yAnimator];
  v8 = [v3 stringWithFormat:@"<%@:%p CGFloat x = %@, y = %@>", v5, self, v6, v7];;

  return (NSString *)v8;
}

- (PXPointAnimator)initWithValue:(CGPoint)a3 epsilon:(double)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v16.receiver = self;
  v16.super_class = (Class)PXPointAnimator;
  double v7 = [(PXObservable *)&v16 init];
  double v8 = v7;
  if (v7)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__PXPointAnimator_initWithValue_epsilon___block_invoke;
    v11[3] = &unk_26545B5F0;
    id v12 = v7;
    CGFloat v13 = x;
    CGFloat v14 = y;
    double v15 = a4;
    v10.receiver = v12;
    v10.super_class = (Class)PXPointAnimator;
    [(PXObservable *)&v10 performChanges:v11];
  }
  return v8;
}

uint64_t __41__PXPointAnimator_initWithValue_epsilon___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[PXNumberAnimator alloc] initWithValue:*(double *)(a1 + 40) epsilon:*(double *)(a1 + 56)];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  double v5 = [[PXNumberAnimator alloc] initWithValue:*(double *)(a1 + 48) epsilon:*(double *)(a1 + 56)];
  uint64_t v6 = *(void *)(a1 + 32);
  double v7 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v5;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setDisplayLinkTarget:");
  double v8 = *(void **)(*(void *)(a1 + 32) + 104);

  return objc_msgSend(v8, "setDisplayLinkTarget:");
}

- (PXPointAnimator)initWithValue:(CGPoint)a3
{
  return -[PXPointAnimator initWithValue:epsilon:](self, "initWithValue:epsilon:", a3.x, a3.y, 0.001);
}

- (PXPointAnimator)init
{
  return -[PXPointAnimator initWithValue:](self, "initWithValue:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

@end