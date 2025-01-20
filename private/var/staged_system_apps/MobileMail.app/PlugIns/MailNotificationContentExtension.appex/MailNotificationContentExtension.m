void sub_1000041F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39)
{
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  _Unwind_Resume(a1);
}

void sub_10000459C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000046D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v15 = v12;

  _Unwind_Resume(a1);
}

void sub_100004918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_100005490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000055F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005B8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005E60(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1000060A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000062E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000645C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000065B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

UIFont *__cdecl sub_100006770(id a1)
{
  v1 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2 addingSymbolicTraits:32770 options:0];
  v2 = +[UIFont fontWithDescriptor:v1 size:0.0];

  return (UIFont *)v2;
}

void sub_1000067E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

UIFont *__cdecl sub_1000067F8(id a1)
{
  v1 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2 addingSymbolicTraits:2 options:0];
  v2 = +[UIFont fontWithDescriptor:v1 size:0.0];

  return (UIFont *)v2;
}

void sub_100006870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006EE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(a1);
}

void *sub_100006EFC(void *result, uint64_t a2)
{
  uint64_t v2 = result[4];
  if ((*(void *)(v2 + 8) & a2) != 0)
  {
    uint64_t v3 = *(void *)(result[5] + 8);
    uint64_t v4 = *(void *)(v3 + 24);
    if (v4 >= result[6]) {
      *(void *)(v2 + 24) |= a2;
    }
    else {
      *(void *)(v3 + 24) = v4 + 1;
    }
  }
  return result;
}

void sub_1000074E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000076E0(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_100048588;
  qword_100048588 = (uint64_t)v1;
}

void sub_100007750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100007850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_100007A5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007B68;
  v7[3] = &unk_10003CA08;
  id v8 = *(id *)(a1 + 32);
  id v9 = WeakRetained;
  id v5 = v3;
  id v10 = v5;
  v6 = +[EFScheduler mainThreadScheduler];
  [v6 performSyncBlock:v7];
}

void sub_100007B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  v19 = v18;

  _Unwind_Resume(a1);
}

void sub_100007B68(id *a1)
{
  uint64_t v2 = +[MFAvatarView log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] emailAddress];
    uint64_t v4 = [v3 emailAddressValue];
    id v5 = v4;
    if (v4)
    {
      v6 = [v4 ef_publicDescription];
    }
    else
    {
      v7 = [v3 stringValue];
      v6 = +[EFPrivacy fullyOrPartiallyRedactedStringForString:v7];
    }
    int v16 = 138543362;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating avatar for %{public}@", (uint8_t *)&v16, 0xCu);
  }
  id v8 = [a1[6] image];
  id v9 = [a1[5] avatarView];
  [v9 setImage:v8];

  id v10 = a1[6];
  v11 = [a1[5] avatarView];
  v12 = [v11 traitCollection];
  id v13 = [v10 needsBorderFor:[v12 userInterfaceStyle]];

  v14 = [a1[5] avatarView];
  [a1[5] frame];
  +[MUIAvatarImageGenerator roundAvatarView:v14 withBorder:v13 size:v15];
}

void sub_100007D3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  _Unwind_Resume(a1);
}

id sub_10000827C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 32))
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_1000083F0;
    v11[4] = sub_100008400;
    id v12 = (id)0xAAAAAAAAAAAAAAAALL;
    id v12 = v3;
    id v5 = *(void **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008408;
    v8[3] = &unk_10003CA58;
    id v10 = v11;
    id v9 = v12;
    v6 = [v5 then:v8];

    _Block_object_dispose(v11, 8);
  }
  else
  {
    v6 = +[EFFuture futureWithResult:v3];
  }

  return v6;
}

void sub_1000083BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000083F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008400(uint64_t a1)
{
}

id sub_100008408(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [*(id *)(a1 + 32) mutableCopy];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setImageData:v5];
  }
  id v9 = +[EFFuture futureWithResult:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  return v9;
}

void sub_1000084F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008514(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = v3;
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  id v6 = [WeakRetained contactAvatarView];
  [v6 setContacts:v5];

  [WeakRetained setHidden:0];
}

void sub_1000085D8(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100008610(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHidden:1];
}

void sub_10000865C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000086C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000870C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000877C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000087E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)MFAvatarView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100008FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34)
{
  _Unwind_Resume(a1);
}

void sub_100009398(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_100048598;
  qword_100048598 = (uint64_t)v1;
}

void sub_100009408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000958C(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100009C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,void *a32,void *a33,void *a34,void *a35)
{
  _Unwind_Resume(a1);
}

void sub_10000ABDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AF78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B30C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B6E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000BE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

id sub_10000BF18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showMessageInfo];
}

void sub_10000C0DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v11;

  _Unwind_Resume(a1);
}

void sub_10000C2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000C3A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C42C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10000C8D0(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateStatusIndicators:v4];
  [WeakRetained _updateHorizontalStatusIndicators:v4];
}

void sub_10000C938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000CBB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  _Unwind_Resume(a1);
}

void sub_10000CC68(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  if (!((v3 == 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000CD6C;
    v6[3] = &unk_10003CB48;
    v6[4] = WeakRetained;
    id v5 = +[EFScheduler mainThreadScheduler];
    [v5 performBlock:v6];
  }
}

void sub_10000CD44(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000CD6C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) captionView];
  [v1 setBIMIVerified:1];
}

void sub_10000CDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000CDD0(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 setAddressAtomTarget:WeakRetained action:"_primaryAddressAtomWasTapped:"];
  id v4 = [WeakRetained primaryAtomList];
  id v5 = [v4 addressAtoms];
  objc_msgSend(v6, "setAddressAtomSeparatorStyle:", 2 * ((unint64_t)objc_msgSend(v5, "count") < 2));

  [v6 setAddressAtomsArePrimary:1];
}

void sub_10000CE88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000CF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D1C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D4C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D52C(uint64_t a1, void *a2)
{
  id v9 = a2;
  [v9 setTranslatesAutoresizingMaskIntoConstraints:1];
  [v9 frame];
  CGFloat y = v11.origin.y;
  double width = v11.size.width;
  double height = v11.size.height;
  CGRectGetWidth(v11);
  UIRoundToViewScale();
  double x = v12.origin.x;
  v12.origin.CGFloat y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  CGRectGetHeight(v12);
  UIRoundToViewScale();
  [v9 setFrame:x v7 width:height];
  id v8 = [v9 superview];

  if (!v8) {
    [*(id *)(a1 + 32) addSubview:v9];
  }
}

void sub_10000D638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10000D838(uint64_t a1, void *a2, unsigned char *a3)
{
  id v18 = a2;
  id v5 = [v18 superview];

  if (!v5) {
    [*(id *)(a1 + 32) addSubview:v18];
  }
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v6) = 1148846080;
  [v18 setContentHuggingPriority:0 forAxis:v6];
  double v7 = objc_opt_new();
  if (a3)
  {
    id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3 - 1];
    id v9 = [v18 centerXAnchor];
    id v10 = [v8 centerXAnchor];
    CGRect v11 = [v9 constraintEqualToAnchor:v10 constant:*(double *)(a1 + 48)];
    [v7 addObject:v11];
  }
  else
  {
    id v8 = [v18 leadingAnchor];
    id v9 = [*(id *)(a1 + 32) leadingAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9];
    [v7 addObject:v10];
  }

  if ((char *)[*(id *)(a1 + 40) count] - 1 == a3)
  {
    CGRect v12 = [v18 trailingAnchor];
    id v13 = [*(id *)(a1 + 32) trailingAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    [v7 addObject:v14];
  }
  double v15 = [v18 firstBaselineAnchor];
  int v16 = [*(id *)(a1 + 32) firstBaselineAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  [v7 addObject:v17];

  +[NSLayoutConstraint activateConstraints:v7];
}

void sub_10000DA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000DCC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E1CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E2A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E2B4(uint64_t a1)
{
}

void sub_10000E2BC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000E31C(uint64_t a1, void *a2)
{
  id v3 = [a2 localizedDescription];
  NSLog(@"Retrieving future attachment data failed with error: %@", v3);

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  double v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

void sub_10000E390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E3A0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000E400(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MFConversationItemHeaderBlock log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 localizedDescription];
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Retrieving future rich link data failed with error: %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000E4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E514(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) numberOfMessagesInConversationForConversationItemHeaderBlock:*(void *)(a1 + 40)];
  id v3 = [MFMessageInfoViewController alloc];
  id v9 = [*(id *)(a1 + 40) viewModel];
  id v4 = [*(id *)(a1 + 40) contactStore];
  id v5 = [(MFMessageInfoViewController *)v3 initWithViewModel:v9 contactsStore:v4 attachmentURLs:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) richLinkURLs:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) numberOfMessagesInConversation:v2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) view];
  [v10 frame];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPreferredContentSize:320.0 v8];

  id v11 = [*(id *)(a1 + 40) delegate];
  [v11 conversationItemHeader:*(void *)(a1 + 40) presentViewController:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void sub_10000E640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EB58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EC28(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _hasConversationLayout])
  {
    unsigned int v2 = [*(id *)(a1 + 32) usingLargeTextLayout];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    if (v2)
    {
      id v8 = [*(id *)(a1 + 32) primaryStackView];
      id v4 = *(void **)(a1 + 32);
      if (v3)
      {
        id v5 = [v4 timestampLabel];
        [v8 removeArrangedSubview:v5];

        id v9 = [*(id *)(a1 + 32) timestampLabel];
        [v9 removeFromSuperview];
      }
      else
      {
        double v7 = [v4 timestampLabel];
        [v8 insertArrangedSubview:v7 atIndex:2];
      }
    }
    else
    {
      if (*(unsigned char *)(a1 + 40)) {
        double v6 = 0.0;
      }
      else {
        double v6 = 1.0;
      }
      id v10 = [*(id *)(a1 + 32) timestampLabel];
      [v10 setAlpha:v6];
    }
  }
  [*(id *)(a1 + 32) setNeedsUpdateConstraints];
  [*(id *)(a1 + 32) updateConstraintsIfNeeded];
  [*(id *)(a1 + 32) _updateStackViewSpacing];
  id v11 = [*(id *)(a1 + 32) superview];
  [v11 layoutIfNeeded];
}

