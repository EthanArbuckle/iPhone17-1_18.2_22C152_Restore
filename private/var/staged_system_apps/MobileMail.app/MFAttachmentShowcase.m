@interface MFAttachmentShowcase
- (BOOL)isAddableToPassbook:(id)a3;
- (BOOL)isProvisioningProfile:(id)a3;
- (BOOL)unknownContactsController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (MFAttachmentShowcaseDelegate)delegate;
- (UIDocumentInteractionControllerDelegate)documentInteractionControllerDelegate;
- (UIViewController)presentingViewController;
- (id)_controllerForVCardData:(id)a3;
- (id)_controllerForVCardRepresentation:(id)a3;
- (id)_dataForContentRepresentation:(id)a3;
- (id)_eventPreviewControllerForICSRepresentation:(id)a3 exchangeEventUID:(int)a4 managed:(BOOL)a5 error:(id *)a6;
- (id)_passkitViewControllerForRepresentation:(id)a3 error:(id *)a4;
- (id)documentInteractionControllerForContentRepresentation:(id)a3;
- (void)_clearController;
- (void)_doneButtonTapped:(id)a3;
- (void)_presentContentRepresentation:(id)a3 exchangeEventUID:(int)a4 scene:(id)a5 showcaseInfo:(id)a6 delegate:(id)a7 completion:(id)a8;
- (void)dealloc;
- (void)finishedPresenting;
- (void)icsPreviewControllerWantsDismissal:(id)a3;
- (void)presentContentRepresentation:(id)a3 scene:(id)a4 showcaseInfo:(id)a5 delegate:(id)a6 completion:(id)a7;
- (void)presentExchangeEventUID:(int)a3 showcaseInfo:(id)a4 delegate:(id)a5 completion:(id)a6;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentInteractionControllerDelegate:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)unknownContactsControllerDidComplete:(id)a3;
@end

@implementation MFAttachmentShowcase

- (void)dealloc
{
  [(MFAttachmentShowcase *)self finishedPresenting];
  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentShowcase;
  [(MFAttachmentShowcase *)&v3 dealloc];
}

- (void)presentExchangeEventUID:(int)a3 showcaseInfo:(id)a4 delegate:(id)a5 completion:(id)a6
{
}

- (void)presentContentRepresentation:(id)a3 scene:(id)a4 showcaseInfo:(id)a5 delegate:(id)a6 completion:(id)a7
{
}

