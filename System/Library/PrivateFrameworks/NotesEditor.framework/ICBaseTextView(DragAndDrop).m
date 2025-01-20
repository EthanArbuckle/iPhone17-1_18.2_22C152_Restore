@interface ICBaseTextView(DragAndDrop)
@end

@implementation ICBaseTextView(DragAndDrop)

+ (void)copyTmpFileToTmpFileInSubDirectory:()DragAndDrop uti:suggestedName:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = 0;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "Failed to copy URL from %@ to %@: %@", (uint8_t *)&v3, 0x20u);
}

+ (void)copyTmpFileToTmpFileInSubDirectory:()DragAndDrop uti:suggestedName:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_20BE60000, v0, v1, "Failed to create directory with error %@.", v2, v3, v4, v5, v6);
}

+ (void)copyTmpFileToTmpFileInSubDirectory:()DragAndDrop uti:suggestedName:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_20BE60000, v0, OS_LOG_TYPE_DEBUG, "Copy file: %@ => %@", v1, 0x16u);
}

- (void)textDraggableView:()DragAndDrop dragSessionWillBegin:.cold.1(void *a1)
{
  uint64_t v1 = [a1 editorController];
  uint64_t v2 = [v1 note];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v4, v5, "Drag will begin: %@", v6, v7, v8, v9, v10);
}

- (void)textDraggableView:()DragAndDrop dragSessionDidEnd:withOperation:.cold.1(void *a1)
{
  uint64_t v1 = [a1 editorController];
  uint64_t v2 = [v1 note];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v4, v5, "Drag did end: %@", v6, v7, v8, v9, v10);
}

- (void)textDroppableView:()DragAndDrop willPerformDrop:.cold.1(void *a1)
{
  uint64_t v1 = [a1 editorController];
  uint64_t v2 = [v1 note];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v4, v5, "Will perform drop: %@", v6, v7, v8, v9, v10);
}

- (void)textDroppableView:()DragAndDrop dropSessionDidEnter:.cold.1(void *a1)
{
  uint64_t v1 = [a1 editorController];
  uint64_t v2 = [v1 note];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v4, v5, "Drop did enter: %@", v6, v7, v8, v9, v10);
}

- (void)textDroppableView:()DragAndDrop dropSessionDidExit:.cold.1(void *a1)
{
  uint64_t v1 = [a1 editorController];
  uint64_t v2 = [v1 note];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v4, v5, "Drop did exit: %@", v6, v7, v8, v9, v10);
}

- (void)textDroppableView:()DragAndDrop dropSessionDidEnd:.cold.1(void *a1)
{
  uint64_t v1 = [a1 editorController];
  uint64_t v2 = [v1 note];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v4, v5, "Drop did end: %@", v6, v7, v8, v9, v10);
}

- (void)textPasteConfigurationSupporting:()DragAndDrop transformPasteItem:.cold.1(void *a1)
{
  uint64_t v1 = [a1 registeredTypeIdentifiers];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v2, v3, "Transform paste item types: %@", v4, v5, v6, v7, v8);
}

- (void)textPasteConfigurationSupporting:()DragAndDrop transformPasteItem:.cold.2(void *a1)
{
  uint64_t v1 = [a1 editorController];
  uint64_t v2 = [v1 note];
  uint64_t v3 = [v2 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20BE60000, v4, v5, "Transform paste item: %@", v6, v7, v8, v9, v10);
}

- (void)textPasteConfigurationSupporting:()DragAndDrop performPasteOfAttributedString:toRange:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Inserting dropped text end: %@", (uint8_t *)&v3, 0xCu);
}

- (void)textPasteConfigurationSupporting:()DragAndDrop performPasteOfAttributedString:toRange:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_20BE60000, log, OS_LOG_TYPE_DEBUG, "Filtering string for dropped text", v1, 2u);
}

- (void)textPasteConfigurationSupporting:()DragAndDrop performPasteOfAttributedString:toRange:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_20BE60000, v0, OS_LOG_TYPE_DEBUG, "Inserting dropped text begin to range: %@", v1, 0xCu);
}

- (void)textPasteConfigurationSupporting:()DragAndDrop performPasteOfAttributedString:toRange:.cold.4(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = [a1 editorController];
  uint64_t v4 = [v3 note];
  uint64_t v5 = [v4 shortLoggingDescription];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Perform paste: %@", v6, 0xCu);
}

@end