void sub_10000ED5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10000ED90(uint64_t a1)
{
  return [*(id *)(a1 + 32) setClipsToBounds:0];
}

void sub_10000EE28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000EE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000EF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000EFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_10000F0E8(id a1, NSString *a2)
{
  unsigned int v2 = a2;
  int v3 = [(NSString *)v2 emailAddressValue];
  id v4 = v3;
  if (v3) {
    [v3 stringValue];
  }
  else {
  id v5 = [(NSString *)v2 stringValue];
  }

  return (NSString *)v5;
}

void sub_10000F168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F22C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F47C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FC8C(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10000FD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)MFExpandableCaptionView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10000FE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10000FE84(uint64_t a1, void *a2)
{
  return [a2 setOverrideFont:*(void *)(a1 + 32)];
}

void sub_10001003C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  _Unwind_Resume(a1);
}

void sub_100010544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000106D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010714(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _atomListLineSpacing];
  [v3 setLineSpacing:];
}

void sub_100010768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000107C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000108E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100010F3C(uint64_t a1)
{
  [*(id *)(a1 + 32) _reattachBottomConstraint];
  [*(id *)(a1 + 32) updateConstraintsIfNeeded];
  if (*(unsigned char *)(a1 + 48)) {
    double v2 = 0.0;
  }
  else {
    double v2 = 1.0;
  }
  id v3 = [*(id *)(a1 + 32) captionLabel];
  [v3 setAlpha:v2];

  if (*(unsigned char *)(a1 + 48)) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = [*(id *)(a1 + 32) atomListStackView];
  [v5 setAlpha:v4];

  double v6 = *(void **)(a1 + 40);

  return [v6 playAnimations];
}

void sub_100010FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100010FFC(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) _setRecipientDetailsVisible:0];
  }
  double v4 = *(void **)(a1 + 40);

  return [v4 playCompletions:a2];
}

void sub_10001119C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100011EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10001227C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _bimiLearnMorePressed];
}

void sub_1000122C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100012350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000124BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001264C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1000126A4(uint64_t a1, void *a2)
{
  id v9 = a2;
  unsigned int v3 = [*(id *)(a1 + 32) isEqualToString:@"FromAtomsKey"];
  unsigned int v4 = [*(id *)(a1 + 32) isEqualToString:@"ReplyToAtomsKey"];
  id v5 = "_recipientAtomPressed:";
  if (v3) {
    id v5 = "_senderAtomPressed:";
  }
  if (v4) {
    double v6 = "_replyToAtomPressed:";
  }
  else {
    double v6 = v5;
  }
  [v9 setAddressAtomTarget:*(void *)(a1 + 40) action:v6];
  double v7 = [*(id *)(a1 + 40) font];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 40) font];
    [v9 setOverrideFont:v8];
  }
}

void sub_100012780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001281C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000128B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100012954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000129D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100012DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012E8C(_Unwind_Exception *a1)
{
  unsigned int v4 = v3;

  _Unwind_Resume(a1);
}

id sub_100012EB8(id a1, EDAccount *a2)
{
  double v2 = a2;
  if ([(EDAccount *)v2 conformsToProtocol:&OBJC_PROTOCOL___EDReceivingAccount])
  {
    unsigned int v3 = [(EDAccount *)v2 emailAddresses];
  }
  else
  {
    unsigned int v3 = 0;
  }

  return v3;
}

void sub_100012F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10001302C(uint64_t a1)
{
  [*(id *)(a1 + 32) setMailAccounts:*(void *)(a1 + 40)];
  double v2 = *(void **)(a1 + 32);
  unsigned int v3 = [v2 mailAccounts];
  unsigned int v4 = [v2 _activeNonLocalAccountsWithMailAccounts:v3];
  [*(id *)(a1 + 32) setDisplayedAccounts:v4];

  [*(id *)(a1 + 32) setOrderedAccounts:0];
  [*(id *)(a1 + 32) setFocusedAccounts:0];
  id v5 = [*(id *)(a1 + 48) focusedAccountIdentifiers];
  if ([v5 count])
  {
    double v6 = [*(id *)(a1 + 32) displayedAccounts];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000131B4;
    v8[3] = &unk_10003CE20;
    id v9 = v5;
    double v7 = [v6 ef_filter:v8];
    [*(id *)(a1 + 32) setFocusedAccounts:v7];
  }
  +[MailAccount performOnAccounts:*(void *)(a1 + 40) accountBlock:&stru_10003CE60];
}

void sub_100013178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1000131B4(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  unsigned int v3 = [a2 identifier];
  id v4 = [v2 containsObject:v3];

  return v4;
}

void sub_1000131FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10001320C(id a1, MailAccount *a2)
{
  double v2 = a2;
  if ([(MailAccount *)v2 isActive])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = [(MailAccount *)v2 accountConduit];
    }
    unsigned __int8 v4 = [(MailAccount *)v2 resetSpecialMailboxesCanPostNotifications:0];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

void sub_100013284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1000133C4(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueID];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_100013408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000138D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000138E4(id a1, MailAccount *a2)
{
  double v2 = [(MailAccount *)a2 uniqueID];

  return v2;
}

void sub_100013968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100013978(id a1, MailAccount *a2)
{
  double v2 = [(MailAccount *)a2 uniqueID];

  return v2;
}

void sub_1000139E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100013B70(id a1, MailAccount *a2)
{
  double v2 = a2;
  [(MailAccount *)v2 uniqueIdForPersistentConnection];
  BOOL v3 = PCSettingsGetPollInterval() != -1;

  return v3;
}

void sub_100013BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013D7C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100013EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001438C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014658(_Unwind_Exception *a1)
{
  BOOL v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100014720(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  double v2 = (void *)qword_1000485B0;
  qword_1000485B0 = (uint64_t)v1;
}

void sub_100014790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000147F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001486C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014A60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000152F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *a15, id *location, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,void *a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48,void *a49,void *a50,void *a51,void *a52)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a15);
  objc_destroyWeak(&a43);

  _Unwind_Resume(a1);
}

void sub_10001551C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v21 = a2;
  id v6 = a4;
  double v7 = [v21 avatarView];
  id v8 = [v6 emailAddress];
  id v9 = [*(id *)(a1 + 32) viewModel];
  id v10 = [v9 avatarContext];
  id v11 = [v10 brandIndicatorFuture];
  CGRect v12 = [*(id *)(a1 + 32) contactStore];
  id v13 = [v7 displayPersonForEmailAddress:v8 brandIndicatorFuture:v11 usingContactStore:v12];

  v14 = [v6 emailAddress];
  double v15 = [v14 emailAddressValue];
  int v16 = [v15 displayName];

  v17 = [v21 contactLabel];
  id v18 = [v6 emailAddress];
  v19 = [v18 emailAddressValue];
  if (v16) {
    [v19 displayName];
  }
  else {
  v20 = [v19 stringValue];
  }
  [v17 setText:v20];
}

void sub_1000156E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100015774(uint64_t a1, void *a2)
{
  id v4 = [a2 subjectLabel];
  id v3 = [*(id *)(a1 + 32) _subjectToDisplay];
  [v4 setText:v3];
}

void sub_1000157E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100015800(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v32 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = [v32 nameLabel];
  id v10 = [v8 attachment];
  id v11 = [v10 displayName];
  [v9 setText:v11];

  CGRect v12 = [v32 dateLabel];
  id v13 = [*(id *)(a1 + 32) dateFormatter];
  v14 = *(void **)(a1 + 32);
  double v15 = [v8 attachment];
  int v16 = [v15 url];
  v17 = [v14 _dateToDisplayForURL:v16];
  id v18 = [v13 stringFromDate:v17];
  [v12 setText:v18];

  v19 = [*(id *)(a1 + 32) imageCache];
  v20 = [v8 attachment];
  id v21 = [v20 url];
  v22 = [v19 objectForKey:v21];
  v23 = [v22 first];

  if (v23)
  {
    v24 = [v32 imageView];
    [v24 setImage:v23];
  }
  else
  {
    [*(id *)(a1 + 32) _generateQuickLookThumbnail:v32 indexPath:v7 item:v8];
  }
  if ([*(id *)(a1 + 32) _shouldDisplayContact])
  {
    v25 = [v32 avatarView];
    v26 = *(void **)(a1 + 32);
    v27 = [v8 attachment];
    v28 = [v27 url];
    v29 = [v26 _contactToDisplayForURL:v28];
    v30 = [*(id *)(a1 + 32) contactStore];
    id v31 = [v25 displayPersonForEmailAddress:v29 brandIndicatorFuture:0 usingContactStore:v30];
  }
  else
  {
    v25 = [v32 avatarView];
    [v25 setHidden:1];
  }
}

void sub_100015A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v18 = v12;

  _Unwind_Resume(a1);
}

void sub_100015B68(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v19 = a2;
  id v6 = a4;
  id v7 = [v6 attachment];
  id v8 = [v7 url];
  id v9 = +[NSData dataWithContentsOfURL:v8];
  id v10 = +[UIImage imageWithData:v9];

  id v11 = [v19 imageView];
  [v11 setImage:v10];

  if ([*(id *)(a1 + 32) _shouldDisplayContact])
  {
    CGRect v12 = [v19 avatarView];
    id v13 = *(void **)(a1 + 32);
    v14 = [v6 attachment];
    double v15 = [v14 url];
    int v16 = [v13 _contactToDisplayForURL:v15];
    v17 = [*(id *)(a1 + 32) contactStore];
    id v18 = [v12 displayPersonForEmailAddress:v16 brandIndicatorFuture:0 usingContactStore:v17];
  }
  else
  {
    CGRect v12 = [v19 avatarView];
    [v12 setHidden:1];
  }
}

