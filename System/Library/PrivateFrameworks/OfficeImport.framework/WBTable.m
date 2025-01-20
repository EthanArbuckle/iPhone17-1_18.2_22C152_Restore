@interface WBTable
+ (BOOL)isTableFloating:(const void *)a3 tracked:(const void *)a4;
+ (BOOL)tryToReadRowFrom:(id)a3 textRuns:(id)a4 to:(id)a5;
+ (void)initPropertiesFrom:(id)a3 to:(id)a4 in:(id)a5;
+ (void)readFrom:(id)a3 textRuns:(id)a4 table:(id)a5;
+ (void)readRowFrom:(id)a3 textRuns:(id)a4 to:(id)a5;
@end

@implementation WBTable

+ (void)readFrom:(id)a3 textRuns:(id)a4 table:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  id v8 = a5;
  +[WBTable initPropertiesFrom:v7 to:v8 in:v9];
  +[WBTable readRowFrom:v9 textRuns:v7 to:v8];
}

+ (void)initPropertiesFrom:(id)a3 to:(id)a4 in:(id)a5
{
  id v16 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v16 lastObject];
  uint64_t v10 = [v9 pointerValue];

  uint64_t v11 = *(void *)(v10 + 40);
  uint64_t v12 = *(void *)(v10 + 48);
  v13 = [v7 properties];
  +[WBTableProperties readFrom:v8 wrdProperties:v11 tracked:v12 properties:v13];
  [v13 setResolveMode:0];
  [v13 clearShading];
  [v13 setResolveMode:1];
  [v13 clearShading];
  [v13 setResolveMode:2];
  if ((unint64_t)[v16 count] >= 2)
  {
    v14 = [v16 objectAtIndex:0];
    uint64_t v15 = [v14 pointerValue];

    [v8 setLastRowParagraphProperties:(*(uint64_t (**)(void))(**(void **)(v15 + 24) + 24))(*(void *)(v15 + 24))];
  }
}

+ (void)readRowFrom:(id)a3 textRuns:(id)a4 to:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 addRow];
  +[WBTableRow readFrom:textRuns:to:index:row:](WBTableRow, "readFrom:textRuns:to:index:row:", v10, v7, v8, [v8 rowCount], v9);
}

+ (BOOL)tryToReadRowFrom:(id)a3 textRuns:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 lastObject];
  uint64_t v12 = [v11 pointerValue];

  uint64_t v13 = *(void *)(v12 + 40);
  uint64_t v14 = *(void *)(v12 + 48);
  uint64_t v15 = [v10 properties];
  int v16 = [v15 isBaseStyleOverridden];
  if ((*(_DWORD *)(v14 + 24) & 0x10000000) != 0) {
    uint64_t v17 = v14;
  }
  else {
    uint64_t v17 = v13;
  }
  if ((*(_DWORD *)(v17 + 24) & 0x10000000) != 0) {
    int v18 = 0;
  }
  else {
    int v18 = v16 ^ 1;
  }
  if (((v16 ^ 1) & 1) == 0 && (*(_DWORD *)(v17 + 24) & 0x10000000) != 0)
  {
    v19 = [v8 styleAtIndex:*(unsigned __int16 *)(v17 + 328) expectedType:3];
    v20 = [v15 baseStyle];
    int v18 = v19 == v20;
  }
  uint64_t v21 = [v8 lastRowParagraphProperties];
  if (!v18) {
    goto LABEL_81;
  }
  uint64_t v22 = v21;
  if (([a1 isTableFloating:v13 tracked:v14] & 1) == 0
    && ([v15 isTableFloating] & 1) == 0)
  {
    if (!v22 || (unint64_t)[v9 count] < 2) {
      goto LABEL_58;
    }
    v26 = [v9 objectAtIndex:0];
    uint64_t v27 = [v26 pointerValue];

    uint64_t v28 = *(void *)(v27 + 24);
    uint64_t v29 = *(void *)(v28 + 16);
    uint64_t v30 = *(void *)(v22 + 16);
    if ((v29 & 0x2000000) != 0)
    {
      if ((v30 & 0x2000000) == 0 || *(unsigned __int8 *)(v28 + 298) != *(unsigned __int8 *)(v22 + 298)) {
        goto LABEL_81;
      }
    }
    else if ((v30 & 0x2000000) != 0)
    {
      goto LABEL_81;
    }
    if ((v29 & 0x200000) != 0)
    {
      if ((v30 & 0x200000) == 0 || *(_DWORD *)(v28 + 228) != *(_DWORD *)(v22 + 228)) {
        goto LABEL_81;
      }
    }
    else if ((v30 & 0x200000) != 0)
    {
      goto LABEL_81;
    }
    if ((v29 & 0x800000) != 0)
    {
      if ((v30 & 0x800000) == 0 || *(_DWORD *)(v28 + 152) != *(_DWORD *)(v22 + 152)) {
        goto LABEL_81;
      }
    }
    else if ((v30 & 0x800000) != 0)
    {
      goto LABEL_81;
    }
    if ((v29 & 0x100000) != 0)
    {
      if ((v30 & 0x100000) == 0 || *(_DWORD *)(v28 + 224) != *(_DWORD *)(v22 + 224)) {
        goto LABEL_81;
      }
    }
    else if ((v30 & 0x100000) != 0)
    {
      goto LABEL_81;
    }
    if ((v29 & 0x1000000) != 0)
    {
      if ((v30 & 0x1000000) != 0 && *(_DWORD *)(v28 + 156) == *(_DWORD *)(v22 + 156)) {
        goto LABEL_58;
      }
    }
    else if ((v30 & 0x1000000) == 0)
    {
LABEL_58:
      [a1 readRowFrom:v8 textRuns:v9 to:v10];
      BOOL v39 = 1;
      goto LABEL_82;
    }
LABEL_81:
    BOOL v39 = 0;
    goto LABEL_82;
  }
  if ((*(void *)(v14 + 16) & 0x400000000000) != 0) {
    uint64_t v23 = v14;
  }
  else {
    uint64_t v23 = v13;
  }
  if ((*(void *)(v23 + 16) & 0x400000000000) != 0) {
    goto LABEL_19;
  }
  if ([v15 isVerticalPositionOverridden])
  {
    if ((*(void *)(v23 + 16) & 0x400000000000) == 0)
    {
LABEL_21:
      BOOL v25 = 0;
      goto LABEL_28;
    }
LABEL_19:
    if ([v15 isVerticalPositionOverridden])
    {
      uint64_t v24 = *(int *)(v23 + 308);
      BOOL v25 = [v15 verticalPosition] == v24;
      goto LABEL_28;
    }
    goto LABEL_21;
  }
  BOOL v25 = 1;
