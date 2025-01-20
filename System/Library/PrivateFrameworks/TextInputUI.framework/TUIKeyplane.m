@interface TUIKeyplane
+ (BOOL)isSixRowLayout:(id)a3;
+ (CGSize)sizeBasisForLayoutClass:(int64_t)a3;
+ (CGSize)sizeFromScreenTraits:(id)a3 layout:(id)a4 layoutClass:(int64_t)a5;
+ (double)baseHeightForLayout:(id)a3 layoutClass:(int64_t)a4 landscape:(BOOL)a5;
+ (id)keyplaneFromKBTree:(id)a3;
+ (id)keyplaneFromKBTree:(id)a3 withType:(int64_t)a4;
+ (int64_t)defaultEffectsType;
+ (int64_t)layoutClassFromKeyplaneName:(id)a3;
+ (int64_t)layoutClassFromScreenDimensions:(CGSize)a3;
- (BOOL)hasSimilarLayoutToKeyplane:(id)a3;
- (BOOL)isGridLayout;
- (BOOL)needsResetFromKeyplane:(id)a3;
- (BOOL)shouldDuplicateKey:(id)a3 forRow:(id)a4;
- (BOOL)variantTypeIncludesSpaceBar:(int64_t)a3;
- (CGSize)leftSplitSize;
- (CGSize)rightSplitSize;
- (NSArray)defaultKeysByRow;
- (NSArray)orderedKeysByRow;
- (NSArray)variantKeysByRow;
- (NSMutableDictionary)cache;
- (NSMutableDictionary)doubleHeightKeys;
- (NSString)name;
- (NSString)prefix;
- (TUIKeyplane)init;
- (UIKBTree)fullTree;
- (UIKBTree)keylayout;
- (double)finalHeightForSplitKeyboard;
- (double)finalSplitSizeForRightSide:(BOOL)a3;
- (double)heightMultiplierForRowNumber:(unint64_t)a3;
- (double)multiplierForKey:(id)a3 withProperties:(id)a4;
- (id)createPreparedKeyFromTree:(id)a3 withMultiplier:(double)a4 type:(int64_t)a5 shape:(int64_t)a6;
- (id)defaultKeysOrderedByRowForKeyplane:(id)a3;
- (id)defaultRowSet;
- (id)description;
- (id)duplicateTreeForSplitMode:(id)a3;
- (id)findRowSpanningDuplicatesForKeyplane:(id)a3;
- (id)keyRowFromTreeRow:(id)a3 rowNumber:(unint64_t)a4 type:(int64_t)a5;
- (id)keysForName:(id)a3;
- (id)rowSetForType:(int64_t)a3;
- (id)rowsForKeyboardType:(int64_t)a3;
- (id)sortedKeysForKeyplane:(id)a3;
- (id)stringFromKeyboardType:(int64_t)a3;
- (id)stringFromLayoutClass:(int64_t)a3;
- (id)stringFromLayoutStyle:(int64_t)a3;
- (id)stringFromLayoutType:(int64_t)a3;
- (int64_t)currentVariantType;
- (int64_t)effectsType;
- (int64_t)indexOfLastRow;
- (int64_t)keyLayoutStyle;
- (int64_t)keyStyleForLayoutClass:(int64_t)a3;
- (int64_t)layoutClass;
- (int64_t)layoutType;
- (unint64_t)numberOfKeys;
- (unint64_t)numberOfRows;
- (void)setCache:(id)a3;
- (void)setCurrentVariantType:(int64_t)a3;
- (void)setDefaultKeysByRow:(id)a3;
- (void)setDoubleHeightKeys:(id)a3;
- (void)setEffectsType:(int64_t)a3;
- (void)setFullTree:(id)a3;
- (void)setIndexOfLastRow:(int64_t)a3;
- (void)setKeylayout:(id)a3;
- (void)setLayoutClass:(int64_t)a3;
- (void)setLayoutType:(int64_t)a3;
- (void)setLeftSplitSize:(CGSize)a3;
- (void)setRightSplitSize:(CGSize)a3;
- (void)setVariantKeysByRow:(id)a3;
- (void)updateKeyboardType:(int64_t)a3;
@end

@implementation TUIKeyplane

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleHeightKeys, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_keylayout, 0);
  objc_storeStrong((id *)&self->_fullTree, 0);
  objc_storeStrong((id *)&self->_variantKeysByRow, 0);
  objc_storeStrong((id *)&self->_defaultKeysByRow, 0);
}

- (void)setRightSplitSize:(CGSize)a3
{
  self->_rightSplitSize = a3;
}

- (CGSize)rightSplitSize
{
  double width = self->_rightSplitSize.width;
  double height = self->_rightSplitSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLeftSplitSize:(CGSize)a3
{
  self->_leftSplitSize = a3;
}

- (CGSize)leftSplitSize
{
  double width = self->_leftSplitSize.width;
  double height = self->_leftSplitSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIndexOfLastRow:(int64_t)a3
{
  self->_indexOfLastRow = a3;
}

- (int64_t)indexOfLastRow
{
  return self->_indexOfLastRow;
}

- (void)setDoubleHeightKeys:(id)a3
{
}

- (NSMutableDictionary)doubleHeightKeys
{
  return self->_doubleHeightKeys;
}

- (void)setCache:(id)a3
{
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setKeylayout:(id)a3
{
}

- (UIKBTree)keylayout
{
  return self->_keylayout;
}

- (void)setFullTree:(id)a3
{
}

- (UIKBTree)fullTree
{
  return self->_fullTree;
}

- (void)setVariantKeysByRow:(id)a3
{
}

- (NSArray)variantKeysByRow
{
  return self->_variantKeysByRow;
}

- (void)setDefaultKeysByRow:(id)a3
{
}

- (NSArray)defaultKeysByRow
{
  return self->_defaultKeysByRow;
}

- (void)setCurrentVariantType:(int64_t)a3
{
  self->_currentVariantType = a3;
}

- (int64_t)currentVariantType
{
  return self->_currentVariantType;
}

- (void)setEffectsType:(int64_t)a3
{
  self->_effectsType = a3;
}

- (int64_t)effectsType
{
  return self->_effectsType;
}

- (void)setLayoutClass:(int64_t)a3
{
  self->_layoutClass = a3;
}

- (int64_t)layoutClass
{
  return self->_layoutClass;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TUIKeyplane *)self fullTree];
  v6 = [v5 name];
  v7 = [(TUIKeyplane *)self stringFromLayoutClass:[(TUIKeyplane *)self layoutClass]];
  v8 = [(TUIKeyplane *)self stringFromLayoutType:[(TUIKeyplane *)self layoutType]];
  v9 = [(TUIKeyplane *)self stringFromLayoutStyle:[(TUIKeyplane *)self keyLayoutStyle]];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p> name = %@; size class = %@; layout type = %@; key style = %@; number of rows = %li",
    v4,
    self,
    v6,
    v7,
    v8,
    v9,
  v10 = [(TUIKeyplane *)self numberOfRows]);

  return v10;
}

