@interface NSTextTable
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)_missingColumnsForRowRange:(_NSRange)a3 blockIndex:(unint64_t)a4 text:(id)a5;
- (BOOL)collapsesBorders;
- (BOOL)hidesEmptyCells;
- (CGRect)_contentRectForCharRange:(_NSRange)a3 textContainer:(id)a4;
- (NSRect)boundsRectForBlock:(NSTextTableBlock *)block contentRect:(NSRect)contentRect inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange;
- (NSRect)rectForBlock:(NSTextTableBlock *)block layoutAtPoint:(NSPoint)startingPoint inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange;
- (NSTextTable)init;
- (NSTextTable)initWithCoder:(id)a3;
- (NSTextTableLayoutAlgorithm)layoutAlgorithm;
- (NSUInteger)numberOfColumns;
- (id)_descriptionAtIndex:(unint64_t)a3 text:(id)a4;
- (id)_rowArrayForBlock:(id)a3 atIndex:(unint64_t)a4 text:(id)a5 layoutManager:(id)a6 containerWidth:(double)a7 withRepetitions:(BOOL)a8 collapseBorders:(BOOL)a9 rowCharRange:(_NSRange *)a10 indexInRow:(unint64_t *)a11 startingRow:(int64_t *)a12 startingColumn:(int64_t *)a13 previousRowBlockHelper:(id *)a14;
- (unint64_t)_tableFlags;
- (void)_setTableFlags:(unint64_t)a3;
- (void)_takeValuesFromTextBlock:(id)a3;
- (void)dealloc;
- (void)drawBackgroundForBlock:(NSTextTableBlock *)block withFrame:(NSRect)frameRect inView:(NSView *)controlView characterRange:(NSRange)charRange layoutManager:(NSLayoutManager *)layoutManager;
- (void)encodeWithCoder:(id)a3;
- (void)setCollapsesBorders:(BOOL)collapsesBorders;
- (void)setHidesEmptyCells:(BOOL)hidesEmptyCells;
- (void)setLayoutAlgorithm:(NSTextTableLayoutAlgorithm)layoutAlgorithm;
- (void)setNumberOfColumns:(NSUInteger)numberOfColumns;
@end

@implementation NSTextTable

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSTextTable setVersion:1];
    __NSTextTableClass = (uint64_t)a1;
  }
}

- (NSTextTable)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextTable;
  return [(NSTextBlock *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NSTextTable;
  [(NSTextBlock *)&v2 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSTextTable;
  -[NSTextBlock encodeWithCoder:](&v8, sel_encodeWithCoder_);
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInteger:self->_numCols forKey:@"NSNumCols"];
    [a3 encodeInteger:self->_tableFlags forKey:@"NSTableFlags"];
  }
  else
  {
    unint64_t numCols = self->_numCols;
    int tableFlags = self->_tableFlags;
    int v7 = numCols;
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "II", &v7, &tableFlags);
  }
}

- (NSTextTable)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NSTextTable;
  v4 = -[NSTextBlock initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      v4->_unint64_t numCols = [a3 decodeIntegerForKey:@"NSNumCols"];
      v4->_int tableFlags = [a3 decodeIntegerForKey:@"NSTableFlags"];
    }
    else
    {
      uint64_t v5 = [a3 versionForClassName:@"NSTextTable"];
      if (v5 == 1)
      {
        uint64_t v9 = 0;
        objc_msgSend(a3, "decodeValuesOfObjCTypes:", "II", (char *)&v9 + 4, &v9);
        v4->_unint64_t numCols = HIDWORD(v9);
        v4->_int tableFlags = v9;
      }
      else
      {
        uint64_t v6 = v5;
        uint64_t v7 = _NSFullMethodName();
        NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v7, 1, v6);

        return 0;
      }
    }
  }
  return v4;
}

- (void)_takeValuesFromTextBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSTextTable;
  -[NSTextBlock _takeValuesFromTextBlock:](&v5, sel__takeValuesFromTextBlock_);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_unint64_t numCols = *((void *)a3 + 6);
    self->_int tableFlags = *((void *)a3 + 7);
  }
}

- (void)setNumberOfColumns:(NSUInteger)numberOfColumns
{
  self->_unint64_t numCols = numberOfColumns;
}

- (NSUInteger)numberOfColumns
{
  return self->_numCols;
}

- (BOOL)collapsesBorders
{
  return self->_tableFlags & 1;
}

- (void)setCollapsesBorders:(BOOL)collapsesBorders
{
  self->_int tableFlags = self->_tableFlags & 0xFFFFFFFFFFFFFFFELL | collapsesBorders;
}

- (BOOL)hidesEmptyCells
{
  return (LOBYTE(self->_tableFlags) >> 1) & 1;
}