- (void)_presentContentRepresentation:(id)a3 exchangeEventUID:(int)a4 scene:(id)a5 showcaseInfo:(id)a6 delegate:(id)a7 completion:(id)a8
{
  uint64_t v12 = *(void *)&a4;
  id v14 = a3;
  id v94 = a5;
  id v15 = a6;
  id v96 = a7;
  id v16 = a8;
  id v95 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_doneButtonTapped:"];
  [(MFAttachmentShowcase *)self finishedPresenting];
  [(MFAttachmentShowcase *)self setDelegate:v96];
  v93 = [v14 contentItem];
  v17 = [v93 type];
  if ([v17 conformsToType:UTTypeVCard])
  {
    v18 = [(MFAttachmentShowcase *)self _controllerForVCardRepresentation:v14];
    vcardController = self->_vcardController;
    self->_vcardController = v18;

    id v20 = 0;
    v21 = [(CNUnknownContactsController *)self->_vcardController viewController];
    if (!v21) {
      goto LABEL_22;
    }
    goto LABEL_10;
  }
  unsigned int v22 = [v17 conformsToType:UTTypeCalendarEvent] ^ 1;
  if (v12) {
    LOBYTE(v22) = 0;
  }
  if ((v22 & 1) == 0)
  {
    id v103 = 0;
    v23 = -[MFAttachmentShowcase _eventPreviewControllerForICSRepresentation:exchangeEventUID:managed:error:](self, "_eventPreviewControllerForICSRepresentation:exchangeEventUID:managed:error:", v14, v12, [v15 fromManagedAccount], &v103);
    id v20 = v103;
    if (!v20)
    {
      objc_storeStrong((id *)&self->_icsPreviewController, v23);
      [(EKICSPreviewController *)self->_icsPreviewController setPreviewDelegate:self];
      v24 = [(EKICSPreviewController *)self->_icsPreviewController viewController];
      [v24 setHidesBottomBarWhenPushed:1];

      id v95 = 0;
      [(EKICSPreviewController *)self->_icsPreviewController setCancelButtonWithTarget:self action:"_doneButtonTapped:"];
    }
    v21 = [v23 viewController];

    if (!v21) {
      goto LABEL_22;
    }
    goto LABEL_10;
  }
  if ([(MFAttachmentShowcase *)self isProvisioningProfile:v17])
  {
    v30 = [(MFAttachmentShowcase *)self _dataForContentRepresentation:v14];
    v31 = [v14 contentURL];
    v32 = [v31 lastPathComponent];

    v33 = +[MCProfileConnection sharedConnection];
    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472;
    v100[2] = sub_100175448;
    v100[3] = &unk_10060A9A0;
    id v34 = v32;
    id v101 = v34;
    id v102 = v16;
    [v33 queueFileDataForAcceptance:v30 originalFileName:v34 forBundleID:0 completion:v100];

LABEL_18:
    v21 = 0;
    id v20 = 0;
    goto LABEL_24;
  }
  v36 = [v17 identifier];
  if ((objc_msgSend(v36, "ef_conformsToRFC822UTType") & 1) == 0)
  {

LABEL_30:
    if ([(MFAttachmentShowcase *)self isAddableToPassbook:v17])
    {
      id v99 = 0;
      uint64_t v41 = [(MFAttachmentShowcase *)self _passkitViewControllerForRepresentation:v14 error:&v99];
      id v20 = v99;
      if (v41)
      {
        v21 = (EMLMessageViewController *)v41;
LABEL_21:
        v35 = [(MFAttachmentShowcase *)self presentingViewController];
        [v35 presentViewController:v21 animated:[v15 shouldAnimate] completion:0];

        goto LABEL_22;
      }
    }
    else
    {
      v42 = [v17 identifier];
      unsigned int v43 = [v42 isEqualToString:@"com.apple.watchface"];

      if (v43)
      {
        v44 = +[LSApplicationWorkspace defaultWorkspace];
        v45 = [v14 contentURL];
        v46 = [v44 operationToOpenResource:v45 usingApplication:@"com.apple.Bridge" uniqueDocumentIdentifier:0 userInfo:0];

        [v46 start];
      }
      else
      {
        v47 = [v17 identifier];
        unsigned int v48 = [v47 isEqualToString:@"com.apple.workout"];

        if (v48)
        {
          v30 = [(MFAttachmentShowcase *)self _dataForContentRepresentation:v14];
          v49 = [(objc_class *)off_10068FD80() sharedInstance];
          v97[0] = _NSConcreteStackBlock;
          v97[1] = 3221225472;
          v97[2] = sub_10017555C;
          v97[3] = &unk_10060A9C8;
          id v98 = v16;
          [v49 presentWorkoutConfigurationData:v30 completion:v97];

          id v34 = v98;
          goto LABEL_18;
        }
        if (_os_feature_enabled_impl()
          && +[UIDevice mf_isPad]
          && ![v17 conformsToType:UTTypeImage])
        {
          v89 = [v96 contactStoreForAttachmentShowcase:self];
          v83 = [v96 contentItemHandlingDelegateForAttachmentShowcase:self];
          v87 = [v14 contentURL];
          v91 = [v15 message];
          v85 = [v91 senderDisplayNameUsingContactStore:v89];
          unsigned int v66 = [v91 shouldShowReplyAll];
          char v92 = sub_10017564C((uint64_t)self, v94);
          v82 = [v91 objectID];
          v81 = [v15 mailboxObjectID];
          v79 = [v91 subject];
          v80 = [v79 subjectString];
          v78 = [v15 originView];
          [v15 originRect];
          double v68 = v67;
          double v70 = v69;
          double v72 = v71;
          double v74 = v73;
          v75 = [v94 assetViewerManager];
          LOBYTE(v76) = v92;
          v77 = +[MessageAttachmentActionGenerator quicklookActionForURL:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:originView:attachmentRect:useFullScreenPresentation:contentRepresentationHandlingDelegate:assetViewerManager:](MessageAttachmentActionGenerator, "quicklookActionForURL:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:originView:attachmentRect:useFullScreenPresentation:contentRepresentationHandlingDelegate:assetViewerManager:", v87, v82, v81, v80, v85, v66, v68, v70, v72, v74, v78, v76, v83, v75);

          [v77 performWithSender:self target:0];
        }
        else
        {
          v50 = [(MFAttachmentShowcase *)self documentInteractionControllerForContentRepresentation:v14];
          uidic = self->_uidic;
          self->_uidic = v50;

          v52 = [(MFAttachmentShowcase *)self documentInteractionControllerDelegate];
          [(UIDocumentInteractionController *)self->_uidic setDelegate:v52];

          -[UIDocumentInteractionController setIsContentManaged:](self->_uidic, "setIsContentManaged:", [v15 fromManagedAccount]);
          if (!-[UIDocumentInteractionController presentPreviewAnimated:](self->_uidic, "presentPreviewAnimated:", [v15 shouldAnimate]))
          {
            v53 = self->_uidic;
            [v15 originRect];
            double v55 = v54;
            double v57 = v56;
            double v59 = v58;
            double v61 = v60;
            v62 = [v15 originView];
            LOBYTE(v53) = -[UIDocumentInteractionController presentOptionsMenuFromRect:inView:animated:](v53, "presentOptionsMenuFromRect:inView:animated:", v62, [v15 shouldAnimate], v55, v57, v59, v61);

            if ((v53 & 1) == 0)
            {
              [(MFAttachmentShowcase *)self finishedPresenting];
              NSErrorUserInfoKey v104 = NSLocalizedDescriptionKey;
              v63 = +[NSBundle mainBundle];
              v64 = [v63 localizedStringForKey:@"ATTACHMENT_UNKNOWN_TYPE_TITLE" value:&stru_100619928 table:@"Main"];
              v105 = v64;
              v65 = +[NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
              id v20 = +[NSError errorWithDomain:@"AttachmentShowcase" code:0 userInfo:v65];

              goto LABEL_36;
            }
          }
        }
      }
      id v20 = 0;
    }
LABEL_36:
    v21 = 0;
    goto LABEL_22;
  }
  v37 = [v14 contentMessage];

  if (!v37) {
    goto LABEL_30;
  }
  v38 = [EMLMessageViewController alloc];
  v90 = [v14 contentMessage];
  v88 = +[UIApplication sharedApplication];
  v86 = [v88 contactStore];
  v84 = +[UIApplication sharedApplication];
  v39 = [v84 avatarGenerator];
  v21 = [(EMLMessageViewController *)v38 initWithScene:v94 messageListItem:v90 contactStore:v86 avatarGenerator:v39];

  id v40 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_doneButtonTapped:"];
  [(ConversationViewControllerBase *)v21 setDoneButton:v40];

  id v20 = 0;
  if (v21)
  {
LABEL_10:
    if (v95)
    {
      v25 = [(EMLMessageViewController *)v21 navigationItem];
      [v25 setRightBarButtonItem:v95];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = (EMLMessageViewController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v21];

      v21 = v26;
    }
    [(EMLMessageViewController *)v21 setModalPresentationStyle:7];
    v27 = [(EMLMessageViewController *)v21 popoverPresentationController];
    v28 = [v15 originView];
    [v27 setSourceView:v28];

    [v27 setDelegate:self];
    [v15 originRect];
    v107.origin.x = CGRectZero.origin.x;
    v107.origin.y = CGRectZero.origin.y;
    v107.size.width = CGRectZero.size.width;
    v107.size.height = CGRectZero.size.height;
    if (CGRectEqualToRect(v106, v107))
    {
      v29 = [v15 originView];
      [v29 bounds];
      [v27 setSourceRect:];
    }
    else
    {
      [v15 originRect];
      [v27 setSourceRect:];
    }

    goto LABEL_21;
  }
LABEL_22:
  if (v16) {
    (*((void (**)(id, id))v16 + 2))(v16, v20);
  }
LABEL_24:
}

- (void)_clearController
{
  controller = self->_controller;
  self->_controller = 0;

  icsPreviewController = self->_icsPreviewController;
  self->_icsPreviewController = 0;

  uidic = self->_uidic;
  self->_uidic = 0;

  vcardController = self->_vcardController;
  self->_vcardController = 0;
}

- (void)finishedPresenting
{
  if (pthread_main_np() != 1)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MFAttachmentShowcase.m" lineNumber:250 description:@"Current thread must be main"];
  }
  v4 = [(UIDocumentInteractionController *)self->_uidic delegate];

  if (v4 == self) {
    [(UIDocumentInteractionController *)self->_uidic setDelegate:0];
  }
  [(MFAttachmentShowcase *)self _clearController];
  if (self->_rfc822DataProvider)
  {
    v5 = +[MFAttachmentManager defaultManager];
    [v5 removeProvider:self->_rfc822DataProvider];

    rfc822DataProvider = self->_rfc822DataProvider;
    self->_rfc822DataProvider = 0;
  }
}

