@interface LayoutConstants
@end

@implementation LayoutConstants

void ___LayoutConstants_block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v6 scaledValue:3 withOverride:18.0 forSizeClass:19.5];
  _LayoutConstants___constants_0 = v2;
  [v6 scaledValue:17.0];
  _LayoutConstants___constants_1 = v3;
  [v6 scaledValue:15.5];
  _LayoutConstants___constants_2 = v4;
  [v6 scaledValue:62.0];
  _LayoutConstants___constants_3 = v5;
}

void ___LayoutConstants_block_invoke_0(uint64_t a1, void *a2)
{
  v98[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x1E4F19A40] metricsWithDevice:v2 identitySizeClass:2];
  [v3 setRoundingBehavior:1];
  v97[0] = &unk_1F16E02A0;
  v97[1] = &unk_1F16E02B8;
  v98[0] = &unk_1F16E5650;
  v98[1] = &unk_1F16E5660;
  v97[2] = &unk_1F16E02D0;
  v98[2] = &unk_1F16E5670;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:3];
  [v3 scaledValue:v4 withOverrides:10.0];
  _LayoutConstants_constants = v5;

  [v3 scaledValue:3 withOverride:2.0 forSizeClass:2.5];
  qword_1E9FA6500 = v6;
  v95[0] = &unk_1F16E02A0;
  v95[1] = &unk_1F16E02D0;
  v96[0] = &unk_1F16E5680;
  v96[1] = &unk_1F16E5690;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];
  [v3 scaledValue:v7 withOverrides:50.0];
  qword_1E9FA6510 = v8;

  v93[0] = &unk_1F16E02A0;
  v93[1] = &unk_1F16E02D0;
  v94[0] = &unk_1F16E5680;
  v94[1] = &unk_1F16E5690;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:2];
  [v3 scaledValue:v9 withOverrides:50.0];
  qword_1E9FA6508 = v10;

  v91[0] = &unk_1F16E02A0;
  v91[1] = &unk_1F16E02B8;
  v92[0] = &unk_1F16E56A0;
  v92[1] = &unk_1F16E56B0;
  v91[2] = &unk_1F16E02D0;
  v92[2] = &unk_1F16E56C0;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:3];
  [v3 scaledValue:v11 withOverrides:20.5];
  qword_1E9FA6518 = v12;

  v89[0] = &unk_1F16E02E8;
  v89[1] = &unk_1F16E02D0;
  v90[0] = &unk_1F16E56D0;
  v90[1] = &unk_1F16E56D0;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:2];
  [v3 constantValue:v13 withOverrides:0.0];
  qword_1E9FA65C0 = v14;

  v87[0] = &unk_1F16E02A0;
  v87[1] = &unk_1F16E02B8;
  v88[0] = &unk_1F16E56E0;
  v88[1] = &unk_1F16E56F0;
  v87[2] = &unk_1F16E02D0;
  v88[2] = &unk_1F16E5700;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:3];
  [v3 scaledValue:v15 withOverrides:64.5];
  qword_1E9FA6520 = v16;

  v85[0] = &unk_1F16E02A0;
  v85[1] = &unk_1F16E02D0;
  v86[0] = &unk_1F16E5710;
  v86[1] = &unk_1F16E5720;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
  [v3 scaledValue:v17 withOverrides:22.0];
  qword_1E9FA6528 = v18;

  v83[0] = &unk_1F16E02A0;
  v83[1] = &unk_1F16E02D0;
  v84[0] = &unk_1F16E5730;
  v84[1] = &unk_1F16E5740;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];
  [v3 scaledValue:v19 withOverrides:40.0];
  qword_1E9FA6530 = v20;

  [v3 scaledValue:16.0];
  qword_1E9FA6538 = v21;
  v81[0] = &unk_1F16E02A0;
  v81[1] = &unk_1F16E02D0;
  v82[0] = &unk_1F16E5710;
  v82[1] = &unk_1F16E5720;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];
  [v3 scaledValue:v22 withOverrides:22.0];
  qword_1E9FA6540 = v23;

  v79[0] = &unk_1F16E02A0;
  v79[1] = &unk_1F16E02B8;
  v80[0] = &unk_1F16E5750;
  v80[1] = &unk_1F16E5760;
  v79[2] = &unk_1F16E02D0;
  v80[2] = &unk_1F16E5770;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:3];
  [v3 scaledValue:v24 withOverrides:60.0];
  qword_1E9FA6550 = v25;

  v77[0] = &unk_1F16E02A0;
  v77[1] = &unk_1F16E02B8;
  v78[0] = &unk_1F16E5780;
  v78[1] = &unk_1F16E5790;
  v77[2] = &unk_1F16E02D0;
  v78[2] = &unk_1F16E57A0;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:3];
  [v3 scaledValue:v26 withOverrides:5.5];
  qword_1E9FA6558 = v27;

  v75[0] = &unk_1F16E02A0;
  v75[1] = &unk_1F16E02B8;
  v76[0] = &unk_1F16E5760;
  v76[1] = &unk_1F16E57B0;
  v75[2] = &unk_1F16E02D0;
  v76[2] = &unk_1F16E57C0;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];
  [v3 scaledValue:v28 withOverrides:66.0];
  qword_1E9FA6560 = v29;

  if ([v2 deviceCategory] == 1 || objc_msgSend(v2, "deviceCategory") == 2)
  {
    [v2 screenBounds];
  }
  else
  {
    [v3 scaledValue:162.0];
    uint64_t v30 = v31;
  }
  qword_1E9FA6568 = v30;
  v73[0] = &unk_1F16E02A0;
  v73[1] = &unk_1F16E02D0;
  v74[0] = &unk_1F16E5710;
  v74[1] = &unk_1F16E57D0;
  v73[2] = &unk_1F16E0300;
  v73[3] = &unk_1F16E0318;
  v74[2] = &unk_1F16E57D0;
  v74[3] = &unk_1F16E5720;
  v73[4] = &unk_1F16E0330;
  v73[5] = &unk_1F16E0348;
  v74[4] = &unk_1F16E5720;
  v74[5] = &unk_1F16E57D0;
  v73[6] = &unk_1F16E0360;
  v74[6] = &unk_1F16E5720;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:7];
  [v3 scaledValue:v32 withOverrides:22.0];
  qword_1E9FA6570 = v33;

  v71[0] = &unk_1F16E02A0;
  v71[1] = &unk_1F16E02D0;
  v72[0] = &unk_1F16E5710;
  v72[1] = &unk_1F16E5720;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
  [v3 scaledValue:v34 withOverrides:22.0];
  qword_1E9FA6548 = v35;

  v69[0] = &unk_1F16E02A0;
  v69[1] = &unk_1F16E02B8;
  v70[0] = &unk_1F16E0378;
  v70[1] = &unk_1F16E0378;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];
  [v3 constantValue:v36 withOverrides:6.0];
  qword_1E9FA65C8 = v37;

  v67[0] = &unk_1F16E02A0;
  v67[1] = &unk_1F16E02D0;
  v68[0] = &unk_1F16E57E0;
  v68[1] = &unk_1F16E57F0;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];
  [v3 scaledValue:v38 withOverrides:10.0];
  qword_1E9FA6578 = v39;

  v65[0] = &unk_1F16E02A0;
  v65[1] = &unk_1F16E02B8;
  v66[0] = &unk_1F16E5800;
  v66[1] = &unk_1F16E5800;
  v65[2] = &unk_1F16E02D0;
  v65[3] = &unk_1F16E0300;
  v66[2] = &unk_1F16E5810;
  v66[3] = &unk_1F16E0390;
  v65[4] = &unk_1F16E0318;
  v65[5] = &unk_1F16E0330;
  v66[4] = &unk_1F16E5820;
  v66[5] = &unk_1F16E5830;
  v65[6] = &unk_1F16E0348;
  v65[7] = &unk_1F16E0360;
  v66[6] = &unk_1F16E5780;
  v66[7] = &unk_1F16E5830;
  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:8];
  [v3 scaledValue:v40 withOverrides:12.0];
  qword_1E9FA65D0 = v41;

  v63[0] = &unk_1F16E02E8;
  v63[1] = &unk_1F16E02D0;
  v64[0] = &unk_1F16E5840;
  v64[1] = &unk_1F16E5850;
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];
  [v3 constantValue:v42 withOverrides:0.0];
  qword_1E9FA65D8 = v43;

  v61[0] = &unk_1F16E02A0;
  v61[1] = &unk_1F16E02B8;
  v62[0] = &unk_1F16E5860;
  v62[1] = &unk_1F16E5860;
  v61[2] = &unk_1F16E02D0;
  v62[2] = &unk_1F16E5870;
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];
  [v3 scaledValue:v44 withOverrides:-5.5];
  uint64_t v46 = v45;

  [v3 scaledValue:0 withOverride:1.0 forSizeClass:2.0];
  uint64_t v48 = v47;
  [v3 scaledValue:0 withOverride:1.0 forSizeClass:0.5];
  qword_1E9FA64E0 = v48;
  *(void *)algn_1E9FA64E8 = v46;
  qword_1E9FA64F0 = v49;
  unk_1E9FA64F8 = v46;
  switch([v2 sizeClass])
  {
    case 0:
      xmmword_1E9FA6580 = xmmword_1BC8A01D0;
      *(_OWORD *)algn_1E9FA6590 = xmmword_1BC8A01E0;
      _Q0 = xmmword_1BC8A0200;
      goto LABEL_14;
    case 1:
      xmmword_1E9FA6580 = xmmword_1BC8A01D0;
      *(_OWORD *)algn_1E9FA6590 = xmmword_1BC8A01E0;
      __asm { FMOV            V0.2D, #7.0 }
LABEL_14:
      long long v60 = xmmword_1BC8A01F0;
      goto LABEL_16;
    case 2:
      xmmword_1E9FA6580 = (__int128)vdupq_n_s64(0x3FE8C7E28240B780uLL);
      *(int64x2_t *)algn_1E9FA6590 = vdupq_n_s64(0x3FEC28F5C28F5C29uLL);
      _Q0 = xmmword_1BC8A01B0;
      long long v60 = xmmword_1BC8A01C0;
LABEL_16:
      xmmword_1E9FA65A0 = _Q0;
      xmmword_1E9FA65B0 = v60;
      goto LABEL_17;
    case 3:
      long long v51 = xmmword_1BC8A0190;
      xmmword_1E9FA6580 = (__int128)vdupq_n_s64(0x3FE8C7E28240B780uLL);
      *(int64x2_t *)algn_1E9FA6590 = vdupq_n_s64(0x3FEC28F5C28F5C29uLL);
      long long v53 = xmmword_1BC8A01A0;
      goto LABEL_9;
    case 4:
    case 7:
      int64x2_t v50 = vdupq_n_s64(0x3FE7AACD9E83E425uLL);
      long long v51 = xmmword_1BC8A0170;
      unint64_t v52 = 0x3FEB851EB851EB85;
      goto LABEL_8;
    case 5:
    case 6:
    case 8:
      int64x2_t v50 = vdupq_n_s64(0x3FE8C7E28240B780uLL);
      long long v51 = xmmword_1BC8A0170;
      unint64_t v52 = 0x3FEC28F5C28F5C29;
LABEL_8:
      xmmword_1E9FA6580 = (__int128)v50;
      *(int64x2_t *)algn_1E9FA6590 = vdupq_n_s64(v52);
      long long v53 = xmmword_1BC8A0180;
LABEL_9:
      xmmword_1E9FA65B0 = v51;
      break;
    default:
      __asm { FMOV            V0.2D, #1.0 }
      xmmword_1E9FA6580 = _Q0;
      *(_OWORD *)algn_1E9FA6590 = _Q0;
      long long v53 = 0uLL;
      xmmword_1E9FA65B0 = 0u;
      break;
  }
  xmmword_1E9FA65A0 = v53;
LABEL_17:
}

void ___LayoutConstants_block_invoke_1(uint64_t a1, uint64_t a2)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v23[0] = &unk_1F16E0498;
  v23[1] = &unk_1F16E04B0;
  v24[0] = &unk_1F16E5910;
  v24[1] = &unk_1F16E5920;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v2 scaledValue:v3 withOverrides:16.5];
  _LayoutConstants_constants_0 = v4;

  [v2 scaledValue:0 withOverride:13.5 forSizeClass:12.0];
  _LayoutConstants_constants_1 = v5;
  v21[0] = &unk_1F16E0498;
  v21[1] = &unk_1F16E04B0;
  v22[0] = &unk_1F16E5930;
  v22[1] = &unk_1F16E5940;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v2 scaledValue:v6 withOverrides:19.5];
  _LayoutConstants_constants_2 = v7;

  v19[0] = &unk_1F16E0498;
  v19[1] = &unk_1F16E04C8;
  v20[0] = &unk_1F16E5950;
  v20[1] = &unk_1F16E5950;
  v19[2] = &unk_1F16E04E0;
  v20[2] = &unk_1F16E5950;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  [v2 scaledValue:v8 withOverrides:2.0];
  _LayoutConstants_constants_3 = v9;

  v17[0] = &unk_1F16E0498;
  v17[1] = &unk_1F16E04B0;
  v18[0] = &unk_1F16E5960;
  v18[1] = &unk_1F16E5970;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v2 scaledValue:v10 withOverrides:4.5];
  _LayoutConstants_constants_4 = v11;

  _LayoutConstants_constants_5 = 0x4020000000000000;
  v15[0] = &unk_1F16E0498;
  v15[1] = &unk_1F16E04B0;
  v16[0] = &unk_1F16E5980;
  v16[1] = &unk_1F16E5990;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v2 scaledValue:v12 withOverrides:17.0];
  uint64_t v14 = v13;

  _LayoutConstants_constants_6 = v14;
  _LayoutConstants_constants_7 = v14;
}

void ___LayoutConstants_block_invoke_2(uint64_t a1, uint64_t a2)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:11.0];
  _LayoutConstants_constants_4_0 = v3;
  [v2 scaledValue:9.0];
  _LayoutConstants_constants_6_0 = v4;
  v31[0] = &unk_1F16E05A0;
  v31[1] = &unk_1F16E05B8;
  v32[0] = &unk_1F16E59A0;
  v32[1] = &unk_1F16E59A0;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  [v2 scaledValue:v5 withOverrides:4.0];
  _LayoutConstants_constants_7_0 = v6;

  v29[0] = &unk_1F16E05A0;
  v29[1] = &unk_1F16E05B8;
  v30[0] = &unk_1F16E59B0;
  v30[1] = &unk_1F16E59C0;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  [v2 scaledValue:v7 withOverrides:19.5];
  _LayoutConstants_constants_0_0 = v8;

  v27[0] = &unk_1F16E05A0;
  v27[1] = &unk_1F16E05B8;
  v28[0] = &unk_1F16E59D0;
  v28[1] = &unk_1F16E59E0;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v2 scaledValue:v9 withOverrides:19.5];
  _LayoutConstants_constants_1_0 = v10;

  v25[0] = &unk_1F16E05A0;
  v25[1] = &unk_1F16E05B8;
  v26[0] = &unk_1F16E59D0;
  v26[1] = &unk_1F16E59E0;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  [v2 scaledValue:v11 withOverrides:19.5];

  v23[0] = &unk_1F16E05A0;
  v23[1] = &unk_1F16E05B8;
  v24[0] = &unk_1F16E59F0;
  v24[1] = &unk_1F16E5A00;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v2 scaledValue:v12 withOverrides:16.5];
  _LayoutConstants_constants_2_0 = v13;

  v21[0] = &unk_1F16E05A0;
  v21[1] = &unk_1F16E05B8;
  v22[0] = &unk_1F16E5A10;
  v22[1] = &unk_1F16E5A20;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v2 scaledValue:v14 withOverrides:7.5];
  _LayoutConstants_constants_3_0 = v15;

  v19[0] = &unk_1F16E05A0;
  v19[1] = &unk_1F16E05D0;
  v20[0] = &unk_1F16E5A30;
  v20[1] = &unk_1F16E5A30;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v2 scaledValue:v16 withOverrides:8.5];
  uint64_t v18 = v17;

  _LayoutConstants_constants_9 = v18;
  _LayoutConstants_constants_11 = v18;
}

void ___LayoutConstants_block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v13 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  if (CLKLanguageIsTallScript()) {
    [v13 scaledValue:3 withOverride:12.0 forSizeClass:13.5];
  }
  else {
    [v13 scaledValue:15.0];
  }
  *(void *)&_LayoutConstants_constants_0 = v2;
  [v13 scaledValue:10.5];
  *((void *)&_LayoutConstants_constants_0 + 1) = v3;
  [v13 scaledValue:9.5];
  qword_1E9FA67E0 = v4;
  [v13 scaledValue:3 withOverride:22.5 forSizeClass:25.5];
  qword_1E9FA67E8 = v5;
  [v13 scaledValue:9.5];
  *(void *)&xmmword_1E9FA67F0 = v6;
  [v13 scaledValue:3 withOverride:33.5 forSizeClass:38.0];
  *((void *)&xmmword_1E9FA67F0 + 1) = v7;
  [v13 scaledValue:9.5];
  qword_1E9FA6800 = v8;
  [v13 scaledValue:3 withOverride:3.5 forSizeClass:4.0];
  qword_1E9FA6808 = v9;
  [v13 scaledValue:3 withOverride:2.0 forSizeClass:2.5];
  *(void *)&xmmword_1E9FA6810 = v10;
  [v13 scaledValue:3 withOverride:133.5 forSizeClass:151.0];
  *((void *)&xmmword_1E9FA6810 + 1) = v11;
  [v13 scaledValue:3 withOverride:50.0 forSizeClass:57.0];
  qword_1E9FA6820 = v12;
}

void ___LayoutConstants_block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v3 scaledValue:3.0];
  _LayoutConstants___constants_0_0 = v2;
}

