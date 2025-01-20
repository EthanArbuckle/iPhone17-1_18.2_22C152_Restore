@interface _MFLazyPreviewActionItem
+ (id)previewActionItemWithTitle:(id)a3 dataSource:(id)a4;
- (BOOL)isKindOfClass:(Class)a3;
- (_MFLazyPreviewActionItemDataSource)dataSource;
- (id)_actions;
- (id)handler;
- (void)setDataSource:(id)a3;
@end

@implementation _MFLazyPreviewActionItem

+ (id)previewActionItemWithTitle:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  v7 = [a1 actionGroupWithTitle:a3 style:0 actions:&__NSArray0__struct];
  [v7 setDataSource:v6];

  return v7;
}

- (id)_actions
{
  v2 = [(_MFLazyPreviewActionItem *)self dataSource];
  v3 = [v2 lazyPreviewActions];

  return v3;
}

- (id)handler
{
  v2 = [(_MFLazyPreviewActionItem *)self dataSource];
  v3 = [v2 lazyPreviewActionHandler];

  return v3;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3)
  {
    v5 = [(_MFLazyPreviewActionItem *)self dataSource];
    id v6 = [v5 lazyPreviewActions];
    id v7 = [v6 count];

    if (!v7) {
      return 0;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)_MFLazyPreviewActionItem;
  return [(_MFLazyPreviewActionItem *)&v9 isKindOfClass:a3];
}

- (_MFLazyPreviewActionItemDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end