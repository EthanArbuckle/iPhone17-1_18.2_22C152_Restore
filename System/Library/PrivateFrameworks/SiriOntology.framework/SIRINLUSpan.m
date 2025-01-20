@interface SIRINLUSpan
+ (BOOL)supportsSecureCoding;
- (NSArray)matcherNames;
- (NSString)input;
- (NSString)label;
- (SIRINLUSpan)initWithCoder:(id)a3;
- (SIRINLUSpan)initWithLabel:(id)a3 input:(id)a4 startTokenIndex:(unsigned int)a5 endTokenIndex:(unsigned int)a6 usoGraph:(id)a7 score:(double)a8 matcherNames:(id)a9;
- (USOSerializedGraph)usoGraph;
- (double)score;
- (id)description;
- (unsigned)endTokenIndex;
- (unsigned)startTokenIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setEndTokenIndex:(unsigned int)a3;
- (void)setInput:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMatcherNames:(id)a3;
- (void)setScore:(double)a3;
- (void)setStartTokenIndex:(unsigned int)a3;
- (void)setUsoGraph:(id)a3;
@end

@implementation SIRINLUSpan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherNames, 0);
  objc_storeStrong((id *)&self->_usoGraph, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setMatcherNames:(id)a3
{
}

- (NSArray)matcherNames
{
  return self->_matcherNames;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setUsoGraph:(id)a3
{
}

- (USOSerializedGraph)usoGraph
{
  return self->_usoGraph;
}

- (void)setEndTokenIndex:(unsigned int)a3
{
  self->_endTokenIndex = a3;
}

- (unsigned)endTokenIndex
{
  return self->_endTokenIndex;
}

- (void)setStartTokenIndex:(unsigned int)a3
{
  self->_startTokenIndex = a3;
}

- (unsigned)startTokenIndex
{
  return self->_startTokenIndex;
}

- (void)setInput:(id)a3
{
}

- (NSString)input
{
  return self->_input;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SIRINLUSpan *)self label];
  v5 = [(SIRINLUSpan *)self input];
  uint64_t v6 = [(SIRINLUSpan *)self startTokenIndex];
  uint64_t v7 = [(SIRINLUSpan *)self endTokenIndex];
  v8 = [(SIRINLUSpan *)self usoGraph];
  v9 = [v8 printedForm];
  v10 = +[SIRINLUPrintUtils indentLines:v9 numSpaces:4];
  [(SIRINLUSpan *)self score];
  uint64_t v12 = v11;
  v13 = [(SIRINLUSpan *)self matcherNames];
  v14 = +[SIRINLUPrintUtils indentArray:v13 numSpaces:4];
  v15 = [v3 stringWithFormat:@"{Span\n  label: \n%@\n  input: \n%@\n  startTokenIndex: \n%u\n  endTokenIndex: \n%u\n  usoGraph:\n%@\n  score: %f\n  matcherNamees: \n%@\n}", v4, v5, v6, v7, v10, v12, v14];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUSpan *)self label];
  [v4 encodeObject:v5 forKey:@"label"];

  uint64_t v6 = [(SIRINLUSpan *)self input];
  [v4 encodeObject:v6 forKey:@"input"];

  id v11 = [NSNumber numberWithUnsignedInt:self->_startTokenIndex];
  [v4 encodeObject:v11 forKey:@"startTokenIndex"];
  uint64_t v7 = [NSNumber numberWithUnsignedInt:self->_endTokenIndex];
  [v4 encodeObject:v7 forKey:@"endTokenIndex"];
  v8 = [(SIRINLUSpan *)self usoGraph];
  [v4 encodeObject:v8 forKey:@"usoGraph"];

  v9 = [NSNumber numberWithDouble:self->_score];
  [v4 encodeObject:v9 forKey:@"score"];
  v10 = [(SIRINLUSpan *)self matcherNames];
  [v4 encodeObject:v10 forKey:@"matcherNames"];
}

- (SIRINLUSpan)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SIRINLUSpan;
  v5 = [(SIRINLUSpan *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"input"];
    input = v5->_input;
    v5->_input = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTokenIndex"];
    v5->_startTokenIndex = [v10 unsignedIntValue];
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTokenIndex"];
    v5->_endTokenIndex = [v11 unsignedIntValue];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usoGraph"];
    usoGraph = v5->_usoGraph;
    v5->_usoGraph = (USOSerializedGraph *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"score"];
    [v14 doubleValue];
    v5->_score = v15;
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"matcherNames"];
    matcherNames = v5->_matcherNames;
    v5->_matcherNames = (NSArray *)v19;
  }
  return v5;
}

- (SIRINLUSpan)initWithLabel:(id)a3 input:(id)a4 startTokenIndex:(unsigned int)a5 endTokenIndex:(unsigned int)a6 usoGraph:(id)a7 score:(double)a8 matcherNames:(id)a9
{
  id v23 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a9;
  v24.receiver = self;
  v24.super_class = (Class)SIRINLUSpan;
  v20 = [(SIRINLUSpan *)&v24 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_label, a3);
    objc_storeStrong((id *)&v21->_input, a4);
    v21->_startTokenIndex = a5;
    v21->_endTokenIndex = a6;
    objc_storeStrong((id *)&v21->_usoGraph, a7);
    v21->_score = a8;
    objc_storeStrong((id *)&v21->_matcherNames, a9);
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end