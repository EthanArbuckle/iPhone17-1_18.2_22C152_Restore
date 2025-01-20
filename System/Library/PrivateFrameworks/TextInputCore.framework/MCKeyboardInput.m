@interface MCKeyboardInput
- (BOOL)canComposeNew:(id)a3;
- (BOOL)hasDrawInput;
- (BOOL)hasKindOf:(Class)a3;
- (BOOL)hasRemainingComposingInput;
- (MCKeyboardInput)composingInput;
- (MCKeyboardInput)init;
- (MCKeyboardInput)initWithSourceKeyboardState:(id)a3;
- (MCKeyboardState)sourceKeyboardState;
- (NSArray)inputs;
- (NSMutableArray)mutableInputs;
- (id)_asInputStringWithCursorIndex:(unint64_t *)a3 remainingComposingInputIndex:(unint64_t *)a4 typeInputs:(id)a5 forSearch:(BOOL)a6 suffix:(id)a7;
- (id)asCommittedText;
- (id)asInlineText;
- (id)asMecabraGestures:(BOOL *)a3;
- (id)asSearchString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)shortDescription;
- (id)shortDescriptionExcludingSubInputs;
- (id)shortDescriptionWithLeadingString:(id)a3;
- (unint64_t)asInlineTextCursorIndex;
- (unint64_t)asSearchTextCursorIndex;
- (unint64_t)composingInputIndex;
- (unint64_t)totalDrawSamples;
- (void)_addNearbyKeys:(id)a3 to:(void *)a4 likelihoodThreshold:(float)a5;
- (void)composeNew:(id)a3;
- (void)insertInput:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAllInputs;
- (void)removeComposingInput;
- (void)removeInputAtIndex:(unint64_t)a3;
- (void)replaceComposingInputWith:(id)a3;
- (void)replaceInputAtIndex:(unint64_t)a3 with:(id)a4;
- (void)setComposingInput:(id)a3;
- (void)setComposingInputIndex:(unint64_t)a3;
@end

@implementation MCKeyboardInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceKeyboardState, 0);

  objc_storeStrong((id *)&self->_mutableInputs, 0);
}

- (MCKeyboardState)sourceKeyboardState
{
  return self->_sourceKeyboardState;
}

- (void)setComposingInputIndex:(unint64_t)a3
{
  self->_composingInputIndex = a3;
}

- (unint64_t)composingInputIndex
{
  return self->_composingInputIndex;
}

- (unint64_t)totalDrawSamples
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(MCKeyboardInput *)self inputs];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = [v8 inputs];
          v5 += [v9 count];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasKindOf:(Class)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(MCKeyboardInput *)self inputs];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_opt_isKindOfClass())
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (void)insertInput:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(MCKeyboardInput *)self inputs];
  unint64_t v8 = [v7 count];

  if (v8 < a4)
  {
    v9 = [(MCKeyboardInput *)self inputs];
    a4 = [v9 count];
  }
  long long v10 = [(MCKeyboardInput *)self mutableInputs];
  [v10 insertObject:v6 atIndex:a4];

  uint64_t v11 = [(MCKeyboardInput *)self composingInput];
  if (v11)
  {
    long long v12 = (void *)v11;
    unint64_t v13 = [(MCKeyboardInput *)self composingInputIndex];

    if (a4 <= v13)
    {
      unint64_t v14 = [(MCKeyboardInput *)self composingInputIndex] + 1;
      [(MCKeyboardInput *)self setComposingInputIndex:v14];
    }
  }
}

- (void)replaceComposingInputWith:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(MCKeyboardInput *)self composingInput];

  if (v4) {
    [(MCKeyboardInput *)self replaceInputAtIndex:[(MCKeyboardInput *)self composingInputIndex] with:v5];
  }
}

- (void)replaceInputAtIndex:(unint64_t)a3 with:(id)a4
{
  id v11 = a4;
  id v6 = [(MCKeyboardInput *)self inputs];
  unint64_t v7 = [v6 count];

  if (v7 > a3)
  {
    unint64_t v8 = [(MCKeyboardInput *)self inputs];
    v9 = [v8 objectAtIndexedSubscript:a3];
    long long v10 = [(MCKeyboardInput *)self composingInput];

    [(MCKeyboardInput *)self removeInputAtIndex:a3];
    [(MCKeyboardInput *)self insertInput:v11 atIndex:a3];
    if (v9 == v10) {
      [(MCKeyboardInput *)self setComposingInput:v11];
    }
  }
}