- (void)_doneButtonTapped:(id)a3
{
  id v5 = [(MFAttachmentShowcase *)self delegate];
  v4 = [v5 presentingViewControllerForAttachmentShowcase:self];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (id)_controllerForVCardRepresentation:(id)a3
{
  v4 = [(MFAttachmentShowcase *)self _dataForContentRepresentation:a3];
  id v5 = [(MFAttachmentShowcase *)self _controllerForVCardData:v4];

  return v5;
}

- (id)_eventPreviewControllerForICSRepresentation:(id)a3 exchangeEventUID:(int)a4 managed:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v8 = *(id *)&a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)EKEventStore);
  if (v8
    || ([v9 contentItem],
        v11 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v11 exchangeEventUID],
        v11,
        v8))
  {
    id v12 = [objc_alloc((Class)EKICSPreviewController) initWithEventUID:v8 eventStore:v10];
  }
  else
  {
    if (v7) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    [v10 setSourceAccountManagement:v17];
    id v18 = objc_alloc((Class)EKICSPreviewController);
    v19 = [v9 contentURL];
    id v12 = [v18 initWithURL:v19 eventStore:v10];

    [v12 setAllowsImport:1];
    [v12 setAllowsEditing:1];
  }
  if (a6 && !v12)
  {
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    v13 = +[NSBundle mainBundle];
    id v14 = [v13 localizedStringForKey:@"ATTACHMENT_INVALID_CALENDAR_EVENT" value:&stru_100619928 table:@"Main"];
    v21 = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    *a6 = +[NSError errorWithDomain:@"AttachmentShowcase" code:1 userInfo:v15];
  }

  return v12;
}

