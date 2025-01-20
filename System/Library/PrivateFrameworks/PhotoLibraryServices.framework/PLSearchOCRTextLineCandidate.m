@interface PLSearchOCRTextLineCandidate
- (NSArray)words;
- (NSString)line;
- (PLSearchOCRTextLineCandidate)initWithLine:(id)a3 words:(id)a4 confidence:(double)a5;
- (double)confidence;
- (id)description;
@end

@implementation PLSearchOCRTextLineCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_words, 0);
  objc_storeStrong((id *)&self->_line, 0);
}

- (double)confidence
{
  return self->_confidence;
}

- (NSArray)words
{
  return self->_words;
}

- (NSString)line
{
  return self->_line;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@:%p> ", v5, self];

  [v3 appendFormat:@"confidence: %f, ", *(void *)&self->_confidence];
  [v3 appendFormat:@"line: '%@', ", self->_line];
  [v3 appendFormat:@"words: %@, ", self->_words];
  return v3;
}

- (PLSearchOCRTextLineCandidate)initWithLine:(id)a3 words:(id)a4 confidence:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLSearchOCRTextLineCandidate;
  v10 = [(PLSearchOCRTextLineCandidate *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    line = v10->_line;
    v10->_line = (NSString *)v11;

    v10->_confidence = a5;
    uint64_t v13 = [v9 copy];
    words = v10->_words;
    v10->_words = (NSArray *)v13;
  }
  return v10;
}

@end