- (id)stringFromLayoutClass:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"Unknown";
  }
  else {
    return *(&off_1E5593700 + a3);
  }
}

- (id)stringFromLayoutStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return *(&off_1E55936E0 + a3);
  }
}

- (id)stringFromLayoutType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return *(&off_1E55936C0 + a3);
  }
}

- (id)stringFromKeyboardType:(int64_t)a3
{
  id result = @"Default";
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      id result = @"ASCII";
      break;
    case 2:
      id result = @"NumbersAndPunctuation";
      break;
    case 3:
      id result = @"URL";
      break;
    case 4:
      id result = @"NumberPad";
      break;
    case 5:
      id result = @"PhonePad";
      break;
    case 6:
      id result = @"NamePhonePad";
      break;
    case 7:
      id result = @"EmailAddress";
      break;
    case 8:
      id result = @"DecimalPad";
      break;
    case 9:
      id result = @"Twitter";
      break;
    case 10:
      id result = @"WebSearch";
      break;
    default:
      if (a3 == 126)
      {
        id result = @"Writeboard";
      }
      else
      {
        NSLog(&cfstr_KeyboardTypeLi.isa, a2, a3);
        id result = @"Default";
      }
      break;
  }
  return result;
}

- (BOOL)isGridLayout
{
  v3 = [(TUIKeyplane *)self fullTree];
  uint64_t v4 = [v3 name];

  if (([v4 containsString:@"Wubihua-Simplified"] & 1) != 0
    || ([v4 containsString:@"Pinyin10-Simplified"] & 1) != 0
    || ([v4 containsString:@"Wubihua-Traditional"] & 1) != 0
    || [v4 containsString:@"Pinyin10-Traditional"])
  {
    int v5 = [v4 containsString:@"Numbers-And-Punctuation"] ^ 1;
  }
  else
  {
    int v5 = 0;
  }
  if ([(TUIKeyplane *)self layoutType] == 2) {
    LOBYTE(v6) = 1;
  }
  else {
    int v6 = [v4 containsString:@"Kana"] | v5;
  }

  return v6;
}

- (id)sortedKeysForKeyplane:(id)a3
{
  v91 = self;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned int v93 = [v3 visualStyle] - 1;
  if (([v3 isKanaPlane] & 1) != 0
    || ([v3 name],
        int v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 containsString:@"n10"],
        v5,
        v6)
    && v93 < 5)
  {
    unsigned int v98 = 1;
    uint64_t v7 = 2;
  }
  else
  {
    v22 = objc_msgSend(v3, "name", v91);
    int v23 = [v22 containsString:@"Fudge"];

    unsigned int v98 = 0;
    if (!v23) {
      goto LABEL_6;
    }
    uint64_t v7 = 1;
  }
  -[TUIKeyplane setLayoutType:](v91, "setLayoutType:", v7, v91);
LABEL_6:
  if (v93 >= 5) {
    double v8 = 1.5;
  }
  else {
    double v8 = 1.0;
  }
  v9 = [v3 keys];
  v10 = [v9 firstObject];
  [v10 frame];
  double v12 = v11;

  if (v12 < 15.0)
  {
    v13 = [v3 keys];
    unint64_t v14 = [v13 count];

    if (v14 >= 2)
    {
      unint64_t v15 = 1;
      while (1)
      {
        v16 = [v3 keys];
        v17 = [v16 objectAtIndex:v15];
        [v17 frame];
        double v19 = v18;

        if (v19 > 15.0) {
          break;
        }
        ++v15;
        v20 = [v3 keys];
        unint64_t v21 = [v20 count];

        if (v15 >= v21) {
          goto LABEL_18;
        }
      }
      double v12 = v19;
    }
  }
