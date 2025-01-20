@interface PBMasterStyle
+ (void)readMasterStyleAtom:(void *)a3 baseMasterStyleAtom:(void *)a4 masterBulletStyleAtom:(void *)a5 textListStyle:(id)a6 state:(id)a7;
@end

@implementation PBMasterStyle

+ (void)readMasterStyleAtom:(void *)a3 baseMasterStyleAtom:(void *)a4 masterBulletStyleAtom:(void *)a5 textListStyle:(id)a6 state:(id)a7
{
  id v28 = a6;
  id v10 = a7;
  if (!a3)
  {
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 1004;
  }
  uint64_t v12 = *((void *)a3 + 6);
  uint64_t v11 = *((void *)a3 + 7);
  int Instance = EshRecord::getInstance((EshRecord *)a3);
  BOOL isDerivedType = PptTextHeaderAtom::isDerivedType(Instance);
  unint64_t v15 = v11 - v12;
  if (isDerivedType
    && (!a4
     || (unsigned __int16)(v15 >> 3) > (unsigned __int16)((*((_DWORD *)a4 + 14) - *((_DWORD *)a4 + 12)) >> 3)))
  {
    v25 = __cxa_allocate_exception(4uLL);
    _DWORD *v25 = 1004;
  }
  v26 = (PptTextMasterStyleAtom *)a5;
  if (a5) {
    unint64_t v16 = (unsigned __int16)((unint64_t)(*((_DWORD *)a5 + 14) - *((_DWORD *)a5 + 12)) >> 3);
  }
  else {
    unint64_t v16 = 0;
  }
  if ((v15 & 0x7FFF8) != 0)
  {
    unint64_t v17 = 0;
    uint64_t v18 = (unsigned __int16)(v15 >> 3);
    while (1)
    {
      uint64_t LevelReference = PptTextMasterStyleAtom::getLevelReference((PptTextMasterStyleAtom *)a3, (unsigned __int16)v17);
      if (isDerivedType) {
        break;
      }
      if (v17)
      {
        v20 = (const PptParaProperty *)PptTextMasterStyleAtom::getLevelReference((PptTextMasterStyleAtom *)a3, (unsigned __int16)(v17 - 1));
        goto LABEL_14;
      }
LABEL_15:
      if (v17 >= v16) {
        uint64_t v22 = 0;
      }
      else {
        uint64_t v22 = PptTextMasterStyleAtom::getLevelReference(v26, (unsigned __int16)v17);
      }
      v23 = [v28 propertiesForListLevel:v17];
      +[PBParagraphProperties readParagraphProperties:v23 paragraphProperty:LevelReference bulletStyle:v22 isMaster:1 state:v10];
      +[PBCharacterProperties readCharacterProperties:v23 characterProperty:LevelReference + 48 state:v10];
      [v23 setLevel:v17];

      if (v18 == ++v17) {
        goto LABEL_19;
      }
    }
    v20 = (const PptParaProperty *)PptTextMasterStyleAtom::getLevelReference((PptTextMasterStyleAtom *)a4, (unsigned __int16)v17);
LABEL_14:
    v21 = v20;
    PptParaProperty::copyValuesOfNonOverriddenPropertiesFromParent((char *)LevelReference, v20);
    PptCharProperty::copyValuesOfNonOverriddenPropertiesFromParent((PptCharProperty *)(LevelReference + 48), (const PptCharProperty *)((char *)v21 + 48));
    goto LABEL_15;
  }
LABEL_19:
}

@end