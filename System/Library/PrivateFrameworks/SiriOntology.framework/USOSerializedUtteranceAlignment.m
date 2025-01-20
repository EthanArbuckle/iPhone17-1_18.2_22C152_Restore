@interface USOSerializedUtteranceAlignment
+ (BOOL)supportsSecureCoding;
- (NSArray)spans;
- (USOSerializedUtteranceAlignment)initWithCoder:(id)a3;
- (USOSerializedUtteranceAlignment)initWithNodeIndex:(unint64_t)a3 asrHypothesisIndex:(unsigned int)a4 spans:(id)a5;
- (unint64_t)nodeIndex;
- (unsigned)asrHypothesisIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setAsrHypothesisIndex:(unsigned int)a3;
- (void)setNodeIndex:(unint64_t)a3;
- (void)setSpans:(id)a3;
@end

@implementation USOSerializedUtteranceAlignment

- (void).cxx_destruct
{
}

- (void)setSpans:(id)a3
{
}

- (NSArray)spans
{
  return self->_spans;
}

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  self->_asrHypothesisIndex = a3;
}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (void)setNodeIndex:(unint64_t)a3
{
  self->_nodeIndex = a3;
}

- (unint64_t)nodeIndex
{
  return self->_nodeIndex;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedLongLong:", -[USOSerializedUtteranceAlignment nodeIndex](self, "nodeIndex"));
  [v5 encodeObject:v6 forKey:@"nodeIndex"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSerializedUtteranceAlignment asrHypothesisIndex](self, "asrHypothesisIndex"));
  [v5 encodeObject:v7 forKey:@"asrHypothesisIndex"];

  id v8 = [(USOSerializedUtteranceAlignment *)self spans];
  [v5 encodeObject:v8 forKey:@"spans"];
}

- (USOSerializedUtteranceAlignment)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSerializedUtteranceAlignment;
  id v5 = [(USOSerializedUtteranceAlignment *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nodeIndex"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asrHypothesisIndex"];
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"spans"];
    spans = v5->_spans;
    v5->_spans = (NSArray *)v11;

    v5->_nodeIndex = [v6 unsignedLongLongValue];
    v5->_asrHypothesisIndex = [v7 unsignedIntValue];
  }
  return v5;
}

- (USOSerializedUtteranceAlignment)initWithNodeIndex:(unint64_t)a3 asrHypothesisIndex:(unsigned int)a4 spans:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)USOSerializedUtteranceAlignment;
  v10 = [(USOSerializedUtteranceAlignment *)&v13 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_nodeIndex = a3;
    v10->_asrHypothesisIndex = a4;
    objc_storeStrong((id *)&v10->_spans, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end