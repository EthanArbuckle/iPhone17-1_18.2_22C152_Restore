@interface MessageAttachmentActionGenerator
+ (id)_saveToCameraRollActionForFutureRepresentations:(id)a3 title:(id)a4 image:(id)a5;
+ (id)markupDocumentActionForURL:(id)a3 messageObjectID:(id)a4 mailboxObjectID:(id)a5 subject:(id)a6 senderDisplayName:(id)a7 shouldShowReplyAll:(BOOL)a8 originView:(id)a9 useFullScreenPresentation:(BOOL)a10 contentRepresentationHandlingDelegate:(id)a11 assetViewerManager:(id)a12;
+ (id)quicklookActionForAttachmentContext:(id)a3 alternateAction:(id)a4 originView:(id)a5 attachmentRect:(CGRect)a6 useFullScreenPresentation:(BOOL)a7;
+ (id)quicklookActionForURL:(id)a3 messageObjectID:(id)a4 mailboxObjectID:(id)a5 subject:(id)a6 senderDisplayName:(id)a7 shouldShowReplyAll:(BOOL)a8 originView:(id)a9 attachmentRect:(CGRect)a10 useFullScreenPresentation:(BOOL)a11 contentRepresentationHandlingDelegate:(id)a12 assetViewerManager:(id)a13;
+ (id)saveAllAttachmentsActionWithTitle:(id)a3 futureRepresentations:(id)a4;
+ (id)saveImageActionForFutureRepresentation:(id)a3;
+ (id)saveVideoActionForFutureRepresentation:(id)a3;
@end

@implementation MessageAttachmentActionGenerator

+ (id)_saveToCameraRollActionForFutureRepresentations:(id)a3 title:(id)a4 image:(id)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E4FB13F0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__MessageAttachmentActionGenerator__saveToCameraRollActionForFutureRepresentations_title_image___block_invoke;
  v12[3] = &unk_1E6D1A968;
  id v13 = v7;
  id v9 = v7;
  v10 = [v8 actionWithTitle:a4 image:a5 identifier:0 handler:v12];

  return v10;
}

void __96__MessageAttachmentActionGenerator__saveToCameraRollActionForFutureRepresentations_title_image___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = *(void **)(*((void *)&v7 + 1) + 8 * v4);
        v6 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", (void)v7);
        [v5 onScheduler:v6 addSuccessBlock:&__block_literal_global];

        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v2);
  }
}

void __96__MessageAttachmentActionGenerator__saveToCameraRollActionForFutureRepresentations_title_image___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 contentURL];
  char v4 = MFCameraRollSaveAssetWithURL();
  id v5 = 0;

  if ((v4 & 1) == 0)
  {
    v6 = [v2 contentURL];
    NSLog(&cfstr_FailedToIngest.isa, v6, v5);
  }
}

+ (id)saveImageActionForFutureRepresentation:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  long long v7 = [v6 localizedStringForKey:@"SAVE_IMAGE" value:&stru_1F39E2A88 table:@"Main"];
  long long v8 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35090]];
  long long v9 = [a1 _saveToCameraRollActionForFutureRepresentations:v5 title:v7 image:v8];

  return v9;
}

+ (id)saveVideoActionForFutureRepresentation:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  long long v7 = [v6 localizedStringForKey:@"SAVE_VIDEO" value:&stru_1F39E2A88 table:@"Main"];
  long long v8 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35090]];
  long long v9 = [a1 _saveToCameraRollActionForFutureRepresentations:v5 title:v7 image:v8];

  return v9;
}

+ (id)saveAllAttachmentsActionWithTitle:(id)a3 futureRepresentations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35098]];
  long long v9 = [a1 _saveToCameraRollActionForFutureRepresentations:v7 title:v6 image:v8];

  return v9;
}

