void sub_100006F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100006FC4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = [WeakRetained currentSnapshot];
    v13 = [v12 sectionIdentifiers];
    v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));

    if ([v14 isEqualToString:@"OtherSection"])
    {
      v15 = [v7 dequeueReusableCellWithReuseIdentifier:@"OtherCellID" forIndexPath:v8];
      v16 = +[UIColor clearColor];
      v17 = [v15 contentView];
      [v17 setBackgroundColor:v16];
    }
    else
    {
      v15 = [v7 dequeueReusableCellWithReuseIdentifier:@"PersonCellID" forIndexPath:v8];
      v18 = [v11 view];
      [v18 frame];
      [v15 setActivitySheetWidth:v19];

      [v15 setDarkStyleOnLegacyApp:0];
      [v15 setStateBeingRestored:1];
      [v15 setDelegate:v11];
      [v15 setSessionID:v11[12]];
      v20 = [v11[3] nodeIDToNode];
      v16 = [v20 objectForKeyedSubscript:v9];

      [v15 setPerson:v16];
      id v21 = v11[9];
      v22 = [v16 realName];
      v17 = [v21 objectForKeyedSubscript:v22];

      if (v17) {
        objc_msgSend(v15, "restoreCellStateFromFinalTransferState:", objc_msgSend(v17, "integerValue"));
      }
      id v23 = v11[8];
      v24 = [v16 realName];
      v25 = [v23 objectForKeyedSubscript:v24];

      [v15 setProgress:v25];
      if (v25) {
        [v7 selectItemAtIndexPath:v8 animated:0 scrollPosition:0];
      }
      else {
        [v7 deselectItemAtIndexPath:v8 animated:0];
      }
      [v15 setSelected:v25 != 0];
      [v15 setStateBeingRestored:0];
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id sub_100007288(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ([v8 isEqualToString:UICollectionElementKindSectionHeader])
    {
      v11 = [v7 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:@"HeaderID" forIndexPath:v9];
      v12 = [WeakRetained currentSnapshot];
      v13 = [WeakRetained dataSource];
      v14 = [v13 itemIdentifierForIndexPath:v9];
      v15 = [v12 sectionIdentifierForSectionContainingItemIdentifier:v14];

      v16 = +[NSBundle mainBundle];
      v17 = [v16 localizedStringForKey:v15 value:&stru_100031788 table:0];
      v18 = [v11 titleLabel];
      [v18 setText:v17];

      goto LABEL_8;
    }
    double v19 = airdrop_ui_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_1000227D0();
    }
  }
  v11 = 0;
LABEL_8:

  return v11;
}

void sub_1000074FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id sub_100007520(uint64_t a1, uint64_t a2, void *a3)
{
  id v65 = a3;
  v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained traitCollection];
  id v8 = [v7 preferredContentSizeCategory];
  NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryExtraExtraLarge, v8);

  v10 = +[UIDevice currentDevice];
  id v11 = [v10 userInterfaceIdiom];

  id v12 = objc_loadWeakRetained(v5);
  v13 = [v12 currentSnapshot];
  v14 = [v13 sectionIdentifiers];

  v64 = v14;
  v63 = [v14 objectAtIndexedSubscript:a2];
  if ([v63 isEqualToString:@"OtherSection"])
  {
    v15 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    v16 = +[NSCollectionLayoutDimension absoluteDimension:234.0];
    v17 = +[NSCollectionLayoutSize sizeWithWidthDimension:v15 heightDimension:v16];
    v18 = +[NSCollectionLayoutItem itemWithLayoutSize:v17];
    double v19 = +[NSCollectionLayoutSize sizeWithWidthDimension:v15 heightDimension:v16];
    v67 = v18;
    v20 = +[NSArray arrayWithObjects:&v67 count:1];
    id v21 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v19 subitems:v20];

    v22 = +[NSCollectionLayoutSection sectionWithGroup:v21];
  }
  else
  {
    v15 = +[NSCollectionLayoutDimension estimatedDimension:100.0];
    NSComparisonResult v62 = v9;
    if (v9 == NSOrderedAscending)
    {
      uint64_t v24 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    }
    else
    {
      double v23 = 62.0;
      if (v11 == (id)6) {
        double v23 = 72.0;
      }
      uint64_t v24 = +[NSCollectionLayoutDimension estimatedDimension:v23];
    }
    v16 = (void *)v24;
    v17 = +[NSCollectionLayoutSize sizeWithWidthDimension:v24 heightDimension:v15];
    v18 = +[NSCollectionLayoutItem itemWithLayoutSize:v17];
    v25 = +[UIScreen mainScreen];
    [v25 _referenceBounds];
    double v27 = v26;
    double v29 = v28;

    id v30 = objc_loadWeakRetained(v5);
    v31 = [v30 view];
    [v31 directionalLayoutMargins];
    double v33 = v32;

    v34 = (char *)[UIApp activeInterfaceOrientation] - 3;
    LODWORD(v30) = SFDeviceModelCodeGet();
    v35 = +[UIDevice currentDevice];
    unint64_t v36 = (unint64_t)[v35 userInterfaceIdiom];

    unint64_t v37 = v36 & 0xFFFFFFFFFFFFFFFBLL;
    uint64_t v38 = 3;
    if (v30 != 2) {
      uint64_t v38 = 4;
    }
    if ((unint64_t)v34 >= 2) {
      uint64_t v39 = v38;
    }
    else {
      uint64_t v39 = 6;
    }
    if (v27 == 414.0) {
      double v40 = 20.0;
    }
    else {
      double v40 = 16.0;
    }
    BOOL v41 = v37 == 1 || v27 < 414.0;
    if (v37 == 1)
    {
      v42 = [v65 container];
      [v42 contentSize];
      if (v43 <= 414.0) {
        uint64_t v39 = 4;
      }
      else {
        uint64_t v39 = 6;
      }

      double v44 = 24.0;
    }
    else if (v29 == 568.0 && v27 == 320.0)
    {
      double v44 = 33.0;
    }
    else
    {
      double v44 = 26.0;
      if (v29 != 667.0 || v27 != 375.0)
      {
        if (v29 == 736.0 && v27 == 414.0)
        {
          double v44 = 30.0;
        }
        else if (v29 != 812.0 || v27 != 375.0)
        {
          BOOL v45 = v27 == 414.0 && v29 == 896.0;
          double v44 = 30.0;
          if (!v45) {
            double v44 = v33;
          }
        }
      }
    }
    double v46 = 12.0;
    if (!v41) {
      double v46 = 8.0;
    }
    double v47 = v44 - v46;
    if (v11 == (id)6) {
      uint64_t v48 = 4;
    }
    else {
      uint64_t v48 = v39;
    }
    if (v11 == (id)6) {
      double v49 = 8.0;
    }
    else {
      double v49 = v40;
    }
    if (v11 == (id)6) {
      double v50 = 8.0;
    }
    else {
      double v50 = 0.0;
    }
    if (v11 == (id)6) {
      double v51 = 32.0;
    }
    else {
      double v51 = 0.0;
    }
    if (v11 == (id)6) {
      double v52 = 16.0;
    }
    else {
      double v52 = v47;
    }
    v53 = +[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0, 8.0, 0.0, 16.0, 32.0);
    double v19 = +[NSCollectionLayoutSize sizeWithWidthDimension:v53 heightDimension:v15];

    if (v62 == NSOrderedAscending) {
      uint64_t v54 = 1;
    }
    else {
      uint64_t v54 = v48;
    }
    id v21 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v19 subitem:v18 count:v54];
    if (v11 == (id)6)
    {
      v55 = +[NSCollectionLayoutSpacing fixedSpacing:4.0];
      [v21 setInterItemSpacing:v55];
    }
    v22 = +[NSCollectionLayoutSection sectionWithGroup:v21];
    objc_msgSend(v22, "setContentInsets:", v50, v52, v51, v52);
    [v22 setInterGroupSpacing:v49];
    v56 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    v57 = +[NSCollectionLayoutDimension estimatedDimension:60.0];
    v58 = +[NSCollectionLayoutSize sizeWithWidthDimension:v56 heightDimension:v57];

    v59 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v58 elementKind:UICollectionElementKindSectionHeader alignment:1];
    v66 = v59;
    v60 = +[NSArray arrayWithObjects:&v66 count:1];
    [v22 setBoundarySupplementaryItems:v60];

    [v22 setSupplementariesFollowContentInsets:1];
  }

  return v22;
}

void sub_1000083F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008414(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained collectionView];
  [v3 setAlpha:1.0];

  id v5 = objc_loadWeakRetained(v1);
  v4 = [v5 airDropNoContentView];
  [v4 setAlpha:0.0];
}

void sub_10000876C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008794(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) && *(unsigned char *)(a1 + 41) && !*(unsigned char *)(a1 + 42)
    || (uint64_t v2 = (id *)(a1 + 32),
        id v3 = objc_loadWeakRetained((id *)(a1 + 32)),
        unsigned int v4 = [v3 canShowNoContentView],
        v3,
        !v4))
  {
    NSComparisonResult v9 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v11 = [WeakRetained collectionView];
    [v11 setAlpha:1.0];

    id v13 = objc_loadWeakRetained(v9);
    id v12 = [v13 airDropNoContentView];
    [v12 setAlpha:0.0];
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = [v5 collectionView];
    [v6 setAlpha:0.0];

    id v7 = objc_loadWeakRetained(v2);
    id v8 = [v7 airDropNoContentView];
    [v8 setAlpha:1.0];

    id v13 = objc_loadWeakRetained(v2);
    [v13 setCanShowNoContentView:0];
  }
}

void sub_100009068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000090AC(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained collectionView];
  [v3 setAlpha:0.0];

  id v5 = objc_loadWeakRetained(v1);
  unsigned int v4 = [v5 airDropNoContentView];
  [v4 setAlpha:1.0];
}

void sub_10000913C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    v1 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v3 = [WeakRetained airDropNoContentView];
    id v4 = [v3 viewType];

    if (!v4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100009228;
      v5[3] = &unk_100030FD8;
      objc_copyWeak(&v6, v1);
      +[UIView animateWithDuration:v5 animations:0.25];
      objc_destroyWeak(&v6);
    }
  }
}

void sub_100009214(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100009228(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained airDropNoContentView];
  [v3 setAlpha:0.0];

  id v5 = objc_loadWeakRetained(v1);
  id v4 = [v5 collectionView];
  [v4 setAlpha:1.0];
}

void sub_1000099F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *sub_10000A284(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "sf_personRealName");
  objc_msgSend(v3, "setSf_initiator:", 1);
  id v5 = [*(id *)(a1 + 32) realNamesWithTransfersStartedFromMagicHead];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6) {
    objc_msgSend(v3, "setSf_initiator:", 2);
  }
  [*(id *)(a1 + 32) subscribedProgress:v3 forPersonWithRealName:v4];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000A3A0;
  v10[3] = &unk_100031050;
  v10[4] = *(void *)(a1 + 32);
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_retainBlock(v10);

  return v8;
}

id sub_10000A3A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) unpublishedProgressForPersonWithRealName:*(void *)(a1 + 40)];
}

id sub_10000ADE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutAirDropCollectionViewAnimated:1];
}

void sub_10000B4EC(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = dispatch_get_global_queue(0, 0);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000B588;
    v5[3] = &unk_100031108;
    uint64_t v4 = *(void *)(a1 + 40);
    void v5[4] = *(void *)(a1 + 32);
    v5[5] = v4;
    dispatch_async(v3, v5);
  }
}

void sub_10000B588(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 136) waitUntilAllOperationsAreFinished];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(int *)(v2 + 152) >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void **)(v2 + 112);
      id v5 = *(void **)(v2 + 160);
      unsigned int v6 = +[NSNumber numberWithInt:v3];
      id v7 = [v5 objectForKeyedSubscript:v6];
      [v4 addObject:v7];

      uint64_t v3 = (v3 + 1);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    while ((int)v3 < *(_DWORD *)(v2 + 152));
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B6C8;
  v9[3] = &unk_100031108;
  uint64_t v8 = *(void *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  v9[5] = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

void sub_10000B6C8(uint64_t a1)
{
  [*(id *)(a1 + 32) generateSpecialPreviewPhotoForRequestID:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 129) = 1;
  uint64_t v2 = *(id **)(a1 + 32);
  id v3 = [v2[4] allObjects];
  [v2 startTransferForPeople:v3];
}

uint64_t sub_10000B74C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000BB8C(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) prepareWithActivityExtensionItemData:a2];
  id v3 = *(void **)(a1 + 32);

  return _[v3 performActivity];
}

void sub_10000C39C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isFileURL])
  {
    uint64_t v2 = [*(id *)(a1 + 32) path];
    id v3 = v2;
    if (v2)
    {
      uint64_t v4 = [v2 pathExtension];
      CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, v4, 0);
      if (PreferredIdentifierForTag)
      {
        CFStringRef v6 = PreferredIdentifierForTag;
        if (UTTypeConformsTo(PreferredIdentifierForTag, kUTTypeImage))
        {
          [*(id *)(a1 + 40) suggestedThumbnailSize];
          id v7 = +[UIScreen mainScreen];
          [v7 scale];
          uint64_t v8 = (void *)SFCreateThumbnailImage();
        }
        else
        {
          uint64_t v8 = 0;
        }
        CFRelease(v6);
      }
      else
      {
        NSComparisonResult v9 = airdrop_ui_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000229B4();
        }

        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v10 = +[SFAirDropPayload newPayloadWithURL:*(void *)(a1 + 32) description:*(void *)(a1 + 48) previewImage:v8 identifier:*(void *)(*(void *)(a1 + 40) + 104)];
  id v11 = *(id *)(*(void *)(a1 + 40) + 160);
  objc_sync_enter(v11);
  id v12 = *(void **)(*(void *)(a1 + 40) + 160);
  id v13 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v12 setObject:v10 forKeyedSubscript:v13];

  objc_sync_exit(v11);
}

void sub_10000C564(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C578(uint64_t a1)
{
  id v5 = +[SFAirDropPayload newPayloadWithURL:*(void *)(a1 + 32) description:*(void *)(a1 + 40) previewImage:*(void *)(a1 + 48) identifier:*(void *)(*(void *)(a1 + 56) + 104)];
  id v2 = *(id *)(*(void *)(a1 + 56) + 160);
  objc_sync_enter(v2);
  id v3 = *(void **)(*(void *)(a1 + 56) + 160);
  uint64_t v4 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  [v3 setObject:v5 forKeyedSubscript:v4];

  objc_sync_exit(v2);
}

void sub_10000C63C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C904(uint64_t a1)
{
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 1.0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 writeToFile:*(void *)(a1 + 40) atomically:1];
  id v2 = +[NSURL fileURLWithPath:*(void *)(a1 + 40)];
  id v3 = +[SFAirDropPayload newPayloadWithURL:v2 description:*(void *)(a1 + 48) previewImage:*(void *)(a1 + 56) identifier:*(void *)(*(void *)(a1 + 64) + 104)];

  id v4 = *(id *)(*(void *)(a1 + 64) + 160);
  objc_sync_enter(v4);
  id v5 = *(void **)(*(void *)(a1 + 64) + 160);
  CFStringRef v6 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  [v5 setObject:v3 forKeyedSubscript:v6];

  objc_sync_exit(v4);
}

void sub_10000CA10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CF90(uint64_t a1)
{
  [*(id *)(a1 + 32) writeToFile:*(void *)(a1 + 40) atomically:1];
  id v2 = +[NSURL fileURLWithPath:*(void *)(a1 + 40)];
  id v7 = +[SFAirDropPayload newPayloadWithURL:v2 description:*(void *)(a1 + 48) previewImage:*(void *)(a1 + 56) identifier:*(void *)(*(void *)(a1 + 64) + 104)];

  id v3 = *(id *)(*(void *)(a1 + 64) + 160);
  objc_sync_enter(v3);
  id v4 = *(void **)(*(void *)(a1 + 64) + 160);
  id v5 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  [v4 setObject:v7 forKeyedSubscript:v5];

  objc_sync_exit(v3);
  uint64_t v6 = *(void *)(a1 + 72);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

void sub_10000D0A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000D2CC(id a1, SFAirDropPayload *a2)
{
}

void sub_10000D820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D844(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000D854(uint64_t a1)
{
}

void sub_10000D85C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000D8C4(uint64_t a1)
{
  id v2 = +[PLPhotoLibrary photoOutboundSharingTmpDirectoryURL];
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) videoURL];
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) imageURL];
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) uniqueIdentifier];
  SFCreateLivePhotoBundle();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = +[SFAirDropPayload newPayloadWithURL:v10 description:*(void *)(a1 + 32) previewImage:*(void *)(a1 + 40) identifier:*(void *)(*(void *)(a1 + 48) + 104)];
  id v7 = *(id *)(*(void *)(a1 + 48) + 160);
  objc_sync_enter(v7);
  uint64_t v8 = *(void **)(*(void *)(a1 + 48) + 160);
  NSComparisonResult v9 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  [v8 setObject:v6 forKeyedSubscript:v9];

  objc_sync_exit(v7);
}

void sub_10000DA20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000DC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DC68(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000E2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E2D8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = airdrop_ui_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100022AAC(v7, v8);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000E858(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F26C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F3A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F578(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        NSComparisonResult v9 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v8);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v10 = objc_msgSend(v9, "attachments", 0);
        id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * (void)v14));
              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
}

void sub_10000F718(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [*(id *)(a1 + 32) attachmentNameForItem:v10];
  id v4 = [*(id *)(a1 + 32) subjectForItem:v10];
  if ((uint64_t)[*(id *)(a1 + 40) maxPreviews] >= 1)
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v5 >= (uint64_t)[*(id *)(a1 + 40) maxPreviews]) {
      goto LABEL_8;
    }
  }
  id v6 = [*(id *)(a1 + 32) previewImageForItem:v10];
  if (v6)
  {
LABEL_4:
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    goto LABEL_9;
  }
  uint64_t v7 = [*(id *)(a1 + 32) previewImageDataForItem:v10];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v6 = +[UIImage imageWithData:v7];

    if (v6) {
      goto LABEL_4;
    }
  }
  else
  {
LABEL_8:
    id v6 = 0;
  }
LABEL_9:
  NSComparisonResult v9 = [*(id *)(a1 + 32) dataTypeForItem:v10];
  [*(id *)(a1 + 48) addItemProvider:v10 withDataType:v9 attachmentName:v3 description:v4 previewImage:v6];
}

void sub_10000F9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000FA04(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasItemConformingToTypeIdentifier:@"com.apple.ShareUI.airdrop.supplementalSecurityContext"])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    uint64_t v4 = *(void *)(a1 + 40);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000FAF8;
    v5[3] = &unk_100031350;
    objc_copyWeak(&v7, (id *)(a1 + 48));
    id v6 = *(id *)(a1 + 32);
    [v3 loadItemForTypeIdentifier:@"com.apple.ShareUI.airdrop.supplementalSecurityContext" options:v4 completionHandler:v5];

    objc_destroyWeak(&v7);
  }
}

void sub_10000FAE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000FAF8(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained startAccessingSecurityScopedResourcesInContext:v4];

  id v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

