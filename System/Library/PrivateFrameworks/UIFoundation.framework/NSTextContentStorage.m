@interface NSTextContentStorage
+ (BOOL)__isNotesTextContentStorageClass;
+ (BOOL)_includesTextListMarkers;
+ (BOOL)_usesTextListElements;
+ (BOOL)supportsSecureCoding;
+ (void)registerEditedRangeValidator:(id)a3;
- (BOOL)_supportsTextAttributesInRange:(_NSRange)a3;
- (BOOL)containsExtraLineFragment;
- (BOOL)copiesContentsInTextParagraphs;
- (BOOL)includesTextListMarkers;
- (BOOL)isCountableDataSource;
- (NSAttributedString)attributedString;
- (NSAttributedString)attributedStringForTextElement:(NSTextElement *)textElement;
- (NSCountableTextRange)documentRange;
- (NSInteger)offsetFromLocation:(id)from toLocation:(id)to;
- (NSTextContentStorage)init;
- (NSTextContentStorage)initWithCoder:(id)a3;
- (NSTextElement)textElementForAttributedString:(NSAttributedString *)attributedString;
- (NSTextRange)adjustedRangeFromRange:(NSTextRange *)textRange forEditingTextSelection:(BOOL)forEditingTextSelection;
- (NSTextStorage)textStorage;
- (_NSRange)_applyEditedRangeAdjustmentsToRange:(_NSRange)a3;
- (id)attributedStringForTextElements:(id)a3;
- (id)delegate;
- (id)enumerateTextElementsFromLocation:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (id)locationFromLocation:(id)location withOffset:(NSInteger)offset;
- (id)textElementsForAttributedString:(id)a3;
- (void)_commonInitialization;
- (void)beginEditingTransaction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)endEditingTransaction;
- (void)performEditingTransactionForTextStorage:(id)a3 usingBlock:(id)a4;
- (void)processEditingForTextStorage:(id)a3 edited:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 invalidatedRange:(_NSRange)a7;
- (void)replaceContentsInRange:(id)a3 withTextElements:(id)a4;
- (void)setAttributedString:(NSAttributedString *)attributedString;
- (void)setCopiesContentsInTextParagraphs:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setIncludesTextListMarkers:(BOOL)a3;
- (void)setTextStorage:(id)a3;
- (void)synchronizeTextLayoutManagers:(id)a3;
- (void)synchronizeToBackingStore:(id)a3;
- (void)updateRangesForTextElement:(id)a3 locationDelta:(int64_t)a4;
@end

@implementation NSTextContentStorage

