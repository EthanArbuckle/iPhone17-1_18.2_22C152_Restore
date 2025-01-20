@interface CRListItemMarker
+ (id)_detectPredefinedListMarker:(id)a3 fromSet:(id)a4 markerType:(int64_t)a5;
+ (id)bulletsSet;
+ (id)decorativeDecimalsSet;
+ (id)endOfMarkerSet;
+ (id)extendedMarkersSet;
+ (id)hyphensSet;
+ (id)listItemMarkerForText:(id)a3 requiresAdjacentText:(BOOL)a4;
+ (id)nonMarkerNumericConstructSeparatorSet;
+ (id)startOfMarkerSet;
- (BOOL)_canCompositeDecimalBeSucceededByCompositeDecimal:(id)a3;
- (BOOL)canBeSucceededByMarker:(id)a3;
- (CRListItemMarker)initWithType:(int64_t)a3 stringValue:(id)a4 range:(_NSRange)a5 itemizingComponentRange:(_NSRange)a6;
- (NSString)stringValue;
- (_NSRange)itemizingComponentRange;
- (_NSRange)range;
- (id)_valuesFromCompositeDecimal;
- (int64_t)_valueFromDecimal;
- (int64_t)_valueFromDecorativeDecimal;
- (int64_t)_valueFromLowercaseLatin;
- (int64_t)_valueFromUppercaseLatin;
- (int64_t)integerValue;
- (int64_t)type;
- (void)setItemizingComponentRange:(_NSRange)a3;
- (void)setRange:(_NSRange)a3;
- (void)setStringValue:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CRListItemMarker

- (CRListItemMarker)initWithType:(int64_t)a3 stringValue:(id)a4 range:(_NSRange)a5 itemizingComponentRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v8 = a5.length;
  NSUInteger v9 = a5.location;
  id v13 = a4;
  v14 = [(CRListItemMarker *)self init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_stringValue, a4);
    v15->_range.NSUInteger length = v8;
    v15->_itemizingComponentRange.NSUInteger location = location;
    v15->_itemizingComponentRange.NSUInteger length = length;
    v15->_type = a3;
    v15->_range.NSUInteger location = v9;
  }

  return v15;
}