void ___LayoutConstants_block_invoke_5(uint64_t a1, void *a2)
{
  v139[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  _LayoutConstants___constants = xmmword_1BC8A0360;
  qword_1E9FA6880 = 0;
  qword_1E9FA68D8 = 0x4008000000000000;
  v138[0] = &unk_1F16E0720;
  v138[1] = &unk_1F16E0678;
  v139[0] = &unk_1F16E5A40;
  v139[1] = &unk_1F16E5A50;
  v138[2] = &unk_1F16E0738;
  v139[2] = &unk_1F16E5A60;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:v138 count:3];
  [v4 scaledValue:v5 withOverrides:73.0];
  qword_1E9FA6888 = v6;

  v136[0] = &unk_1F16E0720;
  v136[1] = &unk_1F16E0678;
  v137[0] = &unk_1F16E5A70;
  v137[1] = &unk_1F16E5A80;
  v136[2] = &unk_1F16E0738;
  v137[2] = &unk_1F16E5A90;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v137 forKeys:v136 count:3];
  [v4 scaledValue:v7 withOverrides:151.0];
  qword_1E9FA6890 = v8;

  v134[0] = &unk_1F16E0720;
  v134[1] = &unk_1F16E0678;
  v135[0] = &unk_1F16E5AA0;
  v135[1] = &unk_1F16E5AA0;
  v134[2] = &unk_1F16E06A8;
  v134[3] = &unk_1F16E0738;
  v135[2] = &unk_1F16E5AB0;
  v135[3] = &unk_1F16E5AB0;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v135 forKeys:v134 count:4];
  [v4 scaledValue:v9 withOverrides:2.0];
  qword_1E9FA6898 = v10;

  v132[0] = &unk_1F16E0738;
  v132[1] = &unk_1F16E0750;
  v133[0] = &unk_1F16E5AB0;
  v133[1] = &unk_1F16E5AA0;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v133 forKeys:v132 count:2];
  [v4 scaledValue:v11 withOverrides:2.0];
  qword_1E9FA68A0 = v12;

  v130[0] = &unk_1F16E06A8;
  v130[1] = &unk_1F16E0738;
  v131[0] = &unk_1F16E5AC0;
  v131[1] = &unk_1F16E5AD0;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v131 forKeys:v130 count:2];
  [v4 constantValue:v13 withOverrides:0.0];
  qword_1E9FA68A8 = v14;

  [v4 scaledValue:3 withOverride:2.0 forSizeClass:2.0];
  qword_1E9FA68B0 = v15;
  [v3 screenBounds];
  double v17 = v16 * 0.5;
  [v4 scaledValue:83.0];
  *(double *)&qword_1E9FA68A8 = v17 - v18;
  [v3 screenBounds];
  double v20 = v19;

  [v4 scaledValue:96.5];
  *(double *)&qword_1E9FA68B0 = v20 * 0.5 - v21;
  [v4 scaledValue:12.5];
  qword_1E9FA68C0 = v22;
  [v4 scaledValue:5.0];
  qword_1E9FA68C8 = v23;
  v128[0] = &unk_1F16E0720;
  v128[1] = &unk_1F16E0678;
  v129[0] = &unk_1F16E5AA0;
  v129[1] = &unk_1F16E5AA0;
  v128[2] = &unk_1F16E0738;
  v129[2] = &unk_1F16E5AE0;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v129 forKeys:v128 count:3];
  [v4 scaledValue:v24 withOverrides:157.0];
  qword_1E9FA68B8 = v25;

  [v4 scaledValue:3 withOverride:10.0 forSizeClass:14.0];
  qword_1E9FA68D0 = v26;
  v126[0] = &unk_1F16E0720;
  v126[1] = &unk_1F16E0678;
  v127[0] = &unk_1F16E5AF0;
  v127[1] = &unk_1F16E5B00;
  v126[2] = &unk_1F16E0738;
  v127[2] = &unk_1F16E5B10;
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v127 forKeys:v126 count:3];
  [v4 scaledValue:v27 withOverrides:150.0];
  qword_1E9FA6900 = v28;

  v124[0] = &unk_1F16E06D8;
  v124[1] = &unk_1F16E0768;
  v125[0] = &unk_1F16E5B20;
  v125[1] = &unk_1F16E5B30;
  v124[2] = &unk_1F16E0750;
  v124[3] = &unk_1F16E0780;
  v125[2] = &unk_1F16E5B40;
  v125[3] = &unk_1F16E5B50;
  v124[4] = &unk_1F16E0708;
  v125[4] = &unk_1F16E5B60;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:5];
  [v4 scaledValue:v29 withOverrides:1.5];
  qword_1E9FA6918 = v30;

  qword_1E9FA6920 = 0x400C000000000000;
  v123[0] = &unk_1F16E5B70;
  v123[1] = &unk_1F16E5B80;
  v122[0] = &unk_1F16E0720;
  v122[1] = &unk_1F16E0678;
  v123[2] = &unk_1F16E5B90;
  v123[3] = &unk_1F16E5BA0;
  v122[2] = &unk_1F16E0738;
  v122[3] = &unk_1F16E06D8;
  v122[4] = &unk_1F16E0768;
  v122[5] = &unk_1F16E0750;
  v123[4] = &unk_1F16E5BB0;
  v123[5] = &unk_1F16E5BB0;
  uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:6];
  [v4 scaledValue:v31 withOverrides:16.5];
  qword_1E9FA68E0 = v32;

  v121[0] = &unk_1F16E5BC0;
  v121[1] = &unk_1F16E5BD0;
  v120[0] = &unk_1F16E0720;
  v120[1] = &unk_1F16E0678;
  v121[2] = &unk_1F16E5BE0;
  v121[3] = &unk_1F16E5BF0;
  v120[2] = &unk_1F16E0738;
  v120[3] = &unk_1F16E06D8;
  v121[4] = &unk_1F16E5C00;
  v121[5] = &unk_1F16E5C00;
  v120[4] = &unk_1F16E0768;
  v120[5] = &unk_1F16E0750;
  v120[6] = &unk_1F16E0780;
  v120[7] = &unk_1F16E0708;
  v121[6] = &unk_1F16E5C10;
  v121[7] = &unk_1F16E5A60;
  uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:v120 count:8];
  [v4 scaledValue:v33 withOverrides:65.5];
  qword_1E9FA68E8 = v34;

  v118[0] = &unk_1F16E0720;
  v118[1] = &unk_1F16E0678;
  v119[0] = &unk_1F16E5C20;
  v119[1] = &unk_1F16E5C30;
  v119[2] = &unk_1F16E5C40;
  v118[2] = &unk_1F16E0738;
  v118[3] = &unk_1F16E06D8;
  uint64_t v35 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -73.5];
  v119[3] = v35;
  v118[4] = &unk_1F16E0768;
  v36 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -85.0];
  v119[4] = v36;
  v118[5] = &unk_1F16E0750;
  uint64_t v37 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -85.0];
  v119[5] = v37;
  v118[6] = &unk_1F16E0780;
  v38 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -86.5];
  v119[6] = v38;
  uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:7];
  [v4 scaledValue:v39 withOverrides:-64.5];
  qword_1E9FA68F0 = v40;

  v116[0] = &unk_1F16E0720;
  v116[1] = &unk_1F16E0678;
  v117[0] = &unk_1F16E5C50;
  v117[1] = &unk_1F16E5C50;
  v117[2] = &unk_1F16E5C60;
  v116[2] = &unk_1F16E0738;
  v116[3] = &unk_1F16E06D8;
  uint64_t v41 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -17.5];
  v117[3] = v41;
  v116[4] = &unk_1F16E0768;
  v42 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -23.0];
  v117[4] = v42;
  v116[5] = &unk_1F16E0750;
  uint64_t v43 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -23.0];
  v117[5] = v43;
  v116[6] = &unk_1F16E0780;
  v44 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -25.5];
  v117[6] = v44;
  v116[7] = &unk_1F16E0708;
  uint64_t v45 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -18.5];
  v117[7] = v45;
  uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v116 count:8];
  [v4 scaledValue:v46 withOverrides:-15.5];
  qword_1E9FA68F8 = v47;

  v114[0] = &unk_1F16E0720;
  v114[1] = &unk_1F16E0678;
  v115[0] = &unk_1F16E5AA0;
  v115[1] = &unk_1F16E5AA0;
  v115[2] = &unk_1F16E5C60;
  v114[2] = &unk_1F16E0738;
  v114[3] = &unk_1F16E06D8;
  uint64_t v48 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -17.5];
  v115[3] = v48;
  v114[4] = &unk_1F16E0768;
  uint64_t v49 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -23.0];
  v115[4] = v49;
  v114[5] = &unk_1F16E0750;
  int64x2_t v50 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -23.0];
  v115[5] = v50;
  v114[6] = &unk_1F16E0780;
  long long v51 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -22.0];
  v115[6] = v51;
  v114[7] = &unk_1F16E0708;
  unint64_t v52 = [NSNumber numberWithDouble:*(double *)&qword_1E9FA6920 + -19.0];
  v115[7] = v52;
  long long v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:8];
  [v4 scaledValue:v53 withOverrides:-15.5];
  qword_1E9FA6910 = v54;

  v112[0] = &unk_1F16E0720;
  v112[1] = &unk_1F16E0738;
  v113[0] = &unk_1F16E5B30;
  v113[1] = &unk_1F16E5C70;
  v112[2] = &unk_1F16E06D8;
  v112[3] = &unk_1F16E0768;
  v113[2] = &unk_1F16E5C80;
  v113[3] = &unk_1F16E5C90;
  v112[4] = &unk_1F16E0750;
  v113[4] = &unk_1F16E5C90;
  v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:5];
  [v4 scaledValue:v55 withOverrides:11.0];
  qword_1E9FA6908 = v56;

  v110[0] = &unk_1F16E0720;
  v110[1] = &unk_1F16E0678;
  v111[0] = &unk_1F16E5AA0;
  v111[1] = &unk_1F16E5AA0;
  v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:v110 count:2];
  [v4 scaledValue:v57 withOverrides:12.5];
  qword_1E9FA6938 = v58;

  v108[0] = &unk_1F16E0720;
  v108[1] = &unk_1F16E0678;
  v109[0] = &unk_1F16E5AA0;
  v109[1] = &unk_1F16E5AA0;
  v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:2];
  [v4 scaledValue:v59 withOverrides:2.0];
  qword_1E9FA6928 = v60;

  v106[0] = &unk_1F16E0720;
  v106[1] = &unk_1F16E0678;
  v107[0] = &unk_1F16E5AA0;
  v107[1] = &unk_1F16E5AA0;
  v107[2] = &unk_1F16E5CA0;
  v107[3] = &unk_1F16E5CB0;
  v106[2] = &unk_1F16E0738;
  v106[3] = &unk_1F16E06D8;
  v106[4] = &unk_1F16E0768;
  v106[5] = &unk_1F16E0750;
  v107[4] = &unk_1F16E5CC0;
  v107[5] = &unk_1F16E5CC0;
  v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:6];
  [v4 scaledValue:v61 withOverrides:3.0];
  qword_1E9FA6930 = v62;

  v104[0] = &unk_1F16E0720;
  v104[1] = &unk_1F16E0678;
  v105[0] = &unk_1F16E5AA0;
  v105[1] = &unk_1F16E5AA0;
  v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:2];
  [v4 scaledValue:v63 withOverrides:37.5];
  qword_1E9FA6940 = v64;

  v102[0] = &unk_1F16E0720;
  v102[1] = &unk_1F16E0678;
  v103[0] = &unk_1F16E5AA0;
  v103[1] = &unk_1F16E5AA0;
  v102[2] = &unk_1F16E06D8;
  v102[3] = &unk_1F16E0768;
  v103[2] = &unk_1F16E5CD0;
  v103[3] = &unk_1F16E5CE0;
  v102[4] = &unk_1F16E0750;
  v102[5] = &unk_1F16E0780;
  v103[4] = &unk_1F16E5CE0;
  v103[5] = &unk_1F16E5B50;
  v102[6] = &unk_1F16E0708;
  v103[6] = &unk_1F16E5CF0;
  v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:7];
  [v4 scaledValue:v65 withOverrides:1.0];
  qword_1E9FA6948 = v66;

  v100[0] = &unk_1F16E0720;
  v100[1] = &unk_1F16E0678;
  v101[0] = &unk_1F16E5CA0;
  v101[1] = &unk_1F16E5CA0;
  v100[2] = &unk_1F16E0738;
  v100[3] = &unk_1F16E06D8;
  v101[2] = &unk_1F16E5D00;
  v101[3] = &unk_1F16E5D00;
  v100[4] = &unk_1F16E0768;
  v100[5] = &unk_1F16E0750;
  v101[4] = &unk_1F16E5D00;
  v101[5] = &unk_1F16E5D00;
  v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:6];
  [v4 scaledValue:v67 withOverrides:10.0];
  qword_1E9FA6950 = v68;

  v98[0] = &unk_1F16E0720;
  __asm { FMOV            V0.2D, #1.5 }
  long long v89 = _Q0;
  long long v97 = _Q0;
  v74 = [MEMORY[0x1E4F29238] valueWithBytes:&v97 objCType:"{CGSize=dd}"];
  v99[0] = v74;
  v98[1] = &unk_1F16E0678;
  long long v96 = v89;
  v75 = [MEMORY[0x1E4F29238] valueWithBytes:&v96 objCType:"{CGSize=dd}"];
  v99[1] = v75;
  v98[2] = &unk_1F16E06A8;
  __asm { FMOV            V0.2D, #11.5 }
  long long v95 = _Q0;
  v77 = [MEMORY[0x1E4F29238] valueWithBytes:&v95 objCType:"{CGSize=dd}"];
  v99[2] = v77;
  v98[3] = &unk_1F16E0738;
  __asm { FMOV            V0.2D, #16.0 }
  long long v94 = _Q0;
  v79 = [MEMORY[0x1E4F29238] valueWithBytes:&v94 objCType:"{CGSize=dd}"];
  v99[3] = v79;
  v98[4] = &unk_1F16E06D8;
  __asm { FMOV            V0.2D, #15.0 }
  long long v93 = _Q0;
  v81 = [MEMORY[0x1E4F29238] valueWithBytes:&v93 objCType:"{CGSize=dd}"];
  v99[4] = v81;
  void v98[5] = &unk_1F16E0768;
  __asm { FMOV            V0.2D, #17.0 }
  long long v90 = _Q0;
  long long v92 = _Q0;
  v83 = [MEMORY[0x1E4F29238] valueWithBytes:&v92 objCType:"{CGSize=dd}"];
  v99[5] = v83;
  v98[6] = &unk_1F16E0750;
  long long v91 = v90;
  v84 = [MEMORY[0x1E4F29238] valueWithBytes:&v91 objCType:"{CGSize=dd}"];
  v99[6] = v84;
  v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:7];
  objc_msgSend(v4, "constantSize:withOverrides:", v85, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  qword_1E9FA6958 = v86;
  unk_1E9FA6960 = v87;

  __asm { FMOV            V0.2D, #-2.0 }
  unk_1E9FA6968 = _Q0;
}

void ___LayoutConstants_block_invoke_6(uint64_t a1, uint64_t a2)
{
  v43[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:0 withOverride:120.0 forSizeClass:103.0];
  *(void *)&_LayoutConstants___constants_0 = v3;
  v42[0] = &unk_1F16E0900;
  v42[1] = &unk_1F16E0918;
  v43[0] = &unk_1F16E5DD0;
  v43[1] = &unk_1F16E5DE0;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
  [v2 scaledValue:v4 withOverrides:116.0];
  *((void *)&_LayoutConstants___constants_0 + 1) = v5;

  v40[0] = &unk_1F16E0900;
  v40[1] = &unk_1F16E0930;
  v41[0] = &unk_1F16E5DF0;
  v41[1] = &unk_1F16E5E00;
  v40[2] = &unk_1F16E0918;
  v40[3] = &unk_1F16E0948;
  v41[2] = &unk_1F16E5E10;
  v41[3] = &unk_1F16E5E10;
  v40[4] = &unk_1F16E0960;
  v40[5] = &unk_1F16E0978;
  v41[4] = &unk_1F16E5E20;
  v41[5] = &unk_1F16E5E30;
  v40[6] = &unk_1F16E0990;
  v40[7] = &unk_1F16E09A8;
  v41[6] = &unk_1F16E5E10;
  v41[7] = &unk_1F16E5E40;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:8];
  [v2 scaledValue:v6 withOverrides:4.0];
  qword_1E9FA6A50 = v7;

  v38[0] = &unk_1F16E0900;
  v38[1] = &unk_1F16E0918;
  v39[0] = &unk_1F16E5E50;
  v39[1] = &unk_1F16E5D10;
  v38[2] = &unk_1F16E0948;
  v38[3] = &unk_1F16E0960;
  v39[2] = &unk_1F16E5E60;
  v39[3] = &unk_1F16E5D10;
  v38[4] = &unk_1F16E0978;
  v38[5] = &unk_1F16E0990;
  v39[4] = &unk_1F16E5E70;
  v39[5] = &unk_1F16E5E80;
  v38[6] = &unk_1F16E09A8;
  v39[6] = &unk_1F16E5E80;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:7];
  [v2 scaledValue:v8 withOverrides:-1.5];
  qword_1E9FA6A58 = v9;

  v36[0] = &unk_1F16E0900;
  v36[1] = &unk_1F16E0918;
  v37[0] = &unk_1F16E5E90;
  v37[1] = &unk_1F16E5EA0;
  v36[2] = &unk_1F16E0960;
  v36[3] = &unk_1F16E0978;
  v37[2] = &unk_1F16E5EA0;
  v37[3] = &unk_1F16E5EB0;
  v36[4] = &unk_1F16E0990;
  v36[5] = &unk_1F16E09A8;
  v37[4] = &unk_1F16E5E50;
  v37[5] = &unk_1F16E5EA0;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:6];
  [v2 scaledValue:v10 withOverrides:-4.0];
  *(void *)&xmmword_1E9FA6A60 = v11;

  v34[0] = &unk_1F16E0900;
  v34[1] = &unk_1F16E0930;
  v35[0] = &unk_1F16E5E10;
  v35[1] = &unk_1F16E5EC0;
  v34[2] = &unk_1F16E0918;
  v35[2] = &unk_1F16E5E00;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
  [v2 scaledValue:v12 withOverrides:5.5];
  *((void *)&xmmword_1E9FA6A60 + 1) = v13;

  v32[0] = &unk_1F16E0900;
  v32[1] = &unk_1F16E0930;
  v33[0] = &unk_1F16E5E10;
  v33[1] = &unk_1F16E5EC0;
  v32[2] = &unk_1F16E0918;
  v33[2] = &unk_1F16E5E00;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
  [v2 scaledValue:v14 withOverrides:0.5];
  qword_1E9FA6A70 = v15;

  v30[0] = &unk_1F16E0900;
  v30[1] = &unk_1F16E0930;
  v31[0] = &unk_1F16E5ED0;
  v31[1] = &unk_1F16E5EE0;
  void v30[2] = &unk_1F16E0918;
  void v31[2] = &unk_1F16E5EF0;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
  [v2 scaledValue:v16 withOverrides:0.0];
  qword_1E9FA6A78 = v17;

  v28[0] = &unk_1F16E0900;
  v28[1] = &unk_1F16E0930;
  v29[0] = &unk_1F16E5F00;
  v29[1] = &unk_1F16E5E90;
  void v28[2] = &unk_1F16E0918;
  void v29[2] = &unk_1F16E5EB0;
  double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
  [v2 scaledValue:v18 withOverrides:-5.5];
  *(void *)&xmmword_1E9FA6A80 = v19;

  v26[0] = &unk_1F16E0900;
  v26[1] = &unk_1F16E0918;
  v27[0] = &unk_1F16E5E10;
  v27[1] = &unk_1F16E5E80;
  double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  [v2 scaledValue:v20 withOverrides:5.0];
  *((void *)&xmmword_1E9FA6A80 + 1) = v21;

  v24[0] = &unk_1F16E0900;
  v24[1] = &unk_1F16E0930;
  v25[0] = &unk_1F16E5E10;
  v25[1] = &unk_1F16E5E80;
  void v24[2] = &unk_1F16E0918;
  void v25[2] = &unk_1F16E5F10;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  [v2 scaledValue:v22 withOverrides:1.0];
  qword_1E9FA6A90 = v23;
}

void ___LayoutConstants_block_invoke_7(uint64_t a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_1F16E0B10;
  v5[1] = &unk_1F16E0B58;
  v6[0] = &unk_1F16E5F30;
  v6[1] = &unk_1F16E5F40;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  [v2 scaledValue:v3 withOverrides:21.0];
  _LayoutConstants___constants_0_1 = v4;
}

void ___LayoutConstants_block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_0_2 = v3;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_1_0 = v4;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_2_0 = v5;
  CLKValueForLuxoDeviceMetrics();
  uint64_t v7 = v6;

  _LayoutConstants___constants_3_0 = v7;
}

void ___LayoutConstants_block_invoke_9(uint64_t a1, uint64_t a2)
{
  void v31[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v30[0] = &unk_1F16E0B70;
  v30[1] = &unk_1F16E0B88;
  v31[0] = &unk_1F16E5F50;
  v31[1] = &unk_1F16E5F60;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  [v2 scaledValue:v3 withOverrides:56.0];
  *(void *)&_LayoutConstants___constants_1 = v4;

  v28[0] = &unk_1F16E0B70;
  v28[1] = &unk_1F16E0B88;
  v29[0] = &unk_1F16E5F70;
  v29[1] = &unk_1F16E5F80;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  [v2 scaledValue:v5 withOverrides:15.0];
  *((void *)&_LayoutConstants___constants_1 + 1) = v6;

  [v2 scaledValue:3 withOverride:3.0 forSizeClass:4.0];
  qword_1E9FA6BB8 = v7;
  double v8 = *(double *)&_LayoutConstants___constants_1;
  v26[0] = &unk_1F16E0B70;
  v26[1] = &unk_1F16E0B88;
  v27[0] = &unk_1F16E5F90;
  v27[1] = &unk_1F16E5FA0;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  [v2 scaledValue:v9 withOverrides:48.5];
  *(double *)&qword_1E9FA6BC0 = v8 + v10;

  v24[0] = &unk_1F16E0B70;
  v24[1] = &unk_1F16E0B88;
  v25[0] = &unk_1F16E5FB0;
  v25[1] = &unk_1F16E5FC0;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  [v2 scaledValue:v11 withOverrides:16.0];
  *(void *)&xmmword_1E9FA6BC8 = v12;

  *((double *)&xmmword_1E9FA6BC8 + 1) = *(double *)&xmmword_1E9FA6BC8 + -3.0;
  [v2 scaledValue:0 withOverride:4.0 forSizeClass:3.0];
  qword_1E9FA6BD8 = v13;
  v22[0] = &unk_1F16E0B70;
  v22[1] = &unk_1F16E0B88;
  v23[0] = &unk_1F16E5FD0;
  v23[1] = &unk_1F16E5FE0;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v2 scaledValue:v14 withOverrides:53.0];
  qword_1E9FA6C08 = v15;

  [v2 scaledValue:0 withOverride:2.5 forSizeClass:2.0];
  qword_1E9FA6BE0 = v16;
  v20[0] = &unk_1F16E0B70;
  v20[1] = &unk_1F16E0B88;
  v21[0] = &unk_1F16E5FF0;
  v21[1] = &unk_1F16E5F80;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v2 scaledValue:v17 withOverrides:16.0];
  *(void *)&xmmword_1E9FA6BE8 = v18;

  *((void *)&xmmword_1E9FA6BE8 + 1) = 0x4008000000000000;
  [v2 scaledValue:3 withOverride:188.0 forSizeClass:213.0];
  qword_1E9FA6BF8 = v19;
  qword_1E9FA6C00 = 0x4049000000000000;
}

void ___LayoutConstants_block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  id v9 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v9 scaledValue:4.0];
  *(void *)&_LayoutConstants___constantsGraphicCircular = v4;
  [v9 scaledValue:29.0];
  *((void *)&_LayoutConstants___constantsGraphicCircular + 1) = v5;
  [v9 scaledValue:18.0];
  qword_1E9FA6C40 = v6;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v8 = v7;

  _LayoutConstants___constantsGraphicExtraLarge = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicCircular, v8);
  *(double *)&qword_1E9FA6C60 = v8 * *(double *)&qword_1E9FA6C40;
}

void ___LayoutConstants_block_invoke_11(uint64_t a1, uint64_t a2)
{
  id v5 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:19.5];
  _LayoutConstants___constants_0_3 = v2;
  [v5 scaledValue:16.0];
  _LayoutConstants___constants_1_1 = v3;
  [v5 scaledValue:16.0];
  _LayoutConstants___constants_2_1 = v4;
}

