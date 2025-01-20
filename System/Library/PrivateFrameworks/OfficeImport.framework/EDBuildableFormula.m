@interface EDBuildableFormula
- (BOOL)addArrayWithCol:(int)a3 andRow:(int)a4;
- (BOOL)addInfixOperator:(int)a3 atIndex:(unsigned int)a4 factor:(double)a5;
- (BOOL)argTokenIsDurationAtIndex:(unsigned int)a3;
- (BOOL)convertLastRefsToArea;
- (BOOL)convertRefs:(unsigned int)a3 toType:(int)a4;
- (BOOL)convertRefs:(unsigned int)a3 toTypes:(int *)a4;
- (BOOL)convertToIntersect:(unsigned int)a3;
- (BOOL)convertToList:(unsigned int)a3;
- (BOOL)convertToList:(unsigned int)a3 withFinalParen:(BOOL)a4;
- (BOOL)copyToken:(unsigned int)a3 from:(id)a4;
- (BOOL)fixTableOfConstantsRef:(EDBuildablePtg *)a3;
- (BOOL)fixTableOfConstantsRefs;
- (BOOL)insertExternalName:(unint64_t)a3 withLink:(unint64_t)a4 atIndex:(unsigned int)a5;
- (BOOL)insertName:(unint64_t)a3 atIndex:(unsigned int)a4;
- (BOOL)insertName:(unint64_t)a3 link:(unint64_t)a4 external:(BOOL)a5 atIndex:(unsigned int)a6;
- (BOOL)insertVariableFunction:(unsigned __int16)a3 afterIndex:(unsigned int)a4 numArgs:(unsigned int)a5;
- (BOOL)isConstantList:(unsigned int)a3;
- (BOOL)isSupportedFormula;
- (BOOL)makeArrayForLastToken:(unint64_t)a3;
- (BOOL)replaceArgPtgAtIndex:(unsigned int)a3 withFormula:(id)a4;
- (BOOL)shrinkSpanningRef:(EDBuildablePtg *)a3;
- (BOOL)shrinkSpanningRefAtArgIndex:(unsigned int)a3;
- (BOOL)uppercaseArgAtIndex:(unsigned int)a3;
- (BOOL)wrapArgumentsWithOperator:(int)a3 argumentCount:(unsigned int)a4 atIndex:(unsigned int)a5;
- (EDBuildablePtg)tokenAtIndex:(unint64_t)a3;
- (EDBuildablePtg)tokenAtIndex:(unint64_t)a3 previousToken:(EDBuildablePtg *)a4;
- (char)addToken:(int)a3 extendedDataLength:(unsigned int)a4;
- (char)addToken:(int)a3 extendedDataLength:(unsigned int)a4 numArgs:(int)a5;
- (char)setExtendedDataForLastTokenAtIndex:(unsigned int)a3 length:(unsigned int)a4;
- (id)formula;
- (id)lastTokenRefOrArea3dLinkRefIsValid:(BOOL *)a3 withEDLinks:(id)a4;
- (id)stringFromStringTokenAtIndex:(unint64_t)a3;
- (int)argTokenTypeAtIndex:(unsigned int)a3;
- (int)tokenTypeAtIndex:(unint64_t)a3;
- (int)warningType;
- (unsigned)removeOptionalPtgArgs:(unsigned int)a3 minArgs:(unsigned int)a4;
- (void)convertRefsInList:(EDBuildablePtg *)a3 toType:(int)a4;
- (void)copyToFormula:(id)a3;
- (void)dealloc;
- (void)markLastTokenAsDuration;
- (void)markLastTokenAsSpanningRefVertically:(BOOL)a3 withMin:(unsigned __int16)a4 andMax:(unsigned __int16)a5;
- (void)removeTokenAtIndex:(unint64_t)a3;
- (void)replaceStringInStringTokenAtIndex:(unint64_t)a3 content:(id)a4;
- (void)setWarning:(int)a3;
@end

@implementation EDBuildableFormula

