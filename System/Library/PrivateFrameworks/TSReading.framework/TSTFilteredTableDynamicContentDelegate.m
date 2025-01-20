@interface TSTFilteredTableDynamicContentDelegate
- (BOOL)cell:(id *)a3 forCellID:(id)a4;
- (BOOL)dynamicContentMustDrawOnMainThread;
- (TSTFilteredTableDynamicContentDelegate)initWithTableModel:(id)a3;
- (void)dealloc;
@end

@implementation TSTFilteredTableDynamicContentDelegate

- (TSTFilteredTableDynamicContentDelegate)initWithTableModel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSTFilteredTableDynamicContentDelegate;
  v4 = [(TSTFilteredTableDynamicContentDelegate *)&v6 init];
  if (v4) {
    v4->mTableModel = (TSTTableModel *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTFilteredTableDynamicContentDelegate;
  [(TSTFilteredTableDynamicContentDelegate *)&v3 dealloc];
}

- (BOOL)cell:(id *)a3 forCellID:(id)a4
{
  objc_super v6 = objc_alloc_init(TSTCell);
  *a3 = v6;
  v7 = (NSString *)[(id)TSTBundle() localizedStringForKey:@"No rows match the filter conditions." value:&stru_26D688A48 table:@"TSTables"];
  if (!v6 || (int mPrivate = (int)v6->mPrivate, (mPrivate & 0xFF00) == 0))
  {
    TSTCellClearValue((uint64_t)v6);
    *((unsigned char *)&v6->mPrivate + 1) = 3;
    int mPrivate = (int)v6->mPrivate;
  }
  if ((mPrivate & 0xFF00) == 0x300)
  {
    mString = v6->mPrivate.mValue.mString.mString;
    if (mString != v7)
    {

      v6->mPrivate.mValue.mString.mString = v7;
      int v10 = HIWORD(*(_DWORD *)&v6->mPrivate);
      uint64_t v11 = -[NSString rangeOfCharacterFromSet:](v7, "rangeOfCharacterFromSet:", [MEMORY[0x263F08708] newlineCharacterSet]);
      __int16 v12 = v10 | 1;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        __int16 v12 = v10 & 0xFFFE;
      }
      *((_WORD *)&v6->mPrivate + 1) = v12;
      v6->mPrivate.mValue.mString.mID = 0;
    }
  }
  else
  {
    v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void TSTCellSetStringValueClearingID(TSTCell *, NSString *, BOOL)");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 1003, @"can't set string on non-string cell: %p", v6);
  }
  v15 = *a3;
  v16 = [(TSTTableModel *)self->mTableModel headerRowCellStyle];
  v17 = (TSTCellStyle *)v15[5];
  if (v17 != v16)
  {
    v18 = v16;

    v15[5] = v18;
    *((_DWORD *)v15 + 8) = 0;
  }
  v19 = *a3;
  v20 = [(TSTTableModel *)self->mTableModel headerRowTextStyle];
  v21 = (TSWPParagraphStyle *)v19[7];
  if (v21 != v20)
  {
    v22 = v20;

    v19[7] = v22;
    *((_DWORD *)v19 + 12) = 0;
  }
  return 1;
}

- (BOOL)dynamicContentMustDrawOnMainThread
{
  return 0;
}

@end