- (void)removeInputAtIndex:(unint64_t)a3
{
  id v5 = [(MCKeyboardInput *)self inputs];
  unint64_t v6 = [v5 count];

  if (v6 > a3)
  {
    unint64_t v7 = [(MCKeyboardInput *)self inputs];
    unint64_t v8 = [v7 objectAtIndexedSubscript:a3];
    v9 = [(MCKeyboardInput *)self composingInput];

    if (v8 == v9)
    {
      [(MCKeyboardInput *)self removeComposingInput];
    }
    else
    {
      long long v10 = [(MCKeyboardInput *)self mutableInputs];
      [v10 removeObjectAtIndex:a3];

      if ([(MCKeyboardInput *)self composingInputIndex] > a3)
      {
        unint64_t v11 = [(MCKeyboardInput *)self composingInputIndex] - 1;
        [(MCKeyboardInput *)self setComposingInputIndex:v11];
      }
    }
  }
}

- (void)removeComposingInput
{
  uint64_t v3 = [(MCKeyboardInput *)self composingInput];

  if (v3)
  {
    uint64_t v4 = [(MCKeyboardInput *)self mutableInputs];
    objc_msgSend(v4, "removeObjectAtIndex:", -[MCKeyboardInput composingInputIndex](self, "composingInputIndex"));

    if ([(MCKeyboardInput *)self composingInputIndex])
    {
      unint64_t v5 = [(MCKeyboardInput *)self composingInputIndex] - 1;
      [(MCKeyboardInput *)self setComposingInputIndex:v5];
    }
    else
    {
      [(MCKeyboardInput *)self setComposingInput:0];
    }
  }
}

- (void)removeAllInputs
{
  uint64_t v3 = [(MCKeyboardInput *)self mutableInputs];
  [v3 removeAllObjects];

  [(MCKeyboardInput *)self setComposingInput:0];
}

- (void)composeNew:(id)a3
{
  id v9 = a3;
  if (-[MCKeyboardInput canComposeNew:](self, "canComposeNew:"))
  {
    unint64_t v4 = [(MCKeyboardInput *)self composingInputIndex];
    unint64_t v5 = [(MCKeyboardInput *)self mutableInputs];
    unint64_t v6 = [v5 count];

    if (v4 >= v6)
    {
      unint64_t v7 = [(MCKeyboardInput *)self mutableInputs];
      -[MCKeyboardInput setComposingInputIndex:](self, "setComposingInputIndex:", [v7 count]);
    }
    else
    {
      [(MCKeyboardInput *)self setComposingInputIndex:[(MCKeyboardInput *)self composingInputIndex] + 1];
    }
    unint64_t v8 = [(MCKeyboardInput *)self mutableInputs];
    objc_msgSend(v8, "insertObject:atIndex:", v9, -[MCKeyboardInput composingInputIndex](self, "composingInputIndex"));
  }
}

- (BOOL)canComposeNew:(id)a3
{
  return 1;
}

- (void)setComposingInput:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    unint64_t v4 = [(MCKeyboardInput *)self inputs];
    uint64_t v5 = [v4 indexOfObjectIdenticalTo:v9];

    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"|composingInput| is not an input of this input" userInfo:0];
      [v6 raise];

      goto LABEL_7;
    }
    unint64_t v7 = self;
    uint64_t v8 = v5;
  }
  else
  {
    unint64_t v7 = self;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(MCKeyboardInput *)v7 setComposingInputIndex:v8];
LABEL_7:
}

- (MCKeyboardInput)composingInput
{
  unint64_t v3 = [(MCKeyboardInput *)self composingInputIndex];
  unint64_t v4 = [(MCKeyboardInput *)self inputs];
  if (v3 >= [v4 count])
  {
    unint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = [(MCKeyboardInput *)self inputs];
    unint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", -[MCKeyboardInput composingInputIndex](self, "composingInputIndex"));
  }

  return (MCKeyboardInput *)v6;
}

- (NSArray)inputs
{
  if (self->_mutableInputs) {
    return (NSArray *)self->_mutableInputs;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (NSMutableArray)mutableInputs
{
  mutableInputs = self->_mutableInputs;
  if (!mutableInputs)
  {
    unint64_t v4 = (NSMutableArray *)objc_opt_new();
    uint64_t v5 = self->_mutableInputs;
    self->_mutableInputs = v4;

    mutableInputs = self->_mutableInputs;
  }

  return mutableInputs;
}

- (id)shortDescriptionExcludingSubInputs
{
  return &stru_1F3F7A998;
}

- (id)shortDescriptionWithLeadingString:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  unint64_t v6 = [(MCKeyboardInput *)self shortDescriptionExcludingSubInputs];
  unint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v5 appendFormat:@"%@: %@", v8, v6];

  if ([v6 length]) {
    [v5 appendString:@" "];
  }
  id v9 = [(MCKeyboardInput *)self inputs];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    v25 = v6;
    objc_msgSend(v5, "appendString:", @"(\n");
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [(MCKeyboardInput *)self inputs];
    uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          [v5 appendString:v4];
          uint64_t v16 = [(MCKeyboardInput *)self composingInput];

          if (v15 == v16) {
            [v5 appendString:@"*"];
          }
          v17 = [NSString stringWithFormat:@"%@%@", v4, v4];
          v18 = [v15 shortDescriptionWithLeadingString:v17];
          [v5 appendString:v18];

          v19 = [(MCKeyboardInput *)self inputs];
          v20 = [v19 lastObject];

          if (v15 != v20) {
            [v5 appendString:@","];
          }
          [v5 appendString:@"\n"];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v12);
    }

    int v21 = [v4 length];
    int v22 = [@"    " length];
    if (v21 - v22 >= 1)
    {
      v23 = [v4 substringToIndex:(v21 - v22)];
      [v5 appendString:v23];
    }
    [v5 appendString:@""]);
    unint64_t v6 = v25;
  }

  return v5;
}

