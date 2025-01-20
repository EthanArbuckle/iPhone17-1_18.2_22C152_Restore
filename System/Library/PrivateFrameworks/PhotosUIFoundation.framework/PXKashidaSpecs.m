@interface PXKashidaSpecs
+ (PXKashidaSpecs)defaultSpecs;
- (PXKashidaSpecs)init;
- (double)maximumWidthForSubtitle:(id)a3 titleWidth:(double)a4;
- (double)maximumWidthForTitle:(id)a3 containerSize:(CGSize)a4;
- (id)_init;
- (int64_t)maximumNumberOfLinesForSubtitle;
- (int64_t)maximumNumberOfLinesForTitle;
@end

@implementation PXKashidaSpecs

+ (PXKashidaSpecs)defaultSpecs
{
  if (defaultSpecs_onceToken[0] != -1) {
    dispatch_once(defaultSpecs_onceToken, &__block_literal_global_3160);
  }
  v2 = (void *)defaultSpecs_defaultSpecs;

  return (PXKashidaSpecs *)v2;
}

- (int64_t)maximumNumberOfLinesForSubtitle
{
  return self->_maximumNumberOfLinesForSubtitle;
}

- (int64_t)maximumNumberOfLinesForTitle
{
  return self->_maximumNumberOfLinesForTitle;
}

- (double)maximumWidthForSubtitle:(id)a3 titleWidth:(double)a4
{
  return a4 * 0.6;
}

- (double)maximumWidthForTitle:(id)a3 containerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v7 = [v6 length];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __53__PXKashidaSpecs_maximumWidthForTitle_containerSize___block_invoke;
  v17[3] = &unk_26545A758;
  v17[4] = &v22;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 3, v17);
  uint64_t v8 = [v6 length];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__PXKashidaSpecs_maximumWidthForTitle_containerSize___block_invoke_2;
  v16[3] = &unk_26545A758;
  v16[4] = &v18;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v16);
  uint64_t v9 = v23[3];
  double v10 = -1.0;
  if (v9 >= 1)
  {
    unint64_t v11 = v19[3];
    if ((uint64_t)v11 >= 1)
    {
      if (width <= height)
      {
        if (v9 == 2)
        {
          double v10 = 0.6;
          if (v11 <= 7) {
            double v10 = 0.5;
          }
        }
        else if (v9 == 1)
        {
          BOOL v12 = v11 > 5;
          v13 = (double *)&unk_259D74790;
          goto LABEL_10;
        }
      }
      else if (v9 == 2)
      {
        double v10 = 0.4;
        if (v11 > 9) {
          double v10 = 0.5;
        }
      }
      else if (v9 == 1)
      {
        BOOL v12 = v11 > 5;
        v13 = (double *)&unk_259D747A0;
LABEL_10:
        double v10 = v13[v12];
      }
    }
  }
  double v14 = width * v10;
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v14;
}

uint64_t __53__PXKashidaSpecs_maximumWidthForTitle_containerSize___block_invoke(uint64_t result)
{
  return result;
}

uint64_t __53__PXKashidaSpecs_maximumWidthForTitle_containerSize___block_invoke_2(uint64_t result)
{
  return result;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PXKashidaSpecs;
  id result = [(PXKashidaSpecs *)&v3 init];
  if (result) {
    *(_OWORD *)((char *)result + 8) = xmmword_259D747B0;
  }
  return result;
}

- (PXKashidaSpecs)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXKashidaSpecs.m", 30, @"%s is not available as initializer", "-[PXKashidaSpecs init]");

  abort();
}

uint64_t __30__PXKashidaSpecs_defaultSpecs__block_invoke()
{
  id v0 = [[PXKashidaSpecs alloc] _init];
  uint64_t v1 = defaultSpecs_defaultSpecs;
  defaultSpecs_defaultSpecs = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end