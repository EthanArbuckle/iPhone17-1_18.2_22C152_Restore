@interface TIContextChangeEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)extendsPriorWord;
- (BOOL)isSelection;
- (NSString)inWord;
- (TIContextChangeEvent)initWithCoder:(id)a3;
- (TIContextChangeEvent)initWithTIKeyboardState:(id)a3 andActionType:(int)a4;
- (_NSRange)inWordRange;
- (id)description;
- (unint64_t)selectionLocation;
- (void)encodeWithCoder:(id)a3;
- (void)setExtendsPriorWord:(BOOL)a3;
- (void)setInWord:(id)a3;
- (void)setInWordRange:(_NSRange)a3;
- (void)setIsSelection:(BOOL)a3;
- (void)setSelectionLocation:(unint64_t)a3;
@end

@implementation TIContextChangeEvent

- (void).cxx_destruct
{
}

- (void)setSelectionLocation:(unint64_t)a3
{
  self->_selectionLocation = a3;
}

- (unint64_t)selectionLocation
{
  return self->_selectionLocation;
}

- (void)setInWordRange:(_NSRange)a3
{
  self->_inWordRange = a3;
}

- (_NSRange)inWordRange
{
  p_inWordRange = &self->_inWordRange;
  NSUInteger location = self->_inWordRange.location;
  NSUInteger length = p_inWordRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setInWord:(id)a3
{
}

- (NSString)inWord
{
  return self->_inWord;
}

- (void)setExtendsPriorWord:(BOOL)a3
{
  self->_extendsPriorWord = a3;
}

- (BOOL)extendsPriorWord
{
  return self->_extendsPriorWord;
}

- (void)setIsSelection:(BOOL)a3
{
  self->_isSelection = a3;
}

- (BOOL)isSelection
{
  return self->_isSelection;
}

- (id)description
{
  BOOL v3 = [(TIContextChangeEvent *)self isSelection];
  v4 = NSString;
  v5 = [(TIUserAction *)self documentState];
  v6 = v5;
  if (v3)
  {
    v7 = [v5 selectedText];
    v8 = [v4 stringWithFormat:@"[%@]", v7];
  }
  else
  {
    v7 = [v5 contextBeforeInput];
    v9 = [(TIContextChangeEvent *)self inWord];
    v10 = [(TIUserAction *)self documentState];
    v11 = [v10 contextAfterInput];
    v8 = [v4 stringWithFormat:@"%@| <%@> %@", v7, v9, v11];
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIContextChangeEvent;
  id v4 = a3;
  [(TIUserAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSelection, @"isSelection", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_extendsPriorWord forKey:@"extendsPriorWord"];
  [v4 encodeObject:self->_inWord forKey:@"inWord"];
  [v4 encodeInteger:self->_inWordRange.location forKey:@"cursorLocation"];
  [v4 encodeInteger:self->_inWordRange.length forKey:@"cursorLength"];
  [v4 encodeInteger:self->_selectionLocation forKey:@"selectionLocation"];
}

- (TIContextChangeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIContextChangeEvent;
  objc_super v5 = [(TIUserAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_isSelection = [v4 decodeBoolForKey:@"isSelection"];
    v5->_extendsPriorWord = [v4 decodeBoolForKey:@"extendsPriorWord"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inWord"];
    inWord = v5->_inWord;
    v5->_inWord = (NSString *)v6;

    v5->_inWordRange.NSUInteger location = [v4 decodeIntegerForKey:@"cursorLocation"];
    v5->_inWordRange.NSUInteger length = [v4 decodeIntegerForKey:@"cursorLength"];
    v5->_selectionLocation = [v4 decodeIntegerForKey:@"selectionLocation"];
    [(TIUserAction *)v5 setActionType:2];
  }

  return v5;
}

- (TIContextChangeEvent)initWithTIKeyboardState:(id)a3 andActionType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)TIContextChangeEvent;
  objc_super v5 = [(TIUserAction *)&v8 initWithTIKeyboardState:a3];
  uint64_t v6 = v5;
  if (v5)
  {
    [(TIUserAction *)v5 setActionType:v4];
    v6->_inWordRange = (_NSRange)xmmword_1E4154B50;
    v6->_selectionLocation = -1;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end