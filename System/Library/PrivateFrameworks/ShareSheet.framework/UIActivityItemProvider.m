@interface UIActivityItemProvider
- (BOOL)_shouldExecuteItemOperationForActivity:(id)a3;
- (UIActivityItemProvider)init;
- (UIActivityItemProvider)initWithPlaceholderItem:(id)placeholderItem;
- (UIActivityType)activityType;
- (id)item;
- (id)placeholderItem;
- (id)providedItem;
- (void)_setActivityType:(id)a3;
- (void)main;
- (void)setPlaceholderItem:(id)a3;
- (void)setProvidedItem:(id)a3;
@end

@implementation UIActivityItemProvider

- (UIActivityItemProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIActivityItemProvider;
  return [(UIActivityItemProvider *)&v3 init];
}

- (UIActivityItemProvider)initWithPlaceholderItem:(id)placeholderItem
{
  id v4 = placeholderItem;
  v8.receiver = self;
  v8.super_class = (Class)UIActivityItemProvider;
  v5 = [(UIActivityItemProvider *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(UIActivityItemProvider *)v5 setPlaceholderItem:v4];
    [(UIActivityItemProvider *)v6 setProvidedItem:v4];
  }

  return v6;
}

- (id)item
{
  return 0;
}

- (void)main
{
  id v3 = [(UIActivityItemProvider *)self item];
  [(UIActivityItemProvider *)self setProvidedItem:v3];
}

- (BOOL)_shouldExecuteItemOperationForActivity:(id)a3
{
  return 1;
}

- (id)placeholderItem
{
  return self->_placeholderItem;
}

- (void)setPlaceholderItem:(id)a3
{
}

- (UIActivityType)activityType
{
  return self->_activityType;
}

- (void)_setActivityType:(id)a3
{
}

- (id)providedItem
{
  return self->_providedItem;
}

- (void)setProvidedItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_providedItem, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong(&self->_placeholderItem, 0);
}

@end