void sub_100015CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100015D8C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  id v7 = +[UIColor tableCellGroupedBackgroundColor];
  id v8 = [v9 contentView];
  [v8 setBackgroundColor:v7];

  [*(id *)(a1 + 32) _generateRichLink:v9 item:v6];
}

void sub_100015E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100015E5C(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 subject];
  if (v10)
  {
    int v11 = _os_feature_enabled_impl();

    if (v11)
    {
      CGRect v12 = a1 + 4;
LABEL_31:
      v28 = [v7 dequeueConfiguredReusableCellWithRegistration:*v12 forIndexPath:v8 item:v9];
      goto LABEL_32;
    }
  }
  id v13 = [v9 attachment];

  if (!v13)
  {
    v29 = [v9 richLink];

    CGRect v12 = a1 + 8;
    if (v29) {
      CGRect v12 = a1 + 7;
    }
    goto LABEL_31;
  }
  v14 = [v9 attachment];
  double v15 = [v14 url];
  int v16 = [v15 lastPathComponent];
  v17 = [v9 attachment];
  id v18 = [v17 url];
  id v19 = +[UTType em_contentTypeForFilename:v16 fileURL:v18];

  BOOL v20 = v19 == UTTypeJPEG || v19 == UTTypePNG;
  char v26 = v20
     || v19 == UTTypeImage
     || v19 == UTTypeLivePhoto
     || v19 == UTTypeMP3
     || v19 == UTTypeMPEG4Movie
     || v19 == UTTypeMovie;
  BOOL v20 = (v26 & 1) == 0;
  uint64_t v27 = 6;
  if (!v20) {
    uint64_t v27 = 5;
  }
  v28 = [v7 dequeueConfiguredReusableCellWithRegistration:a1[v27] forIndexPath:v8 item:v9];

LABEL_32:

  return v28;
}

void sub_10001608C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000160F4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v14 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = v14;
    id v9 = [WeakRetained sections];
    id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
    int v11 = [v10 sectionName];

    CGRect v12 = [v8 contentConfiguration];
    [v12 setText:v11];
    [v8 setContentConfiguration:v12];
    id v13 = [v8 seeAllButton];
    [v13 setHidden:1];
  }
}

void sub_100016204(_Unwind_Exception *a1)
{
  id v7 = v5;

  _Unwind_Resume(a1);
}

void sub_100016264(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v15 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = v15;
    id v9 = [WeakRetained sections];
    id v10 = [v9 objectAtIndexedSubscript:[v6 section]];
    int v11 = [v10 sectionName];

    CGRect v12 = [v8 contentConfiguration];
    [v12 setText:v11];
    id v13 = [v12 textProperties];
    [v13 setAlignment:0];

    [v8 setContentConfiguration:v12];
    id v14 = [v8 seeAllButton];
    [v14 setHidden:1];
  }
}

void sub_100016390(_Unwind_Exception *a1)
{
  id v7 = v6;

  _Unwind_Resume(a1);
}

id sub_1000163F4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [*(id *)(a1 + 32) sections];
  id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  id v8 = [v7 identifier];
  if ([v8 isEqual:@"Documents"]) {
    goto LABEL_4;
  }
  id v18 = [*(id *)(a1 + 32) sections];
  id v9 = [v18 objectAtIndexedSubscript:[v5 section]];
  id v10 = [v9 identifier];
  if ([v10 isEqual:@"Photos"])
  {

LABEL_4:
LABEL_5:
    int v11 = (void *)(a1 + 48);
    goto LABEL_6;
  }
  v17 = [*(id *)(a1 + 32) sections];
  id v14 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  id v15 = [v14 identifier];
  unsigned __int8 v16 = [v15 isEqual:@"Links"];

  if (v16) {
    goto LABEL_5;
  }
  int v11 = (void *)(a1 + 56);
LABEL_6:
  CGRect v12 = [*(id *)(a1 + 40) dequeueConfiguredReusableSupplementaryViewWithRegistration:*v11 forIndexPath:v5];

  return v12;
}

void sub_1000165A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100016628(void *a1)
{
  if (a1)
  {
    id v80 = objc_alloc_init((Class)NSMutableArray);
    id v1 = objc_alloc_init((Class)NSMutableArray);
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = sub_100019EA4;
    v94[3] = &unk_10003D128;
    id v81 = v80;
    id v95 = v81;
    id v82 = v1;
    id v96 = v82;
    v83 = objc_retainBlock(v94);
    if (_os_feature_enabled_impl())
    {
      double v2 = [a1 viewModel];
      id v3 = [v2 subject];
      id v4 = [v3 subjectString];
      unsigned __int8 v5 = [v4 isEqualToString:&stru_10003D3F8];

      if ((v5 & 1) == 0)
      {
        id v6 = [MFMessageInfoHeaderItem alloc];
        id v7 = +[NSBundle mainBundle];
        id v8 = [v7 localizedStringForKey:@"Subject" value:&stru_10003D3F8 table:0];
        id v9 = [(MFMessageInfoHeaderItem *)v6 initWithName:v8 identifier:@"Subject"];
        [v81 addObject:v9];

        id v10 = [MFMessageInfoItem alloc];
        int v11 = [a1 viewModel];
        CGRect v12 = [v11 subject];
        id v13 = [(MFMessageInfoItem *)v10 initWithSubject:v12];
        v98 = v13;
        id v14 = +[NSArray arrayWithObjects:&v98 count:1];
        [v82 addObject:v14];
      }
    }
    if _os_feature_enabled_impl() && ([a1 _isConversation])
    {
      id v15 = objc_alloc_init((Class)NSMutableArray);
      unsigned __int8 v16 = [a1 viewModel];
      v17 = [v16 senderList];
      [v15 addObjectsFromArray:v17];

      id v18 = [a1 viewModel];
      id v19 = [v18 toList];
      [v15 addObjectsFromArray:v19];

      BOOL v20 = [a1 viewModel];
      id v21 = [v20 replyToList];
      [v15 addObjectsFromArray:v21];

      v22 = [a1 viewModel];
      v23 = [v22 ccList];
      [v15 addObjectsFromArray:v23];

      v24 = [a1 viewModel];
      v25 = [v24 bccList];
      [v15 addObjectsFromArray:v25];

      char v26 = +[NSSet setWithArray:v15];
      uint64_t v27 = [v26 allObjects];
      [a1 setParticipants:v27];

      v28 = [a1 participants];
      v29 = +[NSBundle mainBundle];
      v30 = [v29 localizedStringForKey:@"Participants" value:&stru_10003D3F8 table:0];
      ((void (*)(void *, void *, void *))v83[2])(v83, v28, v30);
    }
    else
    {
      id v31 = [a1 viewModel];
      id v32 = [v31 senderList];
      ((void (*)(void *, void *, const __CFString *))v83[2])(v83, v32, @"From");

      v33 = [a1 viewModel];
      v34 = [v33 toList];
      ((void (*)(void *, void *, const __CFString *))v83[2])(v83, v34, @"To");

      v35 = [a1 viewModel];
      v36 = [v35 replyToList];
      ((void (*)(void *, void *, const __CFString *))v83[2])(v83, v36, @"Reply To");

      v37 = [a1 viewModel];
      v38 = [v37 ccList];
      ((void (*)(void *, void *, const __CFString *))v83[2])(v83, v38, @"CC");

      id v15 = [a1 viewModel];
      v28 = [v15 bccList];
      ((void (*)(void *, void *, const __CFString *))v83[2])(v83, v28, @"BCC");
    }

    if (_os_feature_enabled_impl())
    {
      v39 = [a1 conversationAttachmentURLs];
      BOOL v40 = v39 == 0;

      if (!v40)
      {
        id v87 = objc_alloc_init((Class)NSMutableArray);
        id v88 = objc_alloc_init((Class)NSMutableArray);
        v41 = [a1 conversationAttachmentURLs];
        v93[0] = _NSConcreteStackBlock;
        v93[1] = 3221225472;
        v93[2] = sub_10001A054;
        v93[3] = &unk_10003D150;
        v93[4] = a1;
        v42 = [v41 ef_map:v93];
        [a1 setConversationAttachmentURLs:v42];

        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id obj = [a1 conversationAttachmentURLs];
        id v43 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
        if (v43)
        {
          uint64_t v86 = *(void *)v90;
          do
          {
            for (i = 0; i != v43; i = (char *)i + 1)
            {
              if (*(void *)v90 != v86) {
                objc_enumerationMutation(obj);
              }
              v45 = *(void **)(*((void *)&v89 + 1) + 8 * i);
              v46 = [v45 url];
              v47 = [v46 lastPathComponent];
              v48 = [v45 url];
              v49 = +[UTType em_contentTypeForFilename:v47 fileURL:v48];

              if (v49 == UTTypeJPEG
                || v49 == UTTypePNG
                || v49 == UTTypeImage
                || v49 == UTTypeLivePhoto
                || v49 == UTTypeMP3
                || v49 == UTTypeMPEG4Movie
                || v49 == UTTypeMovie)
              {
                v57 = v87;
              }
              else
              {
                v57 = v88;
              }
              [v57 addObject:v45];
            }
            id v43 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
          }
          while (v43);
        }

        if ([v88 count])
        {
          v58 = [MFMessageInfoHeaderItem alloc];
          v59 = +[NSBundle mainBundle];
          v60 = [v59 localizedStringForKey:@"Documents" value:&stru_10003D3F8 table:0];
          v61 = [(MFMessageInfoHeaderItem *)v58 initWithName:v60 identifier:@"Documents"];
          [v81 addObject:v61];

          v62 = [v88 ef_map:&stru_10003D190];
          [v82 addObject:v62];
        }
        if ([v87 count])
        {
          v63 = [MFMessageInfoHeaderItem alloc];
          v64 = +[NSBundle mainBundle];
          v65 = [v64 localizedStringForKey:@"Photos" value:&stru_10003D3F8 table:0];
          v66 = [(MFMessageInfoHeaderItem *)v63 initWithName:v65 identifier:@"Photos"];
          [v81 addObject:v66];

          v67 = [v87 ef_map:&stru_10003D1B0];
          [v82 addObject:v67];
        }
      }
    }
    if (_os_feature_enabled_impl())
    {
      v68 = [a1 richLinkURLs];
      BOOL v69 = [v68 count] == 0;

      if (!v69)
      {
        v70 = [MFMessageInfoHeaderItem alloc];
        v71 = +[NSBundle mainBundle];
        v72 = [v71 localizedStringForKey:@"Links" value:&stru_10003D3F8 table:0];
        v73 = [(MFMessageInfoHeaderItem *)v70 initWithName:v72 identifier:@"Links"];
        [v81 addObject:v73];

        id v74 = objc_alloc((Class)NSSet);
        v75 = [a1 richLinkURLs];
        id v76 = [v74 initWithArray:v75];
        v77 = [v76 allObjects];
        [a1 setRichLinkURLs:v77];

        v78 = [a1 richLinkURLs];
        v79 = [v78 ef_map:&stru_10003D1F0];

        [v82 addObject:v79];
      }
    }
    [a1 setItems:v82];
    [a1 setSections:v81];
  }
}

