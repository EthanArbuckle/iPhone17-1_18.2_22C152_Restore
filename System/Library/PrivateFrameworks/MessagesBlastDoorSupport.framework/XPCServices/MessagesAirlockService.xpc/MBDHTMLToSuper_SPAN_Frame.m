@interface MBDHTMLToSuper_SPAN_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDHTMLToSuper_SPAN_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v17 = a4;
  id v10 = MBDIMCopyNormalizedAttributes(a8, 1, 0);
  v11 = [v10 objectForKey:@"style"];
  v12 = MBDIMCreateDictionaryFromCSSString(v11, 1);
  v13 = [v12 objectForKey:@"font-family"];
  v14 = [v12 objectForKey:@"font-style"];
  v15 = [v12 objectForKey:@"font-weight"];
  v16 = [v12 objectForKey:@"text-decoration"];
  if (v13)
  {
    [v17 pushFontFamily:v13];
    self->_shouldPopFontFamily = 1;
  }
  if (v15
    && ([v15 rangeOfString:@"bold" options:1] != (id)0x7FFFFFFFFFFFFFFFLL
     || (uint64_t)[v15 integerValue] >= 700))
  {
    [v17 incrementBoldCount];
    self->_shouldDecrementBoldCount = 1;
  }
  if (v14
    && ([v14 rangeOfString:@"italic" options:1] != (id)0x7FFFFFFFFFFFFFFFLL
     || [v14 rangeOfString:@"oblique" options:1] != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    [v17 incrementItalicCount];
    self->_shouldDecrementItalicCount = 1;
  }
  if (v16)
  {
    if ([v16 rangeOfString:@"under" options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v17 incrementUnderlineCount];
      self->_shouldDecrementUnderlineCount = 1;
    }
    if ([v16 rangeOfString:@"line-through" options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v17 incrementStrikethroughCount];
      self->_shouldDecrementStrikeCount = 1;
    }
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (self->_shouldPopFontFamily) {
    [v12 popFontFamily];
  }
  if (self->_shouldDecrementBoldCount) {
    [v12 decrementBoldCount];
  }
  if (self->_shouldDecrementItalicCount) {
    [v12 decrementItalicCount];
  }
  if (self->_shouldDecrementUnderlineCount) {
    [v12 decrementUnderlineCount];
  }
  if (self->_shouldDecrementStrikeCount) {
    [v12 decrementStrikethroughCount];
  }
}

@end