- (void)dealloc
{
  mTree = self->mTree;
  if (mTree) {
    (*((void (**)(EDBuildablePtg *, SEL))mTree->var0 + 1))(mTree, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)EDBuildableFormula;
  [(EDBuildableFormula *)&v4 dealloc];
}

- (int)tokenTypeAtIndex:(unint64_t)a3
{
  v3 = [(EDBuildableFormula *)self tokenAtIndex:a3];
  if (v3) {
    LODWORD(v3) = v3->var2;
  }
  return (int)v3;
}

- (id)stringFromStringTokenAtIndex:(unint64_t)a3
{
  v3 = [(EDBuildableFormula *)self tokenAtIndex:a3];
  if (v3 && v3->var2 == 23)
  {
    OcTextFromPtgStr = extractOcTextFromPtgStr((XlPtg *)&v3->var1);
    v5 = [NSString stringWithOcText:OcTextFromPtgStr];
    if (OcTextFromPtgStr) {
      (*((void (**)(OcText *))OcTextFromPtgStr->var0 + 1))(OcTextFromPtgStr);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)replaceStringInStringTokenAtIndex:(unint64_t)a3 content:(id)a4
{
  id v12 = a4;
  v6 = [(EDBuildableFormula *)self tokenAtIndex:a3];
  v7 = v6;
  if (v6)
  {
    if (v6->var2 == 23)
    {
      uint64_t v8 = [v12 length];
      int v9 = v8;
      if (v8)
      {
        p_var1 = (XlPtg *)&v7->var1;
        XlPtg::clear(p_var1);
        v11 = (unsigned __int8 *)XlPtg::addDataItem(p_var1, 2 * v9 + 8);
        if (v11) {
          copyStringToExtendedData((const unsigned __int16 *)[v12 cStringUsingEncoding:10], v11, (__int16)v9);
        }
      }
    }
  }
}

- (void)removeTokenAtIndex:(unint64_t)a3
{
  v7 = 0;
  objc_super v4 = [(EDBuildableFormula *)self tokenAtIndex:a3 previousToken:&v7];
  if (v4)
  {
    v5 = v4;
    v6 = EDBuildablePtg::sibling(v4);
    EDBuildablePtg::setSibling(v5, 0);
    if (v7) {
      EDBuildablePtg::setSibling(v7, v6);
    }
    else {
      self->mTree = v6;
    }
    (*((void (**)(EDBuildablePtg *))v5->var0 + 1))(v5);
  }
}

- (char)addToken:(int)a3 extendedDataLength:(unsigned int)a4 numArgs:(int)a5
{
  if (a3 == 64) {
    operator new();
  }
  operator new();
}

- (char)addToken:(int)a3 extendedDataLength:(unsigned int)a4
{
  return [(EDBuildableFormula *)self addToken:*(void *)&a3 extendedDataLength:*(void *)&a4 numArgs:0];
}

- (BOOL)makeArrayForLastToken:(unint64_t)a3
{
  mTree = self->mTree;
  if (mTree) {
    BOOL v4 = a3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    unint64_t v5 = a3;
    while (1)
    {
      v7 = EDBuildablePtg::sibling(mTree);
      if (!v7) {
        break;
      }
      uint64_t v8 = v7;
      int var2 = v7->var2;
      if ((var2 - 28) >= 4 && var2 != 23) {
        break;
      }
      v11 = EDBuildablePtg::sibling(v7);
      EDBuildablePtg::setSibling(v8, 0);
      EDBuildablePtg::setSibling(mTree, v11);
      id v12 = (EDBuildablePtg *)EDBuildableArrayPtg::elements((EDBuildableArrayPtg *)mTree);
      EDBuildablePtg::setSibling(v8, v12);
      EDBuildableArrayPtg::setElements((uint64_t)mTree, v8);
      if (!--v5) {
        return mTree != 0;
      }
    }
    [(EDBuildableFormula *)self setWarning:1];
  }
  return mTree != 0;
}

- (BOOL)insertName:(unint64_t)a3 link:(unint64_t)a4 external:(BOOL)a5 atIndex:(unsigned int)a6
{
  BOOL v6 = a5;
  __int16 v7 = a4;
  int v8 = a3;
  if (a5) {
    uint64_t v9 = 57;
  }
  else {
    uint64_t v9 = 35;
  }
  if (a5) {
    uint64_t v10 = 6;
  }
  else {
    uint64_t v10 = 4;
  }
  if (a6)
  {
    mTree = self->mTree;
    unsigned int v12 = a6 - 1;
    if (a6 == 1)
    {
LABEL_11:
      if (mTree)
      {
        EDBuildablePtg::sibling(mTree);
        EDBuildablePtg::setSibling(mTree, 0);
        operator new();
      }
    }
    else
    {
      while (mTree)
      {
        mTree = EDBuildablePtg::sibling(mTree);
        if (!--v12) {
          goto LABEL_11;
        }
      }
    }
    return 0;
  }
  v14 = [(EDBuildableFormula *)self addToken:v9 extendedDataLength:v10];
  if (!v14) {
    return 0;
  }
  if (v6)
  {
    *(_WORD *)v14 = v7;
    *((_WORD *)v14 + 1) = v8;
    BOOL v13 = 1;
    *((_WORD *)v14 + 2) = 0;
  }
  else
  {
    *(_DWORD *)v14 = v8;
    return 1;
  }
  return v13;
}

- (BOOL)insertName:(unint64_t)a3 atIndex:(unsigned int)a4
{
  return [(EDBuildableFormula *)self insertName:a3 link:-1 external:0 atIndex:*(void *)&a4];
}

- (BOOL)insertExternalName:(unint64_t)a3 withLink:(unint64_t)a4 atIndex:(unsigned int)a5
{
  return [(EDBuildableFormula *)self insertName:a3 link:a4 external:1 atIndex:*(void *)&a5];
}

- (char)setExtendedDataForLastTokenAtIndex:(unsigned int)a3 length:(unsigned int)a4
{
  return 0;
}

- (BOOL)addArrayWithCol:(int)a3 andRow:(int)a4
{
  uint64_t v7 = (a3 + 1 + (a3 + 1) * a4);
  [(EDBuildableFormula *)self addToken:64 extendedDataLength:0 numArgs:v7];
  mTree = self->mTree;
  if (!mTree) {
    return 0;
  }
  if (!v9) {
    return 0;
  }
  EDBuildableArrayPtg::setColRow((uint64_t)v9, a3, a4);
  return [(EDBuildableFormula *)self makeArrayForLastToken:v7];
}

- (BOOL)isConstantList:(unsigned int)a3
{
  BOOL v3 = 0;
  if (a3)
  {
    mTree = self->mTree;
    if (mTree)
    {
      LODWORD(v5) = a3;
      if (EDBuildablePtg::isConstant(self->mTree))
      {
        uint64_t v5 = v5;
        do
        {
          BOOL v3 = --v5 == 0;
          if (!v5) {
            break;
          }
          if (!EDBuildablePtg::sibling(mTree)) {
            break;
          }
          mTree = EDBuildablePtg::sibling(mTree);
        }
        while (EDBuildablePtg::isConstant(mTree));
      }
      else
      {
        return 0;
      }
    }
  }
  return v3;
}

- (BOOL)convertToList:(unsigned int)a3
{
  return [(EDBuildableFormula *)self convertToList:*(void *)&a3 withFinalParen:1];
}

- (BOOL)convertToList:(unsigned int)a3 withFinalParen:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  unint64_t v8 = a3;
  EDBuildablePtg::unionize(self->mTree, &v8);
  if (a3 != 1) {
    addOperator(self, 16);
  }
  if (v4) {
    return addOperator(self, 21);
  }
  else {
    return 1;
  }
}

- (BOOL)convertToIntersect:(unsigned int)a3
{
  unint64_t v6 = a3;
  EDBuildablePtg::intersect(self->mTree, &v6);
  if (a3 >= 2) {
    addOperator(self, 15);
  }
  return 1;
}

- (BOOL)convertLastRefsToArea
{
  v32[1] = *MEMORY[0x263EF8340];
  mTree = self->mTree;
  if (!mTree) {
    return 0;
  }
  int v4 = isRef((BOOL)&mTree->var1);
  BOOL v5 = isArea((BOOL)&mTree->var1);
  unint64_t v6 = EDBuildablePtg::sibling(mTree);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  p_var1 = (XlPtg *)&v6->var1;
  int v9 = isRef((BOOL)&v6->var1);
  BOOL v10 = isArea((BOOL)p_var1);
  if (v4 != v9 || (BOOL v11 = v10, ((v5 ^ v10) & 1) != 0) || !(v9 | v10) || !(v4 | v5))
  {
    v32[0] = 0;
    [(EDBuildableFormula *)self convertRefs:2 toTypes:v32];
    EDBuildablePtg::sibling(v7);
    EDBuildablePtg::setSibling(v7, 0);
    operator new();
  }
  self->mTree = EDBuildablePtg::sibling(v7);
  EDBuildablePtg::setSibling(v7, 0);
  if (v11)
  {
    if (isArea3D((BOOL)p_var1))
    {
      int v12 = refTypeOf(v7->var2);
      LastExtendedData = (unsigned __int16 *)XlPtg::getLastExtendedData(p_var1);
      v14 = (unsigned __int16 *)XlPtg::getLastExtendedData((XlPtg *)&mTree->var1);
      BOOL v15 = addArea3DOperandFromArea3DExtendedData(self, v12, LastExtendedData, v14);
    }
    else
    {
      v20 = (unsigned __int16 *)XlPtg::getLastExtendedData(p_var1);
      v21 = (unsigned __int16 *)XlPtg::getLastExtendedData((XlPtg *)&mTree->var1);
      BOOL v15 = addAreaOperandFromAreaExtendedData(self, v20, v21);
    }
  }
  else if (isRef3D((BOOL)p_var1))
  {
    int v17 = refTypeOf(v7->var2);
    v18 = (unsigned __int16 *)XlPtg::getLastExtendedData(p_var1);
    v19 = (unsigned __int16 *)XlPtg::getLastExtendedData((XlPtg *)&mTree->var1);
    BOOL v15 = addArea3DOperandFromRef3DExtendedData(self, v17, v18, v19);
  }
  else
  {
    v22 = (unsigned __int16 *)XlPtg::getLastExtendedData(p_var1);
    v23 = (unsigned __int16 *)XlPtg::getLastExtendedData((XlPtg *)&mTree->var1);
    BOOL v15 = addAreaOperandFromRefExtendedData(self, v22, v23);
  }
  BOOL v16 = v15;
  if (EDBuildablePtg::isSpanningRef(mTree))
  {
    int v24 = EDBuildablePtg::spanningRef(mTree);
    if (v24 == EDBuildablePtg::spanningRef(v7))
    {
      int v25 = EDBuildablePtg::minSpan(mTree);
      if (v25 == EDBuildablePtg::minSpan(v7))
      {
        int v26 = EDBuildablePtg::maxSpan(mTree);
        if (v26 == EDBuildablePtg::maxSpan(v7))
        {
          v27 = self->mTree;
          int v28 = EDBuildablePtg::spanningRef(mTree);
          __int16 v29 = EDBuildablePtg::minSpan(mTree);
          __int16 v30 = EDBuildablePtg::maxSpan(mTree);
          EDBuildablePtg::setIsSpanningRef((uint64_t)v27, v28, v29, v30);
        }
      }
    }
  }
  (*((void (**)(EDBuildablePtg *))mTree->var0 + 1))(mTree);
  return v16;
}

- (void)convertRefsInList:(EDBuildablePtg *)a3 toType:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    uint64_t Segments = EshGeometryProperties::getSegments((EshGeometryProperties *)a3);
    if (Segments)
    {
      uint64_t v7 = (EDBuildablePtg *)Segments;
      char v8 = 1;
      do
      {
        uint64_t var2 = v7->var2;
        if (var2 == 16) {
          [(EDBuildableFormula *)self convertRefsInList:v7 toType:v4];
        }
        else {
          v7->uint64_t var2 = convertValueReference(var2, v4);
        }
        uint64_t v7 = EDBuildablePtg::sibling(v7);
        char v10 = (v7 != 0) & v8;
        char v8 = 0;
      }
      while ((v10 & 1) != 0);
    }
  }
}