- (BOOL)canBeSucceededByMarker:(id)a3
{
  id v4 = a3;
  v5 = v4;
  int64_t type = self->_type;
  if (!type)
  {
    if (![v4 type])
    {
LABEL_7:
      BOOL v7 = 1;
      goto LABEL_19;
    }
    int64_t type = self->_type;
  }
  if ((unint64_t)(type - 1) <= 1)
  {
    if ([v5 type] == 1 || objc_msgSend(v5, "type") == 2) {
      goto LABEL_7;
    }
    int64_t type = self->_type;
  }
  if (type == [v5 type])
  {
    if (self->_type == 7 && [v5 type] == 7)
    {
      BOOL v7 = [(CRListItemMarker *)self _canCompositeDecimalBeSucceededByCompositeDecimal:v5];
    }
    else
    {
      int64_t v8 = [(CRListItemMarker *)self integerValue];
      uint64_t v9 = [v5 integerValue];
      BOOL v10 = v9 == v8 + 1;
      if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
        BOOL v10 = 0;
      }
      BOOL v7 = v8 != 0x7FFFFFFFFFFFFFFFLL && v10;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_19:

  return v7;
}

- (int64_t)integerValue
{
  switch(self->_type)
  {
    case 3:
      int64_t result = [(CRListItemMarker *)self _valueFromLowercaseLatin];
      break;
    case 4:
      int64_t result = [(CRListItemMarker *)self _valueFromUppercaseLatin];
      break;
    case 5:
      int64_t result = [(CRListItemMarker *)self _valueFromDecimal];
      break;
    case 6:
      int64_t result = [(CRListItemMarker *)self _valueFromDecorativeDecimal];
      break;
    default:
      int64_t result = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }
  return result;
}

+ (id)listItemMarkerForText:(id)a3 requiresAdjacentText:(BOOL)a4
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [a1 bulletsSet];
  int64_t v8 = [a1 _detectPredefinedListMarker:v6 fromSet:v7 markerType:1];

  if (v8) {
    goto LABEL_131;
  }
  uint64_t v9 = [a1 hyphensSet];
  int64_t v8 = [a1 _detectPredefinedListMarker:v6 fromSet:v9 markerType:2];

  if (v8) {
    goto LABEL_131;
  }
  BOOL v10 = [a1 decorativeDecimalsSet];
  int64_t v8 = [a1 _detectPredefinedListMarker:v6 fromSet:v10 markerType:6];

  if (v8) {
    goto LABEL_131;
  }
  v11 = [a1 extendedMarkersSet];
  int64_t v8 = [a1 _detectPredefinedListMarker:v6 fromSet:v11 markerType:0];

  if (v8) {
    goto LABEL_131;
  }
  BOOL v99 = a4;
  v12 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v13 = [v6 componentsSeparatedByCharactersInSet:v12];
  v14 = (void *)[v13 mutableCopy];

  [v14 removeObject:&stru_1F38EED68];
  v15 = [v14 firstObject];
  if (![v15 length])
  {
    int v115 = 0;
    int v112 = 0;
    goto LABEL_49;
  }
  v101 = v14;
  uint64_t v16 = 0;
  unint64_t v107 = 0;
  uint64_t v111 = 0;
  int v112 = 0;
  int v115 = 0;
  unint64_t v17 = 0x8000000000000001;
  unint64_t v18 = 1;
  unint64_t v19 = 1;
  uint64_t v104 = 1;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    int v21 = [v15 characterAtIndex:v18 - 1];
    int v22 = v112;
    if ((v21 - 58) >= 0xFFFFFFF6 && (v112 & 1) == 0)
    {
      if (v19 + 1 == v104) {
        unint64_t v23 = v19 + 1;
      }
      else {
        unint64_t v23 = v19;
      }
      uint64_t v24 = v111;
      if (v23 > 1) {
        uint64_t v24 = 7;
      }
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v24 = 5;
      }
      uint64_t v111 = v24;
      int v25 = v115;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        int v25 = 1;
      }
      int v115 = v25;
      int v112 = 0;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v26 = v18 - 1;
      }
      else {
        unint64_t v26 = v20;
      }
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = v16 + v17 + 1;
      }
      unint64_t v107 = v27;
      if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v19 = v23;
      }
      goto LABEL_43;
    }
    if (!(((v21 - 1642) < 0xFFFFFFF6) | v115 & 1))
    {
      uint64_t v28 = v17 + v18;
      uint64_t v29 = v111;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v29 = 5;
      }
      uint64_t v111 = v29;
      int v115 = 0;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        int v22 = 1;
      }
      int v112 = v22;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v26 = v18 - 1;
      }
      else {
        unint64_t v26 = v20;
      }
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v28 = 1;
      }
      unint64_t v107 = v28;
      goto LABEL_43;
    }
    if (v21 != 46 || (v115 & 1) == 0) {
      break;
    }
    ++v104;
    int v115 = 1;
    unint64_t v26 = v20;
LABEL_43:
    ++v16;
    uint64_t v20 = v26;
    unint64_t v17 = -(uint64_t)v26;
    if (v18++ >= [v15 length]) {
      goto LABEL_45;
    }
  }
  if (v18 - 1 <= 2 && ((v115 | v112) & 1) == 0)
  {
    unint64_t v26 = v20;
    int v115 = 0;
    int v112 = 0;
    goto LABEL_43;
  }
LABEL_45:
  if (v19 > 3)
  {
    int64_t v8 = 0;
    v14 = v101;
    goto LABEL_130;
  }
  v14 = v101;
  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v32 = v20;
    int v36 = 0;
    unint64_t v34 = v107;
    goto LABEL_56;
  }
LABEL_49:
  v31 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  uint64_t v32 = [v15 rangeOfCharacterFromSet:v31];
  unint64_t v34 = v33;

  if (v32 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_129;
  }
  int v35 = [v15 characterAtIndex:v32];
  if ((v35 - 65) < 0x1A)
  {
    int v36 = 1;
    uint64_t v37 = 4;
    goto LABEL_55;
  }
  if ((v35 - 97) > 0x19)
  {
LABEL_129:
    int64_t v8 = 0;
    goto LABEL_130;
  }
  int v36 = 1;
  uint64_t v37 = 3;
LABEL_55:
  uint64_t v111 = v37;