+ (id)quicklookActionForURL:(id)a3 messageObjectID:(id)a4 mailboxObjectID:(id)a5 subject:(id)a6 senderDisplayName:(id)a7 shouldShowReplyAll:(BOOL)a8 originView:(id)a9 attachmentRect:(CGRect)a10 useFullScreenPresentation:(BOOL)a11 contentRepresentationHandlingDelegate:(id)a12 assetViewerManager:(id)a13
{
  double height = a10.size.height;
  double width = a10.size.width;
  double y = a10.origin.y;
  double x = a10.origin.x;
  id v23 = a3;
  id v45 = a4;
  id v44 = a5;
  id v24 = a6;
  id v43 = a7;
  id v42 = a9;
  id v46 = a12;
  v41 = v24;
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad"))
  {
    id v25 = objc_alloc(MEMORY[0x1E4F350F0]);
    BYTE1(v40) = [v46 isSourceManagedForURL:v23];
    LOBYTE(v40) = a8;
    v26 = objc_msgSend(v25, "initWithAttachmentURL:editBehavior:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:contentManaged:", v23, 1, v45, v44, v24, v43, v40);
  }
  else
  {
    v26 = 0;
  }
  v27 = (void *)MEMORY[0x1E4FB13F0];
  v28 = [MEMORY[0x1E4F28B50] mainBundle];
  v29 = [v28 localizedStringForKey:@"QUICK_LOOK" value:&stru_1F39E2A88 table:@"Main"];
  v30 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35078]];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __244__MessageAttachmentActionGenerator_quicklookActionForURL_messageObjectID_mailboxObjectID_subject_senderDisplayName_shouldShowReplyAll_originView_attachmentRect_useFullScreenPresentation_contentRepresentationHandlingDelegate_assetViewerManager___block_invoke;
  v47[3] = &unk_1E6D1A990;
  id v31 = v46;
  id v48 = v31;
  id v32 = v23;
  id v49 = v32;
  v33 = [v27 actionWithTitle:v29 image:v30 identifier:0 handler:v47];

  if (v26)
  {
    v34 = v42;
    objc_msgSend(a1, "quicklookActionForAttachmentContext:alternateAction:originView:attachmentRect:useFullScreenPresentation:", v26, v33, v42, a11, x, y, width, height);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    v36 = [MEMORY[0x1E4F28B50] mainBundle];
    v37 = [v36 localizedStringForKey:@"OPEN_IN_NEW_WINDOW" value:&stru_1F39E2A88 table:@"Main"];
    [v35 setTitle:v37];

    v38 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35068]];
    [v35 setImage:v38];
  }
  else
  {
    id v35 = v33;
    v34 = v42;
  }

  return v35;
}

uint64_t __244__MessageAttachmentActionGenerator_quicklookActionForURL_messageObjectID_mailboxObjectID_subject_senderDisplayName_shouldShowReplyAll_originView_attachmentRect_useFullScreenPresentation_contentRepresentationHandlingDelegate_assetViewerManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) previewURL:*(void *)(a1 + 40)];
}

