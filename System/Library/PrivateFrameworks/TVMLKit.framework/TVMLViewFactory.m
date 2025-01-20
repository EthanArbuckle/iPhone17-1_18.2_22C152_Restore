@interface TVMLViewFactory
+ (id)_organizerViewWithElement:(id)a3 elements:(id)a4 existingView:(id)a5;
+ (id)buttonForElement:(id)a3 existingView:(id)a4;
+ (id)buttonLockupForElement:(id)a3 existingView:(id)a4;
+ (id)imageStackViewWithElement:(id)a3 existingView:(id)a4;
+ (id)imageStackViewWithElement:(id)a3 layout:(id)a4 existingView:(id)a5;
+ (id)imageViewWithElement:(id)a3 existingView:(id)a4;
+ (id)imageViewWithElement:(id)a3 layout:(id)a4 existingView:(id)a5;
+ (id)organizerViewWithElements:(id)a3 existingView:(id)a4;
- (TVMLViewFactory)init;
- (id)_activityIndicatorViewForElement:(id)a3 existingView:(id)a4;
- (id)_buttonForElement:(id)a3 existingView:(id)a4;
- (id)_buttonLockupForElement:(id)a3 existingView:(id)a4;
- (id)_cardViewFromElement:(id)a3 existingView:(id)a4;
- (id)_headerColumnViewForElement:(id)a3 existingView:(id)a4;
- (id)_imageViewForBadgeElement:(id)a3 existingView:(id)a4;
- (id)_imageViewForElement:(id)a3 layout:(id)a4 existingView:(id)a5;
- (id)_labelViewForElement:(id)a3 existingView:(id)a4;
- (id)_listItemLockupWithElement:(id)a3 existingView:(id)a4;
- (id)_loadingImageViewForElement:(id)a3 existingView:(id)a4;
- (id)_monogramViewForElement:(id)a3 layout:(id)a4 existingView:(id)a5;
- (id)_organizerViewForElement:(id)a3 existingView:(id)a4;
- (id)_progressBarFromElement:(id)a3 existingView:(id)a4;
- (id)_ratingBadgeFromElement:(id)a3 existingView:(id)a4;
- (id)_rowViewForElement:(id)a3 existingView:(id)a4;
- (id)_seasonsBadgeWithElement:(id)a3 existingView:(id)a4;
- (id)_segmentedControlForElement:(id)a3 existingView:(id)a4;
- (id)_separatorViewForElement:(id)a3 existingView:(id)a4;
- (id)_textBoxViewForElement:(id)a3 existingView:(id)a4;
- (id)_textViewWithElement:(id)a3 existingView:(id)a4;
- (id)_zoomableTextViewFromElement:(id)a3 alwaysFocusable:(BOOL)a4 existingView:(id)a5;
- (void)_registerViewCreators;
@end

@implementation TVMLViewFactory

- (TVMLViewFactory)init
{
  v5.receiver = self;
  v5.super_class = (Class)TVMLViewFactory;
  v2 = [(TVMLViewFactory *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TVMLViewFactory *)v2 _registerViewCreators];
  }
  return v3;
}

- (void)_registerViewCreators
{
  objc_initWeak(location, self);
  v2 = +[TVInterfaceFactory sharedInterfaceFactory];
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke;
  v79[3] = &unk_264BA88E0;
  objc_copyWeak(&v80, location);
  [v2 _registerViewCreator:v79 withType:55];

  v3 = +[TVInterfaceFactory sharedInterfaceFactory];
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_2;
  v77[3] = &unk_264BA88E0;
  objc_copyWeak(&v78, location);
  [v3 _registerViewCreator:v77 withType:33];

  v4 = +[TVInterfaceFactory sharedInterfaceFactory];
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_3;
  v75[3] = &unk_264BA88E0;
  objc_copyWeak(&v76, location);
  [v4 _registerViewCreator:v75 withType:15];

  objc_super v5 = +[TVInterfaceFactory sharedInterfaceFactory];
  v73[0] = MEMORY[0x263EF8330];
  v73[1] = 3221225472;
  v73[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_4;
  v73[3] = &unk_264BA88E0;
  objc_copyWeak(&v74, location);
  [v5 _registerViewCreator:v73 withType:23];

  v6 = +[TVInterfaceFactory sharedInterfaceFactory];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_5;
  v71[3] = &unk_264BA88E0;
  objc_copyWeak(&v72, location);
  [v6 _registerViewCreator:v71 withType:34];

  v7 = +[TVInterfaceFactory sharedInterfaceFactory];
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_6;
  v69[3] = &unk_264BA88E0;
  objc_copyWeak(&v70, location);
  [v7 _registerViewCreator:v69 withType:35];

  v8 = +[TVInterfaceFactory sharedInterfaceFactory];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_7;
  v67[3] = &unk_264BA88E0;
  objc_copyWeak(&v68, location);
  [v8 _registerViewCreator:v67 withType:12];

  v9 = +[TVInterfaceFactory sharedInterfaceFactory];
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_8;
  v65[3] = &unk_264BA88E0;
  objc_copyWeak(&v66, location);
  [v9 _registerViewCreator:v65 withType:59];

  v10 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v10 _registerViewCreator:&__block_literal_global_39 withType:19];

  v11 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v11 _registerViewCreator:&__block_literal_global_296 withType:20];

  v12 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v12 _registerViewCreator:&__block_literal_global_299 withType:18];

  v13 = +[TVInterfaceFactory sharedInterfaceFactory];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_12;
  v63[3] = &unk_264BA88E0;
  objc_copyWeak(&v64, location);
  [v13 _registerViewCreator:v63 withType:13];

  v14 = +[TVInterfaceFactory sharedInterfaceFactory];
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_13;
  v61[3] = &unk_264BA88E0;
  objc_copyWeak(&v62, location);
  [v14 _registerViewCreator:v61 withType:1];

  v15 = +[TVInterfaceFactory sharedInterfaceFactory];
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_14;
  v59[3] = &unk_264BA8928;
  objc_copyWeak(&v60, location);
  [v15 _registerViewCreatorEx:v59 withType:16];

  v16 = +[TVInterfaceFactory sharedInterfaceFactory];
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_15;
  v57[3] = &unk_264BA8928;
  objc_copyWeak(&v58, location);
  [v16 _registerViewCreatorEx:v57 withType:30];

  v17 = +[TVInterfaceFactory sharedInterfaceFactory];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_16;
  v55[3] = &unk_264BA88E0;
  objc_copyWeak(&v56, location);
  [v17 _registerViewCreator:v55 withType:5];

  v18 = +[TVInterfaceFactory sharedInterfaceFactory];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_17;
  v53[3] = &unk_264BA88E0;
  objc_copyWeak(&v54, location);
  [v18 _registerViewCreator:v53 withType:44];

  v19 = +[TVInterfaceFactory sharedInterfaceFactory];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_18;
  v51[3] = &unk_264BA88E0;
  objc_copyWeak(&v52, location);
  [v19 _registerViewCreator:v51 withType:6];

  v20 = +[TVInterfaceFactory sharedInterfaceFactory];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_19;
  v49[3] = &unk_264BA88E0;
  objc_copyWeak(&v50, location);
  [v20 _registerViewCreator:v49 withType:7];

  v21 = +[TVInterfaceFactory sharedInterfaceFactory];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_20;
  v47[3] = &unk_264BA88E0;
  objc_copyWeak(&v48, location);
  [v21 _registerViewCreator:v47 withType:50];

  v22 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v22 _registerViewCreator:&__block_literal_global_303 withType:38];

  v23 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v23 _registerViewCreator:&__block_literal_global_306 withType:54];

  v24 = +[TVInterfaceFactory sharedInterfaceFactory];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_23;
  v45[3] = &unk_264BA88E0;
  objc_copyWeak(&v46, location);
  [v24 _registerViewCreator:v45 withType:8];

  v25 = +[TVInterfaceFactory sharedInterfaceFactory];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_24;
  v43[3] = &unk_264BA88E0;
  objc_copyWeak(&v44, location);
  [v25 _registerViewCreator:v43 withType:41];

  v26 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v26 _registerViewCreator:&__block_literal_global_309 withType:85];

  v27 = +[TVInterfaceFactory sharedInterfaceFactory];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_26;
  v41[3] = &unk_264BA88E0;
  objc_copyWeak(&v42, location);
  [v27 _registerViewCreator:v41 withType:39];

  v28 = +[TVInterfaceFactory sharedInterfaceFactory];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_27;
  v39[3] = &unk_264BA88E0;
  objc_copyWeak(&v40, location);
  [v28 _registerViewCreator:v39 withType:21];

  v29 = +[TVInterfaceFactory sharedInterfaceFactory];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_28;
  v37[3] = &unk_264BA88E0;
  objc_copyWeak(&v38, location);
  [v29 _registerViewCreator:v37 withType:52];

  v30 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v30 _registerViewCreator:&__block_literal_global_312 withType:56];

  v31 = +[TVInterfaceFactory sharedInterfaceFactory];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_30;
  v35[3] = &unk_264BA88E0;
  objc_copyWeak(&v36, location);
  [v31 _registerViewCreator:v35 withType:48];

  v32 = +[TVInterfaceFactory sharedInterfaceFactory];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __40__TVMLViewFactory__registerViewCreators__block_invoke_31;
  v33[3] = &unk_264BA88E0;
  objc_copyWeak(&v34, location);
  [v32 _registerViewCreator:v33 withType:80];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);
  objc_destroyWeak(&v64);
  objc_destroyWeak(&v66);
  objc_destroyWeak(&v68);
  objc_destroyWeak(&v70);
  objc_destroyWeak(&v72);
  objc_destroyWeak(&v74);
  objc_destroyWeak(&v76);
  objc_destroyWeak(&v78);
  objc_destroyWeak(&v80);
  objc_destroyWeak(location);
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v8 = [WeakRetained _textViewWithElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v8 = [WeakRetained _labelViewForElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 parent];
  if (objc_msgSend(v7, "tv_elementType") == 20)
  {

LABEL_4:
    v10 = +[_TVInfoHeaderView infoHeaderViewWithElement:v5 existingView:v6];
    goto LABEL_6;
  }
  v8 = [v5 parent];
  uint64_t v9 = objc_msgSend(v8, "tv_elementType");

  if (v9 == 19) {
    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = [WeakRetained _organizerViewForElement:v5 existingView:v6];

LABEL_6:
  return v10;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v8 = [WeakRetained _listItemLockupWithElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v8 = [WeakRetained _organizerViewForElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v8 = [WeakRetained _organizerViewForElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v8 = [WeakRetained _organizerViewForElement:v6 existingView:v5];

  uint64_t v9 = [v8 containerGuide];
  [v9 setEnabled:1];

  v10 = [v6 style];

  v11 = objc_msgSend(v10, "tv_backgroundColor");
  v12 = [v11 color];

  if (v12)
  {
    [v8 setBackgroundColor:v12];
  }
  else
  {
    v13 = [MEMORY[0x263F1C550] clearColor];
    [v8 setBackgroundColor:v13];
  }
  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v8 = [WeakRetained _organizerViewForElement:v6 existingView:v5];

  return v8;
}

_TVInfoListView *__40__TVMLViewFactory__registerViewCreators__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVInfoListView infoListViewWithElement:a2 existingView:a3];
}

_TVInfoTableView *__40__TVMLViewFactory__registerViewCreators__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVInfoTableView infoTableViewWithElement:a2 existingView:a3];
}

_TVInfoCellView *__40__TVMLViewFactory__registerViewCreators__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVInfoCellView infoCellViewWithElement:a2 existingView:a3];
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 parent];
  if (objc_msgSend(v7, "tv_elementType") == 20)
  {

LABEL_4:
    v10 = +[_TVInfoHeaderView infoHeaderViewWithElement:v5 existingView:v6];
    goto LABEL_6;
  }
  v8 = [v5 parent];
  uint64_t v9 = objc_msgSend(v8, "tv_elementType");

  if (v9 == 19) {
    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = [WeakRetained _organizerViewForElement:v5 existingView:v6];

LABEL_6:
  return v10;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v8 = [WeakRetained _activityIndicatorViewForElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_14(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  v11 = [WeakRetained _imageViewForElement:v9 layout:v8 existingView:v7];

  return v11;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_15(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  v11 = [WeakRetained _monogramViewForElement:v9 layout:v8 existingView:v7];

  return v11;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _imageViewForBadgeElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _rowViewForElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _buttonForElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _buttonLockupForElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _segmentedControlForElement:v6 existingView:v5];

  return v8;
}

_TVProductInfoView *__40__TVMLViewFactory__registerViewCreators__block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVProductInfoView productInfoViewWithElement:a2 existingView:a3];
}