void sub_1000170A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,void *a41)
{
  _Unwind_Resume(a1);
}

void sub_100017520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100017550(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!_os_feature_enabled_impl())
  {
    uint64_t v11 = +[NSCollectionLayoutSection sectionWithListConfiguration:*(void *)(a1 + 40) layoutEnvironment:v5];
    goto LABEL_5;
  }
  id v6 = [*(id *)(a1 + 32) sections];
  id v7 = [v6 objectAtIndexedSubscript:a2];
  id v8 = [v7 identifier];
  unsigned int v9 = [v8 isEqual:@"Documents"];

  id v10 = *(void **)(a1 + 32);
  if (v9)
  {
    uint64_t v11 = [v10 _attachmentSectionLayout];
LABEL_5:
    CGRect v12 = (void *)v11;
    goto LABEL_6;
  }
  id v14 = [v10 sections];
  id v15 = [v14 objectAtIndexedSubscript:a2];
  unsigned __int8 v16 = [v15 identifier];
  unsigned int v17 = [v16 isEqual:@"Photos"];

  id v18 = *(void **)(a1 + 32);
  if (v17)
  {
    uint64_t v11 = [v18 _photoSectionLayout];
    goto LABEL_5;
  }
  id v19 = [v18 sections];
  BOOL v20 = [v19 objectAtIndexedSubscript:a2];
  id v21 = [v20 identifier];
  unsigned int v22 = [v21 isEqual:@"Links"];

  if (v22)
  {
    uint64_t v11 = [*(id *)(a1 + 32) _linkSectionLayout];
    goto LABEL_5;
  }
  CGRect v12 = +[NSCollectionLayoutSection sectionWithListConfiguration:*(void *)(a1 + 40) layoutEnvironment:v5];
  [v12 setContentInsets:0.0, 20.0, 0.0, 20.0];
  [v12 _setPostBoundaryPadding:20.0];
  v23 = +[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:@"section-background-element-kind"];
  [v23 setContentInsets:0.0, 20.0, 0.0, 20.0];
  v25 = v23;
  v24 = +[NSArray arrayWithObjects:&v25 count:1];
  [v12 setDecorationItems:v24];

LABEL_6:

  return v12;
}

void sub_1000177C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017B48(_Unwind_Exception *a1)
{
  id v10 = v7;

  _Unwind_Resume(a1);
}

void sub_100017F80(_Unwind_Exception *a1)
{
  id v10 = v7;

  _Unwind_Resume(a1);
}

void sub_1000183C8(_Unwind_Exception *a1)
{
  id v10 = v7;

  _Unwind_Resume(a1);
}

void sub_1000187F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100018A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100018A6C(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5) {
    goto LABEL_3;
  }
  id v7 = [a1[4] imageCache];
  id v8 = [a1[5] attachment];
  unsigned int v9 = [v8 url];
  id v10 = [v7 objectForKey:v9];

  if (!v10)
  {
    CGRect v12 = [v5 UIImage];
    id v13 = [v12 imageByPreparingForDisplay];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018C4C;
    block[3] = &unk_10003D070;
    id v16 = a1[6];
    id v17 = a1[5];
    id v18 = v13;
    id v19 = a1[4];
    id v14 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
LABEL_3:
    uint64_t v11 = [v6 localizedDescription];
    NSLog(@"Thumbnail generation failed with error: %@", v11);
  }
}

void sub_100018C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018C4C(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) nameLabel];
  double v2 = [v14 text];
  id v3 = [*(id *)(a1 + 40) attachment];
  id v4 = [v3 displayName];

  if (v2 == v4)
  {
    [*(id *)(a1 + 48) size];
    double v6 = v5;
    [*(id *)(a1 + 48) size];
    double v8 = v6 / v7;
    [*(id *)(a1 + 32) setImage:*(void *)(a1 + 48) withAspectRatio:v8];
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = *(void **)(*(void *)(a1 + 56) + 136);
    id v15 = +[NSNumber numberWithDouble:v8];
    uint64_t v11 = +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v9);
    CGRect v12 = [*(id *)(a1 + 40) attachment];
    id v13 = [v12 url];
    [v10 setObject:v11 forKey:v13];
  }
}

void sub_100018DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v10;

  _Unwind_Resume(a1);
}

void sub_100018E84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100019074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000193B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

BOOL sub_100019474(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 value];
  double v5 = [v4 emailAddressValue];

  if (v5)
  {
    double v6 = [v3 value];
    double v7 = [v6 emailAddressValue];
    BOOL v8 = [v7 compare:*(void *)(a1 + 32)] == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void sub_10001950C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100019A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100019AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019EA4(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if ([v12 count])
  {
    double v6 = *(void **)(a1 + 32);
    double v7 = [MFMessageInfoHeaderItem alloc];
    BOOL v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:v5 value:&stru_10003D3F8 table:0];
    id v10 = [(MFMessageInfoHeaderItem *)v7 initWithName:v9 identifier:v5];
    [v6 addObject:v10];

    uint64_t v11 = [v12 ef_map:&stru_10003D100];
    [*(id *)(a1 + 40) addObject:v11];
  }
}

void sub_100019FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100019FF0(id a1, ECEmailAddressConvertible *a2)
{
  double v2 = a2;
  id v3 = [[MFMessageInfoItem alloc] initWithEmail:v2];

  return v3;
}

void sub_10001A044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001A054(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 url];
  double v6 = [v4 _URLForAttachmentURL:v5];
  double v7 = [v3 displayName];
  BOOL v8 = +[EMAttachmentData attachmentWithURL:v6 displayName:v7];

  return v8;
}

void sub_10001A104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001A138(id a1, EMAttachmentData *a2)
{
  double v2 = a2;
  id v3 = [[MFMessageInfoItem alloc] initWithAttachment:v2];

  return v3;
}

void sub_10001A18C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001A19C(id a1, EMAttachmentData *a2)
{
  double v2 = a2;
  id v3 = [[MFMessageInfoItem alloc] initWithAttachment:v2];

  return v3;
}

void sub_10001A1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001A200(id a1, NSURL *a2)
{
  double v2 = a2;
  id v3 = [[MFMessageInfoItem alloc] initWithRichLink:v2];

  return v3;
}

void sub_10001A254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A868(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10001AA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

UIFont *sub_10001AA2C(uint64_t a1)
{
  return +[UIFont fontWithDescriptor:*(void *)(a1 + 32) size:0.0];
}

void sub_10001AB54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_10001AB68(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) titleFont];
  [v1 _scaledValueForValue:20.0];
  double v3 = v2;

  return v3;
}

void sub_10001ABB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_10001ABC0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) titleFont];
  [v1 _scaledValueForValue:11.0];
  double v3 = v2;

  return v3;
}

void sub_10001AC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001AF30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10001B8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_10001B94C()
{
  v0 = [(id)objc_opt_class() titleFont];
  [v0 _scaledValueForValue:20.0];
  double v2 = v1;

  return v2;
}

void sub_10001B998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_10001B9A8()
{
  v0 = [(id)objc_opt_class() titleFont];
  [v0 _scaledValueForValue:11.0];
  double v2 = v1;

  return v2;
}

void sub_10001B9F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BA80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10001BB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001BC78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001BDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C5B4(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  double v2 = (void *)qword_1000485C0;
  qword_1000485C0 = (uint64_t)v1;
}

void sub_10001C624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001CAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001CE70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001CF38(void *a1, int a2)
{
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D078;
    block[3] = &unk_10003D288;
    uint64_t v3 = a1[6];
    void block[4] = a1[4];
    block[5] = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v4 = MSUserNotificationsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device is locked, creating unlock context policy", buf, 2u);
    }

    uint64_t v6 = a1[4];
    uint64_t v5 = a1[5];
    double v7 = *(void **)(v6 + 88);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001D084;
    v9[3] = &unk_10003D2D8;
    uint64_t v8 = a1[6];
    v9[4] = v6;
    v9[5] = v8;
    [v7 evaluatePolicy:2 options:v5 reply:v9];
  }
}