LABEL_56:
  if (v32)
  {
    uint64_t v38 = 0;
    do
    {
      uint64_t v39 = [v15 characterAtIndex:v38];
      v40 = [a1 startOfMarkerSet];
      LOBYTE(v39) = [v40 characterIsMember:v39];

      if ((v39 & 1) == 0) {
        goto LABEL_129;
      }
    }
    while (v32 != ++v38);
  }
  unint64_t v41 = v34 + v32;
  if (v34 + v32 >= [v15 length])
  {
    if ((unint64_t)[v14 count] < 2)
    {
      int v51 = 0;
      uint64_t v49 = 0;
      unint64_t v50 = 1;
      goto LABEL_76;
    }
    int v108 = v36;
    v52 = [v14 objectAtIndexedSubscript:1];
    uint64_t v53 = [v52 characterAtIndex:0];

    v54 = [a1 endOfMarkerSet];
    LODWORD(v53) = [v54 characterIsMember:v53];

    if (v53)
    {
      unint64_t v41 = v34 + v32 + 2;
      int v51 = 1;
      unint64_t v50 = 2;
      uint64_t v49 = 1;
    }
    else
    {
      int v51 = 0;
      uint64_t v49 = 0;
      unint64_t v41 = v34 + v32;
      unint64_t v50 = 1;
    }
LABEL_75:
    int v36 = v108;
    goto LABEL_76;
  }
  int v108 = v36;
  unint64_t v42 = v34 + v32;
  uint64_t v43 = [v15 characterAtIndex:v34 + v32];
  v44 = [a1 endOfMarkerSet];
  int v45 = [v44 characterIsMember:v43];

  if (!v45)
  {
    int v51 = 0;
    uint64_t v49 = 0;
    unint64_t v50 = 1;
    unint64_t v41 = v34 + v32;
    goto LABEL_75;
  }
  v46 = [a1 nonMarkerNumericConstructSeparatorSet];
  if (![v46 characterIsMember:v43])
  {

    uint64_t v49 = 0;
    unint64_t v41 = v42 + 1;
LABEL_74:
    unint64_t v50 = 1;
    int v51 = 1;
    goto LABEL_75;
  }
  unint64_t v41 = v42 + 1;
  unint64_t v47 = [v15 length];

  if (v42 + 1 >= v47)
  {
    uint64_t v49 = 0;
    goto LABEL_74;
  }
  int v48 = [v15 characterAtIndex:v42 + 1];
  int64_t v8 = 0;
  int v36 = v108;
  if ((v48 - 58) >= 0xFFFFFFF6) {
    goto LABEL_130;
  }
  uint64_t v49 = 0;
  unint64_t v50 = 1;
  int v51 = 1;
LABEL_76:
  if (!v99 && ((v36 | v115 | v112) & v51) == 1)
  {
    v55 = [CRListItemMarker alloc];
    uint64_t v56 = objc_msgSend(v6, "substringWithRange:", 0, v41);
    unint64_t v57 = v41;
    v58 = (void *)v56;
    int64_t v8 = -[CRListItemMarker initWithType:stringValue:range:itemizingComponentRange:](v55, "initWithType:stringValue:range:itemizingComponentRange:", v111, v56, 0, v57, v32, v34);

    goto LABEL_130;
  }
  uint64_t v59 = [v15 length];
  if (v41 < [v15 length])
  {
    unint64_t v109 = v34;
    unint64_t v113 = v50;
    v60 = [v14 objectAtIndexedSubscript:v50 - 1];
    uint64_t v61 = [v60 characterAtIndex:v41];

    if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x6000502BB00060, (uint16x4_t)vadd_s16(vdup_n_s16(v61), (int16x4_t)0xCFC028505400CED0))) & 1) == 0&& (unsigned __int16)(v61 - 12448) >= 0x60u&& (v61 & 0xFF00) != 0x1100&& (v61 & 0xFFE0) != 0xA960&& (unsigned __int16)((unsigned __int16)(v61 - 19968) >> 9) >= 0x29u&& (unsigned __int16)((unsigned __int16)(v61 - 13312) >> 6) >= 0x67u)
    {
      uint64_t v105 = v59;
      goto LABEL_87;
    }
