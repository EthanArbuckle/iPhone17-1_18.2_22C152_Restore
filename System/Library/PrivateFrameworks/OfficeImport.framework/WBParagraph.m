@interface WBParagraph
+ (BOOL)isCPAnnotationRangeEnd:(int)a3 bookmarkTable:(void *)a4;
+ (int)blockType;
+ (void)check:(id)a3 forFieldMarkerFrom:(id)a4 runEnd:(int *)a5 readState:(void *)a6;
+ (void)checkForAnnotationBookmarkFrom:(id)a3 runEnd:(int *)a4 readState:(void *)a5;
+ (void)checkForAnnotationFrom:(id)a3 runEnd:(int *)a4 readState:(void *)a5;
+ (void)checkForBookmarkFrom:(id)a3 runEnd:(int *)a4 readState:(void *)a5;
+ (void)checkForNoteFrom:(id)a3 footnote:(BOOL)a4 runEnd:(int *)a5 readState:(void *)a6;
+ (void)readAnnotationBookmarkFor:(id)a3 from:(id)a4 readState:(void *)a5;
+ (void)readAnnotationFor:(id)a3 from:(id)a4 readState:(void *)a5;
+ (void)readBookmarkFor:(id)a3 from:(id)a4 readState:(void *)a5;
+ (void)readCharacterRunsFor:(id)a3 from:(id)a4 readState:(void *)a5;
+ (void)readFieldMarkerFor:(id)a3 from:(id)a4 readState:(void *)a5;
+ (void)readFrom:(id)a3 textRun:(WrdParagraphTextRun *)a4 paragraph:(id)a5;
+ (void)readNoteFor:(id)a3 from:(id)a4 readState:(void *)a5;
+ (void)readOfficeArtFor:(id)a3 from:(id)a4 at:(int)a5 textRun:(WrdCharacterTextRun *)a6;
+ (void)readPictureFor:(id)a3 from:(id)a4 at:(int)a5 textRun:(WrdCharacterTextRun *)a6;
+ (void)readRunsFor:(id)a3 from:(id)a4 textRun:(WrdParagraphTextRun *)a5;
+ (void)readSpecialCharacterFor:(id)a3 from:(id)a4 at:(int)a5 textRun:(WrdCharacterTextRun *)a6;
+ (void)readSpecialCharactersFor:(id)a3 from:(id)a4 textRun:(WrdCharacterTextRun *)a5;
+ (void)readSymbolsFor:(id)a3 from:(id)a4 textRun:(WrdCharacterTextRun *)a5;
@end

@implementation WBParagraph

+ (void)readFrom:(id)a3 textRun:(WrdParagraphTextRun *)a4 paragraph:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  var4 = a4->var4;
  var5 = a4->var5;
  v11 = [v8 document];
  v12 = [v8 properties];
  +[WBParagraphProperties readFrom:v13 wrdProperties:var4 tracked:var5 document:v11 properties:v12];

  [a1 readRunsFor:v8 from:v13 textRun:a4];
}

+ (void)readRunsFor:(id)a3 from:(id)a4 textRun:(WrdParagraphTextRun *)a5
{
  id v8 = a3;
  id v9 = a4;
  v21 = 0;
  v22 = 0;
  uint64_t v23 = 0;
  v26 = 0;
  uint64_t v27 = 0;
  __p = 0;
  signed int var2 = a5->var2;
  unsigned int var3 = a5->var3;
  int v17 = 0;
  signed int v18 = var2;
  signed int v12 = var3 + var2;
  signed int v19 = v12;
  int v20 = -1;
  int v24 = -1;
  while (var2 < v12)
  {
    switch(v17)
    {
      case 0:
        [a1 readCharacterRunsFor:v8 from:v9 readState:&v17];
        break;
      case 1:
      case 2:
        [a1 readNoteFor:v8 from:v9 readState:&v17];
        break;
      case 3:
        [a1 readFieldMarkerFor:v8 from:v9 readState:&v17];
        break;
      case 4:
        [a1 readBookmarkFor:v8 from:v9 readState:&v17];
        break;
      case 5:
        [a1 readAnnotationFor:v8 from:v9 readState:&v17];
        break;
      case 6:
        [a1 readAnnotationBookmarkFor:v8 from:v9 readState:&v17];
        break;
      default:
        break;
    }
    signed int var2 = v18;
    signed int v12 = v19;
  }
  uint64_t v13 = [v8 runCount];
  if (v13)
  {
    v14 = [v8 runAt:v13 - 1];
    if (![v14 runType])
    {
      v15 = [v8 properties];
      v16 = [v14 properties];
      [v15 setCharacterProperties:v16];
    }
  }
  [v8 removeLastCharacter:13];
  if (__p)
  {
    v26 = __p;
    operator delete(__p);
  }
  if (v21)
  {
    v22 = v21;
    operator delete(v21);
  }
}

