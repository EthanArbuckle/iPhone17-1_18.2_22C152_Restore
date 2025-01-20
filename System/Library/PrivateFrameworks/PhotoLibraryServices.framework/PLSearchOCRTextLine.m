@interface PLSearchOCRTextLine
- (BOOL)isTitle;
- (CGRect)textBounds;
- (NSArray)candidates;
- (PLSearchOCRTextLine)initWithTextBounds:(CGRect)a3 isTitle:(BOOL)a4 candidates:(id)a5;
- (id)description;
@end

@implementation PLSearchOCRTextLine

- (void).cxx_destruct
{
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (BOOL)isTitle
{
  return self->_isTitle;
}

- (CGRect)textBounds
{
  double x = self->_textBounds.origin.x;
  double y = self->_textBounds.origin.y;
  double width = self->_textBounds.size.width;
  double height = self->_textBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@:%p> ", v5, self];

  v6 = NSStringFromRect(self->_textBounds);
  [v3 appendFormat:@"textBounds: %@, ", v6];

  if (self->_isTitle) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"isTitle: %@, ", v7];
  [v3 appendFormat:@"candidates: %@", self->_candidates];
  return v3;
}

- (PLSearchOCRTextLine)initWithTextBounds:(CGRect)a3 isTitle:(BOOL)a4 candidates:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLSearchOCRTextLine;
  v12 = [(PLSearchOCRTextLine *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    candidates = v12->_candidates;
    v12->_candidates = (NSArray *)v13;

    v12->_textBounds.origin.CGFloat x = x;
    v12->_textBounds.origin.CGFloat y = y;
    v12->_textBounds.size.CGFloat width = width;
    v12->_textBounds.size.CGFloat height = height;
    v12->_isTitle = a4;
  }

  return v12;
}

@end