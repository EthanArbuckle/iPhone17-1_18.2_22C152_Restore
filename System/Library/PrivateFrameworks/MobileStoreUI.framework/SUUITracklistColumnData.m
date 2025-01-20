@interface SUUITracklistColumnData
- (NSArray)columns;
- (SUUITracklistColumnData)initWithRepresentativeTrack:(id)a3;
- (double)interColumnSpacing;
- (double)leftEdgeInset;
- (double)rightEdgeInset;
- (id)_initSUUITracklistColumnData;
- (id)columnForIdentifier:(int64_t)a3;
- (id)viewElementsForTrack:(id)a3 columnIndex:(int64_t)a4;
- (void)adjustColumnsToFitWidth:(double)a3;
- (void)enumerateColumnsForHeader:(id)a3 usingBlock:(id)a4;
- (void)enumerateColumnsForTrack:(id)a3 usingBlock:(id)a4;
- (void)setColumns:(id)a3;
- (void)setInterColumnSpacing:(double)a3;
- (void)setLeftEdgeInset:(double)a3;
- (void)setRightEdgeInset:(double)a3;
@end

@implementation SUUITracklistColumnData

- (id)_initSUUITracklistColumnData
{
  v3.receiver = self;
  v3.super_class = (Class)SUUITracklistColumnData;
  id result = [(SUUITracklistColumnData *)&v3 init];
  if (result)
  {
    *((void *)result + 4) = 0x402E000000000000;
    *((_OWORD *)result + 1) = xmmword_2568A0970;
  }
  return result;
}

- (SUUITracklistColumnData)initWithRepresentativeTrack:(id)a3
{
  id v4 = a3;
  v5 = [(SUUITracklistColumnData *)self _initSUUITracklistColumnData];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__27;
    v22 = __Block_byref_object_dispose__27;
    id v23 = 0;
    v7 = [v4 flattenedChildren];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __55__SUUITracklistColumnData_initWithRepresentativeTrack___block_invoke;
    v15 = &unk_265403490;
    v17 = &v18;
    id v8 = v6;
    id v16 = v8;
    [v7 enumerateObjectsUsingBlock:&v12];
    if (v19[5]) {
      objc_msgSend(v8, "addObject:", v12, v13, v14, v15);
    }
    uint64_t v9 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
    columns = v5->_columns;
    v5->_columns = (NSArray *)v9;

    _Block_object_dispose(&v18, 8);
  }

  return v5;
}

void __55__SUUITracklistColumnData_initWithRepresentativeTrack___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = SUUITrackListColumnIdentifierForViewElement(v16);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = *(void *)(v6 + 40);
  if (v7)
  {
    if (v3 != 2)
    {
      uint64_t v8 = [*(id *)(v6 + 40) columnIdentifier];
      uint64_t v5 = *(void *)(a1 + 40);
      if (v8 == v4) {
        goto LABEL_6;
      }
      uint64_t v7 = *(void *)(*(void *)(v5 + 8) + 40);
    }
    [*(id *)(a1 + 32) addObject:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    uint64_t v5 = *(void *)(a1 + 40);
  }
LABEL_6:
  if (!*(void *)(*(void *)(v5 + 8) + 40))
  {
    v11 = objc_alloc_init(SUUITracklistColumn);
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setColumnIdentifier:v4];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setShowsPreviewControl:", objc_msgSend(v16, "elementType") == 90);
    uint64_t v14 = 1;
    uint64_t v15 = 1;
    switch(v4)
    {
      case 0:
      case 5:
        goto LABEL_11;
      case 1:
        uint64_t v15 = 0;
        uint64_t v14 = 2;
        goto LABEL_11;
      case 2:
      case 3:
        uint64_t v14 = 2;
        uint64_t v15 = 2;
        goto LABEL_11;
      case 4:
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSizesToFit:1];
        uint64_t v14 = 0;
        uint64_t v15 = 0;
LABEL_11:
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setContentAlignment:v14];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setHeaderAlignment:v15];
        break;
      default:
        break;
    }
  }
}