LABEL_28:
  if ((*(void *)(v14 + 16) & 0x8000000000) != 0) {
    uint64_t v31 = v14;
  }
  else {
    uint64_t v31 = v13;
  }
  if ((*(void *)(v31 + 16) & 0x8000000000) != 0) {
    goto LABEL_34;
  }
  if ([v15 isVerticalAnchorOverridden])
  {
    if ((*(void *)(v31 + 16) & 0x8000000000) == 0)
    {
LABEL_36:
      BOOL v33 = 0;
      goto LABEL_38;
    }
LABEL_34:
    if ([v15 isVerticalAnchorOverridden])
    {
      int v32 = *(_DWORD *)(v31 + 228);
      BOOL v33 = v32 == [v15 verticalAnchor];
      goto LABEL_38;
    }
    goto LABEL_36;
  }
  BOOL v33 = 1;
LABEL_38:
  if ((*(void *)(v14 + 16) & 0x200000000000) != 0) {
    uint64_t v34 = v14;
  }
  else {
    uint64_t v34 = v13;
  }
  if ((*(void *)(v34 + 16) & 0x200000000000) != 0) {
    goto LABEL_44;
  }
  if ([v15 isHorizontalPositionOverridden])
  {
    if ((*(void *)(v34 + 16) & 0x200000000000) == 0)
    {
LABEL_46:
      BOOL v36 = 0;
      goto LABEL_48;
    }
LABEL_44:
    if ([v15 isHorizontalPositionOverridden])
    {
      uint64_t v35 = *(int *)(v34 + 304);
      BOOL v36 = [v15 horizontalPosition] == v35;
      goto LABEL_48;
    }
    goto LABEL_46;
  }
  BOOL v36 = 1;
LABEL_48:
  if ((*(void *)(v14 + 16) & 0x10000000000) != 0) {
    uint64_t v13 = v14;
  }
  if ((*(void *)(v13 + 16) & 0x10000000000) == 0)
  {
    if (![v15 isHorizontalAnchorOverridden])
    {
      BOOL v38 = 1;
      goto LABEL_56;
    }
    if ((*(void *)(v13 + 16) & 0x10000000000) == 0) {
      goto LABEL_81;
    }
  }
  if (![v15 isHorizontalAnchorOverridden]) {
    goto LABEL_81;
  }
  int v37 = *(_DWORD *)(v13 + 232);
  BOOL v38 = v37 == [v15 horizontalAnchor];
LABEL_56:
  BOOL v39 = 0;
  if (v25 && v33 && v36 && v38) {
    goto LABEL_58;
  }
LABEL_82:

  return v39;
}

+ (BOOL)isTableFloating:(const void *)a3 tracked:(const void *)a4
{
  uint64_t v4 = *((void *)a4 + 2);
  if ((v4 & 0x10000000000) != 0)
  {
    if (*((_DWORD *)a4 + 58)) {
      return 1;
    }
  }
  else if ((*((void *)a3 + 2) & 0x10000000000) != 0 && *((_DWORD *)a3 + 58))
  {
    return 1;
  }
  if ((v4 & 0x8000000000) != 0)
  {
    int v5 = *((_DWORD *)a4 + 57);
  }
  else
  {
    if ((*((void *)a3 + 2) & 0x8000000000) == 0) {
      goto LABEL_11;
    }
    int v5 = *((_DWORD *)a3 + 57);
  }
  if (v5 != 2) {
    return 1;
  }
LABEL_11:
  if ((v4 & 0x200000000000) != 0)
  {
    if (!*((_DWORD *)a4 + 76)) {
      goto LABEL_14;
    }
    return 1;
  }
  if ((*((void *)a3 + 2) & 0x200000000000) != 0 && *((_DWORD *)a3 + 76)) {
    return 1;
  }
LABEL_14:
  BOOL result = ((v4 & 0x400000000000) != 0 || (a4 = a3, (*((void *)a3 + 2) & 0x400000000000) != 0))
        && *((_DWORD *)a4 + 77) != 0;
  return result;
}

@end