void ___LayoutConstants_block_invoke_12(uint64_t a1, uint64_t a2)
{
  v14[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v13[0] = &unk_1F16E0D98;
  v13[1] = &unk_1F16E0DC8;
  v14[0] = &unk_1F16E0DB0;
  v14[1] = &unk_1F16E0DB0;
  v13[2] = &unk_1F16E0DE0;
  v13[3] = &unk_1F16E0DF8;
  v14[2] = &unk_1F16E0DB0;
  v14[3] = &unk_1F16E0DB0;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  [v2 constantValue:v3 withOverrides:0.0];
  _LayoutConstants_constants_0_1 = v4;

  v11[0] = &unk_1F16E0D98;
  v11[1] = &unk_1F16E0DC8;
  v12[0] = &unk_1F16E0E10;
  v12[1] = &unk_1F16E0E10;
  v11[2] = &unk_1F16E0DE0;
  v11[3] = &unk_1F16E0DF8;
  v12[2] = &unk_1F16E0E10;
  v12[3] = &unk_1F16E0E10;
  v11[4] = &unk_1F16E0E28;
  v12[4] = &unk_1F16E7030;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];
  [v2 scaledValue:v5 withOverrides:17.0];
  _LayoutConstants_constants_1_1 = v6;

  v9[0] = &unk_1F16E0D98;
  v9[1] = &unk_1F16E0DC8;
  v10[0] = &unk_1F16E7040;
  v10[1] = &unk_1F16E7050;
  v9[2] = &unk_1F16E0DE0;
  v9[3] = &unk_1F16E0DF8;
  v10[2] = &unk_1F16E7050;
  v10[3] = &unk_1F16E7050;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  [v2 scaledValue:v7 withOverrides:45.5];
  _LayoutConstants_constants_2_1 = v8;
}

void ___LayoutConstants_block_invoke_13(uint64_t a1, uint64_t a2)
{
  id v30 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v30 setScale:3 forSizeClass:1.13580247];
  *(void *)&_LayoutConstants__constants = 0x401C000000000000;
  [v30 scaledValue:3 withOverride:105.0 forSizeClass:120.0];
  *((void *)&_LayoutConstants__constants + 1) = v2;
  [v30 scaledValue:14.5];
  qword_1E9FA6E60 = v3;
  [v30 scaledValue:57.0];
  qword_1E9FA6E68 = v4;
  [v30 scaledValue:12.5];
  *(void *)&xmmword_1E9FA6E70 = v5;
  [v30 scaledValue:3 withOverride:50.5 forSizeClass:57.0];
  *((void *)&xmmword_1E9FA6E70 + 1) = v6;
  [v30 scaledValue:21.0];
  qword_1E9FA6E80 = v7;
  [v30 scaledValue:20.5];
  qword_1E9FA6E88 = v8;
  [v30 scaledValue:11.0];
  *(void *)&xmmword_1E9FA6E90 = v9;
  [v30 scaledValue:3 withOverride:37.0 forSizeClass:42.5];
  *((void *)&xmmword_1E9FA6E90 + 1) = v10;
  [v30 scaledValue:3 withOverride:66.0 forSizeClass:75.5];
  qword_1E9FA6EA0 = v11;
  [v30 scaledValue:76.0];
  qword_1E9FA6EA8 = v12;
  [v30 scaledValue:3 withOverride:42.0 forSizeClass:46.0];
  *(void *)&xmmword_1E9FA6EB0 = v13;
  [v30 scaledValue:3 withOverride:90.0 forSizeClass:99.0];
  *((void *)&xmmword_1E9FA6EB0 + 1) = v14;
  [v30 scaledValue:99.0];
  qword_1E9FA6EC0 = v15;
  [v30 scaledValue:3 withOverride:21.5 forSizeClass:26.5];
  qword_1E9FA6EC8 = v16;
  [v30 scaledValue:3 withOverride:17.0 forSizeClass:21.0];
  *(void *)&xmmword_1E9FA6ED0 = v17;
  [v30 scaledValue:3 withOverride:-15.0 forSizeClass:-17.5];
  *((void *)&xmmword_1E9FA6ED0 + 1) = v18;
  [v30 scaledValue:3 withOverride:12.0 forSizeClass:12.5];
  qword_1E9FA6EE0 = v19;
  [v30 scaledValue:3 withOverride:5.5 forSizeClass:6.5];
  qword_1E9FA6EE8 = v20;
  [v30 scaledValue:-17.0];
  *(void *)&xmmword_1E9FA6EF0 = v21;
  [v30 scaledValue:3 withOverride:32.5 forSizeClass:36.0];
  *((void *)&xmmword_1E9FA6EF0 + 1) = v22;
  [v30 scaledValue:3 withOverride:45.0 forSizeClass:50.0];
  qword_1E9FA6F00 = v23;
  [v30 scaledValue:96.5];
  qword_1E9FA6F08 = v24;
  [v30 scaledValue:3 withOverride:45.0 forSizeClass:51.5];
  *(void *)&xmmword_1E9FA6F10 = v25;
  objc_msgSend(v30, "scaledPoint:", 49.5, 51.0);
  *((void *)&xmmword_1E9FA6F10 + 1) = v26;
  unk_1E9FA6F20 = v27;
  objc_msgSend(v30, "scaledPoint:", 60.0, 86.5);
  qword_1E9FA6F28 = v28;
  *(void *)&xmmword_1E9FA6F30 = v29;
  *((void *)&xmmword_1E9FA6F30 + 1) = 0xC01C000000000000;
}

void ___LayoutConstants_block_invoke_14(uint64_t a1, uint64_t a2)
{
  v27[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v26[0] = &unk_1F16E1098;
  v26[1] = &unk_1F16E10B0;
  v27[0] = &unk_1F16E7060;
  v27[1] = &unk_1F16E7070;
  void v26[2] = &unk_1F16E10C8;
  v26[3] = &unk_1F16E10E0;
  void v27[2] = &unk_1F16E7080;
  v27[3] = &unk_1F16E7080;
  v26[4] = &unk_1F16E10F8;
  v26[5] = &unk_1F16E1110;
  v27[4] = &unk_1F16E7090;
  v27[5] = &unk_1F16E7080;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:6];
  [v2 scaledValue:v3 withOverrides:41.5];
  qword_1E9FA7028 = v4;

  v24[0] = &unk_1F16E1098;
  v24[1] = &unk_1F16E1128;
  v25[0] = &unk_1F16E70A0;
  v25[1] = &unk_1F16E70B0;
  void v24[2] = &unk_1F16E1140;
  void v24[3] = &unk_1F16E10B0;
  void v25[2] = &unk_1F16E70C0;
  void v25[3] = &unk_1F16E70D0;
  v24[4] = &unk_1F16E10C8;
  v24[5] = &unk_1F16E10E0;
  v25[4] = &unk_1F16E70E0;
  v25[5] = &unk_1F16E70E0;
  v24[6] = &unk_1F16E10F8;
  v24[7] = &unk_1F16E1110;
  v25[6] = &unk_1F16E70F0;
  v25[7] = &unk_1F16E7100;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:8];
  [v2 scaledValue:v5 withOverrides:63.0];
  *(void *)&_LayoutConstants___constants_2 = v6;

  v22[0] = &unk_1F16E1098;
  v22[1] = &unk_1F16E10B0;
  v23[0] = &unk_1F16E7110;
  v23[1] = &unk_1F16E7120;
  void v22[2] = &unk_1F16E10C8;
  v22[3] = &unk_1F16E10E0;
  void v23[2] = &unk_1F16E7120;
  v23[3] = &unk_1F16E7120;
  v22[4] = &unk_1F16E10F8;
  v22[5] = &unk_1F16E1110;
  v23[4] = &unk_1F16E7120;
  v23[5] = &unk_1F16E7120;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:6];
  [v2 scaledValue:v7 withOverrides:2.0];
  *((void *)&_LayoutConstants___constants_2 + 1) = v8;

  v21[0] = &unk_1F16E7130;
  v21[1] = &unk_1F16E7130;
  v20[0] = &unk_1F16E1098;
  v20[1] = &unk_1F16E1140;
  void v20[2] = &unk_1F16E10B0;
  void v20[3] = &unk_1F16E10C8;
  void v21[2] = &unk_1F16E7140;
  v21[3] = &unk_1F16E7150;
  v20[4] = &unk_1F16E10E0;
  v20[5] = &unk_1F16E10F8;
  v21[4] = &unk_1F16E7150;
  v21[5] = &unk_1F16E7160;
  v20[6] = &unk_1F16E1110;
  v21[6] = &unk_1F16E7170;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];
  [v2 scaledValue:v9 withOverrides:6.0];
  qword_1E9FA7040 = v10;

  v18[0] = &unk_1F16E1098;
  v18[1] = &unk_1F16E1140;
  v19[0] = &unk_1F16E7180;
  v19[1] = &unk_1F16E7170;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v2 scaledValue:v11 withOverrides:16.0];
  *(void *)&xmmword_1E9FA7030 = v12;

  v16[0] = &unk_1F16E1098;
  v16[1] = &unk_1F16E1128;
  v17[0] = &unk_1F16E7120;
  v17[1] = &unk_1F16E7120;
  void v16[2] = &unk_1F16E1140;
  void v17[2] = &unk_1F16E7190;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  [v2 scaledValue:v13 withOverrides:16.0];
  *((void *)&xmmword_1E9FA7030 + 1) = v14;

  [v2 constantValue:0 withOverride:-0.5 forSizeClass:-1.0];
  qword_1E9FA7020 = v15;
}

void ___LayoutConstants_block_invoke_15(uint64_t a1, uint64_t a2)
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v19[0] = &unk_1F16E11D0;
  v19[1] = &unk_1F16E11E8;
  v20[0] = &unk_1F16E7210;
  v20[1] = &unk_1F16E7210;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v2 scaledValue:v3 withOverrides:2.0];
  *(void *)&_LayoutConstants___constants_4 = v4;

  *((void *)&_LayoutConstants___constants_4 + 1) = 120;
  unk_1E9FA7358 = 0x3FF0000000000000;
  [v2 scaledValue:3 withOverride:6.0 forSizeClass:7.0];
  qword_1E9FA7360 = v5;
  *(void *)&xmmword_1E9FA7368 = 0x4000000000000000;
  [v2 scaledValue:3 withOverride:7.0 forSizeClass:8.0];
  *((void *)&xmmword_1E9FA7368 + 1) = v6;
  [v2 scaledValue:1.0];
  qword_1E9FA7378 = v7;
  qword_1E9FA7380 = 0x3FE0000000000000;
  v17[0] = &unk_1F16E11D0;
  v17[1] = &unk_1F16E11E8;
  v18[0] = &unk_1F16E7220;
  v18[1] = &unk_1F16E7220;
  void v17[2] = &unk_1F16E1200;
  void v18[2] = &unk_1F16E7230;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  [v2 scaledValue:v8 withOverrides:1.0];
  *(void *)&xmmword_1E9FA7388 = v9;

  *((void *)&xmmword_1E9FA7388 + 1) = 12;
  unk_1E9FA7398 = 0x4010000000000000;
  [v2 scaledValue:3 withOverride:11.5 forSizeClass:13.0];
  qword_1E9FA73A0 = v10;
  [v2 scaledValue:3 withOverride:17.0 forSizeClass:19.0];
  *(void *)&xmmword_1E9FA73A8 = v11;
  [v2 scaledValue:10.5];
  *((void *)&xmmword_1E9FA73A8 + 1) = v12;
  xmmword_1E9FA73B8 = xmmword_1BC8A0CF0;
  v15[0] = &unk_1F16E11D0;
  v15[1] = &unk_1F16E11E8;
  v16[0] = &unk_1F16E7220;
  v16[1] = &unk_1F16E7220;
  void v15[2] = &unk_1F16E1200;
  void v16[2] = &unk_1F16E7240;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v2 scaledValue:v13 withOverrides:1.0];
  qword_1E9FA73C8 = v14;
}

void ___LayoutConstants_block_invoke_16(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v3 scaledValue:3 withOverride:-62.0 forSizeClass:-69.0];
  _LayoutConstants__constants_0_0 = v2;
}

void ___LayoutConstants_block_invoke_17(uint64_t a1, uint64_t a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v11[0] = &unk_1F16E12A8;
  v11[1] = &unk_1F16E12C0;
  v12[0] = &unk_1F16E72B0;
  v12[1] = &unk_1F16E72C0;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v2 scaledValue:v3 withOverrides:16.5];
  _LayoutConstants_constants_0_2 = v4;

  [v2 scaledValue:12.0];
  _LayoutConstants_constants_1_2 = v5;
  v9[0] = &unk_1F16E12A8;
  v9[1] = &unk_1F16E12C0;
  v10[0] = &unk_1F16E72D0;
  v10[1] = &unk_1F16E72E0;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v2 scaledValue:v6 withOverrides:29.0];
  _LayoutConstants_constants_2_2 = v7;

  [v2 scaledValue:0 withOverride:39.0 forSizeClass:34.0];
  _LayoutConstants_constants_3_1 = v8;
  _LayoutConstants_constants_4_1 = v8;
}

void ___LayoutConstants_block_invoke_18(uint64_t a1, uint64_t a2)
{
  v54[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  int IsTallScript = CLKLanguageIsTallScript();
  [v2 scaledValue:0 withOverride:4.5 forSizeClass:4.5];
  *(void *)&_LayoutConstants_constants_1 = v4;
  v53[0] = &unk_1F16E12D8;
  v53[1] = &unk_1F16E12F0;
  v54[0] = &unk_1F16E72F0;
  v54[1] = &unk_1F16E7300;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
  [v2 scaledValue:v5 withOverrides:19.5];
  *((void *)&_LayoutConstants_constants_1 + 1) = v6;

  v51[0] = &unk_1F16E12D8;
  v51[1] = &unk_1F16E12F0;
  v52[0] = &unk_1F16E7310;
  v52[1] = &unk_1F16E7320;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  [v2 scaledValue:v7 withOverrides:15.5];
  uint64_t v9 = v8;

  v49[0] = &unk_1F16E12D8;
  v49[1] = &unk_1F16E12F0;
  v50[0] = &unk_1F16E7330;
  v50[1] = &unk_1F16E7340;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
  [v2 scaledValue:v10 withOverrides:16.5];
  uint64_t v12 = v11;

  if (IsTallScript) {
    uint64_t v13 = v9;
  }
  else {
    uint64_t v13 = v12;
  }
  *((void *)&xmmword_1E9FA7668 + 1) = v13;
  v47[0] = &unk_1F16E12D8;
  v47[1] = &unk_1F16E12F0;
  v48[0] = &unk_1F16E72F0;
  v48[1] = &unk_1F16E7300;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
  [v2 scaledValue:v14 withOverrides:19.5];
  qword_1E9FA7658 = v15;

  v45[0] = &unk_1F16E12D8;
  v45[1] = &unk_1F16E12F0;
  v46[0] = &unk_1F16E72F0;
  v46[1] = &unk_1F16E7300;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  [v2 scaledValue:v16 withOverrides:19.5];
  qword_1E9FA7660 = v17;

  v43[0] = &unk_1F16E12D8;
  v43[1] = &unk_1F16E12F0;
  v44[0] = &unk_1F16E7350;
  v44[1] = &unk_1F16E7360;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
  [v2 scaledValue:v18 withOverrides:4.0];
  *(void *)&xmmword_1E9FA7668 = v19;

  qword_1E9FA7678 = 0;
  v41[0] = &unk_1F16E12D8;
  v41[1] = &unk_1F16E12F0;
  v42[0] = &unk_1F16E7370;
  v42[1] = &unk_1F16E7380;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  [v2 scaledValue:v20 withOverrides:8.0];
  qword_1E9FA7680 = v21;

  v39[0] = &unk_1F16E12D8;
  v39[1] = &unk_1F16E1308;
  v40[0] = &unk_1F16E7390;
  v40[1] = &unk_1F16E7390;
  v39[2] = &unk_1F16E1320;
  v39[3] = &unk_1F16E1338;
  v40[2] = &unk_1F16E7390;
  v40[3] = &unk_1F16E73A0;
  v39[4] = &unk_1F16E1350;
  v39[5] = &unk_1F16E1368;
  v40[4] = &unk_1F16E73A0;
  v40[5] = &unk_1F16E73A0;
  v39[6] = &unk_1F16E1380;
  void v39[7] = &unk_1F16E1398;
  v40[6] = &unk_1F16E7390;
  v40[7] = &unk_1F16E73A0;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:8];
  [v2 scaledValue:v22 withOverrides:7.0];
  *((void *)&xmmword_1E9FA7688 + 1) = v23;

  qword_1E9FA7698 = 0x3FE0000000000000;
  [v2 scaledValue:3 withOverride:1.0 forSizeClass:1.5];
  *((void *)&xmmword_1E9FA76A8 + 1) = v24;
  [v2 constantValue:3 withOverride:0.0 forSizeClass:0.5];
  qword_1E9FA76B8 = v25;
  v37[0] = &unk_1F16E12D8;
  v37[1] = &unk_1F16E1308;
  v38[0] = &unk_1F16E73B0;
  v38[1] = &unk_1F16E73B0;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  [v2 scaledValue:v26 withOverrides:8.5];
  uint64_t v28 = v27;

  qword_1E9FA76C0 = 0;
  xmmword_1E9FA76C8 = (unint64_t)v28;
  qword_1E9FA76D8 = v28;
  [v2 scaledValue:0 withOverride:32.0 forSizeClass:28.0];
  qword_1E9FA76A0 = v29;
  *(void *)&xmmword_1E9FA76A8 = v29;
  [v2 scaledValue:3 withOverride:35.0 forSizeClass:38.0];
  uint64_t v31 = v30;
  v35[0] = &unk_1F16E12D8;
  v35[1] = &unk_1F16E12F0;
  v36[0] = &unk_1F16E73C0;
  v36[1] = &unk_1F16E73D0;
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  [v2 scaledValue:v32 withOverrides:18.0];
  uint64_t v34 = v33;

  qword_1E9FA76E0 = v31;
  qword_1E9FA76E8 = v34;
}

double ___LayoutConstants_block_invoke_19(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 deviceCategory] - 1;
  if (v2 <= 4)
  {
    uint64_t v3 = qword_1BC8A0E00[v2];
    uint64_t v4 = qword_1BC8A0E28[v2];
    uint64_t v5 = qword_1BC8A0E50[v2];
    *(void *)&_LayoutConstants_layoutConstants = 0x4061000000000000;
    *((void *)&_LayoutConstants_layoutConstants + 1) = v3;
    qword_1E9FA7718 = 0x405C800000000000;
    qword_1E9FA7720 = v4;
    *(void *)&xmmword_1E9FA7728 = v5;
    *((void *)&xmmword_1E9FA7728 + 1) = 0x4065400000000000;
  }
  double result = 14.0;
  xmmword_1E9FA7738 = xmmword_1BC8A0DE0;
  xmmword_1E9FA7748 = xmmword_1BC8A0DF0;
  qword_1E9FA7758 = 0x4028000000000000;
  return result;
}

void ___LayoutConstants_block_invoke_20(uint64_t a1, uint64_t a2)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v13[0] = &unk_1F16E14E8;
  v13[1] = &unk_1F16E1500;
  v14[0] = &unk_1F16E7480;
  v14[1] = &unk_1F16E7490;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v2 scaledValue:v3 withOverrides:16.0];
  _LayoutConstants_constants_2_3 = v4;

  v11[0] = &unk_1F16E14E8;
  v11[1] = &unk_1F16E1518;
  v12[0] = &unk_1F16E74A0;
  v12[1] = &unk_1F16E74B0;
  void v11[2] = &unk_1F16E1500;
  v12[2] = &unk_1F16E74B0;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v2 scaledValue:v5 withOverrides:6.5];
  _LayoutConstants_constants_1_3 = v6;

  _LayoutConstants_constants_0_3 = 0x3FF0000000000000;
  v9[0] = &unk_1F16E14E8;
  v9[1] = &unk_1F16E1518;
  v10[0] = &unk_1F16E74C0;
  v10[1] = &unk_1F16E74C0;
  void v9[2] = &unk_1F16E1500;
  void v10[2] = &unk_1F16E74D0;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  [v2 scaledValue:v7 withOverrides:12.0];
  _LayoutConstants_constants_3_2 = v8;
}

void ___LayoutConstants_block_invoke_21(uint64_t a1, void *a2)
{
  unint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  id v12 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v12 scaledValue:18.0];
  *(void *)&_LayoutConstants___constantsGraphicCircular_0 = v4;
  [v12 scaledValue:15.0];
  *((void *)&_LayoutConstants___constantsGraphicCircular_0 + 1) = v5;
  [v12 scaledValue:29.0];
  qword_1E9FA7930 = v6;
  [v12 scaledValue:3 withOverride:26.0 forSizeClass:29.0];
  qword_1E9FA7938 = v7;
  [v12 scaledValue:11.0];
  *(void *)&xmmword_1E9FA7940 = v8;
  *((void *)&xmmword_1E9FA7940 + 1) = 0x3FF8000000000000;
  CLKValueForDeviceMetrics();
  qword_1E9FA7950 = v9;
  qword_1E9FA7958 = 0x3FE921FB54442D18;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v11 = v10;

  *(_OWORD *)&qword_1E9FA7990 = *(_OWORD *)&qword_1E9FA7950;
  _LayoutConstants___constantsGraphicExtraLarge_0 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicCircular_0, v11);
  *(float64x2_t *)algn_1E9FA7970 = vmulq_n_f64(*(float64x2_t *)&qword_1E9FA7930, v11);
  xmmword_1E9FA7980 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1E9FA7940, v11);
  *(double *)&qword_1E9FA7990 = v11 * *(double *)&qword_1E9FA7950;
}