uint64_t sub_100010DE4()
{
  uint64_t v0 = sub_100022D80();
  sub_10001CF50(v0, qword_100037AA8);
  uint64_t v1 = sub_10001CE68(v0, (uint64_t)qword_100037AA8);
  if (qword_100037AD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001CE68(v0, (uint64_t)qword_100038198);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t variable initialization expression of AirDropDiscoveryViewController.securityContexts()
{
  type metadata accessor for AirDropUtilities.SecurityContexts();
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = &_swiftEmptyArrayStorage;
  return v0;
}

uint64_t variable initialization expression of AirDropDiscoveryViewController.delegate()
{
  return 0;
}

uint64_t AirDropDiscoveryViewController.delegate.getter()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t AirDropDiscoveryViewController.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*AirDropDiscoveryViewController.delegate.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  swift_beginAccess();
  v3[3] = swift_unknownObjectWeakLoadStrong();
  return sub_100011028;
}

void sub_100011028(void **a1, char a2)
{
  id v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

uint64_t variable initialization expression of AirDropDiscoveryViewController.pendingTransferID()
{
  return sub_100022F30();
}

void *variable initialization expression of AirDropDiscoveryViewController.currentTransfersByEndpointID()
{
  return &_swiftEmptyDictionarySingleton;
}

id AirDropDiscoveryViewController.__allocating_init(hostAppBundleID:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return AirDropDiscoveryViewController.init(hostAppBundleID:)(a1, a2);
}

id AirDropDiscoveryViewController.init(hostAppBundleID:)(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  v15[1] = a1;
  v15[2] = a2;
  ObjectType = (objc_class *)swift_getObjectType();
  v15[0] = sub_100022CC0();
  uint64_t v4 = *(void *)(v15[0] - 8);
  __chkstk_darwin();
  id v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100022E90();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  id v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100022C20();
  __chkstk_darwin();
  uint64_t v11 = OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_securityContexts;
  type metadata accessor for AirDropUtilities.SecurityContexts();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v3;
  swift_defaultActor_initialize();
  *(void *)(v12 + 112) = &_swiftEmptyArrayStorage;
  *(void *)&v3[v11] = v12;
  *(void *)&v13[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_activityExtensionItemData] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v13[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_tapHandleTask] = 0;
  *(void *)&v13[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_existingItemDataTask] = 0;
  sub_100022C10();
  sub_100022F30();
  *(void *)&v13[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_currentTransfersByEndpointID] = &_swiftEmptyDictionarySingleton;
  sub_100022ED0();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for SFAirDropClient.Identifier.shareSheet(_:), v7);
  *(void *)&v13[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_airDropClient] = sub_100022EA0();
  swift_retain();
  sub_100022C50();
  (*(void (**)(char *, char *, void))(v4 + 32))(&v13[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_airDropDiscoveryView], v6, v15[0]);

  v17.receiver = v13;
  v17.super_class = ObjectType;
  return objc_msgSendSuper2(&v17, "initWithNibName:bundle:", 0, 0);
}

Swift::Void __swiftcall AirDropDiscoveryViewController.viewDidLoad()()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_100022CC0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v65 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v64 - v7;
  uint64_t v9 = sub_100022C40();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_100023070();
  __chkstk_darwin(v10 - 8);
  v67.receiver = v0;
  v67.super_class = ObjectType;
  objc_msgSendSuper2(&v67, "viewDidLoad");
  sub_100023060();
  sub_100022C30();
  sub_1000230A0();
  NSString v11 = sub_100023080();
  swift_bridgeObjectRelease();
  [v0 setTitle:v11];

  id v12 = [objc_allocWithZone((Class)UINavigationBarAppearance) init];
  [v12 configureWithTransparentBackground];
  uint64_t v13 = self;
  id v14 = v12;
  id v15 = [v13 separatorColor];
  [v14 setShadowColor:v15];

  id v16 = [v0 navigationItem];
  id v64 = v14;
  [v16 setScrollEdgeAppearance:v14];

  id v17 = [objc_allocWithZone((Class)UINavigationBarAppearance) init];
  [v17 configureWithDefaultBackground];
  id v18 = v17;
  id v19 = [v13 separatorColor];
  [v18 setShadowColor:v19];

  id v20 = [v0 navigationItem];
  [v20 setStandardAppearance:v18];

  long long v21 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v21(v8, &v0[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_airDropDiscoveryView], v3);
  id v22 = objc_allocWithZone((Class)type metadata accessor for AirDropHostingController(0));
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v21(v65, v8, v3);
  double v23 = (void *)sub_100022F40();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);
  [v0 addChildViewController:v23];
  id v24 = [v0 view];
  if (!v24)
  {
    __break(1u);
    goto LABEL_14;
  }
  v25 = v24;
  id v26 = [v23 view];
  if (!v26)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  double v27 = v26;
  [v25 addSubview:v26];

  [v23 didMoveToParentViewController:v1];
  id v28 = [v23 view];
  if (!v28)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  double v29 = v28;
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  sub_100011CD0(&qword_100037B20);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_1000276B0;
  id v31 = [v23 view];
  if (!v31)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  double v32 = v31;
  id v33 = [v31 topAnchor];

  id v34 = [v1 view];
  if (!v34)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v35 = v34;
  id v36 = [v34 topAnchor];

  id v37 = [v33 constraintEqualToAnchor:v36];
  *(void *)(v30 + 32) = v37;
  id v38 = [v23 view];
  if (!v38)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v39 = v38;
  id v40 = [v38 bottomAnchor];

  id v41 = [v1 view];
  if (!v41)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v42 = v41;
  id v43 = [v41 bottomAnchor];

  id v44 = [v40 constraintEqualToAnchor:v43];
  *(void *)(v30 + 40) = v44;
  id v45 = [v23 view];
  if (!v45)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  double v46 = v45;
  id v47 = [v45 leadingAnchor];

  id v48 = [v1 view];
  if (!v48)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  double v49 = v48;
  id v50 = [v48 leadingAnchor];

  id v51 = [v47 constraintEqualToAnchor:v50];
  *(void *)(v30 + 48) = v51;
  id v52 = [v23 view];
  if (!v52)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v53 = v52;
  id v54 = [v52 trailingAnchor];

  id v55 = [v1 view];
  if (v55)
  {
    v56 = v55;
    v57 = self;
    id v58 = [v56 trailingAnchor];

    id v59 = [v54 constraintEqualToAnchor:v58];
    *(void *)(v30 + 56) = v59;
    uint64_t v66 = v30;
    sub_100023110();
    sub_10001D6BC(0, &qword_100037B28);
    Class isa = sub_1000230E0().super.isa;
    swift_bridgeObjectRelease();
    [v57 activateConstraints:isa];

    v61 = self;
    id v62 = [v61 defaultCenter];
    [v62 addObserver:v1 selector:"willEnterForegroundWithNotification:" name:UIApplicationWillEnterForegroundNotification object:0];

    id v63 = [v61 defaultCenter];
    [v63 addObserver:v1 selector:"didEnterBackgroundWithNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];

    return;
  }
LABEL_23:
  __break(1u);
}

uint64_t type metadata accessor for AirDropHostingController(uint64_t a1)
{
  return sub_10001A4A0(a1, (uint64_t *)&unk_100037BF0);
}

uint64_t sub_100011CD0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

Swift::Void __swiftcall AirDropDiscoveryViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_100011CD0(&qword_100037B30);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.receiver = v2;
  v15.super_class = ObjectType;
  objc_msgSendSuper2(&v15, "viewWillAppear:", a1);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v8 = [v2 navigationItem];
  sub_10001D6BC(0, &qword_100037B38);
  sub_10001D6BC(0, &qword_100037B40);
  swift_retain();
  v16.value.super.super.Class isa = (Class)sub_100023250();
  v16.is_nil = 0;
  Class isa = sub_100023240(UIBarButtonSystemItemDone, v16, v17).super.super.isa;
  [v8 setRightBarButtonItem:isa];

  uint64_t v10 = sub_100023190();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_100023170();
  NSString v11 = v2;
  uint64_t v12 = sub_100023160();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v11;
  uint64_t v14 = sub_100013504((uint64_t)v7, (uint64_t)&unk_100037B50, (uint64_t)v13);
  swift_release();
  *(void *)&v11[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_tapHandleTask] = v14;
  swift_release();
}

uint64_t sub_100011FBC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100011FF4()
{
  uint64_t v0 = sub_100022CC0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = (void *)result;
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, result + OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_airDropDiscoveryView, v0);

    sub_100022C80();
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return result;
}

uint64_t sub_10001210C()
{
  return sub_100011FF4();
}

uint64_t sub_100012114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a4;
  uint64_t v5 = sub_100022C20();
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  sub_100011CD0(&qword_100037C70);
  v4[13] = swift_task_alloc();
  uint64_t v6 = sub_100011CD0(&qword_100037C78);
  v4[14] = v6;
  v4[15] = *(void *)(v6 - 8);
  v4[16] = swift_task_alloc();
  uint64_t v7 = sub_100011CD0(&qword_100037C80);
  v4[17] = v7;
  v4[18] = *(void *)(v7 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = sub_100023170();
  v4[21] = sub_100023160();
  uint64_t v9 = sub_100023140();
  v4[22] = v9;
  v4[23] = v8;
  return _swift_task_switch(sub_1000122FC, v9, v8);
}

uint64_t sub_1000122FC()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[14];
  sub_100022CA0();
  sub_100022D90();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[24] = sub_100023160();
  uint64_t v4 = sub_10001D948(&qword_100037C88, &qword_100037C80);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[25] = v5;
  void *v5 = v0;
  v5[1] = sub_100012434;
  uint64_t v6 = v0[17];
  uint64_t v7 = v0[13];
  return dispatch thunk of AsyncIteratorProtocol.next()(v7, v6, v4);
}

uint64_t sub_100012434()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 192);
  if (v0)
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = sub_100023140();
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_1000127E8;
  }
  else
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = sub_100023140();
      uint64_t v6 = v8;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_1000125CC;
  }
  return _swift_task_switch(v7, v4, v6);
}

uint64_t sub_1000125CC()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 184);
  return _swift_task_switch(sub_100012630, v1, v2);
}

uint64_t sub_100012630()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
    swift_release();
    swift_beginAccess();
    Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      [Strong airDropViewServiceDidRequestDismissal];
      swift_unknownObjectRelease();
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[12], v1, v2);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[27] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_10001298C;
    uint64_t v8 = v0[12];
    return sub_100012D88(v8);
  }
}

uint64_t sub_1000127E8()
{
  v0[8] = v0[26];
  sub_100011CD0(&qword_100037C90);
  swift_willThrowTypedImpl();
  swift_release();
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[23];
  return _swift_task_switch(sub_10001287C, v1, v2);
}

uint64_t sub_10001287C()
{
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v3 = v0[17];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong airDropViewServiceDidRequestDismissal];
    swift_unknownObjectRelease();
  }
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10001298C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 184);
  uint64_t v3 = *(void *)(v1 + 176);
  return _swift_task_switch(sub_100012AAC, v3, v2);
}

uint64_t sub_100012AAC()
{
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  v0[24] = sub_100023160();
  uint64_t v1 = sub_10001D948(&qword_100037C88, &qword_100037C80);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[25] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100012434;
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[13];
  return dispatch thunk of AsyncIteratorProtocol.next()(v4, v3, v1);
}

uint64_t sub_100012BA0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100012BE0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100012C94;
  return sub_100012114(a1, v4, v5, v6);
}

uint64_t sub_100012C94()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100012D88(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  sub_100011CD0(&qword_100037CA0);
  v2[8] = swift_task_alloc();
  uint64_t v3 = sub_100022F20();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  uint64_t v4 = sub_100022C20();
  v2[12] = v4;
  v2[13] = *(void *)(v4 - 8);
  v2[14] = swift_task_alloc();
  sub_100023170();
  v2[15] = sub_100023160();
  uint64_t v6 = sub_100023140();
  v2[16] = v6;
  v2[17] = v5;
  return _swift_task_switch(sub_100012F08, v6, v5);
}

uint64_t sub_100012F08()
{
  double v29 = v0;
  if (qword_100037AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[12];
  uint64_t v5 = sub_100022D80();
  sub_10001CE68(v5, (uint64_t)qword_100037AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v1, v4);
  uint64_t v6 = sub_100022D60();
  os_log_type_t v7 = sub_100023220();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[13];
  uint64_t v9 = v0[14];
  uint64_t v11 = v0[12];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_10001D0EC(&qword_100037CB0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v13 = sub_100023380();
    v0[5] = sub_10001B048(v13, v14, &v28);
    sub_100023260();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "User selected endpoint with UUID: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(v10 + 8))(v0[14], v0[12]);
  }

  objc_super v15 = (uint64_t *)(v0[7] + OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_currentTransfersByEndpointID);
  swift_beginAccess();
  uint64_t v16 = *v15;
  if (*(void *)(v16 + 16) && (unint64_t v17 = sub_10001EF98(v0[6]), (v18 & 1) != 0))
  {
    uint64_t v19 = v0[9];
    uint64_t v20 = v0[10];
    uint64_t v21 = v0[8];
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 16))(v21, *(void *)(v16 + 56) + *(void *)(v20 + 72) * v17, v19);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v20 + 56))(v21, 0, 1, v19);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v21, 1, v19) != 1)
    {
      (*(void (**)(void, void, void))(v0[10] + 32))(v0[11], v0[8], v0[9]);
      swift_endAccess();
      id v22 = (void *)swift_task_alloc();
      v0[18] = v22;
      void *v22 = v0;
      v22[1] = sub_10001333C;
      uint64_t v23 = v0[11];
      uint64_t v24 = v0[6];
      return sub_10001924C(v23, v24);
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[10] + 56))(v0[8], 1, 1, v0[9]);
  }
  uint64_t v26 = v0[6];
  sub_10001D59C(v0[8], &qword_100037CA0);
  swift_endAccess();
  swift_release();
  sub_1000141C4(v26);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  double v27 = (uint64_t (*)(void))v0[1];
  return v27();
}

uint64_t sub_10001333C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return _swift_task_switch(sub_10001345C, v3, v2);
}

uint64_t sub_10001345C()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100013504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100023190();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100023180();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10001D59C(a1, &qword_100037B30);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100023140();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

Swift::Void __swiftcall AirDropDiscoveryViewController.viewDidDisappear(_:)(Swift::Bool a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v4, "viewDidDisappear:", a1);
  uint64_t v3 = OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_tapHandleTask;
  if (*(void *)&v1[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_tapHandleTask])
  {
    swift_retain();
    sub_1000231A0();
    swift_release();
  }
  *(void *)&v1[v3] = 0;
  swift_release();
  *(void *)&v1[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_existingItemDataTask] = 0;
  swift_release();
  sub_1000137C0();
}

void sub_1000137C0()
{
  uint64_t v1 = sub_100022BD0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v43 - v6;
  uint64_t v8 = v0 + OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_currentTransfersByEndpointID;
  swift_beginAccess();
  if (*(void *)(*(void *)v8 + 16))
  {
    if (qword_100037AA0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_100022D80();
    sub_10001CE68(v9, (uint64_t)qword_100037AA8);
    uint64_t v10 = sub_100022D60();
    os_log_type_t v11 = sub_1000231E0();
    if (!os_log_type_enabled(v10, v11)) {
      goto LABEL_12;
    }
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    uint64_t v13 = "Could not clear temporary files, transfer in progress";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v13, v12, 2u);
    swift_slowDealloc();
LABEL_12:

    return;
  }
  if (*(void *)(v0 + OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_existingItemDataTask))
  {
    if (qword_100037AA0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_100022D80();
    sub_10001CE68(v14, (uint64_t)qword_100037AA8);
    uint64_t v10 = sub_100022D60();
    os_log_type_t v11 = sub_1000231E0();
    if (!os_log_type_enabled(v10, v11)) {
      goto LABEL_12;
    }
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    uint64_t v13 = "Could not clear temporary files, picker is still showing";
    goto LABEL_11;
  }
  objc_super v15 = NSTemporaryDirectory();
  sub_100023090();

  sub_100022B80();
  swift_bridgeObjectRelease();
  id v47 = self;
  id v16 = [v47 defaultManager];
  sub_100022B70();
  NSString v17 = sub_100023080();
  swift_bridgeObjectRelease();
  id v18 = [v16 enumeratorAtPath:v17];

  id v49 = v18;
  if (v18)
  {
    id v48 = v7;
    uint64_t v20 = (void (**)(char *, uint64_t))(v2 + 8);
    double v46 = (char *)&type metadata for Any + 8;
    *(void *)&long long v19 = 136315138;
    long long v44 = v19;
    *(void *)&long long v19 = 136315394;
    long long v43 = v19;
    uint64_t v45 = v1;
    while (1)
    {
      if (objc_msgSend(v49, "nextObject", (void)v43, *((void *)&v43 + 1)))
      {
        sub_100023280();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v52, 0, sizeof(v52));
      }
      sub_10001DA64((uint64_t)v52, (uint64_t)v53, &qword_100037C48);
      if (!v53[3])
      {

        sub_10001D59C((uint64_t)v53, &qword_100037C48);
        goto LABEL_38;
      }
      if ((swift_dynamicCast() & 1) == 0) {
        break;
      }
      uint64_t v21 = v50;
      unint64_t v22 = v51;
      if (qword_100037AA0 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_100022D80();
      sub_10001CE68(v23, (uint64_t)qword_100037AA8);
      swift_bridgeObjectRetain_n();
      uint64_t v24 = sub_100022D60();
      os_log_type_t v25 = sub_100023220();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = swift_slowAlloc();
        v53[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = v44;
        swift_bridgeObjectRetain();
        *(void *)(v26 + 4) = sub_10001B048(v21, v22, (uint64_t *)v53);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Removing stale AirDrop download %s", (uint8_t *)v26, 0xCu);
        swift_arrayDestroy();
        uint64_t v1 = v45;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      id v27 = [v47 defaultManager];
      sub_100022BC0();
      sub_100022BB0(v28);
      uint64_t v30 = v29;
      (*v20)(v5, v1);
      v53[0] = 0;
      unsigned int v31 = [v27 removeItemAtURL:v30 error:v53];

      id v32 = v53[0];
      if (v31)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        id v33 = v32;
        sub_100022B60();

        swift_willThrow();
        swift_errorRetain();
        swift_bridgeObjectRetain();
        swift_errorRetain();
        id v34 = sub_100022D60();
        os_log_type_t v35 = sub_100023200();
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = swift_slowAlloc();
          id v37 = (void *)swift_slowAlloc();
          v53[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v36 = v43;
          swift_bridgeObjectRetain();
          *(void *)(v36 + 4) = sub_10001B048(v21, v22, (uint64_t *)v53);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v36 + 12) = 2112;
          swift_errorRetain();
          uint64_t v38 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v36 + 14) = v38;
          *id v37 = v38;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v34, v35, "Failed to delete file %s %@", (uint8_t *)v36, 0x16u);
          sub_100011CD0(&qword_100037C50);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          swift_errorRelease();
        }
        else
        {
          swift_errorRelease();
          swift_bridgeObjectRelease_n();
          swift_errorRelease();
          swift_errorRelease();
        }
        uint64_t v1 = v45;
      }
    }

