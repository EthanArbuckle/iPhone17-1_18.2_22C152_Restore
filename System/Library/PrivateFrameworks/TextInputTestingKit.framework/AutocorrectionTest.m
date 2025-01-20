@interface AutocorrectionTest
+ (id)testWithInput:(id)a3;
+ (id)testWithInput:(id)a3 andCorpusId:(id)a4;
+ (id)testWithInput:(id)a3 expectedOutput:(id)a4;
+ (id)testWithInput:(id)a3 expectedOutput:(id)a4 sourceMetadata:(id)a5 withTouches:(id)a6 andCorpusId:(id)a7;
+ (id)testWithTouches:(id)a3 expectedOutput:(id)a4;
- (AutocorrectionTest)initWithCoder:(id)a3;
- (NSArray)expectedOutput;
- (NSArray)touches;
- (NSDictionary)sourceMetadata;
- (NSNumber)corpusId;
- (NSString)input;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AutocorrectionTest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_corpusId, 0);
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_sourceMetadata, 0);
  objc_storeStrong((id *)&self->_expectedOutput, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (NSNumber)corpusId
{
  return self->_corpusId;
}

- (NSArray)touches
{
  return self->_touches;
}

- (NSDictionary)sourceMetadata
{
  return self->_sourceMetadata;
}

- (NSArray)expectedOutput
{
  return self->_expectedOutput;
}

- (NSString)input
{
  return self->_input;
}

- (void)encodeWithCoder:(id)a3
{
  input = self->_input;
  id v5 = a3;
  [v5 encodeObject:input forKey:@"ATInput"];
  [v5 encodeObject:self->_expectedOutput forKey:@"ATExpectedOutput"];
}

- (AutocorrectionTest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AutocorrectionTest;
  id v5 = [(AutocorrectionTest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ATInput"];
    input = v5->_input;
    v5->_input = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ATExpectedOutput"];
    expectedOutput = v5->_expectedOutput;
    v5->_expectedOutput = (NSArray *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  [v3 appendFormat:@"input: %@\n", self->_input];
  if (self->_touches) {
    [v3 appendFormat:@"touch: %@", self->_touches];
  }
  id v4 = [(NSArray *)self->_expectedOutput componentsJoinedByString:@" "];
  char v5 = [v4 isEqualToString:self->_input];

  if ((v5 & 1) == 0) {
    [v3 appendFormat:@"; expected: %@", self->_expectedOutput];
  }
  return v3;
}

+ (id)testWithInput:(id)a3 andCorpusId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = TITestTyperTokensForString(v7, 0);
  v9 = [a1 testWithInput:v7 expectedOutput:v8 sourceMetadata:0 withTouches:0 andCorpusId:v6];

  return v9;
}

+ (id)testWithInput:(id)a3
{
  id v4 = a3;
  char v5 = TITestTyperTokensForString(v4, 0);
  id v6 = [a1 testWithInput:v4 expectedOutput:v5];

  return v6;
}

+ (id)testWithInput:(id)a3 expectedOutput:(id)a4
{
  return (id)[a1 testWithInput:a3 expectedOutput:a4 sourceMetadata:0 withTouches:0 andCorpusId:0];
}

+ (id)testWithTouches:(id)a3 expectedOutput:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 componentsJoinedByString:@" "];
  v9 = [a1 testWithInput:v8 expectedOutput:v6 sourceMetadata:0 withTouches:v7 andCorpusId:0];

  return v9;
}

+ (id)testWithInput:(id)a3 expectedOutput:(id)a4 sourceMetadata:(id)a5 withTouches:(id)a6 andCorpusId:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = objc_alloc_init(AutocorrectionTest);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_input, a3);
    uint64_t v19 = [v13 copy];
    expectedOutput = v18->_expectedOutput;
    v18->_expectedOutput = (NSArray *)v19;

    objc_storeStrong((id *)&v18->_sourceMetadata, a5);
    objc_storeStrong((id *)&v18->_touches, a6);
    objc_storeStrong((id *)&v18->_corpusId, a7);
  }

  return v18;
}

@end