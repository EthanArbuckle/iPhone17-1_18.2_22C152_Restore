@interface MBDSMSToSuper_IMG_Frame
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDSMSToSuper_IMG_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v10 = a4;
  id v12 = MBDIMCopyNormalizedAttributes(a8, 1, 0);
  v11 = [v12 objectForKey:@"src"];
  [(MBDSMSToSuper_Default_Frame *)self _addAttachmentPartWithSource:v11 toContext:v10];
}

@end