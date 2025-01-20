@interface SUDelayedNavigationItem
- (BOOL)leftItemsSupplementBackButton;
- (BOOL)shouldDelayChanges;
- (SUDelayedNavigationItem)initWithNavigationItem:(id)a3;
- (SUNavigationItem)wrappedNavigationItem;
- (id)backButtonTitle;
- (id)leftBarButtonItem;
- (id)leftBarButtonItems;
- (id)navigationBar;
- (id)rightBarButtonItem;
- (id)rightBarButtonItems;
- (id)title;
- (id)titleView;
- (void)_prepareButtonItemForDisplay:(id)a3;
- (void)_scheduleCommit;
- (void)commitDelayedChanges;
- (void)dealloc;
- (void)setBackButtonTitle:(id)a3;
- (void)setHidesBackButton:(BOOL)a3;
- (void)setLeftBarButtonItem:(id)a3 animated:(BOOL)a4;
- (void)setLeftBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)setLeftItemsSupplementBackButton:(BOOL)a3;
- (void)setRightBarButtonItem:(id)a3 animated:(BOOL)a4;
- (void)setRightBarButtonItems:(id)a3 animated:(BOOL)a4;
- (void)setShouldDelayChanges:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setTitleView:(id)a3 animated:(BOOL)a4;
- (void)setWrappedNavigationItem:(id)a3;
@end

@implementation SUDelayedNavigationItem

- (SUDelayedNavigationItem)initWithNavigationItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUDelayedNavigationItem;
  v6 = [(SUDelayedNavigationItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedNavigationItem, a3);
  }

  return v7;
}

- (void)dealloc
{
  id delayedBackButtonTitle = self->_delayedBackButtonTitle;
  self->_id delayedBackButtonTitle = 0;

  id delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
  self->_id delayedLeftBarButtonItems = 0;

  delayedLeftItemsSupplementBackButton = self->_delayedLeftItemsSupplementBackButton;
  self->_delayedLeftItemsSupplementBackButton = 0;

  id delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
  self->_id delayedRightBarButtonItems = 0;

  id delayedTitle = self->_delayedTitle;
  self->_id delayedTitle = 0;

  id delayedTitleView = self->_delayedTitleView;
  self->_id delayedTitleView = 0;

  wrappedNavigationItem = self->_wrappedNavigationItem;
  self->_wrappedNavigationItem = 0;

  v10.receiver = self;
  v10.super_class = (Class)SUDelayedNavigationItem;
  [(SUDelayedNavigationItem *)&v10 dealloc];
}

- (void)commitDelayedChanges
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  v3 = [MEMORY[0x263F1CB68] transitionSafePerformer:self->_wrappedNavigationItem];
  [v3 setHidesBackButton:self->_delayedBackButtonHidden];
  id delayedBackButtonTitle = self->_delayedBackButtonTitle;
  if (delayedBackButtonTitle)
  {
    id v5 = [MEMORY[0x263EFF9D0] null];

    if (delayedBackButtonTitle == v5) {
      id v6 = 0;
    }
    else {
      id v6 = self->_delayedBackButtonTitle;
    }
    [v3 setBackButtonTitle:v6];
    id v7 = self->_delayedBackButtonTitle;
    self->_id delayedBackButtonTitle = 0;
  }
  delayedLeftItemsSupplementBackButton = self->_delayedLeftItemsSupplementBackButton;
  if (delayedLeftItemsSupplementBackButton)
  {
    objc_msgSend(v3, "setLeftItemsSupplementBackButton:", -[NSNumber BOOLValue](delayedLeftItemsSupplementBackButton, "BOOLValue"));
    objc_super v9 = self->_delayedLeftItemsSupplementBackButton;
    self->_delayedLeftItemsSupplementBackButton = 0;
  }
  id delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
  if (delayedLeftBarButtonItems)
  {
    id v11 = [MEMORY[0x263EFF9D0] null];

    if (delayedLeftBarButtonItems == v11)
    {
      v18 = v3;
      id v17 = 0;
    }
    else
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v12 = self->_delayedLeftBarButtonItems;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v43;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v43 != v15) {
              objc_enumerationMutation(v12);
            }
            [(SUDelayedNavigationItem *)self _prepareButtonItemForDisplay:*(void *)(*((void *)&v42 + 1) + 8 * v16++)];
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v14);
      }

      id v17 = self->_delayedLeftBarButtonItems;
      v18 = v3;
    }
    [v18 setLeftBarButtonItems:v17];
    id v19 = self->_delayedLeftBarButtonItems;
    self->_id delayedLeftBarButtonItems = 0;
  }
  id delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
  if (delayedRightBarButtonItems)
  {
    id v21 = [MEMORY[0x263EFF9D0] null];

    if (delayedRightBarButtonItems == v21)
    {
      id v27 = 0;
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v22 = self->_delayedRightBarButtonItems;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v39;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v39 != v25) {
              objc_enumerationMutation(v22);
            }
            -[SUDelayedNavigationItem _prepareButtonItemForDisplay:](self, "_prepareButtonItemForDisplay:", *(void *)(*((void *)&v38 + 1) + 8 * v26++), (void)v38);
          }
          while (v24 != v26);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v24);
      }

      id v27 = self->_delayedRightBarButtonItems;
    }
    objc_msgSend(v3, "setRightBarButtonItems:", v27, (void)v38);
    id v28 = self->_delayedRightBarButtonItems;
    self->_id delayedRightBarButtonItems = 0;
  }
  id delayedTitle = self->_delayedTitle;
  if (delayedTitle)
  {
    id v30 = [MEMORY[0x263EFF9D0] null];
    if (delayedTitle == v30) {
      id v31 = 0;
    }
    else {
      id v31 = self->_delayedTitle;
    }
    [v3 setTitle:v31];

    id v32 = self->_delayedTitle;
    self->_id delayedTitle = 0;
  }
  id delayedTitleView = self->_delayedTitleView;
  if (delayedTitleView)
  {
    id v34 = [MEMORY[0x263EFF9D0] null];
    if (delayedTitleView == v34) {
      id v35 = 0;
    }
    else {
      id v35 = self->_delayedTitleView;
    }
    id v36 = v35;

    if ([v36 conformsToProtocol:&unk_26DC29798]) {
      [v36 setDeferringInterfaceUpdates:0];
    }
    [v3 setTitleView:v36];
    id v37 = self->_delayedTitleView;
    self->_id delayedTitleView = 0;
  }
}