LABEL_38:
    (*v20)(v48, v1);
  }
  else
  {
    if (qword_100037AA0 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_100022D80();
    sub_10001CE68(v39, (uint64_t)qword_100037AA8);
    id v40 = sub_100022D60();
    os_log_type_t v41 = sub_100023200();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Failed to create enumerator for AirDropHashDB directory", v42, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  }
}

uint64_t sub_1000140CC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v6 = sub_100022B50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100022B40();
  id v10 = a1;
  a4();

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_1000141C4(uint64_t a1)
{
  uint64_t v3 = sub_100011CD0(&qword_100037B30);
  __chkstk_darwin(v3 - 8);
  v113 = (char *)&v97 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100022F20();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v110 = (char *)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_100022CD0();
  uint64_t v106 = *(void *)(v107 - 8);
  __chkstk_darwin(v107);
  v108 = (uint64_t *)((char *)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_100022CE0();
  uint64_t v112 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v111 = (char *)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100022C20();
  uint64_t v118 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  v114 = (char *)&v97 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v105 = (char *)&v97 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v116 = (char *)&v97 - v17;
  uint64_t v109 = v18;
  __chkstk_darwin(v16);
  v101 = (char *)&v97 - v19;
  uint64_t v20 = sub_100011CD0(&qword_100037CD0);
  __chkstk_darwin(v20 - 8);
  unint64_t v22 = (char *)&v97 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100022DC0();
  v115 = *(uint8_t **)(v23 - 8);
  __chkstk_darwin(v23);
  os_log_type_t v25 = (char *)&v97 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100011CD0(&qword_100037CA0);
  uint64_t v27 = __chkstk_darwin(v26 - 8);
  v104 = (void (*)(char *, uint64_t, uint64_t))((char *)&v97 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v97 - v29;
  v117 = v1;
  unsigned int v31 = &v1[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_currentTransfersByEndpointID];
  swift_beginAccess();
  v103 = v31;
  uint64_t v32 = *(void *)v31;
  uint64_t v33 = *(void *)(v32 + 16);
  uint64_t v119 = v5;
  uint64_t v120 = a1;
  if (v33)
  {
    unint64_t v34 = sub_10001EF98(a1);
    if (v35)
    {
      uint64_t v5 = v119;
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v30, *(void *)(v32 + 56) + *(void *)(v6 + 72) * v34, v119);
      uint64_t v36 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56);
      id v37 = v30;
      uint64_t v38 = 0;
    }
    else
    {
      uint64_t v36 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56);
      id v37 = v30;
      uint64_t v38 = 1;
      uint64_t v5 = v119;
    }
  }
  else
  {
    uint64_t v36 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56);
    id v37 = v30;
    uint64_t v38 = 1;
  }
  v102 = v36;
  v36((uint64_t)v37, v38, 1, v5);
  swift_endAccess();
  int v39 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v30, 1, v5);
  sub_10001D59C((uint64_t)v30, &qword_100037CA0);
  if (v39 == 1)
  {
    uint64_t v40 = v6;
    uint64_t v100 = v9;
    uint64_t v41 = v120;
    v99 = &v117[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_airDropDiscoveryView];
    sub_100022C90();
    v42 = v115;
    int v43 = (*((uint64_t (**)(char *, uint64_t, uint64_t))v115 + 6))(v22, 1, v23);
    v114 = (char *)v11;
    if (v43 == 1)
    {
      sub_10001D59C((uint64_t)v22, &qword_100037CD0);
      uint64_t v44 = v118;
      if (qword_100037AA0 != -1) {
        swift_once();
      }
      uint64_t v45 = sub_100022D80();
      sub_10001CE68(v45, (uint64_t)qword_100037AA8);
      double v46 = v101;
      uint64_t v47 = v41;
      id v48 = *(void (**)(char *, uint64_t, uint64_t))(v44 + 16);
      v48(v101, v47, v11);
      id v49 = sub_100022D60();
      os_log_type_t v50 = sub_100023200();
      if (os_log_type_enabled(v49, v50))
      {
        unint64_t v51 = (uint8_t *)swift_slowAlloc();
        v123[0] = swift_slowAlloc();
        *(_DWORD *)unint64_t v51 = 136315138;
        v115 = v51 + 4;
        sub_10001D0EC(&qword_100037CB0, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v52 = sub_100023380();
        uint64_t v121 = sub_10001B048(v52, v53, v123);
        uint64_t v11 = (uint64_t)v114;
        sub_100023260();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v118 + 8))(v46, v11);
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "Could not resolve endpoint UUID: %s", v51, 0xCu);
        swift_arrayDestroy();
        uint64_t v44 = v118;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v11);
      }
    }
    else
    {
      (*((void (**)(char *, char *, uint64_t))v42 + 4))(v25, v22, v23);
      uint64_t v62 = sub_1000223C8((uint64_t)v25);
      uint64_t v64 = v63;
      uint64_t v65 = sub_1000223C8((uint64_t)v25);
      uint64_t v67 = v66;
      uint64_t v68 = sub_1000223E0((uint64_t)v25);
      uint64_t v70 = v69;
      id v71 = objc_allocWithZone((Class)SFShareSheetRecipient);
      id v72 = sub_10001A63C(v62, v64, v65, v67, (uint64_t)&_swiftEmptySetSingleton, v68, v70);
      swift_beginAccess();
      Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        [Strong airDropViewServiceWillStartTransferToRecipient:v72];
        swift_unknownObjectRelease();
      }

      (*((void (**)(char *, uint64_t))v115 + 1))(v25, v23);
      uint64_t v44 = v118;
      id v48 = *(void (**)(char *, uint64_t, uint64_t))(v118 + 16);
      uint64_t v11 = (uint64_t)v114;
    }
    uint64_t v74 = v120;
    uint64_t v76 = (uint64_t)v116;
    v75 = v117;
    v48(v116, v120, v11);
    v78 = (uint8_t *)(v40 + 16);
    v77 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
    uint64_t v79 = (uint64_t)v104;
    v101 = &v75[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_pendingTransferID];
    uint64_t v80 = v119;
    v98 = v77;
    ((void (*)(void (*)(char *, uint64_t, uint64_t)))v77)(v104);
    v115 = v78;
    v102(v79, 0, 1, v80);
    swift_beginAccess();
    sub_1000150C8(v79, v76);
    swift_endAccess();
    if (qword_100037AA0 != -1) {
      swift_once();
    }
    uint64_t v81 = sub_100022D80();
    sub_10001CE68(v81, (uint64_t)qword_100037AA8);
    v82 = v105;
    v104 = v48;
    v48(v105, v74, v11);
    v83 = sub_100022D60();
    os_log_type_t v84 = sub_100023220();
    if (os_log_type_enabled(v83, v84))
    {
      v85 = (uint8_t *)swift_slowAlloc();
      v123[0] = swift_slowAlloc();
      *(_DWORD *)v85 = 136315138;
      sub_10001D0EC(&qword_100037CB0, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v86 = sub_100023380();
      uint64_t v122 = sub_10001B048(v86, v87, v123);
      uint64_t v44 = v118;
      uint64_t v11 = (uint64_t)v114;
      sub_100023260();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v82, v11);
      _os_log_impl((void *)&_mh_execute_header, v83, v84, "Starting send to endpoint %s", v85, 0xCu);
      swift_arrayDestroy();
      uint64_t v74 = v120;
      swift_slowDealloc();
      v75 = v117;
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v44 + 8))(v82, v11);
    }

    uint64_t v88 = v107;
    v89 = v108;
    void *v108 = nullsub_2;
    v89[1] = 0;
    (*(void (**)(void *, void, uint64_t))(v106 + 104))(v89, enum case for _DDNodeDecoration.Kind.waiting(_:), v88);
    sub_100022F50();
    v98(v110, v101, v119);
    v90 = v111;
    sub_100022CF0();
    sub_100022C60();
    uint64_t v91 = sub_100023190();
    uint64_t v92 = (uint64_t)v113;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v113, 1, 1, v91);
    v93 = v116;
    v104(v116, v74, v11);
    unint64_t v94 = (*(unsigned __int8 *)(v44 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    uint64_t v95 = swift_allocObject();
    *(void *)(v95 + 16) = v75;
    (*(void (**)(unint64_t, char *, uint64_t))(v44 + 32))(v95 + v94, v93, v11);
    v96 = v75;
    sub_1000231B0();
    swift_release();
    swift_release();
    sub_10001D59C(v92, &qword_100037B30);
    (*(void (**)(char *, uint64_t))(v112 + 8))(v90, v100);
  }
  else
  {
    uint64_t v54 = v118;
    if (qword_100037AA0 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_100022D80();
    sub_10001CE68(v55, (uint64_t)qword_100037AA8);
    v56 = v114;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v114, v120, v11);
    v57 = sub_100022D60();
    os_log_type_t v58 = sub_1000231F0();
    if (os_log_type_enabled(v57, v58))
    {
      id v59 = (uint8_t *)swift_slowAlloc();
      v123[0] = swift_slowAlloc();
      *(_DWORD *)id v59 = 136315138;
      sub_10001D0EC(&qword_100037CB0, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v60 = sub_100023380();
      uint64_t v121 = sub_10001B048(v60, v61, v123);
      sub_100023260();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v11);
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "Ongoing send already present for %s", v59, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v11);
    }
  }
}

uint64_t sub_1000150C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100011CD0(&qword_100037CA0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100022F20();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_10001D59C(a1, &qword_100037CA0);
    sub_10001B83C(a2, (uint64_t)v8);
    uint64_t v13 = sub_100022C20();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_10001D59C((uint64_t)v8, &qword_100037CA0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_10001C250((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_100022C20();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_1000152F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[37] = a2;
  v3[38] = a3;
  sub_100011CD0(&qword_100037CA0);
  v3[39] = swift_task_alloc();
  uint64_t v4 = sub_100022E80();
  v3[40] = v4;
  v3[41] = *(void *)(v4 - 8);
  v3[42] = swift_task_alloc();
  uint64_t v5 = sub_100022F20();
  v3[43] = v5;
  v3[44] = *(void *)(v5 - 8);
  v3[45] = swift_task_alloc();
  uint64_t v6 = sub_100022C20();
  v3[46] = v6;
  v3[47] = *(void *)(v6 - 8);
  v3[48] = swift_task_alloc();
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  uint64_t v7 = sub_100011CD0(&qword_100037CE8);
  v3[51] = v7;
  v3[52] = *(void *)(v7 - 8);
  v3[53] = swift_task_alloc();
  v3[54] = swift_task_alloc();
  uint64_t v8 = sub_100022E10();
  v3[55] = v8;
  v3[56] = *(void *)(v8 - 8);
  v3[57] = swift_task_alloc();
  uint64_t v9 = sub_100022F00();
  v3[58] = v9;
  v3[59] = *(void *)(v9 - 8);
  v3[60] = swift_task_alloc();
  sub_100011CD0(&qword_100037CF0);
  v3[61] = swift_task_alloc();
  uint64_t v10 = sub_100022BD0();
  v3[62] = v10;
  v3[63] = *(void *)(v10 - 8);
  v3[64] = swift_task_alloc();
  v3[65] = swift_task_alloc();
  uint64_t v11 = sub_100022E60();
  v3[66] = v11;
  v3[67] = *(void *)(v11 - 8);
  v3[68] = swift_task_alloc();
  v3[69] = swift_task_alloc();
  v3[70] = sub_100023170();
  v3[71] = sub_100023160();
  uint64_t v12 = (void *)swift_task_alloc();
  v3[72] = v12;
  void *v12 = v3;
  v12[1] = sub_100015738;
  return sub_1000183EC();
}

uint64_t sub_100015738(uint64_t a1)
{
  uint64_t v2 = (void *)*v1;
  v2[73] = a1;
  swift_task_dealloc();
  uint64_t v4 = sub_100023140();
  v2[74] = v4;
  v2[75] = v3;
  return _swift_task_switch(sub_100015888, v4, v3);
}

uint64_t sub_100015888()
{
  uint64_t v20 = v0;
  if (v0[73])
  {
    v0[76] = sub_100023160();
    uint64_t v2 = sub_100023140();
    v0[77] = v2;
    v0[78] = v1;
    return _swift_task_switch(sub_100015C24, v2, v1);
  }
  else
  {
    swift_release();
    if (qword_100037AA0 != -1) {
      swift_once();
    }
    uint64_t v4 = v0[47];
    uint64_t v3 = v0[48];
    uint64_t v5 = v0[46];
    uint64_t v6 = v0[38];
    uint64_t v7 = sub_100022D80();
    sub_10001CE68(v7, (uint64_t)qword_100037AA8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
    uint64_t v8 = sub_100022D60();
    os_log_type_t v9 = sub_100023200();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v12 = v0[47];
    uint64_t v11 = v0[48];
    uint64_t v13 = v0[46];
    if (v10)
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      sub_10001D0EC(&qword_100037CB0, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v15 = sub_100023380();
      v0[30] = sub_10001B048(v15, v16, &v19);
      sub_100023260();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Could not send items to endpoint %s due to lack of extension item data or sending app bundle ID", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(void, void))(v12 + 8))(v0[48], v0[46]);
    }

    sub_100018DB8(v0[38], 0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = (uint64_t (*)(void))v0[1];
    return v17();
  }
}

uint64_t sub_100015C24()
{
  v0[79] = OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_delegate;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[80] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    v0[2] = v0;
    v0[7] = v0 + 24;
    v0[3] = sub_100015D9C;
    uint64_t v3 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_100019FD0;
    v0[13] = &unk_100031560;
    v0[14] = v3;
    [v2 airDropViewServiceRequestingSendingAppBundleIdentifierWithCompletionHandler:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    swift_release();
    uint64_t v4 = v0[75];
    uint64_t v5 = v0[74];
    return _swift_task_switch(sub_1000164A4, v5, v4);
  }
}

uint64_t sub_100015D9C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 624);
  uint64_t v2 = *(void *)(*(void *)v0 + 616);
  return _swift_task_switch(sub_100015EA4, v2, v1);
}

uint64_t sub_100015EA4()
{
  swift_release();
  *(_OWORD *)(v0 + 648) = *(_OWORD *)(v0 + 192);
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 600);
  uint64_t v2 = *(void *)(v0 + 592);
  return _swift_task_switch(sub_100015F24, v2, v1);
}

uint64_t sub_100015F24()
{
  uint64_t v36 = v0;
  uint64_t v1 = *(void **)(v0 + 584);
  if (*(void *)(v0 + 656))
  {
    id v2 = [*(id *)(v0 + 584) extensionItems];
    sub_10001D6BC(0, &qword_100037D00);
    unint64_t v3 = sub_1000230F0();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_100023340();
    }
    else
    {
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    uint64_t v5 = (char *)&_swiftEmptyArrayStorage;
    if (!v4)
    {
LABEL_18:
      swift_bridgeObjectRelease_n();
      uint64_t v14 = &_swiftEmptyArrayStorage;
      char v35 = &_swiftEmptyArrayStorage;
      uint64_t v15 = *((void *)v5 + 2);
      if (v15)
      {
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v15; ++i)
        {
          unint64_t v17 = swift_bridgeObjectRetain();
          sub_10001C8F0(v17);
        }
        swift_bridgeObjectRelease();
        uint64_t v14 = v35;
      }
      uint64_t v18 = *(void *)(v0 + 296);
      swift_bridgeObjectRelease();
      *(void *)(v0 + 664) = v14;
      *(void *)(v0 + 672) = *(void *)(v18 + OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_securityContexts);
      return _swift_task_switch(sub_1000167C8, 0, 0);
    }
    if (v4 >= 1)
    {
      for (uint64_t j = 0; j != v4; ++j)
      {
        if ((v3 & 0xC000000000000001) != 0) {
          id v7 = (id)sub_1000232E0();
        }
        else {
          id v7 = *(id *)(v3 + 8 * j + 32);
        }
        uint64_t v8 = v7;
        id v9 = [v7 attachments];
        if (v9)
        {
          BOOL v10 = v9;
          sub_10001D6BC(0, &qword_100037D10);
          uint64_t v11 = sub_1000230F0();

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v5 = sub_10001AE98(0, *((void *)v5 + 2) + 1, 1, v5);
          }
          unint64_t v13 = *((void *)v5 + 2);
          unint64_t v12 = *((void *)v5 + 3);
          if (v13 >= v12 >> 1) {
            uint64_t v5 = sub_10001AE98((char *)(v12 > 1), v13 + 1, 1, v5);
          }
          *((void *)v5 + 2) = v13 + 1;
          *(void *)&v5[8 * v13 + 32] = v11;
        }
        else
        {
        }
      }
      goto LABEL_18;
    }
    __break(1u);
    goto LABEL_34;
  }
  swift_release();

  if (qword_100037AA0 != -1) {
LABEL_34:
  }
    swift_once();
  uint64_t v20 = *(void *)(v0 + 376);
  uint64_t v19 = *(void *)(v0 + 384);
  uint64_t v21 = *(void *)(v0 + 368);
  uint64_t v22 = *(void *)(v0 + 304);
  uint64_t v23 = sub_100022D80();
  sub_10001CE68(v23, (uint64_t)qword_100037AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19, v22, v21);
  uint64_t v24 = sub_100022D60();
  os_log_type_t v25 = sub_100023200();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v28 = *(void *)(v0 + 376);
  uint64_t v27 = *(void *)(v0 + 384);
  uint64_t v29 = *(void *)(v0 + 368);
  if (v26)
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    char v35 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315138;
    sub_10001D0EC(&qword_100037CB0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v31 = sub_100023380();
    *(void *)(v0 + 240) = sub_10001B048(v31, v32, (uint64_t *)&v35);
    sub_100023260();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Could not send items to endpoint %s due to lack of extension item data or sending app bundle ID", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(v28 + 8))(*(void *)(v0 + 384), *(void *)(v0 + 368));
  }

  sub_100018DB8(*(void *)(v0 + 304), 0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_1000164A4()
{
  uint64_t v19 = v0;
  uint64_t v1 = (void *)v0[73];
  swift_release();

  if (qword_100037AA0 != -1) {
    swift_once();
  }
  uint64_t v3 = v0[47];
  uint64_t v2 = v0[48];
  uint64_t v4 = v0[46];
  uint64_t v5 = v0[38];
  uint64_t v6 = sub_100022D80();
  sub_10001CE68(v6, (uint64_t)qword_100037AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v7 = sub_100022D60();
  os_log_type_t v8 = sub_100023200();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v11 = v0[47];
  uint64_t v10 = v0[48];
  uint64_t v12 = v0[46];
  if (v9)
  {
    unint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)unint64_t v13 = 136315138;
    sub_10001D0EC(&qword_100037CB0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v14 = sub_100023380();
    v0[30] = sub_10001B048(v14, v15, &v18);
    sub_100023260();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Could not send items to endpoint %s due to lack of extension item data or sending app bundle ID", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(v11 + 8))(v0[48], v0[46]);
  }

  sub_100018DB8(v0[38], 0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_1000167C8()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 680) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 664);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 688) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000168B0;
  return withTaskGroup<A, B>(of:returning:isolation:body:)();
}

uint64_t sub_1000168B0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_1000169C8, 0, 0);
}

uint64_t sub_1000169C8()
{
  return _swift_task_switch(sub_1000169E4, *(void *)(v0 + 592), *(void *)(v0 + 600));
}

uint64_t sub_1000169E4()
{
  unint64_t v1 = v0[83];
  uint64_t v2 = (void *)v0[73];
  sub_100023020();
  uint64_t v3 = (char *)sub_100022FF0();
  v0[87] = OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_airDropDiscoveryView;
  uint64_t v4 = sub_100022CB0();
  uint64_t v6 = sub_100021210(v2, v1, v3, v4, v5);
  v0[88] = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v7 = (void *)swift_task_alloc();
  v0[89] = v7;
  *id v7 = v0;
  v7[1] = sub_100016B00;
  return static SFAirDropSend.loadItemPromises(_:customPayload:)(v6, 0, 0xF000000000000000);
}

uint64_t sub_100016B00(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[90] = a1;
  v3[91] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = v3[75];
    uint64_t v5 = v3[74];
    uint64_t v6 = sub_100017E04;
  }
  else
  {
    uint64_t v4 = v3[75];
    uint64_t v5 = v3[74];
    uint64_t v6 = sub_100016C58;
  }
  return _swift_task_switch(v6, v5, v4);
}