- (void)setHidesEmptyCells:(BOOL)hidesEmptyCells
{
  uint64_t v3 = 2;
  if (!hidesEmptyCells) {
    uint64_t v3 = 0;
  }
  self->_int tableFlags = self->_tableFlags & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (NSTextTableLayoutAlgorithm)layoutAlgorithm
{
  return (self->_tableFlags >> 2) & 1;
}

- (void)setLayoutAlgorithm:(NSTextTableLayoutAlgorithm)layoutAlgorithm
{
  self->_int tableFlags = self->_tableFlags & 0xFFFFFFFFFFFFFFFBLL | (4
                                                                * (layoutAlgorithm == NSTextTableFixedLayoutAlgorithm));
}

- (unint64_t)_tableFlags
{
  return self->_tableFlags;
}

- (void)_setTableFlags:(unint64_t)a3
{
  self->_int tableFlags = a3;
}

- (id)_rowArrayForBlock:(id)a3 atIndex:(unint64_t)a4 text:(id)a5 layoutManager:(id)a6 containerWidth:(double)a7 withRepetitions:(BOOL)a8 collapseBorders:(BOOL)a9 rowCharRange:(_NSRange *)a10 indexInRow:(unint64_t *)a11 startingRow:(int64_t *)a12 startingColumn:(int64_t *)a13 previousRowBlockHelper:(id *)a14
{
  unsigned int v114 = a9;
  BOOL v14 = a8;
  NSUInteger v20 = objc_msgSend(a5, "_rangeOfTextTableRow:atIndex:");
  NSUInteger v22 = v21;
  id v119 = a5;
  unint64_t v120 = a4;
  v23 = objc_msgSend((id)objc_msgSend(a5, "attribute:atIndex:effectiveRange:"), "textBlocks");
  uint64_t v24 = [v23 count];
  unint64_t v25 = v24;
  BOOL v115 = v14;
  if (a12) {
    char v26 = 1;
  }
  else {
    char v26 = v14;
  }
  id v116 = a6;
  if (a3) {
    BOOL v27 = a6 == 0;
  }
  else {
    BOOL v27 = 1;
  }
  if (v27) {
    char v26 = 1;
  }
  if (a13) {
    char v26 = 1;
  }
  char v111 = v26;
  if (a10)
  {
    a10->location = v20;
    a10->length = v22;
  }
  NSUInteger v117 = v22;
  NSUInteger v118 = v20;
  if (v24)
  {
    uint64_t v28 = *MEMORY[0x1E4F1C3B8];
    unint64_t v29 = 1;
    do
    {
      unint64_t v30 = v29 - 1;
      id v31 = (id)[v23 objectAtIndex:v29 - 1];
      if (v31 == a3)
      {
        if (a3 && (NSTextTable *)[a3 table] != self) {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v28, @"*** block %p has table %p rather than %p at index %lu", a3, objc_msgSend(a3, "table"), self, v120);
        }
      }
      else
      {
        v32 = v31;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (NSTextTable *)[v32 table] == self)
        {
          if (a3) {
            objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v28, @"*** table %p has block %p rather than %p at index %lu", self, v32, a3, v120);
          }
          a3 = v32;
        }
        else
        {
          unint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      if (v30 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      BOOL v46 = v29++ >= v25;
    }
    while (!v46);
    if (v30 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_34;
    }
  }
  else
  {
    unint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"*** table %p has no block at index %lu", self, v120);
    NSUInteger v34 = v117;
    unint64_t v33 = v118;
    v35 = v119;
LABEL_35:
    uint64_t v36 = [a3 startingRow];
    uint64_t v37 = [a3 startingColumn];
    goto LABEL_36;
  }
LABEL_34:
  NSUInteger v34 = v117;
  unint64_t v33 = v118;
  v35 = v119;
  if (a3) {
    goto LABEL_35;
  }
  uint64_t v36 = 0;
  uint64_t v37 = 0;
LABEL_36:
  v38 = a11;
  uint64_t v126 = 0;
  uint64_t v127 = 0;
  v39 = a14;
  int64_t v122 = v37;
  uint64_t v109 = 0x7FFFFFFFFFFFFFFFLL;
  if (!a14)
  {
    uint64_t v112 = 0;
    unint64_t v50 = v33;
    goto LABEL_62;
  }
  v40 = 0;
  if (v30 != 0x7FFFFFFFFFFFFFFFLL && v33)
  {
    uint64_t v123 = v36;
    uint64_t v41 = v33 - 1;
    v40 = (char *)objc_msgSend((id)objc_msgSend(v35, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v33 - 1, 0), "textBlocks");
    if (v40)
    {
      v42 = v40;
      if ([v40 count] > v30)
      {
        if (!v30) {
          goto LABEL_49;
        }
        unint64_t v43 = 1;
        do
        {
          uint64_t v44 = [v23 objectAtIndex:v43 - 1];
          uint64_t v45 = [v42 objectAtIndex:v43 - 1];
          BOOL v46 = v44 != v45 || v43++ >= v30;
        }
        while (!v46);
        v35 = v119;
        if (v44 == v45)
        {
LABEL_49:
          v47 = (void *)[v42 objectAtIndex:v30];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v48 = (NSTextTable *)[v47 table];
            v40 = 0;
            uint64_t v109 = 0x7FFFFFFFFFFFFFFFLL;
            if (v48 == self && v47)
            {
              uint64_t v49 = [v47 startingRow];
              if ([v47 rowSpan] + v49 == v123)
              {
                uint64_t v112 = 0;
                uint64_t v109 = 0x7FFFFFFFFFFFFFFFLL;
                unint64_t v50 = v33;
              }
              else
              {
                unint64_t v50 = [v35 rangeOfTextTable:self atIndex:v120];
                uint64_t v112 = v100;
                uint64_t v109 = v50;
                if (v50 < v33)
                {
                  do
                  {
                    v101 = objc_msgSend((id)objc_msgSend(v35, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSParagraphStyle", v50, &v126, v109, v112), "textBlocks");
                    if (v101)
                    {
                      v102 = v101;
                      if ([v101 count] > v30)
                      {
                        v103 = (void *)[v102 objectAtIndex:v30];
                        if (v103 != v47)
                        {
                          v104 = v103;
                          uint64_t v105 = [v103 startingRow];
                          uint64_t v106 = [v104 rowSpan] + v105;
                          v35 = v119;
                          if (v106 == v123)
                          {
                            uint64_t v41 = v50;
                            v47 = v104;
                          }
                        }
                      }
                    }
                    v38 = a11;
                    unint64_t v50 = v127 + v126;
                  }
                  while (v127 + v126 < v33);
                  if (!v47)
                  {
                    v40 = 0;
LABEL_160:
                    uint64_t v36 = v123;
                    goto LABEL_60;
                  }
LABEL_159:
                  v40 = -[NSTextBlockLayoutHelper initWithTextBlock:charIndex:text:layoutManager:containerWidth:collapseBorders:]((char *)[NSTextBlockLayoutHelper alloc], v47, v41, v35, v116, v114, a7);
                  goto LABEL_160;
                }
              }
              v38 = a11;
              goto LABEL_159;
            }
            unint64_t v50 = v33;
            uint64_t v112 = 0;
LABEL_59:
            uint64_t v36 = v123;
            v38 = a11;
LABEL_60:
            v39 = a14;
            goto LABEL_61;
          }
        }
      }
      v40 = 0;
    }
    uint64_t v112 = 0;
    uint64_t v109 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v50 = v33;
    goto LABEL_59;
  }
  unint64_t v50 = v33;
  uint64_t v112 = 0;
LABEL_61:
  id *v39 = v40;
LABEL_62:
  if ((v111 & 1) != 0
    || (uint64_t v51 = [v116 _rowArrayCache]) == 0
    || (v33 == *(void *)(v51 + 8) ? (BOOL v52 = v34 == *(void *)(v51 + 16)) : (BOOL v52 = 0),
        !v52 || *(unsigned __int8 *)(v51 + 40) != v114 || vabdd_f64(a7, *(double *)(v51 + 24)) >= 0.001))
  {
    v53 = 0;
    goto LABEL_81;
  }
  v53 = *(void **)(v51 + 32);
  if (!v53)
  {
LABEL_81:
    unint64_t v113 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_82;
  }
  uint64_t v54 = [*(id *)(v51 + 32) count];
  if (v54)
  {
    uint64_t v55 = v54;
    v107 = v38;
    unint64_t v56 = 0;
    unint64_t v113 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      uint64_t v57 = [v53 objectAtIndex:v56];
      id v58 = *(id *)(v57 + 8);
      if (v58)
      {
        v59 = (void *)v57;
        [v116 layoutRectForTextBlock:v58 atIndex:*(void *)(v57 + 32) effectiveRange:0];
        v59[6] = v60;
        v59[7] = v61;
        v59[8] = v62;
        v59[9] = v63;
        NSUInteger v34 = v117;
        [v116 boundsRectForTextBlock:v58 atIndex:v59[4] effectiveRange:0];
        v59[10] = v64;
        v59[11] = v65;
        v59[12] = v66;
        v59[13] = v67;
        unint64_t v68 = v113;
        if (v58 == a3) {
          unint64_t v68 = v56;
        }
        unint64_t v113 = v68;
      }
      ++v56;
    }
    while (v55 != v56);
    unint64_t v33 = v118;
    v35 = v119;
    v38 = v107;
LABEL_82:
    if (v30 == 0x7FFFFFFFFFFFFFFFLL || v53)
    {
      v96 = a12;
      v95 = a13;
    }
    else
    {
      uint64_t v124 = v36;
      v53 = (void *)[MEMORY[0x1E4F1CA48] array];
      unint64_t v69 = v33 + v34;
      v108 = v38;
      unint64_t v70 = 0;
      while (v50 < v69)
      {
        v71 = objc_msgSend((id)objc_msgSend(v35, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSParagraphStyle", v50, &v126, v33, v34), "textBlocks");
        if (v71 && (v72 = v71, [v71 count] > v30))
        {
          id v73 = (id)[v72 objectAtIndex:v30];
          v74 = -[NSTextBlockLayoutHelper initWithTextBlock:charIndex:text:layoutManager:containerWidth:collapseBorders:]((char *)[NSTextBlockLayoutHelper alloc], v73, v50, v35, v116, v114, a7);
          uint64_t v75 = [v73 startingRow];
          uint64_t v76 = [v73 startingColumn];
          uint64_t v77 = [v73 columnSpan];
          if (v70) {
            uint64_t v78 = v124;
          }
          else {
            uint64_t v78 = v75;
          }
          uint64_t v79 = v122;
          if (!v70) {
            uint64_t v79 = v76;
          }
          int64_t v122 = v79;
          uint64_t v124 = v78;
          if (v73 == a3) {
            unint64_t v113 = [v53 count];
          }
          if (v115)
          {
            NSUInteger v34 = v117;
            unint64_t v33 = v118;
            if (v77 >= 1)
            {
              uint64_t v80 = v77;
              do
              {
                [v53 addObject:v74];
                --v80;
              }
              while (v80);
            }
          }
          else
          {
            [v53 addObject:v74];
            NSUInteger v34 = v117;
            unint64_t v33 = v118;
          }
          v70 += v77;
          unint64_t v50 = *((void *)v74 + 3) + *((void *)v74 + 2);

          v35 = v119;
        }
        else
        {
          unint64_t v50 = v127 + v126;
        }
      }
      if (v70 < self->_numCols)
      {
        unint64_t v81 = v109;
        if (!v112)
        {
          unint64_t v81 = [v35 rangeOfTextTable:self atIndex:v120];
          uint64_t v112 = v82;
        }
        if (v81 < v33)
        {
          unint64_t v83 = v81;
          unint64_t v110 = v81;
          do
          {
            if (v70 >= self->_numCols) {
              break;
            }
            v84 = objc_msgSend((id)objc_msgSend(v35, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSParagraphStyle", v83, &v126, v81, v112), "textBlocks");
            if (v84 && (v85 = v84, [v84 count] > v30))
            {
              v86 = (void *)[v85 objectAtIndex:v30];
              uint64_t v87 = [v86 startingRow];
              uint64_t v88 = [v86 rowSpan];
              uint64_t v89 = [v86 startingColumn];
              uint64_t v90 = [v86 columnSpan];
              if (v87 > v124 || v88 + v87 <= v124)
              {
                unint64_t v83 = v127 + v126;
                unint64_t v33 = v118;
              }
              else
              {
                uint64_t v121 = v90;
                v91 = -[NSTextBlockLayoutHelper initWithTextBlock:charIndex:text:layoutManager:containerWidth:collapseBorders:]((char *)[NSTextBlockLayoutHelper alloc], v86, v83, v119, v116, v114, a7);
                for (unint64_t i = 0; i < [v53 count]; ++i)
                {
                  if (v89 < objc_msgSend(*(id *)(objc_msgSend(v53, "objectAtIndex:", i) + 8), "startingColumn")) {
                    break;
                  }
                }
                unint64_t v33 = v118;
                if (v115)
                {
                  uint64_t v93 = v121;
                  if (v121 < 1)
                  {
                    unint64_t v94 = v113;
                  }
                  else
                  {
                    unint64_t v94 = v113;
                    do
                    {
                      [v53 insertObject:v91 atIndex:i];
                      if (i <= v94) {
                        ++v94;
                      }
                      --v93;
                    }
                    while (v93);
                  }
                }
                else
                {
                  [v53 insertObject:v91 atIndex:i];
                  unint64_t v94 = v113;
                  if (i <= v113) {
                    unint64_t v94 = v113 + 1;
                  }
                }
                unint64_t v113 = v94;
                v70 += v121;
                unint64_t v83 = *((void *)v91 + 3) + *((void *)v91 + 2);
              }
              v35 = v119;
              unint64_t v81 = v110;
            }
            else
            {
              unint64_t v83 = v127 + v126;
            }
          }
          while (v83 < v33);
        }
      }
      if (v115)
      {
        while (v70 < self->_numCols)
        {
          objc_msgSend(v53, "addObject:", objc_msgSend(v53, "lastObject"));
          ++v70;
        }
      }
      if ((v111 & 1) == 0)
      {
        v97 = -[NSLayoutManagerTextBlockRowArrayCache initWithRowCharRange:containerWidth:rowArray:collapseBorders:]([NSLayoutManagerTextBlockRowArrayCache alloc], "initWithRowCharRange:containerWidth:rowArray:collapseBorders:", v33, v117, v53, v114, a7);
        [v116 _setRowArrayCache:v97];
      }
      v96 = a12;
      v95 = a13;
      uint64_t v36 = v124;
      v38 = v108;
    }
    uint64_t v98 = v113;
    if (v38) {
      goto LABEL_140;
    }
    goto LABEL_141;
  }
  uint64_t v98 = 0x7FFFFFFFFFFFFFFFLL;
  v96 = a12;
  v95 = a13;
  if (v38) {
LABEL_140:
  }
    unint64_t *v38 = v98;
LABEL_141:
  if (v96) {
    int64_t *v96 = v36;
  }
  if (v95) {
    int64_t *v95 = v122;
  }
  return v53;
}

- (id)_descriptionAtIndex:(unint64_t)a3 text:(id)a4
{
  uint64_t v7 = (void *)[MEMORY[0x1E4F28E78] string];
  NSUInteger v8 = [a4 rangeOfTextTable:self atIndex:a3];
  NSUInteger v10 = v9;
  id v36 = a4;
  v11 = objc_msgSend((id)objc_msgSend(a4, "attribute:atIndex:effectiveRange:"), "textBlocks");
  uint64_t v12 = [v11 count];
  if (!v12) {
    goto LABEL_26;
  }
  unint64_t v13 = v12;
  BOOL v14 = self;
  unint64_t v15 = 1;
  do
  {
    if ((NSTextTable *)objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v15 - 1), "table") == v14) {
      uint64_t v16 = v15 - 1;
    }
    else {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  while (v16 == 0x7FFFFFFFFFFFFFFFLL && v15++ < v13);
  self = v14;
  if (v10 && v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v38.NSUInteger location = v8;
    v38.NSUInteger length = v10;
    NSUInteger v34 = v14;
    [v7 appendFormat:@"table %p range %@ cols %lu flags 0x%lx %@\n", v14, NSStringFromRange(v38), v14->_numCols, v14->_tableFlags, -[NSTextBlock _attributeDescription](v14, "_attributeDescription")];
    NSUInteger v33 = v8 + v10;
    if (v8 < v8 + v10)
    {
      uint64_t v18 = 0;
      do
      {
        v39.NSUInteger location = [v36 _rangeOfTextTableRow:self atIndex:v8];
        NSUInteger location = v39.location;
        NSUInteger length = v39.length;
        uint64_t v35 = v18;
        [v7 appendFormat:@"  row %lu range %@\n", v18, NSStringFromRange(v39)];
        NSUInteger range = location + length;
        if (v8 < location + length)
        {
          uint64_t v21 = 0;
          do
          {
            NSUInteger v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v36, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v8, 0), "textBlocks"), "objectAtIndex:", v16);
            NSUInteger v23 = [v36 rangeOfTextBlock:v22 atIndex:v8];
            NSUInteger v25 = v24;
            uint64_t v26 = [v22 startingRow];
            uint64_t v27 = [v22 rowSpan];
            uint64_t v28 = [v22 startingColumn];
            uint64_t v29 = [v22 columnSpan];
            v40.NSUInteger location = v23;
            v40.NSUInteger length = v25;
            [v7 appendFormat:@"    cell %lu %p range %@ ", v21, v22, NSStringFromRange(v40)];
            if (v27 < 2) {
              objc_msgSend(v7, "appendFormat:", @"row %ld ", v26, v31);
            }
            else {
              objc_msgSend(v7, "appendFormat:", @"rows %ld-%ld ", v26, v26 + v27 - 1);
            }
            if (v29 < 2) {
              objc_msgSend(v7, "appendFormat:", @"col %ld ", v28, v32);
            }
            else {
              objc_msgSend(v7, "appendFormat:", @"cols %ld-%ld ", v28, v28 + v29 - 1);
            }
            [v7 appendFormat:@"%@\n", objc_msgSend(v22, "_attributeDescription")];
            NSUInteger v8 = v23 + v25;
            ++v21;
          }
          while (v8 < range);
        }
        self = v34;
        uint64_t v18 = v35 + 1;
        NSUInteger v8 = range;
      }
      while (range < v33);
    }
  }
  else
  {
LABEL_26:
    objc_msgSend(v7, "appendFormat:", @"table %p not at location %lu", self, a3);
  }
  return v7;
}

- (NSRect)rectForBlock:(NSTextTableBlock *)block layoutAtPoint:(NSPoint)startingPoint inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange
{
  NSUInteger location = charRange.location;
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  double v12 = startingPoint.y;
  v76[0] = 0;
  v76[1] = 0;
  unint64_t v15 = [(NSTextContainer *)textContainer layoutManager];
  unint64_t v75 = 0;
  NSInteger v16 = [(NSTextTableBlock *)block startingRow];
  uint64_t v74 = 0;
  BOOL v17 = [(NSTextTable *)self collapsesBorders];
  uint64_t v18 = [(NSTextTableBlock *)block columnSpan];
  double v19 = 0.0;
  if (v17) {
    double v20 = 0.5;
  }
  else {
    double v20 = 0.0;
  }
  uint64_t v21 = (double *)-[NSTextBlockLayoutHelper initWithTextTable:charIndex:text:layoutManager:containerWidth:collapseBorders:]((char *)[NSTextBlockLayoutHelper alloc], self, location, [(NSLayoutManager *)v15 textStorage], v15, v17, width);
  NSUInteger v22 = v21;
  double v23 = v21[20];
  if (v23 > width || v23 <= 0.0) {
    double v23 = width;
  }
  double v25 = v23 - (v21[14] + v21[15] + v21[16] + v21[17] + v21[18] + v21[19]);
  id v26 = [(NSTextTable *)self _rowArrayForBlock:block atIndex:location text:[(NSLayoutManager *)v15 textStorage] layoutManager:v15 containerWidth:0 withRepetitions:v17 collapseBorders:v25 rowCharRange:v76 indexInRow:&v75 startingRow:0 startingColumn:0 previousRowBlockHelper:&v74];
  unint64_t v27 = [v26 count];
  double v28 = 0.0;
  if (v27)
  {
    for (uint64_t i = 0; i != v27; ++i)
    {
      uint64_t v30 = [v26 objectAtIndex:i];
      double v31 = *(double *)(v30 + 160);
      if (v31 <= 0.0) {
        double v28 = v28 + (double)[*(id *)(v30 + 8) columnSpan];
      }
      else {
        double v19 = v19
      }
            + *(double *)(v30 + 192)
            + *(double *)(v30 + 184)
            + *(double *)(v30 + 176)
            + v31
            + *(double *)(v30 + 112)
            + *(double *)(v30 + 120)
            + *(double *)(v30 + 128);
    }
  }
  if (v75 >= v27)
  {
    double v42 = width;
    double v43 = x;
    goto LABEL_57;
  }
  double v68 = height;
  double v71 = v25;
  double v72 = y;
  double v32 = (double)v18;
  NSUInteger v33 = (double *)objc_msgSend(v26, "objectAtIndex:");
  NSUInteger v34 = v33;
  double v35 = v33[14] + v33[15] + v33[16];
  double v36 = v33[22] + v33[23] + v33[24];
  double v37 = v33[20];
  if (v37 <= 0.0)
  {
    double v39 = v20;
    if (v28 >= v32) {
      double v44 = v28;
    }
    else {
      double v44 = v32;
    }
    double v41 = (v71 - v19) * v32 / v44;
LABEL_26:
    double v38 = floor(v41);
    goto LABEL_27;
  }
  double v38 = v36 + v35 + v37;
  double v39 = v20;
  if (v19 > v71 + 0.001)
  {
    double v40 = 1.0;
    if (v19 >= 1.0) {
      double v40 = v19;
    }
    double v41 = (v71 - v28) * v38 / v40;
    goto LABEL_26;
  }
LABEL_27:
  double v45 = v33[17];
  double v46 = v33[18];
  double v47 = v38 - v35 - v36;
  if (v47 >= v32) {
    double v48 = v47;
  }
  else {
    double v48 = v32;
  }
  double v66 = v33[19];
  double v67 = v48;
  double v49 = v39 + v22[14] + v22[15] + v22[16];
  double v50 = v12 + v39 + v22[17] + v22[18] + v22[19];
  double v69 = v39;
  double v70 = v50;
  if (v74)
  {
    uint64_t v51 = [(NSLayoutManager *)v15 textContainerForGlyphAtIndex:*(void *)(v74 + 32) effectiveRange:0 withoutAdditionalLayout:1];
    if (v12 > 0.0 && v51 == textContainer && !NSIsEmptyRect(*(NSRect *)(v74 + 80))) {
      double v50 = *(double *)(v74 + 88) + *(double *)(v74 + 104);
    }
  }
  double v52 = v45 + v46;
  double v53 = x + v49;
  if (v75)
  {
    for (unint64_t j = 0; j < v75; ++j)
    {
      uint64_t v55 = [v26 objectAtIndex:j];
      if (!NSIsEmptyRect(*(NSRect *)(v55 + 80)))
      {
        double v56 = *(double *)(v55 + 96);
        if (v53 < *(double *)(v55 + 80) + v56) {
          double v53 = *(double *)(v55 + 80) + v56;
        }
        if ([*(id *)(v55 + 8) startingRow] == v16) {
          double v50 = *(double *)(v55 + 88);
        }
      }
    }
  }
  double v57 = v72 + v68 + v69;
  double v58 = v52 + v66;
  double v43 = v35 + v53;
  if (v36 + v35 + v67 <= width + 0.001) {
    double v59 = v67;
  }
  else {
    double v59 = width - v35 - v36;
  }
  if (v59 >= 1.0) {
    double v42 = v59;
  }
  else {
    double v42 = 1.0;
  }
  double v60 = x + width + v69;
  if (v36 + v42 + v43 > v60 + 0.001)
  {
    double v43 = v60 - v36 - v42;
    if (v43 < x) {
      double v43 = floor(width * v35 / (v36 + v35 + v42));
    }
  }
  double y = v58 + v50;
  double v61 = v57 - (v58 + v50);
  if (v61 >= 1.0) {
    double height = v61;
  }
  else {
    double height = 1.0;
  }
  if (*((void *)v34 + 2) == *((void *)v22 + 2)) {
    -[NSLayoutManager setLayoutRect:forTextBlock:glyphRange:](v15, "setLayoutRect:forTextBlock:glyphRange:", self, *((void *)v22 + 4), *((void *)v22 + 5), x + v49, v70, v71, v57 - v72);
  }
LABEL_57:

  double v62 = v43;
  double v63 = y;
  double v64 = v42;
  double v65 = height;
  result.size.double height = v65;
  result.size.double width = v64;
  result.origin.double y = v63;
  result.origin.double x = v62;
  return result;
}

- (CGRect)_contentRectForCharRange:(_NSRange)a3 textContainer:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CGFloat v9 = *MEMORY[0x1E4F28AD8];
  CGFloat v8 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  CGFloat v11 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  CGFloat v10 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  double v12 = (void *)[a4 layoutManager];
  double v38 = (void *)[v12 textStorage];
  unint64_t v13 = objc_msgSend((id)objc_msgSend(v38, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", location, 0), "textBlocks");
  uint64_t v14 = [v13 count];
  if (v14)
  {
    unint64_t v15 = v14;
    double v35 = v12;
    id v36 = a4;
    NSUInteger v37 = length;
    unint64_t v16 = 1;
    do
    {
      unint64_t v17 = v16 - 1;
      uint64_t v18 = objc_msgSend(v13, "objectAtIndex:", v16 - 1, v35, v36);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ((NSTextTable *)[v18 table] != self) {
          unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      else
      {
        unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
    }
    while (v16++ < v15);
    if (v17 != 0x7FFFFFFFFFFFFFFFLL && location < location + v37)
    {
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      NSUInteger v20 = location;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      do
      {
        uint64_t v21 = objc_msgSend((id)objc_msgSend(v38, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSParagraphStyle", v20, &v41, location, v37), "textBlocks");
        if (!v21) {
          goto LABEL_21;
        }
        NSUInteger v22 = v21;
        if ([v21 count] <= v17) {
          goto LABEL_21;
        }
        uint64_t v23 = [v22 objectAtIndex:v17];
        uint64_t v24 = objc_msgSend(v35, "glyphRangeForCharacterRange:actualCharacterRange:", v20, 1, 0);
        [v35 boundsRectForTextBlock:v23 atIndex:v24 effectiveRange:&v39];
        CGFloat x = v43.origin.x;
        CGFloat y = v43.origin.y;
        CGFloat width = v43.size.width;
        CGFloat height = v43.size.height;
        if (!NSIsEmptyRect(v43) && v40)
        {
          if ((id)[v35 textContainerForGlyphAtIndex:v24 effectiveRange:0 withoutAdditionalLayout:1] == v36)
          {
            v44.origin.CGFloat x = v9;
            v44.origin.CGFloat y = v8;
            v44.size.CGFloat width = v11;
            v44.size.CGFloat height = v10;
            if (NSIsEmptyRect(v44))
            {
              CGFloat v10 = height;
              CGFloat v11 = width;
              CGFloat v8 = y;
              CGFloat v9 = x;
            }
            else
            {
              v45.origin.CGFloat x = v9;
              v45.origin.CGFloat y = v8;
              v45.size.CGFloat width = v11;
              v45.size.CGFloat height = v10;
              v48.origin.CGFloat x = x;
              v48.origin.CGFloat y = y;
              v48.size.CGFloat width = width;
              v48.size.CGFloat height = height;
              NSRect v46 = NSUnionRect(v45, v48);
              CGFloat v9 = v46.origin.x;
              CGFloat v8 = v46.origin.y;
              CGFloat v11 = v46.size.width;
              CGFloat v10 = v46.size.height;
            }
          }
          uint64_t v29 = objc_msgSend(v35, "characterRangeForGlyphRange:actualGlyphRange:", v39, v40, 0);
          NSUInteger v20 = v29 + v30;
        }
        else
        {
LABEL_21:
          NSUInteger v20 = v42 + v41;
        }
      }
      while (v20 < location + v37);
    }
  }
  double v31 = v9;
  double v32 = v8;
  double v33 = v11;
  double v34 = v10;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (NSRect)boundsRectForBlock:(NSTextTableBlock *)block contentRect:(NSRect)contentRect inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange
{
  NSUInteger location = charRange.location;
  double width = rect.size.width;
  double height = contentRect.size.height;
  double v10 = contentRect.size.width;
  double y = contentRect.origin.y;
  double x = contentRect.origin.x;
  unint64_t v15 = [(NSTextContainer *)textContainer layoutManager];
  v70[0] = 0;
  v70[1] = 0;
  unint64_t v69 = 0;
  NSInteger v16 = [(NSTextTableBlock *)block startingRow];
  NSInteger v17 = [(NSTextTableBlock *)block rowSpan];
  NSTextBlockVerticalAlignment v18 = [(NSTextBlock *)block verticalAlignment];
  BOOL v19 = [(NSTextTable *)self collapsesBorders];
  NSUInteger v20 = -[NSTextBlockLayoutHelper initWithTextTable:charIndex:text:layoutManager:containerWidth:collapseBorders:]((char *)[NSTextBlockLayoutHelper alloc], self, location, [(NSLayoutManager *)v15 textStorage], v15, v19, width);
  uint64_t v21 = v20;
  double v22 = *((double *)v20 + 20);
  if (v22 <= width && v22 > 0.0) {
    double v24 = *((double *)v20 + 20);
  }
  else {
    double v24 = width;
  }
  id v25 = [(NSTextTable *)self _rowArrayForBlock:block atIndex:location text:[(NSLayoutManager *)v15 textStorage] layoutManager:v15 containerWidth:0 withRepetitions:v19 collapseBorders:v24 rowCharRange:v70 indexInRow:&v69 startingRow:0 startingColumn:0 previousRowBlockHelper:0];
  unint64_t v26 = [v25 count];
  if (v69 >= v26) {
    goto LABEL_38;
  }
  unint64_t v27 = v26;
  double v67 = self;
  double v68 = v21;
  uint64_t v28 = objc_msgSend(v25, "objectAtIndex:");
  uint64_t v29 = v28;
  double v30 = *(double *)(v28 + 168) - height;
  if (v30 <= 0.0) {
    goto LABEL_13;
  }
  double height = height + v30;
  if (v18 == NSTextBlockBottomAlignment) {
    goto LABEL_12;
  }
  if (v18 == NSTextBlockMiddleAlignment)
  {
    double v30 = v30 * 0.5;
LABEL_12:
    _moveLinesInLayoutManager(v15, *(void *)(v28 + 32), *(void *)(v28 + 40), 0, v30);
  }
LABEL_13:
  unint64_t v31 = 0;
  double v32 = *(double *)(v29 + 112) + *(double *)(v29 + 120) + *(double *)(v29 + 128);
  double v33 = *(double *)(v29 + 136) + *(double *)(v29 + 144) + *(double *)(v29 + 152);
  double y = y - v33;
  double v34 = v32 + *(double *)(v29 + 192) + *(double *)(v29 + 184) + *(double *)(v29 + 176);
  NSInteger v35 = v17 + v16;
  double height = height + v33 + *(double *)(v29 + 216) + *(double *)(v29 + 208) + *(double *)(v29 + 200);
  do
  {
    uint64_t v36 = [v25 objectAtIndex:v31];
    uint64_t v37 = [*(id *)(v36 + 8) startingRow];
    if ([*(id *)(v36 + 8) rowSpan] + v37 != v35 || v31 >= v69 && (v31 <= v69 || v37 >= v16)) {
      goto LABEL_31;
    }
    uint64_t v38 = [*(id *)(v36 + 8) verticalAlignment];
    double v39 = *(double *)(v36 + 88) + *(double *)(v36 + 104) - (y + height);
    if (v39 <= 0.0)
    {
      if (v39 >= 0.0) {
        goto LABEL_31;
      }
      if (v38 == 2)
      {
        double v44 = -v39;
      }
      else
      {
        if (v38 != 1)
        {
LABEL_30:
          double v45 = *(double *)(v36 + 96);
          *(double *)(v36 + 104) = *(double *)(v36 + 104) - v39;
          -[NSLayoutManager setBoundsRect:forTextBlock:glyphRange:](v15, "setBoundsRect:forTextBlock:glyphRange:", *(void *)(v36 + 8), *(void *)(v36 + 32), *(void *)(v36 + 40), *(double *)(v36 + 80), *(double *)(v36 + 88), v45);
          goto LABEL_31;
        }
        double v44 = v39 * -0.5;
      }
      _moveLinesInLayoutManager(v15, *(void *)(v36 + 32), *(void *)(v36 + 40), 1, v44);
      goto LABEL_30;
    }
    double height = height + v39;
    if (v18 == NSTextBlockBottomAlignment)
    {
      uint64_t v41 = *(void *)(v29 + 32);
      uint64_t v42 = *(void *)(v29 + 40);
      NSRect v43 = v15;
      double v40 = v39;
    }
    else
    {
      if (v18 != NSTextBlockMiddleAlignment) {
        goto LABEL_31;
      }
      double v40 = v39 * 0.5;
      uint64_t v41 = *(void *)(v29 + 32);
      uint64_t v42 = *(void *)(v29 + 40);
      NSRect v43 = v15;
    }
    _moveLinesInLayoutManager(v43, v41, v42, 0, v40);
LABEL_31:
    ++v31;
  }
  while (v27 != v31);
  double x = x - v32;
  double v10 = v10 + v34;
  uint64_t v21 = v68;
  if (*(void *)(v29 + 24) + *(void *)(v29 + 16) == *((void *)v68 + 3) + *((void *)v68 + 2))
  {
    -[NSTextTable _contentRectForCharRange:textContainer:](v67, "_contentRectForCharRange:textContainer:");
    CGFloat v46 = v71.origin.x;
    CGFloat v47 = v71.origin.y;
    CGFloat v48 = v71.size.width;
    CGFloat v49 = v71.size.height;
    BOOL v50 = NSIsEmptyRect(v71);
    double v65 = x;
    double v66 = v10;
    double v51 = y;
    double v52 = height;
    if (!v50)
    {
      v72.origin.double x = v46;
      v72.origin.double y = v47;
      v72.size.double width = v48;
      v72.size.double height = v49;
      v74.origin.double x = x;
      v74.size.double width = v10;
      v74.origin.double y = y;
      v74.size.double height = height;
      *(NSRect *)(&v51 - 1) = NSUnionRect(v72, v74);
      double x = v53;
      double v10 = v54;
    }
    double v55 = x;
    double v56 = v51;
    double v57 = v10;
    double v58 = v52;
    if (!NSIsEmptyRect(*(NSRect *)(&v51 - 1)))
    {
      double v59 = *((double *)v68 + 14) + *((double *)v68 + 15) + *((double *)v68 + 16);
      double v60 = *((double *)v68 + 17) + *((double *)v68 + 18) + *((double *)v68 + 19);
      -[NSLayoutManager setBoundsRect:forTextBlock:glyphRange:](v15, "setBoundsRect:forTextBlock:glyphRange:", v67, *((void *)v68 + 4), *((void *)v68 + 5), x - v59, v56 - v60, v10 + v59 + *((double *)v68 + 24) + *((double *)v68 + 23) + *((double *)v68 + 22), v58 + v60 + *((double *)v68 + 27) + *((double *)v68 + 26) + *((double *)v68 + 25));
    }
    double x = v65;
    double v10 = v66;
  }
LABEL_38:

  double v61 = x;
  double v62 = y;
  double v63 = v10;
  double v64 = height;
  result.size.double height = v64;
  result.size.double width = v63;
  result.origin.double y = v62;
  result.origin.double x = v61;
  return result;
}

- (BOOL)_missingColumnsForRowRange:(_NSRange)a3 blockIndex:(unint64_t)a4 text:(id)a5
{
  NSUInteger v6 = a3.location + a3.length;
  if (a3.location >= a3.location + a3.length)
  {
    unint64_t v11 = 0;
  }
  else
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    unint64_t v11 = 0;
    double v12 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    NSUInteger v13 = a3.location;
    do
    {
      uint64_t v14 = v12;
      unint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSParagraphStyle", v13, &v17, location, length), "textBlocks"), "objectAtIndex:", a4);
      double v12 = v15;
      if (v15 != v14) {
        v11 += [v15 columnSpan];
      }
      NSUInteger v13 = v18 + v17;
    }
    while (v18 + v17 < v6);
  }
  return v11 < self->_numCols;
}

- (void)drawBackgroundForBlock:(NSTextTableBlock *)block withFrame:(NSRect)frameRect inView:(NSView *)controlView characterRange:(NSRange)charRange layoutManager:(NSLayoutManager *)layoutManager
{
  NSUInteger length = charRange.length;
  NSUInteger location = charRange.location;
  double height = frameRect.size.height;
  double width = frameRect.size.width;
  double y = frameRect.origin.y;
  double x = frameRect.origin.x;
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  *(CGFloat *)&long long v164 = frameRect.origin.x;
  *((void *)&v164 + 1) = *(void *)&frameRect.origin.y;
  *(CGFloat *)&long long v165 = frameRect.size.width;
  *((void *)&v165 + 1) = *(void *)&frameRect.size.height;
  c = (CGContext *)objc_msgSend((id)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass", block, controlView), "graphicsContextForApplicationFrameworkContext:", -[NSLayoutManager applicationFrameworkContext](layoutManager, "applicationFrameworkContext")), "CGContext");
  v151 = layoutManager;
  uint64_t v14 = [(NSLayoutManager *)layoutManager textStorage];
  unint64_t v15 = (void *)[(NSTextStorage *)v14 string];
  [(NSTextBlock *)self contentWidth];
  double v17 = v16;
  NSTextBlockValueType v18 = [(NSTextBlock *)self contentWidthValueType];
  v145 = [(NSTextBlock *)self backgroundColor];
  v146 = [(NSTextBlock *)block backgroundColor];
  v147 = [(NSTextBlock *)block borderColorForEdge:0];
  v148 = [(NSTextBlock *)block borderColorForEdge:1];
  v149 = [(NSTextBlock *)block borderColorForEdge:2];
  v150 = [(NSTextBlock *)block borderColorForEdge:3];
  long long v162 = v164;
  long long v163 = v165;
  long long v160 = v164;
  long long v161 = v165;
  long long v158 = v164;
  long long v159 = v165;
  long long v156 = v164;
  long long v157 = v165;
  long long v154 = v164;
  long long v155 = v165;
  int v19 = [(NSTextTable *)self collapsesBorders];
  BOOL v20 = [(NSTextTable *)self hidesEmptyCells];
  unint64_t v143 = [(NSTextStorage *)v14 length];
  BOOL v141 = v20;
  if (v20)
  {
    if (location <= location + length) {
      NSUInteger v21 = location + length;
    }
    else {
      NSUInteger v21 = location;
    }
    if (location >= location + length) {
      return;
    }
    NSUInteger v22 = location;
    while (1)
    {
      unsigned int v23 = [v15 characterAtIndex:v22];
      if (v23 > 0x20 || ((1 << v23) & 0x100002400) == 0) {
        break;
      }
      if (v21 == ++v22) {
        return;
      }
    }
  }
  if (v17 < 0.0 || v18 == NSTextBlockPercentageValueType) {
    double v25 = 0.0;
  }
  else {
    double v25 = v17;
  }
  unint64_t v26 = [NSTextBlockLayoutHelper alloc];
  [(NSLayoutManager *)layoutManager textStorage];
  NSUInteger v27 = location;
  uint64_t v29 = (double *)[(NSTextBlockLayoutHelper *)(char *)v26 initWithTextBlock:location charRange:length text:v25 layoutManager:v28 containerWidth:layoutManager collapseBorders:v19];
  double v31 = v29[14];
  double v30 = v29[15];
  double v32 = v31 + v30;
  double v33 = v29[17];
  double v34 = v29[18];
  *(double *)&long long v162 = *(double *)&v162 + v31 + v30;
  *((double *)&v162 + 1) = *((double *)&v162 + 1) + v33 + v34;
  double v35 = v29[23];
  double v36 = v29[24];
  double v37 = v29[26];
  double v38 = v29[27];
  *(double *)&long long v163 = *(double *)&v163 - (v31 + v30 + v36 + v35);
  *((double *)&v163 + 1) = *((double *)&v163 + 1) - (v33 + v34 + v38 + v37);
  if (v19)
  {
    double v39 = objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](v14, "attribute:atIndex:effectiveRange:"), "textBlocks");
    unint64_t v40 = [v39 count];
    NSInteger v140 = [(NSTextTableBlock *)block startingRow];
    NSInteger v139 = [(NSTextTableBlock *)block startingColumn];
    NSInteger v41 = [(NSTextTableBlock *)block rowSpan];
    NSInteger v42 = [(NSTextTableBlock *)block columnSpan];
    double v43 = v29[10];
    double v44 = v29[11];
    double v45 = v29[15];
    double v46 = x - v45;
    double v47 = width + v45 + v29[23];
    double v48 = v29[18];
    double v49 = y - v48;
    double v50 = height + v48 + v29[26];
    *(double *)&long long v154 = v46;
    *((double *)&v154 + 1) = y - v48;
    *(double *)&long long v155 = v47;
    *((double *)&v155 + 1) = v50;
    long long v156 = v154;
    long long v157 = v155;
    long long v158 = v154;
    long long v159 = v155;
    long long v160 = v154;
    long long v161 = v155;
    if (!v40) {
      goto LABEL_35;
    }
    NSInteger v132 = v42;
    NSInteger v134 = v41;
    double v130 = x - v43;
    double v51 = y - v44;
    unint64_t v52 = 1;
    do
    {
      uint64_t v53 = v52 - 1;
      if ((NSTextTable *)objc_msgSend((id)objc_msgSend(v39, "objectAtIndex:", v52 - 1), "table") != self) {
        uint64_t v53 = 0x7FFFFFFFFFFFFFFFLL;
      }
      BOOL v54 = v53 != 0x7FFFFFFFFFFFFFFFLL || v52++ >= v40;
    }
    while (!v54);
    if (v53 == 0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v55 = [(NSAttributedString *)v14 _rangeOfTextTableRow:self atIndex:location], !v56))
    {
LABEL_35:
      char range2a = 0;
LABEL_36:
      double v31 = v29[14];
      double v30 = v29[15] + v29[15];
      v29[15] = v30;
      double v33 = v29[17];
      double v34 = v29[18] + v29[18];
      v29[18] = v34;
      double v36 = v29[24];
      double v35 = v29[23] + v29[23];
      v29[23] = v35;
      double v38 = v29[27];
      double v37 = v29[26] + v29[26];
      v29[26] = v37;
      int v63 = range2a & 1;
      double v32 = v31 + v30;
      goto LABEL_37;
    }
    NSUInteger v57 = v55;
    NSUInteger v58 = v56;
    BOOL v59 = -[NSTextTable _missingColumnsForRowRange:blockIndex:text:](self, "_missingColumnsForRowRange:blockIndex:text:", v55, v56, v53, v14);
    uint64_t v60 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v59
      && v57
      && (uint64_t v60 = [(NSAttributedString *)v14 _rangeOfTextTableRow:self atIndex:v57 - 1],
          v61))
    {
      NSUInteger range2 = v60;
      NSUInteger v62 = v61;
      if (-[NSTextTable _missingColumnsForRowRange:blockIndex:text:](self, "_missingColumnsForRowRange:blockIndex:text:"))
      {
        goto LABEL_57;
      }
    }
    else
    {
      NSUInteger range2 = v60;
      if (v59) {
        goto LABEL_57;
      }
      NSUInteger v62 = 0;
    }
    if (v57 + v58 >= v143)
    {
      NSUInteger v69 = 0;
      NSUInteger v68 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_64:
      if (v62)
      {
        v168.NSUInteger location = v57;
        v168.NSUInteger length = v58;
        v170.NSUInteger location = range2;
        v170.NSUInteger length = v62;
        NSRange v70 = NSUnionRange(v168, v170);
        NSUInteger v57 = v70.location;
        NSUInteger v58 = v70.length;
      }
      if (!v69) {
        goto LABEL_69;
      }
      v169.NSUInteger location = v57;
      v169.NSUInteger length = v58;
      v171.NSUInteger location = v68;
      v171.NSUInteger length = v69;
      NSRange v71 = NSUnionRange(v169, v171);
      NSUInteger v66 = v71.length;
      NSUInteger v65 = v71.location;
LABEL_68:
      NSUInteger v57 = v65;
      NSUInteger v58 = v66;
LABEL_69:
      if (v58)
      {
        unint64_t v136 = v58 + v57;
        if (v57 < v58 + v57)
        {
          char range2a = 0;
          uint64_t v135 = v134 + v140;
          uint64_t v133 = v132 + v139;
          CGFloat v120 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
          CGFloat v121 = *MEMORY[0x1E4F1DB28];
          CGFloat v118 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
          CGFloat v119 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
          double v126 = v25;
          double v127 = v47;
          double v124 = v49 + v50;
          double v125 = v51;
          v131 = v14;
          CGFloat v122 = v50;
          double v123 = v46 + v47;
          CGFloat v128 = v49;
          double v129 = v46;
          while (1)
          {
            NSRect v72 = objc_msgSend((id)objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](v14, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v57, 0), "textBlocks"), "objectAtIndex:", v53);
            unint64_t v73 = [(NSAttributedString *)v14 rangeOfTextBlock:v72 atIndex:v57];
            uint64_t v144 = v74;
            uint64_t v75 = [v72 startingRow];
            uint64_t v76 = [v72 startingColumn];
            uint64_t v77 = [v72 rowSpan];
            NSInteger v78 = [v72 columnSpan] + v76;
            BOOL v79 = v76 != v133;
            if (v75 > v135) {
              BOOL v79 = 1;
            }
            BOOL v80 = v75 != v135;
            BOOL v81 = v78 != v139;
            if (v75 > v135) {
              BOOL v81 = 1;
            }
            NSInteger v82 = v77 + v75;
            if (v76 > v133) {
              BOOL v80 = 1;
            }
            BOOL v83 = v82 != v140;
            if (v76 > v133) {
              BOOL v83 = 1;
            }
            char v84 = v78 < v139 || v83;
            int v85 = v78 < v139 || v80;
            int v86 = v82 < v140 || v81;
            int v87 = v82 < v140 || v79;
            BOOL v88 = v86 != 1 || v85 == 0;
            BOOL v89 = v88 || v87 == 0;
            if (v89 || (v84 & 1) == 0) {
              break;
            }
            NSUInteger v27 = location;
LABEL_140:
            NSUInteger v57 = v73 + v144;
            BOOL v54 = v73 + v144 >= v136;
            uint64_t v14 = v131;
            if (v54) {
              goto LABEL_36;
            }
          }
          uint64_t v90 = [NSTextBlockLayoutHelper alloc];
          v92 = [(NSTextBlockLayoutHelper *)(char *)v90 initWithTextBlock:v73 charRange:v144 text:v25 layoutManager:v91 containerWidth:v151 collapseBorders:1];
          uint64_t v93 = (double *)v92;
          if (((v86 & 1) != 0 || *((double *)v92 + 23) <= v29[15] || ![v72 borderColorForEdge:2])
            && ((v84 & 1) != 0 || v93[26] <= v29[18] || ![v72 borderColorForEdge:3])
            && ((v87 & 1) != 0 || v93[15] <= v29[23] || ![v72 borderColorForEdge:0])
            && ((v85 & 1) != 0 || v93[18] <= v29[26] || ![v72 borderColorForEdge:1]))
          {
            NSUInteger v27 = location;
LABEL_139:

            goto LABEL_140;
          }
          NSUInteger v27 = location;
          if (v141)
          {
            if (v73 <= v73 + v144) {
              unint64_t v94 = v73 + v144;
            }
            else {
              unint64_t v94 = v73;
            }
            if (v73 >= v73 + v144) {
              goto LABEL_139;
            }
            unint64_t v95 = v73;
            while (1)
            {
              unsigned int v96 = [v15 characterAtIndex:v95];
              if (v96 > 0x20 || ((1 << v96) & 0x100002400) == 0) {
                break;
              }
              if (v94 == ++v95) {
                goto LABEL_139;
              }
            }
          }
          double v98 = v93[10];
          double v97 = v93[11];
          double v100 = v93[12];
          double v99 = v93[13];
          double v101 = v93[15];
          double v102 = v93[18];
          double v103 = v93[23];
          double v104 = v93[26];
          if ((range2a & 1) == 0)
          {
            double v105 = v93[13];
            double v106 = v93[18];
            double v107 = v93[26];
            double v108 = v93[11];
            CGContextSaveGState(c);
            double v97 = v108;
            double v104 = v107;
            double v102 = v106;
            double v99 = v105;
          }
          double v109 = v98 + v130 - v101;
          if (v109 <= v129)
          {
            size_t v110 = 0;
            double v50 = v122;
          }
          else
          {
            rects[0].origin.double x = v129;
            rects[0].origin.double y = v128;
            rects[0].size.double width = v109 - v129;
            double v50 = v122;
            rects[0].size.double height = v122;
            size_t v110 = 1;
          }
          double v111 = v109 + v100 + v101 + v103;
          if (v111 >= v123)
          {
            double v25 = v126;
            double v47 = v127;
            double v113 = v125;
            double v49 = v128;
          }
          else
          {
            uint64_t v112 = &rects[v110];
            double v47 = v127;
            double v49 = v128;
            v112->origin.double x = v111;
            v112->origin.double y = v128;
            ++v110;
            v112->size.double width = v123 - v111;
            v112->size.double height = v50;
            double v113 = v125;
            double v25 = v126;
          }
          double v46 = v129;
          double v114 = v97 + v113 - v102;
          if (v114 > v49)
          {
            BOOL v115 = &rects[v110];
            v115->origin.double x = v129;
            v115->origin.double y = v49;
            ++v110;
            v115->size.double width = v47;
            v115->size.double height = v114 - v49;
          }
          double v116 = v114 + v99 + v102 + v104;
          if (v116 >= v124)
          {
            if (!v110)
            {
              v172.origin.double y = v120;
              v172.origin.double x = v121;
              v172.size.double height = v118;
              v172.size.double width = v119;
              CGContextClipToRect(c, v172);
              goto LABEL_138;
            }
          }
          else
          {
            NSUInteger v117 = &rects[v110];
            v117->origin.double x = v129;
            v117->origin.double y = v116;
            ++v110;
            v117->size.double width = v47;
            v117->size.double height = v124 - v116;
          }
          CGContextClipToRects(c, rects, v110);
LABEL_138:
          char range2a = 1;
          goto LABEL_139;
        }
      }
      char range2a = 0;
      NSUInteger v27 = location;
      goto LABEL_36;
    }
    NSUInteger v68 = -[NSAttributedString _rangeOfTextTableRow:atIndex:](v14, "_rangeOfTextTableRow:atIndex:", self);
    NSUInteger v69 = v67;
    if (!v67
      || !-[NSTextTable _missingColumnsForRowRange:blockIndex:text:](self, "_missingColumnsForRowRange:blockIndex:text:", v68, v67, v53, v14))
    {
      goto LABEL_64;
    }
LABEL_57:
    NSUInteger v65 = [(NSAttributedString *)v14 rangeOfTextTable:self atIndex:location];
    goto LABEL_68;
  }
  int v63 = 0;
  double v49 = *((double *)&v154 + 1);
  double v46 = *(double *)&v154;
  double v50 = *((double *)&v155 + 1);
  double v47 = *(double *)&v155;
LABEL_37:
  *(double *)&long long v160 = v31 + *(double *)&v160;
  *((double *)&v160 + 1) = v33 + *((double *)&v160 + 1);
  *(double *)&long long v161 = v30;
  *((double *)&v161 + 1) = *((double *)&v161 + 1) - (v33 + v38);
  double v64 = v32 + v35 + v36;
  *(double *)&long long v158 = v32 + *(double *)&v158;
  *((double *)&v158 + 1) = v33 + *((double *)&v158 + 1);
  *(double *)&long long v159 = *(double *)&v159 - v64;
  *((double *)&v159 + 1) = v34;
  *(double *)&long long v156 = *(double *)&v156 + *(double *)&v157 - v36 - v35;
  *((double *)&v156 + 1) = v33 + *((double *)&v156 + 1);
  *(double *)&long long v157 = v35;
  *((double *)&v157 + 1) = *((double *)&v157 + 1) - (v33 + v38);
  *(double *)&long long v154 = v32 + v46;
  *((double *)&v154 + 1) = v49 + v50 - v38 - v37;
  *(double *)&long long v155 = v47 - v64;
  *((double *)&v155 + 1) = v37;
  if (v145)
  {
    [(NSColor *)v145 set];
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v151, "fillBackgroundRectArray:count:forCharacterRange:color:", &v164, 1, v27, length, v145);
  }
  if (v146)
  {
    [(NSColor *)v146 set];
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v151, "fillBackgroundRectArray:count:forCharacterRange:color:", &v162, 1, v27, length, v146);
  }
  if (v29[15] > 0.0 && v147)
  {
    [(NSColor *)v147 set];
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v151, "fillBackgroundRectArray:count:forCharacterRange:color:", &v160, 1, v27, length, v147);
  }
  if (v29[18] > 0.0 && v148)
  {
    [(NSColor *)v148 set];
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v151, "fillBackgroundRectArray:count:forCharacterRange:color:", &v158, 1, v27, length, v148);
  }
  if (v29[23] > 0.0 && v149)
  {
    [(NSColor *)v149 set];
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v151, "fillBackgroundRectArray:count:forCharacterRange:color:", &v156, 1, v27, length, v149);
  }
  if (v29[26] > 0.0 && v150)
  {
    [(NSColor *)v150 set];
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v151, "fillBackgroundRectArray:count:forCharacterRange:color:", &v154, 1, v27, length, v150);
  }

  if (v63) {
    CGContextRestoreGState(c);
  }
}

@end