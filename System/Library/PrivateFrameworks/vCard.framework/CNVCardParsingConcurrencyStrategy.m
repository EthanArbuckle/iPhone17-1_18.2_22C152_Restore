@interface CNVCardParsingConcurrencyStrategy
+ (BOOL)shouldTryConcurrentParsingForOptions:(id)a3;
+ (id)strategyForOptions:(id)a3;
@end

@implementation CNVCardParsingConcurrencyStrategy

+ (id)strategyForOptions:(id)a3
{
  int v3 = [a1 shouldTryConcurrentParsingForOptions:a3];
  v4 = off_1E6C2CAC8;
  if (!v3) {
    v4 = &off_1E6C2CAD0;
  }
  id v5 = objc_alloc_init(*v4);
  return v5;
}

+ (BOOL)shouldTryConcurrentParsingForOptions:(id)a3
{
  id v3 = a3;
  if ([v3 useConcurrentParsing]) {
    BOOL v4 = (unint64_t)[v3 contactLimit] > 0x7F;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end