- (id)backButtonTitle
{
  id delayedBackButtonTitle = self->_delayedBackButtonTitle;
  if (delayedBackButtonTitle)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];

    if (delayedBackButtonTitle == v4) {
      id v5 = 0;
    }
    else {
      id v5 = self->_delayedBackButtonTitle;
    }
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      id v5 = [(SUNavigationItem *)wrappedNavigationItem backButtonTitle];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      id v5 = [(SUDelayedNavigationItem *)&v8 backButtonTitle];
    }
  }

  return v5;
}

- (id)leftBarButtonItem
{
  id delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
  if (delayedLeftBarButtonItems)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];

    if (delayedLeftBarButtonItems == v4)
    {
      id v5 = 0;
    }
    else
    {
      id v5 = (void *)[self->_delayedLeftBarButtonItems count];
      if (v5)
      {
        id v5 = [self->_delayedLeftBarButtonItems objectAtIndex:0];
      }
    }
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      id v5 = [(SUNavigationItem *)wrappedNavigationItem leftBarButtonItem];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      id v5 = [(SUDelayedNavigationItem *)&v8 leftBarButtonItem];
    }
  }

  return v5;
}

- (id)leftBarButtonItems
{
  id delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
  if (delayedLeftBarButtonItems)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];

    if (delayedLeftBarButtonItems == v4) {
      id v5 = 0;
    }
    else {
      id v5 = (void *)[self->_delayedLeftBarButtonItems copy];
    }
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      id v5 = [(SUNavigationItem *)wrappedNavigationItem leftBarButtonItems];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      id v5 = [(SUDelayedNavigationItem *)&v8 leftBarButtonItems];
    }
  }

  return v5;
}

- (BOOL)leftItemsSupplementBackButton
{
  if (self->_delayedLeftItemsSupplementBackButton)
  {
    delayedLeftItemsSupplementBackButton = self->_delayedLeftItemsSupplementBackButton;
    return [(NSNumber *)delayedLeftItemsSupplementBackButton BOOLValue];
  }
  else if (self->_wrappedNavigationItem)
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    return [(SUNavigationItem *)wrappedNavigationItem leftItemsSupplementBackButton];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUDelayedNavigationItem;
    return [(SUDelayedNavigationItem *)&v5 leftItemsSupplementBackButton];
  }
}

- (id)navigationBar
{
  v8.receiver = self;
  v8.super_class = (Class)SUDelayedNavigationItem;
  v3 = [(SUDelayedNavigationItem *)&v8 navigationBar];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SUNavigationItem *)self->_wrappedNavigationItem navigationBar];
  }
  id v6 = v5;

  return v6;
}

