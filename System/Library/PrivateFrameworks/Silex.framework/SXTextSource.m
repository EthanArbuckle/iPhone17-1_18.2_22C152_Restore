@interface SXTextSource
- (NSLocale)locale;
- (NSMutableIndexSet)deletedRangeOffsets;
- (NSMutableIndexSet)insertedRangeOffsets;
- (NSMutableIndexSet)rangesExcludedOfParagraphSpacing;
- (NSString)string;
- (SXDocumentLanguageProviding)documentLanguageProvider;
- (SXFontAttributesConstructor)fontAttributeConstructor;
- (SXSmartFieldFactory)smartFieldFactory;
- (SXTextSource)initWithString:(id)a3 smartFieldFactory:(id)a4 dataSource:(id)a5 documentLanguageProvider:(id)a6 fontAttributesConstructor:(id)a7;
- (SXTextSourceDataSource)dataSource;
- (SXTextSourceDefaults)defaults;
- (SXTextStyleFontDescribing)defaultFontDescribing;
- (_NSRange)rangeForRange:(_NSRange)a3;
- (_NSRange)rangeInBounds:(_NSRange)a3 maxLength:(unint64_t)a4;
- (id)attributesForTextStyle:(id)a3 onParagraphStyle:(id)a4 forRange:(_NSRange)a5 resultingDropCapStyle:(id *)a6 textResizer:(id)a7 fontFace:(id)a8;
- (id)characterStyleFromAttributes:(id)a3 context:(id)a4;
- (id)cleanString:(id)a3;
- (id)fontDescriptionsForTextStyleFontDescription:(id)a3 defaultTextStyleFontDesciptions:(id)a4;
- (id)fontFaceForTextStyleFontDescription:(id)a3 defaultTextStyleFontDescription:(id)a4 fontAttributes:(id)a5 fontSize:(int64_t)a6;
- (id)populateArray:(id)a3 withValue:(id)a4 forSize:(unint64_t)a5;
- (id)randomColorWithAlpha:(double)a3;
- (int)listLabelTypeForListType:(unint64_t)a3;
- (int)listNumberTypeForListType:(unint64_t)a3;
- (int64_t)fontSizeForTextStyle:(id)a3;
- (int64_t)scaledFontSizeForFontSize:(int64_t)a3;
- (unsigned)paragraphAlignmentForTextAlignment:(int64_t)a3;
- (void)applyAdditionsOnTextTangierStorage:(id)a3;
- (void)applyListStylingOnTextTangierStorage:(id)a3 usingAttributesMap:(id)a4;
- (void)applyStylingOnTextTangierStorage:(id)a3;
- (void)setDeletedRangeOffsets:(id)a3;
- (void)setInsertedRangeOffsets:(id)a3;
- (void)setRangesExcludedOfParagraphSpacing:(id)a3;
- (void)transform:(id)a3 forTextStyle:(id)a4 range:(_NSRange)a5;
@end

@implementation SXTextSource

- (SXTextSource)initWithString:(id)a3 smartFieldFactory:(id)a4 dataSource:(id)a5 documentLanguageProvider:(id)a6 fontAttributesConstructor:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)SXTextSource;
  v17 = [(SXTextSource *)&v31 init];
  if (v17)
  {
    uint64_t v18 = +[SXTextSourceDefaults defaults]();
    defaults = v17->_defaults;
    v17->_defaults = (SXTextSourceDefaults *)v18;

    uint64_t v20 = [MEMORY[0x263F089C8] indexSet];
    deletedRangeOffsets = v17->_deletedRangeOffsets;
    v17->_deletedRangeOffsets = (NSMutableIndexSet *)v20;

    uint64_t v22 = [MEMORY[0x263F089C8] indexSet];
    insertedRangeOffsets = v17->_insertedRangeOffsets;
    v17->_insertedRangeOffsets = (NSMutableIndexSet *)v22;

    uint64_t v24 = [MEMORY[0x263F089C8] indexSet];
    rangesExcludedOfParagraphSpacing = v17->_rangesExcludedOfParagraphSpacing;
    v17->_rangesExcludedOfParagraphSpacing = (NSMutableIndexSet *)v24;

    objc_storeWeak((id *)&v17->_dataSource, v14);
    objc_storeStrong((id *)&v17->_smartFieldFactory, a4);
    v26 = objc_alloc_init(SXDefaultFontDescribing);
    defaultFontDescribing = v17->_defaultFontDescribing;
    v17->_defaultFontDescribing = (SXTextStyleFontDescribing *)v26;

    objc_storeStrong((id *)&v17->_fontAttributeConstructor, a7);
    objc_storeStrong((id *)&v17->_documentLanguageProvider, a6);
    uint64_t v28 = [(SXTextSource *)v17 cleanString:v12];
    string = v17->_string;
    v17->_string = (NSString *)v28;
  }
  return v17;
}

- (id)cleanString:(id)a3
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v4];
  v6 = [(SXTextSource *)self dataSource];
  v7 = [v6 componentTextStyleForTextSource:self inheritingFromDefaultStyles:1];

  v8 = [v7 listStyle];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    v68 = v7;
    v69 = v5;
    v66 = [MEMORY[0x263F089C8] indexSet];
    v70 = [MEMORY[0x263F089C8] indexSet];
    v72 = [MEMORY[0x263F089C8] indexSet];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v10 = [(SXTextSource *)self dataSource];
    v11 = [v10 inlineTextStylesForTextSource:self];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v87 objects:v91 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v88 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          v17 = [(SXTextSource *)self dataSource];
          uint64_t v18 = [v16 textStyle];
          v19 = [v17 textStyleForIdentifier:v18];

          uint64_t v20 = [v19 listStyle];
          if ([v20 count] && (unint64_t v21 = objc_msgSend(v16, "range"), v21 < objc_msgSend(v4, "length")))
          {
            [v16 range];
            uint64_t v23 = v22;

            if (v23 != -1)
            {
              uint64_t v24 = [v16 range];
              uint64_t v26 = -[SXTextSource rangeInBounds:maxLength:](self, "rangeInBounds:maxLength:", v24, v25, [v4 length]);
              objc_msgSend(v72, "addIndexesInRange:", v26, v27);
            }
          }
          else
          {
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v87 objects:v91 count:16];
      }
      while (v13);
    }

    uint64_t v28 = [v4 length];
    uint64_t v29 = objc_msgSend(v4, "rangeOfString:options:range:", @"\n\n", 0, 0, v28);
    if (v29 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v31 = v29, v32 = v30, ![v4 length]))
    {
      unint64_t v35 = 0;
      v33 = v66;
    }
    else
    {
      v33 = v66;
      do
      {
        uint64_t v34 = [v4 length];
        if ((objc_msgSend(v72, "intersectsIndexesInRange:", v31, v32) & 1) == 0) {
          objc_msgSend(v66, "addIndexesInRange:", v31, v32);
        }
        unint64_t v35 = v31 + v32;
        uint64_t v28 = v34 - (v31 + v32);
        uint64_t v36 = objc_msgSend(v4, "rangeOfString:options:range:", @"\n\n", 0, v31 + v32, v28);
        if (v36 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v31 = v36;
        uint64_t v32 = v37;
      }
      while (v35 < [v4 length]);
    }
    uint64_t v38 = objc_msgSend(v4, "rangeOfString:options:range:", @"\r\n", 0, v35, v28);
    if (v38 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v40 = v38;
      uint64_t v41 = v39;
      do
      {
        if (v35 >= [v4 length]) {
          break;
        }
        uint64_t v42 = [v4 length];
        if ((objc_msgSend(v72, "intersectsIndexesInRange:", v40, v41) & 1) == 0) {
          objc_msgSend(v33, "addIndexesInRange:", v40, v41);
        }
        unint64_t v35 = v40 + v41;
        uint64_t v40 = objc_msgSend(v4, "rangeOfString:options:range:", @"\r\n", 0, v40 + v41, v42 - (v40 + v41));
        uint64_t v41 = v43;
      }
      while (v40 != 0x7FFFFFFFFFFFFFFFLL);
    }
    uint64_t v44 = objc_msgSend(v4, "rangeOfString:options:range:", @"\n", 0, 0, objc_msgSend(v4, "length"));
    if (v44 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v46 = v44;
      uint64_t v47 = v45;
      unint64_t v48 = 0;
      do
      {
        if (v48 >= [v4 length]) {
          break;
        }
        uint64_t v49 = [v4 length];
        if ((objc_msgSend(v72, "intersectsIndexesInRange:", v46, v47) & 1) == 0
          && (objc_msgSend(v33, "intersectsIndexesInRange:", v46, v47) & 1) == 0)
        {
          objc_msgSend(v70, "addIndexesInRange:", v46, v47);
        }
        unint64_t v48 = v46 + v47;
        uint64_t v46 = objc_msgSend(v4, "rangeOfString:options:range:", @"\n", 0, v46 + v47, v49 - (v46 + v47));
        uint64_t v47 = v50;
      }
      while (v46 != 0x7FFFFFFFFFFFFFFFLL);
    }
    v85[0] = MEMORY[0x263EF8330];
    v85[1] = 3221225472;
    v85[2] = __28__SXTextSource_cleanString___block_invoke;
    v85[3] = &unk_264654638;
    v85[4] = self;
    id v51 = v69;
    id v86 = v51;
    [v33 enumerateRangesUsingBlock:v85];
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v82[2] = __28__SXTextSource_cleanString___block_invoke_2;
    v82[3] = &unk_264654660;
    v82[4] = self;
    id v52 = v72;
    id v83 = v52;
    id v53 = v51;
    id v84 = v53;
    [v70 enumerateRangesUsingBlock:v82];
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __28__SXTextSource_cleanString___block_invoke_3;
    v75[3] = &unk_264654688;
    id v73 = v70;
    id v76 = v73;
    id v71 = v33;
    id v77 = v71;
    v78 = self;
    id v79 = v52;
    id v54 = v53;
    id v80 = v54;
    id v55 = v4;
    id v81 = v55;
    id v67 = v79;
    [v79 enumerateRangesUsingBlock:v75];
    uint64_t v56 = objc_msgSend(v55, "rangeOfString:options:range:", @"\u2028\n", 0, 0, objc_msgSend(v55, "length"));
    if (v56 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v58 = v56;
      uint64_t v59 = v57;
      unint64_t v60 = 0;
      do
      {
        if (v60 >= [v55 length]) {
          break;
        }
        unint64_t v60 = v58 + v59;
        uint64_t v61 = [v55 length] - (v58 + v59);
        uint64_t v62 = -[SXTextSource rangeForRange:](self, "rangeForRange:", v58, v59) + 1;
        [v54 insertString:@"​" atIndex:v62];
        v63 = [(SXTextSource *)self insertedRangeOffsets];
        [v63 addIndex:v62];

        uint64_t v58 = objc_msgSend(v55, "rangeOfString:options:range:", @"\u2028\n", 0, v60, v61);
        uint64_t v59 = v64;
      }
      while (v58 != 0x7FFFFFFFFFFFFFFFLL);
    }
    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = __28__SXTextSource_cleanString___block_invoke_4;
    v74[3] = &unk_264653738;
    v74[4] = self;
    [v67 enumerateRangesUsingBlock:v74];

    v7 = v68;
    v5 = v69;
  }
  if ([v5 hasSuffix:@"\u2028\n"]) {
    objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 2, 2, @"\u2028\u2028");
  }

  return v5;
}

