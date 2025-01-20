@interface TSTLayoutCellIterator
- (TSTLayoutCellIterator)initWithLayout:(id)a3;
- (TSTLayoutCellIterator)initWithLayout:(id)a3 range:(id)a4;
- (TSTLayoutCellIterator)initWithLayout:(id)a3 range:(id)a4 flags:(unint64_t)a5;
- (TSTLayoutCellIterator)initWithMasterLayout:(id)a3;
- (TSTLayoutCellIterator)initWithMasterLayout:(id)a3 range:(id)a4;
- (TSTLayoutCellIterator)initWithMasterLayout:(id)a3 range:(id)a4 flags:(unint64_t)a5;
- (TSTMasterLayout)masterLayout;
- (TSTTableModel)tableModel;
- (void)dealloc;
@end

@implementation TSTLayoutCellIterator

- (TSTLayoutCellIterator)initWithLayout:(id)a3
{
  uint64_t v4 = [a3 masterLayout];

  return [(TSTLayoutCellIterator *)self initWithMasterLayout:v4];
}

- (TSTLayoutCellIterator)initWithMasterLayout:(id)a3
{
  uint64_t Range = TSTMasterLayoutGetRange((uint64_t)a3);

  return [(TSTLayoutCellIterator *)self initWithMasterLayout:a3 range:Range];
}

- (TSTLayoutCellIterator)initWithLayout:(id)a3 range:(id)a4
{
  uint64_t v6 = [a3 masterLayout];

  return [(TSTLayoutCellIterator *)self initWithMasterLayout:v6 range:a4];
}

- (TSTLayoutCellIterator)initWithMasterLayout:(id)a3 range:(id)a4
{
  return [(TSTLayoutCellIterator *)self initWithMasterLayout:a3 range:a4 flags:0];
}

- (TSTLayoutCellIterator)initWithLayout:(id)a3 range:(id)a4 flags:(unint64_t)a5
{
  uint64_t v8 = [a3 masterLayout];

  return [(TSTLayoutCellIterator *)self initWithMasterLayout:v8 range:a4 flags:a5];
}

