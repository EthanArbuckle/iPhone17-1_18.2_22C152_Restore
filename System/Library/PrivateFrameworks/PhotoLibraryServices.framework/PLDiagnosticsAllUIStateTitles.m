@interface PLDiagnosticsAllUIStateTitles
@end

@implementation PLDiagnosticsAllUIStateTitles

void ___PLDiagnosticsAllUIStateTitles_block_invoke()
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EEBF0920;
  v2[1] = &unk_1EEBF0938;
  v3[0] = @"All";
  v3[1] = @"Contextual Diagnostics";
  v2[2] = &unk_1EEBF0950;
  v2[3] = &unk_1EEBF0968;
  v3[2] = @"Current Asset Identifier";
  v3[3] = @"Current Asset View Model";
  v2[4] = &unk_1EEBF0980;
  v2[5] = &unk_1EEBF0998;
  v3[4] = @"Current Asset Detailed Description";
  v3[5] = @"Current Asset Metadata";
  v2[6] = &unk_1EEBF09B0;
  v2[7] = &unk_1EEBF09C8;
  v3[6] = @"View Model Description";
  v3[7] = @"View Controller Hierarchy";
  v2[8] = &unk_1EEBF09E0;
  v2[9] = &unk_1EEBF09F8;
  v3[8] = @"View Controller Descriptions";
  v3[9] = @"Window Recursive Descriptions";
  v2[10] = &unk_1EEBF0A10;
  v3[10] = @"Tungsten Hiearchy";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:11];
  v1 = (void *)_PLDiagnosticsAllUIStateTitles_allUIStateTitles;
  _PLDiagnosticsAllUIStateTitles_allUIStateTitles = v0;
}

@end