LABEL_96:
    unint64_t v70 = v109;
    if (v109 >= 7 && v111 != 7) {
      goto LABEL_129;
    }
    unint64_t v71 = v113 - 1;
    if (v113 - 1 >= [v14 count]) {
      goto LABEL_129;
    }
    uint64_t v100 = v32;
    uint64_t v72 = 0;
    uint64_t v73 = 0;
    while (1)
    {
      if (v72)
      {
        v74 = [v14 objectAtIndexedSubscript:v71 + v72];
        uint64_t v75 = [v74 length];
      }
      else
      {
        v74 = [v14 objectAtIndexedSubscript:v71];
        uint64_t v75 = [v74 length] - v41;
      }

      v73 += v75;
      if (v73 > 2) {
        goto LABEL_138;
      }
      int64_t v8 = 0;
      ++v72;
      if (v71 + v72 >= [v14 count]) {
        goto LABEL_130;
      }
    }
  }
  if ([v14 count] <= v50)
  {
    int v64 = 0;
  }
  else
  {
    int v102 = v51;
    uint64_t v105 = v59;
    unint64_t v65 = v41;
    [v14 objectAtIndexedSubscript:v50];
    v67 = unint64_t v66 = v50;
    unint64_t v68 = [v67 length];

    if (v68 < 2)
    {
      int v64 = 0;
      unint64_t v41 = v65;
      int v51 = v102;
      unint64_t v50 = v66;
    }
    else
    {
      unint64_t v109 = v34;
      unint64_t v113 = v66;
      v69 = [v14 objectAtIndexedSubscript:v66];
      uint64_t v61 = [v69 characterAtIndex:v49];

      unint64_t v41 = v65;
      int v51 = v102;
      if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x6000502BB00060, (uint16x4_t)vadd_s16(vdup_n_s16(v61), (int16x4_t)0xCFC028505400CED0))) & 1) != 0|| (unsigned __int16)(v61 - 12448) < 0x60u|| (v61 & 0xFF00) == 0x1100|| (v61 & 0xFFE0) == 0xA960|| (unsigned __int16)((unsigned __int16)(v61 - 19968) >> 9) < 0x29u|| (unsigned __int16)((unsigned __int16)(v61 - 13312) >> 6) < 0x67u)
      {
        goto LABEL_96;
      }
LABEL_87:
      v62 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
      int v63 = [v62 characterIsMember:v61];

      unint64_t v34 = v109;
      unint64_t v50 = v113;
      int v64 = v63;
    }
    uint64_t v59 = v105;
  }
  if ((unint64_t)[v14 count] < 2
    || v34 >= 7 && v111 != 7
    || (unint64_t)[v14 count] < 2)
  {
    goto LABEL_129;
  }
  int v97 = v64;
  int v103 = v51;
  uint64_t v106 = v59;
  unint64_t v114 = v50;
  unint64_t v98 = v41;
  uint64_t v100 = v32;
  unint64_t v70 = v34;
  v110 = v15;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v76 = v14;
  uint64_t v77 = [v76 countByEnumeratingWithState:&v116 objects:v120 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v117;
LABEL_115:
    uint64_t v80 = 0;
    while (1)
    {
      if (*(void *)v117 != v79) {
        objc_enumerationMutation(v76);
      }
      v81 = *(void **)(*((void *)&v116 + 1) + 8 * v80);
      v82 = [v76 firstObject];

      if (v81 != v82)
      {
        v83 = [MEMORY[0x1E4F28B88] letterCharacterSet];
        char v84 = [v81 _crContainsCharactersInSet:v83];

        if (v84) {
          break;
        }
      }
      if (v78 == ++v80)
      {
        uint64_t v78 = [v76 countByEnumeratingWithState:&v116 objects:v120 count:16];
        if (v78) {
          goto LABEL_115;
        }
        goto LABEL_122;
      }
    }

    v85 = [v76 objectAtIndexedSubscript:v114 - 1];
    if ((unint64_t)[v85 length] < 3)
    {

      v15 = v110;
      unint64_t v41 = v98;
      if ((v115 & 1) == 0)
      {
        if (!v103) {
          goto LABEL_129;
        }
        goto LABEL_138;
      }
    }
    else
    {
      v86 = [v76 objectAtIndexedSubscript:v114 - 1];
      unint64_t v87 = [v86 length];

      v15 = v110;
      unint64_t v41 = v98;
      if ((v115 & 1) == 0)
      {
        if (v87 < 4) {
          char v88 = v103;
        }
        else {
          char v88 = 0;
        }
        if (v88) {
          goto LABEL_138;
        }
        goto LABEL_129;
      }
    }
    int v90 = v97;
    if (v41 != v106) {
      int v90 = 0;
    }
    if (((v103 | v90) & 1) == 0) {
      goto LABEL_129;
    }
LABEL_138:
    v91 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    unint64_t v92 = v41;
    uint64_t v93 = [v6 _crCountConsecutiveCharactersAtIndex:v41 fromSet:v91];

    unint64_t v94 = v93 + v92;
    v95 = [CRListItemMarker alloc];
    v96 = objc_msgSend(v6, "substringWithRange:", 0, v92);
    int64_t v8 = -[CRListItemMarker initWithType:stringValue:range:itemizingComponentRange:](v95, "initWithType:stringValue:range:itemizingComponentRange:", v111, v96, 0, v94, v100, v70);
  }
  else
  {
LABEL_122:

    int64_t v8 = 0;
    v15 = v110;
  }