- (TSTLayoutCellIterator)initWithMasterLayout:(id)a3 range:(id)a4 flags:(unint64_t)a5
{
  unint64_t Range = TSTMasterLayoutGetRange((uint64_t)a3);
  unint64_t v10 = 0;
  uint64_t v11 = 16711680;
  uint64_t v12 = 0xFFFFLL;
  if ((_WORD)Range == 0xFFFF) {
    goto LABEL_23;
  }
  unint64_t v13 = 0;
  if ((Range & 0xFF0000) == 0xFF0000) {
    goto LABEL_24;
  }
  unint64_t v10 = 0;
  uint64_t v11 = 16711680;
  uint64_t v12 = 0xFFFFLL;
  if (!HIWORD(Range)) {
    goto LABEL_23;
  }
  unint64_t v13 = 0;
  if ((Range & 0xFFFF00000000) == 0) {
    goto LABEL_24;
  }
  unint64_t v10 = 0;
  uint64_t v11 = 16711680;
  uint64_t v12 = 0xFFFFLL;
  if (a4.var0.var0 == 0xFFFF) {
    goto LABEL_23;
  }
  unint64_t v13 = 0;
  if ((*(void *)&a4 & 0xFF0000) == 0xFF0000) {
    goto LABEL_24;
  }
  unint64_t v10 = 0;
  uint64_t v11 = 16711680;
  uint64_t v12 = 0xFFFFLL;
  if (!HIWORD(*(unint64_t *)&a4))
  {
LABEL_23:
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v13 = 0;
    if ((*(void *)&a4 & 0xFFFF00000000) != 0)
    {
      uint64_t v12 = 0;
      if (BYTE2(Range) <= a4.var0.var1) {
        unsigned int var1 = a4.var0.var1;
      }
      else {
        unsigned int var1 = BYTE2(Range);
      }
      if ((unsigned __int16)Range <= a4.var0.var0) {
        uint64_t var0 = a4.var0.var0;
      }
      else {
        uint64_t var0 = (unsigned __int16)Range;
      }
      if ((BYTE4(Range) + BYTE2(Range) - 1) >= (LOBYTE(a4.var1.var0)
                                                                                               + a4.var0.var1
                                                                                               - 1))
        unsigned int v16 = (LOBYTE(a4.var1.var0) + a4.var0.var1 - 1);
      else {
        unsigned int v16 = (BYTE4(Range) + BYTE2(Range) - 1);
      }
      unsigned int v17 = (unsigned __int16)(a4.var0.var0 + a4.var1.var1 - 1);
      if ((unsigned __int16)(Range + HIWORD(Range) - 1) < v17) {
        unsigned int v17 = (unsigned __int16)(Range + HIWORD(Range) - 1);
      }
      uint64_t v11 = 0;
      unint64_t v10 = 0;
      unint64_t v13 = 0;
      if (var0 <= v17 && var1 <= v16)
      {
        unint64_t v13 = ((unint64_t)(v17 - var0) << 48) + 0x1000000000000;
        unint64_t v10 = (unint64_t)(unsigned __int16)(v16 - var1 + 1) << 32;
        uint64_t v11 = var1 << 16;
        uint64_t v12 = var0;
      }
    }
  }
LABEL_24:
  unint64_t v18 = v11 | v13 | v12 | v10;
  v40 = self;
  self->mNumberOfLayoutColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)a3);
  unint64_t v19 = objc_msgSend((id)objc_msgSend(a3, "tableModel"), "range");
  LOBYTE(v20) = 0;
  LOBYTE(v21) = -1;
  unsigned __int16 v22 = -1;
  uint64_t v23 = 0xFFFFFFLL;
  if ((_WORD)v18 == 0xFFFF)
  {
    LOWORD(v24) = 0;
    unint64_t v25 = 0;
    unint64_t v26 = a5;
    goto LABEL_49;
  }
  LOWORD(v24) = 0;
  unint64_t v25 = 0;
  unint64_t v26 = a5;
  if ((v18 & 0xFF0000) != 0xFF0000)
  {
    LOBYTE(v20) = 0;
    LOBYTE(v21) = -1;
    uint64_t v23 = 0xFFFFFFLL;
    LOWORD(v24) = 0;
    unint64_t v25 = 0;
    if (HIWORD(v18))
    {
      if ((v18 & 0xFFFF00000000) != 0)
      {
        unint64_t v27 = 0;
        uint64_t v28 = 16711680;
        uint64_t v29 = 0xFFFFLL;
        unint64_t v24 = HIDWORD(v18);
        unint64_t v25 = HIWORD(v13);
        if ((_WORD)v19 != 0xFFFF)
        {
          unint64_t v30 = 0;
          if ((v19 & 0xFF0000) == 0xFF0000)
          {
LABEL_48:
            uint64_t v23 = v28 | v30 | v29 | v27;
            unint64_t v21 = v18 >> 16;
            unint64_t v20 = v18 >> 24;
            unsigned __int16 v22 = v18;
            goto LABEL_49;
          }
          unint64_t v27 = 0;
          uint64_t v28 = 16711680;
          uint64_t v29 = 0xFFFFLL;
          if (HIWORD(v19))
          {
            unint64_t v30 = 0;
            if ((v19 & 0xFFFF00000000) != 0)
            {
              uint64_t v29 = 0;
              if (BYTE2(v18) <= BYTE2(v19)) {
                unsigned int v31 = BYTE2(v19);
              }
              else {
                unsigned int v31 = BYTE2(v18);
              }
              if ((unsigned __int16)v18 <= (unsigned __int16)v19) {
                uint64_t v32 = (unsigned __int16)v19;
              }
              else {
                uint64_t v32 = (unsigned __int16)v18;
              }
              if ((BYTE4(v18) + BYTE2(v18) - 1) >= (BYTE4(v19) + BYTE2(v19) - 1)) {
                unsigned int v33 = (BYTE4(v19) + BYTE2(v19) - 1);
              }
              else {
                unsigned int v33 = (BYTE4(v18) + BYTE2(v18) - 1);
              }
              unsigned __int16 v34 = v19 + HIWORD(v19) - 1;
              unsigned int v35 = v34;
              if ((unsigned __int16)(v18 + HIWORD(v13) - 1) < v34) {
                unsigned int v35 = (unsigned __int16)(v18 + HIWORD(v13) - 1);
              }
              uint64_t v28 = 0;
              unint64_t v27 = 0;
              unint64_t v30 = 0;
              if (v32 <= v35 && v31 <= v33)
              {
                unint64_t v30 = ((unint64_t)(v35 - v32) << 48) + 0x1000000000000;
                unint64_t v27 = (unint64_t)(unsigned __int16)(v33 - v31 + 1) << 32;
                uint64_t v28 = v31 << 16;
                uint64_t v29 = v32;
              }
            }
            goto LABEL_48;
          }
        }
        unint64_t v30 = 0;
        goto LABEL_48;
      }
    }
  }
LABEL_49:
  uint64_t v36 = -[TSTCellIterator initWithTableModel:region:flags:](v40, "initWithTableModel:region:flags:", objc_msgSend(a3, "tableModel", v25), +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", v23), v26 | 0x48);
  if (v36)
  {
    *(void *)(v36 + 112) = a3;
    *(_WORD *)(v36 + 120) = v22;
    *(unsigned char *)(v36 + 122) = v21;
    *(unsigned char *)(v36 + 123) = v20;
    *(_WORD *)(v36 + 124) = v24;
    *(_WORD *)(v36 + 126) = v39;
    unsigned __int8 v37 = v21 + v24 - 1;
    if ((v26 & 4) == 0) {
      unsigned __int8 v37 = v21;
    }
    *(_DWORD *)(v36 + 128) = v22 | (v37 << 16);
    *(_DWORD *)(v36 + 148) = 0xFFFFFF;
    *(void *)(v36 + 136) = objc_alloc_init(TSTCell);
    *(_WORD *)(v36 + 190) = objc_msgSend((id)objc_msgSend(a3, "tableModel"), "numberOfRows");
    *(_WORD *)(v36 + 188) = objc_msgSend((id)objc_msgSend(a3, "tableModel"), "numberOfColumns");
  }
  return (TSTLayoutCellIterator *)v36;
}

- (void)dealloc
{
  self->mLayoutCell = 0;
  self->mMasterLayout = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTLayoutCellIterator;
  [(TSTCellIterator *)&v3 dealloc];
}

- (TSTTableModel)tableModel
{
  return self->super.mTableModel;
}

- (TSTMasterLayout)masterLayout
{
  return self->mMasterLayout;
}

@end