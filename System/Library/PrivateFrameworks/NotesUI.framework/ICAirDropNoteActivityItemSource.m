@interface ICAirDropNoteActivityItemSource
- (ICAirDropNoteActivityItemSource)initWithTitle:(id)a3 airDropDocumentCreator:(id)a4;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)airDropActivityItem;
- (id)airDropDocumentCreator;
- (void)setAirDropActivityItem:(id)a3;
- (void)setAirDropDocumentCreator:(id)a3;
@end

@implementation ICAirDropNoteActivityItemSource

- (ICAirDropNoteActivityItemSource)initWithTitle:(id)a3 airDropDocumentCreator:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICAirDropNoteActivityItemSource;
  v7 = [(ICNoteBaseActivityItemSource *)&v10 initWithTitle:a3];
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      [(ICAirDropNoteActivityItemSource *)v7 setAirDropDocumentCreator:v6];
    }
    else
    {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"airDropDocumentCreator" functionName:"-[ICAirDropNoteActivityItemSource initWithTitle:airDropDocumentCreator:]" simulateCrash:1 showAlert:0 format:@"airDropDocumentCreator is nil"];

      v8 = 0;
    }
  }

  return v8;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CB10]);
  return v3;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4F43590]])
  {
    v5 = [(ICAirDropNoteActivityItemSource *)self airDropActivityItem];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4F435A8]])
  {
    id v4 = [(id)*MEMORY[0x1E4F443B8] identifier];
  }
  else
  {
    id v4 = (id)*MEMORY[0x1E4F835A0];
  }
  return v4;
}

- (id)airDropActivityItem
{
  id airDropActivityItem = self->_airDropActivityItem;
  if (!airDropActivityItem)
  {
    id v4 = [(ICAirDropNoteActivityItemSource *)self airDropDocumentCreator];
    v5 = v4[2]();

    id v6 = [v5 activityItem];
    id v7 = self->_airDropActivityItem;
    self->_id airDropActivityItem = v6;

    id airDropActivityItem = self->_airDropActivityItem;
  }
  return airDropActivityItem;
}

- (id)airDropDocumentCreator
{
  return self->_airDropDocumentCreator;
}

- (void)setAirDropDocumentCreator:(id)a3
{
}

- (void)setAirDropActivityItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_airDropActivityItem, 0);
  objc_storeStrong(&self->_airDropDocumentCreator, 0);
}

@end