+ (void)readCharacterRunsFor:(id)a3 from:(id)a4 readState:(void *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v19 = *((_DWORD *)a5 + 2);
  if (![v8 textType])
  {
    [a1 checkForBookmarkFrom:v9 runEnd:&v19 readState:a5];
    [a1 checkForAnnotationBookmarkFrom:v9 runEnd:&v19 readState:a5];
    [a1 checkForAnnotationFrom:v9 runEnd:&v19 readState:a5];
    [a1 checkForNoteFrom:v9 footnote:1 runEnd:&v19 readState:a5];
    [a1 checkForNoteFrom:v9 footnote:0 runEnd:&v19 readState:a5];
  }
  [a1 check:v8 forFieldMarkerFrom:v9 runEnd:&v19 readState:a5];
  WrdCharacterTextRun::WrdCharacterTextRun(&v18);
  int v10 = [v8 textType];
  unsigned int v11 = *((_DWORD *)a5 + 1);
  v18.var1 = v10;
  v18.signed int var2 = v11;
  for (int i = v19; (int)v18.var2 < v19; int i = v19)
  {
    uint64_t v13 = [v9 wrdReader];
    (*(void (**)(uint64_t, WrdCharacterTextRun *))(*(void *)v13 + 192))(v13, &v18);
    int i = v19;
    if (!v18.var3) {
      break;
    }
    if ((signed int)(v18.var2 + v18.var3) > v19) {
      v18.unsigned int var3 = v19 - v18.var2;
    }
    if (WrdCharacterTextRun::isSpecialCharacter(&v18))
    {
      [a1 readSpecialCharactersFor:v8 from:v9 textRun:&v18];
    }
    else if ((*((_DWORD *)&v18.var4->var2 + 2) & 0x20) != 0)
    {
      [a1 readSymbolsFor:v8 from:v9 textRun:&v18];
    }
    else
    {
      v14 = [v8 addCharacterRun];
      +[WBCharacterRun readFrom:v9 wrdTextRun:&v18 run:v14 paragraph:v8];
      v15 = [v9 annotationRangeStart];
      v16 = v15;
      if (v15 && ([v15 referencePropertiesFixed] & 1) == 0)
      {
        int v17 = [v16 reference];
        [v17 copyPropertiesFrom:v14];

        [v16 setReferencePropertiesFixed];
      }
    }
    v18.var2 += v18.var3;
  }
  *((_DWORD *)a5 + 1) = i;
  WrdCharacterTextRun::~WrdCharacterTextRun(&v18);
}

+ (void)checkForNoteFrom:(id)a3 footnote:(BOOL)a4 runEnd:(int *)a5 readState:(void *)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v13 = v9;
  if (v8) {
    int v10 = (WrdNoteTable *)[v9 footnoteTable];
  }
  else {
    int v10 = (WrdNoteTable *)[v9 endnoteTable];
  }
  int CPOfNextNote = WrdNoteTable::getCPOfNextNote(v10, *((_DWORD *)a6 + 1) - 1);
  if (CPOfNextNote >= *((_DWORD *)a6 + 1) && CPOfNextNote < *a5)
  {
    *a5 = CPOfNextNote;
    if (v8) {
      int v12 = 1;
    }
    else {
      int v12 = 2;
    }
    *(_DWORD *)a6 = v12;
  }
}