id sub_10001D078(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureMessageRequestWithSignPostID:*(void *)(a1 + 40)];
}

void sub_10001D084(uint64_t a1, void *a2, void *a3)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001D14C;
  v8[3] = &unk_10003D2B0;
  id v9 = a2;
  id v10 = a3;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = v5;
  id v6 = v10;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

void sub_10001D14C(uint64_t a1)
{
  double v2 = MSUserNotificationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v15 = 138412546;
    id v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Policy evaluation finshed with results: %@. Error: %@", (uint8_t *)&v15, 0x16u);
  }

  uint64_t v5 = *(void **)(a1 + 48);
  if (*(void *)(a1 + 40))
  {
    [v5 setError:];
    id v6 = +[MFNotificationViewController signpostLog];
    id v7 = v6;
    os_signpost_id_t v8 = *(void *)(a1 + 56);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      id v9 = [*(id *)(a1 + 40) code];
      int v15 = 134349056;
      id v16 = v9;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, v8, "MFNotificationPreview", "Authentication Failure %{public, name=errorCode}lu", (uint8_t *)&v15, 0xCu);
    }

    id v10 = MSUserNotificationsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void **)(a1 + 40);
      int v15 = 138412290;
      id v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Policy evaluation failed with error: %@", (uint8_t *)&v15, 0xCu);
    }

    id v13 = *(void **)(a1 + 48);
    uint64_t v12 = a1 + 48;
    [v13 _resetMessageListAndPromise];
    id v14 = *(void **)(*(void *)v12 + 88);
    *(void *)(*(void *)v12 + 88) = 0;
  }
  else
  {
    [v5 _configureMessageRequestWithSignPostID:*(void *)(a1 + 56)];
  }
}

void sub_10001D310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

id sub_10001D564(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[EMMessage predicateForMessageWithObjectID:a2];
  id v4 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v3 sortDescriptors:&__NSArray0__struct queryOptions:8 label:@"MFMessageNotificationPreview"];
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v5 daemonInterface];
  id v7 = [v6 messageRepository];
  os_signpost_id_t v8 = [v5 _configureMessageListAndPromiseForQuery:v4 repository:v7];

  id v9 = [v8 future];

  return v9;
}

void sub_10001D65C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10001D6A0(uint64_t a1, void *a2)
{
  id v54 = a2;
  uint64_t v3 = MSUserNotificationsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v54 ef_publicDescription];
    *(_DWORD *)buf = 138412290;
    v56 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Retreived message. Launching notification view: %@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setProgressUIVisible:0 animated:1];
  id v6 = [WeakRetained view];
  [v6 frame];
  double v8 = v7;
  [WeakRetained screenHeight];
  double v10 = v9;

  [WeakRetained setPreferredContentSize:v8, v10];
  uint64_t v11 = objc_alloc_init(MFMailAccountsProvider);
  [WeakRetained setAccountsProvider:v11];

  [WeakRetained setActionsForMessage:v54];
  id v53 = objc_alloc_init((Class)CNContactStore);
  uint64_t v12 = [MFConversationItemHeaderBlock alloc];
  id v13 = [WeakRetained accountsProvider];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  __int16 v17 = -[MFConversationItemHeaderBlock initWithFrame:contactStore:accountsProvider:](v12, "initWithFrame:contactStore:accountsProvider:", v53, v13, CGRectZero.origin.x, y, width, height);

  [(MFConversationItemHeaderBlock *)v17 setDisplayOptions:12];
  v52 = -[MessageHeaderSubjectBlock initWithFrame:]([MessageHeaderSubjectBlock alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  id v18 = [objc_alloc((Class)MFMessageContentView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v18 setDelegate:WeakRetained];
  id v19 = [WeakRetained daemonInterface];
  [v18 setDaemonInterface:v19];

  BOOL v20 = [WeakRetained brandIndicatorProvider];
  [v18 setBrandIndicatorProvider:v20];

  v59[0] = v17;
  v59[1] = v52;
  id v21 = +[NSArray arrayWithObjects:v59 count:2];
  unsigned int v22 = [v18 headerView];
  [v22 setHeaderBlocks:v21];

  [v18 setShowsBanners:1];
  id v23 = [objc_alloc((Class)MessageContentRepresentationRequest) initWithMessage:v54];
  [v18 setContentRequest:v23];
  v24 = [v18 contentRequest];
  v25 = [v24 waitForResult];

  if (v25)
  {
    char v26 = [v18 headerView];
    [v26 layoutIfNeeded];

    uint64_t v27 = [WeakRetained traitCollection];
    [WeakRetained minMargins];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    [v18 safeAreaInsets];
    BOOL v40 = +[MFMessageDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:](MFMessageDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:", v27, 0, v29, v31, v33, v35, v36, v37, v38, v39);

    [WeakRetained screenHeight];
    [v18 setFrame:0.0, 0.0, v8, v41 + v41];
    [v18 setDisplayMetrics:v40];
    v42 = MSUserNotificationsLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      id v43 = [WeakRetained messageList];
      v44 = [WeakRetained messageReferenceURL];
      *(_DWORD *)buf = 134218242;
      v56 = v43;
      __int16 v57 = 2112;
      v58 = v44;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: successfully displayed message for URL %@", buf, 0x16u);
    }
    v45 = [WeakRetained view];
    [v45 addSubview:v18];

    v46 = +[MFNotificationViewController signpostLog];
    v47 = v46;
    os_signpost_id_t v48 = *(void *)(a1 + 40);
    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, v48, "MFNotificationPreview", "Success", buf, 2u);
    }

    [WeakRetained _resetMessageListAndPromise];
    v49 = (void *)WeakRetained[11];
    WeakRetained[11] = 0;
  }
  else
  {
    v50 = [v54 itemID];
    v51 = +[NSError em_itemNotFoundErrorWithItemID:v50];
    [WeakRetained setError:v51];

    BOOL v40 = [WeakRetained error];
    [WeakRetained _notificationPreviewFailedWithError:v40 singpostID:*(void *)(a1 + 40)];
  }
}

void sub_10001DC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_10001DD90(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _notificationPreviewFailedWithError:a2 singpostID:*(void *)(a1 + 40)];
}

void sub_10001DF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E27C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001E678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001E9D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001EBF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001ECB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_10001EDE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001EF1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F218(_Unwind_Exception *a1)
{
  double v7 = v4;

  _Unwind_Resume(a1);
}

void sub_10001F53C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F5F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001FC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_10001FDFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001FE28()
{
  v0 = (void *)qword_1000485D8;
  if (!qword_1000485D8)
  {
    v4[0] = SwipeActionNone;
    v4[1] = SwipeActionRead;
    v5[0] = &off_10003E070;
    v5[1] = &off_10003E088;
    v4[2] = SwipeActionFlag;
    v4[3] = SwipeActionMove;
    v5[2] = &off_10003E0A0;
    v5[3] = &off_10003E0B8;
    v4[4] = SwipeActionTrash;
    v4[5] = SwipeActionArchive;
    v5[4] = &off_10003E0D0;
    v5[5] = &off_10003E0E8;
    v4[6] = SwipeActionAlternateDestructiveAction;
    v5[6] = &off_10003E100;
    uint64_t v1 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
    double v2 = (void *)qword_1000485D8;
    qword_1000485D8 = v1;

    v0 = (void *)qword_1000485D8;
  }

  return v0;
}

void sub_100020018(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

id MFConversationReferenceFromHash(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"%@://conversation/%lld", EMAppleMailURLScheme, a1];
    double v2 = +[NSURL URLWithString:v1];
  }
  else
  {
    double v2 = 0;
  }

  return v2;
}

void sub_1000200E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFDocumentReferenceFromDocumentID(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSURLComponents);
  [v2 setScheme:EMAppleMailURLScheme];
  [v2 setHost:@"document"];
  uint64_t v3 = +[NSString stringWithFormat:@"/%@", v1];
  [v2 setPath:v3];

  id v4 = [v2 URL];

  return v4;
}

void sub_1000201B0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100020338(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_100020428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002054C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000205D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020668(id a1)
{
  id v3 = +[NSBundle mainBundle];
  uint64_t v1 = [v3 bundleIdentifier];
  id v2 = (void *)qword_1000485E0;
  qword_1000485E0 = v1;
}

void sub_1000206CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000208F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getMailPreferenceValueWithDefault(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = +[NSUserDefaults em_userDefaults];
  id v6 = [v5 valueForKey:v3];

  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

void sub_100020B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id rightSwipeSetting(int a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000485F8);
  id v2 = (id)qword_1000485F0;
  id v3 = v2;
  if (v2) {
    BOOL v4 = a1 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    uint64_t v5 = v2;
  }
  else
  {
    uint64_t v5 = getMailPreferenceValueWithDefault(RightSwipeActionKey, SwipeActionRead);

    if ((void *)qword_1000485F0 != v5) {
      objc_storeStrong((id *)&qword_1000485F0, v5);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000485F8);

  return v5;
}

void sub_100020C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

UIUserInterfaceLayoutDirection sub_100020D14(uint64_t a1)
{
  UIUserInterfaceLayoutDirection result = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [*(id *)(a1 + 32) semanticContentAttribute]);
  byte_100048600 = result == UIUserInterfaceLayoutDirectionRightToLeft;
  return result;
}

void sub_100020F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100021010(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Unable to generate avatar image for missing context %p avatarGenerator %p", (uint8_t *)&v3, 0x16u);
}

void sub_100021098(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to find contact: %@, using key descriptors: %@", buf, 0x16u);
}

void sub_100021100(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "NotificationPreview: self.systemMinimumLayoutMargins is not correct. what we got is %@", buf, 0xCu);
}

void sub_100021158(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "NotificationPreview: %@", buf, 0xCu);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t EFPerformSyncWithProtectedDataAvailability()
{
  return _EFPerformSyncWithProtectedDataAvailability();
}