- (BOOL)convertRefs:(unsigned int)a3 toType:(int)a4
{
  if (a3) {
    operator new[]();
  }
  return 1;
}

- (BOOL)convertRefs:(unsigned int)a3 toTypes:(int *)a4
{
  if (!a3) {
    return 1;
  }
  mTree = self->mTree;
  if (!mTree) {
    return 0;
  }
  unsigned int v7 = a3;
  do
  {
    uint64_t var2 = mTree->var2;
    if (var2 == 21)
    {
      [(EDBuildableFormula *)self convertRefsInList:mTree toType:a4[v7 - 1]];
    }
    else
    {
      mTree->uint64_t var2 = convertValueReference(var2, a4[v7 - 1]);
      mTree = EDBuildablePtg::sibling(mTree);
      if (!mTree) {
        return 1;
      }
    }
    --v7;
  }
  while (v7);
  return 1;
}

- (id)lastTokenRefOrArea3dLinkRefIsValid:(BOOL *)a3 withEDLinks:(id)a4
{
  id v6 = a4;
  mTree = self->mTree;
  if (!mTree)
  {
    char v8 = 0;
    goto LABEL_9;
  }
  char v8 = 0;
  int var2 = mTree->var2;
  char v10 = var2 - 22;
  if ((var2 - 22) <= 0x2F)
  {
    if (((1 << v10) & 0xC0000000C001) != 0)
    {
LABEL_9:
      if (!a3) {
        goto LABEL_12;
      }
      BOOL v12 = 1;
      goto LABEL_11;
    }
    if (((1 << v10) & 0x3000000000) != 0)
    {
LABEL_7:
      char v8 = [v6 referenceAtIndex:*(unsigned __int16 *)XlPtg::getLastExtendedData((XlPtg *)&mTree->var1)];
      goto LABEL_9;
    }
  }
  unsigned int v11 = var2 - 90;
  if (v11 <= 0x21)
  {
    if (((1 << v11) & 0x300000003) != 0) {
      goto LABEL_7;
    }
    if (((1 << v11) & 0xC00) != 0) {
      goto LABEL_9;
    }
  }
  char v8 = 0;
  if (a3)
  {
    BOOL v12 = 0;
LABEL_11:
    *a3 = v12;
  }
LABEL_12:

  return v8;
}

