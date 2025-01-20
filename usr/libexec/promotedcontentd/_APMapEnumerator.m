@interface _APMapEnumerator
- (NSEnumerator)srcEnumerator;
- (id)nextObject;
- (id)transformationBlock;
- (void)setSrcEnumerator:(id)a3;
- (void)setTransformationBlock:(id)a3;
@end

@implementation _APMapEnumerator

- (id)nextObject
{
  v3 = [(_APMapEnumerator *)self srcEnumerator];
  v4 = [v3 nextObject];

  if (v4)
  {
    v5 = [(_APMapEnumerator *)self transformationBlock];
    v6 = ((void (**)(void, void *))v5)[2](v5, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSEnumerator)srcEnumerator
{
  return self->_srcEnumerator;
}

- (void)setSrcEnumerator:(id)a3
{
}

- (id)transformationBlock
{
  return self->_transformationBlock;
}

- (void)setTransformationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transformationBlock, 0);

  objc_storeStrong((id *)&self->_srcEnumerator, 0);
}

@end