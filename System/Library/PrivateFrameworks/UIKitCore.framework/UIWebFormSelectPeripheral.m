@interface UIWebFormSelectPeripheral
+ (id)createPeripheralWithDOMHTMLSelectElement:(id)a3;
- (DOMHTMLSelectElement)_selectionNode;
- (UIWebFormControl)_selectControl;
- (UIWebFormSelectPeripheral)initWithDOMHTMLSelectElement:(id)a3;
- (id)assistantView;
- (void)beginEditing;
- (void)dealloc;
- (void)endEditing;
- (void)set_selectControl:(id)a3;
- (void)set_selectionNode:(id)a3;
@end

@implementation UIWebFormSelectPeripheral

- (UIWebFormSelectPeripheral)initWithDOMHTMLSelectElement:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)UIWebFormSelectPeripheral;
  v4 = [(UIWebFormSelectPeripheral *)&v24 init];
  v5 = v4;
  if (v4)
  {
    id v23 = a3;
    [(UIWebFormSelectPeripheral *)v4 set_selectionNode:a3];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    WebThreadLock();
    uint64_t v7 = [(DOMHTMLSelectElement *)v5->_selectionNode multiple];
    unsigned int v8 = [(DOMHTMLSelectElement *)v5->_selectionNode completeLength];
    if (v8)
    {
      uint64_t v9 = 0;
      int v10 = 0;
      v11 = 0;
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v13 = v8;
      do
      {
        v14 = objc_msgSend((id)-[DOMHTMLSelectElement listItemAtIndex:](v5->_selectionNode, "listItemAtIndex:", v9), "createSelectedItem");
        if (v14)
        {
          v15 = v14;
          int v16 = [v14 isGroup];
          if ((v7 & 1) == 0)
          {
            int v17 = [v15 selected];
            if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v18 = v9;
            }
            else {
              uint64_t v18 = v12;
            }
            if (v17)
            {
              uint64_t v12 = v18;
              v11 = v15;
            }
          }
          v10 |= v16;
          [v6 addObject:v15];
        }
        ++v9;
      }
      while (v13 != v9);
    }
    else
    {
      v11 = 0;
      int v10 = 0;
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v19 = [UIWebSelectPopover alloc];
      id v20 = v23;
    }
    else
    {
      if (((v7 | v10) & 1) == 0)
      {
        v21 = [[UIWebSelectSinglePicker alloc] initWithDOMHTMLSelectElement:v23 allItems:v6];
        goto LABEL_21;
      }
      v19 = [UIWebSelectMultiplePicker alloc];
      id v20 = v23;
    }
    v21 = [(UIWebSelectPopover *)v19 initWithDOMHTMLSelectElement:v20 cachedItems:v6 singleSelectionItem:v11 singleSelectionIndex:v12 multipleSelection:v7];
LABEL_21:
    [(UIWebFormSelectPeripheral *)v5 set_selectControl:v21];
  }
  return v5;
}

+ (id)createPeripheralWithDOMHTMLSelectElement:(id)a3
{
  v3 = [[UIWebFormSelectPeripheral alloc] initWithDOMHTMLSelectElement:a3];
  return v3;
}

- (void)dealloc
{
  [(UIWebFormSelectPeripheral *)self set_selectionNode:0];
  [(UIWebFormSelectPeripheral *)self set_selectControl:0];
  v3.receiver = self;
  v3.super_class = (Class)UIWebFormSelectPeripheral;
  [(UIWebFormSelectPeripheral *)&v3 dealloc];
}

- (id)assistantView
{
  return (id)[(UIWebFormControl *)self->_selectControl controlView];
}

- (void)beginEditing
{
}

- (void)endEditing
{
}

- (DOMHTMLSelectElement)_selectionNode
{
  return self->_selectionNode;
}

- (void)set_selectionNode:(id)a3
{
}

- (UIWebFormControl)_selectControl
{
  return self->_selectControl;
}

- (void)set_selectControl:(id)a3
{
}

@end