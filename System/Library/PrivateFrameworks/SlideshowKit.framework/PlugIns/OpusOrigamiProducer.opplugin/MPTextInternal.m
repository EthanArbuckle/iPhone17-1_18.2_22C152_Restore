@interface MPTextInternal
- (NSAttributedString)attributedString;
- (void)dealloc;
- (void)setAttributedString:(id)a3;
@end

@implementation MPTextInternal

- (void)dealloc
{
  self->attributedString = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPTextInternal;
  [(MPTextInternal *)&v3 dealloc];
}

- (NSAttributedString)attributedString
{
  return self->attributedString;
}

- (void)setAttributedString:(id)a3
{
}

@end