@interface _PXStoryStyleChromePreloadingRecord
- (BOOL)isEqual:(id)a3;
- (PXStoryStyleDescriptor)styleInfo;
- (PXStoryViewLayoutSpec)viewLayoutSpec;
- (_PXStoryStyleChromePreloadingRecord)init;
- (_PXStoryStyleChromePreloadingRecord)initWithDisplayScale:(double)a3 styleInfo:(id)a4 viewLayoutSpec:(id)a5;
- (double)displayScale;
- (unint64_t)hash;
@end

@implementation _PXStoryStyleChromePreloadingRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewLayoutSpec, 0);
  objc_storeStrong((id *)&self->_styleInfo, 0);
}

- (PXStoryViewLayoutSpec)viewLayoutSpec
{
  return self->_viewLayoutSpec;
}

- (PXStoryStyleDescriptor)styleInfo
{
  return self->_styleInfo;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_PXStoryStyleChromePreloadingRecord *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(_PXStoryStyleChromePreloadingRecord *)self displayScale];
      double v7 = v6;
      [(_PXStoryStyleChromePreloadingRecord *)v5 displayScale];
      if (v7 != v8)
      {
        char v12 = 0;
LABEL_16:

        goto LABEL_17;
      }
      id v9 = [(_PXStoryStyleChromePreloadingRecord *)self styleInfo];
      id v10 = [(_PXStoryStyleChromePreloadingRecord *)v5 styleInfo];
      if (v9 == v10)
      {
      }
      else
      {
        int v11 = [v9 isEqual:v10];

        if (!v11)
        {
          char v12 = 0;
LABEL_15:

          goto LABEL_16;
        }
      }
      v13 = [(_PXStoryStyleChromePreloadingRecord *)self viewLayoutSpec];
      v14 = [(_PXStoryStyleChromePreloadingRecord *)v5 viewLayoutSpec];
      if (v13 == v14) {
        char v12 = 1;
      }
      else {
        char v12 = [v13 isEqual:v14];
      }

      goto LABEL_15;
    }
    char v12 = 0;
  }
LABEL_17:

  return v12;
}

- (unint64_t)hash
{
  unint64_t displayScale = (unint64_t)self->_displayScale;
  uint64_t v4 = [(PXStoryStyleDescriptor *)self->_styleInfo hash];
  return v4 ^ [(PXStoryViewLayoutSpec *)self->_viewLayoutSpec hash] ^ displayScale;
}

- (_PXStoryStyleChromePreloadingRecord)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryStyleChromeContainerLayout.m", 327, @"%s is not available as initializer", "-[_PXStoryStyleChromePreloadingRecord init]");

  abort();
}

- (_PXStoryStyleChromePreloadingRecord)initWithDisplayScale:(double)a3 styleInfo:(id)a4 viewLayoutSpec:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_PXStoryStyleChromePreloadingRecord;
  int v11 = [(_PXStoryStyleChromePreloadingRecord *)&v14 init];
  char v12 = v11;
  if (v11)
  {
    v11->_unint64_t displayScale = a3;
    objc_storeStrong((id *)&v11->_styleInfo, a4);
    objc_storeStrong((id *)&v12->_viewLayoutSpec, a5);
  }

  return v12;
}

@end