@interface CRLWPRubyField
- (BOOL)allowsEditing;
- (BOOL)canCopy:(_NSRange)a3;
- (BOOL)supportsDeepCopyForUndo;
- (CRLWPRubyField)initWithRubyText:(id)a3;
- (NSString)baseText;
- (NSString)rubyText;
- (int)baseTextScript;
- (int)styleAttributeArrayKind;
- (unint64_t)attributeArrayKind;
- (unsigned)smartFieldKind;
- (void)setRubyText:(id)a3;
@end

@implementation CRLWPRubyField

- (CRLWPRubyField)initWithRubyText:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLWPRubyField;
  v5 = [(CRLWPRubyField *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    rubyText = v5->_rubyText;
    v5->_rubyText = v6;
  }
  return v5;
}

- (void)setRubyText:(id)a3
{
  id v7 = a3;
  id v4 = (NSString *)[v7 copy];
  rubyText = self->_rubyText;
  self->_rubyText = v4;

  v6 = [(CRLWPSmartField *)self parentStorage];
  [v6 smartFieldDidChange:self];
}

- (NSString)baseText
{
  v3 = [(CRLWPSmartField *)self parentStorage];

  if (v3)
  {
    id v4 = [(CRLWPSmartField *)self parentStorage];
    id v5 = [(CRLWPSmartField *)self range];
    id v7 = [v4 substringWithRange:v5, v6];
  }
  else
  {
    id v7 = 0;
  }

  return (NSString *)v7;
}

- (int)baseTextScript
{
  v2 = [(CRLWPRubyField *)self baseText];
  int v3 = [v2 crlwp_contentsScript];

  return v3;
}

- (unsigned)smartFieldKind
{
  return 256;
}

- (unint64_t)attributeArrayKind
{
  return 7;
}

- (int)styleAttributeArrayKind
{
  return 7;
}

- (BOOL)allowsEditing
{
  return 1;
}

- (BOOL)canCopy:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(CRLWPSmartField *)self range];
  return location <= (unint64_t)v5 && location + length >= (unint64_t)v5 + v6;
}

- (BOOL)supportsDeepCopyForUndo
{
  return 0;
}

- (NSString)rubyText
{
  return self->_rubyText;
}

- (void).cxx_destruct
{
}

@end