void ___LayoutConstants_block_invoke_22(uint64_t a1, void *a2)
{
  void v49[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int IsTallScript = CLKLanguageIsTallScript();
  uint64_t v4 = [MEMORY[0x1E4F19A40] metricsWithDevice:v2 identitySizeClass:2];

  v48[0] = &unk_1F16E1530;
  v48[1] = &unk_1F16E1548;
  v49[0] = &unk_1F16E74E0;
  v49[1] = &unk_1F16E74F0;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
  [v4 scaledValue:v5 withOverrides:19.5];
  _LayoutConstants_constants_0_4 = v6;

  v46[0] = &unk_1F16E1530;
  v46[1] = &unk_1F16E1548;
  v47[0] = &unk_1F16E7500;
  v47[1] = &unk_1F16E7510;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  [v4 scaledValue:v7 withOverrides:4.0];
  _LayoutConstants_constants_2_4 = v8;

  _LayoutConstants_constants_3_3 = 0x3FF0000000000000;
  [v4 scaledValue:3 withOverride:15.5 forSizeClass:17.5];
  _LayoutConstants_constants_8 = v9;
  if (IsTallScript)
  {
    v44[0] = &unk_1F16E1530;
    v44[1] = &unk_1F16E1548;
    v45[0] = &unk_1F16E7520;
    v45[1] = &unk_1F16E7530;
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
    [v4 scaledValue:v10 withOverrides:36.0];
    _LayoutConstants_constants_1_4 = v11;

    v42[0] = &unk_1F16E1530;
    v42[1] = &unk_1F16E1548;
    v43[0] = &unk_1F16E7540;
    v43[1] = &unk_1F16E7550;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
    [v4 scaledValue:v12 withOverrides:15.5];
    _LayoutConstants_constants_5_0 = v13;

    [v4 scaledValue:3 withOverride:14.5 forSizeClass:16.5];
    _LayoutConstants_constants_4_2 = v14;
    v40[0] = &unk_1F16E1530;
    v40[1] = &unk_1F16E1548;
    v41[0] = &unk_1F16E7560;
    v41[1] = &unk_1F16E7570;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
    [v4 scaledValue:v15 withOverrides:37.0];
    _LayoutConstants_constants_6_1 = v16;

    [v4 scaledValue:3 withOverride:11.0 forSizeClass:7.0];
    _LayoutConstants_constants_7_1 = v17;
  }
  else
  {
    v38[0] = &unk_1F16E1530;
    v38[1] = &unk_1F16E1548;
    v39[0] = &unk_1F16E7580;
    v39[1] = &unk_1F16E7590;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    [v4 scaledValue:v18 withOverrides:39.0];
    _LayoutConstants_constants_1_4 = v19;

    v36[0] = &unk_1F16E1530;
    v36[1] = &unk_1F16E1548;
    v37[0] = &unk_1F16E75A0;
    v37[1] = &unk_1F16E75B0;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    [v4 scaledValue:v20 withOverrides:16.5];
    _LayoutConstants_constants_5_0 = v21;

    [v4 scaledValue:3 withOverride:15.5 forSizeClass:17.5];
    _LayoutConstants_constants_4_2 = v22;
    v34[0] = &unk_1F16E1530;
    v34[1] = &unk_1F16E1548;
    v35[0] = &unk_1F16E7580;
    v35[1] = &unk_1F16E75C0;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    [v4 scaledValue:v23 withOverrides:39.0];
    _LayoutConstants_constants_6_1 = v24;

    v32[0] = &unk_1F16E1530;
    v32[1] = &unk_1F16E1548;
    v33[0] = &unk_1F16E75D0;
    v33[1] = &unk_1F16E75E0;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    [v4 scaledValue:v25 withOverrides:8.0];
    _LayoutConstants_constants_7_1 = v26;
  }
  v30[0] = &unk_1F16E1530;
  v30[1] = &unk_1F16E1560;
  v31[0] = &unk_1F16E75F0;
  v31[1] = &unk_1F16E75F0;
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  [v4 scaledValue:v27 withOverrides:8.5];
  uint64_t v29 = v28;

  _LayoutConstants_constants_10 = v29;
  _LayoutConstants_constants_12 = v29;
}

double ___LayoutConstants_block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = a2;
  *(void *)&_LayoutConstants___constants_5 = NTKWhistlerSubdialComplicationDistanceFromCenter(v2);
  *((void *)&_LayoutConstants___constants_5 + 1) = NTKWhistlerBezelCircularViewFontSize(v2);
  qword_1E9FA7B18 = NTKWhistlerBezelCircularViewDefaultCenterAngle();
  qword_1E9FA7B20 = NTKWhistlerBezelCircularViewDefaultTracking();
  *(void *)&xmmword_1E9FA7B28 = NTKWhistlerBezelCircularViewDefaultTrackingArabic();
  *((void *)&xmmword_1E9FA7B28 + 1) = NTKWhistlerBezelCircularViewDefaultMaxAngularWidth();
  double v3 = NTKWhistlerBezelCircularViewDefaultAngularWidthPadding();

  qword_1E9FA7B38 = *(void *)&v3;
  double result = 30.0;
  unk_1E9FA7B40 = xmmword_1BC8A1090;
  return result;
}

void ___LayoutConstants_block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_0_5 = v3;
  CLKValueForLuxoDeviceMetrics();
  _LayoutConstants___constants_1_3 = v4;
  CLKValueForLuxoDeviceMetrics();
  uint64_t v6 = v5;

  _LayoutConstants___constants_2_3 = v6;
}

void ___LayoutConstants_block_invoke_25(uint64_t a1, uint64_t a2)
{
  void v38[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:3 withOverride:19.5 forSizeClass:22.5];
  _LayoutConstants_constants_0_5 = v3;
  [v2 scaledValue:0 withOverride:4.5 forSizeClass:4.5];
  _LayoutConstants_constants_2_5 = v4;
  v37[0] = &unk_1F16E18C0;
  v37[1] = &unk_1F16E18D8;
  v38[0] = &unk_1F16E7600;
  v38[1] = &unk_1F16E7600;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  [v2 scaledValue:v5 withOverrides:8.5];
  uint64_t v7 = v6;

  _LayoutConstants_constants_8_0 = v7;
  _LayoutConstants_constants_10_0 = v7;
  if (CLKLanguageIsTallScript())
  {
    v35[0] = &unk_1F16E18C0;
    v35[1] = &unk_1F16E18F0;
    v36[0] = &unk_1F16E7610;
    v36[1] = &unk_1F16E7620;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    [v2 scaledValue:v8 withOverrides:36.0];
    _LayoutConstants_constants_1_5 = v9;

    v33[0] = &unk_1F16E18C0;
    v33[1] = &unk_1F16E18D8;
    v34[0] = &unk_1F16E7630;
    v34[1] = &unk_1F16E7640;
    void v33[2] = &unk_1F16E18F0;
    void v34[2] = &unk_1F16E7650;
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
    [v2 scaledValue:v10 withOverrides:16.5];
    _LayoutConstants_constants_3_4 = v11;

    v31[0] = &unk_1F16E18C0;
    v31[1] = &unk_1F16E18F0;
    v32[0] = &unk_1F16E7660;
    v32[1] = &unk_1F16E7670;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    [v2 scaledValue:v12 withOverrides:37.0];
    _LayoutConstants_constants_4_3 = v13;

    [v2 scaledValue:3 withOverride:11.0 forSizeClass:12.5];
    _LayoutConstants_constants_5_1 = v14;
  }
  else
  {
    v29[0] = &unk_1F16E18C0;
    v29[1] = &unk_1F16E18F0;
    v30[0] = &unk_1F16E7680;
    v30[1] = &unk_1F16E7690;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v2 scaledValue:v15 withOverrides:39.0];
    _LayoutConstants_constants_1_5 = v16;

    v27[0] = &unk_1F16E18C0;
    v27[1] = &unk_1F16E18D8;
    v28[0] = &unk_1F16E76A0;
    v28[1] = &unk_1F16E7650;
    void v27[2] = &unk_1F16E18F0;
    void v28[2] = &unk_1F16E76B0;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
    [v2 scaledValue:v17 withOverrides:17.5];
    _LayoutConstants_constants_3_4 = v18;

    v25[0] = &unk_1F16E18C0;
    v25[1] = &unk_1F16E18F0;
    v26[0] = &unk_1F16E7680;
    v26[1] = &unk_1F16E76C0;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v2 scaledValue:v19 withOverrides:39.0];
    _LayoutConstants_constants_4_3 = v20;

    v23[0] = &unk_1F16E18C0;
    v23[1] = &unk_1F16E18F0;
    v24[0] = &unk_1F16E76D0;
    v24[1] = &unk_1F16E76E0;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v2 scaledValue:v21 withOverrides:8.0];
    _LayoutConstants_constants_5_1 = v22;
  }
}

void ___LayoutConstants_block_invoke_26(uint64_t a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_1F16E1908;
  v5[1] = &unk_1F16E1920;
  v6[0] = &unk_1F16E76F0;
  v6[1] = &unk_1F16E7700;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  [v2 scaledValue:v3 withOverrides:16.5];
  _LayoutConstants_constants_0_6 = v4;

  _LayoutConstants_constants_2_6 = 0x400C000000000000;
  _LayoutConstants_constants_1_6 = 0x4000000000000000;
}

void ___LayoutConstants_block_invoke_27(uint64_t a1, uint64_t a2)
{
  id v7 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v7 scaledValue:19.5];
  *(void *)&_LayoutConstants___constants_6 = v2;
  [v7 scaledValue:3 withOverride:16.0 forSizeClass:18.0];
  *((void *)&_LayoutConstants___constants_6 + 1) = v3;
  [v7 scaledValue:11.0];
  qword_1E9FA7C88 = v4;
  [v7 scaledValue:3 withOverride:9.5 forSizeClass:11.0];
  qword_1E9FA7C90 = v5;
  [v7 scaledValue:3 withOverride:14.0 forSizeClass:16.0];
  qword_1E9FA7C98 = v6;
}

void ___LayoutConstants_block_invoke_28(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  _LayoutConstants___constants_7 = xmmword_1BC8A1140;
  [v4 scaledValue:9.0];
  qword_1E9FA7CE0 = v2;
  qword_1E9FA7CE8 = 0x3FF8000000000000;
  [v4 scaledValue:4.0];
  *(void *)&xmmword_1E9FA7CF0 = v3;
  *(long long *)((char *)&xmmword_1E9FA7CF0 + 8) = xmmword_1BC8A1150;
}

void ___LayoutConstants_block_invoke_29(uint64_t a1, uint64_t a2)
{
  void v26[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v25[0] = &unk_1F16E1950;
  v25[1] = &unk_1F16E1968;
  v26[0] = &unk_1F16E7740;
  v26[1] = &unk_1F16E7750;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  [v2 scaledValue:v3 withOverrides:16.5];
  *(void *)&_LayoutConstants___constants_8 = v4;

  uint64_t v23 = &unk_1F16E1950;
  uint64_t v24 = &unk_1F16E7760;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  [v2 scaledValue:v5 withOverrides:40.0];
  *((void *)&_LayoutConstants___constants_8 + 1) = v6;

  v21[0] = &unk_1F16E1950;
  v21[1] = &unk_1F16E1980;
  v22[0] = &unk_1F16E7770;
  v22[1] = &unk_1F16E7780;
  void v21[2] = &unk_1F16E1968;
  void v22[2] = &unk_1F16E7790;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  [v2 scaledValue:v7 withOverrides:8.5];
  qword_1E9FA7D30 = v8;

  v19[0] = &unk_1F16E1950;
  v19[1] = &unk_1F16E1980;
  v20[0] = &unk_1F16E77A0;
  v20[1] = &unk_1F16E77A0;
  void v19[2] = &unk_1F16E1968;
  void v20[2] = &unk_1F16E7790;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  [v2 scaledValue:v9 withOverrides:8.5];
  qword_1E9FA7D38 = v10;

  uint64_t v17 = &unk_1F16E1950;
  uint64_t v18 = &unk_1F16E77B0;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v2 scaledValue:v11 withOverrides:38.0];
  *(void *)&xmmword_1E9FA7D40 = v12;

  v15[0] = &unk_1F16E1950;
  v15[1] = &unk_1F16E1968;
  v16[0] = &unk_1F16E77C0;
  v16[1] = &unk_1F16E7770;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v2 scaledValue:v13 withOverrides:4.0];
  *((void *)&xmmword_1E9FA7D40 + 1) = v14;

  qword_1E9FA7D50 = *((void *)&xmmword_1E9FA7D40 + 1);
}

void ___LayoutConstants_block_invoke_30(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  +[NTKAnalogUtilities largeDialSizeForDevice:v3];

  v11[0] = &unk_1F16E1B30;
  v11[1] = &unk_1F16E1B48;
  v12[0] = &unk_1F16E77D0;
  v12[1] = &unk_1F16E77D0;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v4 scaledValue:v5 withOverrides:4.0];
  _LayoutConstants___constants_1_4 = v6;

  v9[0] = &unk_1F16E1B30;
  v9[1] = &unk_1F16E1B48;
  v10[0] = &unk_1F16E77D0;
  v10[1] = &unk_1F16E77D0;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 scaledValue:v7 withOverrides:4.0];
  _LayoutConstants___constants_2_4 = v8;
}

void ___LayoutConstants_block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  id v7 = [v2 metricsWithDevice:v3 identitySizeClass:3];
  double v4 = NTKWhistlerSubdialComplicationDiameter(v3);

  objc_msgSend(v7, "scaledPoint:withOverride:forSizeClass:", 2, 10.5, 23.0, 7.5, 20.0);
  *(double *)&_LayoutConstants__constants_0_1 = v4 * 0.5 + v5;
  *(double *)&_LayoutConstants__constants_1 = v4 * 0.5 + v6;
}

void ___LayoutConstants_block_invoke_32(uint64_t a1, uint64_t a2)
{
  id v6 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  objc_msgSend(v6, "scaledSize:", 1.5, 6.0);
  *(double *)&_LayoutConstants___constants_9 = v2;
  *((double *)&_LayoutConstants___constants_9 + 1) = v3;
  *(double *)&qword_1E9FA7E70 = v2 + -0.5;
  unk_1E9FA7E78 = v3 + -0.5;
  [v6 scaledValue:3.0];
  *(void *)&xmmword_1E9FA7E80 = v4;
  [v6 scaledValue:5.5];
  *((void *)&xmmword_1E9FA7E80 + 1) = v5;
}

double ___LayoutConstants_block_invoke_33(uint64_t a1, void *a2)
{
  xmmword_1E9FA7F08 = xmmword_1BC8A11C0;
  xmmword_1E9FA7F18 = xmmword_1BC8A11D0;
  unint64_t v2 = [a2 deviceCategory];
  if (v2 <= 5)
  {
    double result = dbl_1BC8A11E0[v2];
    uint64_t v4 = qword_1BC8A1210[v2];
    uint64_t v5 = qword_1BC8A1240[v2];
    uint64_t v6 = qword_1BC8A1270[v2];
    uint64_t v7 = qword_1BC8A12A0[v2];
    uint64_t v8 = qword_1BC8A12D0[v2];
    uint64_t v9 = qword_1BC8A1300[v2];
    uint64_t v10 = qword_1BC8A1330[v2];
    qword_1E9FA7F28 = *(void *)&result;
    unk_1E9FA7F30 = v4;
    *(void *)&xmmword_1E9FA7F38 = v5;
    *((void *)&xmmword_1E9FA7F38 + 1) = v6;
    qword_1E9FA7F48 = v7;
    unk_1E9FA7F50 = v8;
    *(void *)&_LayoutConstants_layoutConstants_0 = v9;
    *((void *)&_LayoutConstants_layoutConstants_0 + 1) = v10;
  }
  return result;
}

void ___LayoutConstants_block_invoke_34(uint64_t a1, void *a2)
{
  unint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  id v15 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v15 setRoundingBehavior:1];
  [v15 scaledValue:24.0];
  *(void *)&_LayoutConstants___constantsGraphicCircular_1 = v4;
  [v15 scaledValue:12.0];
  *((void *)&_LayoutConstants___constantsGraphicCircular_1 + 1) = v5;
  [v15 scaledValue:3 withOverride:41.5 forSizeClass:46.5];
  qword_1E9FA8110 = v6;
  [v15 scaledValue:3 withOverride:24.5 forSizeClass:27.5];
  qword_1E9FA8118 = v7;
  [v15 scaledValue:3 withOverride:40.0 forSizeClass:45.0];
  *(void *)&xmmword_1E9FA8120 = v8;
  [v15 setRoundingBehavior:0];
  objc_msgSend(v15, "scaledSize:withOverride:forSizeClass:", 3, 0.75, 3.5, 0.75, 4.0);
  *((void *)&xmmword_1E9FA8120 + 1) = v9;
  unk_1E9FA8130 = v10;
  objc_msgSend(v15, "scaledSize:withOverride:forSizeClass:", 3, 0.75, 1.75, 0.75, 2.0);
  qword_1E9FA8138 = v11;
  qword_1E9FA8140 = v12;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v14 = v13;

  _LayoutConstants___constantsGraphicExtraLarge_1 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicCircular_1, v14);
  unk_1E9FA8160 = vmulq_n_f64(*(float64x2_t *)&qword_1E9FA8110, v14);
  xmmword_1E9FA8170 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1E9FA8120, v14);
  unk_1E9FA8180 = vmulq_n_f64(unk_1E9FA8130, v14);
  *(double *)&qword_1E9FA8190 = v14 * *(double *)&qword_1E9FA8140;
}

