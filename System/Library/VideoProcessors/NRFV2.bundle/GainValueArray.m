@interface GainValueArray
- (BOOL)isValid;
- (GainValueArray)initWithArray:(id)a3;
- (void)dealloc;
@end

@implementation GainValueArray

- (GainValueArray)initWithArray:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GainValueArray;
  v8 = [(GainValueArray *)&v21 init];
  if (v8)
  {
    int v9 = objc_msgSend_count(v4, v5, v6, v7);
    if ((v9 & 1) != 0 || v8->elements)
    {
      FigDebugAssert3();
      v19 = 0;
      goto LABEL_11;
    }
    if (v9 >= 0) {
      int v10 = v9;
    }
    else {
      int v10 = v9 + 1;
    }
    v8->length = v10 >> 1;
    v8->elements = ($94F468A8D4C62B317260615823C2B210 *)malloc_type_calloc((uint64_t)v10 >> 1, 8uLL, 0x100004000313F17uLL);
    if (v8->length)
    {
      uint64_t v13 = 0;
      unint64_t v14 = 0;
      do
      {
        objc_msgSend_cmi_floatValueForIndex_(v4, v11, (v13 * 2), v12);
        v8->elements[v13].var0 = v15;
        objc_msgSend_cmi_floatValueForIndex_(v4, v16, (v13 * 2 + 1), v17);
        v8->elements[v13].var1 = v18;
        ++v14;
        ++v13;
      }
      while (v14 < v8->length);
    }
  }
  v19 = v8;
LABEL_11:

  return v19;
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

- (BOOL)isValid
{
  return self->elements != 0;
}

@end