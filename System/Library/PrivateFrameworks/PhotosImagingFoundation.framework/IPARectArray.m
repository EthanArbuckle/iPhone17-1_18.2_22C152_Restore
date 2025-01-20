@interface IPARectArray
+ (id)rectArray;
+ (id)rectArrayWithRect:(CGRect)a3;
- (BOOL)isEmpty;
- (CGRect)rectAtIndex:(unint64_t)a3;
- (IPARectArray)init;
- (IPARectArray)initWithRect:(CGRect)a3;
- (IPARectArray)initWithRectArray:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)enumerateRects:(id)a3;
@end

@implementation IPARectArray

- (void)enumerateRects:(id)a3
{
  v6 = (void (**)(double, double, double, double))a3;
  imp = (double **)self->_imp;
  v5 = *imp;
  if (*imp != imp[1])
  {
    do
    {
      v6[2](*v5, v5[1], v5[2], v5[3]);
      v5 += 4;
    }
    while (v5 != *((double **)self->_imp + 1));
  }
}

- (CGRect)rectAtIndex:(unint64_t)a3
{
  uint64_t v3 = *(void *)self->_imp;
  if (a3 >= (unint64_t)((*((void *)self->_imp + 1) - v3) >> 5)) {
    std::vector<PA::Rect>::__throw_out_of_range[abi:ne180100]();
  }
  v4 = (double *)(v3 + 32 * a3);
  double v5 = *v4;
  double v6 = v4[1];
  double v7 = v4[2];
  double v8 = v4[3];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)isEmpty
{
  return *(void *)self->_imp == *((void *)self->_imp + 1);
}

- (unint64_t)count
{
  return (uint64_t)(*((void *)self->_imp + 1) - *(void *)self->_imp) >> 5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[IPAMutableRectArray allocWithZone:a3];
  return [(IPARectArray *)v4 initWithRectArray:self];
}

+ (id)rectArrayWithRect:(CGRect)a3
{
  uint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "initWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v3;
}

+ (id)rectArray
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __27__IPARectArray_description__block_invoke;
  v11[3] = &unk_1E6CC1F10;
  id v4 = v3;
  id v12 = v4;
  [(IPARectArray *)self enumerateRects:v11];
  double v5 = NSString;
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = [(IPARectArray *)self count];
  double v8 = [v4 componentsJoinedByString:@","];
  v9 = [v5 stringWithFormat:@"<%@:%p %lu rects: %@>", v6, self, v7, v8];

  return v9;
}

void __27__IPARectArray_description__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5 = *(void **)(a1 + 32);
  NSStringFromRect(*(NSRect *)&a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:");
}

- (void)dealloc
{
  imp = (void **)self->_imp;
  if (imp)
  {
    id v4 = *imp;
    if (*imp)
    {
      imp[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1E01B4BC0](imp, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)IPARectArray;
  [(IPARectArray *)&v5 dealloc];
}

- (IPARectArray)initWithRectArray:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)IPARectArray;
    if ([(IPARectArray *)&v6 init]) {
      operator new();
    }

    return 0;
  }
  else
  {
    CGRect result = (IPARectArray *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (IPARectArray)initWithRect:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IPARectArray;
  if ([(IPARectArray *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (IPARectArray)init
{
  v3.receiver = self;
  v3.super_class = (Class)IPARectArray;
  if ([(IPARectArray *)&v3 init]) {
    operator new();
  }
  return 0;
}

@end