LABEL_18:
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  v24 = [v3 keysOrderedByPosition];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v107 objects:v112 count:16];
  id v95 = v4;
  if (!v25)
  {
    id v28 = 0;
    v27 = 0;
    goto LABEL_94;
  }
  uint64_t v26 = v25;
  char v97 = 0;
  uint64_t v94 = 0;
  v27 = 0;
  id v28 = 0;
  uint64_t v29 = *(void *)v108;
  id v92 = v3;
  char v99 = v98;
  v100 = v24;
  do
  {
    for (uint64_t i = 0; i != v26; ++i)
    {
      if (*(void *)v108 != v29) {
        objc_enumerationMutation(v24);
      }
      v31 = *(void **)(*((void *)&v107 + 1) + 8 * i);
      v32 = [v31 shape];
      if ([v32 isEmpty]) {
        goto LABEL_75;
      }
      v33 = v28;
      v34 = [v31 shape];
      [v34 frame];
      BOOL IsEmpty = CGRectIsEmpty(v115);

      if (IsEmpty)
      {
        id v28 = v33;
        v24 = v100;
        continue;
      }
      id v28 = v33;
      if ([v31 displayType] == 51
        && [v33 interactionType] == 9)
      {
        v36 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v33, "displayRowHint"));
        v37 = [v4 objectForKey:v36];

        [v37 removeObjectAtIndex:0];
        v38 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v33, "displayRowHint"));
        [v4 setObject:v37 forKey:v38];

        id v28 = v33;
        char v97 = 1;
      }
      else
      {
        char v97 = 0;
      }
      if ((v99 & 1) != 0 && [v31 interactionType] == 13)
      {
        [v31 setDisplayRowHint:(v94 + 1)];
        uint64_t v39 = [v31 copy];

        [v31 setDisplayRowHint:v94];
        char v99 = 1;
        if ((v98 & 1) == 0)
        {
          v27 = (void *)v39;
          v24 = v100;
          continue;
        }
      }
      else
      {
        v99 |= [v31 interactionType] == 13;
        uint64_t v39 = (uint64_t)v27;
      }
      id v101 = v28;
      v96 = (void *)v39;
      [v31 setState:4];
      uint64_t v94 = [v31 displayRowHint];
      v40 = [NSNumber numberWithInteger:(int)v94];
      v41 = [v4 objectForKey:v40];

      if (!v41)
      {
        id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        int v49 = [v31 displayType];
        if (v49 == [v28 displayType])
        {
          v50 = [v31 representedString];
          v51 = [v28 representedString];
          if ([v50 isEqualToString:v51])
          {
            int v52 = [v31 displayType];

            BOOL v47 = v52 == 21;
            id v4 = v95;
            if (!v47)
            {
              v24 = v100;
              goto LABEL_73;
            }
          }
          else
          {
          }
        }
        [v31 frame];
        if (vabdd_f64(v60, v12) <= 10.0) {
          char v61 = 1;
        }
        else {
          char v61 = v97;
        }
        double v62 = 0.0;
        if ((v61 & 1) == 0) {
          double v62 = round((v60 + v60) / v12) * 0.5;
        }
        int64_t v63 = +[TUIKey layoutTypeForKey:v31];
        if (v98) {
          double v64 = v8;
        }
        else {
          double v64 = v62;
        }
        v58 = +[TUIKey keyFromKBTree:v31 layoutType:v63 layoutShape:v98 multiplier:v64];
        [v58 setKeyplane:v92];
        if (v93 >= 5)
        {
          if ([(TUIKeyplane *)v91 layoutType] == 1) {
            uint64_t v59 = 3;
          }
          else {
            uint64_t v59 = 2;
          }
        }
        else
        {
          uint64_t v59 = 1;
        }
        goto LABEL_72;
      }
      v42 = [NSNumber numberWithInteger:(int)v94];
      id v43 = [v4 objectForKey:v42];

      LODWORD(v42) = [v31 displayType];
      if (v42 != [v28 displayType]) {
        goto LABEL_45;
      }
      v44 = [v31 representedString];
      v45 = [v28 representedString];
      if (([v44 isEqualToString:v45] & 1) == 0)
      {

LABEL_45:
        [v31 frame];
        if (vabdd_f64(v53, v12) <= 10.0) {
          char v54 = 1;
        }
        else {
          char v54 = v97;
        }
        double v55 = 0.0;
        if ((v54 & 1) == 0) {
          double v55 = round((v53 + v53) / v12) * 0.5;
        }
        int64_t v56 = +[TUIKey layoutTypeForKey:v31];
        if (v98) {
          double v57 = v8;
        }
        else {
          double v57 = v55;
        }
        v58 = +[TUIKey keyFromKBTree:v31 layoutType:v56 layoutShape:v98 multiplier:v57];
        [v58 setKeyplane:v92];
        if (v93 >= 5)
        {
          if ([(TUIKeyplane *)v91 layoutType] == 1) {
            uint64_t v59 = 3;
          }
          else {
            uint64_t v59 = 2;
          }
        }
        else
        {
          uint64_t v59 = 1;
        }
LABEL_72:
        v24 = v100;
        [v58 setStyle:v59];
        [v58 setInGridLayout:v98];
        [v43 addObject:v58];
        v65 = [NSNumber numberWithInteger:(int)v94];
        [v4 setObject:v43 forKey:v65];

LABEL_73:
        v48 = v101;
        goto LABEL_74;
      }
      int v46 = [v31 displayType];

      BOOL v47 = v46 == 21;
      id v4 = v95;
      if (v47) {
        goto LABEL_45;
      }
      v48 = v33;
      v24 = v100;
LABEL_74:

      v32 = v48;
      id v28 = v31;
      v27 = v96;
LABEL_75:
    }
    uint64_t v26 = [v24 countByEnumeratingWithState:&v107 objects:v112 count:16];
  }
  while (v26);

  if (v27)
  {
    v66 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v27, "displayRowHint"));
    v67 = [v4 objectForKey:v66];
    v68 = v67;
    if (v67) {
      id v69 = v67;
    }
    else {
      id v69 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    v24 = v69;
    id v3 = v92;

    [v27 frame];
    double v71 = 0.0;
    if (!((vabdd_f64(v70, v12) <= 10.0) | v97 & 1)) {
      double v71 = round((v70 + v70) / v12) * 0.5;
    }
    if (v98) {
      double v71 = v8;
    }
    v72 = +[TUIKey keyFromKBTree:v27 layoutType:3 layoutShape:0 multiplier:v71];
    [v72 setKeyplane:v92];
    if (v93 >= 5)
    {
      if ([(TUIKeyplane *)v91 layoutType] == 1) {
        uint64_t v73 = 3;
      }
      else {
        uint64_t v73 = 2;
      }
    }
    else
    {
      uint64_t v73 = 1;
    }
    [v72 setStyle:v73];
    [v72 setInGridLayout:v98];
    [v24 addObject:v72];
    v74 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v27, "displayRowHint"));
    [v4 setObject:v24 forKey:v74];

LABEL_94:
  }
  else
  {
    id v3 = v92;
  }
  if ([v4 count])
  {
    id v102 = v28;
    id v75 = v3;
    id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v77 = [v4 allKeys];
    v78 = [v77 sortedArrayUsingComparator:&__block_literal_global_1737];

    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v79 = v78;
    uint64_t v80 = [v79 countByEnumeratingWithState:&v103 objects:v111 count:16];
    if (v80)
    {
      uint64_t v81 = v80;
      uint64_t v82 = *(void *)v104;
      do
      {
        for (uint64_t j = 0; j != v81; ++j)
        {
          if (*(void *)v104 != v82) {
            objc_enumerationMutation(v79);
          }
          v84 = *(void **)(*((void *)&v103 + 1) + 8 * j);
          v85 = [v4 objectForKey:v84];
          if ([v85 count]
            && ((unint64_t)[v79 count] < 3 || (unint64_t)objc_msgSend(v85, "count") >= 2))
          {
            unint64_t v86 = [v84 integerValue];
            if (v86 <= [v76 count])
            {
              if ([v84 integerValue])
              {
                uint64_t v87 = [v84 integerValue];
                v88 = v76;
                v89 = v85;
              }
              else
              {
                v88 = v76;
                v89 = v85;
                uint64_t v87 = 0;
              }
              [v88 insertObject:v89 atIndex:v87];
            }
            else
            {
              [v76 addObject:v85];
            }
            id v4 = v95;
          }
        }
        uint64_t v81 = [v79 countByEnumeratingWithState:&v103 objects:v111 count:16];
      }
      while (v81);
    }

    id v3 = v75;
    id v28 = v102;
  }
  else
  {
    id v76 = 0;
  }

  return v76;
}

