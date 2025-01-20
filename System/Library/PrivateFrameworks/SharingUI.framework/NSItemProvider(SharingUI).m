@interface NSItemProvider(SharingUI)
- (void)sfui_loadAttributedStringForTypeIdentifier:()SharingUI completionHandler:;
@end

@implementation NSItemProvider(SharingUI)

- (void)sfui_loadAttributedStringForTypeIdentifier:()SharingUI completionHandler:
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__NSItemProvider_SharingUI__sfui_loadAttributedStringForTypeIdentifier_completionHandler___block_invoke;
  v8[3] = &unk_264472068;
  id v9 = v6;
  id v7 = v6;
  [a1 loadItemForTypeIdentifier:a3 options:0 completionHandler:v8];
}

@end