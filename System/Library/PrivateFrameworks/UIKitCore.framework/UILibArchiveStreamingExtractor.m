@interface UILibArchiveStreamingExtractor
@end

@implementation UILibArchiveStreamingExtractor

void __72___UILibArchiveStreamingExtractor_extractArchivePath_toDirectory_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  v6 = [v5 pathInArchive];
  v7 = [v6 stringByStandardizingPath];

  if ([(id)objc_opt_class() shouldExtractPathInArchive:v7 forExtractionRootedAtStandardizedSubpathInArchive:*(void *)(a1 + 40)])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    v8 = [*(id *)(a1 + 48) stringByAppendingPathComponent:v7];
    ui_archive_entry_clone([v5 underlyingArchiveEntry]);
    uint64_t v10 = v9;
    ui_archive_entry_set_pathname(v9, v8);
    ui_archive_write_header(*(void *)(a1 + 96), v10);
    if (v11)
    {
      uint64_t v12 = ui_archive_error(*(void *)(a1 + 96), @"_UIArchiveExtractorErrorDomain", v11, @"Unable to write header");
      uint64_t v13 = *(void *)(*(void *)(a1 + 88) + 8);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v31 = 0;
      while (1)
      {
        ui_archive_read_data_block([v5 underlyingArchive], (uint64_t)&v33, (uint64_t)&v32, (uint64_t)&v31);
        int v16 = v15;
        if (v15) {
          break;
        }
        ui_archive_write_data_block(*(void *)(a1 + 96), v33, v32, v31);
        if (v17)
        {
          uint64_t v18 = ui_archive_error(*(void *)(a1 + 96), @"_UIArchiveExtractorErrorDomain", -25, @"Unable to write data");
          uint64_t v19 = *(void *)(*(void *)(a1 + 88) + 8);
          v20 = *(void **)(v19 + 40);
          *(void *)(v19 + 40) = v18;

LABEL_11:
          uint64_t v23 = [v5 underlyingArchive];
          v24 = @"Unable to read data";
          int v22 = v16;
          goto LABEL_12;
        }
      }
      if (v15 != 1) {
        goto LABEL_11;
      }
      ui_archive_write_finish_entry(*(void *)(a1 + 96));
      if (!v21) {
        goto LABEL_14;
      }
      int v22 = v21;
      uint64_t v23 = *(void *)(a1 + 96);
      v24 = @"Unable to finish writing data";
LABEL_12:
      uint64_t v25 = ui_archive_error(v23, @"_UIArchiveExtractorErrorDomain", v22, v24);
      uint64_t v26 = *(void *)(*(void *)(a1 + 88) + 8);
      v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;
    }
    *a3 = 1;
LABEL_14:
    int v28 = [v5 isAppleDoubleFile];
    uint64_t v29 = 64;
    if (v28)
    {
      uint64_t v29 = 56;
      id v30 = v5;
    }
    else
    {
      id v30 = v8;
    }
    [*(id *)(a1 + v29) addObject:v30];
    ui_archive_entry_free(v10);
  }
}

@end