- (id)shortDescription
{
  return [(MCKeyboardInput *)self shortDescriptionWithLeadingString:@"    "];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    if (self->_mutableInputs)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_mutableInputs copyItems:1];
      unint64_t v7 = *(void **)(v5 + 8);
      *(void *)(v5 + 8) = v6;
    }
    else
    {
      unint64_t v7 = *(void **)(v4 + 8);
      *(void *)(v4 + 8) = 0;
    }

    *(void *)(v5 + 16) = self->_composingInputIndex;
    objc_storeStrong((id *)(v5 + 24), self->_sourceKeyboardState);
  }
  return (id)v5;
}

- (MCKeyboardInput)initWithSourceKeyboardState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCKeyboardInput;
  uint64_t v6 = [(MCKeyboardInput *)&v9 init];
  unint64_t v7 = v6;
  if (v6)
  {
    v6->_composingInputIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v6->_sourceKeyboardState, a3);
  }

  return v7;
}

- (MCKeyboardInput)init
{
  return [(MCKeyboardInput *)self initWithSourceKeyboardState:0];
}

- (BOOL)hasDrawInput
{
  uint64_t v3 = objc_opt_class();

  return [(MCKeyboardInput *)self hasKindOf:v3];
}

- (id)_asInputStringWithCursorIndex:(unint64_t *)a3 remainingComposingInputIndex:(unint64_t *)a4 typeInputs:(id)a5 forSearch:(BOOL)a6 suffix:(id)a7
{
  BOOL v125 = a6;
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || v125 && ([(MCKeyboardInput *)self useSubInputsAsSearchString] & 1) != 0)
  {
    v123 = v11;
    if ([(MCKeyboardInput *)self hasDrawInput])
    {
      v113 = a4;
      v115 = a3;
      id v117 = v12;
      uint64_t v13 = [MEMORY[0x1E4F28E78] string];
      long long v137 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      unint64_t v14 = [(MCKeyboardInput *)self inputs];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v137 objects:v142 count:16];
      if (!v15)
      {
        v17 = 0;
        goto LABEL_42;
      }
      uint64_t v16 = v15;
      v17 = 0;
      uint64_t v18 = *(void *)v138;
      while (1)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v138 != v18) {
            objc_enumerationMutation(v14);
          }
          v20 = *(void **)(*((void *)&v137 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = v20;

            int v22 = [v21 convertedInput];
            if (v22)
            {
            }
            else
            {
              v24 = [v21 candidateText];
              uint64_t v25 = [v24 rangeOfString:v13];

              if (!v25) {
                [(__CFString *)v13 setString:&stru_1F3F7A998];
              }
            }
            v23 = [v21 candidateText];
            v17 = v21;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            v23 = [v20 committedText];
          }
          [(__CFString *)v13 appendString:v23];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v137 objects:v142 count:16];
        if (!v16)
        {
LABEL_42:

          if (v113) {
            unint64_t *v113 = [(__CFString *)v13 length];
          }
          v39 = [v17 remainingInputString];

          id v11 = v123;
          id v12 = v117;
          if (v39)
          {
            v40 = [v17 remainingInputString];
            [(__CFString *)v13 appendString:v40];
          }
          if (v115) {
            unint64_t *v115 = [(__CFString *)v13 length];
          }
          uint64_t v41 = [v17 remainingInputString];
          v42 = (void *)v41;
          v43 = &stru_1F3F7A998;
          if (v41) {
            v43 = (__CFString *)v41;
          }
          v44 = v43;

          if (v125) {
            v45 = v44;
          }
          else {
            v45 = v13;
          }
          uint64_t v32 = v45;

          goto LABEL_153;
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v29 = [(MCKeyboardInput *)self characters];
      long long v30 = (__CFString *)[v29 copy];

      [v11 composeNew:self];
      unint64_t v31 = 0;
      if (v30) {
        goto LABEL_28;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v30 = [(MCKeyboardInput *)self convertedInput];
        unint64_t v31 = [(__CFString *)v30 length];
        if (v30)
        {
LABEL_28:
          if (!a3)
          {
LABEL_30:
            if (a4) {
              *a4 = v31;
            }
            uint64_t v32 = v30;
LABEL_129:

            goto LABEL_153;
          }
LABEL_29:
          *a3 = [(__CFString *)v30 length];
          goto LABEL_30;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v31 = 0;
          long long v30 = &stru_1F3F7A998;
          if (!a3) {
            goto LABEL_30;
          }
          goto LABEL_29;
        }
      }
    }
    v114 = a4;
    v116 = a3;
    v118 = v12;
    v47 = objc_opt_new();
    v48 = objc_opt_new();
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    v121 = self;
    id obj = [(MCKeyboardInput *)self inputs];
    uint64_t v129 = [obj countByEnumeratingWithState:&v133 objects:v141 count:16];
    if (!v129)
    {
      unint64_t v50 = 0;
      unint64_t v124 = 0;
      goto LABEL_119;
    }
    int v49 = 0;
    char v127 = 0;
    unint64_t v50 = 0;
    unint64_t v124 = 0;
    uint64_t v128 = *(void *)v134;
    v120 = v47;
