@interface UILibArchiveAppleDoublePathSet
@end

@implementation UILibArchiveAppleDoublePathSet

void __111___UILibArchiveAppleDoublePathSet_confirmExactAppleDoubleFilesAppearingAfterRealFilesByPrescanningArchivePath___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  v3 = [v14 pathInArchive];
  v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v5 = _appleDoublePathForRealPath_DotUnderscore(v3);
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    v6 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = _appleDoublePathForRealPath_DotUnderscore(v3);
  }
  else
  {
    if (_isPossibleAppleDoublePath_MACOSX(v3))
    {
      v8 = [v14 fileType];
      int v9 = [v8 isEqualToString:*MEMORY[0x1E4F283C8]];

      v10 = [v14 pathInArchive];
      v11 = [v10 lastPathComponent];
      char v12 = [v11 isEqualToString:@"__MACOSX"];

      if ((_isPossibleAppleDoublePath_DotUnderscore(v3) & 1) == 0 && v9 && (v12 & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        goto LABEL_13;
      }
      v6 = *(void **)(*(void *)(a1 + 32) + 8);
    }
    else
    {
      if (!_isPossibleAppleDoublePath_DotUnderscore(v3)) {
        goto LABEL_13;
      }
      v6 = *(void **)(*(void *)(a1 + 32) + 16);
    }
    uint64_t v7 = [v14 pathInArchive];
  }
  v13 = (void *)v7;
  [v6 addObject:v7];

LABEL_13:
}

@end