@interface PBHeadersFooters
+ (PptHeadersFootersAtom)headersFootersAtomWithHeadersFootersContainer:(id)a3;
+ (id)headersFootersContainerWithSlideContainer:(id)a3 state:(id)a4;
+ (void)addCopyOfHeaderFooterPlaceholderOfType:(int)a3 toDrawables:(id)a4 slideBase:(id)a5 headersFootersContainer:(id)a6 state:(id)a7;
+ (void)readHeaderFooterTextFromHeadersFootersContainer:(id)a3 toPlaceholderShape:(id)a4;
+ (void)readHeadersFootersFromSlideContainer:(id)a3 toMasterSlide:(id)a4 drawables:(id)a5 state:(id)a6;
+ (void)readHeadersFootersFromSlideContainer:(id)a3 toSlide:(id)a4 drawables:(id)a5 state:(id)a6;
+ (void)readHeadersFootersToSlideLayout:(id)a3 drawables:(id)a4 state:(id)a5;
@end

@implementation PBHeadersFooters

+ (id)headersFootersContainerWithSlideContainer:(id)a3 state:(id)a4
{
  id v5 = a4;
  v6 = [a3 firstChildOfType:4057];
  if (!v6)
  {
    uint64_t DocumentRef = PptBinaryReader::getDocumentRef((PptBinaryReader *)[v5 reader]);
    v8 = [v5 documentRoot];
    v9 = [v8 pbReferenceWithID:DocumentRef];

    v6 = [v9 firstChildOfType:4057];
  }
  return v6;
}

+ (PptHeadersFootersAtom)headersFootersAtomWithHeadersFootersContainer:(id)a3
{
  id v3 = a3;
  {
    PptHeadersFootersAtom::PptHeadersFootersAtom(&+[PBHeadersFooters headersFootersAtomWithHeadersFootersContainer:]::srcDefaultHFAtom);
    __cxa_atexit((void (*)(void *))PptHeadersFootersAtom::~PptHeadersFootersAtom, &+[PBHeadersFooters headersFootersAtomWithHeadersFootersContainer:]::srcDefaultHFAtom, &dword_238A75000);
  }
  v4 = [v3 firstChildOfType:4058];
  uint64_t v5 = [v4 eshObject];

  if (v5) {
    v6 = (PptHeadersFootersAtom *)v5;
  }
  else {
    v6 = &+[PBHeadersFooters headersFootersAtomWithHeadersFootersContainer:]::srcDefaultHFAtom;
  }

  return v6;
}

+ (void)readHeaderFooterTextFromHeadersFootersContainer:(id)a3 toPlaceholderShape:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [a1 headersFootersAtomWithHeadersFootersContainer:v15];
    v8 = [v6 clientData];
    v9 = [v8 placeholder];
    int v10 = [v9 type];

    if (v10 == 4)
    {
      if (!*(unsigned char *)(v7 + 52)) {
        goto LABEL_14;
      }
      v14 = [v6 textBody];
      v11 = [v14 findFirstTextRunOfClass:objc_opt_class()];

      [v11 setFormat:0xFFFFFFFFLL];
      if (*(unsigned char *)(v7 + 53)) {
        [v11 setFormat:(*(_DWORD *)(v7 + 48) + 1)];
      }
      v13 = +[PBUtils readStringWithInstance:0 fromContainer:v15];
      if ([v13 length]) {
        [v11 setText:v13];
      }
      goto LABEL_12;
    }
    if (v10 == 6 && *(unsigned char *)(v7 + 57))
    {
      v11 = +[PBUtils readStringWithInstance:2 fromContainer:v15];
      if (![v11 length])
      {
LABEL_13:

        goto LABEL_14;
      }
      v12 = [v6 textBody];
      v13 = [v12 findFirstTextRunOfClass:objc_opt_class()];

      [v13 setText:v11];
LABEL_12:

      goto LABEL_13;
    }
  }
LABEL_14:
}

+ (void)readHeadersFootersToSlideLayout:(id)a3 drawables:(id)a4 state:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [a1 headersFootersContainerWithSlideContainer:0 state:v9];
  [a1 addCopyOfHeaderFooterPlaceholderOfType:4 toDrawables:v8 slideBase:v11 headersFootersContainer:v10 state:v9];
  [a1 addCopyOfHeaderFooterPlaceholderOfType:6 toDrawables:v8 slideBase:v11 headersFootersContainer:v10 state:v9];
}