LABEL_61:
    uint64_t v51 = 0;
    while (1)
    {
      if (*(void *)v134 != v128) {
        objc_enumerationMutation(obj);
      }
      v52 = *(void **)(*((void *)&v133 + 1) + 8 * v51);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v131 = 0;
        uint64_t v132 = 0;
        v56 = [v52 _asInputStringWithCursorIndex:&v132 remainingComposingInputIndex:&v131 typeInputs:v11 forSearch:v125 suffix:v48];
        [v47 appendString:v56];
        if ((v49 & 1) == 0)
        {
          v124 += v132;
          if (v124 > [v47 length]) {
            unint64_t v124 = [v47 length];
          }
        }
        v57 = [(MCKeyboardInput *)v121 composingInput];
        BOOL v58 = v52 == v57;

        if (v127)
        {
          uint64_t v59 = [v56 length];
          char v127 = 1;
        }
        else
        {
          uint64_t v59 = v131;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v60 = v52;
            unint64_t v61 = v50;
            v62 = v48;
            int v63 = v49;
            unint64_t v64 = [v60 cursorIndex];
            v65 = [v60 committedText];

            BOOL v66 = v64 >= [v65 length];
            int v49 = v63;
            v48 = v62;
            unint64_t v50 = v61;
            v47 = v120;
            char v67 = !v66;
            char v127 = v67;
          }
          else
          {
            char v127 = 0;
          }
        }
        v49 |= v58;
        v50 += v59;

        id v11 = v123;
        goto LABEL_115;
      }
      int v126 = v49;
      id v53 = v52;
      [v47 appendString:v48];
      objc_msgSend(v48, "deleteCharactersInRange:", 0, objc_msgSend(v48, "length"));
      v54 = [v53 convertedInput];
      if ([v54 length]) {
        break;
      }
      v68 = [v53 candidateText];
      if (![v68 length]) {
        goto LABEL_110;
      }
      unint64_t v69 = [v47 length];

      if (v50 <= v69) {
        goto LABEL_80;
      }
LABEL_114:

      int v49 = v126;
LABEL_115:
      if (++v51 == v129)
      {
        uint64_t v129 = [obj countByEnumeratingWithState:&v133 objects:v141 count:16];
        if (!v129)
        {
LABEL_119:

          [v118 appendString:v48];
          if ([v48 length])
          {
            id v89 = [v47 stringByAppendingString:v48];
          }
          else
          {
            id v89 = v47;
          }
          v90 = v89;
          uint64_t v91 = v124;
          if (v116)
          {
            if ([(MCKeyboardInput *)v121 hasKindOf:objc_opt_class()]) {
              uint64_t v91 = [v90 length];
            }
            unint64_t *v116 = v91;
          }
          if (v114) {
            unint64_t *v114 = v50;
          }
          uint64_t v32 = v90;

          id v12 = v118;
          goto LABEL_129;
        }
        goto LABEL_61;
      }
    }
    unint64_t v55 = [v47 length];

    if (v50 > v55) {
      goto LABEL_114;
    }
