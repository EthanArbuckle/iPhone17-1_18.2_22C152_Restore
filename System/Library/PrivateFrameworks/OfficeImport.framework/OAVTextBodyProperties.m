@interface OAVTextBodyProperties
+ (int)readAnchor:(id)a3;
+ (int)readRotation:(id)a3;
+ (int)readWrapStyle:(id)a3;
+ (unsigned)flowTypeWithLayoutFlowString:(id)a3 altLayoutFlowString:(id)a4;
+ (void)readFromManager:(id)a3 toShape:(id)a4 state:(id)a5;
@end

@implementation OAVTextBodyProperties

+ (void)readFromManager:(id)a3 toShape:(id)a4 state:(id)a5
{
  id v31 = a3;
  id v8 = a5;
  v9 = [a4 textBody];
  v10 = [v9 properties];

  int v11 = objc_msgSend((id)objc_msgSend(v8, "client"), "vmlSupportLevel");
  [v31 textInsets];
  int v13 = v12;
  int v15 = v14;
  int v17 = v16;
  objc_msgSend(v10, "setLeftInset:");
  LODWORD(v18) = v13;
  [v10 setTopInset:v18];
  LODWORD(v19) = v15;
  [v10 setRightInset:v19];
  LODWORD(v20) = v17;
  [v10 setBottomInset:v20];
  [v10 setIsUpright:v11 != 2];
  if (v11 == 2)
  {
    v22 = [v31 textRotation];
    uint64_t v21 = [a1 readRotation:v22];
  }
  else
  {
    uint64_t v21 = 0;
  }
  +[OABTextBodyProperties setTextRotation:v21 textBodyProperties:v10];
  v23 = [v31 textLayoutFlow];
  v24 = [v31 textAltLayoutFlow];
  objc_msgSend(v10, "setFlowType:", objc_msgSend(a1, "flowTypeWithLayoutFlowString:altLayoutFlowString:", v23, v24));
  +[OABTextBodyProperties setAutoFit:textBodyProperties:](OABTextBodyProperties, "setAutoFit:textBodyProperties:", [v31 fitShapeToText], v10);
  if (v11 == 2)
  {
    v26 = [v31 textWrapStyle];
    uint64_t v25 = [a1 readWrapStyle:v26];
  }
  else
  {
    uint64_t v25 = 0;
  }
  +[OABTextBodyProperties setWrap:v25 textBodyProperties:v10];
  if (v11 < 1)
  {
    uint64_t v30 = 0;
  }
  else
  {
    v27 = [v31 textAnchor];
    int v28 = [a1 readAnchor:v27];
    if (v28 > 2 && v11 == 1) {
      uint64_t v30 = 0;
    }
    else {
      uint64_t v30 = v28;
    }
  }
  +[OABTextBodyProperties setTextAnchor:v30 textBodyProperties:v10];
  +[OABTextBodyProperties setIsAnchorCenter:v30 textBodyProperties:v10];
}

+ (unsigned)flowTypeWithLayoutFlowString:(id)a3 altLayoutFlowString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"vertical"])
  {
    if ([v6 isEqualToString:@"top-to-bottom"])
    {
      unsigned __int8 v7 = 4;
      goto LABEL_13;
    }
    if ([v6 isEqualToString:@"bottom-to-top"])
    {
      unsigned __int8 v7 = 3;
      goto LABEL_13;
    }
    if (![v6 length])
    {
      unsigned __int8 v7 = 2;
      goto LABEL_13;
    }
  }
  [v6 length];
  if ([v5 isEqualToString:@"vertical-ideographic"])
  {
    unsigned __int8 v7 = 6;
  }
  else if ([v5 isEqualToString:@"horizontal-ideographic"])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    [v5 isEqualToString:@"horizontal"];
    unsigned __int8 v7 = 0;
  }
LABEL_13:

  return v7;
}

+ (int)readAnchor:(id)a3
{
  id v3 = a3;
  v4 = (void *)+[OAVTextBodyProperties readAnchor:]::anchorEnumMap;
  if (!+[OAVTextBodyProperties readAnchor:]::anchorEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_56, 0, &dword_238A75000);
    }
    id v5 = [[TCEnumerationMap alloc] initWithStructs:&+[OAVTextBodyProperties readAnchor:]::anchorEnumStructs count:10 caseSensitive:0];
    id v6 = (void *)+[OAVTextBodyProperties readAnchor:]::anchorEnumMap;
    +[OAVTextBodyProperties readAnchor:]::anchorEnumMap = (uint64_t)v5;

    v4 = (void *)+[OAVTextBodyProperties readAnchor:]::anchorEnumMap;
  }
  int v7 = [v4 valueForString:v3];

  return v7;
}

+ (int)readRotation:(id)a3
{
  id v3 = a3;
  v4 = (void *)+[OAVTextBodyProperties readRotation:]::rotationEnumMap;
  if (!+[OAVTextBodyProperties readRotation:]::rotationEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_18, 0, &dword_238A75000);
    }
    id v5 = [[TCEnumerationMap alloc] initWithStructs:&+[OAVTextBodyProperties readRotation:]::rotationEnumStructs count:4 caseSensitive:0];
    id v6 = (void *)+[OAVTextBodyProperties readRotation:]::rotationEnumMap;
    +[OAVTextBodyProperties readRotation:]::rotationEnumMap = (uint64_t)v5;

    v4 = (void *)+[OAVTextBodyProperties readRotation:]::rotationEnumMap;
  }
  int v7 = [v4 valueForString:v3];

  return v7;
}

+ (int)readWrapStyle:(id)a3
{
  id v3 = a3;
  v4 = (void *)+[OAVTextBodyProperties readWrapStyle:]::wrapEnumMap;
  if (!+[OAVTextBodyProperties readWrapStyle:]::wrapEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_25, 0, &dword_238A75000);
    }
    id v5 = [[TCEnumerationMap alloc] initWithStructs:&+[OAVTextBodyProperties readWrapStyle:]::wrapEnumStructs count:5 caseSensitive:0];
    id v6 = (void *)+[OAVTextBodyProperties readWrapStyle:]::wrapEnumMap;
    +[OAVTextBodyProperties readWrapStyle:]::wrapEnumMap = (uint64_t)v5;

    v4 = (void *)+[OAVTextBodyProperties readWrapStyle:]::wrapEnumMap;
  }
  int v7 = [v4 valueForString:v3];

  return v7;
}

@end