- (id)enumerateTextElementsFromLocation:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  textStorage = self->_textStorage;
  if (!textStorage) {
    textStorage = (NSTextStorage *)self->_attributedString;
  }
  v10 = (NSCountableTextLocation *)[(NSTextStorage *)textStorage length];
  if (!a3) {
    a3 = [(NSTextRange *)[(NSTextContentStorage *)self documentRange] location];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v11 = (void *)[a3 type],
        ([v11 isEqualToString:NSTextLocationTypeCountable] & 1) == 0))
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = objc_opt_class();
    [v12 raise:v13, @"-[%@ %@] received NSTextLocation unrecognized %@.", v14, NSStringFromSelector(a2), a3 format];
  }
  objc_sync_enter(self);
  if (!v10) {
    goto LABEL_210;
  }
  unint64_t v15 = [a3 characterIndex];
  if (a4) {
    uint64_t v16 = -1;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v132 = v16;
  [(NSTextContentStorage *)self delegate];
  char v131 = objc_opt_respondsToSelector();
  BOOL v17 = (a4 & 1) == 0;
  memset(v139, 0, 512);
  unint64_t v18 = [(NSTextContentManager *)self maximumNumberOfUncachedElements];
  unint64_t v134 = a4;
  bzero(v139, 0x248uLL);
  *(int64x2_t *)v140 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = -1;
  }
  *((void *)&v139[0] + 1) = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v141 = v19;
  uint64_t v142 = 0x7FFFFFFFFFFFFFFFLL;
  unsigned __int8 v144 = 1;
  activeEnumerationCache = self->_activeEnumerationCache;
  BOOL v143 = (a4 & 1) == 0;
  long long v135 = 0u;
  id v136 = 0;
  uint64_t v137 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v138 = v17;
  v123 = activeEnumerationCache;
  if (activeEnumerationCache) {
    __NSTextContentStorageFlushUncachedTextElements((NSUInteger)self, (uint64_t)activeEnumerationCache, 1);
  }
  self->_activeEnumerationCache = ($A622375D3863639446C6735D77F52D30 *)v139;
  v21 = (char *)v10 + self->_modifiedDocumentLengthDelta;
  if (v15 >= (unint64_t)v21) {
    unint64_t v22 = (unint64_t)v10 + self->_modifiedDocumentLengthDelta;
  }
  else {
    unint64_t v22 = v15;
  }
  if (v134) {
    v21 = 0;
  }
  unint64_t v125 = (unint64_t)v21;
  if ((char *)v22 == v21) {
    goto LABEL_207;
  }
  BOOL v120 = v17;
  uint64_t v126 = 0;
  v23 = 0;
  unint64_t v124 = 0;
  if (v134) {
    uint64_t v24 = -1;
  }
  else {
    uint64_t v24 = 1;
  }
  uint64_t v127 = v24;
  unint64_t v133 = 0x7FFFFFFFFFFFFFFFLL;
  while (2)
  {
    v22 += v132;
    if (v23) {
      goto LABEL_171;
    }
    v152[0] = 0uLL;
    NSUInteger location = self->_cachedRange.location;
    BOOL v27 = v22 >= location;
    NSUInteger v26 = v22 - location;
    BOOL v27 = !v27 || v26 >= self->_cachedRange.length;
    if (!v27)
    {
      indexTable = self->_indexTable;
      _NSBlockNumberForIndex(indexTable, v22, v152);
      unint64_t v30 = indexTable->_gapBlockIndex <= v29 ? indexTable->_maxBlocks - indexTable->_numBlocks : 0;
      unint64_t v31 = *(void *)&indexTable->_runs->var1[(indexTable->_elementSize + 8) * (v30 + v29)];
      if (v31 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (__NSTextContentStorageFlushUncachedTextElements((NSUInteger)self, (uint64_t)v139, 1))
        {
          v38 = self->_indexTable;
          _NSBlockNumberForIndex(v38, v22, v152);
          if (v38->_gapBlockIndex <= v39) {
            unint64_t v40 = v38->_maxBlocks - v38->_numBlocks;
          }
          else {
            unint64_t v40 = 0;
          }
          unint64_t v31 = *(void *)&v38->_runs->var1[(v38->_elementSize + 8) * (v40 + v39)];
        }
        unint64_t v58 = *((void *)&v139[0] + 1);
        if (v31 < *((void *)&v139[0] + 1) || v31 - *((void *)&v139[0] + 1) >= *(void *)&v139[1])
        {
          v60 = [(NSStorage *)self->_elements pointerToElement:v31 directlyAccessibleElements:(char *)v139 + 8];
          *(void *)&v139[0] = v60;
          unint64_t v58 = v31;
          if (*((void *)&v139[0] + 1) != v31)
          {
            v60 += 8 * (*((void *)&v139[0] + 1) - v31);
            *(void *)&v139[0] = v60;
            unint64_t v58 = *((void *)&v139[0] + 1);
          }
        }
        else
        {
          v60 = *(char **)&v139[0];
        }
        v23 = *(NSTextParagraph **)&v60[8 * (v31 - v58)];
        uint64_t v142 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_140;
      }
    }
    if (v124 >= v141)
    {
      v23 = 0;
      goto LABEL_140;
    }
    NSUInteger v151 = 0;
    NSUInteger v150 = 0;
    NSUInteger v149 = 0;
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    _UIFoundationAssert(self, v33, [(NSTextStorage *)self->_textStorage editedMask] == 0, &__block_literal_global_319);
    -[NSString getParagraphStart:end:contentsEnd:forRange:]([(NSAttributedString *)[(NSTextContentStorage *)self attributedString] string], "getParagraphStart:end:contentsEnd:forRange:", &v151, &v150, &v149, __NSTextContentStorageQueryDocumentLocationDeltaForLocation((uint64_t)self, v22, (uint64_t)v139) + v22, 1);
    [(NSTextContentStorage *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v34 = [[NSCountableTextLocation alloc] initWithIndex:v22];
      v23 = (NSTextParagraph *)(id)objc_msgSend(-[NSTextContentStorage delegate](self, "delegate"), "textContentManager:textElementAtLocation:", self, v34);

      NSUInteger v35 = v151;
      NSUInteger v36 = v150;
      NSUInteger range1 = v150 - v151;
      if (v23)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        char v121 = isKindOfClass ^ 1;
        unsigned int v119 = 1;
        goto LABEL_118;
      }
    }
    else
    {
      NSUInteger v35 = v151;
      NSUInteger v36 = v150;
      NSUInteger range1 = v150 - v151;
    }
    v41 = [(NSTextContentStorage *)self attributedString];
    range2.NSUInteger length = 0;
    range2.NSUInteger location = 0;
    id v42 = [(NSAttributedString *)v41 attribute:@"NSAttachment", v22, &range2, v35, range1 atIndex longestEffectiveRange inRange];
    char v43 = v42 != 0;
    [(NSTextContentStorage *)self delegate];
    char v44 = objc_opt_respondsToSelector();
    if (v42 && [v42 embeddingType] == 1)
    {
      NSUInteger v45 = v150 - v22;
      if (v22 + 1 == v149) {
        uint64_t v46 = v150 - v22;
      }
      else {
        uint64_t v46 = 1;
      }
      NSUInteger range1 = v46;
      if ((v44 & 1) != 0
        && (v23 = (NSTextParagraph *)(id)objc_msgSend(-[NSTextContentStorage delegate](self, "delegate"), "textContentStorage:textParagraphWithRange:", self, v22, v46)) != 0|| (v47 = -[NSTextParagraph initWithTextAttachment:attributes:]([NSTextParagraph alloc], "initWithTextAttachment:attributes:", v42, -[NSAttributedString attributesAtIndex:effectiveRange:](v41, "attributesAtIndex:effectiveRange:", v22, 0)), v23 = v47, range1 < 2))
      {
        char v121 = 1;
        NSUInteger v52 = v22;
      }
      else
      {
        v48 = (void *)[(NSAttributedString *)[(NSTextParagraph *)v47 attributedString] mutableCopy];
        v49 = (void *)[v48 mutableString];
        uint64_t v50 = [v48 length];
        v51 = [(NSAttributedString *)v41 string];
        objc_msgSend(v49, "replaceCharactersInRange:withString:", v50, 0, -[NSString substringWithRange:](v51, "substringWithRange:", v149, v150 - v149));
        [(NSTextParagraph *)v23 setAttributedString:v48];

        char v121 = 1;
        NSUInteger v52 = v22;
        NSUInteger range1 = v45;
      }
      char v43 = 1;
      goto LABEL_116;
    }
    NSRange v53 = range2;
    if (range2.location == v35 && range2.length == range1)
    {
      NSUInteger v52 = v35;
      if (v44) {
        goto LABEL_101;
      }
LABEL_102:
      v147[1] = 0;
      v147[0] = 0;
      if ([(id)objc_opt_class() _usesTextListElements]) {
        id v65 = [(NSAttributedString *)v41 attribute:@"NSParagraphStyle", v52, v147, v52, range1 atIndex longestEffectiveRange inRange];
      }
      else {
        id v65 = 0;
      }
      if (!objc_msgSend((id)objc_msgSend(v65, "textLists"), "count")
        || (NSUInteger v146 = 0,
            NSUInteger v145 = 0,
            (v23 = (NSTextParagraph *)+[NSTextListElement _rootTextListElementFromAttributedString:v41 atIndex:v52 options:[(NSTextContentStorage *)self includesTextListMarkers] effectiveRange:&v145 textListElementInstantiationCallback:&__block_literal_global_330]) == 0))
      {
        if ([(NSTextContentStorage *)self copiesContentsInTextParagraphs])
        {
          if ([(NSTextStorage *)[(NSTextContentStorage *)self textStorage] _isSwiftAttributedString])
          {
            uint64_t v67 = -[NSTextStorage _nsAttributedSubstringFromRange:]([(NSTextContentStorage *)self textStorage], "_nsAttributedSubstringFromRange:", v52, range1);
          }
          else
          {
            uint64_t v67 = -[NSAttributedString attributedSubstringFromRange:](v41, "attributedSubstringFromRange:", v52, range1);
          }
          v68 = [[NSTextParagraph alloc] initWithAttributedString:v67];
        }
        else
        {
          v68 = -[NSTextParagraph initWithAttributedString:range:]([NSTextParagraph alloc], "initWithAttributedString:range:", v41, v52, range1);
        }
        v23 = v68;
        goto LABEL_115;
      }
      char v121 = 0;
      NSUInteger v52 = v145;
      NSUInteger range1 = v146;
      NSUInteger v149 = v146 + v145;
      BOOL v66 = 1;
      goto LABEL_117;
    }
    v154.NSUInteger location = v35;
    v154.NSUInteger length = range1;
    NSRange v54 = NSIntersectionRange(v154, v53);
    NSUInteger v52 = v54.location;
    NSUInteger length = v54.length;
    NSUInteger v56 = range2.location;
    if (v35 >= range2.location || !v144 && v143) {
      goto LABEL_88;
    }
    NSUInteger length = v54.location + v54.length - v35;
    while (1)
    {
      id v57 = [(NSAttributedString *)v41 attribute:@"NSAttachment", v56 - 1, &range2, v35, v56 - v35 atIndex longestEffectiveRange inRange];
      if (v57) {
        break;
      }
LABEL_65:
      NSUInteger v56 = range2.location;
      if (v35 >= range2.location)
      {
        v43 &= 1u;
        NSUInteger v52 = v35;
        goto LABEL_88;
      }
    }
    if ([v57 embeddingType] != 1)
    {
      char v43 = 1;
      goto LABEL_65;
    }
    BOOL v61 = range2.length + range2.location < v36 && range2.length + range2.location == v149;
    char v43 = 1;
    if (v61) {
      NSUInteger length = v36 - range2.location;
    }
    else {
      NSUInteger length = v54.location + v54.length - (range2.length + range2.location);
    }
    if (v61) {
      NSUInteger v52 = range2.location;
    }
    else {
      NSUInteger v52 = range2.length + range2.location;
    }
LABEL_88:
    range2.NSUInteger location = v52;
    range2.NSUInteger length = length;
    NSUInteger v62 = v52 + length;
    if (v52 + length >= v36 || !(v144 | v143)) {
      goto LABEL_97;
    }
    NSUInteger length = v36 - v52;
    while (2)
    {
      id v63 = [(NSAttributedString *)v41 attribute:@"NSAttachment", v62, &range2, v62, v36 - v62 atIndex longestEffectiveRange inRange];
      if (!v63)
      {
LABEL_94:
        NSUInteger v62 = range2.length + range2.location;
        if (range2.length + range2.location >= v36) {
          goto LABEL_97;
        }
        continue;
      }
      break;
    }
    if ([v63 embeddingType] != 1)
    {
      char v43 = 1;
      goto LABEL_94;
    }
    NSUInteger length = range2.location - v52;
    char v43 = 1;
LABEL_97:
    if (length + v52 == v149) {
      NSUInteger v64 = v150 - v52;
    }
    else {
      NSUInteger v64 = length;
    }
    NSUInteger range1 = v64;
    if ((v44 & 1) == 0) {
      goto LABEL_102;
    }
LABEL_101:
    v23 = (NSTextParagraph *)(id)objc_msgSend(-[NSTextContentStorage delegate](self, "delegate"), "textContentStorage:textParagraphWithRange:", self, v52, range1);
    if (!v23) {
      goto LABEL_102;
    }
LABEL_115:
    char v121 = 0;
LABEL_116:
    [(NSTextParagraph *)v23 _setContainsTextAttachments:v43 & 1];
    BOOL v66 = v52 == v151;
LABEL_117:
    unsigned int v119 = v66;
    char isKindOfClass = 1;
    NSUInteger v35 = v52;
LABEL_118:
    NSUInteger v69 = v149;
    BOOL v70 = v143;
    v71 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v35, range1);
    [(NSTextElement *)v23 setTextContentManager:self];
    [(NSTextParagraph *)v23 setElementRange:v71];

    uint64_t v72 = (v121 & 1) == 0;
    if (isKindOfClass)
    {
      BOOL v73 = v69 - v35 < range1 && v69 >= v35;
      unint64_t v74 = v35 + range1;
      if (v73) {
        NSUInteger v75 = v69;
      }
      else {
        NSUInteger v75 = v35 + range1;
      }
      v76 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v35, v75 - v35);
      [(NSTextParagraph *)v23 setParagraphContentRange:v76];

      v77 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v75, v74 - v75);
      [(NSTextParagraph *)v23 setParagraphSeparatorRange:v77];

      if ((v121 & 1) == 0) {
        uint64_t v72 = [(NSTextElement *)v23 coalescingType];
      }
      [(NSTextParagraph *)v23 setIsBeginningOfParagraph:v119];
      BOOL v78 = v74 > v75
         || v74 >= [(NSAttributedString *)[(NSTextContentStorage *)self attributedString] length];
      [(NSTextParagraph *)v23 setIsEndOfParagraph:v78];
    }
    __NSTextContentStorageFlushUncachedTextElements((NSUInteger)self, (uint64_t)v139, 0);
    if (*(void *)v140 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v79 = 63;
      if (v70) {
        uint64_t v79 = 0;
      }
      *(void *)v140 = v79;
    }
    else
    {
      v155.NSUInteger location = v35;
      v155.NSUInteger length = range1;
      NSRange v80 = NSUnionRange(*(NSRange *)&v140[8], v155);
      NSUInteger range1 = v80.length;
      NSUInteger v35 = v80.location;
    }
    *(void *)&v140[8] = v35;
    *(void *)&v140[16] = range1;
    [(NSTextElement *)v23 setCoalescingType:v72];
    *((void *)&v139[1] + *(void *)v140 + 1) = v23;
    if (v70) {
      uint64_t v81 = *(void *)v140 + 1;
    }
    else {
      uint64_t v81 = *(void *)v140 - 1;
    }
    *(void *)v140 = v81;
    ++v124;
