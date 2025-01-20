@interface TIKeyboardSecureCandidateLayoutTraits
+ (BOOL)supportsSecureCoding;
- (BOOL)forceSingleLineLayout;
- (BOOL)isEqual:(id)a3;
- (TIKeyboardSecureCandidateLayoutTraits)initWithCoder:(id)a3;
- (TIKeyboardSecureCandidateTextTraits)headerTraitsInFirstLine;
- (TIKeyboardSecureCandidateTextTraits)headerTraitsInOnlyLine;
- (TIKeyboardSecureCandidateTextTraits)inputTraitsInFirstAndSecondLines;
- (TIKeyboardSecureCandidateTextTraits)inputTraitsInOnlyLine;
- (TIKeyboardSecureCandidateTextTraits)inputTraitsInSecondLine;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)headerInliningBehavior;
- (void)encodeWithCoder:(id)a3;
- (void)setForceSingleLineLayout:(BOOL)a3;
- (void)setHeaderInliningBehavior:(unsigned int)a3;
- (void)setHeaderTraitsInFirstLine:(id)a3;
- (void)setHeaderTraitsInOnlyLine:(id)a3;
- (void)setInputTraitsInFirstAndSecondLines:(id)a3;
- (void)setInputTraitsInOnlyLine:(id)a3;
- (void)setInputTraitsInSecondLine:(id)a3;
@end

@implementation TIKeyboardSecureCandidateLayoutTraits

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputTraitsInSecondLine, 0);
  objc_storeStrong((id *)&self->_inputTraitsInFirstAndSecondLines, 0);
  objc_storeStrong((id *)&self->_inputTraitsInOnlyLine, 0);
  objc_storeStrong((id *)&self->_headerTraitsInFirstLine, 0);

  objc_storeStrong((id *)&self->_headerTraitsInOnlyLine, 0);
}

- (void)setInputTraitsInSecondLine:(id)a3
{
}

- (TIKeyboardSecureCandidateTextTraits)inputTraitsInSecondLine
{
  return self->_inputTraitsInSecondLine;
}

- (void)setInputTraitsInFirstAndSecondLines:(id)a3
{
}

- (TIKeyboardSecureCandidateTextTraits)inputTraitsInFirstAndSecondLines
{
  return self->_inputTraitsInFirstAndSecondLines;
}

- (void)setInputTraitsInOnlyLine:(id)a3
{
}

- (TIKeyboardSecureCandidateTextTraits)inputTraitsInOnlyLine
{
  return self->_inputTraitsInOnlyLine;
}

- (void)setHeaderTraitsInFirstLine:(id)a3
{
}

- (TIKeyboardSecureCandidateTextTraits)headerTraitsInFirstLine
{
  return self->_headerTraitsInFirstLine;
}

- (void)setHeaderTraitsInOnlyLine:(id)a3
{
}

- (TIKeyboardSecureCandidateTextTraits)headerTraitsInOnlyLine
{
  return self->_headerTraitsInOnlyLine;
}

- (void)setHeaderInliningBehavior:(unsigned int)a3
{
  self->_headerInliningBehavior = a3;
}

- (unsigned)headerInliningBehavior
{
  return self->_headerInliningBehavior;
}

- (void)setForceSingleLineLayout:(BOOL)a3
{
  self->_forceSingleLineLayout = a3;
}

