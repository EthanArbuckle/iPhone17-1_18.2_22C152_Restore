@interface GainValueArray
- (BOOL)isValid;
- (GainValueArray)initWithArray:(id)a3;
- (void)dealloc;
@end

@implementation GainValueArray

- (BOOL)isValid
{
  return self->elements != 0;
}

- (GainValueArray)initWithArray:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GainValueArray;
  v5 = [(GainValueArray *)&v14 init];
  if (v5)
  {
    int v6 = [v4 count];
    if ((v6 & 1) != 0 || v5->elements)
    {
      FigDebugAssert3();
      v12 = 0;
      goto LABEL_11;
    }
    if (v6 >= 0) {
      int v7 = v6;
    }
    else {
      int v7 = v6 + 1;
    }
    v5->length = v7 >> 1;
    v5->elements = ($94F468A8D4C62B317260615823C2B210 *)malloc_type_calloc((uint64_t)v7 >> 1, 8uLL, 0x100004000313F17uLL);
    if (v5->length)
    {
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      do
      {
        objc_msgSend(v4, "cmi_floatValueForIndex:", (v8 * 2));
        v5->elements[v8].var0 = v10;
        objc_msgSend(v4, "cmi_floatValueForIndex:", (v8 * 2 + 1));
        v5->elements[v8].var1 = v11;
        ++v9;
        ++v8;
      }
      while (v9 < v5->length);
    }
  }
  v12 = v5;
LABEL_11:

  return v12;
}

- (void)dealloc
{
  elements = self->elements;
  if (elements) {
    free(elements);
  }
  self->elements = 0;
  self->length = 0;
  v4.receiver = self;
  v4.super_class = (Class)GainValueArray;
  [(GainValueArray *)&v4 dealloc];
}

@end