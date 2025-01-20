void sub_1E10300C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1E103012C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10301F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10308E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103097C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1030A24(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E1030BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1030C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1030DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1030FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1031150(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1E10325A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1032794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1032B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1032C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1032CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1033338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1033654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E103381C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1033B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1033BB8()
{
}

void sub_1E1033C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1033E54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1033F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10349E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E1034B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103507C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1035284(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1E1035668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E103583C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1035BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1035C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10360D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1036218(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void performBlockForBrowserControllers(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = +[Application sharedApplication];
  v3 = [v2 browserControllers];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        v1[2](v1, *(void *)(*((void *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void sub_1E10365C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10366D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10367BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10368B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1036A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, id *a11, void *a12)
{
  if ((v16 & 1) == 0)
  {
  }
  _Unwind_Resume(a1);
}

void sub_1E1036B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1036C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1036DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1E10370E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E10374E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1037640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10376A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10378E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E1037A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1037DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1037FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10381AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1038EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10390AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

double itemOffsetForSlowingOffset(double a1, double a2, double a3)
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v14 = __itemOffsetForSlowingOffset_block_invoke;
  v15 = &__block_descriptor_40_e8_d16__0d8l;
  double v16 = a3;
  uint64_t v5 = v13;
  uint64_t v6 = v5;
  if (a1 <= 0.0)
  {
    double v11 = fmax(a2, 0.0);
  }
  else
  {
    double v7 = a2 + 128.0 - a1;
    double v8 = 0.0;
    double v9 = 0.0;
    if (v7 > 0.0) {
      double v9 = v7 - v14((uint64_t)v5, a2 + 128.0 - a1);
    }
    double v10 = fmin(a2, 0.0) + 128.0 - a1;
    if (v10 > 0.0) {
      double v8 = v10 - v14((uint64_t)v6, v10);
    }
    double v11 = v9 - v8;
  }

  return v11;
}

long double __itemOffsetForSlowingOffset_block_invoke(uint64_t a1, double a2)
{
  double v2 = *(double *)(a1 + 32);
  return v2 * log(a2 / v2 + 1.0);
}

void sub_1E103B378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103B410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103B4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E103B728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103B9FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E103BAAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103BBE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103C008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103C0A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103C248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103CFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103D304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103E8D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103EC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1E103EEF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E103F4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E103F63C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1040168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1040224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1040420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1040B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10415B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1041B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1042080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXLayout()
{
  if (WBS_LOG_CHANNEL_PREFIXLayout_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXLayout_onceToken, &__block_literal_global_55);
  }
  return WBS_LOG_CHANNEL_PREFIXLayout_log;
}

void sub_1E104269C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1042B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id webViewToTabDocumentMap(void)
{
  v0 = (void *)webViewToTabDocumentMap(void)::map;
  if (!webViewToTabDocumentMap(void)::map)
  {
    uint64_t v1 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    double v2 = (void *)webViewToTabDocumentMap(void)::map;
    webViewToTabDocumentMap(void)::map = v1;

    v0 = (void *)webViewToTabDocumentMap(void)::map;
  }
  return v0;
}

void sub_1E1043064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E104317C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1043564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1044680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10447B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXTabSnapshots()
{
  if (WBS_LOG_CHANNEL_PREFIXTabSnapshots_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXTabSnapshots_onceToken, &__block_literal_global_121);
  }
  return WBS_LOG_CHANNEL_PREFIXTabSnapshots_log;
}

void sub_1E1045DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1046374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1046FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1047664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  v18 = v17;

  _Unwind_Resume(a1);
}

void sub_1E1047A80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(v8);
  objc_destroyWeak(v7);

  objc_destroyWeak(v3);
  objc_destroyWeak((id *)(v10 - 136));

  _Unwind_Resume(a1);
}

void sub_1E1047C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1047D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1047EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1047FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E104832C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1048488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10485BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10486E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1048D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1048D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1049124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1049594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1049740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1049878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_1E1049B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E1049EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E104A1C8(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1E104A3E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E104A550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E104A6C8(_Unwind_Exception *a1)
{
  if (v5) {

  }
  _Unwind_Resume(a1);
}

void sub_1E104A784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E104AA40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E104ACB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E104AD88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E104ADFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id extensionOverridenStartPageURLForTab(void *a1)
{
  uint64_t v1 = [a1 webExtensionsController];
  double v2 = [v1 extensionOverriddenStartPageURL];

  return v2;
}

void sub_1E104AF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E104CAB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E104CE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E104DC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31)
{
  _Unwind_Resume(a1);
}

void sub_1E104DE98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E104E078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E104E2CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E104E328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E104E5C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E104EC44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void sub_1E104FBD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1051778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, id *a12, id *a13, void *a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,id a27)
{
  objc_destroyWeak((id *)(v29 - 128));
  _Unwind_Resume(a1);
}

void sub_1E1051AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1051CA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E1052624(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXTabView()
{
  if (WBS_LOG_CHANNEL_PREFIXTabView_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXTabView_onceToken, &__block_literal_global_124);
  }
  return WBS_LOG_CHANNEL_PREFIXTabView_log;
}

void sub_1E10538F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1053E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1053E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1054098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E105434C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void setPrimaryWindowEntityFromBrowserController(BrowserController *a1)
{
  obj = a1;
  uint64_t v1 = (void *)MEMORY[0x1E4E426E0]();
  WeakRetained = (id *)objc_loadWeakRetained(&setPrimaryWindowEntityFromBrowserController(BrowserController *)::currentPrimaryBrowserController);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[35] view];
    objc_msgSend(v4, "safari_updateWithPrimaryState:", 0);
  }
  objc_storeWeak(&setPrimaryWindowEntityFromBrowserController(BrowserController *)::currentPrimaryBrowserController, obj);

  int v5 = obj;
  if (obj)
  {
    uint64_t v6 = [(BrowserRootViewController *)obj->_rootViewController view];
    objc_msgSend(v6, "safari_updateWithPrimaryState:", 1);

    int v5 = obj;
  }
}

void sub_1E1054444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1054660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1054758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1054950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1054C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105551C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10555EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1056CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1057754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
}

void sub_1E1059048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1059468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1E10598F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1059FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E105A13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105A2AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E105A3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E105A518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E105A790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105A9EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105AA54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105AAB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105AC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  v18 = v16;
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E105B098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E105B390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105B3F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105BBA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXPageLoading()
{
  if (WBS_LOG_CHANNEL_PREFIXPageLoading_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPageLoading_onceToken, &__block_literal_global_67);
  }
  return WBS_LOG_CHANNEL_PREFIXPageLoading_log;
}

void sub_1E105BD78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E105BE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E105BEB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105C534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105CB64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105CC38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXHistory()
{
  if (WBS_LOG_CHANNEL_PREFIXHistory_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXHistory_onceToken, &__block_literal_global_49_1);
  }
  return WBS_LOG_CHANNEL_PREFIXHistory_log;
}

void sub_1E105CD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105D0F4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v5 - 56));
  _Unwind_Resume(a1);
}

id SafariFrequentlyVisitedSitesBannedURLStoreURLForProfileWithIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && ![v1 isEqualToString:*MEMORY[0x1E4F980C8]])
  {
    double v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v4 = objc_msgSend(v8, "safari_profileDirectoryURLWithID:createIfNeeded:", v2, 0);

    if (v4)
    {
      double v7 = [v4 URLByAppendingPathComponent:@"FrequentlyVisitedSitesBannedURLStore.plist" isDirectory:0];
    }
    else
    {
      double v7 = 0;
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v4 = SafariSettingsDirectoryPath();
    uint64_t v5 = [v4 stringByAppendingPathComponent:@"FrequentlyVisitedSitesBannedURLStore.plist"];
    uint64_t v6 = [v5 stringByResolvingSymlinksInPath];
    double v7 = [v3 fileURLWithPath:v6];
  }
  return v7;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1E4E42950](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

__n128 __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1E105DF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105E738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, id *location, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  _Unwind_Resume(a1);
}

void sub_1E105EB7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105F060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E105F1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E105F398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E105F5C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105FB78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_1E105FE64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E105FFE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10602FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1060560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  double v16 = v15;

  _Unwind_Resume(a1);
}

void sub_1E1060748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10608BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1061178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10611F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106175C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  v26 = v24;
  objc_destroyWeak(v25);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E1061C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  v20 = v16;
  objc_destroyWeak(v18);

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)(v19 - 104));

  _Unwind_Resume(a1);
}

void sub_1E1061E5C(_Unwind_Exception *a1)
{
  long long v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1E1061FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10634DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,id location)
{
}

uint64_t WBS_LOG_CHANNEL_PREFIXSignposts()
{
  if (WBS_LOG_CHANNEL_PREFIXSignposts_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSignposts_onceToken, &__block_literal_global_103);
  }
  return WBS_LOG_CHANNEL_PREFIXSignposts_log;
}

void sub_1E1063C90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E1064B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1064D54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1064EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1065288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10655A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10656AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E1065780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1065950(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1E1065CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E1065F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10660E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10664B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10665A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1066628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1066780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10668F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10669C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1066AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1066FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1E1067184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1067200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106745C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106789C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10679F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1067B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1067BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1067F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1068338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10684CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10686B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1068D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1068ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1068FA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10690DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1069484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10695A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1069674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1069750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1069938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1069E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1069F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106A0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E106A208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106A330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106A56C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106A7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E106A8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106A998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106ABB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E106ACF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E106AFD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106B1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1E106B314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106B470(_Unwind_Exception *a1)
{
  double v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1E106B560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106B874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106BA50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106BC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106BCC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106C600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106C9E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_1E106CB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106CDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106D504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106D5EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106D6D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106D7F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106DBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,void *a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_1E106DDC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106E2E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106E3B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E106E45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106E550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106E6C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106E968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106EAF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106ED44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106EDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106EE94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106EF14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E106F150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106F2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E106FABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E106FEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E1070288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_1E1070858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1070968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1070D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1E1070E1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E10710AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1071B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1071C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1071CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXUserInteraction()
{
  if (WBS_LOG_CHANNEL_PREFIXUserInteraction_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUserInteraction_onceToken, &__block_literal_global_139);
  }
  return WBS_LOG_CHANNEL_PREFIXUserInteraction_log;
}

__CFString *stringForCurrentCapsuleLayoutPreference()
{
  v0 = [MEMORY[0x1E4F78290] sharedFeatureManager];
  uint64_t v1 = [v0 preferredCapsuleLayoutStyle];

  if (v1 == 2) {
    return @"Top";
  }
  else {
    return @"BottomWithToolbar";
  }
}

void sub_1E1072940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1072AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1073068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t isScreenSizeCurrentlyBigEnoughForTabBar(double a1, double a2)
{
  uint64_t result = objc_msgSend(MEMORY[0x1E4F3AF78], "isTabBarAvailableForScreenSize:");
  if (result) {
    return fmin(a1, a2) > 414.0 || a1 > a2;
  }
  return result;
}

void sub_1E1073148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1075734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, uint64_t a20,void *a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,void *a63)
{
  _Unwind_Resume(a1);
}

void sub_1E1075ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1076244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10764F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10766B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1076774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1076870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1076B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1076CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10770CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10777A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1077D00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1E1077E00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1E1077FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E1078578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXContentBlockers()
{
  if (WBS_LOG_CHANNEL_PREFIXContentBlockers_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXContentBlockers_onceToken, &__block_literal_global_28);
  }
  return WBS_LOG_CHANNEL_PREFIXContentBlockers_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXExtensions()
{
  if (WBS_LOG_CHANNEL_PREFIXExtensions_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXExtensions_onceToken, &__block_literal_global_46_0);
  }
  return WBS_LOG_CHANNEL_PREFIXExtensions_log;
}

void sub_1E1079828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t WBS_LOG_CHANNEL_PREFIXCloudTabs()
{
  if (WBS_LOG_CHANNEL_PREFIXCloudTabs_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCloudTabs_onceToken, &__block_literal_global_25);
  }
  return WBS_LOG_CHANNEL_PREFIXCloudTabs_log;
}

void __SafariLibraryPath_block_invoke()
{
  v0 = _SFSafariContainerPath();
  id v3 = v0;
  if (v0) {
    [v0 stringByAppendingPathComponent:@"Library"];
  }
  else {
  uint64_t v1 = SafariNonContaineredLibraryPath();
  }
  uint64_t v2 = (void *)SafariLibraryPath_path;
  SafariLibraryPath_path = v1;
}

id SafariCloudBookmarksMigrationCoordinatorLogsDirectoryURL()
{
  v0 = SafariCloudBookmarksMigrationCoordinatorDirectoryURL();
  uint64_t v1 = [v0 URLByAppendingPathComponent:@"Logs" isDirectory:1];

  return v1;
}

id SafariCloudBookmarksMigrationCoordinatorDirectoryURL()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v1 = SafariSettingsDirectoryPath();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"CloudBookmarksMigrationCoordinator"];
  id v3 = [v0 fileURLWithPath:v2 isDirectory:1];

  return v3;
}

id SafariThumbnailCacheDirectoryPath()
{
  v0 = (void *)SafariThumbnailCacheDirectoryPath_path;
  if (!SafariThumbnailCacheDirectoryPath_path)
  {
    uint64_t v1 = SafariSettingsDirectoryPath();
    uint64_t v2 = [v1 stringByAppendingPathComponent:@"Thumbnails"];
    id v3 = (void *)SafariThumbnailCacheDirectoryPath_path;
    SafariThumbnailCacheDirectoryPath_path = v2;

    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    objc_msgSend(v4, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", SafariThumbnailCacheDirectoryPath_path, 0);

    v0 = (void *)SafariThumbnailCacheDirectoryPath_path;
  }
  return v0;
}

id SafariSettingsDirectoryPath()
{
  v0 = (void *)SafariSettingsDirectoryPath_path;
  if (!SafariSettingsDirectoryPath_path)
  {
    uint64_t v1 = SafariLibraryPath();
    uint64_t v2 = [v1 stringByAppendingPathComponent:@"Safari"];
    id v3 = (void *)SafariSettingsDirectoryPath_path;
    SafariSettingsDirectoryPath_path = v2;

    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    objc_msgSend(v4, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", SafariSettingsDirectoryPath_path, 0);

    v0 = (void *)SafariSettingsDirectoryPath_path;
  }
  return v0;
}

id SafariLibraryPath()
{
  if (SafariLibraryPath_onceToken != -1) {
    dispatch_once(&SafariLibraryPath_onceToken, &__block_literal_global_34);
  }
  v0 = (void *)SafariLibraryPath_path;
  return v0;
}

uint64_t MobileSafariUIMain(int a1, char *const *a2)
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1F4188790]();
  uint64_t v6 = (char **)((char *)&v88 - v5);
  if (v4 >= 0x200) {
    size_t v7 = 512;
  }
  else {
    size_t v7 = v4;
  }
  bzero((char *)&v88 - v5, v7);
  double v8 = *a2;
  v96 = v6;
  void *v6 = v8;
  *MEMORY[0x1E4F149F0] = 0;
  uint64_t v9 = MEMORY[0x1E4E426E0]();
  id v94 = 0;
  id v95 = 0;
  id v92 = 0;
  id v93 = 0;
  LODWORD(v91) = a1 - 1;
  v88 = &v100;
  v89 = (void *)v9;
  uint64_t v10 = 1;
  double v11 = (void *)MEMORY[0x1E4F149E8];
  *(void *)&long long v12 = 138543362;
  long long v90 = v12;
  do
  {
    while (1)
    {
      while (1)
      {
        while (1)
        {
          while (1)
          {
            uint64_t v13 = v10;
            uint64_t v14 = getopt_long_only(a1, a2, "P:T:U:", (const option *)&longopts, 0);
            if ((int)v14 <= 127) {
              break;
            }
            switch((int)v14)
            {
              case 128:
                if (!objc_msgSend(MEMORY[0x1E4F97EA0], "isInternalInstall", v14))
                {
                  int v60 = 1;
                  v59 = v89;
                  id v55 = v93;
                  id v54 = v94;
                  id v56 = v92;
                  goto LABEL_52;
                }
                if (sandbox_extension_consume() == -1)
                {
                  v15 = WBS_LOG_CHANNEL_PREFIXTest();
                  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                    MobileSafariUIMain_cold_4(v99, v15, v88);
                  }
                }
                break;
              case 129:
                if (objc_msgSend(MEMORY[0x1E4F97EA0], "isInternalInstall", v14))
                {
                  v20 = [NSString stringWithUTF8String:*v11];

                  v21 = WBS_LOG_CHANNEL_PREFIXTest();
                  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
                  id v94 = v20;
                  if (v22)
                  {
                    *(_DWORD *)buf = v90;
                    id v102 = v20;
                    _os_log_debug_impl(&dword_1E102C000, v21, OS_LOG_TYPE_DEBUG, "Test type is %{public}@", buf, 0xCu);
                    id v94 = v20;
                  }
                }
                continue;
              case 130:
                if (objc_msgSend(MEMORY[0x1E4F97EA0], "isInternalInstall", v14))
                {
                  id v23 = v95;
                  if (!v95) {
                    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  }
                  v24 = objc_msgSend(NSString, "stringWithUTF8String:", *v11, v88);
                  v25 = [v24 componentsSeparatedByString:@","];
                  id v95 = v23;
                  [v23 addObjectsFromArray:v25];

                  v26 = WBS_LOG_CHANNEL_PREFIXTest();
                  uint64_t v10 = v13;
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = v90;
                    id v102 = v95;
                    _os_log_debug_impl(&dword_1E102C000, v26, OS_LOG_TYPE_DEBUG, "Test bundle names are %{public}@", buf, 0xCu);
                    uint64_t v10 = v13;
                  }
                }
                continue;
              case 131:
                if (objc_msgSend(MEMORY[0x1E4F97EA0], "isInternalInstall", v14))
                {
                  v27 = (void *)MEMORY[0x1E4F1CB10];
                  v28 = [NSString stringWithUTF8String:*v11];
                  uint64_t v29 = [v27 fileURLWithPath:v28];

                  v30 = WBS_LOG_CHANNEL_PREFIXTest();
                  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
                  id v93 = v29;
                  uint64_t v10 = v13;
                  if (v31)
                  {
                    *(_DWORD *)buf = v90;
                    id v102 = v29;
                    _os_log_debug_impl(&dword_1E102C000, v30, OS_LOG_TYPE_DEBUG, "Test suite URL is %{public}@", buf, 0xCu);
                    id v93 = v29;
                    uint64_t v10 = v13;
                  }
                }
                continue;
              case 132:
                if (objc_msgSend(MEMORY[0x1E4F97EA0], "isInternalInstall", v14))
                {
                  v32 = (void *)MEMORY[0x1E4F1CB10];
                  v33 = [NSString stringWithUTF8String:*v11];
                  v34 = [v32 fileURLWithPath:v33];

                  v35 = WBS_LOG_CHANNEL_PREFIXTest();
                  BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
                  id v92 = v34;
                  uint64_t v10 = v13;
                  if (v36)
                  {
                    *(_DWORD *)buf = v90;
                    id v102 = v34;
                    _os_log_debug_impl(&dword_1E102C000, v35, OS_LOG_TYPE_DEBUG, "Test output URL is %{public}@", buf, 0xCu);
                    id v92 = v34;
                    uint64_t v10 = v13;
                  }
                }
                continue;
              default:
                continue;
            }
          }
          if ((int)v14 <= 79) {
            break;
          }
          if ((v14 - 84) < 2 || v14 == 80) {
            +[Application commandLineTestOption:arg:](Application, "commandLineTestOption:arg:", v14, *v11, v88);
          }
        }
        if (v14 != 1) {
          break;
        }
        v96[(int)v10] = a2[*MEMORY[0x1E4F149F8] - 1];
        uint64_t v10 = (v10 + 1);
      }
      if (v14 != 63) {
        break;
      }
      double v16 = (int *)MEMORY[0x1E4F149F8];
      uint64_t v17 = a2[*MEMORY[0x1E4F149F8] - 1];
      v96[(int)v10] = v17;
      uint64_t v10 = (int)v10 + 1;
      NSLog((NSString *)@"Unknown command-line switch: %s", v17);
      uint64_t v18 = *v16;
      if ((int)v18 < (int)v91)
      {
        uint64_t v19 = a2[v18];
        if (*v19 != 45)
        {
          v96[v10] = v19;
          uint64_t v10 = (v13 + 2);
          *MEMORY[0x1E4F149F8] = v18 + 1;
        }
      }
    }
  }
  while (v14 != -1);
  v96[(int)v10] = 0;
  v37 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v38 = [v37 objectAtIndex:0];

  v39 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v40 = *MEMORY[0x1E4F981F0];
  uint64_t v41 = MEMORY[0x1E4F1CC38];
  v98[0] = MEMORY[0x1E4F1CC38];
  uint64_t v42 = *MEMORY[0x1E4FB6E30];
  v97[0] = v40;
  v97[1] = v42;
  v43 = [v38 stringByAppendingPathComponent:@"WebKit/Databases"];
  v98[1] = v43;
  v97[2] = *MEMORY[0x1E4FB6E70];
  v91 = v38;
  v44 = [v38 stringByAppendingPathComponent:@"WebKit/LocalStorage"];
  v98[2] = v44;
  v97[3] = *MEMORY[0x1E4F78990];
  v45 = [MEMORY[0x1E4F28ED0] numberWithBool:_SFDeviceIsPad()];
  v98[3] = v45;
  v98[4] = v41;
  v97[4] = @"CloudTabsEnabled";
  v97[5] = @"FontAutoSizeSetting";
  v46 = [MEMORY[0x1E4F28ED0] numberWithInt:_SFDeviceIsPad() ^ 1];
  v98[5] = v46;
  v98[6] = &unk_1F3C738C0;
  v97[6] = @"LayoutInterval";
  v97[7] = @"MemoryWarningSleepInterval";
  v98[7] = &unk_1F3C73F78;
  v98[8] = &unk_1F3C73F88;
  uint64_t v47 = *MEMORY[0x1E4F78A18];
  v97[8] = @"SearchEngineSpamInterval";
  v97[9] = v47;
  v98[9] = v41;
  v98[10] = v41;
  uint64_t v48 = *MEMORY[0x1E4F980D8];
  v97[10] = @"SpeculativeLoading";
  v97[11] = v48;
  uint64_t v49 = *MEMORY[0x1E4F99628];
  v98[11] = v41;
  v98[12] = v41;
  uint64_t v50 = *MEMORY[0x1E4F980E0];
  v97[12] = v49;
  v97[13] = v50;
  v98[13] = v41;
  v98[14] = MEMORY[0x1E4F1CC28];
  uint64_t v51 = *MEMORY[0x1E4F99638];
  v97[14] = *MEMORY[0x1E4F98160];
  v97[15] = v51;
  v97[16] = *MEMORY[0x1E4FB6110];
  v98[15] = v41;
  v98[16] = v41;
  v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:17];
  [v39 registerDefaults:v52];

  v53 = v39;
  objc_msgSend(v39, "safari_registerMobileSafariDefaults");
  id v54 = v94;
  if (v94)
  {
    id v56 = v92;
    id v55 = v93;
    if (v93)
    {
      v57 = v91;
      if (v92)
      {
        BOOL v58 = +[Application prepareTestControllerWithType:v94 suiteURL:v93 bundleNames:v95 outputURL:v92];
        v59 = v89;
        if (v58)
        {
          int v60 = 0;
          goto LABEL_51;
        }
        v79 = WBS_LOG_CHANNEL_PREFIXTest();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
          MobileSafariUIMain_cold_3(v79, v80, v81, v82, v83, v84, v85, v86);
        }
      }
      else
      {
        v70 = WBS_LOG_CHANNEL_PREFIXTest();
        BOOL v71 = os_log_type_enabled(v70, OS_LOG_TYPE_ERROR);
        v59 = v89;
        if (v71) {
          MobileSafariUIMain_cold_2(v70, v72, v73, v74, v75, v76, v77, v78);
        }
      }
      int v60 = 1;
    }
    else
    {
      v61 = WBS_LOG_CHANNEL_PREFIXTest();
      BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
      v57 = v91;
      if (v62) {
        MobileSafariUIMain_cold_1(v61, v63, v64, v65, v66, v67, v68, v69);
      }
      int v60 = 1;
      v59 = v89;
    }
  }
  else
  {
    int v60 = 0;
    v59 = v89;
    id v56 = v92;
    id v55 = v93;
    v57 = v91;
  }
