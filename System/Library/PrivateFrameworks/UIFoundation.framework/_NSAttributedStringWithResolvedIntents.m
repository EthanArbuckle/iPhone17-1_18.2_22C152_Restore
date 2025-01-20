@interface _NSAttributedStringWithResolvedIntents
- (_NSAttributedStringWithResolvedIntents)initWithUnresolvedString:(id)a3 resolver:(Class)a4;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)string;
@end

@implementation _NSAttributedStringWithResolvedIntents

- (_NSAttributedStringWithResolvedIntents)initWithUnresolvedString:(id)a3 resolver:(Class)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_NSAttributedStringWithResolvedIntents;
  v6 = [(_NSAttributedStringWithResolvedIntents *)&v8 init];
  if (v6)
  {
    v6->_string = (NSAttributedString *)[a3 copy];
    v6->_resolver = a4;
  }
  return v6;
}

- (id)string
{
  return [(NSAttributedString *)self->_string string];
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  Class resolver = self->_resolver;
  v5 = [(NSAttributedString *)self->_string attributesAtIndex:a3 effectiveRange:a4];

  return (id)[(objc_class *)resolver attributesByResolvingIntentsInAttributes:v5];
}

@end