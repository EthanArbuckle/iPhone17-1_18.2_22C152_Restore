@interface EBRow
+ (void)readCellRow:(void *)a3 edRowBlock:(id)a4 edRowBlocks:(id)a5 state:(id)a6;
@end

@implementation EBRow

+ (void)readCellRow:(void *)a3 edRowBlock:(id)a4 edRowBlocks:(id)a5 state:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (a3)
  {
    if (v9)
    {
      uint64_t v12 = *((void *)a3 + 1);
      v15[1] = &unk_26EBDB228;
      uint64_t v13 = *(void *)(v12 + 21);
      *(_OWORD *)v16 = *(_OWORD *)(v12 + 8);
      *(void *)&v16[13] = v13;
      uint64_t v14 = [v9 rowInfoWithRowNumber:*(unsigned __int16 *)v16];
      v15[0] = v14;
      if (v14
        || (uint64_t v14 = [v9 addRowInfoWithRowNumber:*(unsigned __int16 *)v16 cellCountHint:(unsigned __int16)((*((_DWORD *)a3 + 6) - *((_DWORD *)a3 + 4)) >> 3)], (v15[0] = v14) != 0))
      {
        *(_WORD *)(v14 + 20) = *(_WORD *)&v16[2];
        *(unsigned char *)(v14 + 23) = *(unsigned char *)(v14 + 23) & 0xFC | v16[15] | (2 * v16[14]);
        *(unsigned char *)(v14 + 22) = v16[10];
        if (v16[16]) {
          setStyleIndexForEDRowInfo((_DWORD *)v14, *(__int16 *)&v16[4]);
        }
        while (*((_DWORD *)a3 + 10) < ((*((void *)a3 + 3) - *((void *)a3 + 2)) >> 3))
          +[EBCell readXlCell:XlCellRow::getNextCell((XlCellRow *)a3) edRowInfo:v15 edRowBlock:v9 edRowBlocks:v10 state:v11];
      }
    }
  }
}

@end