- (void)markLastTokenAsDuration
{
  mTree = self->mTree;
  if (mTree) {
    EDBuildablePtg::setIsDuration(mTree, 1);
  }
}

- (void)markLastTokenAsSpanningRefVertically:(BOOL)a3 withMin:(unsigned __int16)a4 andMax:(unsigned __int16)a5
{
  mTree = self->mTree;
  if (mTree)
  {
    if (a3) {
      int v6 = 1;
    }
    else {
      int v6 = 2;
    }
    EDBuildablePtg::setIsSpanningRef((uint64_t)mTree, v6, a4, a5);
  }
}

- (BOOL)uppercaseArgAtIndex:(unsigned int)a3
{
  if (!self->mTree) {
    return 0;
  }
  BOOL v3 = [(EDBuildableFormula *)self tokenAtIndex:a3];
  if (v3)
  {
    if (v3->var2 != 65
      || (LastExtendedData = XlPtg::getLastExtendedData((XlPtg *)&v3->var1)) == 0
      || *(_WORD *)LastExtendedData != 113)
    {
      operator new();
    }
    return 0;
  }
  return 1;
}

- (BOOL)shrinkSpanningRefAtArgIndex:(unsigned int)a3
{
  uint64_t v4 = [(EDBuildableFormula *)self tokenAtIndex:a3];
  if (v4)
  {
    LOBYTE(v4) = [(EDBuildableFormula *)self shrinkSpanningRef:v4];
  }
  return (char)v4;
}

