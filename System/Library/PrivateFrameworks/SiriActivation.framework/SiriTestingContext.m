@interface SiriTestingContext
+ (BOOL)supportsSecureCoding;
- (AFRequestInfo)testingRequestInfo;
- (BOOL)containsAudioInput;
- (BOOL)containsRecognitionStrings;
- (NSDictionary)testingContext;
- (SiriTestingContext)initWithAudioInput:(id)a3;
- (SiriTestingContext)initWithAudioInput:(id)a3 siriContextOverride:(id)a4;
- (SiriTestingContext)initWithCoder:(id)a3;
- (SiriTestingContext)initWithPPTContext:(id)a3;
- (SiriTestingContext)initWithPPTContext:(id)a3 siriContextOverride:(id)a4;
- (SiriTestingContext)initWithRecognitionStrings:(id)a3;
- (SiriTestingContext)initWithRecognitionStrings:(id)a3 siriContextOverride:(id)a4;
- (SiriTestingContext)initWithRequestInfo:(id)a3 recognitionStrings:(id)a4;
- (SiriTestingContext)initWithRequestInfo:(id)a3 recognitionStrings:(id)a4 siriContextOverride:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriTestingContext

- (SiriTestingContext)initWithPPTContext:(id)a3
{
  return [(SiriTestingContext *)self initWithPPTContext:a3 siriContextOverride:0];
}

- (SiriTestingContext)initWithPPTContext:(id)a3 siriContextOverride:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriTestingContext;
  v8 = [(SiriContext *)&v11 initWithContextOverride:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_testingContext, a3);
  }

  return v9;
}

- (SiriTestingContext)initWithRecognitionStrings:(id)a3
{
  return [(SiriTestingContext *)self initWithRecognitionStrings:a3 siriContextOverride:0];
}

- (SiriTestingContext)initWithRecognitionStrings:(id)a3 siriContextOverride:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriTestingContext;
  id v7 = [(SiriContext *)&v11 initWithContextOverride:a4];
  if (v7)
  {
    v12 = @"SiriTestingContextRecognitionStringKey";
    v13[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    testingContext = v7->_testingContext;
    v7->_testingContext = (NSDictionary *)v8;
  }
  return v7;
}

- (SiriTestingContext)initWithAudioInput:(id)a3
{
  return [(SiriTestingContext *)self initWithAudioInput:a3 siriContextOverride:0];
}

- (SiriTestingContext)initWithAudioInput:(id)a3 siriContextOverride:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriTestingContext;
  id v7 = [(SiriContext *)&v11 initWithContextOverride:a4];
  if (v7)
  {
    v12 = @"SiriTestingContextAudioInputKey";
    v13[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    testingContext = v7->_testingContext;
    v7->_testingContext = (NSDictionary *)v8;
  }
  return v7;
}

- (SiriTestingContext)initWithRequestInfo:(id)a3 recognitionStrings:(id)a4
{
  return [(SiriTestingContext *)self initWithRequestInfo:a3 recognitionStrings:a4 siriContextOverride:0];
}

- (SiriTestingContext)initWithRequestInfo:(id)a3 recognitionStrings:(id)a4 siriContextOverride:(id)a5
{
  uint64_t v8 = (AFRequestInfo *)a3;
  v9 = [(SiriTestingContext *)self initWithRecognitionStrings:a4 siriContextOverride:a5];
  testingRequestInfo = v9->_testingRequestInfo;
  v9->_testingRequestInfo = v8;

  return v9;
}

- (BOOL)containsRecognitionStrings
{
  v2 = [(NSDictionary *)self->_testingContext objectForKeyedSubscript:@"SiriTestingContextRecognitionStringKey"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)containsAudioInput
{
  v2 = [(NSDictionary *)self->_testingContext objectForKeyedSubscript:@"SiriTestingContextAudioInputKey"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  BOOL v3 = NSString;
  v4 = [(SiriContext *)self contextOverride];
  v5 = [(SiriTestingContext *)self testingContext];
  id v6 = [v3 stringWithFormat:@"<SiriTestingContext contextOverride:%@, testingContext:%@>", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriTestingContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SiriTestingContext;
  v5 = [(SiriContext *)&v14 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"testingContext"];
    objc_super v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v5->_testingContext, v12);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriTestingContext;
  id v4 = a3;
  [(SiriContext *)&v6 encodeWithCoder:v4];
  v5 = [(SiriTestingContext *)self testingContext];
  [v4 encodeObject:v5 forKey:@"testingContext"];
}

- (NSDictionary)testingContext
{
  return self->_testingContext;
}

- (AFRequestInfo)testingRequestInfo
{
  return self->_testingRequestInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingRequestInfo, 0);
  objc_storeStrong((id *)&self->_testingContext, 0);
}

@end