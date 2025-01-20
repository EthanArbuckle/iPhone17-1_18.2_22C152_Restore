@interface WebUIAlert
- (NSArray)buttonTitles;
- (NSArray)identities;
- (NSArray)titles;
- (NSString)bodyText;
- (NSString)title;
- (WebUIAlert)initWithType:(int)a3 title:(id)a4 bodyText:(id)a5 defaultAction:(int)a6 otherAction:(int)a7;
- (WebUIAlert)initWithType:(int)a3 title:(id)a4 bodyText:(id)a5 defaultAction:(int)a6 otherAction:(int)a7 tableAction:(int)a8;
- (WebUIAlert)initWithType:(int)a3 title:(id)a4 defaultAction:(int)a5 otherAction:(int)a6;
- (WebUIAlert)initWithType:(int)a3 title:(id)a4 defaultAction:(int)a5 otherAction:(int)a6 tableAction:(int)a7;
- (id)_buttonTitleForAction:(int)a3;
- (id)actionHandler;
- (id)context;
- (id)selectedIdentity;
- (int)actionForButtonTag:(int64_t)a3;
- (int)defaultAction;
- (int)hideAction;
- (int)tableAction;
- (int)type;
- (void)setActionHandler:(id)a3;
- (void)setContext:(id)a3;
- (void)setHideAction:(int)a3;
- (void)setIdentities:(id)a3;
- (void)setSelectedTableItemIndex:(int64_t)a3;
@end

@implementation WebUIAlert

- (WebUIAlert)initWithType:(int)a3 title:(id)a4 bodyText:(id)a5 defaultAction:(int)a6 otherAction:(int)a7 tableAction:(int)a8
{
  id v14 = a4;
  id v15 = a5;
  v23.receiver = self;
  v23.super_class = (Class)WebUIAlert;
  v16 = [(WebUIAlert *)&v23 init];
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    uint64_t v18 = [v14 copy];
    title = v17->_title;
    v17->_title = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    bodyText = v17->_bodyText;
    v17->_bodyText = (NSString *)v20;

    v17->_otherAction = a7;
    v17->_defaultAction = a6;
    v17->_tableAction = a8;
    v17->_hideAction = a6;
  }

  return v17;
}

- (WebUIAlert)initWithType:(int)a3 title:(id)a4 defaultAction:(int)a5 otherAction:(int)a6 tableAction:(int)a7
{
  return [(WebUIAlert *)self initWithType:*(void *)&a3 title:a4 bodyText:0 defaultAction:*(void *)&a5 otherAction:*(void *)&a6 tableAction:*(void *)&a7];
}

- (WebUIAlert)initWithType:(int)a3 title:(id)a4 bodyText:(id)a5 defaultAction:(int)a6 otherAction:(int)a7
{
  return [(WebUIAlert *)self initWithType:*(void *)&a3 title:a4 bodyText:a5 defaultAction:*(void *)&a6 otherAction:*(void *)&a7 tableAction:0];
}

- (WebUIAlert)initWithType:(int)a3 title:(id)a4 defaultAction:(int)a5 otherAction:(int)a6
{
  return [(WebUIAlert *)self initWithType:*(void *)&a3 title:a4 bodyText:0 defaultAction:*(void *)&a5 otherAction:*(void *)&a6 tableAction:0];
}

- (id)_buttonTitleForAction:(int)a3
{
  switch(a3)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
      v4 = _WBSLocalizedString();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (NSArray)buttonTitles
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_otherAction)
  {
    v4 = -[WebUIAlert _buttonTitleForAction:](self, "_buttonTitleForAction:");
    [v3 addObject:v4];
  }
  if (self->_defaultAction)
  {
    v5 = -[WebUIAlert _buttonTitleForAction:](self, "_buttonTitleForAction:");
    [v3 addObject:v5];
  }
  return (NSArray *)v3;
}

- (int)actionForButtonTag:(int64_t)a3
{
  if (a3 == 1) {
    return self->_defaultAction;
  }
  if (a3) {
    return 0;
  }
  int otherAction = self->_otherAction;
  if (!otherAction) {
    return self->_defaultAction;
  }
  return otherAction;
}

- (void)setIdentities:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (NSArray *)[v4 copy];
  identities = self->_identities;
  self->_identities = v5;

  if ((unint64_t)[v4 count] >= 2)
  {
    v7 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(__SecIdentity **)(*((void *)&v18 + 1) + 8 * v12);
          SecCertificateRef certificateRef = 0;
          if (!SecIdentityCopyCertificate(v13, &certificateRef))
          {
            CFStringRef v14 = SecCertificateCopySubjectSummary(certificateRef);
            if (v14)
            {
              id v15 = (__CFString *)v14;
              [(NSArray *)v7 addObject:v14];
            }
            CFRelease(certificateRef);
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    titles = self->_titles;
    self->_titles = v7;
  }
}

- (void)setSelectedTableItemIndex:(int64_t)a3
{
  self->_indexOfSelectedIdentity = a3;
}

- (id)selectedIdentity
{
  if ([(NSArray *)self->_identities count] == 1)
  {
    id v3 = [(NSArray *)self->_identities firstObject];
  }
  else
  {
    unint64_t indexOfSelectedIdentity = self->_indexOfSelectedIdentity;
    if ((indexOfSelectedIdentity & 0x8000000000000000) != 0
      || indexOfSelectedIdentity >= [(NSArray *)self->_identities count])
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [(NSArray *)self->_identities objectAtIndexedSubscript:self->_indexOfSelectedIdentity];
    }
  }
  return v3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (int)defaultAction
{
  return self->_defaultAction;
}

- (int)tableAction
{
  return self->_tableAction;
}

- (int)hideAction
{
  return self->_hideAction;
}

- (void)setHideAction:(int)a3
{
  self->_hideAction = a3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)identities
{
  return self->_identities;
}

- (NSArray)titles
{
  return self->_titles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end