LABEL_51:

LABEL_52:
  if (v60) {
    return 1;
  }
  WBSSetUpAccessToAppDataContainerWithIdentifier();
  UIApplicationMain(v13, v96, (NSString *)@"Application", (NSString *)@"Application");
  return 0;
}

void sub_1E107B248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E107B2FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E107BE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,id *a23,id *a24,id *a25,id *a26,id *a27,id *a28)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(v35);
  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak(v32);
  objc_destroyWeak(v31);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a16);
  objc_destroyWeak(a17);
  objc_destroyWeak(a18);
  objc_destroyWeak(a19);
  objc_destroyWeak(a20);
  objc_destroyWeak(a21);
  objc_destroyWeak(a22);
  objc_destroyWeak(a23);
  objc_destroyWeak(a24);
  objc_destroyWeak(a25);
  objc_destroyWeak(a26);
  objc_destroyWeak(a27);
  objc_destroyWeak(a28);
  objc_destroyWeak((id *)(v36 - 128));
  _Unwind_Resume(a1);
}

void sub_1E107C584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  _Unwind_Resume(a1);
}

void sub_1E107C858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E107CA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  v24 = v22;
  objc_destroyWeak(v24);

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)(v23 - 56));

  _Unwind_Resume(a1);
}

void sub_1E107CB70(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1E107CD8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1E107CF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E107D0C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E107D5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E107DA8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E107DE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E107DF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_1E107F384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXTabs()
{
  if (WBS_LOG_CHANNEL_PREFIXTabs_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXTabs_onceToken, &__block_literal_global_127);
  }
  return WBS_LOG_CHANNEL_PREFIXTabs_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXContinuity()
{
  if (WBS_LOG_CHANNEL_PREFIXContinuity_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXContinuity_onceToken, &__block_literal_global_31);
  }
  return WBS_LOG_CHANNEL_PREFIXContinuity_log;
}

void sub_1E1080208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1080518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1080698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  double v16 = v15;

  _Unwind_Resume(a1);
}

void sub_1E108075C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1080814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10809F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E108146C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1081578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1081C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double imageSizeOnScreen(void *a1)
{
  id v1 = a1;
  [v1 size];
  double v3 = v2;
  [v1 scale];
  double v5 = v4;

  _SFScreenScale();
  return v3 * (v5 / v6);
}

void sub_1E10827A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1083AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1083B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1083F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1084660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1084854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1084C8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E108500C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler((id *)va);

  _Unwind_Resume(a1);
}

void SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(id *this)
{
}

uint64_t WBS_LOG_CHANNEL_PREFIXBookmarks()
{
  if (WBS_LOG_CHANNEL_PREFIXBookmarks_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBookmarks_onceToken, &__block_literal_global_13);
  }
  return WBS_LOG_CHANNEL_PREFIXBookmarks_log;
}

void sub_1E108518C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1085300(_Unwind_Exception *a1)
{
  double v2 = v1;

  _Unwind_Resume(a1);
}

void sub_1E1085414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1085704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1085A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1085B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1085BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1085FC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1086528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXCycler()
{
  if (WBS_LOG_CHANNEL_PREFIXCycler_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCycler_onceToken, &__block_literal_global_34);
  }
  return WBS_LOG_CHANNEL_PREFIXCycler_log;
}

void sub_1E108696C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1086B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

id customActivities(void *a1, uint64_t a2, void *a3, id *a4)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = +[FeatureManager sharedFeatureManager];
  double v11 = v10;
  if (a2 == 1)
  {
    uint64_t v51 = v10;
    id v52 = v8;
    if (a4)
    {
      long long v12 = (void *)[*a4 mutableCopy];
      uint64_t v13 = [v12 indexOfObject:@"SafariActivityTypeWebExtension"];
      uint64_t v14 = [MEMORY[0x1E4F28E60] indexSet];
      v15 = [v12 objectAtIndexedSubscript:v13 - 1];
      int v16 = [v15 hasPrefix:@"com.apple.mobilesafari.webextension"];

      if (v16)
      {
        uint64_t v17 = v13 - 2;
        do
        {
          [v14 addIndex:v17 + 1];
          uint64_t v18 = [v12 objectAtIndexedSubscript:v17];
          char v19 = [v18 hasPrefix:@"com.apple.mobilesafari.webextension"];

          --v17;
        }
        while ((v19 & 1) != 0);
      }
      [v12 removeObjectsAtIndexes:v14];
    }
    else
    {
      long long v12 = 0;
    }
    v34 = [v7 webExtensionsController];
    v35 = objc_msgSend(v34, "enabledExtensionsWithPrivateBrowsingEnabled:", objc_msgSend(v7, "isPrivate"));
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __customActivities_block_invoke;
    v57[3] = &unk_1E6D77D40;
    id v36 = v34;
    id v58 = v36;
    id v59 = v7;
    v37 = objc_msgSend(v35, "safari_mapAndFilterObjectsUsingBlock:", v57);
    v38 = [v37 sortedArrayUsingComparator:&__block_literal_global_189];

    [v9 addObjectsFromArray:v38];
    if (a4)
    {
      id v48 = v36;
      uint64_t v49 = v35;
      uint64_t v50 = a4;
      uint64_t v39 = [v12 indexOfObject:@"SafariActivityTypeWebExtension"];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      uint64_t v40 = [v38 reverseObjectEnumerator];
      uint64_t v41 = [v40 countByEnumeratingWithState:&v53 objects:v60 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v54 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = [*(id *)(*((void *)&v53 + 1) + 8 * i) activityType];
            [v12 insertObject:v45 atIndex:v39];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v53 objects:v60 count:16];
        }
        while (v42);
      }

      v35 = v49;
      *uint64_t v50 = (id)[v12 copy];
      id v36 = v48;
    }
    v46 = objc_alloc_init(ManageWebExtensionsActivity);
    [(UIActivity *)v46 setActivitySectionIdentifier:@"ManageWebExtensionActivities"];
    [v9 addObject:v46];

    double v11 = v51;
    id v8 = v52;
  }
  else
  {
    if ([v10 isBookmarksAvailable])
    {
      v20 = objc_alloc_init(AddBookmarkUIActivity);
      [(_SFActivity *)v20 setDelegate:v8];
      v21 = objc_alloc_init(AddToFavoritesUIActivity);
      [(_SFActivity *)v21 setDelegate:v8];
      BOOL v22 = objc_alloc_init(AddToFavoritesUIActivity);
      [(AddToFavoritesUIActivity *)v22 setIsForPerTabGroupFavorites:1];
      [(_SFActivity *)v22 setDelegate:v8];
      [v9 addObject:v20];
      [v9 addObject:v22];
      [v9 addObject:v21];
    }
    uint64_t v23 = objc_alloc_init(AddToQuickNoteActivity);
    [v9 addObject:v23];
    id v24 = objc_alloc(MEMORY[0x1E4F3AF80]);
    v25 = [v7 activeWebView];
    v26 = (void *)[v24 initWithWebView:v25];
    [v9 addObject:v26];

    id v27 = objc_alloc(MEMORY[0x1E4F3AEF0]);
    v28 = [v7 webView];
    uint64_t v29 = (void *)[v27 initWithWebView:v28];
    [v9 addObject:v29];

    v30 = +[AddToNewsUIActivity activityWithTabDocument:v7 error:0];
    if (v30) {
      [v9 addObject:v30];
    }
    if ([v7 isDisplayingStandaloneMedia])
    {
      id v31 = objc_alloc(MEMORY[0x1E4F3AF58]);
      v32 = [v7 webView];
      v33 = (void *)[v31 initWithWebView:v32];

      if (v33) {
        [v9 addObject:v33];
      }
    }
  }

  return v9;
}

id itemProviderCollection(void *a1, uint64_t a2)
{
  id v3 = a1;
  double v4 = [v3 webView];
  double v5 = [v3 cachedCanonicalURLOrURLForSharing];
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F3AED8]) initWithWebView:v4];
  id v7 = [[TabDocumentActivityItemProvider alloc] initWithTabDocument:v3];
  [v6 setDocumentProvider:v7];

  if (a2 != 1)
  {
    objc_msgSend(v6, "setDisplayingDigitalHealthLockoutView:", objc_msgSend(v3, "shouldObscureForDigitalHealth"));
    objc_msgSend(v6, "setDisplayingStandaloneImage:", objc_msgSend(v3, "isDisplayingStandaloneImage"));
    objc_msgSend(v6, "setDisplayingStandaloneMedia:", objc_msgSend(v3, "isDisplayingStandaloneMedia"));
    objc_initWeak(&location, v3);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __itemProviderCollection_block_invoke;
    v28[3] = &unk_1E6D77C90;
    objc_copyWeak(&v29, &location);
    id v8 = (void *)MEMORY[0x1E4E42950](v28);
    uint64_t v9 = [v3 activityItemProvider];
    uint64_t v10 = v9;
    if (v9)
    {
      [v9 setThumbnailHandler:v8];
      [v6 setLinkProvider:v10];
    }
    if (([v3 shouldObscureForDigitalHealth] & 1) == 0)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F3B018]);
      long long v12 = [v3 printController];
      uint64_t v13 = (void *)[v11 initWithPrintController:v12 webView:v4];
      [v6 setPrintProvider:v13];
    }
    if (([v3 isShowingErrorPage] & 1) == 0)
    {
      objc_initWeak(&from, v3);
      uint64_t v14 = (void *)MEMORY[0x1E4F3AEE0];
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      id v24 = __itemProviderCollection_block_invoke_2;
      v25 = &unk_1E6D77CB8;
      objc_copyWeak(&v26, &from);
      v15 = [v14 activeWebPageExtensionItemForURL:v5 withPreviewImageHandler:&v22];
      int v16 = [ActionPanelWebPageExtensionItemProvider alloc];
      uint64_t v17 = -[ActionPanelWebPageExtensionItemProvider initWithExtensionItem:tabDocument:](v16, "initWithExtensionItem:tabDocument:", v15, v3, v22, v23, v24, v25);
      [v6 setJavaScriptExtensionProvider:v17];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&from);
    }
    id v18 = objc_alloc(MEMORY[0x1E4F3AF50]);
    char v19 = [v3 quickLookDocument];
    v20 = (void *)[v18 initWithQuickLookDocument:v19 URL:v5 webView:v4];

    if (v20)
    {
      [v20 setThumbnailHandler:v8];
      [v6 setDownloadProvider:v20];
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v6;
}

void sub_1E10880DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(v20);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_1E108874C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __itemProviderCollection_block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isLoading])
  {
    id v9 = [MEMORY[0x1E4F785A0] precompositedDefaultIcon];
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    int v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __itemProviderCollection_block_invoke_168;
    v11[3] = &unk_1E6D77C68;
    v11[4] = &v12;
    objc_msgSend(WeakRetained, "snapshotWithSize:options:completion:", 1, v11, a3, a4);
    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  return v9;
}

void sub_1E1088F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __itemProviderCollection_block_invoke_168(uint64_t a1, void *a2)
{
}

void __itemProviderCollection_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  double v6 = a2;
  id v7 = a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __itemProviderCollection_block_invoke_3;
  v9[3] = &unk_1E6D77C68;
  v9[4] = &v10;
  objc_msgSend(WeakRetained, "snapshotWithSize:options:completion:", 1, v9, 84.0, 79.0);
  v6[2](v6, v11[5], 0);

  _Block_object_dispose(&v10, 8);
}

void sub_1E10890E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __itemProviderCollection_block_invoke_3(uint64_t a1, void *a2)
{
}

Class __getSLComposeViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SocialLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SocialLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D77D00;
    uint64_t v6 = 0;
    SocialLibraryCore_frameworkLibrary = _sl_dlopen();
    double v2 = (void *)v4[0];
    if (!SocialLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SLComposeViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getSLComposeViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSLComposeViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SocialLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SocialLibraryCore_frameworkLibrary = result;
  return result;
}

id __customActivities_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) webExtensionForExtension:a2];
  double v4 = [v3 toolbarItem];

  long long v5 = [v4 activityForTab:*(void *)(a1 + 40)];
  [v5 setActivitySectionIdentifier:@"WebExtensionActivities"];

  return v5;
}

uint64_t __customActivities_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  long long v5 = [a2 activityTitle];
  uint64_t v6 = [v4 activityTitle];

  uint64_t v7 = [v5 localizedCompare:v6];
  return v7;
}

void sub_1E108ABAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1E108B700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void deviceDidLock()
{
  id v0 = +[Application sharedApplication];
  [v0 lockPrivateBrowsing];
}

void _localeChanged()
{
}

void _carrierBundledChanged()
{
}

void _autoFillStateChanged()
{
}

void _quickWebsiteSearchProvidersChanged()
{
  id v0 = [MEMORY[0x1E4F98D50] sharedController];
  [v0 noteProvidersAreStale];
}

void _webFilterSettingsDidChange()
{
}

void siriSuggestionsStateDidChange()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x1E4F99200] object:0];
  [v0 postNotificationName:*MEMORY[0x1E4F99640] object:0];
}

void screenTimeRestrictionsStateDidChange()
{
}

void safariSettingsChangedExtensionSettings()
{
  id v0 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v2 = 0;
    _os_log_impl(&dword_1E102C000, v0, OS_LOG_TYPE_INFO, "Safari Settings has updated Extensions.plist", v2, 2u);
  }
  id v1 = +[Application sharedApplication];
  [v1 notifyExtensionControllersThatSettingsWereUpdatedExternallyFromSettingsApp];
}

void contentBlockerDidChange()
{
  id v0 = +[Application sharedApplication];
  [v0 reloadContentBlockers];
}

id tabDocumentForDownload(void *a1)
{
  id v1 = [a1 wkDownload];
  double v2 = [v1 webView];
  id v3 = +[TabDocument tabDocumentForWKWebView:v2];

  return v3;
}