uint64_t sub_100016C58()
{
  uint64_t v79 = v0;
  uint64_t v1 = v0[90];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[67];
    uint64_t v4 = v0[63];
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v3 += 16;
    uint64_t v76 = v5;
    uint64_t v6 = v1 + ((*(unsigned __int8 *)(v3 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 64));
    uint64_t v75 = *(void *)(v3 + 56);
    uint64_t v68 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56);
    uint64_t v69 = (void (**)(uint64_t, uint64_t))(v0[59] + 8);
    uint64_t v74 = (void (**)(uint64_t, uint64_t))(v3 - 8);
    uint64_t v64 = v4;
    uint64_t v66 = (void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
    uint64_t v67 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
    swift_bridgeObjectRetain();
    id v71 = &_swiftEmptyArrayStorage;
    uint64_t v63 = v6;
    uint64_t v7 = v2;
    uint64_t v65 = v2;
    do
    {
      uint64_t v9 = v0[69];
      uint64_t v10 = v0[66];
      uint64_t v11 = v0[61];
      uint64_t v12 = v0[62];
      uint64_t v13 = v0[60];
      uint64_t v14 = v0[58];
      v76(v9, v6, v10);
      sub_100022E40();
      sub_100022EF0();
      (*v69)(v13, v14);
      (*v68)(v11, 0, 1, v12);
      v73 = *v74;
      (*v74)(v9, v10);
      if ((*v67)(v11, 1, v12) == 1)
      {
        sub_10001D59C(v0[61], &qword_100037CF0);
        uint64_t v8 = v65;
      }
      else
      {
        uint64_t v15 = v0[65];
        uint64_t v16 = v0[64];
        uint64_t v17 = v0[62];
        uint64_t v18 = *v66;
        (*v66)(v15, v0[61], v17);
        v18(v16, v15, v17);
        unint64_t v19 = (unint64_t)v71;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v19 = sub_10001AC18(0, v71[2] + 1, 1, (unint64_t)v71, &qword_100037D28, (uint64_t (*)(void))&type metadata accessor for URL, (uint64_t (*)(void))&type metadata accessor for URL);
        }
        uint64_t v8 = v65;
        unint64_t v21 = *(void *)(v19 + 16);
        unint64_t v20 = *(void *)(v19 + 24);
        if (v21 >= v20 >> 1) {
          unint64_t v19 = sub_10001AC18(v20 > 1, v21 + 1, 1, v19, &qword_100037D28, (uint64_t (*)(void))&type metadata accessor for URL, (uint64_t (*)(void))&type metadata accessor for URL);
        }
        uint64_t v22 = v0[64];
        uint64_t v23 = v0[62];
        *(void *)(v19 + 16) = v21 + 1;
        id v71 = (void *)v19;
        v18(v19+ ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80))+ *(void *)(v64 + 72) * v21, v22, v23);
      }
      v6 += v75;
      --v7;
    }
    while (v7);
    uint64_t v24 = v0[56];
    swift_bridgeObjectRelease();
    uint64_t v70 = (void (**)(uint64_t, uint64_t))(v24 + 8);
    swift_bridgeObjectRetain();
    os_log_type_t v25 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v26 = v63;
    do
    {
      uint64_t v27 = v25;
      uint64_t v28 = v0[68];
      uint64_t v29 = v0[66];
      uint64_t v30 = v0[57];
      uint64_t v31 = v0[55];
      uint64_t v32 = v26;
      ((void (*)(uint64_t))v76)(v28);
      sub_100022E50();
      uint64_t v33 = sub_100022DF0();
      unint64_t v35 = v34;
      (*v70)(v30, v31);
      v73(v28, v29);
      if (v35 >> 60 == 15)
      {
        os_log_type_t v25 = v27;
      }
      else
      {
        os_log_type_t v25 = v27;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          os_log_type_t v25 = sub_10001AB08(0, *((void *)v27 + 2) + 1, 1, v27);
        }
        unint64_t v37 = *((void *)v25 + 2);
        unint64_t v36 = *((void *)v25 + 3);
        if (v37 >= v36 >> 1) {
          os_log_type_t v25 = sub_10001AB08((char *)(v36 > 1), v37 + 1, 1, v25);
        }
        *((void *)v25 + 2) = v37 + 1;
        uint64_t v38 = &v25[16 * v37];
        *((void *)v38 + 4) = v33;
        *((void *)v38 + 5) = v35;
      }
      uint64_t v26 = v32 + v75;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease_n();
    int v39 = v71;
  }
  else
  {
    swift_bridgeObjectRelease();
    os_log_type_t v25 = (char *)&_swiftEmptyArrayStorage;
    int v39 = &_swiftEmptyArrayStorage;
  }
  v0[92] = v39;
  if (qword_100037AA0 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_100022D80();
  v0[93] = sub_10001CE68(v40, (uint64_t)qword_100037AA8);
  swift_bridgeObjectRetain_n();
  uint64_t v41 = sub_100022D60();
  os_log_type_t v42 = sub_100023220();
  id v72 = v39;
  if (os_log_type_enabled(v41, v42))
  {
    v77 = v25;
    uint64_t v43 = swift_slowAlloc();
    uint64_t v78 = swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 134218499;
    v0[34] = v39[2];
    sub_100023260();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2160;
    v0[35] = 1752392040;
    sub_100023260();
    *(_WORD *)(v43 + 22) = 2081;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_100023100();
    unint64_t v46 = v45;
    swift_bridgeObjectRelease();
    v0[36] = sub_10001B048(v44, v46, &v78);
    uint64_t v47 = v0;
    sub_100023260();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "Loaded items (count=%ld): %{private,mask.hash}s", (uint8_t *)v43, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    os_log_type_t v25 = v77;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v47 = v0;
    swift_bridgeObjectRelease_n();
  }

  swift_bridgeObjectRetain_n();
  id v48 = sub_100022D60();
  os_log_type_t v49 = sub_100023220();
  if (os_log_type_enabled(v48, v49))
  {
    os_log_type_t v50 = v47;
    unint64_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v78 = swift_slowAlloc();
    *(_DWORD *)unint64_t v51 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_100023100();
    unint64_t v54 = v53;
    swift_bridgeObjectRelease();
    v47[33] = sub_10001B048(v52, v54, &v78);
    sub_100023260();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "Item preview data %s", v51, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();

    os_log_type_t v50 = v47;
  }
  if (*((void *)v25 + 2))
  {
    uint64_t v55 = *((void *)v25 + 4);
    unint64_t v56 = *((void *)v25 + 5);
    sub_10001D5F8(v55, v56);
  }
  else
  {
    uint64_t v55 = 0;
    unint64_t v56 = 0xF000000000000000;
  }
  v50[95] = v56;
  v50[94] = v55;
  swift_bridgeObjectRelease();
  v57 = (void *)swift_task_alloc();
  v50[96] = v57;
  void *v57 = v50;
  v57[1] = sub_1000174CC;
  uint64_t v58 = v50[82];
  uint64_t v59 = v50[81];
  uint64_t v60 = v50[54];
  uint64_t v61 = v50[38];
  return SFAirDropClient.send(_:to:itemPreviewData:requestSource:onlyExchange:)(v60, v72, v61, v55, v56, v59, v58, 0);
}

uint64_t sub_1000174CC()
{
  uint64_t v2 = (void *)*v1;
  v2[97] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  unint64_t v3 = v2[95];
  uint64_t v4 = v2[94];
  if (v0)
  {
    sub_10001D650(v4, v3);
    swift_bridgeObjectRelease();
    uint64_t v5 = v2[75];
    uint64_t v6 = v2[74];
    uint64_t v7 = sub_1000180F8;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_10001D650(v4, v3);
    uint64_t v5 = v2[75];
    uint64_t v6 = v2[74];
    uint64_t v7 = sub_100017678;
  }
  return _swift_task_switch(v7, v6, v5);
}

uint64_t sub_100017678()
{
  uint64_t v47 = v0;
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong airDropViewServiceDidStartTransfer];
    swift_unknownObjectRelease();
  }
  uint64_t v2 = v0[50];
  uint64_t v3 = v0[46];
  uint64_t v4 = v0[47];
  uint64_t v5 = v0[38];
  (*(void (**)(void, void, void))(v0[52] + 16))(v0[53], v0[54], v0[51]);
  unint64_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v45(v2, v5, v3);
  uint64_t v6 = sub_100022D60();
  os_log_type_t v7 = sub_1000231E0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[52];
  uint64_t v11 = v0[50];
  uint64_t v10 = v0[51];
  uint64_t v13 = v0[46];
  uint64_t v12 = v0[47];
  if (v8)
  {
    uint64_t v41 = v0[46];
    os_log_type_t type = v7;
    uint64_t v14 = v0[44];
    uint64_t v15 = v0[45];
    uint64_t v16 = v0[42];
    uint64_t v38 = v0[43];
    uint64_t v17 = v0[41];
    uint64_t v37 = v0[40];
    uint64_t v39 = v0[47];
    uint64_t v18 = v0[53];
    uint64_t v40 = v0[50];
    uint64_t v19 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 136315394;
    log = v6;
    uint64_t v20 = v18;
    sub_100022EE0();
    sub_100022E70();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v37);
    sub_10001D0EC(&qword_100037CB8, (void (*)(uint64_t))&type metadata accessor for SFAirDrop.TransferIdentifier);
    uint64_t v21 = sub_100023380();
    unint64_t v23 = v22;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v38);
    v0[31] = sub_10001B048(v21, v23, &v46);
    sub_100023260();
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v24(v20, v10);
    *(_WORD *)(v19 + 12) = 2080;
    sub_10001D0EC(&qword_100037CB0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v25 = sub_100023380();
    v0[32] = sub_10001B048(v25, v26, &v46);
    sub_100023260();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v40, v41);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Adding current transfer %s for endpoint %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v24(v0[53], v0[51]);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  v0[98] = v24;
  uint64_t v27 = v0[49];
  uint64_t v28 = v0[44];
  os_log_t loga = (os_log_t)v0[43];
  uint64_t v29 = v0[41];
  uint64_t v30 = v0[42];
  uint64_t v32 = v0[39];
  uint64_t v31 = v0[40];
  v45(v27, v0[38], v0[46]);
  sub_100022EE0();
  sub_100022E70();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v31);
  (*(void (**)(uint64_t, void, uint64_t, os_log_t))(v28 + 56))(v32, 0, 1, loga);
  swift_beginAccess();
  sub_1000150C8(v32, v27);
  swift_endAccess();
  uint64_t v33 = (void *)swift_task_alloc();
  v0[99] = v33;
  *uint64_t v33 = v0;
  v33[1] = sub_100017B48;
  uint64_t v34 = v0[54];
  uint64_t v35 = v0[38];
  return AirDropDiscoveryView.handleTransferUpdates(transferUpdates:endpointUUID:)(v34, v35);
}

uint64_t sub_100017B48(char a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  *(unsigned char *)(v3 + 216) = a1;
  *(void *)(v3 + 208) = v1;
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v2 + 600);
  uint64_t v5 = *(void *)(v2 + 592);
  return _swift_task_switch(sub_100017C70, v5, v4);
}

