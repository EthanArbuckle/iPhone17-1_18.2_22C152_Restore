@interface PKBlurView
- (BOOL)_shouldAnimatePropertyAdditivelyWithKey:(id)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (double)blurRadius;
- (void)setBlurRadius:(double)a3;
@end

@implementation PKBlurView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"filters.gaussianBlur.inputRadius"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKBlurView;
    BOOL v5 = [(PKBlurView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (BOOL)_shouldAnimatePropertyAdditivelyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"filters.gaussianBlur.inputRadius"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKBlurView;
    BOOL v5 = [(PKBlurView *)&v7 _shouldAnimatePropertyAdditivelyWithKey:v4];
  }

  return v5;
}

- (void)setBlurRadius:(double)a3
{
  if (self->_blurRadius != a3)
  {
    if (!self->_filter)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __28__PKBlurView_setBlurRadius___block_invoke;
      v7[3] = &unk_1E59CA7D0;
      v7[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
    }
    self->_blurRadius = a3;
    BOOL v5 = [(PKBlurView *)self layer];
    v6 = [NSNumber numberWithDouble:self->_blurRadius];
    [v5 setValue:v6 forKeyPath:@"filters.gaussianBlur.inputRadius"];
  }
}

void __28__PKBlurView_setBlurRadius___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F39BC0]);
  uint64_t v3 = [v2 initWithType:*MEMORY[0x1E4F3A0D0]];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 408);
  *(void *)(v4 + 408) = v3;

  [*(id *)(*(void *)(a1 + 32) + 408) setValue:&unk_1EF2B9A68 forKeyPath:@"inputRadius"];
  [*(id *)(*(void *)(a1 + 32) + 408) setName:@"gaussianBlur"];
  v6 = [*(id *)(a1 + 32) layer];
  v8[0] = *(void *)(*(void *)(a1 + 32) + 408);
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v6 setFilters:v7];
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void).cxx_destruct
{
}

@end