void __28__SXTextSource_cleanString___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3)
  {
    for (unint64_t i = 0; i < a3; i += 2)
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "rangeForRange:", a2 + i, 2);
      unint64_t v9 = v8;
      unint64_t v10 = [*(id *)(a1 + 40) length];
      if (v10 >= v9) {
        unint64_t v11 = v9;
      }
      else {
        unint64_t v11 = v10;
      }
      objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", v7, v11, @"\n");
      uint64_t v12 = [*(id *)(a1 + 32) deletedRangeOffsets];
      [v12 addIndex:a2 + i];
    }
  }
}

void __28__SXTextSource_cleanString___block_invoke_2(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = objc_msgSend(a1[4], "rangeForRange:", a2, a3);
  unint64_t v8 = v7;
  char v9 = objc_msgSend(a1[5], "intersectsIndexesInRange:", a2, a3 + 1);
  int v10 = objc_msgSend(a1[5], "intersectsIndexesInRange:", a2 - 1, a3);
  unint64_t v11 = [a1[6] length];
  if (v11 >= v8) {
    unint64_t v12 = v8;
  }
  else {
    unint64_t v12 = v11;
  }
  id v13 = a1[6];
  if ((v9 & 1) != 0 || v10)
  {
    objc_msgSend(v13, "replaceCharactersInRange:withString:", v6, v12, &stru_26D5311C0);
    id v14 = [a1[4] deletedRangeOffsets];
    [v14 addIndex:a2];
  }
  else
  {
    objc_msgSend(v13, "replaceCharactersInRange:withString:", v6, v12, @"\u2028");
  }
}

void __28__SXTextSource_cleanString___block_invoke_3(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a2 + a3;
  uint64_t v7 = [a1[4] indexGreaterThanIndex:a2 + a3];
  uint64_t v8 = [a1[4] indexLessThanIndex:a2];
  uint64_t v9 = [a1[5] indexGreaterThanIndex:v6];
  uint64_t v10 = [a1[5] indexLessThanIndex:a2];
  id v11 = a1[6];
  uint64_t v12 = [a1[7] firstRangeAfterIndex:v6];
  uint64_t v14 = objc_msgSend(v11, "rangeForRange:", v12, v13);
  if (a2 && v8 && v10 && v8 != a2 - 1 && v10 != a2 - 1)
  {
    uint64_t v15 = objc_msgSend(a1[6], "rangeForRange:", a2, a3);
    [a1[8] length];
    [a1[8] insertString:@"\n" atIndex:v15];
    id v16 = [a1[6] insertedRangeOffsets];
    [v16 addIndex:v15];
  }
  unint64_t v17 = v6 + 1;
  BOOL v19 = v7 == v6 + 1 || v9 == v17 || v14 == v17;
  if (!v19 && v17 < [a1[9] length])
  {
    uint64_t v20 = objc_msgSend(a1[6], "rangeForRange:", a2, a3);
    unint64_t v22 = v21;
    unint64_t v23 = [a1[8] length];
    if (v23 >= v22) {
      unint64_t v24 = v22;
    }
    else {
      unint64_t v24 = v23;
    }
    [a1[8] insertString:@"\n" atIndex:v24 + v20];
    id v25 = [a1[6] insertedRangeOffsets];
    [v25 addIndex:v6];
  }
}

void __28__SXTextSource_cleanString___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "rangeForRange:", a2, a3);
  uint64_t v6 = v5;
  id v7 = [*(id *)(a1 + 32) rangesExcludedOfParagraphSpacing];
  objc_msgSend(v7, "addIndexesInRange:", v4, v6);
}

