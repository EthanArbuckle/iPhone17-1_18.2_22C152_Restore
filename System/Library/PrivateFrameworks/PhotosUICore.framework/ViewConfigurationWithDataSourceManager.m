@interface ViewConfigurationWithDataSourceManager
@end

@implementation ViewConfigurationWithDataSourceManager

void ___ViewConfigurationWithDataSourceManager_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:1];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@"Content Syndication Badges:\n\n"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___PXContentSyndicationReviewInfoAlertController_block_invoke;
  aBlock[3] = &unk_1E5DC3B60;
  id v19 = v4;
  id v5 = v4;
  v6 = (void (**)(void *, uint64_t, void, void *))_Block_copy(aBlock);
  v7 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6[2](v6, -6, 0, v7);

  v8 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6[2](v6, -5, 1, v8);

  v9 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6[2](v6, -4, 2, v9);

  v10 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6[2](v6, -3, 2, v10);

  v11 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6[2](v6, -2, 3, v11);

  v12 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  v6[2](v6, -1, 4, v12);

  v13 = [MEMORY[0x1E4FB1618] systemDarkRedColor];
  v6[2](v6, 0, 5, v13);

  v14 = [MEMORY[0x1E4FB1618] systemDarkTealColor];
  v6[2](v6, 1, 6, v14);

  v15 = [MEMORY[0x1E4FB1618] systemDarkGreenColor];
  v6[2](v6, 2, 7, v15);

  [v3 _setAttributedMessage:v5];
  v16 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
  [v3 addAction:v16];

  id v17 = v2;
  [v17 presentViewController:v3 animated:1 completion:0];
}

@end