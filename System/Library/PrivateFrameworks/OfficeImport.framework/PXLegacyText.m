@interface PXLegacyText
+ (void)readLegacyTextFromData:(id)a3 toShape:(id)a4 state:(id)a5;
+ (void)readLegacyTextGlobalsFromData:(id)a3 state:(id)a4;
+ (void)textMasterStyleOfType:(int)a3 state:(id)a4;
@end

@implementation PXLegacyText

+ (void)textMasterStyleOfType:(int)a3 state:(id)a4
{
  __int16 v4 = a3;
  id v5 = a4;
  objc_opt_class();
  v6 = [v5 legacyTextGlobals];
  objc_opt_class();
  v7 = [v6 firstChildOfType:1010];
  v8 = [v7 childOfType:4003 instance:v4];
  v9 = (const void *)[v8 eshObject];
  if (v9) {
  else
  }
    v10 = 0;

  return v10;
}

+ (void)readLegacyTextGlobalsFromData:(id)a3 state:(id)a4
{
  id v9 = a4;
  id v5 = pptTreeWithData((NSData *)a3);
  [v9 setLegacyTextGlobals:v5];
  v6 = [[PBPresentationReaderState alloc] initWithReader:0 tgtPresentation:0];
  objc_opt_class();
  v7 = [v9 legacyTextGlobals];
  objc_opt_class();
  v8 = [v7 firstChildOfType:1010];
  +[PBPresentation setFontEntites:v6 environmentHolder:v8];
  +[PBProgTag readBulletImagesFromContainerParent:v7 state:v6];
  [v9 setLegacyPresentationState:v6];
}

+ (void)readLegacyTextFromData:(id)a3 toShape:(id)a4 state:(id)a5
{
  v44 = (NSData *)a3;
  id v8 = a4;
  id v42 = a5;
  id v9 = [v42 legacyPresentationState];
  uint64_t v10 = [v8 textBody];
  v11 = pptTreeWithData(v44);
  objc_opt_class();
  id v12 = v11;
  v13 = [v12 firstChildOfType:3999];
  v14 = (const void *)[v13 eshObject];
  v43 = v9;
  v41 = (void *)v10;
  if (v14) {
  else
  }
    v15 = 0;

  uint64_t v16 = v15[12];
  v40 = [v12 firstChildOfType:4012];
  objc_msgSend(v9, "setCurrentBulletStyle:macCharStyle:");
  v17 = [v12 firstChildOfType:4001];
  v18 = (const void *)[v17 eshObject];
  if (v18) {
  else
  }
    v19 = 0;

  v20 = [v12 firstChildOfType:4008];
  Atom = (EshRecord *)ESDAtomAccess<PptTextBytesAtom>::extractAtom(v20, 0);

  if (Atom)
  {
    EshRecord::getDataLength(Atom);
    if (!v19) {
      goto LABEL_14;
    }
  }
  else
  {
    v22 = [v12 firstChildOfType:4000];
    v23 = (EshRecord *)ESDAtomAccess<PptTextCharsAtom>::extractAtom(v22, 0);

    if (v23)
    {
      EshRecord::getDataLength(v23);
      if (!v19) {
LABEL_14:
      }
        operator new();
    }
    else if (!v19)
    {
      goto LABEL_14;
    }
  }
  if (((v19[7] - v19[6]) & 0x7FFFFFFF8) == 0) {
    operator new();
  }
  if (((v19[10] - v19[9]) & 0x7FFFFFFF8) == 0 && ((v19[7] - v19[6]) & 0x7FFFFFFF8) != 0) {
    operator new();
  }
  v39 = v8;
  v24 = (PptTextMasterStyleAtom *)[a1 textMasterStyleOfType:v16 state:v42];
  uint64_t v25 = v19[6];
  if (((v19[7] - v25) & 0x7FFFFFFF8) != 0)
  {
    unint64_t v26 = 0;
    do
    {
      uint64_t v27 = *(void *)(v25 + 8 * v26);
      LevelReference = (const PptParaProperty *)PptTextMasterStyleAtom::getLevelReference(v24, *(unsigned __int16 *)(v27 + 4));
      PptParaProperty::copyValuesOfNonOverriddenPropertiesFromParent((char *)(v27 + 8), LevelReference);
      ++v26;
      uint64_t v25 = v19[6];
    }
    while (v26 < ((unint64_t)(v19[7] - v25) >> 3));
  }
  uint64_t v29 = v19[9];
  if (((v19[10] - v29) & 0x7FFFFFFF8) != 0)
  {
    unint64_t v30 = 0;
    unsigned __int16 v31 = 0;
    int v32 = 0;
    int v33 = 0;
    unsigned int v34 = -1;
    do
    {
      if (v33 >= v32)
      {
        uint64_t v35 = v19[6];
        do
        {
          if (++v34 >= ((unint64_t)(v19[7] - v35) >> 3)) {
            std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
          }
          uint64_t v36 = *(void *)(v35 + 8 * v34);
          v32 += *(_DWORD *)v36;
        }
        while (v33 >= v32);
        unsigned __int16 v31 = *(_WORD *)(v36 + 4);
      }
      uint64_t v37 = *(void *)(v29 + 8 * v30);
      uint64_t v38 = PptTextMasterStyleAtom::getLevelReference(v24, v31);
      PptCharProperty::copyValuesOfNonOverriddenPropertiesFromParent((PptCharProperty *)(v37 + 4), (const PptCharProperty *)(v38 + 48));
      v33 += *(_DWORD *)v37;
      ++v30;
      uint64_t v29 = v19[9];
    }
    while (v30 < ((unint64_t)(v19[10] - v29) >> 3));
  }
  +[PBTextBlock readClientTextBox:v12 textBody:v41 state:v43];
}

@end