LABEL_130:

LABEL_131:
  return v8;
}

+ (id)_detectPredefinedListMarker:(id)a3 fromSet:(id)a4 markerType:(int64_t)a5
{
  id v7 = a3;
  if ([v7 rangeOfCharacterFromSet:a4])
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = v8;
    v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v12 = [v7 _crCountConsecutiveCharactersAtIndex:v10 fromSet:v11];

    if (a5 == 6) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v14 = [CRListItemMarker alloc];
    v15 = objc_msgSend(v7, "substringWithRange:", 0, v10);
    uint64_t v9 = -[CRListItemMarker initWithType:stringValue:range:itemizingComponentRange:](v14, "initWithType:stringValue:range:itemizingComponentRange:", a5, v15, 0, v12 + v10, v13, a5 == 6);
  }
  return v9;
}

+ (id)decorativeDecimalsSet
{
  if (qword_1EB58CD78 != -1) {
    dispatch_once(&qword_1EB58CD78, &__block_literal_global_32);
  }
  v2 = (void *)_MergedGlobals_31;
  return v2;
}

void __41__CRListItemMarker_decorativeDecimalsSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳❶❷❸❹❺❻❼❽❾❿➀➁➂➃➄➅➆➇➈➉➊➋➌➍➎➏➐➑➒➓"];
  v1 = (void *)_MergedGlobals_31;
  _MergedGlobals_31 = v0;
}

+ (id)bulletsSet
{
  if (qword_1EB58CD88 != -1) {
    dispatch_once(&qword_1EB58CD88, &__block_literal_global_7);
  }
  v2 = (void *)qword_1EB58CD80;
  return v2;
}

void __30__CRListItemMarker_bulletsSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"●∙•◦°⋅〇◎·・。※"];
  v1 = (void *)qword_1EB58CD80;
  qword_1EB58CD80 = v0;
}

+ (id)hyphensSet
{
  if (qword_1EB58CD98 != -1) {
    dispatch_once(&qword_1EB58CD98, &__block_literal_global_12);
  }
  v2 = (void *)qword_1EB58CD90;
  return v2;
}

void __30__CRListItemMarker_hyphensSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-–－—"];
  v1 = (void *)qword_1EB58CD90;
  qword_1EB58CD90 = v0;
}

+ (id)extendedMarkersSet
{
  if (qword_1EB58CDA8 != -1) {
    dispatch_once(&qword_1EB58CDA8, &__block_literal_global_17_0);
  }
  v2 = (void *)qword_1EB58CDA0;
  return v2;
}

void __38__CRListItemMarker_extendedMarkersSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"*»›>▶"];
  v1 = (void *)qword_1EB58CDA0;
  qword_1EB58CDA0 = v0;
}

+ (id)startOfMarkerSet
{
  if (qword_1EB58CDB8 != -1) {
    dispatch_once(&qword_1EB58CDB8, &__block_literal_global_22);
  }
  v2 = (void *)qword_1EB58CDB0;
  return v2;
}

void __36__CRListItemMarker_startOfMarkerSet__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @"#([");
  v1 = (void *)qword_1EB58CDB0;
  qword_1EB58CDB0 = v0;
}

+ (id)endOfMarkerSet
{
  if (qword_1EB58CDC8 != -1) {
    dispatch_once(&qword_1EB58CDC8, &__block_literal_global_27_0);
  }
  v2 = (void *)qword_1EB58CDC0;
  return v2;
}

void __34__CRListItemMarker_endOfMarkerSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".:]|．。-、"]);;
  v1 = (void *)qword_1EB58CDC0;
  qword_1EB58CDC0 = v0;
}

+ (id)nonMarkerNumericConstructSeparatorSet
{
  if (qword_1EB58CDD8 != -1) {
    dispatch_once(&qword_1EB58CDD8, &__block_literal_global_32);
  }
  v2 = (void *)qword_1EB58CDD0;
  return v2;
}

void __57__CRListItemMarker_nonMarkerNumericConstructSeparatorSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":;-~〜～"];
  v1 = (void *)qword_1EB58CDD0;
  qword_1EB58CDD0 = v0;
}

