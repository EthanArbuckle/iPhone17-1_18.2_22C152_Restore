@interface _UIFeedbackLibraryPattern
+ (BOOL)supportsSecureCoding;
+ (id)feedbackPatternWithLibraryKey:(id)a3;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighPriority;
- (CHHapticPattern)pattern;
- (NSString)libraryKey;
- (_UIFeedbackLibraryPattern)initWithDictionaryRepresentation:(id)a3;
- (_UIFeedbackLibraryPattern)initWithLibraryKey:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)_effectivePlayableFeedbackTypes;
@end

@implementation _UIFeedbackLibraryPattern

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"library";
}

+ (id)feedbackPatternWithLibraryKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithLibraryKey:v4];

  return v5;
}

- (_UIFeedbackLibraryPattern)initWithLibraryKey:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackLibraryPattern;
  v6 = [(_UIFeedback *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryKey, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIFeedbackLibraryPattern;
  if ([(_UIFeedback *)&v7 isEqual:v4]) {
    char v5 = [(NSString *)self->_libraryKey isEqual:v4[16]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (_UIFeedbackLibraryPattern)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackLibraryPattern;
  char v5 = [(_UIFeedback *)&v10 initWithDictionaryRepresentation:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"libraryKey"];
    libraryKey = v5->_libraryKey;
    v5->_libraryKey = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFeedbackLibraryPattern;
  v3 = [(_UIFeedback *)&v6 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setObject:self->_libraryKey forKeyedSubscript:@"libraryKey"];
  return v4;
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 _feedbackSupportLevel] > 1;

  return 2 * v3;
}

- (CHHapticPattern)pattern
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  pattern = self->_pattern;
  if (!pattern)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    id v4 = (void *)qword_1EB25C930;
    uint64_t v16 = qword_1EB25C930;
    if (!qword_1EB25C930)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v18 = __getCHHapticPatternClass_block_invoke_0;
      v19 = &unk_1E52D9900;
      v20 = &v13;
      __getCHHapticPatternClass_block_invoke_0((uint64_t)&buf);
      id v4 = (void *)v14[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v13, 8);
    libraryKey = self->_libraryKey;
    id v12 = 0;
    objc_super v7 = [v5 patternForKey:libraryKey error:&v12];
    id v8 = v12;
    v9 = self->_pattern;
    self->_pattern = v7;

    if (v8)
    {
      if (!_UIFeedbackLoggingDisabled)
      {
        objc_super v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25C928) + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "failed loading haptic library pattern: %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }

    pattern = self->_pattern;
  }
  return pattern;
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (NSString)libraryKey
{
  return self->_libraryKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern, 0);
  objc_storeStrong((id *)&self->_libraryKey, 0);
}

@end