- (id)rightBarButtonItem
{
  id delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
  if (delayedRightBarButtonItems)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];

    if (delayedRightBarButtonItems == v4)
    {
      id v5 = 0;
    }
    else
    {
      id v5 = (void *)[self->_delayedRightBarButtonItems count];
      if (v5)
      {
        id v5 = [self->_delayedRightBarButtonItems lastObject];
      }
    }
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      id v5 = [(SUNavigationItem *)wrappedNavigationItem rightBarButtonItem];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      id v5 = [(SUDelayedNavigationItem *)&v8 rightBarButtonItem];
    }
  }

  return v5;
}

- (id)rightBarButtonItems
{
  id delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
  if (delayedRightBarButtonItems)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];

    if (delayedRightBarButtonItems == v4) {
      id v5 = 0;
    }
    else {
      id v5 = (void *)[self->_delayedRightBarButtonItems copy];
    }
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      id v5 = [(SUNavigationItem *)wrappedNavigationItem rightBarButtonItems];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      id v5 = [(SUDelayedNavigationItem *)&v8 rightBarButtonItems];
    }
  }

  return v5;
}

- (void)setBackButtonTitle:(id)a3
{
  id v10 = a3;
  if ([(SUDelayedNavigationItem *)self shouldDelayChanges])
  {
    id v4 = v10;
    if (v10)
    {
      if (self->_delayedBackButtonTitle == v10) {
        goto LABEL_9;
      }
      id v5 = (void *)[v10 copy];
      id delayedBackButtonTitle = self->_delayedBackButtonTitle;
      self->_id delayedBackButtonTitle = v5;
    }
    else
    {
      objc_super v8 = [MEMORY[0x263EFF9D0] null];
      id v9 = self->_delayedBackButtonTitle;
      self->_id delayedBackButtonTitle = v8;
    }
    [(SUDelayedNavigationItem *)self _scheduleCommit];
  }
  else
  {
    [(SUNavigationItem *)self->_wrappedNavigationItem setBackButtonTitle:v10];
    id v7 = self->_delayedBackButtonTitle;
    self->_id delayedBackButtonTitle = 0;
  }
  id v4 = v10;
LABEL_9:
}

- (void)setHidesBackButton:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUDelayedNavigationItem *)self shouldDelayChanges])
  {
    if (self->_delayedBackButtonHidden != v3)
    {
      self->_delayedBackButtonHidden = v3;
      [(SUDelayedNavigationItem *)self _scheduleCommit];
    }
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    [(SUNavigationItem *)wrappedNavigationItem setHidesBackButton:v3];
  }
}

- (void)setLeftBarButtonItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  if ([(SUDelayedNavigationItem *)self shouldDelayChanges])
  {
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
        id delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
        self->_id delayedLeftBarButtonItems = v6;
      }
      uint64_t v8 = [self->_delayedLeftBarButtonItems count];
      id v9 = self->_delayedLeftBarButtonItems;
      if (v8) {
        [v9 replaceObjectAtIndex:0 withObject:v13];
      }
      else {
        [v9 addObject:v13];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([self->_delayedLeftBarButtonItems count]) {
          [self->_delayedLeftBarButtonItems removeObjectAtIndex:0];
        }
      }
      else
      {
        id v11 = [MEMORY[0x263EFF9D0] null];
        id v12 = self->_delayedLeftBarButtonItems;
        self->_id delayedLeftBarButtonItems = v11;
      }
    }
    [(SUDelayedNavigationItem *)self _scheduleCommit];
  }
  else
  {
    [(SUNavigationItem *)self->_wrappedNavigationItem setLeftBarButtonItem:v13 animated:v4];
    id v10 = self->_delayedLeftBarButtonItems;
    self->_id delayedLeftBarButtonItems = 0;
  }
}

- (void)setLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  BOOL v6 = [(SUDelayedNavigationItem *)self shouldDelayChanges];
  wrappedNavigationItem = self->_wrappedNavigationItem;
  if (v6)
  {
    id v8 = [(SUNavigationItem *)wrappedNavigationItem leftBarButtonItems];
    if (v8 != v12 && ([v8 isEqualToArray:v12] & 1) == 0)
    {
      if (v12)
      {
        if (self->_delayedLeftBarButtonItems == v12) {
          goto LABEL_8;
        }
        id v9 = (void *)[v12 mutableCopy];
        id delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
        self->_id delayedLeftBarButtonItems = v9;
      }
      else
      {
        id v11 = [MEMORY[0x263EFF9D0] null];
        id delayedLeftBarButtonItems = self->_delayedLeftBarButtonItems;
        self->_id delayedLeftBarButtonItems = v11;
      }

      [(SUDelayedNavigationItem *)self _scheduleCommit];
    }
  }
  else
  {
    [(SUNavigationItem *)wrappedNavigationItem setLeftBarButtonItems:v12 animated:v4];
    id v8 = self->_delayedLeftBarButtonItems;
    self->_id delayedLeftBarButtonItems = 0;
  }