void ___LayoutConstants_block_invoke_35(uint64_t a1, uint64_t a2)
{
  v101[3] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:12.0];
  *(void *)&_LayoutConstants___constantsGraphicCircular_2 = v3;
  [v2 scaledValue:3 withOverride:41.5 forSizeClass:46.5];
  *((void *)&_LayoutConstants___constantsGraphicCircular_2 + 1) = v4;
  v100[0] = &unk_1F16E1BD8;
  v100[1] = &unk_1F16E1BF0;
  v101[0] = &unk_1F16E77E0;
  v101[1] = &unk_1F16E77E0;
  v100[2] = &unk_1F16E1C08;
  v101[2] = &unk_1F16E77E0;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:3];
  [v2 scaledValue:v5 withOverrides:20.5];
  qword_1E9FA81C0 = v6;

  v98[0] = &unk_1F16E1BD8;
  v98[1] = &unk_1F16E1C20;
  v99[0] = &unk_1F16E77F0;
  v99[1] = &unk_1F16E7800;
  v98[2] = &unk_1F16E1BF0;
  v98[3] = &unk_1F16E1C08;
  v99[2] = &unk_1F16E7810;
  v99[3] = &unk_1F16E7810;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:4];
  [v2 scaledValue:v7 withOverrides:29.5];
  qword_1E9FA81C8 = v8;

  v96[0] = &unk_1F16E1BD8;
  v96[1] = &unk_1F16E1C20;
  v97[0] = &unk_1F16E7820;
  v97[1] = &unk_1F16E7830;
  void v96[2] = &unk_1F16E1BF0;
  v96[3] = &unk_1F16E1C08;
  v97[2] = &unk_1F16E7840;
  void v97[3] = &unk_1F16E7840;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:4];
  [v2 scaledValue:v9 withOverrides:12.5];
  *(void *)&xmmword_1E9FA81D0 = v10;

  [v2 scaledValue:3 withOverride:41.5 forSizeClass:46.5];
  *((void *)&xmmword_1E9FA81D0 + 1) = v11;
  v94[0] = &unk_1F16E1BD8;
  v94[1] = &unk_1F16E1C20;
  v95[0] = &unk_1F16E7850;
  v95[1] = &unk_1F16E7850;
  void v94[2] = &unk_1F16E1BF0;
  v94[3] = &unk_1F16E1C08;
  void v95[2] = &unk_1F16E7860;
  v95[3] = &unk_1F16E7860;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:4];
  [v2 scaledValue:v12 withOverrides:23.5];
  qword_1E9FA81E0 = v13;

  long long v92 = &unk_1F16E1C20;
  long long v93 = &unk_1F16E7870;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
  [v2 scaledValue:v14 withOverrides:11.0];
  qword_1E9FA81E8 = v15;

  [v2 scaledValue:3 withOverride:41.5 forSizeClass:46.5];
  *(void *)&xmmword_1E9FA81F0 = v16;
  v90[0] = &unk_1F16E1BD8;
  v90[1] = &unk_1F16E1C20;
  v91[0] = &unk_1F16E7880;
  v91[1] = &unk_1F16E7890;
  void v90[2] = &unk_1F16E1BF0;
  v90[3] = &unk_1F16E1C08;
  v91[2] = &unk_1F16E78A0;
  void v91[3] = &unk_1F16E78A0;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:4];
  [v2 scaledValue:v17 withOverrides:29.5];
  *((void *)&xmmword_1E9FA81F0 + 1) = v18;

  [v2 scaledValue:10.5];
  qword_1E9FA8200 = v19;
  [v2 scaledValue:3 withOverride:41.5 forSizeClass:46.5];
  qword_1E9FA8208 = v20;
  v88[0] = &unk_1F16E1BD8;
  v88[1] = &unk_1F16E1BF0;
  v89[0] = &unk_1F16E78B0;
  v89[1] = &unk_1F16E78C0;
  v88[2] = &unk_1F16E1C08;
  void v89[2] = &unk_1F16E78C0;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:3];
  [v2 scaledValue:v21 withOverrides:31.5];
  *(void *)&xmmword_1E9FA8210 = v22;

  v86[0] = &unk_1F16E1BD8;
  v86[1] = &unk_1F16E1C20;
  v87[0] = &unk_1F16E78D0;
  v87[1] = &unk_1F16E78E0;
  void v86[2] = &unk_1F16E1BF0;
  v86[3] = &unk_1F16E1C08;
  v87[2] = &unk_1F16E78D0;
  void v87[3] = &unk_1F16E78D0;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:4];
  [v2 scaledValue:v23 withOverrides:17.5];
  *((void *)&xmmword_1E9FA8210 + 1) = v24;

  v84[0] = &unk_1F16E1BD8;
  v84[1] = &unk_1F16E1C20;
  v85[0] = &unk_1F16E78F0;
  v85[1] = &unk_1F16E7870;
  void v84[2] = &unk_1F16E1BF0;
  v84[3] = &unk_1F16E1C08;
  void v85[2] = &unk_1F16E78F0;
  v85[3] = &unk_1F16E78F0;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:4];
  [v2 scaledValue:v25 withOverrides:8.0];
  qword_1E9FA8220 = v26;

  [v2 scaledValue:4.0];
  qword_1E9FA8228 = v27;
  [v2 scaledValue:25.0];
  *(void *)&xmmword_1E9FA8230 = v28;
  [v2 scaledValue:12.0];
  *((void *)&xmmword_1E9FA8230 + 1) = v29;
  v82[0] = &unk_1F16E1BD8;
  v82[1] = &unk_1F16E1C20;
  v83[0] = &unk_1F16E7900;
  v83[1] = &unk_1F16E78A0;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
  [v2 scaledValue:v30 withOverrides:34.3];
  *(void *)&_LayoutConstants___constantsGraphicExtraLarge_2 = v31;

  [v2 scaledValue:3 withOverride:118.5 forSizeClass:130.5];
  *((void *)&_LayoutConstants___constantsGraphicExtraLarge_2 + 1) = v32;
  v80[0] = &unk_1F16E1BD8;
  v80[1] = &unk_1F16E1BF0;
  v81[0] = &unk_1F16E7910;
  v81[1] = &unk_1F16E7920;
  v80[2] = &unk_1F16E1C08;
  void v81[2] = &unk_1F16E7920;
  uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:3];
  [v2 scaledValue:v33 withOverrides:58.6];
  qword_1E9FA8250 = v34;

  v78[0] = &unk_1F16E1BD8;
  v78[1] = &unk_1F16E1C20;
  v79[0] = &unk_1F16E7930;
  v79[1] = &unk_1F16E7940;
  v78[2] = &unk_1F16E1BF0;
  void v78[3] = &unk_1F16E1C08;
  v79[2] = &unk_1F16E7950;
  void v79[3] = &unk_1F16E7950;
  uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:4];
  [v2 scaledValue:v35 withOverrides:84.3];
  qword_1E9FA8258 = v36;

  v76[0] = &unk_1F16E1BD8;
  v76[1] = &unk_1F16E1C20;
  v77[0] = &unk_1F16E7900;
  v77[1] = &unk_1F16E78A0;
  uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];
  [v2 scaledValue:v37 withOverrides:34.3];
  *(void *)&xmmword_1E9FA8260 = v38;

  v74 = &unk_1F16E1BD8;
  v75 = &unk_1F16E7960;
  uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
  [v2 scaledValue:v39 withOverrides:118.7];
  *((void *)&xmmword_1E9FA8260 + 1) = v40;

  v72[0] = &unk_1F16E1BD8;
  v72[1] = &unk_1F16E1C20;
  v73[0] = &unk_1F16E7970;
  v73[1] = &unk_1F16E7980;
  void v72[2] = &unk_1F16E1BF0;
  v72[3] = &unk_1F16E1C08;
  v73[2] = &unk_1F16E7990;
  v73[3] = &unk_1F16E7990;
  uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:4];
  [v2 scaledValue:v41 withOverrides:67.0];
  qword_1E9FA8270 = v42;

  v70[0] = &unk_1F16E1BD8;
  v70[1] = &unk_1F16E1C20;
  v71[0] = &unk_1F16E7890;
  v71[1] = &unk_1F16E79A0;
  uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
  [v2 scaledValue:v43 withOverrides:31.4];
  qword_1E9FA8278 = v44;

  uint64_t v68 = &unk_1F16E1BD8;
  v69 = &unk_1F16E7960;
  uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
  [v2 scaledValue:v45 withOverrides:118.7];
  *(void *)&xmmword_1E9FA8280 = v46;

  v66[0] = &unk_1F16E1BD8;
  v66[1] = &unk_1F16E1BF0;
  v67[0] = &unk_1F16E79B0;
  v67[1] = &unk_1F16E79C0;
  v66[2] = &unk_1F16E1C08;
  void v67[2] = &unk_1F16E79C0;
  uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:3];
  [v2 scaledValue:v47 withOverrides:84.4];
  *((void *)&xmmword_1E9FA8280 + 1) = v48;

  [v2 scaledValue:30.0];
  qword_1E9FA8290 = v49;
  [v2 scaledValue:3 withOverride:118.6 forSizeClass:130.6];
  qword_1E9FA8298 = v50;
  v64[0] = &unk_1F16E1BD8;
  v64[1] = &unk_1F16E1C20;
  v65[0] = &unk_1F16E79D0;
  v65[1] = &unk_1F16E79E0;
  void v64[2] = &unk_1F16E1BF0;
  v64[3] = &unk_1F16E1C08;
  v65[2] = &unk_1F16E79F0;
  v65[3] = &unk_1F16E79F0;
  long long v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:4];
  [v2 scaledValue:v51 withOverrides:90.0];
  *(void *)&xmmword_1E9FA82A0 = v52;

  v62[0] = &unk_1F16E1BD8;
  v62[1] = &unk_1F16E1C20;
  v63[0] = &unk_1F16E7A00;
  v63[1] = &unk_1F16E7A10;
  v62[2] = &unk_1F16E1BF0;
  void v62[3] = &unk_1F16E1C08;
  void v63[2] = &unk_1F16E7910;
  v63[3] = &unk_1F16E7910;
  long long v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:4];
  [v2 scaledValue:v53 withOverrides:50.0];
  *((void *)&xmmword_1E9FA82A0 + 1) = v54;

  v60[0] = &unk_1F16E1BD8;
  v60[1] = &unk_1F16E1C20;
  v61[0] = &unk_1F16E7A20;
  v61[1] = &unk_1F16E7A30;
  v60[2] = &unk_1F16E1BF0;
  v60[3] = &unk_1F16E1C08;
  v61[2] = &unk_1F16E7A40;
  void v61[3] = &unk_1F16E7A40;
  v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:4];
  [v2 scaledValue:v55 withOverrides:22.0];
  qword_1E9FA82B0 = v56;

  [v2 scaledValue:11.0];
  qword_1E9FA82B8 = v57;
  [v2 scaledValue:72.0];
  *(void *)&xmmword_1E9FA82C0 = v58;
  [v2 scaledValue:35.0];
  *((void *)&xmmword_1E9FA82C0 + 1) = v59;
}

void ___LayoutConstants_block_invoke_36(uint64_t a1, void *a2)
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  v33[0] = &unk_1F16E1D10;
  v33[1] = &unk_1F16E1D28;
  v34[0] = &unk_1F16E7AC0;
  v34[1] = &unk_1F16E7AC0;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  [v4 scaledValue:v5 withOverrides:9.0];
  *(void *)&_LayoutConstants__constants_0 = v6;

  v31[0] = &unk_1F16E1D10;
  v31[1] = &unk_1F16E1D28;
  v32[0] = &unk_1F16E7AC0;
  v32[1] = &unk_1F16E7AC0;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  [v4 scaledValue:v7 withOverrides:8.0];
  *((void *)&_LayoutConstants__constants_0 + 1) = v8;

  v29[0] = &unk_1F16E1D10;
  v29[1] = &unk_1F16E1D28;
  v30[0] = &unk_1F16E7AC0;
  v30[1] = &unk_1F16E7AC0;
  void v29[2] = &unk_1F16E1D40;
  void v30[2] = &unk_1F16E7AD0;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  [v4 scaledValue:v9 withOverrides:37.5];
  qword_1E9FA8440 = v10;

  v27[0] = &unk_1F16E1D10;
  v27[1] = &unk_1F16E1D28;
  v28[0] = &unk_1F16E7AC0;
  v28[1] = &unk_1F16E7AC0;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v4 scaledValue:v11 withOverrides:22.5];
  qword_1E9FA8448 = v12;

  v25[0] = &unk_1F16E1D10;
  v25[1] = &unk_1F16E1D28;
  v26[0] = &unk_1F16E7AC0;
  v26[1] = &unk_1F16E7AC0;
  void v25[2] = &unk_1F16E1D40;
  void v26[2] = &unk_1F16E7AE0;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  [v4 scaledValue:v13 withOverrides:12.5];
  qword_1E9FA8460 = v14;

  v23[0] = &unk_1F16E1D10;
  v23[1] = &unk_1F16E1D28;
  v24[0] = &unk_1F16E7AC0;
  v24[1] = &unk_1F16E7AC0;
  void v23[2] = &unk_1F16E1D40;
  void v24[2] = &unk_1F16E7AF0;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  [v4 scaledValue:v15 withOverrides:14.0];
  qword_1E9FA8468 = v16;

  v21[0] = &unk_1F16E1D10;
  v21[1] = &unk_1F16E1D28;
  v22[0] = &unk_1F16E7AC0;
  v22[1] = &unk_1F16E7AC0;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v4 scaledValue:v17 withOverrides:7.0];
  *(void *)&xmmword_1E9FA8450 = v18;

  *((void *)&xmmword_1E9FA8450 + 1) = 0x3FECB91F3BBBA140;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v20 = v19;

  xmmword_1E9FA8490 = xmmword_1E9FA8450;
  _LayoutConstants__constantsGraphicExtraLarge = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants__constants_0, v20);
  unk_1E9FA8480 = vmulq_n_f64(*(float64x2_t *)&qword_1E9FA8440, v20);
  xmmword_1E9FA84A0 = (__int128)vmulq_n_f64(*(float64x2_t *)&qword_1E9FA8460, v20);
  *(double *)&xmmword_1E9FA8490 = v20 * *(double *)&xmmword_1E9FA8450;
}

void ___LayoutConstants_block_invoke_37(uint64_t a1, void *a2)
{
  unint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  id v16 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v16 scaledValue:18.0];
  *(void *)&_LayoutConstants___constantsGraphicCircular_3 = v4;
  [v16 scaledValue:15.0];
  *((void *)&_LayoutConstants___constantsGraphicCircular_3 + 1) = v5;
  [v16 scaledValue:29.0];
  qword_1E9FA84E0 = v6;
  [v16 scaledValue:3 withOverride:26.0 forSizeClass:29.0];
  *(void *)&xmmword_1E9FA84F0 = v7;
  [v16 scaledValue:3 withOverride:25.0 forSizeClass:28.0];
  qword_1E9FA84E8 = v8;
  [v16 scaledValue:9.0];
  *((void *)&xmmword_1E9FA84F0 + 1) = v9;
  [v16 scaledValue:8.0];
  qword_1E9FA8500 = v10;
  [v16 scaledValue:3 withOverride:37.5 forSizeClass:42.0];
  qword_1E9FA8508 = v11;
  [v16 scaledValue:3 withOverride:17.5 forSizeClass:20.0];
  *(void *)&xmmword_1E9FA8510 = v12;
  [v16 scaledValue:4.0];
  *((void *)&xmmword_1E9FA8510 + 1) = v13;
  qword_1E9FA8520 = 0x3FE921FB54442D18;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v15 = v14;

  qword_1E9FA8580 = qword_1E9FA8520;
  _LayoutConstants___constantsGraphicExtraLarge_3 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicCircular_3, v15);
  unk_1E9FA8540 = vmulq_n_f64(*(float64x2_t *)&qword_1E9FA84E0, v15);
  xmmword_1E9FA8550 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1E9FA84F0, v15);
  xmmword_1E9FA8560 = (__int128)vmulq_n_f64(*(float64x2_t *)&qword_1E9FA8500, v15);
  xmmword_1E9FA8570 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1E9FA8510, v15);
}

void ___LayoutConstants_block_invoke_38(uint64_t a1, void *a2)
{
  unint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  id v8 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v8 scaledValue:4.0];
  *(void *)&_LayoutConstants___constantsGraphicCircular_4 = v4;
  [v8 scaledValue:3 withOverride:27.0 forSizeClass:31.0];
  *((void *)&_LayoutConstants___constantsGraphicCircular_4 + 1) = v5;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v7 = v6;

  _LayoutConstants___constantsGraphicExtraLarge_4 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicCircular_4, v7);
}

uint64_t ___LayoutConstants_block_invoke_39()
{
  _LayoutConstants__constants_0_2 = 0x4045000000000000;
  _LayoutConstants__constants_1_0 = 0x403F000000000000;
  uint64_t result = NTKCScreenStyle();
  double v1 = 16.0;
  if (result == 1) {
    double v1 = 20.0;
  }
  _LayoutConstants__constants_2 = *(void *)&v1;
  _LayoutConstants__constants_3 = 0x402E000000000000;
  _LayoutConstants__constants_4 = 0x4028000000000000;
  _LayoutConstants__constants_5 = 0x4039000000000000;
  _LayoutConstants__constants_6 = 0x4028000000000000;
  return result;
}

void ___LayoutConstants_block_invoke_40(uint64_t a1, void *a2)
{
  void v30[3] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  v29[0] = &unk_1F16E1ED8;
  v29[1] = &unk_1F16E1EF0;
  v30[0] = &unk_1F16E7C20;
  v30[1] = &unk_1F16E7C30;
  void v29[2] = &unk_1F16E1F08;
  void v30[2] = &unk_1F16E7C40;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  [v4 scaledValue:v5 withOverrides:19.0];
  *(void *)&_LayoutConstants___constantsGraphicCircular_5 = v6;

  v27[0] = &unk_1F16E1EF0;
  v27[1] = &unk_1F16E1F08;
  v28[0] = &unk_1F16E7C50;
  v28[1] = &unk_1F16E7C60;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v4 scaledValue:v7 withOverrides:30.5];
  *((void *)&_LayoutConstants___constantsGraphicCircular_5 + 1) = v8;

  v25[0] = &unk_1F16E1EF0;
  v25[1] = &unk_1F16E1F08;
  v26[0] = &unk_1F16E7C70;
  v26[1] = &unk_1F16E7C80;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  [v4 scaledValue:v9 withOverrides:38.0];
  qword_1E9FA8810 = v10;

  [v4 scaledValue:12.0];
  double v12 = v11;
  double v13 = *MEMORY[0x1E4FB09D0];
  double v14 = (void *)MEMORY[0x1E4F19680];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F19A50], "systemFontOfSize:weight:design:", *MEMORY[0x1E4F19680]);
  id v16 = (void *)qword_1E9FA8818;
  qword_1E9FA8818 = v15;

  v23[0] = &unk_1F16E1ED8;
  v23[1] = &unk_1F16E1EF0;
  v24[0] = &unk_1F16E7C90;
  v24[1] = &unk_1F16E7C90;
  void v23[2] = &unk_1F16E1F08;
  void v24[2] = &unk_1F16E7CA0;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  [v4 scaledValue:v17 withOverrides:10.0];
  qword_1E9FA8820 = v18;

  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v22 = v19;

  _LayoutConstants___constantsGraphicExtraLarge_5 = _LayoutConstants___constantsGraphicCircular_5;
  qword_1E9FA8840 = qword_1E9FA8810;
  objc_storeStrong((id *)&qword_1E9FA8848, (id)qword_1E9FA8818);
  qword_1E9FA8850 = qword_1E9FA8820;
  _LayoutConstants___constantsGraphicExtraLarge_5 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicExtraLarge_5, v22);
  *(double *)&qword_1E9FA8840 = v22 * *(double *)&qword_1E9FA8840;
  uint64_t v20 = [MEMORY[0x1E4F19A50] systemFontOfSize:*v14 weight:v12 * v22 design:v13];
  uint64_t v21 = (void *)qword_1E9FA8848;
  qword_1E9FA8848 = v20;

  *(double *)&qword_1E9FA8850 = v22 * *(double *)&qword_1E9FA8850;
}

void ___LayoutConstants_block_invoke_41(uint64_t a1, uint64_t a2)
{
  id v6 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v6 scaledValue:19.5];
  _LayoutConstants___constants_0_6 = v2;
  [v6 scaledValue:3 withOverride:16.0 forSizeClass:18.0];
  _LayoutConstants___constants_1_5 = v3;
  [v6 scaledValue:3 withOverride:12.0 forSizeClass:13.5];
  _LayoutConstants___constants_2_5 = v4;
  [v6 scaledValue:4.5];
  _LayoutConstants___constants_3_2 = v5;
}

void ___LayoutConstants_block_invoke_42(uint64_t a1, void *a2)
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v4 constantValue:2 withOverride:6.0 forSizeClass:7.0];
  *(void *)&_LayoutConstants___constantsGraphicCircular_6 = v5;
  [v4 scaledValue:3 withOverride:31.5 forSizeClass:34.0];
  *((void *)&_LayoutConstants___constantsGraphicCircular_6 + 1) = v6;
  [v4 scaledValue:38.0];
  qword_1E9FA8970 = v7;
  v21[0] = &unk_1F16E1F20;
  v21[1] = &unk_1F16E1F38;
  v22[0] = &unk_1F16E7CB0;
  v22[1] = &unk_1F16E7CB0;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v4 scaledValue:v8 withOverrides:12.0];
  double v10 = v9;

  double v11 = *MEMORY[0x1E4FB09D0];
  double v12 = (void *)MEMORY[0x1E4F19680];
  uint64_t v13 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:v10 design:*MEMORY[0x1E4FB09D0]];
  double v14 = (void *)qword_1E9FA8978;
  qword_1E9FA8978 = v13;

  objc_msgSend(v4, "scaledSize:withOverride:forSizeClass:", 3, 28.0, 14.0, 31.0, 16.0);
  *(void *)&xmmword_1E9FA8980 = v15;
  *((void *)&xmmword_1E9FA8980 + 1) = v16;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v20 = v17;

  _LayoutConstants___constantsGraphicExtraLarge_6 = _LayoutConstants___constantsGraphicCircular_6;
  qword_1E9FA89A0 = qword_1E9FA8970;
  objc_storeStrong((id *)&qword_1E9FA89A8, (id)qword_1E9FA8978);
  xmmword_1E9FA89B0 = xmmword_1E9FA8980;
  _LayoutConstants___constantsGraphicExtraLarge_6 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicExtraLarge_6, v20);
  *(double *)&qword_1E9FA89A0 = v20 * *(double *)&qword_1E9FA89A0;
  uint64_t v18 = [MEMORY[0x1E4F19A50] systemFontOfSize:*v12 weight:v10 * v20 design:v11];
  double v19 = (void *)qword_1E9FA89A8;
  qword_1E9FA89A8 = v18;

  xmmword_1E9FA89B0 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1E9FA89B0, v20);
}

void ___LayoutConstants_block_invoke_43(uint64_t a1, uint64_t a2)
{
  id v5 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:15.5];
  _LayoutConstants___constants_0_7 = v2;
  [v5 scaledValue:3 withOverride:44.5 forSizeClass:50.5];
  _LayoutConstants___constants_1_6 = v3;
  _LayoutConstants___constants_2_6 = 0x4024000000000000;
  [v5 scaledValue:62.0];
  _LayoutConstants___constants_3_3 = v4;
}

void ___LayoutConstants_block_invoke_44(uint64_t a1, void *a2)
{
  void v26[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v3 screenBounds];
  double v6 = v5;
  [v3 screenBounds];
  double v8 = v6 / v7;
  [v3 screenBounds];
  double v10 = v9;

  double v11 = v10 - NTKFaceEditingTabsTextSize();
  *(double *)&_LayoutConstants___constants_10 = v8 * (v11 - NTKFaceEditingFullscreenTabMargin());
  *((void *)&_LayoutConstants___constants_10 + 1) = 0x4034000000000000;
  v25[0] = &unk_1F16E1F50;
  v25[1] = &unk_1F16E1F68;
  v26[0] = &unk_1F16E7CC0;
  v26[1] = &unk_1F16E7CD0;
  void v25[2] = &unk_1F16E1F80;
  void v26[2] = &unk_1F16E7CE0;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  [v4 scaledValue:v12 withOverrides:100.0];
  *(void *)&xmmword_1E9FA8A70 = v13;

  *(long long *)((char *)&xmmword_1E9FA8A70 + 8) = xmmword_1BC8A1550;
  double v14 = *(double *)&_LayoutConstants___constants_10;
  double v15 = NTKFaceEditingFullscreenKeylineMargin();
  *(double *)&qword_1E9FA8A60 = v14 + (v15 + NTKKeylineWidth()) * -2.0;
  qword_1E9FA8A68 = 0;
  v23[0] = &unk_1F16E1F50;
  v23[1] = &unk_1F16E1F68;
  v24[0] = &unk_1F16E7CF0;
  v24[1] = &unk_1F16E7D00;
  void v23[2] = &unk_1F16E1F80;
  void v24[2] = &unk_1F16E7D10;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  [v4 scaledValue:v16 withOverrides:57.0];
  qword_1E9FA8A88 = v17;

  *(void *)&xmmword_1E9FA8A90 = 0x4034000000000000;
  v21[0] = &unk_1F16E1F50;
  v21[1] = &unk_1F16E1F80;
  v22[0] = &unk_1F16E7D20;
  v22[1] = &unk_1F16E7D30;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v4 scaledValue:v18 withOverrides:-35.5];
  *((void *)&xmmword_1E9FA8A90 + 1) = v19;

  [v4 scaledValue:3 withOverride:42.0 forSizeClass:43.0];
  qword_1E9FA8AA0 = v20;
}