_TVProductStackView *__40__TVMLViewFactory__registerViewCreators__block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVProductStackView productStackViewWithElement:a2 existingView:a3];
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _cardViewFromElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _ratingBadgeFromElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVStarHistogram histogramViewWithElement:a2 existingView:a3];
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _progressBarFromElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _organizerViewForElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _separatorViewForElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_29(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_TVTextBadge textBadgeViewWithElement:a2 existingView:a3];
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _seasonsBadgeWithElement:v6 existingView:v5];

  return v8;
}

id __40__TVMLViewFactory__registerViewCreators__block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _loadingImageViewForElement:v6 existingView:v5];

  return v8;
}

+ (id)organizerViewWithElements:(id)a3 existingView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() _organizerViewWithElement:0 elements:v6 existingView:v5];

  return v7;
}

+ (id)_organizerViewWithElement:(id)a3 elements:(id)a4 existingView:(id)a5
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = (_TVOrganizerView *)v9;
  }
  else
  {
    v11 = [_TVOrganizerView alloc];
    v10 = -[_TVOrganizerView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  v12 = v10;
  uint64_t v79 = objc_msgSend(v7, "tv_semanticContentAttribute");
  -[_TVOrganizerView setSemanticContentAttribute:](v12, "setSemanticContentAttribute:");
  v75 = [MEMORY[0x263EFF980] array];
  v71 = v8;
  if (v7)
  {
    id v13 = [v7 children];
  }
  else
  {
    id v13 = v8;
  }
  v14 = v13;
  id v72 = v7;
  id v70 = v9;
  v15 = [v9 components];
  v16 = (void *)[v15 mutableCopy];

  v90[0] = MEMORY[0x263EF8330];
  v90[1] = 3221225472;
  v90[2] = __67__TVMLViewFactory__organizerViewWithElement_elements_existingView___block_invoke;
  v90[3] = &unk_264BA8978;
  id v69 = v16;
  id v91 = v69;
  v17 = (void (**)(void, void, void))MEMORY[0x230FC9DC0](v90);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = v14;
  uint64_t v18 = [obj countByEnumeratingWithState:&v86 objects:v93 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    v20 = 0;
    uint64_t v21 = *(void *)v87;
    uint64_t v73 = *(void *)v87;
    id v74 = v17;
    do
    {
      uint64_t v22 = 0;
      uint64_t v76 = v19;
      do
      {
        if (*(void *)v87 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v78 = v22;
        v23 = *(void **)(*((void *)&v86 + 1) + 8 * v22);
        if (objc_msgSend(v23, "tv_elementType") == 4)
        {
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          v24 = [v23 children];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v82 objects:v92 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v83;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v83 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v82 + 1) + 8 * i);
                if (objc_msgSend(v29, "tv_elementType") == 16 && !objc_msgSend(v29, "tv_imageType"))
                {
                  v30 = v12;
                  v31 = [(_TVOrganizerView *)v12 backgroundImageView];
                  v32 = +[TVInterfaceFactory sharedInterfaceFactory];
                  v33 = [v32 _viewFromElement:v29 existingView:v31];

                  id v34 = [v29 attributes];
                  v35 = [v34 objectForKeyedSubscript:@"contentsMode"];

                  if ([v35 length])
                  {
                    uint64_t v36 = objc_msgSend(v29, "tv_scaleMode");
                    uint64_t v37 = 4;
                    if (v36 != 4) {
                      uint64_t v37 = 5;
                    }
                    if (v36 == 3) {
                      uint64_t v37 = 2;
                    }
                    if ((unint64_t)(v36 - 1) >= 2) {
                      int64_t v38 = v37;
                    }
                    else {
                      int64_t v38 = 1;
                    }
                  }
                  else
                  {
                    v39 = [v29 style];
                    uint64_t v40 = objc_msgSend(v39, "tv_position");

                    int64_t v38 = +[TVMLUtilities contentModeForPosition:defaultMode:](TVMLUtilities, "contentModeForPosition:defaultMode:", +[TVMLUtilities semanticPositionForPosition:v40 semanticContentAttribute:v79], 5);
                  }
                  [v33 setContentMode:v38];

                  v20 = v33;
                  v12 = v30;
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v82 objects:v92 count:16];
            }
            while (v26);
            uint64_t v21 = v73;
            v17 = v74;
            uint64_t v19 = v76;
          }
        }
        else
        {
          uint64_t v41 = objc_msgSend(v23, "tv_elementType");
          id v42 = [v23 elementName];
          v24 = ((void (**)(void, uint64_t, void *))v17)[2](v17, v41, v42);

          v43 = +[TVInterfaceFactory sharedInterfaceFactory];
          id v44 = [v43 _viewFromElement:v23 existingView:v24];

          if (v44)
          {
            if ([v23 isDisabled]
              && objc_msgSend(v72, "tv_elementType") == 23
              && objc_msgSend(v23, "tv_elementType") == 55
              && (objc_msgSend(v23, "tv_textStyle") == 1 || objc_msgSend(v23, "tv_textStyle") == 2))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v45 = v44;
                id v46 = [v45 textColor];
                v47 = [v46 colorWithAlphaComponent:0.4];

                [v45 setTextColor:v47];
              }
            }
            [v44 setSemanticContentAttribute:v79];
            [v75 addObject:v44];
          }
        }
        uint64_t v22 = v78 + 1;
      }
      while (v78 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v86 objects:v93 count:16];
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  [(_TVOrganizerView *)v12 setBackgroundImageView:v20];
  [(_TVOrganizerView *)v12 setComponents:v75];
  long long v80 = TVCornerRadiiZero;
  long long v81 = *(_OWORD *)&qword_230C384E8;
  if (+[TVMLUtilities _cornerRadiiFromElement:v72 cornerRadii:&v80 circle:0])
  {
    +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v80, v81);
    -[_TVOrganizerView _setContinuousCornerRadius:](v12, "_setContinuousCornerRadius:");
    [(_TVOrganizerView *)v12 setClipsToBounds:1];
  }
  id v48 = [v72 style];
  v49 = objc_msgSend(v48, "tv_imageTreatment");
  int v50 = [v49 isEqualToString:@"blur"];

  if (v50)
  {
    v51 = [v72 appDocument];
    id v52 = [v51 templateElement];
    int64_t v53 = +[TVMLUtilities interfaceStyleForTemplateElement:v52];

    if (v53 == 1) {
      uint64_t v54 = 4005;
    }
    else {
      uint64_t v54 = 4000;
    }
    v55 = [MEMORY[0x263F1C480] effectWithStyle:v54];
    id v56 = (void *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v55];
    [(_TVOrganizerView *)v12 setBackgroundImageView:v56];
  }
  v57 = [v72 style];
  id v58 = objc_msgSend(v57, "tv_columnColor");

  if (v58)
  {
    [(_TVOrganizerView *)v12 setColumnDividersEnabled:1];
    v59 = [v72 style];
    id v60 = objc_msgSend(v59, "tv_columnColor");
    v61 = [v60 color];
    [(_TVOrganizerView *)v12 setColumnDividerColor:v61];

    id v62 = [v72 style];
    objc_msgSend(v62, "tv_columnPadding");
    -[_TVOrganizerView setColumnDividerPadding:](v12, "setColumnDividerPadding:");
  }
  else
  {
    [(_TVOrganizerView *)v12 setColumnDividersEnabled:0];
  }
  v63 = [v72 attributes];
  id v64 = [v63 objectForKey:@"remembersFocus"];

  if (v64)
  {
    v65 = [v72 attributes];
    id v66 = [v65 objectForKey:@"remembersFocus"];
    -[_TVOrganizerView setRemembersLastFocusedItem:](v12, "setRemembersLastFocusedItem:", [v66 BOOLValue]);
  }
  if (v72) {
    [(UIView *)v12 transferLayoutStylesFromElement:v72];
  }
  v67 = v12;

  return v67;
}

id __67__TVMLViewFactory__organizerViewWithElement_elements_existingView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  id v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__TVMLViewFactory__organizerViewWithElement_elements_existingView___block_invoke_2;
  v10[3] = &unk_264BA8950;
  uint64_t v13 = a2;
  id v7 = v5;
  id v11 = v7;
  v12 = &v14;
  [v6 enumerateObjectsUsingBlock:v10];
  if (v15[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
    [*(id *)(a1 + 32) removeObjectAtIndex:v15[3]];
  }

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __67__TVMLViewFactory__organizerViewWithElement_elements_existingView___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v7 = objc_msgSend(v10, "tv_elementType");
  if (v7 == a1[6])
  {
    if (v7 != 55
      || (objc_msgSend(v10, "tv_elementName"),
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:a1[4]],
          v8,
          v9))
    {
      *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
      *a4 = 1;
    }
  }
}

+ (id)imageStackViewWithElement:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7 = a3;
  id v8 = (TVImageLayout *)a4;
  id v9 = a5;
  if (objc_msgSend(v7, "tv_elementType") != 16)
  {
    id v13 = 0;
    goto LABEL_16;
  }
  id v10 = v7;
  uint64_t v11 = objc_msgSend(v10, "tv_imageType");
  if (v11 != 3 && v11)
  {
    id v13 = 0;
  }
  else
  {
    objc_msgSend(v9, "tv_associatedIKViewElement");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 != v10)
    {

LABEL_10:
      if (!v8)
      {
        id v8 = objc_alloc_init(TVImageLayout);
        [(TVViewLayout *)v8 setAcceptsFocus:1];
      }
      v15 = v8;
      id v8 = +[TVImageLayout layoutWithLayout:v8 element:v10];

      uint64_t v16 = objc_msgSend(v10, "tv_imageProxyWithLayout:", v8);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = [v10 appDocument];
        uint64_t v18 = [v17 requestLoader];
        [v16 setRequestLoader:v18];
      }
      uint64_t v19 = objc_alloc_init(TVImageDescription);
      [(TVImageDescription *)v19 setImageProxy:v16];
      v20 = [v10 objectForKeyedSubscript:@"TVConfigureForMetrics"];
      -[TVImageDescription setConfigureForMetrics:](v19, "setConfigureForMetrics:", [v20 BOOLValue]);

      [(TVImageDescription *)v19 configureForMetrics];
      uint64_t v21 = +[TVMLUtilities _placeholderImageForViewElement:v10 imageLayout:v8];
      [(TVImageDescription *)v19 setPlaceholderImage:v21];

      id v13 = +[TVViewFactory imageStackViewWithDescription:v19 layout:v8 existingView:v9];

      goto LABEL_15;
    }
    uint64_t v14 = [v10 updateType];

    if (v14 != 2) {
      goto LABEL_10;
    }
    id v13 = v9;
  }
LABEL_15:

LABEL_16:
  return v13;
}

+ (id)imageStackViewWithElement:(id)a3 existingView:(id)a4
{
  return (id)[a1 imageStackViewWithElement:a3 layout:0 existingView:a4];
}

+ (id)imageViewWithElement:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  id v10 = +[TVImageLayout layoutWithLayout:a4 element:v9];
  uint64_t v11 = objc_msgSend(v9, "tv_urlWithLayout:", v10);
  if (objc_msgSend(v11, "tv_imageURLType") == 1)
  {
    id v12 = +[TVMLViewFactory imageStackViewWithElement:v9 layout:v10 existingView:v8];
    goto LABEL_43;
  }
  [v10 decoratorSize];
  if (v14 < 0.00000011920929 || v13 < 0.00000011920929)
  {
    uint64_t v16 = [v9 url];
    if (objc_msgSend(v16, "tv_isResourceURL"))
    {
    }
    else
    {
      uint64_t v17 = [v9 url];
      char v18 = objc_msgSend(v17, "tv_isSymbolURL");

      if ((v18 & 1) == 0)
      {
        uint64_t v27 = (void *)TVMLKitLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR)) {
          +[TVMLViewFactory imageViewWithElement:layout:existingView:](v27, v9);
        }
        id v12 = 0;
        goto LABEL_43;
      }
    }
  }
  uint64_t v19 = [v9 appDocument];
  uint64_t v20 = [v19 templateElement];

  uint64_t v21 = objc_alloc_init(TVImageDescription);
  uint64_t v22 = objc_msgSend(v9, "tv_imageProxyWithLayout:", v10);
  [(TVImageDescription *)v21 setImageProxy:v22];
  v23 = [v9 style];
  v24 = [v23 valueForStyle:@"tv-placeholder"];

  id v60 = v24;
  v61 = (void *)v20;
  if (objc_msgSend(v9, "tv_isResource") & 1) != 0 || (objc_msgSend(v9, "tv_isSymbol")) {
    goto LABEL_13;
  }
  if (![v24 length])
  {
    uint64_t v26 = [v10 placeholderArtworkName];
    if (v26)
    {
    }
    else
    {
      v28 = [v9 parent];
      uint64_t v29 = objc_msgSend(v28, "tv_elementType");

      if (v29 != 24)
      {
LABEL_13:
        uint64_t v25 = 0;
        goto LABEL_22;
      }
    }
  }
  [v10 borderRadii];
  uint64_t v25 = +[TVMLUtilities _placeholderImageForViewElement:withImageLayout:cornerRadii:andScaledSize:](TVMLUtilities, "_placeholderImageForViewElement:withImageLayout:cornerRadii:andScaledSize:", v9, v10);
