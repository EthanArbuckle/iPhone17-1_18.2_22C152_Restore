@interface ICCRCoderUnarchiverCompletionHandler
- (id)block;
- (id)dependency;
- (id)value;
- (void)setBlock:(id)a3;
- (void)setDependency:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation ICCRCoderUnarchiverCompletionHandler

- (id)block
{
  return self->block;
}

- (void)setValue:(id)a3
{
}

- (void)setDependency:(id)a3
{
}

- (void)setBlock:(id)a3
{
}

- (id)dependency
{
  id WeakRetained = objc_loadWeakRetained(&self->dependency);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->value);
  objc_destroyWeak(&self->dependency);
  objc_storeStrong(&self->block, 0);
}

- (id)value
{
  id WeakRetained = objc_loadWeakRetained(&self->value);
  return WeakRetained;
}

@end