uint64_t __37__TUIKeyplane_sortedKeysForKeyplane___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (double)heightMultiplierForRowNumber:(unint64_t)a3
{
  id v4 = [(TUIKeyplane *)self defaultRowSet];
  int v5 = [v4 subtrees];
  unint64_t v6 = [v5 count];

  double v7 = 1.0;
  if (v6 > a3)
  {
    double v8 = [v4 subtrees];
    v9 = [v8 objectAtIndex:a3];

    if (v9)
    {
      v10 = [v9 numberForProperty:@"Height"];
      if (v10)
      {
        double v11 = v10;
        [v10 doubleValue];
        double v7 = v12;
      }
    }
  }
  return v7;
}

- (int64_t)keyStyleForLayoutClass:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return -1;
  }
  else {
    return qword_18D5160C8[a3];
  }
}

- (int64_t)keyLayoutStyle
{
  int64_t v3 = [(TUIKeyplane *)self layoutClass];
  return [(TUIKeyplane *)self keyStyleForLayoutClass:v3];
}

- (BOOL)needsResetFromKeyplane:(id)a3
{
  id v4 = a3;
  int v5 = [(TUIKeyplane *)self name];
  unint64_t v6 = [v4 name];
  if ([v5 isEqualToString:v6]
    && (int64_t v7 = -[TUIKeyplane currentVariantType](self, "currentVariantType"), v7 == [v4 currentVariantType]))
  {
    BOOL v8 = ![(TUIKeyplane *)self hasSimilarLayoutToKeyplane:v4];
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)hasSimilarLayoutToKeyplane:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUIKeyplane *)self currentVariantType];
  if (v5 != [v4 currentVariantType]) {
    goto LABEL_9;
  }
  unint64_t v6 = [(TUIKeyplane *)self orderedKeysByRow];
  uint64_t v7 = [v6 count];
  BOOL v8 = [v4 orderedKeysByRow];
  uint64_t v9 = [v8 count];

  if (v7 == v9)
  {
    v10 = [(TUIKeyplane *)self orderedKeysByRow];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      unint64_t v12 = 0;
      while (1)
      {
        v13 = [(TUIKeyplane *)self orderedKeysByRow];
        unint64_t v14 = [v13 objectAtIndex:v12];

        unint64_t v15 = [v4 orderedKeysByRow];
        v16 = [v15 objectAtIndex:v12];

        uint64_t v11 = [v14 count];
        uint64_t v17 = [v16 count];

        LOBYTE(v11) = v11 == v17;
        if (!(_BYTE)v11) {
          break;
        }
        ++v12;
        double v18 = [(TUIKeyplane *)self orderedKeysByRow];
        unint64_t v19 = [v18 count];

        if (v12 >= v19)
        {
          LOBYTE(v11) = 1;
          break;
        }
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (double)finalHeightForSplitKeyboard
{
  [(TUIKeyplane *)self leftSplitSize];
  double result = 206.0;
  if (v2 > 0.0) {
    return v2;
  }
  return result;
}

- (double)finalSplitSizeForRightSide:(BOOL)a3
{
  if (a3)
  {
    [(TUIKeyplane *)self rightSplitSize];
    BOOL v4 = result <= 0.0;
    double v5 = 280.0;
  }
  else
  {
    [(TUIKeyplane *)self leftSplitSize];
    BOOL v4 = result <= 0.0;
    double v5 = 266.0;
  }
  if (v4) {
    return v5;
  }
  return result;
}

- (id)createPreparedKeyFromTree:(id)a3 withMultiplier:(double)a4 type:(int64_t)a5 shape:(int64_t)a6
{
  uint64_t v7 = +[TUIKey keyFromKBTree:a3 layoutType:a5 layoutShape:a6 multiplier:a4];
  BOOL v8 = [(TUIKeyplane *)self fullTree];
  [v7 setKeyplane:v8];

  objc_msgSend(v7, "setStyle:", -[TUIKeyplane keyStyleForLayoutClass:](self, "keyStyleForLayoutClass:", -[TUIKeyplane layoutClass](self, "layoutClass")));
  objc_msgSend(v7, "setInGridLayout:", -[TUIKeyplane isGridLayout](self, "isGridLayout"));
  return v7;
}

- (id)findRowSpanningDuplicatesForKeyplane:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v3 type] == 2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = [&unk_1EDC79B30 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        uint64_t v8 = 0;
        uint64_t v17 = v6;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(&unk_1EDC79B30);
          }
          uint64_t v9 = [v3 cachedKeysByKeyName:*(void *)(*((void *)&v22 + 1) + 8 * v8)];
          if ((unint64_t)[v9 count] >= 2)
          {
            long long v20 = 0u;
            long long v21 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            id v10 = v9;
            uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v19;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v19 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  unint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) name];
                  [v4 setObject:v10 forKey:v15];
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
              }
              while (v12);
            }

            uint64_t v6 = v17;
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [&unk_1EDC79B30 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }
  }

  return v4;
}