- (_NSRange)rangeForRange:(_NSRange)a3
{
  if (a3.location | a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    uint64_t v6 = [(SXTextSource *)self deletedRangeOffsets];
    uint64_t v7 = objc_msgSend(v6, "countOfIndexesInRange:", 0, location + 1);

    uint64_t v8 = [(SXTextSource *)self deletedRangeOffsets];
    uint64_t v9 = objc_msgSend(v8, "countOfIndexesInRange:", location, length);

    uint64_t v10 = [(SXTextSource *)self insertedRangeOffsets];
    uint64_t v11 = objc_msgSend(v10, "countOfIndexesInRange:", 0, location + 1);

    uint64_t v12 = [(SXTextSource *)self insertedRangeOffsets];
    uint64_t v13 = objc_msgSend(v12, "countOfIndexesInRange:", location + 1, length);

    NSUInteger v14 = location - v7 + v11;
    NSUInteger v15 = length - v9 + v13;
  }
  else
  {
    NSUInteger v14 = 0;
    NSUInteger v15 = 0;
  }
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (void)applyStylingOnTextTangierStorage:(id)a3
{
  uint64_t v186 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SXTextSource *)self dataSource];
  v162 = [v5 textResizerForTextSource:self];

  uint64_t v6 = [SXTextStyleAttributesMap alloc];
  uint64_t v7 = [(SXTextSource *)self string];
  uint64_t v8 = [(SXTextStyleAttributesMap *)v6 initWithString:v7];

  uint64_t v9 = [SXTextStyleAttributes alloc];
  uint64_t v10 = [(SXTextSource *)self string];
  uint64_t v11 = -[SXTextStyleAttributes initWithRange:](v9, "initWithRange:", 0, [v10 length]);

  uint64_t v12 = +[SXCharacterStyle stringFromProperty:17];
  uint64_t v13 = NSNumber;
  NSUInteger v14 = [(SXTextSource *)self defaults];
  NSUInteger v15 = [v13 numberWithDouble:-[SXBlueprintAnalyzerCursor highestMaxY]((uint64_t)v14)];
  [(SXTextStyleAttributes *)v11 addAttribute:v12 value:v15];

  v163 = v8;
  v143 = v11;
  [(SXTextStyleAttributesMap *)v8 addAttributes:v11];
  v160 = v4;
  id v16 = [v4 paragraphStyleAtParIndex:0 effectiveRange:0];
  unint64_t v17 = [(SXTextSource *)self documentLanguageProvider];
  uint64_t v18 = [v17 language];

  if (v18
    || ([(SXTextSource *)self locale],
        BOOL v19 = objc_claimAutoreleasedReturnValue(),
        [v19 localeIdentifier],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18))
  {
    [v16 setValue:v18 forProperty:39];
  }
  v142 = (void *)v18;
  [v16 setFloatValue:81 forProperty:0.0];
  uint64_t v20 = [(SXTextSource *)self dataSource];
  unint64_t v21 = [v20 componentTextStyleForTextSource:self inheritingFromDefaultStyles:1];

  unint64_t v22 = [(SXTextSource *)self dataSource];
  uint64_t v23 = [v22 componentTextStyleForTextSource:self inheritingFromDefaultStyles:0];

  unint64_t v24 = [(SXTextSource *)self dataSource];
  uint64_t v25 = [v24 defaultComponentTextStyleForTextSource:self];

  uint64_t v26 = [(SXTextSource *)self dataSource];
  uint64_t v27 = [v26 defaultComponentTextStylesForTextSource:self];

  v152 = (void *)v23;
  v164 = self;
  v144 = (void *)v25;
  v156 = v16;
  v158 = (void *)v27;
  if (v21)
  {
    uint64_t v28 = [(SXTextSource *)self fontDescriptionsForTextStyleFontDescription:v23 defaultTextStyleFontDesciptions:v27];
    uint64_t v29 = [(SXTextSource *)self fontAttributeConstructor];
    uint64_t v30 = [v29 fontAttributesForFontDescriptions:v28];

    uint64_t v31 = [(SXTextSource *)self fontFaceForTextStyleFontDescription:v23 defaultTextStyleFontDescription:v25 fontAttributes:v30 fontSize:[(SXTextSource *)self fontSizeForTextStyle:v23]];
    uint64_t v32 = [(SXTextSource *)self string];
    id v183 = 0;
    v33 = -[SXTextSource attributesForTextStyle:onParagraphStyle:forRange:resultingDropCapStyle:textResizer:fontFace:](self, "attributesForTextStyle:onParagraphStyle:forRange:resultingDropCapStyle:textResizer:fontFace:", v21, v16, 0, [v32 length], &v183, v162, v31);
    id v145 = v183;

    [(SXTextStyleAttributesMap *)v163 addAttributes:v33];
    uint64_t v34 = [(SXTextSource *)self string];
    -[SXTextSource transform:forTextStyle:range:](self, "transform:forTextStyle:range:", v160, v21, 0, [v34 length]);
  }
  else
  {
    id v145 = 0;
  }
  v159 = v21;
  v151 = [v21 linkStyle];
  if (v151)
  {
    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    unint64_t v35 = [(SXTextSource *)self dataSource];
    uint64_t v36 = [v35 additionsForTextSource:self];

    uint64_t v153 = [v36 countByEnumeratingWithState:&v179 objects:v185 count:16];
    if (v153)
    {
      id v148 = *(id *)v180;
      do
      {
        for (uint64_t i = 0; i != v153; ++i)
        {
          if (*(id *)v180 != v148) {
            objc_enumerationMutation(v36);
          }
          uint64_t v38 = [*(id *)(*((void *)&v179 + 1) + 8 * i) range];
          uint64_t v40 = -[SXTextSource rangeForRange:](self, "rangeForRange:", v38, v39);
          uint64_t v42 = v41;
          uint64_t v43 = [(SXTextSource *)self string];
          uint64_t v44 = -[SXTextSource rangeInBounds:maxLength:](self, "rangeInBounds:maxLength:", v40, v42, [v43 length]);
          uint64_t v46 = v45;

          uint64_t v47 = [v152 linkStyle];
          unint64_t v48 = [v158 arrayByAddingObject:v159];
          uint64_t v49 = [(SXTextSource *)self fontDescriptionsForTextStyleFontDescription:v47 defaultTextStyleFontDesciptions:v48];

          uint64_t v50 = [(SXTextSource *)self fontAttributeConstructor];
          id v51 = [v50 fontAttributesForFontDescriptions:v49];

          id v52 = [v152 linkStyle];
          int64_t v53 = [(SXTextSource *)self fontSizeForTextStyle:v52];

          id v54 = [v152 linkStyle];
          id v55 = [(SXTextSource *)self fontFaceForTextStyleFontDescription:v54 defaultTextStyleFontDescription:v159 fontAttributes:v51 fontSize:v53];

          uint64_t v56 = -[SXTextSource attributesForTextStyle:onParagraphStyle:forRange:resultingDropCapStyle:textResizer:fontFace:](self, "attributesForTextStyle:onParagraphStyle:forRange:resultingDropCapStyle:textResizer:fontFace:", v151, v156, v44, v46, 0, v162, v55);
          [(SXTextStyleAttributesMap *)v163 addAttributes:v56];
          -[SXTextSource transform:forTextStyle:range:](self, "transform:forTextStyle:range:", v160, v151, v44, v46);
        }
        uint64_t v153 = [v36 countByEnumeratingWithState:&v179 objects:v185 count:16];
      }
      while (v153);
    }
  }
  long long v177 = 0u;
  long long v178 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  uint64_t v57 = self;
  uint64_t v58 = [(SXTextSource *)self dataSource];
  uint64_t v59 = [v58 inlineTextStylesForTextSource:self];

  id v149 = v59;
  uint64_t v60 = [v59 countByEnumeratingWithState:&v175 objects:v184 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v176;
    id v63 = v145;
    do
    {
      uint64_t v64 = 0;
      id obj = (id)v61;
      do
      {
        if (*(void *)v176 != v62) {
          objc_enumerationMutation(v149);
        }
        v65 = *(void **)(*((void *)&v175 + 1) + 8 * v64);
        uint64_t v66 = [v65 range];
        unint64_t v68 = -[SXTextSource rangeForRange:](v57, "rangeForRange:", v66, v67);
        uint64_t v70 = v69;
        id v71 = [(SXTextSource *)v57 string];
        unint64_t v72 = [v71 length];

        if (v68 < v72)
        {
          id v73 = [(SXTextSource *)v57 string];
          uint64_t v74 = -[SXTextSource rangeInBounds:maxLength:](v57, "rangeInBounds:maxLength:", v68, v70, [v73 length]);
          uint64_t v76 = v75;

          v154 = [v65 textStyle];
          id v77 = [(SXTextSource *)v57 dataSource];
          v78 = [v77 textStyleForIdentifier:v154];

          id v79 = [(SXTextSource *)v57 fontDescriptionsForTextStyleFontDescription:v78 defaultTextStyleFontDesciptions:v158];
          id v80 = [(SXTextSource *)v57 fontAttributeConstructor];
          id v81 = [v80 fontAttributesForFontDescriptions:v79];

          v82 = [(SXTextSource *)v164 fontFaceForTextStyleFontDescription:v78 defaultTextStyleFontDescription:v159 fontAttributes:v81 fontSize:[(SXTextSource *)v164 fontSizeForTextStyle:v78]];
          id v174 = v63;
          -[SXTextSource attributesForTextStyle:onParagraphStyle:forRange:resultingDropCapStyle:textResizer:fontFace:](v164, "attributesForTextStyle:onParagraphStyle:forRange:resultingDropCapStyle:textResizer:fontFace:", v78, v156, v74, v76, &v174, v162, v82);
          v84 = uint64_t v83 = v62;
          id v85 = v174;
          id v86 = v63;
          id v63 = v85;

          [(SXTextStyleAttributesMap *)v163 addAttributes:v84];
          uint64_t v87 = v74;
          uint64_t v61 = (uint64_t)obj;
          -[SXTextSource transform:forTextStyle:range:](v164, "transform:forTextStyle:range:", v160, v78, v87, v76);

          uint64_t v62 = v83;
          uint64_t v57 = v164;
        }
        ++v64;
      }
      while (v61 != v64);
      uint64_t v61 = [v149 countByEnumeratingWithState:&v175 objects:v184 count:16];
    }
    while (v61);
  }
  else
  {
    id v63 = v145;
  }
  v146 = v63;

  long long v88 = [MEMORY[0x263F089C8] indexSet];
  long long v89 = [(SXTextSource *)v57 rangesExcludedOfParagraphSpacing];
  v171[0] = MEMORY[0x263EF8330];
  v171[1] = 3221225472;
  v171[2] = __49__SXTextSource_applyStylingOnTextTangierStorage___block_invoke;
  v171[3] = &unk_264654638;
  id v90 = v160;
  id v172 = v90;
  id v91 = v88;
  id v173 = v91;
  [v89 enumerateRangesUsingBlock:v171];

  v168[0] = MEMORY[0x263EF8330];
  v168[1] = 3221225472;
  v168[2] = __49__SXTextSource_applyStylingOnTextTangierStorage___block_invoke_2;
  v168[3] = &unk_2646546B0;
  id v92 = v156;
  id v169 = v92;
  id v93 = v90;
  id v170 = v93;
  [v91 enumerateIndexesUsingBlock:v168];
  [(SXTextSource *)v57 applyListStylingOnTextTangierStorage:v93 usingAttributesMap:v163];
  v94 = [(SXTextStyleAttributesMap *)v163 attributedString];
  uint64_t v95 = [v94 length];
  v166[0] = MEMORY[0x263EF8330];
  v166[1] = 3221225472;
  v166[2] = __49__SXTextSource_applyStylingOnTextTangierStorage___block_invoke_3;
  v166[3] = &unk_2646546D8;
  v166[4] = v57;
  id v96 = v93;
  id v167 = v96;
  uint64_t v97 = v95;
  v98 = v146;
  objc_msgSend(v94, "enumerateAttributesInRange:options:usingBlock:", 0, v97, 0, v166);
  v99 = [v96 paragraphStyleAtParIndex:0 effectiveRange:0];
  if (!v146)
  {
    v102 = v142;
    v100 = v159;
    goto LABEL_75;
  }
  v100 = v159;
  if ([v146 numberOfCharacters] == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v101 = 1;
  }
  else {
    uint64_t v101 = [v146 numberOfCharacters];
  }
  v103 = [(SXTextSource *)v164 string];
  uint64_t v104 = [v103 length];

  if (v101 > v104)
  {
    v105 = [(SXTextSource *)v164 string];
    uint64_t v101 = [v105 length];
  }
  uint64_t v106 = 10;
  if (v101 < 10) {
    uint64_t v106 = v101;
  }
  v98 = v146;
  if (v101 < 1)
  {
    v102 = v142;
    goto LABEL_75;
  }
  uint64_t v157 = v106;
  id v161 = v91;
  v107 = [MEMORY[0x263F7C710] propertyMap];
  v108 = [v146 backgroundColor];

  if (v108)
  {
    v109 = (void *)MEMORY[0x263F7C808];
    v110 = [v146 backgroundColor];
    v111 = [v109 colorWithUIColor:v110];
    [v107 setObject:v111 forProperty:38];

    v98 = v146;
  }
  v112 = [v98 textColor];

  if (v112)
  {
    v113 = (void *)MEMORY[0x263F7C808];
    v114 = [v98 textColor];
    v115 = [v113 colorWithUIColor:v114];
    [v107 setObject:v115 forProperty:18];

    v98 = v146;
  }
  v116 = v164;
  [(SXTextSource *)v164 fontDescriptionsForTextStyleFontDescription:v98 defaultTextStyleFontDesciptions:v158];
  uint64_t v118 = v117 = v107;
  v119 = [(SXTextSource *)v164 fontAttributeConstructor];
  v155 = (void *)v118;
  uint64_t v120 = [v119 fontAttributesForFontDescriptions:v118];

  uint64_t v121 = [(SXTextSource *)v164 fontSizeForTextStyle:v159];
  v165 = (void *)v120;
  v122 = v117;
  v123 = [(SXTextSource *)v116 fontFaceForTextStyleFontDescription:v98 defaultTextStyleFontDescription:v144 fontAttributes:v120 fontSize:v121];
  v124 = [v123 fontDescriptorAttributes];

  if (v124)
  {
    v125 = [v123 fontAttributes];
    uint64_t v126 = [v125 weight];
    if (v126 <= 499)
    {
      if (v126 > 299)
      {
        if (v126 == 300)
        {
          v127 = (double *)MEMORY[0x263F1D328];
          goto LABEL_63;
        }
      }
      else
      {
        if (v126 == 100)
        {
          v127 = (double *)MEMORY[0x263F1D348];
          goto LABEL_63;
        }
        if (v126 == 200)
        {
          v127 = (double *)MEMORY[0x263F1D358];
          goto LABEL_63;
        }
      }
    }
    else if (v126 <= 699)
    {
      if (v126 == 500)
      {
        v127 = (double *)MEMORY[0x263F1D330];
        goto LABEL_63;
      }
      if (v126 == 600)
      {
        v127 = (double *)MEMORY[0x263F1D340];
        goto LABEL_63;
      }
    }
    else
    {
      switch(v126)
      {
        case 700:
          v127 = (double *)MEMORY[0x263F1D318];
          goto LABEL_63;
        case 800:
          v127 = (double *)MEMORY[0x263F1D320];
          goto LABEL_63;
        case 900:
          v127 = (double *)MEMORY[0x263F1D310];
LABEL_63:
          double v128 = *v127;
          *(float *)&double v128 = *v127;
          [v122 setFloatValue:50 forProperty:v128];

          v129 = [v123 fontAttributes];
          objc_msgSend(v122, "setBoolValue:forProperty:", (unint64_t)(objc_msgSend(v129, "style") - 1) < 2, 20);

          v130 = [v123 fontDescriptorAttributes];
          [v122 setBoxedObject:v130 forProperty:53];

          goto LABEL_64;
      }
    }
    v127 = (double *)MEMORY[0x263F1D338];
    goto LABEL_63;
  }