LABEL_80:
    uint64_t v70 = objc_msgSend(v47, "length", v114);
    v71 = [v53 convertedInput];
    uint64_t v72 = [v71 length];
    v73 = [v53 candidateText];
    v54 = v73;
    if (v72)
    {
      if ([v73 isEqualToString:v47]) {
        [v53 candidateText];
      }
      else {
      uint64_t v74 = [v53 convertedInput];
      }

      v54 = (void *)v74;
    }

    if ([v54 isEqualToString:@"☻"])
    {
      unint64_t v75 = [v47 length];
      uint64_t v76 = 0;
    }
    else
    {
      uint64_t v76 = objc_msgSend(v47, "rangeOfString:options:range:", v54, 1, v50, v70 - v50);
      unint64_t v75 = v77;
    }
    if (v76 == v50 && v75 <= [v47 length] - v50)
    {
      if (v124 >= v75) {
        unint64_t v79 = v124 - v75;
      }
      else {
        unint64_t v79 = 0;
      }
      if (v125)
      {
        unint64_t v124 = v79;
        objc_msgSend(v47, "deleteCharactersInRange:", v76, v75);
        if (v75)
        {
          id v11 = v123;
          do
          {
            [v123 removeInputAtIndex:0];
            --v75;
          }
          while (v75);
          goto LABEL_113;
        }
      }
      else
      {
        v86 = [v53 candidateText];
        unint64_t v124 = [v86 length] + v79;

        v87 = [v53 candidateText];
        objc_msgSend(v47, "replaceCharactersInRange:withString:", v76, v75, v87);

        v88 = [v53 candidateText];
        v50 += [v88 length];
      }
      id v11 = v123;
    }
    else if (!v125)
    {
      v78 = [v53 convertedInput];
      if ([v78 length])
      {
      }
      else
      {
        v80 = [v53 candidateText];
        int v81 = [v47 isEqualToString:v80];

        if (v81)
        {
          unint64_t v50 = [v47 length];
          goto LABEL_113;
        }
      }
      if (v50 >= [v47 length])
      {
        v85 = [v53 candidateText];
        [v47 appendString:v85];
      }
      else
      {
        v82 = [v53 remainingMecabraInputs];

        if (!v82) {
          goto LABEL_113;
        }
        unint64_t v83 = [v47 length] - v50;
        v84 = [v53 candidateText];
        objc_msgSend(v47, "replaceCharactersInRange:withString:", v50, v83, v84);
      }
      v68 = [v53 candidateText];
      v50 += [v68 length];
LABEL_110:
    }
LABEL_113:

    goto LABEL_114;
  }
  v26 = self;
  long long v27 = [(MCKeyboardInput *)v26 text];
  long long v28 = [(MCKeyboardInput *)v26 uncommittedText];
  if (a4)
  {
    if (!v125)
    {
      v46 = [(MCKeyboardInput *)v26 committedText];
      *a4 = [v46 length];

      if (!a3) {
        goto LABEL_132;
      }
      goto LABEL_55;
    }
    *a4 = 0;
    if (!a3) {
      goto LABEL_132;
    }
  }
  else
  {
    if (!a3) {
      goto LABEL_132;
    }
    if (!v125) {
      goto LABEL_55;
    }
  }
  v33 = [(MCKeyboardInput *)v26 uncommittedText];
  uint64_t v34 = [v33 length];

  if (!v34)
  {
LABEL_55:
    *a3 = [(MCKeyboardInput *)v26 cursorIndex];
    goto LABEL_132;
  }
  unint64_t v35 = [(MCKeyboardInput *)v26 cursorIndex];
  v36 = [(MCKeyboardInput *)v26 committedText];
  if (v35 <= [v36 length])
  {
    *a3 = 0;
  }
  else
  {
    uint64_t v37 = [(MCKeyboardInput *)v26 cursorIndex];
    v38 = [(MCKeyboardInput *)v26 committedText];
    *a3 = v37 - [v38 length];
  }
LABEL_132:
  v92 = v27;
  v93 = -[__CFString substringWithRange:](v92, "substringWithRange:", [(MCKeyboardInput *)v26 cursorIndex], [(__CFString *)v92 length] - [(MCKeyboardInput *)v26 cursorIndex]);
  unint64_t v94 = [(MCKeyboardInput *)v26 cursorIndex];
  v130 = v28;
  if (!v125)
  {
    uint64_t v32 = v92;
    if (v94 < [(__CFString *)v92 length])
    {
      [v12 appendString:v93];
      uint64_t v32 = [(__CFString *)v92 substringToIndex:[(MCKeyboardInput *)v26 cursorIndex]];
    }
    goto LABEL_148;
  }
  v95 = [(MCKeyboardInput *)v26 committedText];
  if (v94 <= [v95 length])
  {
    uint64_t v96 = [v28 length];

    if (v96)
    {

      [v12 appendString:v28];
      uint64_t v32 = &stru_1F3F7A998;
      goto LABEL_148;
    }
  }
  else
  {
  }
  unint64_t v97 = [(MCKeyboardInput *)v26 cursorIndex];
  v98 = [(MCKeyboardInput *)v26 committedText];
  if (v97 <= [v98 length])
  {
  }
  else
  {
    uint64_t v99 = [v28 length];

    if (v99)
    {
      uint64_t v100 = [(MCKeyboardInput *)v26 cursorIndex];
      v101 = [(MCKeyboardInput *)v26 committedText];
      uint64_t v102 = v100 - [v101 length];

      objc_msgSend(v28, "substringWithRange:", 0, v102);
      uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_147:
      [v12 appendString:v93];
      goto LABEL_148;
    }
  }
  unint64_t v103 = [(MCKeyboardInput *)v26 cursorIndex];
  v104 = [(MCKeyboardInput *)v26 committedText];
  if (v103 > [v104 length])
  {

    uint64_t v32 = v92;
    goto LABEL_148;
  }
  uint64_t v105 = [v28 length];

  uint64_t v32 = v92;
  if (!v105)
  {
    v106 = [(MCKeyboardInput *)v26 committedText];
    objc_msgSend(v106, "substringWithRange:", 0, -[MCKeyboardInput cursorIndex](v26, "cursorIndex"));
    uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_147;
  }