void sub_1E108E9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E108F128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id browserControllerWithEntityIdentifier(void *a1)
{
  id v1 = a1;
  double v2 = +[Application sharedApplication];
  id v3 = [v2 browserControllers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __browserControllerWithEntityIdentifier_block_invoke;
  v7[3] = &unk_1E6D77F50;
  id v8 = v1;
  id v4 = v1;
  long long v5 = objc_msgSend(v3, "safari_firstObjectPassingTest:", v7);

  return v5;
}

id windowEntityForBrowserController(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F98FD0];
  id v2 = a1;
  id v3 = [v1 alloc];
  id v4 = entityIdentifierForBrowserController(v2);
  long long v5 = [v2 scene];
  uint64_t v6 = [v5 title];
  uint64_t v7 = [v2 isPrivateBrowsingEnabled];

  id v8 = (void *)[v3 initWithIdentifier:v4 title:v6 isPrivate:v7];
  return v8;
}

id entityIdentifierForBrowserController(void *a1)
{
  id v1 = [a1 windowState];
  id v2 = [v1 sceneID];

  return v2;
}

void __useUIResponderMethodsForModifierFlags_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  useUIResponderMethodsForModifierFlags_flag = [v0 BOOLForKey:@"UseUIResponderMethodsForModifierFlags"];
}

void ___localeChanged_block_invoke()
{
  CFLocaleRef v0 = CFLocaleCopyCurrent();
  +[History localeChanged:v0];
  id v1 = [MEMORY[0x1E4F3B060] sharedInstance];
  [v1 reloadSearchEngines];

  id v2 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  [v2 localeSettingsChanged];

  CFRelease(v0);
}

uint64_t ___carrierBundledChanged_block_invoke(uint64_t a1, void *a2)
{
  return [a2 carrierBundledChanged];
}

uint64_t ___autoFillStateChanged_block_invoke(uint64_t a1, void *a2)
{
  return [a2 autoFillStateChangedMessageReceived];
}

uint64_t ___webFilterSettingsDidChange_block_invoke(uint64_t a1, void *a2)
{
  return [a2 updatePrivateBrowsingAvailabilityWithCompletionHandler:0];
}

uint64_t __screenTimeRestrictionsStateDidChange_block_invoke(uint64_t a1, void *a2)
{
  return [a2 updatePrivateBrowsingAvailabilityWithCompletionHandler:0];
}

void *__getDMGetUserDataDispositionSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)DataMigrationLibrary();
  uint64_t result = dlsym(v2, "DMGetUserDataDisposition");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDMGetUserDataDispositionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DataMigrationLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!DataMigrationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __DataMigrationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6D785B0;
    uint64_t v5 = 0;
    DataMigrationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = DataMigrationLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!DataMigrationLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __DataMigrationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DataMigrationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getDMGetPreviousBuildVersionSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)DataMigrationLibrary();
  uint64_t result = dlsym(v2, "DMGetPreviousBuildVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDMGetPreviousBuildVersionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCKContextClientClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ContextKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ContextKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D785C8;
    uint64_t v6 = 0;
    ContextKitLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!ContextKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CKContextClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getCKContextClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCKContextClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ContextKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContextKitLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __browserControllerWithEntityIdentifier_block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 windowState];
  long long v4 = [v3 sceneID];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return v0;
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1E1097FFC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

__n128 TabOverviewLocationCenterOfLocations(void *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 count])
  {
    id v2 = [v1 firstObject];
    id v3 = v2;
    float64x2_t v24 = 0u;
    if (v2)
    {
      float64x2_t v30 = 0uLL;
      float64x2_t v31 = 0uLL;
      [v2 getValue:&v30];
      float64x2_t v22 = v31;
      float64x2_t v23 = v30;
    }
    else
    {
      float64x2_t v22 = 0uLL;
      float64x2_t v23 = 0uLL;
    }

    long long v4 = [v1 firstObject];
    uint64_t v5 = v4;
    if (v4)
    {
      float64x2_t v30 = 0uLL;
      float64x2_t v31 = 0uLL;
      [v4 getValue:&v30];
      float64x2_t v21 = v31;
      float64x2_t v24 = v30;
    }
    else
    {
      float64x2_t v21 = 0uLL;
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v1;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
          if (v11)
          {
            float64x2_t v30 = 0u;
            float64x2_t v31 = 0u;
            [v11 getValue:&v30];
            float64x2_t v12 = v30;
            float64x2_t v13 = v31;
          }
          else
          {
            float64x2_t v12 = 0uLL;
            float64x2_t v13 = 0uLL;
          }
          float64x2_t v22 = vmaxnmq_f64(v22, v13);
          float64x2_t v23 = vmaxnmq_f64(v23, v12);
          float64x2_t v24 = vminnmq_f64(v24, v12);
          float64x2_t v21 = vminnmq_f64(v21, v13);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v14 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
        uint64_t v8 = v14;
      }
      while (v14);
    }

    __asm { FMOV            V2.2D, #0.5 }
    float64x2_t v25 = vmulq_f64(vaddq_f64(v23, v24), _Q2);
  }
  else
  {
    float64x2_t v25 = 0u;
  }

  return (__n128)v25;
}

uint64_t TabOverviewLocationEqualToLocationWithEpsilon()
{
  if (!_SFCGPointsEqualWithEpsilon() || !_SFEqualWithEpsilon()) {
    return 0;
  }
  return _SFEqualWithEpsilon();
}

double interpolateLocations(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v21 = a9;
  double v22 = expm1(a8 - a4);
  if ((_SFEqualWithEpsilon() & 1) == 0) {
    double v21 = expm1(a8 * a9 + (1.0 - a9) * a4 - a4) / v22;
  }
  return a5 * v21 + (1.0 - v21) * a1;
}

void roundLocationToLocation(uint64_t a1, CGFloat a2, CGFloat a3, double a4, long double a5, double a6, double a7, double a8)
{
  long double v12 = exp(a5) / (a4 * a8 + 1.0);
  CGFloat v13 = a7 * v12;
  double v15 = *(double *)a1;
  double v14 = *(double *)(a1 + 8);
  long double v16 = exp(*(long double *)(a1 + 24)) / (*(double *)(a1 + 16) * a8 + 1.0);
  v27.origin.x = v15 * (v12 / v16);
  v27.origin.y = v14 * (v12 / v16);
  CGFloat v17 = a6 * v16;
  CGFloat v18 = a7 * v16;
  v25.origin.x = a2;
  v25.origin.y = a3;
  v25.size.width = a6 * v12;
  v25.size.height = v13;
  v27.size.width = v17;
  v27.size.height = v18;
  CGRect v26 = CGRectIntersection(v25, v27);
  double v19 = vabdd_f64(v26.size.height, fmax(v13, v18));
  if (vabdd_f64(v26.size.width, fmax(a6 * v12, v17)) < 0.5 && v19 < 0.5)
  {
    *(CGFloat *)a1 = a2;
    *(CGFloat *)(a1 + 8) = a3;
    *(double *)(a1 + 16) = a4;
    *(long double *)(a1 + 24) = a5;
  }
}

void sub_1E109C47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__315(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1E4E42950](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__316(uint64_t a1)
{
}

void sub_1E109CDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRPTTestRunnerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getRPTTestRunnerClass_softClass;
  uint64_t v7 = getRPTTestRunnerClass_softClass;
  if (!getRPTTestRunnerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRPTTestRunnerClass_block_invoke;
    v3[3] = &unk_1E6D77CE0;
    v3[4] = &v4;
    __getRPTTestRunnerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E109DE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E109DFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E109F484(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E109F824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v20 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1E10A0B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose((const void *)(v42 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_1E10A1D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id pptHistoryOverride()
{
  return (id)pptHistoryURL;
}

void sub_1E10A2B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getRPTTestRunnerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RPTTestRunner");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRPTTestRunnerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRPTTestRunnerClass_block_invoke_cold_1();
    RecapPerformanceTestingLibrary();
  }
}

void RecapPerformanceTestingLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!RecapPerformanceTestingLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __RecapPerformanceTestingLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6D78B58;
    uint64_t v3 = 0;
    RecapPerformanceTestingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!RecapPerformanceTestingLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __RecapPerformanceTestingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RecapPerformanceTestingLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getRPTScrollViewTestParametersClass_block_invoke(uint64_t a1)
{
  RecapPerformanceTestingLibrary();
  Class result = objc_getClass("RPTScrollViewTestParameters");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRPTScrollViewTestParametersClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getRPTScrollViewTestParametersClass_block_invoke_cold_1();
    return (Class)__rebaseHistoryVisitTimesOfDatabaseAt_block_invoke(v3);
  }
  return result;
}

void __rebaseHistoryVisitTimesOfDatabaseAt_block_invoke(void *a1)
{
  long long v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 openWithAccessType:2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v5 = (void *)a1[4];
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v12 = *(id *)(v6 + 40);
    char v7 = objc_msgSend(v5, "executeQuery:error:", @"UPDATE history_visits SET visit_time = visit_time + (SELECT strftime('%s', 'now', 'utc') - strftime('%s', datetime(max(visit_time) + 978307200, 'unixepoch', 'utc')) FROM history_visits);",
           &v12);
    objc_storeStrong((id *)(v6 + 40), v12);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v7;
    uint64_t v8 = (void *)a1[4];
    if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      uint64_t v9 = *(void *)(a1[6] + 8);
      id v11 = *(id *)(v9 + 40);
      char v10 = [v8 executeQuery:@"VACUUM" error:&v11];
      objc_storeStrong((id *)(v9 + 40), v11);
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v10;
      uint64_t v8 = (void *)a1[4];
    }
    [v8 close];
  }
}

uint64_t __waitUntilHistoryFinishLoading_block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __waitUntilHistoryFinishLoading_block_invoke_2;
  v3[3] = &unk_1E6D77CE0;
  id v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 closeWithCompletionHandler:v3];
}

uint64_t __waitUntilHistoryFinishLoading_block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 40) = 1;
  return result;
}

void __getRPTResizeTestParametersClass_block_invoke(uint64_t a1)
{
  RecapPerformanceTestingLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RPTResizeTestParameters");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRPTResizeTestParametersClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v2 = (void *)__getRPTResizeTestParametersClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_3_0(v2, v3, v4, v5);
  }
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1E10A361C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t bookmarksBarLabelButtonFont()
{
  return [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
}

void sub_1E10A7258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E10A75E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E10A7950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E10B6BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10B74D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1E10B9414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E10B9788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)BrowserController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

id observableWebKitFeaturesByDefaultsKey(void)
{
  uint64_t v0 = (void *)observableWebKitFeaturesByDefaultsKey(void)::dictionary;
  if (!observableWebKitFeaturesByDefaultsKey(void)::dictionary)
  {
    id v1 = [MEMORY[0x1E4F46688] _features];
    uint64_t v2 = objc_msgSend(v1, "safari_dictionaryByMappingObjectsToKeysUsingBlock:", &__block_literal_global_2730);
    uint64_t v3 = (void *)observableWebKitFeaturesByDefaultsKey(void)::dictionary;
    observableWebKitFeaturesByDefaultsKey(void)::dictionary = v2;

    uint64_t v0 = (void *)observableWebKitFeaturesByDefaultsKey(void)::dictionary;
  }
  return v0;
}

void sub_1E10B9870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1E10B994C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10B9BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10B9CC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10B9D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10B9FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);

  objc_destroyWeak(v13);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v15 - 56));
  _Unwind_Resume(a1);
}

void sub_1E10BA0C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BA1D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1E10BA280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BA394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BA46C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BA6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BA7A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BA940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BA978()
{
  JUMPOUT(0x1E10BA970);
}

id WBSLocalizedStringWithValue(NSString *a1, NSString *a2)
{
  uint64_t v2 = _WBSLocalizedString();
  return v2;
}

void sub_1E10BAAC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BABD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BAC50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BACA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BADB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BAE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1E10BAF68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BAFE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BB054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BB188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BB1FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BB354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BB614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BBC40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BBD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BBDE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BBFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BC1FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BC470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BC504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BC57C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BC624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BC708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BC7BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BC8A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E10BC940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BC9E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BCB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BCD34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BCE64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BCFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BD080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BD1CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BD254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BD540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BD684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BD760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BD7BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BD9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BDB34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BDCE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BDD58()
{
}

void sub_1E10BDDDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BDF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BDFF4()
{
}

void sub_1E10BE2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BE45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BE7DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BE9E8(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1E10BEAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BEB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BED0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E10BEE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BEFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BF07C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BF138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BF378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10BF42C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BF568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1E10BF604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BF780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BF7EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BF894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BF9EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10BFACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10BFD58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1E10BFE18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10BFF6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C0070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C0288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  CGFloat v18 = v17;

  _Unwind_Resume(a1);
}

void sub_1E10C03D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c89_ZTSZ77__BrowserController_prepareForTabDocumentWebViewFullscreenMayReturnToInline__E3__0(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = *(id *)(a2 + 32);
  id result = *(id *)(a2 + 40);
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_ea8_32c89_ZTSZ77__BrowserController_prepareForTabDocumentWebViewFullscreenMayReturnToInline__E3__0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
}

void sub_1E10C053C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C06A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C0770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C0858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1E10C0908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C09B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C0A48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C0AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C0B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C0BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C0C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C0D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C0DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C0EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C1188(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1E10C1368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1E10C1430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C14B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C1668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E10C1740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C1BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C1E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C1EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C1FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C20A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C215C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C28AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  CGFloat v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E10C2B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C2F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C3088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C31B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C3340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C3474(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E10C35CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C36C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10C3788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10C383C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C38C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C3948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C39E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C3A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C3F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1E10C40F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C4718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C47F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C4888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C49CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C4B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E10C4C0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E10C4CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C4E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C4EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C4F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C5014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C50B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C5258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C5334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C54B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C556C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C5600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C5690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C5740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C5984(_Unwind_Exception *a1)
{
  uint64_t v6 = v3;

  _Unwind_Resume(a1);
}

void sub_1E10C5A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C5B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C5BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C5C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C5D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C5E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id googleSearchEngine(void)
{
  {
    uint64_t v2 = [MEMORY[0x1E4F3B060] sharedInstance];
    googleSearchEngine(void)::engine = [v2 engineInfoFor:@"Google"];
  }
  uint64_t v0 = (void *)googleSearchEngine(void)::engine;
  return v0;
}

void sub_1E10C5F28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C610C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C630C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C63B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C645C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10C6580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C670C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C6848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  CGFloat v13 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10C6A10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C6AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C6B54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C6C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C6DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C6E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C6F28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C6FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C716C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C7240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C7348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10C746C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C751C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C76CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C7798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C7A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1E10C7C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10C7CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C7E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  CGFloat v18 = v15;

  _Unwind_Resume(a1);
}

void sub_1E10C7EAC()
{
}

void sub_1E10C7EB4()
{
}

void sub_1E10C7EBC()
{
}

void sub_1E10C7EC4()
{
}

void sub_1E10C8008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C82C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E10C83BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C8464(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E10C8514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C863C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C8728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C8928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C8B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C8BC4()
{
}

void sub_1E10C8C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1E10C8DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C8ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C8F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C9174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1E10C9248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C92C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C94E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C958C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C961C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C96C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10C9848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C995C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C9B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10C9C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1E10CA130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1E10CA2C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CA4B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CA5D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CA92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CAD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1E10CAF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CB088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CB1B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CB31C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CB4F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CB628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CB694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CB700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CB76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CB7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CBA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CBCBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CBDD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CCB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CCD6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CCE14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CCEA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CCF78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CD060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CD124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CD1A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CD244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10CD358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CD470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CDAF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CDD70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CDEB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CDFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CE0FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CE1E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CE29C(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1E10CE3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CE46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CE56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CE678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CE9C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E10CEB74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CEC34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CECEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CED84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CEE78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1E10CF038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CF15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CF1EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CF274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CF410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CF4E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CF66C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CF854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CFA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10CFAD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CFBA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CFC84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CFD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10CFEF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1E10CFFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D0070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D0208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D02EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D0414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D044C()
{
}

void sub_1E10D04C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D0550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D0694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D07AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D0820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D08EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D098C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D0B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10D0C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D0CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D0DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D0ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D0FB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D1084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D1184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D11FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D1350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10D1504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1E10D16A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D17DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D1860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D18D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D1940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D19AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D1ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E10D1B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  CGFloat v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E10D1C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D1D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D1E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D1F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D21F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D241C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D29A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D2E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D3148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D3268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10D3360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D34A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E10D35DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D369C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D37C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D389C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1E10D39A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D3A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D3B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D3C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D3D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D3DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D3E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D3F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D3FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D4258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D4474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D4660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  CGFloat v18 = v14;

  _Unwind_Resume(a1);
}

void sub_1E10D46B8()
{
}

void sub_1E10D46C0()
{
}

void sub_1E10D46C8()
{
}

void sub_1E10D46D0()
{
}

void sub_1E10D4740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D47B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D4828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D48B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D4984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D4B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D4DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D4EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D4FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v15 = v13;

  _Unwind_Resume(a1);
}

void sub_1E10D50F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v15 = v13;

  _Unwind_Resume(a1);
}

void sub_1E10D5328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v26 - 88));

  _Unwind_Resume(a1);
}

void sub_1E10D53E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D5504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  CGFloat v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E10D573C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E10D5810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D5AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1E10D5BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D5C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D5DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D5E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D5E84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D5F50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D5FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D60A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D6168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D6260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D64A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D6708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D6794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D682C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D68AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D69A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D6A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D6B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D7284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38)
{
  _Unwind_Resume(a1);
}

void sub_1E10D74F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D757C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D76A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D77BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10D7A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D7B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D7CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  CGFloat v18 = v16;

  _Unwind_Resume(a1);
}

void sub_1E10D7D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_32c45_ZTSKZ32__BrowserController_closeWindow_E3__1(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 32);
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_ea8_32c45_ZTSKZ32__BrowserController_closeWindow_E3__1(uint64_t a1)
{
}

void sub_1E10D7E68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D7EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D7F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D8138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D81FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10D82C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D8488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D856C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D885C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D89EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D8B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D8B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D8DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1E10D8EA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D8F48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D904C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D911C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D91A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D9224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D9298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D932C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10D93E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D94FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D9670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  double v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1E10D97E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D9864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D99B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D9A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D9AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10D9B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10D9DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1E10D9FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DA150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DA2D4(_Unwind_Exception *a1)
{
  char v7 = v4;

  _Unwind_Resume(a1);
}

void sub_1E10DA3D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DA55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DAAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DACA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DAD4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DAE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DAEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DAFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DB130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DB280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DB458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DB504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DB688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v18 - 40));

  _Unwind_Resume(a1);
}

void sub_1E10DB778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DB90C(_Unwind_Exception *a1)
{
  uint64_t v3 = v1;

  _Unwind_Resume(a1);
}

void sub_1E10DBA90(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1E10DBB50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DBD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1E10DBE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DC194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  objc_destroyWeak(v30);

  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak((id *)(v32 - 104));

  _Unwind_Resume(a1);
}

void sub_1E10DC27C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DC3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_1E10DC4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1E10DC5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10DC65C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DC6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DC94C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DCA70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v10;

  _Unwind_Resume(a1);
}