- (BOOL)_canCompositeDecimalBeSucceededByCompositeDecimal:(id)a3
{
  id v4 = a3;
  v5 = [(CRListItemMarker *)self _valuesFromCompositeDecimal];
  uint64_t v6 = [v4 _valuesFromCompositeDecimal];
  id v7 = (void *)v6;
  char v8 = 0;
  if (!v5 || !v6) {
    goto LABEL_18;
  }
  uint64_t v9 = [v5 count];
  if (v9 != [v7 count] || !objc_msgSend(v5, "count"))
  {
    char v8 = 0;
    goto LABEL_18;
  }
  uint64_t v10 = 0;
  char v11 = 0;
  while (1)
  {
    uint64_t v12 = [v5 objectAtIndexedSubscript:v10];
    uint64_t v13 = [v12 integerValue];

    v14 = [v7 objectAtIndexedSubscript:v10];
    unint64_t v15 = [v14 integerValue];

    if (v15 != v13 + 1)
    {
      if (v11)
      {
        char v11 = 1;
        if (v15 > 1)
        {
          char v17 = 0;
          char v16 = 1;
          goto LABEL_17;
        }
      }
      else
      {
        char v11 = 0;
        char v16 = 0;
        char v17 = 0;
        if (v15 != v13) {
          goto LABEL_17;
        }
      }
      goto LABEL_13;
    }
    char v16 = 1;
    if (v11) {
      break;
    }
    char v11 = 1;
LABEL_13:
    if (++v10 >= (unint64_t)[v5 count])
    {
      char v17 = 1;
      char v16 = v11;
      goto LABEL_17;
    }
  }
  char v17 = 0;
LABEL_17:
  char v8 = v16 & v17;
LABEL_18:

  return v8;
}

- (id)_valuesFromCompositeDecimal
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_type == 7)
  {
    v2 = -[NSString substringWithRange:](self->_stringValue, "substringWithRange:", self->_itemizingComponentRange.location, self->_itemizingComponentRange.length);
    v3 = [v2 componentsSeparatedByString:@"."];

    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "length", (void)v14))
          {
            uint64_t v11 = [v10 integerValue];
            uint64_t v12 = [NSNumber numberWithInteger:v11];
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (int64_t)_valueFromDecorativeDecimal
{
  int64_t type = self->_type;
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (type == 6)
  {
    NSUInteger location = self->_itemizingComponentRange.location;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = -[NSString substringWithRange:](self->_stringValue, "substringWithRange:", location, self->_itemizingComponentRange.length);
      int v7 = [v6 characterAtIndex:0];

      if ((v7 - 9312) > 0x13)
      {
        if ((v7 - 10102) > 9)
        {
          if ((v7 - 10112) > 9)
          {
            if ((v7 - 10122) > 9) {
              return 0x7FFFFFFFFFFFFFFFLL;
            }
            int v8 = -10121;
          }
          else
          {
            int v8 = -10111;
          }
        }
        else
        {
          int v8 = -10101;
        }
      }
      else
      {
        int v8 = -9311;
      }
      return (v7 + v8);
    }
  }
  return result;
}

- (int64_t)_valueFromDecimal
{
  if (self->_type != 5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger location = self->_itemizingComponentRange.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = -[NSString substringWithRange:](self->_stringValue, "substringWithRange:", location, self->_itemizingComponentRange.length);
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (int64_t)_valueFromLowercaseLatin
{
  int64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_type == 3)
  {
    NSUInteger location = self->_itemizingComponentRange.location;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v4 = -[NSString substringWithRange:](self->_stringValue, "substringWithRange:", location, self->_itemizingComponentRange.length);
      unsigned int v5 = [v4 characterAtIndex:0];

      return v5 - 97;
    }
  }
  return v2;
}

- (int64_t)_valueFromUppercaseLatin
{
  int64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_type == 4)
  {
    NSUInteger location = self->_itemizingComponentRange.location;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v4 = -[NSString substringWithRange:](self->_stringValue, "substringWithRange:", location, self->_itemizingComponentRange.length);
      unsigned int v5 = [v4 characterAtIndex:0];

      return v5 - 65;
    }
  }
  return v2;
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStringValue:(id)a3
{
}

- (_NSRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (_NSRange)itemizingComponentRange
{
  objc_copyStruct(v4, &self->_itemizingComponentRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (void)setItemizingComponentRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_itemizingComponentRange, &v3, 16, 1, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void).cxx_destruct
{
}

@end