LABEL_64:
  unint64_t v131 = -[SXTextResizer resizeDropCapNumberOfLines:]((uint64_t)v162, [v98 numberOfLines]);
  double v132 = (double)v131 / (double)[v98 numberOfLines];
  if ([v98 numberOfRaisedLines] == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v133 = (unint64_t)(v132 * (double)[v98 numberOfRaisedLines])) == 0)
  {
    unint64_t v133 = [v98 numberOfRaisedLines] >= 1
        && [v98 numberOfRaisedLines] != 0x7FFFFFFFFFFFFFFFLL;
  }
  id v150 = v94;
  if (v133 >= v131) {
    unint64_t v134 = v131 - 1;
  }
  else {
    unint64_t v134 = v133;
  }
  v135 = [MEMORY[0x263F7C738] dropCapSpacingWithLineCount:v131 elevatedLineCount:v134];
  uint64_t v136 = [v98 padding];
  double v137 = 0.0;
  if (v136 != 0x7FFFFFFFFFFFFFFFLL) {
    double v137 = v132 * (double)objc_msgSend(v98, "padding", 0.0);
  }
  [v135 setPadding:v137];
  v138 = [MEMORY[0x263F7C730] dropCapWithCharCount:v157 characterStyleOverridePropertyMap:v122 spacing:v135];
  v139 = [v96 stylesheet];
  v140 = objc_msgSend(MEMORY[0x263F7C710], "propertyMapWithPropertiesAndValues:", 109, v138, 0);
  uint64_t v141 = [v139 variationOfStyle:v92 propertyMap:v140];

  v98 = v146;
  v99 = (void *)v141;
  v102 = v142;
  v100 = v159;
  id v91 = v161;
  v94 = v150;
LABEL_75:
  if (v99) {
    [v96 setParagraphStyle:v99 atParIndex:0 undoTransaction:0];
  }
}

uint64_t __49__SXTextSource_applyStylingOnTextTangierStorage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "paragraphIndexRangeForCharRange:", a2, a3);
  uint64_t v6 = *(void **)(a1 + 40);
  return objc_msgSend(v6, "addIndexesInRange:", v5, v4);
}

void __49__SXTextSource_applyStylingOnTextTangierStorage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = (id)[*(id *)(a1 + 32) copy];
  [*(id *)(a1 + 40) setParagraphStyle:v4 atParIndex:a2 undoTransaction:0];
}

void __49__SXTextSource_applyStylingOnTextTangierStorage___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v9 = a2;
  uint64_t v10 = [v8 context];
  id v11 = [v7 characterStyleFromAttributes:v9 context:v10];

  objc_msgSend(*(id *)(a1 + 40), "setCharacterStyle:range:undoTransaction:", v11, a3, a4, 0);
}

- (void)applyAdditionsOnTextTangierStorage:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [(SXTextSource *)self dataSource];
  uint64_t v26 = self;
  uint64_t v6 = [v5 additionsForTextSource:self];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
        uint64_t v12 = objc_opt_class();
        if (v12 != objc_opt_class() && [v11 range] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v13 = [v11 range];
          uint64_t v15 = -[SXTextSource rangeForRange:](v26, "rangeForRange:", v13, v14);
          uint64_t v17 = v16;
          uint64_t v18 = [(SXTextSource *)v26 string];
          uint64_t v19 = -[SXTextSource rangeInBounds:maxLength:](v26, "rangeInBounds:maxLength:", v15, v17, [v18 length]);
          uint64_t v21 = v20;

          unint64_t v22 = [(SXTextSource *)v26 smartFieldFactory];
          [v4 context];
          unint64_t v24 = v23 = v4;
          uint64_t v25 = [v22 smartFieldForAddition:v11 withContext:v24];

          id v4 = v23;
          if (v25) {
            objc_msgSend(v23, "addSmartField:toRange:dolcContext:undoTransaction:", v25, v19, v21, 0, 0);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }
}

