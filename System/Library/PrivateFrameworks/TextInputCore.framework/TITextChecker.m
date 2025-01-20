@interface TITextChecker
+ (id)_UITextCheckerWithAsynchronousLoading:(BOOL)a3;
- (BOOL)doneLoading;
- (TITextChecker)init;
- (TITextChecker)initWithAsynchronousLoading:(BOOL)a3;
- (_NSRange)checkSpellingOfString:(id)a3 startingAt:(int64_t)a4 language:(id)a5 wrap:(BOOL)a6 correction:(id *)a7;
- (_TIUITextChecking)checker;
@end

@implementation TITextChecker

- (void).cxx_destruct
{
}

- (_TIUITextChecking)checker
{
  return self->_checker;
}

- (_NSRange)checkSpellingOfString:(id)a3 startingAt:(int64_t)a4 language:(id)a5 wrap:(BOOL)a6 correction:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  *a7 = 0;
  v14 = [(TITextChecker *)self checker];
  int v15 = [v14 _doneLoading];

  if (v15)
  {
    v16 = [(TITextChecker *)self checker];
    uint64_t v17 = [v16 checkSpellingOfString:v12 startingAt:a4 language:v13 wrap:v8 correction:a7];
    NSUInteger v19 = v18;
  }
  else
  {
    NSUInteger v19 = 0;
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v20 = v17;
  NSUInteger v21 = v19;
  result.length = v21;
  result.location = v20;
  return result;
}

- (BOOL)doneLoading
{
  v3 = [(TITextChecker *)self checker];
  if (v3)
  {
    v4 = [(TITextChecker *)self checker];
    char v5 = [v4 _doneLoading];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (TITextChecker)initWithAsynchronousLoading:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TITextChecker;
  v4 = [(TITextChecker *)&v8 init];
  if (v4)
  {
    uint64_t v5 = +[TITextChecker _UITextCheckerWithAsynchronousLoading:v3];
    checker = v4->_checker;
    v4->_checker = (_TIUITextChecking *)v5;
  }
  return v4;
}

- (TITextChecker)init
{
  return [(TITextChecker *)self initWithAsynchronousLoading:0];
}

+ (id)_UITextCheckerWithAsynchronousLoading:(BOOL)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__TITextChecker__UITextCheckerWithAsynchronousLoading___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v6 = a3;
  if (_UITextCheckerWithAsynchronousLoading__onceToken != -1) {
    dispatch_once(&_UITextCheckerWithAsynchronousLoading__onceToken, block);
  }
  BOOL v3 = (void *)_UITextCheckerWithAsynchronousLoading__checker;

  return v3;
}

void __55__TITextChecker__UITextCheckerWithAsynchronousLoading___block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getUITextCheckerClass_softClass;
  uint64_t v10 = getUITextCheckerClass_softClass;
  if (!getUITextCheckerClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getUITextCheckerClass_block_invoke;
    v6[3] = &unk_1E6E2E248;
    v6[4] = &v7;
    __getUITextCheckerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  BOOL v3 = v2;
  _Block_object_dispose(&v7, 8);
  if (v3)
  {
    uint64_t v4 = [[v3 alloc] _initWithAsynchronousLoading:*(unsigned __int8 *)(a1 + 32)];
    uint64_t v5 = (void *)_UITextCheckerWithAsynchronousLoading__checker;
    _UITextCheckerWithAsynchronousLoading__checker = v4;
  }
}

@end