- (void)adjustColumnsToFitWidth:(double)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v5 = self->_columns;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (!v6)
  {
LABEL_25:

    return;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v34;
  double v10 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v34 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      if ([v12 sizesToFit])
      {
        ++v8;
      }
      else
      {
        [v12 preferredWidth];
        double v14 = v13;
        [v12 maximumWidthFraction];
        if (v15 > 0.00000011920929)
        {
          double v16 = v15 * a3;
          if (v14 < v16) {
            double v16 = v14;
          }
          float v17 = v16;
          double v14 = floorf(v17);
        }
        [v12 setWidth:v14];
        double v10 = v10 + v14;
      }
    }
    uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  }
  while (v7);

  if (v8 >= 1)
  {
    double leftEdgeInset = self->_leftEdgeInset;
    double rightEdgeInset = self->_rightEdgeInset;
    NSUInteger v20 = [(NSArray *)self->_columns count];
    double interColumnSpacing = self->_interColumnSpacing;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v5 = self->_columns;
    uint64_t v22 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      float v24 = (a3 - leftEdgeInset - rightEdgeInset - (double)(v20 - 1) * interColumnSpacing - v10) / (double)v8;
      double v25 = floorf(v24);
      uint64_t v26 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v30 != v26) {
            objc_enumerationMutation(v5);
          }
          v28 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if (objc_msgSend(v28, "sizesToFit", (void)v29)) {
            [v28 setWidth:v25];
          }
        }
        uint64_t v23 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v23);
    }
    goto LABEL_25;
  }
}

- (id)columnForIdentifier:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_columns;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "columnIdentifier", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)enumerateColumnsForHeader:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  columns = self->_columns;
  id v8 = a3;
  uint64_t v9 = [(NSArray *)columns count];
  id v10 = [v8 titleLabels];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__SUUITracklistColumnData_enumerateColumnsForHeader_usingBlock___block_invoke;
  v12[3] = &unk_2654034B8;
  id v13 = v6;
  uint64_t v14 = v9;
  v12[4] = self;
  id v11 = v6;
  [v10 enumerateObjectsUsingBlock:v12];
}

void __64__SUUITracklistColumnData_enumerateColumnsForHeader_usingBlock___block_invoke(void *a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (a1[6] > a3)
  {
    id v10 = v5;
    id v6 = [v5 text];
    uint64_t v7 = [v6 string];
    uint64_t v8 = [v7 length];

    id v5 = v10;
    if (v8)
    {
      uint64_t v9 = [*(id *)(a1[4] + 8) objectAtIndex:a3];
      (*(void (**)(void))(a1[5] + 16))();

      id v5 = v10;
    }
  }
}

- (void)enumerateColumnsForTrack:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 flattenedChildren];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  uint64_t v9 = [v8 count];
  columns = self->_columns;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__SUUITracklistColumnData_enumerateColumnsForTrack_usingBlock___block_invoke;
  v13[3] = &unk_2654034E0;
  double v16 = v18;
  uint64_t v17 = v9;
  id v11 = v8;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [(NSArray *)columns enumerateObjectsUsingBlock:v13];

  _Block_object_dispose(v18, 8);
}

void __63__SUUITracklistColumnData_enumerateColumnsForTrack_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = (void *)MEMORY[0x25A2A9B80]();
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v5 < *(void *)(a1 + 56))
  {
    while (1)
    {
      id v6 = [*(id *)(a1 + 32) objectAtIndex:v5];
      if ([v6 elementType] == 90)
      {
        id v7 = [v6 flattenedChildren];
        uint64_t v8 = [v7 firstObject];

        id v6 = (void *)v8;
      }
      uint64_t v9 = SUUITrackListColumnIdentifierForViewElement(v6);
      if (v9 != [v10 columnIdentifier]) {
        break;
      }
      [v4 addObject:v6];

      if (v9 != 2 && ++v5 < *(void *)(a1 + 56)) {
        continue;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v4 count];
}

- (id)viewElementsForTrack:(id)a3 columnIndex:(int64_t)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__27;
  id v14 = __Block_byref_object_dispose__27;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__SUUITracklistColumnData_viewElementsForTrack_columnIndex___block_invoke;
  v9[3] = &unk_265403508;
  v9[4] = &v10;
  v9[5] = a4;
  [(SUUITracklistColumnData *)self enumerateColumnsForTrack:v6 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __60__SUUITracklistColumnData_viewElementsForTrack_columnIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  if (*(void *)(a1 + 40) == a4)
  {
    uint64_t v7 = [a3 copy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a5 = 1;
  }
}

- (NSArray)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
}

- (double)interColumnSpacing
{
  return self->_interColumnSpacing;
}

- (void)setInterColumnSpacing:(double)a3
{
  self->_double interColumnSpacing = a3;
}

- (double)leftEdgeInset
{
  return self->_leftEdgeInset;
}

- (void)setLeftEdgeInset:(double)a3
{
  self->_double leftEdgeInset = a3;
}

- (double)rightEdgeInset
{
  return self->_rightEdgeInset;
}

- (void)setRightEdgeInset:(double)a3
{
  self->_double rightEdgeInset = a3;
}

- (void).cxx_destruct
{
}

@end