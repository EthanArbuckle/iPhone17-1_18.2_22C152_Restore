@interface MBDHTMLToSuper_A_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDHTMLToSuper_A_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v15 = a4;
  id v10 = MBDIMCopyNormalizedAttributes(a8, 1, 0);
  v11 = [v10 objectForKey:@"href"];
  v12 = [v10 objectForKey:@"isrichlink"];
  if (v11)
  {
    id v13 = [objc_alloc((Class)NSURL) initWithString:v11];
    if (v13)
    {
      [v15 pushLink:v13];
      self->_shouldPopLink = 1;
    }
  }
  if (v12)
  {
    v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 BOOLValue]);
    [v15 pushIsRichLink:v14];
    self->_shouldPopIsRichLink = 1;
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (self->_shouldPopLink) {
    [v12 popLink];
  }
  if (self->_shouldPopIsRichLink) {
    [v12 popIsRichLink];
  }
}

@end