LABEL_148:
  id v119 = v12;
  if (v11 && [(__CFString *)v32 length])
  {
    unint64_t v107 = 0;
    uint64_t v108 = MEMORY[0x1E4F1CBF0];
    do
    {
      v109 = [MCTypeInput alloc];
      v110 = -[__CFString substringWithRange:](v32, "substringWithRange:", v107, 1);
      v111 = [(MCTypeInput *)v109 initWithCharacters:v110 nearbyKeys:v108];

      [v11 composeNew:v111];
      ++v107;
    }
    while ([(__CFString *)v32 length] > v107);
  }

  id v12 = v119;
LABEL_153:

  return v32;
}

- (void)_addNearbyKeys:(id)a3 to:(void *)a4 likelihoodThreshold:(float)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = v7;
  if (a4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v16 + 1) + 8 * i);
          objc_msgSend(v14, "logLikelihood", (void)v16);
          if (v15 < a5)
          {

            goto LABEL_14;
          }
          if ([v14 character])
          {
            [v14 character];
            [v14 logLikelihood];
            MecabraGestureAddKeyAndLoglikelihoodPair();
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

- (id)asMecabraGestures:(BOOL *)a3
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  id v89 = (void *)v5;
  if ([(MCKeyboardInput *)self hasKindOf:objc_opt_class()])
  {
    uint64_t v101 = 0;
    uint64_t v102 = &v101;
    uint64_t v103 = 0x2020000000;
    char v104 = 0;
    uint64_t v6 = [(MCKeyboardInput *)self inputs];
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __54__MCKeyboardInput_ChineseJapanese__asMecabraGestures___block_invoke;
    v100[3] = &unk_1E6E2B510;
    v100[4] = self;
    v100[5] = &v101;
    uint64_t v7 = [v6 indexOfObjectWithOptions:2 passingTest:v100];

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = self;
      char v92 = 0;
LABEL_23:
      _Block_object_dispose(&v101, 8);
      goto LABEL_24;
    }
    v90 = (MCKeyboardInput *)objc_opt_new();
    uint64_t v10 = [(MCKeyboardInput *)self inputs];
    uint64_t v11 = [v10 objectAtIndexedSubscript:v7];

    if (!*((unsigned char *)v102 + 24)) {
      goto LABEL_12;
    }
    uint64_t v12 = [v11 remainingInputString];

    if (v12)
    {
      uint64_t v13 = [v11 remainingInputString];
      if ([v13 length])
      {
        unint64_t v14 = 0;
        do
        {
          __int16 v99 = 0;
          __int16 v99 = [v13 characterAtIndex:v14];
          float v15 = [NSString stringWithCharacters:&v99 length:1];
          long long v16 = [[MCTypeInput alloc] initWithCharacters:v15 nearbyKeys:0];
          [(MCKeyboardInput *)v90 composeNew:v16];

          ++v14;
        }
        while ([v13 length] > v14);
        char v92 = 0;
      }
      else
      {
        char v92 = 0;
      }
      goto LABEL_16;
    }
    if (!*((unsigned char *)v102 + 24))
    {
LABEL_12:
      long long v17 = [v11 remainingMecabraInputs];

      if (v17)
      {
        uint64_t v13 = [v11 remainingMecabraInputs];
        [v4 addObjectsFromArray:v13];
        char v92 = 1;
LABEL_16:

        goto LABEL_17;
      }
    }
    char v92 = 0;
LABEL_17:
    long long v18 = [(MCKeyboardInput *)self inputs];
    unint64_t v19 = [v18 count];

    uint64_t v8 = v90;
    if (v19 > (int)v7 + 1)
    {
      uint64_t v20 = (int)v7 + 1;
      int v21 = v7 + 2;
      do
      {
        int v22 = [(MCKeyboardInput *)self inputs];
        v23 = [v22 objectAtIndexedSubscript:v20];
        [(MCKeyboardInput *)v90 composeNew:v23];

        uint64_t v20 = v21;
        v24 = [(MCKeyboardInput *)self inputs];
        unint64_t v25 = [v24 count];
      }
      while (v25 > v21++);
    }
    if (![(MCKeyboardInput *)v90 hasKindOf:objc_opt_class()])
    {
      uint64_t v27 = objc_opt_new();
      id v28 = [(MCKeyboardInput *)v90 _asInputStringWithCursorIndex:0 remainingComposingInputIndex:0 typeInputs:v27 forSearch:1 suffix:0];

      uint64_t v8 = (MCKeyboardInput *)v27;
    }

    goto LABEL_23;
  }
  uint64_t v8 = (MCKeyboardInput *)objc_opt_new();
  id v9 = [(MCKeyboardInput *)self _asInputStringWithCursorIndex:0 remainingComposingInputIndex:0 typeInputs:v8 forSearch:1 suffix:v5];
  char v92 = 0;