void sub_1E10DCB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DCB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DCC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DCF54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1E10DD070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DD1D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DD330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DD3DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DD45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DD538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DE3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,void *a46,void *a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void *a54,void *a55,void *a56,void *a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose((const void *)(v75 - 240), 8);
  _Block_object_dispose((const void *)(v75 - 208), 8);

  _Unwind_Resume(a1);
}

void sub_1E10DEA2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DEB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DEEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1E10DF004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1E10DF120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E10DF300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DF4BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DF570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DF5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DF66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DF704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DF7A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DF864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DF938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10DF9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DFADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1E10DFB7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DFC6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1E10DFCF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DFD44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DFDDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DFE5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10DFEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10DFFF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E00AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E0140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E023C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E0308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E04CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E07DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  _Unwind_Resume(a1);
}

void sub_1E10E0940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E09C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E0B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E0BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E0C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E0CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E103C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E112C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E11C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E1258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E1368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E142C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E14A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E1564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E16E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v21);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E10E17F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10E19CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E1B50(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1E10E1F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  _Unwind_Resume(a1);
}

void sub_1E10E24C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  _Unwind_Resume(a1);
}

void sub_1E10E272C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E2828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v15 = v13;

  _Unwind_Resume(a1);
}

void sub_1E10E2914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10E29FC(_Unwind_Exception *a1)
{
  uint64_t v2 = v1;

  _Unwind_Resume(a1);
}

void sub_1E10E2AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E2B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E2C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E2DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E2FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E3274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E33EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E3550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E369C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E38C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E39B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E3CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1E10E3F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E4084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E4148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E41AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E4260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E43A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E4494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10E458C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E4624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E46D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E4934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10E4B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E4BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E4D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E4DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E4E84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E4EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E5090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E516C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E523C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E5390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E5534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E5670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E57AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E58F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E5A10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E5BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E5C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E5D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E5DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E5E84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E5F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E6010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E61B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v14 = v12;

  _Unwind_Resume(a1);
}

void sub_1E10E6330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E6488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E6514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E66EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E681C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10E6960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E6A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E6C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E6E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1E10E6F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E7080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E71AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E7298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E75AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E76A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E77B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E7828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E78F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  CGFloat v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E10E7BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E7D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E7E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E7EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E801C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E818C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  double v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1E10E8350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E843C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E8550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E8890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E8A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E8C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  -[BrowserController windowScene:performActionForShortcutItem:completionHandler:]::$_3::~$_3(&a9);
  _Unwind_Resume(a1);
}

void sub_1E10E9048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E916C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E92EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E93A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10E9530(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1E10E9678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10E97C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10E989C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E10E9950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E9B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1E10E9D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1E10E9DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10E9E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10E9F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EA088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EA1AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EA2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10EA3D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EA5F8(_Unwind_Exception *exception_object)
{
}

void sub_1E10EA6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EA808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v16 - 40));
  _Unwind_Resume(a1);
}

void sub_1E10EA8A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EA9C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EAABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EAB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EABC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EAC34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EAC98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EAE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EAF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EAFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EB070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EB158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EB220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EB2B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EB380(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E10EB41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EB48C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EB534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EB72C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EB918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EBA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10EBB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1E10EBC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EBD2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EBFDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EC21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getSiriReaderConnectionClass(void)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSiriReaderConnectionClass(void)::softClass;
  uint64_t v7 = getSiriReaderConnectionClass(void)::softClass;
  if (!getSiriReaderConnectionClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = ___ZL28getSiriReaderConnectionClassv_block_invoke;
    v3[3] = &unk_1E6D79088;
    v3[4] = &v4;
    ___ZL28getSiriReaderConnectionClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E10EC334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E10EC544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10EC5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EC7A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EC9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10ECA8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10ECAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10ECB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10ECD38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10ECE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10ECF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10ED058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1E10ED150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10ED210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10ED2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10ED338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10ED42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10ED6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10ED878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10ED908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10ED9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EDA18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EDAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EDCA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EDD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EDE1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EDE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EDF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EE000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EE0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EE130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EE1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EE254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EE2F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ___ZL37observableWebKitFeaturesByDefaultsKeyv_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(MEMORY[0x1E4F1CB18], "safari_shouldObserveWebKitFeature:", v2))
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_keyForWebKitFeature:", v2);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1E10EECE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class ___ZL34get_SWCollaborationButtonViewClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SharedWithYouLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL24SharedWithYouLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D7A020;
    uint64_t v6 = 0;
    SharedWithYouLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!SharedWithYouLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("_SWCollaborationButtonView");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)___ZL34get_SWCollaborationButtonViewClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  get_SWCollaborationButtonViewClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL24SharedWithYouLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SharedWithYouLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void ___ZZ43__BrowserController_scene_openURLContexts__ENK3__2cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
}

id __copy_helper_block_ea8_32c56_ZTSKZ43__BrowserController_scene_openURLContexts__E3__2(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = *(id *)(a2 + 32);
  id result = *(id *)(a2 + 40);
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_ea8_32c56_ZTSKZ43__BrowserController_scene_openURLContexts__E3__2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
}

uint64_t ___ZZ80__BrowserController_windowScene_performActionForShortcutItem_completionHandler__ENK3__3cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 880);
  uint64_t v3 = [*(id *)(a1 + 40) type];
  [v2 handleShortcutItemWithType:v3];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

void sub_1E10EEFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c93_ZTSKZ80__BrowserController_windowScene_performActionForShortcutItem_completionHandler__E3__3(void *a1, uint64_t a2)
{
  a1[4] = *(id *)(a2 + 32);
  a1[5] = *(id *)(a2 + 40);
  uint64_t result = MEMORY[0x1E4E42950](*(void *)(a2 + 48));
  a1[6] = result;
  return result;
}

void __destroy_helper_block_ea8_32c93_ZTSKZ80__BrowserController_windowScene_performActionForShortcutItem_completionHandler__E3__3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
}

Class ___ZL27getQLPreviewControllerClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!QuickLookLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL20QuickLookLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D7A038;
    uint64_t v6 = 0;
    QuickLookLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!QuickLookLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("QLPreviewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)___ZL27getQLPreviewControllerClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getQLPreviewControllerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL20QuickLookLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  QuickLookLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL21getAFPreferencesClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AssistantServicesLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL28AssistantServicesLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D7A050;
    uint64_t v6 = 0;
    AssistantServicesLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!AssistantServicesLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AFPreferences");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)___ZL21getAFPreferencesClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAFPreferencesClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL28AssistantServicesLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL28getSiriReaderConnectionClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SiriReaderServicesLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL29SiriReaderServicesLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D7A068;
    uint64_t v6 = 0;
    SiriReaderServicesLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!SiriReaderServicesLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SiriReaderConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)___ZL28getSiriReaderConnectionClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSiriReaderConnectionClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL29SiriReaderServicesLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SiriReaderServicesLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void sub_1E10EF834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EFA3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EFAF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EFC68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10EFD40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10EFE98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F35C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E10F3758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F3908(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1E10F39D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  char v10 = v9;

  a9.super_class = (Class)AutomationController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1E10F3A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F3AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F3C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F3D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10F4120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F42A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1E10F442C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F4588(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E10F4604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10F46A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10F4798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F48E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F499C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10F4B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10F4D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  CGFloat v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E10F4EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E10F4F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F5034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  CGFloat v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E10F514C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1E10F5234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F52DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F5390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E10F5454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F557C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10F56C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10F5804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E10F59E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F5DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F5F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F6018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F6160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E10F6258(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

__CFString *stringForCurrentTabBarLayoutPreference()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int v1 = [v0 BOOLForKey:*MEMORY[0x1E4F786E0]];

  if (v1) {
    return @"Separate";
  }
  else {
    return @"Compact";
  }
}

void setSafeAreaInsetsFrozenRecursively(void *a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = [v3 view];
  [v4 safeAreaInsets];
  double v7 = *MEMORY[0x1E4FB2848];
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  BOOL v12 = v11 != v8;
  if (v13 != *MEMORY[0x1E4FB2848]) {
    BOOL v12 = 1;
  }
  if (v6 != v10) {
    BOOL v12 = 1;
  }
  int v14 = v5 != v9 || v12;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = objc_msgSend(v3, "childViewControllers", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * v19);
        if (a2)
        {
          double v21 = [*(id *)(*((void *)&v29 + 1) + 8 * v19) view];
          [v21 safeAreaInsets];
          if (v25 != v8 || v22 != v7 || v24 != v10) {
            goto LABEL_27;
          }
          int v28 = v23 == v9 ? v14 : 0;

          if (v28 == 1)
          {
            double v21 = [v20 view];
            [v21 layoutIfNeeded];
LABEL_27:
          }
        }
        [v20 _setIgnoresWrapperViewForContentOverlayInsets:a2];
        setSafeAreaInsetsFrozenRecursively(v20, a2);
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v17);
  }
}

void sub_1E10F8224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E10F902C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getOBWelcomeControllerClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getOBWelcomeControllerClass_softClass;
  uint64_t v7 = getOBWelcomeControllerClass_softClass;
  if (!getOBWelcomeControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getOBWelcomeControllerClass_block_invoke;
    v3[3] = &unk_1E6D77CE0;
    v3[4] = &v4;
    __getOBWelcomeControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E10F96B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getOBBoldTrayButtonClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getOBBoldTrayButtonClass_softClass;
  uint64_t v7 = getOBBoldTrayButtonClass_softClass;
  if (!getOBBoldTrayButtonClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getOBBoldTrayButtonClass_block_invoke;
    v3[3] = &unk_1E6D77CE0;
    v3[4] = &v4;
    __getOBBoldTrayButtonClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E10F9798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E10F9C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E10F9D3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E10FD884(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1E10FE0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getOBWelcomeControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("OBWelcomeController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBWelcomeControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOBWelcomeControllerClass_block_invoke_cold_1();
    OnBoardingKitLibrary();
  }
}

void OnBoardingKitLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __OnBoardingKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6D7A528;
    uint64_t v3 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __OnBoardingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getOBBoldTrayButtonClass_block_invoke(uint64_t a1)
{
  OnBoardingKitLibrary();
  Class result = objc_getClass("OBBoldTrayButton");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBBoldTrayButtonClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getOBBoldTrayButtonClass_block_invoke_cold_1();
    return (Class)__getOBLinkTrayButtonClass_block_invoke(v3);
  }
  return result;
}

Class __getOBLinkTrayButtonClass_block_invoke(uint64_t a1)
{
  OnBoardingKitLibrary();
  Class result = objc_getClass("OBLinkTrayButton");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getOBLinkTrayButtonClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getOBLinkTrayButtonClass_block_invoke_cold_1();
    return (Class)__getSKStoreProductViewControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getSKStoreProductViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!StoreKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __StoreKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D7A540;
    uint64_t v6 = 0;
    StoreKitLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!StoreKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SKStoreProductViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getSKStoreProductViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSKStoreProductViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __StoreKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  StoreKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E110118C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t _cloudTabsEnabledDidChange(uint64_t a1, void *a2)
{
  return [a2 _cloudTabsEnabledDidChange];
}

void sub_1E1102624(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __internalQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MobileSafari.CloudTabStore", 0);
  uint64_t v1 = (void *)internalQueue_internalQueue;
  internalQueue_internalQueue = (uint64_t)v0;
}

void sub_1E11031BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1103298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1103334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11033A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1103404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double snapshotSizeForSuggestedSize(void *a1, double a2, double a3)
{
  id v5 = a1;
  objc_msgSend(v5, "snapshotSizeForSuggestedSize:", a2, a3);
  [v5 desiredSnapshotScale];
  double v7 = v6;

  BOOL v8 = v7 == 0.0 || v7 == 1.79769313e308;
  if (v8 || !CGFloatIsValid()) {
    return 1.79769313e308;
  }
  _SFScreenScale();
  double v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 nativeScale];

  _SFCeilingFloatToPixels();
  double v11 = v10;
  _SFCeilingFloatToPixels();
  return v11;
}

double snapshotSizeByAddingBorderOptions(char a1, double a2)
{
  _SFOnePixel();
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  if ((a1 & 2) != 0) {
    double v5 = v4;
  }
  if ((a1 & 8) == 0) {
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  return a2 + v5 + v4;
}

void sub_1E1107EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11085CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v15 - 128));
  _Unwind_Resume(a1);
}

void sub_1E110A604(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E110D084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1E110DE78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E110E330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1E110E4D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E110E5C0(_Unwind_Exception *a1)
{
  double v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E110E6E0(_Unwind_Exception *a1)
{
  double v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E110E774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E110E960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1E110EAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1E110EB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E110ED68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1E110EE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  double v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)History;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1E110EF7C(_Unwind_Exception *a1)
{
  double v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1E110F0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E110F238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E110F300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E110F498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1E110F538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E110F5AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E110F6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E110F750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E110FAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1E110FBB0()
{
}

void sub_1E110FD5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E110FF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  CGRect v27 = v26;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1E1110078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1110218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  uint64_t v26 = v25;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1E1110350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11104CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1E1110574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t totalWrites()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  objc_msgSend(MEMORY[0x1E4F28F80], "processInfo", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  dispatch_queue_t v0 = 0);
  int v1 = [v0 processIdentifier];

  if (proc_pid_rusage(v1, 4, (rusage_info_t *)&v3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return DWORD2(v4);
  }
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

unint64_t continuousTimeAddInterval(uint64_t a1, double a2)
{
  if (continuousTimeAddInterval_once != -1) {
    dispatch_once(&continuousTimeAddInterval_once, &__block_literal_global_20);
  }
  return ((unint64_t)continuousTimeAddInterval_timebaseInfo * a1 / *(unsigned int *)algn_1EAD7DFBC
        + (unint64_t)(a2 * 1000000000.0))
       * *(unsigned int *)algn_1EAD7DFBC
       / continuousTimeAddInterval_timebaseInfo;
}

uint64_t __continuousTimeAddInterval_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&continuousTimeAddInterval_timebaseInfo);
}

void sub_1E1116AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1116B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PageLoadTestStatistics;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1E1116D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11170C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1117308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11174C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1117680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1118B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *systemImageNameForCompletionIcon(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"book";
  }
  else {
    return off_1E6D7AE98[a1 - 1];
  }
}

void sub_1E1119578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11195DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1119750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E111980C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E111991C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E1119ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1119C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1119CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1119DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1119FB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E111A1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E111A308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E111A41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E111A670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E111A7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E111A968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id messageForVariant(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 == 2)
  {
    long long v5 = NSString;
    long long v6 = _WBSLocalizedString();
    long long v4 = objc_msgSend(v5, "stringWithFormat:", v6, v3);
  }
  else if (a1 == 1)
  {
    long long v4 = _WBSLocalizedString();
  }
  else
  {
    long long v4 = 0;
  }

  return v4;
}

id configurationWithAction(void *a1)
{
  int v1 = (void *)MEMORY[0x1E4FB1658];
  id v2 = a1;
  id v3 = [v1 emptyConfiguration];
  long long v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"lock.fill"];
  [v3 setImage:v4];

  long long v5 = _WBSLocalizedString();
  [v3 setText:v5];

  long long v6 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  long long v7 = _WBSLocalizedString();
  [v6 setTitle:v7];

  [v3 setButton:v6];
  uint64_t v8 = [v3 buttonProperties];
  [v8 setPrimaryAction:v2];

  return v3;
}

id WebViewGeometryDescription(uint64_t a1)
{
  id v2 = NSString;
  id v3 = NSStringFromCGRect(*(CGRect *)a1);
  long long v4 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)(a1 + 32));
  long long v5 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)(a1 + 64));
  long long v15 = *(_OWORD *)(a1 + 96);
  long long v16 = *(_OWORD *)(a1 + 112);
  long long v17 = *(_OWORD *)(a1 + 128);
  long long v18 = *(_OWORD *)(a1 + 144);
  long long v6 = SFNSStringFromScrollIndicatorInsets();
  long long v7 = NSStringFromCGSize(*(CGSize *)(a1 + 160));
  uint64_t v8 = NSStringFromCGSize(*(CGSize *)(a1 + 176));
  uint64_t v9 = NSStringFromCGSize(*(CGSize *)(a1 + 192));
  uint64_t v10 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)(a1 + 208));
  double v11 = (void *)v10;
  BOOL v12 = @"YES";
  if (!*(unsigned char *)(a1 + 240)) {
    BOOL v12 = @"NO";
  }
  objc_msgSend(v2, "stringWithFormat:", @"<WebViewGeometry: frame = %@; unobscuredSafeAreaInsets = %@; obscuredInsets = %@; scrollIndicatorInsets = %@; minimumLayoutSize = %@; minimumUnobscuredLayoutSize = %@; maximumUnobscuredLayoutSize = %@; scrollViewContentInsetAdjustments = %@; inElementFullscreen = %@; minimumEffectiveDeviceWidth = %.2f>",
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v12,
    *(void *)(a1 + 248),
    v15,
    v16,
    v17,
  double v13 = v18);

  return v13;
}