- (void)applyListStylingOnTextTangierStorage:(id)a3 usingAttributesMap:(id)a4
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v91 = a4;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  uint64_t v7 = [(SXTextSource *)self dataSource];
  uint64_t v8 = [v7 inlineTextStylesForTextSource:self];

  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v129 objects:v136 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v96 = *(void *)v130;
    v102 = self;
    v113 = v6;
    do
    {
      uint64_t v11 = 0;
      uint64_t v92 = v10;
      do
      {
        if (*(void *)v130 != v96) {
          objc_enumerationMutation(obj);
        }
        uint64_t v101 = v11;
        uint64_t v12 = *(void **)(*((void *)&v129 + 1) + 8 * v11);
        uint64_t v13 = [v12 range];
        uint64_t v15 = -[SXTextSource rangeForRange:](self, "rangeForRange:", v13, v14);
        uint64_t v17 = v16;
        uint64_t v18 = [(SXTextSource *)self string];
        uint64_t v19 = -[SXTextSource rangeInBounds:maxLength:](self, "rangeInBounds:maxLength:", v15, v17, [v18 length]);
        uint64_t v21 = v20;

        uint64_t v98 = v21;
        uint64_t v99 = v19;
        unint64_t v22 = objc_msgSend(v6, "paragraphIndexRangeForCharRange:", v19, v21);
        unint64_t v24 = v23;
        uint64_t v25 = [v12 textStyle];
        uint64_t v26 = [(SXTextSource *)self dataSource];
        v100 = (void *)v25;
        uint64_t v27 = [v26 textStyleForIdentifier:v25];

        uint64_t v28 = [v27 listStyle];
        if (v28)
        {
          long long v29 = (void *)v28;
          long long v30 = [v27 listStyle];
          uint64_t v31 = [v30 count];

          if (v31)
          {
            uint64_t v32 = (void *)MEMORY[0x263F7C778];
            uint64_t v33 = [v6 context];
            v94 = [v32 defaultStyleWithContext:v33];

            uint64_t v34 = [MEMORY[0x263EFF980] array];
            v105 = [(SXTextSource *)self populateArray:v34 withValue:&unk_26D593E18 forSize:9];

            unint64_t v35 = [MEMORY[0x263EFF980] array];
            uint64_t v106 = [(SXTextSource *)self populateArray:v35 withValue:&stru_26D5311C0 forSize:9];

            uint64_t v36 = [MEMORY[0x263EFF980] array];
            uint64_t v104 = [(SXTextSource *)self populateArray:v36 withValue:&unk_26D593E18 forSize:9];

            uint64_t v37 = [MEMORY[0x263EFF980] array];
            uint64_t v97 = [(SXTextSource *)self populateArray:v37 withValue:&unk_26D593E30 forSize:9];

            uint64_t v38 = [v6 paragraphIndexAtCharIndex:v99];
            v112 = [MEMORY[0x263EFF9A0] dictionary];
            long long v125 = 0u;
            long long v126 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            id v103 = [v27 listStyle];
            uint64_t v95 = v27;
            uint64_t v108 = [v103 countByEnumeratingWithState:&v125 objects:v135 count:16];
            if (!v108) {
              goto LABEL_44;
            }
            uint64_t v107 = *(void *)v126;
            while (1)
            {
              for (uint64_t i = 0; i != v108; ++i)
              {
                if (*(void *)v126 != v107) {
                  objc_enumerationMutation(v103);
                }
                uint64_t v40 = *(void **)(*((void *)&v125 + 1) + 8 * i);
                unsigned int v110 = -[SXTextSource listLabelTypeForListType:](self, "listLabelTypeForListType:", [v40 style]);
                uint64_t v41 = -[SXTextSource listNumberTypeForListType:](self, "listNumberTypeForListType:", [v40 style]);
                v111 = @"  ";
                if ([v40 style] != 1)
                {
                  if ([v40 style] == 2)
                  {
                    uint64_t v42 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 8226);
                  }
                  else
                  {
                    v111 = &stru_26D5311C0;
                    if ([v40 style] != 8) {
                      goto LABEL_19;
                    }
                    uint64_t v42 = [v40 character];
                  }
                  v111 = (__CFString *)v42;
                }
LABEL_19:
                if ([v40 depth] && objc_msgSend(v40, "depth") != 0x7FFFFFFFFFFFFFFFLL
                  || ([v40 indices],
                      uint64_t v43 = objc_claimAutoreleasedReturnValue(),
                      uint64_t v44 = [v43 count],
                      v43,
                      v44))
                {
                  uint64_t v45 = [v40 indices];
                  uint64_t v46 = [v45 count];

                  if (!v46) {
                    goto LABEL_42;
                  }
                  uint64_t v109 = i;
                  if ([v40 style] == 1)
                  {
                    uint64_t v47 = (void *)MEMORY[0x263F7C778];
                    unint64_t v48 = [v113 context];
                    uint64_t v49 = [v47 defaultStyleWithContext:v48];

                    uint64_t v50 = [MEMORY[0x263EFF980] array];
                    id v51 = [NSNumber numberWithUnsignedInt:v41];
                    id v52 = [(SXTextSource *)self populateArray:v50 withValue:v51 forSize:9];
                    [v49 setValue:v52 forProperty:184];

                    int64_t v53 = [MEMORY[0x263EFF980] array];
                    id v54 = [(SXTextSource *)self populateArray:v53 withValue:v111 forSize:9];
                    [v49 setValue:v54 forProperty:183];

                    id v55 = [MEMORY[0x263EFF980] array];
                    uint64_t v56 = [NSNumber numberWithUnsignedInt:v110];
                    uint64_t v57 = [(SXTextSource *)self populateArray:v55 withValue:v56 forSize:9];
                    [v49 setValue:v57 forProperty:180];

                    uint64_t v58 = [MEMORY[0x263EFF980] array];
                    uint64_t v59 = [(SXTextSource *)self populateArray:v58 withValue:&unk_26D593E30 forSize:9];
                    [v49 setValue:v59 forProperty:176];
                  }
                  else
                  {
                    uint64_t v64 = [v40 depth];
                    v65 = [NSNumber numberWithUnsignedInt:v110];
                    [v105 replaceObjectAtIndex:v64 withObject:v65];

                    objc_msgSend(v106, "replaceObjectAtIndex:withObject:", objc_msgSend(v40, "depth"), v111);
                    uint64_t v66 = [v40 depth];
                    uint64_t v58 = [NSNumber numberWithUnsignedInt:v41];
                    [v104 replaceObjectAtIndex:v66 withObject:v58];
                    uint64_t v49 = 0;
                  }

                  long long v123 = 0u;
                  long long v124 = 0u;
                  long long v121 = 0u;
                  long long v122 = 0u;
                  uint64_t v67 = [v40 indices];
                  uint64_t v68 = [v67 countByEnumeratingWithState:&v121 objects:v134 count:16];
                  if (v68)
                  {
                    uint64_t v69 = v68;
                    uint64_t v70 = *(void *)v122;
                    do
                    {
                      for (uint64_t j = 0; j != v69; ++j)
                      {
                        if (*(void *)v122 != v70) {
                          objc_enumerationMutation(v67);
                        }
                        unint64_t v72 = [*(id *)(*((void *)&v121 + 1) + 8 * j) integerValue] + v38;
                        if (v72 >= v22 && v72 - v22 < v24)
                        {
                          objc_msgSend(v113, "setParagraphLevel:atParIndex:undoTransaction:", objc_msgSend(v40, "depth"), v72, 0);
                          if (v49)
                          {
                            uint64_t v74 = [NSNumber numberWithInteger:v72];
                            [v112 setObject:v49 forKey:v74];
                          }
                        }
                      }
                      uint64_t v69 = [v67 countByEnumeratingWithState:&v121 objects:v134 count:16];
                    }
                    while (v69);
                  }

                  self = v102;
                }
                else
                {
                  uint64_t v109 = i;
                  uint64_t v60 = [NSNumber numberWithUnsignedInt:v110];
                  uint64_t v61 = [(SXTextSource *)self populateArray:v105 withValue:v60 forSize:9];

                  uint64_t v62 = [NSNumber numberWithUnsignedInt:v41];
                  uint64_t v63 = [(SXTextSource *)self populateArray:v104 withValue:v62 forSize:9];

                  uint64_t v49 = v106;
                  [(SXTextSource *)self populateArray:v106 withValue:v111 forSize:9];
                  uint64_t v104 = (void *)v63;
                  uint64_t v106 = v105 = (void *)v61;
                }

                uint64_t i = v109;
LABEL_42:

                id v6 = v113;
              }
              uint64_t v108 = [v103 countByEnumeratingWithState:&v125 objects:v135 count:16];
              if (!v108)
              {
LABEL_44:

                [v94 setValue:v104 forProperty:184];
                [v94 setValue:v106 forProperty:183];
                [v94 setValue:v105 forProperty:180];
                [v94 setValue:v97 forProperty:176];
                uint64_t v75 = objc_msgSend(v91, "attributesMapWithAttributesForRange:", v99, v98);
                v120[0] = 0;
                v120[1] = 0;
                uint64_t v76 = [v75 attributedString];
                id v77 = [v76 attributesAtIndex:v99 effectiveRange:v120];

                v118[0] = MEMORY[0x263EF8330];
                v118[1] = 3221225472;
                v118[2] = __72__SXTextSource_applyListStylingOnTextTangierStorage_usingAttributesMap___block_invoke;
                v118[3] = &unk_264654700;
                id v78 = v94;
                id v119 = v78;
                [v77 enumerateKeysAndObjectsUsingBlock:v118];
                objc_msgSend(v6, "setListStyle:forCharRange:undoTransaction:", v78, v99, v98, 0);
                unint64_t v79 = v22 + 1;
                if (v22 + 1 < v22 + v24)
                {
                  unint64_t v80 = v24 - 1;
                  do
                  {
                    id v81 = [v6 paragraphStyleAtParIndex:v79 effectiveRange:0];
                    [v81 setFloatValue:87 forProperty:0.0];

                    ++v79;
                    --v80;
                  }
                  while (v80);
                }
                if (v22 < v22 + v24 - 1)
                {
                  unint64_t v82 = v24 - 1;
                  do
                  {
                    uint64_t v83 = [v6 paragraphStyleAtParIndex:v22 effectiveRange:0];
                    [v83 setFloatValue:88 forProperty:0.0];

                    ++v22;
                    --v82;
                  }
                  while (v82);
                }
                long long v116 = 0u;
                long long v117 = 0u;
                long long v114 = 0u;
                long long v115 = 0u;
                id v84 = v112;
                uint64_t v85 = [v84 countByEnumeratingWithState:&v114 objects:v133 count:16];
                if (v85)
                {
                  uint64_t v86 = v85;
                  uint64_t v87 = *(void *)v115;
                  do
                  {
                    for (uint64_t k = 0; k != v86; ++k)
                    {
                      if (*(void *)v115 != v87) {
                        objc_enumerationMutation(v84);
                      }
                      long long v89 = *(void **)(*((void *)&v114 + 1) + 8 * k);
                      id v90 = [v84 objectForKey:v89];
                      objc_msgSend(v6, "setListStyle:atParIndex:undoTransaction:", v90, (int)objc_msgSend(v89, "intValue"), 0);
                    }
                    uint64_t v86 = [v84 countByEnumeratingWithState:&v114 objects:v133 count:16];
                  }
                  while (v86);
                }

                self = v102;
                uint64_t v10 = v92;
                uint64_t v27 = v95;
                break;
              }
            }
          }
        }

        uint64_t v11 = v101 + 1;
      }
      while (v101 + 1 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v129 objects:v136 count:16];
    }
    while (v10);
  }
}

