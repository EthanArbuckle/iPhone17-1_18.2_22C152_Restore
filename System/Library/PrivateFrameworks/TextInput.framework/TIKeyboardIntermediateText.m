@interface TIKeyboardIntermediateText
+ (BOOL)supportsSecureCoding;
+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4;
+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4 lastInputString:(id)a5;
+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 lastInputString:(id)a6;
+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6 candidateOffset:(int64_t)a7 liveConversionSegments:(id)a8 highlightSegmentIndex:(int64_t)a9 lastInputString:(id)a10;
+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6 lastInputString:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSArray)liveConversionSegments;
- (NSString)displayString;
- (NSString)inputString;
- (NSString)lastInputString;
- (NSString)searchString;
- (TIKeyboardIntermediateText)initWithCoder:(id)a3;
- (TIKeyboardIntermediateText)initWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6 candidateOffset:(unint64_t)a7 liveConversionSegments:(id)a8 highlightSegmentIndex:(int64_t)a9 lastInputString:(id)a10;
- (_NSRange)selectedRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)candidateOffset;
- (int64_t)highlightSegmentIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIKeyboardIntermediateText

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_liveConversionSegments, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_lastInputString, 0);

  objc_storeStrong((id *)&self->_inputString, 0);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (int64_t)highlightSegmentIndex
{
  return self->_highlightSegmentIndex;
}

- (NSArray)liveConversionSegments
{
  return self->_liveConversionSegments;
}

- (int64_t)candidateOffset
{
  return self->_candidateOffset;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)lastInputString
{
  return self->_lastInputString;
}

- (NSString)inputString
{
  return self->_inputString;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TIKeyboardIntermediateText *)self displayString];
  v6 = [(TIKeyboardIntermediateText *)self inputString];
  v7 = [(TIKeyboardIntermediateText *)self lastInputString];
  v8 = [v3 stringWithFormat:@"<%@: %p; %@ (%@) %@>", v4, self, v5, v6, v7];

  return v8;
}