__CFString *WebViewGeometryDescriptionOfDifferenceFromGeometry(uint64_t a1, uint64_t a2, BOOL *a3)
{
  long long v6 = [MEMORY[0x1E4F1CA48] array];
  if (!CGRectEqualToRect(*(CGRect *)a1, *(CGRect *)a2))
  {
    long long v7 = NSString;
    uint64_t v8 = NSStringFromCGRect(*(CGRect *)a1);
    uint64_t v9 = NSStringFromCGRect(*(CGRect *)a2);
    uint64_t v10 = [v7 stringWithFormat:@"frame = %@ → %@", v8, v9];
    [v6 addObject:v10];
  }
  float64x2_t v11 = *(float64x2_t *)(a1 + 32);
  float64x2_t v12 = *(float64x2_t *)(a1 + 48);
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v11, *(float64x2_t *)(a2 + 32)), (int32x4_t)vceqq_f64(v12, *(float64x2_t *)(a2 + 48)))), 0xFuLL))) & 1) == 0)
  {
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = NSString;
    uint64_t v15 = *(void *)(a1 + 56);
    long long v16 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)v11.f64);
    long long v17 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)(a2 + 32));
    long long v18 = [v14 stringWithFormat:@"unobscuredSafeAreaInsets = %@ → %@", v16, v17];
    [v6 addObject:v18];
  }
  float64x2_t v19 = *(float64x2_t *)(a1 + 64);
  float64x2_t v20 = *(float64x2_t *)(a1 + 80);
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v19, *(float64x2_t *)(a2 + 64)), (int32x4_t)vceqq_f64(v20, *(float64x2_t *)(a2 + 80)))), 0xFuLL))) & 1) == 0)
  {
    uint64_t v21 = *(void *)(a1 + 72);
    double v22 = NSString;
    uint64_t v23 = *(void *)(a1 + 88);
    double v24 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)v19.f64);
    double v25 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)(a2 + 64));
    uint64_t v26 = [v22 stringWithFormat:@"obscuredInsets = %@ → %@", v24, v25];
    [v6 addObject:v26];
  }
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 96), *(float64x2_t *)(a2 + 96)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 112), *(float64x2_t *)(a2 + 112)))), 0xFuLL))) & 1) == 0|| (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 128), *(float64x2_t *)(a2 + 128)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 144), *(float64x2_t *)(a2 + 144)))), 0xFuLL))) & 1) == 0)
  {
    CGRect v27 = NSString;
    int v28 = SFNSStringFromScrollIndicatorInsets();
    long long v68 = *(_OWORD *)(a2 + 96);
    long long v69 = *(_OWORD *)(a2 + 112);
    long long v70 = *(_OWORD *)(a2 + 128);
    long long v71 = *(_OWORD *)(a2 + 144);
    long long v29 = SFNSStringFromScrollIndicatorInsets();
    long long v30 = [v27 stringWithFormat:@"scrollIndicatorInsets = %@ → %@", v28, v29, v68, v69, v70, v71];
    [v6 addObject:v30];
  }
  double v31 = *(double *)(a1 + 160);
  double v32 = *(double *)(a1 + 168);
  if (v31 != *(double *)(a2 + 160) || v32 != *(double *)(a2 + 168))
  {
    uint64_t v33 = NSString;
    uint64_t v34 = NSStringFromCGSize(*(CGSize *)&v31);
    v35 = NSStringFromCGSize(*(CGSize *)(a2 + 160));
    id v36 = [v33 stringWithFormat:@"minimumLayoutSize = %@ → %@", v34, v35];
    [v6 addObject:v36];
  }
  double v37 = *(double *)(a1 + 176);
  double v38 = *(double *)(a1 + 184);
  if (v37 != *(double *)(a2 + 176) || v38 != *(double *)(a2 + 184))
  {
    uint64_t v39 = NSString;
    uint64_t v40 = NSStringFromCGSize(*(CGSize *)&v37);
    uint64_t v41 = NSStringFromCGSize(*(CGSize *)(a2 + 176));
    uint64_t v42 = [v39 stringWithFormat:@"minimumUnobscuredLayoutSize = %@ → %@", v40, v41];
    [v6 addObject:v42];
  }
  double v43 = *(double *)(a1 + 192);
  double v44 = *(double *)(a1 + 200);
  if (v43 != *(double *)(a2 + 192) || v44 != *(double *)(a2 + 200))
  {
    v45 = NSString;
    v46 = NSStringFromCGSize(*(CGSize *)&v43);
    uint64_t v47 = NSStringFromCGSize(*(CGSize *)(a2 + 192));
    id v48 = [v45 stringWithFormat:@"maximumUnobscuredLayoutSize = %@ → %@", v46, v47];
    [v6 addObject:v48];
  }
  float64x2_t v49 = *(float64x2_t *)(a1 + 208);
  float64x2_t v50 = *(float64x2_t *)(a1 + 224);
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v49, *(float64x2_t *)(a2 + 208)), (int32x4_t)vceqq_f64(v50, *(float64x2_t *)(a2 + 224)))), 0xFuLL))) & 1) == 0)
  {
    uint64_t v51 = *(void *)(a1 + 216);
    id v52 = NSString;
    uint64_t v53 = *(void *)(a1 + 232);
    long long v54 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)v49.f64);
    long long v55 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)(a2 + 208));
    long long v56 = [v52 stringWithFormat:@"scrollViewContentInsetAdjustments = %@ → %@", v54, v55];
    [v6 addObject:v56];
  }
  if (*(unsigned __int8 *)(a1 + 240) != *(unsigned __int8 *)(a2 + 240))
  {
    v57 = NSString;
    if (*(unsigned char *)(a1 + 240)) {
      id v58 = @"YES";
    }
    else {
      id v58 = @"NO";
    }
    if (*(unsigned char *)(a2 + 240)) {
      id v59 = @"YES";
    }
    else {
      id v59 = @"NO";
    }
    int v60 = v58;
    uint64_t v61 = [v57 stringWithFormat:@"inElementFullscreen = %@ → %@", v60, v59];
    [v6 addObject:v61];
  }
  double v62 = *(double *)(a2 + 248);
  if (*(double *)(a1 + 248) != v62)
  {
    uint64_t v63 = [NSString stringWithFormat:@"minimumEffectiveDeviceWidth = %.2f → %.2f", *(void *)(a1 + 248), *(void *)&v62];
    [v6 addObject:v63];
  }
  if (a3) {
    *a3 = [v6 count] == 0;
  }
  if ([v6 count])
  {
    uint64_t v64 = NSString;
    uint64_t v65 = [v6 componentsJoinedByString:@"; "];
    uint64_t v66 = [v64 stringWithFormat:@"<WebViewGeometry: %@>", v65];
  }
  else
  {
    uint64_t v66 = @"<WebViewGeometry: identical>";
  }

  return v66;
}

BOOL tabSnapshotHasTransparentBorderPadding()
{
  _SFScreenNativeScale();
  return v0 < 2.5;
}

void sub_1E111D9B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1E111F1E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __SectionDictionaryForCompletionGroup_block_invoke(uint64_t a1, void *a2)
{
  v26[6] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v2 urlStringForHistoryServiceCompletionList];
  }
  else
  {
    uint64_t v3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v4 = @" • Open Tab";
  }
  else {
    long long v4 = 0;
  }
  if ([MEMORY[0x1E4F97EA0] isStreamlinedCompletionListEnabled])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      long long v4 = [v2 subtextForHistoryServiceCompletionList];
    }
  }
  long long v5 = [(__CFString *)v3 safari_simplifiedUserVisibleURLStringWithSimplifications:511 forDisplayOnly:1 simplifiedStringOffset:0];
  long long v6 = 0;
  if ([MEMORY[0x1E4F97EA0] isSearchEvaluationLoggingEnabled])
  {
    if (objc_opt_respondsToSelector())
    {
      long long v6 = [v2 uuidString];
    }
    else
    {
      long long v6 = 0;
    }
  }
  v25[0] = @"title";
  uint64_t v7 = [v2 titleForHistoryServiceCompletionList];
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = &stru_1F3C268E8;
  }
  if (v3) {
    uint64_t v10 = v3;
  }
  else {
    uint64_t v10 = &stru_1F3C268E8;
  }
  v26[0] = v9;
  v26[1] = v10;
  v25[1] = @"url";
  v25[2] = @"truncated_url";
  if (v5) {
    float64x2_t v11 = v5;
  }
  else {
    float64x2_t v11 = &stru_1F3C268E8;
  }
  if (v4) {
    float64x2_t v12 = v4;
  }
  else {
    float64x2_t v12 = &stru_1F3C268E8;
  }
  v26[2] = v11;
  v26[3] = v12;
  v25[3] = @"url_subtext";
  v25[4] = @"type";
  id v13 = v2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v14 = NSString;
    uint64_t v15 = [v13 resultType];
    long long v16 = [v14 stringWithFormat:@"SFSearchResult(%@)", v15];
  }
  else
  {
    long long v17 = [v13 sfSearchResultValue];
    uint64_t v15 = [v17 resultBundleId];

    long long v18 = objc_msgSend(v15, "safari_substringFromPrefix:", @"com.apple.Safari.CompletionList.");
    float64x2_t v19 = v18;
    if (v18 || (float64x2_t v19 = v15) != 0)
    {
      id v20 = v19;
    }
    else
    {
      double v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v16 = v20;
  }
  v25[5] = @"uuid";
  if (v6) {
    uint64_t v21 = v6;
  }
  else {
    uint64_t v21 = &stru_1F3C268E8;
  }
  v26[4] = v16;
  v26[5] = v21;
  double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:6];

  return v22;
}

void sub_1E111FCDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E1120344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E11205FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __getSearchUIClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SearchUI");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSearchUIClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSearchUIClass_block_invoke_cold_1();
    SearchUILibrary();
  }
}

void SearchUILibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!SearchUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __SearchUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6D7B010;
    uint64_t v3 = 0;
    SearchUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  double v0 = (void *)v1[0];
  if (!SearchUILibraryCore_frameworkLibrary)
  {
    double v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SearchUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SearchUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSFCardClass_block_invoke(uint64_t a1)
{
  SearchUILibrary();
  Class result = objc_getClass("SFCard");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFCardClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSFCardClass_block_invoke_cold_1();
    return (Class)__getSFLocalImageClass_block_invoke(v3);
  }
  return result;
}

Class __getSFLocalImageClass_block_invoke(uint64_t a1)
{
  SearchUILibrary();
  Class result = objc_getClass("SFLocalImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFLocalImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSFLocalImageClass_block_invoke_cold_1();
    return (Class)__getSFRichTextClass_block_invoke(v3);
  }
  return result;
}

Class __getSFRichTextClass_block_invoke(uint64_t a1)
{
  SearchUILibrary();
  Class result = objc_getClass("SFRichText");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFRichTextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSFRichTextClass_block_invoke_cold_1();
    return (Class)__getSFAttributionFooterCardSectionClass_block_invoke(v3);
  }
  return result;
}

TabDocumentActivityItemProvider *__getSFAttributionFooterCardSectionClass_block_invoke(uint64_t a1)
{
  SearchUILibrary();
  Class result = (TabDocumentActivityItemProvider *)objc_getClass("SFAttributionFooterCardSection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFAttributionFooterCardSectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (TabDocumentActivityItemProvider *)__getSFAttributionFooterCardSectionClass_block_invoke_cold_1();
    return [(TabDocumentActivityItemProvider *)v3 initWithTabDocument:v5];
  }
  return result;
}

void sub_1E1120E54(_Unwind_Exception *a1)
{
  SEL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E1120F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1121068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1121380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11214D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1121578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11215FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11217BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1121B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1121BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1121CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1121D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E112202C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1122EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t didReceiveWebBookmarksReadingListFetchingNotification(uint64_t a1, void *a2)
{
  return [a2 _connectSafariFetcherServerProxy];
}

void sub_1E1128184(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

id getSearchUIClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  double v0 = (void *)getSearchUIClass_softClass_0;
  uint64_t v7 = getSearchUIClass_softClass_0;
  if (!getSearchUIClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSearchUIClass_block_invoke_0;
    v3[3] = &unk_1E6D77CE0;
    v3[4] = &v4;
    __getSearchUIClass_block_invoke_0((uint64_t)v3);
    double v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E112A394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t isNewsScheme(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"applenewss"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"applenews"];
  }

  return v2;
}

id _newsProxy()
{
  double v0 = (void *)_newsProxy_newsProxy;
  if (!_newsProxy_newsProxy)
  {
    uint64_t v1 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.news"];
    uint64_t v2 = (void *)_newsProxy_newsProxy;
    _newsProxy_newsProxy = v1;

    double v0 = (void *)_newsProxy_newsProxy;
  }
  return v0;
}

void sub_1E112B288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSearchUIClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SearchUI");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSearchUIClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSearchUIClass_block_invoke_cold_1();
    SearchUILibrary_0();
  }
}

void SearchUILibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!SearchUILibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __SearchUILibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6D7B288;
    uint64_t v3 = 0;
    SearchUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  double v0 = (void *)v1[0];
  if (!SearchUILibraryCore_frameworkLibrary_0)
  {
    double v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SearchUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SearchUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

SearchQueryRestorationCompletionItem *__getSearchUITableViewCellClass_block_invoke(uint64_t a1)
{
  SearchUILibrary_0();
  uint64_t result = (SearchQueryRestorationCompletionItem *)objc_getClass("SearchUITableViewCell");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSearchUITableViewCellClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSearchUITableViewCellClass_block_invoke_cold_1();
    return [(SearchQueryRestorationCompletionItem *)v3 initWithQuery:v5];
  }
  return result;
}

void sub_1E112D47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

__CFString *mobileGestaltStringForQuery()
{
  double v0 = (__CFString *)MGCopyAnswer();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = &stru_1F3C268E8;
  }
  long long v2 = v1;

  return v2;
}

void sub_1E1135A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1135D3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1E1137BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 128));
  _Unwind_Resume(a1);
}

void sub_1E113A564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(v20);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_1E113D60C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E113DF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SafariNonContaineredLibraryPath()
{
  if (SafariNonContaineredLibraryPath_onceToken != -1) {
    dispatch_once(&SafariNonContaineredLibraryPath_onceToken, &__block_literal_global_3_0);
  }
  double v0 = (void *)SafariNonContaineredLibraryPath_path;
  return v0;
}

void __SafariNonContaineredLibraryPath_block_invoke()
{
  uint64_t v0 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library"];
  uint64_t v1 = (void *)SafariNonContaineredLibraryPath_path;
  SafariNonContaineredLibraryPath_path = v0;
}

id SafariNonContaineredSettingsDirectoryPath()
{
  if (SafariNonContaineredSettingsDirectoryPath_onceToken != -1) {
    dispatch_once(&SafariNonContaineredSettingsDirectoryPath_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)SafariNonContaineredSettingsDirectoryPath_path;
  return v0;
}

void __SafariNonContaineredSettingsDirectoryPath_block_invoke()
{
  uint64_t v0 = SafariNonContaineredLibraryPath();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"Safari"];
  uint64_t v2 = (void *)SafariNonContaineredSettingsDirectoryPath_path;
  SafariNonContaineredSettingsDirectoryPath_path = v1;

  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v3, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", SafariNonContaineredSettingsDirectoryPath_path, 0);
}

id SafariHistoryCloudBackupIndicatorFileURL()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v1 = SafariNonContaineredSettingsDirectoryPath();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"History.ckbackup"];
  id v3 = [v0 fileURLWithPath:v2 isDirectory:0];

  return v3;
}

void sub_1E1142E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E114305C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id dateRepresentingMidnightFromNumberOfDaysAgo(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v3 = (void *)[v2 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  SEL v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v3 components:28 fromDate:v4];

  objc_msgSend(v5, "setDay:", objc_msgSend(v5, "day") - a1);
  uint64_t v6 = [v3 dateFromComponents:v5];

  return v6;
}

void sub_1E1152298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSearchUIFirstTimeExperienceViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SearchUILibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SearchUILibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D7BDC0;
    uint64_t v6 = 0;
    SearchUILibraryCore_frameworkLibrary_1 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!SearchUILibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SearchUIFirstTimeExperienceViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getSearchUIFirstTimeExperienceViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSearchUIFirstTimeExperienceViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t __SearchUILibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  SearchUILibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_1E1155DEC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1E1156290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1158A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1159E28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 184));
  _Unwind_Resume(a1);
}

void sub_1E115A9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1E115F5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E115F6A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication()
{
  if (WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication_onceToken, &__block_literal_global_7);
  }
  return WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCloudBookmarks()
{
  if (WBS_LOG_CHANNEL_PREFIXCloudBookmarks_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCloudBookmarks_onceToken, &__block_literal_global_19);
  }
  return WBS_LOG_CHANNEL_PREFIXCloudBookmarks_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCloudHistory()
{
  if (WBS_LOG_CHANNEL_PREFIXCloudHistory_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCloudHistory_onceToken, &__block_literal_global_22);
  }
  return WBS_LOG_CHANNEL_PREFIXCloudHistory_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXDataMigration()
{
  if (WBS_LOG_CHANNEL_PREFIXDataMigration_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXDataMigration_onceToken, &__block_literal_global_37_1);
  }
  return WBS_LOG_CHANNEL_PREFIXDataMigration_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXDownloads()
{
  if (WBS_LOG_CHANNEL_PREFIXDownloads_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXDownloads_onceToken, &__block_literal_global_43_0);
  }
  return WBS_LOG_CHANNEL_PREFIXDownloads_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXHistoryViewController()
{
  if (WBS_LOG_CHANNEL_PREFIXHistoryViewController_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXHistoryViewController_onceToken, &__block_literal_global_52);
  }
  return WBS_LOG_CHANNEL_PREFIXHistoryViewController_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXMediaCapture()
{
  if (WBS_LOG_CHANNEL_PREFIXMediaCapture_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXMediaCapture_onceToken, &__block_literal_global_58_0);
  }
  return WBS_LOG_CHANNEL_PREFIXMediaCapture_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXOther()
{
  if (WBS_LOG_CHANNEL_PREFIXOther_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXOther_onceToken, &__block_literal_global_61);
  }
  return WBS_LOG_CHANNEL_PREFIXOther_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPLT()
{
  if (WBS_LOG_CHANNEL_PREFIXPLT_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPLT_onceToken, &__block_literal_global_64_0);
  }
  return WBS_LOG_CHANNEL_PREFIXPLT_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXParsec()
{
  if (WBS_LOG_CHANNEL_PREFIXParsec_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXParsec_onceToken, &__block_literal_global_70);
  }
  return WBS_LOG_CHANNEL_PREFIXParsec_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPerformanceTest()
{
  if (WBS_LOG_CHANNEL_PREFIXPerformanceTest_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPerformanceTest_onceToken, &__block_literal_global_79);
  }
  return WBS_LOG_CHANNEL_PREFIXPerformanceTest_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPrinting()
{
  if (WBS_LOG_CHANNEL_PREFIXPrinting_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPrinting_onceToken, &__block_literal_global_82);
  }
  return WBS_LOG_CHANNEL_PREFIXPrinting_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPrivateBrowsing()
{
  if (WBS_LOG_CHANNEL_PREFIXPrivateBrowsing_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPrivateBrowsing_onceToken, &__block_literal_global_85_0);
  }
  return WBS_LOG_CHANNEL_PREFIXPrivateBrowsing_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPush()
{
  if (WBS_LOG_CHANNEL_PREFIXPush_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPush_onceToken, &__block_literal_global_88);
  }
  return WBS_LOG_CHANNEL_PREFIXPush_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXReadingList()
{
  if (WBS_LOG_CHANNEL_PREFIXReadingList_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXReadingList_onceToken, &__block_literal_global_91);
  }
  return WBS_LOG_CHANNEL_PREFIXReadingList_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSiriIntelligence()
{
  if (WBS_LOG_CHANNEL_PREFIXSiriIntelligence_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSiriIntelligence_onceToken, &__block_literal_global_106_0);
  }
  return WBS_LOG_CHANNEL_PREFIXSiriIntelligence_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSiriLink()
{
  if (WBS_LOG_CHANNEL_PREFIXSiriLink_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSiriLink_onceToken, &__block_literal_global_109);
  }
  return WBS_LOG_CHANNEL_PREFIXSiriLink_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXStartPage()
{
  if (WBS_LOG_CHANNEL_PREFIXStartPage_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXStartPage_onceToken, &__block_literal_global_112);
  }
  return WBS_LOG_CHANNEL_PREFIXStartPage_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXTabGroup()
{
  if (WBS_LOG_CHANNEL_PREFIXTabGroup_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXTabGroup_onceToken, &__block_literal_global_118);
  }
  return WBS_LOG_CHANNEL_PREFIXTabGroup_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXTest()
{
  if (WBS_LOG_CHANNEL_PREFIXTest_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXTest_onceToken, &__block_literal_global_130_0);
  }
  return WBS_LOG_CHANNEL_PREFIXTest_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXURLAutocomplete()
{
  if (WBS_LOG_CHANNEL_PREFIXURLAutocomplete_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXURLAutocomplete_onceToken, &__block_literal_global_133);
  }
  return WBS_LOG_CHANNEL_PREFIXURLAutocomplete_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXUserInterface()
{
  if (WBS_LOG_CHANNEL_PREFIXUserInterface_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXUserInterface_onceToken, &__block_literal_global_142);
  }
  return WBS_LOG_CHANNEL_PREFIXUserInterface_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebClips()
{
  if (WBS_LOG_CHANNEL_PREFIXWebClips_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebClips_onceToken, &__block_literal_global_145);
  }
  return WBS_LOG_CHANNEL_PREFIXWebClips_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebDriver()
{
  if (WBS_LOG_CHANNEL_PREFIXWebDriver_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebDriver_onceToken, &__block_literal_global_148);
  }
  return WBS_LOG_CHANNEL_PREFIXWebDriver_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebsiteData()
{
  if (WBS_LOG_CHANNEL_PREFIXWebsiteData_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebsiteData_onceToken, &__block_literal_global_151);
  }
  return WBS_LOG_CHANNEL_PREFIXWebsiteData_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCloudSettings()
{
  if (WBS_LOG_CHANNEL_PREFIXCloudSettings_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCloudSettings_onceToken, &__block_literal_global_154);
  }
  return WBS_LOG_CHANNEL_PREFIXCloudSettings_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebExtensions()
{
  if (WBS_LOG_CHANNEL_PREFIXWebExtensions_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebExtensions_onceToken, &__block_literal_global_157);
  }
  return WBS_LOG_CHANNEL_PREFIXWebExtensions_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXInterstellar()
{
  if (WBS_LOG_CHANNEL_PREFIXInterstellar_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXInterstellar_onceToken, &__block_literal_global_160);
  }
  return WBS_LOG_CHANNEL_PREFIXInterstellar_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSystemNoteTaking()
{
  if (WBS_LOG_CHANNEL_PREFIXSystemNoteTaking_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSystemNoteTaking_onceToken, &__block_literal_global_166_0);
  }
  return WBS_LOG_CHANNEL_PREFIXSystemNoteTaking_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAppReviewPrompt()
{
  if (WBS_LOG_CHANNEL_PREFIXAppReviewPrompt_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAppReviewPrompt_onceToken, &__block_literal_global_169_1);
  }
  return WBS_LOG_CHANNEL_PREFIXAppReviewPrompt_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWidgets()
{
  if (WBS_LOG_CHANNEL_PREFIXWidgets_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWidgets_onceToken, &__block_literal_global_172_0);
  }
  return WBS_LOG_CHANNEL_PREFIXWidgets_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSiriReadThis()
{
  if (WBS_LOG_CHANNEL_PREFIXSiriReadThis_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSiriReadThis_onceToken, &__block_literal_global_175);
  }
  return WBS_LOG_CHANNEL_PREFIXSiriReadThis_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXProfiles()
{
  if (WBS_LOG_CHANNEL_PREFIXProfiles_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXProfiles_onceToken, &__block_literal_global_178_0);
  }
  return WBS_LOG_CHANNEL_PREFIXProfiles_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXBrowsingAssistant()
{
  if (WBS_LOG_CHANNEL_PREFIXBrowsingAssistant_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBrowsingAssistant_onceToken, &__block_literal_global_181);
  }
  return WBS_LOG_CHANNEL_PREFIXBrowsingAssistant_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites()
{
  if (WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites_onceToken, &__block_literal_global_184);
  }
  return WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites_log;
}