- (id)keysForName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUIKeyplane *)self doubleHeightKeys];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)duplicateTreeForSplitMode:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TUIKeyplane *)self fullTree];
  uint64_t v6 = [v5 cachedKeysByKeyName:@"Space-Key"];

  if ((unint64_t)[v6 count] < 2
    || ([v6 objectAtIndex:1], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_15:
    uint64_t v8 = (void *)[v4 copy];
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  if (![v7 isEqual:v4]) {
    goto LABEL_16;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isEqual:", v4, (void)v21) & 1) == 0)
        {
          id v15 = v14;

          uint64_t v8 = v15;
          goto LABEL_14;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
LABEL_14:

    if (!v8) {
      goto LABEL_15;
    }
  }
  else
  {
  }
LABEL_16:
  if ((objc_msgSend(v6, "containsObject:", v8, (void)v21) & 1) == 0)
  {
    v16 = [(TUIKeyplane *)self fullTree];
    [v16 replaceKey:0 withKey:v8];
  }
  uint64_t v17 = (void *)MEMORY[0x1E4F1CA60];
  long long v18 = [v4 cache];
  long long v19 = [v17 dictionaryWithDictionary:v18];

  if (!v19)
  {
    long long v19 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  [v19 setObject:&unk_1EDC79920 forKey:*MEMORY[0x1E4FB2AE0]];
  [v8 setCache:v19];
  [v8 setSplitMode:3];

  return v8;
}

- (BOOL)shouldDuplicateKey:(id)a3 forRow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[TUIKeyplane layoutClass](self, "layoutClass") == 2 && [v6 interactionType] == 15)
  {
    uint64_t v8 = [v7 properties];
    id v9 = [v6 name];
    uint64_t v10 = [v8 objectForKey:v9];
    if (v10) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = [v6 splitMode] != 3;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (double)multiplierForKey:(id)a3 withProperties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 name];
  uint64_t v8 = [v6 objectForKey:v7];

  if (v8) {
    goto LABEL_3;
  }
  id v9 = [v5 representedString];
  uint64_t v8 = [v6 objectForKey:v9];

  if (v8) {
    goto LABEL_3;
  }
  v16 = [v5 name];
  uint64_t v17 = [v16 rangeOfString:@"_"];

  double v13 = 1.0;
  if (v17 == 1)
  {
    long long v18 = [v5 name];
    long long v19 = [v18 substringFromIndex:2];
    uint64_t v8 = [v6 objectForKey:v19];

    if (v8)
    {
LABEL_3:
      uint64_t v10 = [v6 objectForKey:v8];

      if (v10)
      {
        BOOL v11 = [v6 objectForKey:v8];
        [v11 doubleValue];
        double v13 = v12;
      }
      else
      {
        [v8 doubleValue];
        double v13 = v14;
      }
    }
  }

  return v13;
}

- (id)keyRowFromTreeRow:(id)a3 rowNumber:(unint64_t)a4 type:(int64_t)a5
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 type] == 7 || objc_msgSend(v6, "type") == 4)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = [v6 properties];
    v122 = (void *)[v8 mutableCopy];

    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Rowset.Row%li", a4 + 1);
    v120 = self;
    uint64_t v10 = [(TUIKeyplane *)self keylayout];
    BOOL v11 = [v10 properties];
    long long v110 = (void *)v9;
    double v12 = [v11 objectForKey:v9];

    v114 = v12;
    if (v12)
    {
      long long v148 = 0u;
      long long v149 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      double v13 = [v12 allKeys];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v146 objects:v154 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v147;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v147 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v146 + 1) + 8 * i);
            long long v19 = [v114 objectForKey:v18];
            [v122 setObject:v19 forKey:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v146 objects:v154 count:16];
        }
        while (v15);
      }
    }
    long long v20 = NSString;
    long long v21 = [(TUIKeyplane *)self stringFromKeyboardType:a5];
    uint64_t v22 = [v20 stringWithFormat:@"Rowset.%@.Row%li", v21, a4 + 1];

    long long v23 = [(TUIKeyplane *)self keylayout];
    long long v24 = [v23 properties];
    long long v109 = (void *)v22;
    long long v25 = [v24 objectForKey:v22];

    uint64_t v113 = v25;
    if (v25)
    {
      long long v144 = 0u;
      long long v145 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      uint64_t v26 = [v25 allKeys];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v142 objects:v153 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v143;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v143 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v142 + 1) + 8 * j);
            v32 = [v113 objectForKey:v31];
            [v122 setObject:v32 forKey:v31];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v142 objects:v153 count:16];
        }
        while (v28);
      }

      self = v120;
    }
    v33 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    obuint64_t j = [v6 subtrees];
    CGRect v115 = v33;
    uint64_t v119 = [obj countByEnumeratingWithState:&v138 objects:v152 count:16];
    if (v119)
    {
      char v118 = 0;
      v34 = 0;
      uint64_t v117 = *(void *)v139;
      while (1)
      {
        for (uint64_t k = 0; k != v119; ++k)
        {
          if (*(void *)v139 != v117) {
            objc_enumerationMutation(obj);
          }
          v36 = *(void **)(*((void *)&v138 + 1) + 8 * k);
          v126 = v36;
          if ([v36 type] == 8)
          {
            v37 = [MEMORY[0x1E4FB18B8] shape];
            [v36 setShape:v37];

            [v36 setDisplayRowHint:a4];
            int64_t v38 = +[TUIKey layoutTypeForKey:v36];
            BOOL v39 = v38 == 4;
            int64_t v127 = v38;
            if (v38 == 3)
            {
              v40 = v120;
              v41 = [(TUIKeyplane *)v120 doubleHeightKeys];
              v42 = [v36 name];
              id v43 = [v41 objectForKey:v42];

              uint64_t v44 = 2 * (v43 != 0);
              uint64_t v45 = 3;

              v33 = v115;
            }
            else
            {
              uint64_t v45 = v38;
              uint64_t v44 = 0;
              v40 = v120;
            }
            v118 |= v39;
            [(TUIKeyplane *)v40 multiplierForKey:v36 withProperties:v122];
            double v78 = v77;
            self = v40;
            if (([v36 visible] & 1) == 0)
            {
              double v55 = [NSNumber numberWithDouble:v78];
              v83 = [v36 name];
              [v33 setObject:v55 forKey:v83];
              goto LABEL_63;
            }
            id v79 = [(TUIKeyplane *)v40 createPreparedKeyFromTree:v36 withMultiplier:v45 type:v44 shape:v78];
            [v7 addObject:v79];

            if (![(TUIKeyplane *)v40 shouldDuplicateKey:v36 forRow:v6]) {
              continue;
            }
            double v55 = [(TUIKeyplane *)v40 duplicateTreeForSplitMode:v36];
            uint64_t v80 = [v55 name];
            uint64_t v81 = [v36 name];
            [v122 setObject:v80 forKey:v81];

            if (!v34)
            {
              uint64_t v82 = [v6 subtrees];
              v34 = (void *)[v82 mutableCopy];
            }
            v33 = v115;
            if (([v34 containsObject:v55] & 1) == 0)
            {
              objc_msgSend(v34, "insertObject:atIndex:", v55, objc_msgSend(v7, "count"));
              v83 = [(TUIKeyplane *)self createPreparedKeyFromTree:v55 withMultiplier:v127 type:v44 shape:v78];
              [v7 addObject:v83];
LABEL_63:
            }
          }
          else
          {
            int v46 = [v36 name];
            unint64_t v47 = [v46 rangeOfString:@"Row"];

            v48 = [v36 name];
            int v49 = v36;
            unint64_t v50 = [v48 length];

            if (v47 >= v50) {
              goto LABEL_31;
            }
            v51 = [v49 name];
            int v52 = [v51 substringFromIndex:v47];

            double v53 = [(TUIKeyplane *)self keylayout];
            char v54 = [v53 properties];
            double v55 = [v54 objectForKey:v52];

            if (!v55)
            {
LABEL_31:
              int64_t v56 = [(TUIKeyplane *)self keylayout];
              double v57 = [v56 properties];
              v58 = [v49 name];
              double v55 = [v57 objectForKey:v58];
            }
            uint64_t v116 = k;
            long long v136 = 0u;
            long long v137 = 0u;
            long long v134 = 0u;
            long long v135 = 0u;
            id v121 = [v49 subtrees];
            uint64_t v128 = [v121 countByEnumeratingWithState:&v134 objects:v151 count:16];
            if (v128)
            {
              uint64_t v123 = *(void *)v135;
              v124 = v55;
              do
              {
                for (uint64_t m = 0; m != v128; ++m)
                {
                  if (*(void *)v135 != v123) {
                    objc_enumerationMutation(v121);
                  }
                  double v60 = *(void **)(*((void *)&v134 + 1) + 8 * m);
                  char v61 = [MEMORY[0x1E4FB18B8] shape];
                  [v60 setShape:v61];

                  [v60 setDisplayRowHint:a4];
                  int64_t v62 = +[TUIKey layoutTypeForKey:v60];
                  if (v55) {
                    [v55 doubleValue];
                  }
                  else {
                    [(TUIKeyplane *)self multiplierForKey:v60 withProperties:v122];
                  }
                  double v64 = v63;
                  v65 = v34;
                  if (v62 == 3)
                  {
                    v66 = [(TUIKeyplane *)self doubleHeightKeys];
                    v67 = [v60 name];
                    v68 = [v66 objectForKey:v67];

                    double v55 = v124;
                    uint64_t v69 = 2 * (v68 != 0);
                    self = v120;
                  }
                  else
                  {
                    uint64_t v69 = 0;
                  }
                  double v70 = [(TUIKeyplane *)self createPreparedKeyFromTree:v60 withMultiplier:v62 type:v69 shape:v64];
                  [v7 addObject:v70];

                  if ([(TUIKeyplane *)self shouldDuplicateKey:v60 forRow:v6])
                  {
                    double v71 = [(TUIKeyplane *)self duplicateTreeForSplitMode:v60];
                    v72 = [v71 name];
                    uint64_t v73 = [v60 name];
                    [v122 setObject:v72 forKey:v73];

                    v34 = v65;
                    v74 = v126;
                    if (!v34)
                    {
                      id v75 = [v126 subtrees];
                      v34 = (void *)[v75 mutableCopy];
                    }
                    objc_msgSend(v34, "insertObject:atIndex:", v71, objc_msgSend(v7, "count"));
                    id v76 = [(TUIKeyplane *)self createPreparedKeyFromTree:v71 withMultiplier:v62 type:v69 shape:v64];
                    [v7 addObject:v76];

                    double v55 = v124;
                  }
                  else
                  {
                    v34 = v65;
                    v74 = v126;
                  }
                }
                uint64_t v128 = [v121 countByEnumeratingWithState:&v134 objects:v151 count:16];
              }
              while (v128);
            }
            else
            {
              v74 = v49;
            }

            if (v34)
            {
              v84 = (void *)[v34 mutableCopy];
              [v74 setSubtrees:v84];

              [v34 removeAllObjects];
              v83 = v34;
              v34 = 0;
              v33 = v115;
              uint64_t k = v116;
              goto LABEL_63;
            }
            v33 = v115;
            uint64_t k = v116;
          }
        }
        uint64_t v119 = [obj countByEnumeratingWithState:&v138 objects:v152 count:16];
        if (!v119) {
          goto LABEL_69;
        }
      }
    }
    char v118 = 0;
    v34 = 0;
