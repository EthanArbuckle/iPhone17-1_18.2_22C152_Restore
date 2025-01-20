@interface PreviewViewController
- (void)_addVCToHierarchy:(id)a3;
- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4;
- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5;
- (void)viewWillLayoutSubviews;
@end

@implementation PreviewViewController

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PreviewViewController;
  [(PreviewViewController *)&v14 viewWillLayoutSubviews];
  v3 = [(PreviewViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  detailVC = self->_detailVC;
  if (detailVC)
  {
    v13 = [(UIViewController *)detailVC view];
    [v13 setFrame:v5, v7, v9, v11];
  }
}

- (void)_addVCToHierarchy:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_detailVC, a3);
  [(PreviewViewController *)self addChildViewController:v8];
  double v5 = [v8 view];
  double v6 = [(PreviewViewController *)self view];
  [v6 addSubview:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    [v7 setShowsVerticalScrollIndicator:0];
    [v7 setShowsHorizontalScrollIndicator:0];
  }
}

- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v28 = a4;
  id v29 = a5;
  double v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "preparePreviewOfSearchableItemWithIdentifier:%@", (uint8_t *)&buf, 0xCu);
  }

  objc_initWeak(&location, self);
  double v10 = +[PKPassLibrary sharedInstance];
  library = self->_library;
  self->_library = v10;

  v12 = +[PKCoreSpotlightUtilities transactionIdentifierFromSpotlightIdentifier:v8];
  transactionIdentifier = self->_transactionIdentifier;
  self->_transactionIdentifier = v12;

  objc_super v14 = +[PKCoreSpotlightUtilities passUniqueIdentifierFromSpotlightIdentifier:v8];
  v15 = v14;
  if (!v14)
  {
    v15 = +[PKCoreSpotlightUtilities passUniqueIdentifierFromCardInformationSpotlightIdentifier:v8];
  }
  p_passUniqueIdentifier = &self->_passUniqueIdentifier;
  objc_storeStrong((id *)&self->_passUniqueIdentifier, v15);
  if (!v14) {

  }
  if (self->_transactionIdentifier)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v71 = 0x3032000000;
    v72 = sub_10000526C;
    v73 = sub_10000527C;
    id v74 = 0;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x3032000000;
    v67[3] = sub_10000526C;
    v67[4] = sub_10000527C;
    id v68 = 0;
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x3032000000;
    v65[3] = sub_10000526C;
    v65[4] = sub_10000527C;
    id v66 = 0;
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x3032000000;
    v63[3] = sub_10000526C;
    v63[4] = sub_10000527C;
    id v64 = 0;
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x3032000000;
    v61[3] = sub_10000526C;
    v61[4] = sub_10000527C;
    id v62 = 0;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x3032000000;
    v59[3] = sub_10000526C;
    v59[4] = sub_10000527C;
    id v60 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x3032000000;
    v57[3] = sub_10000526C;
    v57[4] = sub_10000527C;
    id v58 = 0;
    v17 = (PKPaymentService *)objc_alloc_init((Class)PKPaymentService);
    paymentService = self->_paymentService;
    self->_paymentService = v17;

    id v19 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100005284;
    v52[3] = &unk_100008270;
    v52[4] = self;
    objc_copyWeak(&v56, &location);
    p_long long buf = &buf;
    id v20 = v8;
    id v53 = v20;
    v55 = v57;
    [v19 addOperation:v52];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10000552C;
    v50[3] = &unk_1000082C0;
    v50[4] = self;
    objc_copyWeak(&v51, &location);
    v50[5] = v59;
    [v19 addOperation:v50];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000056F4;
    v45[3] = &unk_100008310;
    objc_copyWeak(&v49, &location);
    v45[4] = self;
    v47 = v61;
    id v46 = v20;
    v48 = v57;
    [v19 addOperation:v45];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000059B8;
    v43[3] = &unk_100008360;
    v43[4] = &buf;
    objc_copyWeak(&v44, &location);
    v43[5] = v67;
    [v19 addOperation:v43];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100005BC0;
    v41[3] = &unk_100008360;
    v41[4] = &buf;
    objc_copyWeak(&v42, &location);
    v41[5] = v65;
    [v19 addOperation:v41];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100005DDC;
    v39[3] = &unk_100008360;
    v39[4] = &buf;
    objc_copyWeak(&v40, &location);
    v39[5] = v63;
    [v19 addOperation:v39];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100005FEC;
    v37[3] = &unk_100008400;
    objc_copyWeak(&v38, &location);
    v37[4] = &buf;
    v37[5] = v61;
    v37[6] = v59;
    v37[7] = v67;
    v37[8] = v65;
    v37[9] = v63;
    [v19 addOperation:v37];
    v21 = +[NSNull null];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100006428;
    v34[3] = &unk_100008428;
    id v35 = v29;
    v36 = v57;
    id v22 = [v19 evaluateWithInput:v21 completion:v34];

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);

    objc_destroyWeak(&v49);
    objc_destroyWeak(&v51);

    objc_destroyWeak(&v56);
    _Block_object_dispose(v57, 8);

    _Block_object_dispose(v59, 8);
    _Block_object_dispose(v61, 8);

    _Block_object_dispose(v63, 8);
    _Block_object_dispose(v65, 8);

    _Block_object_dispose(v67, 8);
    _Block_object_dispose(&buf, 8);
  }
  else if (*p_passUniqueIdentifier)
  {
    v23 = +[PKPassLibrary sharedInstance];
    v24 = self->_library;
    self->_library = v23;

    v25 = [(PKPassLibrary *)self->_library passWithUniqueID:*p_passUniqueIdentifier];
    if (v25)
    {
      objc_initWeak((id *)&buf, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006444;
      block[3] = &unk_100008450;
      objc_copyWeak(&v33, (id *)&buf);
      id v31 = v25;
      id v32 = v29;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)&buf);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Pass not found with identifier %@", (uint8_t *)&buf, 0xCu);
      }

      v27 = +[NSError errorWithDomain:@"PassbookQuicklookPreviewExtensionErrorDomain" code:2 userInfo:0];
      (*((void (**)(id, void *))v29 + 2))(v29, v27);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Non presentable identifier: %@", (uint8_t *)&buf, 0xCu);
    }

    v26 = +[NSError errorWithDomain:@"PassbookQuicklookPreviewExtensionErrorDomain" code:0 userInfo:0];
    (*((void (**)(id, void *))v29 + 2))(v29, v26);
  }
  objc_destroyWeak(&location);
}

- (void)preparePreviewOfFileAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Generating quicklook for file URL: %@", buf, 0xCu);
  }

  if (v6)
  {
    double v10 = +[NSData dataWithContentsOfURL:v6];
    id v14 = 0;
    id v11 = +[PKPass createWithData:v10 warnings:0 error:&v14];
    id v12 = v14;
    if (v11)
    {
      [v11 loadContentSync];
      [v11 loadImageSetSync:0 preheat:1];

      id v13 = [objc_alloc((Class)PKDashboardPassViewController) initWithPass:v11];
      [(PreviewViewController *)self _addVCToHierarchy:v13];
      v7[2](v7, 0);
    }
    else
    {

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Pass quicklook could not be generated with error %@", buf, 0xCu);
      }

      ((void (**)(id, id))v7)[2](v7, v12);
    }
  }
  else
  {
    id v11 = +[NSError errorWithDomain:@"PassbookQuicklookPreviewExtensionErrorDomain" code:2 userInfo:0];
    ((void (**)(id, id))v7)[2](v7, v11);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailVC, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end