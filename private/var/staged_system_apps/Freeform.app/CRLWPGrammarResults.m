@interface CRLWPGrammarResults
- (id)grammarResultForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4;
- (void)addResult:(id)a3 forRange:(_NSRange)a4;
@end

@implementation CRLWPGrammarResults

- (void)addResult:(id)a3 forRange:(_NSRange)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CRLWPGrammarResults;
  -[CRLWPCheckingResults addResult:forRange:](&v4, "addResult:forRange:", a3, a4.location, a4.length);
}

- (id)grammarResultForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  *a4 = (_NSRange)xmmword_101176F48;
  v7 = [(CRLWPCheckingResults *)self ranges];
  v8 = [(CRLWPCheckingResults *)self results];
  if ([v7 rangeCount])
  {
    unint64_t v9 = 0;
    while (1)
    {
      id v10 = [v7 rangeAtIndex:v9];
      if (a3 >= (unint64_t)v10 && a3 - (unint64_t)v10 < v11) {
        break;
      }
      if (++v9 >= (unint64_t)[v7 rangeCount]) {
        goto LABEL_6;
      }
    }
    a4->location = (NSUInteger)v10;
    a4->length = v11;
    if ((unint64_t)[v8 count] <= v9)
    {
      int v18 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F2940);
      }
      v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A6934(v18, v19);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F2960);
      }
      v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v20, v18);
      }
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPGrammarResults grammarResultForCharIndex:outRange:]");
      v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSpellingResults.m"];
      +[CRLAssertionHandler handleFailureInFunction:v15 file:v17 lineNumber:185 isFatal:0 description:"No grammar error found for range"];
      v12 = 0;
    }
    else
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = [v8 objectAtIndexedSubscript:v9];
      v15 = sub_10024715C(v13, v14);

      v16 = (objc_class *)objc_opt_class();
      v17 = [v15 first];
      v12 = sub_10024715C(v16, v17);
    }
  }
  else
  {
LABEL_6:
    v12 = 0;
  }

  return v12;
}

@end