LABEL_22:
  v59 = (void *)v25;
  [(TVImageDescription *)v21 setPlaceholderImage:v25];
  -[TVImageDescription setSemanticContentAttribute:](v21, "setSemanticContentAttribute:", objc_msgSend(v9, "tv_semanticContentAttribute"));
  v30 = [v9 objectForKeyedSubscript:@"TVConfigureForMetrics"];
  -[TVImageDescription setConfigureForMetrics:](v21, "setConfigureForMetrics:", [v30 BOOLValue]);

  v31 = [v9 attributes];
  v32 = [v31 objectForKeyedSubscript:@"accessibilityText"];
  [(TVImageDescription *)v21 setAccessibilityText:v32];

  v33 = [v9 attributes];
  id v34 = [v33 objectForKeyedSubscript:@"data-siri"];
  [(TVImageDescription *)v21 setSiriData:v34];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35 = [v9 appDocument];
    uint64_t v36 = [v35 requestLoader];
    [v22 setRequestLoader:v36];

    uint64_t v37 = [v9 parent];
    if (objc_msgSend(v37, "tv_elementType") == 4)
    {
      int64_t v38 = [v9 parent];
      v39 = [v38 parent];
      uint64_t v40 = objc_msgSend(v39, "tv_elementType");

      if (v40 == 12)
      {
        [(TVImageDescription *)v21 setIsInBackgroundOrBanner:1];
        goto LABEL_29;
      }
    }
    else
    {
    }
    uint64_t v41 = [v9 style];
    id v42 = objc_msgSend(v41, "tv_tintColor");
    uint64_t v43 = [v42 gradientType];

    if (v43) {
      [(TVImageDescription *)v21 setHasGradient:1];
    }
  }
LABEL_29:
  id v12 = +[TVViewFactory imageViewWithDescription:v21 layout:v10 existingView:v8];
  id v44 = [v12 imageProxy];
  int v45 = [v44 isEqual:v22];

  if (v12)
  {
    id v58 = v11;
    id v46 = v8;
    v47 = [v9 attributes];
    id v48 = [v47 objectForKeyedSubscript:@"handlesInteraction"];
    uint64_t v49 = [v48 BOOLValue];

    [v12 setUserInteractionEnabled:v49];
    +[_TVControlTarget addTargetInControl:v12 withViewElement:v9];
    uint64_t v50 = [v9 parent];
    if (v50)
    {
      v51 = (void *)v50;
      while (objc_msgSend(v51, "tv_elementType") != 35)
      {
        uint64_t v52 = [v51 parent];

        v51 = (void *)v52;
        if (!v52) {
          goto LABEL_34;
        }
      }
      [v12 _loadImage];

      id v8 = v46;
    }
    else
    {
LABEL_34:
      id v8 = v46;
      if (v46) {
        int v53 = v45;
      }
      else {
        int v53 = 0;
      }
      if (v53 == 1)
      {
        uint64_t v54 = [v9 url];
        int v55 = objc_msgSend(v54, "tv_isResourceURL");

        id v8 = v46;
        if (v55) {
          [v12 _reloadImageForLayoutDirectionChange];
        }
      }
    }
    id v56 = v12;

    uint64_t v11 = v58;
  }

LABEL_43:
  return v12;
}

+ (id)imageViewWithElement:(id)a3 existingView:(id)a4
{
  return (id)[a1 imageViewWithElement:a3 layout:0 existingView:a4];
}

- (id)_textViewWithElement:(id)a3 existingView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 attributes];
  id v9 = [v8 objectForKeyedSubscript:@"handlesOverflow"];
  v30 = self;
  if ([v9 BOOLValue])
  {
    int v10 = 1;
  }
  else
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:@"allowsZooming"];
    int v10 = [v11 BOOLValue];
  }
  id v12 = [v8 objectForKeyedSubscript:@"handlesOverflow"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v13 = [v8 objectForKeyedSubscript:@"handlesOverflow"];
    double v14 = [v13 lowercaseString];
  }
  else
  {
    double v14 = 0;
  }

  uint64_t v15 = [v14 isEqualToString:@"always"];
  uint64_t v16 = [v6 parent];
  if (objc_msgSend(v16, "tv_elementType") == 15)
  {
    uint64_t v17 = [v6 parent];
    char v18 = [v17 parent];
    uint64_t v19 = objc_msgSend(v18, "tv_elementType");

    if (v19 != 18)
    {
      int v21 = 0;
      goto LABEL_13;
    }
    uint64_t v16 = [v6 text];
    uint64_t v20 = [v16 string];
    int v21 = [v20 containsString:@"\r"];
  }
  else
  {
    int v21 = 0;
  }

LABEL_13:
  int v22 = v15 | v10;
  if (objc_msgSend(v6, "tv_textStyle") == 3
    && ([v6 appDocument],
        v23 = objc_claimAutoreleasedReturnValue(),
        [v23 templateElement],
        v24 = objc_claimAutoreleasedReturnValue(),
        uint64_t v25 = objc_msgSend(v24, "tv_elementType"),
        v24,
        v23,
        v25 == 62))
  {
    uint64_t v26 = v30;
    if (!v22)
    {
      uint64_t v27 = [(TVMLViewFactory *)v30 _textBoxViewForElement:v6 existingView:v7];
      goto LABEL_24;
    }
  }
  else
  {
    if (!v22)
    {
      if (v21) {
        [(TVMLViewFactory *)v30 _headerColumnViewForElement:v6 existingView:v7];
      }
      else {
      uint64_t v27 = [(TVMLViewFactory *)v30 _labelViewForElement:v6 existingView:v7];
      }
      goto LABEL_24;
    }
    uint64_t v26 = v30;
  }
  uint64_t v27 = [(TVMLViewFactory *)v26 _zoomableTextViewFromElement:v6 alwaysFocusable:v15 existingView:v7];
LABEL_24:
  v28 = (void *)v27;

  return v28;
}

- (id)_listItemLockupWithElement:(id)a3 existingView:(id)a4
{
  id v6 = a3;
  id v7 = [(TVMLViewFactory *)self _organizerViewForElement:v6 existingView:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    objc_msgSend(v8, "setDisabled:", objc_msgSend(v6, "isDisabled"));
    [v8 setClipsToBounds:0];
    id v9 = [v6 style];
    int v10 = objc_msgSend(v9, "tv_backgroundColor");
    uint64_t v11 = [v10 color];
    [v8 setBackgroundColor:v11 forState:0];

    id v12 = [v6 style];
    double v13 = objc_msgSend(v12, "tv_highlightColor");
    double v14 = [v13 color];
    [v8 setBackgroundColor:v14 forState:8];

    uint64_t v15 = [v6 style];
    uint64_t v16 = objc_msgSend(v15, "tv_highlightColor");
    uint64_t v17 = [v16 color];
    [v8 setBackgroundColor:v17 forState:1];

    char v18 = [v8 floatingView];
    [v18 setFocusedSizeIncrease:30.0];

    uint64_t v19 = [v6 style];
    uint64_t v20 = objc_msgSend(v19, "tv_visualEffect");
    objc_msgSend(v8, "setVisualEffectViewBackgroundEnabled:", objc_msgSend(v20, "isEqualToString:", @"background-blur"));

    memset(&v35, 0, sizeof(v35));
    int v21 = [v6 style];
    int v22 = v21;
    if (v21) {
      objc_msgSend(v21, "tv_focusTransform");
    }
    else {
      memset(&v35, 0, sizeof(v35));
    }

    CGAffineTransform v34 = v35;
    if (!CGAffineTransformIsIdentity(&v34))
    {
      long long v32 = *MEMORY[0x263F00148];
      long long v33 = v32;
      CGAffineTransform v34 = v35;
      +[TVMLUtilities getValuesFromTransform:&v34 translation:&v33 rotation:&v32];
      v23 = [v8 floatingView];
      [v23 setContentMotionRotation:v32 translation:v33];
    }
    memset(&v34, 0, 32);
    if (+[TVMLUtilities _cornerRadiiFromElement:v6 cornerRadii:&v34 circle:0])
    {
      +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v34.a, v34.b, v34.c, v34.d);
      double v25 = v24;
      uint64_t v26 = [v8 floatingView];
      [v26 setCornerRadius:v25];
    }
    uint64_t v27 = [v6 style];
    v28 = objc_msgSend(v27, "tv_backgroundColor");
    uint64_t v29 = [v28 color];

    if (v29)
    {
      v30 = [v8 floatingView];
      [v30 setRoundContentWhenDeselected:1];
    }
  }

  return v7;
}

- (id)_cardViewFromElement:(id)a3 existingView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [v8 contentView];
    int v10 = [v9 subviews];
    uint64_t v11 = [v10 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    double v13 = [v8 contentView];
    double v14 = [v13 subviews];
    [v14 makeObjectsPerformSelector:sel_removeFromSuperview];

    uint64_t v15 = [(id)objc_opt_class() _organizerViewWithElement:v6 elements:0 existingView:v12];

    [v8 bounds];
    double v17 = v16;
    double v19 = v18;
    uint64_t v20 = [v6 style];
    objc_msgSend(v20, "tv_padding");
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    double v29 = v17 - v24 - v28;
    double v30 = v19 - v22 - v26;
    objc_msgSend(v15, "setFrame:", v24, v22, v29, v30);
    long long v56 = TVCornerRadiiZero;
    long long v57 = *(_OWORD *)&qword_230C384E8;
    +[TVMLUtilities _cornerRadiiFromElement:v6 cornerRadii:&v56 circle:0];
    +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v56, v57);
    double v32 = v31;
    long long v33 = [v6 style];
    CGAffineTransform v34 = objc_msgSend(v33, "tv_backgroundColor");
    CGAffineTransform v35 = [v34 color];

    uint64_t v36 = [v8 contentView];
    uint64_t v37 = v36;
    if (v35)
    {
      [v36 setBackgroundColor:v35];
    }
    else
    {
      int64_t v38 = [MEMORY[0x263F1C550] clearColor];
      [v37 setBackgroundColor:v38];
    }
    v39 = [v8 contentView];
    uint64_t v40 = [v39 layer];
    [v40 setCornerRadius:v32];

    uint64_t v41 = [v8 contentView];
    [v41 addSubview:v15];

    objc_msgSend(v8, "setAllowsFocus:", objc_msgSend(v6, "isDisabled") ^ 1);
    id v42 = [v6 style];
    uint64_t v43 = objc_msgSend(v42, "tv_shadow");

    id v44 = [v8 contentView];
    int v45 = [v44 layer];
    id v46 = v45;
    if (v43)
    {
      objc_msgSend(v45, "setShadowPath:", +[TVMLUtilities _shadowPathForViewElement:withCornerRadii:andScaledSize:](TVMLUtilities, "_shadowPathForViewElement:withCornerRadii:andScaledSize:", v6, v56, v57, v29, v30));

      v47 = [v8 contentView];
      id v48 = [v47 layer];
      [v43 shadowOffset];
      objc_msgSend(v48, "setShadowOffset:");

      uint64_t v49 = [v8 contentView];
      uint64_t v50 = [v49 layer];
      [v43 shadowBlurRadius];
      objc_msgSend(v50, "setShadowRadius:");

      v51 = [v8 contentView];
      uint64_t v52 = [v51 layer];
      id v53 = [v43 shadowColor];
      objc_msgSend(v52, "setShadowColor:", objc_msgSend(v53, "CGColor"));

      id v44 = [v8 contentView];
      int v45 = [v44 layer];
      id v46 = v45;
      LODWORD(v54) = 1.0;
    }
    else
    {
      double v54 = 0.0;
    }
    [v45 setShadowOpacity:v54];
  }
  else
  {
    id v8 = [(TVMLViewFactory *)self _organizerViewForElement:v6 existingView:v7];
  }

  return v8;
}