LABEL_140:
    if ([(NSArray *)[(NSTextElement *)v23 childElements] count])
    {
      unint64_t v133 = [(NSTextRange *)[(NSTextElement *)v23 elementRange] range];
      uint64_t v126 = v82;
      v83 = [(NSTextElement *)v23 childElements];
      WORD2(v147[0]) = 0;
      LODWORD(v147[0]) = 0;
      if ([(NSArray *)v83 count])
      {
        unint64_t v84 = [(NSTextRange *)[(NSTextElement *)v23 elementRange] range];
        uint64_t v86 = v85;
        if (v134) {
          uint64_t v87 = [(NSArray *)v83 count] - 1;
        }
        else {
          uint64_t v87 = 0;
        }
        v91 = 0;
        if (v84 >= v22 || v84 + v86 <= v22)
        {
          v90 = v23;
        }
        else
        {
          NSUInteger v122 = v87;
          range2.NSUInteger location = 0;
          range1a = [[NSCountableTextLocation alloc] initWithIndex:v22];
          id v92 = [(NSTextElement *)v23 childTextElementForLocation:range1a elementIndex:&range2];
          if (v92)
          {
            v90 = (NSTextParagraph *)[v92 parentElement];
            v83 = [(NSTextElement *)v90 childElements];
            NSUInteger v122 = range2.location;
            v93 = [(NSTextElement *)v90 parentElement];
            v94 = 0;
            if (v93)
            {
              v95 = v90;
              do
              {
                v96 = (NSTextParagraph *)v93;
                uint64_t v97 = [(NSArray *)[(NSTextElement *)v93 childElements] indexOfObject:v95]+ v127;
                if (v94)
                {
                  objc_msgSend(v94, "insertObject:atIndex:", objc_msgSend(NSNumber, "numberWithInteger:", v97), 0);
                }
                else
                {
                  id v98 = objc_alloc(MEMORY[0x1E4F1CA48]);
                  v94 = objc_msgSend(v98, "initWithObjects:", objc_msgSend(NSNumber, "numberWithInteger:", v97), 0);
                }
                v93 = [(NSTextElement *)v96 parentElement];
                v95 = v96;
              }
              while (v93);
            }
            NSUInteger v99 = [v94 count];
            unint64_t v100 = v99;
            if (v99)
            {
              if (v99 < 0x81) {
                v101 = v152;
              }
              else {
                v101 = (__n128 *)NSZoneCalloc(0, v99, 8uLL);
              }
              uint64_t v102 = 0;
              do
              {
                v101->n128_u64[v102] = objc_msgSend((id)objc_msgSend(v94, "objectAtIndexedSubscript:", v102), "integerValue");
                ++v102;
              }
              while (v100 != v102);
              v91 = (void *)[objc_alloc(MEMORY[0x1E4F28D58]) initWithIndexes:v101 length:v100];
              if (v100 > 0x80) {
                NSZoneFree(0, v101);
              }
            }
            else
            {
              v91 = 0;
            }
          }
          else
          {
            v91 = 0;
            v90 = v23;
          }

          uint64_t v87 = v122;
        }
      }
      else
      {
        v90 = 0;
        v83 = 0;
        v91 = 0;
        uint64_t v87 = 0x7FFFFFFFFFFFFFFFLL;
      }
      *(void *)&long long v135 = v90;
      *((void *)&v135 + 1) = v83;
      id v136 = v91;
      uint64_t v137 = v87;
      LOWORD(v138) = v120;
      *(_DWORD *)((char *)&v138 + 2) = v147[0];
      HIWORD(v138) = WORD2(v147[0]);
      if (!v23) {
        goto LABEL_207;
      }
LABEL_171:
      while (1)
      {
        NextElement = (NSTextParagraph *)__NSTextContentStorageChildElementsEnumerationCacheGetNextElement((uint64_t)&v135);
        v88 = NextElement;
        if (!v144 || NextElement == 0) {
          break;
        }
        BOOL v105 = v143;
        v106 = [(NSTextElement *)NextElement elementRange];
        v107 = v106;
        if (v105)
        {
          if (![(NSTextRange *)v106 containsLocation:a3]) {
            continue;
          }
        }
        else if (objc_msgSend(-[NSTextRange location](v106, "location"), "compare:", a3) != -1 {
               || objc_msgSend(a3, "compare:", -[NSTextRange endLocation](v107, "endLocation")) == 1)
        }
        {
          continue;
        }
        if (v143)
        {
          id v108 = [(NSArray *)[(NSTextElement *)v88 childElements] firstObject];
          v109 = v108;
          if (v108)
          {
            if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v108, "elementRange"), "location"), "isEqual:", -[NSTextRange location](-[NSTextElement elementRange](v88, "elementRange"), "location")) & 1) == 0&& objc_msgSend(a3, "compare:", objc_msgSend((id)objc_msgSend(v109, "elementRange"), "location")) != -1)
            {
              continue;
            }
          }
        }
        goto LABEL_186;
      }
      if (!NextElement) {
        goto LABEL_207;
      }
LABEL_186:
      unint64_t v110 = [(NSTextRange *)[(NSTextElement *)v88 elementRange] range];
      unint64_t v89 = v134;
      if ((v134 & 1) != 0 && v110 <= v133)
      {
        if ((NSTextParagraph *)[(NSTextElement *)v88 parentElement] == v23) {
          goto LABEL_189;
        }
      }
      else if ((v134 & 1) == 0 {
             && v110 + v111 >= v126 + v133
      }
             && ![(NSTextElement *)v88 _firstRepresentableChildElement])
      {
LABEL_189:

        uint64_t v126 = 0;
        v23 = 0;
        id v136 = 0;
        unint64_t v133 = 0x7FFFFFFFFFFFFFFFLL;
      }
LABEL_193:
      uint64_t v112 = [(NSTextRange *)[(NSTextElement *)v88 elementRange] range];
      uint64_t v114 = v113;
      if ((v131 & 1) != 0
        && (objc_msgSend(-[NSTextContentStorage delegate](self, "delegate"), "textContentManager:shouldEnumerateTextElement:options:", self, v88, v89) & 1) == 0)
      {
        if (v89) {
          uint64_t v117 = 0;
        }
        else {
          uint64_t v117 = v114;
        }
        unint64_t v22 = v117 + v112;
      }
      else
      {
        int v115 = (*((uint64_t (**)(id, NSTextParagraph *))a5 + 2))(a5, v88);
        if (v89) {
          uint64_t v116 = 0;
        }
        else {
          uint64_t v116 = v114;
        }
        unint64_t v22 = v116 + v112;
        if (!v115) {
          goto LABEL_207;
        }
      }
      unsigned __int8 v144 = 0;
      if (!v23 && v22 == v125)
      {
        unint64_t v22 = v125;
        goto LABEL_207;
      }
      continue;
    }
    break;
  }
  if (v23)
  {
    v88 = v23;
    v23 = 0;
    unint64_t v89 = v134;
    goto LABEL_193;
  }
LABEL_207:
  v10 = [[NSCountableTextLocation alloc] initWithIndex:v22];
  __NSTextContentStorageFlushUncachedTextElements((NSUInteger)self, (uint64_t)v139, 1);
  self->_activeEnumerationCache = v123;
  if (v123) {
    v123->var1 = (_NSRange)xmmword_18E5F72A0;
  }

LABEL_210:
  objc_sync_exit(self);
  return v10;
}

- (id)locationFromLocation:(id)location withOffset:(NSInteger)offset
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"-[%@ %@] received invalid location %@", self, NSStringFromSelector(a2), location format];
  }
  if ([location isEndOfDocument]) {
    uint64_t v8 = [(NSAttributedString *)[(NSTextContentStorage *)self attributedString] length];
  }
  else {
    uint64_t v8 = [location characterIndex];
  }
  unint64_t v9 = v8 + offset;
  if (v8 + offset < 0
    || v9 > [(NSAttributedString *)[(NSTextContentStorage *)self attributedString] length])
  {
    return 0;
  }
  if (!offset) {
    return location;
  }
  v11 = [[NSCountableTextLocation alloc] initWithIndex:v9];

  return v11;
}

- (NSInteger)offsetFromLocation:(id)from toLocation:(id)to
{
  if ([from isEndOfDocument]) {
    uint64_t v8 = [(NSAttributedString *)[(NSTextContentStorage *)self attributedString] length];
  }
  else {
    uint64_t v8 = [from characterIndex];
  }
  uint64_t v9 = v8;
  if ([to isEndOfDocument]) {
    uint64_t v10 = [(NSAttributedString *)[(NSTextContentStorage *)self attributedString] length];
  }
  else {
    uint64_t v10 = [to characterIndex];
  }
  uint64_t v11 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"-[%@ %@] received invalid locations %@ %@", self, NSStringFromSelector(a2), from, to format];
  }
  return v11 - v9;
}

