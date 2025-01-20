@interface MFOutgoingRichtextMessageContent
- (BOOL)textPartsAreHTML;
- (MFPlainTextDocument)plaintextAlternative;
- (NSArray)mixedContent;
- (id)copy;
- (void)dealloc;
- (void)setMixedContent:(id)a3;
- (void)setPlaintextAlternative:(id)a3;
- (void)setTextPartsAreHTML:(BOOL)a3;
@end

@implementation MFOutgoingRichtextMessageContent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingRichtextMessageContent;
  [(MFOutgoingMessageContent *)&v3 dealloc];
}

- (id)copy
{
  v5.receiver = self;
  v5.super_class = (Class)MFOutgoingRichtextMessageContent;
  id v3 = [(MFOutgoingMessageContent *)&v5 copy];
  [v3 setPlaintextAlternative:self->_plaintextAlternative];
  [v3 setMixedContent:self->_mixedContent];
  return v3;
}

- (BOOL)textPartsAreHTML
{
  return self->_textPartsAreHTML;
}

- (void)setTextPartsAreHTML:(BOOL)a3
{
  self->_textPartsAreHTML = a3;
}

- (MFPlainTextDocument)plaintextAlternative
{
  return self->_plaintextAlternative;
}

- (void)setPlaintextAlternative:(id)a3
{
}

- (NSArray)mixedContent
{
  return self->_mixedContent;
}

- (void)setMixedContent:(id)a3
{
}

@end