- (BOOL)wrapArgumentsWithOperator:(int)a3 argumentCount:(unsigned int)a4 atIndex:(unsigned int)a5
{
  if (a4 - 1 >= a5 + 1 || self->mTree == 0) {
    return 0;
  }
  BOOL v13 = 0;
  int v9 = [(EDBuildableFormula *)self tokenAtIndex:a5 - a4 + 1 previousToken:&v13];
  char v10 = [(EDBuildableFormula *)self tokenAtIndex:a5];
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v6 = !v11;
  if (!v11) {
    operator new();
  }
  return v6;
}

- (BOOL)addInfixOperator:(int)a3 atIndex:(unsigned int)a4 factor:(double)a5
{
  unsigned int v5 = a3 - 5;
  if ((a3 - 5) <= 1 && a5 == 1.0)
  {
LABEL_8:
    LOBYTE(v7) = 1;
    return (char)v7;
  }
  int v9 = 0;
  unsigned int v7 = [(EDBuildableFormula *)self tokenAtIndex:a4 previousToken:&v9];
  if (v7)
  {
    if (v5 > 1 || v7->var2 != 22) {
      operator new();
    }
    goto LABEL_8;
  }
  return (char)v7;
}

- (BOOL)fixTableOfConstantsRefs
{
  return self->mTree && -[EDBuildableFormula fixTableOfConstantsRef:](self, "fixTableOfConstantsRef:");
}