- (NSAttributedString)attributedString
{
  v2 = self->_attributedString;

  return v2;
}

- (BOOL)_supportsTextAttributesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v6 = [(NSTextContentStorage *)self textStorage];
  v7 = [(NSTextContentStorage *)self attributedString];
  uint64_t v8 = [(NSTextStorage *)v6 ensuresFixingAttributes];
  if (v8) {
    [(NSTextStorage *)v6 setEnsuresFixingAttributes:0];
  }
  v17.NSUInteger length = [(NSAttributedString *)v7 length];
  v17.NSUInteger location = 0;
  v18.NSUInteger location = location;
  v18.NSUInteger length = length;
  NSRange v9 = NSIntersectionRange(v17, v18);
  if (v9.length)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__NSTextContentStorage__supportsTextAttributesInRange___block_invoke;
    v12[3] = &unk_1E55C6630;
    v12[4] = &v13;
    [(NSAttributedString *)v7 enumerateAttribute:@"NSParagraphStyle", v9.location, v9.length, 0x100000, v12 inRange options usingBlock];
  }
  [(NSTextStorage *)v6 setEnsuresFixingAttributes:v8];
  BOOL v10 = *((unsigned char *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (NSTextStorage)textStorage
{
  return self->_textStorage;
}

- (id)delegate
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextContentStorage;
  return [(NSTextContentManager *)&v3 delegate];
}

+ (BOOL)_usesTextListElements
{
  if (_usesTextListElements_onceToken != -1) {
    dispatch_once(&_usesTextListElements_onceToken, &__block_literal_global_24);
  }
  return _usesTextListElements_usesTextListElements;
}

- (BOOL)copiesContentsInTextParagraphs
{
  return self->_copiesContentsInTextParagraphs;
}

- (NSCountableTextRange)documentRange
{
  objc_sync_enter(self);
  documentRange = self->_documentRange;
  if (!documentRange)
  {
    documentRange = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", 0, [(NSAttributedString *)[(NSTextContentStorage *)self attributedString] length]);
    self->_documentRange = documentRange;
  }
  objc_sync_exit(self);
  return documentRange;
}

- (void)synchronizeTextLayoutManagers:(id)a3
{
  objc_sync_enter(self);
  v8.receiver = self;
  v8.super_class = (Class)NSTextContentStorage;
  [(NSTextContentManager *)&v8 synchronizeTextLayoutManagers:a3];
  if (!-[NSTextContentStorage _supportsTextAttributesInRange:](self, "_supportsTextAttributesInRange:", self->_invalidatedRange.location, self->_invalidatedRange.length))
  {
    v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:NSTextContentStorageUnsupportedAttributeAddedNotification object:self];
  }
  if (!self->_notifyingToFixSelection && self->_editedRange.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_notifyingToFixSelection = 1;
    if ((self->_editedMask & 2) != 0)
    {
      textLayoutManagers = self->super._textLayoutManagers;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __54__NSTextContentStorage_synchronizeTextLayoutManagers___block_invoke;
      v7[3] = &unk_1E55C7868;
      v7[4] = self;
      [(NSMutableArray *)textLayoutManagers enumerateObjectsUsingBlock:v7];
    }
    self->_notifyingToFixSelection = 0;
    self->_invalidatedRange = (_NSRange)xmmword_18E5F72A0;
    self->_editedRange = (_NSRange)xmmword_18E5F72A0;
    self->_editedDelta = 0;
    self->_editedMask = 0;
  }
  objc_sync_exit(self);
}

- (BOOL)isCountableDataSource
{
  return 1;
}

- (void)dealloc
{
  [(NSTextContentStorage *)self setAttributedString:0];

  v3.receiver = self;
  v3.super_class = (Class)NSTextContentStorage;
  [(NSTextContentManager *)&v3 dealloc];
}

- (void)setDelegate:(id)delegate
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextContentStorage;
  [(NSTextContentManager *)&v3 setDelegate:delegate];
}

- (NSTextContentStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)NSTextContentStorage;
  v2 = [(NSTextContentManager *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(NSTextContentStorage *)v2 _commonInitialization];
    v4 = objc_alloc_init(NSTextStorage);
    [(NSTextContentStorage *)v3 setTextStorage:v4];
  }
  return v3;
}

- (void)_commonInitialization
{
  self->_indexTable = [[NSRunStorage alloc] initWithElementSize:32 capacity:0];
  self->_elements = [[NSStorage alloc] initWithElementSize:8 capacity:0];
  self->_cachedRange = (_NSRange)xmmword_18E5F72A0;
  self->_modifiedRange = (_NSRange)xmmword_18E5F72A0;
  self->_modifiedDocumentLengthDelta = 0;
  self->_invalidatedRange = (_NSRange)xmmword_18E5F72A0;
  self->_editedRange = (_NSRange)xmmword_18E5F72A0;
  self->_editedDelta = 0;
  self->_editedMask = 0;
  if ([(id)objc_opt_class() _includesTextListMarkers]) {
    char v3 = objc_msgSend((id)objc_opt_class(), "__isNotesTextContentStorageClass") ^ 1;
  }
  else {
    char v3 = 0;
  }
  self->_includesTextListMarkers = v3;
}

+ (BOOL)_includesTextListMarkers
{
  if (_includesTextListMarkers_onceToken != -1) {
    dispatch_once(&_includesTextListMarkers_onceToken, &__block_literal_global_164);
  }
  return _includesTextListMarkers_includesTextListMarkers;
}

- (void)setTextStorage:(id)a3
{
  textStorage = self->_textStorage;
  if (textStorage != a3)
  {
    [(NSTextStorage *)textStorage setTextStorageObserver:0];
    objc_sync_enter(self);
    [(NSTextStorage *)self->_textStorage _setShouldSetOriginalFontAttribute:0];
    self->_textStorage = (NSTextStorage *)a3;
    [a3 _setShouldSetOriginalFontAttribute:1];
    objc_sync_exit(self);
    [(NSTextContentStorage *)self setAttributedString:a3];
    [a3 setTextStorageObserver:self];
    if ([a3 _isSwiftAttributedString])
    {
      [(NSTextContentStorage *)self setCopiesContentsInTextParagraphs:1];
    }
  }
}

- (void)setAttributedString:(NSAttributedString *)attributedString
{
  if (self->_attributedString != attributedString)
  {
    objc_sync_enter(self);
    documentRange = self->_documentRange;
    if (documentRange && ![(NSCountableTextRange *)documentRange isEmpty])
    {
      textLayoutManagers = self->super._textLayoutManagers;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __44__NSTextContentStorage_setAttributedString___block_invoke;
      v8[3] = &unk_1E55C7868;
      v8[4] = self;
      [(NSMutableArray *)textLayoutManagers enumerateObjectsUsingBlock:v8];
      [(NSTextContentStorage *)self synchronizeTextLayoutManagers:0];
    }

    if ((NSAttributedString *)self->_textStorage == attributedString)
    {
      self->_attributedString = attributedString;
    }
    else
    {
      self->_attributedString = (NSAttributedString *)[(NSAttributedString *)attributedString copy];
      self->_textStorage = 0;
    }
    objc_sync_enter(self);
    v9[0] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v9[1] = xmmword_18E5F73B0;
    __NSTextContentStorageEnumerateCachedElementsInElementIndexRange((NSUInteger)self, 0, [(NSStorage *)self->_elements count], (uint64_t)&__block_literal_global_307);
    -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](self->_indexTable, "replaceElementsInRange:withElement:coalesceRuns:", 0, [(NSRunStorage *)self->_indexTable count], v9, 1);
    -[NSStorage removeElementsInRange:](self->_elements, "removeElementsInRange:", 0, [(NSStorage *)self->_elements count]);
    self->_cachedRange = (_NSRange)xmmword_18E5F72A0;
    objc_sync_exit(self);

    self->_documentRange = 0;
    if (!-[NSTextContentStorage _supportsTextAttributesInRange:](self, "_supportsTextAttributesInRange:", 0, [(NSAttributedString *)self->_attributedString length]))
    {
      v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:NSTextContentStorageUnsupportedAttributeAddedNotification object:self];
    }
    objc_sync_exit(self);
  }
}

- (BOOL)includesTextListMarkers
{
  return self->_includesTextListMarkers;
}

uint64_t __48__NSTextContentStorage__includesTextListMarkers__block_invoke()
{
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "valueForKey:", @"_NSTextContentStorageIncludesTextListMarkers");
  if (objc_opt_respondsToSelector()) {
    uint64_t result = [v0 BOOLValue];
  }
  else {
    uint64_t result = +[NSTextList includesTextListMarkers];
  }
  _includesTextListMarkers_includesTextListMarkers = result;
  return result;
}

uint64_t __55__NSTextContentStorage__supportsTextAttributesInRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "textBlocks"), "count");
    if (result)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }
  }
  return result;
}

- (void)beginEditingTransaction
{
}

- (void)endEditingTransaction
{
}

