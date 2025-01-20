@interface UITransform
+ (id)identity;
+ (id)rotationWithDegrees:(int64_t)a3;
+ (id)rotationWithRadians:(double)a3;
+ (id)scale:(double)a3;
+ (id)scaleX:(double)a3 scaleY:(double)a4;
+ (id)transformWithCGAffineTransform:(CGAffineTransform *)a3;
+ (id)translation:(CGPoint)a3;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)transform;
- (NSString)description;
- (UITransform)init;
- (id)_initWithTransform:(CGAffineTransform *)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation UITransform

- (UITransform)init
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return (UITransform *)[(UITransform *)self _initWithTransform:v4];
}

- (id)_initWithTransform:(CGAffineTransform *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UITransform;
  id result = [(UITransform *)&v7 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->a;
    long long v6 = *(_OWORD *)&a3->c;
    *(_OWORD *)((char *)result + 40) = *(_OWORD *)&a3->tx;
    *(_OWORD *)((char *)result + 24) = v6;
    *(_OWORD *)((char *)result + 8) = v5;
  }
  return result;
}

+ (id)identity
{
  long long v2 = objc_alloc_init(UITransform);
  return v2;
}

+ (id)transformWithCGAffineTransform:(CGAffineTransform *)a3
{
  v4 = [UITransform alloc];
  long long v5 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v5;
  v8[2] = *(_OWORD *)&a3->tx;
  id v6 = [(UITransform *)v4 _initWithTransform:v8];
  return v6;
}

+ (id)rotationWithDegrees:(int64_t)a3
{
  BSDegreesToRadians();
  return (id)objc_msgSend(a1, "rotationWithRadians:");
}

+ (id)rotationWithRadians:(double)a3
{
  v4 = [UITransform alloc];
  CGAffineTransformMakeRotation(&v7, a3);
  id v5 = [(UITransform *)v4 _initWithTransform:&v7];
  return v5;
}

+ (id)translation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v5 = [UITransform alloc];
  CGAffineTransformMakeTranslation(&v8, x, y);
  id v6 = [(UITransform *)v5 _initWithTransform:&v8];
  return v6;
}

+ (id)scaleX:(double)a3 scaleY:(double)a4
{
  id v6 = [UITransform alloc];
  CGAffineTransformMakeScale(&v9, a3, a4);
  id v7 = [(UITransform *)v6 _initWithTransform:&v9];
  return v7;
}

+ (id)scale:(double)a3
{
  v4 = [UITransform alloc];
  CGAffineTransformMakeScale(&v7, a3, a3);
  id v5 = [(UITransform *)v4 _initWithTransform:&v7];
  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)self->_transform.a
       + (unint64_t)self->_transform.b
       + (unint64_t)self->_transform.c
       + (unint64_t)self->_transform.tx
       * (unint64_t)self->_transform.d
       * (unint64_t)self->_transform.ty
       + 199;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UITransform *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UITransform *)self transform];
    [(UITransform *)v5 transform];
    BOOL v6 = CGAffineTransformEqualToTransform(&t1, &v8);
  }
  else
  {
LABEL_5:
    BOOL v6 = 0;
  }
LABEL_7:

  return v6;
}

- (NSString)description
{
  return (NSString *)[(UITransform *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  long long v2 = [(UITransform *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__UITransform_succinctDescriptionBuilder__block_invoke;
  _OWORD v8[3] = &unk_1E52D9F98;
  id v4 = v3;
  id v9 = v4;
  v10 = self;
  id v5 = (id)[v4 modifyProem:v8];
  id v6 = v4;

  return v6;
}

void __41__UITransform_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  long long v5 = *(_OWORD *)(v1 + 24);
  long long v6 = *(_OWORD *)(v1 + 40);
  long long v4 = *(_OWORD *)(v1 + 8);
  v3 = BSNSStringFromCGAffineTransform();
  objc_msgSend(v2, "appendString:withName:", v3, @"transform", v4, v5, v6);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UITransform *)self descriptionBuilderWithMultilinePrefix:a3];
  long long v4 = [v3 build];

  return v4;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self->ty;
  return self;
}

@end