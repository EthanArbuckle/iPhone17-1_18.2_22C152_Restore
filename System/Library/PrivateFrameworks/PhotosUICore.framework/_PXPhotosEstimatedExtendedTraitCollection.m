@interface _PXPhotosEstimatedExtendedTraitCollection
- (CGSize)layoutReferenceSize;
- (_PXPhotosEstimatedExtendedTraitCollection)initWithViewController:(id)a3;
- (int64_t)layoutOrientation;
- (int64_t)layoutSizeClass;
- (int64_t)userInterfaceIdiom;
@end

@implementation _PXPhotosEstimatedExtendedTraitCollection

- (CGSize)layoutReferenceSize
{
  double width = self->_layoutReferenceSize.width;
  double height = self->_layoutReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (int64_t)layoutSizeClass
{
  return self->_layoutSizeClass;
}

- (_PXPhotosEstimatedExtendedTraitCollection)initWithViewController:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_PXPhotosEstimatedExtendedTraitCollection;
  v5 = [(PXExtendedTraitCollection *)&v25 initWithViewController:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 == 5)
    {
      v5->_layoutSizeClass = 2;
      uint64_t v8 = 4;
    }
    else
    {
      if (v7 == 1)
      {
        uint64_t v8 = 2;
      }
      else
      {
        if (v7) {
          PXAssertGetLog();
        }
        uint64_t v8 = 1;
      }
      v5->_layoutSizeClass = v8;
    }
    v5->_userInterfaceIdiom = v8;
    id v9 = v4;
    v10 = v9;
    if (v9)
    {
      while (1)
      {
        uint64_t v11 = [v10 viewIfLoaded];
        if (v11) {
          break;
        }
        v12 = [v10 parentViewController];
        v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [v10 presentingViewController];
        }
        id v15 = v14;

        v10 = v15;
        if (!v15) {
          goto LABEL_17;
        }
      }
      v16 = (void *)v11;
    }
    else
    {
LABEL_17:
      v16 = 0;
    }
    v17 = [v16 window];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      v20 = [MEMORY[0x1E4FB1438] sharedApplication];
      objc_msgSend(v20, "px_firstKeyWindow");
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    [v19 bounds];
    v5->_layoutReferenceSize.double width = v21;
    v5->_layoutReferenceSize.double height = v22;
    uint64_t v23 = 2;
    if (v21 <= v22) {
      uint64_t v23 = 1;
    }
    v5->_layoutOrientation = v23;
  }
  return v5;
}

@end