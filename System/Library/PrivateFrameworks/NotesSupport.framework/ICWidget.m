@interface ICWidget
+ (ICWidget)sharedWidget;
- (void)reloadTimelineForKind:(id)a3 reason:(id)a4;
- (void)reloadTimelinesWithReason:(id)a3;
@end

@implementation ICWidget

+ (ICWidget)sharedWidget
{
  if (sharedWidget_onceToken != -1) {
    dispatch_once(&sharedWidget_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)sharedWidget_sharedWidget;
  return (ICWidget *)v2;
}

uint64_t __24__ICWidget_sharedWidget__block_invoke()
{
  sharedWidget_sharedWidget = objc_alloc_init(ICWidget);
  return MEMORY[0x270F9A758]();
}

- (void)reloadTimelinesWithReason:(id)a3
{
  id v4 = a3;
  [(ICWidget *)self reloadTimelineForKind:@"com.apple.mobilenotes.FolderWidget" reason:v4];
  [(ICWidget *)self reloadTimelineForKind:@"com.apple.mobilenotes.NoteWidget" reason:v4];
  [(ICWidget *)self reloadTimelineForKind:@"com.apple.mobilenotes.QuickNoteWidget" reason:v4];
}

- (void)reloadTimelineForKind:(id)a3 reason:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v7 = (void *)getCHSTimelineControllerClass_softClass;
  uint64_t v17 = getCHSTimelineControllerClass_softClass;
  if (!getCHSTimelineControllerClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getCHSTimelineControllerClass_block_invoke;
    v13[3] = &unk_2640CD368;
    v13[4] = &v14;
    __getCHSTimelineControllerClass_block_invoke((uint64_t)v13);
    v7 = (void *)v15[3];
  }
  v8 = v7;
  _Block_object_dispose(&v14, 8);
  v9 = (void *)[[v8 alloc] initWithExtensionBundleIdentifier:@"com.apple.mobilenotes.WidgetExtension" kind:v5];
  v10 = [v9 reloadTimelineWithReason:v6];
  v11 = os_log_create("com.apple.notes", "Widget");
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ICWidget reloadTimelineForKind:reason:]((uint64_t)v5, (uint64_t)v10, v12);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[ICWidget reloadTimelineForKind:reason:]((uint64_t)v5, v12);
  }
}

- (void)reloadTimelineForKind:(uint64_t)a1 reason:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "Finished reloading Widget Extension timeline {kind: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)reloadTimelineForKind:(os_log_t)log reason:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_20C263000, log, OS_LOG_TYPE_ERROR, "Failed to reload Widget Extension timeline {kind %@, error: %@}", (uint8_t *)&v3, 0x16u);
}

@end