- (void)setWarning:(int)a3
{
  self->mWarning = a3;
}

- (int)warningType
{
  return self->mWarning;
}

- (BOOL)isSupportedFormula
{
  return self->mWarning == 0;
}

- (id)formula
{
  BOOL v3 = +[EDFormula formula];
  mTree = self->mTree;
  if (mTree) {
    EDBuildablePtg::addToEDFormula(mTree, v3);
  }
  return v3;
}

- (void)copyToFormula:(id)a3
{
  uint64_t v4 = (EDFormula *)a3;
  BOOL v6 = v4;
  if (self->mWarning)
  {
    -[EDFormula setWarning:](v4, "setWarning:");
  }
  else
  {
    mTree = self->mTree;
    if (mTree) {
      EDBuildablePtg::addToEDFormula(mTree, v6);
    }
  }
}

- (BOOL)copyToken:(unsigned int)a3 from:(id)a4
{
  if (a4) {
    operator new();
  }

  return 0;
}

- (BOOL)argTokenIsDurationAtIndex:(unsigned int)a3
{
  BOOL v3 = [(EDBuildableFormula *)self tokenAtIndex:a3];
  if (v3)
  {
    LOBYTE(v3) = EDBuildablePtg::isDuration(v3);
  }
  return (char)v3;
}

- (int)argTokenTypeAtIndex:(unsigned int)a3
{
  BOOL v3 = [(EDBuildableFormula *)self tokenAtIndex:a3];
  if (v3) {
    LODWORD(v3) = v3->var2;
  }
  return (int)v3;
}