uint64_t EMBlackPearlIsFeatureEnabled()
{
  return _EMBlackPearlIsFeatureEnabled();
}

uint64_t MFEdgeInsetsFromDirectionalEdgeInsets()
{
  return _MFEdgeInsetsFromDirectionalEdgeInsets();
}

uint64_t MFLogGeneral()
{
  return _MFLogGeneral();
}

uint64_t MSUserNotificationsLog()
{
  return _MSUserNotificationsLog();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return _NSStringFromSize(aSize);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return _NSStringFromUIEdgeInsets(insets);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PCSettingsGetPollInterval()
{
  return _PCSettingsGetPollInterval();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

uint64_t UIRoundToViewScale()
{
  return _UIRoundToViewScale();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _EFLocalizedString()
{
  return __EFLocalizedString();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_main_np(void)
{
  return _pthread_main_np();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return [a1 CGSizeValue];
}

id objc_msgSend_UIEdgeInsetsValue(void *a1, const char *a2, ...)
{
  return [a1 UIEdgeInsetsValue];
}

id objc_msgSend_UIImage(void *a1, const char *a2, ...)
{
  return [a1 UIImage];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__addMessageInfoButton(void *a1, const char *a2, ...)
{
  return [a1 _addMessageInfoButton];
}

id objc_msgSend__atomListLineSpacing(void *a1, const char *a2, ...)
{
  return [a1 _atomListLineSpacing];
}

id objc_msgSend__attachmentSectionLayout(void *a1, const char *a2, ...)
{
  return [a1 _attachmentSectionLayout];
}

id objc_msgSend__bimiLearnMorePressed(void *a1, const char *a2, ...)
{
  return [a1 _bimiLearnMorePressed];
}

id objc_msgSend__clearAvatarViewConstraints(void *a1, const char *a2, ...)
{
  return [a1 _clearAvatarViewConstraints];
}

id objc_msgSend__clearTimestampRevealActionsButtonConstraints(void *a1, const char *a2, ...)
{
  return [a1 _clearTimestampRevealActionsButtonConstraints];
}

id objc_msgSend__configureTimestampRevealActionsButtonConstraints(void *a1, const char *a2, ...)
{
  return [a1 _configureTimestampRevealActionsButtonConstraints];
}

id objc_msgSend__contextForDDDetectionController(void *a1, const char *a2, ...)
{
  return [a1 _contextForDDDetectionController];
}

id objc_msgSend__createPrimaryViews(void *a1, const char *a2, ...)
{
  return [a1 _createPrimaryViews];
}

id objc_msgSend__displayOptionsHideAvatar(void *a1, const char *a2, ...)
{
  return [a1 _displayOptionsHideAvatar];
}

id objc_msgSend__displayedAccountsIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _displayedAccountsIdentifiers];
}

id objc_msgSend__errorLabel(void *a1, const char *a2, ...)
{
  return [a1 _errorLabel];
}

id objc_msgSend__focusedAccountsIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _focusedAccountsIdentifiers];
}

id objc_msgSend__footnoteFont(void *a1, const char *a2, ...)
{
  return [a1 _footnoteFont];
}

id objc_msgSend__hasConversationLayout(void *a1, const char *a2, ...)
{
  return [a1 _hasConversationLayout];
}

id objc_msgSend__initializePrimaryLayoutConstraints(void *a1, const char *a2, ...)
{
  return [a1 _initializePrimaryLayoutConstraints];
}

id objc_msgSend__isConversation(void *a1, const char *a2, ...)
{
  return [a1 _isConversation];
}

id objc_msgSend__linkSectionLayout(void *a1, const char *a2, ...)
{
  return [a1 _linkSectionLayout];
}

id objc_msgSend__photoSectionLayout(void *a1, const char *a2, ...)
{
  return [a1 _photoSectionLayout];
}

id objc_msgSend__reattachBottomConstraint(void *a1, const char *a2, ...)
{
  return [a1 _reattachBottomConstraint];
}

id objc_msgSend__registerNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerNotifications];
}

id objc_msgSend__resetHorizontalStatusIndicatorContentViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _resetHorizontalStatusIndicatorContentViewIfNeeded];
}

id objc_msgSend__resetMessageListAndPromise(void *a1, const char *a2, ...)
{
  return [a1 _resetMessageListAndPromise];
}

id objc_msgSend__shouldDisplayContact(void *a1, const char *a2, ...)
{
  return [a1 _shouldDisplayContact];
}

id objc_msgSend__shouldHideAvatar(void *a1, const char *a2, ...)
{
  return [a1 _shouldHideAvatar];
}

id objc_msgSend__shouldHideDetailsButton(void *a1, const char *a2, ...)
{
  return [a1 _shouldHideDetailsButton];
}

id objc_msgSend__shouldSaveHeaderDetailsButtonSettings(void *a1, const char *a2, ...)
{
  return [a1 _shouldSaveHeaderDetailsButtonSettings];
}

id objc_msgSend__shouldUseFootnoteFontInCaptionView(void *a1, const char *a2, ...)
{
  return [a1 _shouldUseFootnoteFontInCaptionView];
}

id objc_msgSend__subheadFont(void *a1, const char *a2, ...)
{
  return [a1 _subheadFont];
}

id objc_msgSend__subjectFont(void *a1, const char *a2, ...)
{
  return [a1 _subjectFont];
}

id objc_msgSend__subjectMaxOffset(void *a1, const char *a2, ...)
{
  return [a1 _subjectMaxOffset];
}

id objc_msgSend__subjectToDisplay(void *a1, const char *a2, ...)
{
  return [a1 _subjectToDisplay];
}

id objc_msgSend__updateAvatarView(void *a1, const char *a2, ...)
{
  return [a1 _updateAvatarView];
}

id objc_msgSend__updateDisplayedContact(void *a1, const char *a2, ...)
{
  return [a1 _updateDisplayedContact];
}

id objc_msgSend__updateFonts(void *a1, const char *a2, ...)
{
  return [a1 _updateFonts];
}

id objc_msgSend__updateLabelColor(void *a1, const char *a2, ...)
{
  return [a1 _updateLabelColor];
}

id objc_msgSend__updateMailboxIcon(void *a1, const char *a2, ...)
{
  return [a1 _updateMailboxIcon];
}

id objc_msgSend__updateStackViewSpacing(void *a1, const char *a2, ...)
{
  return [a1 _updateStackViewSpacing];
}

id objc_msgSend__updateStyle(void *a1, const char *a2, ...)
{
  return [a1 _updateStyle];
}

id objc_msgSend__updateSubjectText(void *a1, const char *a2, ...)
{
  return [a1 _updateSubjectText];
}

id objc_msgSend__updateSubviewConstraints(void *a1, const char *a2, ...)
{
  return [a1 _updateSubviewConstraints];
}

