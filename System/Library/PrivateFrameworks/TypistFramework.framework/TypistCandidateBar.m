@interface TypistCandidateBar
+ (TypistCandidateBar)initWithTypistKeyboard:(id)a3;
+ (id)candidatesAsStringArray:(id)a3;
- (BOOL)hasCandidate:(id)a3;
- (BOOL)hasCandidate:(id)a3 inRange:(_NSRange)a4;
- (BOOL)hasCandidates;
- (BOOL)hasCandidates:(id)a3;
- (BOOL)hasCandidates:(id)a3 inRange:(_NSRange)a4;
- (BOOL)hasVisibleCandidate:(id)a3;
- (CGPoint)centerOfCandidate:(id)a3;
- (TypistCandidateBar)init;
- (double)getCandidateBarHeight;
- (double)getCandidateBarWidth;
- (id)candidateUIInformation:(id)a3;
- (id)getAllCandidates;
- (id)getVisibleCandidates;
- (int64_t)getIndexOfCandidate:(id)a3;
- (int64_t)selectCandidate:(id)a3;
- (int64_t)selectCandidateAtIndex:(int64_t)a3;
@end

@implementation TypistCandidateBar

- (TypistCandidateBar)init
{
  v3.receiver = self;
  v3.super_class = (Class)TypistCandidateBar;
  return [(TypistCandidateBar *)&v3 init];
}

- (id)candidateUIInformation:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF940] exceptionWithName:@"UnsupportedMethodInBaseClassException" reason:@"Method should not be called from this class. This should be called from a subclass of this object." userInfo:0];
  objc_exception_throw(v4);
}

+ (TypistCandidateBar)initWithTypistKeyboard:(id)a3
{
  int v3 = [a3 usesMecabraCandidateBar];
  id v4 = off_265559328;
  if (!v3) {
    id v4 = off_265559320;
  }
  id v5 = objc_alloc_init(*v4);
  return (TypistCandidateBar *)v5;
}

- (BOOL)hasCandidates
{
  v2 = [(TypistCandidateBar *)self getVisibleCandidates];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasCandidate:(id)a3
{
  return [(TypistCandidateBar *)self getIndexOfCandidate:a3] != -1;
}

- (BOOL)hasCandidate:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v6 = [(TypistCandidateBar *)self getIndexOfCandidate:a3];
  BOOL v8 = v6 >= location && v6 - location < length;
  return v6 >= 0 && v8;
}

- (BOOL)hasCandidates:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    BOOL v7 = 0;
    uint64_t v8 = *(void *)v13;
    int v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        BOOL v7 = [(TypistCandidateBar *)self hasCandidate:*(void *)(*((void *)&v12 + 1) + 8 * i)] & (v9 | v7);
        int v9 = 0;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      int v9 = 0;
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)hasCandidates:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    BOOL v10 = 0;
    uint64_t v11 = *(void *)v16;
    int v12 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        BOOL v10 = -[TypistCandidateBar hasCandidate:inRange:](self, "hasCandidate:inRange:", *(void *)(*((void *)&v15 + 1) + 8 * i), location, length) & (v12 | v10);
        int v12 = 0;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      int v12 = 0;
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (int64_t)getIndexOfCandidate:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF940] exceptionWithName:@"UnsupportedMethodInBaseClassException" reason:@"Method should not be called from this class. This should be called from a subclass of this object." userInfo:0];
  objc_exception_throw(v4);
}

+ (id)candidatesAsStringArray:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = __Block_byref_object_copy__8;
  uint64_t v11 = __Block_byref_object_dispose__8;
  id v12 = (id)objc_opt_new();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__TypistCandidateBar_candidatesAsStringArray___block_invoke;
  v6[3] = &unk_265559DB0;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__TypistCandidateBar_candidatesAsStringArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 candidate];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 atIndexedSubscript:a3];
}

- (BOOL)hasVisibleCandidate:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF940] exceptionWithName:@"UnsupportedMethodInBaseClassException" reason:@"Method should not be called from this class. This should be called from a subclass of this object." userInfo:0];
  objc_exception_throw(v4);
}

- (id)getAllCandidates
{
  v2 = [(objc_class *)+[TypistKeyboardData keyboardData] getAllCandidates];
  id v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA68];
  }
  id v4 = v2;

  return v4;
}

- (id)getVisibleCandidates
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:@"UnsupportedMethodInBaseClassException" reason:@"Method should not be called from this class. This should be called from a subclass of this object." userInfo:0];
  objc_exception_throw(v2);
}

- (int64_t)selectCandidate:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF940] exceptionWithName:@"UnsupportedMethodInBaseClassException" reason:@"Method should not be called from this class. This should be called from a subclass of this object." userInfo:0];
  objc_exception_throw(v4);
}

- (int64_t)selectCandidateAtIndex:(int64_t)a3
{
  id v3 = [MEMORY[0x263EFF940] exceptionWithName:@"UnsupportedMethodInBaseClassException" reason:@"Method should not be called from this class. This should be called from a subclass of this object." userInfo:0];
  objc_exception_throw(v3);
}

- (CGPoint)centerOfCandidate:(id)a3
{
  id v3 = a3;
  [(objc_class *)+[TypistKeyboardData keyboardData] getCandidateCenter:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (double)getCandidateBarHeight
{
  [(objc_class *)+[TypistKeyboardData keyboardData] getCandidateBarRect];
  return v2;
}

- (double)getCandidateBarWidth
{
  [(objc_class *)+[TypistKeyboardData keyboardData] getCandidateBarRect];
  return v2;
}

@end