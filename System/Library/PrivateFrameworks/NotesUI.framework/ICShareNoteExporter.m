@interface ICShareNoteExporter
- (NSURL)exportDirectory;
- (id)exportRTFDFileFromNote:(id)a3;
- (id)fileWrapperForNote:(id)a3;
- (id)filenameFromTitle:(id)a3;
- (void)cleanUpExportedFiles;
- (void)setExportDirectory:(id)a3;
@end

@implementation ICShareNoteExporter

- (NSURL)exportDirectory
{
  exportDirectory = self->_exportDirectory;
  if (!exportDirectory)
  {
    v4 = (void *)MEMORY[0x1E4F1CB10];
    v5 = NSTemporaryDirectory();
    v6 = [v4 fileURLWithPath:v5];
    v7 = [v6 URLByAppendingPathComponent:@"export" isDirectory:1];

    v8 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v8 UUIDString];
    v10 = [v7 URLByAppendingPathComponent:v9 isDirectory:1];
    v11 = self->_exportDirectory;
    self->_exportDirectory = v10;

    exportDirectory = self->_exportDirectory;
  }
  return exportDirectory;
}

- (id)exportRTFDFileFromNote:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 isSharable])
    {
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__38;
      v35 = __Block_byref_object_dispose__38;
      id v36 = 0;
      v6 = [MEMORY[0x1E4F83428] sharedContext];
      v7 = [v6 snapshotManagedObjectContext];

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __46__ICShareNoteExporter_exportRTFDFileFromNote___block_invoke;
      v26[3] = &unk_1E5FDA508;
      id v27 = v5;
      id v8 = v7;
      id v28 = v8;
      v29 = self;
      v30 = &v31;
      [v8 performBlockAndWait:v26];
      id v9 = (id)v32[5];

      _Block_object_dispose(&v31, 8);
      goto LABEL_9;
    }
    v10 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ICShareNoteExporter exportRTFDFileFromNote:](v10, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ICShareNoteExporter exportRTFDFileFromNote:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  id v9 = 0;
LABEL_9:

  return v9;
}

void __46__ICShareNoteExporter_exportRTFDFileFromNote___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F83418];
  v3 = [*(id *)(a1 + 32) objectID];
  id v4 = objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, *(void *)(a1 + 40));

  v5 = [*(id *)(a1 + 48) fileWrapperForNote:v4];
  if (v5)
  {
    v6 = [v4 title];
    if (v6)
    {
      v7 = [*(id *)(a1 + 48) filenameFromTitle:v6];
    }
    else
    {
      v7 = @"Note.rtfd";
    }
    uint64_t v15 = [*(id *)(a1 + 48) exportDirectory];
    uint64_t v16 = [v15 URLByAppendingPathComponent:v7 isDirectory:0];
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v25 = 0;
    char v20 = [v5 writeToURL:v19 options:1 originalContentsURL:0 error:&v25];
    id v21 = v25;
    if ((v20 & 1) == 0)
    {
      uint64_t v22 = os_log_create("com.apple.notes", "Export");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __46__ICShareNoteExporter_exportRTFDFileFromNote___block_invoke_cold_2(v21);
      }

      uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = 0;
    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __46__ICShareNoteExporter_exportRTFDFileFromNote___block_invoke_cold_1(v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)cleanUpExportedFiles
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a1 exportDirectory];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_ERROR, "Failed to remove export directory: %@, %@", (uint8_t *)&v6, 0x16u);
}

- (id)fileWrapperForNote:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 textStorage];
  uint64_t v5 = [v4 filterSubstringAttributes];
  [v4 setFilterSubstringAttributes:1];
  int v6 = [v3 textStorage];
  uint64_t v7 = [v6 length];

  objc_msgSend(v3, "filterAttachmentsInTextStorage:range:", v4, 0, v7);
  __int16 v8 = objc_msgSend(v4, "attributedSubstringFromRange:", 0, v7);
  [v4 setFilterSubstringAttributes:v5];
  uint64_t v9 = [v8 length];
  uint64_t v16 = *MEMORY[0x1E4FB06D8];
  v17[0] = *MEMORY[0x1E4FB0748];
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v15 = 0;
  uint64_t v11 = objc_msgSend(v8, "fileWrapperFromRange:documentAttributes:error:", 0, v9, v10, &v15);
  id v12 = v15;

  if (v12)
  {
    uint64_t v13 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ICShareNoteExporter fileWrapperForNote:](v12);
    }
  }
  return v11;
}

- (id)filenameFromTitle:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!filenameFromTitle__invalidCharacters)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"/", @":", 0);
    uint64_t v5 = (void *)filenameFromTitle__invalidCharacters;
    filenameFromTitle__invalidCharacters = v4;
  }
  int v6 = (void *)[v3 mutableCopy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = (id)filenameFromTitle__invalidCharacters;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", *(void *)(*((void *)&v17 + 1) + 8 * i), @" ", 0, 0, objc_msgSend(v3, "length"));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  id v12 = (void *)[v6 copy];
  if ((unint64_t)[v12 length] >= 0x100)
  {
    uint64_t v13 = objc_msgSend(v12, "substringWithRange:", 0, 255);
    uint64_t v14 = [v13 mutableCopy];

    id v12 = (void *)v14;
  }
  id v15 = [v12 stringByAppendingPathExtension:@"rtfd"];

  return v15;
}

- (void)setExportDirectory:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)exportRTFDFileFromNote:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)exportRTFDFileFromNote:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__ICShareNoteExporter_exportRTFDFileFromNote___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__ICShareNoteExporter_exportRTFDFileFromNote___block_invoke_cold_2(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_1B08EB000, v2, v3, "Error writing out file for note export: %@", v4, v5, v6, v7, 2u);
}

- (void)fileWrapperForNote:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_1B08EB000, v2, v3, "Error creating file wrapper for note export: %@", v4, v5, v6, v7, 2u);
}

@end