LABEL_8:
}

- (void)setLeftItemsSupplementBackButton:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUDelayedNavigationItem *)self shouldDelayChanges])
  {
    id v5 = (NSNumber *)[objc_alloc(NSNumber) initWithBool:v3];
    delayedLeftItemsSupplementBackButton = self->_delayedLeftItemsSupplementBackButton;
    self->_delayedLeftItemsSupplementBackButton = v5;

    [(SUDelayedNavigationItem *)self _scheduleCommit];
  }
  else
  {
    [(SUNavigationItem *)self->_wrappedNavigationItem setLeftItemsSupplementBackButton:v3];
    id v7 = self->_delayedLeftItemsSupplementBackButton;
    self->_delayedLeftItemsSupplementBackButton = 0;
  }
}

- (void)setRightBarButtonItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  if ([(SUDelayedNavigationItem *)self shouldDelayChanges])
  {
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
        id delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
        self->_id delayedRightBarButtonItems = v6;
      }
      uint64_t v8 = [self->_delayedRightBarButtonItems count];
      id v9 = self->_delayedRightBarButtonItems;
      if (v8) {
        [v9 replaceObjectAtIndex:0 withObject:v13];
      }
      else {
        [v9 addObject:v13];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([self->_delayedRightBarButtonItems count]) {
          [self->_delayedRightBarButtonItems removeObjectAtIndex:0];
        }
      }
      else
      {
        id v11 = [MEMORY[0x263EFF9D0] null];
        id v12 = self->_delayedRightBarButtonItems;
        self->_id delayedRightBarButtonItems = v11;
      }
    }
    [(SUDelayedNavigationItem *)self _scheduleCommit];
  }
  else
  {
    [(SUNavigationItem *)self->_wrappedNavigationItem setRightBarButtonItem:v13 animated:v4];
    id v10 = self->_delayedRightBarButtonItems;
    self->_id delayedRightBarButtonItems = 0;
  }
}

- (void)setRightBarButtonItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  BOOL v6 = [(SUDelayedNavigationItem *)self shouldDelayChanges];
  wrappedNavigationItem = self->_wrappedNavigationItem;
  if (v6)
  {
    id v8 = [(SUNavigationItem *)wrappedNavigationItem rightBarButtonItems];
    if (v8 != v12 && ([v8 isEqualToArray:v12] & 1) == 0)
    {
      if (v12)
      {
        if (self->_delayedRightBarButtonItems == v12) {
          goto LABEL_8;
        }
        id v9 = (void *)[v12 mutableCopy];
        id delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
        self->_id delayedRightBarButtonItems = v9;
      }
      else
      {
        id v11 = [MEMORY[0x263EFF9D0] null];
        id delayedRightBarButtonItems = self->_delayedRightBarButtonItems;
        self->_id delayedRightBarButtonItems = v11;
      }

      [(SUDelayedNavigationItem *)self _scheduleCommit];
    }
  }
  else
  {
    [(SUNavigationItem *)wrappedNavigationItem setRightBarButtonItems:v12 animated:v4];
    id v8 = self->_delayedRightBarButtonItems;
    self->_id delayedRightBarButtonItems = 0;
  }
LABEL_8:
}

- (void)setTitle:(id)a3
{
  id v8 = a3;
  if ([(SUDelayedNavigationItem *)self shouldDelayChanges])
  {
    BOOL v4 = v8;
    if (self->_delayedTitle == v8) {
      goto LABEL_9;
    }
    if (v8)
    {
      id v5 = (void *)[v8 copy];
    }
    else
    {
      id v5 = [MEMORY[0x263EFF9D0] null];
    }
    id delayedTitle = self->_delayedTitle;
    self->_id delayedTitle = v5;

    [(SUDelayedNavigationItem *)self _scheduleCommit];
  }
  else
  {
    [(SUNavigationItem *)self->_wrappedNavigationItem setTitle:v8];
    id v6 = self->_delayedTitle;
    self->_id delayedTitle = 0;
  }
  BOOL v4 = v8;
LABEL_9:
}