void ___LayoutConstants_block_invoke_45(uint64_t a1, uint64_t a2)
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:3];
  v21[0] = &unk_1F16E24D8;
  v21[1] = &unk_1F16E24F0;
  v22[0] = &unk_1F16E7D40;
  v22[1] = &unk_1F16E7D40;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v2 scaledValue:v3 withOverrides:6.5];
  *(void *)&_LayoutConstants___constants_11 = v4;

  *((void *)&_LayoutConstants___constants_11 + 1) = 0x3FF8000000000000;
  v19[0] = &unk_1F16E2508;
  v19[1] = &unk_1F16E24D8;
  v20[0] = &unk_1F16E7D50;
  v20[1] = &unk_1F16E7D50;
  void v19[2] = &unk_1F16E24F0;
  void v19[3] = &unk_1F16E2520;
  void v20[2] = &unk_1F16E7D60;
  void v20[3] = &unk_1F16E7D70;
  v19[4] = &unk_1F16E2538;
  v19[5] = &unk_1F16E2550;
  v20[4] = &unk_1F16E7D80;
  v20[5] = &unk_1F16E7D90;
  v19[6] = &unk_1F16E2568;
  v19[7] = &unk_1F16E2580;
  v20[6] = &unk_1F16E7D70;
  void v20[7] = &unk_1F16E7D90;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:8];
  [v2 scaledValue:v5 withOverrides:6.0];
  qword_1E9FA8B58 = v6;

  v18[0] = &unk_1F16E7DA0;
  v18[1] = &unk_1F16E7DA0;
  v17[0] = &unk_1F16E2508;
  v17[1] = &unk_1F16E24D8;
  void v17[2] = &unk_1F16E24F0;
  void v17[3] = &unk_1F16E2550;
  void v18[2] = &unk_1F16E7DB0;
  void v18[3] = &unk_1F16E7DC0;
  v17[4] = &unk_1F16E2568;
  v17[5] = &unk_1F16E2580;
  v18[4] = &unk_1F16E7DB0;
  v18[5] = &unk_1F16E7DC0;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];
  [v2 scaledValue:v7 withOverrides:6.5];
  qword_1E9FA8B60 = v8;

  v15[0] = &unk_1F16E2508;
  v15[1] = &unk_1F16E24D8;
  v16[0] = &unk_1F16E7DD0;
  v16[1] = &unk_1F16E7DD0;
  void v15[2] = &unk_1F16E2550;
  void v15[3] = &unk_1F16E2568;
  void v16[2] = &unk_1F16E7D70;
  void v16[3] = &unk_1F16E7DD0;
  v15[4] = &unk_1F16E2580;
  v16[4] = &unk_1F16E7D70;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
  [v2 constantValue:v9 withOverrides:4.0];
  *(void *)&xmmword_1E9FA8B68 = v10;

  v13[0] = &unk_1F16E2508;
  v13[1] = &unk_1F16E24D8;
  v14[0] = &unk_1F16E7DD0;
  v14[1] = &unk_1F16E7DD0;
  void v13[2] = &unk_1F16E2568;
  v13[3] = &unk_1F16E2580;
  v14[2] = &unk_1F16E7DD0;
  void v14[3] = &unk_1F16E7DD0;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  [v2 constantValue:v11 withOverrides:3.0];
  *((void *)&xmmword_1E9FA8B68 + 1) = v12;

  qword_1E9FA8B78 = 0;
}

void ___LayoutConstants_block_invoke_46(uint64_t a1, uint64_t a2)
{
  void v38[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v37[0] = &unk_1F16E25F8;
  v37[1] = &unk_1F16E2610;
  v38[0] = &unk_1F16E7E00;
  v38[1] = &unk_1F16E7E10;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  [v2 scaledValue:v3 withOverrides:19.5];
  *((void *)&_LayoutConstants_constants_2 + 1) = v4;

  v35[0] = &unk_1F16E25F8;
  v35[1] = &unk_1F16E2610;
  v36[0] = &unk_1F16E7E20;
  v36[1] = &unk_1F16E7E30;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  [v2 scaledValue:v5 withOverrides:19.5];
  qword_1E9FA8C18 = v6;

  v33[0] = &unk_1F16E25F8;
  v33[1] = &unk_1F16E2610;
  v34[0] = &unk_1F16E7E20;
  v34[1] = &unk_1F16E7E30;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  [v2 scaledValue:v7 withOverrides:19.5];
  qword_1E9FA8C20 = v8;

  v31[0] = &unk_1F16E25F8;
  v31[1] = &unk_1F16E2610;
  v32[0] = &unk_1F16E7E40;
  v32[1] = &unk_1F16E7E50;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  [v2 scaledValue:v9 withOverrides:6.0];
  *(void *)&xmmword_1E9FA8C28 = v10;

  v29[0] = &unk_1F16E25F8;
  v29[1] = &unk_1F16E2610;
  v30[0] = &unk_1F16E7E60;
  v30[1] = &unk_1F16E7E70;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  [v2 scaledValue:v11 withOverrides:16.5];
  *((void *)&xmmword_1E9FA8C28 + 1) = v12;

  qword_1E9FA8C38 = 0;
  v27[0] = &unk_1F16E25F8;
  v27[1] = &unk_1F16E2610;
  v28[0] = &unk_1F16E7E80;
  v28[1] = &unk_1F16E7E90;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v2 scaledValue:v13 withOverrides:7.5];
  qword_1E9FA8C40 = v14;

  [v2 scaledValue:3 withOverride:2.0 forSizeClass:3.0];
  *(void *)&_LayoutConstants_constants_2 = v15;
  v25[0] = &unk_1F16E25F8;
  v25[1] = &unk_1F16E2628;
  v26[0] = &unk_1F16E7EA0;
  v26[1] = &unk_1F16E7EB0;
  void v25[2] = &unk_1F16E2610;
  void v26[2] = &unk_1F16E7EC0;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  [v2 scaledValue:v16 withOverrides:66.0];
  *(void *)&xmmword_1E9FA8C48 = v17;

  [v2 scaledValue:0 withOverride:13.5 forSizeClass:12.0];
  qword_1E9FA8C80 = v18;
  [v2 scaledValue:0 withOverride:32.0 forSizeClass:28.0];
  *((void *)&xmmword_1E9FA8C68 + 1) = v19;
  unk_1E9FA8C78 = v19;
  v23[0] = &unk_1F16E25F8;
  v23[1] = &unk_1F16E2628;
  v24[0] = &unk_1F16E7E40;
  v24[1] = &unk_1F16E7E40;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v2 scaledValue:v20 withOverrides:8.5];
  uint64_t v22 = v21;

  *((void *)&xmmword_1E9FA8C48 + 1) = 0;
  qword_1E9FA8C58 = v22;
  qword_1E9FA8C60 = 0;
  *(void *)&xmmword_1E9FA8C68 = v22;
}

void ___LayoutConstants_block_invoke_47(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v3 scaledValue:15.5];
  _LayoutConstants___constants_0_8 = v2;
}

void ___LayoutConstants_block_invoke_48(uint64_t a1, void *a2)
{
  void v28[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  NTKShowGossamerUI(v3);
  v27[0] = &unk_1F16E2730;
  double v5 = [NSNumber numberWithDouble:1.5];
  v27[1] = &unk_1F16E2748;
  v28[0] = v5;
  uint64_t v6 = [NSNumber numberWithDouble:2.0];
  v28[1] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v4 scaledValue:v7 withOverrides:1.5];
  uint64_t v9 = v8;

  _LayoutConstants___constantsGraphicCircular_7 = v9;
  [v4 scaledValue:3 withOverride:6.0 forSizeClass:7.0];
  _LayoutConstants___constantsGraphicExtraLarge_7 = v10;
  [v4 setRoundingBehavior:3];
  uint64_t v11 = [off_1E62BDB38 defaultSecondConfigurationForDevice:v3];
  uint64_t v12 = (void *)qword_1E9FA8DA8;
  qword_1E9FA8DA8 = v11;

  [(id)qword_1E9FA8DA8 setHandWidth:2.5];
  [v4 scaledValue:11.0];
  objc_msgSend((id)qword_1E9FA8DA8, "setHandLength:");
  [(id)qword_1E9FA8DA8 setPegRadius:1.0];
  [(id)qword_1E9FA8DA8 setPegStrokeWidth:1.0];
  [(id)qword_1E9FA8DA8 setRoundedSecondHand:1];
  [(id)qword_1E9FA8DA8 setExcludeSecondTail:1];
  uint64_t v13 = (void *)qword_1E9FA8DA8;
  [(id)qword_1E9FA8DA8 radialShadowOpacity];
  [v13 setRadialShadowOpacity:v14 * 0.75];
  uint64_t v15 = (void *)qword_1E9FA8DA8;
  [(id)qword_1E9FA8DA8 dropShadowOpacity];
  [v15 setDropShadowOpacity:v16 * 1.5];
  uint64_t v17 = [off_1E62BDB38 defaultSecondConfigurationForDevice:v3];
  uint64_t v18 = (void *)qword_1E9FA8DB0;
  qword_1E9FA8DB0 = v17;

  [(id)qword_1E9FA8DB0 setHandWidth:2.5];
  [v4 scaledValue:19.5];
  objc_msgSend((id)qword_1E9FA8DB0, "setHandLength:");
  [(id)qword_1E9FA8DB0 setPegRadius:1.0];
  [(id)qword_1E9FA8DB0 setPegStrokeWidth:1.0];
  [(id)qword_1E9FA8DB0 setRoundedSecondHand:1];
  [(id)qword_1E9FA8DB0 setExcludeSecondTail:1];
  uint64_t v19 = (void *)qword_1E9FA8DB0;
  [(id)qword_1E9FA8DB0 radialShadowOpacity];
  [v19 setRadialShadowOpacity:v20 * 0.75];
  uint64_t v21 = (void *)qword_1E9FA8DB0;
  [(id)qword_1E9FA8DB0 dropShadowOpacity];
  [v21 setDropShadowOpacity:v22 * 1.5];
  uint64_t v23 = [off_1E62BDB38 defaultSecondConfigurationForDevice:v3];
  uint64_t v24 = (void *)qword_1E9FA8DC0;
  qword_1E9FA8DC0 = v23;

  [(id)qword_1E9FA8DC0 setHandWidth:6.0];
  [v4 scaledValue:31.0];
  objc_msgSend((id)qword_1E9FA8DC0, "setHandLength:");
  [(id)qword_1E9FA8DC0 setPegRadius:3.0];
  [(id)qword_1E9FA8DC0 setPegStrokeWidth:3.0];
  [(id)qword_1E9FA8DC0 setRoundedSecondHand:1];
  [(id)qword_1E9FA8DC0 setExcludeSecondTail:1];
  [(id)qword_1E9FA8DC0 setRadialShadowOpacity:0.3];
  [(id)qword_1E9FA8DC0 setRadialShadowRadius:10.0];
  [(id)qword_1E9FA8DC0 setSmoothingRadius:5.0];
  uint64_t v25 = [off_1E62BDB38 defaultSecondConfigurationForDevice:v3];

  uint64_t v26 = (void *)qword_1E9FA8DC8;
  qword_1E9FA8DC8 = v25;

  [(id)qword_1E9FA8DC8 setHandWidth:6.0];
  [v4 scaledValue:3 withOverride:56.0 forSizeClass:60.0];
  objc_msgSend((id)qword_1E9FA8DC8, "setHandLength:");
  [(id)qword_1E9FA8DC8 setPegRadius:3.0];
  [(id)qword_1E9FA8DC8 setPegStrokeWidth:3.0];
  [(id)qword_1E9FA8DC8 setRoundedSecondHand:1];
  [(id)qword_1E9FA8DC8 setExcludeSecondTail:1];
  [(id)qword_1E9FA8DC8 setRadialShadowOpacity:0.3];
  [(id)qword_1E9FA8DC8 setRadialShadowRadius:10.0];
  [(id)qword_1E9FA8DC8 setSmoothingRadius:5.0];
}

void ___LayoutConstants_block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  id v6 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  double v4 = NTKWhistlerSubdialComplicationEditingInset(v3);

  _LayoutConstants___constants_0_9 = *(void *)&v4;
  _LayoutConstants___constants_1_7 = 0x4046800000000000;
  [v6 scaledValue:38.0];
  _LayoutConstants___constants_2_7 = v5;
}

void ___LayoutConstants_block_invoke_50(uint64_t a1, uint64_t a2)
{
  v197[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 setScale:3 forSizeClass:1.13580247];
  v196[0] = &unk_1F16E2868;
  v196[1] = &unk_1F16E2880;
  v197[0] = &unk_1F16E7ED0;
  v197[1] = &unk_1F16E7EE0;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v197 forKeys:v196 count:2];
  [v2 scaledValue:v3 withOverrides:6.0];
  _LayoutConstants__constants_1 = v4;

  v194[0] = &unk_1F16E2868;
  v194[1] = &unk_1F16E2898;
  v195[0] = &unk_1F16E7EF0;
  v195[1] = &unk_1F16E7F00;
  v194[2] = &unk_1F16E2880;
  v195[2] = &unk_1F16E28B0;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v195 forKeys:v194 count:3];
  [v2 scaledValue:v5 withOverrides:77.5];
  qword_1E9FA8E50 = v6;

  v192[0] = &unk_1F16E2868;
  v192[1] = &unk_1F16E2880;
  v193[0] = &unk_1F16E7F10;
  v193[1] = &unk_1F16E7F20;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v193 forKeys:v192 count:2];
  [v2 scaledValue:v7 withOverrides:-31.5];
  qword_1E9FA8ED8 = 0x3FE0000000000000;
  qword_1E9FA8EE0 = v8;

  [v2 constantValue:0 withOverride:0.0 forSizeClass:0.5];
  uint64_t v10 = v9;
  v190[0] = &unk_1F16E2868;
  v190[1] = &unk_1F16E2880;
  v191[0] = &unk_1F16E7F30;
  v191[1] = &unk_1F16E7F40;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v191 forKeys:v190 count:2];
  [v2 scaledValue:v11 withOverrides:-39.0];
  qword_1E9FA8EE8 = v10;
  unk_1E9FA8EF0 = v12;

  v188[0] = &unk_1F16E2868;
  long long v153 = xmmword_1BC8A18E0;
  uint64_t v13 = [MEMORY[0x1E4F29238] valueWithBytes:&v153 objCType:"{CGPoint=dd}"];
  v189[0] = v13;
  v188[1] = &unk_1F16E2898;
  long long v152 = xmmword_1BC8A18F0;
  double v14 = [MEMORY[0x1E4F29238] valueWithBytes:&v152 objCType:"{CGPoint=dd}"];
  v189[1] = v14;
  v188[2] = &unk_1F16E2880;
  long long v151 = xmmword_1BC8A1900;
  uint64_t v15 = [MEMORY[0x1E4F29238] valueWithBytes:&v151 objCType:"{CGPoint=dd}"];
  v189[2] = v15;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v189 forKeys:v188 count:3];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v16, 37.5, 59.5);
  qword_1E9FA8FE8 = v17;
  unk_1E9FA8FF0 = v18;

  objc_msgSend(v2, "scaledSize:", 24.0, 8.5);
  *(void *)&xmmword_1E9FA9028 = v19;
  *((void *)&xmmword_1E9FA9028 + 1) = v20;
  objc_msgSend(v2, "scaledPoint:", 9.5, 28.5);
  __asm { FMOV            V3.2D, #0.5 }
  v27.f64[1] = v26;
  xmmword_1E9FA8FF8 = (__int128)vaddq_f64(v27, vmulq_f64((float64x2_t)xmmword_1E9FA9028, _Q3));
  objc_msgSend(v2, "scaledPoint:withOverride:forSizeClass:", 3, 34.5, 51.0, 37.0, 55.5);
  qword_1E9FA9008 = v28;
  unk_1E9FA9010 = v29;
  v186[0] = &unk_1F16E2868;
  long long v150 = xmmword_1BC8A1910;
  uint64_t v30 = [MEMORY[0x1E4F29238] valueWithBytes:&v150 objCType:"{CGSize=dd}"];
  v187[0] = v30;
  v186[1] = &unk_1F16E2880;
  long long v149 = xmmword_1BC8A1920;
  uint64_t v31 = [MEMORY[0x1E4F29238] valueWithBytes:&v149 objCType:"{CGSize=dd}"];
  v187[1] = v31;
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v187 forKeys:v186 count:2];
  objc_msgSend(v2, "scaledSize:withOverrides:", v32, 48.0, 25.0);
  qword_1E9FA8EF8 = v33;
  unk_1E9FA8F00 = v34;

  v184[0] = &unk_1F16E2868;
  v184[1] = &unk_1F16E2880;
  v185[0] = &unk_1F16E7F50;
  v185[1] = &unk_1F16E7F60;
  uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v185 forKeys:v184 count:2];
  [v2 scaledValue:v35 withOverrides:78.0];
  qword_1E9FA8F08 = v36;

  [v2 scaledValue:42.0];
  qword_1E9FA8F10 = v37;
  v182[0] = &unk_1F16E2868;
  v182[1] = &unk_1F16E2898;
  v183[0] = &unk_1F16E7F70;
  v183[1] = &unk_1F16E7F80;
  v182[2] = &unk_1F16E2880;
  v183[2] = &unk_1F16E7F90;
  uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v183 forKeys:v182 count:3];
  [v2 scaledValue:v38 withOverrides:69.0];
  qword_1E9FA8F18 = v39;

  v180[0] = &unk_1F16E2868;
  v180[1] = &unk_1F16E2880;
  v181[0] = &unk_1F16E7FA0;
  v181[1] = &unk_1F16E7FB0;
  uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v181 forKeys:v180 count:2];
  [v2 scaledValue:v40 withOverrides:36.5];
  qword_1E9FA8F20 = v41;

  v178[0] = &unk_1F16E2868;
  long long v148 = xmmword_1BC8A1930;
  uint64_t v42 = [MEMORY[0x1E4F29238] valueWithBytes:&v148 objCType:"{CGPoint=dd}"];
  v179[0] = v42;
  v178[1] = &unk_1F16E2880;
  long long v147 = xmmword_1BC8A1940;
  uint64_t v43 = [MEMORY[0x1E4F29238] valueWithBytes:&v147 objCType:"{CGPoint=dd}"];
  v179[1] = v43;
  uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v179 forKeys:v178 count:2];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v44, 2.0, -64.5);
  qword_1E9FA8E58 = v45;
  unk_1E9FA8E60 = v46;

  v176[0] = &unk_1F16E2868;
  long long v146 = xmmword_1BC8A1950;
  uint64_t v47 = [MEMORY[0x1E4F29238] valueWithBytes:&v146 objCType:"{CGPoint=dd}"];
  v177[0] = v47;
  v176[1] = &unk_1F16E2880;
  long long v145 = xmmword_1BC8A1960;
  uint64_t v48 = [MEMORY[0x1E4F29238] valueWithBytes:&v145 objCType:"{CGPoint=dd}"];
  v177[1] = v48;
  uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v177 forKeys:v176 count:2];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v49, 60.0, -33.5);
  qword_1E9FA8E68 = v50;
  unk_1E9FA8E70 = v51;

  v174[0] = &unk_1F16E2868;
  long long v144 = xmmword_1BC8A1970;
  uint64_t v52 = [MEMORY[0x1E4F29238] valueWithBytes:&v144 objCType:"{CGPoint=dd}"];
  v175[0] = v52;
  v174[1] = &unk_1F16E2880;
  long long v143 = xmmword_1BC8A1980;
  long long v53 = [MEMORY[0x1E4F29238] valueWithBytes:&v143 objCType:"{CGPoint=dd}"];
  v175[1] = v53;
  uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v175 forKeys:v174 count:2];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v54, 68.5, 0.5);
  qword_1E9FA8E78 = v55;
  unk_1E9FA8E80 = v56;

  v172[0] = &unk_1F16E2868;
  long long v142 = xmmword_1BC8A1990;
  uint64_t v57 = [MEMORY[0x1E4F29238] valueWithBytes:&v142 objCType:"{CGPoint=dd}"];
  v173[0] = v57;
  v172[1] = &unk_1F16E2880;
  long long v141 = xmmword_1BC8A19A0;
  uint64_t v58 = [MEMORY[0x1E4F29238] valueWithBytes:&v141 objCType:"{CGPoint=dd}"];
  v173[1] = v58;
  uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v173 forKeys:v172 count:2];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v59, 60.0, 36.0);
  qword_1E9FA8E88 = v60;
  unk_1E9FA8E90 = v61;

  v170[0] = &unk_1F16E2868;
  long long v140 = xmmword_1BC8A19B0;
  uint64_t v62 = [MEMORY[0x1E4F29238] valueWithBytes:&v140 objCType:"{CGPoint=dd}"];
  v171[0] = v62;
  v170[1] = &unk_1F16E2880;
  long long v139 = xmmword_1BC8A19C0;
  v63 = [MEMORY[0x1E4F29238] valueWithBytes:&v139 objCType:"{CGPoint=dd}"];
  v171[1] = v63;
  uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v171 forKeys:v170 count:2];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v64, 2.0, 64.5);
  qword_1E9FA8E98 = v65;
  unk_1E9FA8EA0 = v66;

  v168[0] = &unk_1F16E2868;
  long long v138 = xmmword_1BC8A19D0;
  v67 = [MEMORY[0x1E4F29238] valueWithBytes:&v138 objCType:"{CGPoint=dd}"];
  v169[0] = v67;
  v168[1] = &unk_1F16E2880;
  long long v137 = xmmword_1BC8A19E0;
  uint64_t v68 = [MEMORY[0x1E4F29238] valueWithBytes:&v137 objCType:"{CGPoint=dd}"];
  v169[1] = v68;
  v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v169 forKeys:v168 count:2];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v69, -55.0, 36.0);
  qword_1E9FA8EA8 = v70;
  unk_1E9FA8EB0 = v71;

  v166[0] = &unk_1F16E2868;
  long long v136 = xmmword_1BC8A19F0;
  v72 = [MEMORY[0x1E4F29238] valueWithBytes:&v136 objCType:"{CGPoint=dd}"];
  v167[0] = v72;
  v166[1] = &unk_1F16E2880;
  long long v135 = xmmword_1BC8A1A00;
  v73 = [MEMORY[0x1E4F29238] valueWithBytes:&v135 objCType:"{CGPoint=dd}"];
  v167[1] = v73;
  v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v167 forKeys:v166 count:2];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v74, -66.5, 0.5);
  qword_1E9FA8EB8 = v75;
  unk_1E9FA8EC0 = v76;

  v164[0] = &unk_1F16E2868;
  long long v134 = xmmword_1BC8A1A10;
  v77 = [MEMORY[0x1E4F29238] valueWithBytes:&v134 objCType:"{CGPoint=dd}"];
  v165[0] = v77;
  v164[1] = &unk_1F16E2880;
  long long v133 = xmmword_1BC8A1A20;
  v78 = [MEMORY[0x1E4F29238] valueWithBytes:&v133 objCType:"{CGPoint=dd}"];
  v165[1] = v78;
  v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v165 forKeys:v164 count:2];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v79, -54.0, -33.5);
  qword_1E9FA8EC8 = v80;
  unk_1E9FA8ED0 = v81;

  v162[0] = &unk_1F16E2868;
  long long v132 = xmmword_1BC8A1A30;
  v82 = [MEMORY[0x1E4F29238] valueWithBytes:&v132 objCType:"{CGPoint=dd}"];
  v163[0] = v82;
  v162[1] = &unk_1F16E2880;
  long long v131 = xmmword_1BC8A1A40;
  v83 = [MEMORY[0x1E4F29238] valueWithBytes:&v131 objCType:"{CGPoint=dd}"];
  v163[1] = v83;
  v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v163 forKeys:v162 count:2];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v84, 4.5, -45.0);
  qword_1E9FA8F28 = v85;
  unk_1E9FA8F30 = v86;

  v160[0] = &unk_1F16E2868;
  long long v130 = xmmword_1BC8A1A50;
  uint64_t v87 = [MEMORY[0x1E4F29238] valueWithBytes:&v130 objCType:"{CGPoint=dd}"];
  v161[0] = v87;
  v160[1] = &unk_1F16E2880;
  long long v129 = xmmword_1BC8A1A60;
  v88 = [MEMORY[0x1E4F29238] valueWithBytes:&v129 objCType:"{CGPoint=dd}"];
  v161[1] = v88;
  long long v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v161 forKeys:v160 count:2];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v89, 40.0, 20.0);
  qword_1E9FA8F38 = v90;
  unk_1E9FA8F40 = v91;

  v158[0] = &unk_1F16E2868;
  long long v128 = xmmword_1BC8A1A70;
  long long v92 = [MEMORY[0x1E4F29238] valueWithBytes:&v128 objCType:"{CGPoint=dd}"];
  v159[0] = v92;
  v158[1] = &unk_1F16E2880;
  long long v127 = xmmword_1BC8A1A80;
  long long v93 = [MEMORY[0x1E4F29238] valueWithBytes:&v127 objCType:"{CGPoint=dd}"];
  v159[1] = v93;
  long long v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v159 forKeys:v158 count:2];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v94, -5.5, 51.5);
  qword_1E9FA8F48 = v95;
  unk_1E9FA8F50 = v96;

  v156[0] = &unk_1F16E2868;
  long long v126 = xmmword_1BC8A1A90;
  long long v97 = [MEMORY[0x1E4F29238] valueWithBytes:&v126 objCType:"{CGPoint=dd}"];
  v157[0] = v97;
  v156[1] = &unk_1F16E2880;
  long long v125 = xmmword_1BC8A1AA0;
  v98 = [MEMORY[0x1E4F29238] valueWithBytes:&v125 objCType:"{CGPoint=dd}"];
  v157[1] = v98;
  v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v157 forKeys:v156 count:2];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v99, -37.0, 20.0);
  qword_1E9FA8F58 = v100;
  unk_1E9FA8F60 = v101;

  objc_msgSend(v2, "scaledPoint:", 56.5, 43.5);
  qword_1E9FA8F68 = v102;
  unk_1E9FA8F70 = v103;
  objc_msgSend(v2, "scaledPoint:", 73.5, 78.0);
  qword_1E9FA8F78 = v104;
  unk_1E9FA8F80 = v105;
  objc_msgSend(v2, "scaledPoint:", 50.0, 95.0);
  qword_1E9FA8F88 = v106;
  unk_1E9FA8F90 = v107;
  objc_msgSend(v2, "scaledPoint:", 34.5, 78.0);
  qword_1E9FA8F98 = v108;
  unk_1E9FA8FA0 = v109;
  objc_msgSend(v2, "scaledPoint:withOverride:forSizeClass:", 3, 3.0, -38.0, -3.5, -39.5);
  qword_1E9FA8FA8 = v110;
  unk_1E9FA8FB0 = v111;
  objc_msgSend(v2, "scaledPoint:withOverride:forSizeClass:", 3, 34.0, 17.5, 35.5, 18.5);
  qword_1E9FA8FB8 = v112;
  unk_1E9FA8FC0 = v113;
  objc_msgSend(v2, "scaledPoint:withOverride:forSizeClass:", 3, -5.0, 45.0, -5.5, 47.0);
  qword_1E9FA8FC8 = v114;
  unk_1E9FA8FD0 = v115;
  objc_msgSend(v2, "scaledPoint:withOverride:forSizeClass:", 3, -31.5, 17.5, -33.0, 18.0);
  qword_1E9FA8FD8 = v116;
  unk_1E9FA8FE0 = v117;
  v154[0] = &unk_1F16E2868;
  long long v124 = xmmword_1BC8A1AB0;
  v118 = [MEMORY[0x1E4F29238] valueWithBytes:&v124 objCType:"{CGSize=dd}"];
  v154[1] = &unk_1F16E2880;
  v155[0] = v118;
  long long v123 = xmmword_1BC8A1AC0;
  v119 = [MEMORY[0x1E4F29238] valueWithBytes:&v123 objCType:"{CGSize=dd}"];
  v155[1] = v119;
  v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v155 forKeys:v154 count:2];
  objc_msgSend(v2, "scaledSize:withOverrides:", v120, 40.0, 14.5);
  qword_1E9FA9018 = v121;
  unk_1E9FA9020 = v122;
}