void __minimumTitleWidth_block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FB06F8];
  uint64_t v0 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  [@"MMMM" sizeWithAttributes:v1];
  minimumTitleWidth_minimumTitleWidth = v2;
}

void sub_1E1162D14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1E11667CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1E116EB9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E116EEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E116F098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E116FD50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E1171FF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E117218C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1E11732F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_1E1173FD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1E11745C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11748B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1E1175064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id location)
{
}

void sub_1E117528C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1175574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1175788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1175974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1175B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1175FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11773F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E117BB2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E117DB4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

Class __getCKContextClientClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ContextKitLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    void v4[2] = 3221225472;
    v4[3] = __ContextKitLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D7CE48;
    uint64_t v6 = 0;
    ContextKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!ContextKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CKContextClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCKContextClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCKContextClientClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ContextKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ContextKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1E117EFA0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1E117F180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11836A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1183774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1183848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1183924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1183AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1183C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E1183DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1183FEC(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1E11840F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1184558(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1184690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t twoFingerTapNavigationOutcomeForState(uint64_t a1, int a2)
{
  if (a2) {
    return 2;
  }
  else {
    return 3;
  }
}

void sub_1E1184C24(_Unwind_Exception *a1)
{
  uint64_t v8 = v4;

  _Unwind_Resume(a1);
}

void sub_1E1184D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1184E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1E1184F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118509C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11851F4(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1E118528C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11853C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)TabDocument;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1E1185870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11859C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1185AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1185B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1185C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1185D64(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1E1186008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1E11862D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1E118638C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1186524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11866F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11867A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118688C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1186958(_Unwind_Exception *exception_object)
{
  if (v2) {

  }
  _Unwind_Resume(exception_object);
}

void sub_1E1186B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1186CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E1186E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1186F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1187000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11871C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11873B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1187488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11875EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1187688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118791C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1187C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1E1187D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1187E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1188254(_Unwind_Exception *a1)
{
  uint64_t v9 = v7;

  _Unwind_Resume(a1);
}

void sub_1E11883EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118848C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11885A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118864C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1188704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11887A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11888FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1188A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1188AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1188CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1188E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1189020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1189114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11892BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11893F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11895CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_1E1189638()
{
  JUMPOUT(0x1E1189630);
}

void sub_1E118975C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11898C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1189A3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1189B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1189D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1189E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1189F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1189FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118A0F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118A214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118A3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_1E118A488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118A688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118A7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118A884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  float64x2_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E118A9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118AA98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118AD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E118AEC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118AFEC(_Unwind_Exception *a1)
{
  long long v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1E118B1D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118B2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E118B394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118B448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118B4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118B5B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118B67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118BA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118BC7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118BE70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118BFEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118C130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118C1E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118C3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118C4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118C5B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118C668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118C720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118C8F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118CAD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118CB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118CD20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118CE80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118CF30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118CFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118D088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118D298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118D344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118D530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118D5F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118D7B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118D884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118DA7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_1E118DBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118DBF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118DCF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  long long v18 = v17;
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E118DE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118DF48(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;
  objc_destroyWeak(v6);

  objc_destroyWeak((id *)(v5 - 40));
  _Unwind_Resume(a1);
}

void sub_1E118E068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118E0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118E1E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  long long v18 = v17;
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E118E300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118E378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118E480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  long long v18 = v17;
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E118E598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118E67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E118E764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118E904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118E968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118EAAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E118EB64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118EBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118EC20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118EC90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118ED00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118EDC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118EEDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118F164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  CGRect v27 = v24;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E118F288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118F2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118F548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E118F698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118F744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118F870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118F9B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118FB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118FC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118FD48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E118FDF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E118FE70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E118FEDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119005C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119012C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1190210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  float64x2_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E1190400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak((id *)(v24 - 88));

  _Unwind_Resume(a1);
}

void sub_1E119055C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1190A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1E1190CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1E1190F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1191158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119123C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119132C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119147C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1E1191554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1191718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E11917F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1191884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1191A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Block_object_dispose((const void *)(v17 - 64), 8);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E1191B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1191C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E1191D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getPKAddPassesViewControllerClass(void)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPKAddPassesViewControllerClass(void)::softClass;
  uint64_t v7 = getPKAddPassesViewControllerClass(void)::softClass;
  if (!getPKAddPassesViewControllerClass(void)::softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = ___ZL33getPKAddPassesViewControllerClassv_block_invoke;
    v3[3] = &unk_1E6D79088;
    v3[4] = &v4;
    ___ZL33getPKAddPassesViewControllerClassv_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E1191E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E1191EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1192020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11920B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11928FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  _Block_object_dispose((const void *)(v35 - 192), 8);

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E1192B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1192C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1192C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1192D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1192E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1192F64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11931C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E119329C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11933C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E11934D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1193690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1193904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1193980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11939E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1193A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1193AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1193BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1E11940E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11942E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11943AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1194504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11946EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11948CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1194978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11949D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1194B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1194C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1194DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E1194F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1195184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1195248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119543C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E119565C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119570C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11957E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1195900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119598C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11959F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1195D4C(_Unwind_Exception *a1)
{
  if (v4) {

  }
  _Unwind_Resume(a1);
}

void sub_1E1196090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E11964B0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&_ZGVZZZ46__TabDocument__checkForAppLinkWithCompletion__EUb_EUb0_E24systemServiceIdentifiers);

  _Unwind_Resume(a1);
}

void sub_1E119663C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119671C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1196890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E1196960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1196AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1196CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id location)
{
  id v20 = v19;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E1196E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1196F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1197024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11971F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v18 = v13;

  _Unwind_Resume(a1);
}

void sub_1E119732C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11974A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119761C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11976EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1197798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1197810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119787C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11978F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11979EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1197B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1197BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1197DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11980B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E119828C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1198F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,void *a53,void *a54,void *a55,void *a56)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v60 - 128));

  _Unwind_Resume(a1);
}

void sub_1E11992C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_1E1199558(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1199EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1E119A158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119A1FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119A35C(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1E119A46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119AAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,void *a34,void *a35,void *a36)
{
  _Unwind_Resume(a1);
}

void sub_1E119AEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location)
{
  float64x2_t v19 = v17;
  objc_destroyWeak(v19);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E119B014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119B13C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E119B2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119B9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,uint64_t a24,void *a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,void *a34)
{
  _Unwind_Resume(a1);
}

void sub_1E119BE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119BF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119BFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119C248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119C34C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119C444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119C630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119C740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1E119C7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119C864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119C958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E119C9C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119CBC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119CD74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119D5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  _Unwind_Resume(a1);
}

void sub_1E119D764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119D858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119D940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119DAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v14 = v12;

  _Unwind_Resume(a1);
}

void sub_1E119DB7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119DD24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119DE38(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1E119DEB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119DFA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119E0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E119E164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119E1C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119E23C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119E404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119E5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119E698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119E738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119E820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119E92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119E9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119EAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E119EBC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  float64x2_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E119EC68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119ED30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119EE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119EEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E119EFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119F620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, id *location, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v31 - 112));

  _Unwind_Resume(a1);
}

void sub_1E119F80C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119F99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E119FDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1E119FF1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A015C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A0288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E11A0600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1E11A099C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A0AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A0B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A0CCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A0E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A100C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A10B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A1140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A11EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E11A12AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E11A1388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A1448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A14F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A16DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E11A18E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A1A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A1B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A1CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A1FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1E11A2298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A23E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A2448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A250C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A257C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A272C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _PLShouldLogRegisteredEvent()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(uint64_t, __CFString *))getPLShouldLogRegisteredEventSymbolLoc(void)::ptr;
  uint64_t v7 = getPLShouldLogRegisteredEventSymbolLoc(void)::ptr;
  if (!getPLShouldLogRegisteredEventSymbolLoc(void)::ptr)
  {
    id v1 = (void *)PowerLogLibrary();
    v5[3] = (uint64_t)dlsym(v1, "PLShouldLogRegisteredEvent");
    getPLShouldLogRegisteredEventSymbolLoc(void)::ptr = (_UNKNOWN *)v5[3];
    uint64_t v0 = (uint64_t (*)(uint64_t, __CFString *))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)-[Application _showSearchEngineAlertIfNeeded]();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return v0(27, @"MobileSafari-FullScreenVideo");
}

uint64_t _PLLogRegisteredEvent(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t, __CFString *, uint64_t, void))getPLLogRegisteredEventSymbolLoc(void)::ptr;
  uint64_t v9 = getPLLogRegisteredEventSymbolLoc(void)::ptr;
  if (!getPLLogRegisteredEventSymbolLoc(void)::ptr)
  {
    uint64_t v3 = (void *)PowerLogLibrary();
    v7[3] = (uint64_t)dlsym(v3, "PLLogRegisteredEvent");
    getPLLogRegisteredEventSymbolLoc(void)::ptr = (_UNKNOWN *)v7[3];
    uint64_t v2 = (uint64_t (*)(uint64_t, __CFString *, uint64_t, void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    uint64_t v5 = (_Unwind_Exception *)-[Application _showSearchEngineAlertIfNeeded]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2(27, @"MobileSafari-FullScreenVideo", a1, MEMORY[0x1E4F1CBF0]);
}

void sub_1E11A2B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A2BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A2CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A2D94(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E11A2E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A2EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A2F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A30D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E11A318C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A3258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A3374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A3404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A349C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A385C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E11A3984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A3A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A3AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A3B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A3C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A3D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E11A3E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A3EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A3F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A4028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A410C(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1E11A425C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:se180100](a14);
  }
  std::__shared_weak_count::__release_shared[abi:se180100](v17);

  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c87_ZTSKZ74__TabDocument__webView_willSubmitFormValues_userObject_submissionHandler__E3__1(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_ea8_32c87_ZTSKZ74__TabDocument__webView_willSubmitFormValues_userObject_submissionHandler__E3__1(uint64_t a1)
{
  id v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:se180100](v1);
  }
}

void sub_1E11A43F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A44C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A45FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A46C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A475C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A480C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A48B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A4968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E11A4A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A4B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E11A4C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A4D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A4F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A50CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E11A53B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E11A54B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A55B4(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1E11A5644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A56EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A57C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A583C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A5954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A59F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A5A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A5AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A5B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A5BD8(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1E11A5C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A5CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A5E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A5E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A5EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A5F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A6030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A60A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A60FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A6170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A625C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A62EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A6380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A6408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A6474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A6558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A6688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A6778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1E11A689C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E11A6A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A6AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A6F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_1E11A71CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A72BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A73FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A7548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A7630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A7704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A776C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A78CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A7B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A7BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A7C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A7DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A8094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  float64x2_t v19 = v16;

  _Unwind_Resume(a1);
}

void sub_1E11A8170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A81D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A82B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A831C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A8404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A8878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A8A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A8B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A8DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1E11A8EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A90E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A921C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A9434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1E11A9564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A9604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A9688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A96E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A97D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A9898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A99A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A9A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A9AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A9BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11A9CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A9D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11A9F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AA070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AA1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AA3BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AA46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AA57C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AA6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  uint64_t v23 = v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__670(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__671(uint64_t a1)
{
}

void sub_1E11AA7E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AA940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AA9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AAAA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AAB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AABE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AAC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AAEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1E11AAFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB3A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB4F4(_Unwind_Exception *a1)
{
  uint64_t v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1E11AB53C()
{
}

void sub_1E11AB658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB76C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AB9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11ABA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11ABB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11ABBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11ABCC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11ABD90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11ABF64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 64), 8);

  _Unwind_Resume(a1);
}

void sub_1E11AC07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AC14C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AC23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AC360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AC59C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AC6B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AC77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AC7FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AC970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11ACAF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11ACB8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11ACC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11ACD88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11ACED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11ACF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AD004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AD074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AD0D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11AD130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class ___ZL19getFKSaveOrderClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!FinanceKitUILibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    void v4[2] = 3221225472;
    v4[3] = ___ZL23FinanceKitUILibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D7DD38;
    uint64_t v6 = 0;
    FinanceKitUILibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!FinanceKitUILibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("FKSaveOrder");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)___ZL19getFKSaveOrderClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFKSaveOrderClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL23FinanceKitUILibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FinanceKitUILibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL33getPKAddPassesViewControllerClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PassKitUILibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    void v4[2] = 3221225472;
    v4[3] = ___ZL20PassKitUILibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D7DD50;
    uint64_t v6 = 0;
    PassKitUILibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!PassKitUILibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PKAddPassesViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)___ZL33getPKAddPassesViewControllerClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPKAddPassesViewControllerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL20PassKitUILibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitUILibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL27getCLKWatchFaceLibraryClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ClockKitLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    void v4[2] = 3221225472;
    v4[3] = ___ZL19ClockKitLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D7DD68;
    uint64_t v6 = 0;
    ClockKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!ClockKitLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CLKWatchFaceLibrary");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)___ZL27getCLKWatchFaceLibraryClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCLKWatchFaceLibraryClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL19ClockKitLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ClockKitLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void ___ZL14getPKPassClassv_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PKPass");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPassClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    ___ZL14getPKPassClassv_block_invoke_cold_1();
    PassKitCoreLibrary();
  }
}

void PassKitCoreLibrary(void)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!PassKitCoreLibraryCore(char **)::frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = ___ZL22PassKitCoreLibraryCorePPc_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6D7DD80;
    uint64_t v3 = 0;
    PassKitCoreLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!PassKitCoreLibraryCore(char **)::frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t ___ZL22PassKitCoreLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL28getPKPassesXPCContainerClassv_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary();
  Class result = objc_getClass("PKPassesXPCContainer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPassesXPCContainerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = ___ZL28getPKPassesXPCContainerClassv_block_invoke_cold_1();
    return (Class)___ZL38getPLShouldLogRegisteredEventSymbolLocv_block_invoke(v3);
  }
  return result;
}

void *___ZL38getPLShouldLogRegisteredEventSymbolLocv_block_invoke(uint64_t a1)
{
  long long v2 = (void *)PowerLogLibrary();
  Class result = dlsym(v2, "PLShouldLogRegisteredEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPLShouldLogRegisteredEventSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PowerLogLibrary(void)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PowerLogLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = ___ZL19PowerLogLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6D7DD98;
    uint64_t v5 = 0;
    PowerLogLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PowerLogLibraryCore(char **)::frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!PowerLogLibraryCore(char **)::frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t ___ZL19PowerLogLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PowerLogLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void *___ZL32getPLLogRegisteredEventSymbolLocv_block_invoke(uint64_t a1)
{
  long long v2 = (void *)PowerLogLibrary();
  uint64_t result = dlsym(v2, "PLLogRegisteredEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPLLogRegisteredEventSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void std::__shared_weak_count::__release_shared[abi:se180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

Class ___ZL28getSiriReaderConnectionClassv_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SiriReaderServicesLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    void v4[2] = 3221225472;
    v4[3] = ___ZL29SiriReaderServicesLibraryCorePPc_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6D7DDB0;
    uint64_t v6 = 0;
    SiriReaderServicesLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!SiriReaderServicesLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SiriReaderConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)___ZL28getSiriReaderConnectionClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSiriReaderConnectionClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL29SiriReaderServicesLibraryCorePPc_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SiriReaderServicesLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void sub_1E11AF094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E11AF664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11AFA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

void sub_1E11AFD18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B030C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_1E11B05EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B0848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11B0B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1E11B0C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E11B0D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B0F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B14E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1E11B1B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11B4358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B4490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B46E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B47FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11B4894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B491C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11B49BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B4AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B4C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B4F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B5040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)URLCompletionProvider;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1E11B53A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B54E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B564C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B5860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B5D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,id a49)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a44, 8);

  _Unwind_Resume(a1);
}