void __72__SXTextSource_applyListStylingOnTextTangierStorage_usingAttributesMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [MEMORY[0x263F7C778] properties];
  int v7 = objc_msgSend(v6, "containsProperty:", +[SXCharacterStyle propertyFromString:](SXCharacterStyle, "propertyFromString:", v8));

  if (v7) {
    objc_msgSend(*(id *)(a1 + 32), "setValue:forProperty:", v5, +[SXCharacterStyle propertyFromString:](SXCharacterStyle, "propertyFromString:", v8));
  }
}

- (id)populateArray:(id)a3 withValue:(id)a4 forSize:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5)
  {
    unint64_t v9 = 0;
    do
    {
      if ([v7 count] <= v9) {
        [v7 addObject:v8];
      }
      else {
        [v7 replaceObjectAtIndex:v9 withObject:v8];
      }
      ++v9;
    }
    while (a5 != v9);
  }

  return v7;
}

- (int)listLabelTypeForListType:(unint64_t)a3
{
  if (a3 <= 8 && ((1 << a3) & 0x106) != 0) {
    return 2;
  }
  else {
    return 3;
  }
}

- (int)listNumberTypeForListType:(unint64_t)a3
{
  if (a3 - 4 > 3) {
    return 0;
  }
  else {
    return dword_222BEF740[a3 - 4];
  }
}

- (id)characterStyleFromAttributes:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(TSSStyle *)[SXCharacterStyle alloc] initWithContext:v5];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__SXTextSource_characterStyleFromAttributes_context___block_invoke;
  v10[3] = &unk_264654700;
  id v8 = v7;
  uint64_t v11 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  return v8;
}

void __53__SXTextSource_characterStyleFromAttributes_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = +[SXCharacterStyle propertyFromString:a2];
  switch(+[SXCharacterStyle typeOfProperty:v5])
  {
    case 0u:
      [*(id *)(a1 + 32) setValue:v8 forProperty:v5];
      break;
    case 1u:
      objc_msgSend(*(id *)(a1 + 32), "setIntValue:forProperty:", objc_msgSend(v8, "intValue"), v5);
      break;
    case 2u:
      id v6 = *(void **)(a1 + 32);
      [v8 floatValue];
      objc_msgSend(v6, "setFloatValue:forProperty:", v5);
      break;
    case 3u:
      id v7 = *(void **)(a1 + 32);
      [v8 doubleValue];
      objc_msgSend(v7, "setDoubleValue:forProperty:", v5);
      break;
    default:
      break;
  }
}

- (id)attributesForTextStyle:(id)a3 onParagraphStyle:(id)a4 forRange:(_NSRange)a5 resultingDropCapStyle:(id *)a6 textResizer:(id)a7 fontFace:(id)a8
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  uint64_t v16 = +[SXTextStyleAttributes attributesWithRange:](SXTextStyleAttributes, "attributesWithRange:", location, length);
  uint64_t v17 = [(SXTextSource *)self fontSizeForTextStyle:v13];
  int64_t v18 = [(SXTextSource *)self scaledFontSizeForFontSize:v17];
  objc_opt_class();
  unint64_t v133 = v15;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_42;
  }
  int64_t v131 = v18;
  uint64_t v19 = a6;
  id v20 = v13;
  uint64_t v21 = [(SXTextSource *)self dataSource];
  unint64_t v22 = [v21 textRulesForTextSource:self];
  if ([v22 shouldHyphenate] && !objc_msgSend(v20, "hyphenation"))
  {
  }
  else
  {
    uint64_t v23 = objc_msgSend(v20, "hyphenation", v131);

    if (v23 != 1)
    {
      uint64_t v24 = 0;
      goto LABEL_8;
    }
  }
  uint64_t v24 = 1;
LABEL_8:
  id v15 = v133;
  uint64_t v25 = v19;
  objc_msgSend(v14, "setIntValue:forProperty:", v24, 93, v131);
  objc_msgSend(v14, "setIntValue:forProperty:", objc_msgSend(v20, "hyphenationMinimumCharactersBefore"), String());
  objc_msgSend(v14, "setIntValue:forProperty:", objc_msgSend(v20, "hyphenationMinimumCharactersAfter"), String());
  objc_msgSend(v14, "setIntValue:forProperty:", objc_msgSend(v20, "hyphenationMinimumWordLength"), String());
  [v20 hyphenationZone];
  float v27 = v26;
  uint64_t v28 = String();
  *(float *)&double v29 = v27;
  [v14 setFloatValue:v28 forProperty:v29];
  [v20 relativeLineHeight];
  double v31 = v30;
  uint64_t v32 = [v20 exactLineHeight];
  int64_t v18 = v132;
  if ([v20 lineHeight] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v36 = [v20 lineHeight];
LABEL_15:
    double v35 = (double)v36;
    double v33 = (double)v17;
LABEL_16:
    double v37 = (double)v132 / v33 * v35;
    double v38 = 1.79769313e308;
    if (v37 != 1.79769313e308)
    {
      if (v37 >= 1.0) {
        double v38 = v37;
      }
      else {
        double v38 = 1.0;
      }
      uint64_t v39 = (void *)[objc_alloc(MEMORY[0x263F7C770]) initWithMode:2 amount:v38];
      [v14 setValue:v39 forProperty:85];
    }
    goto LABEL_21;
  }
  if (v31 != 1.79769313e308 && v32 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v33 = (double)v17;
    [v20 relativeLineHeight];
    double v35 = (v34 + -1.0) * v33 + v33 * 1.25;
    goto LABEL_16;
  }
  if (v32 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v36 = [v20 exactLineHeight];
    goto LABEL_15;
  }
  double v38 = 1.79769313e308;
