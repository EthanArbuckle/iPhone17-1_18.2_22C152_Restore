@interface MBDToSuperParserFrame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5;
@end

@implementation MBDToSuperParserFrame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v12 = a4;
  id v10 = a8;
  if ([v12 supportsMessagePartNumbersInAttributes])
  {
    v11 = [v10 _stringForKey:@"message-part"];
    if ([v11 length])
    {
      objc_msgSend(v12, "pushMessagePartNumber:", objc_msgSend(v11, "unsignedIntValue"));
      self->_didPushMessagePartNumber = 1;
    }
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  if (self->_didPushMessagePartNumber) {
    objc_msgSend(a4, "popMessagePartNumber", a3);
  }
}

- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5
{
}

@end