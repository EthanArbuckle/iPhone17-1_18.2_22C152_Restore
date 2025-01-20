@interface VKCAnalysisDebugMenuProvider
- (UIContextMenuInteraction)contextMenuInteraction;
- (VKAnalysisDebugInfoProvider)provider;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)menuFromElements:(id)a3 title:(id)a4;
- (id)menuFromProvider:(id)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)presentDebugMenuProvider:(id)a3 fromView:(id)a4 rect:(CGRect)a5;
- (void)setContextMenuInteraction:(id)a3;
- (void)setProvider:(id)a3;
@end

@implementation VKCAnalysisDebugMenuProvider

- (void)presentDebugMenuProvider:(id)a3 fromView:(id)a4 rect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v11 = (objc_class *)MEMORY[0x1E4F428F8];
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[[v11 alloc] initWithDelegate:self];
  [(VKCAnalysisDebugMenuProvider *)self setContextMenuInteraction:v14];

  v15 = [(VKCAnalysisDebugMenuProvider *)self contextMenuInteraction];
  [v12 addInteraction:v15];

  [(VKCAnalysisDebugMenuProvider *)self setProvider:v13];
  id v17 = [(VKCAnalysisDebugMenuProvider *)self contextMenuInteraction];
  v16 = -[VKQuad initWithRect:]([VKQuad alloc], "initWithRect:", x, y, width, height);
  [(VKQuad *)v16 bottomRight];
  objc_msgSend(v17, "_presentMenuAtLocation:");
}

