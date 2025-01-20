void sub_100004E20(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  NSObject *v3;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    v3 = _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100028A50();
    }

    objc_end_catch();
    JUMPOUT(0x100004DCCLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_100005600(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100005620(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id _NTKKaleidoscopeLoggingObjectForDomain(uint64_t a1, uint64_t a2)
{
  v3 = (dispatch_once_t *)((char *)&unk_10003CB68 + 8 * a1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000056F8;
  v6[3] = &unk_100035090;
  v6[4] = a1;
  v6[5] = a2;
  if (*v3 != -1) {
    dispatch_once(v3, v6);
  }
  uint64_t v4 = (void *)qword_10003CB60[a1];
  return v4;
}

void sub_1000056F8(uint64_t a1)
{
  v2 = +[NSString stringWithCString:*(void *)(a1 + 40) encoding:4];
  v3 = [v2 substringFromIndex:objc_msgSend(@"NTKKaleidoscopeLoggingDomain", "length")];

  id v7 = v3;
  os_log_t v4 = os_log_create("com.apple.NanoTimeKit.Kaleidoscope", (const char *)[v7 cStringUsingEncoding:4]);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = (void *)qword_10003CB60[v5];
  qword_10003CB60[v5] = v4;
}

void sub_100006E84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000782C(id a1)
{
  qword_10003CB78 = +[NSBundle bundleForClass:objc_opt_class()];
  _objc_release_x1();
}

BOOL _NTKImageWriteToFile(CGImage *a1, NSString *a2)
{
  v3 = +[NSURL fileURLWithPath:a2];
  os_log_t v4 = [UTTypePNG identifier];
  uint64_t v5 = CGImageDestinationCreateWithURL((CFURLRef)v3, v4, 1uLL, 0);

  if (!v5) {
    return 0;
  }
  CGImageDestinationAddImage(v5, a1, 0);
  BOOL v6 = CGImageDestinationFinalize(v5);
  CFRelease(v5);
  return v6;
}

void sub_10000792C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _NTKRawWriteToFile(const void **a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  v8 = CGDataProviderCreateWithData(0, *a1, 4 * a2 * a3, 0);
  uint64_t v9 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
  v10 = CGImageCreate(a2, a3, 8uLL, 0x20uLL, 4 * a2, v9, 0, v8, 0, 0, kCGRenderingIntentDefault);
  _NTKImageWriteToFile(v10, v7);
  CGImageRelease(v10);
  CGDataProviderRelease(v8);
  CGColorSpaceRelease(v9);

  return 1;
}

void sub_100007A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NTKPhotoAnalysis *NTKAnalyzePhoto(void *a1, void *a2, char a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8, double a9)
{
  id v17 = a1;
  id v18 = a2;
  v19 = +[NTKPhotoAnalysis defaultAnalysis];
  if (!v17) {
    goto LABEL_57;
  }
  v148.origin.unsigned int x = a4;
  v148.origin.unsigned int y = a5;
  v148.size.size_t width = a6;
  v148.size.height = a7;
  if (CGRectGetWidth(v148) <= 1.0) {
    goto LABEL_57;
  }
  v149.origin.unsigned int x = a4;
  v149.origin.unsigned int y = a5;
  v149.size.size_t width = a6;
  v149.size.height = a7;
  if (CGRectGetHeight(v149) > 1.0)
  {
    unint64_t v136 = 0;
    long long v134 = 0u;
    long long v135 = 0u;
    if (v19) {
      [v19 structure];
    }
    size_t width = a8;
    unint64_t v20 = (4 * width);
    unint64_t v21 = (unint64_t)malloc_type_malloc(v20 * a9, 0xC6CFB348uLL);
    bzero((void *)v21, v20 * a9);
    v22 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
    c = CGBitmapContextCreate((void *)v21, width, a9, 8uLL, v20, v22, 1u);
    v107 = v18;
    v108 = (char *)v21;
    v103 = v22;
    v104 = v19;
    char v101 = a3;
    id v105 = v17;
    v23 = (CGImage *)[v17 CGImage];
    v150.origin.unsigned int x = a4;
    v150.origin.unsigned int y = a5;
    v150.size.size_t width = a6;
    v150.size.height = a7;
    v24 = CGImageCreateWithImageInRect(v23, v150);
    v151.size.size_t width = (double)width;
    v151.size.height = (double)a9;
    v151.origin.unsigned int x = 0.0;
    v151.origin.unsigned int y = 0.0;
    CGContextDrawImage(c, v151, v24);
    image = v24;
    memset(v146, 0, sizeof(v146));
    memset(v145, 0, sizeof(v145));
    int32x2_t v140 = vsub_s32((int32x2_t)&_mh_execute_header, vdup_n_s32(width));
    float32x4_t v25 = (float32x4_t)0x1FFFFFFFFuLL;
    uint64_t v141 = 0x1FFFFFFFFLL;
    unsigned int v143 = a8;
    int v144 = width + 1;
    uint64_t v26 = a9 - 1;
    float v27 = 0.0;
    float v28 = 0.0;
    int v139 = ~width;
    int v142 = width - 1;
    if (v26 >= 2)
    {
      unint64_t v29 = v21 + 4;
      uint64_t v30 = 1;
      LODWORD(v21) = a8;
      do
      {
        if ((width - 1) >= 2)
        {
          v31 = (unsigned int *)(v29 + 4 * v21);
          int v32 = width - 2;
          do
          {
            unsigned int v33 = *v31++;
            unint64_t v20 = v20 & 0xFFFFFFFF00000000 | v33;
            v25.f32[0] = sub_1000084FC(v20, v25);
            float v27 = v27 + v34;
            float v28 = v28 + v35;
            unsigned int v36 = (int)(float)((float)(v25.f32[0] * 128.0) + 0.5) & 0x7F;
            v25.f32[0] = *((float *)v146 + v36) + v35;
            *((_DWORD *)v146 + v36) = v25.i32[0];
            --v32;
          }
          while (v32);
        }
        ++v30;
        unint64_t v21 = (v21 + width);
      }
      while (v30 != v26);
    }
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v18 = v107;
    id obj = v107;
    id v37 = [obj countByEnumeratingWithState:&v130 objects:v138 count:16];
    v38 = v108;
    if (v37)
    {
      int v39 = 0;
      uint64_t v110 = *(void *)v131;
      double v112 = a9 + -1.0;
      double v113 = a8 + -1.0;
      float v40 = 0.0;
      float v41 = 0.0;
      float v42 = 0.0;
      do
      {
        uint64_t v43 = 0;
        id v111 = v37;
        do
        {
          if (*(void *)v131 != v110) {
            objc_enumerationMutation(obj);
          }
          [*(id *)(*((void *)&v130 + 1) + 8 * v43) rectValue];
          v156.origin.unsigned int x = v44;
          v156.origin.unsigned int y = v45;
          v156.size.size_t width = v46;
          v156.size.height = v47;
          v152.origin.unsigned int x = 1.0;
          v152.origin.unsigned int y = 1.0;
          v152.size.height = a9 + -1.0;
          v152.size.size_t width = a8 + -1.0;
          CGRect v153 = CGRectIntersection(v152, v156);
          uint64_t v114 = v43;
          unsigned int y = v153.origin.y;
          unsigned int v49 = v153.size.height - 1;
          unsigned int v120 = v49 + v153.origin.y;
          if (!__CFADD__(v49, v153.origin.y))
          {
            unsigned int x = v153.origin.x;
            unsigned int v51 = v153.size.width + v153.origin.x - 1;
            unsigned int v118 = v153.origin.x;
            do
            {
              unsigned int v122 = y;
              if (v51 >= x)
              {
                v52 = &v108[4 * y * width + 4];
                do
                {
                  unint64_t v21 = v21 & 0xFFFFFFFF00000000 | *(unsigned int *)v52;
                  *(float *)&v153.origin.unsigned int x = sub_1000084FC(v21, (float32x4_t)v153.origin);
                  uint64_t v55 = 0;
                  float32x2_t v56 = 0;
                  do
                  {
                    unsigned int v57 = *(_DWORD *)&v52[4 * *(&v139 + v55)];
                    float32x2_t v56 = vmla_n_f32(v56, qword_10002BC00[v55++], (float)((float)((float)BYTE1(v57) * 0.0028047)+ (float)((float)v57 * 0.00083373))+ (float)((float)BYTE2(v57) * 0.00028314));
                  }
                  while (v55 != 8);
                  float v42 = v42 + sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v56, v56).i32[1]), v56.f32[0], v56.f32[0]));
                  float v41 = v41 + v54;
                  float v40 = v40 + v53;
                  ++v39;
                  unsigned int v58 = (int)(float)((float)(*(float *)&v153.origin.x * 128.0) + 0.5) & 0x7F;
                  *(float *)&v153.origin.unsigned int x = v53 + *((float *)v145 + v58);
                  *((_DWORD *)v145 + v58) = LODWORD(v153.origin.x);
                  ++x;
                  v52 += 4;
                }
                while (x <= v51);
              }
              unsigned int y = v122 + 1;
              unsigned int x = v118;
            }
            while (v122 + 1 <= v120);
          }
          uint64_t v43 = v114 + 1;
        }
        while ((id)(v114 + 1) != v111);
        id v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v138, 16, v153.origin.x);
      }
      while (v37);

      v19 = v104;
      id v17 = v105;
      id v18 = v107;
      v38 = v108;
      v59 = v103;
      if (v39 >= 1)
      {
        uint64_t v60 = 0;
        float v119 = v41 / (float)v39;
        float v61 = (float)((width - 2) * (a9 - 2));
        float v62 = 0.0;
        float v63 = v28 / v61;
        do
        {
          if (*(float *)((char *)v145 + v60) > 0.01) {
            float v62 = v62 + 1.0;
          }
          v60 += 4;
        }
        while (v60 != 512);
        uint64_t v64 = 0;
        float v116 = (float)v39;
        float v115 = v42 / (float)v39;
        float v65 = 0.0;
        float v66 = 0.0;
        float v67 = v27 / v61;
        do
        {
          if (*((float *)v146 + v64) > v66)
          {
            float v66 = *((float *)v146 + v64);
            float v65 = (float)(int)v64 * 0.0078125;
          }
          ++v64;
        }
        while (v64 != 128);
        float v68 = v40 / v116;
        if ((float)(v119 * 0.75) >= (float)((float)(v68 * 0.75) + 0.25)) {
          float v69 = (float)(v68 * 0.75) + 0.25;
        }
        else {
          float v69 = v119 * 0.75;
        }
        float v70 = v67 * 0.5;
        DWORD1(v134) = sub_1000085D4(v65, v63 * 0.75, v67 * 0.5);
        *((void *)&v134 + 1) = __PAIR64__(v72, v71);
        LODWORD(v135) = sub_1000085D4(v65, v63 * 0.9, v67 * 0.4);
        *(void *)((char *)&v135 + 4) = __PAIR64__(v74, v73);
        HIDWORD(v135) = sub_1000085D4(v65, v68, v69);
        unint64_t v136 = __PAIR64__(v76, v75);
        long long v126 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        long long v129 = 0u;
        id v121 = obj;
        id v77 = [v121 countByEnumeratingWithState:&v126 objects:v137 count:16];
        if (v77)
        {
          uint64_t v123 = *(void *)v127;
          float v78 = 0.0;
          float v79 = 0.0;
          do
          {
            for (i = 0; i != v77; i = (char *)i + 1)
            {
              if (*(void *)v127 != v123) {
                objc_enumerationMutation(v121);
              }
              [*(id *)(*((void *)&v126 + 1) + 8 * i) rectValue];
              v157.origin.unsigned int x = v81;
              v157.origin.unsigned int y = v82;
              v157.size.size_t width = v83;
              v157.size.height = v84;
              v154.origin.unsigned int x = 1.0;
              v154.origin.unsigned int y = 1.0;
              v154.size.height = v112;
              v154.size.size_t width = v113;
              CGRect v155 = CGRectIntersection(v154, v157);
              unsigned int v85 = v155.origin.y;
              unsigned int v86 = v155.size.height - 1;
              unsigned int v87 = v86 + v155.origin.y;
              if (!__CFADD__(v86, v155.origin.y))
              {
                unsigned int v88 = v155.origin.x;
                unsigned int v89 = v155.size.width + v155.origin.x - 1;
                v90 = &v108[4 * v155.origin.x];
                do
                {
                  if (v89 >= v88)
                  {
                    v91 = &v90[4 * v85 * width];
                    unsigned int v92 = v88;
                    do
                    {
                      unint64_t v21 = v21 & 0xFFFFFFFF00000000 | *(unsigned int *)v91;
                      sub_1000084FC(v21, (float32x4_t)v155.origin);
                      *(float *)&v155.origin.unsigned int x = vabds_f32(v93, v70);
                      if (*(float *)&v155.origin.x < 0.1)
                      {
                        *(float *)&v155.origin.unsigned int x = (float)((float)(0.1 - *(float *)&v155.origin.x) / 0.01)
                                                 * sqrtf((float)(0.1 - *(float *)&v155.origin.x) / 0.01);
                        float v78 = v78 + *(float *)&v155.origin.x;
                      }
                      if (v93 > 0.85)
                      {
                        *(float *)&v155.origin.unsigned int x = (float)((float)(v93 + -0.85) / 0.01)
                                                 * sqrtf((float)(v93 + -0.85) / 0.01);
                        float v79 = v79 + *(float *)&v155.origin.x;
                      }
                      ++v92;
                      v91 += 4;
                    }
                    while (v92 <= v89);
                  }
                  ++v85;
                }
                while (v85 <= v87);
              }
            }
            id v77 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v126, v137, 16, v155.origin.x);
          }
          while (v77);
        }
        else
        {
          float v78 = 0.0;
          float v79 = 0.0;
        }

        v19 = v104;
        id v17 = v105;
        id v18 = v107;
        v38 = v108;
        v59 = v103;
        if (v115 <= 0.4)
        {
          int v97 = (float)(v79 / v116) > 0.015;
          if (v119 > 0.8)
          {
            int v97 = (float)(v62 / v116) > 0.11;
            if ((float)(v78 / v116) > 0.015) {
              int v97 = 1;
            }
          }
        }
        else
        {
          int v97 = 1;
        }
        LOBYTE(v134) = v97;
        BYTE1(v134) = (v119 > 0.8) & ~(_BYTE)v97;
        if ((v101 & 1) != 0 && ((v119 > 0.8) & ~v97) != 0)
        {
          BYTE1(v134) = 0;
          *((void *)&v134 + 1) = 0x3F80000000000000;
          DWORD1(v134) = 0;
          *(float *)&unsigned int v98 = *((float *)&v136 + 1) * 0.9;
          *(float *)&unsigned int v99 = *(float *)&v136 + (1.0 - *(float *)&v136) * 0.15;
          unint64_t v136 = __PAIR64__(v98, v99);
        }
      }
    }
    else
    {

      v19 = v104;
      id v17 = v105;
      v59 = v103;
    }
    free(v38);
    CGImageRelease(image);
    CGContextRelease(c);
    CGColorSpaceRelease(v59);
    v100 = [NTKPhotoAnalysis alloc];
    v124[0] = v134;
    v124[1] = v135;
    unint64_t v125 = v136;
    v94 = [(NTKPhotoAnalysis *)v100 initWithStructure:v124];
  }
  else
  {
LABEL_57:
    v94 = v19;
  }
  v95 = v94;

  return v95;
}

void sub_100008454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  _Unwind_Resume(a1);
}

float sub_1000084FC(int a1, float32x4_t a2)
{
  a2.f32[0] = (float)a1;
  a2.f32[1] = (float)BYTE1(a1);
  a2.f32[2] = (float)BYTE2(a1);
  float32x4_t v2 = vdivq_f32(a2, (float32x4_t)vdupq_n_s32(0x437F0000u));
  if (v2.f32[0] <= v2.f32[1]) {
    float v3 = v2.f32[1];
  }
  else {
    float v3 = v2.f32[0];
  }
  if (v2.f32[0] >= v2.f32[1]) {
    float v4 = v2.f32[1];
  }
  else {
    float v4 = v2.f32[0];
  }
  if (v3 <= v2.f32[2]) {
    float v5 = v2.f32[2];
  }
  else {
    float v5 = v3;
  }
  if (v4 >= v2.f32[2]) {
    float v6 = v2.f32[2];
  }
  else {
    float v6 = v4;
  }
  float result = 0.0;
  if (v5 > v6)
  {
    float v8 = v5 - v6;
    float v9 = (float)((float)(v2.f32[0] - v2.f32[1]) / (float)(v5 - v6)) + 4.0;
    if (v2.f32[1] == v5) {
      float v9 = (float)((float)(v2.f32[2] - v2.f32[0]) / v8) + 2.0;
    }
    float v10 = (float)(v2.f32[1] - v2.f32[2]) / v8;
    float v11 = 0.0;
    if (v2.f32[1] < v2.f32[2]) {
      float v11 = 6.0;
    }
    float v12 = v11 + v10;
    if (v2.f32[0] != v5) {
      float v12 = v9;
    }
    return v12 / 6.0;
  }
  return result;
}

float sub_1000085D4(float a1, float a2, float a3)
{
  float v3 = a3;
  float v5 = a3;
  float v6 = a3;
  if (a2 >= 0.00001)
  {
    float v7 = (float)(a3 + a2) - (float)(a3 * a2);
    float v8 = a3 * (float)(a2 + 1.0);
    if (a3 < 0.5) {
      float v9 = v8;
    }
    else {
      float v9 = v7;
    }
    float v10 = -(float)(v9 - (float)(a3 * 2.0));
    float v6 = sub_10000C9FC(v10, v9, a1 + 0.33333);
    float v3 = sub_10000C9FC(-(float)(v9 - (float)(v3 * 2.0)), v9, a1);
    float v5 = sub_10000C9FC(v10, v9, a1 + -0.33333);
  }
  float v11 = 0.0;
  if (v3 >= v5)
  {
    float v12 = v5;
  }
  else
  {
    float v11 = -1.0;
    float v12 = v3;
  }
  if (v3 >= v5) {
    float v5 = v3;
  }
  if (v6 >= v5)
  {
    float v13 = v5;
  }
  else
  {
    float v11 = -0.33333 - v11;
    float v13 = v6;
  }
  if (v6 >= v5) {
    float v14 = v6;
  }
  else {
    float v14 = v5;
  }
  if (v13 >= v12) {
    float v15 = v12;
  }
  else {
    float v15 = v13;
  }
  return fabsf(v11 + (float)((float)(v13 - v12) / (float)((float)((float)(v14 - v15) * 6.0) + 0.00001)));
}

void NTKAnalyzeInterestingness(void *a1, float *a2, int a3, int a4, int a5)
{
  id v8 = a1;
  uint64_t v60 = a2;
  bzero(a2, 4 * a4 * a3);
  signed int v9 = [v8 width];
  signed int v10 = [v8 height];
  int v11 = v9 / a3;
  if (v9 / a3 <= 1) {
    int v11 = 1;
  }
  if (v11 >= 16) {
    uint64_t v12 = 16;
  }
  else {
    uint64_t v12 = v11;
  }
  LODWORD(v13) = v10 / a4;
  if (v10 / a4 <= 1) {
    LODWORD(v13) = 1;
  }
  if ((int)v13 >= 16) {
    uint64_t v13 = 16;
  }
  else {
    uint64_t v13 = v13;
  }
  uint64_t v65 = v13;
  id v53 = v8;
  uint64_t v14 = (v65 * a4);
  unsigned int v64 = v12 * a3;
  if ([v53 width] != v12 * a3
    || (float v15 = v53, [v53 height] != v14))
  {
    float v15 = [v53 scaleToWidth:v64 height:v14];
  }
  [v15 contents];
  v52 = v15;
  v16 = malloc_type_malloc((16 * v12 * v65), 0x1000040451B5BE8uLL);
  if (a4 - a5 > a5)
  {
    int v61 = a3 - a5;
    int32x2_t v17 = vsub_s32((int32x2_t)&_mh_execute_header, vdup_n_s32(v12));
    float v18 = (float)((v65 - 2) * (v12 - 2));
    uint64_t v54 = a3;
    int v58 = a5 * v12 + a5 * v12 * a3 * v65;
    int v55 = a3 * v65 * v12;
    __asm { FMOV            V0.4S, #1.0 }
    unsigned int v66 = HIDWORD(_Q0);
    uint64_t v57 = a5;
    float32x4_t v59 = (float32x4_t)vdupq_n_s32(0x3C23D70Au);
    do
    {
      if (v61 > a5)
      {
        uint64_t v24 = a5;
        int v25 = v58;
        do
        {
          uint64_t v62 = v24;
          int v26 = 0;
          int v27 = 0;
          int v63 = v25;
          do
          {
            uint64_t v28 = v27;
            uint64_t v29 = v65;
            int v30 = v25;
            do
            {
              _CLKUIRGB2LAB();
              *(void *)&long long v32 = v31;
              *((void *)&v32 + 1) = __PAIR64__(v66, v33);
              int v27 = v28 + 1;
              v16[v28] = v32;
              ++v30;
              ++v28;
              --v29;
            }
            while (v29);
            ++v26;
            v25 += v64;
          }
          while (v26 != v12);
          int v67 = ~v12;
          int32x2_t v68 = v17;
          uint64_t v69 = 0x1FFFFFFFFLL;
          float v34 = 0.0;
          float v35 = 0.0;
          int v70 = v12 - 1;
          int v71 = v12;
          float v36 = 0.0;
          float v37 = 0.0;
          int v72 = v12 + 1;
          if (v65 >= 3)
          {
            int v38 = 1;
            uint64_t v39 = v12;
            do
            {
              if (v12 >= 3)
              {
                int v40 = 1;
                uint64_t v41 = v39;
                do
                {
                  uint64_t v42 = 0;
                  ++v41;
                  float32x2_t v43 = 0;
                  float32x2_t v44 = 0;
                  float32x2_t v45 = 0;
                  do
                  {
                    float32x2_t v46 = qword_10002BC00[v42];
                    float32x4_t v47 = vmulq_f32((float32x4_t)v16[v41 + *(&v67 + v42)], v59);
                    float32x2_t v45 = vmla_n_f32(v45, v46, v47.f32[0]);
                    float32x2_t v44 = vmla_lane_f32(v44, v46, *(float32x2_t *)v47.f32, 1);
                    float32x2_t v43 = vmla_laneq_f32(v43, v46, v47, 2);
                    ++v42;
                  }
                  while (v42 != 8);
                  float v37 = v37 + sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v45, v45).i32[1]), v45.f32[0], v45.f32[0]));
                  float v36 = v36 + sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v44, v44).i32[1]), v44.f32[0], v44.f32[0]));
                  float v35 = v35 + sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v43, v43).i32[1]), v43.f32[0], v43.f32[0]));
                  float v34 = v34 + (float)(0.01 * COERCE_FLOAT(v16[v41]));
                  ++v40;
                }
                while (v40 != v12 - 1);
              }
              v39 += v12;
            }
            while (v38++ != v65 - 2);
          }
          float v48 = v34 / v18;
          float v49 = 1.0;
          if (v48 <= 0.9)
          {
            int v50 = v63;
            uint64_t v51 = v62;
            if (v48 < 0.25) {
              float v49 = v48 * 4.0;
            }
          }
          else
          {
            float v49 = (float)(1.0 - v48) * 10.0;
            int v50 = v63;
            uint64_t v51 = v62;
          }
          v60[v51 + v57 * v54] = (float)((float)((float)(v49 * 0.2) + (float)(sqrtf(v37 / v18) * 0.2))
                                       + (float)(sqrtf(v36 / v18) * 0.3))
                               + (float)(sqrtf(v35 / v18) * 0.3);
          uint64_t v24 = v51 + 1;
          int v25 = v50 + v12;
        }
        while (v61 != v24);
      }
      v58 += v55;
      ++v57;
    }
    while (a4 - a5 != v57);
  }
  free(v16);
}

void sub_100008BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, id a11, uint64_t a12)
{
  _Unwind_Resume(a1);
}

id NTKGeneratePathFromInterestingness()
{
  uint64_t v0 = __chkstk_darwin();
  int v4 = v3;
  size_t v5 = v2 * (uint64_t)v1;
  int v396 = v1;
  int v366 = v2;
  uint64_t v376 = v0;
  uint64_t v387 = v5;
  if ((int)v5 < 1)
  {
    float v6 = 0;
    float v7 = 0;
  }
  else
  {
    float v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
    float v7 = (BOOL *)malloc_type_malloc(v5, 0x100004077774924uLL);
    int v1 = v396;
    int v2 = v366;
    uint64_t v0 = v376;
  }
  int v8 = v2 - v4;
  if (v2 - v4 > v4)
  {
    int v14 = v1 - v4;
    uint64_t v15 = v4;
    v16 = (float *)(v0 + 4 * (v4 + v4 * (uint64_t)v1));
    float v11 = 0.0;
    float v12 = 1.0;
    uint64_t v17 = v4;
    float v13 = 0.0;
    do
    {
      float v18 = v16;
      uint64_t v19 = v1 - 2 * v4;
      if (v14 > v4)
      {
        do
        {
          float v20 = *v18++;
          float v21 = v20;
          if (v12 >= v20) {
            float v12 = v21;
          }
          if (v11 <= v21) {
            float v11 = v21;
          }
          float v13 = v13 + v21;
          --v19;
        }
        while (v19);
      }
      ++v17;
      v16 += v1;
    }
    while (v17 != v8);
    uint64_t v414 = 0;
    unint64_t v413 = 0;
    int v415 = 0;
    float v10 = v11 - v12;
    v22 = (float *)(v0 + 4 * (v4 + v4 * (uint64_t)v1));
    do
    {
      v23 = v22;
      uint64_t v24 = v1 - 2 * v4;
      if (v14 > v4)
      {
        do
        {
          float v25 = *v23++;
          int v26 = (int)(float)((float)((float)((float)(v25 - v12) / v10) * 9.0) + 0.5);
          ++*((_WORD *)&v413 + v26);
          --v24;
        }
        while (v24);
      }
      ++v15;
      v22 += v1;
    }
    while (v15 != v8);
    int v9 = HIWORD(v415);
    int v2 = v366;
  }
  else
  {
    int v9 = 0;
    uint64_t v414 = 0;
    unint64_t v413 = 0;
    float v10 = -1.0;
    float v11 = 0.0;
    float v12 = 1.0;
    float v13 = 0.0;
    int v415 = 0;
  }
  int v27 = (v2 - 2 * v4) * (v1 - 2 * v4);
  float v28 = v13 / (float)v27;
  LODWORD(v29) = (int)(float)((float)((float)(v28 - v12) / v10) * 9.0);
  if ((int)v29 <= 4) {
    unint64_t v29 = 4;
  }
  else {
    unint64_t v29 = v29;
  }
  if (v29 <= 7)
  {
    for (unint64_t i = 8; i > v29; --i)
      v9 += *((unsigned __int16 *)&v413 + i);
  }
  float v31 = (float)(v12 + v11) * 0.5;
  if (v28 >= v31) {
    float v32 = v31;
  }
  else {
    float v32 = v28;
  }
  int v33 = v1 - v4;
  if (v8 > v4)
  {
    int v34 = 0;
    uint64_t v35 = v4;
    float v36 = (float *)(v0 + 4 * (v4 + v4 * (uint64_t)v1));
    do
    {
      float v37 = v36;
      uint64_t v38 = v1 - 2 * v4;
      if (v33 > v4)
      {
        do
        {
          float v39 = *v37++;
          if (v39 > v32) {
            ++v34;
          }
          --v38;
        }
        while (v38);
      }
      ++v35;
      v36 += v1;
    }
    while (v35 != v8);
  }
  else
  {
    int v34 = 0;
  }
  uint64_t v40 = v1;
  int v41 = v27 - 3;
  if (v9 >= v41) {
    int v9 = v41;
  }
  if (v34 < v41) {
    int v41 = v34;
  }
  if (v9 <= 3) {
    int v9 = 3;
  }
  if (v41 <= 3) {
    int v41 = 3;
  }
  unsigned int v42 = v41 + v9;
  size_t v375 = v5;
  if (v8 > v4)
  {
    uint64_t v44 = v4;
    float32x2_t v45 = (float *)(v0 + 4 * (v4 + v4 * (uint64_t)v1));
    unint64_t v43 = -1;
    float v46 = -1.0;
    do
    {
      if (v33 > v4)
      {
        float32x4_t v47 = v45;
        uint64_t v48 = v1 - 2 * v4;
        int v49 = v4;
        do
        {
          if (*v47 > v46)
          {
            unint64_t v43 = __PAIR64__(v44, v49);
            float v46 = *v47;
          }
          ++v49;
          ++v47;
          --v48;
        }
        while (v48);
      }
      ++v44;
      v45 += v1;
    }
    while (v44 != v8);
  }
  else
  {
    unint64_t v43 = -1;
  }
  int32x2_t v400 = (int32x2_t)v43;
  int v404 = v42 >> 1;
  unsigned int v50 = v43 + HIDWORD(v43) * v1;
  int v394 = v1 - v4;
  __int32 v395 = v8;
  bzero(v6, v5);
  int v52 = v394;
  int v51 = v395;
  uint64_t v53 = v376;
  uint64_t v54 = 0;
  v6[v50] = 1;
  char v55 = -1;
  LODWORD(v56) = -1.0;
  int v57 = -1;
  do
  {
    int32x2_t v58 = vadd_s32(qword_10002BC40[v54], v400);
    BOOL v59 = v58.i32[0] >= v4 && v58.i32[1] < v395;
    if (v59 && v58.i32[1] >= v4 && v58.i32[0] < v394)
    {
      __int32 v62 = v58.i32[0] + v58.i32[1] * v396;
      if (*(float *)(v376 + 4 * v62) > *(float *)&v56)
      {
        int v57 = v58.i32[0] + v58.i32[1] * v396;
        char v55 = v54;
        LODWORD(v56) = *(_DWORD *)(v376 + 4 * v62);
      }
    }
    ++v54;
  }
  while (v54 != 8);
  v382 = v7;
  char v63 = 0;
  char v64 = v55 + 7;
  int v65 = -1;
  float v66 = -1.0;
  char v67 = 1;
  int v68 = v396;
  do
  {
    int32x2_t v69 = vadd_s32(qword_10002BC40[(v64 + v63) & 7], v400);
    char v70 = v67;
    if (v69.i32[0] >= v4 && v69.i32[1] < v395 && v69.i32[1] >= v4 && v69.i32[0] < v394)
    {
      __int32 v74 = v69.i32[0] + v69.i32[1] * v396;
      if (*(float *)(v376 + 4 * v74) > v66)
      {
        int v65 = v69.i32[0] + v69.i32[1] * v396;
        float v66 = *(float *)(v376 + 4 * v74);
      }
    }
    char v67 = 0;
    char v63 = 2;
  }
  while ((v70 & 1) != 0);
  int v75 = 0;
  int v76 = 0;
  ptr = 0;
  uint64_t v77 = 0;
  v6[v57] = 1;
  v6[v65] = 1;
  unint64_t v413 = __PAIR64__(v57, v50);
  LODWORD(v414) = v65;
  v399 = v6;
  do
  {
    uint64_t v78 = 0;
    __int32 v79 = *((_DWORD *)&v413 + v77);
    int v80 = v79 / v68;
    int v81 = v79 % v68;
    do
    {
      int v82 = *(void *)&qword_10002BC40[v78] + v81;
      int v83 = HIDWORD(*(void *)&qword_10002BC40[v78]) + v80;
      if (v82 >= v4 && v83 >= v4 && v82 < v52 && v83 < v51)
      {
        int v87 = v82 + v83 * v68;
        if (!v6[v87])
        {
          uint64_t v88 = v87;
          if (*(float *)(v53 + 4 * v87) <= v32)
          {
            char v90 = 3;
          }
          else
          {
            if (v76 >= v75)
            {
              int v75 = 2 * v75 + 2;
              unsigned int v89 = (unsigned __int16 *)malloc_type_realloc(ptr, 2 * v75, 0x1000040BDFB0063uLL);
              int v51 = v395;
              int v68 = v396;
              uint64_t v53 = v376;
              int v52 = v394;
            }
            else
            {
              unsigned int v89 = ptr;
            }
            ptr = v89;
            v89[v76++] = v88;
            char v90 = 2;
          }
          v399[v88] = v90;
          float v6 = v399;
        }
      }
      ++v78;
    }
    while (v78 != 8);
    ++v77;
  }
  while (v77 != 3);
  uint64_t v91 = v4;
  uint64_t v92 = v51;
  uint64_t v93 = v52;
  v388 = &v6[v4 + (int)v40 * (uint64_t)v4];
  uint64_t v390 = v40 - 2 * v4;
  int v94 = 3;
  v95 = v382;
  uint64_t v374 = v40;
  uint64_t v401 = v51;
  while (1)
  {
    int v96 = v404 - v94;
    if (v96 >= 1)
    {
      int v97 = 0;
      do
      {
        if (v76 < 1) {
          break;
        }
        int v98 = *ptr;
        int v99 = 0;
        if (v76 != 1)
        {
          float v100 = *(float *)(v53 + 4 * *ptr);
          for (uint64_t j = 1; j != v76; ++j)
          {
            uint64_t v102 = ptr[j];
            if (*(float *)(v53 + 4 * v102) > v100)
            {
              int v99 = j;
              int v98 = ptr[j];
              float v100 = *(float *)(v53 + 4 * v102);
            }
          }
        }
        if (v76 - 1 != v99)
        {
          memmove(&ptr[v99], &ptr[v99 + 1], 2 * (v76 + ~v99));
          uint64_t v92 = v401;
          int v52 = v394;
          int v51 = v395;
          uint64_t v53 = v376;
          int v68 = v396;
          int v99 = v76 - 1;
        }
        uint64_t v103 = 0;
        v6[v98] = 1;
        int v104 = v98 / v68;
        int v105 = v98 % v68;
        int v76 = v99;
        do
        {
          int v106 = *(void *)&qword_10002BC40[v103] + v105;
          int v107 = HIDWORD(*(void *)&qword_10002BC40[v103]) + v104;
          if (v106 >= v4 && v107 >= v4 && v106 < v52 && v107 < v51)
          {
            int v111 = v106 + v107 * v68;
            if (!v399[v111])
            {
              uint64_t v112 = v111;
              if (*(float *)(v53 + 4 * v111) <= v32)
              {
                char v114 = 3;
              }
              else
              {
                if (v76 >= v75)
                {
                  int v75 = 2 * v75 + 2;
                  double v113 = (unsigned __int16 *)malloc_type_realloc(ptr, 2 * v75, 0x1000040BDFB0063uLL);
                  int v51 = v395;
                  int v68 = v396;
                  uint64_t v53 = v376;
                  int v52 = v394;
                  uint64_t v92 = v401;
                }
                else
                {
                  double v113 = ptr;
                }
                ptr = v113;
                v113[v76++] = v112;
                char v114 = 2;
              }
              v399[v112] = v114;
              v95 = v382;
            }
          }
          ++v103;
        }
        while (v103 != 8);
        ++v97;
        uint64_t v91 = v4;
        float v6 = v399;
        uint64_t v40 = v374;
      }
      while (v97 != v96);
    }
    int v94 = 0;
    if (v51 > v4)
    {
      float v115 = (unsigned __int8 *)v388;
      uint64_t v116 = v91;
      do
      {
        v117 = v115;
        uint64_t v118 = v390;
        if (v52 > v4)
        {
          do
          {
            int v119 = *v117++;
            if (v119 == 1) {
              ++v94;
            }
            --v118;
          }
          while (v118);
        }
        ++v116;
        v115 += v40;
      }
      while (v116 != v92);
    }
    if (v51 <= v4 || v94 >= v404) {
      break;
    }
    uint64_t v120 = 0xFFFFFFFFLL;
    float v121 = -1.0;
    uint64_t v122 = v91;
    int v123 = -1;
    do
    {
      if (v52 > v4)
      {
        uint64_t v124 = v122 * v40;
        uint64_t v125 = v91;
        float v126 = v121;
        uint64_t v127 = v120;
        do
        {
          uint64_t v120 = v125 + v124;
          if (v6[v125 + v124] == 3 && (float v121 = *(float *)(v53 + 4 * v120), v121 > v126))
          {
            uint64_t v128 = 0;
            while (1)
            {
              int v129 = *(void *)&qword_10002BC40[v128] + v125;
              int v130 = HIDWORD(*(void *)&qword_10002BC40[v128]) + v122;
              BOOL v131 = v129 >= v52 || v129 < v4;
              BOOL v132 = v131 || v130 < v4;
              if (!v132 && v130 < v51)
              {
                int v134 = v129 + v130 * v68;
                if (!v6[v134] && *(float *)(v53 + 4 * v134) > v32) {
                  break;
                }
              }
              if (++v128 == 8) {
                goto LABEL_168;
              }
            }
            int v123 = v134;
          }
          else
          {
LABEL_168:
            uint64_t v120 = v127;
            float v121 = v126;
          }
          ++v125;
          float v126 = v121;
          uint64_t v127 = v120;
        }
        while (v125 != v93);
      }
      ++v122;
    }
    while (v122 != v92);
    if (v121 <= 0.0) {
      break;
    }
    v6[(int)v120] = 1;
    if (v76 >= v75)
    {
      int v75 = 2 * v75 + 2;
      long long v135 = (unsigned __int16 *)malloc_type_realloc(ptr, 2 * v75, 0x1000040BDFB0063uLL);
      int v51 = v395;
      int v68 = v396;
      uint64_t v53 = v376;
      int v52 = v394;
      uint64_t v92 = v401;
    }
    else
    {
      long long v135 = ptr;
    }
    ptr = v135;
    v135[v76++] = v123;
    v6[v123] = 2;
  }
  uint64_t v136 = v387;
  if ((int)v375 >= 1)
  {
    v137 = (unsigned __int8 *)v6;
    v138 = v95;
    do
    {
      int v139 = *v137++;
      *v138++ = v139 == 1;
      --v136;
    }
    while (v136);
  }
  if (v51 > v4)
  {
    uint64_t v140 = v91;
    do
    {
      if (v52 > v4)
      {
        uint64_t v141 = v91;
        do
        {
          if (v95[v141 + v140 * v40])
          {
            uint64_t v142 = 0;
            int v143 = 0;
            char v144 = -1;
            do
            {
              int v145 = *(void *)&qword_10002BC40[v142] + v141;
              int v146 = HIDWORD(*(void *)&qword_10002BC40[v142]) + v140;
              if (v145 < v52 && v145 >= v4 && v146 >= v4 && v146 < v51)
              {
                int v150 = v95[v145 + v146 * v68];
                v143 += v150;
                if (v150) {
                  char v144 = v142;
                }
              }
              ++v142;
            }
            while (v142 != 8);
            if (v143 == 1)
            {
              char v151 = 0;
              char v152 = v144 + 7;
              float v153 = -1.0;
              int v154 = -1;
              char v155 = 1;
              do
              {
                char v156 = v155;
                int v157 = HIDWORD(*(void *)&qword_10002BC40[(v152 + v151) & 7]);
                int v158 = *(void *)&qword_10002BC40[(v152 + v151) & 7] + v141;
                int v159 = v157 + v140;
                if (v158 < v52 && v158 >= v4 && v159 >= v4 && v159 < v51)
                {
                  int v163 = v158 + v159 * v68;
                  if (*(float *)(v53 + 4 * v163) > v153)
                  {
                    float v153 = *(float *)(v53 + 4 * v163);
                    int v154 = v163;
                  }
                }
                char v155 = 0;
                char v151 = 2;
              }
              while ((v156 & 1) != 0);
              v95[v154] = 1;
            }
          }
          ++v141;
        }
        while (v141 != v93);
      }
      ++v140;
    }
    while (v140 != v92);
  }
  if (v68 <= v366) {
    uint64_t v164 = v366;
  }
  else {
    uint64_t v164 = v68;
  }
  if ((int)v164 < 1)
  {
LABEL_233:
    *(void *)&long long v56 = -1;
    *((void *)&v56 + 1) = -1;
  }
  else
  {
    uint64_t v165 = 0;
    int v166 = v4;
    while (1)
    {
      int v167 = v165 + v4;
      if ((int)v165 + v4 < v51 - (int)v165) {
        break;
      }
LABEL_232:
      ++v165;
      ++v166;
      if (v165 == v164) {
        goto LABEL_233;
      }
    }
    v168 = (unsigned __int8 *)&v95[(v40 + 1) * v166];
    uint64_t v169 = v68 - v167;
    uint64_t v170 = v166;
    while (v167 >= (int)v169)
    {
LABEL_231:
      ++v170;
      v168 += v40;
      if (v170 >= v51 - (int)v165) {
        goto LABEL_232;
      }
    }
    v171 = v168;
    uint64_t v172 = v166;
    while (!*v171++)
    {
      if (++v172 >= v169) {
        goto LABEL_231;
      }
    }
    *(void *)&long long v56 = __PAIR64__(v170, v172);
  }
  v174 = 0;
  int v175 = v56;
  if ((v56 & 0x80000000) != 0)
  {
    id v177 = 0;
  }
  else
  {
    int v176 = DWORD1(v56);
    id v177 = 0;
    if ((DWORD1(v56) & 0x80000000) == 0)
    {
      long long v391 = v56;
      bzero(v6, v375);
      uint64_t v178 = 0;
      while (1)
      {
        int32x2_t v179 = vadd_s32(qword_10002BC40[v178], *(int32x2_t *)&v391);
        BOOL v180 = v179.i32[0] < v4 || v179.i32[1] < v4;
        BOOL v181 = !v180 && v179.i32[0] < v394;
        if (!v181 || v179.i32[1] >= v395) {
          break;
        }
        if (++v178 == 8) {
          goto LABEL_252;
        }
      }
      if (v178 != -1) {
        goto LABEL_257;
      }
LABEL_252:
      uint64_t v178 = 0;
      while (1)
      {
        int32x2_t v183 = vadd_s32(qword_10002BC40[v178], *(int32x2_t *)&v391);
        if (!v95[v183.i32[0] + v183.i32[1] * v396]) {
          break;
        }
        if (++v178 == 8)
        {
          LODWORD(v178) = -1;
          break;
        }
      }
LABEL_257:
      int v184 = 0;
      v185.i64[1] = -1;
      v185.i64[0] = __PAIR64__(v366, v396);
      while (1)
      {
        int32x2_t v186 = vadd_s32(qword_10002BC40[((_BYTE)v178 + (_BYTE)v184) & 7], *(int32x2_t *)&v391);
        *(int32x2_t *)v187.i8 = v186;
        v187.u64[1] = (unint64_t)v186;
        v188.i32[0] = vmovn_s32(vcgtq_s32(v185, v187)).u32[0];
        v188.i32[1] = vmovn_s32(vcgtq_s32(v187, v185)).i32[1];
        if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v188, 0xFuLL))) & 1) != 0
          && v95[v186.i32[0] + v186.i32[1] * v396])
        {
          break;
        }
        if (++v184 == 8) {
          goto LABEL_263;
        }
      }
      LODWORD(v178) = ((_BYTE)v178 + (_BYTE)v184) & 7;
LABEL_263:
      int v189 = v175 + v176 * v396;
      v6[v189] |= 1 << v178;
      v405 = malloc_type_realloc(0, 4uLL, 0x1000040BDFB0063uLL);
      _WORD *v405 = v189;
      *((void *)&v190 + 1) = *((void *)&v391 + 1);
      *(int32x2_t *)&long long v191 = vadd_s32(qword_10002BC40[(int)v178], *(int32x2_t *)&v391);
      uint64_t v192 = 2;
      uint64_t v193 = 1;
      int v195 = v395;
      int v194 = v396;
      int v196 = v366;
      int v197 = v394;
LABEL_264:
      while (1)
      {
        int v198 = 5;
        while (1)
        {
          unsigned __int8 v199 = (v178 + v198) & 7;
          *(int32x2_t *)&long long v190 = vadd_s32(qword_10002BC40[v199], *(int32x2_t *)&v191);
          if ((int)v190 < v194
            && (v190 & 0x80000000) == 0
            && (DWORD1(v190) & 0x80000000) == 0
            && SDWORD1(v190) < v196
            && v95[(int)v190 + DWORD1(v190) * v194])
          {
            break;
          }
          if (++v198 == 13) {
            goto LABEL_264;
          }
        }
        int v200 = v191 + DWORD1(v191) * v194;
        LODWORD(v178) = 1 << v199;
        if (((1 << v199) & v399[v200]) != 0) {
          break;
        }
        if ((int)v193 >= (int)v192)
        {
          long long v392 = v190;
          uint64_t v202 = (2 * v192 + 2);
          v201 = malloc_type_realloc(v405, 2 * (int)v202, 0x1000040BDFB0063uLL);
          int v195 = v395;
          int v194 = v396;
          int v196 = v366;
          int v197 = v394;
          uint64_t v192 = v202;
          long long v190 = v392;
        }
        else
        {
          v201 = v405;
        }
        v405 = v201;
        v201[(int)v193] = v200;
        v399[v200] |= v178;
        uint64_t v193 = (v193 + 1);
        LOBYTE(v178) = v199;
        *(void *)&long long v191 = v190;
      }
      uint64_t v389 = v192;
      int v203 = v194 - 1;
      int v373 = v196 - 1;
      if (v195 > v4)
      {
        unint64_t v372 = 0;
        int v384 = 0;
        uint64_t v205 = v4;
        uint64_t v206 = v205 + (int)v205 * (uint64_t)(int)v40;
        v207 = &v399[v206];
        v208 = (unsigned __int8 *)&v95[v206];
        size_t v204 = v375;
        do
        {
          if (v197 > v4)
          {
            v209 = v208;
            v210 = v207;
            uint64_t v211 = v40 - 2 * v4;
            int v212 = v4;
            do
            {
              if (*v209++)
              {
                if (v203 >= v212) {
                  int v214 = v212;
                }
                else {
                  int v214 = v203;
                }
                unsigned int v215 = v372;
                unsigned int v216 = HIDWORD(v372);
                if ((int)v372 <= v212) {
                  unsigned int v217 = v212;
                }
                else {
                  unsigned int v217 = v372;
                }
                if (v373 >= (int)v205) {
                  int v218 = v205;
                }
                else {
                  int v218 = v373;
                }
                if (SHIDWORD(v372) <= (int)v205) {
                  unsigned int v219 = v205;
                }
                else {
                  unsigned int v219 = HIDWORD(v372);
                }
                if (*v210) {
                  char v220 = 0;
                }
                else {
                  char v220 = -2;
                }
                int v221 = v384;
                if (!*v210) {
                  int v221 = v384 + 1;
                }
                int v384 = v221;
                if (!*v210)
                {
                  unsigned int v216 = v219;
                  unsigned int v215 = v217;
                }
                unint64_t v372 = __PAIR64__(v216, v215);
                if (*v210) {
                  int v222 = v373;
                }
                else {
                  int v222 = v218;
                }
                int v373 = v222;
                if (!*v210) {
                  int v203 = v214;
                }
              }
              else
              {
                char v220 = -1;
              }
              *v210++ = v220;
              ++v212;
              --v211;
            }
            while (v211);
          }
          ++v205;
          v207 += v40;
          v208 += v40;
        }
        while (v205 != v401);
      }
      else
      {
        int v384 = 0;
        unint64_t v372 = 0;
        size_t v204 = v375;
      }
      int v223 = v372 - v203;
      if ((int)v372 - v203 >= HIDWORD(v372) - v373) {
        int v223 = HIDWORD(v372) - v373;
      }
      int v365 = v223;
      if (v223 > 1 && v384 >= 1)
      {
        unint64_t v367 = 0;
        uint64_t v363 = v373;
        unsigned int v224 = 1;
        size_t v225 = v389;
        v371 = (float32x2_t *)(&v413 + 2 * v204);
        float v6 = v399;
        int v364 = v203;
        while (1)
        {
          signed int v226 = HIDWORD(v372) - ((v224 - 1) >> 1);
          if ((int)(v373 + ((v224 - 1) >> 1)) <= v226) {
            break;
          }
LABEL_428:
          if ((int)++v224 < v365)
          {
            ++v367;
            int v203 = v364;
            if (v384 > 0) {
              continue;
            }
          }
          goto LABEL_432;
        }
        v368 = (unsigned __int8 *)(int)(v203 + (v367 >> 1));
        unsigned int v227 = (v224 - 1) >> 1;
        int v370 = v227 + v203;
        int v228 = v372 - v227;
        uint64_t v229 = v228;
        uint64_t v369 = v226;
        int64_t v230 = v373 + (v367 >> 1);
        unsigned int v393 = v224;
        uint64_t v377 = v228;
LABEL_317:
        if (v370 > (int)v229) {
          goto LABEL_427;
        }
        uint64_t v231 = v230 * v374;
        v232 = v368;
        uint64_t v378 = v230 * v374;
        uint64_t v379 = v230;
LABEL_319:
        if (v232[v231 + (void)v6] != 254) {
          goto LABEL_426;
        }
        v383 = &v232[v231];
        uint64_t v233 = 0;
        int v410 = 8;
        int v408 = 0;
        do
        {
          int v234 = *(void *)&qword_10002BC40[v233]
               + v232
               + (HIDWORD(*(void *)&qword_10002BC40[v233]) + v230) * v194;
          *((_DWORD *)v409 + v233) = v234;
          if (v224 > v6[v234])
          {
            uint64_t v235 = v408++;
            *((_DWORD *)&v406 + v235) = v234;
          }
          ++v233;
        }
        while (v233 != 8);
        int v236 = v408;
        __src = v232;
        if (v408 != 1) {
          goto LABEL_391;
        }
        int v402 = (int)v406;
        if ((int)v193 < 1)
        {
          int v238 = -1;
          LODWORD(v237) = -1;
        }
        else
        {
          uint64_t v237 = 0;
          while (v406 != (unsigned __int16)v405[v237])
          {
            if (v193 == ++v237)
            {
              int v238 = -1;
              LODWORD(v237) = -1;
              goto LABEL_332;
            }
          }
          int v238 = (unsigned __int16)v405[((int)v237 + 1) % (int)v193];
        }
LABEL_332:
        if ((int)v204 > 4096)
        {
          LODWORD(v231) = 0;
          v95 = v382;
          goto LABEL_390;
        }
        int v418 = v204;
        if (v204)
        {
          v239 = (float32x2_t *)&v413;
          do
          {
            float32x2_t *v239 = (float32x2_t)0x7FFFFFFFFFFFFFFFLL;
            v239[1].i32[0] = 0x7FFFFFFF;
            v239[1].i8[4] = 0;
            v239 += 2;
          }
          while (v239 != v371);
          char v240 = *((unsigned char *)&v414 + 16 * v402 + 4) | 1;
        }
        else
        {
          char v240 = -1;
        }
        v241.i32[0] = v402 % v194;
        v241.i32[1] = v402 / v194;
        v242.i32[0] = v238 % v194;
        v242.i32[1] = v238 / v194;
        int32x2_t v385 = v242;
        int32x2_t v243 = vsub_s32(v241, v242);
        int32x2_t v244 = vmul_s32(v243, v243);
        v245 = (float32x2_t *)(&v413 + 2 * v402);
        v245[1].i32[0] = vadd_s32(v244, vdup_lane_s32(v244, 1)).u32[0];
        ++v245;
        v245[-1].i32[1] = 0;
        v380 = v245;
        v245->i8[4] = v240;
        unsigned int v246 = 1;
        int v412 = 1;
        LODWORD(v411[0]) = v402;
        uint64_t v247 = (int)v237 + 1;
        int v386 = ~v237;
        while (1)
        {
          __int32 v248 = (__int32)v411[0];
          if (v246 < 2)
          {
            int v249 = 0;
          }
          else
          {
            int v249 = 0;
            int v250 = *((_DWORD *)&v413 + 4 * SLODWORD(v411[0]) + 2);
            for (uint64_t k = 1; k != v246; ++k)
            {
              if (*((_DWORD *)&v413 + 4 * *((int *)v411 + k) + 2) < v250)
              {
                int v250 = *((_DWORD *)&v413 + 4 * *((int *)v411 + k) + 2);
                int v249 = k;
              }
            }
            __int32 v248 = *((_DWORD *)v411 + v249);
          }
          if (v248 != v238) {
            break;
          }
          if (v238 < 1) {
            goto LABEL_388;
          }
          int v252 = -1;
          LODWORD(v231) = -2;
          unsigned int v253 = v238;
          do
          {
            v254 = (float32x2_t *)(&v413 + 2 * v253);
            v254[1].i32[0] = v252;
            int v252 = v253;
            unsigned int v253 = v254->i32[0];
            LODWORD(v231) = v231 + 1;
          }
          while (v254->i32[0] > 0);
          if ((v231 + 1) >= 3)
          {
            uint64_t v275 = v193;
            __int32 v276 = v380->i32[0];
            if (v380->i32[0] == v238)
            {
              uint64_t v193 = v275;
            }
            else
            {
              uint64_t v277 = (int)v275;
              do
              {
                if (v277 >= (int)v225)
                {
                  size_t v278 = (2 * v225 + 2);
                  v405 = malloc_type_realloc(v405, 2 * (int)v278, 0x1000040BDFB0063uLL);
                  int v195 = v395;
                  int v194 = v396;
                  int v197 = v394;
                  size_t v225 = v278;
                  v232 = __src;
                }
                if (v247 != v277)
                {
                  size_t v279 = v225;
                  memmove(&v405[v247 + 1], &v405[v247], 2 * (v386 + (int)v277));
                  int v194 = v396;
                  v232 = __src;
                  size_t v225 = v279;
                  int v197 = v394;
                  int v195 = v395;
                }
                v405[v247] = v276;
                v399[v276] = v393;
                __int32 v276 = *((_DWORD *)&v413 + 4 * v276 + 2);
                ++v277;
              }
              while (v276 != v238);
              uint64_t v193 = v277;
              float v6 = v399;
            }
          }
          else
          {
            LODWORD(v231) = 0;
          }
LABEL_386:
          if (v248 == v238) {
            goto LABEL_389;
          }
          unsigned int v246 = v412;
          if (v412 < 1)
          {
LABEL_388:
            LODWORD(v231) = 0;
LABEL_389:
            v95 = v382;
            LODWORD(v204) = v375;
LABEL_390:
            v384 -= v231;
            unsigned int v224 = v393;
            uint64_t v229 = v377;
            uint64_t v231 = v378;
            int64_t v230 = v379;
            int v236 = 1;
LABEL_391:
            if (v236 >= 2)
            {
              int v417 = 0;
              if ((int)v193 >= 1)
              {
                uint64_t v280 = 0;
                do
                {
                  uint64_t v281 = 0;
                  int v282 = 0;
                  int v283 = 0;
                  uint64_t v284 = v280;
                  unsigned int v285 = (unsigned __int16)v405[v280++];
                  if (v280 == v193) {
                    uint64_t v286 = 0;
                  }
                  else {
                    uint64_t v286 = v284 + 1;
                  }
                  int v287 = (unsigned __int16)v405[v286];
                  do
                  {
                    int v288 = *(_DWORD *)((char *)v409 + v281);
                    v283 |= v288 == v285;
                    v282 |= v288 == v287;
                    v281 += 4;
                  }
                  while (v281 != 32);
                  if (v283 & v282)
                  {
                    *(void *)&long long v191 = __PAIR64__(v285, v284);
                    DWORD2(v191) = v287;
                    uint64_t v289 = v417++;
                    *((_OWORD *)&v413 + v289) = v191;
                  }
                }
                while (v280 != v193);
                if (v417 > 0)
                {
                  if (v417 == 1)
                  {
                    int v290 = 0;
                  }
                  else
                  {
                    int v290 = 0;
                    if (SHIDWORD(v413) / v194 == (int)v414 / v194 || SHIDWORD(v413) % v194 == (int)v414 % v194) {
                      float v292 = 0.0;
                    }
                    else {
                      float v292 = -1.0;
                    }
                    float v293 = v292 + (float)(*(float *)(v376 + 4 * SHIDWORD(v413)) + *(float *)(v376 + 4 * (int)v414));
                    v294 = &v416;
                    for (uint64_t m = 1; m != v417; ++m)
                    {
                      uint64_t v296 = *((int *)v294 - 1);
                      uint64_t v297 = *(int *)v294;
                      if ((int)v296 / v194 == (int)v297 / v194 || (int)v296 % v194 == (int)v297 % v194) {
                        float v299 = 0.0;
                      }
                      else {
                        float v299 = -1.0;
                      }
                      if ((float)(v299 + (float)(*(float *)(v376 + 4 * v296) + *(float *)(v376 + 4 * v297))) < v293)
                      {
                        int v290 = m;
                        float v293 = v299 + (float)(*(float *)(v376 + 4 * v296) + *(float *)(v376 + 4 * v297));
                      }
                      v294 += 2;
                    }
                  }
                  __int32 v300 = *((_DWORD *)&v413 + 4 * v290);
                  if ((int)v193 >= (int)v225)
                  {
                    size_t v204 = (2 * v225 + 2);
                    v301 = malloc_type_realloc(v405, 2 * (int)v204, 0x1000040BDFB0063uLL);
                    size_t v225 = v204;
                    v405 = v301;
                    int v195 = v395;
                    int v194 = v396;
                    LODWORD(v204) = v375;
                    int v197 = v394;
                    v232 = __src;
                  }
                  v302 = v383;
                  __int32 v303 = v300 + 1;
                  uint64_t v304 = v300 + 1;
                  int v305 = v193 - v303;
                  if (v305)
                  {
                    size_t v306 = v225;
                    memmove(&v405[v304 + 1], &v405[v304], 2 * v305);
                    v302 = v383;
                    int v194 = v396;
                    v232 = __src;
                    size_t v225 = v306;
                    int v197 = v394;
                    int v195 = v395;
                  }
                  uint64_t v193 = (v193 + 1);
                  v405[v304] = (_WORD)v302;
                  unsigned int v224 = v393;
                  v302[(void)v6] = v393;
                  --v384;
                  uint64_t v229 = v377;
                  uint64_t v231 = v378;
                  int64_t v230 = v379;
                }
              }
            }
LABEL_426:
            BOOL v59 = (uint64_t)v232++ < v229;
            if (!v59)
            {
LABEL_427:
              BOOL v59 = v230++ < v369;
              if (!v59) {
                goto LABEL_428;
              }
              goto LABEL_317;
            }
            goto LABEL_319;
          }
        }
        if (v246 - 1 != v249)
        {
          size_t v255 = v225;
          memmove((char *)v411 + 4 * v249, (char *)v411 + 4 * v249 + 4, 4 * (int)(v246 + ~v249));
          int v194 = v396;
          v232 = __src;
          size_t v225 = v255;
          int v197 = v394;
          int v195 = v395;
          int v249 = v412 - 1;
        }
        uint64_t v256 = 0;
        int v412 = v249;
        v258 = (float32x2_t *)(&v413 + 2 * v248);
        v258[1].i8[4] = v258[1].i8[4] & 0xFC | 2;
        v259 = (_DWORD *)v258 + 1;
        while (1)
        {
          int32x2_t v260 = qword_10002BC40[v256];
          v257.i32[1] = v248 / v194;
          v257.i32[0] = v248 % v194;
          int32x2_t v261 = vadd_s32(v260, v257);
          BOOL v262 = v261.i32[0] >= v4 && v261.i32[1] < v195;
          BOOL v263 = !v262 || v261.i32[1] < v4;
          if (!v263 && v261.i32[0] < v197)
          {
            __int32 v265 = v261.i32[0] + v261.i32[1] * v194;
            if (v248 != v402)
            {
              uint64_t v266 = v238;
              if (v265 == v238) {
                goto LABEL_372;
              }
            }
            if (v6[v265] == 254) {
              break;
            }
          }
LABEL_366:
          if (++v256 == 8) {
            goto LABEL_386;
          }
        }
        uint64_t v266 = v265;
LABEL_372:
        v267 = (float32x2_t *)(&v413 + 2 * v266);
        __int8 v268 = v267[1].i8[4];
        if ((v268 & 2) == 0)
        {
          if ((v267[1].i8[4] & 1) == 0)
          {
            uint64_t v269 = v412++;
            *((_DWORD *)v411 + v269) = v265;
            v267[1].i8[4] = v268 | 1;
          }
          int32x2_t v270 = vmul_s32(v260, v260);
          signed __int32 v271 = vadd_s32(v270, vdup_lane_s32(v270, 1)).u32[0] + *v259;
          v272 = (float32x2_t *)(&v413 + 2 * v266);
          if (v271 < v272->i32[1])
          {
            v267->i32[0] = v248;
            v272->i32[1] = v271;
            int32x2_t v273 = vsub_s32(v261, v385);
            int32x2_t v274 = vmul_s32(v273, v273);
            v272[1].i32[0] = vadd_s32(v274, vdup_lane_s32(v274, 1)).u32[0];
          }
        }
        goto LABEL_366;
      }
      float v6 = v399;
LABEL_432:
      int v307 = v193 - 1;
      if ((int)v193 < 1)
      {
        v313 = 0;
        __srca = 0;
        int v353 = v193;
        v314 = 0;
        unint64_t v413 = 0;
        LODWORD(v414) = v353;
        HIDWORD(v414) = v353;
      }
      else
      {
        uint64_t v308 = 0;
        uint64_t v309 = v193;
        int v310 = -1;
        float v311 = -1.0;
        do
        {
          if (*(float *)(v376 + 4 * (unsigned __int16)v405[v308]) > v311)
          {
            int v310 = v308;
            float v311 = *(float *)(v376 + 4 * (unsigned __int16)v405[v308]);
          }
          ++v308;
        }
        while (v193 != v308);
        __srca = (float32x2_t *)malloc_type_malloc(8 * v193, 0x100004000313F17uLL);
        signed int v312 = v193;
        HIDWORD(v414) = v193;
        v313 = (float32x2_t *)malloc_type_malloc(8 * v193, 0x100004000313F17uLL);
        unint64_t v413 = (unint64_t)v313;
        v314 = malloc_type_malloc(v193, 0x100004077774924uLL);
        uint64_t v315 = 0;
        float32x2_t v316 = vcvt_f32_s32((int32x2_t)__PAIR64__(v366, v396));
        do
        {
          uint64_t v317 = 0;
          int v318 = (unsigned __int16)v405[(v310 + (int)v315) % v312];
          int v319 = v318 / v396;
          int v320 = v318 % v396;
          v321.i32[0] = v318 % v396;
          v321.i32[1] = v318 / v396;
          __srca[v315] = vdiv_f32(vadd_f32(vcvt_f32_s32(v321), (float32x2_t)0x3F0000003F000000), v316);
          int v322 = (unsigned __int16)v405[(v307 + v310 + (int)v315) % v312];
          while (1)
          {
            v323.i32[1] = v322 / v396;
            v323.i32[0] = v322 % v396;
            int32x2_t v324 = vadd_s32(qword_10002BC40[v317], v323);
            if (v324.i32[0] + v324.i32[1] * v396 == v318) {
              break;
            }
            if (++v317 == 8)
            {
              LODWORD(v317) = -1;
              break;
            }
          }
          uint64_t v325 = 0;
          while (1)
          {
            int32x2_t v326 = vadd_s32(qword_10002BC40[v325], (int32x2_t)__PAIR64__(v319, v320));
            if (v326.i32[0] + v326.i32[1] * v396 == (unsigned __int16)v405[(v310 + (int)v315 + 1) % v312]) {
              break;
            }
            if (++v325 == 8)
            {
              LODWORD(v325) = -1;
              break;
            }
          }
          v314[v315++] = v317 == v325;
        }
        while (v315 != v309);
        memcpy(v313, __srca, 8 * v312);
        uint64_t v327 = 0;
        LODWORD(v414) = v312;
        float32x2_t v328 = (float32x2_t)vdup_n_s32(0x3F2AAAABu);
        do
        {
          uint64_t v329 = v327 + 1;
          if (!v314[v327])
          {
            uint64_t v330 = v329 == v309 ? 0 : v327 + 1;
            if (v314[v330])
            {
              if (v312 < 3)
              {
LABEL_459:
                int v332 = -1;
              }
              else
              {
                int v331 = 2;
                while (v314[((int)v327 + v331) % v312])
                {
                  if (v309 == ++v331) {
                    goto LABEL_459;
                  }
                }
                int v332 = v312 + v327 + v331;
              }
              int v333 = v312 + v327;
              int v334 = v332 - (v312 + v327);
              if (v332 >= v312 + (int)v327) {
                int v335 = v332 - (v312 + v327);
              }
              else {
                int v335 = v334 + 1;
              }
              if (v334 >= 2)
              {
                int v336 = 0;
                float32x2_t v337 = __srca[(v333 - 1) % v312];
                float32x2_t v338 = __srca[(v332 + 1) % v312];
                float32x2_t v339 = __srca[v333 % v312];
                float32x2_t v340 = __srca[v332 % v312];
                float32x2_t v341 = vmul_f32(vadd_f32(v339, v340), (float32x2_t)0x3F0000003F000000);
                float32x2_t v342 = vmla_f32(v337, v328, vsub_f32(v339, v337));
                float32x2_t v343 = vmla_f32(v338, v328, vsub_f32(v340, v338));
                float32x2_t v344 = vsub_f32(v339, v342);
                float32x2_t v345 = vsub_f32(v341, v339);
                float32x2_t v346 = vsub_f32(v340, v343);
                float32x2_t v347 = vsub_f32(v341, v340);
                int v348 = v335 >> 1;
                int v349 = v312 + v327;
                do
                {
                  float v350 = (float)v336 / (float)v348;
                  float v351 = 1.0 - sqrtf(1.0 - v350);
                  float v352 = sqrtf(v350);
                  v313[(v349 + v336) % v312] = vmla_n_f32(vmla_n_f32(v342, v344, v352), v345, v351);
                  v313[v332 % v312] = vmla_n_f32(vmla_n_f32(v343, v346, v352), v347, v351);
                  ++v336;
                  --v332;
                }
                while (v348 != v336);
              }
            }
          }
          uint64_t v327 = v329;
        }
        while (v329 != v309);
      }
      sub_10000CA7C((float32x2_t *)&v413, (uint64_t)v411);
      sub_10000CA7C((float32x2_t *)v411, (uint64_t)v409);
      sub_10000CA7C((float32x2_t *)v409, (uint64_t)&v406);
      uint64_t v354 = v407;
      id v355 = objc_alloc_init((Class)NSMutableArray);
      v356 = (char *)v406;
      if ((int)v354 >= 1)
      {
        uint64_t v357 = 0;
        uint64_t v358 = 8 * v354;
        do
        {
          int v403 = HIDWORD(*(void *)&v356[v357]);
          v359 = +[NSNumber numberWithFloat:v363];
          [v355 addObject:v359];

          HIDWORD(v360) = v403;
          LODWORD(v360) = v403;
          v361 = +[NSNumber numberWithFloat:v360];
          [v355 addObject:v361];

          v357 += 8;
        }
        while (v358 != v357);
      }
      free(v356);
      free(v409[0]);
      free(v411[0]);
      free(v314);
      free(v313);
      free(__srca);
      id v177 = v355;

      v174 = v405;
    }
  }
  free(ptr);
  free(v174);
  free(v95);
  free(v6);
  return v177;
}

void sub_10000A7AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,void *a46,uint64_t a47,uint64_t a48,void *a49,void *a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,void *a60)
{
  free(v60);
  free(a45);
  free(a29);
  free(a49);
  free(a30);
  free(a46);
  _Unwind_Resume(a1);
}

void NTKAnalyzeDominance()
{
  uint64_t v0 = (void *)__chkstk_darwin();
  unsigned int v2 = v1;
  int v4 = v3;
  int v6 = v5;
  __b = v7;
  id v8 = v0;
  signed int v9 = [v8 width];
  signed int v10 = [v8 height];
  int v11 = v9 / v6;
  if (v9 / v6 <= 1) {
    int v11 = 1;
  }
  if (v11 >= 16) {
    uint64_t v12 = 16;
  }
  else {
    uint64_t v12 = v11;
  }
  int v13 = v10 / v4;
  if (v10 / v4 <= 1) {
    int v13 = 1;
  }
  if (v13 >= 16) {
    int v14 = 16;
  }
  else {
    int v14 = v13;
  }
  id v99 = v8;
  int v15 = v12 * v6;
  if ([v99 width] != v12 * v6
    || (v16 = v99, [v99 height] != v14 * v4))
  {
    v16 = [v99 scaleToWidth:(v12 * v6) height:(v14 * v4)];
  }
  uint64_t v17 = [v16 contents];
  int v98 = v6;
  int v111 = 256;
  if (v4 * v6 >= 1) {
    memset_pattern16(__b, &unk_10002BBF0, 16 * (v4 * v6));
  }
  if ((int)(v4 - v2) > (int)v2)
  {
    signed int v105 = v6 - v2;
    int v102 = v2 * v12 + v2 * v12 * v6 * v14;
    int v100 = v6 * v14 * v12;
    uint64_t v101 = (int)v2;
    int v103 = v14;
    do
    {
      if (v105 > (int)v2)
      {
        uint64_t v18 = (int)v2;
        int v19 = v102;
        do
        {
          uint64_t v106 = v18;
          int v20 = 0;
          LODWORD(v21) = 0;
          int v107 = v19;
          do
          {
            uint64_t v21 = (int)v21;
            unsigned int v22 = v21 + 1;
            uint64_t v23 = v12;
            int v24 = v19;
            do
            {
              unsigned int v25 = v22;
              v110[v21++] = v17[v24++];
              ++v22;
              --v23;
            }
            while (v23);
            ++v20;
            v19 += v15;
          }
          while (v20 != v14);
          int v115 = 512;
          bzero(v114, 0x2000uLL);
          if ((int)v21 - 1 >= 0)
          {
            uint64_t v26 = v25;
            int v27 = (float32x4_t *)v110;
            do
            {
              float32x4_t v28 = *v27++;
              v29.i64[0] = 0x3F0000003F000000;
              v29.i64[1] = 0x3F0000003F000000;
              float32x4_t v30 = vmlaq_f32(v29, (float32x4_t)xmmword_10002BBC0, v28);
              *(uint32x2_t *)v30.f32 = vshl_u32((uint32x2_t)vcvt_s32_f32((float32x2_t)vrev64_s32(*(int32x2_t *)v30.f32)), (uint32x2_t)0x600000003);
              v114[v30.i32[0] | (int)v30.f32[2] | v30.i32[1]] = vaddq_f32(v28, (float32x4_t)v114[v30.i32[0] | (int)v30.f32[2] | v30.i32[1]]);
              --v26;
            }
            while (v26);
          }
          uint64_t v31 = 0;
          int v113 = 9;
          while (1)
          {
            uint64_t v32 = 0;
            float v33 = 1.0;
            unsigned int v34 = -1;
            uint64_t v35 = (float *)((unint64_t)v114 | 0xC);
            do
            {
              float v36 = *v35;
              v35 += 4;
              float v37 = (float)(int)v36;
              if (v33 <= v37)
              {
                float v33 = v37;
                unsigned int v34 = v32;
              }
              ++v32;
            }
            while (v32 != 512);
            if ((v34 & 0x80000000) != 0) {
              break;
            }
            int v38 = (v34 >> 6) & 7;
            int v39 = (v34 >> 3) & 7;
            int v40 = v34 & 7;
            if (v38 <= 1) {
              int v41 = 1;
            }
            else {
              int v41 = (v34 >> 6) & 7;
            }
            unsigned int v42 = v41 - 1;
            if (v39 <= 1) {
              int v43 = 1;
            }
            else {
              int v43 = v39;
            }
            if (v40 <= 1) {
              int v44 = 1;
            }
            else {
              int v44 = v40;
            }
            if (v38 >= 6) {
              int v38 = 6;
            }
            unsigned int v45 = v38 + 1;
            float32x4_t v46 = 0uLL;
            if (v42 <= v45)
            {
              unsigned int v47 = v43 - 1;
              unsigned int v48 = v44 - 1;
              if (v40 >= 6) {
                int v40 = 6;
              }
              if (v39 >= 6) {
                int v39 = 6;
              }
              unsigned int v49 = v39 + 1;
              int v50 = v44 - 3;
              do
              {
                if (v47 <= v49)
                {
                  unsigned int v51 = v47;
                  do
                  {
                    if (v48 <= v40 + 1)
                    {
                      int v52 = v50;
                      do
                      {
                        uint64_t v53 = (float32x4_t *)&v114[(v42 << 6) | (8 * v51) | (v52 + 2)];
                        float32x4_t v46 = vaddq_f32(v46, *v53);
                        v53->i64[0] = 0;
                        v53->i64[1] = 0;
                        ++v52;
                      }
                      while (v40 != v52);
                    }
                    _ZF = v51++ == v49;
                  }
                  while (!_ZF);
                }
                _ZF = v42++ == v45;
              }
              while (!_ZF);
            }
            v112[v31++] = v46;
            if (v31 == 9)
            {
              unint64_t v55 = 9;
              goto LABEL_63;
            }
          }
          if (!v31) {
            goto LABEL_76;
          }
          unint64_t v55 = v31;
LABEL_63:
          long long v56 = v112;
          unint64_t v57 = v55;
          do
          {
            float32x4_t v108 = *v56;
            float32x4_t v109 = vdivq_f32(*v56, (float32x4_t)vdupq_laneq_s32(*(int32x4_t *)v56, 3));
            _CLKUIRGB2LAB();
            _S1 = _V0.S[1];
            __asm { FMLA            S2, S1, V0.S[1] }
            v64.i32[1] = sqrtf(_S2);
            _D0 = vmulq_f32(v64, (float32x4_t)xmmword_10002BBD0).u64[0];
            _S1 = 1077936127;
            float v67 = vmlas_n_f32(0.1, 3.0, *(float *)&_D0);
            if (*(float *)&_D0 >= 0.3) {
              float v67 = 1.0;
            }
            __asm { FMLA            S4, S1, V0.S[1] }
            if (*((float *)&_D0 + 1) >= 0.3) {
              float v69 = 1.0;
            }
            else {
              float v69 = _S4;
            }
            float32x4_t v70 = v109;
            v70.i32[3] = vmuls_lane_f32(v69 * (float)(v69 * (float)(v67 * v67)), v108, 3);
            *v56++ = v70;
            --v57;
          }
          while (v57);
          if (v55 >= 2)
          {
            uint64_t v71 = 0;
            for (uint64_t i = 1; i != v55; ++i)
            {
              uint64_t v73 = v71;
              do
              {
                float32x4_t v74 = v112[v73];
                float32x4_t v75 = v112[v73 + 1];
                if ((vmovn_s32(vcgtq_f32(v75, v74)).i8[6] & 1) == 0) {
                  break;
                }
                v112[v73 + 1] = v74;
                v112[v73] = v75;
                uint64_t v76 = v73-- + 1;
              }
              while (v76 > 1);
              ++v71;
            }
          }
LABEL_76:
          _CLKUIRGB2LAB();
          _CLKUILAB2RGB();
          HIDWORD(v77) = 1.0;
          *(_OWORD *)&__b[16 * v106 + 16 * v101 * v98] = v77;
          uint64_t v18 = v106 + 1;
          int v19 = v107 + v12;
          int v14 = v103;
        }
        while (v105 != v106 + 1);
      }
      v102 += v100;
      ++v101;
    }
    while (v4 - v2 != v101);
  }
  uint64_t v78 = v2 - 2;
  if ((int)v2 >= 2)
  {
    uint64_t v79 = v2;
    unint64_t v80 = (v4 - (unint64_t)v2) * v98;
    uint64_t v81 = (uint64_t)&__b[16 * v80 - 16 + 16 * v98 + 16 * v2];
    uint64_t v82 = 16 * v98;
    uint64_t v83 = v82 - 16;
    uint64_t v84 = (uint64_t)&__b[16 * v80 - 16 + 16 * v2];
    uint64_t v85 = (uint64_t)&__b[16 * (v2 - 2) * v98 - 16 + 16 * v2];
    unint64_t v86 = v82 ^ 0xFFFFFFFFFFFFFFF0;
    uint64_t v87 = (uint64_t)&__b[16 * (v2 - 1) * v98 - 16 + 16 * v2];
    uint64_t v88 = v78 - 1;
    uint64_t v89 = v98 * v78;
    uint64_t v90 = 16 * (v89 + v2) - 32;
    int v91 = v98 - v2;
    do
    {
      uint64_t v92 = v79 - 1;
      if (v79 - 1 <= v98 - (int)v79)
      {
        uint64_t v94 = 0;
        uint64_t v93 = v79 - 2;
        do
        {
          *(_OWORD *)(v85 + 16 * v94) = *(_OWORD *)(v87 + 16 * v94);
          *(_OWORD *)(v81 + 16 * v94) = *(_OWORD *)(v84 + 16 * v94);
          ++v94;
        }
        while (v79 + v94 - 2 < v98 - (int)v79);
      }
      else
      {
        uint64_t v93 = v79 - 2;
      }
      if (v93 <= v4 - v92)
      {
        v95 = __b;
        uint64_t v96 = v88;
        do
        {
          *(_OWORD *)&v95[v90] = *(_OWORD *)&v95[v90 + 16];
          *(_OWORD *)&v95[16 * v89 + 16 + 16 * v91] = *(_OWORD *)&v95[16 * v89 + 16 * v91];
          ++v96;
          v95 += v82;
        }
        while (v96 < v4 - v92);
      }
      v81 += v83;
      v84 += v83;
      v85 += v86;
      v87 += v86;
      --v88;
      v90 += v86;
      v89 -= v98;
      ++v91;
    }
    while (v79-- > 2);
  }
}

void sub_10000AFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  _Unwind_Resume(a1);
}

id NTKPlusImage()
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10003CB90);
  id WeakRetained = objc_loadWeakRetained(&qword_10003CB98);
  if (WeakRetained)
  {
    unsigned int v1 = WeakRetained;
    unsigned int v2 = +[CLKRenderingContext sharedRenderingContext];
    id v3 = [v2 device];
    id v4 = objc_loadWeakRetained(&qword_10003CB98);
    if (v3 == v4)
    {
      int v5 = +[CLKRenderingContext sharedRenderingContext];
      int v6 = [v5 device];
      id v7 = [v6 version];
      uint64_t v8 = qword_10003CBA0;

      if (v7 == (id)v8) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  signed int v9 = +[CLKRenderingContext sharedRenderingContext];
  signed int v10 = [v9 device];
  objc_storeWeak(&qword_10003CB98, v10);

  id v11 = objc_loadWeakRetained(&qword_10003CB98);
  qword_10003CBA0 = (uint64_t)[v11 version];

  uint64_t v12 = +[CLKRenderingContext sharedRenderingContext];
  int v13 = [v12 device];
  sub_10000B224((uint64_t)v13, v13);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003CB90);
  int v14 = (void *)qword_10003CB88;
  return v14;
}

void sub_10000B1D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B224(uint64_t a1, void *a2)
{
  id v9 = a2;
  unsigned int v2 = +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:");
  [v2 setRoundingBehavior:4];
  [v2 scaledValue:55.0];
  id v3 = +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:");
  id v4 = +[UIColor whiteColor];
  int v5 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v4];

  int v6 = [v3 configurationByApplyingConfiguration:v5];
  uint64_t v7 = +[UIImage systemImageNamed:@"plus.circle.fill" withConfiguration:v6];
  uint64_t v8 = (void *)qword_10003CB88;
  qword_10003CB88 = v7;
}

void sub_10000B334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int v14 = v13;

  _Unwind_Resume(a1);
}

void sub_10000B38C()
{
}

uint64_t NTKConvertRGBtoLAB()
{
  return _CLKUIConvertRGBtoLAB();
}

uint64_t NTKConvertLABtoRGB()
{
  return _CLKUIConvertLABtoRGB();
}

void sub_10000B61C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  free(v19);
  free(a17);
  free(a18);
  free(v18);
  _Unwind_Resume(a1);
}

void sub_10000BD5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id NTKBlurImage(void *a1, double a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3 && a2 > 0.0)
  {
    id v5 = [objc_alloc((Class)CIImage) initWithImage:v3];
    if (v5)
    {
      int v6 = +[CIFilter filterWithName:@"CIAffineClamp"];
      [v6 setDefaults];
      [v6 setValue:v5 forKey:kCIInputImageKey];
      uint64_t v7 = +[CIFilter filterWithName:@"CIGaussianBlur"];
      uint64_t v8 = +[NSNumber numberWithDouble:a2];
      [v7 setValue:v8 forKey:kCIInputRadiusKey];

      id v9 = [v6 outputImage];
      [v7 setValue:v9 forKey:kCIInputImageKey];

      signed int v10 = [v7 outputImage];
      if (v10)
      {
        id v11 = +[CIContext context];
        [v5 extent];
        uint64_t v12 = (CGImage *)objc_msgSend(v11, "createCGImage:fromRect:", v10);
        if (v12)
        {
          id v13 = objc_alloc((Class)UIImage);
          [v4 scale];
          id v15 = objc_msgSend(v13, "initWithCGImage:scale:orientation:", v12, objc_msgSend(v4, "imageOrientation"), v14);
          CGImageRelease(v12);
        }
        else
        {
          id v15 = 0;
        }
      }
      else
      {
        id v15 = 0;
      }
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = v3;
  }

  return v15;
}

void sub_10000BF90(_Unwind_Exception *a1)
{
  uint64_t v8 = v7;

  _Unwind_Resume(a1);
}

void sub_10000C000()
{
}

id NTKCropImage(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  signed int v10 = v9;
  if (v9)
  {
    [v9 size];
    double v12 = v11;
    double v14 = v13;
    [v10 scale];
    double v16 = v15;
    if ((v12 * v15)) {
      BOOL v17 = (v14 * v15) == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17)
    {
      id v21 = v10;
    }
    else
    {
      id v18 = [v10 imageOrientation];
      int v19 = (CGImage *)[v10 CGImage];
      v24.size.height = a5 * v16;
      v24.size.size_t width = a4 * v16;
      v24.origin.unsigned int y = a3 * v16;
      v24.origin.unsigned int x = a2 * v16;
      int v20 = CGImageCreateWithImageInRect(v19, v24);
      id v21 = +[UIImage imageWithCGImage:v20 scale:v18 orientation:v16];
      CGImageRelease(v20);
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

void sub_10000C124(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

id NTKDefaultMonochromeColorMatrix()
{
  if (qword_10003CBA8 != -1) {
    dispatch_once(&qword_10003CBA8, &stru_100035120);
  }
  uint64_t v0 = (void *)qword_10003CBB0;
  return v0;
}

void sub_10000C1AC(id a1)
{
  v3[0] = 0;
  v3[1] = 0;
  int v4 = 1056964608;
  uint64_t v6 = 0;
  uint64_t v5 = 0;
  int v7 = 1056964608;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  int v10 = 1056964608;
  uint64_t v11 = 0;
  int v12 = 0;
  uint64_t v13 = 1065353216;
  uint64_t v1 = +[NSValue valueWithBytes:v3 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
  unsigned int v2 = (void *)qword_10003CBB0;
  qword_10003CBB0 = v1;
}

BOOL NTKIsDefaultMonochromeColorMatrix(void *a1)
{
  id v1 = a1;
  NTKDefaultMonochromeColorMatrix();
  id v2 = (id)objc_claimAutoreleasedReturnValue();

  return v2 == v1;
}

id NTKGenerateMonochromeColorMatrixFromImage(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1) {
    goto LABEL_18;
  }
  [v1 scale];
  double v4 = v3;
  [v2 size];
  size_t v6 = (v4 * v5);
  size_t v8 = (v4 * v7);
  if (!v6 || v8 == 0) {
    goto LABEL_18;
  }
  int v10 = (char *)malloc_type_calloc(1uLL, (4 * v6 * v8), 0x5C680A36uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  int v12 = CGBitmapContextCreate(v10, v6, v8, 8uLL, (4 * v6), DeviceRGB, 1u);
  uint64_t v13 = (CGImage *)[v2 CGImage];
  v45.size.size_t width = (double)v6;
  v45.size.height = (double)v8;
  v45.origin.unsigned int x = 0.0;
  v45.origin.unsigned int y = 0.0;
  CGContextDrawImage(v12, v45, v13);
  bzero(v43, 0x400uLL);
  unsigned int v16 = v6 * v8;
  if (v6 * v8)
  {
    BOOL v17 = v10;
    do
    {
      LOBYTE(v14) = *v17;
      LOBYTE(v15) = v17[1];
      *(float *)&unsigned int v18 = (float)LODWORD(v15) * 0.7152;
      float v19 = *(float *)&v18 + (float)((float)LODWORD(v14) * 0.2126);
      LOBYTE(v18) = v17[2];
      float v15 = (float)v18;
      float v14 = v19 + (float)(v15 * 0.0722);
      ++v43[v14];
      v17 += 4;
    }
    while (v17 < &v10[4 * v16]);
  }
  uint64_t v20 = 0;
  signed int v21 = 0;
  signed int v22 = v16 / 0x3E8;
  while (1)
  {
    v21 += v43[v20];
    if (v21 > v22) {
      break;
    }
    if (++v20 == 256)
    {
      LODWORD(v20) = 0;
      break;
    }
  }
  signed int v23 = 0;
  int v24 = 255;
  while (1)
  {
    v23 += v43[v24];
    if (v23 > v22) {
      break;
    }
    if (--v24 == -1)
    {
      int v24 = 255;
      break;
    }
  }
  CGContextRelease(v12);
  free(v10);
  CGColorSpaceRelease(DeviceRGB);
  if (v24 - (int)v20 > 9)
  {
    float v28 = 255.0 / (float)(v24 - v20);
    v29[0] = v28 * 0.2126;
    v29[1] = v28 * 0.7152;
    v29[2] = v28 * 0.0722;
    v29[3] = 0.0;
    float v30 = (float)((float)-(int)v20 / 255.0) * v28;
    float v31 = v28 * 0.2126;
    float v32 = v28 * 0.7152;
    float v33 = v28 * 0.0722;
    int v34 = 0;
    float v35 = v30;
    float v36 = v28 * 0.2126;
    float v37 = v28 * 0.7152;
    float v38 = v28 * 0.0722;
    int v39 = 0;
    float v40 = v30;
    long long v41 = xmmword_10002BBE0;
    int v42 = 0;
    uint64_t v25 = +[NSValue valueWithBytes:v29 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
  }
  else
  {
LABEL_18:
    uint64_t v25 = NTKDefaultMonochromeColorMatrix();
  }
  uint64_t v26 = (void *)v25;

  return v26;
}

void sub_10000C550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id NTKInterpolateColorMatrixToIdentity(void *a1, double a2)
{
  id v3 = a1;
  double v4 = v3;
  float32x4_t v5 = 0uLL;
  memset(v30, 0, sizeof(v30));
  if (v3)
  {
    [v3 CAColorMatrixValue];
    float v6 = *(float *)v30;
    float32x4_t v5 = *(float32x4_t *)((char *)v30 + 4);
    float v7 = *((float *)&v30[1] + 2);
    float v8 = *((float *)&v30[1] + 1);
    float32x4_t v9 = *(float32x4_t *)((char *)&v30[1] + 12);
    float v11 = *((float *)&v30[2] + 3);
    float v10 = *(float *)&v30[3];
    float32x4_t v12 = *(float32x4_t *)((char *)&v30[3] + 4);
    float v13 = *((float *)&v30[4] + 2);
    float v14 = *((float *)&v30[4] + 1);
    float v15 = *((float *)&v30[4] + 3);
  }
  else
  {
    float v15 = 0.0;
    float v13 = 0.0;
    float v14 = 0.0;
    float v10 = 0.0;
    float v11 = 0.0;
    float v7 = 0.0;
    float v8 = 0.0;
    float v6 = 0.0;
    float32x4_t v9 = 0uLL;
    float32x4_t v12 = 0uLL;
  }
  float v16 = a2;
  float v19 = v6 + (float)((float)(1.0 - v6) * v16);
  float32x4_t v20 = vmulq_n_f32(v5, 1.0 - v16);
  float v21 = (float)(1.0 - v16) * v8;
  float v22 = v7 + (float)((float)(1.0 - v7) * v16);
  float32x4_t v23 = vmulq_n_f32(v9, 1.0 - v16);
  float v24 = (float)(1.0 - v16) * v11;
  float v25 = v10 + (float)((float)(1.0 - v10) * v16);
  float32x4_t v26 = vmulq_n_f32(v12, 1.0 - v16);
  float v27 = (float)(1.0 - v16) * v14;
  float v28 = v13 + (float)((float)(1.0 - v13) * v16);
  float v29 = (float)(1.0 - v16) * v15;
  BOOL v17 = +[NSValue valueWithBytes:&v19 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];

  return v17;
}

void sub_10000C6C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id NTKInterpolateBetweenImages(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  float v7 = v6;
  float v8 = v6;
  if (!v5) {
    goto LABEL_12;
  }
  float v8 = v5;
  if (!v6) {
    goto LABEL_12;
  }
  [v5 size];
  double v10 = v9;
  double v12 = v11;
  [v5 scale];
  double v14 = v13;
  unsigned int v15 = (v10 * v13);
  unsigned int v16 = (v12 * v13);
  BOOL v17 = !v15 || v16 == 0;
  float v8 = v7;
  if (v17) {
    goto LABEL_12;
  }
  [v7 size];
  double v19 = v18;
  double v21 = v20;
  [v7 scale];
  unsigned int v23 = (v19 * v22);
  unsigned int v24 = (v21 * v22);
  BOOL v25 = !v23 || v24 == 0;
  float v8 = v7;
  if (v25)
  {
LABEL_12:
    id v26 = v8;
  }
  else
  {
    if (v15 <= v23) {
      size_t v28 = v23;
    }
    else {
      size_t v28 = v15;
    }
    if (v16 <= v24) {
      size_t v29 = v24;
    }
    else {
      size_t v29 = v16;
    }
    space = CGColorSpaceCreateDeviceRGB();
    int v44 = (char *)malloc_type_calloc(1uLL, (4 * v28 * v29), 0x26161728uLL);
    c = CGBitmapContextCreate(v44, v28, v29, 8uLL, (4 * v28), space, 1u);
    CGRect v45 = malloc_type_calloc(1uLL, (4 * v28 * v29), 0xB9EA0708uLL);
    float v30 = CGBitmapContextCreate(v45, v28, v29, 8uLL, (4 * v28), space, 1u);
    id v31 = v5;
    float v32 = (CGImage *)[v31 CGImage];
    v49.size.height = (double)v16;
    v49.size.size_t width = (double)v15;
    v49.origin.unsigned int x = 0.0;
    v49.origin.unsigned int y = 0.0;
    CGContextDrawImage(c, v49, v32);
    float v33 = (CGImage *)[v7 CGImage];
    v50.size.height = (double)v24;
    v50.size.size_t width = (double)v23;
    v50.origin.unsigned int x = 0.0;
    v50.origin.unsigned int y = 0.0;
    CGContextDrawImage(v30, v50, v33);
    if (v28 * v29)
    {
      float v37 = a3;
      *(float *)v34.i32 = 1.0 - v37;
      float32x4_t v38 = (float32x4_t)vdupq_lane_s32(v34, 0);
      int v39 = (__int32 *)v44;
      float v40 = (__int32 *)v45;
      do
      {
        v35.i32[0] = *v39;
        __int32 v41 = *v40++;
        v36.i32[0] = v41;
        float32x4_t v36 = vmlaq_f32(vmulq_n_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v36.f32))), v37), v38, vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v35))));
        int16x8_t v42 = (int16x8_t)vcvtq_s32_f32(v36);
        *(int16x4_t *)v42.i8 = vmovn_s32((int32x4_t)v42);
        uint8x8_t v35 = (uint8x8_t)vmovn_s16(v42);
        *v39++ = v35.i32[0];
      }
      while (v39 < (__int32 *)&v44[4 * (v28 * v29)]);
    }
    Image = CGBitmapContextCreateImage(c);
    CGContextRelease(c);
    CGContextRelease(v30);
    +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", Image, [v31 imageOrientation], v14);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    CGImageRelease(Image);
    free(v44);
    free(v45);
    CGColorSpaceRelease(space);
  }

  return v26;
}

void sub_10000C9AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float sub_10000C9FC(float a1, float a2, float a3)
{
  if (a3 < 0.0) {
    a3 = a3 + 1.0;
  }
  if (a3 > 1.0) {
    a3 = a3 + -1.0;
  }
  if (a3 < 0.16667)
  {
    float v3 = (float)(a2 - a1) * 6.0;
    return a1 + (float)(v3 * a3);
  }
  if (a3 >= 0.5)
  {
    if (a3 < 0.66667)
    {
      float v3 = (float)(a2 - a1) * (float)(0.66667 - a3);
      a3 = 6.0;
      return a1 + (float)(v3 * a3);
    }
    return a1;
  }
  return a2;
}

float32x2_t *sub_10000CA7C@<X0>(float32x2_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = result[1].u32[0];
  int v4 = 2 * v3;
  *(_DWORD *)(a2 + 8) = 2 * v3;
  *(_DWORD *)(a2 + 12) = 2 * v3;
  if ((int)v3 <= 0)
  {
    *(void *)a2 = 0;
  }
  else
  {
    id v5 = result;
    float result = (float32x2_t *)malloc_type_malloc(8 * (2 * v3), 0x100004000313F17uLL);
    uint64_t v6 = 0;
    *(void *)a2 = result;
    float v7 = result + 1;
    do
    {
      float32x2_t v8 = *(float32x2_t *)(*(void *)v5 + 8 * v6);
      if (v3 - 1 == v6) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v6 + 1;
      }
      float32x2_t v10 = vmul_f32(vadd_f32(v8, *(float32x2_t *)(*(void *)v5 + 8 * v9)), (float32x2_t)0x3F0000003F000000);
      v7[-1] = v8;
      *float v7 = v10;
      v7 += 2;
      ++v6;
    }
    while (v3 != v6);
    uint64_t v11 = 0;
    __asm { FMOV            V1.2S, #0.25 }
    do
    {
      result[v11] = vmul_f32(vadd_f32(vmla_f32(result[((int)v11 + 1) % v4], (float32x2_t)0x4000000040000000, result[v11]), result[(v4 - 1 + (int)v11) % v4]), _D1);
      v11 += 2;
    }
    while (v11 < v4);
  }
  return result;
}

ValueMetadata *type metadata accessor for KaleidoscopeAsset()
{
  return &type metadata for KaleidoscopeAsset;
}

void type metadata accessor for UIUserInterfaceStyle(uint64_t a1)
{
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
}

void sub_10000CBB4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000CBFC()
{
  if (qword_10003BD90 != -1) {
    uint64_t result = swift_once();
  }
  qword_10003D640 = *(void *)(qword_10003D688 + 16);
  return result;
}

uint64_t sub_10000CC54()
{
  if (qword_10003BD50 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_10003D640 < 0)
  {
    __break(1u);
  }
  else
  {
    qword_10003D648 = 0;
    unk_10003D650 = qword_10003D640;
  }
  return result;
}

void sub_10000CCB4()
{
  qword_10003D658 = (uint64_t)&off_1000352A0;
}

void sub_10000CCC8()
{
  qword_10003D660 = (uint64_t)&_swiftEmptyArrayStorage;
}

void sub_10000CCDC()
{
  qword_10003D668 = (uint64_t)&_swiftEmptyArrayStorage;
}

void sub_10000CCF0()
{
  qword_10003D670 = (uint64_t)&_swiftEmptyArrayStorage;
}

void sub_10000CD04()
{
  qword_10003D678 = (uint64_t)&_swiftEmptyArrayStorage;
}

void sub_10000CD18()
{
  qword_10003D680 = (uint64_t)&off_100035250;
}

uint64_t sub_10000CD2C()
{
  if (qword_10003BD88 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10003D680;
  if (qword_10003BD60 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t result = sub_10000E3C8(v1);
  qword_10003D688 = v0;
  return result;
}

uint64_t sub_10000CDF0(uint64_t result)
{
  unint64_t v1 = result;
  if (qword_10003BD90 == -1)
  {
    if ((result & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t result = swift_once();
  if ((v1 & 0x8000000000000000) != 0) {
    goto LABEL_18;
  }
LABEL_3:
  if (*(void *)(qword_10003D688 + 16) <= v1)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  uint64_t v2 = *(void *)(qword_10003D688 + 8 * v1 + 32);
  if ((unint64_t)(v2 - 9) > 0xFFFFFFFFFFFFFFF7) {
    return 0x7265776F6C46;
  }
  if ((unint64_t)(v2 - 13) > 0xFFFFFFFFFFFFFFFBLL) {
    return 0x63696870617247;
  }
  if ((unint64_t)(v2 - 17) > 0xFFFFFFFFFFFFFFFBLL) {
    return 0x726F7272694DLL;
  }
  if ((unint64_t)(v2 - 24) > 0xFFFFFFFFFFFFFFF8) {
    return 0x7365766157;
  }
  if ((unint64_t)(v2 - 28) > 0xFFFFFFFFFFFFFFFBLL) {
    return 0x6365737265746E49;
  }
  if ((unint64_t)(v2 - 34) >= 0xFFFFFFFFFFFFFFFALL) {
    return 0x736C6577654ALL;
  }
  return 0x6E776F6E6B6E55;
}

uint64_t sub_10000CF48(unint64_t a1)
{
  unint64_t v1 = a1;
  if (qword_10003BD90 == -1)
  {
    if ((a1 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  swift_once();
  if ((v1 & 0x8000000000000000) != 0) {
    goto LABEL_33;
  }
LABEL_3:
  if (*(void *)(qword_10003D688 + 16) <= v1)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  unint64_t v1 = *(void *)(qword_10003D688 + 8 * v1 + 32);
  if (v1 - 9 >= 0xFFFFFFFFFFFFFFF8)
  {
    if (qword_10003BD60 == -1) {
      goto LABEL_21;
    }
    goto LABEL_35;
  }
  if (v1 - 13 >= 0xFFFFFFFFFFFFFFFCLL)
  {
    if (qword_10003BD68 == -1) {
      goto LABEL_21;
    }
    goto LABEL_35;
  }
  if (v1 - 17 >= 0xFFFFFFFFFFFFFFFCLL)
  {
    if (qword_10003BD70 == -1) {
      goto LABEL_21;
    }
    goto LABEL_35;
  }
  if (v1 - 24 >= 0xFFFFFFFFFFFFFFF9)
  {
    if (qword_10003BD78 == -1) {
      goto LABEL_21;
    }
    goto LABEL_35;
  }
  if (v1 - 28 >= 0xFFFFFFFFFFFFFFFCLL)
  {
    if (qword_10003BD80 == -1) {
      goto LABEL_21;
    }
    goto LABEL_35;
  }
  if (v1 - 34 < 0xFFFFFFFFFFFFFFFALL) {
    return 0;
  }
  if (qword_10003BD88 != -1) {
LABEL_35:
  }
    swift_once();
LABEL_21:
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3)
  {
LABEL_30:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (*(void *)(v2 + 32) != v1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v3 - 1;
    while (v5 != v4)
    {
      uint64_t v6 = *(void *)(v2 + 40 + 8 * v4++);
      if (v6 == v1) {
        goto LABEL_27;
      }
    }
    goto LABEL_30;
  }
  uint64_t v4 = 0;
LABEL_27:
  swift_bridgeObjectRelease();
  uint64_t result = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  return result;
}

NSObject *sub_10000D1CC(unint64_t a1)
{
  unsigned int v51 = 0;
  if (qword_10003BDB0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_10003D700;
  sub_10000DAD4(a1);
  NSString v3 = sub_100029070();
  swift_bridgeObjectRelease();
  NSString v4 = sub_100029070();
  id v5 = [v2 pathForResource:v3 ofType:v4];

  uint64_t v6 = &OBJC_IVAR___NTKKaleidoscopePathfinder__pathLength;
  if (!v5)
  {
    if (qword_10003BDA8 == -1) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
  uint64_t v7 = sub_100029080();
  unint64_t v9 = v8;

  if (qword_10003BDA8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100028FA0();
  sub_10000E6C0(v10, (uint64_t)qword_10003D6E8);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_100028F80();
  os_log_type_t v12 = sub_100029230();
  if (os_log_type_enabled(v11, v12))
  {
    double v13 = (uint8_t *)swift_slowAlloc();
    v50[0] = (id)swift_slowAlloc();
    *(_DWORD *)double v13 = 136315138;
    swift_bridgeObjectRetain();
    sub_10002060C(v7, v9, (uint64_t *)v50);
    sub_1000292C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "pathfinderPath: %s", v13, 0xCu);
    swift_arrayDestroy();
    uint64_t v6 = &OBJC_IVAR___NTKKaleidoscopePathfinder__pathLength;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  NSString v18 = sub_100029070();
  swift_bridgeObjectRelease();
  double v19 = [self pathfinderFromFile:v18];

  unsigned int v51 = v19;
  double v20 = sub_100028F80();
  os_log_type_t v21 = sub_100029230();
  if (os_log_type_enabled(v20, v21))
  {
    double v22 = (uint8_t *)swift_slowAlloc();
    unsigned int v23 = (void *)swift_slowAlloc();
    *(_DWORD *)double v22 = 138412290;
    swift_beginAccess();
    unsigned int v24 = v51;
    if (v51)
    {
      v50[0] = v51;
      BOOL v25 = v51;
    }
    else
    {
      v50[0] = 0;
    }
    sub_1000292C0();
    void *v23 = v24;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "pathfinder: %@", v22, 0xCu);
    sub_10000E274((uint64_t *)&unk_10003BDE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  if (v51)
  {
    id v26 = v51;
    sub_10000DBF8(a1);
    -[NSObject adjustRotationStart:](v26, "adjustRotationStart:");

    uint64_t v27 = qword_10003BD90;
    unsigned int v15 = v26;
    if (v27 == -1)
    {
      if ((a1 & 0x8000000000000000) == 0) {
        goto LABEL_20;
      }
    }
    else
    {
      swift_once();
      if ((a1 & 0x8000000000000000) == 0)
      {
LABEL_20:
        if (*(void *)(qword_10003D688 + 16) > a1)
        {
          LODWORD(v28) = 0.5;
          if ((unint64_t)(*(void *)(qword_10003D688 + 8 * a1 + 32) - 17) < 0xFFFFFFFFFFFFFFFCLL) {
            *(float *)&double v28 = 1.0;
          }
          [v15 adjustSampleRadius:v28];
LABEL_24:

          goto LABEL_25;
        }
        goto LABEL_45;
      }
    }
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_9:
    uint64_t v14 = sub_100028FA0();
    sub_10000E6C0(v14, (uint64_t)qword_10003D6E8);
    unsigned int v15 = sub_100028F80();
    os_log_type_t v16 = sub_100029230();
    if (os_log_type_enabled(v15, v16))
    {
      BOOL v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "could not load pathfinderPath", v17, 2u);
      swift_slowDealloc();
    }
    goto LABEL_24;
  }
LABEL_25:
  swift_beginAccess();
  if (v51)
  {
    if (*((void *)v6 + 437) != -1) {
      swift_once();
    }
    uint64_t v29 = sub_100028FA0();
    sub_10000E6C0(v29, (uint64_t)qword_10003D6E8);
    float v30 = sub_100028F80();
    os_log_type_t v31 = sub_100029230();
    if (os_log_type_enabled(v30, v31))
    {
      float v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)float v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "pathfinder is not nil", v32, 2u);
      swift_slowDealloc();
    }
LABEL_42:

    return v51;
  }
  sub_10000DAD4(a1);
  id v33 = (id)qword_10003D700;
  NSString v34 = sub_100029070();
  swift_bridgeObjectRelease();
  id v35 = [self imageNamed:v34 inBundle:v33 withConfiguration:0];

  uint64_t v36 = *((void *)v6 + 437);
  if (v35)
  {
    if (v36 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_100028FA0();
    sub_10000E6C0(v37, (uint64_t)qword_10003D6E8);
    float32x4_t v38 = v35;
    int v39 = sub_100028F80();
    os_log_type_t v40 = sub_100029230();
    if (os_log_type_enabled(v39, v40))
    {
      __int32 v41 = (uint8_t *)swift_slowAlloc();
      int16x8_t v42 = (void *)swift_slowAlloc();
      *(_DWORD *)__int32 v41 = 138412290;
      int v43 = v38;
      sub_1000292C0();
      *int16x8_t v42 = v35;

      _os_log_impl((void *)&_mh_execute_header, v39, v40, "pathfinder is nil; making one with image: %@", v41, 0xCu);
      sub_10000E274((uint64_t *)&unk_10003BDE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      int v39 = v38;
    }

    CGRect v49 = [self pathfinderWithImage:v38];
    float v30 = v51;
    unsigned int v51 = v49;
    goto LABEL_42;
  }
  if (v36 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_100028FA0();
  sub_10000E6C0(v44, (uint64_t)qword_10003D6E8);
  CGRect v45 = sub_100028F80();
  os_log_type_t v46 = sub_100029230();
  if (os_log_type_enabled(v45, v46))
  {
    unsigned int v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v47 = 0;
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "pathfinder image is nil", v47, 2u);
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_10000DAD4(unint64_t a1)
{
  sub_100029350(20);
  swift_bridgeObjectRelease();
  sub_10000E274(&qword_10003BDD0);
  uint64_t result = swift_allocObject();
  NSString v3 = (void *)result;
  *(_OWORD *)(result + 16) = xmmword_10002BC90;
  if (qword_10003BD90 == -1)
  {
    if ((a1 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = swift_once();
  if ((a1 & 0x8000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (*(void *)(qword_10003D688 + 16) > a1)
  {
    uint64_t v4 = *(void *)(qword_10003D688 + 8 * a1 + 32);
    v3[7] = &type metadata for Int;
    v3[8] = &protocol witness table for Int;
    v3[4] = v4;
    v5._countAndFlagsBits = sub_1000290A0();
    sub_100029110(v5);
    swift_bridgeObjectRelease();
    return 0xD000000000000012;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_10000DBF8(uint64_t result)
{
  unint64_t v1 = result;
  if (qword_10003BD90 == -1)
  {
    if ((result & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = swift_once();
  if ((v1 & 0x8000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (*(void *)(qword_10003D688 + 16) <= v1) {
LABEL_7:
  }
    __break(1u);
  return result;
}

uint64_t sub_10000DC8C(unint64_t a1)
{
  return sub_10000DC9C(a1, 27693);
}

uint64_t sub_10000DC94(unint64_t a1)
{
  return sub_10000DC9C(a1, 25389);
}

uint64_t sub_10000DC9C(unint64_t a1, uint64_t a2)
{
  uint64_t v8 = sub_10000DAD4(a1);
  v9._countAndFlagsBits = a2;
  v9._object = (void *)0xE200000000000000;
  sub_100029110(v9);
  id v3 = [self currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4) {
    v5._countAndFlagsBits = 0x646170697ELL;
  }
  else {
    v5._countAndFlagsBits = 0x656E6F6870697ELL;
  }
  if (v4) {
    uint64_t v6 = (void *)0xE500000000000000;
  }
  else {
    uint64_t v6 = (void *)0xE700000000000000;
  }
  v5._object = v6;
  sub_100029110(v5);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_10000DD5C(uint64_t a1)
{
  return sub_10000DD8C(a1, 0x6C2D6B7261442DLL, 27693);
}

uint64_t sub_10000DD74(uint64_t a1)
{
  return sub_10000DD8C(a1, 0x632D6B7261442DLL, 25389);
}

uint64_t sub_10000DD8C(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = result;
  if (qword_10003BD90 == -1)
  {
    if ((result & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t result = swift_once();
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_15;
  }
LABEL_3:
  if (*(void *)(qword_10003D688 + 16) <= v5)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  if ((unint64_t)(*(void *)(qword_10003D688 + 8 * v5 + 32) - 34) < 0xFFFFFFFFFFFFFFFALL) {
    return sub_10000DC9C(v5, a3);
  }
  uint64_t v10 = sub_10000DAD4(v5);
  v11._countAndFlagsBits = a2;
  v11._object = (void *)0xE700000000000000;
  sub_100029110(v11);
  id v6 = [self currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7) {
    v8._countAndFlagsBits = 0x646170697ELL;
  }
  else {
    v8._countAndFlagsBits = 0x656E6F6870697ELL;
  }
  if (v7) {
    Swift::String v9 = (void *)0xE500000000000000;
  }
  else {
    Swift::String v9 = (void *)0xE700000000000000;
  }
  v8._object = v9;
  sub_100029110(v8);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10000DED0(uint64_t result)
{
  unint64_t v1 = result;
  if (qword_10003BD90 == -1)
  {
    if ((result & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = swift_once();
  if ((v1 & 0x8000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (*(void *)(qword_10003D688 + 16) <= v1) {
LABEL_7:
  }
    __break(1u);
  return result;
}

void sub_10000DF64(unint64_t a1)
{
  sub_100029350(60);
  v2._countAndFlagsBits = 0xD00000000000001BLL;
  v2._object = (void *)0x800000010002D3E0;
  sub_100029110(v2);
  v3._countAndFlagsBits = sub_100029520();
  sub_100029110(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x203A656C6966202CLL;
  v4._object = (void *)0xE800000000000000;
  sub_100029110(v4);
  if (qword_10003BD90 == -1)
  {
    if ((a1 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  swift_once();
  if ((a1 & 0x8000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (*(void *)(qword_10003D688 + 16) > a1)
  {
    v5._countAndFlagsBits = sub_100029520();
    sub_100029110(v5);
    swift_bridgeObjectRelease();
    v6._object = (void *)0x800000010002D410;
    v6._countAndFlagsBits = 0xD000000000000012;
    sub_100029110(v6);
    v7._countAndFlagsBits = sub_10000DAD4(a1);
    sub_100029110(v7);
    swift_bridgeObjectRelease();
    v8._countAndFlagsBits = 93;
    v8._object = (void *)0xE100000000000000;
    sub_100029110(v8);
    return;
  }
LABEL_7:
  __break(1u);
}

Swift::Int sub_10000E0FC()
{
  Swift::UInt v1 = *v0;
  sub_100029580();
  sub_100029590(v1);
  return sub_1000295A0();
}

void sub_10000E144()
{
  sub_100029590(*v0);
}

Swift::Int sub_10000E170()
{
  Swift::UInt v1 = *v0;
  sub_100029580();
  sub_100029590(v1);
  return sub_1000295A0();
}

void sub_10000E1B4()
{
  sub_10000DF64(*v0);
}

BOOL sub_10000E1BC(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_10000E1D0(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_10000E1DC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL sub_10000E1EC(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

unint64_t sub_10000E220()
{
  unint64_t result = qword_10003BDC8;
  if (!qword_10003BDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003BDC8);
  }
  return result;
}

uint64_t sub_10000E274(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

char *sub_10000E2B8(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000E274(&qword_10003BDD8);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      double v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      double v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_10000E514(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E3C8(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_10000E2B8(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v10 = &v3[8 * v9 + 32];
  if (a1 + 32 < (unint64_t)&v10[8 * v8] && (unint64_t)v10 < a1 + 32 + 8 * v8) {
    goto LABEL_24;
  }
  memcpy(v10, (const void *)(a1 + 32), 8 * v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    void *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1000294C0();
  __break(1u);
  return result;
}

char *sub_10000E514(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    int64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_1000294C0();
  __break(1u);
  return result;
}

uint64_t sub_10000E604(uint64_t a1)
{
  switch(a1)
  {
    case 28:
      uint64_t result = 1702194242;
      break;
    case 29:
      uint64_t result = 0x6E65657247;
      break;
    case 30:
      uint64_t result = 0x65676E61724FLL;
      break;
    case 31:
      uint64_t result = 6579538;
      break;
    case 32:
      uint64_t result = 0x656C70727550;
      break;
    case 33:
      uint64_t result = 2036429383;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_10000E6C0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t (*sub_10000E704())()
{
  return j__swift_endAccess;
}

void sub_10000E764()
{
  swift_unknownObjectWeakInit();
  Swift::UInt v1 = &v0[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_posterData];
  uint64_t v2 = type metadata accessor for KaleidoscopePosterData();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_contentView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_contentViewForLook] = &_swiftEmptyDictionarySingleton;
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_animationDriverForLook] = &_swiftEmptyDictionarySingleton;
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_posterDataForLook] = &_swiftEmptyDictionarySingleton;
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_kaleidoscopeViewReuseCache] = _swiftEmptyArrayStorage;
  uint64_t v3 = &OBJC_IVAR___NTKKaleidoscopePathfinder__pathLength;
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_jewelLookNames] = _swiftEmptyArrayStorage;
  uint64_t v4 = OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_artfileManager;
  type metadata accessor for KaleidoscopeArtFileManager();
  int64_t v5 = (void *)swift_allocObject();
  v5[2] = &_swiftEmptyDictionarySingleton;
  v5[3] = &_swiftEmptyDictionarySingleton;
  v5[4] = &_swiftEmptyDictionarySingleton;
  v5[5] = &_swiftEmptyDictionarySingleton;
  size_t v6 = v0;
  v5[6] = sub_1000221FC();
  *(void *)&v0[v4] = v5;
  *(void *)&v6[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_editorContentViewsForEditingLooks] = &_swiftEmptyDictionarySingleton;
  *(void *)&v6[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_lastOrientation] = 0;
  v6[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_shouldShowAppearanceMenuButton] = 1;
  *(void *)&v6[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_currentlySelectedAppearanceStyle] = 0;

  v35.receiver = v6;
  v35.super_class = (Class)type metadata accessor for KaleidoscopePosterEditor();
  id v7 = objc_msgSendSuper2(&v35, "init");
  uint64_t v8 = qword_10003BD98;
  uint64_t v9 = (id *)v7;
  if (v8 != -1) {
    goto LABEL_26;
  }
  while (1)
  {
    uint64_t v10 = sub_100028FA0();
    sub_10000E6C0(v10, (uint64_t)qword_10003D6B8);
    int64_t v11 = sub_100028F80();
    os_log_type_t v12 = sub_1000291F0();
    if (os_log_type_enabled(v11, v12))
    {
      BOOL v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "PosterEditor created", v13, 2u);
      swift_slowDealloc();
    }

    swift_retain();
    sub_100024310();
    swift_release();
    unint64_t v14 = (unint64_t)sub_1000221FC();
    unint64_t v15 = v14;
    int64_t v16 = v14 >> 62;
    if (v14 >> 62)
    {
      if (sub_100029470() < 0) {
        goto LABEL_32;
      }
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_100029470();
      swift_bridgeObjectRelease();
      if (v33 < 6)
      {
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        return;
      }
    }
    else if (*(uint64_t *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) < 6)
    {
      goto LABEL_29;
    }
    if ((v15 & 0xC000000000000001) != 0)
    {
      sub_100014F80(0, &qword_10003BF00);
      sub_100029370(0);
      sub_100029370(1);
      sub_100029370(2);
      sub_100029370(3);
      sub_100029370(4);
      sub_100029370(5);
    }
    if (v16)
    {
      swift_bridgeObjectRetain();
      sub_100029480();
      uint64_t v17 = v19;
      int64_t v16 = v20;
      unint64_t v22 = v21;
      swift_bridgeObjectRelease_n();
      uint64_t v18 = v22 >> 1;
    }
    else
    {
      uint64_t v17 = (v15 & 0xFFFFFFFFFFFFFF8) + 32;
      uint64_t v18 = 6;
    }
    uint64_t v23 = v18 - v16;
    if (__OFSUB__(v18, v16)) {
      goto LABEL_30;
    }
    if (!v23) {
      break;
    }
    sub_100025FA0(0, v23 & ~(v23 >> 63), 0);
    if (v23 < 0) {
      goto LABEL_31;
    }
    NSString v34 = v9;
    if (v16 <= v18) {
      uint64_t v24 = v18;
    }
    else {
      uint64_t v24 = v16;
    }
    uint64_t v3 = (int *)(v24 - v16);
    uint64_t v9 = (id *)(v17 + 8 * v16);
    while (v3)
    {
      id v25 = *v9;
      id v26 = [v25 displayName];
      uint64_t v27 = sub_100029080();
      uint64_t v29 = v28;

      unint64_t v31 = _swiftEmptyArrayStorage[2];
      unint64_t v30 = _swiftEmptyArrayStorage[3];
      if (v31 >= v30 >> 1) {
        sub_100025FA0(v30 > 1, v31 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v31 + 1;
      float v32 = &_swiftEmptyArrayStorage[2 * v31];
      v32[4] = v27;
      v32[5] = v29;
      uint64_t v3 = (int *)((char *)v3 - 1);
      ++v9;
      if (!--v23)
      {
        swift_unknownObjectRelease();
        uint64_t v9 = v34;

        uint64_t v3 = &OBJC_IVAR___NTKKaleidoscopePathfinder__pathLength;
        goto LABEL_24;
      }
    }
    __break(1u);
LABEL_26:
    swift_once();
  }
  swift_unknownObjectRelease();

LABEL_24:
  *(id *)((char *)v9 + *((void *)v3 + 454)) = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
}

void sub_10000ED08(void *a1, void *a2, void *a3)
{
  uint64_t v136 = a3;
  id v143 = a1;
  uint64_t v4 = sub_10000E274(&qword_10003BF08);
  __chkstk_darwin(v4 - 8);
  v137 = (char *)&v126 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_100028D40();
  uint64_t v142 = *(uint64_t (***)(void, void, void))(v139 - 8);
  uint64_t v6 = __chkstk_darwin(v139);
  long long v135 = (char *)&v126 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v138 = (char *)&v126 - v8;
  uint64_t v9 = sub_10000E274(&qword_10003C040);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  os_log_type_t v12 = (char *)&v126 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  unint64_t v14 = (char *)&v126 - v13;
  uint64_t v15 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v140 = (uint64_t)&v126 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v134 = (uint64_t)&v126 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v126 - v22;
  __chkstk_darwin(v21);
  char v144 = (char *)&v126 - v24;
  uint64_t v25 = sub_100028DB0();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v126 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v26 + 104))(v28, enum case for WatchFacesWallpaperSupportFeatureFlags.catskill(_:), v25);
  char v29 = sub_100028DA0();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
  if (v29)
  {
    id v130 = a2;
    sub_10000E274((uint64_t *)&unk_10003BF10);
    unint64_t v30 = v136;
    sub_100028E90();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
    {
      uint64_t v31 = (uint64_t)v144;
      sub_100028EA0();
      sub_100014E64((uint64_t)v14, &qword_10003C040);
    }
    else
    {
      uint64_t v31 = (uint64_t)v144;
      sub_100014F1C((uint64_t)v14, (uint64_t)v144);
    }
    long long v133 = v12;
    if (qword_10003BD98 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_100028FA0();
    uint64_t v44 = sub_10000E6C0(v43, (uint64_t)qword_10003D6B8);
    sub_1000126C0(v31, (uint64_t)v23);
    id v45 = v30;
    uint64_t v129 = v44;
    os_log_type_t v46 = sub_100028F80();
    os_log_type_t v47 = sub_100029200();
    BOOL v48 = os_log_type_enabled(v46, v47);
    uint64_t v132 = v15;
    uint64_t v131 = v16;
    uint64_t v136 = v45;
    if (v48)
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v146 = swift_slowAlloc();
      *(_DWORD *)uint64_t v49 = 136315394;
      id v50 = [v45 identifier];
      unsigned int v51 = v45;
      uint64_t v52 = sub_100029080();
      unint64_t v54 = v53;

      uint64_t v145 = sub_10002060C(v52, v54, &v146);
      sub_1000292C0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 12) = 2080;
      uint64_t v55 = sub_100017CCC();
      uint64_t v145 = sub_10002060C(v55, v56, &v146);
      sub_1000292C0();
      swift_bridgeObjectRelease();
      sub_100014DB4((uint64_t)v23);
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "populateViewsForLook: %s; resolved data: %s",
        (uint8_t *)v49,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v31 = (uint64_t)v144;
      swift_slowDealloc();
    }
    else
    {

      sub_100014DB4((uint64_t)v23);
    }

    uint64_t v57 = v139;
    uint64_t v58 = (uint64_t)v137;
    sub_100022180();
    uint64_t v60 = v59;
    sub_100014D50(v31, v58, &qword_10003BF08);
    int v61 = v142;
    int v62 = v142[6](v58, 1, v57);
    char v63 = v138;
    uint64_t v139 = v60;
    if (v62 == 1)
    {
      sub_100014E64(v58, &qword_10003BF08);
    }
    else
    {
      ((uint64_t (**)(char *, uint64_t, uint64_t))v61)[4](v138, v58, v57);
      id v64 = objc_allocWithZone((Class)NSUserDefaults);
      NSString v65 = sub_100029070();
      float v66 = (char *)[v64 initWithSuiteName:v65];

      v137 = v66;
      if (v66)
      {
        uint64_t v67 = sub_10001549C(&qword_10003BF38, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v146 = sub_100029520();
        uint64_t v147 = v68;
        v148._object = (void *)0xE900000000000073;
        v148._countAndFlagsBits = 0x736572676F72702DLL;
        sub_100029110(v148);
        NSString v69 = sub_100029070();
        swift_bridgeObjectRelease();
        id v70 = v137;
        [v137 doubleForKey:v69];
        uint64_t v72 = v71;

        uint64_t v128 = v67;
        uint64_t v146 = sub_100029520();
        uint64_t v147 = v73;
        v149._countAndFlagsBits = 0x6F697461746F722DLL;
        v149._object = (void *)0xE90000000000006ELL;
        sub_100029110(v149);
        NSString v74 = sub_100029070();
        swift_bridgeObjectRelease();
        [v70 doubleForKey:v74];
        uint64_t v76 = v75;

        *(void *)(v60 + 80) = v72;
        *(void *)(v60 + 88) = v76;
        long long v77 = v135;
        ((uint64_t (**)(char *, char *, uint64_t))v61)[2](v135, v63, v57);
        uint64_t v78 = v134;
        sub_1000126C0(v31, v134);
        uint64_t v79 = sub_100028F80();
        os_log_type_t v80 = sub_1000291F0();
        int v81 = v80;
        if (os_log_type_enabled(v79, v80))
        {
          uint64_t v82 = swift_slowAlloc();
          int v127 = v81;
          uint64_t v83 = v82;
          uint64_t v129 = swift_slowAlloc();
          uint64_t v146 = v129;
          *(_DWORD *)uint64_t v83 = 136315650;
          os_log_t v126 = v79;
          uint64_t v84 = sub_100029520();
          uint64_t v145 = sub_10002060C(v84, v85, &v146);
          sub_1000292C0();
          swift_bridgeObjectRelease();
          unint64_t v86 = (void (*)(char *, uint64_t))v61[1];
          uint64_t v142 = v61 + 1;
          v86(v77, v57);
          *(_WORD *)(v83 + 12) = 2080;
          sub_100017B60();
          uint64_t v87 = sub_1000290F0();
          unint64_t v89 = v88;
          swift_bridgeObjectRelease();
          uint64_t v145 = sub_10002060C(v87, v89, &v146);
          sub_1000292C0();
          swift_bridgeObjectRelease();
          sub_100014DB4(v78);
          *(_WORD *)(v83 + 22) = 2048;
          uint64_t v145 = v72;
          sub_1000292C0();
          os_log_t v90 = v126;
          _os_log_impl((void *)&_mh_execute_header, v126, (os_log_type_t)v127, "Poster %s which is look %s loaded path progress of %f in the editor", (uint8_t *)v83, 0x20u);
          swift_arrayDestroy();
          uint64_t v31 = (uint64_t)v144;
          swift_slowDealloc();
          swift_slowDealloc();

          v86(v63, v57);
        }
        else
        {

          sub_100014DB4(v78);
          int v91 = (void (*)(char *, uint64_t))v61[1];
          v91(v77, v57);
          v91(v63, v57);
        }
      }
      else
      {
        ((void (*)(char *, uint64_t))v61[1])(v63, v57);
      }
    }
    id v92 = v143;
    id v93 = [v143 environment];
    swift_getObjectType();
    uint64_t v94 = v141;
    id v95 = sub_100018BFC(v93, *(void *)(v141+ OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_currentlySelectedAppearanceStyle));
    swift_unknownObjectRelease();
    uint64_t v96 = v136;
    uint64_t v142 = (uint64_t (**)(void, void, void))sub_100025324(v136, (uint64_t)v95);
    int v97 = (void *)sub_1000258A4(v96, (uint64_t)v95);
    sub_100014F80(0, (unint64_t *)&qword_10003BF30);
    id v98 = [v92 currentLook];
    LODWORD(v138) = sub_100029290();

    id v99 = v130;
    id v100 = [v130 backgroundView];
    [v100 bounds];
    double v102 = v101;
    double v104 = v103;
    double v106 = v105;
    double v108 = v107;

    uint64_t v109 = v140;
    sub_1000126C0(v31, v140);
    id v110 = objc_allocWithZone((Class)type metadata accessor for KaleidoscopeEditorContentView());
    char v144 = v97;
    uint64_t v111 = v139;
    swift_retain();
    id v112 = v142;
    id v143 = v142;
    int v113 = sub_10001A2E0((uint64_t)v95, v109, v111, 0, v112, v97, v138 & 1, v102, v104, v106, v108);
    id v114 = [v99 backgroundView];
    [v114 addSubview:v113];

    swift_beginAccess();
    id v115 = v96;
    uint64_t v116 = v113;
    sub_1000266FC((uint64_t)v116, v115);
    swift_endAccess();

    swift_beginAccess();
    id v117 = v115;
    uint64_t v118 = swift_retain();
    sub_100026648(v118, v117);
    swift_endAccess();

    int v119 = *(void **)(v94 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_contentView);
    *(void *)(v94 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_contentView) = v116;
    uint64_t v120 = v116;

    swift_beginAccess();
    id v121 = v117;
    uint64_t v122 = v120;
    sub_1000266FC((uint64_t)v122, v121);
    swift_endAccess();

    uint64_t v123 = (uint64_t)v133;
    sub_1000126C0(v31, (uint64_t)v133);
    uint64_t v124 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v131 + 56);
    uint64_t v125 = v132;
    v124(v123, 0, 1, v132);
    swift_beginAccess();
    sub_10000FBB8(v123, v121);
    swift_endAccess();
    sub_1000126C0(v31, v123);
    v124(v123, 0, 1, v125);
    sub_100010624(v123);
    swift_release();

    sub_100014E64(v123, &qword_10003C040);
    sub_100014DB4(v31);
  }
  else
  {
    type metadata accessor for KaleidoscopeEmptyView();
    id v32 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    id v33 = [a2 backgroundView];
    [v33 bounds];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;

    objc_msgSend(v32, "setFrame:", v35, v37, v39, v41);
    id v42 = [a2 backgroundView];
    [v42 addSubview:v32];
  }
}

uint64_t sub_10000FBB8(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10000E274(&qword_10003C040);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for KaleidoscopePosterData();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_100014E64(a1, &qword_10003C040);
    sub_10002636C((uint64_t)a2, (uint64_t)v8);

    return sub_100014E64((uint64_t)v8, &qword_10003C040);
  }
  else
  {
    sub_100014F1C(a1, (uint64_t)v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_100027C04((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v16;

    return swift_bridgeObjectRelease();
  }
}

void sub_10000FDF4(void *a1, void *a2, uint64_t a3)
{
  v28[1] = a3;
  uint64_t v6 = sub_10000E274(&qword_10003C040);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakAssign();
  sub_100010318((uint64_t)a1);
  id v29 = a1;
  id v9 = [a1 currentLook];
  swift_getObjectType();
  sub_100012820(a2, v9, (uint64_t)v3);
  if (qword_10003BD98 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100028FA0();
  sub_10000E6C0(v10, (uint64_t)qword_10003D6B8);
  uint64_t v11 = v3;
  uint64_t v12 = sub_100028F80();
  os_log_type_t v13 = sub_100029200();
  if (os_log_type_enabled(v12, v13))
  {
    v28[0] = v9;
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)unint64_t v14 = 136315138;
    v31[0] = v15;
    uint64_t v16 = (uint64_t)&v11[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_posterData];
    swift_beginAccess();
    sub_100014D50(v16, (uint64_t)v8, &qword_10003C040);
    uint64_t v17 = sub_1000290D0();
    uint64_t v30 = sub_10002060C(v17, v18, v31);
    sub_1000292C0();

    id v9 = (id)v28[0];
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "didUpdate with posterData: %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v19 = (uint64_t *)&v11[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_contentViewForLook];
  swift_beginAccess();
  uint64_t v20 = *v19;
  id v21 = v9;
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_100023F50(v21, v20);

  swift_bridgeObjectRelease();
  if (v22)
  {
    uint64_t v23 = OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_lastOrientation;
    id v24 = *(id *)&v11[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_lastOrientation];
    id v25 = v29;
    id v26 = objc_msgSend(objc_msgSend(v29, "environment"), "deviceOrientation");
    swift_unknownObjectRelease();
    if (v24 != v26)
    {
      id v27 = objc_msgSend(objc_msgSend(v25, "environment"), "deviceOrientation");
      swift_unknownObjectRelease();
      *(void *)&v11[v23] = v27;
      if (!UIAccessibilityIsReduceMotionEnabled()) {
        sub_100028EF0();
      }
    }

    id v21 = v22;
  }
}

uint64_t sub_100010318(uint64_t a1)
{
  v20[1] = a1;
  uint64_t v2 = sub_10000E274(&qword_10003BF28);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v20 - v7;
  uint64_t v9 = sub_10000E274(&qword_10003C040);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  unint64_t v14 = (char *)v20 - v13;
  sub_10000E274((uint64_t *)&unk_10003BF10);
  uint64_t v21 = v1;
  uint64_t v15 = v1 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_posterData;
  swift_beginAccess();
  sub_100014D50(v15, (uint64_t)v12, &qword_10003C040);
  sub_100028E80();
  sub_100014E64((uint64_t)v12, &qword_10003C040);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  int v16 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  if (v16 == enum case for PosterDataComparisonResult.update<A>(_:)
    || v16 == enum case for PosterDataComparisonResult.fallback<A>(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
    sub_100014F1C((uint64_t)v6, (uint64_t)v14);
    uint64_t v17 = type metadata accessor for KaleidoscopePosterData();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 0, 1, v17);
LABEL_6:
    sub_100010624((uint64_t)v14);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    return sub_100014E64((uint64_t)v14, &qword_10003C040);
  }
  if (v16 == enum case for PosterDataComparisonResult.equal<A>(_:))
  {
    uint64_t v18 = type metadata accessor for KaleidoscopePosterData();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v14, 1, 1, v18);
    goto LABEL_6;
  }
  uint64_t result = sub_100029530();
  __break(1u);
  return result;
}

uint64_t sub_100010624(uint64_t a1)
{
  uint64_t v3 = sub_10000E274(&qword_10003C040);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v15 - v7;
  uint64_t v9 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100014D50(a1, (uint64_t)v8, &qword_10003C040);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_100014E64((uint64_t)v8, &qword_10003C040);
  }
  sub_100014F1C((uint64_t)v8, (uint64_t)v12);
  sub_1000126C0((uint64_t)v12, (uint64_t)v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
  uint64_t v14 = v1 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_posterData;
  swift_beginAccess();
  sub_1000154E4((uint64_t)v6, v14, &qword_10003C040);
  swift_endAccess();
  return sub_100014DB4((uint64_t)v12);
}

unint64_t sub_1000108A0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000E274(&qword_10003BF08);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v55 - v11;
  uint64_t v13 = sub_100028DB0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  int v16 = (char *)v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, enum case for WatchFacesWallpaperSupportFeatureFlags.catskill(_:), v13);
  char v17 = sub_100028DA0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if ((v17 & 1) == 0) {
    return 0xD000000000000010;
  }
  uint64_t v56 = 0;
  unint64_t v57 = 0xE000000000000000;
  sub_10000E274((uint64_t *)&unk_10003BF10);
  sub_100028EA0();
  uint64_t v18 = *(void **)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_jewelLookNames);
  swift_bridgeObjectRetain();
  sub_100017B60();
  uint64_t v19 = sub_1000290F0();
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  char v22 = sub_100024248(v19, v21, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_shouldShowAppearanceMenuButton) = v22 & 1;
  *(void *)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_currentlySelectedAppearanceStyle) = *(void *)&v12[*(int *)(v7 + 20)];
  sub_100014D50((uint64_t)v12, (uint64_t)v6, &qword_10003BF08);
  uint64_t v23 = sub_100028D40();
  uint64_t v24 = *(void *)(v23 - 8);
  LODWORD(v19) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48))(v6, 1, v23);
  sub_100014E64((uint64_t)v6, &qword_10003BF08);
  if (v19 == 1)
  {
    id v25 = objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
    swift_unknownObjectRelease();
    v58[0] = 0;
    id v26 = [v25 loadUserInfoWithError:v58];
    swift_unknownObjectRelease();
    id v27 = v58[0];
    if (v26)
    {
      uint64_t v28 = sub_100029010();
      id v29 = v27;

      v55[0] = 0x746E6169726176;
      v55[1] = 0xE700000000000000;
      sub_100029320();
      if (*(void *)(v28 + 16) && (unint64_t v30 = sub_100026F0C((uint64_t)v58), (v31 & 1) != 0))
      {
        sub_100014EC0(*(void *)(v28 + 56) + 32 * v30, (uint64_t)&v59);
      }
      else
      {
        long long v59 = 0u;
        long long v60 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_100014E10((uint64_t)v58);
      if (*((void *)&v60 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v35 = v55[0];
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v10, 1, 1, v23);
          *(void *)&v10[*(int *)(v7 + 20)] = 0;
          *(void *)&v10[*(int *)(v7 + 24)] = v35;
          sub_100017478();
          uint64_t v37 = v36;
          unint64_t v39 = v38;
          sub_100014DB4((uint64_t)v10);
          swift_bridgeObjectRelease();
          uint64_t v56 = v37;
          unint64_t v57 = v39;
        }
      }
      else
      {
        sub_100014E64((uint64_t)&v59, &qword_10003BF20);
      }
    }
    else
    {
      id v40 = v58[0];
      sub_100028D20();

      swift_willThrow();
      if (qword_10003BD98 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_100028FA0();
      sub_10000E6C0(v41, (uint64_t)qword_10003D6B8);
      id v42 = sub_100028F80();
      os_log_type_t v43 = sub_100029220();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v44 = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "Kaleidoscope editor failed to load user info.", v44, 2u);
        swift_slowDealloc();
      }
      swift_errorRelease();
    }
    if (qword_10003BD98 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_100028FA0();
    sub_10000E6C0(v45, (uint64_t)qword_10003D6B8);
    os_log_type_t v46 = sub_100028F80();
    os_log_type_t v47 = sub_100029200();
    if (os_log_type_enabled(v46, v47))
    {
      BOOL v48 = (uint8_t *)swift_slowAlloc();
      v58[0] = (id)swift_slowAlloc();
      *(_DWORD *)BOOL v48 = 136315138;
      swift_beginAccess();
      uint64_t v49 = v56;
      unint64_t v50 = v57;
      swift_bridgeObjectRetain();
      v55[0] = sub_10002060C(v49, v50, (uint64_t *)v58);
      sub_1000292C0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Kaleidoscope loaded %s for a new poster.", v48, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    swift_beginAccess();
    uint64_t v51 = v56;
    unint64_t v52 = v57;
    swift_bridgeObjectRetain();
    uint64_t v33 = v51;
    unint64_t v34 = v52;
  }
  else
  {
    sub_100017478();
  }
  sub_1000110AC(v33, v34);
  uint64_t v32 = v53;
  swift_bridgeObjectRelease();
  sub_100014DB4((uint64_t)v12);
  swift_bridgeObjectRelease();
  return v32;
}

void sub_1000110AC(uint64_t a1, unint64_t a2)
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    goto LABEL_27;
  }
  uint64_t v6 = (void *)Strong;
  unint64_t v7 = sub_100014428();

  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v8) {
      goto LABEL_4;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v2 = _swiftEmptyArrayStorage;
    if (!_swiftEmptyArrayStorage[2])
    {
LABEL_17:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      return;
    }
LABEL_16:
    if (sub_100024248(a1, a2, v2)) {
      goto LABEL_17;
    }
    if (qword_10003BD98 == -1) {
      goto LABEL_19;
    }
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_100029470();
  swift_bridgeObjectRelease();
  if (!v8) {
    goto LABEL_15;
  }
LABEL_4:
  uint64_t v28 = _swiftEmptyArrayStorage;
  sub_100025FA0(0, v8 & ~(v8 >> 63), 0);
  if ((v8 & 0x8000000000000000) == 0)
  {
    uint64_t v26 = a1;
    unint64_t v27 = a2;
    uint64_t v9 = 0;
    uint64_t v2 = v28;
    do
    {
      if ((v7 & 0xC000000000000001) != 0) {
        id v10 = (id)sub_100029380();
      }
      else {
        id v10 = *(id *)(v7 + 8 * v9 + 32);
      }
      uint64_t v11 = v10;
      id v12 = objc_msgSend(v10, "identifier", v26, v27);
      uint64_t v13 = sub_100029080();
      uint64_t v15 = v14;

      uint64_t v28 = v2;
      unint64_t v17 = v2[2];
      unint64_t v16 = v2[3];
      if (v17 >= v16 >> 1)
      {
        sub_100025FA0(v16 > 1, v17 + 1, 1);
        uint64_t v2 = v28;
      }
      ++v9;
      v2[2] = v17 + 1;
      uint64_t v18 = &v2[2 * v17];
      v18[4] = v13;
      v18[5] = v15;
    }
    while (v8 != v9);
    swift_bridgeObjectRelease();
    a1 = v26;
    a2 = v27;
    if (!v2[2]) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  __break(1u);
LABEL_25:
  swift_once();
LABEL_19:
  uint64_t v19 = sub_100028FA0();
  sub_10000E6C0(v19, (uint64_t)qword_10003D6B8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v20 = sub_100028F80();
  os_log_type_t v21 = sub_100029220();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315394;
    swift_bridgeObjectRetain();
    sub_10002060C(a1, a2, (uint64_t *)&v28);
    sub_1000292C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_100029160();
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    sub_10002060C(v23, v25, (uint64_t *)&v28);
    sub_1000292C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "The initial identifier %s was not found in all looks which consists of %s. Defaulting to first option.", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  if (v2[2])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
LABEL_27:
  __break(1u);
}

void sub_100011528(void *a1, uint64_t a2)
{
  *(void *)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_currentlySelectedAppearanceStyle) = a2;
  uint64_t v5 = sub_10000E704();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for KaleidoscopePosterData();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8)) {
    *(void *)(v7 + *(int *)(v8 + 20)) = a2;
  }
  ((void (*)(uint64_t *, void))v5)(&v11, 0);
  id v9 = [a1 currentLook];
  id v10 = [a1 environment];
  swift_getObjectType();
  sub_100012820(v10, v9, v2);
  swift_unknownObjectRelease();
  [a1 updateActions];
}

unint64_t sub_1000116C8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100028ED0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100028DB0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for WatchFacesWallpaperSupportFeatureFlags.catskill(_:), v8);
  char v12 = sub_100028DA0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  unint64_t result = 0;
  if (v12)
  {
    uint64_t v14 = OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_shouldShowAppearanceMenuButton;
    uint64_t v15 = enum case for PrivateFeatureFlags.catskillDesignTweaks(_:);
    unint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
    if ((*(unsigned char *)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_shouldShowAppearanceMenuButton) & 1) != 0
      || (v16(v7, enum case for PrivateFeatureFlags.catskillDesignTweaks(_:), v4),
          char v17 = sub_100028EC0(),
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4),
          (v17 & 1) != 0))
    {
      unint64_t v27 = (unint64_t)_swiftEmptyArrayStorage;
      v16(v7, v15, v4);
      char v18 = sub_100028EC0();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      if (v18)
      {
        uint64_t v19 = swift_allocObject();
        swift_unknownObjectWeakInit();
        NSString v20 = sub_100029070();
        id v21 = [self systemImageNamed:v20];

        sub_100014F80(0, &qword_10003BEF8);
        sub_100029070();
        uint64_t v22 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v23 = swift_allocObject();
        *(void *)(v23 + 16) = v22;
        *(void *)(v23 + 24) = v19;
        swift_retain();
        id v24 = (id)sub_1000292A0();
        sub_100029130();
        if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100029180();
        }
        sub_100029190();
        sub_100029170();
        swift_release();
      }
      if (*(unsigned char *)(v2 + v14) == 1)
      {
        id v25 = [a1 appearanceMenu];
        sub_100029130();
        if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100029180();
        }
        sub_100029190();
        sub_100029170();
      }
      return v27;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_100011B28()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    swift_beginAccess();
    uint64_t v2 = (void *)swift_unknownObjectWeakLoadStrong();
    if (v2)
    {
      uint64_t v3 = v2;
      sub_100011F1C(v2);

      uint64_t v1 = v3;
    }
  }
}

void sub_100011C4C(float a1)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = Strong;
  id v5 = [Strong currentLook];

  uint64_t v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_contentViewForLook);
  swift_beginAccess();
  uint64_t v7 = *v6;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_100023F50(v5, v7);

  swift_bridgeObjectRelease();
  if (!v8) {
    return;
  }
  uint64_t v9 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v9)
  {
LABEL_9:
    __break(1u);
    return;
  }
  uint64_t v10 = v9;
  id v11 = [v9 currentLook];

  char v12 = (uint64_t *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_animationDriverForLook);
  swift_beginAccess();
  uint64_t v13 = *v12;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_100024018(v11, v13);

  swift_bridgeObjectRelease();
  if (v14)
  {
    *(double *)(v14 + 80) = a1;
    sub_100019A40(v14);

    swift_release();
  }
  else
  {
  }
}

void sub_100011DB4(float a1)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = Strong;
  id v5 = [Strong currentLook];

  uint64_t v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_contentViewForLook);
  swift_beginAccess();
  uint64_t v7 = *v6;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_100023F50(v5, v7);

  swift_bridgeObjectRelease();
  if (!v8) {
    return;
  }
  uint64_t v9 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v9)
  {
LABEL_9:
    __break(1u);
    return;
  }
  uint64_t v10 = v9;
  id v11 = [v9 currentLook];

  char v12 = (uint64_t *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_animationDriverForLook);
  swift_beginAccess();
  uint64_t v13 = *v12;
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_100024018(v11, v13);

  swift_bridgeObjectRelease();
  if (v14)
  {
    sub_100019AF8(a1);
    sub_100019A40(v14);

    swift_release();
  }
  else
  {
  }
}

uint64_t sub_100011F1C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000E274(&qword_10003C040);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v40 - v8 + 16;
  if (qword_10003BD98 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100028FA0();
  sub_10000E6C0(v10, (uint64_t)qword_10003D6B8);
  id v11 = sub_100028F80();
  os_log_type_t v12 = sub_100029200();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Slider button was tapped.", v13, 2u);
    swift_slowDealloc();
  }

  id v14 = [a1 currentLook];
  uint64_t v15 = &v2[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_posterDataForLook];
  swift_beginAccess();
  uint64_t v16 = *(void *)v15;
  if (*(void *)(v16 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_100026EC8((uint64_t)v14);
    if (v18)
    {
      unint64_t v19 = v17;
      uint64_t v20 = *(void *)(v16 + 56);
      uint64_t v21 = type metadata accessor for KaleidoscopePosterData();
      uint64_t v22 = *(void *)(v21 - 8);
      sub_1000126C0(v20 + *(void *)(v22 + 72) * v19, (uint64_t)v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v9, 0, 1, v21);
    }
    else
    {
      uint64_t v24 = type metadata accessor for KaleidoscopePosterData();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v9, 1, 1, v24);
    }

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v23 = type metadata accessor for KaleidoscopePosterData();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v9, 1, 1, v23);
  }
  sub_100014D50((uint64_t)v9, (uint64_t)v7, &qword_10003C040);
  id v25 = objc_allocWithZone((Class)type metadata accessor for PathProgressSliderViewController());
  id v26 = sub_100022580((uint64_t)v7);
  v40[3] = type metadata accessor for KaleidoscopePosterEditor();
  v40[4] = &off_1000353D0;
  v40[0] = v2;
  uint64_t v27 = (uint64_t)v26 + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_sliderDelegate;
  swift_beginAccess();
  uint64_t v28 = v2;
  sub_1000154E4((uint64_t)v40, v27, &qword_10003BEE0);
  swift_endAccess();
  id v29 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v26];
  id v30 = [v29 sheetPresentationController];
  NSString v31 = sub_100029070();
  sub_100014F80(0, &qword_10003BEE8);
  uint64_t v32 = (void *)sub_100029270();
  if (v30)
  {
    sub_10000E274(&qword_10003BEF0);
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_10002BF80;
    *(void *)(v33 + 32) = v32;
    v40[0] = v33;
    sub_100029170();
    id v34 = v30;
    id v35 = v32;
    Class isa = sub_100029140().super.isa;
    swift_bridgeObjectRelease();
    [v34 setDetents:isa];

    [v34 setLargestUndimmedDetentIdentifier:v31];
    id v37 = v34;
    sub_100029260();
  }
  [a1 presentViewController:v29 animated:1 completion:0];

  return sub_100014E64((uint64_t)v9, &qword_10003C040);
}

uint64_t sub_10001240C()
{
  return 0x406F400000000000;
}

id sub_10001241C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KaleidoscopePosterEditor();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100012528()
{
  return type metadata accessor for KaleidoscopePosterEditor();
}

uint64_t type metadata accessor for KaleidoscopePosterEditor()
{
  uint64_t result = qword_10003BEC0;
  if (!qword_10003BEC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001257C()
{
  sub_100012668();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100012668()
{
  if (!qword_10003BED0)
  {
    type metadata accessor for KaleidoscopePosterData();
    unint64_t v0 = sub_1000292B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10003BED0);
    }
  }
}

uint64_t sub_1000126C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for KaleidoscopePosterData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012724()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001275C()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001279C()
{
}

uint64_t sub_1000127A4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100029470();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

unint64_t sub_100012820(void *a1, void *a2, uint64_t a3)
{
  id v6 = sub_100018BFC(a1, *(void *)(a3 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_currentlySelectedAppearanceStyle));
  unint64_t v7 = (unint64_t)sub_1000221FC();
  unint64_t v8 = v7;
  unint64_t v9 = v7 >> 62;
  if (!(v7 >> 62))
  {
    if (*(uint64_t *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 6) {
      goto LABEL_3;
    }
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  unint64_t result = sub_100029470();
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  swift_bridgeObjectRetain();
  uint64_t v57 = sub_100029470();
  swift_bridgeObjectRelease();
  if (v57 < 6) {
    goto LABEL_47;
  }
LABEL_3:
  if ((v8 & 0xC000000000000001) != 0)
  {
    sub_100014F80(0, &qword_10003BF00);
    sub_100029370(0);
    sub_100029370(1);
    sub_100029370(2);
    sub_100029370(3);
    sub_100029370(4);
    sub_100029370(5);
  }
  if (v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_100029480();
    uint64_t v12 = v14;
    uint64_t v10 = v15;
    unint64_t v13 = v16;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = v8 & 0xFFFFFFFFFFFFFF8;
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFF8) + 32;
    unint64_t v13 = 13;
  }
  sub_1000240E4((uint64_t)a2, v11, v12, v10, v13);
  uint64_t v3 = &unk_10003D000;
  if (v17)
  {
    char v18 = (uint64_t *)(a3
                    + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_editorContentViewsForEditingLooks);
    swift_beginAccess();
    uint64_t v19 = *v18;
    id v20 = a2;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_100023F50(v20, v19);

    swift_bridgeObjectRelease();
    uint64_t v22 = (void *)sub_100025324(v20, (uint64_t)v6);
    uint64_t v23 = (void *)sub_1000258A4(v20, (uint64_t)v6);
    if (v21)
    {
      id v24 = v21;
      sub_1000195C8((uint64_t)v6, v22, v23);
    }
  }
  unint64_t result = (unint64_t)sub_1000221FC();
  unint64_t v8 = result;
  unint64_t v4 = result >> 62;
  if (!(result >> 62))
  {
    if (*(uint64_t *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) >= 6)
    {
LABEL_14:
      if ((v8 & 0xC000000000000001) != 0)
      {
        sub_100014F80(0, &qword_10003BF00);
        sub_100029370(0);
        sub_100029370(1);
        sub_100029370(2);
        sub_100029370(3);
        sub_100029370(4);
        sub_100029370(5);
      }
      uint64_t v60 = (uint64_t)v6;
      if (!v4)
      {
        uint64_t v26 = 0;
        uint64_t v27 = (v8 & 0xFFFFFFFFFFFFFF8) + 32;
        uint64_t v28 = 6;
LABEL_20:
        long long v59 = (uint64_t *)(a3 + v3[211]);
        swift_beginAccess();
        uint64_t v33 = v28 - v26;
        id v34 = (id *)(v27 + 8 * v26);
        while (1)
        {
          id v35 = *v34;
          id v36 = [v35 identifier];
          uint64_t v37 = sub_100029080();
          uint64_t v39 = v38;

          id v40 = [a2 identifier];
          uint64_t v41 = sub_100029080();
          uint64_t v43 = v42;

          if (v37 == v41 && v39 == v43)
          {

            swift_bridgeObjectRelease_n();
          }
          else
          {
            char v45 = sub_100029540();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v45 & 1) == 0)
            {
              uint64_t v46 = *v59;
              if ((*v59 & 0xC000000000000001) != 0)
              {
                id v47 = v35;
                swift_bridgeObjectRetain();
                uint64_t v48 = v60;
                if (sub_100029430())
                {
                  type metadata accessor for KaleidoscopeEditorContentView();
                  swift_unknownObjectRetain();
                  swift_dynamicCast();
                  uint64_t v49 = v62;
                  swift_unknownObjectRelease();

                  goto LABEL_35;
                }

LABEL_38:
                swift_bridgeObjectRelease();
LABEL_39:
                uint64_t v49 = 0;
              }
              else
              {
                uint64_t v48 = v60;
                if (!*(void *)(v46 + 16)) {
                  goto LABEL_39;
                }
                id v50 = v35;
                swift_bridgeObjectRetain();
                unint64_t v51 = sub_100026EC8((uint64_t)v50);
                if ((v52 & 1) == 0)
                {

                  goto LABEL_38;
                }
                uint64_t v49 = *(void **)(*(void *)(v46 + 56) + 8 * v51);
                id v53 = v49;

LABEL_35:
                swift_bridgeObjectRelease();
              }
              unint64_t v54 = (void *)sub_100025324(v35, v48);
              uint64_t v55 = (void *)sub_1000258A4(v35, v48);
              if (v49)
              {
                id v56 = v49;
                sub_1000195C8(v48, v54, v55);
              }
              else
              {
              }
              goto LABEL_22;
            }
          }
LABEL_22:
          ++v34;
          if (!--v33) {
            goto LABEL_44;
          }
        }
      }
      swift_bridgeObjectRetain();
      sub_100029480();
      uint64_t v27 = v29;
      uint64_t v26 = v30;
      unint64_t v32 = v31;
      unint64_t result = swift_bridgeObjectRelease_n();
      uint64_t v28 = v32 >> 1;
      if (v26 == v32 >> 1)
      {
LABEL_44:
        swift_unknownObjectRelease();
        return swift_unknownObjectRelease();
      }
      if (v26 < (uint64_t)(v32 >> 1)) {
        goto LABEL_20;
      }
      goto LABEL_51;
    }
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
LABEL_48:
  unint64_t result = sub_100029470();
  if ((result & 0x8000000000000000) == 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v58 = sub_100029470();
    unint64_t result = swift_bridgeObjectRelease();
    if (v58 >= 6) {
      goto LABEL_14;
    }
    goto LABEL_50;
  }
LABEL_53:
  __break(1u);
  return result;
}

uint64_t sub_100012E48(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v154 = a3;
  uint64_t v5 = sub_100028D40();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v145 = &v134[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v146 = &v134[-v10];
  uint64_t v11 = __chkstk_darwin(v9);
  char v156 = &v134[-v12];
  __chkstk_darwin(v11);
  int v150 = &v134[-v13];
  uint64_t v14 = sub_10000E274(&qword_10003C040);
  __chkstk_darwin(v14 - 8);
  unint64_t v16 = &v134[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  char v144 = &v134[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = __chkstk_darwin(v19);
  os_log_t v147 = (os_log_t)&v134[-v22];
  __chkstk_darwin(v21);
  float v153 = &v134[-v23];
  uint64_t v24 = sub_10000E274(&qword_10003BF08);
  uint64_t v25 = __chkstk_darwin(v24 - 8);
  Swift::String v148 = &v134[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v29 = &v134[-v28];
  __chkstk_darwin(v27);
  unint64_t v31 = &v134[-v30];
  Swift::String v149 = (void *)a1;
  sub_100010318(a1);
  char v155 = a2;
  unint64_t v32 = sub_10000E704();
  uint64_t v34 = v33;
  id v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
  int v36 = v35(v33, 1, v17);
  uint64_t v152 = v5;
  uint64_t v151 = v6;
  if (!v36)
  {
    sub_100028D30();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v6 + 56))(v31, 0, 1, v5);
    sub_1000154E4((uint64_t)v31, v34, &qword_10003BF08);
  }
  ((void (*)(char *, void))v32)(v162, 0);
  uint64_t v37 = v155;
  uint64_t v38 = sub_10000E704();
  uint64_t v40 = v39;
  int v41 = v35(v39, 1, v17);
  uint64_t v42 = v156;
  if (!v41) {
    *(void *)(v40 + *(int *)(v17 + 20)) = *(void *)&v37[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_currentlySelectedAppearanceStyle];
  }
  ((void (*)(char *, void))v38)(v162, 0);
  uint64_t v43 = (uint64_t)&v37[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_posterData];
  swift_beginAccess();
  sub_100014D50(v43, (uint64_t)v16, &qword_10003C040);
  if (v35((uint64_t)v16, 1, v17) != 1)
  {
    uint64_t v46 = v153;
    sub_100014F1C((uint64_t)v16, (uint64_t)v153);
    sub_100014D50((uint64_t)v46, (uint64_t)v29, &qword_10003BF08);
    uint64_t v47 = v151;
    uint64_t v48 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v151 + 48);
    uint64_t v49 = v152;
    if (v48(v29, 1, v152) == 1)
    {
      sub_100014DB4((uint64_t)v46);
      uint64_t v44 = &qword_10003BF08;
      uint64_t v45 = (uint64_t)v29;
      goto LABEL_9;
    }
    uint64_t v55 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v47 + 32);
    id v56 = v150;
    uint64_t v141 = (uint64_t *)(v47 + 32);
    uint64_t v140 = v55;
    v55(v150, v29, v49);
    sub_10001549C(&qword_10003C050, (void (*)(uint64_t))type metadata accessor for KaleidoscopePosterData);
    unint64_t v57 = sub_100029030();
    if (!v57)
    {
      (*(void (**)(unsigned char *, uint64_t))(v47 + 8))(v56, v49);
      sub_100014DB4((uint64_t)v46);
      goto LABEL_10;
    }
    unint64_t v58 = v57;
    uint64_t v139 = v48;
    if (qword_10003BD98 != -1) {
      swift_once();
    }
    uint64_t v59 = sub_100028FA0();
    uint64_t v60 = sub_10000E6C0(v59, (uint64_t)qword_10003D6B8);
    os_log_t v61 = v147;
    sub_1000126C0((uint64_t)v46, (uint64_t)v147);
    int v62 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v47 + 16);
    uint64_t v138 = v47 + 16;
    v137 = v62;
    v62(v42, v56, v49);
    uint64_t v143 = v60;
    char v63 = sub_100028F80();
    os_log_type_t v64 = sub_100029200();
    int v65 = v64;
    BOOL v66 = os_log_type_enabled(v63, v64);
    unint64_t v142 = v58;
    if (v66)
    {
      uint64_t v67 = swift_slowAlloc();
      uint64_t v136 = swift_slowAlloc();
      v161[0] = v136;
      *(_DWORD *)uint64_t v67 = 136315394;
      int v135 = v65;
      sub_100017B60();
      uint64_t v68 = sub_1000290F0();
      unint64_t v70 = v69;
      swift_bridgeObjectRelease();
      id v159 = (id)sub_10002060C(v68, v70, v161);
      sub_1000292C0();
      swift_bridgeObjectRelease();
      sub_100014DB4((uint64_t)v61);
      *(_WORD *)(v67 + 12) = 2080;
      sub_10001549C(&qword_10003BF38, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v71 = v156;
      uint64_t v72 = sub_100029520();
      id v159 = (id)sub_10002060C(v72, v73, v161);
      sub_1000292C0();
      swift_bridgeObjectRelease();
      NSString v74 = *(unsigned char **)(v47 + 8);
      ((void (*)(unsigned char *, uint64_t))v74)(v71, v49);
      _os_log_impl((void *)&_mh_execute_header, v63, (os_log_type_t)v135, "Poster with look %s generated uuid of %s in the editor", (uint8_t *)v67, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100014DB4((uint64_t)v61);
      NSString v74 = *(unsigned char **)(v47 + 8);
      ((void (*)(unsigned char *, uint64_t))v74)(v42, v49);
    }

    swift_bridgeObjectRetain_n();
    uint64_t v75 = sub_100028F80();
    os_log_type_t v76 = sub_100029200();
    if (os_log_type_enabled(v75, v76))
    {
      char v156 = v74;
      uint64_t v77 = swift_slowAlloc();
      v161[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v77 = 136315138;
      os_log_t v147 = (os_log_t)(v77 + 4);
      swift_bridgeObjectRetain();
      uint64_t v78 = sub_100029020();
      unint64_t v80 = v79;
      swift_bridgeObjectRelease();
      id v159 = (id)sub_10002060C(v78, v80, v161);
      sub_1000292C0();
      swift_bridgeObjectRelease_n();
      NSString v74 = v156;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v75, v76, "finalizeWithCompletion — will attempt to finalize with userInfo: %s", (uint8_t *)v77, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v81 = v152;
    uint64_t v82 = v149;
    uint64_t v83 = v148;
    sub_100014D50((uint64_t)v153, (uint64_t)v148, &qword_10003BF08);
    if (v139(v83, 1, v81) == 1)
    {
      sub_100014E64((uint64_t)v83, &qword_10003BF08);
      goto LABEL_36;
    }
    uint64_t v84 = v146;
    v140(v146, v83, v81);
    id v85 = objc_allocWithZone((Class)NSUserDefaults);
    NSString v86 = sub_100029070();
    id v87 = [v85 initWithSuiteName:v86];

    if (v87)
    {
      id v88 = [v82 currentLook];
      unint64_t v89 = (uint64_t *)&v155[OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_contentViewForLook];
      swift_beginAccess();
      uint64_t v90 = *v89;
      swift_bridgeObjectRetain();
      int v91 = (char *)sub_100023F50(v88, v90);

      swift_bridgeObjectRelease();
      if (v91)
      {
        uint64_t v92 = *(void *)&v91[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_animationDriver];
        swift_retain();

        if (v92)
        {
          char v156 = v74;
          double v94 = *(double *)(v92 + 80);
          double v93 = *(double *)(v92 + 88);
          sub_10001549C(&qword_10003BF38, (void (*)(uint64_t))&type metadata accessor for UUID);
          id v159 = (id)sub_100029520();
          uint64_t v160 = v95;
          v163._countAndFlagsBits = 0x6F697461746F722DLL;
          v163._object = (void *)0xE90000000000006ELL;
          sub_100029110(v163);
          NSString v96 = sub_100029070();
          swift_bridgeObjectRelease();
          [v87 setDouble:v96 forKey:v93];

          id v159 = (id)sub_100029520();
          uint64_t v160 = v97;
          v164._object = (void *)0xE900000000000073;
          v164._countAndFlagsBits = 0x736572676F72702DLL;
          sub_100029110(v164);
          NSString v98 = sub_100029070();
          swift_bridgeObjectRelease();
          [v87 setDouble:v98 forKey:v94];

          id v99 = v145;
          v137(v145, v84, v81);
          id v100 = v144;
          sub_1000126C0((uint64_t)v153, (uint64_t)v144);
          double v101 = sub_100028F80();
          os_log_type_t v102 = sub_100029200();
          int v103 = v102;
          if (os_log_type_enabled(v101, v102))
          {
            uint64_t v104 = swift_slowAlloc();
            char v155 = (char *)swift_slowAlloc();
            id v159 = v155;
            *(_DWORD *)uint64_t v104 = 134218754;
            uint64_t v157 = *(void *)&v94;
            sub_1000292C0();
            *(_WORD *)(v104 + 12) = 2048;
            uint64_t v157 = *(void *)&v93;
            uint64_t v141 = &v158;
            sub_1000292C0();
            *(_WORD *)(v104 + 22) = 2080;
            os_log_t v147 = v101;
            uint64_t v105 = sub_100029520();
            uint64_t v157 = sub_10002060C(v105, v106, (uint64_t *)&v159);
            sub_1000292C0();
            swift_bridgeObjectRelease();
            Swift::String v148 = (unsigned char *)(v151 + 8);
            LODWORD(v145) = v103;
            double v107 = v156;
            ((void (*)(unsigned char *, uint64_t))v156)(v99, v152);
            *(_WORD *)(v104 + 32) = 2080;
            uint64_t v140 = (void (*)(unsigned char *, unsigned char *, uint64_t))(v104 + 34);
            sub_100017B60();
            uint64_t v108 = sub_1000290F0();
            unint64_t v110 = v109;
            swift_bridgeObjectRelease();
            uint64_t v111 = v108;
            NSString v74 = v107;
            uint64_t v157 = sub_10002060C(v111, v110, (uint64_t *)&v159);
            uint64_t v82 = v149;
            sub_1000292C0();
            swift_bridgeObjectRelease();
            sub_100014DB4((uint64_t)v100);
            os_log_t v112 = v147;
            _os_log_impl((void *)&_mh_execute_header, v147, (os_log_type_t)v145, "Path progress of %f and rotation of %f were saved for %s for look %s", (uint8_t *)v104, 0x2Au);
            swift_arrayDestroy();
            swift_slowDealloc();
            uint64_t v81 = v152;
            swift_slowDealloc();
            swift_release();
          }
          else
          {
            swift_release();

            sub_100014DB4((uint64_t)v100);
            long long v133 = v99;
            NSString v74 = v156;
            ((void (*)(unsigned char *, uint64_t))v156)(v133, v81);
          }
          ((void (*)(unsigned char *, uint64_t))v74)(v146, v81);
LABEL_36:
          id v113 = objc_msgSend(objc_msgSend(v82, "environment"), "targetConfiguration");
          swift_unknownObjectRelease();
          Class isa = sub_100029000().super.isa;
          swift_bridgeObjectRelease();
          id v159 = 0;
          unsigned int v115 = [v113 storeUserInfo:isa error:&v159];

          id v116 = v159;
          if (v115
            && (id v117 = v159,
                v118 = objc_msgSend(objc_msgSend(v82, "environment"), "targetConfiguration"), swift_unknownObjectRelease(), v159 = 0, v119 = objc_msgSend(v118, "loadUserInfoWithError:", &v159), v118, id v116 = v159, v119))
          {
            sub_100029010();
            id v120 = v116;

            swift_bridgeObjectRetain();
            id v121 = sub_100028F80();
            os_log_type_t v122 = sub_100029200();
            if (os_log_type_enabled(v121, v122))
            {
              char v156 = v74;
              uint64_t v123 = (uint8_t *)swift_slowAlloc();
              id v159 = (id)swift_slowAlloc();
              *(_DWORD *)uint64_t v123 = 136315138;
              swift_bridgeObjectRetain();
              uint64_t v124 = sub_100029020();
              unint64_t v126 = v125;
              swift_bridgeObjectRelease();
              uint64_t v157 = sub_10002060C(v124, v126, (uint64_t *)&v159);
              sub_1000292C0();
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v121, v122, "Successfully stored userInfo: %s", v123, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              ((void (*)(unsigned char *, uint64_t))v156)(v150, v152);
LABEL_45:
              sub_100014DB4((uint64_t)v153);
              return (*(uint64_t (**)(void))(v154 + 16))();
            }
            swift_bridgeObjectRelease_n();
          }
          else
          {
            id v127 = v116;
            sub_100028D20();

            swift_willThrow();
            swift_errorRetain();
            swift_errorRetain();
            uint64_t v128 = sub_100028F80();
            os_log_type_t v129 = sub_100029210();
            if (os_log_type_enabled(v128, v129))
            {
              id v130 = (uint8_t *)swift_slowAlloc();
              id v159 = (id)swift_slowAlloc();
              *(_DWORD *)id v130 = 136315138;
              swift_getErrorValue();
              uint64_t v131 = sub_100029570();
              uint64_t v157 = sub_10002060C(v131, v132, (uint64_t *)&v159);
              sub_1000292C0();
              swift_bridgeObjectRelease();
              swift_errorRelease();
              swift_errorRelease();
              _os_log_impl((void *)&_mh_execute_header, v128, v129, "Failed to store userInfo in editor.environment.targetConfiguration. %s", v130, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              swift_errorRelease();
              ((void (*)(unsigned char *, uint64_t))v74)(v150, v152);
              goto LABEL_45;
            }

            swift_errorRelease();
            swift_errorRelease();
            swift_errorRelease();
          }
          ((void (*)(unsigned char *, uint64_t))v74)(v150, v81);
          goto LABEL_45;
        }
      }
    }
    ((void (*)(unsigned char *, uint64_t))v74)(v84, v81);
    goto LABEL_36;
  }
  uint64_t v44 = &qword_10003C040;
  uint64_t v45 = (uint64_t)v16;
LABEL_9:
  sub_100014E64(v45, v44);
LABEL_10:
  if (qword_10003BD98 != -1) {
    swift_once();
  }
  uint64_t v50 = sub_100028FA0();
  sub_10000E6C0(v50, (uint64_t)qword_10003D6B8);
  unint64_t v51 = sub_100028F80();
  os_log_type_t v52 = sub_100029210();
  if (os_log_type_enabled(v51, v52))
  {
    id v53 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v53 = 0;
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "Unable to finalize; failed to retrieve userInfo", v53, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(void))(v154 + 16))();
}

id sub_100014300()
{
  uint64_t v1 = v0;
  if (qword_10003BD98 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100028FA0();
  sub_10000E6C0(v2, (uint64_t)qword_10003D6B8);
  uint64_t v3 = sub_100028F80();
  os_log_type_t v4 = sub_1000291F0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "PosterEditor invalidated", v5, 2u);
    swift_slowDealloc();
  }

  swift_unknownObjectWeakAssign();
  id result = *(id *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_contentView);
  if (result)
  {
    return [result removeFromSuperview];
  }
  return result;
}

uint64_t sub_100014428()
{
  uint64_t v0 = sub_10000E274(&qword_10003BF08);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v66 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v66 = (uint64_t)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v66 - v6;
  uint64_t v8 = sub_100028DB0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for WatchFacesWallpaperSupportFeatureFlags.catskill(_:), v8);
  char v12 = sub_100028DA0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) == 0)
  {
    id v42 = objc_allocWithZone((Class)PREditingLook);
    NSString v43 = sub_100029070();
    NSString v44 = sub_100029070();
    id v45 = [v42 initWithIdentifier:v43 displayName:v44];

    sub_10000E274(&qword_10003BEF0);
    uint64_t v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_10002BF80;
    *(void *)(v46 + 32) = v45;
    v72[0] = v46;
    sub_100029170();
    return v72[0];
  }
  unint64_t v73 = (unint64_t)sub_1000221FC();
  sub_10000E274((uint64_t *)&unk_10003BF10);
  sub_100028EA0();
  sub_100014D50((uint64_t)v7, (uint64_t)v2, &qword_10003BF08);
  uint64_t v13 = sub_100028D40();
  int v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v2, 1, v13);
  sub_100014E64((uint64_t)v2, &qword_10003BF08);
  if (v14 == 1) {
    goto LABEL_23;
  }
  unint64_t v15 = v73;
  if (v73 >> 62) {
    goto LABEL_40;
  }
  uint64_t v16 = *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v16)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    if (qword_10003BD98 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_100028FA0();
    sub_10000E6C0(v32, (uint64_t)qword_10003D6B8);
    uint64_t v33 = v66;
    sub_1000126C0((uint64_t)v7, v66);
    uint64_t v34 = sub_100028F80();
    os_log_type_t v35 = sub_100029220();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      v72[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136315394;
      sub_100017478();
      uint64_t v71 = sub_10002060C(v37, v38, v72);
      sub_1000292C0();
      swift_bridgeObjectRelease();
      sub_100014DB4(v33);
      *(_WORD *)(v36 + 12) = 2080;
      swift_beginAccess();
      sub_100014F80(0, &qword_10003BF00);
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_100029160();
      unint64_t v41 = v40;
      swift_bridgeObjectRelease();
      uint64_t v70 = sub_10002060C(v39, v41, v72);
      sub_1000292C0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Editing an existing poster, but failed to find a look identifier to replace. Target: %s All Looks: %s", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_100014DB4(v33);
    }
LABEL_23:
    uint64_t v48 = (uint64_t)v7;
LABEL_38:
    sub_100014DB4(v48);
    swift_beginAccess();
    return v73;
  }
LABEL_5:
  unint64_t v68 = v15 & 0xC000000000000001;
  uint64_t v17 = 4;
  while (1)
  {
    uint64_t v18 = v17 - 4;
    if (v68)
    {
      id v19 = (id)sub_100029380();
      uint64_t v20 = v17 - 3;
      if (__OFADD__(v18, 1)) {
        goto LABEL_39;
      }
    }
    else
    {
      id v19 = *(id *)(v15 + 8 * v17);
      uint64_t v20 = v17 - 3;
      if (__OFADD__(v18, 1))
      {
LABEL_39:
        __break(1u);
LABEL_40:
        swift_bridgeObjectRetain();
        uint64_t v16 = sub_100029470();
        if (!v16) {
          goto LABEL_17;
        }
        goto LABEL_5;
      }
    }
    uint64_t v69 = v20;
    unint64_t v67 = v17 - 4;
    uint64_t v21 = v19;
    id v22 = [v19 displayName];
    uint64_t v23 = sub_100029080();
    uint64_t v25 = v24;

    uint64_t v26 = v7;
    sub_100017B60();
    uint64_t v27 = sub_1000290F0();
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    if (v23 == v27 && v25 == v29) {
      break;
    }
    char v31 = sub_100029540();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v31)
    {
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
    ++v17;
    uint64_t v7 = v26;
    if (v69 == v16) {
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();

LABEL_26:
  uint64_t v49 = (uint64_t)v26;
  sub_100017478();
  sub_100017B60();
  sub_1000290F0();
  swift_bridgeObjectRelease();
  id v50 = objc_allocWithZone((Class)PREditingLook);
  NSString v51 = sub_100029070();
  swift_bridgeObjectRelease();
  NSString v52 = sub_100029070();
  swift_bridgeObjectRelease();
  id v53 = [v50 initWithIdentifier:v51 displayName:v52];

  unint64_t v54 = v73;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t v73 = v54;
  unint64_t v56 = v67;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v54 & 0x8000000000000000) != 0
    || (v54 & 0x4000000000000000) != 0)
  {
    unint64_t v54 = sub_1000127A4(v54);
    unint64_t v73 = v54;
  }
  uint64_t v57 = v54 & 0xFFFFFFFFFFFFFF8;
  if (v56 >= *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
  }
  else
  {
    unint64_t v58 = *(void **)(v57 + 8 * v17);
    *(void *)(v57 + 8 * v17) = v53;

    sub_100029170();
    if (qword_10003BD98 == -1) {
      goto LABEL_32;
    }
  }
  swift_once();
LABEL_32:
  uint64_t v59 = sub_100028FA0();
  sub_10000E6C0(v59, (uint64_t)qword_10003D6B8);
  uint64_t v60 = sub_100028F80();
  os_log_type_t v61 = sub_100029200();
  if (!os_log_type_enabled(v60, v61))
  {
LABEL_37:

    uint64_t v48 = v49;
    goto LABEL_38;
  }
  uint64_t v62 = swift_slowAlloc();
  char v63 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v62 = 134218242;
  v72[0] = v56;
  sub_1000292C0();
  *(_WORD *)(v62 + 12) = 2112;
  uint64_t result = swift_beginAccess();
  if ((v73 & 0xC000000000000001) != 0)
  {
    id v64 = (id)sub_100029380();
LABEL_36:
    uint64_t v65 = (uint64_t)v64;
    swift_endAccess();
    v72[0] = v65;
    sub_1000292C0();
    *char v63 = v65;
    _os_log_impl((void *)&_mh_execute_header, v60, v61, "Kaleidoscope loaded all looks, and replaced position %ld with %@ and should be editing an existing poster.", (uint8_t *)v62, 0x16u);
    sub_10000E274((uint64_t *)&unk_10003BDE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    goto LABEL_37;
  }
  if (v56 < *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v64 = *(id *)(v73 + 8 * v17);
    goto LABEL_36;
  }
  __break(1u);
  return result;
}

uint64_t sub_100014D50(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000E274(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100014DB4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for KaleidoscopePosterData();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100014E10(uint64_t a1)
{
  return a1;
}

uint64_t sub_100014E64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000E274(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100014EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100014F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for KaleidoscopePosterData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014F80(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100014FBC(void *a1, void *a2)
{
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_jewelLookNames);
  swift_bridgeObjectRetain();
  id v6 = [a2 displayName];
  uint64_t v7 = sub_100029080();
  uint64_t v9 = v8;

  LOBYTE(v7) = sub_100024248(v7, v9, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_shouldShowAppearanceMenuButton) = v7 & 1;
  [a1 updateActions];
  id v35 = a1;
  id v10 = [a1 environment];
  swift_getObjectType();
  id v34 = sub_100018BFC(v10, *(void *)(v2+ OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_currentlySelectedAppearanceStyle));
  swift_unknownObjectRelease();
  unint64_t v11 = (unint64_t)sub_1000221FC();
  unint64_t v12 = v11;
  if (v11 >> 62)
  {
    uint64_t v13 = sub_100029470();
    if (v13) {
      goto LABEL_3;
    }
LABEL_35:
    return swift_bridgeObjectRelease();
  }
  uint64_t v13 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v13) {
    goto LABEL_35;
  }
LABEL_3:
  uint64_t result = sub_100014F80(0, (unint64_t *)&qword_10003BF30);
  if (v13 >= 1)
  {
    unint64_t v15 = (uint64_t *)(v2
                    + OBJC_IVAR____TtC18KaleidoscopePoster24KaleidoscopePosterEditor_editorContentViewsForEditingLooks);
    unint64_t v16 = v12 & 0xC000000000000001;
    swift_beginAccess();
    uint64_t v17 = 0;
    while (1)
    {
      id v18 = v16 ? (id)sub_100029380() : *(id *)(v12 + 8 * v17 + 32);
      id v19 = v18;
      if ((sub_100029290() & 1) == 0)
      {
        id v20 = [v35 currentLook];
        char v21 = sub_100029290();

        if ((v21 & 1) == 0) {
          break;
        }
      }
      uint64_t v22 = *v15;
      if ((*v15 & 0xC000000000000001) != 0)
      {
        id v23 = v19;
        swift_bridgeObjectRetain();
        if (!sub_100029430()) {
          goto LABEL_5;
        }
        type metadata accessor for KaleidoscopeEditorContentView();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v24 = v36;
        swift_unknownObjectRelease();
      }
      else
      {
        if (!*(void *)(v22 + 16)) {
          goto LABEL_30;
        }
        id v23 = v19;
        swift_bridgeObjectRetain();
        unint64_t v25 = sub_100026EC8((uint64_t)v23);
        if ((v26 & 1) == 0) {
          goto LABEL_5;
        }
        id v24 = *(id *)(*(void *)(v22 + 56) + 8 * v25);
      }

      swift_bridgeObjectRelease();
      if (!v24) {
        goto LABEL_29;
      }
      id v23 = (id)sub_100025324(v19, (uint64_t)v34);
      uint64_t v27 = (void *)sub_1000258A4(v19, (uint64_t)v34);
      sub_1000195C8((uint64_t)v34, v23, v27);

      unint64_t v16 = v12 & 0xC000000000000001;
LABEL_6:
      ++v17;

      if (v13 == v17) {
        return swift_bridgeObjectRelease();
      }
    }
    uint64_t v28 = *v15;
    if ((*v15 & 0xC000000000000001) != 0)
    {
      id v23 = v19;
      swift_bridgeObjectRetain();
      if (sub_100029430())
      {
        type metadata accessor for KaleidoscopeEditorContentView();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        uint64_t v29 = v36;
        swift_unknownObjectRelease();
        goto LABEL_26;
      }
    }
    else
    {
      if (!*(void *)(v28 + 16))
      {
LABEL_30:
        id v23 = v19;
        goto LABEL_6;
      }
      id v23 = v19;
      swift_bridgeObjectRetain();
      unint64_t v30 = sub_100026EC8((uint64_t)v23);
      if (v31)
      {
        uint64_t v29 = (char *)*(id *)(*(void *)(v28 + 56) + 8 * v30);
LABEL_26:

        swift_bridgeObjectRelease();
        if (v29)
        {
          uint64_t v32 = OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView;
          uint64_t v33 = *(void **)&v29[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView];
          if (v33)
          {
            [v33 removeFromSuperview];
            id v23 = *(id *)&v29[v32];
          }
          else
          {
            id v23 = 0;
          }
          *(void *)&v29[v32] = 0;

          unint64_t v16 = v12 & 0xC000000000000001;
          goto LABEL_6;
        }
LABEL_29:
        id v23 = v19;
        unint64_t v16 = v12 & 0xC000000000000001;
        goto LABEL_6;
      }
    }
LABEL_5:

    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001549C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000154E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000E274(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

id sub_10001554C()
{
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster31KaleidoscopeRenderingController_coordinator] = 0;
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for KaleidoscopeRenderingController();
  id v1 = objc_msgSendSuper2(&v9, "init");
  uint64_t v2 = qword_10003BDA0;
  id v3 = v1;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100028FA0();
  sub_10000E6C0(v4, (uint64_t)qword_10003D6D0);
  uint64_t v5 = sub_100028F80();
  os_log_type_t v6 = sub_1000291F0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "PosterRenderer created", v7, 2u);
    swift_slowDealloc();
  }

  return v3;
}

id sub_100015684()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KaleidoscopeRenderingController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for KaleidoscopeRenderingController()
{
  return self;
}

uint64_t sub_1000156EC(void *a1, void *a2)
{
  id v46 = a1;
  uint64_t v3 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v45 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v48 = (uint64_t)&v43 - v7;
  uint64_t v8 = sub_10000E274(&qword_10003C040);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  unint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  int v14 = (char *)&v43 - v13;
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)&v43 - v15;
  id v44 = [a2 deviceOrientation];
  id v17 = [a2 contents];
  swift_getObjectType();
  sub_1000161E0(&qword_10003C048);
  sub_1000161E0(&qword_10003C050);
  sub_100029240();
  swift_unknownObjectRelease();
  sub_100016224((uint64_t)v16, (uint64_t)v14);
  uint64_t v18 = v4;
  id v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48);
  int v20 = v19(v14, 1, v3);
  sub_100014E64((uint64_t)v14, &qword_10003C040);
  if (v20 == 1)
  {
    char v21 = v19;
    id v22 = [a2 contents];
    v51[0] = 0;
    id v23 = [v22 loadUserInfoWithError:v51];
    swift_unknownObjectRelease();
    id v24 = v51[0];
    if (v23)
    {
      uint64_t v25 = sub_100029010();
      id v26 = v24;

      uint64_t v49 = 0x746E6169726176;
      unint64_t v50 = 0xE700000000000000;
      sub_100029320();
      if (*(void *)(v25 + 16))
      {
        unint64_t v27 = sub_100026F0C((uint64_t)v51);
        id v19 = v21;
        if (v28)
        {
          sub_100014EC0(*(void *)(v25 + 56) + 32 * v27, (uint64_t)&v52);
        }
        else
        {
          long long v52 = 0u;
          long long v53 = 0u;
        }
      }
      else
      {
        long long v52 = 0u;
        long long v53 = 0u;
        id v19 = v21;
      }
      swift_bridgeObjectRelease();
      sub_100014E10((uint64_t)v51);
      if (*((void *)&v53 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v30 = v49;
          sub_100014E64((uint64_t)v16, &qword_10003C040);
          uint64_t v31 = sub_100028D40();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v16, 1, 1, v31);
          *(void *)&v16[*(int *)(v3 + 20)] = 0;
          *(void *)&v16[*(int *)(v3 + 24)] = v30;
          (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v16, 0, 1, v3);
        }
      }
      else
      {
        sub_100014E64((uint64_t)&v52, &qword_10003BF20);
      }
    }
    else
    {
      id v29 = v51[0];
      sub_100028D20();

      swift_willThrow();
      swift_errorRelease();
      id v19 = v21;
    }
  }
  sub_100016224((uint64_t)v16, (uint64_t)v11);
  if (v19(v11, 1, v3) == 1)
  {
    sub_100014E64((uint64_t)v11, &qword_10003C040);
    if (qword_10003BDA0 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_100028FA0();
    sub_10000E6C0(v32, (uint64_t)qword_10003D6D0);
    uint64_t v33 = sub_100028F80();
    os_log_type_t v34 = sub_100029200();
    if (os_log_type_enabled(v33, v34))
    {
      id v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Kaleidoscope completely failed to load posterData during initialization", v35, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    uint64_t v36 = v48;
    sub_100014F1C((uint64_t)v11, v48);
    uint64_t v37 = v45;
    sub_1000126C0(v36, v45);
    type metadata accessor for KaleidoscopeRenderingCoordinator();
    swift_allocObject();
    id v38 = v46;
    uint64_t v39 = sub_10001D6B8(v38, v37, v44);

    uint64_t v40 = OBJC_IVAR____TtC18KaleidoscopePoster31KaleidoscopeRenderingController_coordinator;
    uint64_t v41 = v47;
    *(void *)(v47 + OBJC_IVAR____TtC18KaleidoscopePoster31KaleidoscopeRenderingController_coordinator) = v39;
    swift_release();
    if (*(void *)(v41 + v40))
    {
      swift_retain();
      if (!UIAccessibilityIsReduceMotionEnabled())
      {
        sub_100028F00();
        sub_10001A80C(v38);
      }
      swift_release();
    }
    sub_100014DB4(v36);
  }
  return sub_100014E64((uint64_t)v16, &qword_10003C040);
}

uint64_t sub_100015EA4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100028DB0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for WatchFacesWallpaperSupportFeatureFlags.catskill(_:), v4);
  char v8 = sub_100028DA0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) != 0
    && *(void *)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster31KaleidoscopeRenderingController_coordinator))
  {
    swift_retain();
    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      sub_100028F00();
      sub_10001A80C(a1);
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_100015FFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100028DB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for WatchFacesWallpaperSupportFeatureFlags.catskill(_:), v2);
  char v6 = sub_100028DA0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    if (qword_10003BDA0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_100028FA0();
    sub_10000E6C0(v8, (uint64_t)qword_10003D6D0);
    uint64_t v9 = sub_100028F80();
    os_log_type_t v10 = sub_1000291F0();
    if (os_log_type_enabled(v9, v10))
    {
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "PosterRenderer invalidate", v11, 2u);
      swift_slowDealloc();
    }

    uint64_t v12 = OBJC_IVAR____TtC18KaleidoscopePoster31KaleidoscopeRenderingController_coordinator;
    if (*(void *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster31KaleidoscopeRenderingController_coordinator))
    {
      swift_retain();
      sub_10001CA44();
      swift_release();
    }
    *(void *)(v1 + v12) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_1000161E0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for KaleidoscopePosterData();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100016224(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E274(&qword_10003C040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001628C(uint64_t a1)
{
  return sub_1000162F8(a1, qword_10003D6B8);
}

uint64_t sub_1000162AC(uint64_t a1)
{
  return sub_1000162F8(a1, qword_10003D6D0);
}

uint64_t sub_1000162D0(uint64_t a1)
{
  return sub_1000162F8(a1, qword_10003D6E8);
}

uint64_t sub_1000162F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100028FA0();
  sub_100016870(v3, a2);
  sub_10000E6C0(v3, (uint64_t)a2);
  return sub_100028F90();
}

uint64_t sub_100016370@<X0>(uint64_t *a1@<X8>)
{
  sub_100028FE0();
  swift_allocObject();
  sub_100028FF0();
  sub_100028FB0();
  swift_allocObject();
  swift_retain();
  sub_100028FC0();
  sub_10000E274(&qword_10003C078);
  sub_100028D60();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10002C080;
  sub_100016828(&qword_10003C080, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_100028D50();
  sub_100016828(&qword_10003C088, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_100028D50();
  swift_release_n();
  uint64_t result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_100016598()
{
  return sub_1000165C8((uint64_t (*)(void))type metadata accessor for KaleidoscopeRenderingController);
}

id sub_1000165B0()
{
  return sub_1000165C8((uint64_t (*)(void))type metadata accessor for KaleidoscopePosterEditor);
}

id sub_1000165C8(uint64_t (*a1)(void))
{
  id v1 = objc_allocWithZone((Class)a1(0));
  return [v1 init];
}

uint64_t sub_10001660C()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100016744()
{
  unint64_t result = qword_10003C058;
  if (!qword_10003C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C058);
  }
  return result;
}

uint64_t sub_100016798(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PosterExtension()
{
  return &type metadata for PosterExtension;
}

uint64_t sub_1000167F0()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_100016828(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_100016870(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000168D4()
{
  return sub_100016908(&qword_10003C090);
}

uint64_t sub_100016908(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100016798(&qword_10003C068);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_100016950(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100028D40();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_10000E274(&qword_10003BF08);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v11) = *(uint64_t *)((char *)a2 + v11);
  }
  return a1;
}

uint64_t sub_100016AD0(uint64_t a1)
{
  uint64_t v2 = sub_100028D40();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

char *sub_100016BA0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100028D40();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_10000E274(&qword_10003BF08);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  return a1;
}

char *sub_100016CD0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100028D40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_10000E274(&qword_10003BF08);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *sub_100016E68(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100028D40();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_10000E274(&qword_10003BF08);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  return a1;
}

char *sub_100016F98(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100028D40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_10000E274(&qword_10003BF08);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  return a1;
}

uint64_t sub_10001712C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100017140);
}

uint64_t sub_100017140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E274(&qword_10003BF08);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_1000171B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000171C4);
}

uint64_t sub_1000171C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E274(&qword_10003BF08);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for KaleidoscopePosterData()
{
  uint64_t result = qword_10003C0F0;
  if (!qword_10003C0F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100017284()
{
  sub_100017320();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100017320()
{
  if (!qword_10003C100)
  {
    sub_100028D40();
    unint64_t v0 = sub_1000292B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10003C100);
    }
  }
}

uint64_t sub_100017378(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 1684632949;
    }
    else {
      unint64_t v3 = 0xD000000000000016;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE400000000000000;
    }
    else {
      unint64_t v4 = 0x800000010002D3C0;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 1684632949;
      }
      else {
        unint64_t v6 = 0xD000000000000016;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE400000000000000;
      }
      else {
        unint64_t v7 = 0x800000010002D3C0;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE700000000000000;
    unint64_t v3 = 0x746E6169726176;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE700000000000000;
  if (v3 != 0x746E6169726176)
  {
LABEL_21:
    char v8 = sub_100029540();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_100017478()
{
  sub_1000290C0();
  __chkstk_darwin();
  sub_100028CD0();
  __chkstk_darwin();
  sub_100028D10();
  swift_allocObject();
  sub_100028D00();
  sub_10000E274(&qword_10003C140);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10002BC90;
  sub_100028CC0();
  sub_1000191EC(&qword_10003C148, (void (*)(uint64_t))&type metadata accessor for JSONEncoder.OutputFormatting);
  sub_10000E274(&qword_10003C150);
  sub_100018B48();
  sub_1000292E0();
  sub_100028CE0();
  uint64_t v1 = type metadata accessor for KaleidoscopePosterData();
  sub_1000191EC(&qword_10003C050, (void (*)(uint64_t))type metadata accessor for KaleidoscopePosterData);
  uint64_t v3 = sub_100028CF0();
  unint64_t v5 = v4;
  sub_1000290B0();
  sub_100029090();
  uint64_t v7 = v6;
  sub_100018BA4(v3, v5);
  if (v7)
  {
    swift_release();
    return;
  }
  unint64_t v2 = *(void *)(v0 + *(int *)(v1 + 24));
  sub_10000CDF0(v2);
  v8._countAndFlagsBits = 45;
  v8._object = (void *)0xE100000000000000;
  sub_100029110(v8);
  v9._countAndFlagsBits = sub_100029520();
  sub_100029110(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 45;
  v10._object = (void *)0xE100000000000000;
  sub_100029110(v10);
  if (qword_10003BD90 == -1)
  {
    if ((v2 & 0x8000000000000000) == 0) {
      goto LABEL_4;
    }
  }
  else
  {
    swift_once();
    if ((v2 & 0x8000000000000000) == 0)
    {
LABEL_4:
      if (v2 < *(void *)(qword_10003D688 + 16))
      {
        v11._countAndFlagsBits = sub_100029520();
        sub_100029110(v11);
        swift_release();
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
}

uint64_t sub_100017808(char a1)
{
  if (!a1) {
    return 0x746E6169726176;
  }
  if (a1 == 1) {
    return 1684632949;
  }
  return 0xD000000000000016;
}

uint64_t sub_10001785C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100017378(*a1, *a2);
}

Swift::Int sub_100017868()
{
  return sub_100017870();
}

Swift::Int sub_100017870()
{
  return sub_1000295A0();
}

uint64_t sub_100017910()
{
  return sub_100017918();
}

uint64_t sub_100017918()
{
  sub_100029100();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000179A0()
{
  return sub_1000179A8();
}

Swift::Int sub_1000179A8()
{
  return sub_1000295A0();
}

uint64_t sub_100017A44@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000194F0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100017A74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100017808(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100017AA0()
{
  return sub_100017808(*v0);
}

uint64_t sub_100017AA8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000194F0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100017AD0()
{
  return 0;
}

void sub_100017ADC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_100017AE8(uint64_t a1)
{
  unint64_t v2 = sub_100018CA8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100017B24(uint64_t a1)
{
  unint64_t v2 = sub_100018CA8();
  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_100017B60()
{
  sub_100029350(29);
  swift_bridgeObjectRelease();
  unint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for KaleidoscopePosterData() + 24));
  sub_10000CDF0(v1);
  uint64_t v2 = sub_1000290E0();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = v2;
  v10._object = v4;
  sub_100029110(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 95;
  v11._object = (void *)0xE100000000000000;
  sub_100029110(v11);
  if (qword_10003BD90 == -1)
  {
    if ((v1 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  swift_once();
  if ((v1 & 0x8000000000000000) != 0) {
    goto LABEL_9;
  }
LABEL_3:
  if (v1 >= *(void *)(qword_10003D688 + 16))
  {
LABEL_10:
    __break(1u);
    return;
  }
  uint64_t v5 = *(void *)(qword_10003D688 + 8 * v1 + 32);
  if ((unint64_t)(v5 - 34) > 0xFFFFFFFFFFFFFFF9)
  {
    sub_10000E604(v5);
  }
  else
  {
    uint64_t v6 = sub_10000CF48(v1);
    sub_10001E5FC(v6);
  }
  uint64_t v7 = sub_1000290E0();
  Swift::String v9 = v8;
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = v7;
  v12._object = v9;
  sub_100029110(v12);
  swift_bridgeObjectRelease();
}

uint64_t sub_100017CCC()
{
  sub_100017478();
  uint64_t v6 = v1;
  v7._countAndFlagsBits = 45;
  v7._object = (void *)0xE100000000000000;
  sub_100029110(v7);
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for KaleidoscopePosterData() + 24));
  if (qword_10003BD58 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_10003D648;
  if (qword_10003D648 <= v2) {
    uint64_t v3 = v2;
  }
  if (qword_10003D650 >= v3) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = qword_10003D650;
  }
  v8._countAndFlagsBits = sub_10000DAD4(v4);
  sub_100029110(v8);
  swift_bridgeObjectRelease();
  return v6;
}

id sub_100017D84(uint64_t a1, unint64_t a2)
{
  if (qword_10003BDA8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100028FA0();
  sub_10000E6C0(v4, (uint64_t)qword_10003D6E8);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_100028F80();
  os_log_type_t v6 = sub_100029200();
  if (os_log_type_enabled(v5, v6))
  {
    Swift::String v7 = (uint8_t *)swift_slowAlloc();
    v36[0] = swift_slowAlloc();
    *(_DWORD *)Swift::String v7 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_10002060C(a1, a2, v36);
    sub_1000292C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "provideAtlasBacking for: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (qword_10003BDB0 != -1) {
    swift_once();
  }
  Swift::String v8 = &unk_10003D000;
  id v9 = (id)qword_10003D700;
  NSString v10 = sub_100029070();
  NSString v11 = sub_100029070();
  id v12 = [v9 pathForResource:v10 ofType:v11];

  if (v12)
  {
    uint64_t v13 = sub_100029080();
    unint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    unint64_t v15 = 0;
  }
  swift_bridgeObjectRetain_n();
  unint64_t v16 = sub_100028F80();
  os_log_type_t v17 = sub_100029200();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    v36[1] = v15;
    uint64_t v37 = v19;
    *(_DWORD *)uint64_t v18 = 136315138;
    v36[0] = v13;
    swift_bridgeObjectRetain();
    sub_10000E274(&qword_10003C198);
    uint64_t v20 = sub_1000290D0();
    v36[0] = sub_10002060C(v20, v21, &v37);
    sub_1000292C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "artPath: %s", v18, 0xCu);
    swift_arrayDestroy();
    Swift::String v8 = (void *)&unk_10003D000;
    swift_slowDealloc();
    swift_slowDealloc();

    if (v15)
    {
LABEL_13:
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      id v22 = sub_100028F80();
      os_log_type_t v23 = sub_100029200();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = swift_slowAlloc();
        v36[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_10002060C(a1, a2, v36);
        sub_1000292C0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v24 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_10002060C(v13, v15, v36);
        sub_1000292C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "using artwork %s at %s", (uint8_t *)v24, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      swift_bridgeObjectRetain();
      NSString v32 = sub_100029070();
      swift_bridgeObjectRelease();
      NSString v31 = sub_100029070();
      swift_bridgeObjectRelease();
      id v33 = [self atlasBackingWithArt:v32 uuid:v31];
      goto LABEL_21;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (v15) {
      goto LABEL_13;
    }
  }
  uint64_t v25 = sub_100028F80();
  os_log_type_t v26 = sub_100029200();
  if (os_log_type_enabled(v25, v26))
  {
    unint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "no artPathname!", v27, 2u);
    swift_slowDealloc();
  }

  char v28 = (void *)v8[224];
  swift_bridgeObjectRetain();
  id v29 = v28;
  NSString v30 = sub_100029070();
  swift_bridgeObjectRelease();
  NSString v31 = [self imageNamed:v30 inBundle:v29 withConfiguration:0];

  swift_bridgeObjectRetain();
  NSString v32 = sub_100029070();
  swift_bridgeObjectRelease();
  id v33 = [self atlasBackingWithImage:v31 uuid:v32];
LABEL_21:
  id v34 = v33;

  return v34;
}

uint64_t sub_100018440(void *a1)
{
  uint64_t v3 = sub_10000E274(&qword_10003C178);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  os_log_type_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100018C64(a1, a1[3]);
  sub_100018CA8();
  sub_1000295C0();
  type metadata accessor for KaleidoscopePosterData();
  v8[15] = 0;
  sub_100029510();
  if (!v1)
  {
    v8[14] = 1;
    sub_100028D40();
    sub_1000191EC(&qword_10003C180, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_100029500();
    v8[13] = 2;
    sub_100029510();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100018624@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = sub_10000E274(&qword_10003BF08);
  __chkstk_darwin(v3 - 8);
  uint64_t v25 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10000E274(&qword_10003C160);
  uint64_t v24 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  os_log_type_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for KaleidoscopePosterData();
  __chkstk_darwin(v7);
  id v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100028D40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = *(int *)(v7 + 20);
  *(void *)&v9[v11] = 0;
  sub_100018C64(a1, a1[3]);
  sub_100018CA8();
  os_log_type_t v26 = v6;
  id v12 = v28;
  sub_1000295B0();
  if (v12)
  {
    sub_100018CFC((uint64_t)a1);
    return sub_100014E64((uint64_t)v9, &qword_10003BF08);
  }
  else
  {
    uint64_t v22 = v11;
    char v28 = a1;
    uint64_t v14 = v24;
    uint64_t v13 = (uint64_t)v25;
    char v31 = 0;
    unint64_t v15 = v26;
    uint64_t v16 = v27;
    *(void *)&v9[*(int *)(v7 + 24)] = sub_1000294F0();
    char v30 = 1;
    sub_1000191EC(&qword_10003C170, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_1000294E0();
    sub_100018D4C(v13, (uint64_t)v9);
    char v29 = 2;
    uint64_t v17 = sub_1000294F0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v15, v16);
    uint64_t v18 = v23;
    uint64_t v19 = (uint64_t)v28;
    *(void *)&v9[v22] = v17;
    sub_1000126C0((uint64_t)v9, v18);
    sub_100018CFC(v19);
    return sub_100014DB4((uint64_t)v9);
  }
}

uint64_t sub_100018968@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100028D40();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(a2, 1, 1, v4);
  uint64_t v6 = *(int *)(a1 + 24);
  *(void *)(a2 + *(int *)(a1 + 20)) = 0;
  *(void *)(a2 + v6) = 0;
  return result;
}

uint64_t sub_1000189DC()
{
  sub_100017B60();
  uint64_t v0 = sub_1000290F0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100018A3C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100018624(a1, a2);
}

uint64_t sub_100018A54(void *a1)
{
  return sub_100018440(a1);
}

uint64_t sub_100018A70()
{
  return sub_1000191EC(&qword_10003C048, (void (*)(uint64_t))type metadata accessor for KaleidoscopePosterData);
}

uint64_t sub_100018AB8()
{
  return sub_1000191EC(&qword_10003C050, (void (*)(uint64_t))type metadata accessor for KaleidoscopePosterData);
}

uint64_t sub_100018B00()
{
  return sub_1000191EC(&qword_10003C138, (void (*)(uint64_t))type metadata accessor for KaleidoscopePosterData);
}

unint64_t sub_100018B48()
{
  unint64_t result = qword_10003C158;
  if (!qword_10003C158)
  {
    sub_100016798(&qword_10003C150);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C158);
  }
  return result;
}

uint64_t sub_100018BA4(uint64_t a1, unint64_t a2)
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

id sub_100018BFC(void *a1, uint64_t a2)
{
  id v3 = [a1 traitCollection];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [v3 userInterfaceStyle];
  }
  else
  {
    id v5 = 0;
  }
  if (a2) {
    return (id)a2;
  }
  else {
    return v5;
  }
}

void *sub_100018C64(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100018CA8()
{
  unint64_t result = qword_10003C168;
  if (!qword_10003C168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C168);
  }
  return result;
}

uint64_t sub_100018CFC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100018D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E274(&qword_10003BF08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

BOOL sub_100018DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100028D40();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000E274(&qword_10003C188);
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000E274(&qword_10003BF08);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  unint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v27 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v27 - v19;
  uint64_t v27 = a1;
  sub_100019184(a1, (uint64_t)&v27 - v19);
  uint64_t v28 = a2;
  sub_100019184(a2, (uint64_t)v18);
  uint64_t v21 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_100019184((uint64_t)v20, (uint64_t)v11);
  sub_100019184((uint64_t)v18, v21);
  uint64_t v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v22((uint64_t)v11, 1, v4) != 1)
  {
    sub_100019184((uint64_t)v11, (uint64_t)v15);
    if (v22(v21, 1, v4) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v21, v4);
      sub_1000191EC(&qword_10003C190, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v23 = sub_100029060();
      uint64_t v24 = *(void (**)(char *, uint64_t))(v5 + 8);
      v24(v7, v4);
      sub_100014E64((uint64_t)v18, &qword_10003BF08);
      sub_100014E64((uint64_t)v20, &qword_10003BF08);
      v24(v15, v4);
      sub_100014E64((uint64_t)v11, &qword_10003BF08);
      if ((v23 & 1) == 0) {
        return 0;
      }
      goto LABEL_8;
    }
    sub_100014E64((uint64_t)v18, &qword_10003BF08);
    sub_100014E64((uint64_t)v20, &qword_10003BF08);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v4);
LABEL_6:
    sub_100014E64((uint64_t)v11, &qword_10003C188);
    return 0;
  }
  sub_100014E64((uint64_t)v18, &qword_10003BF08);
  sub_100014E64((uint64_t)v20, &qword_10003BF08);
  if (v22(v21, 1, v4) != 1) {
    goto LABEL_6;
  }
  sub_100014E64((uint64_t)v11, &qword_10003BF08);
LABEL_8:
  uint64_t v25 = type metadata accessor for KaleidoscopePosterData();
  if (*(void *)(v27 + *(int *)(v25 + 20)) == *(void *)(v28 + *(int *)(v25 + 20))) {
    return *(void *)(v27 + *(int *)(v25 + 24)) == *(void *)(v28 + *(int *)(v25 + 24));
  }
  return 0;
}

uint64_t sub_100019184(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E274(&qword_10003BF08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000191EC(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *initializeBufferWithCopyOfBuffer for KaleidoscopePosterData.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for KaleidoscopePosterData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for KaleidoscopePosterData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000193A0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1000193C8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000193D0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for KaleidoscopePosterData.CodingKeys()
{
  return &type metadata for KaleidoscopePosterData.CodingKeys;
}

unint64_t sub_1000193EC()
{
  unint64_t result = qword_10003C1A0;
  if (!qword_10003C1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C1A0);
  }
  return result;
}

unint64_t sub_100019444()
{
  unint64_t result = qword_10003C1A8;
  if (!qword_10003C1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C1A8);
  }
  return result;
}

unint64_t sub_10001949C()
{
  unint64_t result = qword_10003C1B0;
  if (!qword_10003C1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C1B0);
  }
  return result;
}

uint64_t sub_1000194F0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100035300;
  v6._object = a2;
  unint64_t v4 = sub_1000294D0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_10001953C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for BundleLookup()
{
  return self;
}

id sub_100019570()
{
  type metadata accessor for BundleLookup();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_10003D700 = (uint64_t)result;
  return result;
}

void sub_1000195C8(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = v3;
  uint64_t v8 = sub_10000E274(&qword_10003C040);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)&v4[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_appearanceStyle] == a1
    && *(void *)&v4[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView])
  {
    return;
  }
  *(void *)&v4[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_appearanceStyle] = a1;
  [v4 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  sub_100016224((uint64_t)&v4[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_posterData], (uint64_t)v10);
  uint64_t v19 = type metadata accessor for KaleidoscopePosterData();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v10, 1, v19) == 1)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v20 = *(void *)&v4[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_animationDriver];
  if (!v20)
  {
LABEL_16:
    __break(1u);
    return;
  }
  objc_allocWithZone((Class)type metadata accessor for KaleidoscopeContentView());
  id v21 = a3;
  swift_retain();
  id v22 = a2;
  id v23 = sub_1000215A4((uint64_t)v10, v20, a1, a2, a3, v12, v14, v16, v18);
  swift_release();

  [v4 insertSubview:v23 atIndex:0];
  uint64_t v24 = OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView;
  uint64_t v25 = *(void **)&v4[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView];
  if (v25)
  {
    os_log_type_t v26 = self;
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v25;
    id v44 = sub_10001A2A4;
    uint64_t v45 = v27;
    aBlocuint64_t k = _NSConcreteStackBlock;
    uint64_t v41 = 1107296256;
    id v42 = sub_1000199A8;
    uint64_t v43 = &unk_100035538;
    uint64_t v28 = _Block_copy(&aBlock);
    id v29 = v25;
    swift_release();
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = v29;
    id v44 = sub_10001A2D0;
    uint64_t v45 = v30;
    aBlocuint64_t k = _NSConcreteStackBlock;
    uint64_t v41 = 1107296256;
    id v42 = sub_1000199EC;
    uint64_t v43 = &unk_100035588;
    char v31 = _Block_copy(&aBlock);
    id v32 = v29;
    swift_release();
    [v26 animateWithDuration:0x20000 delay:v28 options:v31 animations:0.25 completion:0.0];

    _Block_release(v31);
    _Block_release(v28);
    id v33 = *(void **)&v4[v24];
  }
  else
  {
    id v33 = 0;
  }
  *(void *)&v4[v24] = v23;
  id v34 = v23;

  id v35 = *(void **)&v4[v24];
  if (v35) {
    sub_10001A214();
  }
  id v36 = v35;
  sub_100028F10();
  uint64_t v37 = *(char **)&v4[v24];
  if (v37)
  {
    id v38 = *(void **)&v37[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView];
    if (v38)
    {
      uint64_t v39 = v37;
      [v38 renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
    }
  }
}

uint64_t sub_1000199A8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1000199EC(uint64_t a1, uint64_t a2)
{
  Swift::OpaquePointer v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_100019A40(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView;
  unint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView);
  if (v4)
  {
    id v6 = v4;
    sub_10001F90C(a1);

    BOOL v7 = *(void **)(v2 + v3);
    if (v7)
    {
      id v8 = v7;
      sub_10001F410();

      uint64_t v9 = *(void *)(v2 + v3);
      if (v9)
      {
        uint64_t v10 = *(void **)(v9 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView);
        if (v10)
        {
          [v10 renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
        }
      }
    }
  }
}

id sub_100019AF8(float a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for KaleidoscopePosterData();
  id result = (id)__chkstk_darwin(v4);
  BOOL v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView;
  uint64_t v9 = *(char **)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView);
  if (v9)
  {
    *(float *)&v9[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_zoomMultiplier] = a1;
    uint64_t v10 = *(void **)&v9[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView];
    if (v10)
    {
      double v11 = v9;
      id v12 = v10;
      [v12 removeAllQuads];
      uint64_t v13 = (uint64_t)&v11[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterData];
      swift_beginAccess();
      sub_1000126C0(v13, (uint64_t)v7);
      uint64_t v14 = *(void *)&v7[*(int *)(v4 + 24)];
      if (qword_10003BD58 != -1) {
        swift_once();
      }
      uint64_t v15 = qword_10003D648;
      if (qword_10003D648 <= v14) {
        uint64_t v15 = v14;
      }
      if (qword_10003D650 >= v15) {
        Swift::UInt v16 = v15;
      }
      else {
        Swift::UInt v16 = qword_10003D650;
      }
      sub_100014DB4((uint64_t)v7);
      double v17 = (void *)sub_10001F594(v16);
      [v17 setOpaque:1];
      [v12 addQuad:v17];
      uint64_t v18 = swift_retain();
      sub_10001F90C(v18);

      id result = (id)swift_release();
    }
    uint64_t v19 = *(void *)(v2 + v8);
    if (v19)
    {
      id result = *(id *)(v19 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView);
      if (result) {
        return [result renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
      }
    }
  }
  return result;
}

id sub_100019D44()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KaleidoscopeEditorContentView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100019E08()
{
  return type metadata accessor for KaleidoscopeEditorContentView();
}

uint64_t type metadata accessor for KaleidoscopeEditorContentView()
{
  uint64_t result = qword_10003C288;
  if (!qword_10003C288) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100019E5C()
{
  sub_100012668();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100019F2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000E274(&qword_10003C040);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = 0;
  unint64_t v10 = 0xE000000000000000;
  sub_100016224(v1 + OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_posterData, (uint64_t)v4);
  uint64_t v5 = type metadata accessor for KaleidoscopePosterData();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5) == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = *(void *)&v4[*(int *)(v5 + 24)];
    sub_100014DB4((uint64_t)v4);
    uint64_t v8 = v6;
    v11._countAndFlagsBits = sub_100029520();
    sub_100029110(v11);
    swift_bridgeObjectRelease();
    v12._countAndFlagsBits = 45;
    v12._object = (void *)0xE100000000000000;
    sub_100029110(v12);
    if (*(void *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_animationDriver))
    {
      sub_1000291A0(3);
      sub_1000291B0();
      v13._countAndFlagsBits = 45;
      v13._object = (void *)0xE100000000000000;
      sub_100029110(v13);
      sub_1000291A0(3);
      sub_1000291B0();
      v14._countAndFlagsBits = 45;
      v14._object = (void *)0xE100000000000000;
      sub_100029110(v14);
      uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_appearanceStyle);
      type metadata accessor for UIUserInterfaceStyle(0);
      sub_100029400();
      sub_100029070();
      swift_bridgeObjectRelease();
      return;
    }
  }
  __break(1u);
}

uint64_t sub_10001A120()
{
  sub_100019F2C();
  uint64_t v1 = v0;
  id v2 = [v0 description];
  uint64_t v3 = sub_100029080();
  uint64_t v5 = v4;

  v7._countAndFlagsBits = v3;
  v7._object = v5;
  sub_100029110(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 1735290926;
  v8._object = (void *)0xE400000000000000;
  sub_100029110(v8);

  return 0x6C6C696B73746163;
}

void sub_10001A1CC()
{
}

uint64_t sub_10001A1F0()
{
  return sub_10001A120();
}

unint64_t sub_10001A214()
{
  unint64_t result = qword_10003C298;
  if (!qword_10003C298)
  {
    type metadata accessor for KaleidoscopeContentView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C298);
  }
  return result;
}

uint64_t sub_10001A26C()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10001A2A4()
{
  return [*(id *)(v0 + 16) setAlpha:0.0];
}

uint64_t sub_10001A2B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001A2C8()
{
  return swift_release();
}

id sub_10001A2D0()
{
  return [*(id *)(v0 + 16) removeFromSuperview];
}

char *sub_10001A2E0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5, void *a6, int a7, double a8, double a9, double a10, double a11)
{
  int v51 = a4;
  int v52 = a7;
  id v53 = a6;
  id v54 = a5;
  uint64_t v19 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v50 = (uint64_t)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_snapshotImageView;
  id v23 = objc_allocWithZone((Class)UIImageView);
  uint64_t v24 = v11;
  *(void *)&v11[v22] = [v23 init];
  *(void *)&v24[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView] = 0;
  uint64_t v25 = OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_shouldShowSnapshot;
  v24[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_shouldShowSnapshot] = 1;
  uint64_t v26 = OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_snapshotManager;
  sub_100028E70();
  swift_allocObject();
  *(void *)&v24[v26] = sub_100028E60();
  uint64_t v27 = OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_rotationAnimator;
  sub_100028F30();
  swift_allocObject();
  *(void *)&v24[v27] = sub_100028F20();
  uint64_t v28 = &v24[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_posterData];
  sub_1000126C0(a2, (uint64_t)&v24[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_posterData]);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v28, 0, 1, v19);
  *(void *)&v24[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_appearanceStyle] = a1;
  *(void *)&v24[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_animationDriver] = a3;
  v24[v25] = v51;
  swift_retain();

  id v29 = (objc_class *)type metadata accessor for KaleidoscopeEditorContentView();
  v55.receiver = v24;
  v55.super_class = v29;
  id v30 = objc_msgSendSuper2(&v55, "initWithFrame:", a8, a9, a10, a11);
  char v31 = self;
  id v32 = (char *)v30;
  id v33 = [v31 grayColor];
  [v32 setBackgroundColor:v33];

  if (v52)
  {
    uint64_t v34 = a2;
    uint64_t v35 = v50;
    sub_1000126C0(a2, v50);
    id v36 = objc_allocWithZone((Class)type metadata accessor for KaleidoscopeContentView());
    id v37 = v53;
    id v38 = v53;
    swift_retain();
    id v39 = v54;
    id v40 = v54;
    id v41 = sub_1000215A4(v35, a3, a1, v39, v37, a8, a9, a10, a11);
    swift_release();

    uint64_t v42 = OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView;
    uint64_t v43 = *(void **)&v32[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView];
    *(void *)&v32[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView] = v41;
    id v44 = v41;

    uint64_t v45 = *(void **)&v32[v42];
    if (v45) {
      sub_10001A214();
    }
    id v46 = v45;
    swift_retain();
    sub_100028F10();

    swift_release();
    a2 = v34;
  }
  uint64_t v47 = *(void **)&v32[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView];
  if (v47)
  {
    id v48 = v47;
    [v32 addSubview:v48];
  }
  swift_release();

  sub_100014DB4(a2);
  return v32;
}

void sub_10001A6A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_snapshotImageView;
  *(void *)&v1[v2] = [objc_allocWithZone((Class)UIImageView) init];
  *(void *)&v1[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_liveKaleidoscopeContentView] = 0;
  v1[OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_shouldShowSnapshot] = 1;
  uint64_t v3 = OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_snapshotManager;
  sub_100028E70();
  swift_allocObject();
  *(void *)&v1[v3] = sub_100028E60();
  uint64_t v4 = OBJC_IVAR____TtC18KaleidoscopePoster29KaleidoscopeEditorContentView_rotationAnimator;
  sub_100028F30();
  swift_allocObject();
  *(void *)&v1[v4] = sub_100028F20();

  sub_100029460();
  __break(1u);
}

uint64_t sub_10001A7A0(uint64_t a1)
{
  uint64_t v2 = sub_10000E274(&qword_10003C040);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10001A80C(void *a1)
{
  uint64_t v2 = sub_100028DB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = enum case for WatchFacesWallpaperSupportFeatureFlags.catskill(_:);
  Swift::String v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v7(v5, enum case for WatchFacesWallpaperSupportFeatureFlags.catskill(_:), v2);
  char v8 = sub_100028DA0();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v9(v5, v2);
  if (v8)
  {
    v7(v5, v6, v2);
    char v10 = sub_100028DA0();
    v9(v5, v2);
    if (v10)
    {
      if (sub_1000291C0()) {
        sub_10001B638(a1);
      }
      else {
        sub_10001BBA0(a1);
      }
    }
  }
  else
  {
    type metadata accessor for KaleidoscopeEmptyView();
    id v11 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    id v12 = [a1 backgroundView];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    objc_msgSend(v11, "setFrame:", v14, v16, v18, v20);
    id v21 = [a1 backgroundView];
    [v21 addSubview:v11];
  }
}

uint64_t sub_10001AA48(uint64_t a1)
{
  uint64_t v2 = sub_10000E274(&qword_10003BF08);
  __chkstk_darwin(v2 - 8);
  NSString v96 = (uint64_t *)((char *)&v90 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_100028D40();
  uint64_t v98 = *(void *)(v4 - 8);
  uint64_t v99 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v92 = (char *)&v90 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v97 = (char *)&v90 - v7;
  uint64_t v100 = sub_10000E274(&qword_10003C4E0);
  __chkstk_darwin(v100);
  double v101 = (uint64_t *)((char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_100028DB0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000E274(&qword_10003C040);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v103 = (uint64_t)&v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v102 = (uint64_t)&v90 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v95 = (uint64_t)&v90 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v90 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v90 - v23;
  uint64_t v25 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v93 = (uint64_t)&v90 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v94 = (uint64_t)&v90 - v30;
  __chkstk_darwin(v29);
  id v32 = (char *)&v90 - v31;
  sub_100014D50(a1, (uint64_t)v24, &qword_10003C040);
  id v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  uint64_t v105 = v25;
  if (v33(v24, 1, v25) == 1) {
    return sub_100014E64((uint64_t)v24, &qword_10003C040);
  }
  sub_100014F1C((uint64_t)v24, (uint64_t)v32);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for WatchFacesWallpaperSupportFeatureFlags.catskill(_:), v9);
  char v35 = sub_100028DA0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (v35)
  {
    uint64_t v36 = v104;
    uint64_t v37 = v104 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_currentPosterData;
    swift_beginAccess();
    int v91 = v32;
    sub_1000126C0((uint64_t)v32, (uint64_t)v22);
    id v38 = *(void (**)(void, void, void, void))(v26 + 56);
    uint64_t v39 = v105;
    uint64_t v90 = v26 + 56;
    id v40 = v38;
    v38(v22, 0, 1, v105);
    id v41 = (char *)v101;
    uint64_t v42 = (uint64_t)v101 + *(int *)(v100 + 48);
    uint64_t v100 = v37;
    sub_100014D50(v37, (uint64_t)v101, &qword_10003C040);
    sub_100014D50((uint64_t)v22, v42, &qword_10003C040);
    if (v33(v41, 1, v39) == 1)
    {
      sub_100014E64((uint64_t)v22, &qword_10003C040);
      unsigned int v43 = v33((char *)v42, 1, v39);
      uint64_t v44 = v99;
      uint64_t v45 = v40;
      if (v43 == 1)
      {
        id v46 = &qword_10003C040;
LABEL_14:
        sub_100014E64((uint64_t)v41, v46);
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v48 = v95;
      sub_100014D50((uint64_t)v41, v95, &qword_10003C040);
      unsigned int v49 = v33((char *)v42, 1, v39);
      uint64_t v44 = v99;
      if (v49 != 1)
      {
        uint64_t v52 = v94;
        sub_100014F1C(v42, v94);
        BOOL v53 = sub_100018DB4(v48, v52);
        sub_100014DB4(v52);
        sub_100014E64((uint64_t)v22, &qword_10003C040);
        sub_100014DB4(v48);
        sub_100014E64((uint64_t)v41, &qword_10003C040);
        int v51 = v97;
        uint64_t v50 = v98;
        uint64_t v45 = v40;
        if (v53)
        {
LABEL_23:
          uint64_t v84 = (uint64_t)v91;
          uint64_t v85 = v102;
          sub_1000126C0((uint64_t)v91, v102);
          v45(v85, 0, 1, v105);
          uint64_t v86 = v85;
          uint64_t v87 = v103;
          sub_10001D5E8(v86, v103);
          uint64_t v88 = v100;
          swift_beginAccess();
          sub_10001D650(v87, v88);
          swift_endAccess();
          id v89 = objc_retain(*(id *)(v36
                                  + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_contentView));
          sub_10001F2F0(v84);

          uint64_t v47 = v84;
          return sub_100014DB4(v47);
        }
        goto LABEL_12;
      }
      sub_100014E64((uint64_t)v22, &qword_10003C040);
      sub_100014DB4(v48);
      uint64_t v45 = v40;
    }
    sub_100014E64((uint64_t)v41, &qword_10003C4E0);
    int v51 = v97;
    uint64_t v50 = v98;
LABEL_12:
    id v41 = (char *)v96;
    sub_100014D50((uint64_t)v91, (uint64_t)v96, &qword_10003BF08);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v41, 1, v44) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v51, v41, v44);
      sub_10001CA44();
      id v54 = objc_allocWithZone((Class)NSUserDefaults);
      NSString v55 = sub_100029070();
      id v56 = [v54 initWithSuiteName:v55];

      uint64_t v57 = v51;
      if (!v56) {
        goto LABEL_21;
      }
      unint64_t v58 = (uint64_t *)sub_10001E5B4(&qword_10003BF38, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v107 = sub_100029520();
      uint64_t v108 = v59;
      v109._object = (void *)0xE900000000000073;
      v109._countAndFlagsBits = 0x736572676F72702DLL;
      sub_100029110(v109);
      NSString v60 = sub_100029070();
      swift_bridgeObjectRelease();
      [v56 doubleForKey:v60];
      uint64_t v62 = v61;

      uint64_t v50 = v98;
      id v63 = objc_allocWithZone((Class)NSUserDefaults);
      NSString v64 = sub_100029070();
      id v65 = [v63 initWithSuiteName:v64];

      if (v65)
      {
        double v101 = v58;
        uint64_t v107 = sub_100029520();
        uint64_t v108 = v66;
        v110._countAndFlagsBits = 0x6F697461746F722DLL;
        v110._object = (void *)0xE90000000000006ELL;
        sub_100029110(v110);
        NSString v67 = sub_100029070();
        swift_bridgeObjectRelease();
        [v65 doubleForKey:v67];
        uint64_t v69 = v68;

        uint64_t v36 = v104;
        uint64_t v70 = *(void *)(v104 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_animationDriver);
        *(void *)(v70 + 80) = v62;
        *(void *)(v70 + 88) = v69;
        if (qword_10003BDA0 != -1) {
          swift_once();
        }
        uint64_t v71 = sub_100028FA0();
        sub_10000E6C0(v71, (uint64_t)qword_10003D6D0);
        uint64_t v72 = v92;
        (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v92, v57, v44);
        uint64_t v73 = v93;
        sub_1000126C0((uint64_t)v91, v93);
        NSString v74 = sub_100028F80();
        os_log_type_t v75 = sub_100029200();
        int v76 = v75;
        if (os_log_type_enabled(v74, v75))
        {
          uint64_t v77 = swift_slowAlloc();
          uint64_t v99 = swift_slowAlloc();
          uint64_t v107 = v99;
          *(_DWORD *)uint64_t v77 = 136315906;
          LODWORD(v96) = v76;
          uint64_t v78 = sub_100029520();
          uint64_t v106 = sub_10002060C(v78, v79, &v107);
          sub_1000292C0();
          swift_bridgeObjectRelease();
          double v101 = *(uint64_t **)(v50 + 8);
          ((void (*)(char *, uint64_t))v101)(v72, v44);
          *(_WORD *)(v77 + 12) = 2080;
          sub_100017B60();
          uint64_t v80 = sub_1000290F0();
          unint64_t v82 = v81;
          swift_bridgeObjectRelease();
          uint64_t v106 = sub_10002060C(v80, v82, &v107);
          uint64_t v36 = v104;
          sub_1000292C0();
          swift_bridgeObjectRelease();
          sub_100014DB4(v93);
          *(_WORD *)(v77 + 22) = 2048;
          uint64_t v106 = v62;
          sub_1000292C0();
          *(_WORD *)(v77 + 32) = 2048;
          uint64_t v106 = v69;
          sub_1000292C0();
          _os_log_impl((void *)&_mh_execute_header, v74, (os_log_type_t)v96, "Poster %s which is look %s loaded path progress of %f and rotation %f in setPosterData", (uint8_t *)v77, 0x2Au);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          ((void (*)(char *, uint64_t))v101)(v97, v44);
        }
        else
        {

          sub_100014DB4(v73);
          uint64_t v83 = *(void (**)(char *, uint64_t))(v50 + 8);
          v83(v72, v44);
          v83(v57, v44);
        }
      }
      else
      {
LABEL_21:
        (*(void (**)(char *, uint64_t))(v50 + 8))(v57, v44);
        uint64_t v36 = v104;
        *(void *)(*(void *)(v104
                              + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_animationDriver)
                  + 80) = 0;
      }
      goto LABEL_23;
    }
    id v46 = &qword_10003BF08;
    goto LABEL_14;
  }
  uint64_t v47 = (uint64_t)v32;
  return sub_100014DB4(v47);
}

void sub_10001B638(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000E274(&qword_10003C040);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v41 - v12;
  uint64_t v14 = sub_10000E274(&qword_10003C4D8);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = a1;
  sub_100028E40();
  uint64_t v18 = sub_100028E50();
  int v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v16, 1, v18);
  sub_100014E64((uint64_t)v16, &qword_10003C4D8);
  if (v19 == 1) {
    goto LABEL_4;
  }
  uint64_t v20 = v2 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_currentPosterData;
  swift_beginAccess();
  sub_100014D50(v20, (uint64_t)v6, &qword_10003C040);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_100014E64((uint64_t)v6, &qword_10003C040);
LABEL_4:
    if (qword_10003BDA0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_100028FA0();
    sub_10000E6C0(v21, (uint64_t)qword_10003D6D0);
    uint64_t v22 = sub_100028F80();
    os_log_type_t v23 = sub_100029200();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "The snapshot failed to grab a poster data", v24, 2u);
      swift_slowDealloc();
    }

    return;
  }
  sub_100014F1C((uint64_t)v6, (uint64_t)v13);
  uint64_t v25 = *(void *)&v13[*(int *)(v7 + 20)];
  id v26 = [v17 environment];
  swift_getObjectType();
  id v27 = sub_100018BFC(v26, v25);
  swift_unknownObjectRelease();
  uint64_t v28 = OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_contentView;
  uint64_t v29 = *(char **)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_contentView);
  uint64_t v30 = *(void *)&v29[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_appearance];
  *(void *)&v29[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_appearance] = v27;
  uint64_t v31 = v29;
  sub_10001EA6C(v30);

  uint64_t v32 = OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_animationDriver;
  id v33 = *(id *)(v2 + v28);
  uint64_t v34 = swift_retain();
  sub_10001F90C(v34);

  swift_release();
  char v35 = *(void **)(*(void *)(v2 + v28) + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView);
  if (v35) {
    [v35 renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
  }
  if (qword_10003BDA0 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_100028FA0();
  sub_10000E6C0(v36, (uint64_t)qword_10003D6D0);
  sub_1000126C0((uint64_t)v13, (uint64_t)v11);
  swift_retain_n();
  uint64_t v37 = sub_100028F80();
  os_log_type_t v38 = sub_100029200();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = swift_slowAlloc();
    *(_DWORD *)uint64_t v39 = 134218496;
    uint64_t v41 = *(void *)(*(void *)(v2 + v32) + 80);
    sub_1000292C0();
    swift_release_n();
    *(_WORD *)(v39 + 12) = 2048;
    uint64_t v41 = *(void *)(*(void *)(v2 + v32) + 88);
    sub_1000292C0();
    swift_release_n();
    *(_WORD *)(v39 + 22) = 2048;
    uint64_t v40 = *(void *)&v11[*(int *)(v7 + 24)];
    sub_100014DB4((uint64_t)v11);
    uint64_t v41 = v40;
    sub_1000292C0();
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "The snapshot was generated with an animation driver set to %f %f for poster %ld", (uint8_t *)v39, 0x20u);
    swift_slowDealloc();
  }
  else
  {
    sub_100014DB4((uint64_t)v11);
    swift_release_n();
  }

  sub_100014DB4((uint64_t)v13);
}

uint64_t sub_10001BBA0(void *a1)
{
  uint64_t v2 = v1;
  id v99 = a1;
  uint64_t v3 = sub_10000E274(&qword_10003C040);
  __chkstk_darwin(v3 - 8);
  uint64_t v88 = (uint64_t)v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v86 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  uint64_t v90 = (char *)v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_100028E30();
  uint64_t v6 = *(void *)(v97 - 8);
  uint64_t v7 = __chkstk_darwin(v97);
  uint64_t v9 = (char *)v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v100 = (char *)v84 - v10;
  uint64_t v11 = sub_100028F70();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  id v89 = (char *)v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  id v17 = (char *)v84 - v16;
  __chkstk_darwin(v15);
  int v19 = (char *)v84 - v18;
  id v20 = [self mainScreen];
  [v20 bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  uint64_t v102 = OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_contentView;
  [*(id *)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_contentView) bounds];
  v106.origin.unsigned int x = v29;
  v106.origin.unsigned int y = v30;
  v106.size.size_t width = v31;
  v106.size.height = v32;
  v105.origin.unsigned int x = v22;
  v105.origin.unsigned int y = v24;
  v105.size.size_t width = v26;
  v105.size.height = v28;
  if (!CGRectEqualToRect(v105, v106))
  {
    id v33 = *(id *)(v2 + v102);
    objc_msgSend(v33, "setFrame:", v22, v24, v26, v28);
    [v33 setNeedsLayout];
    [v33 setNeedsDisplay];
    [v33 layoutIfNeeded];
  }
  uint64_t v34 = v2 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_wakeState;
  swift_beginAccess();
  char v35 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v94 = v34;
  uint64_t v96 = v12 + 16;
  uint64_t v95 = v35;
  v35(v19, v34, v11);
  char v36 = sub_100028F40();
  uint64_t v37 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v98 = v12 + 8;
  double v101 = v37;
  v37(v19, v11);
  if ((v36 & 1) != 0
    || (uint64_t v38 = v2 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_unlockState,
        swift_beginAccess(),
        uint64_t v39 = v100,
        uint64_t v40 = v97,
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v100, v38, v97),
        LOBYTE(v38) = sub_100028E00(),
        (*(void (**)(char *, uint64_t))(v6 + 8))(v39, v40),
        (v38 & 1) != 0))
  {
    uint64_t v41 = *(unsigned char **)(v2 + v102);
    if (v41[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_isPaused] == 1)
    {
      v41[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_isPaused] = 0;
      uint64_t v42 = v41;
      sub_10001E7B4();
    }
  }
  sub_1000291E0();
  sub_10001C5DC((uint64_t)v17);
  uint64_t v43 = v11;
  v101(v17, v11);
  sub_1000291D0();
  uint64_t v44 = v2 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_unlockState;
  swift_beginAccess();
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  id v46 = v100;
  uint64_t v93 = v44;
  uint64_t v47 = v97;
  uint64_t v48 = v6;
  uint64_t v91 = v6 + 16;
  uint64_t v92 = v45;
  v45(v100, v44, v97);
  sub_10001E5B4(&qword_10003C4C8, (void (*)(uint64_t))&type metadata accessor for UnlockState);
  LOBYTE(v44) = sub_100029060();
  uint64_t v50 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v49 = v6 + 8;
  int v51 = v46;
  uint64_t v52 = v50;
  v50(v51, v47);
  if ((v44 & 1) == 0)
  {
    uint64_t v53 = v93;
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v48 + 24))(v53, v9, v47);
    swift_endAccess();
  }
  v52(v9, v47);
  uint64_t v54 = OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_animationDriver;
  uint64_t v85 = v43;
  v95(v17, v94, v43);
  swift_retain();
  sub_100028F50();
  uint64_t v103 = v55;
  sub_10001D564();
  sub_100029040();
  double v56 = v104;
  v101(v17, v43);
  sub_100021FD0(v56);
  swift_release();
  uint64_t v57 = v100;
  v92(v100, v93, v47);
  swift_retain();
  sub_100028E20();
  uint64_t v103 = v58;
  sub_100029040();
  double v59 = v104;
  uint64_t v60 = v47;
  uint64_t v61 = v52;
  v84[1] = v49;
  v52(v57, v60);
  sub_100022050(v59);
  swift_release();
  sub_10000E274((uint64_t *)&unk_10003BF10);
  uint64_t v62 = (uint64_t)v90;
  id v63 = v99;
  sub_100028EB0();
  uint64_t v64 = v88;
  sub_1000126C0(v62, v88);
  uint64_t v65 = v87;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v86 + 56))(v64, 0, 1, v87);
  sub_10001AA48(v64);
  sub_100014E64(v64, &qword_10003C040);
  uint64_t v66 = *(void *)(v62 + *(int *)(v65 + 20));
  id v67 = [v63 environment];
  swift_getObjectType();
  id v68 = sub_100018BFC(v67, v66);
  swift_unknownObjectRelease();
  uint64_t v69 = v102;
  uint64_t v70 = *(char **)(v2 + v102);
  uint64_t v71 = *(void *)&v70[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_appearance];
  *(void *)&v70[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_appearance] = v68;
  uint64_t v72 = v70;
  sub_10001EA6C(v71);

  uint64_t v73 = *(void *)(v2 + v54);
  NSString v74 = (char *)*(id *)(v2 + v69);
  swift_retain();
  sub_10001F2F0(v62);
  *(void *)&v74[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lastAppliedPathProgress] = *(void *)(v73 + 80);
  *(void *)&v74[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_currentDriver] = v73;
  swift_retain();
  swift_release();
  sub_10001FBEC(*(double *)(v73 + 80));
  sub_10001F9FC(*(double *)(v73 + 88));

  swift_release();
  os_log_type_t v75 = v89;
  uint64_t v76 = v85;
  v95(v89, v94, v85);
  LOBYTE(v74) = sub_100028F40();
  v101(v75, v76);
  if ((v74 & 1) == 0)
  {
    uint64_t v77 = v97;
    v92(v57, v93, v97);
    char v78 = sub_100028E00();
    v61(v57, v77);
    if ((v78 & 1) == 0)
    {
      unint64_t v79 = *(unsigned char **)(v2 + v102);
      if ((v79[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_isPaused] & 1) == 0)
      {
        v79[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_isPaused] = 1;
        uint64_t v80 = v79;
        sub_10001E7B4();

        [v99 noteContentSignificantlyChanged];
      }
    }
  }
  uint64_t v81 = *(void *)(v2 + v102);
  if (*(unsigned char *)(v81 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_isPaused) == 1)
  {
    unint64_t v82 = *(void **)(v81 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView);
    if (v82) {
      [v82 renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
    }
  }
  sub_10001CA44();
  return sub_100014DB4(v62);
}

void sub_10001C5DC(uint64_t a1)
{
  uint64_t v3 = sub_100028F70();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v27 - v8;
  uint64_t v29 = v1;
  uint64_t v10 = v1 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_wakeState;
  swift_beginAccess();
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v10, v3);
  sub_10001E5B4(&qword_10003C4B0, (void (*)(uint64_t))&type metadata accessor for WakeState);
  char v12 = sub_100029060();
  double v28 = *(void (**)(char *, uint64_t))(v4 + 8);
  v28(v9, v3);
  if ((v12 & 1) == 0)
  {
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v10, a1, v3);
    swift_endAccess();
    if (qword_10003BDA0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_100028FA0();
    sub_10000E6C0(v13, (uint64_t)qword_10003D6D0);
    v11(v7, a1, v3);
    uint64_t v14 = sub_100028F80();
    os_log_type_t v15 = sub_1000291F0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      v32[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315138;
      v27[1] = v16 + 4;
      sub_10001E5B4(&qword_10003C4C0, (void (*)(uint64_t))&type metadata accessor for WakeState);
      uint64_t v17 = sub_100029520();
      double v31 = COERCE_DOUBLE(sub_10002060C(v17, v18, v32));
      sub_1000292C0();
      swift_bridgeObjectRelease();
      v28(v7, v3);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Set wake state to %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v28(v7, v3);
    }

    int v19 = (char *)objc_retain(*(id *)(v29
                                    + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_contentView));
    sub_100028F50();
    double v21 = *(void **)&v19[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView];
    if (v21)
    {
      double v22 = v20;
      self;
      uint64_t v23 = swift_dynamicCastObjCClass();
      if (v23)
      {
        double v24 = (void *)v23;
        double v31 = v22;
        sub_10001D510();
        double v25 = v21;
        sub_100029050();
        uint64_t v30 = v32[0];
        sub_100029040();
        HIDWORD(v26) = HIDWORD(v31);
        *(float *)&double v26 = v31;
        [v24 setAplFilterAmount:v26];

        int v19 = v25;
      }
    }
  }
}

uint64_t sub_10001CA44()
{
  uint64_t v1 = sub_10000E274(&qword_10003BF08);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = &v52[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100028D40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v58 = &v52[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  double v59 = &v52[-v8];
  uint64_t v9 = sub_10000E274(&qword_10003C040);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = &v52[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v57 = &v52[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  uint64_t v17 = &v52[-v16];
  uint64_t v18 = v0 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_currentPosterData;
  swift_beginAccess();
  sub_100014D50(v18, (uint64_t)v11, &qword_10003C040);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1) {
    return sub_100014E64((uint64_t)v11, &qword_10003C040);
  }
  sub_100014F1C((uint64_t)v11, (uint64_t)v17);
  sub_100014D50((uint64_t)v17, (uint64_t)v3, &qword_10003BF08);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_100014DB4((uint64_t)v17);
    return sub_100014E64((uint64_t)v3, &qword_10003BF08);
  }
  else
  {
    double v20 = v59;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v59, v3, v4);
    id v21 = objc_allocWithZone((Class)NSUserDefaults);
    NSString v22 = sub_100029070();
    id v23 = [v21 initWithSuiteName:v22];

    if (v23)
    {
      double v24 = v23;
      double v25 = v17;
      uint64_t v26 = *(void *)(v0 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_animationDriver);
      double v28 = *(double *)(v26 + 80);
      double v27 = *(double *)(v26 + 88);
      sub_10001E5B4(&qword_10003BF38, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v61 = sub_100029520();
      uint64_t v62 = v29;
      v63._object = (void *)0xE900000000000073;
      v63._countAndFlagsBits = 0x736572676F72702DLL;
      sub_100029110(v63);
      NSString v30 = sub_100029070();
      swift_bridgeObjectRelease();
      uint64_t v31 = v4;
      [v24 setDouble:v30 forKey:v28];

      uint64_t v61 = sub_100029520();
      uint64_t v62 = v32;
      v64._countAndFlagsBits = 0x6F697461746F722DLL;
      v64._object = (void *)0xE90000000000006ELL;
      sub_100029110(v64);
      NSString v33 = sub_100029070();
      swift_bridgeObjectRelease();
      id v56 = v24;
      [v24 setDouble:v33 forKey:v27];

      if (qword_10003BDA0 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_100028FA0();
      sub_10000E6C0(v34, (uint64_t)qword_10003D6D0);
      char v35 = v58;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v58, v20, v4);
      char v36 = v25;
      uint64_t v37 = (uint64_t)v25;
      uint64_t v38 = v57;
      sub_1000126C0(v37, (uint64_t)v57);
      uint64_t v39 = sub_100028F80();
      os_log_type_t v40 = sub_100029200();
      int v41 = v40;
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v42 = swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        uint64_t v61 = v55;
        *(_DWORD *)uint64_t v42 = 136315906;
        int v53 = v41;
        uint64_t v43 = sub_100029520();
        uint64_t v60 = sub_10002060C(v43, v44, &v61);
        sub_1000292C0();
        swift_bridgeObjectRelease();
        uint64_t v54 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
        v54(v35, v31);
        *(_WORD *)(v42 + 12) = 2080;
        sub_100017B60();
        uint64_t v45 = sub_1000290F0();
        uint64_t v58 = v36;
        uint64_t v46 = v45;
        uint64_t v47 = (uint64_t)v38;
        unint64_t v49 = v48;
        swift_bridgeObjectRelease();
        uint64_t v60 = sub_10002060C(v46, v49, &v61);
        sub_1000292C0();
        swift_bridgeObjectRelease();
        sub_100014DB4(v47);
        *(_WORD *)(v42 + 22) = 2048;
        uint64_t v60 = *(void *)&v28;
        sub_1000292C0();
        *(_WORD *)(v42 + 32) = 2048;
        uint64_t v60 = *(void *)&v27;
        sub_1000292C0();
        _os_log_impl((void *)&_mh_execute_header, v39, (os_log_type_t)v53, "Poster %s which is look %s saved path progress of %f and rotation of %f", (uint8_t *)v42, 0x2Au);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v54(v59, v31);
        uint64_t v50 = (uint64_t)v58;
      }
      else
      {

        sub_100014DB4((uint64_t)v38);
        int v51 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
        v51(v35, v31);
        v51(v20, v31);
        uint64_t v50 = (uint64_t)v36;
      }
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v20, v4);
      uint64_t v50 = (uint64_t)v17;
    }
    return sub_100014DB4(v50);
  }
}

uint64_t sub_10001D1AC()
{
  sub_100014E64(v0 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_currentPosterData, &qword_10003C040);
  uint64_t v1 = v0 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_unlockState;
  uint64_t v2 = sub_100028E30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_wakeState;
  uint64_t v4 = sub_100028F70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_10001D2E8()
{
  return type metadata accessor for KaleidoscopeRenderingCoordinator();
}

uint64_t type metadata accessor for KaleidoscopeRenderingCoordinator()
{
  uint64_t result = qword_10003C2F8;
  if (!qword_10003C2F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001D33C()
{
  sub_100012668();
  if (v0 <= 0x3F)
  {
    sub_100028E30();
    if (v1 <= 0x3F)
    {
      sub_100028F70();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void *sub_10001D46C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_1000294C0();
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

unint64_t sub_10001D510()
{
  unint64_t result = qword_10003C4B8;
  if (!qword_10003C4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C4B8);
  }
  return result;
}

unint64_t sub_10001D564()
{
  unint64_t result = qword_10003C4D0;
  if (!qword_10003C4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C4D0);
  }
  return result;
}

uint64_t sub_10001D5B8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10001D5E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E274(&qword_10003C040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D650(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E274(&qword_10003C040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D6B8(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  id v135 = a3;
  uint64_t v136 = a2;
  uint64_t v6 = sub_10000E274(&qword_10003BF08);
  __chkstk_darwin(v6 - 8);
  uint64_t v131 = (uint64_t)v114 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100028D40();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v132 = v8;
  uint64_t v133 = v9;
  uint64_t v10 = __chkstk_darwin(v8);
  id v117 = (char *)v114 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  id v118 = (char *)v114 - v12;
  uint64_t v128 = sub_100028F70();
  uint64_t v130 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  os_log_type_t v129 = (char *)v114 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_100028E30();
  uint64_t v124 = *(void *)(v127 - 8);
  uint64_t v14 = __chkstk_darwin(v127);
  unint64_t v125 = (char *)v114 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  unint64_t v126 = (char *)v114 - v16;
  uint64_t v17 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v116 = (uint64_t)v114 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v123 = (uint64_t)v114 - v22;
  __chkstk_darwin(v21);
  double v24 = (char *)v114 - v23;
  uint64_t v25 = sub_10000E274(&qword_10003C040);
  __chkstk_darwin(v25 - 8);
  double v27 = (char *)v114 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v28 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v28(v3 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_currentPosterData, 1, 1, v17);
  sub_100028E10();
  sub_100028F60();
  uint64_t v29 = OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_animationDriver;
  sub_100022180();
  *(void *)(v4 + v29) = v30;
  uint64_t v31 = OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_rotationAnimator;
  sub_100028F30();
  swift_allocObject();
  *(void *)(v4 + v31) = sub_100028F20();
  id v32 = v135;
  uint64_t v33 = v136;
  *(void *)(v4 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_renderer) = a1;
  *(void *)(v4 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_orientation) = v32;
  sub_1000126C0(v33, (uint64_t)v27);
  uint64_t v121 = v18 + 56;
  id v119 = v28;
  v28((uint64_t)v27, 0, 1, v17);
  uint64_t v34 = v4 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_currentPosterData;
  swift_beginAccess();
  id v35 = a1;
  id v120 = v27;
  sub_10001D650((uint64_t)v27, v34);
  swift_endAccess();
  uint64_t v36 = *(void *)(v33 + *(int *)(v17 + 20));
  id v37 = [v35 environment];
  swift_getObjectType();
  id v38 = sub_100018BFC(v37, v36);
  swift_unknownObjectRelease();
  id v135 = v35;
  id v39 = [v35 backgroundView];
  [v39 bounds];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;

  sub_1000126C0(v33, (uint64_t)v24);
  uint64_t v115 = OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_animationDriver;
  uint64_t v48 = *(void *)(v4 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_animationDriver);
  id v49 = objc_allocWithZone((Class)type metadata accessor for KaleidoscopeContentView());
  swift_retain();
  id v50 = sub_100021808((uint64_t)v24, v48, (uint64_t)v38, v41, v43, v45, v47);
  swift_release();
  uint64_t v51 = OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_contentView;
  *(void *)(v4 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_contentView) = v50;
  if (qword_10003BDA0 != -1) {
    swift_once();
  }
  uint64_t v52 = sub_100028FA0();
  uint64_t v53 = sub_10000E6C0(v52, (uint64_t)qword_10003D6D0);
  uint64_t v54 = v123;
  sub_1000126C0(v136, v123);
  v114[1] = v53;
  uint64_t v55 = sub_100028F80();
  os_log_type_t v56 = sub_100029200();
  BOOL v57 = os_log_type_enabled(v55, v56);
  uint64_t v122 = v17;
  uint64_t v134 = v51;
  if (v57)
  {
    uint64_t v58 = (uint8_t *)swift_slowAlloc();
    v140[0] = swift_slowAlloc();
    v114[0] = v4;
    *(_DWORD *)uint64_t v58 = 136315138;
    uint64_t v59 = sub_100017CCC();
    uint64_t v138 = sub_10002060C(v59, v60, v140);
    uint64_t v61 = v124;
    uint64_t v4 = v114[0];
    sub_1000292C0();
    swift_bridgeObjectRelease();
    sub_100014DB4(v54);
    _os_log_impl((void *)&_mh_execute_header, v55, v56, "didInitializeWith posterData: %s", v58, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v62 = v127;
    Swift::String v63 = v126;
  }
  else
  {
    sub_100014DB4(v54);

    uint64_t v62 = v127;
    Swift::String v63 = v126;
    uint64_t v61 = v124;
  }
  Swift::String v64 = v135;
  sub_1000291D0();
  uint64_t v65 = v4 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_unlockState;
  swift_beginAccess();
  uint64_t v66 = v125;
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v125, v65, v62);
  sub_10001E5B4(&qword_10003C4C8, (void (*)(uint64_t))&type metadata accessor for UnlockState);
  char v67 = sub_100029060();
  uint64_t v68 = v61;
  uint64_t v69 = v61;
  uint64_t v70 = v63;
  uint64_t v71 = *(void (**)(char *, uint64_t))(v69 + 8);
  v71(v66, v62);
  if ((v67 & 1) == 0)
  {
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v68 + 24))(v65, v70, v62);
    swift_endAccess();
  }
  v71(v70, v62);
  uint64_t v72 = (uint64_t)v129;
  sub_1000291E0();
  sub_10001C5DC(v72);
  (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v72, v128);
  uint64_t v73 = v134;
  NSString v74 = *(void **)(v4 + v134);
  sub_10001E5B4((unint64_t *)&qword_10003C298, (void (*)(uint64_t))type metadata accessor for KaleidoscopeContentView);
  swift_retain();
  id v75 = v74;
  sub_100028F10();
  swift_release();
  swift_retain();
  objc_msgSend(objc_msgSend(v64, "environment"), "deviceOrientation");
  swift_unknownObjectRelease();
  sub_100028EE0();
  swift_release();
  uint64_t v76 = v131;
  sub_100014D50(v136, v131, &qword_10003BF08);
  uint64_t v78 = v132;
  uint64_t v77 = v133;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v133 + 48))(v76, 1, v132) == 1)
  {
    sub_100014E64(v76, &qword_10003BF08);
    uint64_t v79 = v122;
    uint64_t v80 = (uint64_t)v120;
    uint64_t v81 = v119;
  }
  else
  {
    unint64_t v82 = v118;
    (*(void (**)(char *, uint64_t, uint64_t))(v77 + 32))(v118, v76, v78);
    id v83 = objc_allocWithZone((Class)NSUserDefaults);
    NSString v84 = sub_100029070();
    id v85 = [v83 initWithSuiteName:v84];

    if (v85)
    {
      sub_10001E5B4(&qword_10003BF38, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v138 = sub_100029520();
      uint64_t v139 = v86;
      v141._object = (void *)0xE900000000000073;
      v141._countAndFlagsBits = 0x736572676F72702DLL;
      sub_100029110(v141);
      NSString v87 = sub_100029070();
      swift_bridgeObjectRelease();
      [v85 doubleForKey:v87];
      uint64_t v89 = v88;

      id v90 = objc_allocWithZone((Class)NSUserDefaults);
      NSString v91 = sub_100029070();
      id v92 = [v90 initWithSuiteName:v91];

      if (v92)
      {
        uint64_t v138 = sub_100029520();
        uint64_t v139 = v93;
        v142._countAndFlagsBits = 0x6F697461746F722DLL;
        v142._object = (void *)0xE90000000000006ELL;
        sub_100029110(v142);
        NSString v94 = sub_100029070();
        swift_bridgeObjectRelease();
        [v92 doubleForKey:v94];
        uint64_t v96 = v95;

        uint64_t v97 = *(void *)(v4 + v115);
        *(void *)(v97 + 80) = v89;
        *(void *)(v97 + 88) = v96;
        uint64_t v98 = v133;
        id v99 = v117;
        (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v117, v82, v78);
        uint64_t v100 = v116;
        sub_1000126C0(v136, v116);
        double v101 = sub_100028F80();
        os_log_type_t v102 = sub_100029200();
        int v103 = v102;
        if (os_log_type_enabled(v101, v102))
        {
          uint64_t v104 = swift_slowAlloc();
          uint64_t v131 = swift_slowAlloc();
          uint64_t v138 = v131;
          *(_DWORD *)uint64_t v104 = 136315906;
          LODWORD(v130) = v103;
          uint64_t v105 = sub_100029520();
          uint64_t v137 = sub_10002060C(v105, v106, &v138);
          sub_1000292C0();
          swift_bridgeObjectRelease();
          uint64_t v133 = *(void *)(v98 + 8);
          ((void (*)(char *, uint64_t))v133)(v99, v78);
          *(_WORD *)(v104 + 12) = 2080;
          sub_100017B60();
          uint64_t v107 = sub_1000290F0();
          unint64_t v109 = v108;
          swift_bridgeObjectRelease();
          uint64_t v137 = sub_10002060C(v107, v109, &v138);
          sub_1000292C0();
          swift_bridgeObjectRelease();
          sub_100014DB4(v100);
          *(_WORD *)(v104 + 22) = 2048;
          uint64_t v137 = v89;
          sub_1000292C0();
          *(_WORD *)(v104 + 32) = 2048;
          uint64_t v137 = v96;
          sub_1000292C0();
          _os_log_impl((void *)&_mh_execute_header, v101, (os_log_type_t)v130, "Poster %s which is look %s loaded path progress of %f and rotation of %f", (uint8_t *)v104, 0x2Au);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          ((void (*)(char *, uint64_t))v133)(v118, v132);
        }
        else
        {

          sub_100014DB4(v100);
          Swift::String v110 = *(void (**)(char *, uint64_t))(v98 + 8);
          v110(v99, v78);
          v110(v82, v78);
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v133 + 8))(v82, v78);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v77 + 8))(v82, v78);
    }
    uint64_t v79 = v122;
    uint64_t v80 = (uint64_t)v120;
    uint64_t v81 = v119;
    uint64_t v73 = v134;
    Swift::String v64 = v135;
  }
  id v111 = [v64 backgroundView];
  [v111 addSubview:*(void *)(v4 + v73)];

  uint64_t v112 = v136;
  sub_1000126C0(v136, v80);
  v81(v80, 0, 1, v79);
  sub_10001AA48(v80);
  sub_100014DB4(v112);
  sub_100014E64(v80, &qword_10003C040);
  return v4;
}

uint64_t sub_10001E5B4(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_10001E5FC(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v35 = 0;
  unint64_t v36 = 0xE000000000000000;
  long long v8 = xmmword_10002C4E0;
  unint64_t v9 = 0xE100000000000000;
  long long v10 = xmmword_10002C4F0;
  long long v12 = xmmword_10002C500;
  long long v14 = xmmword_10002C510;
  long long v16 = xmmword_10002C520;
  long long v18 = xmmword_10002C530;
  long long v20 = xmmword_10002C540;
  long long v22 = xmmword_10002C550;
  long long v24 = xmmword_10002C560;
  unint64_t v11 = 0xE200000000000000;
  unint64_t v13 = 0xE100000000000000;
  unint64_t v15 = 0xE200000000000000;
  unint64_t v17 = 0xE100000000000000;
  unint64_t v19 = 0xE200000000000000;
  unint64_t v21 = 0xE100000000000000;
  unint64_t v23 = 0xE200000000000000;
  long long v26 = xmmword_10002C570;
  unint64_t v25 = 0xE100000000000000;
  unint64_t v27 = 0xE200000000000000;
  long long v28 = xmmword_10002C580;
  unint64_t v29 = 0xE100000000000000;
  uint64_t v30 = 4;
  uint64_t v31 = 22089;
  unint64_t v32 = 0xE200000000000000;
  long long v33 = xmmword_10002C590;
  unint64_t v34 = 0xE100000000000000;
  while (1)
  {
    uint64_t v3 = (uint64_t *)&v8 + 3 * v2;
    uint64_t v4 = *v3;
    if (a1 >= *v3) {
      break;
    }
LABEL_2:
    if (++v2 == 13)
    {
      sub_10000E274(&qword_10003C4E8);
      swift_arrayDestroy();
      return;
    }
  }
  uint64_t v6 = v3[1];
  uint64_t v5 = (void *)v3[2];
  swift_bridgeObjectRetain();
  while (1)
  {
    BOOL v7 = __OFSUB__(a1, v4);
    a1 -= v4;
    if (v7) {
      break;
    }
    v37._countAndFlagsBits = v6;
    v37._object = v5;
    sub_100029110(v37);
    if (a1 < v4)
    {
      swift_bridgeObjectRelease();
      goto LABEL_2;
    }
  }
  __break(1u);
}

id sub_10001E7B4()
{
  uint64_t v1 = sub_100028FA0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003BDA8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000E6C0(v1, (uint64_t)qword_10003D6E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  uint64_t v6 = v0;
  BOOL v7 = sub_100028F80();
  os_log_type_t v8 = sub_100029230();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v15[1] = v10;
    *(_DWORD *)unint64_t v9 = 136315138;
    int v11 = v6[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_isPaused];
    uint64_t v16 = v10;
    if (v11) {
      uint64_t v12 = 0x676E6973756170;
    }
    else {
      uint64_t v12 = 0x6E69737561706E75;
    }
    if (v11) {
      unint64_t v13 = 0xE700000000000000;
    }
    else {
      unint64_t v13 = 0xE900000000000067;
    }
    v15[2] = sub_10002060C(v12, v13, &v16);
    sub_1000292C0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s the quad view", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id result = *(id *)&v6[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView];
  if (result) {
    return [result setPaused:v6[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_isPaused]];
  }
  return result;
}

id sub_10001EA6C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for KaleidoscopePosterData();
  id result = (id)__chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_appearance) != a1)
  {
    uint64_t v7 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView;
    os_log_type_t v8 = *(void **)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView);
    if (v8)
    {
      id v9 = v8;
      [v9 removeAllQuads];
      uint64_t v10 = v1 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterData;
      swift_beginAccess();
      sub_1000126C0(v10, (uint64_t)v6);
      uint64_t v11 = *(void *)&v6[*(int *)(v3 + 24)];
      if (qword_10003BD58 != -1) {
        swift_once();
      }
      uint64_t v12 = qword_10003D648;
      if (qword_10003D648 <= v11) {
        uint64_t v12 = v11;
      }
      if (qword_10003D650 >= v12) {
        Swift::UInt v13 = v12;
      }
      else {
        Swift::UInt v13 = qword_10003D650;
      }
      sub_100014DB4((uint64_t)v6);
      long long v14 = (void *)sub_10001F594(v13);
      [v14 setOpaque:1];
      [v9 addQuad:v14];
      uint64_t v15 = swift_retain();
      sub_10001F90C(v15);

      swift_release();
      id result = *(id *)(v1 + v7);
      if (result) {
        return [result renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
      }
    }
  }
  return result;
}

id sub_10001EC78()
{
  uint64_t v1 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView];
  if (v2) {
    [v2 removeAllQuads];
  }
  [*(id *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadPathfinderMapTable] removeAllObjects];
  id v3 = [self sharedInstance];
  [v3 purgeAllUnused];

  uint64_t v4 = *(void **)&v0[v1];
  if (v4)
  {
    [v4 removeFromSuperview];
    uint64_t v5 = *(void **)&v0[v1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  *(void *)&v0[v1] = 0;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for KaleidoscopeContentView();
  return objc_msgSendSuper2(&v7, "dealloc");
}

uint64_t sub_10001EE34()
{
  return type metadata accessor for KaleidoscopeContentView();
}

uint64_t type metadata accessor for KaleidoscopeContentView()
{
  uint64_t result = qword_10003C558;
  if (!qword_10003C558) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001EE88()
{
  uint64_t v1 = self;
  id v2 = [v1 blackColor];
  [v0 setBackgroundColor:v2];

  [v0 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  NSString v11 = sub_100029070();
  id v12 = objc_msgSend(self, "quadViewWithFrame:identifier:", v11, v4, v6, v8, v10);

  uint64_t v13 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView;
  long long v14 = *(void **)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView];
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView] = v12;

  uint64_t v15 = *(void **)&v0[v13];
  if (v15)
  {
    self;
    uint64_t v16 = swift_dynamicCastObjCClass();
    if (v16)
    {
      unint64_t v17 = (void *)v16;
      id v18 = v15;
      NSString v19 = sub_100029070();
      int v20 = MGGetBoolAnswer();

      LODWORD(v21) = 1024416809;
      if (!v20) {
        *(float *)&double v21 = 1.0;
      }
      [v17 setMaxAPL:v21];
      [v17 setOpaque:1];
      id v24 = v18;
      id v22 = [v1 blackColor];
      [v17 setBackgroundColor:v22];

      [v0 addSubview:v17];
      sub_10001F410();
      unint64_t v23 = *(void **)&v0[v13];
      if (v23) {
        [v23 renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
      }
      [v17 setPreferredFramesPerSecond:0];
      v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_isPaused] = 1;
      sub_10001E7B4();
    }
  }
}

void sub_10001F10C()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for KaleidoscopeContentView();
  objc_msgSendSuper2(&v5, "layoutSubviews");
  uint64_t v1 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView;
  id v2 = *(void **)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView];
  if (v2)
  {
    id v3 = v2;
    [v0 bounds];
    objc_msgSend(v3, "setFrame:");
    sub_10001F410();
    double v4 = *(void **)&v0[v1];
    if (v4) {
      [v4 renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
    }
  }
}

uint64_t sub_10001F1F8()
{
  uint64_t result = type metadata accessor for KaleidoscopePosterData();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

id sub_10001F2F0(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for KaleidoscopePosterData();
  __chkstk_darwin(v3 - 8);
  objc_super v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = v1 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterData;
  swift_beginAccess();
  sub_1000126C0(v6, (uint64_t)v5);
  BOOL v7 = sub_100018DB4(a1, (uint64_t)v5);
  id result = (id)sub_100014DB4((uint64_t)v5);
  if (!v7)
  {
    sub_1000126C0(a1, (uint64_t)v5);
    swift_beginAccess();
    sub_100021C18((uint64_t)v5, v6);
    uint64_t v9 = swift_endAccess();
    sub_10001F410(v9);
    id result = *(id *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView);
    if (result) {
      return [result renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
    }
  }
  return result;
}

uint64_t sub_10001F410()
{
  uint64_t v1 = type metadata accessor for KaleidoscopePosterData();
  uint64_t result = __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v5 = *(void **)(v0 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView);
  if (v5)
  {
    id v6 = v5;
    [v6 removeAllQuads];
    uint64_t v7 = v0 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterData;
    swift_beginAccess();
    sub_1000126C0(v7, (uint64_t)v4);
    uint64_t v8 = *(void *)&v4[*(int *)(v1 + 24)];
    if (qword_10003BD58 != -1) {
      swift_once();
    }
    uint64_t v9 = qword_10003D648;
    if (qword_10003D648 <= v8) {
      uint64_t v9 = v8;
    }
    if (qword_10003D650 >= v9) {
      Swift::UInt v10 = v9;
    }
    else {
      Swift::UInt v10 = qword_10003D650;
    }
    sub_100014DB4((uint64_t)v4);
    NSString v11 = (void *)sub_10001F594(v10);
    [v11 setOpaque:1];
    [v6 addQuad:v11];
    uint64_t v12 = swift_retain();
    sub_10001F90C(v12);

    return swift_release();
  }
  return result;
}

uint64_t sub_10001F594(Swift::UInt a1)
{
  id v2 = v1;
  swift_beginAccess();
  sub_100020C74(&v26, a1);
  swift_endAccess();
  id v4 = [self quadWithShaderType:3];
  id v5 = [self currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  LODWORD(v7) = 1000593162;
  if (v6 == (id)1) {
    *(float *)&double v7 = 0.0025;
  }
  [v4 setLineThickness:v7];
  uint64_t v8 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_appearance;
  if (*(void *)&v2[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_appearance] > 1uLL) {
    uint64_t result = sub_10000DD5C(a1);
  }
  else {
    uint64_t result = sub_10000DC8C(a1);
  }
  if (qword_10003BD90 == -1)
  {
    if ((a1 & 0x8000000000000000) == 0) {
      goto LABEL_8;
    }
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t result = swift_once();
  if ((a1 & 0x8000000000000000) != 0) {
    goto LABEL_15;
  }
LABEL_8:
  if (*(void *)(qword_10003D688 + 16) <= a1)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v10.i64[0] = -4;
  v11.i64[0] = *(void *)(qword_10003D688 + 8 * a1 + 32) - 13;
  *(void *)&double v24 = vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_u64(v10, v11).i64[0], 0), (int8x16_t)xmmword_10002C5D0, (int8x16_t)xmmword_10002C5C0).u64[0];
  uint64_t v12 = v2;
  NSString v13 = sub_100029070();
  swift_bridgeObjectRelease();
  long long v14 = self;
  id v15 = [v14 textureWithProviderDelegate:v12 uuid:v13 rect:v24];

  [v4 setPrimaryLumaTexture:v15];
  if (*(void *)&v2[v8] >= 2uLL) {
    uint64_t result = sub_10000DD74(a1);
  }
  else {
    uint64_t result = sub_10000DC94(a1);
  }
  if (*(void *)(qword_10003D688 + 16) > a1)
  {
    v16.i64[0] = -4;
    v17.i64[0] = *(void *)(qword_10003D688 + 8 * a1 + 32) - 13;
    *(void *)&double v25 = vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_u64(v16, v17).i64[0], 0), (int8x16_t)xmmword_10002C5D0, (int8x16_t)xmmword_10002C5C0).u64[0];
    id v18 = v12;
    NSString v19 = sub_100029070();
    swift_bridgeObjectRelease();
    id v20 = [v14 textureWithProviderDelegate:v18 uuid:v19 rect:v25];

    [v4 setPrimaryChromaTexture:v20];
    [v18 bounds];
    CGFloat Width = CGRectGetWidth(v27);
    *(float *)&CGFloat Width = Width;
    *(float *)&CGFloat Width = *(float *)&Width
                     / (float)(*(float *)&v18[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_zoomMultiplier]
                             * *(float *)&Width);
    [v4 setDialRadius:Width];
    id v22 = *(void **)&v18[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadPathfinderMapTable];
    unint64_t v23 = sub_10000D1CC(a1);
    [v22 setObject:v23 forKey:v4];

    return (uint64_t)v4;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_10001F90C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for KaleidoscopePosterData();
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterData;
  swift_beginAccess();
  sub_1000126C0(v6, (uint64_t)v5);
  sub_10001F2F0((uint64_t)v5);
  *(void *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lastAppliedPathProgress) = *(void *)(a1 + 80);
  *(void *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_currentDriver) = a1;
  swift_retain();
  swift_release();
  sub_10001FBEC(*(double *)(a1 + 80));
  sub_10001F9FC(*(double *)(a1 + 88));
  return sub_100014DB4((uint64_t)v5);
}

void sub_10001F9FC(double a1)
{
  id v2 = *(void **)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView);
  if (!v2) {
    return;
  }
  id v17 = v2;
  id v4 = [v17 quads];
  sub_100021BD8();
  unint64_t v5 = sub_100029150();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100029470();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6)
    {
LABEL_4:
      if (v6 < 1)
      {
        __break(1u);
        return;
      }
      uint64_t v7 = 0;
      uint64_t v8 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadPathfinderMapTable;
      do
      {
        if ((v5 & 0xC000000000000001) != 0) {
          id v9 = (id)sub_100029380();
        }
        else {
          id v9 = *(id *)(v5 + 8 * v7 + 32);
        }
        uint64x2_t v10 = v9;
        self;
        uint64_t v11 = swift_dynamicCastObjCClass();
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          id v13 = [*(id *)(v1 + v8) objectForKey:v11];
          if (v13)
          {
            id v14 = v13;
            [v13 startRotation];
            long double v16 = fmod(v15 + a1, 1.0);
            *(float *)&long double v16 = v16;
            [v12 setRotation:(double)v16];

            uint64x2_t v10 = v14;
          }
        }
        ++v7;
      }
      while (v6 != v7);
    }
  }

  swift_bridgeObjectRelease();
}

void sub_10001FBEC(double a1)
{
  uint64_t v26 = type metadata accessor for KaleidoscopePosterData();
  __chkstk_darwin(v26);
  id v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v1;
  unint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView);
  if (v5)
  {
    unint64_t v6 = v5;
    id v7 = [(id)v6 quads];
    sub_100021BD8();
    unint64_t v8 = sub_100029150();

    if (v8 >> 62) {
      goto LABEL_30;
    }
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (v9)
    {
      if (v9 < 1)
      {
        __break(1u);
        return;
      }
      uint64_t v27 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadPathfinderMapTable;
      id v24 = (id)v6;
      uint64_t v25 = v28 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterData;
      swift_beginAccess();
      uint64_t v10 = 0;
      while (1)
      {
        if ((v8 & 0xC000000000000001) != 0) {
          id v14 = (id)sub_100029380();
        }
        else {
          id v14 = *(id *)(v8 + 8 * v10 + 32);
        }
        id v13 = v14;
        self;
        uint64_t v15 = swift_dynamicCastObjCClass();
        if (!v15) {
          goto LABEL_7;
        }
        long double v16 = (void *)v15;
        id v17 = [*(id *)(v28 + v27) objectForKey:v15];
        if (!v17) {
          goto LABEL_7;
        }
        id v18 = v17;
        sub_1000126C0(v25, (uint64_t)v4);
        uint64_t v19 = *(void *)&v4[*(int *)(v26 + 24)];
        if (qword_10003BD58 != -1) {
          swift_once();
        }
        uint64_t v20 = qword_10003D648;
        if (qword_10003D648 <= v19) {
          uint64_t v20 = v19;
        }
        unint64_t v6 = qword_10003D650 >= v20 ? v20 : qword_10003D650;
        sub_100014DB4((uint64_t)v4);
        if (qword_10003BD90 == -1)
        {
          if ((v6 & 0x8000000000000000) != 0) {
            goto LABEL_26;
          }
        }
        else
        {
          swift_once();
          if ((v6 & 0x8000000000000000) != 0)
          {
LABEL_26:
            __break(1u);
LABEL_27:

            swift_bridgeObjectRelease();
            return;
          }
        }
        if (v6 >= *(void *)(qword_10003D688 + 16)) {
          break;
        }
        unint64_t v21 = *(void *)(qword_10003D688 + 8 * v6 + 32) - 1;
        double v22 = 0.0;
        if (v21 <= 0x20) {
          double v22 = dbl_10002C6B8[v21];
        }
        long double v11 = fmod(v22 + a1, 1.0);
        *(float *)&long double v11 = v11;
        [v18 pointForTime:(double)v11];
        double v12 = v29;
        [v16 setSampleRadius:v30];
        [v16 setSampleCenter:v12];

        id v13 = v18;
LABEL_7:
        ++v10;

        if (v9 == v10) {
          goto LABEL_27;
        }
      }
      __break(1u);
LABEL_30:
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_100029470();
      swift_bridgeObjectRelease();
    }

    swift_bridgeObjectRelease();
  }
}

id sub_10001FFCC(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v6 = __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  long double v11 = (char *)&v34 - v10;
  __chkstk_darwin(v9);
  id v13 = (char *)&v34 - v12;
  uint64_t v14 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lumaBacking;
  if (*(void *)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lumaBacking))
  {
    uint64_t v15 = v2 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterData;
    swift_beginAccess();
    sub_1000126C0(v15, (uint64_t)v13);
    uint64_t v16 = *(void *)&v13[*(int *)(v5 + 24)];
    if (qword_10003BD58 != -1) {
      swift_once();
    }
    uint64_t v17 = qword_10003D648;
    if (qword_10003D648 <= v16) {
      uint64_t v17 = v16;
    }
    if (qword_10003D650 >= v17) {
      unint64_t v18 = v17;
    }
    else {
      unint64_t v18 = qword_10003D650;
    }
    sub_100014DB4((uint64_t)v13);
    if (sub_10000DC8C(v18) == a1 && v19 == a2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v21 = sub_100029540();
      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0) {
        goto LABEL_14;
      }
    }
    id v31 = *(id *)(v2 + v14);
    goto LABEL_32;
  }
LABEL_14:
  uint64_t v22 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_chromaBacking;
  if (*(void *)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_chromaBacking))
  {
    uint64_t v23 = v2 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterData;
    swift_beginAccess();
    sub_1000126C0(v23, (uint64_t)v11);
    uint64_t v24 = *(void *)&v11[*(int *)(v5 + 24)];
    if (qword_10003BD58 != -1) {
      swift_once();
    }
    uint64_t v25 = qword_10003D648;
    if (qword_10003D648 <= v24) {
      uint64_t v25 = v24;
    }
    if (qword_10003D650 >= v25) {
      unint64_t v26 = v25;
    }
    else {
      unint64_t v26 = qword_10003D650;
    }
    sub_100014DB4((uint64_t)v11);
    if (sub_10000DC94(v26) == a1 && v27 == a2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v29 = sub_100029540();
      swift_bridgeObjectRelease();
      if ((v29 & 1) == 0) {
        goto LABEL_27;
      }
    }
    id v31 = *(id *)(v2 + v22);
LABEL_32:
    id v32 = v31;
    return v31;
  }
LABEL_27:
  uint64_t v30 = v2 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterData;
  swift_beginAccess();
  sub_1000126C0(v30, (uint64_t)v8);
  id v31 = sub_100017D84(a1, a2);
  sub_100014DB4((uint64_t)v8);
  return v31;
}

uint64_t sub_100020348(uint64_t a1, uint64_t a2, float a3)
{
  float v4 = *(float *)&dword_10003D748;
  dword_10003D748 = LODWORD(a3);
  double v5 = 0.0;
  if ((unint64_t)(a1 - 2) <= 2) {
    double v5 = dbl_10002C7C0[a1 - 2];
  }
  switch(a2)
  {
    case 2:
      if (v5 >= 3.14159265) {
        goto LABEL_14;
      }
      break;
    case 4:
      goto LABEL_14;
    case 3:
      if (v5 < 1.57079633)
      {
        double v6 = 1.0;
        double v7 = 1.0;
        if (a1 != 4) {
          goto LABEL_27;
        }
LABEL_26:
        double v7 = 2.0;
        goto LABEL_27;
      }
      goto LABEL_14;
    default:
      if (v5 >= 0.0)
      {
LABEL_14:
        double v7 = 1.0;
        switch(a1)
        {
          case 1:
            double v6 = -1.0;
            goto LABEL_16;
          case 2:
            double v6 = -1.0;
            if (a2 == 1) {
              goto LABEL_26;
            }
            break;
          case 3:
            double v6 = -1.0;
            if (a2 == 4) {
              goto LABEL_26;
            }
            break;
          case 4:
            double v6 = -1.0;
            if (a2 == 3) {
              goto LABEL_26;
            }
            break;
          default:
            double v6 = -1.0;
            break;
        }
        goto LABEL_27;
      }
      break;
  }
  if (a1 == 2)
  {
    double v6 = 1.0;
    double v7 = 1.0;
    if (a2 != 1) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  double v7 = 1.0;
  double v6 = 1.0;
  if (a1 == 1)
  {
LABEL_16:
    if (a2 == 2) {
      goto LABEL_26;
    }
  }
LABEL_27:
  double v8 = (float)(a3 - v4);
  *(unsigned char *)(v3 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_isPaused) = 0;
  sub_10001E7B4();
  *(double *)(*(void *)(v3 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_currentDriver) + 88) = v7 * (v8 * 0.0415 * v6) * 5.0 + *(double *)(*(void *)(v3 + OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_currentDriver) + 88);
  uint64_t v9 = swift_retain();
  sub_10001F90C(v9);
  return swift_release();
}

uint64_t sub_100020520(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100020530(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10002056C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100020594(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10002060C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1000292C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10002060C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000206E0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100014EC0((uint64_t)v12, *a3);
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
      sub_100014EC0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100018CFC((uint64_t)v12);
  return v7;
}

uint64_t sub_1000206E0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000292D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10002089C(a5, a6);
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
  uint64_t v8 = sub_1000293A0();
  if (!v8)
  {
    sub_100029450();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000294C0();
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

uint64_t sub_10002089C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100020934(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100020B14(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100020B14(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100020934(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100020AAC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100029360();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100029450();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100029120();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_1000294C0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100029450();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100020AAC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_10000E274(&qword_10003C628);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100020B14(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000E274(&qword_10003C628);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
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
  uint64_t result = sub_1000294C0();
  __break(1u);
  return result;
}

unsigned char **sub_100020C64(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_100020C74(Swift::UInt *a1, Swift::UInt a2)
{
  uint64_t v5 = *v2;
  sub_100029580();
  sub_100029590(a2);
  Swift::Int v6 = sub_1000295A0();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_100021040(a2, v8, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v9 + 8 * v8) != a2);
  }
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_100020D94()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000E274(&qword_10003C638);
  uint64_t result = sub_100029340();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    Swift::Int v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      Swift::UInt v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      sub_100029580();
      sub_100029590(v18);
      uint64_t result = sub_1000295A0();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_100021040(Swift::Int result, unint64_t a2, char a3)
{
  Swift::UInt v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100020D94();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (Swift::Int)sub_100021190();
      goto LABEL_14;
    }
    sub_100021328();
  }
  uint64_t v8 = *v3;
  sub_100029580();
  sub_100029590(v5);
  uint64_t result = sub_1000295A0();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_100029550();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_100021190()
{
  uint64_t v1 = v0;
  sub_10000E274(&qword_10003C638);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100029330();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100021328()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000E274(&qword_10003C638);
  uint64_t result = sub_100029340();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    Swift::UInt v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    sub_100029580();
    sub_100029590(v18);
    uint64_t result = sub_1000295A0();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

id sub_1000215A4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, double a6, double a7, double a8, double a9)
{
  *(void *)&v9[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v9[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView] = 0;
  uint64_t v17 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadPathfinderMapTable;
  id v18 = objc_allocWithZone((Class)NSMapTable);
  uint64_t v19 = v9;
  *(void *)&v9[v17] = [v18 init];
  *(void *)&v19[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_loadedAssets] = &_swiftEmptySetSingleton;
  uint64_t v20 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterResourceProviderKey;
  *(void *)&v19[v20] = [objc_allocWithZone((Class)CLKUIResourceProviderKey) init];
  uint64_t v21 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lastAppliedPathProgress;
  *(void *)&v19[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lastAppliedPathProgress] = 0;
  uint64_t v22 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_zoomMultiplier;
  *(_DWORD *)&v19[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_zoomMultiplier] = 1063675494;
  uint64_t v23 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_currentDriver;
  sub_100022180();
  *(void *)&v19[v23] = v24;
  uint64_t v25 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_appearance;
  *(void *)&v19[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_appearance] = 0;
  uint64_t v26 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lumaBacking;
  *(void *)&v19[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lumaBacking] = 0;
  uint64_t v27 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_chromaBacking;
  *(void *)&v19[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_chromaBacking] = 0;
  uint64_t v28 = *(void **)&v19[v26];
  *(void *)&v19[v26] = a4;
  id v29 = a4;

  uint64_t v30 = *(void **)&v19[v27];
  *(void *)&v19[v27] = a5;
  id v31 = a5;

  *(void *)&v19[v23] = a2;
  swift_retain();
  swift_release();
  v19[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_isPaused] = 1;
  sub_1000126C0(a1, (uint64_t)&v19[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterData]);
  *(void *)&v19[v21] = *(void *)(a2 + 80);
  *(void *)&v19[v25] = a3;
  id v32 = [self currentDevice];
  id v33 = [v32 userInterfaceIdiom];

  float v34 = 0.9;
  if (!v33) {
    float v34 = 1.125;
  }
  *(float *)&v19[v22] = v34;

  v39.receiver = v19;
  v39.super_class = (Class)type metadata accessor for KaleidoscopeContentView();
  id v35 = objc_msgSendSuper2(&v39, "initWithFrame:", a6, a7, a8, a9);
  sub_10001EE88();

  sub_100014DB4(a1);
  return v35;
}

id sub_100021808(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  *(void *)&v7[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v7[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView] = 0;
  uint64_t v15 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadPathfinderMapTable;
  id v16 = objc_allocWithZone((Class)NSMapTable);
  uint64_t v17 = v7;
  *(void *)&v7[v15] = [v16 init];
  *(void *)&v17[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_loadedAssets] = &_swiftEmptySetSingleton;
  uint64_t v18 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterResourceProviderKey;
  *(void *)&v17[v18] = [objc_allocWithZone((Class)CLKUIResourceProviderKey) init];
  uint64_t v19 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lastAppliedPathProgress;
  *(void *)&v17[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lastAppliedPathProgress] = 0;
  uint64_t v20 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_zoomMultiplier;
  *(_DWORD *)&v17[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_zoomMultiplier] = 1063675494;
  uint64_t v21 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_currentDriver;
  sub_100022180();
  *(void *)&v17[v21] = v22;
  uint64_t v23 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_appearance;
  *(void *)&v17[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_appearance] = 0;
  *(void *)&v17[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lumaBacking] = 0;
  *(void *)&v17[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_chromaBacking] = 0;
  *(void *)&v17[v21] = a2;
  swift_retain();
  swift_release();
  v17[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_isPaused] = 1;
  sub_1000126C0(a1, (uint64_t)&v17[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterData]);
  *(void *)&v17[v19] = *(void *)(a2 + 80);
  *(void *)&v17[v23] = a3;
  id v24 = [self currentDevice];
  id v25 = [v24 userInterfaceIdiom];

  float v26 = 0.9;
  if (!v25) {
    float v26 = 1.125;
  }
  *(float *)&v17[v20] = v26;

  v29.receiver = v17;
  v29.super_class = (Class)type metadata accessor for KaleidoscopeContentView();
  id v27 = objc_msgSendSuper2(&v29, "initWithFrame:", a4, a5, a6, a7);
  sub_10001EE88();

  sub_100014DB4(a1);
  return v27;
}

void sub_100021A38()
{
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadView] = 0;
  uint64_t v1 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_quadPathfinderMapTable;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)NSMapTable) init];
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_loadedAssets] = &_swiftEmptySetSingleton;
  uint64_t v2 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_posterResourceProviderKey;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)CLKUIResourceProviderKey) init];
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lastAppliedPathProgress] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_zoomMultiplier] = 1063675494;
  uint64_t v3 = OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_currentDriver;
  sub_100022180();
  *(void *)&v0[v3] = v4;
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_appearance] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_lumaBacking] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster23KaleidoscopeContentView_chromaBacking] = 0;

  sub_100029460();
  __break(1u);
}

uint64_t sub_100021B60()
{
  dword_10003D748 = 0;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    sub_10001CA44();
    [*(id *)(v1 + OBJC_IVAR____TtC18KaleidoscopePoster32KaleidoscopeRenderingCoordinator_renderer) noteContentSignificantlyChanged];
    return swift_unknownObjectRelease();
  }
  return result;
}

unint64_t sub_100021BD8()
{
  unint64_t result = qword_10003C630;
  if (!qword_10003C630)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003C630);
  }
  return result;
}

uint64_t sub_100021C18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for KaleidoscopePosterData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100021C7C(uint64_t a1)
{
  return a1;
}

char *sub_100021CA4(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC18KaleidoscopePoster21KaleidoscopeEmptyView_emptyPosterLabel;
  id v10 = objc_allocWithZone((Class)UILabel);
  uint64_t v11 = v4;
  *(void *)&v4[v9] = [v10 init];

  v20.receiver = v11;
  v20.super_class = (Class)type metadata accessor for KaleidoscopeEmptyView();
  id v12 = objc_msgSendSuper2(&v20, "initWithFrame:", a1, a2, a3, a4);
  unint64_t v13 = self;
  unint64_t v14 = (char *)v12;
  id v15 = [v13 systemBrownColor];
  [v14 setBackgroundColor:v15];

  uint64_t v16 = OBJC_IVAR____TtC18KaleidoscopePoster21KaleidoscopeEmptyView_emptyPosterLabel;
  id v17 = *(id *)&v14[OBJC_IVAR____TtC18KaleidoscopePoster21KaleidoscopeEmptyView_emptyPosterLabel];
  NSString v18 = sub_100029070();
  [v17 setText:v18];

  [v14 addSubview:*(void *)&v14[v16]];
  return v14;
}

id sub_100021F68()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KaleidoscopeEmptyView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for KaleidoscopeEmptyView()
{
  return self;
}

void sub_100021FD0(double a1)
{
  double v3 = *(double *)(v1 + 96);
  if (v3 != a1)
  {
    uint64_t v4 = 24;
    if (v3 >= a1) {
      uint64_t v4 = 40;
    }
    uint64_t v5 = 16;
    if (v3 >= a1) {
      uint64_t v5 = 32;
    }
    double v6 = vabdd_f64(v3, a1);
    long double v7 = v6 * *(double *)(v1 + v5) + *(double *)(v1 + 88);
    *(long double *)(v1 + 80) = fmod(*(double *)(v1 + 80) + v6 * *(double *)(v1 + v4), 1.0);
    *(long double *)(v1 + 88) = fmod(v7, 1.0);
    *(double *)(v1 + 96) = a1;
  }
}

void sub_100022050(double a1)
{
  double v3 = *(double *)(v1 + 104);
  if (v3 != a1)
  {
    uint64_t v4 = 72;
    if (v3 < a1) {
      uint64_t v4 = 56;
    }
    uint64_t v5 = 64;
    if (v3 < a1) {
      uint64_t v5 = 48;
    }
    double v6 = vabdd_f64(v3, a1);
    double v7 = v6 * *(double *)(v1 + v5);
    *(long double *)(v1 + 80) = fmod(*(double *)(v1 + 80) + v6 * *(double *)(v1 + v4), 1.0);
    *(long double *)(v1 + 88) = fmod(v7 + *(double *)(v1 + 88), 1.0);
    *(double *)(v1 + 104) = a1;
  }
}

double sub_1000220D4(char a1, double a2, double a3)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = v3 + 4;
      break;
    case 2:
      uint64_t v4 = v3 + 6;
      break;
    case 3:
      uint64_t v4 = v3 + 8;
      break;
    default:
      uint64_t v4 = v3 + 2;
      break;
  }
  return vabdd_f64(a2, a3) * *v4;
}

uint64_t sub_10002214C()
{
  return _swift_deallocClassInstance(v0, 112, 7);
}

uint64_t type metadata accessor for AnimationDriver()
{
  return self;
}

double sub_100022180()
{
  type metadata accessor for AnimationDriver();
  uint64_t v0 = swift_allocObject();
  double result = 1.0;
  *(void *)(v0 + 48) = 0xBFA53F7CED916873;
  *(void *)(v0 + 56) = 0;
  *(void *)(v0 + 64) = 0x3FA53F7CED916873;
  *(void *)(v0 + 72) = 0;
  *(_OWORD *)(v0 + 16) = xmmword_10002C830;
  *(_OWORD *)(v0 + 32) = xmmword_10002C830;
  *(_OWORD *)(v0 + 80) = xmmword_10002C840;
  *(_OWORD *)(v0 + 96) = xmmword_10002C820;
  return result;
}

ValueMetadata *type metadata accessor for EditingDataSource()
{
  return &type metadata for EditingDataSource;
}

unint64_t *sub_1000221FC()
{
  uint64_t v0 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  double result = (unint64_t *)__chkstk_darwin(v2);
  double v7 = (char *)&v21 - v6;
  if (qword_10003BD58 != -1) {
LABEL_19:
  }
    double result = (unint64_t *)swift_once();
  uint64_t v9 = qword_10003D648;
  uint64_t v8 = unk_10003D650;
  uint64_t v10 = unk_10003D650 - qword_10003D648;
  if (__OFSUB__(unk_10003D650, qword_10003D648))
  {
    __break(1u);
  }
  else
  {
    if (!v10)
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      unint64_t v14 = _swiftEmptyArrayStorage[2];
      if (!v14)
      {
LABEL_16:
        swift_bridgeObjectRelease();
        return _swiftEmptyArrayStorage;
      }
LABEL_12:
      id v24 = _swiftEmptyArrayStorage;
      sub_1000293D0();
      uint64_t v15 = (uint64_t)v11 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
      uint64_t v16 = *(void *)(v1 + 72);
      do
      {
        sub_1000126C0(v15, (uint64_t)v4);
        sub_100017478();
        sub_100017B60();
        sub_1000290F0();
        swift_bridgeObjectRelease();
        id v17 = objc_allocWithZone((Class)PREditingLook);
        NSString v18 = sub_100029070();
        swift_bridgeObjectRelease();
        NSString v19 = sub_100029070();
        swift_bridgeObjectRelease();
        [v17 initWithIdentifier:v18 displayName:v19];

        sub_100014DB4((uint64_t)v4);
        sub_1000293B0();
        sub_1000293E0();
        sub_1000293F0();
        sub_1000293C0();
        v15 += v16;
        --v14;
      }
      while (v14);
      objc_super v20 = v24;
      swift_bridgeObjectRelease();
      return v20;
    }
    uint64_t v21 = v1;
    id v24 = _swiftEmptyArrayStorage;
    double result = (unint64_t *)sub_100025F80(0, v10 & ~(v10 >> 63), 0);
    if (v8 >= v9 && (v10 & 0x8000000000000000) == 0)
    {
      uint64_t v11 = v24;
      uint64_t v23 = sub_100028D40();
      uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56);
      uint64_t v1 = v21;
      do
      {
        v22(v7, 1, 1, v23);
        *(void *)&v7[*(int *)(v0 + 20)] = 0;
        *(void *)&v7[*(int *)(v0 + 24)] = v9;
        id v24 = v11;
        unint64_t v13 = v11[2];
        unint64_t v12 = v11[3];
        if (v13 >= v12 >> 1)
        {
          sub_100025F80(v12 > 1, v13 + 1, 1);
          uint64_t v1 = v21;
          uint64_t v11 = v24;
        }
        v11[2] = v13 + 1;
        sub_100014F1C((uint64_t)v7, (uint64_t)v11+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(void *)(v1 + 72) * v13);
        if (v8 == v9)
        {
          __break(1u);
          goto LABEL_19;
        }
        ++v9;
      }
      while (v8 != v9);
      unint64_t v14 = v11[2];
      if (!v14) {
        goto LABEL_16;
      }
      goto LABEL_12;
    }
  }
  __break(1u);
  return result;
}

id sub_100022580(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v2 = sub_10000E274(&qword_10003C040);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (uint64_t)&v1[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_posterData];
  uint64_t v6 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v8 = OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathSlider;
  id v9 = objc_allocWithZone((Class)UISlider);
  uint64_t v10 = v1;
  *(void *)&v1[v8] = [v9 init];
  uint64_t v11 = OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomSlider;
  *(void *)&v10[v11] = [objc_allocWithZone((Class)UISlider) init];
  uint64_t v12 = OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathValueLabel;
  *(void *)&v10[v12] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v13 = OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomValueLabel;
  *(void *)&v10[v13] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v14 = OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_backgroundView;
  *(void *)&v10[v14] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v15 = v24;
  uint64_t v16 = &v10[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_sliderDelegate];
  *((void *)v16 + 4) = 0;
  *(_OWORD *)uint64_t v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  swift_beginAccess();
  sub_100023E10(v15, v5);
  swift_endAccess();
  sub_100014D50(v15, (uint64_t)v4, &qword_10003C040);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) == 1)
  {
    sub_100014E64((uint64_t)v4, &qword_10003C040);
    int v17 = 0;
  }
  else
  {
    uint64_t v18 = *(void *)&v4[*(int *)(v6 + 24)];
    if (qword_10003BD58 != -1) {
      swift_once();
    }
    uint64_t v19 = qword_10003D648;
    if (qword_10003D648 <= v18) {
      uint64_t v19 = v18;
    }
    if (qword_10003D650 >= v19) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = qword_10003D650;
    }
    sub_100014DB4((uint64_t)v4);
    sub_10000DED0(v20);
  }
  *(_DWORD *)&v10[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_startingPathProgress] = v17;

  uint64_t v21 = (objc_class *)type metadata accessor for PathProgressSliderViewController();
  v25.receiver = v10;
  v25.super_class = v21;
  id v22 = objc_msgSendSuper2(&v25, "initWithNibName:bundle:", 0, 0);
  sub_100014E64(v15, &qword_10003C040);
  return v22;
}

void sub_100022928()
{
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for PathProgressSliderViewController();
  objc_msgSendSuper2(&v18, "viewDidLoad");
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v2 = v1;
  uint64_t v3 = self;
  id v4 = [v3 clearColor];
  [v2 setBackgroundColor:v4];

  sub_100022D80();
  sub_100022F20();
  sub_100022BC8();
  uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_backgroundView];
  id v6 = [v3 whiteColor];
  [v5 setBackgroundColor:v6];

  [v5 setAlpha:0.5];
  id v7 = [v5 layer];
  [v7 setCornerRadius:10.0];

  id v8 = [v0 view];
  if (!v8)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v9 = v8;
  [v8 addSubview:v5];

  id v10 = [v0 view];
  if (!v10)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v11 = v10;
  [v10 addSubview:*(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathSlider]];

  id v12 = [v0 view];
  if (!v12)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v13 = v12;
  [v12 addSubview:*(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomSlider]];

  id v14 = [v0 view];
  if (!v14)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v15 = v14;
  [v14 addSubview:*(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathValueLabel]];

  id v16 = [v0 view];
  if (v16)
  {
    int v17 = v16;
    [v16 addSubview:*(void *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomValueLabel]];

    return;
  }
LABEL_13:
  __break(1u);
}

id sub_100022BC8()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathValueLabel);
  sub_10000E274(&qword_10003BDD0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10002BC90;
  [*(id *)(v0 + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathSlider) value];
  *(void *)(v2 + 56) = &type metadata for Float;
  *(void *)(v2 + 64) = &protocol witness table for Float;
  *(_DWORD *)(v2 + 32) = v3;
  sub_1000290A0();
  NSString v4 = sub_100029070();
  swift_bridgeObjectRelease();
  [v1 setText:v4];

  uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomValueLabel);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10002BC90;
  [*(id *)(v0 + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomSlider) value];
  *(void *)(v6 + 56) = &type metadata for Float;
  *(void *)(v6 + 64) = &protocol witness table for Float;
  *(_DWORD *)(v6 + 32) = v7;
  sub_1000290A0();
  NSString v8 = sub_100029070();
  swift_bridgeObjectRelease();
  [v5 setText:v8];

  [v1 sizeToFit];
  return [v5 sizeToFit];
}

id sub_100022D80()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathSlider];
  [v1 setContinuous:1];
  [v1 setMinimumValue:0.0];
  LODWORD(v2) = 1.0;
  [v1 setMaximumValue:v2];
  LODWORD(v3) = *(_DWORD *)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_startingPathProgress];
  [v1 setValue:v3];
  [v1 addTarget:v0 action:"sliderValueDidChangeWithSender:" forControlEvents:4096];
  id result = [v0 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v5 = result;
  [result bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v26.origin.unsigned int x = v7;
  v26.origin.unsigned int y = v9;
  v26.size.size_t width = v11;
  v26.size.height = v13;
  double Width = CGRectGetWidth(v26);
  id result = [v0 view];
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v15 = result;
  [result bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v27.origin.unsigned int x = v17;
  v27.origin.unsigned int y = v19;
  v27.size.size_t width = v21;
  v27.size.height = v23;
  double v24 = CGRectGetHeight(v27) * 0.5;
  return objc_msgSend(v1, "setCenter:", Width * 0.5, v24);
}

id sub_100022F20()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomSlider];
  [v1 setContinuous:1];
  LODWORD(v2) = 1050253722;
  [v1 setMinimumValue:v2];
  LODWORD(v3) = 1.5;
  [v1 setMaximumValue:v3];
  LODWORD(v4) = 1063675494;
  [v1 setValue:v4];
  [v1 addTarget:v0 action:"sliderValueDidChangeWithSender:" forControlEvents:4096];
  id result = [v0 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  double v6 = result;
  [result bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v27.origin.unsigned int x = v8;
  v27.origin.unsigned int y = v10;
  v27.size.size_t width = v12;
  v27.size.height = v14;
  double Width = CGRectGetWidth(v27);
  id result = [v0 view];
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  double v16 = result;
  [result bounds];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v28.origin.unsigned int x = v18;
  v28.origin.unsigned int y = v20;
  v28.size.size_t width = v22;
  v28.size.height = v24;
  double v25 = CGRectGetHeight(v28) * 0.5;
  return objc_msgSend(v1, "setCenter:", Width * 0.5, v25);
}

id sub_1000230C8()
{
  v85.receiver = v0;
  v85.super_class = (Class)type metadata accessor for PathProgressSliderViewController();
  objc_msgSendSuper2(&v85, "viewWillLayoutSubviews");
  id v1 = *(void **)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_backgroundView];
  id result = [v0 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  double v3 = result;
  [result bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v86.origin.unsigned int x = v5;
  v86.origin.unsigned int y = v7;
  v86.size.size_t width = v9;
  v86.size.height = v11;
  objc_msgSend(v1, "setBounds:", 0.0, 0.0, CGRectGetWidth(v86), 200.0);
  id result = [v0 view];
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  CGFloat v12 = result;
  [result center];
  double v14 = v13;

  id result = [v0 view];
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v15 = result;
  [result bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v87.origin.unsigned int x = v17;
  v87.origin.unsigned int y = v19;
  v87.size.size_t width = v21;
  v87.size.height = v23;
  double Height = CGRectGetHeight(v87);
  [v1 bounds];
  objc_msgSend(v1, "setCenter:", v14, Height + CGRectGetHeight(v88) * -0.5 + -20.0);
  double v25 = *(void **)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathSlider];
  id result = [v0 view];
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  CGRect v26 = result;
  [result bounds];
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v89.origin.unsigned int x = v28;
  v89.origin.unsigned int y = v30;
  v89.size.size_t width = v32;
  v89.size.height = v34;
  objc_msgSend(v25, "setBounds:", 0.0, 0.0, CGRectGetWidth(v89) + -40.0, 50.0);
  id result = [v0 view];
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v35 = result;
  [result bounds];
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;

  v90.origin.unsigned int x = v37;
  v90.origin.unsigned int y = v39;
  v90.size.size_t width = v41;
  v90.size.height = v43;
  CGFloat v44 = CGRectGetWidth(v90) * 0.5;
  [v1 frame];
  double v46 = v45;
  [v1 bounds];
  objc_msgSend(v25, "setCenter:", v44, v46 + CGRectGetHeight(v91) / 3.0);
  double v47 = *(void **)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomSlider];
  id result = [v0 view];
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v48 = result;
  [result bounds];
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  CGFloat v54 = v53;
  CGFloat v56 = v55;

  v92.origin.unsigned int x = v50;
  v92.origin.unsigned int y = v52;
  v92.size.size_t width = v54;
  v92.size.height = v56;
  objc_msgSend(v47, "setBounds:", 0.0, 0.0, CGRectGetWidth(v92) + -40.0, 50.0);
  id result = [v0 view];
  if (result)
  {
    BOOL v57 = result;
    [result bounds];
    CGFloat v59 = v58;
    CGFloat v61 = v60;
    CGFloat v63 = v62;
    CGFloat v65 = v64;

    v93.origin.unsigned int x = v59;
    v93.origin.unsigned int y = v61;
    v93.size.size_t width = v63;
    v93.size.height = v65;
    CGFloat v66 = CGRectGetWidth(v93) * 0.5;
    [v1 frame];
    double v68 = v67;
    [v1 bounds];
    CGFloat v69 = CGRectGetHeight(v94);
    objc_msgSend(v47, "setCenter:", v66, v68 + v69 / 3.0 + v69 / 3.0);
    uint64_t v70 = *(void **)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathValueLabel];
    [v1 frame];
    double v72 = v71;
    [v70 bounds];
    double v73 = v72 + CGRectGetWidth(v95) * 0.5 + 8.0;
    [v1 frame];
    double v75 = v74;
    [v1 bounds];
    double v76 = v75 + CGRectGetHeight(v96);
    [v70 bounds];
    objc_msgSend(v70, "setCenter:", v73, v76 - CGRectGetHeight(v97) * 0.5 + -8.0);
    uint64_t v77 = *(void **)&v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomValueLabel];
    [v1 frame];
    double v79 = v78;
    [v1 bounds];
    double v80 = v79 + CGRectGetWidth(v98);
    [v77 bounds];
    double v81 = v80 - CGRectGetWidth(v99) * 0.5 + -8.0;
    [v1 frame];
    double v83 = v82;
    [v1 bounds];
    double v84 = v83 + CGRectGetHeight(v100);
    [v70 bounds];
    return objc_msgSend(v77, "setCenter:", v81, v84 - CGRectGetHeight(v101) * 0.5 + -8.0);
  }
LABEL_15:
  __break(1u);
  return result;
}

id sub_100023634(void *a1)
{
  uint64_t v2 = v1;
  if (qword_10003BD98 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100028FA0();
  sub_10000E6C0(v4, (uint64_t)qword_10003D6B8);
  id v5 = a1;
  double v6 = sub_100028F80();
  os_log_type_t v7 = sub_1000291F0();
  if (os_log_type_enabled(v6, v7))
  {
    double v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)double v8 = 134217984;
    [v5 value];
    v17[0] = v9;
    sub_1000292C0();

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Slider changed value to %f", v8, 0xCu);
    swift_slowDealloc();
  }
  else
  {
  }
  sub_100023B84();
  if (sub_100029290())
  {
    uint64_t v10 = v2 + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_sliderDelegate;
    swift_beginAccess();
    sub_100014D50(v10, (uint64_t)v17, &qword_10003BEE0);
    if (v18)
    {
      sub_100023BC4((uint64_t)v17, (uint64_t)v15);
      sub_100014E64((uint64_t)v17, &qword_10003BEE0);
      sub_100018C64(v15, v16);
      [v5 value];
      sub_100011C4C(v11- *(float *)(v2 + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_startingPathProgress));
LABEL_12:
      sub_100018CFC((uint64_t)v15);
      return sub_100022BC8();
    }
    goto LABEL_13;
  }
  if (sub_100029290())
  {
    uint64_t v12 = v2 + OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_sliderDelegate;
    swift_beginAccess();
    sub_100014D50(v12, (uint64_t)v17, &qword_10003BEE0);
    if (v18)
    {
      sub_100023BC4((uint64_t)v17, (uint64_t)v15);
      sub_100014E64((uint64_t)v17, &qword_10003BEE0);
      sub_100018C64(v15, v16);
      [v5 value];
      sub_100011DB4(v13);
      goto LABEL_12;
    }
LABEL_13:
    sub_100014E64((uint64_t)v17, &qword_10003BEE0);
  }
  return sub_100022BC8();
}

id sub_10002399C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PathProgressSliderViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100023A74()
{
  return type metadata accessor for PathProgressSliderViewController();
}

uint64_t type metadata accessor for PathProgressSliderViewController()
{
  uint64_t result = qword_10003C938;
  if (!qword_10003C938) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100023AC8()
{
  sub_100012668();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

unint64_t sub_100023B84()
{
  unint64_t result = qword_10003BF30;
  if (!qword_10003BF30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003BF30);
  }
  return result;
}

uint64_t sub_100023BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100023C28(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100023C50(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_1000292C0();
  *a1 = v5;
  return result;
}

void sub_100023CA8()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_posterData];
  uint64_t v2 = type metadata accessor for KaleidoscopePosterData();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathSlider;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)UISlider) init];
  uint64_t v4 = OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomSlider;
  *(void *)&v0[v4] = [objc_allocWithZone((Class)UISlider) init];
  uint64_t v5 = OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_pathValueLabel;
  *(void *)&v0[v5] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v6 = OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_zoomValueLabel;
  *(void *)&v0[v6] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v7 = OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_backgroundView;
  *(void *)&v0[v7] = [objc_allocWithZone((Class)UIView) init];
  double v8 = &v0[OBJC_IVAR____TtC18KaleidoscopePoster32PathProgressSliderViewController_sliderDelegate];
  *((void *)v8 + 4) = 0;
  *(_OWORD *)double v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;

  sub_100029460();
  __break(1u);
}

uint64_t sub_100023E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E274(&qword_10003C040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void *sub_100023E78(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_100026EC8((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_100029430();

  if (!v4) {
    return 0;
  }
  sub_100014F80(0, &qword_10003CA80);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

void *sub_100023F50(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_100026EC8((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_100029430();

  if (!v4) {
    return 0;
  }
  type metadata accessor for KaleidoscopeEditorContentView();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_100024018(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_100026EC8((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void *)(*(void *)(a2 + 56) + 8 * v6);
        swift_retain();
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_100029430();

  if (!v4) {
    return 0;
  }
  type metadata accessor for AnimationDriver();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v9;
  swift_unknownObjectRelease();
  return v5;
}

void sub_1000240E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  int64_t v5 = a5 >> 1;
  if (a5 >> 1 != a4)
  {
    char v6 = a5;
    uint64_t v7 = a4;
    sub_100014F80(0, &qword_10003BF00);
    if (v5 > v7)
    {
      uint64_t v9 = *(void **)(a3 + 8 * v7);
      swift_unknownObjectRetain();
      id v10 = v9;
      char v11 = sub_100029290();

      if ((v11 & 1) != 0 || v7 + 1 == v5)
      {
LABEL_5:
        swift_unknownObjectRelease();
        return;
      }
      uint64_t v12 = v5 - 2;
      uint64_t v13 = a3 + 8;
      if (v6)
      {
        while (v7 + 1 < v5)
        {
          id v17 = *(id *)(v13 + 8 * v7);
          char v18 = sub_100029290();

          if ((v18 & 1) == 0)
          {
            BOOL v16 = v12 == v7++;
            if (!v16) {
              continue;
            }
          }
          goto LABEL_5;
        }
      }
      else
      {
        while (v7 + 1 < v5)
        {
          id v14 = *(id *)(v13 + 8 * v7);
          char v15 = sub_100029290();

          if ((v15 & 1) == 0)
          {
            BOOL v16 = v12 == v7++;
            if (!v16) {
              continue;
            }
          }
          goto LABEL_5;
        }
        __break(1u);
      }
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t sub_100024248(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_100029540();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_100029540() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100024310()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000E274(&qword_10003C040);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  double v45 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = *(void *)(v0 + 48);
  unint64_t v9 = v8 >> 62;
  if (v8 >> 62) {
    goto LABEL_31;
  }
  uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (v10 >= 6)
  {
    do
    {
      unint64_t v49 = v8 & 0xC000000000000001;
      if ((v8 & 0xC000000000000001) != 0)
      {
        sub_100014F80(0, &qword_10003BF00);
        sub_100029370(0);
        sub_100029370(1);
        sub_100029370(2);
        sub_100029370(3);
        sub_100029370(4);
        sub_100029370(5);
      }
      if (v9)
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = sub_100029480();
        uint64_t v30 = v29;
        uint64_t v40 = v32;
        uint64_t v41 = v31;
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_100029470();
        uint64_t v42 = v30;
        if (!v13)
        {
LABEL_26:
          swift_bridgeObjectRelease();
          id v14 = _swiftEmptyArrayStorage;
LABEL_27:
          double v33 = (_DWORD *)swift_slowAlloc();
          *double v33 = 0;
          if (v9)
          {
            swift_bridgeObjectRetain();
            sub_100029470();
            swift_bridgeObjectRelease();
          }
          uint64_t v34 = sub_100014F80(0, &qword_10003CA88);
          __chkstk_darwin(v34);
          *(&v37 - 8) = v1;
          *(&v37 - 7) = (uint64_t)v14;
          *(&v37 - 6) = (uint64_t)v33;
          *(&v37 - 5) = v12;
          uint64_t v35 = v41;
          *(&v37 - 4) = v42;
          *(&v37 - 3) = v35;
          *(&v37 - 2) = v40;
          sub_100029250();
          swift_bridgeObjectRelease();
          swift_slowDealloc();
          return swift_unknownObjectRelease();
        }
      }
      else
      {
        uint64_t v12 = v8 & 0xFFFFFFFFFFFFFF8;
        uint64_t v13 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        uint64_t v40 = 13;
        uint64_t v41 = 0;
        uint64_t v42 = (v8 & 0xFFFFFFFFFFFFFF8) + 32;
        if (!v13) {
          goto LABEL_26;
        }
      }
      CGFloat v50 = _swiftEmptyArrayStorage;
      uint64_t result = sub_100025F80(0, v13 & ~(v13 >> 63), 0);
      if (v13 < 0) {
        goto LABEL_34;
      }
      uint64_t v37 = v12;
      unint64_t v38 = v9;
      uint64_t v39 = v1;
      id v14 = v50;
      uint64_t v15 = sub_10000E274((uint64_t *)&unk_10003BF10);
      uint64_t v16 = 0;
      double v46 = (unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
      uint64_t v47 = v15;
      *(void *)&long long v17 = 138412290;
      long long v43 = v17;
      uint64_t v1 = (uint64_t)v45;
      uint64_t v48 = v13;
      uint64_t v44 = v6;
      while (v13 != v16)
      {
        if (v49) {
          id v18 = (id)sub_100029380();
        }
        else {
          id v18 = *(id *)(v8 + 8 * v16 + 32);
        }
        CGFloat v19 = v18;
        sub_100028E90();
        if ((*v46)(v4, 1, v5) == 1)
        {
          sub_10001A7A0((uint64_t)v4);
          if (qword_10003BD98 != -1) {
            swift_once();
          }
          uint64_t v20 = sub_100028FA0();
          sub_10000E6C0(v20, (uint64_t)qword_10003D6B8);
          CGFloat v21 = v19;
          double v22 = sub_100028F80();
          os_log_type_t v23 = sub_100029220();
          if (os_log_type_enabled(v22, v23))
          {
            CGFloat v24 = v4;
            uint64_t v25 = swift_slowAlloc();
            CGRect v26 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v25 = v43;
            *(void *)(v25 + 4) = v21;
            *CGRect v26 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, v23, "Unable to load Kaleidoscope poster data for look %@. Falling back to first look.", (uint8_t *)v25, 0xCu);
            sub_10000E274((uint64_t *)&unk_10003BDE0);
            swift_arrayDestroy();
            uint64_t v1 = (uint64_t)v45;
            swift_slowDealloc();
            uint64_t v4 = v24;
            uint64_t v6 = v44;
            swift_slowDealloc();
          }
          else
          {

            double v22 = v21;
          }

          uint64_t v27 = sub_100028D40();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v1, 1, 1, v27);

          *(void *)(v1 + *(int *)(v5 + 20)) = 0;
          *(void *)(v1 + *(int *)(v5 + 24)) = 1;
        }
        else
        {
          sub_100014F1C((uint64_t)v4, v1);
        }
        CGFloat v50 = v14;
        unint64_t v9 = v14[2];
        unint64_t v28 = v14[3];
        if (v9 >= v28 >> 1)
        {
          sub_100025F80(v28 > 1, v9 + 1, 1);
          id v14 = v50;
        }
        ++v16;
        v14[2] = v9 + 1;
        sub_100014F1C(v1, (uint64_t)v14+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v9);
        uint64_t v13 = v48;
        if (v48 == v16)
        {
          swift_bridgeObjectRelease();
          unint64_t v9 = v38;
          uint64_t v1 = v39;
          uint64_t v12 = v37;
          goto LABEL_27;
        }
      }
      __break(1u);
LABEL_31:
      swift_bridgeObjectRetain();
      uint64_t result = sub_100029470();
      if (result < 0) {
        goto LABEL_35;
      }
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_100029470();
      uint64_t result = swift_bridgeObjectRelease();
    }
    while (v36 >= 6);
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void sub_10002497C(unint64_t a1, uint64_t a2, uint64_t a3, os_unfair_lock_s *a4, uint64_t a5, id a6, uint64_t a7, unint64_t a8)
{
  CGRect v95 = a5;
  uint64_t v15 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  id v18 = (char *)v88 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = a2;
  uint64_t v19 = *(void *)(a2 + 48);
  uint64_t v96 = (uint64_t)a6;
  if ((v19 & 0xC000000000000001) == 0)
  {
    if ((a1 & 0x8000000000000000) == 0)
    {
      if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) > a1)
      {
        id v20 = *(id *)(v19 + 8 * a1 + 32);
        goto LABEL_5;
      }
LABEL_65:
      __break(1u);
      goto LABEL_66;
    }
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  id v20 = (id)sub_100029380();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_64;
  }
LABEL_5:
  a6 = v20;
  if (*(void *)(a3 + 16) > a1)
  {
    uint64_t v94 = a7;
    sub_1000126C0(a3+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(void *)(v16 + 72) * a1, (uint64_t)v18);
    uint64_t v89 = *(int *)(v15 + 24);
    a2 = *(void *)&v18[v89];
    if (qword_10003BD58 == -1) {
      goto LABEL_7;
    }
    goto LABEL_67;
  }
LABEL_66:
  __break(1u);
LABEL_67:
  swift_once();
LABEL_7:
  uint64_t v21 = qword_10003D648;
  if (qword_10003D648 <= a2) {
    uint64_t v21 = a2;
  }
  if (qword_10003D650 >= v21) {
    unint64_t v22 = v21;
  }
  else {
    unint64_t v22 = qword_10003D650;
  }
  uint64_t v23 = sub_10000DC8C(v22);
  id v25 = sub_100017D84(v23, v24);
  swift_bridgeObjectRelease();
  uint64_t v26 = qword_10003D648;
  if (qword_10003D648 <= a2) {
    uint64_t v26 = a2;
  }
  if (qword_10003D650 >= v26) {
    unint64_t v27 = v26;
  }
  else {
    unint64_t v27 = qword_10003D650;
  }
  uint64_t v28 = sub_10000DC94(v27);
  id v30 = sub_100017D84(v28, v29);
  swift_bridgeObjectRelease();
  os_unfair_lock_lock(a4);
  swift_beginAccess();
  if (v25)
  {
    id v31 = a6;
    sub_10002671C((uint64_t)v25, v31, &qword_10003CA90, sub_100026C6C);
  }
  else
  {
    id v32 = a6;
    id v31 = (id)sub_1000264F0((unint64_t)v32);
  }
  swift_endAccess();
  swift_beginAccess();
  if (v30)
  {
    id v33 = a6;
    sub_10002671C((uint64_t)v30, v33, &qword_10003CA90, sub_100026C6C);
  }
  else
  {
    id v34 = a6;
    id v33 = (id)sub_1000264F0((unint64_t)v34);
  }
  swift_endAccess();
  CGRect v91 = a4;
  os_unfair_lock_unlock(a4);
  if (qword_10003BD98 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_100028FA0();
  uint64_t v36 = sub_10000E6C0(v35, (uint64_t)qword_10003D6B8);
  id v93 = v30;
  id v37 = v30;
  id v38 = a6;
  id v39 = v25;
  uint64_t v40 = v37;
  uint64_t v41 = v38;
  uint64_t v42 = v39;
  v88[1] = v36;
  long long v43 = sub_100028F80();
  os_log_type_t v44 = sub_100029200();
  BOOL v45 = os_log_type_enabled(v43, v44);
  CGRect v97 = v42;
  if (v45)
  {
    v88[0] = a8;
    CGRect v90 = v40;
    CGRect v92 = v18;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v47 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 138412802;
    if (v25)
    {
      uint64_t v48 = v97;
      CGRect v99 = v97;
      unint64_t v49 = v97;
      sub_1000292C0();
    }
    else
    {
      CGRect v99 = 0;
      sub_1000292C0();
      uint64_t v48 = v97;
    }
    *uint64_t v47 = v25;

    *(_WORD *)(v46 + 12) = 2112;
    id v51 = v93;
    if (v93)
    {
      CGFloat v50 = v90;
      CGRect v99 = v90;
      CGFloat v52 = v90;
      id v51 = v93;
      sub_1000292C0();
    }
    else
    {
      CGRect v99 = 0;
      sub_1000292C0();
      CGFloat v50 = v90;
    }
    v47[1] = v51;

    *(_WORD *)(v46 + 22) = 2112;
    CGRect v99 = v41;
    double v53 = v41;
    sub_1000292C0();
    v47[2] = v41;

    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Loading luma %@ and chroma %@ for look %@", (uint8_t *)v46, 0x20u);
    sub_10000E274((uint64_t *)&unk_10003BDE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    id v18 = v92;
    uint64_t v42 = v97;
    a8 = v88[0];
  }
  else
  {

    long long v43 = v42;
    CGFloat v50 = v40;
  }

  sub_1000240E4((uint64_t)v41, (uint64_t)v95, v96, v94, a8);
  if (v54)
  {
    uint64_t v55 = *(void *)&v18[v89];
    uint64_t v56 = qword_10003D648;
    if (qword_10003D648 <= v55) {
      uint64_t v56 = *(void *)&v18[v89];
    }
    if (qword_10003D650 >= v56) {
      uint64_t v57 = v56;
    }
    else {
      uint64_t v57 = qword_10003D650;
    }
    uint64_t v58 = sub_10000DD5C(v57);
    id v60 = sub_100017D84(v58, v59);
    swift_bridgeObjectRelease();
    uint64_t v61 = qword_10003D648;
    if (qword_10003D648 <= v55) {
      uint64_t v61 = v55;
    }
    if (qword_10003D650 >= v61) {
      uint64_t v62 = v61;
    }
    else {
      uint64_t v62 = qword_10003D650;
    }
    uint64_t v63 = sub_10000DD74(v62);
    id v65 = sub_100017D84(v63, v64);
    swift_bridgeObjectRelease();
    uint64_t v96 = (uint64_t)v65;
    id v66 = v65;
    double v67 = v41;
    id v68 = v60;
    CGFloat v69 = v66;
    uint64_t v70 = v67;
    double v71 = v68;
    double v72 = sub_100028F80();
    int v73 = sub_100029200();
    if (os_log_type_enabled(v72, (os_log_type_t)v73))
    {
      LODWORD(v94) = v73;
      CGRect v90 = v50;
      CGRect v92 = v18;
      uint64_t v74 = swift_slowAlloc();
      double v75 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v74 = 138412802;
      if (v60)
      {
        CGRect v99 = v71;
        double v76 = v71;
      }
      else
      {
        CGRect v99 = 0;
      }
      sub_1000292C0();
      *double v75 = v60;

      *(_WORD *)(v74 + 12) = 2112;
      CGRect v95 = v71;
      if (v96)
      {
        CGRect v99 = v69;
        double v78 = v69;
      }
      else
      {
        CGRect v99 = 0;
      }
      sub_1000292C0();
      v75[1] = v96;

      *(_WORD *)(v74 + 22) = 2112;
      CGRect v99 = v70;
      double v79 = v69;
      double v80 = v70;
      sub_1000292C0();
      v75[2] = v70;

      CGFloat v69 = v79;
      _os_log_impl((void *)&_mh_execute_header, v72, (os_log_type_t)v94, "Loading dark luma %@ and dark chroma %@ for look %@", (uint8_t *)v74, 0x20u);
      sub_10000E274((uint64_t *)&unk_10003BDE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      uint64_t v77 = v91;
      id v18 = v92;
      CGFloat v50 = v90;
      double v71 = v95;
    }
    else
    {

      double v72 = v71;
      uint64_t v77 = v91;
    }

    os_unfair_lock_lock(v77);
    swift_beginAccess();
    double v81 = v70;
    double v82 = v81;
    if (v60)
    {
      sub_10002671C((uint64_t)v71, v81, &qword_10003CA90, sub_100026C6C);
      double v83 = v82;
    }
    else
    {
      double v83 = (void *)sub_1000264F0((unint64_t)v81);
    }
    swift_endAccess();
    swift_beginAccess();
    double v84 = v82;
    objc_super v85 = v84;
    if (v96)
    {
      sub_10002671C((uint64_t)v69, v84, &qword_10003CA90, sub_100026C6C);
      CGRect v86 = v85;
    }
    else
    {
      CGRect v86 = (void *)sub_1000264F0((unint64_t)v84);
    }
    CGRect v87 = v97;

    swift_endAccess();
    os_unfair_lock_unlock(v77);

    sub_100014DB4((uint64_t)v18);
  }
  else
  {
    sub_100014DB4((uint64_t)v18);
  }
}

uint64_t sub_100025324(void *a1, uint64_t a2)
{
  uint64_t v40 = a2;
  uint64_t v4 = sub_100028FA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = v2[6];
  uint64_t v9 = v8 >> 62;
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_100029470();
    if (result < 0)
    {
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_100029470();
    swift_bridgeObjectRelease();
    if (v34 >= 6)
    {
LABEL_3:
      if ((v8 & 0xC000000000000001) != 0)
      {
        sub_100014F80(0, &qword_10003BF00);
        sub_100029370(0);
        sub_100029370(1);
        sub_100029370(2);
        sub_100029370(3);
        sub_100029370(4);
        sub_100029370(5);
      }
      if (v9)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_100029480();
        uint64_t v12 = v14;
        uint64_t v9 = v15;
        unint64_t v13 = v16;
        swift_bridgeObjectRelease_n();
      }
      else
      {
        uint64_t v11 = v8 & 0xFFFFFFFFFFFFFF8;
        uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFF8) + 32;
        unint64_t v13 = 13;
      }
      uint64_t v39 = v11;
      if (v40 == 2 && (sub_1000240E4((uint64_t)a1, v11, v12, v9, v13), (v17 & 1) != 0)) {
        id v18 = v2 + 4;
      }
      else {
        id v18 = v2 + 2;
      }
      swift_beginAccess();
      uint64_t v19 = *v18;
      swift_bridgeObjectRetain();
      uint64_t v2 = a1;
      a1 = sub_100023E78(v2, v19);

      swift_bridgeObjectRelease();
      if (qword_10003BD98 == -1) {
        goto LABEL_13;
      }
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v10 >= 6) {
      goto LABEL_3;
    }
  }
  __break(1u);
LABEL_29:
  swift_once();
LABEL_13:
  uint64_t v20 = sub_10000E6C0(v4, (uint64_t)qword_10003D6B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v20, v4);
  id v21 = a1;
  unint64_t v22 = v2;
  id v23 = v21;
  unint64_t v24 = v22;
  id v25 = sub_100028F80();
  os_log_type_t v26 = sub_100029200();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v36 = v7;
    uint64_t v37 = v5;
    uint64_t v38 = v4;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v42 = v35;
    *(_DWORD *)uint64_t v27 = 138412802;
    if (a1)
    {
      uint64_t v41 = (uint64_t)v23;
      id v29 = v23;
    }
    else
    {
      uint64_t v41 = 0;
    }
    sub_1000292C0();
    *uint64_t v28 = a1;

    *(_WORD *)(v27 + 12) = 2080;
    if (v40 == 1) {
      uint64_t v30 = 0x746867696CLL;
    }
    else {
      uint64_t v30 = 1802658148;
    }
    if (v40 == 1) {
      unint64_t v31 = 0xE500000000000000;
    }
    else {
      unint64_t v31 = 0xE400000000000000;
    }
    uint64_t v41 = sub_10002060C(v30, v31, &v42);
    sub_1000292C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 22) = 2112;
    uint64_t v41 = (uint64_t)v24;
    id v32 = v24;
    sub_1000292C0();
    v28[1] = v24;

    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Retrieved backing luma %@ for appearance %s for look %@", (uint8_t *)v27, 0x20u);
    sub_10000E274((uint64_t *)&unk_10003BDE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v36, v38);
  }
  else
  {

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return (uint64_t)a1;
}

uint64_t sub_1000258A4(void *a1, uint64_t a2)
{
  uint64_t v40 = a2;
  uint64_t v4 = sub_100028FA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = v2[6];
  uint64_t v9 = v8 >> 62;
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_100029470();
    if (result < 0)
    {
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_100029470();
    swift_bridgeObjectRelease();
    if (v34 >= 6)
    {
LABEL_3:
      if ((v8 & 0xC000000000000001) != 0)
      {
        sub_100014F80(0, &qword_10003BF00);
        sub_100029370(0);
        sub_100029370(1);
        sub_100029370(2);
        sub_100029370(3);
        sub_100029370(4);
        sub_100029370(5);
      }
      if (v9)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_100029480();
        uint64_t v12 = v14;
        uint64_t v9 = v15;
        unint64_t v13 = v16;
        swift_bridgeObjectRelease_n();
      }
      else
      {
        uint64_t v11 = v8 & 0xFFFFFFFFFFFFFF8;
        uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFF8) + 32;
        unint64_t v13 = 13;
      }
      uint64_t v39 = v11;
      if (v40 == 2 && (sub_1000240E4((uint64_t)a1, v11, v12, v9, v13), (v17 & 1) != 0)) {
        id v18 = v2 + 5;
      }
      else {
        id v18 = v2 + 3;
      }
      swift_beginAccess();
      uint64_t v19 = *v18;
      swift_bridgeObjectRetain();
      uint64_t v2 = a1;
      a1 = sub_100023E78(v2, v19);

      swift_bridgeObjectRelease();
      if (qword_10003BD98 == -1) {
        goto LABEL_13;
      }
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v10 >= 6) {
      goto LABEL_3;
    }
  }
  __break(1u);
LABEL_29:
  swift_once();
LABEL_13:
  uint64_t v20 = sub_10000E6C0(v4, (uint64_t)qword_10003D6B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v20, v4);
  id v21 = a1;
  unint64_t v22 = v2;
  id v23 = v21;
  unint64_t v24 = v22;
  id v25 = sub_100028F80();
  os_log_type_t v26 = sub_100029200();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v36 = v7;
    uint64_t v37 = v5;
    uint64_t v38 = v4;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v42 = v35;
    *(_DWORD *)uint64_t v27 = 138412802;
    if (a1)
    {
      uint64_t v41 = (uint64_t)v23;
      id v29 = v23;
    }
    else
    {
      uint64_t v41 = 0;
    }
    sub_1000292C0();
    *uint64_t v28 = a1;

    *(_WORD *)(v27 + 12) = 2080;
    if (v40 == 1) {
      uint64_t v30 = 0x746867696CLL;
    }
    else {
      uint64_t v30 = 1802658148;
    }
    if (v40 == 1) {
      unint64_t v31 = 0xE500000000000000;
    }
    else {
      unint64_t v31 = 0xE400000000000000;
    }
    uint64_t v41 = sub_10002060C(v30, v31, &v42);
    sub_1000292C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 22) = 2112;
    uint64_t v41 = (uint64_t)v24;
    id v32 = v24;
    sub_1000292C0();
    v28[1] = v24;

    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Retrieved backing chroma %@ for appearance %s for look %@", (uint8_t *)v27, 0x20u);
    sub_10000E274((uint64_t *)&unk_10003BDE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v36, v38);
  }
  else
  {

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return (uint64_t)a1;
}

uint64_t sub_100025E24()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for KaleidoscopeArtFileManager()
{
  return self;
}

void sub_100025EA0(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_1000292C0();
  *a1 = v7;
  unint64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_100025F58(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100025F80(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100025FC0(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100025FA0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100026200(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_100025FC0(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000E274(&qword_10003CA98);
  uint64_t v10 = *(void *)(type metadata accessor for KaleidoscopePosterData() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for KaleidoscopePosterData() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  id v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  id v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_1000294C0();
  __break(1u);
  return result;
}

uint64_t sub_100026200(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000E274(&qword_10003CAA0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1000294C0();
  __break(1u);
  return result;
}

uint64_t sub_10002636C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100026EC8(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v19 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1000282F4();
      uint64_t v9 = v19;
    }

    uint64_t v10 = *(void *)(v9 + 56);
    uint64_t v11 = type metadata accessor for KaleidoscopePosterData();
    uint64_t v18 = *(void *)(v11 - 8);
    sub_100014F1C(v10 + *(void *)(v18 + 72) * v6, a2);
    sub_100027864(v6, v9);
    uint64_t *v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
    uint64_t v13 = a2;
    uint64_t v14 = 0;
    uint64_t v15 = v11;
  }
  else
  {
    uint64_t v16 = type metadata accessor for KaleidoscopePosterData();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
    uint64_t v15 = v16;
    uint64_t v13 = a2;
    uint64_t v14 = 1;
  }
  return v12(v13, v14, 1, v15);
}

uint64_t sub_1000264F0(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_100026EC8(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      Swift::Int v9 = *v2;
      Swift::Int v17 = *v2;
      Swift::Int *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_1000286F8(&qword_10003CA90);
        Swift::Int v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = sub_100029430();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = sub_100029420();
  Swift::Int v9 = sub_100026C6C(v5, v8);
  swift_retain();
  a1 = sub_100026EC8((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  sub_100027A50(a1, v9);
  Swift::Int *v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_100026648(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_100029420();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int *v3 = sub_1000267E8(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  Swift::Int v10 = *v3;
  Swift::Int *v3 = 0x8000000000000000;
  sub_100027D68(a1, a2, isUniquelyReferenced_nonNull_native);
  Swift::Int *v3 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000266FC(uint64_t a1, void *a2)
{
  return sub_10002671C(a1, a2, &qword_10003CAB8, sub_100026A24);
}

uint64_t sub_10002671C(uint64_t a1, void *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = v4;
  uint64_t v9 = *v4;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    if (v9 < 0) {
      uint64_t v11 = *v4;
    }
    else {
      uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_100029420();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t *v6 = a4(v11, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v14 = *v6;
  uint64_t *v6 = 0x8000000000000000;
  sub_100027EDC(a1, a2, isUniquelyReferenced_nonNull_native, a3);
  uint64_t *v6 = v14;
  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000267E8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000E274(&qword_10003CAB0);
    uint64_t v2 = sub_1000294B0();
    uint64_t v18 = v2;
    sub_100029410();
    uint64_t v3 = sub_100029440();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_100014F80(0, &qword_10003BF00);
      do
      {
        swift_dynamicCast();
        type metadata accessor for AnimationDriver();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_1000272BC(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        Swift::Int result = sub_100029280(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_100029440();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

Swift::Int sub_100026A24(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000E274(&qword_10003CAB8);
    uint64_t v2 = sub_1000294B0();
    uint64_t v18 = v2;
    sub_100029410();
    uint64_t v3 = sub_100029440();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_100014F80(0, &qword_10003BF00);
      do
      {
        swift_dynamicCast();
        type metadata accessor for KaleidoscopeEditorContentView();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_100027594(v12 + 1, 1, &qword_10003CAB8);
          uint64_t v2 = v18;
        }
        Swift::Int result = sub_100029280(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_100029440();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

Swift::Int sub_100026C6C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000E274(&qword_10003CA90);
    uint64_t v2 = sub_1000294B0();
    uint64_t v18 = v2;
    sub_100029410();
    uint64_t v3 = sub_100029440();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_100014F80(0, &qword_10003BF00);
      do
      {
        swift_dynamicCast();
        sub_100014F80(0, &qword_10003CA80);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_100027594(v12 + 1, 1, &qword_10003CA90);
          uint64_t v2 = v18;
        }
        Swift::Int result = sub_100029280(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_100029440();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

unint64_t sub_100026EC8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100029280(*(void *)(v2 + 40));
  return sub_1000280FC(a1, v4);
}

unint64_t sub_100026F0C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100029300(*(void *)(v2 + 40));
  return sub_10002822C(a1, v4);
}

uint64_t sub_100026F50(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v40 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_10000E274(&qword_10003CAA8);
  int v41 = a2;
  uint64_t v9 = sub_1000294A0();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v38 = v2;
  uint64_t v39 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  int64_t v15 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v16 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v15) {
      break;
    }
    id v23 = v39;
    unint64_t v24 = v39[v22];
    ++v18;
    if (!v24)
    {
      int64_t v18 = v22 + 1;
      if (v22 + 1 >= v15) {
        goto LABEL_34;
      }
      unint64_t v24 = v39[v18];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v15)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v38;
          if ((v41 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v39[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v18 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v18 >= v15) {
              goto LABEL_34;
            }
            unint64_t v24 = v39[v18];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v18 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    os_log_type_t v26 = *(void **)(*(void *)(v8 + 48) + 8 * v21);
    uint64_t v27 = *(void *)(v40 + 72);
    uint64_t v28 = *(void *)(v8 + 56) + v27 * v21;
    if (v41)
    {
      sub_100014F1C(v28, (uint64_t)v7);
    }
    else
    {
      sub_1000126C0(v28, (uint64_t)v7);
      id v29 = v26;
    }
    uint64_t result = sub_100029280(*(void *)(v10 + 40));
    uint64_t v30 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v16 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v31) & ~*(void *)(v16 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v16 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v19 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    *(void *)(*(void *)(v10 + 48) + 8 * v19) = v26;
    uint64_t result = sub_100014F1C((uint64_t)v7, *(void *)(v10 + 56) + v27 * v19);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v38;
  id v23 = v39;
  if ((v41 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v8 + 32);
  if (v37 >= 64) {
    bzero(v23, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v37;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_1000272BC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000E274(&qword_10003CAB0);
  uint64_t v6 = sub_1000294A0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  BOOL v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    id v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    unint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      swift_retain();
    }
    uint64_t result = sub_100029280(*(void *)(v7 + 40));
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  id v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_100027594(uint64_t a1, char a2, uint64_t *a3)
{
  Swift::Int v4 = v3;
  uint64_t v6 = *v3;
  sub_10000E274(a3);
  uint64_t v7 = sub_1000294A0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v37 = v3;
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v15 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v22 = v21 | (v15 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v12) {
      break;
    }
    unint64_t v24 = (void *)(v6 + 64);
    unint64_t v25 = *(void *)(v38 + 8 * v23);
    ++v15;
    if (!v25)
    {
      int64_t v15 = v23 + 1;
      if (v23 + 1 >= v12) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v38 + 8 * v15);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_33:
          swift_release();
          Swift::Int v4 = v37;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v15 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v15 >= v12) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v38 + 8 * v15);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v15 = v26;
      }
    }
LABEL_30:
    unint64_t v11 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_31:
    uint64_t v31 = 8 * v22;
    uint64_t v32 = *(void **)(*(void *)(v6 + 48) + v31);
    id v33 = *(void **)(*(void *)(v6 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      id v34 = v32;
      id v35 = v33;
    }
    uint64_t result = sub_100029280(*(void *)(v8 + 40));
    uint64_t v16 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v18 == v28;
        if (v18 == v28) {
          unint64_t v18 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v13 + 8 * v18);
      }
      while (v30 == -1);
      unint64_t v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t v20 = 8 * v19;
    *(void *)(*(void *)(v8 + 48) + v20) = v32;
    *(void *)(*(void *)(v8 + 56) + v20) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  Swift::Int v4 = v37;
  unint64_t v24 = (void *)(v6 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v36 = 1 << *(unsigned char *)(v6 + 32);
  if (v36 >= 64) {
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v36;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *Swift::Int v4 = v8;
  return result;
}

void sub_100027864(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_1000292F0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(a2 + 40);
        id v11 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        Swift::Int v12 = sub_100029280(v10);

        Swift::Int v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 < v9 || v3 < v13) {
            goto LABEL_6;
          }
        }
        else if (v13 < v9 && v3 < v13)
        {
          goto LABEL_6;
        }
        uint64_t v16 = *(void *)(a2 + 48);
        unint64_t v17 = (void *)(v16 + 8 * v3);
        unint64_t v18 = (void *)(v16 + 8 * v6);
        if (v3 != v6 || v17 >= v18 + 1) {
          *unint64_t v17 = *v18;
        }
        uint64_t v19 = *(void *)(a2 + 56);
        uint64_t v20 = *(void *)(*(void *)(type metadata accessor for KaleidoscopePosterData() - 8) + 72);
        int64_t v21 = v20 * v3;
        unint64_t v22 = v19 + v20 * v3;
        int64_t v23 = v20 * v6;
        unint64_t v24 = v19 + v20 * v6 + v20;
        if (v21 < v23 || v22 >= v24)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v21 == v23) {
            goto LABEL_6;
          }
          swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v26 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v27 = *v26;
    uint64_t v28 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v26 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v28 = *v26;
    uint64_t v27 = (-1 << a1) - 1;
  }
  *int64_t v26 = v28 & v27;
  uint64_t v29 = *(void *)(a2 + 16);
  BOOL v30 = __OFSUB__(v29, 1);
  uint64_t v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
}

void sub_100027A50(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_1000292F0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(a2 + 40);
        id v11 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        Swift::Int v12 = sub_100029280(v10);

        Swift::Int v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v3 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(a2 + 48);
            unint64_t v17 = (void *)(v16 + 8 * v3);
            unint64_t v18 = (void *)(v16 + 8 * v6);
            if (v3 != v6 || v17 >= v18 + 1) {
              *unint64_t v17 = *v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            uint64_t v20 = (void *)(v19 + 8 * v3);
            int64_t v21 = (void *)(v19 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 1))
            {
              *uint64_t v20 = *v21;
              int64_t v3 = v6;
            }
          }
        }
        else if (v13 >= v9 || v3 >= v13)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v22 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << a1) - 1;
  }
  uint64_t *v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
}

id sub_100027C04(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_100026EC8((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_1000282F4();
      goto LABEL_7;
    }
    sub_100026F50(v12, a3 & 1);
    unint64_t v19 = sub_100026EC8((uint64_t)a2);
    if ((v13 & 1) == (v20 & 1))
    {
      unint64_t v9 = v19;
      int64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    sub_100014F80(0, &qword_10003BF00);
    id result = (id)sub_100029560();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    uint64_t v16 = v15[7];
    uint64_t v17 = v16 + *(void *)(*(void *)(type metadata accessor for KaleidoscopePosterData() - 8) + 72) * v9;
    return (id)sub_100021C18(a1, v17);
  }
LABEL_13:
  sub_100028068(v9, (uint64_t)a2, a1, v15);
  return a2;
}

id sub_100027D68(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_100026EC8((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_10002854C();
LABEL_7:
    int64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_release();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1000272BC(v12, a3 & 1);
  unint64_t v18 = sub_100026EC8((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_100014F80(0, &qword_10003BF00);
    id result = (id)sub_100029560();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  int64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v23;
  return a2;
}

void sub_100027EDC(uint64_t a1, void *a2, char a3, uint64_t *a4)
{
  unint64_t v6 = v4;
  uint64_t v9 = *v4;
  unint64_t v11 = sub_100026EC8((uint64_t)a2);
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v15 = v10;
  uint64_t v16 = *(void *)(v9 + 24);
  if (v16 >= v14 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v16 >= v14 && (a3 & 1) == 0)
  {
    sub_1000286F8(a4);
LABEL_7:
    uint64_t v17 = (void *)*v6;
    if (v15)
    {
LABEL_8:
      uint64_t v18 = v17[7];

      *(void *)(v18 + 8 * v11) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_100027594(v14, a3 & 1, a4);
  unint64_t v19 = sub_100026EC8((uint64_t)a2);
  if ((v15 & 1) != (v20 & 1))
  {
LABEL_17:
    sub_100014F80(0, &qword_10003BF00);
    sub_100029560();
    __break(1u);
    return;
  }
  unint64_t v11 = v19;
  uint64_t v17 = (void *)*v6;
  if (v15) {
    goto LABEL_8;
  }
LABEL_11:
  v17[(v11 >> 6) + 8] |= 1 << v11;
  uint64_t v21 = 8 * v11;
  *(void *)(v17[6] + v21) = a2;
  *(void *)(v17[7] + v21) = a1;
  uint64_t v22 = v17[2];
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v17[2] = v24;
  id v25 = a2;
}

uint64_t sub_100028068(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for KaleidoscopePosterData();
  uint64_t result = sub_100014F1C(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

unint64_t sub_1000280FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_100014F80(0, &qword_10003BF00);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_100029290();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_100029290();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

void sub_100028218(unint64_t a1)
{
  sub_10002497C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(os_unfair_lock_s **)(v1 + 32), *(void *)(v1 + 40), *(id *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64));
}

unint64_t sub_10002822C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100028898(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100029310();
      sub_100014E10((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

id sub_1000282F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for KaleidoscopePosterData();
  uint64_t v25 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  unint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E274(&qword_10003CAA8);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_100029490();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    id result = (id)swift_release();
LABEL_25:
    uint64_t *v1 = v7;
    return result;
  }
  uint64_t v24 = v1;
  id result = (id)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v9 + 8 * v10) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v9 + 8 * v11);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_9:
    uint64_t v18 = 8 * v17;
    unint64_t v19 = *(void **)(*(void *)(v5 + 48) + 8 * v17);
    unint64_t v20 = *(void *)(v25 + 72) * v17;
    sub_1000126C0(*(void *)(v5 + 56) + v20, (uint64_t)v4);
    *(void *)(*(void *)(v7 + 48) + v18) = v19;
    sub_100014F1C((uint64_t)v4, *(void *)(v7 + 56) + v20);
    id result = v19;
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_23:
    id result = (id)swift_release();
    uint64_t v1 = v24;
    goto LABEL_25;
  }
  unint64_t v22 = *(void *)(v9 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_10002854C()
{
  uint64_t v1 = v0;
  sub_10000E274(&qword_10003CAB0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100029490();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1000286F8(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_10000E274(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_100029490();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v14) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v21);
    ++v10;
    if (!v22)
    {
      int64_t v10 = v21 + 1;
      if (v21 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v7 + 8 * v10);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void **)(*(void *)(v3 + 48) + v17);
    id v19 = *(void **)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    *(void *)(*(void *)(v5 + 56) + v17) = v19;
    id v20 = v18;
    id result = v19;
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v14) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v7 + 8 * v23);
  if (v22)
  {
    int64_t v10 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v10);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100028898(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100028918()
{
  sub_10000563C();
  sub_100005620((void *)&_mh_execute_header, v0, v1, "[kaleidoscope pathfinder cache] nil path generated by pathfinder for image %@, returning early", v2, v3, v4, v5, v6);
}

void sub_100028980()
{
  sub_1000055E8();
  sub_100005600((void *)&_mh_execute_header, v0, v1, "[kaleidoscope pathfinder cache] unable to unarchive: %@ due to %@");
}

void sub_1000289E8()
{
  sub_10000563C();
  sub_100005620((void *)&_mh_execute_header, v0, v1, "[kaleidoscope pathfinder cache] unknown error %@", v2, v3, v4, v5, v6);
}

void sub_100028A50()
{
  sub_10000563C();
  sub_100005620((void *)&_mh_execute_header, v0, v1, "[kaleidoscope pathfinder cache] error during load: %@", v2, v3, v4, v5, v6);
}

void sub_100028AB8()
{
  sub_1000055E8();
  sub_100005600((void *)&_mh_execute_header, v0, v1, "[kaleidoscope pathfinder cache] cannot set class D on file %@: error %@");
}

void sub_100028B20()
{
  sub_1000055E8();
  sub_100005600((void *)&_mh_execute_header, v0, v1, "[kaleidoscope pathfinder cache] error writing archive %@: %@");
}

void sub_100028B88()
{
  sub_10000563C();
  sub_100005620((void *)&_mh_execute_header, v0, v1, "[kaleidoscope pathfinder cache] skip writing %@ before first unlock", v2, v3, v4, v5, v6);
}

void sub_100028BF0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[kaleidoscope pathfinder cache] insufficent path length %d", (uint8_t *)v2, 8u);
}

void sub_100028C68()
{
  __assert_rtn("+[NTKKaleidoscopeResourceManager sharedInstanceWithPixelFormat:]", "NTKKaleidoscopeResourceManager.m", 75, "((NTKKaleidoscopeResourceManager*)__sharedInstance)->_viewMtlPixelFormat == pixFmt");
}

void sub_100028C94()
{
  __assert_rtn("-[NTKKaleidoscopeResourceManager _pipelineStateForShaderType:vertexName:fragmentName:inLibrary:archive:allowsBlending:]", "NTKKaleidoscopeResourceManager.m", 232, "pipelineState != nil");
}

uint64_t sub_100028CC0()
{
  return static JSONEncoder.OutputFormatting.sortedKeys.getter();
}

uint64_t sub_100028CD0()
{
  return type metadata accessor for JSONEncoder.OutputFormatting();
}

uint64_t sub_100028CE0()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter();
}

uint64_t sub_100028CF0()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_100028D00()
{
  return JSONEncoder.init()();
}

uint64_t sub_100028D10()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_100028D20()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100028D30()
{
  return UUID.init()();
}

uint64_t sub_100028D40()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100028D50()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_100028D60()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100028D70()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100028D80()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_100028D90()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100028DA0()
{
  return WatchFacesWallpaperSupportFeatureFlags.isEnabled.getter();
}

uint64_t sub_100028DB0()
{
  return type metadata accessor for WatchFacesWallpaperSupportFeatureFlags();
}

uint64_t sub_100028DC0()
{
  return PosterData.editingLook.getter();
}

uint64_t sub_100028DD0()
{
  return PosterData.init(lookIdentifier:)();
}

uint64_t sub_100028DE0()
{
  return PosterData.init(data:)();
}

uint64_t sub_100028DF0()
{
  return PosterData.init(string:)();
}

uint64_t sub_100028E00()
{
  return UnlockState.isTransitioning.getter();
}

uint64_t sub_100028E10()
{
  return static UnlockState.locked.getter();
}

uint64_t sub_100028E20()
{
  return UnlockState.progress.getter();
}

uint64_t sub_100028E30()
{
  return type metadata accessor for UnlockState();
}

uint64_t sub_100028E40()
{
  return SnapshotType.init(renderer:)();
}

uint64_t sub_100028E50()
{
  return type metadata accessor for SnapshotType();
}

uint64_t sub_100028E60()
{
  return SnapshotManager.init()();
}

uint64_t sub_100028E70()
{
  return type metadata accessor for SnapshotManager();
}

uint64_t sub_100028E80()
{
  return static PosterDataLoader.comparePosterData(from:to:)();
}

uint64_t sub_100028E90()
{
  return static PosterDataLoader.from(look:)();
}

uint64_t sub_100028EA0()
{
  return static PosterDataLoader.from(editor:)();
}

uint64_t sub_100028EB0()
{
  return static PosterDataLoader.from(renderer:)();
}

uint64_t sub_100028EC0()
{
  return PrivateFeatureFlags.isEnabled.getter();
}

uint64_t sub_100028ED0()
{
  return type metadata accessor for PrivateFeatureFlags();
}

uint64_t sub_100028EE0()
{
  return dispatch thunk of PosterRotationAnimator.orientation.setter();
}

uint64_t sub_100028EF0()
{
  return dispatch thunk of PosterRotationAnimator.startIfNeeded(editor:transition:)();
}

uint64_t sub_100028F00()
{
  return dispatch thunk of PosterRotationAnimator.startIfNeeded(renderer:transition:)();
}

uint64_t sub_100028F10()
{
  return dispatch thunk of PosterRotationAnimator.delegate.setter();
}

uint64_t sub_100028F20()
{
  return PosterRotationAnimator.init()();
}

uint64_t sub_100028F30()
{
  return type metadata accessor for PosterRotationAnimator();
}

uint64_t sub_100028F40()
{
  return WakeState.isTransitioning.getter();
}

uint64_t sub_100028F50()
{
  return WakeState.backlightProgress.getter();
}

uint64_t sub_100028F60()
{
  return static WakeState.off.getter();
}

uint64_t sub_100028F70()
{
  return type metadata accessor for WakeState();
}

uint64_t sub_100028F80()
{
  return Logger.logObject.getter();
}

uint64_t sub_100028F90()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100028FA0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100028FB0()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_100028FC0()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100028FD0()
{
  return PRProviderConfiguration.init(content:)();
}

uint64_t sub_100028FE0()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100028FF0()
{
  return PRRenderingConfiguration.init(_:)();
}

NSDictionary sub_100029000()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100029010()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029020()
{
  return Dictionary.description.getter();
}

unint64_t sub_100029030()
{
  return (unint64_t)Encodable.userInfo()();
}

uint64_t sub_100029040()
{
  return FloatingPoint.smoothstep.getter();
}

uint64_t sub_100029050()
{
  return FloatingPoint.reverse.getter();
}

uint64_t sub_100029060()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100029070()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100029080()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029090()
{
  return String.init(data:encoding:)();
}

uint64_t sub_1000290A0()
{
  return String.init(format:_:)();
}

uint64_t sub_1000290B0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_1000290C0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_1000290D0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000290E0()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_1000290F0()
{
  return static String.localized(key:tableSuffix:comment:)();
}

uint64_t sub_100029100()
{
  return String.hash(into:)();
}

void sub_100029110(Swift::String a1)
{
}

Swift::Int sub_100029120()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100029130()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100029140()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100029150()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029160()
{
  return Array.description.getter();
}

uint64_t sub_100029170()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100029180()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100029190()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

double sub_1000291A0(Swift::Int to)
{
  return Double.truncate(to:)(to);
}

uint64_t sub_1000291B0()
{
  return Double.write<A>(to:)();
}

uint64_t sub_1000291C0()
{
  return PRRenderer.isSnapshot.getter();
}

uint64_t sub_1000291D0()
{
  return PRRenderer.unlockState.getter();
}

uint64_t sub_1000291E0()
{
  return PRRenderer.wakeState.getter();
}

uint64_t sub_1000291F0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100029200()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100029210()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100029220()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100029230()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100029240()
{
  return PRPosterContents.posterData<A>()();
}

uint64_t sub_100029250()
{
  return static OS_dispatch_queue.concurrentPerform(iterations:execute:)();
}

uint64_t sub_100029260()
{
  return UISheetPresentationController.preferredCornerRadius.setter();
}

uint64_t sub_100029270()
{
  return static UISheetPresentationControllerDetent.custom(identifier:resolver:)();
}

Swift::Int sub_100029280(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100029290()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000292A0()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_1000292B0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000292C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000292D0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000292E0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000292F0()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_100029300(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100029310()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100029320()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100029330()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100029340()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_100029350(Swift::Int a1)
{
}

uint64_t sub_100029360()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_100029370(Swift::Int a1)
{
}

uint64_t sub_100029380()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000293A0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000293B0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000293C0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000293D0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000293E0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000293F0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100029400()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100029410()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_100029420()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_100029430()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_100029440()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_100029450()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100029460()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100029470()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100029480()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_100029490()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000294A0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000294B0()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t sub_1000294C0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_1000294D0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000294E0()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_1000294F0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100029500()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100029510()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100029520()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100029530()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_100029540()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100029550()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100029560()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100029570()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100029580()
{
  return Hasher.init(_seed:)();
}

void sub_100029590(Swift::UInt a1)
{
}

Swift::Int sub_1000295A0()
{
  return Hasher._finalize()();
}

uint64_t sub_1000295B0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1000295C0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void CFRelease(CFTypeRef cf)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return _CGDataProviderCreateWithData(info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return _CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, bitmapInfo, provider, decode, shouldInterpolate, intent);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithURL(url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

uint64_t CLKDeviceCategoryForSizeClass()
{
  return _CLKDeviceCategoryForSizeClass();
}

uint64_t CLKUIConvertToRGBfFromSRGB8_fast()
{
  return _CLKUIConvertToRGBfFromSRGB8_fast();
}

uint64_t CLKUIConvertToSRGB8FromRGBf_fast()
{
  return _CLKUIConvertToSRGB8FromRGBf_fast();
}

uint64_t CLKUIConvertToSRGBfFromRGBf_fast()
{
  return _CLKUIConvertToSRGBfFromRGBf_fast();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CLKUILAB2RGB()
{
  return __CLKUILAB2RGB();
}

uint64_t _CLKUIRGB2LAB()
{
  return __CLKUIRGB2LAB();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

float cosf(float a1)
{
  return _cosf(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
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

id objc_msgSend_CAColorMatrixValue(void *a1, const char *a2, ...)
{
  return _[a1 CAColorMatrixValue];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend__dictionaryHasValidValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dictionaryHasValidValues:");
}

id objc_msgSend__dictionaryPassesBasicCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dictionaryPassesBasicCheck:");
}

id objc_msgSend__loadMTLBufferData(void *a1, const char *a2, ...)
{
  return _[a1 _loadMTLBufferData];
}

id objc_msgSend__loadPrograms(void *a1, const char *a2, ...)
{
  return _[a1 _loadPrograms];
}

id objc_msgSend__pipelineStateForShaderType_vertexName_fragmentName_inLibrary_archive_allowsBlending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pipelineStateForShaderType:vertexName:fragmentName:inLibrary:archive:allowsBlending:");
}

id objc_msgSend__queue_setupPipelineForType_vertexName_fragmentName_inLibrary_archive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_setupPipelineForType:vertexName:fragmentName:inLibrary:archive:");
}

id objc_msgSend_addClient(void *a1, const char *a2, ...)
{
  return _[a1 addClient];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_archiveWithName_bundle_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archiveWithName:bundle:device:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_atlas(void *a1, const char *a2, ...)
{
  return _[a1 atlas];
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_bind_slot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bind:slot:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return _[a1 colorAttachments];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return _[a1 colorPixelFormat];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_configurationByApplyingConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationByApplyingConfiguration:");
}

id objc_msgSend_configurationWithHierarchicalColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithHierarchicalColor:");
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPointSize:");
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return _[a1 contents];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createCGImage_fromRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createCGImage:fromRect:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeBytesForKey_returnedLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBytesForKey:returnedLength:");
}

id objc_msgSend_decodeFloatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeFloatForKey:");
}

id objc_msgSend_decodeInt32ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt32ForKey:");
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultAnalysis(void *a1, const char *a2, ...)
{
  return _[a1 defaultAnalysis];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_dialRadius(void *a1, const char *a2, ...)
{
  return _[a1 dialRadius];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_drawPrimitives_vertexStart_vertexCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawPrimitives:vertexStart:vertexCount:");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeBytes_length_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBytes:length:forKey:");
}

id objc_msgSend_encodeFloat_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeFloat:forKey:");
}

id objc_msgSend_encodeInt32_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt32:forKey:");
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return _[a1 extent];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filterWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithName:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_functionDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 functionDescriptor];
}

id objc_msgSend_geomBuffer(void *a1, const char *a2, ...)
{
  return _[a1 geomBuffer];
}

id objc_msgSend_getGeometryBuffer(void *a1, const char *a2, ...)
{
  return _[a1 getGeometryBuffer];
}

id objc_msgSend_getPipelineForShaderType_blending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPipelineForShaderType:blending:");
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return _[a1 height];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return _[a1 imageOrientation];
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCGImage:scale:orientation:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCGImage:scale:orientation:");
}

id objc_msgSend_initWithContent_width_height_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContent:width:height:");
}

id objc_msgSend_initWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:options:error:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithPixelFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPixelFormat:");
}

id objc_msgSend_initWithShaderType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShaderType:");
}

id objc_msgSend_initWithStructure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStructure:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidAnalysis(void *a1, const char *a2, ...)
{
  return _[a1 invalidAnalysis];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isOpaque(void *a1, const char *a2, ...)
{
  return _[a1 isOpaque];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lineThickness(void *a1, const char *a2, ...)
{
  return _[a1 lineThickness];
}

id objc_msgSend_metricsWithDevice_identitySizeClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsWithDevice:identitySizeClass:");
}

id objc_msgSend_mtlPipelineBlend(void *a1, const char *a2, ...)
{
  return _[a1 mtlPipelineBlend];
}

id objc_msgSend_mtlPipelineOpaque(void *a1, const char *a2, ...)
{
  return _[a1 mtlPipelineOpaque];
}

id objc_msgSend_newBufferWithLength_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newBufferWithLength:options:");
}

id objc_msgSend_newDefaultLibraryWithBundle_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newDefaultLibraryWithBundle:error:");
}

id objc_msgSend_newFunctionInLibrary_withDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newFunctionInLibrary:withDescriptor:");
}

id objc_msgSend_newRenderPipelineStateForDevice_withDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newRenderPipelineStateForDevice:withDescriptor:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
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

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return _[a1 outputImage];
}

id objc_msgSend_pathfinderFromFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathfinderFromFile:");
}

id objc_msgSend_primaryChromaTexture(void *a1, const char *a2, ...)
{
  return _[a1 primaryChromaTexture];
}

id objc_msgSend_primaryLumaTexture(void *a1, const char *a2, ...)
{
  return _[a1 primaryLumaTexture];
}

id objc_msgSend_rawImageWithImage_width_height_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rawImageWithImage:width:height:");
}

id objc_msgSend_rect(void *a1, const char *a2, ...)
{
  return _[a1 rect];
}

id objc_msgSend_rectValue(void *a1, const char *a2, ...)
{
  return _[a1 rectValue];
}

id objc_msgSend_removeClient(void *a1, const char *a2, ...)
{
  return _[a1 removeClient];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_rotation(void *a1, const char *a2, ...)
{
  return _[a1 rotation];
}

id objc_msgSend_sampleCenter(void *a1, const char *a2, ...)
{
  return _[a1 sampleCenter];
}

id objc_msgSend_sampleRadius(void *a1, const char *a2, ...)
{
  return _[a1 sampleRadius];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaleToWidth_height_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaleToWidth:height:");
}

id objc_msgSend_scaledValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValue:");
}

id objc_msgSend_secondaryTexture(void *a1, const char *a2, ...)
{
  return _[a1 secondaryTexture];
}

id objc_msgSend_setAlphaBlendOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlphaBlendOperation:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setBlendingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlendingEnabled:");
}

id objc_msgSend_setConstantValue_type_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstantValue:type:atIndex:");
}

id objc_msgSend_setConstantValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstantValues:");
}

id objc_msgSend_setDecodingFailurePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDecodingFailurePolicy:");
}

id objc_msgSend_setDefaults(void *a1, const char *a2, ...)
{
  return _[a1 setDefaults];
}

id objc_msgSend_setDestinationAlphaBlendFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationAlphaBlendFactor:");
}

id objc_msgSend_setDestinationRGBBlendFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationRGBBlendFactor:");
}

id objc_msgSend_setFragmentBytes_length_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFragmentBytes:length:atIndex:");
}

id objc_msgSend_setFragmentFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFragmentFunction:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPixelFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPixelFormat:");
}

id objc_msgSend_setRenderPipelineState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderPipelineState:");
}

id objc_msgSend_setRgbBlendOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRgbBlendOperation:");
}

id objc_msgSend_setRoundingBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoundingBehavior:");
}

id objc_msgSend_setSourceAlphaBlendFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceAlphaBlendFactor:");
}

id objc_msgSend_setSourceRGBBlendFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceRGBBlendFactor:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVertexBuffer_offset_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVertexBuffer:offset:atIndex:");
}

id objc_msgSend_setVertexBytes_length_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVertexBytes:length:atIndex:");
}

id objc_msgSend_setVertexFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVertexFunction:");
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return _[a1 sharedDevice];
}

id objc_msgSend_sharedInstanceWithPixelFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstanceWithPixelFormat:");
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return _[a1 sharedRenderingContext];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_structure(void *a1, const char *a2, ...)
{
  return _[a1 structure];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_unlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 unlockedSinceBoot];
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithBytes:objCType:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return _[a1 width];
}

id objc_msgSend_writeToFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}