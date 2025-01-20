@interface EXConditionalFormattingRule
+ (id)conditionalFormattingRuleTypeEnumMap;
+ (id)operatorStringEnumMap;
+ (id)timePeriodEnumMap;
+ (int)edOperatorFromXmlOperatorString:(id)a3;
+ (int)edRuleTypeFromXmlRuleTypeString:(id)a3;
+ (int)edTimePeriodFromXmlTimePeriodString:(id)a3;
+ (void)readFrom:(_xmlNode *)a3 x14:(BOOL)a4 edConditionalFormatting:(id)a5 edReference:(id)a6 state:(id)a7;
@end

@implementation EXConditionalFormattingRule

+ (id)timePeriodEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_23, 0, &dword_238A75000);
  }
  if (+[EXConditionalFormattingRule timePeriodEnumMap]::once != -1) {
    dispatch_once(&+[EXConditionalFormattingRule timePeriodEnumMap]::once, &__block_literal_global_73);
  }
  v2 = (void *)+[EXConditionalFormattingRule timePeriodEnumMap]::sTimePeriodEnumMap;
  return v2;
}

void __48__EXConditionalFormattingRule_timePeriodEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXConditionalFormattingRule timePeriodEnumMap]::sTimePeriodStructs count:11 caseSensitive:1];
  v1 = (void *)+[EXConditionalFormattingRule timePeriodEnumMap]::sTimePeriodEnumMap;
  +[EXConditionalFormattingRule timePeriodEnumMap]::sTimePeriodEnumMap = (uint64_t)v0;
}

+ (id)operatorStringEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_68_0, 0, &dword_238A75000);
  }
  if (+[EXConditionalFormattingRule operatorStringEnumMap]::once != -1) {
    dispatch_once(&+[EXConditionalFormattingRule operatorStringEnumMap]::once, &__block_literal_global_70);
  }
  v2 = (void *)+[EXConditionalFormattingRule operatorStringEnumMap]::sOperatorStringEnumMap;
  return v2;
}

void __52__EXConditionalFormattingRule_operatorStringEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXConditionalFormattingRule operatorStringEnumMap]::sOperatorStringStructs count:13 caseSensitive:1];
  v1 = (void *)+[EXConditionalFormattingRule operatorStringEnumMap]::sOperatorStringEnumMap;
  +[EXConditionalFormattingRule operatorStringEnumMap]::sOperatorStringEnumMap = (uint64_t)v0;
}

+ (id)conditionalFormattingRuleTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_116_0, 0, &dword_238A75000);
  }
  if (+[EXConditionalFormattingRule conditionalFormattingRuleTypeEnumMap]::once != -1) {
    dispatch_once(&+[EXConditionalFormattingRule conditionalFormattingRuleTypeEnumMap]::once, &__block_literal_global_118);
  }
  v2 = (void *)+[EXConditionalFormattingRule conditionalFormattingRuleTypeEnumMap]::sConditionalFormattingRuleTypeEnumMap;
  return v2;
}

void __67__EXConditionalFormattingRule_conditionalFormattingRuleTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXConditionalFormattingRule conditionalFormattingRuleTypeEnumMap]::sConditionalFormattingRuleTypeStructs count:19 caseSensitive:1];
  v1 = (void *)+[EXConditionalFormattingRule conditionalFormattingRuleTypeEnumMap]::sConditionalFormattingRuleTypeEnumMap;
  +[EXConditionalFormattingRule conditionalFormattingRuleTypeEnumMap]::sConditionalFormattingRuleTypeEnumMap = (uint64_t)v0;
}

+ (void)readFrom:(_xmlNode *)a3 x14:(BOOL)a4 edConditionalFormatting:(id)a5 edReference:(id)a6 state:(id)a7
{
  BOOL v40 = a4;
  id v11 = a5;
  id v41 = a6;
  id v12 = a7;
  v13 = v12;
  if (!a3) {
    goto LABEL_47;
  }
  v14 = [v12 resources];
  v15 = +[EDConditionalFormattingRule conditionalFormattingRuleWithResources:v14];

  [v11 addRule:v15];
  id v49 = 0;
  CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"type", &v49);
  id v16 = v49;
  uint64_t v17 = [a1 edRuleTypeFromXmlRuleTypeString:v16];
  [v15 setType:v17];
  if (!v17) {
    goto LABEL_46;
  }
  id v39 = v11;
  id v48 = 0;
  id v37 = v16;
  BOOL v18 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"operator", &v48);
  id v19 = v48;
  if (v18)
  {
    uint64_t v20 = [a1 edOperatorFromXmlOperatorString:v19];
  }
  else if ((int)v17 > 10)
  {
    if (v17 == 11)
    {
      uint64_t v20 = 12;
    }
    else
    {
      if (v17 != 15) {
        goto LABEL_6;
      }
      uint64_t v20 = 13;
    }
  }
  else if (v17 == 4)
  {
    uint64_t v20 = 10;
  }
  else
  {
    if (v17 != 8) {
      goto LABEL_6;
    }
    uint64_t v20 = 11;
  }
  [v15 setOperatorEnum:v20];