- (BOOL)forceSingleLineLayout
{
  return self->_forceSingleLineLayout;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    int v6 = [(TIKeyboardSecureCandidateLayoutTraits *)self forceSingleLineLayout];
    if (v6 == [v5 forceSingleLineLayout]
      && (unsigned int v7 = [(TIKeyboardSecureCandidateLayoutTraits *)self headerInliningBehavior],
          v7 == [v5 headerInliningBehavior]))
    {
      BOOL v8 = 0;
      unint64_t v9 = 0;
      v14 = sel_headerTraitsInOnlyLine;
      v15 = sel_headerTraitsInFirstLine;
      v16 = sel_inputTraitsInOnlyLine;
      v17 = sel_inputTraitsInFirstAndSecondLines;
      v18 = sel_inputTraitsInSecondLine;
      while (1)
      {
        v10 = (&v14)[v9];
        v11 = objc_msgSend(self, v10, v14, v15, v16, v17, v18, v19);
        v12 = [v5 v10];
        if (v11 != v12 && ![v11 isEqual:v12]) {
          break;
        }

        BOOL v8 = v9++ > 3;
        if (v9 == 5)
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
LABEL_11:
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = v3;
  if (self->_forceSingleLineLayout) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [v3 appendFormat:@"; forceSingleLineLayout = %@", v5];
  unsigned int v6 = self->_headerInliningBehavior - 1;
  if (v6 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%i [unknown enum value]", self->_headerInliningBehavior);
    unsigned int v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v7 = off_1E555A2F0[v6];
  }
  [v4 appendFormat:@"; headerInliningBehavior = %@", v7];
  if (self->_headerTraitsInOnlyLine) {
    [v4 appendFormat:@"; headerTraitsInOnlyLine = %@", self->_headerTraitsInOnlyLine];
  }
  if (self->_headerTraitsInFirstLine) {
    [v4 appendFormat:@"; headerTraitsInFirstLine = %@", self->_headerTraitsInFirstLine];
  }
  if (self->_inputTraitsInOnlyLine) {
    [v4 appendFormat:@"; inputTraitsInOnlyLine = %@", self->_inputTraitsInOnlyLine];
  }
  if (self->_inputTraitsInFirstAndSecondLines) {
    objc_msgSend(v4, "appendFormat:", @"; inputTraitsInFirstAndSecondLine = %@",
  }
      self->_inputTraitsInFirstAndSecondLines);
  if (self->_inputTraitsInSecondLine) {
    [v4 appendFormat:@"; inputTraitsInSecondLine = %@", self->_inputTraitsInSecondLine];
  }
  [v4 appendString:@">"];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeBool:self->_forceSingleLineLayout forKey:@"forceSingleLineLayout"];
  [v10 encodeInt32:self->_headerInliningBehavior forKey:@"headerInliningBehavior"];
  headerTraitsInOnlyLine = self->_headerTraitsInOnlyLine;
  if (headerTraitsInOnlyLine) {
    [v10 encodeObject:headerTraitsInOnlyLine forKey:@"headerTraitsInOnlyLine"];
  }
  headerTraitsInFirstLine = self->_headerTraitsInFirstLine;
  if (headerTraitsInFirstLine) {
    [v10 encodeObject:headerTraitsInFirstLine forKey:@"headerTraitsInFirstLine"];
  }
  inputTraitsInOnlyLine = self->_inputTraitsInOnlyLine;
  unsigned int v7 = v10;
  if (inputTraitsInOnlyLine)
  {
    [v10 encodeObject:inputTraitsInOnlyLine forKey:@"inputTraitsInOnlyLine"];
    unsigned int v7 = v10;
  }
  inputTraitsInFirstAndSecondLines = self->_inputTraitsInFirstAndSecondLines;
  if (inputTraitsInFirstAndSecondLines)
  {
    [v10 encodeObject:inputTraitsInFirstAndSecondLines forKey:@"inputTraitsInFirstAndSecondLines"];
    unsigned int v7 = v10;
  }
  inputTraitsInSecondLine = self->_inputTraitsInSecondLine;
  if (inputTraitsInSecondLine)
  {
    [v10 encodeObject:inputTraitsInSecondLine forKey:@"inputTraitsInSecondLine"];
    unsigned int v7 = v10;
  }
}

- (TIKeyboardSecureCandidateLayoutTraits)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardSecureCandidateLayoutTraits;
  id v5 = [(TIKeyboardSecureCandidateLayoutTraits *)&v18 init];
  if (v5)
  {
    v5->_forceSingleLineLayout = [v4 decodeBoolForKey:@"forceSingleLineLayout"];
    v5->_headerInliningBehavior = [v4 decodeInt32ForKey:@"headerInliningBehavior"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"headerTraitsInOnlyLine"];
    headerTraitsInOnlyLine = v5->_headerTraitsInOnlyLine;
    v5->_headerTraitsInOnlyLine = (TIKeyboardSecureCandidateTextTraits *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:v6 forKey:@"headerTraitsInFirstLine"];
    headerTraitsInFirstLine = v5->_headerTraitsInFirstLine;
    v5->_headerTraitsInFirstLine = (TIKeyboardSecureCandidateTextTraits *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:v6 forKey:@"inputTraitsInOnlyLine"];
    inputTraitsInOnlyLine = v5->_inputTraitsInOnlyLine;
    v5->_inputTraitsInOnlyLine = (TIKeyboardSecureCandidateTextTraits *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:v6 forKey:@"inputTraitsInFirstAndSecondLines"];
    inputTraitsInFirstAndSecondLines = v5->_inputTraitsInFirstAndSecondLines;
    v5->_inputTraitsInFirstAndSecondLines = (TIKeyboardSecureCandidateTextTraits *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:v6 forKey:@"inputTraitsInSecondLine"];
    inputTraitsInSecondLine = v5->_inputTraitsInSecondLine;
    v5->_inputTraitsInSecondLine = (TIKeyboardSecureCandidateTextTraits *)v15;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(TIKeyboardSecureCandidateLayoutTraits);
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_forceSingleLineLayout = self->_forceSingleLineLayout;
    v5->_headerInliningBehavior = self->_headerInliningBehavior;
    uint64_t v7 = [(TIKeyboardSecureCandidateTextTraits *)self->_headerTraitsInOnlyLine copyWithZone:a3];
    headerTraitsInOnlyLine = v6->_headerTraitsInOnlyLine;
    v6->_headerTraitsInOnlyLine = v7;

    uint64_t v9 = [(TIKeyboardSecureCandidateTextTraits *)self->_headerTraitsInFirstLine copyWithZone:a3];
    headerTraitsInFirstLine = v6->_headerTraitsInFirstLine;
    v6->_headerTraitsInFirstLine = v9;

    uint64_t v11 = [(TIKeyboardSecureCandidateTextTraits *)self->_inputTraitsInOnlyLine copyWithZone:a3];
    inputTraitsInOnlyLine = v6->_inputTraitsInOnlyLine;
    v6->_inputTraitsInOnlyLine = v11;

    uint64_t v13 = [(TIKeyboardSecureCandidateTextTraits *)self->_inputTraitsInFirstAndSecondLines copyWithZone:a3];
    inputTraitsInFirstAndSecondLines = v6->_inputTraitsInFirstAndSecondLines;
    v6->_inputTraitsInFirstAndSecondLines = v13;

    uint64_t v15 = [(TIKeyboardSecureCandidateTextTraits *)self->_inputTraitsInSecondLine copyWithZone:a3];
    inputTraitsInSecondLine = v6->_inputTraitsInSecondLine;
    v6->_inputTraitsInSecondLine = v15;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end