LABEL_69:

    if ([v33 count])
    {
      v85 = [v33 allKeys];
      char v86 = [v85 containsObject:@"Dictation-Key"];

      uint64_t v87 = [v33 objectForKey:@"International-Key"];
      if (v87)
      {
        v88 = (void *)v87;
        v89 = [v33 objectForKey:@"International-Key"];
        [v89 doubleValue];
        double v91 = v90;

        if (v91 > 0.0)
        {
          v129 = v34;
          long long v132 = 0u;
          long long v133 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          id v92 = v7;
          uint64_t v93 = [v92 countByEnumeratingWithState:&v130 objects:v150 count:16];
          if (v93)
          {
            uint64_t v94 = v93;
            uint64_t v95 = *(void *)v131;
            while (2)
            {
              for (uint64_t n = 0; n != v94; ++n)
              {
                if (*(void *)v131 != v95) {
                  objc_enumerationMutation(v92);
                }
                char v97 = *(void **)(*((void *)&v130 + 1) + 8 * n);
                if ((v86 & 1) == 0 && [(TUIKeyplane *)v120 layoutClass] != 1) {
                  goto LABEL_81;
                }
                unsigned int v98 = [v97 backingTree];
                int v99 = [v98 displayType];

                if (v99 == 18) {
                  goto LABEL_86;
                }
                if ((v86 & 1) == 0)
                {
LABEL_81:
                  v100 = [v97 backingTree];
                  int v101 = [v100 displayType];

                  if (v101 == 4)
                  {
LABEL_86:
                    [v97 multiplier];
                    [v97 setMultiplier:v91 + v102];
                    goto LABEL_87;
                  }
                }
              }
              uint64_t v94 = [v92 countByEnumeratingWithState:&v130 objects:v150 count:16];
              if (v94) {
                continue;
              }
              break;
            }
          }
LABEL_87:

          self = v120;
          v33 = v115;
          v34 = v129;
        }
      }
    }
    if ([(TUIKeyplane *)self indexOfLastRow] == a4)
    {
      long long v103 = [(TUIKeyplane *)self cache];
      long long v104 = [NSNumber numberWithBool:v118 & 1];
      [NSNumber numberWithInteger:a5];
      v106 = long long v105 = v34;
      [v103 setObject:v104 forKey:v106];

      v34 = v105;
    }
    if (v34)
    {
      long long v107 = (void *)[v34 mutableCopy];
      [v6 setSubtrees:v107];

      [v34 removeAllObjects];
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)defaultKeysOrderedByRowForKeyplane:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [v4 subtreeWithType:3];
  [(TUIKeyplane *)self setKeylayout:v6];
  id v7 = [(TUIKeyplane *)self defaultRowSet];
  uint64_t v8 = [v7 subtrees];
  -[TUIKeyplane setIndexOfLastRow:](self, "setIndexOfLastRow:", [v8 count] - 1);
  if ([v8 count])
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v8 objectAtIndex:v9];
      BOOL v11 = [(TUIKeyplane *)self keyRowFromTreeRow:v10 rowNumber:v9 type:0];
      if ([v11 count])
      {
        double v12 = [NSNumber numberWithUnsignedInteger:v9];
        [v5 setObject:v11 forKey:v12];
      }
      ++v9;
    }
    while (v9 < [v8 count]);
  }
  double v13 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = [v5 allKeys];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    uint64_t v16 = 0;
    do
    {
      uint64_t v17 = [NSNumber numberWithUnsignedInteger:v16];
      uint64_t v18 = [v5 objectForKey:v17];

      if (v18)
      {
        [v13 addObject:v18];
        long long v19 = [NSNumber numberWithUnsignedInteger:v16];
        [v5 removeObjectForKey:v19];
      }
      ++v16;

      long long v20 = [v5 allKeys];
      uint64_t v21 = [v20 count];
    }
    while (v21);
  }

  return v13;
}