- (id)_textBoxViewForElement:(id)a3 existingView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F1CAC8]);
    id v7 = (id)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  id v9 = v7;
  int v10 = [v5 style];
  uint64_t v11 = [v10 ikColor];
  id v12 = [v11 color];
  double v13 = [v9 _accessibilityHigherContrastTintColorForColor:v12];

  double v14 = objc_msgSend(v5, "tv_attributedStringWithForegroundColor:textAlignment:", v13, objc_msgSend(v10, "tv_textAlignment"));
  uint64_t v15 = (void *)[v14 mutableCopy];
  double v16 = [v5 attributes];
  double v17 = [v16 objectForKeyedSubscript:@"showsScrollIndicator"];
  unsigned int v38 = [v17 BOOLValue];

  if ([v15 length])
  {
    uint64_t v36 = v13;
    id v37 = v6;
    CGAffineTransform v35 = v14;
    uint64_t v18 = [v14 length];
    double v19 = [v15 attributesAtIndex:0 effectiveRange:0];
    uint64_t v20 = *MEMORY[0x263F1C268];
    double v21 = [v19 objectForKeyedSubscript:*MEMORY[0x263F1C268]];
    double v22 = (void *)[v21 mutableCopy];
    double v23 = v22;
    if (v22) {
      id v24 = v22;
    }
    else {
      id v24 = objc_alloc_init(MEMORY[0x263F1C350]);
    }
    double v25 = v24;

    [v25 setLineBreakMode:0];
    double v26 = [v5 style];
    objc_msgSend(v26, "tv_textHyphenationFactor");
    *(float *)&double v27 = v27;
    [v25 setHyphenationFactor:v27];

    objc_msgSend(v15, "removeAttribute:range:", v20, 0, v18);
    double v28 = (void *)[v25 copy];
    objc_msgSend(v15, "addAttribute:value:range:", v20, v28, 0, v18);

    objc_msgSend(v15, "tv_addLanguageAwareness:", 0);
    double v13 = v36;
    id v6 = v37;
    double v14 = v35;
  }
  double v29 = (void *)[v15 copy];
  [v9 setAttributedText:v29];

  double v30 = [v5 style];
  int64_t v31 = +[TVMLUtilities semanticAlignmentForAlignment:semanticContentAttribute:](TVMLUtilities, "semanticAlignmentForAlignment:semanticContentAttribute:", objc_msgSend(v30, "tv_alignment"), objc_msgSend(v5, "tv_semanticContentAttribute"));

  if (!v31) {
    [v9 setTextAlignment:4];
  }
  objc_msgSend(v10, "tv_padding");
  objc_msgSend(v9, "setTextContainerInset:");
  [v9 setBounces:1];
  [v9 setShowsVerticalScrollIndicator:v38];
  double v32 = objc_msgSend(v10, "tv_backgroundColor");
  long long v33 = [v32 color];
  [v9 setBackgroundColor:v33];

  [v9 setEditable:0];
  objc_msgSend(v9, "_setGradientMaskInsets:", 90.0, 0.0, 90.0, 0.0);
  [v9 setAutoresizingMask:18];
  [v9 setAdjustsFontForContentSizeCategory:1];

  return v9;
}

- (id)_labelViewForElement:(id)a3 existingView:(id)a4
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v110 = [v5 style];
  objc_opt_class();
  v107 = v6;
  if (objc_opt_isKindOfClass())
  {
    id v7 = (_TVLabel *)v6;
  }
  else
  {
    id v8 = [_TVLabel alloc];
    id v7 = -[_TVLabel initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  id v9 = v7;
  int v10 = [v5 style];
  uint64_t v11 = objc_msgSend(v10, "tv_color");
  v108 = [v11 color];

  id v12 = [v5 style];
  double v13 = objc_msgSend(v12, "tv_highlightColor");
  v111 = [v13 color];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v14 = v5;
  }
  else {
    double v14 = 0;
  }
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v109 = v14;
  uint64_t v15 = [v109 badges];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v112 objects:v116 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v113;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v113 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        double v21 = [v20 badge];
        double v22 = [v21 style];
        double v23 = objc_msgSend(v22, "tv_tintColor");
        [v20 setTintColor:v23];

        id v24 = [v21 style];
        double v25 = objc_msgSend(v24, "tv_highlightColor");
        objc_msgSend(v20, "tv_setHighlightColor:", v25);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v112 objects:v116 count:16];
    }
    while (v17);
  }

  double v26 = [v5 style];
  double v27 = objc_msgSend(v26, "tv_textHighlightStyle");
  if ([v27 isEqualToString:@"show-on-highlight"])
  {

    double v28 = v109;
  }
  else
  {
    double v29 = [v5 style];
    double v30 = objc_msgSend(v29, "tv_textHighlightStyle");
    int v31 = [v30 isEqualToString:@"marquee-and-show-on-highlight"];

    double v28 = v109;
    if (!v31)
    {
      [(_TVLabel *)v9 setHighlightedTextColor:v111];
      double v32 = [v109 cachedAttributedString];
      if (!v32)
      {
        objc_msgSend(v5, "tv_attributedString");
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
LABEL_23:
      id v36 = v32;
      double v32 = v36;
LABEL_24:
      CGAffineTransform v35 = v36;
      goto LABEL_25;
    }
  }
  [(_TVLabel *)v9 setHighlightedTextColor:0];
  double v32 = [v28 cachedAttributedString];
  if (v32) {
    goto LABEL_23;
  }
  if (v111) {
    long long v33 = v111;
  }
  else {
    long long v33 = v108;
  }
  CGAffineTransform v34 = [v5 style];
  CGAffineTransform v35 = objc_msgSend(v5, "tv_attributedStringWithForegroundColor:textAlignment:", v33, objc_msgSend(v34, "tv_textAlignment"));

LABEL_25:
  id v37 = v110;

  [v28 setCachedAttributedString:v35];
  unsigned int v38 = [v5 style];
  v39 = objc_msgSend(v38, "tv_textTransform");
  uint64_t v40 = [v39 length];

  if (!v40) {
    goto LABEL_36;
  }
  uint64_t v41 = [v5 style];
  id v42 = objc_msgSend(v41, "tv_textTransform");
  int v43 = [v42 isEqualToString:@"uppercase"];

  if (v43)
  {
    id v44 = [v35 string];
    uint64_t v45 = [v44 localizedUppercaseString];
  }
  else
  {
    id v46 = [v5 style];
    v47 = objc_msgSend(v46, "tv_textTransform");
    int v48 = [v47 isEqualToString:@"lowercase"];

    if (v48)
    {
      id v44 = [v35 string];
      uint64_t v45 = [v44 localizedLowercaseString];
    }
    else
    {
      uint64_t v49 = [v5 style];
      uint64_t v50 = objc_msgSend(v49, "tv_textTransform");
      int v51 = [v50 isEqualToString:@"capitalize"];

      if (!v51)
      {
        uint64_t v52 = 0;
        goto LABEL_33;
      }
      id v44 = [v35 string];
      uint64_t v45 = [v44 localizedCapitalizedString];
    }
  }
  uint64_t v52 = (void *)v45;

LABEL_33:
  if ([v52 length])
  {
    id v53 = (void *)[v35 mutableCopy];
    objc_msgSend(v53, "replaceCharactersInRange:withString:", 0, objc_msgSend(v35, "length"), v52);
    uint64_t v54 = [v53 copy];

    CGAffineTransform v35 = (void *)v54;
  }

LABEL_36:
  int v55 = objc_msgSend(v35, "tv_defaultAttributes");
  long long v56 = v55;
  if (v55)
  {
    long long v57 = (void *)[v55 mutableCopy];
    uint64_t v58 = *MEMORY[0x263F1C240];
    v59 = [v56 objectForKeyedSubscript:*MEMORY[0x263F1C240]];

    if (!v59)
    {
      id v60 = [MEMORY[0x263F1C550] blackColor];
      [v57 setObject:v60 forKeyedSubscript:v58];
    }
    uint64_t v61 = *MEMORY[0x263F1C280];
    id v62 = [v56 objectForKeyedSubscript:*MEMORY[0x263F1C280]];

    if (!v62)
    {
      id v63 = objc_alloc_init(MEMORY[0x263F1C360]);
      [v57 setObject:v63 forKeyedSubscript:v61];
    }
    id v64 = (void *)[v57 copy];
    [(_TVLabel *)v9 _setDefaultAttributes:v64];
  }
  [(_TVLabel *)v9 setAttributedText:v35];
  v65 = [v5 style];
  -[_TVLabel setNumberOfLines:](v9, "setNumberOfLines:", objc_msgSend(v65, "tv_maxTextLines"));

  id v66 = [v5 style];
  -[_TVLabel setAdjustsFontSizeToFitWidth:](v9, "setAdjustsFontSizeToFitWidth:", objc_msgSend(v66, "tv_adjustsFontSizeToFitWidth"));

  v67 = [v5 style];
  objc_msgSend(v67, "tv_minimumScaleFactor");
  -[_TVLabel setMinimumScaleFactor:](v9, "setMinimumScaleFactor:");

  id v68 = [v5 style];
  objc_msgSend(v68, "tv_fontSize");
  [(_TVLabel *)v9 setAdjustsFontForContentSizeCategory:v69 == 0.0];

  id v70 = [v5 style];
  objc_msgSend(v70, "tv_padding");
  -[_TVLabel setPadding:](v9, "setPadding:");

  v71 = objc_msgSend(v110, "tv_backgroundColor");
  id v72 = [v71 color];

  if (v72)
  {
    uint64_t v73 = objc_msgSend(v110, "tv_backgroundColor");
    id v74 = [v73 color];
    [(_TVLabel *)v9 setBackgroundColor:v74];
  }
  else
  {
    [(_TVLabel *)v9 setBackgroundColor:0];
    [(_TVLabel *)v9 setOpaque:0];
  }
  v75 = [v5 style];
  uint64_t v76 = [v75 valueForStyle:@"text-shadow"];

  if (v76)
  {
    [v76 shadowBlurRadius];
    -[_TVLabel setShadowBlur:](v9, "setShadowBlur:");
    v77 = [v76 shadowColor];

    if (v77)
    {
      uint64_t v78 = [v76 shadowColor];
      [(_TVLabel *)v9 setShadowColor:v78];
    }
    [v76 shadowOffset];
    -[_TVLabel setShadowOffset:](v9, "setShadowOffset:");
  }
  if (objc_msgSend(v5, "tv_elementType") == 33)
  {
    uint64_t v79 = [v5 attributes];
    long long v80 = [v79 objectForKeyedSubscript:@"minLength"];
    uint64_t v81 = [v80 integerValue];

    v106 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%d", 0);
    long long v82 = objc_msgSend(&stru_26E5657A8, "stringByPaddingToLength:withString:startingAtIndex:", v81);
    long long v83 = [(_TVLabel *)v9 attributedText];
    long long v84 = (void *)[v83 mutableCopy];

    long long v85 = [v84 mutableString];
    long long v86 = [v84 mutableString];
    objc_msgSend(v85, "replaceCharactersInRange:withString:", 0, objc_msgSend(v86, "length"), v82);

    double v87 = *MEMORY[0x263F001B0];
    double v88 = *(double *)(MEMORY[0x263F001B0] + 8);
    objc_msgSend(v84, "boundingRectWithSize:options:context:", 3, 0, *MEMORY[0x263F001B0], v88);
    float v90 = v89;
    double v91 = ceilf(v90);
    v92 = [(_TVLabel *)v9 attributedText];
    uint64_t v93 = [v92 length];

    if (v93 == v81)
    {
      uint64_t v94 = [(_TVLabel *)v9 attributedText];
      objc_msgSend(v94, "boundingRectWithSize:options:context:", 3, 0, v87, v88);
      double v96 = v95;

      float v97 = v96;
      double v91 = fmax(v91, ceilf(v97));
    }
    v98 = v9;
    [(UIView *)v98 transferLayoutStylesFromElement:v5];
    v99 = [NSNumber numberWithDouble:v91];
    [(UIView *)v98 setValue:v99 forTVViewStyle:@"width"];

    v100 = NSNumber;
    [(_TVLabel *)v98 size];
    v102 = [v100 numberWithDouble:v101];
    [(UIView *)v98 setValue:v102 forTVViewStyle:@"height"];

    double v28 = v109;
    id v37 = v110;
  }
  [(UIView *)v9 transferLayoutStylesFromElement:v5];
  v103 = [v5 style];
  v104 = objc_msgSend(v103, "tv_textHighlightStyle");
  [(UIView *)v9 setValue:v104 forTVViewStyle:@"tv-text-highlight-style"];

  return v9;
}

