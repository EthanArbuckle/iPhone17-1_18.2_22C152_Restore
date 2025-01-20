@interface _UIFeedbackHapticFilePattern
+ (BOOL)supportsSecureCoding;
+ (id)feedbackPatternFromFile:(id)a3;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighPriority;
- (NSURL)fileURL;
- (_UIFeedbackHapticFilePattern)initWithDictionaryRepresentation:(id)a3;
- (_UIFeedbackHapticFilePattern)initWithFileURL:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)_effectivePlayableFeedbackTypes;
@end

@implementation _UIFeedbackHapticFilePattern

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"ahap";
}

+ (id)feedbackPatternFromFile:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFileURL:v4];

  return v5;
}

- (_UIFeedbackHapticFilePattern)initWithFileURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackHapticFilePattern;
  v6 = [(_UIFeedback *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileURL, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIFeedbackHapticFilePattern;
  if ([(_UIFeedback *)&v7 isEqual:v4]) {
    char v5 = [(NSURL *)self->_fileURL isEqual:v4[17]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (_UIFeedbackHapticFilePattern)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIFeedbackHapticFilePattern;
  char v5 = [(_UIFeedback *)&v12 initWithDictionaryRepresentation:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CB10];
    objc_super v7 = [v4 objectForKeyedSubscript:@"fileURL"];
    uint64_t v8 = [v6 URLWithString:v7 encodingInvalidCharacters:0];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v8;

    objc_super v10 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFeedbackHapticFilePattern;
  v3 = [(_UIFeedback *)&v7 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  char v5 = [(NSURL *)self->_fileURL absoluteString];
  [v4 setObject:v5 forKeyedSubscript:@"fileURL"];

  return v4;
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 _feedbackSupportLevel] > 1;

  return 2 * v3;
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
}

@end