LABEL_21:
  if ([v20 textAlignment]) {
    objc_msgSend(v14, "setIntValue:forProperty:", -[SXTextSource paragraphAlignmentForTextAlignment:](self, "paragraphAlignmentForTextAlignment:", objc_msgSend(v20, "textAlignment")), 86);
  }
  if ([v20 paragraphSpacingBefore] != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v40 = (double)v132 / (double)v17 * (double)[v20 paragraphSpacingBefore];
    *(float *)&double v40 = v40;
    [v14 setFloatValue:87 forProperty:v40];
  }
  if ([v20 paragraphSpacingAfter] != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v41 = (double)v132 / (double)v17 * (double)[v20 paragraphSpacingAfter];
    *(float *)&double v41 = v41;
    [v14 setFloatValue:88 forProperty:v41];
  }
  if ([v20 paragraphSpacingBefore] == 0x7FFFFFFFFFFFFFFFLL
    && [v20 paragraphSpacingAfter] == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v42 = (double)v132 * 1.25;
    if (v38 != 1.79769313e308) {
      double v42 = v38;
    }
    *(float *)&double v42 = v42;
    [v14 setFloatValue:88 forProperty:v42];
  }
  uint64_t v43 = [v20 dropCapStyle];

  if (v25 && v43)
  {
    *uint64_t v25 = [v20 dropCapStyle];
  }
  if ([v20 firstLineIndent] != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(float *)&double v44 = (float)[v20 firstLineIndent];
    [v14 setFloatValue:80 forProperty:v44];
  }
  if ([v20 hangingPunctuation]) {
    [v14 setIntValue:1 forProperty:110];
  }
  if ([v20 lineBalancing]) {
    [v14 setIntValue:1 forProperty:51];
  }

LABEL_42:
  uint64_t v45 = [v15 fontDescriptorAttributes];

  if (v45)
  {
    uint64_t v46 = v15;
    uint64_t v47 = +[SXCharacterStyle stringFromProperty:50];
    unint64_t v48 = NSNumber;
    uint64_t v49 = [v46 fontAttributes];
    uint64_t v50 = [v49 weight];
    if (v50 <= 499)
    {
      if (v50 > 299)
      {
        if (v50 == 300)
        {
          id v51 = (double *)MEMORY[0x263F1D328];
          goto LABEL_64;
        }
      }
      else
      {
        if (v50 == 100)
        {
          id v51 = (double *)MEMORY[0x263F1D348];
          goto LABEL_64;
        }
        if (v50 == 200)
        {
          id v51 = (double *)MEMORY[0x263F1D358];
          goto LABEL_64;
        }
      }
    }
    else if (v50 <= 699)
    {
      if (v50 == 500)
      {
        id v51 = (double *)MEMORY[0x263F1D330];
        goto LABEL_64;
      }
      if (v50 == 600)
      {
        id v51 = (double *)MEMORY[0x263F1D340];
        goto LABEL_64;
      }
    }
    else
    {
      switch(v50)
      {
        case 700:
          id v51 = (double *)MEMORY[0x263F1D318];
          goto LABEL_64;
        case 800:
          id v51 = (double *)MEMORY[0x263F1D320];
          goto LABEL_64;
        case 900:
          id v51 = (double *)MEMORY[0x263F1D310];
LABEL_64:
          id v52 = [v48 numberWithDouble:*v51];
          [v16 addAttribute:v47 value:v52];

          int64_t v53 = +[SXCharacterStyle stringFromProperty:20];
          id v54 = NSNumber;
          id v55 = [v133 fontAttributes];
          uint64_t v56 = objc_msgSend(v54, "numberWithBool:", (unint64_t)(objc_msgSend(v55, "style") - 1) < 2);
          [v16 addAttribute:v53 value:v56];

          uint64_t v57 = +[SXCharacterStyle stringFromProperty:53];
          uint64_t v58 = [v133 fontDescriptorAttributes];
          [v16 addAttribute:v57 value:v58];

          goto LABEL_65;
      }
    }
    id v51 = (double *)MEMORY[0x263F1D338];
    goto LABEL_64;
  }
LABEL_65:
  if (v18 && v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v59 = +[SXCharacterStyle stringFromProperty:17];
    uint64_t v60 = [NSNumber numberWithInteger:v18];
    [v16 addAttribute:v59 value:v60];
  }
  uint64_t v61 = [v13 textColor];

  if (v61)
  {
    uint64_t v62 = +[SXCharacterStyle stringFromProperty:18];
    uint64_t v63 = (void *)MEMORY[0x263F7C808];
    uint64_t v64 = [v13 textColor];
    v65 = [v63 colorWithUIColor:v64];
    [v16 addAttribute:v62 value:v65];
  }
  uint64_t v66 = [v13 backgroundColor];

  if (v66)
  {
    uint64_t v67 = +[SXCharacterStyle stringFromProperty:37];
    uint64_t v68 = (void *)MEMORY[0x263F7C808];
    uint64_t v69 = [v13 backgroundColor];
    uint64_t v70 = [v68 colorWithUIColor:v69];
    [v16 addAttribute:v67 value:v70];
  }
  if ([v13 textTransform] == 4)
  {
    id v71 = +[SXCharacterStyle stringFromProperty:48];
    [v16 addAttribute:v71 value:&unk_26D593E48];

    unint64_t v72 = +[SXCharacterStyle stringFromProperty:21];
    [v16 addAttribute:v72 value:&unk_26D593E30];
  }
  [v13 tracking];
  if (v73 != 1.79769313e308)
  {
    uint64_t v74 = +[SXCharacterStyle stringFromProperty:35];
    uint64_t v75 = NSNumber;
    [v13 tracking];
    uint64_t v76 = objc_msgSend(v75, "numberWithDouble:");
    [v16 addAttribute:v74 value:v76];

    [v13 tracking];
    if (v77 != 0.0)
    {
      id v78 = +[SXCharacterStyle stringFromProperty:41];
      [v16 addAttribute:v78 value:&unk_26D593E18];
    }
  }
  if ([v13 verticalAlignment])
  {
    int v79 = [v13 verticalAlignment];
    if (v79 == 3) {
      uint64_t v80 = 2;
    }
    else {
      uint64_t v80 = v79 == 2;
    }
    id v81 = +[SXCharacterStyle stringFromProperty:36];
    unint64_t v82 = [NSNumber numberWithUnsignedInt:v80];
    [v16 addAttribute:v81 value:v82];
  }
  uint64_t v83 = [v13 textShadow];

  if (v83)
  {
    id v84 = [v13 textShadow];
    uint64_t v85 = [v84 TSDShadow];

    uint64_t v86 = +[SXCharacterStyle stringFromProperty:40];
    [v16 addAttribute:v86 value:v85];
  }
  uint64_t v87 = [v13 strikethrough];

  if (v87)
  {
    long long v88 = +[SXCharacterStyle stringFromProperty:26];
    [v16 addAttribute:v88 value:&unk_26D593E48];

    long long v89 = [v13 strikethrough];
    id v90 = [v89 color];

    if (v90)
    {
      id v91 = +[SXCharacterStyle stringFromProperty:28];
      uint64_t v92 = (void *)MEMORY[0x263F7C808];
      id v93 = [v13 strikethrough];
      v94 = [v93 color];
      uint64_t v95 = [v92 colorWithUIColor:v94];
      [v16 addAttribute:v91 value:v95];
    }
    uint64_t v96 = [v13 strikethrough];
    uint64_t v97 = [v96 width];

    if (v97 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v98 = 1;
    }
    else {
      uint64_t v98 = v97;
    }
    uint64_t v99 = +[SXCharacterStyle stringFromProperty:27];
    v100 = [NSNumber numberWithInteger:v98];
    [v16 addAttribute:v99 value:v100];
  }
  uint64_t v101 = [v13 underline];

  if (v101)
  {
    v102 = +[SXCharacterStyle stringFromProperty:22];
    [v16 addAttribute:v102 value:&unk_26D593E48];

    id v103 = [v13 underline];
    uint64_t v104 = [v103 color];

    if (v104)
    {
      v105 = +[SXCharacterStyle stringFromProperty:24];
      uint64_t v106 = (void *)MEMORY[0x263F7C808];
      uint64_t v107 = [v13 underline];
      uint64_t v108 = [v107 color];
      uint64_t v109 = [v106 colorWithUIColor:v108];
      [v16 addAttribute:v105 value:v109];
    }
    unsigned int v110 = [v13 underline];
    uint64_t v111 = [v110 width];

    if (v111 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v112 = 1;
    }
    else {
      uint64_t v112 = v111;
    }
    v113 = +[SXCharacterStyle stringFromProperty:23];
    long long v114 = [NSNumber numberWithInteger:v112];
    [v16 addAttribute:v113 value:v114];
  }
  long long v115 = [v13 stroke];

  if (v115)
  {
    long long v116 = [v13 stroke];
    [v116 width];
    if (v117 == 9.22337204e18)
    {
      uint64_t v120 = 1;
    }
    else
    {
      uint64_t v118 = [v13 stroke];
      [v118 width];
      uint64_t v120 = (uint64_t)v119;
    }
    long long v121 = [v13 stroke];
    long long v122 = [v121 color];
    if (v122)
    {
      long long v123 = [v13 stroke];
      long long v124 = [v123 color];
    }
    else
    {
      long long v124 = 0;
    }

    long long v125 = +[SXCharacterStyle stringFromProperty:31];
    long long v126 = [NSNumber numberWithInteger:v120];
    [v16 addAttribute:v125 value:v126];

    if (v124)
    {
      long long v127 = +[SXCharacterStyle stringFromProperty:32];
      long long v128 = [MEMORY[0x263F7C808] colorWithUIColor:v124];
      [v16 addAttribute:v127 value:v128];

      long long v129 = +[SXCharacterStyle stringFromProperty:49];
      [v16 addAttribute:v129 value:&unk_26D593E48];
    }
  }

  return v16;
}

