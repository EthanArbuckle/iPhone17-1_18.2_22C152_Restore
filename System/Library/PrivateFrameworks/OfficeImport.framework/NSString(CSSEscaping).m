@interface NSString(CSSEscaping)
- (id)CM_stringByAddingCSSEscapes;
@end

@implementation NSString(CSSEscaping)

- (id)CM_stringByAddingCSSEscapes
{
  if (qword_2689BCCD0 != -1) {
    dispatch_once(&qword_2689BCCD0, &__block_literal_global_107);
  }
  id v2 = a1;
  v3 = [v2 stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];

  v4 = [v3 componentsSeparatedByCharactersInSet:_MergedGlobals_54];
  v5 = [v4 componentsJoinedByString:@"\\a "];

  v6 = [v5 stringByReplacingOccurrencesOfString:@"\" withString:@"\\\"];

  v7 = [v6 stringByReplacingOccurrencesOfString:@"<" withString:@"\\3c "];

  v8 = [v7 stringByReplacingOccurrencesOfString:@">" withString:@"\\3e "];

  return v8;
}

@end