- (void)processEditingForTextStorage:(id)a3 edited:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 invalidatedRange:(_NSRange)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v10 = -[NSTextContentStorage _applyEditedRangeAdjustmentsToRange:](self, "_applyEditedRangeAdjustmentsToRange:", a7.location, a7.length);
  if (v11) {
    NSUInteger v12 = v10;
  }
  else {
    NSUInteger v12 = a7.location;
  }
  if (v11) {
    NSUInteger v13 = v11;
  }
  else {
    NSUInteger v13 = a7.length;
  }
  NSUInteger v86 = [(NSString *)[(NSAttributedString *)[(NSTextContentStorage *)self attributedString] string] length];
  v95.NSUInteger length = v13 - a6;
  p_cachedRange = &self->_cachedRange;
  v95.NSUInteger location = v12;
  NSUInteger v91 = v13 - a6;
  NSRange v15 = NSIntersectionRange(v95, self->_cachedRange);
  NSUInteger v16 = v15.location;
  NSUInteger v17 = v15.length;
  unint64_t v89 = a4;
  NSUInteger v90 = v13;
  if (v15 == 0uLL)
  {
    if ((a4 & 2) == 0
      || (NSUInteger v16 = v12, v12 != self->_cachedRange.length + self->_cachedRange.location)
      && (NSUInteger v16 = p_cachedRange->location, v12 + v91 != p_cachedRange->location))
    {
      objc_sync_enter(self);
      NSUInteger v17 = 0;
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_73;
    }
  }
  objc_sync_enter(self);
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_73;
  }
  unint64_t v19 = [(NSRunStorage *)self->_indexTable count];
  unint64_t v84 = v19;
  if (v16 > v19)
  {
    uint64_t v18 = v16;
    goto LABEL_67;
  }
  NSRange range2 = (NSRange)0;
  if (v16 == v19)
  {
    range2.NSUInteger location = v16;
    range2.NSUInteger length = v15.length;
    unsigned int v20 = 3;
    goto LABEL_21;
  }
  indexTable = self->_indexTable;
  _NSBlockNumberForIndex(indexTable, v16, (__n128 *)&range2);
  if (indexTable->_gapBlockIndex <= v22) {
    unint64_t v23 = indexTable->_maxBlocks - indexTable->_numBlocks;
  }
  else {
    unint64_t v23 = 0;
  }
  unsigned int v20 = indexTable->_runs->var1[(indexTable->_elementSize + 8) * (v23 + v22) + 24];
  v24.NSUInteger location = range2.location;
  if (v16 == range2.location)
  {
LABEL_21:
    NSUInteger v25 = v15.length;
    if (!v15.length)
    {
      if ((v20 & 3) == 0)
      {
        NSUInteger v25 = 0;
        if (v16) {
          goto LABEL_25;
        }
        goto LABEL_38;
      }
      NSUInteger v25 = range2.length;
    }
    if (v16)
    {
LABEL_25:
      NSUInteger range1a = v25;
      NSUInteger v26 = self->_indexTable;
      *(void *)&double v27 = _NSBlockNumberForIndex(v26, v16 - 1, (__n128 *)&range2).n128_u64[0];
      unint64_t v29 = v28;
      if (v26->_gapBlockIndex <= v28) {
        unint64_t v30 = v26->_maxBlocks - v26->_numBlocks;
      }
      else {
        unint64_t v30 = 0;
      }
      runs = v26->_runs;
      unint64_t elementSize = v26->_elementSize;
      NSUInteger v35 = [(NSAttributedString *)[(NSTextContentStorage *)self attributedString] string];
      unsigned int v20 = runs->var1[(elementSize + 8) * (v30 + v29) + 24];
      if ((v20 & 2) != 0
        || (v20 & 4) != 0
        && (NSUInteger v36 = v35, v16 < [(NSString *)v35 length])
        && [(NSString *)v36 characterAtIndex:v16] == 10)
      {
        v97.NSUInteger location = v16;
        v97.NSUInteger length = range1;
        NSRange v37 = NSUnionRange(v97, range2);
        uint64_t v18 = v37.location;
        NSUInteger v25 = v37.length;
      }
      else
      {
        uint64_t v18 = v16;
        NSUInteger v25 = range1;
      }
      goto LABEL_39;
    }
LABEL_38:
    uint64_t v18 = 0;
LABEL_39:
    BOOL v32 = v16 == v18;
    goto LABEL_40;
  }
  if (range2.location >= v16)
  {
    BOOL v32 = 0;
    uint64_t v18 = v16;
    NSUInteger v25 = v15.length;
  }
  else
  {
    v24.NSUInteger length = range2.length;
    v96.NSUInteger location = v16;
    v96.NSUInteger length = v15.length;
    NSRange v31 = NSUnionRange(v96, v24);
    uint64_t v18 = v31.location;
    BOOL v32 = 0;
    NSUInteger v25 = v31.length;
  }
LABEL_40:
  if (!v25)
  {
    NSUInteger v17 = 0;
    goto LABEL_67;
  }
  int v38 = (v20 >> 3) & 1;
  NSUInteger range1 = v25;
  unint64_t v39 = v25 + v18;
  if (v25 + v18 < v84)
  {
    unint64_t v40 = self->_indexTable;
    _NSBlockNumberForIndex(v40, v39, (__n128 *)&range2);
    if (v40->_gapBlockIndex <= v41) {
      unint64_t v42 = v40->_maxBlocks - v40->_numBlocks;
    }
    else {
      unint64_t v42 = 0;
    }
    unsigned __int8 v47 = v40->_runs->var1[(v40->_elementSize + 8) * (v42 + v41) + 24];
    v48.NSUInteger location = range2.location;
    if (range2.location < v39 || (v47 & 1) != 0 && v16 + v15.length >= range2.location)
    {
      v48.NSUInteger length = range2.length;
      v98.NSUInteger location = v18;
      v98.NSUInteger length = range1;
      NSRange v49 = NSUnionRange(v98, v48);
      NSUInteger range1 = v49.length;
      uint64_t v18 = v49.location;
      if ((v47 & 1) != 0 && v32 && v16 + v15.length == range2.location && v49.location)
      {
        uint64_t v50 = self->_indexTable;
        _NSBlockNumberForIndex(v50, v49.location - 1, (__n128 *)&range2);
        unint64_t v52 = v50->_gapBlockIndex <= v51 ? v50->_maxBlocks - v50->_numBlocks : 0;
        unsigned __int8 v47 = v50->_runs->var1[(v50->_elementSize + 8) * (v52 + v51) + 24];
        if ((v47 & 2) != 0)
        {
          NSRange v81 = NSUnionRange(v49, range2);
          NSUInteger range1 = v81.length;
          uint64_t v18 = v81.location;
        }
      }
    }
    else
    {
      int v38 = 0;
    }
    NSUInteger v43 = v84;
    if (!(v38 | ((v47 & 8) >> 3))) {
      goto LABEL_66;
    }
LABEL_46:
    NSUInteger v17 = range1;
    if (range1 && range1 + v18 < v43)
    {
      char v44 = self->_indexTable;
      _NSBlockNumberForIndex(v44, range1 + v18, (__n128 *)&range2);
      unint64_t v46 = v44->_gapBlockIndex <= v45 ? v44->_maxBlocks - v44->_numBlocks : 0;
      NSUInteger v17 = range1;
      v53.NSUInteger location = range2.location;
      if (range2.location < range1 + v18 || (v44->_runs->var1[(v44->_elementSize + 8) * (v46 + v45) + 24] & 8) != 0)
      {
        v53.NSUInteger length = range2.length;
        v99.NSUInteger location = v18;
        v99.NSUInteger length = range1;
        NSRange v54 = NSUnionRange(v99, v53);
        uint64_t v18 = v54.location;
        NSUInteger v17 = v54.length;
      }
    }
    goto LABEL_67;
  }
  NSUInteger v43 = v84;
  if (v38) {
    goto LABEL_46;
  }
LABEL_66:
  NSUInteger v17 = range1;
LABEL_67:
  uint64_t ElementIndexRangeForRange = __NSTextContentStorageGetElementIndexRangeForRange((uint64_t)self, v18, v17);
  NSUInteger v57 = v56;
  if (v56)
  {
    NSUInteger v58 = ElementIndexRangeForRange;
    NSRange range2 = (NSRange)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    long long v94 = xmmword_18E5F73B0;
    if (ElementIndexRangeForRange + v56 <= [(NSStorage *)self->_elements count])
    {
      uint64_t v18 = objc_msgSend((id)objc_msgSend(*(id *)-[NSStorage elementAtIndex:](self->_elements, "elementAtIndex:", v58), "elementRange"), "range");
      NSUInteger v17 = v59;
      if (v57 >= 2)
      {
        v103.NSUInteger location = objc_msgSend((id)objc_msgSend(*(id *)-[NSStorage elementAtIndex:](self->_elements, "elementAtIndex:", v58 + v57 - 1), "elementRange"), "range");
        v103.NSUInteger length = v60;
        v100.NSUInteger location = v18;
        v100.NSUInteger length = v17;
        NSRange v61 = NSUnionRange(v100, v103);
        uint64_t v18 = v61.location;
        NSUInteger v17 = v61.length;
      }
    }
    else
    {
      NSUInteger v17 = 0;
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](self->_indexTable, "replaceElementsInRange:withElement:coalesceRuns:", v18, v17, &range2, 1, range1);
    __NSTextContentStorageReleaseElementsInRange((NSUInteger)self, v58, v57);
    -[NSStorage removeElementsInRange:](self->_elements, "removeElementsInRange:", v58, v57);
    __NSTextContentStorageUpdateElementIndexRangeForRange((uint64_t)self, 0, 0, 0, v18 + v17, [(NSRunStorage *)self->_indexTable count] - (v18 + v17), -(uint64_t)v57);
    __NSTextContentStorageUpdateCachedRange((uint64_t)self);
  }
