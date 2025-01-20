@interface PKStrokeSelectionCoherence
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
@end

@implementation PKStrokeSelectionCoherence

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return (NSArray *)[MEMORY[0x263F14BD8] readableTypeIdentifiersForItemProvider];
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x263F14BD8];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 objectWithItemProviderData:v9 typeIdentifier:v8 drawingClass:objc_opt_class() error:a5];

  return v10;
}

@end