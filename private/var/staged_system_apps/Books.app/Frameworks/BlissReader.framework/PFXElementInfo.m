@interface PFXElementInfo
+ (id)elementInfoForElement:(const char *)a3;
+ (void)addElementInfoForName:(const char *)a3 isBlockLevel:(BOOL)a4 ignoreContainedText:(BOOL)a5 denotesList:(BOOL)a6 denotesListItem:(BOOL)a7 isItsOwnParagraph:(BOOL)a8 isTableRelated:(BOOL)a9 hasTextAlign:(BOOL)a10;
+ (void)elementInfos;
+ (void)initialize;
- (BOOL)denotesList;
- (BOOL)denotesListItem;
- (BOOL)hasTextAlign;
- (BOOL)ignoreContainedText;
- (BOOL)isBlockLevel;
- (BOOL)isItsOwnParagraph;
- (BOOL)isTableRelated;
- (void)setDenotesList:(BOOL)a3;
- (void)setDenotesListItem:(BOOL)a3;
- (void)setHasTextAlign:(BOOL)a3;
- (void)setIgnoreContainedText:(BOOL)a3;
- (void)setIsBlockLevel:(BOOL)a3;
- (void)setIsItsOwnParagraph:(BOOL)a3;
- (void)setIsTableRelated:(BOOL)a3;
@end

@implementation PFXElementInfo

+ (void)elementInfos
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_573408, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_573408))
  {
    qword_573400 = 0;
    qword_5733F8 = 0;
    qword_5733F0 = (uint64_t)&qword_5733F8;
    __cxa_guard_release(&qword_573408);
  }
  return &qword_5733F0;
}

+ (void)addElementInfoForName:(const char *)a3 isBlockLevel:(BOOL)a4 ignoreContainedText:(BOOL)a5 denotesList:(BOOL)a6 denotesListItem:(BOOL)a7 isItsOwnParagraph:(BOOL)a8 isTableRelated:(BOOL)a9 hasTextAlign:(BOOL)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a5;
  BOOL v14 = a4;
  v17 = (const xmlChar *)a3;
  v16 = objc_alloc_init(PFXElementInfo);
  [(PFXElementInfo *)v16 setIsBlockLevel:v14];
  [(PFXElementInfo *)v16 setIgnoreContainedText:v13];
  [(PFXElementInfo *)v16 setDenotesList:v12];
  [(PFXElementInfo *)v16 setDenotesListItem:v11];
  [(PFXElementInfo *)v16 setIsItsOwnParagraph:v10];
  [(PFXElementInfo *)v16 setIsTableRelated:a9];
  [(PFXElementInfo *)v16 setHasTextAlign:a10];
  v18 = &v17;
  sub_1EB8AC((uint64_t **)[a1 elementInfos], &v17, (uint64_t)&std::piecewise_construct, (uint64_t **)&v18)[5] = (uint64_t)v16;
}

