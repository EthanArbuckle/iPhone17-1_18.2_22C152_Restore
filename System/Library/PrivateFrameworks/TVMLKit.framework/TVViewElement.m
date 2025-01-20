@interface TVViewElement
- (BOOL)isDisabled;
- (BOOL)isParsedOnce;
- (IKViewElement)element;
- (NSArray)childViewElements;
- (NSDictionary)attributes;
- (NSDictionary)elementData;
- (NSString)autoHighlightIdentifier;
- (NSString)elementIdentifier;
- (NSString)elementName;
- (TVViewElement)initWithViewElement:(id)a3;
- (TVViewElement)parentViewElement;
- (TVViewElementStyle)style;
- (int64_t)semanticContentAttribute;
- (int64_t)updateType;
- (void)dispatchEventOfType:(int64_t)a3 canBubble:(BOOL)a4 cancellable:(BOOL)a5 extraInfo:(id)a6 completion:(id)a7;
- (void)dispatchEventWithName:(id)a3 canBubble:(BOOL)a4 cancellable:(BOOL)a5 extraInfo:(id)a6 completion:(id)a7;
- (void)resetProperty:(int64_t)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setParsedOnce:(BOOL)a3;
@end

@implementation TVViewElement

- (TVViewElement)initWithViewElement:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TVViewElement;
  v5 = [(TVViewElement *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_element, v4);
  }

  return v6;
}

- (NSDictionary)elementData
{
  v2 = [(TVViewElement *)self element];
  v3 = [v2 dataDictionary];

  return (NSDictionary *)v3;
}

- (NSString)elementIdentifier
{
  v2 = [(TVViewElement *)self element];
  v3 = [v2 elementID];

  return (NSString *)v3;
}

- (NSString)elementName
{
  v2 = [(TVViewElement *)self element];
  v3 = [v2 elementName];

  return (NSString *)v3;
}

- (TVViewElement)parentViewElement
{
  v2 = [(TVViewElement *)self element];
  v3 = [v2 parent];
  id v4 = objc_msgSend(v3, "tv_associatedViewElement");

  return (TVViewElement *)v4;
}

- (NSArray)childViewElements
{
  v2 = [(TVViewElement *)self element];
  v3 = [v2 children];
  id v4 = [v3 valueForKey:@"tv_associatedViewElement"];

  return (NSArray *)v4;
}

- (NSDictionary)attributes
{
  v2 = [(TVViewElement *)self element];
  v3 = [v2 attributes];

  return (NSDictionary *)v3;
}

- (TVViewElementStyle)style
{
  v2 = [(TVViewElement *)self element];
  v3 = [v2 style];
  id v4 = objc_msgSend(v3, "tv_associatedViewElementStyle");

  return (TVViewElementStyle *)v4;
}

- (NSString)autoHighlightIdentifier
{
  v2 = [(TVViewElement *)self element];
  v3 = [v2 autoHighlightIdentifier];

  return (NSString *)v3;
}

- (BOOL)isDisabled
{
  v2 = [(TVViewElement *)self element];
  char v3 = [v2 isDisabled];

  return v3;
}

- (int64_t)semanticContentAttribute
{
  v2 = [(TVViewElement *)self element];
  int64_t v3 = objc_msgSend(v2, "tv_semanticContentAttribute");

  return v3;
}

- (int64_t)updateType
{
  int v3 = dyld_program_sdk_at_least();
  id v4 = [(TVViewElement *)self element];
  uint64_t v5 = [v4 updateType];

  switch(v5)
  {
    case 1:
      int64_t result = 1;
      break;
    case 2:
      if (v3) {
        int64_t result = 2;
      }
      else {
        int64_t result = 4;
      }
      break;
    case 3:
      BOOL v7 = v3 == 0;
      int64_t v8 = 2;
      goto LABEL_9;
    case 4:
      BOOL v7 = v3 == 0;
      int64_t v8 = 3;
LABEL_9:
      if (v7) {
        int64_t result = v8;
      }
      else {
        int64_t result = v8 + 1;
      }
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (void)resetProperty:(int64_t)a3
{
  if (a3) {
    uint64_t v3 = 2 * (a3 == 1);
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = [(TVViewElement *)self element];
  [v4 resetProperty:v3];
}

- (void)dispatchEventOfType:(int64_t)a3 canBubble:(BOOL)a4 cancellable:(BOOL)a5 extraInfo:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  if ((unint64_t)(a3 - 1) > 4) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = qword_230C38448[a3 - 1];
  }
  id v12 = a7;
  id v13 = a6;
  id v14 = [(TVViewElement *)self element];
  [v14 dispatchEventOfType:v11 canBubble:v9 isCancelable:v8 extraInfo:v13 completionBlock:v12];
}

- (void)dispatchEventWithName:(id)a3 canBubble:(BOOL)a4 cancellable:(BOOL)a5 extraInfo:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = [(TVViewElement *)self element];
  [v15 dispatchEvent:v14 eventAttribute:0 canBubble:v9 isCancelable:v8 extraInfo:v13 completionBlock:v12];
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (IKViewElement)element
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_element);
  return (IKViewElement *)WeakRetained;
}

- (BOOL)isParsedOnce
{
  return self->_parsedOnce;
}

- (void)setParsedOnce:(BOOL)a3
{
  self->_parsedOnce = a3;
}

- (void).cxx_destruct
{
}

@end