- (_NSRange)selectedRange
{
  NSUInteger v2 = [(NSString *)self->_displayString length] - self->_selectionOffset;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(TIKeyboardIntermediateText *)self inputString];
  uint64_t v4 = [v3 hash];

  v5 = [(TIKeyboardIntermediateText *)self lastInputString];
  uint64_t v6 = [v5 hash] + 257 * v4;

  v7 = [(TIKeyboardIntermediateText *)self displayString];
  uint64_t v8 = [v7 hash] + 257 * v6;

  v9 = [(TIKeyboardIntermediateText *)self searchString];
  uint64_t v10 = [v9 hash] + 257 * v8;

  uint64_t v11 = 257 * ([(TIKeyboardIntermediateText *)self selectedRange] + 257 * v10);
  int64_t v12 = 257 * (v11 + [(TIKeyboardIntermediateText *)self candidateOffset]);
  v13 = [(TIKeyboardIntermediateText *)self liveConversionSegments];
  int64_t v14 = v12 + [v13 hash];

  return 257 * v14 + [(TIKeyboardIntermediateText *)self highlightSegmentIndex];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(TIKeyboardIntermediateText *)self inputString];
    uint64_t v7 = [v5 inputString];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      v9 = [(TIKeyboardIntermediateText *)self inputString];
      uint64_t v10 = [v5 inputString];
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_24;
      }
    }
    v13 = [(TIKeyboardIntermediateText *)self lastInputString];
    uint64_t v14 = [v5 lastInputString];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(TIKeyboardIntermediateText *)self lastInputString];
      v17 = [v5 lastInputString];
      int v18 = [v16 isEqualToString:v17];

      if (!v18) {
        goto LABEL_24;
      }
    }
    v19 = [(TIKeyboardIntermediateText *)self displayString];
    uint64_t v20 = [v5 displayString];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(TIKeyboardIntermediateText *)self displayString];
      v23 = [v5 displayString];
      int v24 = [v22 isEqualToString:v23];

      if (!v24) {
        goto LABEL_24;
      }
    }
    v25 = [(TIKeyboardIntermediateText *)self searchString];
    uint64_t v26 = [v5 searchString];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(TIKeyboardIntermediateText *)self searchString];
      v29 = [v5 searchString];
      int v30 = [v28 isEqualToString:v29];

      if (!v30) {
        goto LABEL_24;
      }
    }
    uint64_t v31 = [(TIKeyboardIntermediateText *)self selectedRange];
    uint64_t v33 = v32;
    BOOL v12 = 0;
    if (v31 != [v5 selectedRange] || v33 != v34) {
      goto LABEL_25;
    }
    int64_t v35 = [(TIKeyboardIntermediateText *)self candidateOffset];
    if (v35 != [v5 candidateOffset]) {
      goto LABEL_24;
    }
    v36 = [(TIKeyboardIntermediateText *)self liveConversionSegments];
    uint64_t v37 = [v5 liveConversionSegments];
    if (v36 == (void *)v37)
    {
    }
    else
    {
      v38 = (void *)v37;
      v39 = [(TIKeyboardIntermediateText *)self liveConversionSegments];
      v40 = [v5 liveConversionSegments];
      int v41 = [v39 isEqual:v40];

      if (!v41)
      {
LABEL_24:
        BOOL v12 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    int64_t v43 = [(TIKeyboardIntermediateText *)self highlightSegmentIndex];
    BOOL v12 = v43 == [v5 highlightSegmentIndex];
    goto LABEL_25;
  }
  BOOL v12 = 0;
LABEL_26:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  inputString = self->_inputString;
  id v13 = v4;
  if (inputString)
  {
    [v4 encodeObject:inputString forKey:@"inputString"];
    id v4 = v13;
  }
  lastInputString = self->_lastInputString;
  if (lastInputString)
  {
    [v13 encodeObject:lastInputString forKey:@"lastInputString"];
    id v4 = v13;
  }
  displayString = self->_displayString;
  if (displayString)
  {
    [v13 encodeObject:displayString forKey:@"displayString"];
    id v4 = v13;
  }
  unint64_t selectionOffset = self->_selectionOffset;
  if (selectionOffset)
  {
    [v13 encodeInteger:selectionOffset forKey:@"selectionOffset"];
    id v4 = v13;
  }
  searchString = self->_searchString;
  if (searchString)
  {
    [v13 encodeObject:searchString forKey:@"searchString"];
    id v4 = v13;
  }
  int64_t candidateOffset = self->_candidateOffset;
  if (candidateOffset)
  {
    [v13 encodeInteger:candidateOffset forKey:@"candidateOffset"];
    id v4 = v13;
  }
  liveConversionSegments = self->_liveConversionSegments;
  if (liveConversionSegments)
  {
    [v13 encodeObject:liveConversionSegments forKey:@"liveConversionSegments"];
    id v4 = v13;
  }
  int64_t highlightSegmentIndex = self->_highlightSegmentIndex;
  if (highlightSegmentIndex)
  {
    [v13 encodeInteger:highlightSegmentIndex forKey:@"highlightSegmentIndex"];
    id v4 = v13;
  }
}