void ___LayoutConstants_block_invoke_51(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v3 scaledValue:3 withOverride:67.0 forSizeClass:73.0];
  _LayoutConstants___constants_0_10 = v2;
}

void ___LayoutConstants_block_invoke_52(uint64_t a1, uint64_t a2)
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v22[0] = &unk_1F16E3FD8;
  v22[1] = &unk_1F16E3FF0;
  v23[0] = &unk_1F16E8150;
  v23[1] = &unk_1F16E8160;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v2 scaledValue:v3 withOverrides:16.5];
  *(void *)&_LayoutConstants___constants_12 = v4;

  v20[0] = &unk_1F16E3FD8;
  v20[1] = &unk_1F16E4008;
  v21[0] = &unk_1F16E8170;
  v21[1] = &unk_1F16E8180;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v2 scaledValue:v5 withOverrides:8.5];
  *((void *)&_LayoutConstants___constants_12 + 1) = v6;

  v18[0] = &unk_1F16E3FD8;
  v18[1] = &unk_1F16E4008;
  v19[0] = &unk_1F16E8190;
  v19[1] = &unk_1F16E8190;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v2 scaledValue:v7 withOverrides:8.5];
  qword_1E9FA9C20 = v8;

  [v2 scaledValue:9.0];
  qword_1E9FA9C28 = v9;
  v16[0] = &unk_1F16E3FD8;
  v16[1] = &unk_1F16E3FF0;
  v17[0] = &unk_1F16E81A0;
  v17[1] = &unk_1F16E8170;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v2 scaledValue:v10 withOverrides:4.0];
  *(void *)&xmmword_1E9FA9C30 = v11;

  v14[0] = &unk_1F16E3FD8;
  v14[1] = &unk_1F16E3FF0;
  v15[0] = &unk_1F16E81B0;
  v15[1] = &unk_1F16E81C0;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v2 scaledValue:v12 withOverrides:111.0];
  *((void *)&xmmword_1E9FA9C30 + 1) = v13;
}

void ___LayoutConstants_block_invoke_53(uint64_t a1, uint64_t a2)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v7[0] = &unk_1F16E4290;
  v7[1] = &unk_1F16E42A8;
  v8[0] = &unk_1F16E8390;
  v8[1] = &unk_1F16E83A0;
  v7[2] = &unk_1F16E42C0;
  v8[2] = &unk_1F16E83A0;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  [v2 scaledValue:v3 withOverrides:13.0];
  _LayoutConstants___constants_0_11 = v4;

  if (CLKLanguageIsTallScript()) {
    *(double *)&_LayoutConstants___constants_0_11 = *(double *)&_LayoutConstants___constants_0_11 + -1.0;
  }
  [v2 scaledValue:11.0];
  _LayoutConstants___constants_1_8 = v5;
  [v2 scaledValue:5.0];
  _LayoutConstants___constants_2_8 = v6;
}

void ___LayoutConstants_block_invoke_54(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 sizeClass];
  +[NTKAnalogUtilities dialSizeForDevice:v2];
  *(double *)&_LayoutConstants___constants_13 = v4 + -1.0;
  *((void *)&_LayoutConstants___constants_13 + 1) = 0;
  unk_1E9FAA000 = 0;
  *(double *)&qword_1E9FAA008 = v4 + -1.0;
  *(double *)&xmmword_1E9FAA010 = v4 + -1.0;
  double v5 = -3.0;
  if (!v3) {
    double v5 = -2.0;
  }
  *((void *)&xmmword_1E9FAA010 + 1) = 0;
  qword_1E9FAA020 = *(void *)&v5;
  *(_OWORD *)algn_1E9FAA028 = *MEMORY[0x1E4F1DAD8];
  *((void *)&xmmword_1E9FAA030 + 1) = 0x3FF0000000000000;
  [v2 screenBounds];
  double v7 = v6;
  +[NTKAnalogUtilities dialSizeForDevice:v2];
  *(float *)&double v8 = v7 / v8;
  dword_1E9FAA040 = LODWORD(v8);
  uint64_t v9 = [v2 deviceCategory];
  uint64_t v10 = 10;
  if (v9 != 1) {
    uint64_t v10 = 24;
  }
  qword_1E9FAA048 = v10;
  uint64_t v11 = [v2 deviceCategory];

  uint64_t v12 = 30;
  if (v11 == 1) {
    uint64_t v12 = 24;
  }
  qword_1E9FAA050 = v12;
}

void ___LayoutConstants_block_invoke_55(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  id v11 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  *(void *)&_LayoutConstants___constantsGraphicCircular_8 = NTKWhistlerSubdialComplicationContentDiameter(v3);
  *((void *)&_LayoutConstants___constantsGraphicCircular_8 + 1) = 0x3FF8000000000000;
  *(double *)&xmmword_1E9FAA0D8 = NTKWhistlerSubdialComplicationContentDiameter(v3) * 0.5;
  *((void *)&xmmword_1E9FAA0D8 + 1) = 0x3FF0000000000000;
  double v4 = NTKWhistlerSubdialComplicationContentDiameter(v3);
  [v11 scaledValue:3 withOverride:26.0 forSizeClass:29.0];
  qword_1E9FAA0C8 = *(void *)&v4;
  unk_1E9FAA0D0 = v5;
  [v11 scaledValue:4.5];
  qword_1E9FAA0E8 = v6;
  qword_1E9FAA0F0 = 0x3FF0000000000000;
  [v11 scaledValue:4.0];
  *(void *)&xmmword_1E9FAA0F8 = v7;
  *(long long *)((char *)&xmmword_1E9FAA0F8 + 8) = (__int128)vdupq_n_s64(0x3FE3333333333333uLL);
  qword_1E9FAA110 = 0x3FD6666666666666;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v10 = v8;
  xmmword_1E9FAA138 = xmmword_1E9FAA0D8;
  unk_1E9FAA148 = *(_OWORD *)&qword_1E9FAA0E8;
  xmmword_1E9FAA158 = xmmword_1E9FAA0F8;
  unk_1E9FAA168 = unk_1E9FAA108;
  _LayoutConstants___constantsGraphicExtraLarge_8 = _LayoutConstants___constantsGraphicCircular_8;
  xmmword_1E9FAA128 = *(_OWORD *)&qword_1E9FAA0C8;
  *(void *)&_LayoutConstants___constantsGraphicExtraLarge_8 = NTKGraphicExtraLargeComplicationContentDiameter(v3);
  *((double *)&_LayoutConstants___constantsGraphicExtraLarge_8 + 1) = v10
                                                                    * *((double *)&_LayoutConstants___constantsGraphicExtraLarge_8
                                                                      + 1);
  double v9 = NTKGraphicExtraLargeComplicationContentDiameter(v3);

  *(double *)&xmmword_1E9FAA138 = v9 * 0.5;
  xmmword_1E9FAA128 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1E9FAA128, v10);
  *(long long *)((char *)&xmmword_1E9FAA138 + 8) = (__int128)vmulq_n_f64(*(float64x2_t *)((char *)&xmmword_1E9FAA138 + 8), v10);
  unk_1E9FAA150 = vmulq_n_f64(unk_1E9FAA150, v10);
  *(long long *)((char *)&xmmword_1E9FAA158 + 8) = (__int128)vmulq_n_f64(*(float64x2_t *)((char *)&xmmword_1E9FAA158 + 8), v10);
}

void ___LayoutConstants_block_invoke_56(uint64_t a1, uint64_t a2)
{
  id v10 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v10 scaledValue:15.5];
  *(void *)&_LayoutConstants___constants_14 = v2;
  [v10 scaledValue:3 withOverride:6.0 forSizeClass:8.0];
  qword_1E9FAA1A8 = v3;
  __asm { FMOV            V0.2D, #10.0 }
  *(long long *)((char *)&_LayoutConstants___constants_14 + 8) = _Q0;
  [v10 scaledValue:3 withOverride:67.0 forSizeClass:73.0];
  qword_1E9FAA1B0 = v9;
}

void ___LayoutConstants_block_invoke_57(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v4 scaledValue:15.5];
  _LayoutConstants___constants_0_12 = v2;
  [v4 scaledValue:3 withOverride:6.0 forSizeClass:8.0];
  _LayoutConstants___constants_1_9 = v3;
}

void ___LayoutConstants_block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  id v13 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v13 scaledValue:9.0];
  *(void *)&_LayoutConstants__constants_2 = v4;
  [v13 scaledValue:9.0];
  *((void *)&_LayoutConstants__constants_2 + 1) = v5;
  [v13 scaledValue:36.0];
  qword_1E9FAA210 = v6;
  [v13 scaledValue:22.5];
  qword_1E9FAA218 = v7;
  [v13 scaledValue:10.0];
  qword_1E9FAA230 = v8;
  [v13 scaledValue:17.0];
  qword_1E9FAA238 = v9;
  [v13 scaledValue:4.0];
  *(void *)&xmmword_1E9FAA220 = v10;
  *((void *)&xmmword_1E9FAA220 + 1) = 0x3FEE76C4090CD1D0;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v12 = v11;

  xmmword_1E9FAA260 = xmmword_1E9FAA220;
  _LayoutConstants__constantsGraphicExtraLarge_0 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants__constants_2, v12);
  *(float64x2_t *)algn_1E9FAA250 = vmulq_n_f64(*(float64x2_t *)&qword_1E9FAA210, v12);
  xmmword_1E9FAA270 = (__int128)vmulq_n_f64(*(float64x2_t *)&qword_1E9FAA230, v12);
  *(double *)&xmmword_1E9FAA260 = v12 * *(double *)&xmmword_1E9FAA220;
}

void ___LayoutConstants_block_invoke_59(uint64_t a1, uint64_t a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v11[0] = &unk_1F16E4368;
  v11[1] = &unk_1F16E4380;
  v12[0] = &unk_1F16E83B0;
  v12[1] = &unk_1F16E83B0;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v2 scaledValue:v3 withOverrides:8.5];
  uint64_t v5 = v4;

  _LayoutConstants_constants_1_7 = v5;
  _LayoutConstants_constants_3_5 = v5;
  v9[0] = &unk_1F16E4368;
  v9[1] = &unk_1F16E4398;
  v10[0] = &unk_1F16E83C0;
  v10[1] = &unk_1F16E83D0;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v2 scaledValue:v6 withOverrides:15.5];
  uint64_t v8 = v7;

  _LayoutConstants_constants_5_2 = v8;
  _LayoutConstants_constants_7_2 = v8;
}

void ___LayoutConstants_block_invoke_60(uint64_t a1, uint64_t a2)
{
  id v7 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v7 scaledValue:8 withOverride:9.0 forSizeClass:10.0];
  _LayoutConstants_constants_0_7 = v2;
  [v7 scaledValue:7.5];
  _LayoutConstants_constants_1_8 = v3;
  [v7 scaledValue:3 withOverride:14.0 forSizeClass:15.0];
  _LayoutConstants_constants_2_7 = v4;
  [v7 scaledValue:8 withOverride:9.0 forSizeClass:10.0];
  _LayoutConstants_constants_3_6 = v5;
  [v7 scaledValue:1.0];
  _LayoutConstants_constants_4_4 = v6;
}

void ___LayoutConstants_block_invoke_61(uint64_t a1, uint64_t a2)
{
  id v6 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v6 scaledValue:3 withOverride:18.0 forSizeClass:19.5];
  _LayoutConstants___constants_0_13 = v2;
  [v6 scaledValue:17.0];
  _LayoutConstants___constants_1_10 = v3;
  [v6 scaledValue:15.5];
  _LayoutConstants___constants_2_9 = v4;
  [v6 scaledValue:62.0];
  _LayoutConstants___constants_3_4 = v5;
}

void ___LayoutConstants_block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  id v9 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  +[NTKAnalogUtilities largeDialDiameterForDevice:v3];
  uint64_t v5 = v4;

  _LayoutConstants_constants_0_8 = v5;
  [v9 scaledValue:3 withOverride:17.0 forSizeClass:19.0];
  _LayoutConstants_constants_1_9 = v6;
  CLKDegreesToRadians();
  _LayoutConstants_constants_2_8 = v7;
  CLKDegreesToRadians();
  _LayoutConstants_constants_3_7 = v8;
}

void ___LayoutConstants_block_invoke_63(uint64_t a1, void *a2)
{
  id v2 = a2;
  *((void *)&_LayoutConstants_layoutConstants_1 + 1) = 0x4010000000000000;
  qword_1E9FAA480 = 0x4008000000000000;
  *((void *)&xmmword_1E9FAA488 + 1) = 0x4008000000000000;
  id v8 = v2;
  uint64_t v3 = [v2 deviceCategory];
  if ((unint64_t)(v3 - 3) < 3)
  {
    *(void *)&_LayoutConstants_layoutConstants_1 = 0x401C000000000000;
    qword_1E9FAA478 = 0x401C000000000000;
    *(void *)&xmmword_1E9FAA488 = 0x4014000000000000;
    uint64_t v4 = v8;
LABEL_8:
    [v4 screenCornerRadius];
    uint64_t v6 = v8;
    goto LABEL_9;
  }
  if (v3 == 2)
  {
    *(void *)&_LayoutConstants_layoutConstants_1 = 0x4026000000000000;
    qword_1E9FAA478 = 0x4026000000000000;
    *(void *)&xmmword_1E9FAA488 = 0x401C000000000000;
    uint64_t v4 = v8;
    goto LABEL_8;
  }
  BOOL v5 = v3 == 1;
  uint64_t v6 = v8;
  if (v5)
  {
    *(void *)&_LayoutConstants_layoutConstants_1 = 0x4026000000000000;
    qword_1E9FAA478 = 0x4028000000000000;
    *(void *)&xmmword_1E9FAA488 = 0x4020000000000000;
    double v7 = 12.0;
LABEL_9:
    qword_1E9FAA498 = *(void *)&v7;
  }
}