+ (void)checkForAnnotationFrom:(id)a3 runEnd:(int *)a4 readState:(void *)a5
{
  id v14 = a3;
  BOOL v8 = (WrdAnnotationTable *)[v14 annotationTable];
  uint64_t CPOfNextAnnotation = WrdAnnotationTable::getCPOfNextAnnotation(v8, *((_DWORD *)a5 + 1) - 1);
  uint64_t v10 = [v14 annotationBookmarkTable];
  if ((int)CPOfNextAnnotation >= *((_DWORD *)a5 + 1))
  {
    uint64_t v11 = v10;
    char v12 = 0;
    do
    {
      if (int)CPOfNextAnnotation >= *a4 || (v12) {
        break;
      }
      int v13 = [a1 isCPAnnotationRangeEnd:CPOfNextAnnotation bookmarkTable:v11];
      if (v13) {
        uint64_t CPOfNextAnnotation = WrdAnnotationTable::getCPOfNextAnnotation(v8, CPOfNextAnnotation);
      }
      char v12 = v13 ^ 1;
    }
    while ((int)CPOfNextAnnotation >= *((_DWORD *)a5 + 1));
    if (v12)
    {
      *a4 = CPOfNextAnnotation;
      *(_DWORD *)a5 = 5;
    }
  }
}

+ (void)checkForAnnotationBookmarkFrom:(id)a3 runEnd:(int *)a4 readState:(void *)a5
{
  id v36 = a3;
  uint64_t v7 = [v36 annotationBookmarkTable];
  BOOL v8 = (WrdBookmarkTable *)v7;
  id v9 = (void **)((char *)a5 + 64);
  *((void *)a5 + 9) = *((void *)a5 + 8);
  int v10 = *((_DWORD *)a5 + 14);
  if (*((_DWORD *)a5 + 1) <= v10 + 1) {
    int v11 = v10 + 1;
  }
  else {
    int v11 = *((_DWORD *)a5 + 1);
  }
  unsigned int v12 = *(_DWORD *)(v7 + 24) - *(_DWORD *)(v7 + 16);
  int v13 = (unsigned __int16)(v12 >> 3);
  if (!(unsigned __int16)(v12 >> 3)) {
    goto LABEL_56;
  }
  unsigned int v14 = 0;
  int v15 = *a4;
  v16 = (char *)a5 + 80;
  do
  {
    uint64_t Bookmark = WrdBookmarkTable::getBookmark(v8, v14);
    int v19 = *(_DWORD *)(Bookmark + 44);
    int v18 = *(_DWORD *)(Bookmark + 48);
    BOOL v20 = v19 >= v11 && v19 <= v15;
    if (v20 && v19 < *a4)
    {
      if (v19 >= v15)
      {
        v21 = (unsigned int *)*((void *)a5 + 9);
      }
      else
      {
        v21 = (unsigned int *)*((void *)a5 + 8);
        *((void *)a5 + 9) = v21;
        int v15 = v19;
      }
      if ((unint64_t)v21 >= *v16)
      {
        uint64_t v23 = (unsigned int *)*v9;
        uint64_t v30 = ((char *)v21 - (unsigned char *)*v9) >> 2;
        unint64_t v31 = v30 + 1;
        if ((unint64_t)(v30 + 1) >> 62) {
          std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v32 = *v16 - (void)v23;
        if (v32 >> 1 > v31) {
          unint64_t v31 = v32 >> 1;
        }
        if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v27 = v31;
        }
        if (v27)
        {
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<float>>((uint64_t)a5 + 80, v27);
          uint64_t v23 = (unsigned int *)*((void *)a5 + 8);
          v21 = (unsigned int *)*((void *)a5 + 9);
        }
        else
        {
          v28 = 0;
        }
        v33 = (unsigned int *)&v28[4 * v30];
        unsigned int *v33 = v14;
        v29 = v33 + 1;
        while (v21 != v23)
        {
          unsigned int v35 = *--v21;
          *--v33 = v35;
        }
        goto LABEL_50;
      }
      goto LABEL_33;
    }
    if (v18 >= v11 && v18 <= v15)
    {
      if (v18 >= v15)
      {
        v21 = (unsigned int *)*((void *)a5 + 9);
      }
      else
      {
        v21 = (unsigned int *)*((void *)a5 + 8);
        *((void *)a5 + 9) = v21;
        int v15 = v18;
      }
      if ((unint64_t)v21 >= *v16)
      {
        uint64_t v23 = (unsigned int *)*v9;
        uint64_t v24 = ((char *)v21 - (unsigned char *)*v9) >> 2;
        unint64_t v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 62) {
          std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v26 = *v16 - (void)v23;
        if (v26 >> 1 > v25) {
          unint64_t v25 = v26 >> 1;
        }
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v27 = v25;
        }
        if (v27)
        {
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<float>>((uint64_t)a5 + 80, v27);
          uint64_t v23 = (unsigned int *)*((void *)a5 + 8);
          v21 = (unsigned int *)*((void *)a5 + 9);
        }
        else
        {
          v28 = 0;
        }
        v33 = (unsigned int *)&v28[4 * v24];
        unsigned int *v33 = v14;
        v29 = v33 + 1;
        while (v21 != v23)
        {
          unsigned int v34 = *--v21;
          *--v33 = v34;
        }
LABEL_50:
        *((void *)a5 + 8) = v33;
        *((void *)a5 + 9) = v29;
        *((void *)a5 + 10) = &v28[4 * v27];
        if (v23) {
          operator delete(v23);
        }
LABEL_52:
        *((void *)a5 + 9) = v29;
        goto LABEL_53;
      }
LABEL_33:
      unsigned int *v21 = v14;
      v29 = v21 + 1;
      goto LABEL_52;
    }
LABEL_53:
    ++v14;
  }
  while (v14 != v13);
  if (*((void *)a5 + 8) != *((void *)a5 + 9))
  {
    *a4 = v15;
    *((_DWORD *)a5 + 15) = v15;
    *(_DWORD *)a5 = 6;
  }
