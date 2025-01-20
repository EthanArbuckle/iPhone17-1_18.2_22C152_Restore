@interface SafariWebProcessPlugIn
- (id)additionalClassesForParameterCoder;
- (id)pageControllerWithBrowserContextController:(id)a3;
@end

@implementation SafariWebProcessPlugIn

- (id)pageControllerWithBrowserContextController:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v10 = objc_msgSend__groupIdentifier(v4, v5, v6, v7);
  }
  else
  {
    v13 = objc_msgSend_pageGroup(v4, v5, v6, v7);
    v10 = objc_msgSend_identifier(v13, v14, v15, v16);
  }
  if (objc_msgSend_isEqualToString_(v10, v8, *MEMORY[0x263F169C8], v9))
  {
    v17 = (Class *)0x263F169A8;
  }
  else
  {
    int isEqualToString = objc_msgSend_isEqualToString_(v10, v11, *MEMORY[0x263F66930], v12);
    v17 = (Class *)&off_264C96EE8;
    if (isEqualToString) {
      v17 = (Class *)0x263F66928;
    }
  }
  id v19 = objc_alloc(*v17);
  v21 = objc_msgSend_initWithPlugIn_contextController_(v19, v20, (uint64_t)self, (uint64_t)v4);

  return v21;
}

- (id)additionalClassesForParameterCoder
{
  return &unk_26E951C10;
}

@end