+ (id)markupDocumentActionForURL:(id)a3 messageObjectID:(id)a4 mailboxObjectID:(id)a5 subject:(id)a6 senderDisplayName:(id)a7 shouldShowReplyAll:(BOOL)a8 originView:(id)a9 useFullScreenPresentation:(BOOL)a10 contentRepresentationHandlingDelegate:(id)a11 assetViewerManager:(id)a12
{
  HIDWORD(v39) = a10;
  id v45 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v44 = a9;
  id v42 = v18;
  id v43 = a11;
  uint64_t v40 = v20;
  v41 = v19;
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad"))
  {
    id v22 = objc_alloc(MEMORY[0x1E4F350F0]);
    BYTE1(v39) = [v43 isSourceManagedForURL:v45];
    LOBYTE(v39) = a8;
    id v23 = objc_msgSend(v22, "initWithAttachmentURL:editBehavior:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:contentManaged:", v45, 2, v18, v19, v20, v21, v39);
  }
  else
  {
    id v23 = 0;
  }
  id v24 = (void *)MEMORY[0x1E4FB13F0];
  id v25 = [MEMORY[0x1E4F28B50] mainBundle];
  v26 = [v25 localizedStringForKey:@"MARKUP_DOCUMENT" value:&stru_1F39E2A88 table:@"Main"];
  uint64_t v27 = *MEMORY[0x1E4F35050];
  v28 = [MEMORY[0x1E4FB1818] systemImageNamed:*MEMORY[0x1E4F35050]];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __234__MessageAttachmentActionGenerator_markupDocumentActionForURL_messageObjectID_mailboxObjectID_subject_senderDisplayName_shouldShowReplyAll_originView_useFullScreenPresentation_contentRepresentationHandlingDelegate_assetViewerManager___block_invoke;
  v46[3] = &unk_1E6D1A990;
  id v29 = v43;
  id v47 = v29;
  id v30 = v45;
  id v48 = v30;
  id v31 = [v24 actionWithTitle:v26 image:v28 identifier:0 handler:v46];

  if (v23)
  {
    objc_msgSend(a1, "quicklookActionForAttachmentContext:alternateAction:originView:attachmentRect:useFullScreenPresentation:", v23, v31, v44, HIDWORD(v39), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    v33 = [MEMORY[0x1E4F28B50] mainBundle];
    v34 = [v33 localizedStringForKey:@"MARKUP_DOCUMENT" value:&stru_1F39E2A88 table:@"Main"];
    [v32 setTitle:v34];

    id v35 = [MEMORY[0x1E4FB1818] systemImageNamed:v27];
    v37 = v21;
    v36 = v42;
    [v32 setImage:v35];
  }
  else
  {
    id v32 = v31;
    v37 = v21;
    v36 = v42;
  }

  return v32;
}

uint64_t __234__MessageAttachmentActionGenerator_markupDocumentActionForURL_messageObjectID_mailboxObjectID_subject_senderDisplayName_shouldShowReplyAll_originView_useFullScreenPresentation_contentRepresentationHandlingDelegate_assetViewerManager___block_invoke(uint64_t a1)
{
  if (LoadMarkupUI_loadPredicate != -1) {
    dispatch_once(&LoadMarkupUI_loadPredicate, &__block_literal_global_236);
  }
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 markupURL:v3];
}

+ (id)quicklookActionForAttachmentContext:(id)a3 alternateAction:(id)a4 originView:(id)a5 attachmentRect:(CGRect)a6 useFullScreenPresentation:(BOOL)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v14 = a3;
  id v15 = a5;
  v16 = (void *)MEMORY[0x1E4FB1F60];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __140__MessageAttachmentActionGenerator_quicklookActionForAttachmentContext_alternateAction_originView_attachmentRect_useFullScreenPresentation___block_invoke;
  v21[3] = &unk_1E6D1A9B8;
  BOOL v28 = a7;
  id v22 = v14;
  id v23 = v15;
  CGFloat v24 = x;
  CGFloat v25 = y;
  CGFloat v26 = width;
  CGFloat v27 = height;
  id v17 = v15;
  id v18 = v14;
  id v19 = [v16 actionWithIdentifier:0 alternateAction:a4 configurationProvider:v21];

  return v19;
}

id __140__MessageAttachmentActionGenerator_quicklookActionForAttachmentContext_alternateAction_originView_attachmentRect_useFullScreenPresentation___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1F68]);
  uint64_t v3 = [*(id *)(a1 + 32) userActivity];
  id v4 = (void *)[v2 initWithUserActivity:v3];

  if (_os_feature_enabled_impl()
    && *(unsigned char *)(a1 + 80)
    && *(void *)(a1 + 40)
    && !CGRectIsEmpty(*(CGRect *)(a1 + 48)))
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    [v5 setBackgroundColor:v6];

    UIRectGetCenter();
    long long v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1B38]), "initWithContainer:center:", *(void *)(a1 + 40), v7, v8);
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v5 parameters:v10 target:v9];
    [v4 setPreview:v11];

    id v12 = objc_alloc_init(MEMORY[0x1E4FB1F70]);
    id v13 = [MEMORY[0x1E4FB1F80] _largeProminentPlacement];
    [v12 setPlacement:v13];

    [v4 setOptions:v12];
  }
  return v4;
}

@end