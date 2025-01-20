@interface _NSTextElementLocation
- (BOOL)isEqualToTextLocation:(id)a3;
- (NSTextElement)textElement;
- (NSTextLocation)baseLocation;
- (_NSTextElementLocation)initWithTextElement:(id)a3 baseLocation:(id)a4 offset:(int64_t)a5;
- (int64_t)compare:(id)a3;
- (int64_t)offset;
- (void)dealloc;
- (void)setTextElement:(id)a3;
- (void)updateBaseLocation;
@end

@implementation _NSTextElementLocation

- (_NSTextElementLocation)initWithTextElement:(id)a3 baseLocation:(id)a4 offset:(int64_t)a5
{
  uint64_t v9 = [a3 textContentManager];
  if (v9 && (v10 = (void *)v9, (objc_msgSend((id)objc_msgSend(a3, "elementRange"), "containsLocation:", a4) & 1) != 0))
  {
    v14.receiver = self;
    v14.super_class = (Class)_NSTextElementLocation;
    v11 = -[NSCountableTextLocation initWithIndex:](&v14, sel_initWithIndex_, objc_msgSend(v10, "offsetFromLocation:toLocation:", objc_msgSend((id)objc_msgSend(v10, "documentRange"), "location"), a4));
    v12 = v11;
    if (v11)
    {
      v11->_textElement = (NSTextElement *)a3;
      v11->_baseLocation = (NSTextLocation *)a4;
      v12->_offset = a5;
    }
  }
  else
  {

    return 0;
  }
  return v12;
}

- (void)dealloc
{
  self->_textElement = 0;

  self->_baseLocation = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSTextElementLocation;
  [(_NSTextElementLocation *)&v3 dealloc];
}

- (void)updateBaseLocation
{
  id v3 = [(NSTextRange *)[(NSTextElement *)self->_textElement elementRange] location];
  if (([(NSTextLocation *)self->_baseLocation isEqual:v3] & 1) == 0)
  {
    v4 = [(NSTextElement *)self->_textElement textContentManager];
    if (v4) {
      [(NSCountableTextLocation *)self setCharacterIndex:[(NSTextContentManager *)v4 offsetFromLocation:[(NSTextRange *)[(NSTextContentManager *)v4 documentRange] location] toLocation:v3]];
    }

    self->_baseLocation = (NSTextLocation *)v3;
  }
}

- (int64_t)compare:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_NSTextElementLocation;
  id v5 = -[NSCountableTextLocation compare:](&v10, sel_compare_);
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v6 = *((void *)a3 + 4);
    }
    else {
      int64_t v6 = 0;
    }
    int64_t offset = self->_offset;
    int64_t v8 = -1;
    if (offset >= v6) {
      int64_t v8 = 1;
    }
    if (v6 != offset) {
      return v8;
    }
  }
  return (int64_t)v5;
}

- (BOOL)isEqualToTextLocation:(id)a3
{
  return [(_NSTextElementLocation *)self compare:a3] == 0;
}

- (NSTextElement)textElement
{
  return self->_textElement;
}

- (void)setTextElement:(id)a3
{
  self->_textElement = (NSTextElement *)a3;
}

- (NSTextLocation)baseLocation
{
  return (NSTextLocation *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)offset
{
  return self->_offset;
}

@end