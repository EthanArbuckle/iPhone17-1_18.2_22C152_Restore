@interface MBDHTMLToSuper_FONT_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDHTMLToSuper_FONT_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MBDHTMLToSuper_FONT_Frame;
  id v15 = a8;
  [(MBDToSuperParserFrame *)&v18 parser:a3 context:v14 didStartElement:a5 namespaceURI:a6 qualifiedName:a7 attributes:v15];
  id v16 = MBDIMCopyNormalizedAttributes(v15, 1, 0);

  v17 = [v16 objectForKey:@"face"];
  if (v17)
  {
    [v14 pushFontFamily:v17];
    *(&self->super.super._didPushMessagePartNumber + 1) = 1;
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  id v12 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MBDHTMLToSuper_FONT_Frame;
  [(MBDToSuperParserFrame *)&v13 parser:a3 context:v12 didEndElement:a5 namespaceURI:a6 qualifiedName:a7];
  if (*(&self->super.super._didPushMessagePartNumber + 1)) {
    [v12 popFontFamily];
  }
  if (*(&self->super.super._didPushMessagePartNumber + 2)) {
    [v12 popFontSize];
  }
}

@end