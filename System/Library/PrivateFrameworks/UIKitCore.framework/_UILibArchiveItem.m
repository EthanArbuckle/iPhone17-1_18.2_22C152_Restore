@interface _UILibArchiveItem
+ (id)itemByReadingAttributesFromUnderlyingArchiveEntry:(ui_archive_entry *)a3 archive:(ui_archive *)a4;
- (ui_archive)underlyingArchive;
- (ui_archive_entry)underlyingArchiveEntry;
@end

@implementation _UILibArchiveItem

+ (id)itemByReadingAttributesFromUnderlyingArchiveEntry:(ui_archive_entry *)a3 archive:(ui_archive *)a4
{
  v6 = objc_alloc_init((Class)objc_opt_class());
  v7 = ui_archive_entry_pathname((uint64_t)a3);
  if (![v7 length])
  {
    v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("DocumentInteraction", &_MergedGlobals_1_7) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = 0;
      v14 = "unable to load archive item [ui_archive_entry_pathname() not set]";
      v15 = (uint8_t *)&v22;
LABEL_9:
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, v14, v15, 2u);
    }
LABEL_10:
    v16 = 0;
    goto LABEL_16;
  }
  ui_archive_entry_filetype((uint64_t)a3);
  if (!v8)
  {
    v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("DocumentInteraction", &qword_1EB25BD20) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = 0;
      v14 = "unable to load archive item [ui_archive_entry_filetype() not set]";
      v15 = (uint8_t *)&v21;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  __int16 v9 = v8;
  ui_archive_entry_size_is_set((uint64_t)a3);
  [v6 setFileSizeIsSet:v10 != 0];
  if ([v6 fileSizeIsSet])
  {
    ui_archive_entry_size((uint64_t)a3);
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }
  [v6 setPathInArchive:v7];
  id v17 = (id)*MEMORY[0x1E4F283D8];
  uint64_t v18 = (((v9 & 0xF000u) - 4096) >> 12) - 1;
  if v18 <= 0xA && ((0x555u >> v18))
  {
    id v19 = **((id **)&unk_1E52EB4F8 + v18);

    id v17 = v19;
  }
  [v6 setFileType:v17];

  [v6 setFileSize:v12];
  v6[7] = a4;
  v6[6] = a3;
  v16 = v6;
LABEL_16:

  return v16;
}

- (ui_archive_entry)underlyingArchiveEntry
{
  return self->_underlyingArchiveEntry;
}

- (ui_archive)underlyingArchive
{
  return self->_underlyingArchive;
}

@end