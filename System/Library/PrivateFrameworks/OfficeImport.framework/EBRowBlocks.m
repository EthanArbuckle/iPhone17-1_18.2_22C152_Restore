@interface EBRowBlocks
+ (void)readWithState:(id)a3;
@end

@implementation EBRowBlocks

+ (void)readWithState:(id)a3
{
  id v3 = a3;
  XlSheetInfo::XlSheetInfo((XlSheetInfo *)v24);
  uint64_t v4 = [v3 xlReader];
  (*(void (**)(uint64_t, unsigned char *))(*(void *)v4 + 528))(v4, v24);
  int v5 = v25;
  LOBYTE(v6) = v25 > 0;
  if (v25 >= 1) {
    +[TCProgressContext createStageWithSteps:(double)v25 takingSteps:1.0];
  }
  int v17 = v5;
  v7 = [v3 edSheet];
  v8 = [v7 rowBlocks];

  int v19 = 0;
  v9 = 0;
  int v10 = 0;
  while (XlBinaryReader::hasMoreRows((XlBinaryReader *)[v3 xlReader]))
  {
    XlRowBlock::XlRowBlock((XlRowBlock *)v20);
    uint64_t v11 = [v3 xlReader];
    (*(void (**)(uint64_t, unsigned char *))(*(void *)v11 + 408))(v11, v20);
    char v18 = v6;
    int v6 = v6 & (v19 < v17);
    if (v6 == 1) {
      +[TCProgressContext createStageWithSteps:(double)(unsigned __int16)((v22 - v21) >> 3) takingSteps:1.0];
    }
    while (((unint64_t)(v22 - v21) >> 3) > v23)
    {
      v12 = v9;
      uint64_t NextRow = XlRowBlock::getNextRow((XlRowBlock *)v20);
      v9 = [v8 rowBlockForRowNumber:(unsigned __int16)*(_OWORD *)(*(void *)(NextRow + 8) + 8) currentRowBlock:v9 createIfNil:1];

      +[EBRow readCellRow:NextRow edRowBlock:v9 edRowBlocks:v8 state:v3];
      if (v6) {
        +[TCProgressContext advanceProgress:1.0];
      }
      ++v10;
      HIDWORD(v14) = 85899344 - 1030792151 * v10;
      LODWORD(v14) = HIDWORD(v14);
      if ((v14 >> 1) <= 0x51EB850)
      {
        v15 = [v3 readerState];
        int v16 = [v15 isCancelled];

        if (v16) {
          +[TCMessageException raiseUntaggedMessage:@"TCUserCancelled", 0];
        }
      }
    }
    if (v6) {
      +[TCProgressContext endStage];
    }
    v19 += v18 & 1;
    XlRowBlock::~XlRowBlock((XlRowBlock *)v20);
  }
  [v8 unlock];
  if (v17 >= 1) {
    +[TCProgressContext endStage];
  }
}

@end