LABEL_24:
  int v29 = s_interface_idiom_is_pad;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v91 = v8;
  id obj = [(MCKeyboardInput *)v8 inputs];
  uint64_t v30 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
  if (!v30) {
    goto LABEL_78;
  }
  uint64_t v31 = v30;
  if (v29) {
    float v32 = -3.0;
  }
  else {
    float v32 = -2.0;
  }
  uint64_t v33 = *(void *)v96;
  uint64_t v93 = *(void *)v96;
  do
  {
    uint64_t v34 = 0;
    do
    {
      if (*(void *)v96 != v33) {
        objc_enumerationMutation(obj);
      }
      unint64_t v35 = *(void **)(*((void *)&v95 + 1) + 8 * v34);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v44 = v35;
          v45 = [v44 inputs];
          uint64_t v46 = [v45 count];

          if (v46)
          {
            unint64_t v47 = 0;
            do
            {
              v48 = [v44 inputs];
              int v49 = [v48 objectAtIndexedSubscript:v47];

              unint64_t v50 = [v44 inputs];
              uint64_t v51 = [v50 firstObject];

              if (v49 != v51)
              {
                v52 = [v44 inputs];
                id v53 = [v52 lastObject];

                if (v49 == v53) {
                  [v44 isComplete];
                }
              }
              [v49 touchPoint];
              [v49 touchPoint];
              [v49 timestamp];
              [v49 isInflectionPoint];
              CPGesture = (const void *)MecabraCreateCPGesture();
              unint64_t v55 = [v49 nearbyKeys];
              *(float *)&double v56 = v32;
              [(MCKeyboardInput *)self _addNearbyKeys:v55 to:CPGesture likelihoodThreshold:v56];

              [v4 addObject:CPGesture];
              CFRelease(CPGesture);

              ++v47;
              v57 = [v44 inputs];
              unint64_t v58 = [v57 count];
            }
            while (v58 > v47);
            char v92 = 1;
            uint64_t v33 = v93;
          }
          goto LABEL_73;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_74;
        }
        id v59 = v35;
        if ([v59 useSubInputsAsSearchString])
        {
          v39 = [v59 asSearchString];
          goto LABEL_65;
        }
        v39 = [v59 uncommittedText];
        int v63 = [(MCKeyboardInput *)v91 inputs];
        id v64 = [v63 lastObject];
        if (v59 != v64)
        {

          goto LABEL_60;
        }
        uint64_t v65 = [v39 length];

        if (!v65)
        {
          [v59 committedText];
          v39 = int v63 = v39;
LABEL_60:
        }
        int v66 = [v59 cursorIndex];
        char v67 = [v59 committedText];
        int v68 = v66 - [v67 length];
        uint64_t v69 = v68;

        if (v68 >= 1 && [v39 length] >= (unint64_t)v68) {
          goto LABEL_67;
        }
        uint64_t v70 = [(MCKeyboardInput *)v91 inputs];
        uint64_t v71 = [v70 count];

        if (v71 == 1) {
LABEL_65:
        }
          uint64_t v69 = [v39 length];
        if ((int)v69 >= 1)
        {
LABEL_67:
          uint64_t v72 = 0;
          do
          {
            [v39 characterAtIndex:v72];
            TypeGesture = (const void *)MecabraCreateTypeGesture();
            [v4 addObject:TypeGesture];
            CFRelease(TypeGesture);
            ++v72;
          }
          while (v69 != v72);
        }
        uint64_t v74 = [v59 text];
        unint64_t v75 = [v59 cursorIndex];
        if (v75 < [v74 length])
        {
          uint64_t v76 = objc_msgSend(v74, "substringWithRange:", objc_msgSend(v59, "cursorIndex"), objc_msgSend(v74, "length") - objc_msgSend(v59, "cursorIndex"));
          [v89 appendString:v76];
        }
        uint64_t v33 = v93;
LABEL_72:

        goto LABEL_73;
      }
      id v36 = v35;
      uint64_t v37 = [v36 characters];
      uint64_t v38 = [v37 length];

      if (v38)
      {
        v39 = [v36 sourceKeyboardState];
        if ([v39 userInterfaceIdiom] != 4
          && ([v39 userInterfaceIdiom]
           || ([v39 isSplitKeyboard] & 1) != 0
           || ([v39 isFloatingKeyboard] & 1) != 0
           || ([v39 isHardwareKeyboard] & 1) != 0)
          || ([v36 nearbyKeys],
              v40 = objc_claimAutoreleasedReturnValue(),
              uint64_t v41 = [v40 count],
              v40,
              !v41))
        {
          v42 = [v36 characters];
          [v42 characterAtIndex:0];
          uint64_t TypeGestureWithTouchEvent = MecabraCreateTypeGesture();
        }
        else
        {
          if ([v39 userInterfaceIdiom] == 4) {
            float v32 = -3.0;
          }
          v42 = [v36 characters];
          [v42 characterAtIndex:0];
          [v36 point];
          [v36 point];
          uint64_t TypeGestureWithTouchEvent = MecabraCreateTypeGestureWithTouchEvent();
        }
        id v60 = (const void *)TypeGestureWithTouchEvent;

        unint64_t v61 = [v36 nearbyKeys];
        *(float *)&double v62 = v32;
        [(MCKeyboardInput *)self _addNearbyKeys:v61 to:v60 likelihoodThreshold:v62];

        [v4 addObject:v60];
        CFRelease(v60);
        goto LABEL_72;
      }
