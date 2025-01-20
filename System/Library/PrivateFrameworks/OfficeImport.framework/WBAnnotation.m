@interface WBAnnotation
+ (id)readRangedFrom:(id)a3 index:(unsigned int)a4 type:(int)a5 paragraph:(id)a6;
+ (unint64_t)findStartFrom:(id)a3 annotation:(const WrdAnnotation *)a4;
+ (void)readFrom:(id)a3 at:(int)a4 paragraph:(id)a5;
@end

@implementation WBAnnotation

+ (void)readFrom:(id)a3 at:(int)a4 paragraph:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v22 = 0;
  uint64_t AnnotationAtMainTextCP = WrdAnnotationTable::getAnnotationAtMainTextCP((WrdAnnotationTable *)[v8 annotationTable], a4, &v22);
  uint64_t v11 = *(void *)(AnnotationAtMainTextCP + 24);
  if (*(_DWORD *)(v11 + 32) == -1)
  {
    v12 = [v9 addAnnotation:2];
    int v13 = [a1 findStartFrom:v8 annotation:AnnotationAtMainTextCP];
    WrdTextRun::WrdTextRun((uint64_t)v20, 4, *(_DWORD *)(AnnotationAtMainTextCP + 12) + v13);
    int v21 = *(_DWORD *)(AnnotationAtMainTextCP + 16) - v13;
    v14 = [v12 text];
    +[WBText readFrom:v8 text:v14 textRun:v20];

    WrdCharacterTextRun::WrdCharacterTextRun(&v19);
    v19.var1 = 0;
    v19.var2 = *(_DWORD *)(AnnotationAtMainTextCP + 8);
    uint64_t v15 = [v8 wrdReader];
    (*(void (**)(uint64_t, WrdCharacterTextRun *))(*(void *)v15 + 192))(v15, &v19);
    v19.var3 = 1;
    v16 = [v12 reference];
    +[WBCharacterRun readFrom:v8 wrdTextRun:&v19 run:v16 paragraph:v9];

    v17 = objc_msgSend(MEMORY[0x263EFF910], "tc_dateWithWordDate:", *(void *)(AnnotationAtMainTextCP + 32));
    [v12 setDate:v17];

    v18 = [v8 annotationOwner:*(unsigned __int16 *)(v11 + 36)];
    [v12 setOwner:v18];

    WrdCharacterTextRun::~WrdCharacterTextRun(&v19);
  }
}

+ (unint64_t)findStartFrom:(id)a3 annotation:(const WrdAnnotation *)a4
{
  v4 = [a3 readCharactersFrom:a4->var2 to:(a4->var3 + a4->var2) textType:4];
  uint64_t v5 = [v4 rangeOfString:@"\x05"];
  if (v6 == 1) {
    unint64_t v7 = v5 + 1;
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (id)readRangedFrom:(id)a3 index:(unsigned int)a4 type:(int)a5 paragraph:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  uint64_t v11 = [a6 addAnnotation:v7];
  if (v7 == 1)
  {
    [v10 setAnnotationRangeStart:0];
LABEL_11:
    id v23 = v11;
    goto LABEL_12;
  }
  if (v7) {
    goto LABEL_11;
  }
  v12 = (WrdBookmarkTable *)[v10 annotationBookmarkTable];
  if (a4 >= (unsigned __int16)((*((_DWORD *)v12 + 6) - *((_DWORD *)v12 + 4)) >> 3)) {
    goto LABEL_11;
  }
  uint64_t Bookmark = WrdBookmarkTable::getBookmark(v12, a4);
  if (*(unsigned __int16 *)(Bookmark + 40) >= 6u)
  {
    v14 = (WrdAnnotationTable *)[v10 annotationTable];
    unsigned int v26 = 0;
    int SInt32 = CsLeReadSInt32((unsigned int *)(*(void *)(Bookmark + 32) + 2));
    AnnotationForuint64_t Bookmark = WrdAnnotationTable::getAnnotationForBookmark(v14, SInt32, &v26);
    uint64_t v17 = AnnotationForBookmark;
    if (AnnotationForBookmark)
    {
      if ((*(_DWORD *)(AnnotationForBookmark + 16) & 0x80000000) == 0)
      {
        int v18 = [a1 findStartFrom:v10 annotation:AnnotationForBookmark];
        WrdTextRun::WrdTextRun((uint64_t)v25, 4, *(_DWORD *)(v17 + 12) + v18);
        v25[4] = *(_DWORD *)(v17 + 16) - v18;
        WrdCharacterTextRun v19 = [v11 text];
        +[WBText readFrom:v10 text:v19 textRun:v25];

        v20 = *(WrdDateTime **)(v17 + 32);
        if (!WrdDateTime::isDefault(v20))
        {
          int v21 = objc_msgSend(MEMORY[0x263EFF910], "tc_dateWithWordDate:", v20);
          [v11 setDate:v21];
        }
        unsigned int v22 = [v10 annotationOwner:*(unsigned __int16 *)(*(void *)(v17 + 24) + 36)];
        [v11 setOwner:v22];

        [v10 setAnnotationRangeStart:v11];
        goto LABEL_11;
      }
    }
  }
  id v23 = 0;
LABEL_12:

  return v23;
}

@end