uint64_t sub_100017C70()
{
  swift_release();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong airDropViewServiceDidFinishTransferWithSuccess:*(unsigned __int8 *)(v0 + 216)];
    swift_unknownObjectRelease();
  }
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 784);
  uint64_t v3 = *(void **)(v0 + 584);
  uint64_t v4 = *(void *)(v0 + 432);
  uint64_t v5 = *(void *)(v0 + 408);
  sub_100018A08(*(void *)(v0 + 304));

  v2(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100017E04()
{
  uint64_t v13 = v0;
  uint64_t v1 = v0[91];
  swift_release();
  if (qword_100037AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100022D80();
  sub_10001CE68(v2, (uint64_t)qword_100037AA8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = sub_100022D60();
  os_log_type_t v4 = sub_100023200();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_getErrorValue();
    uint64_t v6 = sub_1000233A0();
    v0[29] = sub_10001B048(v6, v7, &v12);
    sub_100023260();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "send failed %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v8 = (void *)v0[73];
  uint64_t v9 = v0[38];
  swift_errorRetain();
  sub_100018DB8(v9, v1);

  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_1000180F8()
{
  uint64_t v13 = v0;
  uint64_t v1 = v0[97];
  swift_release();
  if (qword_100037AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100022D80();
  sub_10001CE68(v2, (uint64_t)qword_100037AA8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = sub_100022D60();
  os_log_type_t v4 = sub_100023200();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_getErrorValue();
    uint64_t v6 = sub_1000233A0();
    v0[29] = sub_10001B048(v6, v7, &v12);
    sub_100023260();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "send failed %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v8 = (void *)v0[73];
  uint64_t v9 = v0[38];
  swift_errorRetain();
  sub_100018DB8(v9, v1);

  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_1000183EC()
{
  v1[4] = v0;
  sub_100011CD0(&qword_100037B30);
  v1[5] = swift_task_alloc();
  sub_100023170();
  v1[6] = sub_100023160();
  uint64_t v3 = sub_100023140();
  v1[7] = v3;
  v1[8] = v2;
  return _swift_task_switch(sub_1000184B4, v3, v2);
}

uint64_t sub_1000184B4()
{
  uint64_t v1 = (char *)v0[4];
  uint64_t v2 = OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_existingItemDataTask;
  uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_existingItemDataTask];
  v0[9] = v3;
  if (v3)
  {
    swift_retain();
    os_log_type_t v4 = (void *)swift_task_alloc();
    v0[10] = v4;
    uint64_t v5 = sub_100011CD0(&qword_100037D68);
    void *v4 = v0;
    v4[1] = sub_1000186D0;
    uint64_t v6 = v0 + 3;
    uint64_t v7 = v3;
  }
  else
  {
    uint64_t v8 = v0[5];
    uint64_t v9 = sub_100023190();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
    *(void *)(swift_allocObject() + 16) = v1;
    uint64_t v10 = v1;
    uint64_t v11 = sub_100011CD0(&qword_100037D68);
    uint64_t v12 = sub_1000231B0();
    v0[11] = v12;
    swift_release();
    sub_10001D59C(v8, &qword_100037B30);
    *(void *)&v1[v2] = v12;
    swift_retain();
    swift_release();
    uint64_t v13 = (void *)swift_task_alloc();
    v0[12] = v13;
    void *v13 = v0;
    v13[1] = sub_10001886C;
    uint64_t v6 = v0 + 2;
    uint64_t v7 = v12;
    uint64_t v5 = v11;
  }
  return Task<>.value.getter(v6, v7, v5);
}

uint64_t sub_1000186D0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return _swift_task_switch(sub_1000187F0, v3, v2);
}

uint64_t sub_1000187F0()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10001886C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return _swift_task_switch(sub_10001898C, v3, v2);
}

uint64_t sub_10001898C()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

void sub_100018A08(uint64_t a1)
{
  uint64_t v3 = sub_100011CD0(&qword_100037CA0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100022C20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v27 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - v10;
  if (qword_100037AA0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100022D80();
  sub_10001CE68(v12, (uint64_t)qword_100037AA8);
  unint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v26(v11, a1, v6);
  uint64_t v13 = sub_100022D60();
  os_log_type_t v14 = sub_1000231E0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v24 = v5;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v25 = v1;
    v29[0] = v17;
    uint64_t v23 = a1;
    *(_DWORD *)uint64_t v16 = 136315138;
    unint64_t v22 = v16 + 4;
    sub_10001D0EC(&qword_100037CB0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v18 = sub_100023380();
    uint64_t v28 = sub_10001B048(v18, v19, v29);
    a1 = v23;
    sub_100023260();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Removing current transfer for endpoint %s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v5 = v24;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }

  uint64_t v20 = (uint64_t)v27;
  v26(v27, a1, v6);
  uint64_t v21 = sub_100022F20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v5, 1, 1, v21);
  swift_beginAccess();
  sub_1000150C8((uint64_t)v5, v20);
  swift_endAccess();
  sub_1000137C0();
}

uint64_t sub_100018DB8(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = a2;
  uint64_t v3 = sub_100022F20();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v35 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100022CD0();
  uint64_t v31 = *(void *)(v6 - 8);
  uint64_t v32 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (uint64_t *)((char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_100022CE0();
  uint64_t v33 = *(void *)(v9 - 8);
  uint64_t v34 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100022CC0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100011CD0(&qword_100037CA0);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100022C20();
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v22 + 16);
  uint64_t v37 = a1;
  v23(v21, a1);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
  uint64_t v36 = v3;
  v24(v18, 1, 1, v3);
  uint64_t v25 = v29;
  swift_beginAccess();
  sub_1000150C8((uint64_t)v18, (uint64_t)v21);
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v25 + OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_airDropDiscoveryView, v12);
  if (v30)
  {
    swift_getErrorValue();
    uint64_t v26 = sub_1000233A0();
  }
  else
  {
    unint64_t v27 = 0xED0000726F727265;
    uint64_t v26 = 0x206E776F6E6B6E75;
  }
  *uint64_t v8 = v26;
  v8[1] = v27;
  (*(void (**)(uint64_t *, void, uint64_t))(v31 + 104))(v8, enum case for _DDNodeDecoration.Kind.failed(_:), v32);
  sub_100022F50();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v35, v25 + OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_pendingTransferID, v36);
  sub_100022CF0();
  sub_100022C60();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v34);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_10001924C(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  uint64_t v4 = sub_100022C20();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  uint64_t v5 = sub_100022F20();
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  sub_100023170();
  v3[15] = sub_100023160();
  uint64_t v7 = sub_100023140();
  v3[16] = v7;
  v3[17] = v6;
  return _swift_task_switch(sub_1000193B0, v7, v6);
}

uint64_t sub_1000193B0()
{
  uint64_t v21 = v0;
  if (qword_100037AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v5 = sub_100022D80();
  v0[18] = sub_10001CE68(v5, (uint64_t)qword_100037AA8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[19] = v6;
  v0[20] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v2, v1, v3);
  uint64_t v7 = sub_100022D60();
  os_log_type_t v8 = sub_100023220();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[14];
  uint64_t v11 = v0[11];
  uint64_t v12 = v0[12];
  if (v9)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    sub_10001D0EC(&qword_100037CB8, (void (*)(uint64_t))&type metadata accessor for SFAirDrop.TransferIdentifier);
    uint64_t v14 = sub_100023380();
    v0[4] = sub_10001B048(v14, v15, &v20);
    sub_100023260();
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v16(v10, v11);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Attempting to cancel transferID %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v16(v10, v11);
  }

  v0[21] = v16;
  uint64_t v17 = (void *)swift_task_alloc();
  v0[22] = v17;
  void *v17 = v0;
  v17[1] = sub_100019674;
  uint64_t v18 = v0[5];
  return SFAirDropClient.cancelTransfer(_:)(v18);
}

uint64_t sub_100019674()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 136);
  uint64_t v4 = *(void *)(v2 + 128);
  if (v0) {
    uint64_t v5 = sub_10001982C;
  }
  else {
    uint64_t v5 = sub_1000197B0;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1000197B0()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001982C()
{
  uint64_t v28 = v0;
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[19];
  uint64_t v2 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[9];
  uint64_t v8 = v0[5];
  uint64_t v7 = v0[6];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
  v1(v2, v8, v3);
  BOOL v9 = sub_100022D60();
  os_log_type_t v10 = sub_100023200();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v26 = (void (*)(uint64_t, uint64_t))v0[21];
    uint64_t v11 = v0[10];
    uint64_t v24 = v0[11];
    uint64_t v25 = v0[13];
    uint64_t v13 = v0[8];
    uint64_t v12 = v0[9];
    uint64_t v14 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315394;
    sub_10001D0EC(&qword_100037CB0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v15 = sub_100023380();
    v0[2] = sub_10001B048(v15, v16, &v27);
    sub_100023260();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    *(_WORD *)(v14 + 12) = 2080;
    sub_10001D0EC(&qword_100037CB8, (void (*)(uint64_t))&type metadata accessor for SFAirDrop.TransferIdentifier);
    uint64_t v17 = sub_100023380();
    v0[3] = sub_10001B048(v17, v18, &v27);
    sub_100023260();
    swift_bridgeObjectRelease();
    v26(v25, v24);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Cancel failed for endpoint %s, removing transferID %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[21];
    uint64_t v20 = v0[13];
    uint64_t v21 = v0[11];
    (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
    v19(v20, v21);
  }

  sub_100018A08(v0[6]);
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_100019B5C(uint64_t a1, uint64_t a2)
{
  v2[19] = a1;
  v2[20] = a2;
  sub_100023170();
  v2[21] = sub_100023160();
  uint64_t v4 = sub_100023140();
  v2[22] = v4;
  v2[23] = v3;
  return _swift_task_switch(sub_100019BF4, v4, v3);
}

uint64_t sub_100019BF4()
{
  id v1 = [objc_allocWithZone((Class)AirDropExtensionActivity) init];
  *(void *)(v0 + 192) = v1;
  [v1 setMaxPreviews:3];
  id v2 = [v1 itemDataRequest];
  *(void *)(v0 + 200) = v2;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 208) = Strong;
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 144;
    *(void *)(v0 + 24) = sub_100019DD0;
    uint64_t v5 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_100019F6C;
    *(void *)(v0 + 104) = &unk_1000315A0;
    *(void *)(v0 + 112) = v5;
    [v4 airDropViewServiceRequestingSharedItemsWithDataRequest:v2 completionHandler:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
  else
  {

    swift_release();
    **(void **)(v0 + 152) = 0;
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_100019DD0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 184);
  uint64_t v2 = *(void *)(*(void *)v0 + 176);
  return _swift_task_switch(sub_100019ED8, v2, v1);
}

uint64_t sub_100019ED8()
{
  uint64_t v1 = *(void **)(v0 + 200);

  swift_release();
  uint64_t v2 = *(void *)(v0 + 144);
  swift_unknownObjectRelease();

  **(void **)(v0 + 152) = v2;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100019F6C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40);
  id v4 = a2;
  sub_10001DA64((uint64_t)&v6, v3, &qword_100037D68);
  return swift_continuation_resume();
}

uint64_t sub_100019FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v3 = sub_100023090();
  }
  else {
    uint64_t v3 = 0;
  }
  v5[0] = v3;
  v5[1] = a2;
  sub_10001DA64((uint64_t)v5, *(void *)(*(void *)(v2 + 64) + 40), &qword_100037D50);
  return swift_continuation_resume();
}

id AirDropDiscoveryViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    NSString v6 = sub_100023080();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

void AirDropDiscoveryViewController.init(nibName:bundle:)()
{
}

id AirDropDiscoveryViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_10001A278(void *a1, uint64_t a2, void *a3)
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  sub_100023330();
  __break(1u);
}

void sub_10001A2FC(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  v9.receiver = a1;
  v9.super_class = (Class)type metadata accessor for AirDropHostingController(0);
  id v6 = a3;
  id v7 = v9.receiver;
  objc_msgSendSuper2(&v9, "setContentScrollView:forEdge:", v6, a4);
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  objc_msgSend(Strong, "setContentScrollView:forEdge:", v6, a4, v9.receiver, v9.super_class);
}

void sub_10001A3A4()
{
}

void sub_10001A3D4()
{
}

uint64_t sub_10001A404()
{
  return swift_unknownObjectWeakDestroy();
}

id sub_10001A414()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AirDropHostingController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001A44C()
{
  return swift_unknownObjectWeakDestroy();
}

unint64_t variable initialization expression of AirDropNavigationController.AirDropNoContentViewKey()
{
  return 0xD000000000000011;
}

uint64_t sub_10001A478()
{
  return type metadata accessor for AirDropDiscoveryViewController(0);
}

uint64_t type metadata accessor for AirDropDiscoveryViewController(uint64_t a1)
{
  return sub_10001A4A0(a1, (uint64_t *)&unk_100037B80);
}

uint64_t sub_10001A4A0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001A4D8()
{
  uint64_t result = sub_100022CC0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_100022F20();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_10001A5D4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10001A620()
{
  return type metadata accessor for AirDropHostingController(0);
}

void type metadata accessor for CFBoolean(uint64_t a1)
{
}

id sub_10001A63C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2)
  {
    NSString v11 = sub_100023080();
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    NSString v11 = 0;
    if (a4)
    {
LABEL_3:
      NSString v12 = sub_100023080();
      swift_bridgeObjectRelease();
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      v13.super.Class isa = 0;
      if (a7) {
        goto LABEL_5;
      }
LABEL_9:
      NSString v14 = 0;
      goto LABEL_10;
    }
  }
  NSString v12 = 0;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  v13.super.Class isa = sub_1000231D0().super.isa;
  swift_bridgeObjectRelease();
  if (!a7) {
    goto LABEL_9;
  }
LABEL_5:
  NSString v14 = sub_100023080();
  swift_bridgeObjectRelease();
LABEL_10:
  id v15 = [v7 initWithRealName:v11 displayName:v12 formattedHandles:v13.super.isa contactIdentifier:v14];

  return v15;
}

uint64_t sub_10001A754(uint64_t result, unsigned char **a2)
{
  unint64_t v2 = *a2;
  *unint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10001A764(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10001A7A0(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10001A87C;
  return v6(a1);
}

uint64_t sub_10001A87C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001A974(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_10001A9AC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001A9D4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001AC18(a1, a2, a3, a4, &qword_100037D40, (uint64_t (*)(void))&type metadata accessor for SFAirDropSend.ItemPromise, (uint64_t (*)(void))&type metadata accessor for SFAirDropSend.ItemPromise);
}

char *sub_10001A9F8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100011CD0(&qword_100037D38);
      os_log_type_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      NSSet v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      os_log_type_t v10 = (char *)&_swiftEmptyArrayStorage;
      NSSet v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10001D4A8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10001AB08(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100011CD0(&qword_100037D30);
      os_log_type_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      NSSet v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      os_log_type_t v10 = (char *)&_swiftEmptyArrayStorage;
      NSSet v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10001D854(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001AC18(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    unint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100011CD0(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_100023320();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001D6F8(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

char *sub_10001AE98(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100011CD0(&qword_100037D18);
      os_log_type_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      os_log_type_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10001D39C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001AFA8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001AFD0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10001B048(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100023260();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10001B048(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001B11C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001CEF0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10001CEF0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001CEA0((uint64_t)v12);
  return v7;
}

uint64_t sub_10001B11C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100023270();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001B2D8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100023300();
  if (!v8)
  {
    sub_100023320();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100023370();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10001B2D8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001B370(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001B550(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001B550(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001B370(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10001B4E8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000232D0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100023320();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000230C0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100023370();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100023320();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001B4E8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100011CD0(&qword_100037C58);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001B550(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100011CD0(&qword_100037C58);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100023370();
  __break(1u);
  return result;
}

unsigned char **sub_10001B6A0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_10001B6B0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_100023370();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

void sub_10001B754(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_100023260();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_10001B80C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10001B83C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10001EF98(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10001C548();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_100022C20();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = sub_100022F20();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, v12 + *(void *)(v20 + 72) * v6, v13);
    sub_10001BF08(v6, v9);
    uint64_t *v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_100022F20();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_10001BA0C(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v53 = sub_100022F20();
  uint64_t v5 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v52 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100022C20();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  sub_100011CD0((uint64_t *)&unk_100037CC0);
  int v50 = a2;
  uint64_t v12 = sub_100023360();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v44 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  os_log_type_t v42 = v2;
  int64_t v43 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v45 = v5 + 16;
  uint64_t v46 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v48 = v5;
  uint64_t v49 = v8;
  uint64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  unint64_t v51 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v43) {
      break;
    }
    uint64_t v26 = v44;
    unint64_t v27 = v44[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v27 = v44[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v43)
        {
LABEL_34:
          swift_release();
          unint64_t v3 = v42;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v44[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v43) {
              goto LABEL_34;
            }
            unint64_t v27 = v44[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v49 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v50)
    {
      (*v18)(v10, v30, v7);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 32))(v52, v31 + v32 * v24, v53);
    }
    else
    {
      (*v46)(v10, v30, v7);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 16))(v52, v33 + v32 * v24, v53);
    }
    sub_10001D0EC(&qword_100037EF0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_100023040();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v18)((char *)(*(void *)(v13 + 48) + v29 * v22), (unint64_t)v10, v7);
    uint64_t result = (*v51)(*(void *)(v13 + 56) + v32 * v22, v52, v53);
    ++*(void *)(v13 + 16);
  }
  swift_release();
  unint64_t v3 = v42;
  uint64_t v26 = v44;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v13;
  return result;
}

unint64_t sub_10001BF08(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100022C20();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_100023290();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      char v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      unint64_t v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_10001D0EC(&qword_100037EF0, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v19 = sub_100023040();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v17 * a1 < v18
              || *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(sub_100022F20() - 8) + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *uint64_t v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10001C250(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_100022C20();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_10001EF98(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_10001C548();
      goto LABEL_7;
    }
    sub_10001BA0C(v17, a3 & 1);
    unint64_t v28 = sub_10001EF98(a2);
    if ((v18 & 1) == (v29 & 1))
    {
      unint64_t v14 = v28;
      unint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_10001C454(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_100023390();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = sub_100022F20();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  uint64_t v25 = v22;
  uint64_t v26 = v21 + *(void *)(v23 + 72) * v14;

  return v24(v26, a1, v25);
}

uint64_t sub_10001C454(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_100022C20();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = sub_100022F20();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a3, v11);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

void *sub_10001C548()
{
  uint64_t v42 = sub_100022F20();
  uint64_t v45 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v41 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100022C20();
  uint64_t v44 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  unint64_t v39 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011CD0((uint64_t *)&unk_100037CC0);
  uint64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_100023350();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v46 = v4;
  if (!v5)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v31 = v46;
    uint64_t v30 = v32;
LABEL_25:
    *uint64_t v30 = v31;
    return result;
  }
  uint64_t v6 = v4;
  uint64_t result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v46;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v11 = -1;
  uint64_t v43 = v3;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v33 = v3 + 64;
  int64_t v34 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v45;
  uint64_t v14 = v44;
  uint64_t v37 = v45 + 16;
  uint64_t v38 = v44 + 16;
  uint64_t v35 = v45 + 32;
  uint64_t v36 = v44 + 32;
  uint64_t v15 = v39;
  uint64_t v16 = v40;
  uint64_t v17 = v42;
  uint64_t v18 = v46;
  while (1)
  {
    if (v12)
    {
      unint64_t v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      int64_t v47 = v9;
      unint64_t v20 = v19 | (v9 << 6);
      uint64_t v21 = v43;
      goto LABEL_9;
    }
    int64_t v26 = v9 + 1;
    uint64_t v21 = v43;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    int64_t v28 = v9 + 1;
    if (!v27)
    {
      int64_t v28 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v28);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v27 - 1) & v27;
    int64_t v47 = v28;
    unint64_t v20 = __clz(__rbit64(v27)) + (v28 << 6);
LABEL_9:
    unint64_t v22 = *(void *)(v14 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v15, *(void *)(v21 + 48) + v22, v16);
    unint64_t v23 = *(void *)(v13 + 72) * v20;
    unint64_t v24 = *(void *)(v21 + 56) + v23;
    uint64_t v25 = v41;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v41, v24, v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(void *)(v18 + 48) + v22, v15, v16);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v13 + 32))(*(void *)(v18 + 56) + v23, v25, v17);
    int64_t v9 = v47;
  }
  int64_t v29 = v26 + 2;
  if (v29 >= v34)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v30 = v32;
    uint64_t v31 = v46;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v29);
  if (v27)
  {
    int64_t v28 = v29;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v28 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v28 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v28);
    ++v29;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_10001C8F0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100023340();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100023340();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1000232F0();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_10001CABC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_100023340();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_100023110();
}

uint64_t sub_10001CABC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100023340();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100023340();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10001D948(&qword_100037D48, &qword_100037D20);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100011CD0(&qword_100037D20);
          uint64_t v12 = sub_1000210D8(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_10001D6BC(0, &qword_100037D10);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100023370();
  __break(1u);
  return result;
}

void sub_10001CCF0()
{
  sub_100022C20();
  __chkstk_darwin();
  uint64_t v1 = OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_securityContexts;
  type metadata accessor for AirDropUtilities.SecurityContexts();
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v2 + 112) = &_swiftEmptyArrayStorage;
  *(void *)&v0[v1] = v2;
  *(void *)&v0[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_activityExtensionItemData] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_tapHandleTask] = 0;
  *(void *)&v0[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_existingItemDataTask] = 0;
  sub_100022C10();
  sub_100022F30();
  *(void *)&v0[OBJC_IVAR____TtC7AirDrop30AirDropDiscoveryViewController_currentTransfersByEndpointID] = &_swiftEmptyDictionarySingleton;

  sub_100023330();
  __break(1u);
}

uint64_t sub_10001CE40(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001CE68(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10001CEA0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001CEF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_10001CF50(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10001CFB4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001CFEC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100012C94;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100037C60 + dword_100037C60);
  return v6(a1, v4);
}

uint64_t sub_10001D0A4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001D0EC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001D134()
{
  uint64_t v1 = sub_100022C20();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001D200(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100022C20() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001DB7C;
  return sub_1000152F8(a1, v5, v6);
}

uint64_t sub_10001D2E8(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_10001DB7C;
  return sub_10001F69C(a1, a2, v7, v6);
}

uint64_t sub_10001D39C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_100011CD0(&qword_100037D20);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100023370();
  __break(1u);
  return result;
}

uint64_t sub_10001D4A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100023370();
  __break(1u);
  return result;
}

uint64_t sub_10001D59C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100011CD0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001D5F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_10001D650(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10001D664(a1, a2);
  }
  return a1;
}

uint64_t sub_10001D664(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10001D6BC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10001D6F8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_100023370();
  __break(1u);
  return result;
}

uint64_t sub_10001D854(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100023370();
  __break(1u);
  return result;
}

uint64_t sub_10001D948(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001D0A4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001D98C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001D9C4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10001DB7C;
  return sub_100019B5C(a1, v4);
}

uint64_t sub_10001DA64(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100011CD0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

__n128 sub_10001DAC8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10001DAD8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10001DAF8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_10001DB34(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10001DB80()
{
  if ([v0 _remoteViewControllerProxy])
  {
    sub_100023280();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_10001F47C((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_100011CD0(&qword_100037EE8);
    if (swift_dynamicCast()) {
      return v2;
    }
  }
  else
  {
    sub_10001DF30((uint64_t)v4);
  }
  return 0;
}

Swift::Void __swiftcall AirDropNavigationController.beginRequest(with:)(NSExtensionContext with)
{
  uint64_t v2 = v1;
  sub_10001D6BC(0, (unint64_t *)&unk_100037DE0);
  uint64_t v4 = (void *)sub_100023230();
  char v5 = sub_100022F10();

  if ((v5 & 1) == 0)
  {
    id v11 = [(objc_class *)with.super.isa inputItems];
    uint64_t v12 = sub_1000230F0();

    if (*(void *)(v12 + 16))
    {
      sub_10001CEF0(v12 + 32, (uint64_t)&v20);
      swift_bridgeObjectRelease();
      if (*((void *)&v21 + 1))
      {
        sub_10001D6BC(0, &qword_100037D00);
        if (swift_dynamicCast())
        {
          id v10 = v22[0];
          if (v22[0])
          {
            id v13 = [v22[0] userInfo];
            if (v13)
            {
              id v14 = v13;
              uint64_t v15 = sub_100023030();

              swift_bridgeObjectRetain();
              sub_1000232C0();
              if (*(void *)(v15 + 16) && (unint64_t v16 = sub_10001F01C((uint64_t)&v20), (v17 & 1) != 0))
              {
                sub_10001CEF0(*(void *)(v15 + 56) + 32 * v16, (uint64_t)v22);
              }
              else
              {
                *(_OWORD *)unint64_t v22 = 0u;
                long long v23 = 0u;
              }
              sub_10001F060((uint64_t)&v20);
              swift_bridgeObjectRelease();
              if (*((void *)&v23 + 1))
              {
                if (swift_dynamicCast())
                {
                  uint64_t v18 = v20;
                  goto LABEL_17;
                }
LABEL_16:
                uint64_t v18 = 0;
LABEL_17:
                id v19 = [objc_allocWithZone((Class)AirDropBrowserViewController) init];
                [v19 setAirDropDelegate:v2];
                [v19 setShowNoContentView:v18];
                [v2 pushViewController:v19 animated:0];

                goto LABEL_18;
              }
LABEL_15:
              sub_10001DF30((uint64_t)v22);
              goto LABEL_16;
            }
          }
LABEL_14:
          *(_OWORD *)unint64_t v22 = 0u;
          long long v23 = 0u;
          goto LABEL_15;
        }
LABEL_13:
        id v10 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      swift_bridgeObjectRelease();
    }
    sub_10001DF30((uint64_t)&v20);
    goto LABEL_13;
  }
  uint64_t v6 = sub_10001F328(with.super.isa);
  uint64_t v8 = v7;
  id v9 = objc_allocWithZone((Class)type metadata accessor for AirDropDiscoveryViewController(0));
  id v10 = AirDropDiscoveryViewController.init(hostAppBundleID:)(v6, v8);
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  [v2 pushViewController:v10 animated:0];
LABEL_18:
}

uint64_t sub_10001DF30(uint64_t a1)
{
  uint64_t v2 = sub_100011CD0(&qword_100037C48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id static AirDropNavigationController._remoteViewControllerInterface()()
{
  return sub_10001E01C(&protocolRef_SFAirDropViewServiceHostProtocol);
}

id static AirDropNavigationController._exportedInterface()()
{
  return sub_10001E01C(&protocolRef_SFAirDropViewServiceProtocol);
}

id sub_10001E01C(void *a1)
{
  id v1 = [self interfaceWithProtocol:*a1];

  return v1;
}

id sub_10001E078(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [self interfaceWithProtocol:*a3];

  return v3;
}

id AirDropNavigationController.__allocating_init(navigationBarClass:toolbarClass:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t ObjCClassFromMetadata = 0;
  if (a2) {
LABEL_3:
  }
    uint64_t v3 = swift_getObjCClassFromMetadata();
LABEL_4:
  id v5 = objc_allocWithZone(v2);

  return [v5 initWithNavigationBarClass:ObjCClassFromMetadata toolbarClass:v3];
}

id AirDropNavigationController.init(navigationBarClass:toolbarClass:)(uint64_t ObjCClassFromMetadata, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = &v2[OBJC_IVAR____TtC7AirDrop27AirDropNavigationController_AirDropNoContentViewKey];
  *(void *)uint64_t v6 = 0xD000000000000011;
  *((void *)v6 + 1) = 0x800000010002C340;
  if (ObjCClassFromMetadata) {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  }
  if (a2) {
    uint64_t v7 = swift_getObjCClassFromMetadata();
  }
  else {
    uint64_t v7 = 0;
  }
  v9.receiver = v2;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, "initWithNavigationBarClass:toolbarClass:", ObjCClassFromMetadata, v7);
}

id AirDropNavigationController.__allocating_init(rootViewController:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithRootViewController:a1];

  return v3;
}

id AirDropNavigationController.init(rootViewController:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtC7AirDrop27AirDropNavigationController_AirDropNoContentViewKey];
  *(void *)uint64_t v4 = 0xD000000000000011;
  *((void *)v4 + 1) = 0x800000010002C340;
  v7.receiver = v1;
  v7.super_class = ObjectType;
  id v5 = objc_msgSendSuper2(&v7, "initWithRootViewController:", a1);

  return v5;
}

id AirDropNavigationController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  objc_super v7 = &v3[OBJC_IVAR____TtC7AirDrop27AirDropNavigationController_AirDropNoContentViewKey];
  *(void *)objc_super v7 = 0xD000000000000011;
  *((void *)v7 + 1) = 0x800000010002C340;
  if (a2)
  {
    NSString v8 = sub_100023080();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  v11.receiver = v3;
  v11.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v11, "initWithNibName:bundle:", v8, a3);

  return v9;
}

id AirDropNavigationController.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id AirDropNavigationController.init(coder:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtC7AirDrop27AirDropNavigationController_AirDropNoContentViewKey];
  *(void *)uint64_t v4 = 0xD000000000000011;
  *((void *)v4 + 1) = 0x800000010002C340;
  v7.receiver = v1;
  v7.super_class = ObjectType;
  id v5 = objc_msgSendSuper2(&v7, "initWithCoder:", a1);

  return v5;
}

void AirDropNavigationController.airDropViewServiceWillStartTransfer(to:)(uint64_t a1)
{
  [v1 _hostAuditToken];
  SecTaskRef v3 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v12);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = (__CFString *)sub_100023080();
    CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, v5, 0);

    if (v6)
    {
      objc_super v7 = (const void *)swift_unknownObjectRetain();
      CFTypeID v8 = CFGetTypeID(v7);
      if (v8 == CFBooleanGetTypeID())
      {
        type metadata accessor for CFBoolean(0);
        swift_unknownObjectRetain();
        CFBooleanRef v9 = (const __CFBoolean *)swift_dynamicCastUnknownClassUnconditional();
        int Value = CFBooleanGetValue(v9);

        if (Value)
        {
          objc_super v11 = (void *)sub_10001DB80();
          if (v11)
          {
            [v11 airDropViewServiceWillStartTransferToRecipient:a1];
            swift_unknownObjectRelease();
          }
        }
      }
      swift_unknownObjectRelease_n();
    }
  }
}

Swift::Void __swiftcall AirDropNavigationController.airDropViewServiceDidStartTransfer()()
{
}

Swift::Void __swiftcall AirDropNavigationController.airDropViewServiceDidFinishTransfer(withSuccess:)(Swift::Bool withSuccess)
{
  uint64_t v2 = (void *)sub_10001DB80();
  if (v2)
  {
    [v2 airDropViewServiceDidFinishTransferWithSuccess:withSuccess];
    swift_unknownObjectRelease();
  }
}

void AirDropNavigationController.airDropViewServiceRequestingSharedItems(with:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001DB80();
  if (v6)
  {
    objc_super v7 = (void *)v6;
    if (a2)
    {
      v9[4] = a2;
      v9[5] = a3;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 1107296256;
      v9[2] = sub_10001EA48;
      v9[3] = &unk_100031638;
      CFTypeID v8 = _Block_copy(v9);
      swift_retain();
      swift_release();
    }
    else
    {
      CFTypeID v8 = 0;
    }
    [v7 airDropViewServiceRequestingSharedItemsWithDataRequest:a1 completionHandler:v8];
    swift_unknownObjectRelease();
    _Block_release(v8);
  }
}

void sub_10001EA48(uint64_t a1, void *a2)
{
  SecTaskRef v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void AirDropNavigationController.airDropViewServiceRequestingSendingAppBundleIdentifier(completionHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001DB80();
  if (v4)
  {
    id v5 = (void *)v4;
    if (a1)
    {
      v7[4] = a1;
      v7[5] = a2;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 1107296256;
      v7[2] = sub_10001EC5C;
      v7[3] = &unk_100031660;
      uint64_t v6 = _Block_copy(v7);
      swift_retain();
      swift_release();
    }
    else
    {
      uint64_t v6 = 0;
    }
    [v5 airDropViewServiceRequestingSendingAppBundleIdentifierWithCompletionHandler:v6];
    swift_unknownObjectRelease();
    _Block_release(v6);
  }
}

uint64_t sub_10001EC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    uint64_t v3 = sub_100023090();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  swift_retain();
  v2(v3, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_10001ED90(uint64_t a1, NSString a2, uint64_t a3)
{
  if (a2) {
    a2 = sub_100023080();
  }
  id v4 = a2;
  (*(void (**)(uint64_t))(a3 + 16))(a3);
}

Swift::Void __swiftcall AirDropNavigationController.airDropViewServiceDidRequestDismissal()()
{
}

void *sub_10001EDF8(SEL *a1)
{
  __n128 result = (void *)sub_10001DB80();
  if (result)
  {
    [result *a1];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_10001EE64(void *a1, uint64_t a2, SEL *a3)
{
  id v5 = a1;
  id v4 = (void *)sub_10001DB80();
  if (v4)
  {
    [v4 *a3];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

uint64_t NWEndpoint.endpointUUID()()
{
  swift_slowAlloc();
  uint64_t result = sub_100022DB0();
  if (result)
  {
    nw_endpoint_get_service_identifier();
    swift_unknownObjectRelease();
    sub_100022C00();
    return swift_slowDealloc();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_10001EF98(uint64_t a1)
{
  sub_100022C20();
  sub_10001F540(&qword_100037EF0);
  uint64_t v2 = sub_100023040();

  return sub_10001F0B4(a1, v2);
}

unint64_t sub_10001F01C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_1000232A0(*(void *)(v2 + 40));

  return sub_10001F260(a1, v4);
}

uint64_t sub_10001F060(uint64_t a1)
{
  return a1;
}

unint64_t sub_10001F0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_100022C20();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    id v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    objc_super v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_10001F540(&qword_100037EF8);
      char v15 = sub_100023050();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_10001F260(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10001F4E4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_1000232B0();
      sub_10001F060((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10001F328(void *a1)
{
  return 0;
}

uint64_t sub_10001F3DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001F3EC()
{
  return swift_release();
}

uint64_t type metadata accessor for AirDropNavigationController()
{
  return self;
}

uint64_t sub_10001F418(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10001F428()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001F460(uint64_t a1, void *a2)
{
  sub_10001ED90(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10001F468()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10001F47C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100011CD0(&qword_100037C48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001F4E4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10001F540(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100022C20();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001F590()
{
  uint64_t v0 = sub_100022D80();
  sub_10001CF50(v0, qword_100037F00);
  uint64_t v1 = sub_10001CE68(v0, (uint64_t)qword_100037F00);
  if (qword_100037AD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001CE68(v0, (uint64_t)qword_100038198);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_10001F658()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_10001F690()
{
  return v0;
}

uint64_t sub_10001F69C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[10] = a3;
  v4[11] = a4;
  v4[9] = a2;
  sub_100011CD0(&qword_100037B30);
  v4[12] = swift_task_alloc();
  v4[13] = swift_task_alloc();
  return _swift_task_switch(sub_10001F744, 0, 0);
}

uint64_t sub_10001F744()
{
  unint64_t v1 = *(void *)(v0 + 80);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_100023340();
    uint64_t v2 = result;
    if (!result) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v2) {
      goto LABEL_21;
    }
  }
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = 0;
  unint64_t v5 = v1 & 0xC000000000000001;
  uint64_t v27 = *(void *)(v0 + 80) + 32;
  p_os_log_type_t type = &stru_100035FF0.type;
  uint64_t v29 = v2;
  unint64_t v28 = v1 & 0xC000000000000001;
  do
  {
    if (v5) {
      id v7 = (id)sub_1000232E0();
    }
    else {
      id v7 = *(id *)(v27 + 8 * v4);
    }
    uint64_t v8 = v7;
    NSString v9 = sub_100023080();
    unsigned int v10 = objc_msgSend(v8, p_type[294], v9);

    if (v10)
    {
      uint64_t v12 = *(void *)(v0 + 96);
      uint64_t v11 = *(void *)(v0 + 104);
      uint64_t v13 = *(void *)(v0 + 88);
      uint64_t v14 = sub_100023190();
      uint64_t v15 = *(void *)(v14 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v11, 1, 1, v14);
      unint64_t v16 = (void *)swift_allocObject();
      v16[2] = 0;
      v16[3] = 0;
      v16[4] = v8;
      v16[5] = v13;
      sub_1000221F4(v11, v12);
      LODWORD(v11) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14);
      id v17 = v8;
      swift_retain();
      uint64_t v18 = *(void *)(v0 + 96);
      if (v11 == 1)
      {
        sub_10001D59C(*(void *)(v0 + 96), &qword_100037B30);
      }
      else
      {
        sub_100023180();
        (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v18, v14);
      }
      unint64_t v5 = v28;
      if (v16[2])
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v19 = sub_100023140();
        uint64_t v21 = v20;
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v19 = 0;
        uint64_t v21 = 0;
      }
      uint64_t v22 = **(void **)(v0 + 72);
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = &unk_1000380B0;
      *(void *)(v23 + 24) = v16;
      uint64_t v24 = v21 | v19;
      if (v21 | v19)
      {
        uint64_t v24 = v0 + 16;
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v19;
        *(void *)(v0 + 40) = v21;
      }
      p_os_log_type_t type = (char **)(&stru_100035FF0 + 16);
      uint64_t v25 = *(void *)(v0 + 104);
      *(void *)(v0 + 48) = 1;
      *(void *)(v0 + 56) = v24;
      *(void *)(v0 + 64) = v22;
      swift_task_create();

      swift_release();
      sub_10001D59C(v25, &qword_100037B30);
      uint64_t v2 = v29;
    }
    else
    {
    }
    ++v4;
  }
  while (v2 != v4);
LABEL_21:
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  int64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_10001FAE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 128) = a4;
  *(void *)(v5 + 136) = a5;
  return _swift_task_switch(sub_10001FB04, 0, 0);
}

uint64_t sub_10001FB04()
{
  unint64_t v1 = (void *)v0[16];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10001FC00;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1000200E8;
  v0[13] = &unk_100031750;
  v0[14] = v2;
  objc_msgSend(v1, "sf_loadSecurityContextWithCompletionHandler:", v0 + 10);
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10001FC00()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    uint64_t v2 = sub_10001FE7C;
  }
  else {
    uint64_t v2 = sub_10001FD10;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001FD10()
{
  uint64_t v1 = v0[17];
  v0[19] = v0[15];
  return _swift_task_switch(sub_10001FD34, v1, 0);
}

uint64_t sub_10001FD34()
{
  uint64_t v1 = *(void **)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 136);
  [v1 activate];
  swift_beginAccess();
  id v3 = v1;
  sub_1000230D0();
  if (*(void *)((*(void *)(v2 + 112) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v2 + 112) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
    sub_100023120();
  sub_100023130();
  sub_100023110();
  swift_endAccess();
  return _swift_task_switch(sub_10001FE1C, 0, 0);
}

uint64_t sub_10001FE1C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001FE7C()
{
  swift_willThrow();
  if (qword_100037AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[16];
  uint64_t v2 = sub_100022D80();
  sub_10001CE68(v2, (uint64_t)qword_100037F00);
  id v3 = v1;
  swift_errorRetain();
  id v4 = v3;
  swift_errorRetain();
  uint64_t v5 = sub_100022D60();
  os_log_type_t v6 = sub_100023200();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[16];
  if (v7)
  {
    log = v5;
    uint64_t v9 = swift_slowAlloc();
    unsigned int v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412546;
    v0[10] = v8;
    id v11 = v8;
    sub_100023260();
    void *v10 = v8;

    *(_WORD *)(v9 + 12) = 2112;
    swift_errorRetain();
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v12;
    sub_100023260();
    v10[1] = v12;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v6, "Could not load security context for item provider %@: %@", (uint8_t *)v9, 0x16u);
    sub_100011CD0(&qword_100037C50);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_1000200E8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100011CD0(&qword_100037C90);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_1000201A8(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned int a10, uint64_t a11, uint64_t a12, long long a13, uint64_t a14)
{
  *(void *)(v14 + 120) = a14;
  *(_OWORD *)(v14 + 104) = a13;
  *(void *)(v14 + 88) = a11;
  *(void *)(v14 + 96) = a12;
  *(void *)(v14 + 72) = a6;
  *(void *)(v14 + 80) = v33;
  *(void *)(v14 + 64) = a1;
  uint64_t v18 = sub_100022E10();
  *(void *)(v14 + 128) = v18;
  *(void *)(v14 + 136) = *(void *)(v18 - 8);
  *(void *)(v14 + 144) = swift_task_alloc();
  *(void *)(v14 + 152) = swift_task_alloc();
  uint64_t v19 = sub_100022F00();
  *(void *)(v14 + 160) = v19;
  *(void *)(v14 + 168) = *(void *)(v19 - 8);
  *(void *)(v14 + 176) = swift_task_alloc();
  *(void *)(v14 + 184) = swift_task_alloc();
  uint64_t v20 = sub_100022BD0();
  *(void *)(v14 + 192) = v20;
  *(void *)(v14 + 200) = *(void *)(v20 - 8);
  *(void *)(v14 + 208) = swift_task_alloc();
  *(void *)(v14 + 216) = swift_task_alloc();
  uint64_t v21 = sub_100022FB0();
  *(void *)(v14 + 224) = v21;
  *(void *)(v14 + 232) = *(void *)(v21 - 8);
  *(void *)(v14 + 240) = swift_task_alloc();
  *(void *)(v14 + 248) = swift_task_alloc();
  *(void *)(v14 + 256) = swift_task_alloc();
  *(void *)(v14 + 264) = swift_task_alloc();
  uint64_t v22 = swift_task_alloc();
  *(void *)(v14 + 272) = v22;
  *(void *)(v14 + 280) = sub_100023020();
  uint64_t v23 = (void *)swift_task_alloc();
  *(void *)(v14 + 288) = v23;
  *uint64_t v23 = v14;
  v23[1] = sub_1000204CC;
  uint64_t v34 = a11;
  LOBYTE(a11) = 0;
  v24.n128_f64[0] = a2;
  v25.n128_f64[0] = a3;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, __n128, __n128, uint64_t))static SFAirDropUtilities.loadFile(from:dataTypesToTry:customDataType:acceptOtherFileRepresentations:ignoreStrings:generatePreviewImage:renameURLs:suggestedThumbnailSize:filename:sessionID:fileIndex:))(v22, a6, a7, a8, a9, 0, a10, v32, v24, v25, a11);
}

uint64_t sub_1000204CC()
{
  *(void *)(*(void *)v1 + 296) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100020D34;
  }
  else {
    uint64_t v2 = sub_1000205E0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000205E0()
{
  uint64_t v68 = v0;
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 232) + 16);
  v2(*(void *)(v0 + 264), *(void *)(v0 + 272), *(void *)(v0 + 224));
  if (v1)
  {
    uint64_t v3 = *(void **)(v0 + 104);
    uint64_t v4 = (uint64_t)v3;
  }
  else
  {
    uint64_t v4 = sub_100022F70();
    uint64_t v3 = *(void **)(v0 + 104);
  }
  uint64_t v5 = *(void *)(v0 + 264);
  uint64_t v6 = *(void *)(v0 + 224);
  id v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 232) + 8);
  id v8 = v3;
  uint64_t v66 = v7;
  v7(v5, v6);
  uint64_t v64 = (void *)v4;
  uint64_t v9 = sub_100023010();
  unint64_t v62 = v10;
  uint64_t v63 = v9;
  if (qword_100037AC0 != -1) {
    swift_once();
  }
  uint64_t v11 = *(void *)(v0 + 272);
  uint64_t v13 = *(void *)(v0 + 248);
  uint64_t v12 = *(void *)(v0 + 256);
  uint64_t v14 = *(void *)(v0 + 240);
  uint64_t v15 = *(void *)(v0 + 224);
  uint64_t v16 = *(void **)(v0 + 72);
  uint64_t v17 = sub_100022D80();
  sub_10001CE68(v17, (uint64_t)qword_100037F00);
  v2(v12, v11, v15);
  v2(v13, v11, v15);
  v2(v14, v11, v15);
  id v18 = v16;
  uint64_t v19 = sub_100022D60();
  os_log_type_t v20 = sub_100023220();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v22 = *(void *)(v0 + 248);
  uint64_t v23 = *(void *)(v0 + 256);
  uint64_t v24 = *(void *)(v0 + 224);
  if (v21)
  {
    uint64_t v61 = v19;
    uint64_t v25 = *(void *)(v0 + 216);
    uint64_t v27 = *(void *)(v0 + 192);
    uint64_t v26 = *(void *)(v0 + 200);
    uint64_t v28 = *(void *)(v0 + 184);
    uint64_t v29 = *(void *)(v0 + 168);
    uint64_t v50 = *(void *)(v0 + 160);
    uint64_t v60 = *(void **)(v0 + 72);
    uint64_t v56 = *(void *)(v0 + 240);
    uint64_t v52 = *(void *)(v0 + 248);
    uint64_t v30 = swift_slowAlloc();
    uint64_t v59 = (void *)swift_slowAlloc();
    v67[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315906;
    os_log_type_t type = v20;
    sub_100022F80();
    sub_100022EF0();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v50);
    sub_1000220A8();
    uint64_t v31 = sub_100023380();
    unint64_t v33 = v32;
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    *(void *)(v0 + 40) = sub_10001B048(v31, v33, v67);
    sub_100023260();
    swift_bridgeObjectRelease();
    v66(v23, v24);
    *(_WORD *)(v30 + 12) = 2080;
    uint64_t v34 = sub_100022F90();
    *(void *)(v0 + 48) = sub_10001B048(v34, v35, v67);
    sub_100023260();
    swift_bridgeObjectRelease();
    v66(v52, v24);
    *(_WORD *)(v30 + 22) = 1024;
    LODWORD(v26) = sub_100022FA0() & 1;
    v66(v56, v24);
    *(_DWORD *)(v0 + 304) = v26;
    sub_100023260();
    *(_WORD *)(v30 + 28) = 2112;
    *(void *)(v0 + 56) = v60;
    id v36 = v60;
    sub_100023260();
    void *v59 = v60;

    _os_log_impl((void *)&_mh_execute_header, v61, type, "Loaded item %s with data type %s (was string = %{BOOL}d) from item provider %@", (uint8_t *)v30, 0x26u);
    sub_100011CD0(&qword_100037C50);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v37 = *(void **)(v0 + 72);
    v66(*(void *)(v0 + 240), *(void *)(v0 + 224));
    v66(v23, v24);
    v66(v22, v24);
  }
  uint64_t v38 = *(void *)(v0 + 272);
  uint64_t v39 = *(void *)(v0 + 216);
  *(void *)typea = *(void *)(v0 + 224);
  uint64_t v40 = *(void *)(v0 + 200);
  uint64_t v49 = *(void *)(v0 + 208);
  uint64_t v41 = *(void *)(v0 + 192);
  uint64_t v42 = *(void *)(v0 + 184);
  uint64_t v43 = *(void *)(v0 + 168);
  uint64_t v65 = *(void *)(v0 + 176);
  uint64_t v44 = *(void *)(v0 + 160);
  uint64_t v51 = *(void *)(v0 + 152);
  uint64_t v53 = *(void *)(v0 + 136);
  uint64_t v54 = *(void *)(v0 + 144);
  uint64_t v55 = *(void *)(v0 + 128);
  sub_100022F80();
  sub_100022EF0();
  uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
  v45(v42, v44);
  sub_100022BA0();
  uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  v46(v39, v41);
  sub_100022F90();
  sub_100022F80();
  sub_100022EF0();
  v45(v65, v44);
  sub_100022B90();
  v46(v49, v41);
  swift_bridgeObjectRetain();
  sub_100021EE0(v63, v62);
  sub_100022FA0();
  sub_100022E00();
  sub_100022F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v54, v51, v55);
  sub_100022E30();

  sub_10001D650(v63, v62);
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v51, v55);
  v66(v38, *(void *)typea);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int64_t v47 = *(uint64_t (**)(void))(v0 + 8);
  return v47();
}

uint64_t sub_100020D34()
{
  uint64_t v13 = v0;
  if (qword_100037AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100022D80();
  sub_10001CE68(v1, (uint64_t)qword_100037F00);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v2 = sub_100022D60();
  os_log_type_t v3 = sub_100023200();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v5 = v0[11];
    uint64_t v4 = v0[12];
    uint64_t v11 = v0[10];
    uint64_t v6 = swift_slowAlloc();
    id v7 = (void *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 134218498;
    v0[2] = v4;
    sub_100023260();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_10001B048(v11, v5, &v12);
    sub_100023260();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 22) = 2112;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v8;
    sub_100023260();
    *id v7 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to load item %ld for session %s: %@", (uint8_t *)v6, 0x20u);
    sub_100011CD0(&qword_100037C50);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100021080()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for AirDropUtilities()
{
  return self;
}

uint64_t type metadata accessor for AirDropUtilities.SecurityContexts()
{
  return self;
}

void (*sub_1000210D8(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100021188(v6, a2, a3);
  return sub_100021140;
}

void sub_100021140(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100021188(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  os_log_type_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_1000232E0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)os_log_type_t v3 = v4;
    return sub_100021208;
  }
  __break(1u);
  return result;
}

void sub_100021208(id *a1)
{
}

void *sub_100021210(void *a1, unint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v103 = a5;
  uint64_t v102 = a4;
  uint64_t v112 = a3;
  uint64_t v101 = sub_100022DE0();
  uint64_t v104 = *(void *)(v101 - 8);
  __chkstk_darwin(v101);
  uint64_t v118 = (char *)&v93 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100011CD0(&qword_100037B30);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100022E10();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v100 = (char *)&v93 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v128 = (char *)&v93 - v15;
  uint64_t v120 = sub_100022D40();
  uint64_t v16 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  v114 = (char *)&v93 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100011CD0(&qword_100038080);
  __chkstk_darwin(v18 - 8);
  v111 = (char *)&v93 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100023020();
  HIDWORD(v93) = sub_100022FD0();
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_100023340();
    if (v21) {
      goto LABEL_3;
    }
LABEL_52:
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v21 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v21) {
    goto LABEL_52;
  }
LABEL_3:
  uint64_t result = self;
  id v110 = result;
  if (v21 >= 1)
  {
    v99 = v10;
    uint64_t v23 = 0;
    unint64_t v109 = a2 & 0xC000000000000001;
    v108 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
    v113 = (void (**)(char *, uint64_t))(v16 + 8);
    LODWORD(v93) = HIDWORD(v93) ^ 1;
    int v97 = BYTE4(v93) & 1;
    v96 = (void (**)(char *, char *, uint64_t))(v12 + 16);
    uint64_t v95 = v104 + 32;
    unint64_t v94 = (void (**)(char *, uint64_t))(v12 + 8);
    v129 = &_swiftEmptyArrayStorage;
    unint64_t v107 = a2;
    uint64_t v98 = v11;
    uint64_t v119 = v20;
    uint64_t v105 = v21;
    uint64_t v106 = a1;
    while (1)
    {
      uint64_t v133 = v23;
      id v26 = v109 ? (id)sub_1000232E0() : *(id *)(a2 + 8 * v23 + 32);
      uint64_t v27 = v26;
      id v28 = objc_msgSend(a1, "attachmentNameForItem:", v26, v93);
      uint64_t v29 = v120;
      if (v28)
      {
        uint64_t v30 = v28;
        uint64_t v123 = sub_100023090();
        unint64_t v125 = v31;
      }
      else
      {
        uint64_t v123 = 0;
        unint64_t v125 = 0xE000000000000000;
      }
      id v32 = [a1 subjectForItem:v27];
      if (v32)
      {
        unint64_t v33 = v32;
        uint64_t v122 = sub_100023090();
        uint64_t v124 = v34;
      }
      else
      {
        uint64_t v122 = 0;
        uint64_t v124 = 0;
      }
      id v35 = [a1 dataTypeForItem:v27];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = sub_100023090();
        uint64_t v39 = v38;

        swift_bridgeObjectRetain_n();
        uint64_t v40 = v112;
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v40 = sub_10001A9F8(0, *((void *)v112 + 2) + 1, 1, v112);
        }
        unint64_t v42 = *((void *)v40 + 2);
        unint64_t v41 = *((void *)v40 + 3);
        if (v42 >= v41 >> 1) {
          uint64_t v40 = sub_10001A9F8((char *)(v41 > 1), v42 + 1, 1, v40);
        }
        *((void *)v40 + 2) = v42 + 1;
        uint64_t v43 = &v40[16 * v42];
        *((void *)v43 + 4) = v37;
        *((void *)v43 + 5) = v39;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v37 = 0;
        uint64_t v39 = 0;
        uint64_t v40 = (char *)swift_bridgeObjectRetain();
      }
      id v44 = [a1 previewImageForItem:v27];
      if (!v44)
      {
        id v45 = [a1 previewImageDataForItem:v27];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = sub_100022BF0();
          uint64_t v48 = v29;
          unint64_t v50 = v49;

          id v51 = objc_allocWithZone((Class)UIImage);
          sub_10001D5F8(v47, v50);
          Class isa = sub_100022BE0().super.isa;
          id v53 = [v51 initWithData:isa];
          sub_10001D664(v47, v50);

          uint64_t v54 = v47;
          id v44 = v53;
          unint64_t v55 = v50;
          uint64_t v29 = v48;
          sub_10001D664(v54, v55);
        }
        else
        {
          id v44 = 0;
        }
      }
      uint64_t v127 = v39;
      id v126 = v44;
      uint64_t v131 = sub_100023010();
      unint64_t v132 = v56;
      sub_100022F60();
      uint64_t v58 = v57;
      uint64_t v60 = v59;
      sub_100022FE0();
      if (!v61) {
        sub_100022FC0();
      }
      swift_bridgeObjectRetain();
      uint64_t v62 = (uint64_t)v111;
      sub_100022D50();
      int v63 = (*v108)(v62, 1, v29);
      uint64_t v121 = v37;
      id v130 = v44;
      if (v63 == 1)
      {
        sub_10001D59C(v62, &qword_100038080);
      }
      else
      {
        uint64_t v64 = v114;
        sub_100022D20();
        uint64_t v65 = v62;
        sub_100022D10();
        uint64_t v66 = *v113;
        (*v113)(v64, v29);
        v66((char *)v65, v29);
      }
      swift_bridgeObjectRetain();
      NSString v67 = sub_100023080();
      swift_bridgeObjectRelease();
      id v68 = [v110 _typeWithIdentifier:v67 allowUndeclared:1];

      if (!v68) {
        break;
      }
      uint64_t v69 = v114;
      sub_100022D30();
      Class v70 = sub_100022D00().super.isa;
      (*v113)(v69, v120);
      LODWORD(v69) = [v68 conformsToType:v70];

      if ((HIDWORD(v93) & v69) != 1)
      {
        v116 = v40;
        v117 = v27;
LABEL_36:
        BOOL v115 = v130 == 0;
        uint64_t v71 = v124;
        swift_bridgeObjectRetain();
        unint64_t v72 = v125;
        swift_bridgeObjectRetain();
        sub_100021EE0(v131, v132);
        uint64_t v73 = v122;
        uint64_t v74 = v123;
        sub_100022E00();
        uint64_t v75 = sub_100023190();
        uint64_t v76 = *(void *)(v75 - 8);
        uint64_t v77 = (uint64_t)v99;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v76 + 56))(v99, 1, 1, v75);
        uint64_t v78 = swift_allocObject();
        *(void *)(v78 + 16) = 0;
        uint64_t v79 = v117;
        *(void *)(v78 + 24) = 0;
        *(void *)(v78 + 32) = v79;
        uint64_t v80 = v121;
        *(void *)(v78 + 40) = v116;
        *(void *)(v78 + 48) = v80;
        *(void *)(v78 + 56) = v127;
        *(unsigned char *)(v78 + 64) = v97;
        *(unsigned char *)(v78 + 65) = v115;
        *(void *)(v78 + 72) = v58;
        *(void *)(v78 + 80) = v60;
        *(void *)(v78 + 88) = v74;
        *(void *)(v78 + 96) = v72;
        uint64_t v81 = v103;
        *(void *)(v78 + 104) = v102;
        *(void *)(v78 + 112) = v81;
        id v82 = v130;
        *(void *)(v78 + 120) = v133;
        *(void *)(v78 + 128) = v82;
        *(void *)(v78 + 136) = v73;
        *(void *)(v78 + 144) = v71;
        LODWORD(v73) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v77, 1, v75);
        id v83 = v126;
        id v84 = v79;
        swift_bridgeObjectRetain();
        if (v73 == 1)
        {
          sub_10001D59C(v77, &qword_100037B30);
        }
        else
        {
          sub_100023180();
          (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v77, v75);
        }
        uint64_t v85 = v98;
        if (*(void *)(v78 + 16))
        {
          swift_getObjectType();
          swift_unknownObjectRetain();
          uint64_t v86 = sub_100023140();
          uint64_t v88 = v87;
          swift_unknownObjectRelease();
        }
        else
        {
          uint64_t v86 = 0;
          uint64_t v88 = 0;
        }
        sub_100022E60();
        if (v88 | v86)
        {
          uint64_t v134 = 0;
          uint64_t v135 = 0;
          uint64_t v136 = v86;
          uint64_t v137 = v88;
        }
        swift_task_create();
        (*v96)(v100, v128, v85);
        swift_retain();
        sub_100022DD0();
        if (swift_isUniquelyReferenced_nonNull_native())
        {
          a2 = v107;
          a1 = v106;
          uint64_t v25 = v105;
          unint64_t v89 = (unint64_t)v129;
        }
        else
        {
          unint64_t v89 = sub_10001A9D4(0, v129[2] + 1, 1, (unint64_t)v129);
          a2 = v107;
          a1 = v106;
          uint64_t v25 = v105;
        }
        unint64_t v91 = *(void *)(v89 + 16);
        unint64_t v90 = *(void *)(v89 + 24);
        if (v91 >= v90 >> 1) {
          unint64_t v89 = sub_10001A9D4(v90 > 1, v91 + 1, 1, v89);
        }
        *(void *)(v89 + 16) = v91 + 1;
        unint64_t v92 = (*(unsigned __int8 *)(v104 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v104 + 80);
        v129 = (void *)v89;
        (*(void (**)(unint64_t, char *, uint64_t))(v104 + 32))(v89 + v92 + *(void *)(v104 + 72) * v91, v118, v101);

        swift_release();
        sub_10001D650(v131, v132);

        (*v94)(v128, v85);
        goto LABEL_6;
      }

      id v24 = v126;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10001D650(v131, v132);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a2 = v107;
      a1 = v106;
      uint64_t v25 = v105;
LABEL_6:
      uint64_t v23 = v133 + 1;
      if (v25 == v133 + 1)
      {
        swift_bridgeObjectRelease();
        return v129;
      }
    }
    v116 = v40;
    v117 = v27;
    goto LABEL_36;
  }
  __break(1u);
  return result;
}

uint64_t sub_100021EE0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10001D5F8(a1, a2);
  }
  return a1;
}

uint64_t sub_100021EF4()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 152, 7);
}

uint64_t sub_100021F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long a11, uint64_t a12)
{
  uint64_t v26 = *(void *)(v12 + 16);
  uint64_t v15 = *(void *)(v12 + 32);
  uint64_t v24 = *(void *)(v12 + 24);
  uint64_t v16 = *(void *)(v12 + 40);
  uint64_t v17 = *(void *)(v12 + 48);
  uint64_t v18 = *(void *)(v12 + 56);
  unsigned int v19 = *(unsigned __int8 *)(v12 + 64);
  double v20 = *(double *)(v12 + 72);
  double v21 = *(double *)(v12 + 80);
  uint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v13 + 16) = v22;
  void *v22 = v13;
  v22[1] = sub_100012C94;
  return sub_1000201A8(a1, v20, v21, v26, v24, v15, v16, v17, v18, v19, a9, a10, a11, a12);
}

unint64_t sub_1000220A8()
{
  unint64_t result = qword_100038098;
  if (!qword_100038098)
  {
    sub_100022BD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100038098);
  }
  return result;
}

uint64_t sub_100022100()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100022148()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_100012C94;
  *(_OWORD *)(v2 + 128) = v3;
  return _swift_task_switch(sub_10001FB04, 0, 0);
}

uint64_t sub_1000221F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100011CD0(&qword_100037B30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002225C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100022294(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10001DB7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000380B8 + dword_1000380B8);
  return v6(a1, v4);
}

uint64_t sub_10002234C()
{
  uint64_t v0 = sub_100022D80();
  sub_10001CF50(v0, qword_1000380C8);
  sub_10001CE68(v0, (uint64_t)qword_1000380C8);
  return sub_100022D70();
}

uint64_t sub_1000223C8(uint64_t a1)
{
  return sub_1000223F8(a1, (uint64_t (*)(void))&nw_endpoint_get_device_name);
}

uint64_t sub_1000223E0(uint64_t a1)
{
  return sub_1000223F8(a1, (uint64_t (*)(void))&nw_endpoint_get_contact_id);
}

uint64_t sub_1000223F8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = sub_100022DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!sub_100022DB0())
  {
    if (qword_100037AC8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_100022D80();
    sub_10001CE68(v12, (uint64_t)qword_1000380C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    uint64_t v13 = sub_100022D60();
    os_log_type_t v14 = sub_100023210();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v16 = sub_100022DA0();
      uint64_t v19 = sub_10001B048(v16, v17, &v20);
      sub_100023260();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Could not convert endpoint to nw_endpoint %s", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }

    return 0;
  }
  if (!a2())
  {
    swift_unknownObjectRelease();
    return 0;
  }
  uint64_t v8 = sub_1000230B0();
  unint64_t v10 = v9;
  swift_unknownObjectRelease();
  uint64_t v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
  }
  if (!v11)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v8;
}

