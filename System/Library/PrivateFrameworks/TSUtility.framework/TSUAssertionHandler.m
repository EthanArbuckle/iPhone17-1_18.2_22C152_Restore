@interface TSUAssertionHandler
+ (id)currentHandler;
+ (id)performBlockIgnoringAssertions:(id)a3;
+ (void)installAsNSHandler;
+ (void)testCaseStarted:(id)a3;
+ (void)testCaseStopped:(id)a3;
- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6;
- (void)handleFailureInMethod:(SEL)a3 object:(id)a4 file:(id)a5 lineNumber:(int64_t)a6 description:(id)a7;
- (void)handleFailureWithLocation:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6 arguments:(char *)a7;
@end

@implementation TSUAssertionHandler

+ (id)currentHandler
{
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary");
  uint64_t v3 = [v2 objectForKey:@"TSUAssertionHandler"];
  v4 = (TSUAssertionHandler *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    v4 = objc_alloc_init(TSUAssertionHandler);
    [v2 setObject:v4 forKey:@"TSUAssertionHandler"];
  }
  return v4;
}

+ (void)installAsNSHandler
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary");
  uint64_t v4 = [a1 currentHandler];
  [v3 setObject:v4 forKey:@"NSAssertionHandler"];
}

+ (void)testCaseStarted:(id)a3
{
  uint64_t v3 = (void *)[a3 object];
  id v4 = v3;

  _senTestCaseRun = (uint64_t)v3;
  _senTestCasePool = (uint64_t)objc_alloc_init(MEMORY[0x263F086B0]);
}

+ (void)testCaseStopped:(id)a3
{
  _senTestCasePool = 0;
  _senTestCaseRun = 0;
}

+ (id)performBlockIgnoringAssertions:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  uint64_t v12 = 0;
  uint64_t v3 = _callbackBlock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__TSUAssertionHandler_performBlockIgnoringAssertions___block_invoke;
  v6[3] = &unk_26462A0F0;
  v6[4] = &v7;
  _callbackBlock = (uint64_t)v6;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  _callbackBlock = v3;
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __54__TSUAssertionHandler_performBlockIgnoringAssertions___block_invoke(uint64_t a1, void *a2)
{
  TSULogSink(@"Error", (NSString *)@"*** Ignored previous assertion failure ***");
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)handleFailureInMethod:(SEL)a3 object:(id)a4 file:(id)a5 lineNumber:(int64_t)a6 description:(id)a7
{
  v13 = (objc_class *)objc_opt_class();
  v14 = NSString;
  v16 = NSStringFromClass(v13);
  v17 = NSStringFromSelector(a3);
  uint64_t v15 = 45;
  if (v13 == a4) {
    uint64_t v15 = 43;
  }
  -[TSUAssertionHandler handleFailureWithLocation:file:lineNumber:description:arguments:](self, "handleFailureWithLocation:file:lineNumber:description:arguments:", [v14 stringWithFormat:@"%c[%@ %@]", v15, v16, v17], a5, a6, a7, &v18);
}

- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6
{
  [(TSUAssertionHandler *)self handleFailureWithLocation:a3 file:a4 lineNumber:a5 description:a6 arguments:&v6];
}

- (void)handleFailureWithLocation:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6 arguments:(char *)a7
{
  v10 = (void *)[[NSString alloc] initWithFormat:a6 arguments:a7];
  uint64_t v11 = [a4 lastPathComponent];
  TSULogSink(@"Error", (NSString *)@"*** Assertion failure #%lu: %@ %@:%d %@", ++handleFailureWithLocation_file_lineNumber_description_arguments__assertionCount, a3, v11, a5, v10);
}

@end