- (void)transform:(id)a3 forTextStyle:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v13 = a3;
  id v8 = a4;
  if ([v8 textTransform])
  {
    unint64_t v9 = objc_msgSend(v13, "substringWithRange:", location, length);
    uint64_t v10 = [v8 textTransform];
    switch(v10)
    {
      case 1:
        uint64_t v11 = [v9 localizedUppercaseString];
        break;
      case 3:
        uint64_t v11 = [v9 localizedCapitalizedString];
        break;
      case 2:
        uint64_t v11 = [v9 localizedLowercaseString];
        break;
      default:
LABEL_9:
        objc_msgSend(v13, "replaceCharactersInRange:withString:undoTransaction:", location, length, v9, 0);

        goto LABEL_10;
    }
    uint64_t v12 = (void *)v11;

    unint64_t v9 = v12;
    goto LABEL_9;
  }
LABEL_10:
}

- (NSLocale)locale
{
  v2 = [(SXTextSource *)self documentLanguageProvider];
  uint64_t v3 = [v2 language];

  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = @"en";
  }
  uint64_t v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];

  return (NSLocale *)v5;
}

- (_NSRange)rangeInBounds:(_NSRange)a3 maxLength:(unint64_t)a4
{
  if (a3.location >= a4 - 1) {
    unint64_t location = a4 - 1;
  }
  else {
    unint64_t location = a3.location;
  }
  if (a3.length >= a4 - location) {
    NSUInteger length = a4 - location;
  }
  else {
    NSUInteger length = a3.length;
  }
  result.NSUInteger length = length;
  result.unint64_t location = location;
  return result;
}

- (id)fontFaceForTextStyleFontDescription:(id)a3 defaultTextStyleFontDescription:(id)a4 fontAttributes:(id)a5 fontSize:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 fontAttributes];
  if (v13 || ([v11 fontAttributes], (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    if (v12)
    {
      if (a6 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v14 = [(SXTextSource *)self defaults];
        uint64_t v15 = (uint64_t)-[SXBlueprintAnalyzerCursor highestMaxY]((uint64_t)v14);
      }
      else
      {
        uint64_t v15 = [(SXTextSource *)self scaledFontSizeForFontSize:a6];
      }
      uint64_t v16 = [(SXTextSource *)self fontAttributeConstructor];
      uint64_t v17 = [v16 fontFaceForAttributes:v12 size:v15];
      goto LABEL_11;
    }
  }
  uint64_t v16 = [v10 fontName];
  if (v16 || ([v11 fontName], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v17 = +[SXTextSourceFontFace fontFaceWithFontName:v16];
LABEL_11:
    int64_t v18 = (void *)v17;

    goto LABEL_12;
  }
  int64_t v18 = 0;
LABEL_12:

  return v18;
}

- (id)fontDescriptionsForTextStyleFontDescription:(id)a3 defaultTextStyleFontDesciptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  unint64_t v9 = v8;
  if (v6) {
    [v8 addObject:v6];
  }
  [v9 addObjectsFromArray:v7];
  id v10 = [(SXTextSource *)self defaultFontDescribing];
  [v9 addObject:v10];

  id v11 = (void *)[v9 copy];
  return v11;
}

- (unsigned)paragraphAlignmentForTextAlignment:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2) {
    return 0;
  }
  else {
    return dword_222BEF750[a3 - 2];
  }
}

- (int64_t)scaledFontSizeForFontSize:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v6 = [(SXTextSource *)self dataSource];
  id v7 = [v6 textRulesForTextSource:self];

  id v8 = [(SXTextSource *)self dataSource];
  unint64_t v9 = [v8 textResizerForTextSource:self];

  id v10 = [(SXTextSource *)self dataSource];
  id v11 = [v10 contentSizeCategoryForTextSource:self];

  [v7 fontResizingTresholdFactor];
  double v13 = v12;
  [v7 fontSizeConstant];
  double v15 = v14;
  uint64_t v16 = [v7 fontTextStyle];
  int64_t v17 = -[SXTextResizer resizeTextSize:fontResizingThreshold:fontSizeConstant:contentSizeCategory:fontTextStyle:]((uint64_t)v9, a3, v11, v16, v13, v15);

  return v17;
}

- (int64_t)fontSizeForTextStyle:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 fontSize];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(SXTextSource *)self defaults];
      int64_t v5 = (uint64_t)-[SXBlueprintAnalyzerCursor highestMaxY]((uint64_t)v6);
    }
    else
    {
      int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v5;
}

- (id)randomColorWithAlpha:(double)a3
{
  double v4 = (double)arc4random() * 0.00390625;
  double v5 = (double)(arc4random() & 0x7F) * 0.00390625 + 0.5;
  double v6 = (double)(arc4random() & 0x7F) * 0.00390625 + 0.5;
  id v7 = (void *)MEMORY[0x263F1C550];
  return (id)[v7 colorWithHue:v4 saturation:v5 brightness:v6 alpha:a3];
}

- (SXTextSourceDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SXTextSourceDataSource *)WeakRetained;
}

- (NSString)string
{
  return self->_string;
}

- (SXTextSourceDefaults)defaults
{
  return self->_defaults;
}

- (SXSmartFieldFactory)smartFieldFactory
{
  return self->_smartFieldFactory;
}

- (NSMutableIndexSet)deletedRangeOffsets
{
  return self->_deletedRangeOffsets;
}

- (void)setDeletedRangeOffsets:(id)a3
{
}

- (NSMutableIndexSet)insertedRangeOffsets
{
  return self->_insertedRangeOffsets;
}

- (void)setInsertedRangeOffsets:(id)a3
{
}

- (NSMutableIndexSet)rangesExcludedOfParagraphSpacing
{
  return self->_rangesExcludedOfParagraphSpacing;
}

- (void)setRangesExcludedOfParagraphSpacing:(id)a3
{
}

- (SXFontAttributesConstructor)fontAttributeConstructor
{
  return self->_fontAttributeConstructor;
}

- (SXTextStyleFontDescribing)defaultFontDescribing
{
  return self->_defaultFontDescribing;
}

- (SXDocumentLanguageProviding)documentLanguageProvider
{
  return self->_documentLanguageProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentLanguageProvider, 0);
  objc_storeStrong((id *)&self->_defaultFontDescribing, 0);
  objc_storeStrong((id *)&self->_fontAttributeConstructor, 0);
  objc_storeStrong((id *)&self->_rangesExcludedOfParagraphSpacing, 0);
  objc_storeStrong((id *)&self->_insertedRangeOffsets, 0);
  objc_storeStrong((id *)&self->_deletedRangeOffsets, 0);
  objc_storeStrong((id *)&self->_smartFieldFactory, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)initWithString:(void *)a3 smartFieldFactory:dataSource:documentLanguageProvider:fontAttributesConstructor:.cold.1(void *a1, uint8_t *buf, void *a3)
{
  *(_DWORD *)buf = 136315906;
  *(void *)(buf + 4) = "-[SXTextSource initWithString:smartFieldFactory:dataSource:documentLanguageProvider:fontAttribu"
                         "tesConstructor:]";
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = "SXTextSource.m";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 142;
  *((_WORD *)buf + 14) = 2114;
  *(void *)(buf + 30) = a1;
  _os_log_fault_impl(&dword_222AC5000, &_os_log_internal, OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: StringCleaning) : %s %s:%d %{public}@", buf, 0x26u);
}

@end