id objc_msgSend__updateTimestampLabels(void *a1, const char *a2, ...)
{
  return [a1 _updateTimestampLabels];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountConduit(void *a1, const char *a2, ...)
{
  return [a1 accountConduit];
}

id objc_msgSend_accountsProvider(void *a1, const char *a2, ...)
{
  return [a1 accountsProvider];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_activeTimestampLabelConstraints(void *a1, const char *a2, ...)
{
  return [a1 activeTimestampLabelConstraints];
}

id objc_msgSend_addressAtoms(void *a1, const char *a2, ...)
{
  return [a1 addressAtoms];
}

id objc_msgSend_addressBook(void *a1, const char *a2, ...)
{
  return [a1 addressBook];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return [a1 arrangedSubviews];
}

id objc_msgSend_atomListStackView(void *a1, const char *a2, ...)
{
  return [a1 atomListStackView];
}

id objc_msgSend_atomManager(void *a1, const char *a2, ...)
{
  return [a1 atomManager];
}

id objc_msgSend_attachment(void *a1, const char *a2, ...)
{
  return [a1 attachment];
}

id objc_msgSend_avatarContext(void *a1, const char *a2, ...)
{
  return [a1 avatarContext];
}

id objc_msgSend_avatarDiameter(void *a1, const char *a2, ...)
{
  return [a1 avatarDiameter];
}

id objc_msgSend_avatarGenerator(void *a1, const char *a2, ...)
{
  return [a1 avatarGenerator];
}

id objc_msgSend_avatarTopConstraint(void *a1, const char *a2, ...)
{
  return [a1 avatarTopConstraint];
}

id objc_msgSend_avatarView(void *a1, const char *a2, ...)
{
  return [a1 avatarView];
}

id objc_msgSend_avatarViewConstraints(void *a1, const char *a2, ...)
{
  return [a1 avatarViewConstraints];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return [a1 backgroundView];
}

id objc_msgSend_baselineToBaselineSpacing(void *a1, const char *a2, ...)
{
  return [a1 baselineToBaselineSpacing];
}

id objc_msgSend_baselineToBaselineSpacingInConversation(void *a1, const char *a2, ...)
{
  return [a1 baselineToBaselineSpacingInConversation];
}

id objc_msgSend_bccList(void *a1, const char *a2, ...)
{
  return [a1 bccList];
}

id objc_msgSend_bimiStackView(void *a1, const char *a2, ...)
{
  return [a1 bimiStackView];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bottomConstraint(void *a1, const char *a2, ...)
{
  return [a1 bottomConstraint];
}

id objc_msgSend_bottomToAvatarBottomConstraint(void *a1, const char *a2, ...)
{
  return [a1 bottomToAvatarBottomConstraint];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_brandIndicatorFuture(void *a1, const char *a2, ...)
{
  return [a1 brandIndicatorFuture];
}

id objc_msgSend_brandIndicatorProvider(void *a1, const char *a2, ...)
{
  return [a1 brandIndicatorProvider];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_captionLabel(void *a1, const char *a2, ...)
{
  return [a1 captionLabel];
}

id objc_msgSend_captionLabelTrailingConstraint(void *a1, const char *a2, ...)
{
  return [a1 captionLabelTrailingConstraint];
}

id objc_msgSend_captionView(void *a1, const char *a2, ...)
{
  return [a1 captionView];
}

id objc_msgSend_ccList(void *a1, const char *a2, ...)
{
  return [a1 ccList];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return [a1 constraints];
}

id objc_msgSend_contactAvatarView(void *a1, const char *a2, ...)
{
  return [a1 contactAvatarView];
}

id objc_msgSend_contactLabel(void *a1, const char *a2, ...)
{
  return [a1 contactLabel];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return [a1 contactStore];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 contentConfiguration];
}

id objc_msgSend_contentRequest(void *a1, const char *a2, ...)
{
  return [a1 contentRequest];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_conversationAttachmentURLs(void *a1, const char *a2, ...)
{
  return [a1 conversationAttachmentURLs];
}

id objc_msgSend_conversationID(void *a1, const char *a2, ...)
{
  return [a1 conversationID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createCollectionViewLayout(void *a1, const char *a2, ...)
{
  return [a1 createCollectionViewLayout];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_daemonInterface(void *a1, const char *a2, ...)
{
  return [a1 daemonInterface];
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return [a1 databaseID];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return [a1 dateFormatter];
}

id objc_msgSend_dateLabel(void *a1, const char *a2, ...)
{
  return [a1 dateLabel];
}

id objc_msgSend_dateSent(void *a1, const char *a2, ...)
{
  return [a1 dateSent];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultContentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultContentConfiguration];
}

id objc_msgSend_defaultFont(void *a1, const char *a2, ...)
{
  return [a1 defaultFont];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeys];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayMetrics(void *a1, const char *a2, ...)
{
  return [a1 displayMetrics];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayOptions(void *a1, const char *a2, ...)
{
  return [a1 displayOptions];
}

id objc_msgSend_displayedAccounts(void *a1, const char *a2, ...)
{
  return [a1 displayedAccounts];
}

id objc_msgSend_displayedContact(void *a1, const char *a2, ...)
{
  return [a1 displayedContact];
}

id objc_msgSend_documentID(void *a1, const char *a2, ...)
{
  return [a1 documentID];
}

id objc_msgSend_dotIndicatorImage(void *a1, const char *a2, ...)
{
  return [a1 dotIndicatorImage];
}

id objc_msgSend_effectiveIndicatorOptions(void *a1, const char *a2, ...)
{
  return [a1 effectiveIndicatorOptions];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return [a1 emailAddress];
}

id objc_msgSend_emailAddressValue(void *a1, const char *a2, ...)
{
  return [a1 emailAddressValue];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_externalID(void *a1, const char *a2, ...)
{
  return [a1 externalID];
}

id objc_msgSend_fileTitle(void *a1, const char *a2, ...)
{
  return [a1 fileTitle];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return [a1 first];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstBaselineConstraint(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineConstraint];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return [a1 firstIndex];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstSeparatorToSubjectBaseline(void *a1, const char *a2, ...)
{
  return [a1 firstSeparatorToSubjectBaseline];
}

id objc_msgSend_flagColors(void *a1, const char *a2, ...)
{
  return [a1 flagColors];
}

id objc_msgSend_flagShapeImage(void *a1, const char *a2, ...)
{
  return [a1 flagShapeImage];
}

id objc_msgSend_focusedAccountIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 focusedAccountIdentifiers];
}

id objc_msgSend_focusedAccounts(void *a1, const char *a2, ...)
{
  return [a1 focusedAccounts];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return [a1 handle];
}

id objc_msgSend_hasAttachments(void *a1, const char *a2, ...)
{
  return [a1 hasAttachments];
}

id objc_msgSend_hasBeenPersisted(void *a1, const char *a2, ...)
{
  return [a1 hasBeenPersisted];
}

id objc_msgSend_hasCompactLayout(void *a1, const char *a2, ...)
{
  return [a1 hasCompactLayout];
}

id objc_msgSend_headerBottomPadding(void *a1, const char *a2, ...)
{
  return [a1 headerBottomPadding];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return [a1 headerView];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_horizontalStatusIndicatorContentView(void *a1, const char *a2, ...)
{
  return [a1 horizontalStatusIndicatorContentView];
}

id objc_msgSend_horizontalStatusIndicatorManager(void *a1, const char *a2, ...)
{
  return [a1 horizontalStatusIndicatorManager];
}

id objc_msgSend_iconImageView(void *a1, const char *a2, ...)
{
  return [a1 iconImageView];
}

id objc_msgSend_iconVerticalConstraint(void *a1, const char *a2, ...)
{
  return [a1 iconVerticalConstraint];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageByPreparingForDisplay(void *a1, const char *a2, ...)
{
  return [a1 imageByPreparingForDisplay];
}

id objc_msgSend_imageCache(void *a1, const char *a2, ...)
{
  return [a1 imageCache];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_indicatorOptions(void *a1, const char *a2, ...)
{
  return [a1 indicatorOptions];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interactivelyResizing(void *a1, const char *a2, ...)
{
  return [a1 interactivelyResizing];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAnimated(void *a1, const char *a2, ...)
{
  return [a1 isAnimated];
}

id objc_msgSend_isAuthorizedToUseContacts(void *a1, const char *a2, ...)
{
  return [a1 isAuthorizedToUseContacts];
}

id objc_msgSend_isBIMIVerified(void *a1, const char *a2, ...)
{
  return [a1 isBIMIVerified];
}

id objc_msgSend_isBlockedSender(void *a1, const char *a2, ...)
{
  return [a1 isBlockedSender];
}

id objc_msgSend_isDisplayingMessage(void *a1, const char *a2, ...)
{
  return [a1 isDisplayingMessage];
}

id objc_msgSend_isDisplayingMultipleAccounts(void *a1, const char *a2, ...)
{
  return [a1 isDisplayingMultipleAccounts];
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return [a1 isExpanded];
}

id objc_msgSend_isFlagged(void *a1, const char *a2, ...)
{
  return [a1 isFlagged];
}

id objc_msgSend_isForwarded(void *a1, const char *a2, ...)
{
  return [a1 isForwarded];
}

id objc_msgSend_isMute(void *a1, const char *a2, ...)
{
  return [a1 isMute];
}

id objc_msgSend_isNotify(void *a1, const char *a2, ...)
{
  return [a1 isNotify];
}

id objc_msgSend_isOutgoing(void *a1, const char *a2, ...)
{
  return [a1 isOutgoing];
}

id objc_msgSend_isRTL(void *a1, const char *a2, ...)
{
  return [a1 isRTL];
}

id objc_msgSend_isRead(void *a1, const char *a2, ...)
{
  return [a1 isRead];
}

id objc_msgSend_isReplied(void *a1, const char *a2, ...)
{
  return [a1 isReplied];
}

id objc_msgSend_isVIP(void *a1, const char *a2, ...)
{
  return [a1 isVIP];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return [a1 itemID];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastBaseLineDeceptionLabel(void *a1, const char *a2, ...)
{
  return [a1 lastBaseLineDeceptionLabel];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_lastBaselineConstraint(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineConstraint];
}

id objc_msgSend_lastBaselineLabelConstraint(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineLabelConstraint];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return [a1 layoutFrame];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkTextAttributes(void *a1, const char *a2, ...)
{
  return [a1 linkTextAttributes];
}

id objc_msgSend_linkView(void *a1, const char *a2, ...)
{
  return [a1 linkView];
}

id objc_msgSend_listSpacing(void *a1, const char *a2, ...)
{
  return [a1 listSpacing];
}

id objc_msgSend_loadingView(void *a1, const char *a2, ...)
{
  return [a1 loadingView];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_mailAccounts(void *a1, const char *a2, ...)
{
  return [a1 mailAccounts];
}

id objc_msgSend_mailComposeTextViewBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 mailComposeTextViewBackgroundColor];
}

id objc_msgSend_mailExpandedConversationViewCellDateLabelColor(void *a1, const char *a2, ...)
{
  return [a1 mailExpandedConversationViewCellDateLabelColor];
}

id objc_msgSend_mailMessageListSelectedStatusIndicatorColor(void *a1, const char *a2, ...)
{
  return [a1 mailMessageListSelectedStatusIndicatorColor];
}

id objc_msgSend_mailSubtitleGrayColor(void *a1, const char *a2, ...)
{
  return [a1 mailSubtitleGrayColor];
}

id objc_msgSend_mailbox(void *a1, const char *a2, ...)
{
  return [a1 mailbox];
}

id objc_msgSend_mailboxes(void *a1, const char *a2, ...)
{
  return [a1 mailboxes];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return [a1 mainThreadScheduler];
}

id objc_msgSend_margins(void *a1, const char *a2, ...)
{
  return [a1 margins];
}

id objc_msgSend_messageBottomPaddingInConversation(void *a1, const char *a2, ...)
{
  return [a1 messageBottomPaddingInConversation];
}

id objc_msgSend_messageDisplayPromise(void *a1, const char *a2, ...)
{
  return [a1 messageDisplayPromise];
}

id objc_msgSend_messageInfoButton(void *a1, const char *a2, ...)
{
  return [a1 messageInfoButton];
}

id objc_msgSend_messageList(void *a1, const char *a2, ...)
{
  return [a1 messageList];
}

id objc_msgSend_messageReferenceURL(void *a1, const char *a2, ...)
{
  return [a1 messageReferenceURL];
}

id objc_msgSend_messageRepository(void *a1, const char *a2, ...)
{
  return [a1 messageRepository];
}

id objc_msgSend_midXToMidXSpacing(void *a1, const char *a2, ...)
{
  return [a1 midXToMidXSpacing];
}

id objc_msgSend_minHorizontalSpacing(void *a1, const char *a2, ...)
{
  return [a1 minHorizontalSpacing];
}

id objc_msgSend_minMargins(void *a1, const char *a2, ...)
{
  return [a1 minMargins];
}

id objc_msgSend_modelObservable(void *a1, const char *a2, ...)
{
  return [a1 modelObservable];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nameLabel(void *a1, const char *a2, ...)
{
  return [a1 nameLabel];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_numberOfActiveAccounts(void *a1, const char *a2, ...)
{
  return [a1 numberOfActiveAccounts];
}

id objc_msgSend_numberOfInactiveAccounts(void *a1, const char *a2, ...)
{
  return [a1 numberOfInactiveAccounts];
}

id objc_msgSend_numberOfMessagesInConversation(void *a1, const char *a2, ...)
{
  return [a1 numberOfMessagesInConversation];
}

id objc_msgSend_observableCancelable(void *a1, const char *a2, ...)
{
  return [a1 observableCancelable];
}

id objc_msgSend_participantDictionary(void *a1, const char *a2, ...)
{
  return [a1 participantDictionary];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return [a1 participants];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_placeHolderView(void *a1, const char *a2, ...)
{
  return [a1 placeHolderView];
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 plainButtonConfiguration];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_primaryAtomList(void *a1, const char *a2, ...)
{
  return [a1 primaryAtomList];
}

id objc_msgSend_primaryStackView(void *a1, const char *a2, ...)
{
  return [a1 primaryStackView];
}

id objc_msgSend_primaryStackViewLeadingConstraint(void *a1, const char *a2, ...)
{
  return [a1 primaryStackViewLeadingConstraint];
}

id objc_msgSend_promise(void *a1, const char *a2, ...)
{
  return [a1 promise];
}

id objc_msgSend_receivedDate(void *a1, const char *a2, ...)
{
  return [a1 receivedDate];
}

id objc_msgSend_recipientBaselineToFirstSeparator(void *a1, const char *a2, ...)
{
  return [a1 recipientBaselineToFirstSeparator];
}

id objc_msgSend_recipientBaselineToFirstSeparatorInConversation(void *a1, const char *a2, ...)
{
  return [a1 recipientBaselineToFirstSeparatorInConversation];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_replyToList(void *a1, const char *a2, ...)
{
  return [a1 replyToList];
}

id objc_msgSend_replyToSenders(void *a1, const char *a2, ...)
{
  return [a1 replyToSenders];
}

id objc_msgSend_representedObjectID(void *a1, const char *a2, ...)
{
  return [a1 representedObjectID];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_revealActionsButton(void *a1, const char *a2, ...)
{
  return [a1 revealActionsButton];
}

id objc_msgSend_richLink(void *a1, const char *a2, ...)
{
  return [a1 richLink];
}

id objc_msgSend_richLinkCache(void *a1, const char *a2, ...)
{
  return [a1 richLinkCache];
}

id objc_msgSend_richLinkURLs(void *a1, const char *a2, ...)
{
  return [a1 richLinkURLs];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_screenHeight(void *a1, const char *a2, ...)
{
  return [a1 screenHeight];
}

id objc_msgSend_searchResultIdentifier(void *a1, const char *a2, ...)
{
  return [a1 searchResultIdentifier];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sectionName(void *a1, const char *a2, ...)
{
  return [a1 sectionName];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return [a1 sections];
}

id objc_msgSend_seeAllButton(void *a1, const char *a2, ...)
{
  return [a1 seeAllButton];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return [a1 semanticContentAttribute];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_senderList(void *a1, const char *a2, ...)
{
  return [a1 senderList];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedFontMetricCache(void *a1, const char *a2, ...)
{
  return [a1 sharedFontMetricCache];
}

id objc_msgSend_sharedGenerator(void *a1, const char *a2, ...)
{
  return [a1 sharedGenerator];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldArchiveByDefault(void *a1, const char *a2, ...)
{
  return [a1 shouldArchiveByDefault];
}

id objc_msgSend_shouldShowMailbox(void *a1, const char *a2, ...)
{
  return [a1 shouldShowMailbox];
}

id objc_msgSend_showBanners(void *a1, const char *a2, ...)
{
  return [a1 showBanners];
}

id objc_msgSend_showSourceMailbox(void *a1, const char *a2, ...)
{
  return [a1 showSourceMailbox];
}

id objc_msgSend_showsBIMIWhenExpanded(void *a1, const char *a2, ...)
{
  return [a1 showsBIMIWhenExpanded];
}

id objc_msgSend_showsContactOnTap(void *a1, const char *a2, ...)
{
  return [a1 showsContactOnTap];
}

id objc_msgSend_showsTimestampWhenExpanded(void *a1, const char *a2, ...)
{
  return [a1 showsTimestampWhenExpanded];
}

id objc_msgSend_signpostLog(void *a1, const char *a2, ...)
{
  return [a1 signpostLog];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_statusIndicatorImageViews(void *a1, const char *a2, ...)
{
  return [a1 statusIndicatorImageViews];
}

id objc_msgSend_statusIndicatorLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 statusIndicatorLayoutGuide];
}

id objc_msgSend_statusIndicatorLayoutGuideTrailingConstraint(void *a1, const char *a2, ...)
{
  return [a1 statusIndicatorLayoutGuideTrailingConstraint];
}

id objc_msgSend_statusIndicatorManager(void *a1, const char *a2, ...)
{
  return [a1 statusIndicatorManager];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return [a1 subject];
}

id objc_msgSend_subjectLabel(void *a1, const char *a2, ...)
{
  return [a1 subjectLabel];
}

id objc_msgSend_subjectStackView(void *a1, const char *a2, ...)
{
  return [a1 subjectStackView];
}

id objc_msgSend_subjectString(void *a1, const char *a2, ...)
{
  return [a1 subjectString];
}

id objc_msgSend_subjectTextView(void *a1, const char *a2, ...)
{
  return [a1 subjectTextView];
}

id objc_msgSend_subjectWithoutPrefix(void *a1, const char *a2, ...)
{
  return [a1 subjectWithoutPrefix];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlackColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemGroupedBackgroundColor];
}

id objc_msgSend_systemIndigoColor(void *a1, const char *a2, ...)
{
  return [a1 systemIndigoColor];
}

id objc_msgSend_systemMinimumLayoutMargins(void *a1, const char *a2, ...)
{
  return [a1 systemMinimumLayoutMargins];
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return [a1 systemPinkColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_tableCellGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 tableCellGroupedBackgroundColor];
}

id objc_msgSend_tapRecognizer(void *a1, const char *a2, ...)
{
  return [a1 tapRecognizer];
}

id objc_msgSend_tertiaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 tertiaryLabelColor];
}

id objc_msgSend_tertiarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 tertiarySystemBackgroundColor];
}

id objc_msgSend_tertiarySystemFillColor(void *a1, const char *a2, ...)
{
  return [a1 tertiarySystemFillColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return [a1 textContainer];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return [a1 textProperties];
}

id objc_msgSend_timeSensitivePromotionsImage(void *a1, const char *a2, ...)
{
  return [a1 timeSensitivePromotionsImage];
}

id objc_msgSend_timeSensitiveTransactionsImage(void *a1, const char *a2, ...)
{
  return [a1 timeSensitiveTransactionsImage];
}

id objc_msgSend_timeSensitiveUpdatesImage(void *a1, const char *a2, ...)
{
  return [a1 timeSensitiveUpdatesImage];
}

id objc_msgSend_timestampLabel(void *a1, const char *a2, ...)
{
  return [a1 timestampLabel];
}

id objc_msgSend_timestampLabelConstraints(void *a1, const char *a2, ...)
{
  return [a1 timestampLabelConstraints];
}

id objc_msgSend_titleFont(void *a1, const char *a2, ...)
{
  return [a1 titleFont];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_titleLabelBottom(void *a1, const char *a2, ...)
{
  return [a1 titleLabelBottom];
}

id objc_msgSend_titleLabelTop(void *a1, const char *a2, ...)
{
  return [a1 titleLabelTop];
}

id objc_msgSend_toList(void *a1, const char *a2, ...)
{
  return [a1 toList];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topConstraint(void *a1, const char *a2, ...)
{
  return [a1 topConstraint];
}

id objc_msgSend_topToSenderBaseline(void *a1, const char *a2, ...)
{
  return [a1 topToSenderBaseline];
}

id objc_msgSend_topToSenderBaselineInConversation(void *a1, const char *a2, ...)
{
  return [a1 topToSenderBaselineInConversation];
}

id objc_msgSend_trailingAccessoryViewLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 trailingAccessoryViewLayoutGuide];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_uniqueIdForPersistentConnection(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdForPersistentConnection];
}

id objc_msgSend_updateConstraintsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateConstraintsIfNeeded];
}

id objc_msgSend_updateImageViews(void *a1, const char *a2, ...)
{
  return [a1 updateImageViews];
}

id objc_msgSend_updateTrustForDisplayedAtoms(void *a1, const char *a2, ...)
{
  return [a1 updateTrustForDisplayedAtoms];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_useSelectedColors(void *a1, const char *a2, ...)
{
  return [a1 useSelectedColors];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_usingLargeTextLayout(void *a1, const char *a2, ...)
{
  return [a1 usingLargeTextLayout];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewForFirstBaselineLayout(void *a1, const char *a2, ...)
{
  return [a1 viewForFirstBaselineLayout];
}

id objc_msgSend_viewModel(void *a1, const char *a2, ...)
{
  return [a1 viewModel];
}

id objc_msgSend_vipManager(void *a1, const char *a2, ...)
{
  return [a1 vipManager];
}

id objc_msgSend_waitForResult(void *a1, const char *a2, ...)
{
  return [a1 waitForResult];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}