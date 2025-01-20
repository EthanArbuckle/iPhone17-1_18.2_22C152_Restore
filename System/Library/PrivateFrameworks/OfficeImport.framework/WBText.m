@interface WBText
+ (void)readBlocksFrom:(id)a3 textRun:(WrdTextRun *)a4 to:(id)a5;
+ (void)readFrom:(id)a3 text:(id)a4 textRun:(WrdTextRun *)a5;
@end

@implementation WBText

+ (void)readFrom:(id)a3 text:(id)a4 textRun:(WrdTextRun *)a5
{
  id v9 = a3;
  id v8 = a4;
  [a1 readBlocksFrom:v9 textRun:a5 to:v8];
}

+ (void)readBlocksFrom:(id)a3 textRun:(WrdTextRun *)a4 to:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unsigned int var2 = a4->var2;
  unsigned int var3 = a4->var3;
  v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  int v11 = [v8 tableNestingLevel];
  WrdParagraphTextRun::WrdParagraphTextRun(&v30);
  int v12 = [v8 textType];
  unsigned int v13 = var3 + var2;
  unsigned int v14 = a4->var2;
  v30.var1 = v12;
  v30.unsigned int var2 = v14;
  if (v14 < var3 + var2)
  {
    v15 = 0;
    int v16 = 0;
    int v28 = v11;
    while (1)
    {
      uint64_t v17 = [v7 wrdReader];
      (*(void (**)(uint64_t, WrdParagraphTextRun *))(*(void *)v17 + 184))(v17, &v30);
      if (!v30.var3) {
        goto LABEL_33;
      }
      if (v30.var2 + v30.var3 > v13) {
        v30.unsigned int var3 = v13 - v30.var2;
      }
      uint64_t v18 = [v7 reportProgress];
      [v7 setReportProgress:0];
      if (v18) {
        +[TCProgressContext setProgress:(double)(v30.var3 + v30.var2)];
      }
      var4 = v30.var4;
      uint64_t v20 = *((void *)v30.var4 + 2);
      if ((v20 & 2) != 0
        && (*((unsigned char *)v30.var4 + 294) & 1) != 0
        && v12 != 4
        && ((v20 & 0x1000000000000) != 0 ? (int v24 = *((_DWORD *)v30.var4 + 61)) : (int v24 = 1), v24 >= v11))
      {
        v25 = [MEMORY[0x263F08D40] valueWithPointer:WrdParagraphTextRun::clone(&v30)];
        [(NSMutableArray *)v29 addObject:v25];

        if (v28 == 1)
        {
          if ((*((void *)var4 + 2) & 4) != 0 && (*((unsigned char *)var4 + 294) & 2) != 0) {
            goto LABEL_28;
          }
        }
        else if (*((_DWORD *)var4 + 61) == v28 {
               && (*((void *)var4 + 2) & 0x4000000000000) != 0
        }
               && (*((unsigned char *)var4 + 296) & 0x20) != 0)
        {
LABEL_28:
          int v11 = v28;
          if (!v15
            || !+[WBTable tryToReadRowFrom:v7 textRuns:v29 to:v15])
          {
            uint64_t v26 = [v8 addTable];

            v15 = (void *)v26;
            +[WBTable readFrom:v7 textRuns:v29 table:v26];
          }
          purgeTextRuns(v29);
          goto LABEL_12;
        }
        int v11 = v28;
      }
      else
      {

        v15 = [v8 addParagraph];
        +[WBParagraph readFrom:v7 textRun:&v30 paragraph:v15];
        ++v16;
        HIDWORD(v21) = -858993459 * v16 + 429496728;
        LODWORD(v21) = HIDWORD(v21);
        if ((v21 >> 2) <= 0xCCCCCCC)
        {
          v22 = [v7 cancelDelegate];
          char v23 = [v22 isCancelled];

          if (v23)
          {
            int v27 = 1;
            goto LABEL_34;
          }
        }

        v15 = 0;
      }
LABEL_12:
      [v7 setReportProgress:v18];
      v30.var2 += v30.var3;
      if (v30.var2 >= v13) {
        goto LABEL_33;
      }
    }
  }
  v15 = 0;
LABEL_33:
  int v27 = 0;
LABEL_34:

  WrdParagraphTextRun::~WrdParagraphTextRun(&v30);
  purgeTextRuns(v29);
  if (v27) {
    +[TCMessageException raiseUntaggedMessage:@"TCUserCancelled", 0];
  }
}

@end