LABEL_56:
}

+ (void)check:(id)a3 forFieldMarkerFrom:(id)a4 runEnd:(int *)a5 readState:(void *)a6
{
  id v16 = a3;
  id v9 = a4;
  uint64_t v10 = objc_msgSend(v9, "fieldPositionTableForTextType:", objc_msgSend(v16, "textType"));
  uint64_t v12 = *(void *)(v10 + 16);
  uint64_t v11 = *(void *)(v10 + 24);
  signed int v13 = WrdFieldPositionTable::lowerBoundOfCP((WrdFieldPositionTable *)v10, *((_DWORD *)a6 + 1));
  if (v13 < (unsigned __int16)((v11 - v12) >> 3))
  {
    uint64_t Bookmark = WrdBookmarkTable::getBookmark((WrdBookmarkTable *)v10, v13);
    int v15 = *(_DWORD *)(Bookmark + 8);
    if (v15 < *a5)
    {
      *a5 = v15;
      *(_DWORD *)a6 = 3;
      *((void *)a6 + 2) = Bookmark;
    }
  }
}

+ (void)checkForBookmarkFrom:(id)a3 runEnd:(int *)a4 readState:(void *)a5
{
  id v36 = a3;
  uint64_t v7 = [v36 bookmarkTable];
  BOOL v8 = (WrdBookmarkTable *)v7;
  id v9 = (void **)((char *)a5 + 32);
  *((void *)a5 + 5) = *((void *)a5 + 4);
  int v10 = *((_DWORD *)a5 + 6);
  if (*((_DWORD *)a5 + 1) <= v10 + 1) {
    int v11 = v10 + 1;
  }
  else {
    int v11 = *((_DWORD *)a5 + 1);
  }
  unsigned int v12 = *(_DWORD *)(v7 + 24) - *(_DWORD *)(v7 + 16);
  int v13 = (unsigned __int16)(v12 >> 3);
  if (!(unsigned __int16)(v12 >> 3)) {
    goto LABEL_57;
  }
  unsigned int v14 = 0;
  int v15 = *a4;
  id v16 = (char *)a5 + 48;
  do
  {
    uint64_t Bookmark = (_DWORD *)WrdBookmarkTable::getBookmark(v8, v14);
    if (Bookmark[13]) {
      goto LABEL_54;
    }
    int v19 = Bookmark[11];
    int v18 = Bookmark[12];
    BOOL v20 = v19 >= v11 && v19 <= v15;
    if (v20 && v19 < *a4)
    {
      if (v19 >= v15)
      {
        v21 = (unsigned int *)*((void *)a5 + 5);
      }
      else
      {
        v21 = (unsigned int *)*((void *)a5 + 4);
        *((void *)a5 + 5) = v21;
        int v15 = v19;
      }
      if ((unint64_t)v21 >= *v16)
      {
        uint64_t v23 = (unsigned int *)*v9;
        uint64_t v30 = ((char *)v21 - (unsigned char *)*v9) >> 2;
        unint64_t v31 = v30 + 1;
        if ((unint64_t)(v30 + 1) >> 62) {
          std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v32 = *v16 - (void)v23;
        if (v32 >> 1 > v31) {
          unint64_t v31 = v32 >> 1;
        }
        if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v27 = v31;
        }
        if (v27)
        {
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<float>>((uint64_t)a5 + 48, v27);
          uint64_t v23 = (unsigned int *)*((void *)a5 + 4);
          v21 = (unsigned int *)*((void *)a5 + 5);
        }
        else
        {
          v28 = 0;
        }
        v33 = (unsigned int *)&v28[4 * v30];
        unsigned int *v33 = v14;
        v29 = v33 + 1;
        while (v21 != v23)
        {
          unsigned int v35 = *--v21;
          *--v33 = v35;
        }
        goto LABEL_51;
      }
      goto LABEL_34;
    }
    if (v18 >= v11 && v18 <= v15)
    {
      if (v18 >= v15)
      {
        v21 = (unsigned int *)*((void *)a5 + 5);
      }
      else
      {
        v21 = (unsigned int *)*((void *)a5 + 4);
        *((void *)a5 + 5) = v21;
        int v15 = v18;
      }
      if ((unint64_t)v21 >= *v16)
      {
        uint64_t v23 = (unsigned int *)*v9;
        uint64_t v24 = ((char *)v21 - (unsigned char *)*v9) >> 2;
        unint64_t v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 62) {
          std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v26 = *v16 - (void)v23;
        if (v26 >> 1 > v25) {
          unint64_t v25 = v26 >> 1;
        }
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v27 = v25;
        }
        if (v27)
        {
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<float>>((uint64_t)a5 + 48, v27);
          uint64_t v23 = (unsigned int *)*((void *)a5 + 4);
          v21 = (unsigned int *)*((void *)a5 + 5);
        }
        else
        {
          v28 = 0;
        }
        v33 = (unsigned int *)&v28[4 * v24];
        unsigned int *v33 = v14;
        v29 = v33 + 1;
        while (v21 != v23)
        {
          unsigned int v34 = *--v21;
          *--v33 = v34;
        }
LABEL_51:
        *((void *)a5 + 4) = v33;
        *((void *)a5 + 5) = v29;
        *((void *)a5 + 6) = &v28[4 * v27];
        if (v23) {
          operator delete(v23);
        }
LABEL_53:
        *((void *)a5 + 5) = v29;
        goto LABEL_54;
      }
LABEL_34:
      unsigned int *v21 = v14;
      v29 = v21 + 1;
      goto LABEL_53;
    }
LABEL_54:
    ++v14;
  }
  while (v14 != v13);
  if (*((void *)a5 + 4) != *((void *)a5 + 5))
  {
    *a4 = v15;
    *((_DWORD *)a5 + 7) = v15;
    *(_DWORD *)a5 = 4;
  }