LABEL_6:
  uint64_t v47 = 0;
  id v38 = v19;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"priority", &v47)) {
    [v15 setPriority:v47];
  }
  BOOL v46 = 0;
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"stopIfTrue", &v46)) {
    [v15 setStopIfTrue:v46];
  }
  id v36 = a1;
  if (v40)
  {
    v21 = (CXNamespace *)(id)EXMainNamespace;
    v22 = "f";
  }
  else
  {
    v21 = [v13 EXSpreadsheetMLNamespace];
    v22 = "formula";
  }
  Child = (_xmlNode *)OCXFindChild(a3, v21, v22);
  char v24 = 1;
  while (1)
  {
    char v25 = v24;
    if (Child) {
      break;
    }
LABEL_23:
    char v24 = 0;
    if ((v25 & 1) == 0) {
      goto LABEL_24;
    }
  }
  uint64_t v26 = objc_opt_class();
  v27 = +[EXFormula edFormulaFromXmlFormulaElement:Child formulaClass:objc_opt_class() state:v13];
  v28 = TSUDynamicCast(v26, (uint64_t)v27);

  if (v28)
  {
    objc_msgSend(v28, "setRowBaseOrOffset:", objc_msgSend(v41, "firstRow"));
    objc_msgSend(v28, "setColumnBaseOrOffset:", objc_msgSend(v41, "firstColumn"));
    [v28 setForceNonBaseFormula:1];
    [v28 convertTokensToShared];
    v29 = [v13 currentSheet];
    [v15 addFormula:v28 worksheet:v29];
  }
  if (v25)
  {
    Child = OCXFindNextChild(Child, v21, (xmlChar *)v22);
    goto LABEL_23;
  }
LABEL_24:
  if (v40)
  {
    id v16 = v37;
    v30 = v38;
    v31 = +[EXDifferentialStyle edDifferentialStyleFromXmlDifferentialStyleElement:OCXFindChild(a3, (CXNamespace *)EXXL2010Namespace, "dxf") state:v13];
    [v15 setDifferentialStyle:v31];
  }
  else
  {
    unint64_t v45 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dxfId", (uint64_t *)&v45)) {
      [v15 setDifferentialStyleIndex:v45];
    }
    id v16 = v37;
    v30 = v38;
  }
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"aboveAverage", &v46)) {
    [v15 setAboveAverage:v46];
  }
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bottom", &v46)) {
    [v15 setBottom:v46];
  }
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"equalAverage", &v46)) {
    [v15 setEqualAverage:v46];
  }
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"percent", &v46)) {
    [v15 setPercent:v46];
  }
  unint64_t v45 = 0;
  if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rank", &v45)) {
    [v15 setRank:v45];
  }
  uint64_t v44 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"stdDev", &v44)) {
    [v15 setStdDev:v44];
  }
  id v43 = 0;
  BOOL v32 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"text", &v43);
  id v33 = v43;
  if (v32) {
    [v15 setText:v33];
  }
  id v42 = 0;
  BOOL v34 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"timePeriod", &v42);
  id v35 = v42;
  if (v34) {
    objc_msgSend(v15, "setTimePeriod:", objc_msgSend(v36, "edTimePeriodFromXmlTimePeriodString:", v35));
  }

  id v11 = v39;
LABEL_46:

LABEL_47:
}

+ (int)edRuleTypeFromXmlRuleTypeString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 conditionalFormattingRuleTypeEnumMap];
    uint64_t v6 = [v5 valueForString:v4];

    if (v6 == 9 || v6 == 5 || v6 == 12) {
      int v9 = 0;
    }
    else {
      int v9 = v6;
    }
    if (v6 == -130883970) {
      int v10 = 0;
    }
    else {
      int v10 = v9;
    }
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

+ (int)edOperatorFromXmlOperatorString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 operatorStringEnumMap];
    uint64_t v6 = [v5 valueForString:v4];

    if (v6 == -130883970) {
      int v7 = 1;
    }
    else {
      int v7 = v6;
    }
  }
  else
  {
    int v7 = 1;
  }

  return v7;
}

+ (int)edTimePeriodFromXmlTimePeriodString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 timePeriodEnumMap];
    uint64_t v6 = [v5 valueForString:v4];

    if (v6 == -130883970) {
      int v7 = 1;
    }
    else {
      int v7 = v6;
    }
  }
  else
  {
    int v7 = 1;
  }

  return v7;
}

@end