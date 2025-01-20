@interface NTKInvalidatableGroup
- (NTKInvalidatableGroup)initWithInvalidatables:(id)a3;
- (void)invalidate;
@end

@implementation NTKInvalidatableGroup

- (NTKInvalidatableGroup)initWithInvalidatables:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKInvalidatableGroup;
  v5 = [(NTKInvalidatableGroup *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    invalidatables = v5->_invalidatables;
    v5->_invalidatables = (NSArray *)v6;
  }
  return v5;
}

- (void)invalidate
{
}

uint64_t __35__NTKInvalidatableGroup_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void).cxx_destruct
{
}

@end