LABEL_57:
}

+ (void)readSpecialCharactersFor:(id)a3 from:(id)a4 textRun:(WrdCharacterTextRun *)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = [v8 readCharactersForTextRun:a5];
  uint64_t var2 = a5->var2;
  uint64_t v11 = [v9 length];
  if (v11)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      int v13 = [v9 characterAtIndex:i];
      uint64_t v14 = var2 + i;
      if (v13 == 1)
      {
        [a1 readPictureFor:v15 from:v8 at:v14 textRun:a5];
      }
      else if (v13 == 8)
      {
        [a1 readOfficeArtFor:v15 from:v8 at:v14 textRun:a5];
      }
      else
      {
        [a1 readSpecialCharacterFor:v15 from:v8 at:v14 textRun:a5];
      }
    }
  }
}

+ (void)readPictureFor:(id)a3 from:(id)a4 at:(int)a5 textRun:(WrdCharacterTextRun *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  var4 = a6->var4;
  if (WrdCharacterProperties::isPicture(var4) || WrdCharacterProperties::isOle1Object(var4))
  {
    WrdCharacterTextRun::WrdCharacterTextRun(&v14);
    v14.var1 = a6->var1;
    v14.uint64_t var2 = v7 - 1;
    uint64_t v12 = [v10 wrdReader];
    (*(void (**)(uint64_t, WrdCharacterTextRun *))(*(void *)v12 + 192))(v12, &v14);
    WrdCharacterProperties::WrdCharacterProperties(&v15, v14.var4);
    if (WrdCharacterProperties::isOle2Object(&v15))
    {
      int v13 = [(WDOfficeArt *)[WDOleObject alloc] initWithParagraph:v9];
      +[WBOleObject readFrom:v10 at:v7 oleId:v15.var59 textRun:a6 paragraph:v9 to:v13];
      [v9 addRun:v13];
    }
    else
    {
      int v13 = [(WDOfficeArt *)[WDPicture alloc] initWithParagraph:v9];
      +[WBPicture readFrom:v10 at:v7 textRun:a6 paragraph:v9 to:v13];
      if (v13 && [(WDPicture *)v13 hasContent]) {
        [v9 addRun:v13];
      }
    }

    WrdCharacterProperties::~WrdCharacterProperties(&v15);
    WrdCharacterTextRun::~WrdCharacterTextRun(&v14);
  }
  else if (!WrdCharacterProperties::isFormFieldData(var4))
  {
    +[TCMessageContext reportWarning:WBMissingImage];
  }
}