- (id)_headerColumnViewForElement:(id)a3 existingView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = [v8 text];
  int v10 = [v9 string];
  uint64_t v11 = [v10 componentsSeparatedByString:@"\r"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = (_TVHeaderColumnView *)v7;
  }
  else {
    id v12 = objc_alloc_init(_TVHeaderColumnView);
  }
  double v13 = v12;
  double v14 = [(_TVHeaderColumnView *)v12 labelViews];
  uint64_t v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __60__TVMLViewFactory__headerColumnViewForElement_existingView___block_invoke;
  v23[3] = &unk_264BA89A0;
  id v24 = v14;
  double v25 = self;
  id v26 = v8;
  id v27 = v15;
  uint64_t v16 = v13;
  double v28 = v16;
  id v17 = v14;
  id v18 = v8;
  id v19 = v15;
  [v11 enumerateObjectsUsingBlock:v23];
  [(_TVHeaderColumnView *)v16 setLabelViews:v19];
  uint64_t v20 = v28;
  double v21 = v16;

  return v21;
}

void __60__TVMLViewFactory__headerColumnViewForElement_existingView___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v21 = a2;
  if (![(__CFString *)v21 length])
  {

    double v21 = @" ";
  }
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  }
  id v6 = [*(id *)(a1 + 40) _labelViewForElement:*(void *)(a1 + 48) existingView:v5];
  [*(id *)(a1 + 56) addObject:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  id v9 = v8;
  if (v8)
  {
    int v10 = [v8 attributedText];
    uint64_t v11 = (void *)[v10 mutableCopy];

    objc_msgSend(v11, "replaceCharactersInRange:withString:", 0, objc_msgSend(v11, "length"), v21);
    id v12 = (void *)[v11 copy];
    [v9 setAttributedText:v12];

    [v9 setNumberOfLines:1];
    if (!a3)
    {
      double v13 = [v9 _defaultAttributes];
      double v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F1C238]];

      uint64_t v15 = *(void **)(a1 + 64);
      [v14 leading];
      double v17 = v16;
      [v14 lineHeight];
      double v19 = ceil(v18);
      [v14 lineHeight];
      [v15 setLineSpacing:v17 - (v19 - v20)];
    }
  }
}

- (id)_zoomableTextViewFromElement:(id)a3 alwaysFocusable:(BOOL)a4 existingView:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = (_TVZoomableTextView *)v7;
  }
  else
  {
    int v10 = [_TVZoomableTextView alloc];
    id v9 = -[_TVZoomableTextView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  uint64_t v11 = v9;
  [(TVFocusableTextView *)v9 setAlwaysFocusable:v5];
  [(_TVZoomableTextView *)v11 updateWithViewElement:v8];

  return v11;
}

- (id)_organizerViewForElement:(id)a3 existingView:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = v6;
    objc_opt_class();
    objc_opt_isKindOfClass();
    id v8 = [v7 contentView];
    unsigned int v21 = [v7 isFocused];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v22 = v8;
    id v9 = [v8 subviews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = 0;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
            [v15 removeFromSuperview];
          }
          else {
            id v12 = v15;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);

      double v16 = v22;
      if (v12) {
        goto LABEL_18;
      }
    }
    else
    {

      double v16 = v8;
    }
    double v17 = [_TVOrganizerView alloc];
    [v16 bounds];
    id v12 = -[_TVOrganizerView initWithFrame:](v17, "initWithFrame:");
    [(_TVOrganizerView *)v12 setAutoresizingMask:18];
    [v16 addSubview:v12];
LABEL_18:
    double v18 = [(id)objc_opt_class() _organizerViewWithElement:v5 elements:0 existingView:v12];
    [v18 transferLayoutStylesFromElement:v5];
    objc_msgSend(v18, "tv_setAssociatedIKViewElement:", v5);
    [v18 setSelected:v21 animated:0];
    id v19 = v7;

    goto LABEL_20;
  }
  id v19 = [(id)objc_opt_class() _organizerViewWithElement:v5 elements:0 existingView:v6];
  [v19 transferLayoutStylesFromElement:v5];
LABEL_20:

  return v19;
}

- (id)_activityIndicatorViewForElement:(id)a3 existingView:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = (_TVActivityView *)v6;
  }
  else {
    id v7 = objc_alloc_init(_TVActivityView);
  }
  id v8 = v7;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = objc_msgSend(v5, "children", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v14, "tv_elementType") == 55)
        {
          uint64_t v15 = +[TVInterfaceFactory sharedInterfaceFactory];
          double v16 = [v15 _viewFromElement:v14 existingView:0];

          if (v16)
          {
            [(_TVActivityView *)v8 setTextView:v16];

            goto LABEL_15;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  double v17 = [_TVSpinnerView alloc];
  double v18 = [v5 style];
  objc_msgSend(v18, "tv_width");
  double v20 = v19;
  unsigned int v21 = [v5 style];
  objc_msgSend(v21, "tv_height");
  double v23 = v22;
  long long v24 = [v5 style];
  long long v25 = objc_msgSend(v24, "tv_color");
  long long v26 = [v25 color];
  id v27 = -[_TVSpinnerView initWithFrame:color:](v17, "initWithFrame:color:", v26, 0.0, 0.0, v20, v23);

  [(_TVSpinnerView *)v27 startAnimating];
  [(UIView *)v27 transferLayoutStylesFromElement:v5];
  [(_TVActivityView *)v8 setActivityView:v27];

  return v8;
}

- (id)_imageViewForBadgeElement:(id)a3 existingView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = (_TVImageView *)v6;
  }
  else {
    id v7 = objc_alloc_init(_TVImageView);
  }
  id v8 = v7;
  id v9 = v5;
  uint64_t v10 = objc_msgSend(v9, "tv_imageProxy");
  objc_msgSend(v9, "tv_imageScaleToSize");
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [v9 style];
  double v16 = objc_msgSend(v15, "tv_tintColor");
  double v17 = [v16 color];

  double v18 = [v9 style];
  double v19 = objc_msgSend(v18, "tv_highlightColor");
  double v20 = [v19 color];

  if (!v10)
  {
    uint64_t v28 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR)) {
      -[TVMLViewFactory _imageViewForBadgeElement:existingView:](v28, v9);
    }
    long long v29 = 0;
    goto LABEL_28;
  }
  id v52 = v6;
  unsigned int v21 = v20;
  double v22 = v17;
  double v23 = [v9 style];
  objc_msgSend(v23, "tv_borderWidths");
  if (v27 == *(double *)(MEMORY[0x263F1D1C0] + 8)
    && v24 == *MEMORY[0x263F1D1C0]
    && v26 == *(double *)(MEMORY[0x263F1D1C0] + 24)
    && v25 == *(double *)(MEMORY[0x263F1D1C0] + 16))
  {

LABEL_15:
    id v37 = objc_alloc_init(TVImageScaleDecorator);
    goto LABEL_16;
  }
  long long v30 = [v9 style];
  long long v31 = objc_msgSend(v30, "tv_borderColor");
  long long v32 = [v31 color];

  if (!v32) {
    goto LABEL_15;
  }
  long long v33 = [v9 style];
  uint64_t v34 = objc_msgSend(v33, "tv_borderColor");
  CGAffineTransform v35 = [v34 color];
  id v36 = [v9 style];
  objc_msgSend(v36, "tv_borderWidths");
  +[TVImageOutlineDecorator decoratorWithOutlineColor:outlineWidths:](TVImageOutlineDecorator, "decoratorWithOutlineColor:outlineWidths:", v35);
  id v37 = (TVImageScaleDecorator *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  double v17 = v22;
  double v20 = v21;
  id v6 = v52;
  -[TVImageScaleDecorator setScaleToSize:](v37, "setScaleToSize:", v12, v14);
  [v10 setDecorator:v37];
  unsigned int v38 = [v9 appDocument];
  v39 = [v38 requestLoader];
  [v10 setRequestLoader:v39];

  [v10 setLoadSynchronouslyIfCached:1];
  uint64_t v40 = [(_TVImageView *)v8 imageProxy];
  int v41 = [v40 isEqual:v10];

  [(_TVImageView *)v8 setImageProxy:v10];
  [(_TVImageView *)v8 setContentMode:1];
  [(_TVImageView *)v8 setContentsPosition:2];
  [(_TVImageView *)v8 _setTintColor:v17];
  [(_TVImageView *)v8 _setFocusedColor:v20];
  -[_TVImageView setSemanticContentAttribute:](v8, "setSemanticContentAttribute:", objc_msgSend(v9, "tv_semanticContentAttribute"));
  uint64_t v42 = [v9 parent];
  if (v42)
  {
    int v43 = (void *)v42;
    while (objc_msgSend(v43, "tv_elementType") != 35)
    {
      uint64_t v44 = [v43 parent];

      int v43 = (void *)v44;
      if (!v44) {
        goto LABEL_20;
      }
    }
    [(_TVImageView *)v8 _loadImage];
  }
  else
  {
LABEL_20:
    if (v52) {
      int v45 = v41;
    }
    else {
      int v45 = 0;
    }
    if (v45 == 1)
    {
      id v46 = [v9 url];
      int v47 = objc_msgSend(v46, "tv_isResourceURL");

      if (v47) {
        [(_TVImageView *)v8 _reloadImageForLayoutDirectionChange];
      }
    }
  }
  int v48 = [v9 attributes];
  uint64_t v49 = [v48 objectForKeyedSubscript:@"handlesInteraction"];
  uint64_t v50 = [v49 BOOLValue];

  [(_TVImageView *)v8 setUserInteractionEnabled:v50];
  +[_TVControlTarget addTargetInControl:v8 withViewElement:v9];
  long long v29 = v8;

LABEL_28:
  return v29;
}

- (id)_imageViewForElement:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() imageViewWithElement:v9 layout:v8 existingView:v7];

  return v10;
}