- (void)setTitleView:(id)a3
{
  id v9 = a3;
  if ([(SUDelayedNavigationItem *)self shouldDelayChanges])
  {
    BOOL v4 = v9;
    if (v9)
    {
      if (self->_delayedTitleView == v9) {
        goto LABEL_9;
      }
      id v5 = v9;
      id delayedTitleView = self->_delayedTitleView;
      self->_id delayedTitleView = v5;
    }
    else
    {
      id v8 = [MEMORY[0x263EFF9D0] null];
      id delayedTitleView = self->_delayedTitleView;
      self->_id delayedTitleView = v8;
    }

    [(SUDelayedNavigationItem *)self _scheduleCommit];
  }
  else
  {
    [(SUNavigationItem *)self->_wrappedNavigationItem setTitleView:v9];
    id v7 = self->_delayedTitleView;
    self->_id delayedTitleView = 0;
  }
  BOOL v4 = v9;
LABEL_9:
}

- (void)setTitleView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if ([(SUDelayedNavigationItem *)self shouldDelayChanges])
  {
    id v6 = v11;
    if (v11)
    {
      if (self->_delayedTitleView == v11) {
        goto LABEL_9;
      }
      id v7 = v11;
      id delayedTitleView = self->_delayedTitleView;
      self->_id delayedTitleView = v7;
    }
    else
    {
      id v10 = [MEMORY[0x263EFF9D0] null];
      id delayedTitleView = self->_delayedTitleView;
      self->_id delayedTitleView = v10;
    }

    [(SUDelayedNavigationItem *)self _scheduleCommit];
  }
  else
  {
    [(UINavigationItem *)self->_wrappedNavigationItem setTitleView:v11 animated:v4];
    id v9 = self->_delayedTitleView;
    self->_id delayedTitleView = 0;
  }
  id v6 = v11;
LABEL_9:
}

- (id)title
{
  id delayedTitle = self->_delayedTitle;
  if (delayedTitle)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];

    if (delayedTitle == v4) {
      id v5 = 0;
    }
    else {
      id v5 = self->_delayedTitle;
    }
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      id v5 = [(SUNavigationItem *)wrappedNavigationItem title];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      id v5 = [(SUDelayedNavigationItem *)&v8 title];
    }
  }

  return v5;
}

- (id)titleView
{
  id delayedTitleView = self->_delayedTitleView;
  if (delayedTitleView)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];

    if (delayedTitleView == v4) {
      id v5 = 0;
    }
    else {
      id v5 = self->_delayedTitleView;
    }
  }
  else
  {
    wrappedNavigationItem = self->_wrappedNavigationItem;
    if (wrappedNavigationItem)
    {
      id v5 = [(SUNavigationItem *)wrappedNavigationItem titleView];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)SUDelayedNavigationItem;
      id v5 = [(SUDelayedNavigationItem *)&v8 titleView];
    }
  }

  return v5;
}

- (void)_prepareButtonItemForDisplay:(id)a3
{
  id v3 = [a3 customView];
  if ([v3 conformsToProtocol:&unk_26DC29798]) {
    [v3 setDeferringInterfaceUpdates:0];
  }
}

- (void)_scheduleCommit
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_commitDelayedChanges object:0];
  if ([(SUDelayedNavigationItem *)self shouldDelayChanges])
  {
    [(SUDelayedNavigationItem *)self performSelector:sel_commitDelayedChanges withObject:0 afterDelay:0.35];
  }
  else
  {
    [(SUDelayedNavigationItem *)self commitDelayedChanges];
  }
}

- (BOOL)shouldDelayChanges
{
  return self->_shouldDelayChanges;
}

- (void)setShouldDelayChanges:(BOOL)a3
{
  self->_shouldDelayChanges = a3;
}

- (SUNavigationItem)wrappedNavigationItem
{
  return self->_wrappedNavigationItem;
}

- (void)setWrappedNavigationItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedNavigationItem, 0);
  objc_storeStrong(&self->_delayedRightBarButtonItems, 0);
  objc_storeStrong(&self->_delayedTitleView, 0);
  objc_storeStrong(&self->_delayedTitle, 0);
  objc_storeStrong((id *)&self->_delayedLeftItemsSupplementBackButton, 0);
  objc_storeStrong(&self->_delayedLeftBarButtonItems, 0);

  objc_storeStrong(&self->_delayedBackButtonTitle, 0);
}

@end