void ___LayoutConstants_block_invoke_64(uint64_t a1, void *a2)
{
  void v43[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  +[NTKAnalogUtilities whistlerMediumDialDiameterForDevice:v3];
  *(void *)&_LayoutConstants___constants_15 = v5;
  v42[0] = &unk_1F16E44D0;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 15.5, 16.0);
  v42[1] = &unk_1F16E44E8;
  v43[0] = v6;
  double v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", 15.5, 16.0);
  v43[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
  objc_msgSend(v4, "scaledSize:withOverrides:", v8, 13.0, 14.0);
  *((void *)&_LayoutConstants___constants_15 + 1) = v9;
  unk_1E9FAA518 = v10;

  v40[0] = &unk_1F16E44D0;
  v40[1] = &unk_1F16E4500;
  v41[0] = &unk_1F16E83E0;
  v41[1] = &unk_1F16E83F0;
  void v40[2] = &unk_1F16E4518;
  v40[3] = &unk_1F16E44E8;
  void v41[2] = &unk_1F16E8400;
  v41[3] = &unk_1F16E8410;
  v40[4] = &unk_1F16E4530;
  v40[5] = &unk_1F16E4548;
  v41[4] = &unk_1F16E8420;
  v41[5] = &unk_1F16E8410;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:6];
  [v4 scaledValue:v11 withOverrides:5.0];
  qword_1E9FAA520 = v12;

  v38[0] = &unk_1F16E44D0;
  v38[1] = &unk_1F16E44E8;
  v39[0] = &unk_1F16E8430;
  v39[1] = &unk_1F16E8440;
  void v38[2] = &unk_1F16E4530;
  void v38[3] = &unk_1F16E4548;
  void v39[2] = &unk_1F16E8450;
  v39[3] = &unk_1F16E8440;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];
  [v4 scaledValue:v13 withOverrides:15.0];
  *(void *)&xmmword_1E9FAA528 = v14;

  [v4 scaledValue:3 withOverride:42.0 forSizeClass:47.0];
  *((void *)&xmmword_1E9FAA528 + 1) = v15;
  qword_1E9FAA538 = NTKWhistlerSubdialComplicationContentDiameter(v3);
  [v4 scaledValue:3 withOverride:69.0 forSizeClass:78.0];
  qword_1E9FAA540 = v16;
  v36[0] = &unk_1F16E44D0;
  v36[1] = &unk_1F16E4500;
  v37[0] = &unk_1F16E83E0;
  v37[1] = &unk_1F16E8460;
  void v36[2] = &unk_1F16E4518;
  v36[3] = &unk_1F16E44E8;
  void v37[2] = &unk_1F16E8470;
  v37[3] = &unk_1F16E8410;
  v36[4] = &unk_1F16E4530;
  v36[5] = &unk_1F16E4548;
  v37[4] = &unk_1F16E8460;
  v37[5] = &unk_1F16E8410;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:6];
  [v4 scaledValue:v17 withOverrides:6.0];
  *(void *)&xmmword_1E9FAA548 = v18;

  __asm { FMOV            V0.2D, #4.0 }
  *(long long *)((char *)&xmmword_1E9FAA548 + 8) = _Q0;
  unk_1E9FAA560 = _Q0;
  v34[0] = &unk_1F16E44D0;
  v34[1] = &unk_1F16E44E8;
  v35[0] = &unk_1F16E8480;
  v35[1] = &unk_1F16E8490;
  void v34[2] = &unk_1F16E4530;
  void v34[3] = &unk_1F16E4548;
  void v35[2] = &unk_1F16E8480;
  void v35[3] = &unk_1F16E84A0;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
  [v4 scaledValue:v24 withOverrides:0.5];
  *((void *)&xmmword_1E9FAA568 + 1) = v25;

  v32[0] = &unk_1F16E44D0;
  v32[1] = &unk_1F16E44E8;
  v33[0] = &unk_1F16E84B0;
  v33[1] = &unk_1F16E8490;
  void v32[2] = &unk_1F16E4530;
  void v32[3] = &unk_1F16E4548;
  void v33[2] = &unk_1F16E84B0;
  void v33[3] = &unk_1F16E8470;
  float64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:4];
  [v4 scaledValue:v26 withOverrides:2.0];
  qword_1E9FAA578 = v27;

  [v4 scaledValue:3 withOverride:188.0 forSizeClass:213.0];
  qword_1E9FAA580 = v28;
  xmmword_1E9FAA588 = xmmword_1BC8A11C0;
  [v4 scaledValue:3 withOverride:-23.0 forSizeClass:-26.0];
  qword_1E9FAA598 = v29;
  qword_1E9FAA5A0 = 0x4020000000000000;
  [v3 screenBounds];
  +[NTKGossamerColorPalette contentScaleForTintedBackground];
  CLKFloorForDevice();
  uint64_t v31 = v30;

  qword_1E9FAA5A8 = v31;
}

void ___LayoutConstants_block_invoke_65(uint64_t a1, uint64_t a2)
{
  double v11 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v11 setRoundingBehavior:3];
  _LayoutConstants___constants_16 = 0x401A000000000000;
  [v11 scaledValue:3 withOverride:22.5 forSizeClass:25.75];
  qword_1E9FAA5D0 = v2;
  xmmword_1E9FAA5D8 = xmmword_1BC8A23C0;
  unk_1E9FAA5E8 = xmmword_1BC8A0340;
  xmmword_1E9FAA5F8 = xmmword_1BC8A23D0;
  unk_1E9FAA608 = xmmword_1BC8A23E0;
  __asm { FMOV            V0.2D, #1.0 }
  long long v10 = _Q0;
  xmmword_1E9FAA618 = _Q0;
  qword_1E9FAA628 = 0x401A000000000000;
  [v11 scaledValue:3 withOverride:41.5 forSizeClass:47.0];
  qword_1E9FAA630 = v8;
  xmmword_1E9FAA638 = xmmword_1BC8A23F0;
  unk_1E9FAA648 = xmmword_1BC8A0340;
  xmmword_1E9FAA658 = xmmword_1BC8A23D0;
  unk_1E9FAA668 = xmmword_1BC8A23E0;
  xmmword_1E9FAA678 = v10;
  qword_1E9FAA688 = 0x3FF4000000000000;
  [v11 scaledValue:3 withOverride:50.5 forSizeClass:58.5];
  qword_1E9FAA690 = v9;
  xmmword_1E9FAA698 = xmmword_1BC8A2400;
  unk_1E9FAA6A8 = xmmword_1BC8A2410;
  xmmword_1E9FAA6B8 = xmmword_1BC8A2420;
  unk_1E9FAA6C8 = xmmword_1BC8A2430;
  qword_1E9FAA6D8 = 0x4000000000000000;
}

void ___LayoutConstants_block_invoke_66(uint64_t a1, void *a2)
{
  v89[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  v88 = &unk_1F16E4560;
  v89[0] = &unk_1F16E84C0;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:&v88 count:1];
  [v4 scaledValue:v5 withOverrides:13.5];
  _LayoutConstants___constants_17 = v6;

  v86[0] = &unk_1F16E4578;
  v86[1] = &unk_1F16E4560;
  v87[0] = &unk_1F16E84D0;
  v87[1] = &unk_1F16E84E0;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:2];
  [v4 scaledValue:v7 withOverrides:9.5];
  qword_1E9FAA7D8 = v8;

  v84[0] = &unk_1F16E4578;
  v84[1] = &unk_1F16E4560;
  v85[0] = &unk_1F16E84F0;
  v85[1] = &unk_1F16E8500;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
  [v4 scaledValue:v9 withOverrides:17.0];
  qword_1E9FAA7E0 = v10;

  v82[0] = &unk_1F16E4578;
  v82[1] = &unk_1F16E4560;
  v83[0] = &unk_1F16E8510;
  v83[1] = &unk_1F16E8520;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
  [v4 scaledValue:v11 withOverrides:45.0];
  qword_1E9FAA7E8 = v12;

  v80[0] = &unk_1F16E4578;
  v80[1] = &unk_1F16E4560;
  v81[0] = &unk_1F16E8530;
  v81[1] = &unk_1F16E8540;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:2];
  [v4 scaledValue:v13 withOverrides:128.0];
  qword_1E9FAA7F0 = v14;

  v78 = &unk_1F16E4560;
  v79 = &unk_1F16E8550;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
  [v4 scaledValue:v15 withOverrides:22.0];
  qword_1E9FAA800 = v16;

  uint64_t v76 = &unk_1F16E4578;
  v77 = &unk_1F16E8560;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  [v4 scaledValue:v17 withOverrides:2.0];
  qword_1E9FAA808 = v18;

  xmmword_1E9FAA810 = xmmword_1BC8A2460;
  qword_1E9FAA820 = 0x402F000000000000;
  v74[0] = &unk_1F16E4578;
  v74[1] = &unk_1F16E4560;
  v75[0] = &unk_1F16E84F0;
  v75[1] = &unk_1F16E8500;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];
  [v4 scaledValue:v19 withOverrides:17.0];
  qword_1E9FAA828 = v20;

  v72[0] = &unk_1F16E4578;
  v72[1] = &unk_1F16E4560;
  v73[0] = &unk_1F16E8570;
  v73[1] = &unk_1F16E8580;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
  [v4 scaledValue:v21 withOverrides:2.5];
  qword_1E9FAA830 = v22;

  qword_1E9FAA838 = qword_1E9FAA830;
  v70[0] = &unk_1F16E4578;
  v70[1] = &unk_1F16E4560;
  v71[0] = &unk_1F16E8590;
  v71[1] = &unk_1F16E85A0;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
  [v4 scaledValue:v23 withOverrides:5.0];
  qword_1E9FAA840 = v24;

  v68[0] = &unk_1F16E4578;
  v68[1] = &unk_1F16E4590;
  v69[0] = &unk_1F16E8560;
  v69[1] = &unk_1F16E8560;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
  [v4 constantValue:v25 withOverrides:0.0];
  qword_1E9FAA848 = v26;

  xmmword_1E9FAA850 = xmmword_1BC8A2470;
  unk_1E9FAA860 = xmmword_1BC8A2480;
  xmmword_1E9FAA870 = xmmword_1BC8A2490;
  v66[0] = &unk_1F16E4578;
  v66[1] = &unk_1F16E4560;
  v67[0] = &unk_1F16E85B0;
  v67[1] = &unk_1F16E85C0;
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
  [v4 scaledValue:v27 withOverrides:12.5];
  *(double *)&qword_1E9FAA7F8 = v28 - *(double *)&xmmword_1E9FAA850;

  xmmword_1E9FAA880 = xmmword_1BC8A24A0;
  qword_1E9FAA890 = 0x4020000000000000;
  uint64_t v64 = &unk_1F16E4560;
  uint64_t v65 = &unk_1F16E85D0;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  [v4 scaledValue:v29 withOverrides:84.0];
  qword_1E9FAA898 = v30;

  uint64_t v62 = &unk_1F16E4560;
  v63 = &unk_1F16E85E0;
  uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  [v4 scaledValue:v31 withOverrides:94.0];
  qword_1E9FAA8A0 = v32;

  CLKDegreesToRadians();
  qword_1E9FAA8A8 = v33;
  qword_1E9FAA8B0 = 0;
  CLKDegreesToRadians();
  qword_1E9FAA8B8 = v34;
  CLKDegreesToRadians();
  qword_1E9FAA8C0 = v35;
  uint64_t v60 = &unk_1F16E4560;
  uint64_t v61 = &unk_1F16E85F0;
  uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  [v4 scaledValue:v36 withOverrides:-17.5];
  qword_1E9FAA8C8 = v37;

  uint64_t v58 = &unk_1F16E4560;
  uint64_t v59 = &unk_1F16E8600;
  uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  [v4 scaledValue:v38 withOverrides:50.0];
  qword_1E9FAA8D0 = v39;

  [v3 screenBounds];
  double v41 = v40 * 0.5;
  [v4 scaledValue:3 withOverride:82.5 forSizeClass:95.0];
  *(double *)&qword_1E9FAA8D8 = v41 - v42;
  [v3 screenBounds];
  double v44 = v43;

  [v4 scaledValue:3 withOverride:93.5 forSizeClass:104.5];
  *(double *)&qword_1E9FAA8E0 = v44 * 0.5 - v45;
  [v4 scaledValue:3 withOverride:2.0 forSizeClass:2.0];
  qword_1E9FAA8E8 = v46;
  [v4 scaledValue:3 withOverride:16.5 forSizeClass:16.5];
  qword_1E9FAA8F0 = v47;
  [v4 scaledValue:3 withOverride:4.5 forSizeClass:4.5];
  qword_1E9FAA8F8 = v48;
  [v4 scaledValue:3 withOverride:15.0 forSizeClass:15.0];
  uint64_t v50 = v49;
  [v4 scaledValue:3 withOverride:10.0 forSizeClass:10.0];
  qword_1E9FAA900 = v50;
  qword_1E9FAA908 = 0x3FAEB851EB851EB8;
  qword_1E9FAA910 = v51;
  qword_1E9FAA918 = 0x3FAEB851EB851EB8;
  [v4 setRoundingBehavior:0];
  CLKDegreesToRadians();
  double v53 = v52;
  v56[0] = &unk_1F16E4578;
  v56[1] = &unk_1F16E4590;
  v57[0] = &unk_1F16E8610;
  v57[1] = &unk_1F16E8610;
  uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
  [v4 scaledValue:v54 withOverrides:v53];
  qword_1E9FAA920 = v55;
}

void ___LayoutConstants_block_invoke_67(uint64_t a1, uint64_t a2)
{
  void v36[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:10.0];
  *(void *)&_LayoutConstants___constants_18 = v3;
  [v2 scaledValue:0 withOverride:9.0 forSizeClass:7.0];
  *((void *)&_LayoutConstants___constants_18 + 1) = v4;
  v35[0] = &unk_1F16E4878;
  v35[1] = &unk_1F16E4890;
  v36[0] = &unk_1F16E8620;
  v36[1] = &unk_1F16E8630;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  [v2 scaledValue:v5 withOverrides:6.0];
  qword_1E9FAAA30 = v6;

  v33[0] = &unk_1F16E4878;
  v33[1] = &unk_1F16E4890;
  v34[0] = &unk_1F16E8640;
  v34[1] = &unk_1F16E8640;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  [v2 scaledValue:v7 withOverrides:14.0];
  *(void *)&xmmword_1E9FAAA40 = v8;

  v31[0] = &unk_1F16E4878;
  v31[1] = &unk_1F16E4890;
  v32[0] = &unk_1F16E8650;
  v32[1] = &unk_1F16E8660;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  [v2 scaledValue:v9 withOverrides:2.5];
  *((void *)&xmmword_1E9FAAA40 + 1) = v10;

  [v2 scaledValue:3 withOverride:10.0 forSizeClass:10.0];
  qword_1E9FAAA50 = v11;
  [v2 scaledValue:3 withOverride:12.0 forSizeClass:12.0];
  qword_1E9FAAA58 = v12;
  v29[0] = &unk_1F16E48A8;
  v29[1] = &unk_1F16E48C0;
  v30[0] = &unk_1F16E8670;
  v30[1] = &unk_1F16E8670;
  void v29[2] = &unk_1F16E48D8;
  void v29[3] = &unk_1F16E48F0;
  void v30[2] = &unk_1F16E8670;
  void v30[3] = &unk_1F16E8670;
  v29[4] = &unk_1F16E4908;
  v30[4] = &unk_1F16E8670;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:5];
  [v2 scaledValue:v13 withOverrides:1.0];
  *(_OWORD *)algn_1E9FAAA78 = xmmword_1BC8A2590;
  *((void *)&xmmword_1E9FAAA80 + 1) = v14;
  qword_1E9FAAA90 = 0;

  [v2 scaledValue:11.0];
  qword_1E9FAAA38 = v15;
  v27[0] = &unk_1F16E4878;
  v27[1] = &unk_1F16E4920;
  v28[0] = &unk_1F16E8670;
  v28[1] = &unk_1F16E8670;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v2 scaledValue:v16 withOverrides:5.0];
  *(void *)&xmmword_1E9FAAA60 = v17;

  v25[0] = &unk_1F16E4878;
  v25[1] = &unk_1F16E4920;
  v26[0] = &unk_1F16E8680;
  v26[1] = &unk_1F16E8680;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  [v2 scaledValue:v18 withOverrides:6.0];
  *((void *)&xmmword_1E9FAAA60 + 1) = v19;

  v23[0] = &unk_1F16E48A8;
  v23[1] = &unk_1F16E48C0;
  v24[0] = &unk_1F16E8670;
  v24[1] = &unk_1F16E8690;
  void v23[2] = &unk_1F16E48D8;
  void v23[3] = &unk_1F16E48F0;
  void v24[2] = &unk_1F16E86A0;
  void v24[3] = &unk_1F16E8690;
  v23[4] = &unk_1F16E4908;
  v24[4] = &unk_1F16E86A0;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
  [v2 constantValue:v20 withOverrides:0.0];
  qword_1E9FAAA70 = v21;

  [v2 scaledValue:3 withOverride:13.0 forSizeClass:14.0];
  qword_1E9FAAA98 = v22;
}

void ___LayoutConstants_block_invoke_68(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  id v18 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v18 scaledValue:18.0];
  *(void *)&_LayoutConstants___constantsGraphicCircular_9 = v4;
  [v18 scaledValue:15.0];
  *((void *)&_LayoutConstants___constantsGraphicCircular_9 + 1) = v5;
  [v18 scaledValue:29.0];
  qword_1E9FAADD0 = v6;
  [v18 scaledValue:3 withOverride:26.0 forSizeClass:29.0];
  qword_1E9FAADD8 = v7;
  [v18 scaledValue:9.0];
  *(void *)&xmmword_1E9FAADE0 = v8;
  [v18 scaledValue:8.0];
  *((void *)&xmmword_1E9FAADE0 + 1) = v9;
  [v18 scaledValue:3 withOverride:37.5 forSizeClass:42.0];
  qword_1E9FAADF0 = v10;
  [v18 scaledValue:3 withOverride:37.0 forSizeClass:41.5];
  qword_1E9FAADF8 = v11;
  [v18 scaledValue:3 withOverride:14.0 forSizeClass:17.0];
  *(void *)&xmmword_1E9FAAE00 = v12;
  [v18 scaledValue:8.0];
  *((void *)&xmmword_1E9FAAE00 + 1) = v13;
  [v18 scaledValue:3 withOverride:13.5 forSizeClass:14.5];
  *(double *)&qword_1E9FAAE10 = v14 * 0.5;
  [v18 scaledValue:4.0];
  qword_1E9FAAE18 = v15;
  qword_1E9FAAE20 = 0x3FF0C152382D7365;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v17 = v16;

  _LayoutConstants___constantsGraphicExtraLarge_9 = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicCircular_9, v17);
  unk_1E9FAAE40 = vmulq_n_f64(*(float64x2_t *)&qword_1E9FAADD0, v17);
  xmmword_1E9FAAE50 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1E9FAADE0, v17);
  unk_1E9FAAE60 = vmulq_n_f64(*(float64x2_t *)&qword_1E9FAADF0, v17);
  qword_1E9FAAE90 = qword_1E9FAAE20;
  xmmword_1E9FAAE70 = (__int128)vmulq_n_f64((float64x2_t)xmmword_1E9FAAE00, v17);
  unk_1E9FAAE80 = vmulq_n_f64(*(float64x2_t *)&qword_1E9FAAE10, v17);
}

void ___LayoutConstants_block_invoke_69(uint64_t a1, uint64_t a2)
{
  void v12[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:19.5];
  *(void *)&_LayoutConstants___constants_19 = v3;
  [v2 scaledValue:38.0];
  *((void *)&_LayoutConstants___constants_19 + 1) = v4;
  v11[0] = &unk_1F16E5340;
  v11[1] = &unk_1F16E5358;
  v12[0] = &unk_1F16E86C0;
  v12[1] = &unk_1F16E86D0;
  void v11[2] = &unk_1F16E5370;
  void v11[3] = &unk_1F16E5388;
  v12[2] = &unk_1F16E86D0;
  void v12[3] = &unk_1F16E86E0;
  v11[4] = &unk_1F16E53A0;
  v12[4] = &unk_1F16E86F0;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];
  [v2 scaledValue:v5 withOverrides:40.0];
  qword_1E9FAAED8 = v6;

  qword_1E9FAAEE0 = *MEMORY[0x1E4FB09D8];
  v9[0] = &unk_1F16E53B8;
  v9[1] = &unk_1F16E5340;
  v10[0] = &unk_1F16E8700;
  v10[1] = &unk_1F16E8710;
  void v9[2] = &unk_1F16E5358;
  void v9[3] = &unk_1F16E5370;
  void v10[2] = &unk_1F16E8720;
  void v10[3] = &unk_1F16E8720;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  [v2 scaledValue:v7 withOverrides:-0.5];
  qword_1E9FAAEE8 = v8;
}

@end