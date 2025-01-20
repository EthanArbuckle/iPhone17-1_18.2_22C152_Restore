@interface IPAPreviewSizePolicy
- (BOOL)styleCanBeProducedFromSize:(CGSize)a3;
- (BOOL)styleIsNeededForFullSize:(CGSize)a3;
- (CGSize)transformSize:(CGSize)a3;
- (IPAPreviewSizePolicy)initWithName:(id)a3 style:(id)a4 sizePolicy:(id)a5 styleNeededThreshold:(id)a6 styleProducedThreshold:(id)a7;
- (IPAPreviewSizePolicy)initWithName:(id)a3 suffix:(id)a4 style:(id)a5 sizePolicy:(id)a6 styleNeededThreshold:(id)a7 styleProducedThreshold:(id)a8;
- (NSString)name;
- (NSString)suffix;
- (PFIntSize_st)integralTransformSize:(CGSize)a3;
- (id)description;
- (id)sizeTransformationPolicy;
- (id)style;
- (id)styleShouldBeProducedFrom:(id)a3;
- (void)setSuffix:(id)a3;
@end

@implementation IPAPreviewSizePolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong(&self->_styleProducedThreshold, 0);
  objc_storeStrong(&self->_styleNeededThreshold, 0);
  objc_storeStrong((id *)&self->_sizePolicy, 0);
  objc_storeStrong(&self->_style, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSuffix:(id)a3
{
}

- (NSString)suffix
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> %@ (%@) %@", objc_opt_class(), self, self->_style, self->_name, self->_sizePolicy];
}

- (id)styleShouldBeProducedFrom:(id)a3
{
  v4 = (void (**)(id, void, double *))a3;
  double v14 = 0.0;
  double v15 = 0.0;
  uint64_t v5 = v4[2](v4, 0, &v14);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 0;
    unint64_t v8 = -1;
    uint64_t v9 = 1;
    do
    {
      if (-[IPAPreviewSizePolicy styleCanBeProducedFromSize:](self, "styleCanBeProducedFromSize:", v14, v15))
      {
        unint64_t v10 = (unint64_t)(v14 * v15);
        if (v8 > v10)
        {
          id v11 = v6;

          v7 = v11;
          unint64_t v8 = v10;
        }
      }
      uint64_t v12 = v4[2](v4, v9, &v14);

      ++v9;
      v6 = (void *)v12;
    }
    while (v12);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)styleCanBeProducedFromSize:(CGSize)a3
{
  return (*((uint64_t (**)(__n128, __n128))self->_styleProducedThreshold + 2))((__n128)a3, *(__n128 *)&a3.height);
}

- (BOOL)styleIsNeededForFullSize:(CGSize)a3
{
  return (*((uint64_t (**)(__n128, __n128))self->_styleNeededThreshold + 2))((__n128)a3, *(__n128 *)&a3.height);
}

- (id)sizeTransformationPolicy
{
  return self->_sizePolicy;
}

- (PFIntSize_st)integralTransformSize:(CGSize)a3
{
  unint64_t v3 = -[IPAImageSizePolicy integralTransformSize:](self->_sizePolicy, "integralTransformSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)transformSize:(CGSize)a3
{
  -[IPAImageSizePolicy transformSize:](self->_sizePolicy, "transformSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)style
{
  return self->_style;
}

- (IPAPreviewSizePolicy)initWithName:(id)a3 suffix:(id)a4 style:(id)a5 sizePolicy:(id)a6 styleNeededThreshold:(id)a7 styleProducedThreshold:(id)a8
{
  id v15 = a4;
  v16 = [(IPAPreviewSizePolicy *)self initWithName:a3 style:a5 sizePolicy:a6 styleNeededThreshold:a7 styleProducedThreshold:a8];
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_suffix, a4);
  }

  return v17;
}

- (IPAPreviewSizePolicy)initWithName:(id)a3 style:(id)a4 sizePolicy:(id)a5 styleNeededThreshold:(id)a6 styleProducedThreshold:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)IPAPreviewSizePolicy;
  v18 = [(IPAPreviewSizePolicy *)&v26 init];
  if (!v14)
  {
    _PFAssertFailHandler();
    goto LABEL_9;
  }
  if (!v15)
  {
LABEL_9:
    _PFAssertFailHandler();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _PFAssertFailHandler();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    uint64_t v25 = _PFAssertFailHandler();
    return (IPAPreviewSizePolicy *)NSStringFromPFIntPoint(v25);
  }
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong(&v19->_style, a4);
    objc_storeStrong((id *)&v19->_sizePolicy, a5);
    uint64_t v20 = MEMORY[0x1E01B4F20](v16);
    id styleNeededThreshold = v19->_styleNeededThreshold;
    v19->_id styleNeededThreshold = (id)v20;

    uint64_t v22 = MEMORY[0x1E01B4F20](v17);
    id styleProducedThreshold = v19->_styleProducedThreshold;
    v19->_id styleProducedThreshold = (id)v22;
  }
  return v19;
}

@end