- (id)_loadingImageViewForElement:(id)a3 existingView:(id)a4
{
  id v4 = a3;
  id v5 = [v4 attributes];
  id v6 = [v5 objectForKey:*MEMORY[0x263F4B2E0]];

  id v7 = [v4 attributes];
  id v8 = [v7 objectForKey:*MEMORY[0x263F4B2D8]];

  double v9 = 0.0;
  double v10 = 0.0;
  if (objc_opt_respondsToSelector()) {
    double v10 = (float)[v6 integerValue];
  }
  if (objc_opt_respondsToSelector()) {
    double v9 = (float)[v8 integerValue];
  }
  double v11 = [v4 style];
  objc_msgSend(v11, "tv_width");
  double v13 = v12;

  double v14 = [v4 style];
  objc_msgSend(v14, "tv_height");
  double v16 = v15;

  if (v13 == 0.0 || v16 == 0.0)
  {
    double v13 = v10;
    double v16 = v9;
  }
  double v17 = -[_TVLoadingImageView initWithFrame:]([_TVLoadingImageView alloc], "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), v13, v16);

  return v17;
}

- (id)_monogramViewForElement:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  id v10 = a4;
  double v11 = [(objc_class *)+[TVViewLayout layoutClassForElement:v9] layoutWithLayout:v10 element:v9];

  [v11 decoratorSize];
  double v13 = v12;
  double v15 = v14;
  [v11 padding];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v24 = [v9 attributes];
  double v25 = [v24 objectForKey:@"contentsMode"];
  if (v25) {
    uint64_t v26 = objc_msgSend(v9, "tv_scaleMode");
  }
  else {
    uint64_t v26 = 0;
  }

  if (v13 < 0.00000011920929 || v15 < 0.00000011920929)
  {
    uint64_t v28 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR)) {
      -[TVMLViewFactory _monogramViewForElement:layout:existingView:](v28, v9);
    }
    long long v29 = 0;
  }
  else
  {
    uint64_t v76 = v26;
    v81[0] = 0;
    long long v79 = TVCornerRadiiZero;
    long long v80 = *(_OWORD *)&qword_230C384E8;
    +[TVMLUtilities _cornerRadiiFromElement:v9 cornerRadii:&v79 circle:v81];
    +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v79, v80);
    double v31 = v30;
    long long v32 = [TVMonogramViewConfiguration alloc];
    long long v33 = [(TVMonogramViewConfiguration *)v32 initWithShadowImages:v81[0]];
    uint64_t v34 = [v11 highlightColor];
    uint64_t v35 = [v11 tintColor];
    [v11 focusSizeIncrease];
    -[TVMonogramViewConfiguration setFocusedSizeIncrease:](v33, "setFocusedSizeIncrease:");
    [(TVMonogramViewConfiguration *)v33 setFocusedBgColor:v34];
    uint64_t v78 = (void *)v35;
    [(TVMonogramViewConfiguration *)v33 setUnfocusedBgColor:v35];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v37 = (_TVMonogramView *)v8;
    }
    else {
      id v37 = -[_TVMonogramView initWithFrame:configuration:]([_TVMonogramView alloc], "initWithFrame:configuration:", v33, 0.0, 0.0, v13, v15);
    }
    long long v29 = v37;
    -[_TVMonogramView setFocusedStateEnabled:](v37, "setFocusedStateEnabled:", [v11 acceptsFocus]);
    [(_UIFloatingContentView *)v29 setControlState:0 animated:0];
    [(TVMonogramViewConfiguration *)v33 focusedSizeIncrease];
    -[_UIFloatingContentView setFocusedSizeIncrease:](v29, "setFocusedSizeIncrease:");
    [(UIView *)v29 transferLayoutStylesFromElement:v9];
    unsigned int v38 = [v11 placeholderArtworkName];
    char v39 = [v38 isEqualToString:@"none"];
    uint64_t v40 = 0;
    if ((v39 & 1) == 0)
    {
      if ((objc_msgSend(v9, "tv_isResource") & 1) != 0
        || (objc_msgSend(v9, "tv_isSymbol") & 1) != 0
        || ![v38 length])
      {
        uint64_t v40 = 0;
      }
      else
      {
        uint64_t v40 = +[TVMLUtilities _placeholderImageForViewElement:v9];
      }
    }
    v77 = (void *)v40;
    [(_TVMonogramView *)v29 setPlaceholderImage:v40];
    int v41 = [v9 objectForKeyedSubscript:@"TVConfigureForMetrics"];
    char v42 = [v41 BOOLValue];

    if ((v42 & 1) == 0)
    {
      id v72 = v38;
      uint64_t v73 = v34;
      id v74 = v33;
      id v75 = v8;
      [(TVMonogramViewConfiguration *)v33 focusedSizeIncrease];
      uint64_t v44 = objc_msgSend(v9, "tv_urlWithSize:focusSizeIncrease:", v13, v15, v43);
      id v70 = [_TVMonogramDescription alloc];
      int v45 = [v9 attributes];
      id v46 = [v45 objectForKeyedSubscript:@"firstName"];
      int v47 = [v9 attributes];
      int v48 = [v47 objectForKeyedSubscript:@"lastName"];
      uint64_t v49 = [v9 style];
      uint64_t v50 = +[TVMLUtilities fontFromStyle:v49];
      int v51 = v70;
      v71 = (void *)v44;
      id v52 = [(_TVMonogramDescription *)v51 initWithFirstName:v46 lastName:v48 imageURL:v44 font:v50];

      id v53 = [v9 appDocument];
      uint64_t v54 = [v53 requestLoader];
      [(_TVMonogramDescription *)v52 setRequestLoader:v54];

      -[_TVMonogramDescription setSize:](v52, "setSize:", v13, v15);
      -[_TVMonogramDescription setPadding:](v52, "setPadding:", v17, v19, v21, v23);
      if (v76)
      {
        [(_TVMonogramDescription *)v52 setScaleMode:v76];
        if (v76 == 2)
        {
          int v55 = [v11 backgroundColor];
          [(_TVMonogramDescription *)v52 setBackgroundColor:v55];
        }
      }
      long long v33 = v74;
      [(TVMonogramViewConfiguration *)v74 focusedSizeIncrease];
      -[_TVMonogramDescription setUpscaleAdjustment:](v52, "setUpscaleAdjustment:");
      [(_TVMonogramDescription *)v52 setCornerRadius:v31];
      long long v56 = [v9 style];
      objc_msgSend(v56, "tv_borderWidths");
      double v58 = v57;
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;

      [(_TVMonogramDescription *)v52 setBorderWidth:fmax(fmax(v58, v62), fmax(v60, v64))];
      v65 = [v9 style];
      id v66 = objc_msgSend(v65, "tv_borderColor");
      v67 = [v66 color];
      [(_TVMonogramDescription *)v52 setBorderColor:v67];

      [(_TVMonogramDescription *)v52 setFillColor:v78];
      [(_TVMonogramDescription *)v52 setShouldFallBackToSilhouette:v72 == 0];
      id v68 = objc_msgSend(v9, "tv_imageProxy");
      [(_TVMonogramView *)v29 setImageProxy:v68];

      unsigned int v38 = v72;
      [(_TVMonogramView *)v29 setMonogramDescription:v52];

      id v8 = v75;
      uint64_t v34 = v73;
    }
  }
  return v29;
}

- (id)_rowViewForElement:(id)a3 existingView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (_TVRowView *)v6;
  }
  else
  {
    id v8 = [_TVRowView alloc];
    id v7 = -[_TVRowView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  id v9 = v7;
  uint64_t v10 = objc_msgSend(v5, "tv_semanticContentAttribute");
  [(_TVRowView *)v9 setSemanticContentAttribute:v10];
  objc_msgSend(v6, "tv_associatedIKViewElement");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v5 && ([v5 updateType] == 1 || objc_msgSend(v5, "updateType") == 3))
  {
    double v12 = [v6 components];
  }
  else
  {
    double v12 = 0;
  }
  double v13 = [MEMORY[0x263EFF980] array];
  uint64_t v37 = 0;
  unsigned int v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
  double v14 = [v5 attributes];
  double v15 = [v14 objectForKeyedSubscript:@"firstItem"];

  if ([v15 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v16 = [v15 integerValue];
    v38[3] = v16;
  }
  double v17 = [v5 style];
  -[_TVRowView setContentVerticalAlignment:](v9, "setContentVerticalAlignment:", objc_msgSend(v17, "tv_contentAlignment"));

  double v18 = [v5 children];
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  double v31 = __51__TVMLViewFactory__rowViewForElement_existingView___block_invoke;
  long long v32 = &unk_264BA89C8;
  id v19 = v12;
  id v33 = v19;
  uint64_t v35 = &v37;
  uint64_t v36 = v10;
  id v20 = v13;
  id v34 = v20;
  [v18 enumerateObjectsUsingBlock:&v29];

  -[_TVRowView setComponents:](v9, "setComponents:", v20, v29, v30, v31, v32);
  unint64_t v21 = v38[3];
  if (v21 != 0x7FFFFFFFFFFFFFFFLL && v21 < [v20 count])
  {
    double v22 = [v20 objectAtIndexedSubscript:v38[3]];
    int v23 = [v22 canBecomeFocused];

    if (v23)
    {
      double v24 = [v20 objectAtIndexedSubscript:v38[3]];
      [(_TVRowView *)v9 setPreferredFocusedComponent:v24];
    }
  }
  double v25 = [MEMORY[0x263F1C920] mainScreen];
  uint64_t v26 = [v25 focusedView];
  int v27 = [v26 isDescendantOfView:v9];

  if (v27) {
    [(_TVRowView *)v9 setNeedsFocusUpdate];
  }

  _Block_object_dispose(&v37, 8);
  return v9;
}

void __51__TVMLViewFactory__rowViewForElement_existingView___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v11 = a2;
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  }
  id v6 = +[TVInterfaceFactory sharedInterfaceFactory];
  id v7 = [v6 _viewFromElement:v11 existingView:v5];

  if (v7)
  {
    id v8 = [v11 autoHighlightIdentifier];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      if (*(void *)(v10 + 24) == 0x7FFFFFFFFFFFFFFFLL) {
        *(void *)(v10 + 24) = a3;
      }
      [v11 resetProperty:2];
    }
    [v7 setSemanticContentAttribute:*(void *)(a1 + 56)];
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (id)_buttonForElement:(id)a3 existingView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() buttonForElement:v6 existingView:v5];

  return v7;
}

+ (id)buttonForElement:(id)a3 existingView:(id)a4
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v107 = a3;
  id v5 = a4;
  id v6 = [v107 appDocument];
  id v7 = [v6 templateElement];

  if (+[TVMLUtilities interfaceStyleForTemplateElement:v7] == 1)uint64_t v8 = 4005; {
  else
  }
    uint64_t v8 = 4000;
  v104 = v7;
  if (objc_msgSend(v7, "tv_elementType") == 61 || objc_msgSend(v7, "elementType") == 62)
  {
    BOOL v9 = 0;
    BOOL v10 = 1;
  }
  else
  {
    id v11 = [v7 appDocument];
    double v12 = [v11 templateElement];
    uint64_t v13 = [v12 elementType];
    BOOL v10 = v13 == 64;
    BOOL v9 = v13 != 64;
  }
  double v14 = [v107 elementName];
  [v14 isEqualToString:@"roundButton"];

  double v15 = (objc_class *)objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 backdropStyle] == v8)
  {
    id v16 = v5;
  }
  else
  {
    id v17 = [v15 alloc];
    id v16 = (id)objc_msgSend(v17, "initWithFrame:blurEffectStyle:blurEnabled:", v8, v9, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  v110 = v16;
  if (v10
    || ([v107 parent],
        double v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = objc_msgSend(v18, "tv_elementType"),
        v18,
        v19 != 44))
  {
    [v110 setGroupName:0];
    unint64_t v21 = v107;
  }
  else
  {
    id v20 = NSString;
    unint64_t v21 = v107;
    double v22 = [v107 parent];
    int v23 = objc_msgSend(v20, "stringWithFormat:", @"%p", v22);

    [v110 setGroupName:v23];
  }
  v105 = v5;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  double v24 = [v21 children];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v113 objects:v117 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    id v109 = 0;
    id v108 = 0;
    int v27 = 0;
    BOOL v106 = 0;
    uint64_t v28 = *(void *)v114;
    uint64_t v29 = v110;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v114 != v28) {
          objc_enumerationMutation(v24);
        }
        double v31 = *(void **)(*((void *)&v113 + 1) + 8 * v30);
        if (objc_msgSend(v31, "tv_elementType") == 55 && v27 == 0)
        {
          uint64_t v39 = +[TVInterfaceFactory sharedInterfaceFactory];
          uint64_t v40 = [v29 textContentView];
          int v27 = [v39 _viewFromElement:v31 existingView:v40];

          int v41 = [v31 style];
          char v42 = objc_msgSend(v41, "tv_color");

          if (!v42)
          {
            double v43 = [MEMORY[0x263F1C550] whiteColor];
            [v27 setTextColor:v43];
          }
          uint64_t v44 = [v31 style];
          int v45 = objc_msgSend(v44, "tv_highlightColor");

          if (!v45)
          {
            id v46 = [MEMORY[0x263F1C550] blackColor];
            [v27 setHighlightedTextColor:v46];
          }
          if ([v21 isDisabled])
          {
            int v47 = [v27 textColor];
            int v48 = [v47 colorWithAlphaComponent:0.4];

            [v27 setTextColor:v48];
          }
          uint64_t v49 = [v31 attributes];
          uint64_t v50 = objc_msgSend(v49, "tv_BOOLForKey:defaultValue:", @"usesTintColor", 0);

          [v27 _setTextColorFollowsTintColor:v50];
          [v27 _setWantsUnderlineForAccessibilityButtonShapesEnabled:1];
          uint64_t v29 = v110;
        }
        else if (objc_msgSend(v31, "tv_elementType") == 16 {
               && (!objc_msgSend(v31, "tv_imageType") ? (BOOL v33 = v108 == 0) : (BOOL v33 = 0), v33))
        }
        {
          int v51 = +[TVInterfaceFactory sharedInterfaceFactory];
          id v52 = [v29 imageView];
          id v53 = [v51 _viewFromElement:v31 existingView:v52];

          uint64_t v29 = v110;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v54 = v53;
          }
          else {
            uint64_t v54 = 0;
          }
          id v108 = v54;

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v55 = [v31 style];
            long long v56 = objc_msgSend(v55, "tv_visualEffect");
            uint64_t v57 = [v56 isEqualToString:@"punch-through"];

            [v110 setShouldPunchThroughImage:v57];
          }
          BOOL v106 = v27 != 0;
          unint64_t v21 = v107;
        }
        else if (objc_msgSend(v31, "tv_elementType") == 5 && v109 == 0)
        {
          uint64_t v35 = +[TVInterfaceFactory sharedInterfaceFactory];
          uint64_t v36 = [v29 accessoryView];
          uint64_t v37 = [v35 _viewFromElement:v31 existingView:v36];

          unint64_t v21 = v107;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            unsigned int v38 = v37;
          }
          else {
            unsigned int v38 = 0;
          }
          id v109 = v38;
        }
        ++v30;
      }
      while (v26 != v30);
      uint64_t v58 = [v24 countByEnumeratingWithState:&v113 objects:v117 count:16];
      uint64_t v26 = v58;
    }
    while (v58);
  }
  else
  {
    id v109 = 0;
    id v108 = 0;
    int v27 = 0;
    BOOL v106 = 0;
    uint64_t v29 = v110;
  }

  [v21 style];
  double v60 = v59 = v21;
  double v61 = objc_msgSend(v60, "tv_backgroundColor");
  double v62 = [v61 color];

  if (v62)
  {
    double v63 = [v59 style];
    double v64 = objc_msgSend(v63, "tv_highlightColor");
    v65 = [v64 color];
    id v66 = v65;
    if (v65)
    {
      id v67 = v65;
    }
    else
    {
      id v67 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.8];
    }
    id v68 = v67;

    double v69 = [v59 style];
    id v70 = objc_msgSend(v69, "tv_backgroundColor");
    v71 = [v70 color];
    [v110 setBackgroundColor:v71];

    uint64_t v29 = v110;
    [v110 setHighlightColor:v68];
  }
  id v72 = [v59 style];
  objc_msgSend(v72, "tv_borderWidths");
  double v74 = v73;
  double v76 = v75;
  double v78 = v77;
  double v80 = v79;

  uint64_t v81 = [v29 layer];
  objc_msgSend(v81, "setBorderWidth:", fmax(fmax(v74, v78), fmax(v76, v80)));

  long long v82 = [v29 layer];
  long long v83 = [v59 style];
  long long v84 = objc_msgSend(v83, "tv_borderColor");
  id v85 = [v84 color];
  objc_msgSend(v82, "setBorderColor:", objc_msgSend(v85, "CGColor"));

  long long v111 = TVCornerRadiiZero;
  long long v112 = *(_OWORD *)&qword_230C384E8;
  if (+[TVMLUtilities _cornerRadiiFromElement:v59 cornerRadii:&v111 circle:0])
  {
    +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v111, v112);
  }
  else
  {
    double v86 = *(double *)&_kTVButtonDefaultCornerRadius;
  }
  double v87 = v110;
  [v110 setCornerRadius:v86];
  double v88 = [v59 parent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v89 = 8.0;
LABEL_75:
    objc_msgSend(v110, "setContentMotionRotation:translation:", 0.0, 0.0, v89, 8.0);
    goto LABEL_78;
  }
  if (objc_msgSend(v88, "tv_elementType") != 44)
  {
    double v89 = 0.0;
    goto LABEL_75;
  }
  float v90 = [v88 parent];
  double v91 = [v90 children];
  unint64_t v92 = [v91 indexOfObjectIdenticalTo:v88];

  if (!v92) {
    goto LABEL_70;
  }
  uint64_t v93 = [v90 children];
  uint64_t v94 = [v93 objectAtIndex:v92 - 1];
  uint64_t v95 = objc_msgSend(v94, "tv_elementType");

  double v87 = v110;
  double v96 = 8.0;
  if (v95 != 6)
  {
LABEL_70:
    float v97 = [v90 children];
    if (v92 >= [v97 count] - 1)
    {

      double v96 = 0.0;
    }
    else
    {
      v98 = [v90 children];
      v99 = [v98 objectAtIndex:v92 + 1];
      uint64_t v100 = objc_msgSend(v99, "tv_elementType");

      double v87 = v110;
      if (v100 == 6) {
        double v96 = 8.0;
      }
      else {
        double v96 = 0.0;
      }
    }
  }
  objc_msgSend(v87, "setContentMotionRotation:translation:", 0.0, 0.0, 8.0, v96);

  double v59 = v107;
