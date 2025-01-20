@interface CRTextStorageBase
- (BOOL)_shouldSetOriginalFontAttribute;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5;
- (id)mutableAttributedString;
- (id)string;
- (unint64_t)length;
@end

@implementation CRTextStorageBase

- (id)mutableAttributedString
{
  return 0;
}

- (id)string
{
  v2 = [(CRTextStorageBase *)self mutableAttributedString];
  v3 = [v2 string];

  return v3;
}

- (unint64_t)length
{
  v2 = [(CRTextStorageBase *)self mutableAttributedString];
  unint64_t v3 = [v2 length];

  return v3;
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  v6 = [(CRTextStorageBase *)self mutableAttributedString];
  v7 = [v6 attributesAtIndex:a3 effectiveRange:a4];

  return v7;
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v9 = [(CRTextStorageBase *)self mutableAttributedString];
  v10 = objc_msgSend(v9, "attributesAtIndex:longestEffectiveRange:inRange:", a3, a4, location, length);

  return v10;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  id v8 = a3;
  v9 = [(CRTextStorageBase *)self mutableAttributedString];
  v10 = [v9 attribute:v8 atIndex:a4 effectiveRange:a5];

  return v10;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v11 = a3;
  v12 = [(CRTextStorageBase *)self mutableAttributedString];
  v13 = objc_msgSend(v12, "attribute:atIndex:longestEffectiveRange:inRange:", v11, a4, a5, location, length);

  return v13;
}

- (BOOL)_shouldSetOriginalFontAttribute
{
  return 1;
}

@end