uint64_t sub_1000226B8()
{
  uint64_t v0 = sub_100022D80();
  sub_10001CF50(v0, qword_100038198);
  sub_10001CE68(v0, (uint64_t)qword_100038198);
  return sub_100022D70();
}

void sub_100022734(char a1, NSObject *a2)
{
  uint64_t v2 = "yes";
  if ((a1 & 1) == 0) {
    uint64_t v2 = "no";
  }
  int v3 = 136315394;
  uint64_t v4 = "no";
  __int16 v5 = 2080;
  uint64_t v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Should show magic head: isR1Device: %s, defaultEnabled: %s", (uint8_t *)&v3, 0x16u);
}

void sub_1000227D0()
{
  sub_10000F0FC();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Unexpected kind: %@", v1, 0xCu);
}

void sub_100022844(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Person is nil, ignore selection.", v1, 2u);
}

void sub_100022888(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Selected cell not available, ignore selection.", v1, 2u);
}

void sub_1000228CC()
{
  sub_10000F0FC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Classes: %@", v1, 0xCu);
}

void sub_100022940()
{
  sub_10000F0FC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid URL (no scheme) %@", v1, 0xCu);
}

void sub_1000229B4()
{
  sub_10000F0FC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "UTTypeCreatePreferredIdentifierForTag(%@) returned NULL", v1, 0xCu);
}