- (id)menuFromProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 analysisResult];
  uint64_t v6 = [v4 delegate];
  v93 = [v5 text];
  v7 = [v5 text];
  uint64_t v8 = [v7 length];

  v94 = [v4 selectedRange];
  [v4 totalQuadTextArea];
  double v10 = v9;
  [v4 totalBoundingBoxTextArea];
  double v12 = v11;
  v90 = self;
  v91 = (void *)v6;
  if (v4)
  {
    [v4 visibleTextAreaInfo];
    double v13 = 0.0 * 100.0;
    uint64_t v14 = (int)0.0;
    uint64_t v15 = v14;
    uint64_t v86 = v14;
  }
  else
  {
    uint64_t v86 = 0;
    uint64_t v15 = 0;
    uint64_t v14 = 0;
    double v13 = 0.0;
  }
  double v16 = v10 * 100.0;
  double v17 = v12 * 100.0;
  unint64_t v89 = [v4 subjectRequestStatus];
  v18 = [v4 subjectContext];
  uint64_t v87 = [v18 subjectCount];
  v88 = v18;
  v92 = [v18 animatedStickerScore];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v20 = [v4 analysisResult];
  v21 = [v20 request];
  v22 = VKMUIStringForAnalysisTypes([v21 analysisTypes]);

  v23 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"AnalysisTypes", v22);
  [v19 addObject:v23];

  v24 = VKMUIStringForAnalysisInteractionTypes([v4 activeInteractionTypes]);

  v25 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Interaction Types", v24);
  [v19 addObject:v25];

  v26 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Visible Quad Height (In Window)", v24);
  [v19 addObject:v26];

  v27 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v8);

  v28 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Characters", v27);
  [v19 addObject:v28];

  v29 = (void *)MEMORY[0x1E4F426E8];
  v30 = VKMUIStringForVKRange(v94);
  v31 = objc_msgSend(v29, "vk_itemWithTitle:subtitle:", @"SelectedRange", v30);
  [v19 addObject:v31];

  if ([v94 length])
  {
    objc_msgSend(v93, "vk_substringWithVKRange:", v94);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = @"(none)";
  }

  v33 = (void *)MEMORY[0x1E4F426E8];
  v34 = [(__CFString *)v32 vk_substringToIndex:50];
  v35 = objc_msgSend(v33, "vk_itemWithTitle:subtitle:", @"Selected Text", v34);
  [v19 addObject:v35];

  v36 = objc_msgSend(NSString, "stringWithFormat:", @"Bounding Box:%.02f%%", *(void *)&v13);

  v37 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Visible Text Area", v36);
  [v19 addObject:v37];

  v38 = objc_msgSend(NSString, "stringWithFormat:", @"Box:%.02f%% Quad:%.02f%%", *(void *)&v17, *(void *)&v16);

  v39 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Full Image Text Area", v38);
  [v19 addObject:v39];

  v40 = objc_msgSend(NSString, "stringWithFormat:", @"max:%d min:%d avg:%d", v14, v15, v86);

  v41 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Visible Quad Height (In Window)", v40);
  [v19 addObject:v41];

  v42 = [NSNumber numberWithInteger:v87];
  v43 = [v42 description];

  v44 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Subject Count", v43);
  [v19 addObject:v44];

  v45 = VKMUIStringForSubjectRequestStatus(v89);

  v46 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"Subject Request Status", v45);
  [v19 addObject:v46];

  if (v88)
  {
    if (v92)
    {
      v47 = NSString;
      [v92 floatValue];
      objc_msgSend(v47, "stringWithFormat:", @"Sticker Score: %.02f", v48);
      v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = @"StickerScore: nil";
    }

    v50 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", v49, 0);
    [v19 addObject:v50];

    v45 = v49;
  }
  [v4 contentsRect];
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  [v4 visibleImageRect];
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;
  double v66 = v65;
  v67 = NSString;
  v68 = VKMUIStringForRect(v52, v54, v56, v58);
  v69 = [v67 stringWithFormat:@"%@", v68];

  v70 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"ContentsRect", v69);
  [v19 addObject:v70];

  v71 = NSString;
  v72 = VKMUIStringForRect(v60, v62, v64, v66);
  v73 = [v71 stringWithFormat:@"%@", v72];

  v74 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", @"VisibleRect", v73);
  [v19 addObject:v74];

  v75 = [v5 textDataDetectorElements];
  v76 = [(VKCAnalysisDebugMenuProvider *)v90 menuFromElements:v75 title:@"Data Detectors"];
  [v19 addObject:v76];

  v77 = [v5 mrcDataDetectorElements];
  v78 = [(VKCAnalysisDebugMenuProvider *)v90 menuFromElements:v77 title:@"MRC DD"];
  [v19 addObject:v78];

  v79 = [v5 visualSearchResult];
  v80 = [v79 resultItems];
  v81 = [(VKCAnalysisDebugMenuProvider *)v90 menuFromElements:v80 title:@"Visual Search"];
  [v19 addObject:v81];

  v82 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v91);

  v83 = objc_msgSend(MEMORY[0x1E4F426E8], "vk_itemWithTitle:subtitle:", v82, 0);
  [v19 addObject:v83];

  v84 = objc_msgSend(MEMORY[0x1E4F42B80], "vk_menuWithItems:title:", v19, 0);

  return v84;
}

- (id)menuFromElements:(id)a3 title:(id)a4
{
  v5 = NSString;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 stringWithFormat:@"%@: (%lu)", v6, objc_msgSend(v7, "count")];

  double v9 = objc_msgSend(v7, "vk_compactMap:", &__block_literal_global_8);

  double v10 = objc_msgSend(MEMORY[0x1E4F42B80], "vk_menuWithItems:title:", v9, v8);

  return v10;
}

uint64_t __55__VKCAnalysisDebugMenuProvider_menuFromElements_title___block_invoke(uint64_t a1, void *a2)
{
  return [a2 debugMenu];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  id v6 = (void *)MEMORY[0x1E4F428F0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__VKCAnalysisDebugMenuProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v9[3] = &unk_1E6BF1B28;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  id v7 = [v6 configurationWithIdentifier:0 previewProvider:&__block_literal_global_119 actionProvider:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

uint64_t __86__VKCAnalysisDebugMenuProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke()
{
  return 0;
}

id __86__VKCAnalysisDebugMenuProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [*(id *)(a1 + 32) provider];
  id v4 = [WeakRetained menuFromProvider:v3];

  return v4;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v4 = objc_msgSend(MEMORY[0x1E4F43130], "defaultStyle", a3, a4);
  [v4 setPreferredLayout:3];
  return v4;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v5 = a3;
  id v6 = [v5 view];
  [v6 removeInteraction:v5];
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (VKAnalysisDebugInfoProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
}

@end