- (TIKeyboardIntermediateText)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TIKeyboardIntermediateText;
  id v5 = [(TIKeyboardIntermediateText *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputString"];
    uint64_t v7 = [v6 copy];
    inputString = v5->_inputString;
    v5->_inputString = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastInputString"];
    uint64_t v10 = [v9 copy];
    lastInputString = v5->_lastInputString;
    v5->_lastInputString = (NSString *)v10;

    BOOL v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayString"];
    uint64_t v13 = [v12 copy];
    displayString = v5->_displayString;
    v5->_displayString = (NSString *)v13;

    v5->_unint64_t selectionOffset = [v4 decodeIntegerForKey:@"selectionOffset"];
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchString"];
    uint64_t v16 = [v15 copy];
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v16;

    v5->_int64_t candidateOffset = [v4 decodeIntegerForKey:@"candidateOffset"];
    int v18 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v20 = [v18 setWithArray:v19];
    v21 = [v4 decodeObjectOfClasses:v20 forKey:@"liveConversionSegments"];
    uint64_t v22 = [v21 copy];
    liveConversionSegments = v5->_liveConversionSegments;
    v5->_liveConversionSegments = (NSArray *)v22;

    v5->_int64_t highlightSegmentIndex = [v4 decodeIntegerForKey:@"highlightSegmentIndex"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_inputString copyWithZone:a3];
    uint64_t v7 = (void *)v5[2];
    v5[2] = v6;

    uint64_t v8 = [(NSString *)self->_lastInputString copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    uint64_t v10 = [(NSString *)self->_displayString copyWithZone:a3];
    int v11 = (void *)v5[4];
    v5[4] = v10;

    v5[1] = self->_selectionOffset;
    uint64_t v12 = [(NSString *)self->_searchString copyWithZone:a3];
    uint64_t v13 = (void *)v5[8];
    v5[8] = v12;

    v5[5] = self->_candidateOffset;
    uint64_t v14 = [(NSArray *)self->_liveConversionSegments copyWithZone:a3];
    v15 = (void *)v5[6];
    v5[6] = v14;

    v5[7] = self->_highlightSegmentIndex;
  }
  return v5;
}

- (TIKeyboardIntermediateText)initWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6 candidateOffset:(unint64_t)a7 liveConversionSegments:(id)a8 highlightSegmentIndex:(int64_t)a9 lastInputString:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  id v20 = a10;
  v35.receiver = self;
  v35.super_class = (Class)TIKeyboardIntermediateText;
  v21 = [(TIKeyboardIntermediateText *)&v35 init];
  if (v21)
  {
    uint64_t v22 = [v16 copy];
    inputString = v21->_inputString;
    v21->_inputString = (NSString *)v22;

    uint64_t v24 = [v20 copy];
    lastInputString = v21->_lastInputString;
    v21->_lastInputString = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    displayString = v21->_displayString;
    v21->_displayString = (NSString *)v26;

    unint64_t v28 = [(NSString *)v21->_displayString length];
    unint64_t v29 = v28 - a5;
    if (v28 < a5) {
      unint64_t v29 = 0;
    }
    v21->_unint64_t selectionOffset = v29;
    uint64_t v30 = [v18 copy];
    searchString = v21->_searchString;
    v21->_searchString = (NSString *)v30;

    v21->_int64_t candidateOffset = a7;
    uint64_t v32 = [v19 copy];
    liveConversionSegments = v21->_liveConversionSegments;
    v21->_liveConversionSegments = (NSArray *)v32;

    v21->_int64_t highlightSegmentIndex = a9;
  }

  return v21;
}

+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6 candidateOffset:(int64_t)a7 liveConversionSegments:(id)a8 highlightSegmentIndex:(int64_t)a9 lastInputString:(id)a10
{
  id v16 = a10;
  id v17 = a8;
  id v18 = a6;
  id v19 = a4;
  id v20 = a3;
  v21 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInputString:v20 displayString:v19 selectionLocation:a5 searchString:v18 candidateOffset:a7 liveConversionSegments:v17 highlightSegmentIndex:a9 lastInputString:v16];

  return (TIKeyboardIntermediateText *)v21;
}

+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6 lastInputString:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInputString:v14 displayString:v13 selectionLocation:a5 searchString:v12 candidateOffset:0x7FFFFFFFFFFFFFFFLL liveConversionSegments:0 highlightSegmentIndex:0x7FFFFFFFFFFFFFFFLL lastInputString:v11];

  return (TIKeyboardIntermediateText *)v15;
}

+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 lastInputString:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInputString:v11 displayString:v10 selectionLocation:a5 searchString:0 candidateOffset:0x7FFFFFFFFFFFFFFFLL liveConversionSegments:0 highlightSegmentIndex:0x7FFFFFFFFFFFFFFFLL lastInputString:v9];

  return (TIKeyboardIntermediateText *)v12;
}

+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4 lastInputString:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInputString:v9 displayString:v8 selectionLocation:0x7FFFFFFFFFFFFFFFLL searchString:0 candidateOffset:0x7FFFFFFFFFFFFFFFLL liveConversionSegments:0 highlightSegmentIndex:0x7FFFFFFFFFFFFFFFLL lastInputString:v7];

  return (TIKeyboardIntermediateText *)v10;
}

+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInputString:v6 displayString:v5 selectionLocation:0x7FFFFFFFFFFFFFFFLL searchString:0 candidateOffset:0x7FFFFFFFFFFFFFFFLL liveConversionSegments:0 highlightSegmentIndex:0x7FFFFFFFFFFFFFFFLL lastInputString:0];

  return (TIKeyboardIntermediateText *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end