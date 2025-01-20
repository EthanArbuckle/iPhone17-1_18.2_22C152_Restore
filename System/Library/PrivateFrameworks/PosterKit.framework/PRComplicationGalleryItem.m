@interface PRComplicationGalleryItem
- (BOOL)isEqual:(id)a3;
- (PRComplicationGalleryItem)initWithApplicationWidgetCollection:(id)a3;
- (PRComplicationGalleryItem)initWithWidgetItem:(id)a3;
- (PRComplicationGalleryWidgetItem)widgetItem;
- (SBHApplicationWidgetCollection)applicationWidgetCollection;
- (id)description;
- (unint64_t)hash;
@end

@implementation PRComplicationGalleryItem

- (PRComplicationGalleryItem)initWithWidgetItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRComplicationGalleryItem;
  v6 = [(PRComplicationGalleryItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_widgetItem, a3);
  }

  return v7;
}

- (PRComplicationGalleryItem)initWithApplicationWidgetCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRComplicationGalleryItem;
  v6 = [(PRComplicationGalleryItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_applicationWidgetCollection, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  widgetItem = self->_widgetItem;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __37__PRComplicationGalleryItem_isEqual___block_invoke;
  v18[3] = &unk_1E54DB0E8;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:widgetItem counterpart:v18];
  applicationWidgetCollection = self->_applicationWidgetCollection;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __37__PRComplicationGalleryItem_isEqual___block_invoke_2;
  v16 = &unk_1E54DB0E8;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:applicationWidgetCollection counterpart:&v13];
  LOBYTE(applicationWidgetCollection) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)applicationWidgetCollection;
}

id __37__PRComplicationGalleryItem_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __37__PRComplicationGalleryItem_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_widgetItem];
  id v5 = (id)[v3 appendObject:self->_applicationWidgetCollection];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_widgetItem withName:@"widgetItem" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_applicationWidgetCollection withName:@"applicationWidgetCollection" skipIfNil:1];
  unint64_t v6 = [v3 build];

  return v6;
}

- (PRComplicationGalleryWidgetItem)widgetItem
{
  return self->_widgetItem;
}

- (SBHApplicationWidgetCollection)applicationWidgetCollection
{
  return self->_applicationWidgetCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationWidgetCollection, 0);
  objc_storeStrong((id *)&self->_widgetItem, 0);
}

@end