LABEL_73:
  if (a6)
  {
    unint64_t v62 = [(NSRunStorage *)self->_indexTable count];
    unint64_t v63 = v62;
    unint64_t v64 = v86 - a6;
    if (v86 - a6 >= v62) {
      unint64_t v64 = v62;
    }
    unint64_t v65 = v64 - (v12 + v91);
    if (v64 > v12 + v91)
    {
      uint64_t v66 = __NSTextContentStorageGetElementIndexRangeForRange((uint64_t)self, v12 + v91, v64 - (v12 + v91));
      NSUInteger v68 = v67;
      if (v67)
      {
        NSUInteger v85 = v66;
        NSRange range2 = (NSRange)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        *(void *)&long long v94 = 0;
        *((void *)&v94 + 1) = 1;
        -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](self->_indexTable, "replaceElementsInRange:withElement:coalesceRuns:", v12 + v91, v65, &range2, 1);
        if (v86 > v63) {
          -[NSRunStorage insertElement:range:coalesceRuns:](self->_indexTable, "insertElement:range:coalesceRuns:", &range2, v63, v86 - v63, 1);
        }
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __98__NSTextContentStorage_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange___block_invoke;
        v92[3] = &unk_1E55C78D8;
        v92[4] = self;
        v92[5] = a6;
        __NSTextContentStorageEnumerateCachedElementsInElementIndexRange((NSUInteger)self, v85, v68, (uint64_t)v92);
        __NSTextContentStorageUpdateCachedRange((uint64_t)self);
      }
    }

    self->_documentRange = 0;
  }
  if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v69 = v91;
  }
  else {
    NSUInteger v69 = v17;
  }
  BOOL v70 = [NSCountableTextRange alloc];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v71 = v12;
  }
  else {
    NSUInteger v71 = v18;
  }
  uint64_t v72 = -[NSCountableTextRange initWithRange:](v70, "initWithRange:", v71, v69, range1);
  BOOL v73 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v71, v69 + a6);
  [(NSTextContentManager *)self recordEditActionInRange:v72 newTextRange:v73];

  p_editedRange = &self->_editedRange;
  NSUInteger v75 = self->_editedRange.location;
  if (v75 == 0x7FFFFFFFFFFFFFFFLL)
  {
    p_editedRange->NSUInteger location = location;
    self->_editedRange.NSUInteger length = length;
    self->_editedDelta = a6;
    self->_editedMask = v89;
  }
  else
  {
    if (location >= v75) {
      NSUInteger v76 = self->_editedRange.location;
    }
    else {
      NSUInteger v76 = location;
    }
    NSUInteger v77 = self->_editedRange.length + v75 - self->_editedDelta;
    if (length - a6 + location > v77) {
      NSUInteger v77 = length - a6 + location;
    }
    p_editedRange->NSUInteger location = v76;
    self->_editedRange.NSUInteger length = a6 - v76 + v77;
    self->_editedDelta += a6;
    self->_editedMask |= v89;
  }
  v78.NSUInteger length = v90;
  p_invalidatedRange = &self->_invalidatedRange;
  if (self->_invalidatedRange.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    p_invalidatedRange->NSUInteger location = v12;
    self->_invalidatedRange.NSUInteger length = v90;
  }
  else
  {
    v101.NSUInteger location = p_editedRange->location;
    v101.NSUInteger length = self->_editedRange.length;
    v78.NSUInteger location = v12;
    NSRange v104 = NSUnionRange(v101, v78);
    v102.NSUInteger location = p_invalidatedRange->location;
    v102.NSUInteger length = self->_invalidatedRange.length;
    NSRange v80 = NSUnionRange(v102, v104);
    p_invalidatedRange->NSUInteger location = v80.location;
    self->_invalidatedRange.NSUInteger length = v80.length;
  }
  objc_sync_exit(self);
}

- (_NSRange)_applyEditedRangeAdjustmentsToRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id obj = (id)objc_opt_class();
  objc_sync_enter(obj);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v6 = (void *)_editedRangeValidators;
  uint64_t v7 = [(id)_editedRangeValidators countByEnumeratingWithState:&v17 objects:v21 count:16];
  NSUInteger v8 = location;
  NSUInteger v9 = length;
  if (v7)
  {
    uint64_t v10 = *(void *)v18;
    NSUInteger v8 = location;
    NSUInteger v9 = length;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        NSUInteger v8 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v11), "adjustedInvalidationRangeForRange:limitRange:textContentStorage:", v8, v9, self->_cachedRange.location, self->_cachedRange.length, self);
        NSUInteger v9 = v12;
        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  v23.NSUInteger location = location;
  v23.NSUInteger length = length;
  v25.NSUInteger location = v8;
  v25.NSUInteger length = v9;
  NSRange v13 = NSUnionRange(v23, v25);
  objc_sync_exit(obj);
  NSUInteger v14 = v13.location;
  NSUInteger v15 = v13.length;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

uint64_t __54__NSTextContentStorage_synchronizeTextLayoutManagers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_fixSelectionAfterChangeInCharacterRange:changeInLength:", *(void *)(*(void *)(a1 + 32) + 160), *(void *)(*(void *)(a1 + 32) + 168), *(void *)(*(void *)(a1 + 32) + 176));
}

+ (void)registerEditedRangeValidator:(id)a3
{
  if ([a3 conformsToProtocol:&unk_1EDD755F0])
  {
    v4 = objc_opt_class();
    objc_sync_enter(v4);
    id v5 = (id)_editedRangeValidators;
    if (!_editedRangeValidators)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      _editedRangeValidators = (uint64_t)v5;
    }
    [v5 addObject:a3];
    objc_sync_exit(v4);
  }
}

- (void)setIncludesTextListMarkers:(BOOL)a3
{
  self->_includesTextListMarkers = a3;
}

uint64_t __45__NSTextContentStorage__usesTextListElements__block_invoke()
{
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "valueForKey:", @"_NSUsesTextListElements");
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [v0 BOOLValue];
    _usesTextListElements_usesTextListElements = result;
  }
  return result;
}

+ (BOOL)__isNotesTextContentStorageClass
{
  if (__isNotesTextContentStorageClass_onceToken != -1) {
    dispatch_once(&__isNotesTextContentStorageClass_onceToken, &__block_literal_global_170);
  }
  return __isNotesTextContentStorageClass_notesTextContentStorageClass == (void)a1;
}

Class __56__NSTextContentStorage___isNotesTextContentStorageClass__block_invoke()
{
  Class result = NSClassFromString((NSString *)@"ICTTTextContentStorage");
  __isNotesTextContentStorageClass_notesTextContentStorageClass = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextContentStorage)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSTextContentStorage;
  v4 = -[NSTextContentManager initWithCoder:](&v7, sel_initWithCoder_);
  id v5 = v4;
  if (v4)
  {
    [(NSTextContentStorage *)v4 _commonInitialization];
    if ([a3 allowsKeyedCoding])
    {
      -[NSTextContentStorage setTextStorage:](v5, "setTextStorage:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.textStorage"]);
      if (!v5->_attributedString) {
        -[NSTextContentStorage setAttributedString:](v5, "setAttributedString:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.attributedString"]);
      }
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSTextContentStorage;
  -[NSTextContentManager encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if ([a3 allowsKeyedCoding] && (self->_textStorage || self->_attributedString)) {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

uint64_t __44__NSTextContentStorage_setAttributedString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 textContentManager];
  if (result == *(void *)(a1 + 32))
  {
    uint64_t v5 = *(void *)(result + 80);
    return [a2 invalidateLayoutForRange:v5];
  }
  return result;
}

- (NSAttributedString)attributedStringForTextElement:(NSTextElement *)textElement
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return (NSAttributedString *)[(NSTextElement *)textElement attributedString];
}

- (NSTextElement)textElementForAttributedString:(NSAttributedString *)attributedString
{
  char v3 = [[NSTextParagraph alloc] initWithAttributedString:attributedString];

  return (NSTextElement *)v3;
}

- (id)attributedStringForTextElements:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  [a3 enumerateObjectsUsingBlock:&__block_literal_global_195];
  return v4;
}

- (id)textElementsForAttributedString:(id)a3
{
  return 0;
}

- (void)updateRangesForTextElement:(id)a3 locationDelta:(int64_t)a4
{
  objc_super v7 = (void *)[a3 elementRange];
  if (!v7)
  {
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = [v7 range];
  uint64_t v10 = v8 + a4;
  if (a4 && !v8)
  {
    uint64_t v11 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v10, v9);
    [a3 setElementRange:v11];

LABEL_8:
    uint64_t v12 = [a3 elementRange];
    goto LABEL_9;
  }
  NSRange v13 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v10, v9);
  [a3 setElementRange:v13];

  uint64_t v12 = 0;
  if (a4 && !v10) {
    goto LABEL_8;
  }