- (id)rowSetForType:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = NSString;
  id v5 = [(TUIKeyplane *)self stringFromKeyboardType:a3];
  id v6 = [v4 stringWithFormat:@"_%@", v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(TUIKeyplane *)self keylayout];
  uint64_t v8 = [v7 subtrees];

  id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        double v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 type] == 15)
        {
          double v13 = [v12 name];
          char v14 = [v13 containsString:v6];

          if (v14)
          {
            id v9 = v12;
            goto LABEL_12;
          }
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v9;
}

- (id)defaultRowSet
{
  id v3 = [(TUIKeyplane *)self keylayout];
  id v4 = [v3 subtreeWithType:15];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(TUIKeyplane *)self keylayout];
  }
  id v6 = v5;

  return v6;
}

- (id)rowsForKeyboardType:(int64_t)a3
{
  if (!a3)
  {
    -[TUIKeyplane setCurrentVariantType:](self, "setCurrentVariantType:");
    goto LABEL_8;
  }
  id v5 = [(TUIKeyplane *)self keylayout];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
LABEL_8:
    double v12 = [(TUIKeyplane *)self defaultKeysByRow];
    goto LABEL_21;
  }
  id v7 = [(TUIKeyplane *)self keylayout];
  uint64_t v8 = [v7 orderedRowsForType:a3];

  if ([v8 count])
  {
    if ([(TUIKeyplane *)self currentVariantType] != a3
      || ([(TUIKeyplane *)self variantKeysByRow],
          id v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 count],
          v9,
          !v10))
    {
      [MEMORY[0x1E4F1CA48] array];
      v30 = uint64_t v28 = v8;
      id v13 = v8;
      if ([v13 count])
      {
        unint64_t v14 = 0;
        do
        {
          uint64_t v15 = objc_msgSend(v13, "objectAtIndex:", v14, v28);
          long long v16 = [(TUIKeyplane *)self keylayout];
          long long v17 = [v16 rowSet];
          long long v18 = [v17 subtrees];
          unint64_t v19 = [v18 count];

          if (v14 >= v19) {
            goto LABEL_14;
          }
          long long v20 = [(TUIKeyplane *)self keylayout];
          uint64_t v21 = [v20 rowSet];
          uint64_t v22 = [v21 subtrees];
          long long v23 = [v22 objectAtIndex:v14];
          int v24 = [v15 isEqualToTree:v23];

          if (v24)
          {
            long long v25 = [(TUIKeyplane *)self defaultKeysByRow];
            uint64_t v26 = [v25 objectAtIndex:v14];
            [v30 addObject:v26];
          }
          else
          {
LABEL_14:
            long long v25 = [(TUIKeyplane *)self keyRowFromTreeRow:v15 rowNumber:v14 type:a3];
            if ([v25 count]) {
              [v30 addObject:v25];
            }
          }

          ++v14;
        }
        while (v14 < [v13 count]);
      }
      -[TUIKeyplane setVariantKeysByRow:](self, "setVariantKeysByRow:", v30, v28);
      [(TUIKeyplane *)self setCurrentVariantType:a3];
      double v12 = [(TUIKeyplane *)self variantKeysByRow];

      uint64_t v8 = v29;
      goto LABEL_20;
    }
    uint64_t v11 = [(TUIKeyplane *)self variantKeysByRow];
  }
  else
  {
    uint64_t v11 = [(TUIKeyplane *)self defaultKeysByRow];
  }
  double v12 = (void *)v11;
LABEL_20:

LABEL_21:
  return v12;
}