+ (void)readFieldMarkerFor:(id)a3 from:(id)a4 readState:(void *)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = [v10 addFieldMarker];
  +[WBFieldMarker readFrom:v7 position:*((void *)a5 + 2) paragraph:v10 fieldMarker:v8];
  int v9 = *(_DWORD *)(*((void *)a5 + 2) + 8) + 1;
  *(_DWORD *)a5 = 0;
  *((_DWORD *)a5 + 1) = v9;
}

+ (void)readBookmarkFor:(id)a3 from:(id)a4 readState:(void *)a5
{
  id v14 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 bookmarkTable];
  int v9 = (unsigned int *)*((void *)a5 + 4);
  if (v9 != *((unsigned int **)a5 + 5))
  {
    id v10 = (WrdBookmarkTable *)v8;
    unsigned int v11 = (unsigned __int16)((*(_DWORD *)(v8 + 24) - *(_DWORD *)(v8 + 16)) >> 3);
    do
    {
      if (*v9 < v11)
      {
        uint64_t Bookmark = WrdBookmarkTable::getBookmark(v10, *v9);
        int v13 = *((_DWORD *)a5 + 7);
        if (*(_DWORD *)(Bookmark + 44) == v13)
        {
          +[WBBookmark readFrom:v7 index:*v9 type:0 paragraph:v14];
          int v13 = *((_DWORD *)a5 + 7);
        }
        if (*(_DWORD *)(Bookmark + 48) == v13) {
          +[WBBookmark readFrom:v7 index:*v9 type:1 paragraph:v14];
        }
      }
      ++v9;
    }
    while (v9 != *((unsigned int **)a5 + 5));
  }
  *((_DWORD *)a5 + 6) = *((_DWORD *)a5 + 7);
  *(_DWORD *)a5 = 0;
}

+ (void)readOfficeArtFor:(id)a3 from:(id)a4 at:(int)a5 textRun:(WrdCharacterTextRun *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a3;
  id v9 = a4;
  id v10 = [[WDOfficeArt alloc] initWithParagraph:v11];
  +[WBOfficeArt readFrom:v9 at:v7 textRun:a6 paragraph:v11 to:v10];
  if ([(WDOfficeArt *)v10 isDrawableOverridden]) {
    [v11 addRun:v10];
  }
}

+ (void)readSpecialCharacterFor:(id)a3 from:(id)a4 at:(int)a5 textRun:(WrdCharacterTextRun *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a3;
  id v9 = a4;
  id v10 = [v11 addSpecialCharacter];
  +[WBSpecialCharacter readFrom:v9 at:v7 textRun:a6 paragraph:v11 specialCharacter:v10];
}

+ (void)readNoteFor:(id)a3 from:(id)a4 readState:(void *)a5
{
  id v11 = a3;
  id v7 = a4;
  if (*(_DWORD *)a5 == 1) {
    [v11 addFootnote];
  }
  else {
  uint64_t v8 = [v11 addEndnote];
  }
  int v9 = +[WBNote readFrom:v7 at:*((unsigned int *)a5 + 1) paragraph:v11 note:v8];
  if (v9 <= 0) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  int v10 = *((_DWORD *)a5 + 1) + v9;
  *(_DWORD *)a5 = 0;
  *((_DWORD *)a5 + 1) = v10;
}

