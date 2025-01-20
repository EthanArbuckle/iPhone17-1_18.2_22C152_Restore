@interface ICHTMLSearchIndexerDataSource
@end

@implementation ICHTMLSearchIndexerDataSource

uint64_t __55__ICHTMLSearchIndexerDataSource_App__mainThreadContext__block_invoke(uint64_t a1)
{
  if (_UIApplicationIsExtension())
  {
    v2 = (void *)kICSearchTableRowAttribute_block_invoke_mainNoteContext;
    if (!kICSearchTableRowAttribute_block_invoke_mainNoteContext)
    {
      uint64_t v3 = [objc_alloc(MEMORY[0x263F5A740]) initForMainContext];
      v4 = (void *)kICSearchTableRowAttribute_block_invoke_mainNoteContext;
      kICSearchTableRowAttribute_block_invoke_mainNoteContext = v3;

      v2 = (void *)kICSearchTableRowAttribute_block_invoke_mainNoteContext;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [v2 managedObjectContext];
  }
  else
  {
    [NSClassFromString(&cfstr_Notesapp.isa) sharedNotesApp];
    v5 = [(id)objc_claimAutoreleasedReturnValue() noteContext];
    uint64_t v6 = [v5 managedObjectContext];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  return MEMORY[0x270F9A758]();
}

@end