- (BOOL)variantTypeIncludesSpaceBar:(int64_t)a3
{
  id v4 = [(TUIKeyplane *)self cache];
  id v5 = [NSNumber numberWithInteger:a3];
  char v6 = [v4 objectForKey:v5];

  if (v6) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (NSArray)orderedKeysByRow
{
  if ([(TUIKeyplane *)self currentVariantType]
    && ([(TUIKeyplane *)self variantKeysByRow],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v4))
  {
    id v5 = [(TUIKeyplane *)self variantKeysByRow];
  }
  else
  {
    id v5 = [(TUIKeyplane *)self defaultKeysByRow];
  }
  return (NSArray *)v5;
}

- (unint64_t)numberOfKeys
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v2 = [(TUIKeyplane *)self orderedKeysByRow];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfRows
{
  double v2 = [(TUIKeyplane *)self orderedKeysByRow];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSString)prefix
{
  unint64_t v3 = [(TUIKeyplane *)self fullTree];
  uint64_t v4 = [v3 name];
  unint64_t v5 = [v4 rangeOfString:@"_"];

  uint64_t v6 = [(TUIKeyplane *)self fullTree];
  char v7 = [v6 name];
  unint64_t v8 = [v7 length];

  long long v9 = [(TUIKeyplane *)self fullTree];
  long long v10 = [v9 name];
  long long v11 = v10;
  if (v5 >= v8)
  {
    id v13 = [v10 stringByReplacingOccurrencesOfString:@"Dynamic-" withString:&stru_1EDC653C0];
  }
  else
  {
    long long v12 = [v10 substringToIndex:v5];
    id v13 = [v12 stringByReplacingOccurrencesOfString:@"Dynamic-" withString:&stru_1EDC653C0];
  }
  return (NSString *)v13;
}

- (NSString)name
{
  double v2 = [(TUIKeyplane *)self fullTree];
  unint64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (void)updateKeyboardType:(int64_t)a3
{
  id v4 = [(TUIKeyplane *)self rowsForKeyboardType:a3];
  [(TUIKeyplane *)self setVariantKeysByRow:v4];
}

- (TUIKeyplane)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUIKeyplane;
  double v2 = [(TUIKeyplane *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    v2->_indexOfLastRow = -1;
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    doubleHeightKeys = v2->_doubleHeightKeys;
    v2->_doubleHeightKeys = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (CGSize)sizeFromScreenTraits:(id)a3 layout:(id)a4 layoutClass:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  +[TUIKeyplane baseHeightForLayout:layoutClass:landscape:](TUIKeyplane, "baseHeightForLayout:layoutClass:landscape:", v8, a5, [v7 isKeyboardMinorEdgeWidth] ^ 1);
  double v10 = v9;

  if (a5 == 1 && ![v7 idiom])
  {
    [v7 keyboardWidth];
    if (v11 > 400.0)
    {
      if ([v7 isKeyboardMinorEdgeWidth]) {
        double v10 = v10 + 8.0;
      }
    }
  }
  if ([v7 isFloating]) {
    double v10 = v10 + 1.0;
  }
  if (a5 == 3)
  {
    if ([v7 isKeyboardMinorEdgeWidth] && (objc_msgSend(v7, "keyboardWidth"), v12 < 834.0))
    {
      double v10 = v10 + -3.0;
    }
    else if (([v7 isKeyboardMinorEdgeWidth] & 1) == 0)
    {
      [v7 keyboardWidth];
      if (v13 < 1194.0) {
        double v10 = v10 + -6.0;
      }
    }
  }
  uint64_t v14 = [v7 screen];
  [v14 scale];
  double v16 = v15;
  long long v17 = [v7 screen];
  [v17 nativeScale];
  double v19 = v16 / v18;

  if (v19 > 1.0 && ([v7 isFloating] & 1) == 0) {
    double v10 = round(v10 * v19);
  }
  [v7 keyboardWidth];
  double v21 = v20;

  double v22 = v21;
  double v23 = v10;
  result.double height = v23;
  result.double width = v22;
  return result;
}

+ (CGSize)sizeBasisForLayoutClass:(int64_t)a3
{
  double v3 = 244.0;
  double v4 = 198.0;
  switch(a3)
  {
    case 0:
      goto LABEL_8;
    case 1:
      double v3 = 812.0;
      double v4 = 375.0;
      goto LABEL_8;
    case 2:
      double v3 = 1024.0;
      uint64_t v5 = 0x4088000000000000;
      goto LABEL_7;
    case 3:
      double v3 = 1194.0;
      double v4 = 834.0;
      goto LABEL_8;
    case 4:
      double v3 = 1366.0;
      uint64_t v5 = 0x4090000000000000;
      goto LABEL_7;
    default:
      double v3 = 568.0;
      uint64_t v5 = 0x4074000000000000;
LABEL_7:
      double v4 = *(double *)&v5;
LABEL_8:
      result.double height = v3;
      result.double width = v4;
      return result;
  }
}

+ (double)baseHeightForLayout:(id)a3 layoutClass:(int64_t)a4 landscape:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  if (v5)
  {
    if ((unint64_t)(a4 - 2) >= 3)
    {
      uint64_t v9 = 0x4064000000000000;
LABEL_8:
      double v8 = *(double *)&v9;
    }
    else
    {
      double v8 = dbl_18D5160F0[a4 - 2];
    }
  }
  else
  {
    double v8 = 132.0;
    switch(a4)
    {
      case 0:
        break;
      case 1:
        if ([(id)objc_opt_class() isSixRowLayout:v7]) {
          double v8 = 240.0;
        }
        else {
          double v8 = 216.0;
        }
        break;
      case 2:
      case 3:
        double v8 = 258.0;
        break;
      case 4:
        double v8 = 325.0;
        break;
      default:
        uint64_t v9 = 0x406B000000000000;
        goto LABEL_8;
    }
  }

  return v8;
}

+ (int64_t)layoutClassFromScreenDimensions:(CGSize)a3
{
  if (*MEMORY[0x1E4F1DB30] == a3.width && *(double *)(MEMORY[0x1E4F1DB30] + 8) == a3.height) {
    return -1;
  }
  if (a3.width > a3.height) {
    a3.double width = a3.height;
  }
  if (a3.width < 320.0) {
    return 0;
  }
  if (a3.width < 730.0) {
    return 1;
  }
  if (a3.width < 815.0) {
    return 2;
  }
  if (a3.width >= 1024.0) {
    return 4;
  }
  return 3;
}

+ (int64_t)layoutClassFromKeyplaneName:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"Mini"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 containsString:@"Small_"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 containsString:@"Medium"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 containsString:@"Large"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 containsString:@"Grand"])
  {
    int64_t v4 = 4;
  }
  else
  {
    NSLog(&cfstr_ErrorNoMapping.isa, v3);
    int64_t v4 = -1;
  }

  return v4;
}

+ (BOOL)isSixRowLayout:(id)a3
{
  if (a3) {
    return objc_msgSend(&unk_1EDC79B48, "containsObject:");
  }
  else {
    return 0;
  }
}

+ (int64_t)defaultEffectsType
{
  return 0;
}

+ (id)keyplaneFromKBTree:(id)a3 withType:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(TUIKeyplane);
  [(TUIKeyplane *)v6 setFullTree:v5];
  [(TUIKeyplane *)v6 setEffectsType:+[TUIKeyplane defaultEffectsType]];
  id v7 = [v5 name];
  [(TUIKeyplane *)v6 setLayoutClass:+[TUIKeyplane layoutClassFromKeyplaneName:v7]];

  if ([(TUIKeyplane *)v6 isGridLayout]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = [(TUIKeyplane *)v6 layoutClass] == 4;
  }
  [(TUIKeyplane *)v6 setLayoutType:v8];
  uint64_t v9 = [(TUIKeyplane *)v6 findRowSpanningDuplicatesForKeyplane:v5];
  [(TUIKeyplane *)v6 setDoubleHeightKeys:v9];

  double v10 = [(TUIKeyplane *)v6 defaultKeysOrderedByRowForKeyplane:v5];
  [(TUIKeyplane *)v6 setDefaultKeysByRow:v10];

  double v11 = [(TUIKeyplane *)v6 rowsForKeyboardType:a4];
  [(TUIKeyplane *)v6 setVariantKeysByRow:v11];

  [(TUIKeyplane *)v6 setCurrentVariantType:a4];
  return v6;
}

+ (id)keyplaneFromKBTree:(id)a3
{
  return +[TUIKeyplane keyplaneFromKBTree:a3 withType:0];
}

@end