@interface SUUIEditorialCardLayout
- (CGSize)primaryLockupSize;
- (NSArray)allLockups;
- (SUUIEditorialCardLayout)initWithCard:(id)a3 width:(double)a4 context:(id)a5;
- (SUUILockupViewElement)primaryLockup;
- (double)secondaryLockupWidth;
@end

@implementation SUUIEditorialCardLayout

- (SUUIEditorialCardLayout)initWithCard:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SUUIEditorialCardLayout;
  v10 = [(SUUIEditorialCardLayout *)&v26 init];
  if (v10)
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    allLockups = v10->_allLockups;
    v10->_allLockups = v11;

    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __54__SUUIEditorialCardLayout_initWithCard_width_context___block_invoke;
    v21[3] = &unk_265401AC8;
    id v13 = v9;
    id v22 = v13;
    v24 = v25;
    v14 = v10;
    v23 = v14;
    [v8 enumerateChildrenUsingBlock:v21];
    uint64_t v15 = [(NSMutableArray *)v10->_allLockups count];
    primaryLockup = v14->_primaryLockup;
    if (primaryLockup)
    {
      +[SUUIVerticalLockupView preferredSizeForViewElement:primaryLockup context:v13];
      v14->_primaryLockupSize.width = v17;
      v14->_primaryLockupSize.height = v18;
      a4 = a4 - (v17 + 15.0);
      --v15;
    }
    if (v15 >= 1)
    {
      float v19 = (a4 + (double)(v15 - 1) * -15.0) / (double)v15;
      v14->_secondaryLockupWidth = floorf(v19);
    }

    _Block_object_dispose(v25, 8);
  }

  return v10;
}

void __54__SUUIEditorialCardLayout_initWithCard_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 elementType] == 66)
  {
    v4 = [v10 firstChildForElementType:49];
    uint64_t v5 = [v10 firstChildForElementType:152];
    v6 = (void *)v5;
    v7 = v4;
    if (v4 || (v7 = (void *)v5) != 0)
    {
      [*(id *)(a1 + 32) sizeForViewElement:v7 width:0.0];
      if (v8 > 0.00000011920929)
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        if (v8 > *(double *)(v9 + 24))
        {
          *(double *)(v9 + 24) = v8;
          objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), a2);
        }
      }
    }
    [*(id *)(*(void *)(a1 + 40) + 8) addObject:v10];
  }
}

- (NSArray)allLockups
{
  return &self->_allLockups->super;
}

- (SUUILockupViewElement)primaryLockup
{
  return self->_primaryLockup;
}

- (CGSize)primaryLockupSize
{
  double width = self->_primaryLockupSize.width;
  double height = self->_primaryLockupSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)secondaryLockupWidth
{
  return self->_secondaryLockupWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryLockup, 0);
  objc_storeStrong((id *)&self->_allLockups, 0);
}

@end