void sub_1E11B5E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11B5FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B60D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B6174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B6248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B631C(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1E11B663C(_Unwind_Exception *a1)
{
  uint64_t v8 = v5;

  _Unwind_Resume(a1);
}

void sub_1E11B66F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)URLCompletionDatabase;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1E11B6838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11B6EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1E11B70F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11B71BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B74A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id matchDataWithBookmark(WebBookmark *a1, NSString *a2, WBSHistory *a3)
{
  uint64_t v3 = a1;
  long long v4 = (void *)[objc_alloc(MEMORY[0x1E4F784B0]) initWithBookmark:v3];

  return v4;
}

void sub_1E11B7590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B766C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E11B773C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11B9168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __hasAcceptableReadingListDragItems_block_invoke(uint64_t a1, void *a2)
{
  return isAcceptableReadingListDragItem(a2);
}

uint64_t isAcceptableReadingListDragItem(void *a1)
{
  id v1 = a1;
  long long v2 = objc_msgSend(v1, "_sf_localBookmark");
  char v3 = [v2 isReadingListItem];

  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend(v1, "_sf_localURL");
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v6 = [v1 itemProvider];
      uint64_t v4 = [v6 canLoadObjectOfClass:objc_opt_class()];
    }
  }
  return v4;
}

uint64_t __acceptableReadingListDragItems_block_invoke(uint64_t a1, void *a2)
{
  return isAcceptableReadingListDragItem(a2);
}

void sub_1E11BA124(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E11BA194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1E11BA4FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11BA590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11BA5F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11BA684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11BA7D0(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1E11BBF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11BC7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11BCA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11BCC80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1E11BDFF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E11BE458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11BE6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11BF048(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 184));
  _Unwind_Resume(a1);
}

void sub_1E11BFAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11BFDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __usesVibrantAppearance_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  usesVibrantAppearance_flag = [v0 BOOLForKey:@"DebugTabThumbnailCloseButtonUsesVibrantAppearance"];
}

id tabViewFromInteraction(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 view];
  if (objc_opt_respondsToSelector())
  {
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      tabViewFromInteraction_cold_1((uint64_t)v1, (uint64_t)v2, v4);
    }
    id v3 = 0;
  }

  return v3;
}

void sub_1E11C7CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E11C9A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E11CA83C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11CA8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11CB010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32)
{
  _Unwind_Resume(a1);
}

void sub_1E11CB598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1E11CB76C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11CB9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11CBD10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11CC020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1E11CC2EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11CC528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11CC61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11CC678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11CC8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E11CCB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11CCF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(&a26);
  _Unwind_Resume(a1);
}

void sub_1E11CD6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E11CD904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11CD9F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11CDA90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id stringForBarItems(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 17; ++i)
  {
    if (*(unsigned char *)(a1 + i))
    {
      uint64_t v4 = _SFStringForBarItem();
      [v2 addObject:v4];
    }
  }
  uint64_t v5 = NSString;
  uint64_t v6 = [v2 componentsJoinedByString:@", "];
  uint64_t v7 = [v5 stringWithFormat:@"[ %@ ]", v6];

  return v7;
}

void webCryptoMasterKey(void *a1)
{
  id v1 = a1;
  if (singletonMasterKeyFetchQueue_onceToken != -1) {
    dispatch_once(&singletonMasterKeyFetchQueue_onceToken, &__block_literal_global_64);
  }
  uint64_t v2 = singletonMasterKeyFetchQueue_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __webCryptoMasterKey_block_invoke;
  block[3] = &unk_1E6D77E70;
  id v5 = v1;
  id v3 = v1;
  dispatch_async(v2, block);
}

void __webCryptoMasterKey_block_invoke(uint64_t a1)
{
  result[2] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  uint64_t v1 = *MEMORY[0x1E4F3B978];
  uint64_t v2 = *MEMORY[0x1E4F3B988];
  uint64_t v3 = *MEMORY[0x1E4F3B550];
  uint64_t v20 = *MEMORY[0x1E4F3B978];
  uint64_t v21 = v3;
  uint64_t v25 = v2;
  uint64_t v26 = @"com.apple.safari.WebCrypto.master";
  uint64_t v4 = *MEMORY[0x1E4F3B850];
  uint64_t v5 = *MEMORY[0x1E4F3B878];
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  uint64_t v22 = *MEMORY[0x1E4F3B850];
  uint64_t v23 = v5;
  CGRect v27 = @"WebCryptoMasterKey";
  uint64_t v28 = MEMORY[0x1E4F1CC28];
  uint64_t v24 = *MEMORY[0x1E4F3BC70];
  long long v29 = (void *)MEMORY[0x1E4F1CC38];
  CFDictionaryRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v20 count:5];
  result[0] = 0;
  OSStatus v8 = SecItemCopyMatching(v7, result);
  if (v8 == -25300 || v8 == -128) {
    goto LABEL_7;
  }
  if (v8)
  {
    WTFLogAlways();
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v9 = (void *)result[0];
  id v10 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedData:result[0] options:0];

  if (v10)
  {
LABEL_13:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __webCryptoMasterKey_block_invoke_2;
    block[3] = &unk_1E6D78D48;
    id v14 = *(id *)(a1 + 32);
    id v18 = v10;
    id v19 = v14;
    id v15 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);

    return;
  }
LABEL_8:
  if (!CCRandomGenerateBytes(result, 0x10uLL))
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:result length:16];
    uint64_t v20 = v1;
    uint64_t v21 = v3;
    uint64_t v25 = v2;
    uint64_t v26 = @"com.apple.safari.WebCrypto.master";
    uint64_t v22 = v4;
    uint64_t v23 = v5;
    CGRect v27 = @"WebCryptoMasterKey";
    uint64_t v28 = v6;
    uint64_t v24 = *MEMORY[0x1E4F3BD38];
    float64x2_t v12 = [v11 base64EncodedDataWithOptions:0];
    long long v29 = v12;
    CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v20 count:5];

    if (SecItemAdd(v13, 0))
    {
      WTFLogAlways();
      id v10 = 0;
    }
    else
    {
      id v10 = v11;
    }

    goto LABEL_13;
  }
  __break(0xC471u);
}

uint64_t __webCryptoMasterKey_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __singletonMasterKeyFetchQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mobilesafari.WebCryptoMasterKeyFetchQueue", 0);
  uint64_t v1 = (void *)singletonMasterKeyFetchQueue_queue;
  singletonMasterKeyFetchQueue_queue = (uint64_t)v0;
}

void sub_1E11CF858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)SpotlightBookmarksDonationWriter;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1E11CF8EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E11CF9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *startPageSectionIdentifierForCollectionType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"BookmarksCollection"])
  {
    uint64_t v2 = (id *)MEMORY[0x1E4F99690];
LABEL_9:
    uint64_t v3 = (__CFString *)*v2;
    goto LABEL_10;
  }
  if ([v1 isEqualToString:@"CloudTabsCollection"])
  {
    uint64_t v2 = (id *)MEMORY[0x1E4F99688];
    goto LABEL_9;
  }
  [v1 isEqualToString:@"HistoryCollection"];
  if ([v1 isEqualToString:@"ReadingListCollection"])
  {
    uint64_t v2 = (id *)MEMORY[0x1E4F996D8];
    goto LABEL_9;
  }
  if ([v1 isEqualToString:@"SharedWithYouCollection"])
  {
    uint64_t v2 = (id *)MEMORY[0x1E4F996A0];
    goto LABEL_9;
  }
  uint64_t v3 = &stru_1F3C268E8;
LABEL_10:

  return v3;
}

id startPageTitleForCollectionType(void *a1)
{
  id v1 = startPageSectionIdentifierForCollectionType(a1);
  uint64_t v2 = WBSStartPageSectionIdentifierTitle();

  return v2;
}

void sub_1E11D4C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11D502C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11D95B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E11DA968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11DBBD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11DC190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1E11DE8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11E153C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1E11E1A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1E11E4120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E11E5918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t countPinnedItems(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        v4 += [*(id *)(*((void *)&v8 + 1) + 8 * i) isPinned];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_1E11E8DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E11EB088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1E11EC358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void enumerateSubarrayWithRange(void *a1, unint64_t a2, unint64_t a3, void *a4)
{
  long long v8 = a4;
  if (a2 < a3)
  {
    do
    {
      CFDictionaryRef v7 = [a1 objectAtIndex:a2];
      v8[2](v8, v7);

      ++a2;
    }
    while (a3 != a2);
  }
}

void sub_1E11FAD9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id a44)
{
}

double headerLabelHeight()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v0 lineHeight];
  _SFRoundFloatToPixels();
  double v2 = v1;

  return v2;
}

void sub_1E12010E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getSearchUITableViewCellClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getSearchUITableViewCellClass_softClass_0;
  uint64_t v7 = getSearchUITableViewCellClass_softClass_0;
  if (!getSearchUITableViewCellClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSearchUITableViewCellClass_block_invoke_0;
    v3[3] = &unk_1E6D77CE0;
    v3[4] = &v4;
    __getSearchUITableViewCellClass_block_invoke_0((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E1203020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E12037B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getSearchUIClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getSearchUIClass_softClass_1;
  uint64_t v7 = getSearchUIClass_softClass_1;
  if (!getSearchUIClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSearchUIClass_block_invoke_1;
    v3[3] = &unk_1E6D77CE0;
    v3[4] = &v4;
    __getSearchUIClass_block_invoke_1((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1E1203E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E1205AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1206C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1207A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getSearchUITableViewCellClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SearchUITableViewCell");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSearchUITableViewCellClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSearchUITableViewCellClass_block_invoke_cold_1();
    SearchUILibrary_1();
  }
}

void SearchUILibrary_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!SearchUILibraryCore_frameworkLibrary_2)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __SearchUILibraryCore_block_invoke_2;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6D7F1D0;
    uint64_t v3 = 0;
    SearchUILibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  dispatch_queue_t v0 = (void *)v1[0];
  if (!SearchUILibraryCore_frameworkLibrary_2)
  {
    dispatch_queue_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SearchUILibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  SearchUILibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getSearchUIClass_block_invoke_1(uint64_t a1)
{
  SearchUILibrary_1();
  Class result = objc_getClass("SearchUI");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSearchUIClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (FeatureManager *)__getSearchUIClass_block_invoke_cold_1();
    return (Class)[(FeatureManager *)v3 areTabGroupSuggestionsEnabled];
  }
  return result;
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1E120A094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120A0F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120A1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)StartPageController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1E120A39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120A470(_Unwind_Exception *a1)
{
  long long v2 = v1;

  _Unwind_Resume(a1);
}

void sub_1E120A610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_1E120A6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120A86C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id emptyBookmarksSection(void)
{
  dispatch_queue_t v0 = (void *)emptyBookmarksSection(void)::section;
  if (!emptyBookmarksSection(void)::section)
  {
    uint64_t v1 = [MEMORY[0x1E4F98EA8] iconSectionWithIdentifier:&stru_1F3C268E8 title:&stru_1F3C268E8 actions:MEMORY[0x1E4F1CBF0] banner:0 supplementaryAction:0 identifiers:MEMORY[0x1E4F1CBF0] configurationProvider:&__block_literal_global_773];
    long long v2 = (void *)emptyBookmarksSection(void)::section;
    emptyBookmarksSection(void)::section = v1;

    dispatch_queue_t v0 = (void *)emptyBookmarksSection(void)::section;
  }
  return v0;
}

void sub_1E120AA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_1E120AB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120ACB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E120AD44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120AE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  objc_destroyWeak(v17);
  _Unwind_Resume(a1);
}

void sub_1E120B67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49)
{
  _Unwind_Resume(a1);
}

void sub_1E120B944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120BABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120BB88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120BDA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120BF8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120C028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120C180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120C340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id v19 = v18;

  _Unwind_Resume(a1);
}

void sub_1E120C3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120C5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v21);
  objc_destroyWeak((id *)(v24 - 72));

  _Unwind_Resume(a1);
}

void sub_1E120C6DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120C84C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120C964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120C9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E120CA74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120CB54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120CCCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120CD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120CE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120CF44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120D0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120D178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120D2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120D360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120D540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E120D62C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120D6D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120D7D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120D994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120DA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120DBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v19);
  _Unwind_Resume(a1);
}

void sub_1E120DCF0(_Unwind_Exception *a1)
{
  SEL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E120E40C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44)
{
  objc_destroyWeak(v45);
  objc_destroyWeak(a9);

  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1E120E70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120E84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E120E910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E120EA28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120EAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120EBD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  long long v16 = v15;

  objc_destroyWeak(v14);
  _Unwind_Resume(a1);
}

void sub_1E120EC6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120ECE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120EDC4(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1E120EE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120EF70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E120F1BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120F3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1E120F660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120F754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120F944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120FA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E120FD2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120FE10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E120FECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E1210368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1E1210510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121066C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E121076C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1210800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E1210948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1210A8C(_Unwind_Exception *a1)
{
  SEL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E1210C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  long long v16 = v15;

  objc_destroyWeak(v14);
  _Unwind_Resume(a1);
}

void sub_1E1210CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1210D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1210DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1211054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);

  _Unwind_Resume(a1);
}

void sub_1E1211154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1211874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, void *a13, void *a14, id *location, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46)
{
  objc_destroyWeak(v46);
  objc_destroyWeak(a10);

  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1E1211B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1E1211C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E1211CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1211DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1211E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1211EEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1212140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1212224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E12122B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E121242C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E1212498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E12125F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1212694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1212970(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_1E1212B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id titleForSiriSuggestion(void *a1)
{
  id v1 = a1;
  long long v2 = [v1 title];
  if ([v2 length])
  {
    uint64_t v3 = [v1 title];
  }
  else
  {
    SEL v4 = [v1 pageURL];
    uint64_t v3 = [v4 absoluteString];
  }
  return v3;
}

void sub_1E1212C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1212DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v19);
  _Unwind_Resume(a1);
}

void sub_1E1212EEC(_Unwind_Exception *a1)
{
  SEL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E1213308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1E12134A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1E1213538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121364C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id v18 = v17;

  _Unwind_Resume(a1);
}

void sub_1E12136D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1213744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E12137B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1213920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1213AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_1E1213C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1213ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E121405C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1214230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E1214368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E12144FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E1214634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E12147A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E12148A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1214A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E1214BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1214C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1214D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1214DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1214F20(_Unwind_Exception *a1)
{
  long long v2 = v1;

  _Unwind_Resume(a1);
}

void sub_1E1215034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121517C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E121538C(_Unwind_Exception *a1)
{
  SEL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E12154B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1215594(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E121560C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E12156E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E121582C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E12158E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E1215A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1215E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  objc_destroyWeak(v22);
  _Unwind_Resume(a1);
}

void sub_1E1215FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1216158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1E1216214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1216400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v23);

  _Unwind_Resume(a1);
}

void sub_1E12164EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1216CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id *location, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a36, 8);
  objc_destroyWeak(location);

  _Unwind_Resume(a1);
}

void sub_1E1216EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1216FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v12;

  _Unwind_Resume(a1);
}

void sub_1E12170CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1217254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17)
{
  uint64_t v22 = v21;

  _Unwind_Resume(a1);
}

void sub_1E1217314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1217384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1217478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1217588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1217700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_1E1217810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E121788C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E12178F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E121798C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1217A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1217A60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1217AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1217C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1217D7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1217EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1217F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E12183D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1218570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E12185CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1218624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E121867C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E12186D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E121872C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E12187AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E12188B0(_Unwind_Exception *a1)
{
  SEL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1E1218B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E1218C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1218DC4(_Unwind_Exception *a1)
{
  SEL v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1E1218F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E1218FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E12191C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1E1219290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E12193A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E12195EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  uint64_t v20 = v19;

  _Unwind_Resume(a1);
}

void sub_1E1219668()
{
}

void sub_1E1219964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1219AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1219BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  objc_destroyWeak(v14);
  _Unwind_Resume(a1);
}

void sub_1E1219EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1E121A08C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1E121A434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1E121A5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121A848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121AA08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E121AB50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E121B084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E121B200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121B294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121B304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121B4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121B5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121B664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121B6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121B850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1E121BA40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E121BAF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121BCD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E121BE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class ___ZL26getOBPrivacyPresenterClassv_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!OnBoardingKitLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = ___ZL24OnBoardingKitLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6D7FF38;
    uint64_t v5 = 0;
    OnBoardingKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    if (!OnBoardingKitLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      ___ZL26getOBPrivacyPresenterClassv_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("OBPrivacyPresenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getOBPrivacyPresenterClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL24OnBoardingKitLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void *___ZL39getSLHideContextMenuIdentifierSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SocialLayerLibrary();
  uint64_t result = dlsym(v2, "SLHideContextMenuIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSLHideContextMenuIdentifierSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SocialLayerLibrary(void)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SocialLayerLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = ___ZL22SocialLayerLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6D7FF50;
    uint64_t v5 = 0;
    SocialLayerLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SocialLayerLibraryCore(char **)::frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!SocialLayerLibraryCore(char **)::frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t ___ZL22SocialLayerLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SocialLayerLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

Class ___ZL19getSLHighlightClassv_block_invoke(uint64_t a1)
{
  SocialLayerLibrary();
  Class result = objc_getClass("SLHighlight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    ___ZL19getSLHighlightClassv_block_invoke_cold_1();
  }
  getSLHighlightClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void BrowserController.windowScene(_:didActivateWebClip:)()
{
  id v1 = (id)sub_1E1222AF8();
  objc_msgSend(v0, sel_activateWebClipWithID_, v1);
}

void sub_1E121CB60()
{
  id v1 = (id)sub_1E1222AF8();
  objc_msgSend(v0, sel_activateWebClipWithID_, v1);
}

id sub_1E121CBFC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MobileSafariUI_Swift()
{
  return self;
}

void __getSLComposeViewControllerClass_block_invoke_cold_1()
{
}

uint64_t __getCKContextClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_cold_1(v0);
}

uint64_t __getRPTTestRunnerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRPTScrollViewTestParametersClass_block_invoke_cold_1(v0);
}

uint64_t __getRPTScrollViewTestParametersClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRPTResizeTestParametersClass_block_invoke_cold_1(v0);
}

uint64_t __getRPTResizeTestParametersClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[BookmarksBarView _presentCurrentBookmarksPopoverFromButton:animated:](v0);
}

uint64_t ___ZL34get_SWCollaborationButtonViewClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL27getQLPreviewControllerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL27getQLPreviewControllerClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL21getAFPreferencesClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL21getAFPreferencesClassv_block_invoke_cold_1()
{
  return ___ZL28getSiriReaderConnectionClassv_block_invoke_cold_1();
}

uint64_t ___ZL28getSiriReaderConnectionClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_cold_1(v0);
}

uint64_t __getOBWelcomeControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getOBBoldTrayButtonClass_block_invoke_cold_1(v0);
}

uint64_t __getOBBoldTrayButtonClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getOBLinkTrayButtonClass_block_invoke_cold_1(v0);
}

uint64_t __getOBLinkTrayButtonClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSKStoreProductViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getSKStoreProductViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[CloudTabStore currentDevice](v0);
}

void MobileSafariUIMain_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MobileSafariUIMain_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MobileSafariUIMain_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MobileSafariUIMain_cold_4(uint8_t *a1, void *a2, int *a3)
{
  uint64_t v5 = a2;
  int v6 = *__error();
  *(_DWORD *)a1 = 67109120;
  *a3 = v6;
  _os_log_error_impl(&dword_1E102C000, v5, OS_LOG_TYPE_ERROR, "Failed to consume sandbox extension: %{errno}i", a1, 8u);
}