+ (void)initialize
{
  LOWORD(v3) = 0;
  [a1 addElementInfoForName:@"a" isBlockLevel:0 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v3];
  LOWORD(v4) = 0;
  [a1 addElementInfoForName:@"blockquote" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v4];
  LOWORD(v5) = 0;
  [a1 addElementInfoForName:@"button" isBlockLevel:0 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v5];
  LOWORD(v6) = 0;
  [a1 addElementInfoForName:@"body" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v6];
  LOWORD(v7) = 0;
  [a1 addElementInfoForName:@"br" isBlockLevel:0 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v7];
  LOWORD(v8) = 0;
  [a1 addElementInfoForName:@"center" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v8];
  LOWORD(v9) = 0;
  [a1 addElementInfoForName:@"col" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v9];
  LOWORD(v10) = 0;
  [a1 addElementInfoForName:@"colgroup" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v10];
  LOWORD(v11) = 0;
  [a1 addElementInfoForName:@"dl" isBlockLevel:1 ignoreContainedText:0 denotesList:1 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v11];
  LOWORD(v12) = 0;
  [a1 addElementInfoForName:@"dt" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:1 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v12];
  LOWORD(v13) = 0;
  [a1 addElementInfoForName:@"dd" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:1 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v13];
  LOWORD(v14) = 256;
  [a1 addElementInfoForName:@"div" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v14];
  LOWORD(v15) = 0;
  [a1 addElementInfoForName:@"embed" isBlockLevel:0 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v15];
  LOWORD(v16) = 0;
  [a1 addElementInfoForName:@"form" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v16];
  LOWORD(v17) = 0;
  [a1 addElementInfoForName:@"iframe" isBlockLevel:1 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:1 isTableRelated:1 hasTextAlign:v17];
  LOWORD(v18) = 0;
  [a1 addElementInfoForName:@"img" isBlockLevel:0 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v18];
  LOWORD(v19) = 0;
  [a1 addElementInfoForName:@"input" isBlockLevel:0 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v19];
  LOWORD(v20) = 256;
  [a1 addElementInfoForName:@"h1" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v20];
  LOWORD(v21) = 256;
  [a1 addElementInfoForName:@"h2" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v21];
  LOWORD(v22) = 256;
  [a1 addElementInfoForName:@"h3" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v22];
  LOWORD(v23) = 256;
  [a1 addElementInfoForName:@"h4" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v23];
  LOWORD(v24) = 256;
  [a1 addElementInfoForName:@"h5" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v24];
  LOWORD(v25) = 256;
  [a1 addElementInfoForName:@"h6" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v25];
  LOWORD(v26) = 0;
  [a1 addElementInfoForName:@"hr" isBlockLevel:0 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v26];
  LOWORD(v27) = 0;
  [a1 addElementInfoForName:@"noscript" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v27];
  LOWORD(v28) = 0;
  [a1 addElementInfoForName:@"option" isBlockLevel:0 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v28];
  LOWORD(v29) = 0;
  [a1 addElementInfoForName:@"optgroup" isBlockLevel:0 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v29];
  LOWORD(v30) = 0;
  [a1 addElementInfoForName:@"ol" isBlockLevel:1 ignoreContainedText:0 denotesList:1 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v30];
  LOWORD(v31) = 0;
  [a1 addElementInfoForName:@"li" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:1 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v31];
  LOWORD(v32) = 0;
  [a1 addElementInfoForName:@"object" isBlockLevel:0 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v32];
  LOWORD(v33) = 256;
  [a1 addElementInfoForName:@"p" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v33];
  LOWORD(v34) = 0;
  [a1 addElementInfoForName:@"pre" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v34];
  LOWORD(v35) = 0;
  [a1 addElementInfoForName:@"script" isBlockLevel:0 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:1 isTableRelated:v35];
  LOWORD(v36) = 0;
  [a1 addElementInfoForName:@"select" isBlockLevel:0 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v36];
  LOWORD(v37) = 1;
  [a1 addElementInfoForName:@"table" isBlockLevel:1 ignoreContainedText:1 denotesList:0 denotesListItem:0 isItsOwnParagraph:1 isTableRelated:1 hasTextAlign:v37];
  LOWORD(v38) = 257;
  [a1 addElementInfoForName:@"td" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v38];
  LOWORD(v39) = 1;
  [a1 addElementInfoForName:@"tbody" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v39];
  LOWORD(v40) = 1;
  [a1 addElementInfoForName:@"thead" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v40];
  LOWORD(v41) = 1;
  [a1 addElementInfoForName:@"tfoot" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v41];
  LOWORD(v42) = 257;
  [a1 addElementInfoForName:@"th" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v42];
  LOWORD(v43) = 257;
  [a1 addElementInfoForName:@"tr" isBlockLevel:1 ignoreContainedText:0 denotesList:0 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v43];
  LOWORD(v44) = 0;
  [a1 addElementInfoForName:@"ul" isBlockLevel:1 ignoreContainedText:0 denotesList:1 denotesListItem:0 isItsOwnParagraph:0 isTableRelated:0 hasTextAlign:v44];
}

+ (id)elementInfoForElement:(const char *)a3
{
  uint64_t v6 = (const xmlChar *)a3;
  uint64_t v3 = (char *)[a1 elementInfos];
  uint64_t v4 = sub_1EE660((uint64_t)v3, &v6);
  if (v3 + 8 == (char *)v4) {
    return 0;
  }
  else {
    return *(id *)(v4 + 40);
  }
}

- (BOOL)isBlockLevel
{
  return self->mIsBlockLevel;
}

- (void)setIsBlockLevel:(BOOL)a3
{
  self->mIsBlockLevel = a3;
}

- (BOOL)ignoreContainedText
{
  return self->mIgnoreContainedText;
}

- (void)setIgnoreContainedText:(BOOL)a3
{
  self->mIgnoreContainedText = a3;
}

- (BOOL)denotesList
{
  return self->mDenotesList;
}

- (void)setDenotesList:(BOOL)a3
{
  self->mDenotesList = a3;
}

- (BOOL)denotesListItem
{
  return self->mDenotesListItem;
}

- (void)setDenotesListItem:(BOOL)a3
{
  self->mDenotesListItem = a3;
}

- (BOOL)isItsOwnParagraph
{
  return self->mIsItsOwnParagraph;
}

- (void)setIsItsOwnParagraph:(BOOL)a3
{
  self->mIsItsOwnParagraph = a3;
}

- (BOOL)isTableRelated
{
  return self->mIsTableRelated;
}

- (void)setIsTableRelated:(BOOL)a3
{
  self->mIsTableRelated = a3;
}

- (BOOL)hasTextAlign
{
  return self->mHasTextAlign;
}

- (void)setHasTextAlign:(BOOL)a3
{
  self->mHasTextAlign = a3;
}

@end