LABEL_73:

LABEL_74:
      ++v34;
    }
    while (v34 != v31);
    uint64_t v77 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
    uint64_t v31 = v77;
  }
  while (v77);
LABEL_78:

  v78 = [(MCKeyboardInput *)self inputs];
  unint64_t v79 = [v78 lastObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_81;
  }
  v80 = [(MCKeyboardInput *)self inputs];
  int v81 = [v80 lastObject];
  if ([v81 includeSuffixAsSearchString])
  {

LABEL_81:
    v82 = v89;
LABEL_82:
    if ([v82 length])
    {
      unint64_t v83 = 0;
      do
      {
        [v82 characterAtIndex:v83];
        v84 = (const void *)MecabraCreateTypeGesture();
        [v4 addObject:v84];
        CFRelease(v84);
        ++v83;
      }
      while ([v82 length] > v83);
    }
  }
  else
  {
    v85 = [(MCKeyboardInput *)v91 inputs];
    uint64_t v86 = [v85 count];

    v82 = v89;
    if (!v86) {
      goto LABEL_82;
    }
  }
  if (a3) {
    *a3 = v92 & 1;
  }

  return v4;
}

uint64_t __54__MCKeyboardInput_ChineseJapanese__asMecabraGestures___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([*(id *)(a1 + 32) inputs],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 lastObject],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8 == v6))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v9 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 1;
    *a4 = 1;
  }

  return v9;
}

- (id)asSearchString
{
  return [(MCKeyboardInput *)self _asInputStringWithCursorIndex:0 remainingComposingInputIndex:0 typeInputs:0 forSearch:1 suffix:0];
}

- (BOOL)hasRemainingComposingInput
{
  if (![(MCKeyboardInput *)self hasDrawInput])
  {
    unint64_t v14 = 0;
    uint64_t v5 = [(MCKeyboardInput *)self _asInputStringWithCursorIndex:0 remainingComposingInputIndex:&v14 typeInputs:0 forSearch:0 suffix:0];
    unint64_t v12 = v14;
    BOOL v11 = v12 < [v5 length];
LABEL_11:

    return v11;
  }
  uint64_t v3 = [(MCKeyboardInput *)self composingInput];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(MCKeyboardInput *)self composingInput];
    id v6 = [v5 convertedInput];
    uint64_t v7 = [v6 length];

    uint64_t v8 = [v5 remainingMecabraInputs];
    uint64_t v9 = (void *)v8;
    if (v7)
    {
      if (v8)
      {
        uint64_t v10 = [v5 remainingMecabraInputs];
        BOOL v11 = [v10 count] != 0;
      }
      else
      {
        BOOL v11 = 1;
      }
    }
    else
    {
      BOOL v11 = v8 != 0;
    }

    goto LABEL_11;
  }
  return 1;
}

- (unint64_t)asSearchTextCursorIndex
{
  unint64_t v4 = 0;
  id v2 = [(MCKeyboardInput *)self _asInputStringWithCursorIndex:&v4 remainingComposingInputIndex:0 typeInputs:0 forSearch:1 suffix:0];
  return v4;
}

- (unint64_t)asInlineTextCursorIndex
{
  unint64_t v4 = 0;
  id v2 = [(MCKeyboardInput *)self _asInputStringWithCursorIndex:&v4 remainingComposingInputIndex:0 typeInputs:0 forSearch:0 suffix:0];
  return v4;
}

- (id)asCommittedText
{
  uint64_t v5 = 0;
  id v2 = [(MCKeyboardInput *)self _asInputStringWithCursorIndex:0 remainingComposingInputIndex:&v5 typeInputs:0 forSearch:0 suffix:0];
  uint64_t v3 = [v2 substringToIndex:v5];

  return v3;
}

- (id)asInlineText
{
  return [(MCKeyboardInput *)self _asInputStringWithCursorIndex:0 remainingComposingInputIndex:0 typeInputs:0 forSearch:0 suffix:0];
}

@end