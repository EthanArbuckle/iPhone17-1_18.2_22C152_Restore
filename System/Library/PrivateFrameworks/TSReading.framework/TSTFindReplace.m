@interface TSTFindReplace
+ (void)searchInfo:(id)a3 forAnnotationsWithHitBlock:(id)a4;
+ (void)searchInfo:(id)a3 forString:(id)a4 options:(unint64_t)a5 hitBlock:(id)a6;
+ (void)searchLayout:(id)a3 forAnnotationsWithHitBlock:(id)a4;
+ (void)searchLayout:(id)a3 forString:(id)a4 options:(unint64_t)a5 hitBlock:(id)a6;
@end

@implementation TSTFindReplace

+ (void)searchInfo:(id)a3 forString:(id)a4 options:(unint64_t)a5 hitBlock:(id)a6
{
  v11 = -[TSTCellIterator initWithTableModel:]([TSTCellIterator alloc], "initWithTableModel:", [a3 tableModel]);
  if ([(TSTCellIterator *)v11 getNext:v19])
  {
    do
    {
      if (!v21
        || v21->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType != 267
        && *((unsigned __int8 *)&v21->mPrivate + 1) << 8 != 2304)
      {
        v12 = NSStringFromNativeTSTCell((__CFString *)v21);
        if (v12)
        {
          v13 = v12;
          uint64_t v17 = 0;
          uint64_t v18 = 0;
          uint64_t v17 = [(__CFString *)v12 tsu_range];
          uint64_t v18 = v14;
          while (v18)
          {
            uint64_t v15 = [(__CFString *)v13 rangeOfString:a4 searchOptions:a5 updatingSearchRange:&v17];
            if (v15 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v6 = v6 & 0xFFFFFFFF00000000 | v20;
              (*((void (**)(id, TSTSearchReference *))a6 + 2))(a6, +[TSTSearchReference searchReferenceWithTableInfo:cellID:range:](TSTSearchReference, "searchReferenceWithTableInfo:cellID:range:", a3, v6, v15, v16));
            }
          }
        }
      }
    }
    while ([(TSTCellIterator *)v11 getNext:v19]);
  }
}

+ (void)searchLayout:(id)a3 forString:(id)a4 options:(unint64_t)a5 hitBlock:(id)a6
{
  uint64_t v19 = [a3 tableInfo];
  v11 = [[TSTLayoutCellIterator alloc] initWithLayout:a3 range:TSTLayoutGetPartitionRange(a3) flags:337];
  while ([(TSTCellIterator *)v11 getNext:v22])
  {
    if (v24) {
      p_mCurrentCellFormat = &v24->mPrivate.mCellFormats.mCurrentCellFormat;
    }
    else {
      p_mCurrentCellFormat = ($F03D4CA5AAEDD23196D77D4402B24C2D *)&TSUInvalidFormat;
    }
    if (p_mCurrentCellFormat->mFormatType != 267)
    {
      v13 = NSStringFromNativeTSTCell((__CFString *)v24);
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v20 = 0;
        uint64_t v21 = 0;
        uint64_t v20 = [(__CFString *)v13 tsu_range];
        uint64_t v21 = v15;
        while (v21)
        {
          uint64_t v16 = [(__CFString *)v14 rangeOfString:a4 searchOptions:a5 updatingSearchRange:&v20];
          if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v6 = v6 & 0xFFFFFFFF00000000 | v23;
            uint64_t v18 = +[TSTSearchReference searchReferenceWithTableInfo:cellID:range:](TSTSearchReference, "searchReferenceWithTableInfo:cellID:range:", v19, v6, v16, v17);
            [a3 calculatePointFromSearchReference:v18];
            -[TSTSearchReference setSearchReferencePoint:](v18, "setSearchReferencePoint:");
            (*((void (**)(id, TSTSearchReference *))a6 + 2))(a6, v18);
          }
        }
      }
    }
  }
}

+ (void)searchInfo:(id)a3 forAnnotationsWithHitBlock:(id)a4
{
}

+ (void)searchLayout:(id)a3 forAnnotationsWithHitBlock:(id)a4
{
  uint64_t v7 = [a3 tableInfo];

  objc_msgSend(a1, "p_searchInfo:layout:forAnnotationsWithHitBlock:", v7, a3, a4);
}

@end