- (id)_passkitViewControllerForRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(MFAttachmentShowcase *)self _dataForContentRepresentation:v6];
  id v8 = [objc_alloc((Class)PKPass) initWithData:v7 error:a4];
  id v9 = v8;
  if (v8)
  {
    id v13 = v8;
    id v10 = +[NSArray arrayWithObjects:&v13 count:1];
  }
  else
  {
    id v10 = &__NSArray0__struct;
  }
  id v11 = [objc_alloc((Class)PKAddPassesViewController) initWithPasses:v10];

  return v11;
}

- (id)_dataForContentRepresentation:(id)a3
{
  id v3 = a3;
  v4 = [v3 contentURL];
  id v10 = 0;
  id v5 = +[NSData dataWithContentsOfURL:v4 options:1 error:&v10];
  id v6 = v10;

  if (v6 || !v5)
  {
    id v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10045BFC0((uint64_t)v3, (uint64_t)v6, v8);
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (id)documentInteractionControllerForContentRepresentation:(id)a3
{
  id v3 = a3;
  v4 = [v3 contentURL];
  id v5 = [v3 contentItem];
  id v6 = [v5 displayName];
  id v7 = [v5 type];
  id v8 = [v7 identifier];
  if (objc_msgSend(v8, "ef_conformsToIWorkUTType"))
  {
    id v9 = [v6 pathExtension];
    id v10 = [v9 caseInsensitiveCompare:@"zip"];

    if (!v10) {
      goto LABEL_5;
    }
    [v6 stringByDeletingPathExtension];
    v6 = id v8 = v6;
  }

LABEL_5:
  id v11 = +[MFDocumentInteractionController interactionControllerWithURL:v4];
  [v11 setName:v6];
  id v12 = [v7 identifier];
  unsigned int v13 = [v12 ef_conformsToRFC822UTType];
  char v14 = v13;
  if (v13)
  {
    id v15 = (void *)EFEmailMessageUTType;
  }
  else
  {
    id v15 = [v7 identifier];
  }
  [v11 setUTI:v15];
  if ((v14 & 1) == 0) {

  }
  [v11 setShouldUnzipDocument:1];
  id v16 = [v5 uniformTypeIdentifier];
  [v11 setPreviewsPresentWithMarkup:[v16 ef_conformsToMarkupUTType]];

  return v11;
}

- (id)_controllerForVCardData:(id)a3
{
  id v10 = 0;
  v4 = +[CNContactVCardSerialization contactsWithData:a3 error:&v10];
  id v5 = v10;
  if (!v4)
  {
    id v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10045C048((uint64_t)v5, v6);
    }

    v4 = &__NSArray0__struct;
  }
  id v7 = [objc_alloc((Class)CNUnknownContactsController) initWithContacts:v4 contactStore:0];
  [v7 setDelegate:self];
  id v8 = [v7 viewController];
  [v8 setHidesBottomBarWhenPushed:1];

  return v7;
}

- (BOOL)isProvisioningProfile:(id)a3
{
  id v3 = a3;
  v4 = +[UTType typeWithIdentifier:kMFUTTypeMobileConfig];
  if (([v3 conformsToType:v4] & 1) != 0
    || ([v3 conformsToType:UTTypePKCS12] & 1) != 0
    || ([v3 conformsToType:UTTypeX509Certificate] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v7 = +[UTType typeWithIdentifier:kMFUTTypeMobileProvision];
    unsigned __int8 v5 = [v3 conformsToType:v7];
  }
  return v5;
}

- (BOOL)isAddableToPassbook:(id)a3
{
  id v3 = a3;
  if (([v3 conformsToType:_UTTypePassData] & 1) != 0
    || [v3 conformsToType:_UTTypePassBundle])
  {
    BOOL v4 = +[PKAddPassesViewController canAddPasses];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)unknownContactsController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v5 = a4;
  id v6 = [v5 key];
  unsigned int v7 = [v6 isEqualToString:CNContactEmailAddressesKey];

  if (v7)
  {
    id v8 = [(MFAttachmentShowcase *)self presentingViewController];
    [v8 dismissViewControllerAnimated:1 completion:0];
  }
  return 1;
}

- (void)unknownContactsControllerDidComplete:(id)a3
{
  id v3 = [(MFAttachmentShowcase *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MFAttachmentShowcase *)self finishedPresenting];
  }
}

- (void)icsPreviewControllerWantsDismissal:(id)a3
{
  id v5 = [(MFAttachmentShowcase *)self delegate];
  id v4 = [v5 presentingViewControllerForAttachmentShowcase:self];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (UIDocumentInteractionControllerDelegate)documentInteractionControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_documentInteractionControllerDelegate);

  return (UIDocumentInteractionControllerDelegate *)WeakRetained;
}

- (void)setDocumentInteractionControllerDelegate:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (MFAttachmentShowcaseDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFAttachmentShowcaseDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_documentInteractionControllerDelegate);
  objc_storeStrong((id *)&self->_rfc822DataProvider, 0);
  objc_storeStrong((id *)&self->_vcardController, 0);
  objc_storeStrong((id *)&self->_uidic, 0);
  objc_storeStrong((id *)&self->_icsPreviewController, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end