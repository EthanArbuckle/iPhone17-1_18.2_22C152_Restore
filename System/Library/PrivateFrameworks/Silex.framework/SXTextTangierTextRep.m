@interface SXTextTangierTextRep
- (BOOL)directlyManagesLayerContent;
- (Class)wpEditorClass;
- (id)supportedCustomRotors;
- (void)dealloc;
- (void)didUpdateLayer:(id)a3;
@end

@implementation SXTextTangierTextRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (Class)wpEditorClass
{
  return (Class)objc_opt_class();
}

- (void)didUpdateLayer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXTextTangierTextRep;
  id v3 = a3;
  [(SXTextTangierTextRep *)&v5 didUpdateLayer:v3];
  objc_msgSend(MEMORY[0x263F1C550], "clearColor", v5.receiver, v5.super_class);
  id v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
}

- (void)dealloc
{
  [(SXTextTangierTextRep *)self _accessibilityUnregister];
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierTextRep;
  [(SXTextTangierTextRep *)&v3 dealloc];
}

- (id)supportedCustomRotors
{
  return 0;
}

@end