void sub_100022A28()
{
  sub_10000F0FC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Failed to convert NSAttributedString [%@] to HTML due to: %@", v2, 0x16u);
}

void sub_100022AAC(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 localizedDescription];
  sub_10000F0FC();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load item for type identifier with error %@", v4, 0xCu);
}

uint64_t sub_100022B40()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100022B50()
{
  return type metadata accessor for Notification();
}

uint64_t sub_100022B60()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100022B70()
{
  return URL.relativePath.getter();
}

uint64_t sub_100022B80()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t sub_100022B90()
{
  return URL.hasDirectoryPath.getter();
}

uint64_t sub_100022BA0()
{
  return URL.lastPathComponent.getter();
}

void sub_100022BB0(NSURL *retstr@<X8>)
{
}

uint64_t sub_100022BC0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_100022BD0()
{
  return type metadata accessor for URL();
}

NSData sub_100022BE0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100022BF0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100022C00()
{
  return UUID.init(uuid:)();
}

uint64_t sub_100022C10()
{
  return UUID.init()();
}

uint64_t sub_100022C20()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100022C30()
{
  return static Locale.current.getter();
}

uint64_t sub_100022C40()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100022C50()
{
  return AirDropDiscoveryView.init(airDropClient:bundleID:)();
}

uint64_t sub_100022C60()
{
  return AirDropDiscoveryView.addPendingDecoration(for:with:)();
}

void sub_100022C80()
{
}

uint64_t sub_100022C90()
{
  return AirDropDiscoveryView.endpoint(for:)();
}

uint64_t sub_100022CA0()
{
  return AirDropDiscoveryView.endpoints.getter();
}

uint64_t sub_100022CB0()
{
  return AirDropDiscoveryView.sessionID.getter();
}

uint64_t sub_100022CC0()
{
  return type metadata accessor for AirDropDiscoveryView();
}

uint64_t sub_100022CD0()
{
  return type metadata accessor for _DDNodeDecoration.Kind();
}

uint64_t sub_100022CE0()
{
  return type metadata accessor for _DDNodeDecoration();
}

uint64_t sub_100022CF0()
{
  return _DDNodeDecoration.init(_:preview:transferID:)();
}

UTType sub_100022D00()
{
  return UTType._bridgeToObjectiveC()();
}

uint64_t sub_100022D10()
{
  return UTType.conforms(to:)();
}

uint64_t sub_100022D20()
{
  return static UTType.directory.getter();
}

uint64_t sub_100022D30()
{
  return static UTType.plainText.getter();
}

uint64_t sub_100022D40()
{
  return type metadata accessor for UTType();
}

uint64_t sub_100022D50()
{
  return UTType.init(_:)();
}

uint64_t sub_100022D60()
{
  return Logger.logObject.getter();
}

uint64_t sub_100022D70()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100022D80()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100022D90()
{
  return AsyncThrowingPublisher.makeAsyncIterator()();
}

uint64_t sub_100022DA0()
{
  return NWEndpoint.debugDescription.getter();
}

uint64_t sub_100022DB0()
{
  return NWEndpoint.nw.getter();
}

uint64_t sub_100022DC0()
{
  return type metadata accessor for NWEndpoint();
}

uint64_t sub_100022DD0()
{
  return SFAirDropSend.ItemPromise.init(task:metadata:)();
}

uint64_t sub_100022DE0()
{
  return type metadata accessor for SFAirDropSend.ItemPromise();
}

uint64_t sub_100022DF0()
{
  return SFAirDropSend.ItemMetadata.previewImageData.getter();
}

uint64_t sub_100022E00()
{
  return SFAirDropSend.ItemMetadata.init(fileName:fileType:fileSubType:fileSize:fileBOMPath:fileIsDirectory:description:previewImageData:wasString:)();
}

uint64_t sub_100022E10()
{
  return type metadata accessor for SFAirDropSend.ItemMetadata();
}

uint64_t sub_100022E30()
{
  return SFAirDropSend.Item.init(url:metadata:)();
}

uint64_t sub_100022E40()
{
  return SFAirDropSend.Item.url.getter();
}

uint64_t sub_100022E50()
{
  return SFAirDropSend.Item.metadata.getter();
}

uint64_t sub_100022E60()
{
  return type metadata accessor for SFAirDropSend.Item();
}

uint64_t sub_100022E70()
{
  return SFAirDropSend.Transfer.id.getter();
}

uint64_t sub_100022E80()
{
  return type metadata accessor for SFAirDropSend.Transfer();
}

uint64_t sub_100022E90()
{
  return type metadata accessor for SFAirDropClient.Identifier();
}

uint64_t sub_100022EA0()
{
  return SFAirDropClient.__allocating_init(identifier:)();
}

uint64_t sub_100022ED0()
{
  return type metadata accessor for SFAirDropClient();
}

uint64_t sub_100022EE0()
{
  return SFXPCProgressTask.initialValue.getter();
}

uint64_t sub_100022EF0()
{
  return SFSecurityScopedURL.url.getter();
}

uint64_t sub_100022F00()
{
  return type metadata accessor for SFSecurityScopedURL();
}

uint64_t sub_100022F10()
{
  return SFAirDropUserDefaults.privateContactDiscoveryEnabled.getter();
}

uint64_t sub_100022F20()
{
  return type metadata accessor for SFAirDrop.TransferIdentifier();
}

uint64_t sub_100022F30()
{
  return SFAirDrop.TransferIdentifier.init(_:)();
}

uint64_t sub_100022F40()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_100022F50()
{
  return Image.init(systemName:)();
}

uint64_t sub_100022F60()
{
  return static SFAirDropUtilities.suggestedAirDropThumbnailSize()();
}

uint64_t sub_100022F70()
{
  return SFAirDropUtilities.FileLoadResult.previewImage.getter();
}

uint64_t sub_100022F80()
{
  return SFAirDropUtilities.FileLoadResult.url.getter();
}

uint64_t sub_100022F90()
{
  return SFAirDropUtilities.FileLoadResult.dataType.getter();
}

uint64_t sub_100022FA0()
{
  return SFAirDropUtilities.FileLoadResult.wasString.getter();
}

uint64_t sub_100022FB0()
{
  return type metadata accessor for SFAirDropUtilities.FileLoadResult();
}

uint64_t sub_100022FC0()
{
  return static SFAirDropUtilities.guessedDataType(for:dataTypesToTry:)();
}

uint64_t sub_100022FD0()
{
  return static SFAirDropUtilities.shouldIgnoreString(for:)();
}

uint64_t sub_100022FE0()
{
  return static SFAirDropUtilities.highestFidelityDataType(for:conformingToDataTypes:)();
}

uint64_t sub_100022FF0()
{
  return static SFAirDropUtilities.standardTypeIdentifiers.getter();
}

uint64_t sub_100023010()
{
  return static SFAirDropUtilities.imageData(for:)();
}

uint64_t sub_100023020()
{
  return type metadata accessor for SFAirDropUtilities();
}

uint64_t sub_100023030()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100023040()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100023050()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_100023060()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100023070()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100023080()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100023090()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000230A0()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_1000230B0()
{
  return String.init(cString:)();
}

Swift::Int sub_1000230C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000230D0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000230E0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000230F0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100023100()
{
  return Array.description.getter();
}

uint64_t sub_100023110()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100023120()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100023130()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100023140()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100023160()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100023170()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100023180()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100023190()
{
  return type metadata accessor for TaskPriority();
}

void sub_1000231A0()
{
}

uint64_t sub_1000231B0()
{
  return static Task<>.noThrow(priority:operation:)();
}

NSSet sub_1000231D0()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_1000231E0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000231F0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100023200()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100023210()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100023220()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100023230()
{
  return static NSUserDefaults.airdrop.getter();
}

UIBarButtonItem sub_100023240(UIBarButtonSystemItem systemItem, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return UIBarButtonItem.init(systemItem:primaryAction:menu:)(systemItem, primaryAction, menu);
}

uint64_t sub_100023250()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_100023260()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100023270()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100023280()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100023290()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_1000232A0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000232B0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1000232C0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_1000232D0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000232E0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000232F0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100023300()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100023320()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100023330()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100023340()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100023350()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100023360()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100023370()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100023380()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100023390()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000233A0()
{
  return Error.localizedDescription.getter();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return _CPCopyBundleIdentifierAndTeamFromAuditToken();
}