uint64_t __getSearchUIClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFCardClass_block_invoke_cold_1(v0);
}

uint64_t __getSFCardClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFLocalImageClass_block_invoke_cold_1(v0);
}

uint64_t __getSFLocalImageClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFRichTextClass_block_invoke_cold_1(v0);
}

uint64_t __getSFRichTextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFAttributionFooterCardSectionClass_block_invoke_cold_1(v0);
}

uint64_t __getSFAttributionFooterCardSectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSearchUITableViewCellClass_block_invoke_cold_1(v0);
}

void __getSearchUITableViewCellClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[BrowserWindowController updateCloudTabsForEnteringForeground](v0);
}

void __getSearchUIFirstTimeExperienceViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  __64__SafariCloudBookmarksMigrationCoordinator_migrationCoordinator__block_invoke_cold_1(v0, v1);
}

uint64_t ___ZL19getFKSaveOrderClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL33getPKAddPassesViewControllerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL33getPKAddPassesViewControllerClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL27getCLKWatchFaceLibraryClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL27getCLKWatchFaceLibraryClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL14getPKPassClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL14getPKPassClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return ___ZL28getPKPassesXPCContainerClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL28getPKPassesXPCContainerClassv_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return [(WBSURLCompletionMatch(SafariCompletionItem) *)v0 _promptString];
}

void tabViewFromInteraction_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  int v6 = 138543874;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  __int16 v10 = 2114;
  uint64_t v11 = objc_opt_class();
  _os_log_fault_impl(&dword_1E102C000, v5, OS_LOG_TYPE_FAULT, "Tab interaction has unexpected view that isn't a tab view; interaction: %{public}@; view: %@; view class: %{public}@",
    (uint8_t *)&v6,
    0x20u);
}

void ___ZL26getOBPrivacyPresenterClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  ___ZL19getSLHighlightClassv_block_invoke_cold_1(v0);
}

void ___ZL19getSLHighlightClassv_block_invoke_cold_1()
{
}

uint64_t sub_1E1222AF8()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t BKSHIDEventSetDigitizerInfo()
{
  return MEMORY[0x1F410BEF8]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CARenderServerGetFrameCounter()
{
  return MEMORY[0x1F40F4C68]();
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x1F40F4CE0](a, b);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D58](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D68](retstr, t, tx, ty, tz);
}

uint64_t CA_CGRectApplyTransform()
{
  return MEMORY[0x1F40F4DE8]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1F40C96C8](bytes, count);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1F40D78E0](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  MEMORY[0x1F40D9F78](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1F40DA3A0]();
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x1F40DA7F0]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x1F40DA7F8]();
}

uint64_t CGImageBlockGetRect()
{
  return MEMORY[0x1F40DA800]();
}

uint64_t CGImageBlockSetGetCount()
{
  return MEMORY[0x1F40DA828]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x1F40DA830]();
}

uint64_t CGImageBlockSetGetRect()
{
  return MEMORY[0x1F40DA848]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1F40DA850]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x1F40DA928](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1F40DA958]();
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return MEMORY[0x1F40DA988](image);
}

BOOL CGImageGetShouldInterpolate(CGImageRef image)
{
  return MEMORY[0x1F40DA990](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x1F40DA9C0]();
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x1F40DAA08]();
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CPCanSendMail()
{
  return MEMORY[0x1F41092A0]();
}

uint64_t CPDateFormatStringForFormatType()
{
  return MEMORY[0x1F41092E0]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

uint64_t CTLineCopyHighlightPathForStringRange()
{
  return MEMORY[0x1F40DF750]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x1F40DF7C8](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CTLineGetOffsetForStringIndex(CTLineRef line, CFIndex charIndex, CGFloat *secondaryOffset)
{
  MEMORY[0x1F40DF7F0](line, charIndex, secondaryOffset);
  return result;
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x1F40E88D8]();
}

uint64_t IOHIDEventCreateDigitizerEvent()
{
  return MEMORY[0x1F40E8910]();
}

uint64_t IOHIDEventCreateDigitizerFingerEvent()
{
  return MEMORY[0x1F40E8918]();
}

uint64_t IOHIDEventSetFloatValue()
{
  return MEMORY[0x1F40E8A78]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x1F40E8A80]();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x1F40E8AC0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.id location = v2;
  return result;
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1F40E7168]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4166AA0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1F4166AC0](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t SBSAcquireWallpaperAnimationSuspensionAssertion()
{
  return MEMORY[0x1F415C5D8]();
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x1F415C380]();
}

uint64_t SFBarContentAlphaForSquishTransformFactor()
{
  return MEMORY[0x1F412FA48]();
}

uint64_t SFChromeVisibilityForScrollDistance()
{
  return MEMORY[0x1F412FA50]();
}

uint64_t SFContrastingStatusBarStyleForInterfaceStyle()
{
  return MEMORY[0x1F412FA58]();
}

uint64_t SFCreateAppSuggestionBannerFromMetaTagContent()
{
  return MEMORY[0x1F412FA60]();
}

uint64_t SFDebugMenuEnabled()
{
  return MEMORY[0x1F40F67B8]();
}

uint64_t SFDefaultBrowserSelectionStateKey()
{
  return MEMORY[0x1F412FA78]();
}

uint64_t SFDeferrableUpdateViewDidMoveToWindow()
{
  return MEMORY[0x1F412FA90]();
}

uint64_t SFDeferrableUpdateViewShouldAttemptToUpdateContents()
{
  return MEMORY[0x1F412FA98]();
}

uint64_t SFDeviceIsAlwaysReachable()
{
  return MEMORY[0x1F412FAA0]();
}

uint64_t SFDeviceSupportsPointerInteractions()
{
  return MEMORY[0x1F412FAA8]();
}

uint64_t SFEnhancedTabOverviewEnabled()
{
  return MEMORY[0x1F412FAB0]();
}

uint64_t SFFocusGroupIdentifierForOwner()
{
  return MEMORY[0x1F412FAB8]();
}

uint64_t SFNSStringFromScrollIndicatorInsets()
{
  return MEMORY[0x1F412FAD8]();
}

uint64_t SFShouldHandleSelectionForPresses()
{
  return MEMORY[0x1F412FAE8]();
}

uint64_t SFSystemImageNameForBarItem()
{
  return MEMORY[0x1F412FAF0]();
}

uint64_t SFSystemImageNameForMediaStateIcon()
{
  return MEMORY[0x1F412FAF8]();
}

uint64_t SFSystemImageNameForTogglingMediaStateIcon()
{
  return MEMORY[0x1F412FB00]();
}

uint64_t SFTabGroupSwitcherEnabled()
{
  return MEMORY[0x1F412FB08]();
}

uint64_t SFTabOverviewMaximumNumberOfColumns()
{
  return MEMORY[0x1F412FB10]();
}

uint64_t SFTabOverviewMinimumItemWidthForBounds()
{
  return MEMORY[0x1F412FB18]();
}

uint64_t SFTabOverviewNumberOfColumns()
{
  return MEMORY[0x1F412FB20]();
}

uint64_t SFTabOverviewScaleTranslationForZPosition()
{
  return MEMORY[0x1F412FB28]();
}

uint64_t SFTabOverviewShouldUseCompactAppearanceForSize()
{
  return MEMORY[0x1F412FB30]();
}

uint64_t SFTabOverviewVanishingPointForView()
{
  return MEMORY[0x1F412FB38]();
}

uint64_t SFTintImage()
{
  return MEMORY[0x1F412FB40]();
}

uint64_t SFTitleForTogglingMediaStateIcon()
{
  return MEMORY[0x1F412FB48]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

uint64_t SecTrustFlushResponseCache()
{
  return MEMORY[0x1F40F7218]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4166B18]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4166B70]();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return MEMORY[0x1F4166B78](*(void *)&argc, argv, principalClassName, delegateClassName);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1F4166BC0]();
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x1F4166BD8]();
}

uint64_t UIEdgeInsetsMax()
{
  return MEMORY[0x1F4166BE0]();
}

uint64_t UIEdgeInsetsMin()
{
  return MEMORY[0x1F4166BE8]();
}

uint64_t UIEdgeInsetsReplace()
{
  return MEMORY[0x1F4166BF0]();
}

uint64_t UIEdgeInsetsSubtract()
{
  return MEMORY[0x1F4166C00]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4166CB8](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

uint64_t UIKeyboardAlwaysShowCandidateBarForCurrentInputMode()
{
  return MEMORY[0x1F4166CE8]();
}

uint64_t UIKeyboardGetCurrentInputMode()
{
  return MEMORY[0x1F4166D10]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

uint64_t WBSAutomaticTabClosingIntervalAnalyticsTitle()
{
  return MEMORY[0x1F414A358]();
}

uint64_t WBSAutomaticTabClosingIntervalPromptTitle()
{
  return MEMORY[0x1F414A360]();
}

uint64_t WBSAutomaticTabClosingIntervalSettingsTitle()
{
  return MEMORY[0x1F414A368]();
}

uint64_t WBSAutomaticTabClosingIntervalTimeInterval()
{
  return MEMORY[0x1F414A370]();
}

uint64_t WBSBrowsingAssistantConsentStateName()
{
  return MEMORY[0x1F414A378]();
}

uint64_t WBSContentBlockerStatisticsStoreClearStoresForProfilesWithIdentifiers()
{
  return MEMORY[0x1F414A380]();
}

uint64_t WBSForYouLinkRecommendationSourceDownvoteActionTitle()
{
  return MEMORY[0x1F414A3B0]();
}

uint64_t WBSIsEqual()
{
  return MEMORY[0x1F414A1B8]();
}

uint64_t WBSIsiPad()
{
  return MEMORY[0x1F414A3C0]();
}

uint64_t WBSLoadBuiltInContentBlockersWithStore()
{
  return MEMORY[0x1F414A3D0]();
}

uint64_t WBSLogWithDifferentialPrivacy()
{
  return MEMORY[0x1F414A1D0]();
}

uint64_t WBSMakeAccessibilityIdentifier()
{
  return MEMORY[0x1F414A1D8]();
}

uint64_t WBSReloadReadingListWidget()
{
  return MEMORY[0x1F414A418]();
}

uint64_t WBSSetUpAccessToAppDataContainerWithIdentifier()
{
  return MEMORY[0x1F414A230]();
}

uint64_t WBSStartPageSectionIdentifierTitle()
{
  return MEMORY[0x1F414A448]();
}

uint64_t WBSStatusCodeGroupFromStatusCode()
{
  return MEMORY[0x1F414A238]();
}

uint64_t WBSTimeUntilNextWeeklyAnalyticsReportForKey()
{
  return MEMORY[0x1F414A240]();
}

uint64_t WBSUISafariSandboxBrokerInterface()
{
  return MEMORY[0x1F414A460]();
}

uint64_t WBSURLForHighlight()
{
  return MEMORY[0x1F414A468]();
}

uint64_t WBSUnifiedFieldInputTypeForString()
{
  return MEMORY[0x1F414A470]();
}

uint64_t WBSUserMediaPermissionToWKPermissionDecision()
{
  return MEMORY[0x1F414A478]();
}

uint64_t WBSUserMediaPermissionToWKPermissionDecisionCamera()
{
  return MEMORY[0x1F414A480]();
}

uint64_t WBSUserMediaPermissionToWKPermissionDecisionMicrophone()
{
  return MEMORY[0x1F414A488]();
}

uint64_t WTFLogAlways()
{
  return MEMORY[0x1F40E9EE8]();
}

uint64_t WebBookmarksHistoryFolderTitle()
{
  return MEMORY[0x1F416AAF0]();
}

uint64_t WebBookmarksReadingListFolderTitle()
{
  return MEMORY[0x1F416AAF8]();
}

uint64_t WebBookmarksRootBookmarkTitle()
{
  return MEMORY[0x1F416AB00]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

uint64_t _SFAccessibilityIdentifierForBarItem()
{
  return MEMORY[0x1F412FB58]();
}

uint64_t _SFApplicationNameForDesktopUserAgent()
{
  return MEMORY[0x1F412FB60]();
}

uint64_t _SFApplicationNameForUserAgent()
{
  return MEMORY[0x1F412FB68]();
}

uint64_t _SFBackdropGroupNameForOwner()
{
  return MEMORY[0x1F412FB70]();
}

uint64_t _SFCGPointsEqualWithEpsilon()
{
  return MEMORY[0x1F412FB80]();
}

uint64_t _SFCGRectGrowToSize()
{
  return MEMORY[0x1F412FB88]();
}

uint64_t _SFCeilingFloatToPixels()
{
  return MEMORY[0x1F412FB98]();
}

uint64_t _SFClamp()
{
  return MEMORY[0x1F412FBA0]();
}

uint64_t _SFClampPercent()
{
  return MEMORY[0x1F412FBA8]();
}

uint64_t _SFContextInfoWithComment()
{
  return MEMORY[0x1F412FBB8]();
}

uint64_t _SFCustomUserAgentStringIfNeeded()
{
  return MEMORY[0x1F412FBC0]();
}

uint64_t _SFDarkTintStyleForStyle()
{
  return MEMORY[0x1F412FBC8]();
}

uint64_t _SFDefaultLayoutMargins()
{
  return MEMORY[0x1F412FBD0]();
}

uint64_t _SFDeviceHasHomeButton()
{
  return MEMORY[0x1F412FBE0]();
}

uint64_t _SFDeviceIsPad()
{
  return MEMORY[0x1F412FBE8]();
}

uint64_t _SFDeviceRegionCodeIsRussia()
{
  return MEMORY[0x1F40F67C0]();
}

uint64_t _SFDeviceSupportsDesktopSitesByDefault()
{
  return MEMORY[0x1F412FBF8]();
}

uint64_t _SFDeviceSupportsWebKitFullscreenAPI()
{
  return MEMORY[0x1F412FC00]();
}

uint64_t _SFEqualWithEpsilon()
{
  return MEMORY[0x1F412FC08]();
}

uint64_t _SFFlipRectInCoordinateSpace()
{
  return MEMORY[0x1F412FC10]();
}

uint64_t _SFImageForMediaStateIcon()
{
  return MEMORY[0x1F412FC30]();
}

uint64_t _SFInterpolate()
{
  return MEMORY[0x1F412FC40]();
}

uint64_t _SFIsDarkTintStyle()
{
  return MEMORY[0x1F412FC48]();
}

uint64_t _SFIsPrivateTintStyle()
{
  return MEMORY[0x1F412FC50]();
}

uint64_t _SFLightTintStyleForStyle()
{
  return MEMORY[0x1F412FC58]();
}

uint64_t _SFLocalizedTitleStringForShortcutItemType()
{
  return MEMORY[0x1F40F67C8]();
}

uint64_t _SFMediaStateIconIsMuted()
{
  return MEMORY[0x1F412FC68]();
}

uint64_t _SFOnePixel()
{
  return MEMORY[0x1F412FC78]();
}

uint64_t _SFPopoverSourceInfoUnwrap()
{
  return MEMORY[0x1F412FC88]();
}

uint64_t _SFPreferredMailContentTypeForActivityContentType()
{
  return MEMORY[0x1F40F67D0]();
}

uint64_t _SFRectIsInvalid()
{
  return MEMORY[0x1F412FC90]();
}

uint64_t _SFRoundEdgeInsetsToPixels()
{
  return MEMORY[0x1F412FC98]();
}

uint64_t _SFRoundFloatToPixels()
{
  return MEMORY[0x1F412FCA0]();
}

uint64_t _SFRoundPointToPixels()
{
  return MEMORY[0x1F412FCA8]();
}

uint64_t _SFRoundRectToPixels()
{
  return MEMORY[0x1F412FCB0]();
}

uint64_t _SFSafariContainerPath()
{
  return MEMORY[0x1F412FCC0]();
}

uint64_t _SFSafariIconImageCacheDirectoryPath()
{
  return MEMORY[0x1F412FCD8]();
}

uint64_t _SFSafariIconLinkImage()
{
  return MEMORY[0x1F412FCE0]();
}

uint64_t _SFSafariTestContentDirectoryPath()
{
  return MEMORY[0x1F412FCE8]();
}

uint64_t _SFScreenNativeScale()
{
  return MEMORY[0x1F412FCF0]();
}

uint64_t _SFScreenScale()
{
  return MEMORY[0x1F412FCF8]();
}

uint64_t _SFSizeClassForWidth()
{
  return MEMORY[0x1F412FD00]();
}

uint64_t _SFStringForBarItem()
{
  return MEMORY[0x1F412FD08]();
}

uint64_t _SFTypeIsExtractableArchive()
{
  return MEMORY[0x1F40F67D8]();
}

uint64_t _SFUninterpolate()
{
  return MEMORY[0x1F412FD18]();
}

uint64_t _SFWidthIsCompactSizeClass()
{
  return MEMORY[0x1F412FD20]();
}

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x1F41670E8]();
}

uint64_t _UIUpdateRequestDeactivate()
{
  return MEMORY[0x1F41670F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _WBSLocalizedString()
{
  return MEMORY[0x1F414A250]();
}

uint64_t SafariShared::SuddenTerminationDisabler::enableSuddenTermination(SafariShared::SuddenTerminationDisabler *this)
{
  return MEMORY[0x1F414A268](this);
}

uint64_t SafariShared::SuddenTerminationDisabler::SuddenTerminationDisabler(SafariShared::SuddenTerminationDisabler *this, NSString *a2)
{
  return MEMORY[0x1F414A270](this, a2);
}

uint64_t SafariShared::ReaderAvailabilityController::configureProcessPool(SafariShared::ReaderAvailabilityController *this, WKProcessPool *a2)
{
  return MEMORY[0x1F414A538](this, a2);
}

uint64_t SafariShared::ReaderAvailabilityController::updateReaderOrTranslationLastActivated(SafariShared::ReaderAvailabilityController *this, WKProcessPool *a2)
{
  return MEMORY[0x1F414A578](this, a2);
}

uint64_t SafariShared::BookmarkAndHistoryCompletionMatch::hasMatchWithOptions()
{
  return MEMORY[0x1F414A598]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x1F4181550](cls, name);
}

uint64_t ct_green_tea_logger_create_static()
{
  return MEMORY[0x1F417A380]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

long double expm1(long double __x)
{
  MEMORY[0x1F40CC000](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1F40CC0A0](a1);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return (char *)MEMORY[0x1F40CC0F0](a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1F417A398]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

int getopt_long_only(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x1F40CC478](*(void *)&a1, a2, a3, a4, a5);
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1F40CC608](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1F4181628](m, imp);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x1F40CCE48](__y, __x);
  return result;
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1F40CCEA0](__rqtp, __rmtp);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1F40CD890](*(void *)&pid, *(void *)&flavor, buffer);
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AC8](property);
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

void rewind(FILE *a1)
{
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t scalable_zone_info()
{
  return MEMORY[0x1F40CDE88]();
}

uint64_t showInternalTranslationActions()
{
  return MEMORY[0x1F414A5B8]();
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

void srand(unsigned int a1)
{
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}