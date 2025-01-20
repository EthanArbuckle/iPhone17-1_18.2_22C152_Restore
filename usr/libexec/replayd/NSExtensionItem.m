@interface NSExtensionItem
+ (NSExtensionItem)itemWithTitle:(id)a3 attachmentItem:(id)a4;
@end

@implementation NSExtensionItem

+ (NSExtensionItem)itemWithTitle:(id)a3 attachmentItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSExtensionItem);
  id v8 = [objc_alloc((Class)NSAttributedString) initWithString:v6 attributes:0];

  [v7 setAttributedTitle:v8];
  id v9 = [objc_alloc((Class)NSItemProvider) initWithItem:v5 typeIdentifier:kUTTypeData];

  id v12 = v9;
  v10 = +[NSArray arrayWithObjects:&v12 count:1];
  [v7 setAttachments:v10];

  return (NSExtensionItem *)v7;
}

@end