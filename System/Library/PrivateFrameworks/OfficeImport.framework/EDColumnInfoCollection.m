@interface EDColumnInfoCollection
- (EDColumnInfoCollection)initWithResources:(id)a3 worksheet:(id)a4;
- (id)columnInfoCreateIfNilForColumnNumber:(int)a3;
- (id)columnInfoForColumnNumber:(int)a3;
@end

@implementation EDColumnInfoCollection

- (EDColumnInfoCollection)initWithResources:(id)a3 worksheet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EDColumnInfoCollection;
  v8 = [(EDCollection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->mWorksheet, v7);
    objc_storeWeak((id *)&v9->mResources, v6);
  }

  return v9;
}

- (id)columnInfoForColumnNumber:(int)a3
{
  unint64_t v5 = [(EDCollection *)self count];
  if (!v5)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_10;
  }
  unint64_t v6 = v5;
  uint64_t v7 = 0;
  while (1)
  {
    v8 = [(EDCollection *)self objectAtIndex:v7];
    v9 = [v8 range];
    v10 = v9;
    if (!v9) {
      goto LABEL_6;
    }
    if ((int)[v9 firstColumn] > a3) {
      break;
    }
    if ((int)[v10 lastColumn] >= a3) {
      goto LABEL_9;
    }
LABEL_6:

    if (v6 == ++v7) {
      goto LABEL_7;
    }
  }

  v10 = v8;
  v8 = 0;
LABEL_9:

LABEL_10:
  return v8;
}

- (id)columnInfoCreateIfNilForColumnNumber:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = -[EDColumnInfoCollection columnInfoForColumnNumber:](self, "columnInfoForColumnNumber:");
  unint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 range];
    uint64_t v8 = [v7 firstColumn];
    uint64_t v9 = [v7 lastColumn];
    uint64_t v10 = v9;
    if (v8 != v3 || v9 != v3)
    {
      objc_super v11 = +[EDReference referenceWithFirstRow:0xFFFFFFFFLL lastRow:0xFFFFFFFFLL firstColumn:v3 lastColumn:v3];
      [v6 setRange:v11];

      if ((int)v8 < (int)v3)
      {
        v12 = (void *)[v6 copy];
        v13 = +[EDReference referenceWithFirstRow:0xFFFFFFFFLL lastRow:0xFFFFFFFFLL firstColumn:v8 lastColumn:(v3 - 1)];
        [v12 setRange:v13];

        [(EDSortedCollection *)self addObject:v12];
      }
      if ((int)v10 > (int)v3)
      {
        v14 = (void *)[v6 copy];
        v15 = +[EDReference referenceWithFirstRow:0xFFFFFFFFLL lastRow:0xFFFFFFFFLL firstColumn:(v3 + 1) lastColumn:v10];
        [v14 setRange:v15];

        [(EDSortedCollection *)self addObject:v14];
      }
    }
    id v16 = v6;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    id v18 = objc_loadWeakRetained((id *)&self->mWorksheet);
    id v16 = +[EDColumnInfo columnInfoWithResources:WeakRetained worksheet:v18];

    v19 = +[EDReference referenceWithFirstRow:0xFFFFFFFFLL lastRow:0xFFFFFFFFLL firstColumn:v3 lastColumn:v3];
    [v16 setRange:v19];

    [(EDSortedCollection *)self addObject:v16];
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mWorksheet);
  objc_destroyWeak((id *)&self->mResources);
}

@end