LABEL_78:
  [v87 setTextContentView:v27];
  [v87 setImageView:v108];
  [v87 setImageTrailsTextContent:v106];
  [v87 setAccessoryView:v109];
  [v87 setViewElement:v59];
  objc_msgSend(v87, "setDisabled:", objc_msgSend(v59, "isDisabled"));
  double v101 = [v59 style];
  objc_msgSend(v101, "tv_focusSizeIncrease");
  objc_msgSend(v87, "setFocusSizeIncrease:");

  [v87 setExclusiveTouch:1];
  id v102 = v87;

  return v102;
}

- (id)_buttonLockupForElement:(id)a3 existingView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() buttonLockupForElement:v6 existingView:v5];

  return v7;
}

+ (id)buttonLockupForElement:(id)a3 existingView:(id)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 appDocument];
  uint64_t v8 = [v7 templateElement];

  id v68 = (void *)v8;
  int64_t v9 = +[TVMLUtilities interfaceStyleForTemplateElement:v8];
  if (v9 == 1) {
    uint64_t v10 = 4005;
  }
  else {
    uint64_t v10 = 4000;
  }
  id v11 = [v5 attributes];
  double v12 = [v11 objectForKeyedSubscript:@"theme"];

  if (v12)
  {
    uint64_t v13 = [v5 attributes];
    double v14 = [v13 objectForKeyedSubscript:@"theme"];
    double v15 = [v14 lowercaseString];

    if ([v15 length])
    {
      if ([v15 isEqualToString:@"light"])
      {
        int64_t v9 = 1;
        uint64_t v10 = 4005;
      }
      else
      {
        if ([v15 isEqualToString:@"dark"]) {
          int64_t v9 = 2;
        }
        else {
          int64_t v9 = 0;
        }
        uint64_t v10 = 4000;
      }
    }
  }
  id v16 = [v5 parent];
  if (objc_msgSend(v16, "tv_elementType") == 44)
  {
    id v17 = NSString;
    double v18 = [v5 parent];
    uint64_t v19 = objc_msgSend(v17, "stringWithFormat:", @"%p", v18);
  }
  else
  {
    uint64_t v19 = 0;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 backdropStyle] == v10)
  {
    id v20 = (TVButtonLockup *)v6;
  }
  else
  {
    unint64_t v21 = [TVButtonLockup alloc];
    id v20 = -[TVButtonLockup initWithFrame:blurEffectStyle:groupName:](v21, "initWithFrame:blurEffectStyle:groupName:", v10, v19, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  v71 = v20;
  double v22 = [v5 attributes];
  int v23 = [v22 objectForKeyedSubscript:@"theme"];

  if (v23)
  {
    double v24 = [v5 attributes];
    uint64_t v25 = [v24 objectForKeyedSubscript:@"theme"];
    uint64_t v26 = [v25 lowercaseString];

    if ([v26 length]) {
      [(TVButtonLockup *)v71 setVibrantLabelThemeOverride:v9];
    }
  }
  unsigned int v73 = [v5 isDisabled];
  int v27 = [v5 style];
  uint64_t v28 = objc_msgSend(v27, "tv_backgroundColor");
  uint64_t v29 = [v28 color];

  id v67 = (void *)v19;
  if (v29)
  {
    uint64_t v30 = [v5 style];
    double v31 = objc_msgSend(v30, "tv_highlightColor");
    long long v32 = [v31 color];
    BOOL v33 = v32;
    if (v32)
    {
      id v34 = v32;
    }
    else
    {
      id v34 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.8];
    }
    uint64_t v36 = v34;

    uint64_t v37 = [v5 style];
    unsigned int v38 = objc_msgSend(v37, "tv_backgroundColor");
    uint64_t v39 = [v38 color];
    uint64_t v35 = v71;
    [(TVButtonLockup *)v71 setBackgroundColor:v39];

    [(TVButtonLockup *)v71 setHighlightColor:v36];
  }
  else
  {
    uint64_t v35 = v71;
    [(TVButtonLockup *)v71 setBackgroundColor:0];
    [(TVButtonLockup *)v71 setHighlightColor:0];
  }
  double v69 = v6;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v40 = [v5 children];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v74 objects:v78 count:16];
  if (!v41)
  {

    double v63 = 0;
    uint64_t v44 = 0;
    uint64_t v43 = 0;
    double v62 = v67;
    goto LABEL_61;
  }
  uint64_t v42 = v41;
  id v66 = v5;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v70 = 0;
  uint64_t v72 = 0;
  uint64_t v45 = *(void *)v75;
  double v46 = 1.0;
  do
  {
    for (uint64_t i = 0; i != v42; ++i)
    {
      if (*(void *)v75 != v45) {
        objc_enumerationMutation(v40);
      }
      int v48 = *(void **)(*((void *)&v74 + 1) + 8 * i);
      if (objc_msgSend(v48, "tv_elementType") == 55)
      {
        id v49 = v48;
        if (objc_msgSend(v49, "tv_textStyle") == 1)
        {
          if (!v72)
          {
            uint64_t v50 = +[TVInterfaceFactory sharedInterfaceFactory];
            int v51 = [(TVButtonLockup *)v35 titleView];
            uint64_t v72 = [v50 _viewFromElement:v49 existingView:v51];
            goto LABEL_53;
          }
        }
        else if (!(v44 | v43))
        {
          uint64_t v54 = [v49 style];
          int v55 = objc_msgSend(v54, "tv_color");
          long long v56 = [v55 color];
          uint64_t v57 = v56;
          if (v56)
          {
            id v58 = v56;
          }
          else
          {
            id v58 = [MEMORY[0x263F1C550] whiteColor];
          }
          uint64_t v50 = v58;

          if (v73)
          {
            uint64_t v59 = [v50 colorWithAlphaComponent:0.4];

            uint64_t v50 = (void *)v59;
          }
          uint64_t v35 = v71;
          uint64_t v44 = objc_msgSend(v49, "tv_attributedStringWithForegroundColor:textAlignment:", v50, 1);
          double v60 = [v49 style];
          objc_msgSend(v60, "tv_minimumScaleFactor");
          double v46 = v61;

          int v51 = [v49 style];
          uint64_t v70 = objc_msgSend(v51, "tv_maxTextLines");
LABEL_53:
        }
        continue;
      }
      if (objc_msgSend(v48, "tv_elementType") == 16
        || objc_msgSend(v48, "tv_elementType") == 5
        || objc_msgSend(v48, "tv_elementType") == 48)
      {
        if (!(v44 | v43))
        {
          id v52 = +[TVInterfaceFactory sharedInterfaceFactory];
          id v53 = [(TVButtonLockup *)v35 imageView];
          uint64_t v43 = [v52 _viewFromElement:v48 existingView:v53];
        }
        if (v73) {
          [(id)v43 setAlpha:0.4];
        }
      }
    }
    uint64_t v42 = [v40 countByEnumeratingWithState:&v74 objects:v78 count:16];
  }
  while (v42);

  if (v44) {
    [(TVButtonLockup *)v35 setText:v44 minimumScale:v70 maxNumberOfLines:v46];
  }
  id v5 = v66;
  double v62 = v67;
  double v63 = (void *)v72;
LABEL_61:
  [(TVButtonLockup *)v35 setImageView:v43];
  [(TVButtonLockup *)v35 setTitleView:v63];
  [(TVButtonLockup *)v35 setViewElement:v5];
  [(TVButtonLockup *)v35 setDisabled:v73];
  double v64 = v35;

  return v64;
}