LABEL_9:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSUInteger v14 = (void *)[a3 paragraphContentRange];
    if (v14)
    {
      uint64_t v15 = [v14 range];
      long long v17 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v15 + a4, v16);
      [a3 setParagraphContentRange:v17];
    }
    long long v18 = (void *)[a3 paragraphSeparatorRange];
    if (v18)
    {
      uint64_t v19 = [v18 range];
      v21 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v19 + a4, v20);
      [a3 setParagraphSeparatorRange:v21];
    }
    [a3 synchronizeDocumentRange];
  }
  objc_initWeak(&location, self);
  uint64_t v22 = (void *)[a3 childElements];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__NSTextContentStorage_updateRangesForTextElement_locationDelta___block_invoke;
  v25[3] = &unk_1E55C78B0;
  objc_copyWeak(v26, &location);
  v26[1] = (id)a4;
  [v22 enumerateObjectsUsingBlock:v25];
  if (v12)
  {
    NSRange v23 = [(NSTextContentManager *)self textLayoutManagers];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__NSTextContentStorage_updateRangesForTextElement_locationDelta___block_invoke_2;
    v24[3] = &unk_1E55C7868;
    v24[4] = v12;
    [(NSArray *)v23 enumerateObjectsUsingBlock:v24];
  }
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

uint64_t __65__NSTextContentStorage_updateRangesForTextElement_locationDelta___block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 40);

  return [Weak updateRangesForTextElement:a2 locationDelta:v5];
}

uint64_t __65__NSTextContentStorage_updateRangesForTextElement_locationDelta___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidateLayoutForRange:*(void *)(a1 + 32)];
}

uint64_t __98__NSTextContentStorage_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange___block_invoke(uint64_t result, id *a2, uint64_t a3, uint64_t a4)
{
  int64x2_t v12 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  uint64_t v13 = 0;
  uint64_t v14 = 1;
  if (a4 >= 1)
  {
    uint64_t v5 = a2;
    uint64_t v6 = result;
    unint64_t v7 = (unint64_t)&a2[a4];
    do
    {
      objc_msgSend(*(id *)(v6 + 32), "updateRangesForTextElement:locationDelta:", *v5, *(void *)(v6 + 40), *(_OWORD *)&v12, v13, v14);
      uint64_t result = [*v5 elementRange];
      if (result)
      {
        uint64_t v8 = (void *)result;
        v12.i64[0] = a3;
        LOBYTE(v14) = [*v5 coalescingType];
        uint64_t v9 = *(void **)(*(void *)(v6 + 32) + 88);
        uint64_t v10 = [v8 range];
        uint64_t result = objc_msgSend(v9, "replaceElementsInRange:withElement:coalesceRuns:", v10, v11, &v12, 0);
      }
      ++v5;
      ++a3;
    }
    while ((unint64_t)v5 < v7);
  }
  return result;
}

- (void)performEditingTransactionForTextStorage:(id)a3 usingBlock:(id)a4
{
}

- (BOOL)containsExtraLineFragment
{
  uint64_t v3 = [(NSAttributedString *)[(NSTextContentStorage *)self attributedString] length];
  if (v3 < 1) {
    return 1;
  }
  uint64_t v4 = [(NSString *)[(NSAttributedString *)[(NSTextContentStorage *)self attributedString] string] characterAtIndex:v3 - 1];
  uint64_t v5 = (void *)[MEMORY[0x1E4F28B88] newlineCharacterSet];

  return [v5 characterIsMember:v4];
}

- (void)replaceContentsInRange:(id)a3 withTextElements:(id)a4
{
  objc_sync_enter(self);
  v45.id location = [a3 range];
  id location = (char *)v45.location;
  NSUInteger length = v45.length;
  NSRange v8 = NSIntersectionRange(v45, self->_cachedRange);
  __n128 v44 = 0uLL;
  uint64_t v43 = 0;
  if (!location)
  {
    unint64_t v13 = 0;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_27;
  }
  if (location == (char *)v8.location)
  {
    indexTable = self->_indexTable;
    *(void *)&double v11 = _NSBlockNumberForIndex(indexTable, (unint64_t)location, &v44).n128_u64[0];
    if (indexTable->_gapBlockIndex <= v10) {
      unint64_t v12 = indexTable->_maxBlocks - indexTable->_numBlocks;
    }
    else {
      unint64_t v12 = 0;
    }
    uint64_t v17 = (uint64_t)indexTable->_runs + (indexTable->_elementSize + 8) * (v12 + v10);
    uint64_t v16 = (void *)(v17 + 8);
    if (*(void *)(v17 + 8) != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((char *)v44.n128_u64[0] == location
        || (long long v18 = *(void **)[(NSStorage *)self->_elements elementAtIndex:v11],
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v19 = (void *)[v18 attributedString];
        uint64_t v15 = (NSAttributedString *)objc_msgSend(v19, "attributedSubstringFromRange:", 0, &location[-v44.n128_u64[0]]);
      }
      unint64_t v13 = v44.n128_u64[0];
      uint64_t v14 = *(void *)(v17 + 16);
      if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  unint64_t v13 = (unint64_t)location;
LABEL_11:
  uint64_t v14 = v13 - __NSTextContentStorageQueryDocumentLocationDeltaForLocation((uint64_t)self, v13, 0);
  if (location != (char *)v8.location) {
    goto LABEL_19;
  }
LABEL_18:
  if (*v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_19:
    -[NSString getParagraphStart:end:contentsEnd:forRange:]([(NSAttributedString *)[(NSTextContentStorage *)self attributedString] string], "getParagraphStart:end:contentsEnd:forRange:", &v43, 0, 0, v14, 1);
    if (v43 != v14)
    {
      uint64_t v20 = [(NSTextContentStorage *)self attributedString];
      uint64_t v15 = -[NSAttributedString attributedSubstringFromRange:](v20, "attributedSubstringFromRange:", v43, v14 - v43);
      v13 -= [(NSAttributedString *)v15 length];
      uint64_t v14 = v43;
    }
  }
  if (v15)
  {
    id location = (char *)[a4 mutableCopy];
    [a4 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = (void *)[(NSAttributedString *)v15 mutableCopy];
      objc_msgSend(v21, "appendAttributedString:", objc_msgSend((id)objc_msgSend(a4, "firstObject"), "attributedString"));
      uint64_t v22 = [[NSTextParagraph alloc] initWithAttributedString:v21];
      [location replaceObjectAtIndex:0 withObject:v22];
    }
    else
    {
      uint64_t v22 = [[NSTextParagraph alloc] initWithAttributedString:v15];
      [location insertObject:v22 atIndex:0];
    }
  }
  else
  {
    id location = 0;
  }
LABEL_27:
  unint64_t v23 = v13 + length;
  if (v13 + length < 2
    || v23 >= self->_modifiedDocumentLengthDelta
            + [(NSAttributedString *)[(NSTextContentStorage *)self attributedString] length])
  {
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_33;
  }
  NSUInteger v24 = v8.location + v8.length;
  if (v23 != v8.location + v8.length)
  {
    unint64_t v30 = 0;
    NSRange v31 = 0;
LABEL_42:
    unint64_t v33 = v13 + length;
    goto LABEL_43;
  }
  NSRange v25 = self->_indexTable;
  *(void *)&double v27 = _NSBlockNumberForIndex(v25, v23 - 1, &v44).n128_u64[0];
  if (v25->_gapBlockIndex <= v26) {
    unint64_t v28 = v25->_maxBlocks - v25->_numBlocks;
  }
  else {
    unint64_t v28 = 0;
  }
  BOOL v32 = (unint64_t *)((char *)&v25->_runs->var0 + (v25->_elementSize + 8) * (v28 + v26));
  NSRange v31 = v32 + 1;
  if (v32[1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v30 = 0;
    goto LABEL_42;
  }
  unint64_t v35 = v44.n128_u64[1];
  unint64_t v34 = v44.n128_u64[0];
  if (v44.n128_u64[1] + v44.n128_u64[0] == v23
    || (NSUInteger v36 = *(void **)[(NSStorage *)self->_elements elementAtIndex:v27],
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        unint64_t v35 = v44.n128_u64[1],
        unint64_t v34 = v44.n128_u64[0],
        (isKindOfClass & 1) == 0))
  {
    uint64_t v38 = 0;
  }
  else
  {
    uint64_t v38 = objc_msgSend((id)objc_msgSend(v36, "attributedString"), "attributedSubstringFromRange:", v23 - v44.n128_u64[0], v44.n128_u64[0] - v23 + v44.n128_u64[1]);
    unint64_t v35 = v44.n128_u64[1];
    unint64_t v34 = v44.n128_u64[0];
  }
  NSUInteger length = v34 - v13 + v35;
  uint64_t v29 = v32[2] - v14 + v32[3];
  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v30 = (NSAttributedString *)v38;
    goto LABEL_52;
  }
  unint64_t v33 = v34 + v35;
  unint64_t v30 = (NSAttributedString *)v38;
  NSUInteger v24 = v8.location + v8.length;
LABEL_43:
  uint64_t v29 = v33 - v14 - __NSTextContentStorageQueryDocumentLocationDeltaForLocation((uint64_t)self, v33, 0);
  if (v23 != v24)
  {
LABEL_53:
    -[NSString getParagraphStart:end:contentsEnd:forRange:]([(NSAttributedString *)[(NSTextContentStorage *)self attributedString] string], "getParagraphStart:end:contentsEnd:forRange:", 0, &v43, 0, v29 + v14 - 1, 1);
    if (v29 + v14 != v43)
    {
      unint64_t v39 = [(NSTextContentStorage *)self attributedString];
      unint64_t v30 = -[NSAttributedString attributedSubstringFromRange:](v39, "attributedSubstringFromRange:", v29 + v14, v43 - (v29 + v14));
      length += [(NSAttributedString *)v30 length];
      uint64_t v29 = v43 - v14;
    }
    goto LABEL_55;
  }
LABEL_52:
  if (*v31 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_53;
  }
LABEL_55:
  if (v30)
  {
    if (!location) {
      id location = (char *)[a4 mutableCopy];
    }
    [a4 lastObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v40 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "lastObject"), "attributedString"), "mutableCopy");
      [v40 appendAttributedString:v30];
      unint64_t v41 = [[NSTextParagraph alloc] initWithAttributedString:v40];
      objc_msgSend(location, "replaceObjectAtIndex:withObject:", objc_msgSend(location, "count") - 1, v41);
    }
    else
    {
      unint64_t v41 = [[NSTextParagraph alloc] initWithAttributedString:v30];
      [location addObject:v41];
    }
  }
LABEL_33:
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    __NSTextContentStorageQueryDocumentLocationDeltaForLocation((uint64_t)self, v13, 0);
  }
  if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
    __NSTextContentStorageQueryDocumentLocationDeltaForLocation((uint64_t)self, length + v13, 0);
  }

  objc_sync_exit(self);
}

