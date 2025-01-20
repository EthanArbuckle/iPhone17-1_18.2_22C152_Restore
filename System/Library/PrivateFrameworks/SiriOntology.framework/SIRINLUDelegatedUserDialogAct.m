@interface SIRINLUDelegatedUserDialogAct
+ (BOOL)supportsSecureCoding;
- (NSArray)rewrites;
- (NSArray)spans;
- (NSString)externalParserId;
- (NSString)rewrittenUtterance;
- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5;
- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5 spans:(id)a6;
- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5 spans:(id)a6 rewriteMessage:(id)a7;
- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5 spans:(id)a6 rewriteMessage:(id)a7 referenceContext:(id)a8;
- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5 spans:(id)a6 rewriteMessages:(id)a7;
- (SIRINLUDelegatedUserDialogAct)initWithCoder:(id)a3;
- (SIRINLUReferenceContext)referenceContext;
- (SIRINLURewriteMessage)rewrite;
- (id)description;
- (int)asrHypothesisIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setAsrHypothesisIndex:(int)a3;
- (void)setExternalParserId:(id)a3;
- (void)setReferenceContext:(id)a3;
- (void)setRewrite:(id)a3;
- (void)setRewrites:(id)a3;
- (void)setRewrittenUtterance:(id)a3;
- (void)setSpans:(id)a3;
@end

@implementation SIRINLUDelegatedUserDialogAct

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceContext, 0);
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_rewrites, 0);
  objc_storeStrong((id *)&self->_rewrittenUtterance, 0);
  objc_storeStrong((id *)&self->_rewrite, 0);
  objc_storeStrong((id *)&self->_externalParserId, 0);
}

- (void)setReferenceContext:(id)a3
{
}

- (SIRINLUReferenceContext)referenceContext
{
  return self->_referenceContext;
}

- (void)setSpans:(id)a3
{
}

- (NSArray)spans
{
  return self->_spans;
}

- (void)setRewrites:(id)a3
{
}

- (NSArray)rewrites
{
  return self->_rewrites;
}

- (void)setRewrittenUtterance:(id)a3
{
}

- (NSString)rewrittenUtterance
{
  return self->_rewrittenUtterance;
}

- (void)setRewrite:(id)a3
{
}

- (SIRINLURewriteMessage)rewrite
{
  return self->_rewrite;
}

- (void)setExternalParserId:(id)a3
{
}

- (NSString)externalParserId
{
  return self->_externalParserId;
}

- (void)setAsrHypothesisIndex:(int)a3
{
  self->_asrHypothesisIndex = a3;
}

- (int)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (id)description
{
  v15 = NSString;
  uint64_t v14 = [(SIRINLUDelegatedUserDialogAct *)self asrHypothesisIndex];
  v3 = [(SIRINLUDelegatedUserDialogAct *)self rewrittenUtterance];
  v16 = [(SIRINLUDelegatedUserDialogAct *)self rewrite];
  v4 = [v16 description];
  v5 = [(SIRINLUDelegatedUserDialogAct *)self externalParserId];
  v6 = [(SIRINLUDelegatedUserDialogAct *)self spans];
  v7 = +[SIRINLUPrintUtils indentArray:v6 numSpaces:4];
  v8 = [(SIRINLUDelegatedUserDialogAct *)self rewrites];
  v9 = +[SIRINLUPrintUtils indentArray:v8 numSpaces:4];
  v10 = [(SIRINLUDelegatedUserDialogAct *)self referenceContext];
  v11 = [v10 description];
  v12 = [v15 stringWithFormat:@"{DelegatedUserDialogAct:\n  asrHypothesisIndex: %d\n  rewrittenUtterance: %@\n  rewrite: %@\n  externalParserId: %@\n  spans: %@\n  rewrites: %@\n  referenceContext: %@\n}", v14, v3, v4, v5, v7, v9, v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  uint64_t asrHypothesisIndex = self->_asrHypothesisIndex;
  id v6 = a3;
  id v13 = [v4 numberWithInt:asrHypothesisIndex];
  [v6 encodeObject:v13 forKey:@"asrHypothesisIndex"];
  v7 = [(SIRINLUDelegatedUserDialogAct *)self rewrittenUtterance];
  [v6 encodeObject:v7 forKey:@"rewrittenUtterance"];

  v8 = [(SIRINLUDelegatedUserDialogAct *)self externalParserId];
  [v6 encodeObject:v8 forKey:@"externalParserId"];

  v9 = [(SIRINLUDelegatedUserDialogAct *)self spans];
  [v6 encodeObject:v9 forKey:@"spans"];

  v10 = [(SIRINLUDelegatedUserDialogAct *)self rewrites];
  [v6 encodeObject:v10 forKey:@"rewrites"];

  v11 = [(SIRINLUDelegatedUserDialogAct *)self rewrite];
  [v6 encodeObject:v11 forKey:@"rewrite"];

  v12 = [(SIRINLUDelegatedUserDialogAct *)self referenceContext];
  [v6 encodeObject:v12 forKey:@"referenceContext"];
}

- (SIRINLUDelegatedUserDialogAct)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SIRINLUDelegatedUserDialogAct;
  v5 = [(SIRINLUDelegatedUserDialogAct *)&v26 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asrHypothesisIndex"];
    v5->_uint64_t asrHypothesisIndex = [v6 intValue];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewrittenUtterance"];
    rewrittenUtterance = v5->_rewrittenUtterance;
    v5->_rewrittenUtterance = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalParserId"];
    externalParserId = v5->_externalParserId;
    v5->_externalParserId = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"spans"];
    spans = v5->_spans;
    v5->_spans = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"rewrites"];
    rewrites = v5->_rewrites;
    v5->_rewrites = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewrite"];
    rewrite = v5->_rewrite;
    v5->_rewrite = (SIRINLURewriteMessage *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceContext"];
    referenceContext = v5->_referenceContext;
    v5->_referenceContext = (SIRINLUReferenceContext *)v23;
  }
  return v5;
}

- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5 spans:(id)a6 rewriteMessage:(id)a7
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SIRINLUDelegatedUserDialogAct;
  uint64_t v17 = [(SIRINLUDelegatedUserDialogAct *)&v24 init];
  v18 = v17;
  if (v17)
  {
    v17->_uint64_t asrHypothesisIndex = a3;
    objc_storeStrong((id *)&v17->_rewrittenUtterance, a4);
    objc_storeStrong((id *)&v18->_externalParserId, a5);
    objc_storeStrong((id *)&v18->_spans, a6);
    rewrites = v18->_rewrites;
    v18->_rewrites = (NSArray *)MEMORY[0x1E4F1CBF0];

    if (v16)
    {
      v25[0] = v16;
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      uint64_t v21 = v18->_rewrites;
      v18->_rewrites = (NSArray *)v20;
    }
    objc_storeStrong((id *)&v18->_rewrite, a7);
    referenceContext = v18->_referenceContext;
    v18->_referenceContext = 0;
  }
  return v18;
}

- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5 spans:(id)a6 rewriteMessage:(id)a7 referenceContext:(id)a8
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v25 = a4;
  id v24 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)SIRINLUDelegatedUserDialogAct;
  v18 = [(SIRINLUDelegatedUserDialogAct *)&v26 init];
  uint64_t v19 = v18;
  if (v18)
  {
    v18->_uint64_t asrHypothesisIndex = a3;
    objc_storeStrong((id *)&v18->_rewrittenUtterance, a4);
    objc_storeStrong((id *)&v19->_externalParserId, a5);
    objc_storeStrong((id *)&v19->_spans, a6);
    rewrites = v19->_rewrites;
    v19->_rewrites = (NSArray *)MEMORY[0x1E4F1CBF0];

    if (v16)
    {
      v27[0] = v16;
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 1, v24, v25);
      v22 = v19->_rewrites;
      v19->_rewrites = (NSArray *)v21;
    }
    objc_storeStrong((id *)&v19->_rewrite, a7);
    objc_storeStrong((id *)&v19->_referenceContext, a8);
  }

  return v19;
}

- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5 spans:(id)a6 rewriteMessages:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SIRINLUDelegatedUserDialogAct;
  id v17 = [(SIRINLUDelegatedUserDialogAct *)&v22 init];
  v18 = v17;
  if (v17)
  {
    v17->_uint64_t asrHypothesisIndex = a3;
    objc_storeStrong((id *)&v17->_rewrittenUtterance, a4);
    objc_storeStrong((id *)&v18->_externalParserId, a5);
    objc_storeStrong((id *)&v18->_spans, a6);
    objc_storeStrong((id *)&v18->_rewrites, a7);
    rewrite = v18->_rewrite;
    v18->_rewrite = 0;

    referenceContext = v18->_referenceContext;
    v18->_referenceContext = 0;
  }
  return v18;
}

- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5 spans:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SIRINLUDelegatedUserDialogAct;
  id v14 = [(SIRINLUDelegatedUserDialogAct *)&v20 init];
  id v15 = v14;
  if (v14)
  {
    v14->_uint64_t asrHypothesisIndex = a3;
    objc_storeStrong((id *)&v14->_rewrittenUtterance, a4);
    objc_storeStrong((id *)&v15->_externalParserId, a5);
    objc_storeStrong((id *)&v15->_spans, a6);
    rewrites = v15->_rewrites;
    v15->_rewrites = (NSArray *)MEMORY[0x1E4F1CBF0];

    rewrite = v15->_rewrite;
    v15->_rewrite = 0;

    referenceContext = v15->_referenceContext;
    v15->_referenceContext = 0;
  }
  return v15;
}

- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SIRINLUDelegatedUserDialogAct;
  id v11 = [(SIRINLUDelegatedUserDialogAct *)&v19 init];
  id v12 = v11;
  if (v11)
  {
    v11->_uint64_t asrHypothesisIndex = a3;
    objc_storeStrong((id *)&v11->_rewrittenUtterance, a4);
    objc_storeStrong((id *)&v12->_externalParserId, a5);
    spans = v12->_spans;
    id v14 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v12->_spans = (NSArray *)MEMORY[0x1E4F1CBF0];

    rewrites = v12->_rewrites;
    v12->_rewrites = v14;

    rewrite = v12->_rewrite;
    v12->_rewrite = 0;

    referenceContext = v12->_referenceContext;
    v12->_referenceContext = 0;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end