- (BOOL)replaceArgPtgAtIndex:(unsigned int)a3 withFormula:(id)a4
{
  BOOL v6 = (EDBuildablePtg **)a4;
  if (EDBuildablePtg::sibling(v6[1])) {
    goto LABEL_2;
  }
  mTree = self->mTree;
  if (a3 && mTree)
  {
    unsigned int v10 = 0;
    do
    {
      BOOL v11 = mTree;
      BOOL v12 = EDBuildablePtg::sibling(mTree);
      mTree = v12;
      ++v10;
    }
    while (v10 < a3 && v12);
    if (a3 != v10) {
      goto LABEL_2;
    }
    EDBuildablePtg::setSibling(v11, v6[1]);
    if (!mTree)
    {
LABEL_15:
      v6[1] = 0;
      BOOL v7 = 1;
      goto LABEL_3;
    }
LABEL_14:
    BOOL v13 = EDBuildablePtg::sibling(mTree);
    EDBuildablePtg::setSibling(mTree, 0);
    EDBuildablePtg::setSibling(v6[1], v13);
    (*((void (**)(EDBuildablePtg *))mTree->var0 + 1))(mTree);
    goto LABEL_15;
  }
  if (!a3)
  {
    self->mTree = v6[1];
    if (!mTree) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_2:
  BOOL v7 = 0;
LABEL_3:

  return v7;
}

- (BOOL)insertVariableFunction:(unsigned __int16)a3 afterIndex:(unsigned int)a4 numArgs:(unsigned int)a5
{
}

- (unsigned)removeOptionalPtgArgs:(unsigned int)a3 minArgs:(unsigned int)a4
{
  unsigned int result = 0;
  if (a3)
  {
    unsigned int v7 = a3 - a4;
    if (a3 >= a4)
    {
      unsigned int v8 = 0;
      if (a3 != a4)
      {
        while (1)
        {
          mTree = self->mTree;
          if (!mTree || mTree->var2 != 22) {
            break;
          }
          self->mTree = EDBuildablePtg::sibling(self->mTree);
          EDBuildablePtg::setSibling(mTree, 0);
          (*((void (**)(EDBuildablePtg *))mTree->var0 + 1))(mTree);
          if (v7 == ++v8)
          {
            unsigned int v8 = v7;
            return a3 - v8;
          }
        }
      }
      return a3 - v8;
    }
  }
  return result;
}

- (EDBuildablePtg)tokenAtIndex:(unint64_t)a3
{
  uint64_t v4 = 0;
  return [(EDBuildableFormula *)self tokenAtIndex:a3 previousToken:&v4];
}

- (EDBuildablePtg)tokenAtIndex:(unint64_t)a3 previousToken:(EDBuildablePtg *)a4
{
  unsigned int v5 = 0;
  unsigned int result = self->mTree;
  if (a3 && result)
  {
    unint64_t v8 = 1;
    do
    {
      unsigned int v5 = result;
      unsigned int result = EDBuildablePtg::sibling(result);
      if (v8 >= a3) {
        break;
      }
      ++v8;
    }
    while (result);
  }
  *a4 = v5;
  return result;
}

- (BOOL)fixTableOfConstantsRef:(EDBuildablePtg *)a3
{
  if (!a3) {
    return a3 != 0;
  }
  if (isArea((BOOL)&a3->var1)
    && EDBuildablePtg::isSpanningRef(a3)
    && (int v5 = EDBuildablePtg::minSpan(a3), v5 == EDBuildablePtg::maxSpan(a3)))
  {
    [(EDBuildableFormula *)self shrinkSpanningRef:a3];
  }
  else if (a3->var2 == 66)
  {
    LastExtendedData = XlPtg::getLastExtendedData((XlPtg *)&a3->var1);
    if (LastExtendedData)
    {
      BOOL v7 = *((unsigned __int16 *)LastExtendedData + 2) - 101 < 2;
      goto LABEL_10;
    }
  }
  BOOL v7 = 0;
LABEL_10:
  if (EshGeometryProperties::getSegments((EshGeometryProperties *)a3) && !v7) {
    [(EDBuildableFormula *)self fixTableOfConstantsRef:EshGeometryProperties::getSegments((EshGeometryProperties *)a3)];
  }
  if (EDBuildablePtg::sibling(a3)) {
    [(EDBuildableFormula *)self fixTableOfConstantsRef:EDBuildablePtg::sibling(a3)];
  }
  return a3 != 0;
}

- (BOOL)shrinkSpanningRef:(EDBuildablePtg *)a3
{
  if (a3)
  {
    p_var1 = (XlPtg *)&a3->var1;
    if (isArea((BOOL)&a3->var1) && EDBuildablePtg::isSpanningRef(a3))
    {
      LastExtendedData = XlPtg::getLastExtendedData(p_var1);
      int v6 = EDBuildablePtg::spanningRef(a3);
      BOOL v7 = isArea3D((BOOL)p_var1);
      BOOL v8 = v7;
      if (v6 == 2)
      {
        if (v7) {
          unsigned int v9 = 3;
        }
        else {
          unsigned int v9 = 2;
        }
        __int16 v10 = *(_WORD *)&LastExtendedData[2 * v9] & 0xC000;
        __int16 v11 = EDBuildablePtg::minSpan(a3) | v10;
        unsigned int v12 = v9 + 1;
        *(_WORD *)&LastExtendedData[2 * v9] = v11;
        __int16 v13 = *(_WORD *)&LastExtendedData[2 * v9 + 2] & 0xC000;
        *(_WORD *)&LastExtendedData[2 * v12] = EDBuildablePtg::maxSpan(a3) | v13;
      }
      else
      {
        *(_WORD *)&LastExtendedData[2 * v7] = EDBuildablePtg::minSpan(a3);
        __int16 v14 = EDBuildablePtg::maxSpan(a3);
        uint64_t v15 = 2;
        if (v8) {
          uint64_t v15 = 4;
        }
        *(_WORD *)&LastExtendedData[v15] = v14;
      }
    }
  }
  return 1;
}

- (uint64_t)stringFromStringTokenAtIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

@end