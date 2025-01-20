@interface CRLWPSpellingResults
- (_NSRange)rangeOfMisspelledWordAtCharIndex:(unint64_t)a3;
- (void)addResult:(id)a3 forRange:(_NSRange)a4;
@end

@implementation CRLWPSpellingResults

- (void)addResult:(id)a3 forRange:(_NSRange)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CRLWPSpellingResults;
  -[CRLWPCheckingResults addResult:forRange:](&v4, "addResult:forRange:", a3, a4.location, a4.length);
}

- (_NSRange)rangeOfMisspelledWordAtCharIndex:(unint64_t)a3
{
  objc_super v4 = [(CRLWPCheckingResults *)self ranges];
  id v5 = [v4 rangeContainingPosition:a3];
  NSUInteger v7 = v6;

  NSUInteger v8 = (NSUInteger)v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

@end