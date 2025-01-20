@interface WFAction(Pasteboard)
+ (id)objectWithItemProviderData:()Pasteboard typeIdentifier:error:;
+ (id)readableTypeIdentifiersForItemProvider;
+ (id)writableTypeIdentifiersForItemProvider;
- (uint64_t)loadDataWithTypeIdentifier:()Pasteboard forItemProviderCompletionHandler:;
@end

@implementation WFAction(Pasteboard)

- (uint64_t)loadDataWithTypeIdentifier:()Pasteboard forItemProviderCompletionHandler:
{
  v5 = (void *)MEMORY[0x263F08AC0];
  v6 = a4;
  v7 = [a1 serializedRepresentation];
  id v11 = 0;
  v8 = [v5 dataWithPropertyList:v7 format:200 options:0 error:&v11];
  id v9 = v11;

  v6[2](v6, v8, v9);
  return 0;
}

+ (id)objectWithItemProviderData:()Pasteboard typeIdentifier:error:
{
  v5 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:a5];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263F86860];
    v7 = [MEMORY[0x263F86898] sharedRegistry];
    v8 = [v6 actionFromSerializedRepresentation:v5 actionRegistry:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F1D920] exportedTypeWithIdentifier:@"com.apple.shortcuts.action"];
  v1 = [v0 identifier];
  v4[0] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)readableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F1D920] exportedTypeWithIdentifier:@"com.apple.shortcuts.action"];
  v1 = [v0 identifier];
  v4[0] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

@end