+ (void)readSymbolsFor:(id)a3 from:(id)a4 textRun:(WrdCharacterTextRun *)a5
{
  id v13 = a3;
  id v7 = a4;
  unsigned int var2 = a5->var2;
  unsigned int var3 = a5->var3;
  a5->unsigned int var3 = 1;
  if (var2 < var3 + var2)
  {
    unsigned int v10 = var3;
    unsigned int v11 = var2;
    do
    {
      a5->unsigned int var2 = v11;
      uint64_t v12 = [v13 addSymbol];
      +[WBSymbol readFrom:v7 textRun:a5 paragraph:v13 symbol:v12];

      ++v11;
      --v10;
    }
    while (v10);
  }
  a5->unsigned int var2 = var2;
  a5->unsigned int var3 = var3;
}

+ (BOOL)isCPAnnotationRangeEnd:(int)a3 bookmarkTable:(void *)a4
{
  unsigned int v4 = *((_DWORD *)a4 + 6) - *((_DWORD *)a4 + 4);
  unsigned int v5 = (unsigned __int16)(v4 >> 3);
  if (!(unsigned __int16)(v4 >> 3)) {
    return 0;
  }
  if (*(_DWORD *)(WrdBookmarkTable::getBookmark((WrdBookmarkTable *)a4, 0) + 48) == a3) {
    return 1;
  }
  unsigned int v9 = 1;
  do
  {
    unsigned int v10 = v9;
    if (v5 == v9) {
      break;
    }
    uint64_t Bookmark = WrdBookmarkTable::getBookmark((WrdBookmarkTable *)a4, v9);
    unsigned int v9 = v10 + 1;
  }
  while (*(_DWORD *)(Bookmark + 48) != a3);
  return v10 < v5;
}

+ (void)readAnnotationFor:(id)a3 from:(id)a4 readState:(void *)a5
{
  +[WBAnnotation readFrom:a4 at:*((unsigned int *)a5 + 1) paragraph:a3];
  int v6 = *((_DWORD *)a5 + 1) + 1;
  *(_DWORD *)a5 = 0;
  *((_DWORD *)a5 + 1) = v6;
}

+ (void)readAnnotationBookmarkFor:(id)a3 from:(id)a4 readState:(void *)a5
{
  id v17 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 annotationBookmarkTable];
  unsigned int v9 = (unsigned int *)*((void *)a5 + 8);
  if (v9 != *((unsigned int **)a5 + 9))
  {
    unsigned int v10 = (WrdBookmarkTable *)v8;
    unsigned int v11 = (unsigned __int16)((*(_DWORD *)(v8 + 24) - *(_DWORD *)(v8 + 16)) >> 3);
    do
    {
      if (*v9 < v11)
      {
        uint64_t Bookmark = WrdBookmarkTable::getBookmark(v10, *v9);
        int v13 = *((_DWORD *)a5 + 15);
        if (*(_DWORD *)(Bookmark + 44) == v13)
        {
          id v14 = +[WBAnnotation readRangedFrom:v7 index:*v9 type:0 paragraph:v17];
          [v7 setAnnotationRangeStart:v14 forBookmarkIndex:*v9];

          int v13 = *((_DWORD *)a5 + 15);
        }
        if (*(_DWORD *)(Bookmark + 48) == v13)
        {
          WrdCharacterProperties v15 = +[WBAnnotation readRangedFrom:v7 index:*v9 type:1 paragraph:v17];
          uint64_t v16 = [v7 annotationRangeStartForBookmarkIndex:*v9];
          [v16 setOtherEndOfRangedAnnotation:v15];
          [v15 setOtherEndOfRangedAnnotation:v16];
          [v15 useDataFromOtherEnd];
        }
      }
      ++v9;
    }
    while (v9 != *((unsigned int **)a5 + 9));
  }
  *((_DWORD *)a5 + 14) = *((_DWORD *)a5 + 15);
  *(_DWORD *)a5 = 0;
}

+ (int)blockType
{
  return 0;
}

@end