uint64_t IsAppleInternalBuild()
{
  return _IsAppleInternalBuild();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SFContentTypes()
{
  return _SFContentTypes();
}

uint64_t SFCreateLivePhotoBundle()
{
  return _SFCreateLivePhotoBundle();
}

uint64_t SFCreateThumbnailImage()
{
  return _SFCreateThumbnailImage();
}

uint64_t SFDeviceModelCodeGet()
{
  return _SFDeviceModelCodeGet();
}

uint64_t SFFakeFilesAndItemsArrayForURLs()
{
  return _SFFakeFilesAndItemsArrayForURLs();
}

uint64_t SFImageStackFromImages()
{
  return _SFImageStackFromImages();
}

uint64_t SFIsCredential()
{
  return _SFIsCredential();
}

uint64_t SFIsFindMyFriendsLink()
{
  return _SFIsFindMyFriendsLink();
}

uint64_t SFIsImage()
{
  return _SFIsImage();
}

uint64_t SFIsLivePhotos()
{
  return _SFIsLivePhotos();
}

uint64_t SFIsPass()
{
  return _SFIsPass();
}

uint64_t SFIsPasskeyCredentialLink()
{
  return _SFIsPasskeyCredentialLink();
}

uint64_t SFIsVideo()
{
  return _SFIsVideo();
}

uint64_t SFLocalizedStringForKey()
{
  return _SFLocalizedStringForKey();
}

uint64_t SFLocalizedStringForKeyInStringsFileNamed()
{
  return _SFLocalizedStringForKeyInStringsFileNamed();
}

uint64_t SFMetricsLog()
{
  return _SFMetricsLog();
}

uint64_t SFScaleAndRotateImage()
{
  return _SFScaleAndRotateImage();
}

uint64_t SFSuggestedAirDropThumbnailSize()
{
  return _SFSuggestedAirDropThumbnailSize();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return _UTTypeConformsTo(inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyDescription(CFStringRef inUTI)
{
  return _UTTypeCopyDescription(inUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return _UTTypeCopyPreferredTagWithClass(inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return _UTTypeCreatePreferredIdentifierForTag(inTagClass, inTag, inConformingToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UTTypeCreateSuggestedFilename()
{
  return __UTTypeCreateSuggestedFilename();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t airdrop_ui_log()
{
  return _airdrop_ui_log();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

uint64_t magic_head_log()
{
  return _magic_head_log();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint64_t nw_endpoint_get_service_identifier()
{
  return _nw_endpoint_get_service_identifier();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

uint64_t share_sheet_log()
{
  return _share_sheet_log();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return _swift_dynamicCastUnknownClassUnconditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__activateSecurityScopedResourcesForExtensionItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activateSecurityScopedResourcesForExtensionItems:");
}

id objc_msgSend__addSubscriberForCategory_usingPublishingHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addSubscriberForCategory:usingPublishingHandler:");
}

id objc_msgSend__collectTelemetryForPeople_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_collectTelemetryForPeople:");
}

id objc_msgSend__emitTelemetryForPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_emitTelemetryForPerson:");
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _hostApplicationBundleIdentifier];
}

id objc_msgSend__preferredFontForTextStyle_variant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontForTextStyle:variant:");
}

id objc_msgSend__preferredFontForTextStyle_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontForTextStyle:weight:");
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return _[a1 _referenceBounds];
}

id objc_msgSend__removeSubscriber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeSubscriber:");
}

id objc_msgSend__setManualScrollEdgeAppearanceEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setManualScrollEdgeAppearanceEnabled:");
}

id objc_msgSend__setManualScrollEdgeAppearanceProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setManualScrollEdgeAppearanceProgress:");
}

id objc_msgSend__startTelemetry(void *a1, const char *a2, ...)
{
  return _[a1 _startTelemetry];
}

id objc_msgSend_absoluteDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteDimension:");
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return _[a1 actionButton];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 activeInterfaceOrientation];
}

id objc_msgSend_addAttributedString_withAttachmentName_description_previewImage_itemIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttributedString:withAttachmentName:description:previewImage:itemIndex:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addData_ofType_withAttachmentName_description_previewImage_itemIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addData:ofType:withAttachmentName:description:previewImage:itemIndex:");
}

id objc_msgSend_addImage_withAttachmentName_description_previewImage_itemIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addImage:withAttachmentName:description:previewImage:itemIndex:");
}

id objc_msgSend_addItemProvider_withDataType_attachmentName_description_previewImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addItemProvider:withDataType:attachmentName:description:previewImage:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addString_withAttachmentName_description_previewImage_itemIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addString:withAttachmentName:description:previewImage:itemIndex:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addURL_withAttachmentName_description_previewImage_itemIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addURL:withAttachmentName:description:previewImage:itemIndex:");
}

id objc_msgSend_airDropCollectionViewLayout(void *a1, const char *a2, ...)
{
  return _[a1 airDropCollectionViewLayout];
}

id objc_msgSend_airDropDelegate(void *a1, const char *a2, ...)
{
  return _[a1 airDropDelegate];
}

id objc_msgSend_airDropNoContentView(void *a1, const char *a2, ...)
{
  return _[a1 airDropNoContentView];
}

id objc_msgSend_airDropViewController(void *a1, const char *a2, ...)
{
  return _[a1 airDropViewController];
}

id objc_msgSend_airDropViewServiceDidFinishTransferWithSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airDropViewServiceDidFinishTransferWithSuccess:");
}

id objc_msgSend_airDropViewServiceDidRequestDismissal(void *a1, const char *a2, ...)
{
  return _[a1 airDropViewServiceDidRequestDismissal];
}

id objc_msgSend_airDropViewServiceDidStartTransfer(void *a1, const char *a2, ...)
{
  return _[a1 airDropViewServiceDidStartTransfer];
}

id objc_msgSend_airDropViewServiceRequestingSharedItemsWithDataRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airDropViewServiceRequestingSharedItemsWithDataRequest:completionHandler:");
}

id objc_msgSend_airDropViewServiceWillStartTransferToRecipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airDropViewServiceWillStartTransferToRecipient:");
}

id objc_msgSend_airdropCompletion(void *a1, const char *a2, ...)
{
  return _[a1 airdropCompletion];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_appendItemsWithIdentifiers_intoSectionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendItemsWithIdentifiers:intoSectionWithIdentifier:");
}

id objc_msgSend_appendSectionsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendSectionsWithIdentifiers:");
}

id objc_msgSend_applySnapshot_animatingDifferences_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applySnapshot:animatingDifferences:completion:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachmentNameForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentNameForItem:");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return _[a1 attachments];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return _[a1 backgroundView];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_boundarySupplementaryItemWithLayoutSize_elementKind_alignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_canShowNoContentView(void *a1, const char *a2, ...)
{
  return _[a1 canShowNoContentView];
}

id objc_msgSend_cancelTransferForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTransferForCell:");
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForItemAtIndexPath:");
}

id objc_msgSend_cellForPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForPerson:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_collectionView_didSelectItemAtIndexPath_cellInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:didSelectItemAtIndexPath:cellInitiator:");
}

id objc_msgSend_collectionView_shouldHighlightItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:shouldHighlightItemAtIndexPath:");
}

id objc_msgSend_collectionViewTopConstraint(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewTopConstraint];
}

id objc_msgSend_configureWithDefaultBackground(void *a1, const char *a2, ...)
{
  return _[a1 configureWithDefaultBackground];
}

id objc_msgSend_configureWithTransparentBackground(void *a1, const char *a2, ...)
{
  return _[a1 configureWithTransparentBackground];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return _[a1 container];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createURLPayloadForData_ofType_withAttachmentName_description_previewImage_itemIndex_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createURLPayloadForData:ofType:withAttachmentName:description:previewImage:itemIndex:completion:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 currentSnapshot];
}

id objc_msgSend_dataFromRange_documentAttributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataFromRange:documentAttributes:error:");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataTypeForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTypeForItem:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return _[a1 deactivate];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultFontDescriptorWithTextStyle:");
}

id objc_msgSend_defaultFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dequeueReusableCellWithReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");
}

id objc_msgSend_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deselectItemAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectItemAtIndexPath:animated:");
}

id objc_msgSend_deviceSupportsWAPI(void *a1, const char *a2, ...)
{
  return _[a1 deviceSupportsWAPI];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 directionalLayoutMargins];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_estimatedDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedDimension:");
}

id objc_msgSend_extensionItems(void *a1, const char *a2, ...)
{
  return _[a1 extensionItems];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fixedSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fixedSpacing:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_fractionalWidthDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fractionalWidthDimension:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_generateSpecialPreviewPhotoForRequestID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateSpecialPreviewPhotoForRequestID:");
}

id objc_msgSend_handleOtherItemProvider_withDataType_attachmentName_description_previewImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleOtherItemProvider:withDataType:attachmentName:description:previewImage:");
}

id objc_msgSend_hasItemConformingToTypeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasItemConformingToTypeIdentifier:");
}

id objc_msgSend_horizontalGroupWithLayoutSize_subitem_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalGroupWithLayoutSize:subitem:count:");
}

id objc_msgSend_horizontalGroupWithLayoutSize_subitems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalGroupWithLayoutSize:subitems:");
}

id objc_msgSend_identifer(void *a1, const char *a2, ...)
{
  return _[a1 identifer];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _[a1 imageURL];
}

id objc_msgSend_imageWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithContentsOfFile:");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_indexPathForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForCell:");
}

id objc_msgSend_indexPathForItemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForItemIdentifier:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCollectionView_cellProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCollectionView:cellProvider:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithFrame_collectionViewLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:collectionViewLayout:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithNode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNode:");
}

id objc_msgSend_initWithSectionProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSectionProvider:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isApplicationAvailableToOpenURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isApplicationAvailableToOpenURL:error:");
}

id objc_msgSend_isApplicationAvailableToOpenURL_includePrivateURLSchemes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isApplicationAvailableToOpenURL:includePrivateURLSchemes:error:");
}

id objc_msgSend_isBluetoothEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isBluetoothEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isUnknown(void *a1, const char *a2, ...)
{
  return _[a1 isUnknown];
}

id objc_msgSend_isValidPayload_toPerson_invalidMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidPayload:toPerson:invalidMessage:");
}

id objc_msgSend_isWifiEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isWifiEnabled];
}

id objc_msgSend_isWirelessAccessPointEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isWirelessAccessPointEnabled];
}

id objc_msgSend_itemIdentifierForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemIdentifierForIndexPath:");
}

id objc_msgSend_itemWithLayoutSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithLayoutSize:");
}

id objc_msgSend_knownPeople(void *a1, const char *a2, ...)
{
  return _[a1 knownPeople];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_layoutAirDropCollectionViewAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutAirDropCollectionViewAnimated:");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _[a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leftAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadItemForTypeIdentifier_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadItemForTypeIdentifier:options:completionHandler:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_magicHeadUUID(void *a1, const char *a2, ...)
{
  return _[a1 magicHeadUUID];
}

id objc_msgSend_magicHeadVC(void *a1, const char *a2, ...)
{
  return _[a1 magicHeadVC];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_maxPreviews(void *a1, const char *a2, ...)
{
  return _[a1 maxPreviews];
}

id objc_msgSend_mePeople(void *a1, const char *a2, ...)
{
  return _[a1 mePeople];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_newPayloadWithURL_description_previewImage_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newPayloadWithURL:description:previewImage:identifier:");
}

id objc_msgSend_noContentViewActionTriggered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noContentViewActionTriggered:");
}

id objc_msgSend_nodeIDToNode(void *a1, const char *a2, ...)
{
  return _[a1 nodeIDToNode];
}

id objc_msgSend_nodeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 nodeIdentifier];
}

id objc_msgSend_numberOfItems(void *a1, const char *a2, ...)
{
  return _[a1 numberOfItems];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_payloadDescription(void *a1, const char *a2, ...)
{
  return _[a1 payloadDescription];
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_person(void *a1, const char *a2, ...)
{
  return _[a1 person];
}

id objc_msgSend_personCollectionViewCellDidFinishTransfer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personCollectionViewCellDidFinishTransfer:");
}

id objc_msgSend_personCollectionViewCellDidStartTransfer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personCollectionViewCellDidStartTransfer:");
}

id objc_msgSend_personCollectionViewCellDidTerminateTransfer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personCollectionViewCellDidTerminateTransfer:");
}

id objc_msgSend_photoOutboundSharingTmpDirectoryURL(void *a1, const char *a2, ...)
{
  return _[a1 photoOutboundSharingTmpDirectoryURL];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_prepareWithActivityExtensionItemData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareWithActivityExtensionItemData:");
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _[a1 present];
}

id objc_msgSend_previewImage(void *a1, const char *a2, ...)
{
  return _[a1 previewImage];
}

id objc_msgSend_previewImageDataForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previewImageDataForItem:");
}

id objc_msgSend_previewImageForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previewImageForItem:");
}

id objc_msgSend_realName(void *a1, const char *a2, ...)
{
  return _[a1 realName];
}

id objc_msgSend_realNamesWithTransfersStartedFromMagicHead(void *a1, const char *a2, ...)
{
  return _[a1 realNamesWithTransfersStartedFromMagicHead];
}

id objc_msgSend_registerClass_forCellWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellWithReuseIdentifier:");
}

id objc_msgSend_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:");
}

id objc_msgSend_registeredTypeIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 registeredTypeIdentifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_replaceOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_requestForActivity_activityType_activitySpecificMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestForActivity:activityType:activitySpecificMetadata:");
}

id objc_msgSend_requestingSharedItemsWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestingSharedItemsWithOptions:completionHandler:");
}

id objc_msgSend_resetTransferState(void *a1, const char *a2, ...)
{
  return _[a1 resetTransferState];
}

id objc_msgSend_resetTransferStateWithRealName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetTransferStateWithRealName:");
}

id objc_msgSend_restoreCellStateFromFinalTransferState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreCellStateFromFinalTransferState:");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 rightAnchor];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sectionIdentifierForSectionContainingItemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionIdentifierForSectionContainingItemIdentifier:");
}

id objc_msgSend_sectionIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 sectionIdentifiers];
}

id objc_msgSend_sectionWithGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionWithGroup:");
}

id objc_msgSend_selectItemAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectItemAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return _[a1 separatorColor];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActionButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionButton:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActivitySheetWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivitySheetWidth:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAirDropNoContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAirDropNoContentView:");
}

id objc_msgSend_setAirDropViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAirDropViewController:");
}

id objc_msgSend_setAirdropCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAirdropCompletion:");
}

id objc_msgSend_setAllowsMultipleSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsMultipleSelection:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceVertical:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBluetoothEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothEnabled:");
}

id objc_msgSend_setBoundarySupplementaryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBoundarySupplementaryItems:");
}

id objc_msgSend_setCanShowNoContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanShowNoContentView:");
}

id objc_msgSend_setCellState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellState:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCollectionView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollectionView:");
}

id objc_msgSend_setCollectionViewLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollectionViewLayout:");
}

id objc_msgSend_setCollectionViewTopConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollectionViewTopConstraint:");
}

id objc_msgSend_setContentHorizontalAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHorizontalAlignment:");
}

id objc_msgSend_setContentInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInsets:");
}

id objc_msgSend_setCurrentSnapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSnapshot:");
}

id objc_msgSend_setDarkStyleOnLegacyApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDarkStyleOnLegacyApp:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDefaultButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultButtonTitle:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDiffableDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiffableDelegate:");
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirectionalLayoutMargins:");
}

id objc_msgSend_setDotsRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDotsRadius:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setInterGroupSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterGroupSpacing:");
}

id objc_msgSend_setInterItemSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterItemSpacing:");
}

id objc_msgSend_setKnownPeople_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKnownPeople:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setMagicHeadUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMagicHeadUUID:");
}

id objc_msgSend_setMagicHeadVC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMagicHeadVC:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMaxPreviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxPreviews:");
}

id objc_msgSend_setMePeople_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMePeople:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setNeedsFocusUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsFocusUpdate];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNumberOfDots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfDots:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPerson:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setRealNamesWithTransfersStartedFromMagicHead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRealNamesWithTransfersStartedFromMagicHead:");
}

id objc_msgSend_setRemembersLastFocusedIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemembersLastFocusedIndexPath:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setScrollEdgeAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEdgeAppearance:");
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:");
}

id objc_msgSend_setSessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionID:");
}

id objc_msgSend_setSf_initiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSf_initiator:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setStandardAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStandardAppearance:");
}

id objc_msgSend_setStateBeingRestored_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateBeingRestored:");
}

id objc_msgSend_setSubtitleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitleLabel:");
}

id objc_msgSend_setSupplementariesFollowContentInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupplementariesFollowContentInsets:");
}

id objc_msgSend_setSupplementaryViewProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupplementaryViewProvider:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabel:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUnknownPeople_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnknownPeople:");
}

id objc_msgSend_setViewType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewType:");
}

id objc_msgSend_setWifiEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiEnabled:");
}

id objc_msgSend_setWirelessAccessPointEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWirelessAccessPointEnabled:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setupConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setupConstraints];
}

id objc_msgSend_sf_personRealName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sf_personRealName");
}

id objc_msgSend_sf_publishingKeyForApp_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sf_publishingKeyForApp:sessionID:");
}

id objc_msgSend_sf_transferState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sf_transferState");
}

id objc_msgSend_shouldBeHidden(void *a1, const char *a2, ...)
{
  return _[a1 shouldBeHidden];
}

id objc_msgSend_showNoContentView(void *a1, const char *a2, ...)
{
  return _[a1 showNoContentView];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeWithWidthDimension_heightDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeWithWidthDimension:heightDimension:");
}

id objc_msgSend_ss_activitySpecificExtensionItemDataRequestInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ss_activitySpecificExtensionItemDataRequestInfo");
}

id objc_msgSend_ss_activityTypeToReportToHost(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ss_activityTypeToReportToHost");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAccessingSecurityScopedResourcesInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAccessingSecurityScopedResourcesInContext:");
}

id objc_msgSend_startBrowsing(void *a1, const char *a2, ...)
{
  return _[a1 startBrowsing];
}

id objc_msgSend_startSendForBundleID_sessionID_items_description_previewImage_fromShareSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSendForBundleID:sessionID:items:description:previewImage:fromShareSheet:");
}

id objc_msgSend_startTransferForPeople_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTransferForPeople:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopAccessingSecurityScopedResources(void *a1, const char *a2, ...)
{
  return _[a1 stopAccessingSecurityScopedResources];
}

id objc_msgSend_stopBrowsing(void *a1, const char *a2, ...)
{
  return _[a1 stopBrowsing];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subjectForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subjectForItem:");
}

id objc_msgSend_subscribeToProgresses(void *a1, const char *a2, ...)
{
  return _[a1 subscribeToProgresses];
}

id objc_msgSend_subscribedProgress_forPersonWithRealName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribedProgress:forPersonWithRealName:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLabel];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_suggestedThumbnailSize(void *a1, const char *a2, ...)
{
  return _[a1 suggestedThumbnailSize];
}

id objc_msgSend_supportsCredentials(void *a1, const char *a2, ...)
{
  return _[a1 supportsCredentials];
}

id objc_msgSend_supportsFMF(void *a1, const char *a2, ...)
{
  return _[a1 supportsFMF];
}

id objc_msgSend_supportsMixedTypes(void *a1, const char *a2, ...)
{
  return _[a1 supportsMixedTypes];
}

id objc_msgSend_supportsPasses(void *a1, const char *a2, ...)
{
  return _[a1 supportsPasses];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _[a1 systemWhiteColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_transferCancelledToPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transferCancelledToPerson:");
}

id objc_msgSend_ultraWideBandStatus(void *a1, const char *a2, ...)
{
  return _[a1 ultraWideBandStatus];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unknownPeople(void *a1, const char *a2, ...)
{
  return _[a1 unknownPeople];
}

id objc_msgSend_unpublishedProgressForPersonWithRealName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unpublishedProgressForPersonWithRealName:");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsubscribeToProgresses(void *a1, const char *a2, ...)
{
  return _[a1 unsubscribeToProgresses];
}

id objc_msgSend_updateFocusIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 updateFocusIfNeeded];
}

id objc_msgSend_updateNodes_withPersonToProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNodes:withPersonToProgress:");
}

id objc_msgSend_userDidCancel(void *a1, const char *a2, ...)
{
  return _[a1 userDidCancel];
}

id objc_msgSend_userDidSelect(void *a1, const char *a2, ...)
{
  return _[a1 userDidSelect];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userSelectedWithRealName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userSelectedWithRealName:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_videoURL(void *a1, const char *a2, ...)
{
  return _[a1 videoURL];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewType(void *a1, const char *a2, ...)
{
  return _[a1 viewType];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return _[a1 visibleCells];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_wasString(void *a1, const char *a2, ...)
{
  return _[a1 wasString];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}