@interface PLAllowedForCameraPreviewWellPredicate
@end

@implementation PLAllowedForCameraPreviewWellPredicate

void ___PLAllowedForCameraPreviewWellPredicate_block_invoke()
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid != nil AND addedDate != nil"];
  v1 = +[PLFetchingAlbum predicateForAlbumKind:1613];
  v2 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(trashedState) == %d", 0);
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(noindex:(avalanchePickType) = %d) OR (noindex:(avalanchePickType) >= %d AND (((noindex:(avalanchePickType) & %i) == %i) OR ((noindex:(avalanchePickType) & %i) == %i)))", 0, 8, 8, 8, 16, 16);
  v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(hidden) == NO"];
  v5 = (void *)MEMORY[0x1E4F28BA0];
  v9[0] = v0;
  v9[1] = v1;
  v9[2] = v2;
  v9[3] = v3;
  v9[4] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];
  uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];
  v8 = (void *)_PLAllowedForCameraPreviewWellPredicate_s_allowedPredicate;
  _PLAllowedForCameraPreviewWellPredicate_s_allowedPredicate = v7;
}

@end