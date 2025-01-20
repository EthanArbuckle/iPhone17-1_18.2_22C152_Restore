@interface PXEnumerator
- (id)copyWithZone:(_NSZone *)a3;
- (id)enumeratedObject;
- (id)firstObject;
- (id)nextObject;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)setEnumeratedObject:(id)a3;
@end

@implementation PXEnumerator

- (void).cxx_destruct
{
}

- (void)setEnumeratedObject:(id)a3
{
}

- (id)enumeratedObject
{
  return self->_enumeratedObject;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0 == -1) {
    return 0;
  }
  if (!a3->var0)
  {
    unint64_t recursiveEnumerationValue = self->recursiveEnumerationValue;
    self->unint64_t recursiveEnumerationValue = recursiveEnumerationValue + 1;
    a3->var2 = &self->recursiveEnumerationValue;
    if (recursiveEnumerationValue) {
      [(PXEnumerator *)self reset];
    }
  }
  v9 = [(PXEnumerator *)self nextObject];
  [(PXEnumerator *)self setEnumeratedObject:v9];
  if (v9)
  {
    a3->var1 = a4;
    *a4 = v9;
    unint64_t v10 = a3->var0 + 1;
    unint64_t v11 = 1;
  }
  else
  {
    unint64_t v11 = 0;
    unint64_t v10 = -1;
  }
  a3->var0 = v10;

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXEnumerator.m", 40, @"Method %s is a responsibility of subclass %@", "-[PXEnumerator copyWithZone:]", v7 object file lineNumber description];

  abort();
}

- (unint64_t)count
{
  return 0;
}

- (id)nextObject
{
  return 0;
}

- (id)firstObject
{
  return 0;
}

@end