- (void)synchronizeToBackingStore:(id)a3
{
  objc_sync_enter(self);
  if ([(NSTextContentStorage *)self textStorage]) {
    uint64_t v4 = [(NSTextContentStorage *)self textStorage];
  }
  else {
    uint64_t v4 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E4F28E48]);
  }
  uint64_t v5 = v4;
  memset(v23, 0, sizeof(v23));
  p_modifiedRange = &self->_modifiedRange;
  NSUInteger location = self->_modifiedRange.location;
  NSUInteger length = self->_modifiedRange.length;
  NSUInteger v21 = 0;
  uint64_t v22 = 0;
  [(NSTextStorage *)v4 beginEditing];
  uint64_t v9 = &off_18E5F7000;
  unint64_t v10 = 0x1E91D4000uLL;
  if (self->_modifiedRange.length)
  {
    NSUInteger v11 = length + location;
    if (length + location > p_modifiedRange->location)
    {
      NSUInteger v12 = 0;
      uint64_t v13 = 0;
      long long v20 = xmmword_18E5F72A0;
      NSUInteger v14 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        uint64_t v16 = -[NSRunStorage elementAtIndex:effectiveRange:](self->_indexTable, "elementAtIndex:effectiveRange:", v11 - 1, &v21, v20);
        long long v17 = v16[1];
        v23[0] = *v16;
        v23[1] = v17;
        uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v19 = *((void *)&v23[0] + 1);
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (*(void *)&v23[1] + *((void *)&v23[0] + 1) == v15 && *(void *)&v23[0] + 1 == v14)
          {
            uint64_t v18 = v15;
          }
          else
          {
            __NSTextContentStorageFillAttributedStringWithElementsInIndexRange((NSUInteger)self, v14, v12, v5, v15, v13);
            uint64_t v13 = 0;
            NSUInteger v12 = 0;
            uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v19 = *((void *)&v23[0] + 1);
            NSUInteger v14 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v15 = v18;
        }
        else
        {
          NSUInteger v14 = *(void *)&v23[0];
          if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v13 = *(void *)&v23[1];
          }
          else {
            uint64_t v13 = v18 + v13 - v19;
          }
          if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
            NSUInteger v12 = 1;
          }
          else {
            ++v12;
          }
          *(_OWORD *)((char *)v23 + 8) = v20;
          -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](self->_indexTable, "replaceElementsInRange:withElement:coalesceRuns:", v21, v22, v23, 1);
          uint64_t v15 = v19;
        }
        NSUInteger v11 = v21;
      }
      while (v21 > p_modifiedRange->location);
      unint64_t v10 = 0x1E91D4000;
      uint64_t v9 = &off_18E5F7000;
      if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
        __NSTextContentStorageFillAttributedStringWithElementsInIndexRange((NSUInteger)self, v14, v12, v5, v15, v13);
      }
    }
  }
  else if (self->_modifiedDocumentLengthDelta >= 1)
  {
    -[NSTextStorage replaceCharactersInRange:withString:](v5, "replaceCharactersInRange:withString:", p_modifiedRange->location);
  }
  __NSTextContentStorageEnumerateCachedElementsInElementIndexRange((NSUInteger)self, 0, [(NSStorage *)self->_elements count], (uint64_t)&__block_literal_global_223_0);
  _NSRange *p_modifiedRange = *((_NSRange *)v9 + 42);
  *(Class *)((char *)&self->super.super.isa + *(int *)(v10 + 3900)) = 0;
  [(NSTextStorage *)v5 endEditing];
  if (![(NSTextContentStorage *)self textStorage]) {
    [(NSTextContentStorage *)self setAttributedString:v5];
  }

  objc_sync_exit(self);
}

void __50__NSTextContentStorage_synchronizeToBackingStore___block_invoke(uint64_t a1, id *a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 1)
  {
    uint64_t v4 = a2;
    unint64_t v5 = (unint64_t)&a2[a4];
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [*v4 synchronizeDocumentRange];
      }
      ++v4;
    }
    while ((unint64_t)v4 < v5);
  }
}

- (NSTextRange)adjustedRangeFromRange:(NSTextRange *)textRange forEditingTextSelection:(BOOL)forEditingTextSelection
{
  p_editedRange = &self->_editedRange;
  if (self->_editedRange.location == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  BOOL v5 = forEditingTextSelection;
  unint64_t v7 = [(NSTextRange *)textRange range];
  uint64_t v9 = v8;
  NSUInteger location = p_editedRange->location;
  NSUInteger length = p_editedRange->length;
  int64_t editedDelta = self->_editedDelta;
  NSUInteger v13 = length - editedDelta;
  if (v5)
  {
    if (location >= v7 + v8 && (location != v7 || v13 != v8)) {
      return 0;
    }
    uint64_t v9 = 0;
    unint64_t v15 = length + location;
  }
  else
  {
    unint64_t v16 = v13 + location;
    if (editedDelta) {
      BOOL v17 = v7 >= v16;
    }
    else {
      BOOL v17 = 0;
    }
    if (!v17) {
      return 0;
    }
    unint64_t v15 = editedDelta + v7;
  }
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v18 = [(NSAttributedString *)[(NSTextContentStorage *)self attributedString] string];
  uint64_t v19 = [(NSString *)v18 length];
  uint64_t v20 = v19;
  uint64_t v21 = v15 + v9;
  if (v15 && v15 < v19 - 1)
  {
    unint64_t RangeOfCharacterClusterAtIndex = CFStringGetRangeOfCharacterClusterAtIndex();
    if (RangeOfCharacterClusterAtIndex >= v15 || v15 >= RangeOfCharacterClusterAtIndex + v23)
    {
      if ([(NSString *)v18 characterAtIndex:v15] == 10
        && [(NSString *)v18 characterAtIndex:v15 - 1] == 13)
      {
        ++v15;
        if (v9) {
          uint64_t v9 = v21 - v15;
        }
        else {
          uint64_t v9 = 0;
        }
      }
    }
    else
    {
      if (v9) {
        uint64_t v9 = v21 - RangeOfCharacterClusterAtIndex;
      }
      else {
        uint64_t v9 = 0;
      }
      unint64_t v15 = RangeOfCharacterClusterAtIndex;
    }
  }
  if (v9)
  {
    BOOL v26 = v21 < 2;
    uint64_t v25 = v15 + v9;
    BOOL v26 = !v26 && v25 < v20;
    if (v26)
    {
      uint64_t v29 = CFStringGetRangeOfCharacterClusterAtIndex();
      if (v29 >= v25)
      {
        if ([(NSString *)v18 characterAtIndex:v15 + v9] == 10
          && [(NSString *)v18 characterAtIndex:v25 - 1] == 13)
        {
          ++v9;
        }
      }
      else
      {
        uint64_t v9 = v30 - v9 + v29;
      }
    }
  }
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v28 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v15, v9);

  return (NSTextRange *)v28;
}

- (void)setCopiesContentsInTextParagraphs:(BOOL)a3
{
  self->_copiesContentsInTextParagraphs = a3;
}

@end