- (id)_segmentedControlForElement:(id)a3 existingView:(id)a4
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F1C968]);
    id v7 = (id)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  id v9 = v7;
  BOOL v42 = (![v5 updateType] || objc_msgSend(v5, "updateType") == 2) && v9 == v6;
  uint64_t v10 = [v5 attributes];
  id v11 = [v10 objectForKey:@"segmentWidthsByContent"];
  objc_msgSend(v9, "setApportionsSegmentWidthsByContent:", objc_msgSend(v11, "BOOLValue"));

  unint64_t v46 = [v9 selectedSegmentIndex];
  if (!v42) {
    [v9 removeAllSegments];
  }
  uint64_t v78 = 0;
  uint64_t v79 = &v78;
  uint64_t v80 = 0x2020000000;
  char v81 = 0;
  uint64_t v72 = 0;
  unsigned int v73 = &v72;
  uint64_t v74 = 0x3032000000;
  long long v75 = __Block_byref_object_copy__4;
  long long v76 = __Block_byref_object_dispose__4;
  id v77 = 0;
  uint64_t v66 = 0;
  id v67 = &v66;
  uint64_t v68 = 0x3032000000;
  double v69 = __Block_byref_object_copy__4;
  uint64_t v70 = __Block_byref_object_dispose__4;
  id v71 = 0;
  uint64_t v60 = 0;
  double v61 = &v60;
  uint64_t v62 = 0x3032000000;
  double v63 = __Block_byref_object_copy__4;
  double v64 = __Block_byref_object_dispose__4;
  id v65 = 0;
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __60__TVMLViewFactory__segmentedControlForElement_existingView___block_invoke;
  v59[3] = &unk_264BA89F0;
  void v59[4] = &v72;
  v59[5] = &v66;
  v59[6] = &v60;
  v59[7] = &v78;
  uint64_t v41 = (void (**)(void, void))MEMORY[0x230FC9DC0](v59);
  ((void (**)(void, id))v41)[2](v41, v5);
  uint64_t v43 = [MEMORY[0x263EFF980] array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  double v12 = [v5 children];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v55 objects:v83 count:16];
  if (v13)
  {
    uint64_t v50 = 0;
    uint64_t v48 = *(void *)v56;
    uint64_t v47 = *MEMORY[0x263F4B2B8];
    uint64_t v44 = v9;
    id obj = v12;
    do
    {
      uint64_t v49 = v13;
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v56 != v48) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if (objc_msgSend(v15, "tv_elementType") == 51)
        {
          id v16 = [v15 autoHighlightIdentifier];
          if ([v16 length]) {
            BOOL v17 = v46 == -1;
          }
          else {
            BOOL v17 = 0;
          }
          int v18 = v17;

          if (v18)
          {
            uint64_t v19 = [v5 children];
            unint64_t v46 = [v19 indexOfObject:v15];
          }
          [v15 resetProperty:2];
          id v20 = [v15 attributes];
          unint64_t v21 = [v20 objectForKey:v47];

          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          double v22 = [v15 children];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v82 count:16];
          if (v23)
          {
            id v24 = v6;
            id v25 = v5;
            uint64_t v26 = *(void *)v52;
            while (2)
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v52 != v26) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v28 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                if (objc_msgSend(v28, "tv_elementType") == 55)
                {
                  id v5 = v25;
                  id v6 = v24;
                  id v9 = v44;
                  if (!*((unsigned char *)v79 + 24)) {
                    ((void (**)(void, void *))v41)[2](v41, v28);
                  }
                  uint64_t v29 = [v28 text];
                  uint64_t v30 = [v29 string];
                  if (v42) {
                    [v44 setTitle:v30 forSegmentAtIndex:v50];
                  }
                  else {
                    [v44 insertSegmentWithTitle:v30 atIndex:v50 animated:0];
                  }

                  [v43 addObject:v15];
                  double v31 = [v28 attributes];
                  uint64_t v32 = [v31 objectForKey:v47];
                  BOOL v33 = (void *)v32;
                  if (v32) {
                    id v34 = (void *)v32;
                  }
                  else {
                    id v34 = v21;
                  }
                  id v35 = v34;

                  ++v50;
                  unint64_t v21 = v35;
                  goto LABEL_42;
                }
              }
              uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v82 count:16];
              if (v23) {
                continue;
              }
              break;
            }
            id v5 = v25;
            id v6 = v24;
            id v9 = v44;
          }
LABEL_42:

          uint64_t v36 = [v9 accessibilityElements];
          if (v50 - 1 >= (unint64_t)[v36 count])
          {
            uint64_t v37 = 0;
          }
          else
          {
            uint64_t v37 = objc_msgSend(v36, "objectAtIndexedSubscript:");
          }
          objc_msgSend(v15, "tv_setProxyView:", v37);
          objc_msgSend(v37, "tv_setAssociatedIKViewElement:", v15);
          if (v21) {
            [v37 setAccessibilityLabel:v21];
          }
        }
      }
      double v12 = obj;
      uint64_t v13 = [obj countByEnumeratingWithState:&v55 objects:v83 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v50 = 0;
  }

  [v9 setTitleTextAttributes:v73[5] forState:0];
  [v9 setTitleTextAttributes:v61[5] forState:4];
  [v9 setTitleTextAttributes:v67[5] forState:8];
  [v9 setTitleTextAttributes:v67[5] forState:1];
  if (v50)
  {
    unint64_t v38 = v50 - 1;
    if (v46 < v50 - 1) {
      unint64_t v38 = v46;
    }
    if (v46 == -1) {
      unint64_t v39 = 0;
    }
    else {
      unint64_t v39 = v38;
    }
    [v9 setSelectedSegmentIndex:v39];
  }
  +[_TVSegmentedControlTarget addTargetInSegmentedControl:v9 withHighlightViewElements:v43];

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v78, 8);

  return v9;
}

void __60__TVMLViewFactory__segmentedControlForElement_existingView___block_invoke(void *a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a2;
  id obj = objc_alloc_init(v3);
  id v5 = [v4 style];

  id v6 = objc_msgSend(v5, "tv_textStyle");
  if (v6 || (objc_msgSend(v5, "tv_fontWeight"), (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    id v7 = +[TVMLUtilities fontFromStyle:v5];
    [obj setObject:v7 forKeyedSubscript:*MEMORY[0x263F1C238]];

    goto LABEL_5;
  }
  objc_msgSend(v5, "tv_fontSize");
  if (v23 > 0.0) {
    goto LABEL_4;
  }
LABEL_5:
  id v8 = [v5 textShadow];
  if (v8) {
    [obj setObject:v8 forKeyedSubscript:*MEMORY[0x263F1C280]];
  }
  id v9 = objc_msgSend(v5, "tv_color");
  uint64_t v10 = [v9 color];

  id v11 = (uint64_t *)MEMORY[0x263F1C240];
  if (v10) {
    [obj setObject:v10 forKeyedSubscript:*MEMORY[0x263F1C240]];
  }
  double v12 = objc_msgSend(v5, "tv_highlightColor");
  uint64_t v13 = [v12 color];

  if ([obj count] || v13)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), obj);
    uint64_t v14 = [obj mutableCopy];
    uint64_t v15 = *(void *)(a1[5] + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    BOOL v17 = v13;
    if (!v13)
    {
      BOOL v17 = [MEMORY[0x263F1C550] blackColor];
    }
    uint64_t v18 = *v11;
    [*(id *)(*(void *)(a1[5] + 8) + 40) setObject:v17 forKeyedSubscript:*v11];
    if (!v13) {

    }
    uint64_t v19 = [obj mutableCopy];
    uint64_t v20 = *(void *)(a1[6] + 8);
    unint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    double v22 = [MEMORY[0x263F1C550] whiteColor];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v22 forKeyedSubscript:v18];

    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

- (id)_ratingBadgeFromElement:(id)a3 existingView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[TVRatingBadgeLayout layoutWithLayout:0 element:v6];
  id v8 = [v6 attributes];

  id v9 = [v8 objectForKeyedSubscript:@"value"];
  [v9 floatValue];
  double v11 = v10;

  double v12 = +[TVRatingBadgeView ratingBadgeViewWithValue:v7 layout:v5 existingBadgeView:v11];

  return v12;
}

- (id)_progressBarFromElement:(id)a3 existingView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (_TVProgressView *)v6;
  }
  else
  {
    id v8 = [_TVProgressView alloc];
    id v7 = -[_TVProgressView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  id v9 = v7;
  float v10 = objc_msgSend(v5, "style", TVCornerRadiiZero, 0, unk_230C384F0);
  uint64_t v11 = [v10 borderRadius];
  if (v11)
  {
    double v12 = (void *)v11;
    BOOL v13 = +[TVMLUtilities _cornerRadiiFromElement:v5 cornerRadii:v35 circle:0];

    if (v13)
    {
      +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v35[0], v35[1]);
      -[_TVProgressView setCornerRadius:](v9, "setCornerRadius:");
    }
  }
  else
  {
  }
  uint64_t v14 = [v5 style];
  uint64_t v15 = objc_msgSend(v14, "tv_progressStyle");

  -[_TVProgressView setStyle:](v9, "setStyle:", [v15 isEqualToString:@"unshadowed"]);
  id v16 = [v5 style];
  BOOL v17 = objc_msgSend(v16, "tv_tintColor");
  uint64_t v18 = [v17 color];
  uint64_t v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [MEMORY[0x263F1C550] whiteColor];
  }
  unint64_t v21 = v20;

  [(_TVProgressView *)v9 setProgressTintColor:v21];
  double v22 = [v5 style];
  double v23 = objc_msgSend(v22, "tv_tintColor2");
  id v24 = [v23 color];
  id v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    id v26 = [MEMORY[0x263F1C550] colorWithWhite:0.2 alpha:0.9];
  }
  int v27 = v26;

  [(_TVProgressView *)v9 setCompleteTintColor:v27];
  uint64_t v28 = [v5 attributes];
  uint64_t v29 = [v28 objectForKeyedSubscript:@"value"];
  [v29 floatValue];
  [(_TVProgressView *)v9 setProgress:v30];

  double v31 = [v5 style];
  uint64_t v32 = objc_msgSend(v31, "tv_imageTreatment");
  uint64_t v33 = [v32 isEqualToString:@"blur"];

  [(_TVProgressView *)v9 setUseMaterial:v33];
  return v9;
}

- (id)_seasonsBadgeWithElement:(id)a3 existingView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (_TVImageView *)v5;
  }
  else
  {
    id v8 = [_TVImageView alloc];
    id v7 = -[_TVImageView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  id v9 = v7;
  float v10 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v11 = +[TVMLUtilities TVMLKitBundle];
  double v12 = [v10 imageNamed:@"seasons_mask" inBundle:v11 compatibleWithTraitCollection:0];

  [v12 size];
  double v14 = v13;
  double v16 = v15;
  BOOL v17 = objc_msgSend(v6, "tv_attributedString");
  uint64_t v18 = [MEMORY[0x263F1C920] mainScreen];
  [v18 scale];
  CGFloat v20 = v19;
  v28.width = v14;
  v28.height = v16;
  UIGraphicsBeginImageContextWithOptions(v28, 0, v20);

  objc_msgSend(v12, "drawInRect:", 0.0, 0.0, v14, v16);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationOut);
  objc_msgSend(v17, "drawInRect:", 0.0, 0.0, 43.0, 30.0);
  double v22 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [(_TVImageView *)v9 setImage:v22];
  [(_TVImageView *)v9 setContentMode:1];
  [(_TVImageView *)v9 setContentsPosition:2];
  double v23 = [v6 style];

  id v24 = objc_msgSend(v23, "tv_tintColor");
  id v25 = [v24 color];

  if (v25) {
    [(_TVImageView *)v9 _setTintColor:v25];
  }

  return v9;
}

- (id)_separatorViewForElement:(id)a3 existingView:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [v7 contentView];
    id v9 = [v8 subviews];
    id v10 = [v9 firstObject];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v11 = objc_msgSend(v7, "contentView", 0);
    double v12 = [v11 subviews];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          BOOL v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
            [v17 removeFromSuperview];
          }
          else {
            id v10 = v17;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v14);
    }

    uint64_t v18 = +[_TVSeparatorView separatorViewWithElement:v5 existingView:v10];
    [v18 transferLayoutStylesFromElement:v5];
    double v19 = [v18 superview];

    if (!v19)
    {
      [v18 setAutoresizingMask:18];
      CGFloat v20 = [v7 contentView];
      [v20 addSubview:v18];
    }
    unint64_t v21 = [v7 contentView];
    [v21 bounds];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    objc_msgSend(v7, "tv_padding");
    objc_msgSend(v18, "setFrame:", v23 + v33, v25 + v30, v27 - (v33 + v31), v29 - (v30 + v32));

    id v34 = v7;
  }
  else
  {
    id v34 = +[_TVSeparatorView separatorViewWithElement:v5 existingView:v6];
    [v34 transferLayoutStylesFromElement:v5];
  }

  return v34;
}

+ (void)imageViewWithElement:(void *)a1 layout:(void *)a2 existingView:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 url];
  OUTLINED_FUNCTION_0_1(&dword_230B4C000, v5, v6, "width/height missing for element with URL [%@]", v7, v8, v9, v10, 2u);
}

- (void)_imageViewForBadgeElement:(void *)a1 existingView:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 url];
  OUTLINED_FUNCTION_0_1(&dword_230B4C000, v5, v6, "Can't find badge named [%@]", v7, v8, v9, v10, 2u);
}

- (void)_monogramViewForElement:(void *)a1 layout:(void *)a2 existingView:.cold.1(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [a2 attributes];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"firstName"];
  uint64_t v6 = [a2 attributes];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"lastName"];
  int v8 = 138412546;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_230B4C000, v3, OS_LOG_TYPE_ERROR, "width/height missing for monogram with first,last [%@,%@]", (uint8_t *)&v8, 0x16u);
}

@end