+ (void)addCopyOfHeaderFooterPlaceholderOfType:(int)a3 toDrawables:(id)a4 slideBase:(id)a5 headersFootersContainer:(id)a6 state:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v28 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [v12 parentSlideBase];
  v16 = [v15 placeholderWithType:v10 placeholderTypeIndex:0 overrideIndex:1];
  if (v16)
  {
    id v26 = a1;
    id v27 = v13;
    v17 = objc_alloc_init(OADShape);
    v18 = objc_alloc_init(PDOfficeArtClient);
    [(OADDrawable *)v17 setClientData:v18];
    v19 = objc_alloc_init(PDPlaceholder);
    [(PDOfficeArtClient *)v18 setPlaceholder:v19];
    v20 = [v16 clientData];
    v21 = [v20 placeholder];

    int v22 = [v21 index];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v23 = 0;
    }
    else {
      int v23 = 8;
    }
    [(PDPlaceholder *)v19 setIndex:(v23 + v22)];
    -[PDPlaceholder setType:](v19, "setType:", [v21 type]);
    -[PDPlaceholder setSize:](v19, "setSize:", [v21 size]);
    v24 = [v14 sourceTextBoxContainerHolderForTargetShape:v16];
    if (v24)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v14 setSourceTextBoxContainerHolder:v24 forTargetShape:v17];
      }
      v25 = objc_alloc_init(OADTextBody);
      +[PBTextBlock readClientTextBox:v24 textBody:v25 state:v14];
      [(OADShape *)v17 setTextBody:v25];
    }
    [v26 readHeaderFooterTextFromHeadersFootersContainer:v27 toPlaceholderShape:v17];
    [v28 addObject:v17];

    id v13 = v27;
  }
}

+ (void)readHeadersFootersFromSlideContainer:(id)a3 toSlide:(id)a4 drawables:(id)a5 state:(id)a6
{
  id v14 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [a1 headersFootersContainerWithSlideContainer:a3 state:v11];
  id v13 = (unsigned char *)[a1 headersFootersAtomWithHeadersFootersContainer:v12];
  if (v13[52]) {
    [a1 addCopyOfHeaderFooterPlaceholderOfType:4 toDrawables:v10 slideBase:v14 headersFootersContainer:v12 state:v11];
  }
  if (v13[57]) {
    [a1 addCopyOfHeaderFooterPlaceholderOfType:6 toDrawables:v10 slideBase:v14 headersFootersContainer:v12 state:v11];
  }
  if (v13[55]) {
    [v11 setHasSlideNumberPlaceholder:1];
  }
}

+ (void)readHeadersFootersFromSlideContainer:(id)a3 toMasterSlide:(id)a4 drawables:(id)a5 state:(id)a6
{
  id v23 = a3;
  id v24 = a4;
  id v10 = a5;
  id v22 = a6;
  v25 = objc_msgSend(a1, "headersFootersContainerWithSlideContainer:state:", 0);
  id v11 = (unsigned __int8 *)[a1 headersFootersAtomWithHeadersFootersContainer:v25];
  objc_msgSend(v24, "setHeaderPlaceholderIsVisible:", PptHeadersFootersAtom::isRendered(v11, 10));
  objc_msgSend(v24, "setFooterPlaceholderIsVisible:", PptHeadersFootersAtom::isRendered(v11, 9));
  objc_msgSend(v24, "setDateTimePlaceholderIsVisible:", PptHeadersFootersAtom::isRendered(v11, 7));
  objc_msgSend(v24, "setSlideNumberPlaceholderIsVisible:", PptHeadersFootersAtom::isRendered(v11, 8));
  id v12 = +[PBProgTag binaryTagDataWithName:L"___PPT12" inProgTagsParent:v23];
  id v13 = v12;
  if (v12)
  {
    id v14 = [v12 firstChildOfType:1060];
    Atom = (unsigned __int8 *)ESDAtomAccess<PptRoundTripHeaderFooterDefaultsAtom>::extractAtom(v14, 0);

    if (Atom)
    {
      [v24 setHeaderPlaceholderIsVisible:Atom[47]];
      [v24 setFooterPlaceholderIsVisible:Atom[46]];
      [v24 setDateTimePlaceholderIsVisible:Atom[45]];
      [v24 setSlideNumberPlaceholderIsVisible:Atom[48]];
    }
  }
  for (unint64_t i = 0; i < [v10 count]; ++i)
  {
    v17 = [v10 objectAtIndex:i];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v17;
      v19 = [v18 clientData];
      v20 = [v19 placeholder];
      int v21 = [v20 type];

      if ((v21 & 0xFFFFFFFD) == 4) {
        [a1 readHeaderFooterTextFromHeadersFootersContainer:v25 toPlaceholderShape:v18];
      }
    }
  }
}

@end