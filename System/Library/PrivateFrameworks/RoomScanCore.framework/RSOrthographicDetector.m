@interface RSOrthographicDetector
- (RSOrthographicDetector)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation RSOrthographicDetector

- (id).cxx_construct
{
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *(_OWORD *)((char *)self + 1272) = 0u;
  *(_OWORD *)((char *)self + 1288) = 0u;
  *(_OWORD *)((char *)self + 1304) = 0u;
  *(_OWORD *)((char *)self + 1320) = 0u;
  *(_OWORD *)((char *)self + 1336) = 0u;
  *(_OWORD *)((char *)self + 1352) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curvedDoors, 0);
  objc_storeStrong((id *)&self->_curvedWindows, 0);
  objc_storeStrong((id *)&self->_opendoors, 0);
  objc_storeStrong((id *)&self->_openings, 0);
  objc_storeStrong((id *)&self->_doors, 0);
  objc_storeStrong((id *)&self->_windows, 0);
  objc_storeStrong((id *)&self->_boxes, 0);
  begin = self->_defaultBoxStrides.__begin_;
  if (begin)
  {
    self->_defaultBoxStrides.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_importantClasses.__begin_;
  if (v4)
  {
    self->_importantClasses.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_softmaxBuffer.__begin_;
  if (v5)
  {
    self->_softmaxBuffer.__end_ = v5;
    operator delete(v5);
  }
  v6 = (void **)self->_anchorBoxes.__begin_;
  if (v6)
  {
    end = (void **)self->_anchorBoxes.__end_;
    v8 = self->_anchorBoxes.__begin_;
    if (end != v6)
    {
      do
      {
        end -= 3;
        p_offsetsMap = (vector<std::vector<float>, std::allocator<std::vector<float>>> *)end;
        sub_25B43CFF4((void ***)&p_offsetsMap);
      }
      while (end != v6);
      v8 = self->_anchorBoxes.__begin_;
    }
    self->_anchorBoxes.__end_ = v6;
    operator delete(v8);
  }
  p_offsetsMap = &self->_offsetsMap;
  sub_25B413C78((void ***)&p_offsetsMap);
  p_offsetsMap = &self->_logitsMap;
  sub_25B413C78((void ***)&p_offsetsMap);
}

- (void)dealloc
{
  ioSurface = self->_ioSurface;
  if (ioSurface) {
    CFRelease(ioSurface);
  }
  CVPixelBufferRelease(self->_semanticMapBuffer);
  for (uint64_t i = 176; i != 224; i += 8)
  {
    v5 = *(const void **)((char *)self + i - 48);
    if (v5) {
      CFRelease(v5);
    }
    v6 = *(Class *)((char *)&self->super.isa + i);
    if (v6) {
      CFRelease(v6);
    }
    CVPixelBufferRelease(*(CVPixelBufferRef *)((char *)self + i - 144));
    CVPixelBufferRelease(*(CVPixelBufferRef *)((char *)self + i - 96));
  }
  espresso_plan_destroy();
  espresso_context_destroy();
  v7.receiver = self;
  v7.super_class = (Class)RSOrthographicDetector;
  [(RSOrthographicDetector *)&v7 dealloc];
}

- (RSOrthographicDetector)init
{
  uint64_t v193 = *MEMORY[0x263EF8340];
  v164.receiver = self;
  v164.super_class = (Class)RSOrthographicDetector;
  v2 = [(RSOrthographicDetector *)&v164 init];
  if (!v2) {
    return v2;
  }
  v2->_ctx = (void *)espresso_create_context();
  v2->_plan = (void *)espresso_create_plan();
  v3 = v2;
  v4 = (void *)MEMORY[0x263F086E0];
  v163 = v3;
  uint64_t v5 = objc_opt_class();
  v152 = objc_msgSend_bundleForClass_(v4, v6, v5);
  sub_25B5C99C8(@"orthographic_v9.1_palettized.espresso.net", 0, v152);
  id v153 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_UTF8String(v153, v7, v8);
  espresso_plan_add_network();
  espresso_plan_build();
  uint64_t v159 = *MEMORY[0x263F0EDF8];
  uint64_t v9 = *MEMORY[0x263F0EDF8];
  uint64_t v161 = *MEMORY[0x263F0EF50];
  v188[0] = *MEMORY[0x263F0EF50];
  v188[1] = v9;
  v189[0] = &unk_2708FE2C8;
  v189[1] = &unk_2708FE2E0;
  uint64_t v157 = *MEMORY[0x263F0ED48];
  uint64_t v10 = *MEMORY[0x263F0ED48];
  uint64_t v158 = *MEMORY[0x263F0EE48];
  v188[2] = *MEMORY[0x263F0EE48];
  v188[3] = v10;
  v189[2] = &unk_2708FE2F8;
  v189[3] = &unk_2708FE310;
  uint64_t v156 = *MEMORY[0x263F0ED50];
  v188[4] = *MEMORY[0x263F0ED50];
  v189[4] = &unk_2708FE328;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v189, v188, 5);
  CFDictionaryRef pixelBufferAttributes = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v12 = v163;
  ioSurface = IOSurfaceCreate(pixelBufferAttributes);
  v163->_ioSurface = ioSurface;
  if (!ioSurface)
  {
    if (qword_26A5020B0 != -1) {
      dispatch_once(&qword_26A5020B0, &unk_2708F1218);
    }
    v14 = (id)qword_26A5020A8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_25B3F3000, v14, OS_LOG_TYPE_DEBUG, "DoorWindow IOSurfaceCreate failure", buf, 2u);
    }

    v12 = v163;
    ioSurface = v163->_ioSurface;
  }
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], ioSurface, pixelBufferAttributes, &v12->_semanticMapBuffer))
  {
    if (qword_26A5020B0 != -1) {
      dispatch_once(&qword_26A5020B0, &unk_2708F1218);
    }
    v15 = (id)qword_26A5020A8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_25B3F3000, v15, OS_LOG_TYPE_DEBUG, "DoorWindow input CVPixelBufferCreate failure", buf, 2u);
    }
  }
  *(_OWORD *)v163->_logitsMapBuffers = 0u;
  logitsMapBuffers = v163->_logitsMapBuffers;
  *(_OWORD *)v163->_offsetsMapBuffers = 0u;
  offsetsMapBuffers = v163->_offsetsMapBuffers;
  *(_OWORD *)&v163->_offsetsMapBuffers[2] = 0u;
  *(_OWORD *)&v163->_offsetsMapBuffers[4] = 0u;
  *(_OWORD *)&v163->_logitsMapBuffers[2] = 0u;
  *(_OWORD *)&v163->_logitsMapBuffers[4] = 0u;
  sub_25B43E334((uint64_t *)&v163->_logitsMap);
  sub_25B43E334((uint64_t *)&v163->_offsetsMap);
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = *MEMORY[0x263F04178];
  do
  {
    unsigned int v21 = dword_25B5F1FBC[v19];
    uint64_t v22 = v21 * dword_25B5F1FA4[v19];
    v23 = (char **)((char *)v163->_logitsMap.__begin_ + v18);
    *(_DWORD *)buf = 0;
    sub_25B43E4C0(v23, v22 * v21, buf);
    v186[0] = v161;
    unsigned int v24 = dword_25B5F1FD4[v19];
    v26 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v25, v24);
    v187[0] = v26;
    v186[1] = v159;
    v28 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v27, v22);
    v187[1] = v28;
    v187[2] = &unk_2708FE2F8;
    v186[2] = v158;
    v186[3] = v157;
    v187[3] = &unk_2708FE310;
    v186[4] = v156;
    v30 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v29, 2 * v24);
    v187[4] = v30;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v31, (uint64_t)v187, v186, 5);
    CFDictionaryRef v32 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v34 = IOSurfaceCreate(v32);
    uint64_t v35 = (uint64_t)v163 + 8 * v19;
    *(void *)(v35 + 128) = v34;
    if (!v34)
    {
      if (qword_26A5020B0 != -1) {
        dispatch_once(&qword_26A5020B0, &unk_2708F1218);
      }
      v36 = (id)qword_26A5020A8;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v19;
        _os_log_debug_impl(&dword_25B3F3000, v36, OS_LOG_TYPE_DEBUG, "DoorWindow IOSurfaceCreate logitsMap %d failure", buf, 8u);
      }

      v34 = *(__IOSurface **)(v35 + 128);
    }
    uint64_t v184 = v20;
    uint64_t v185 = MEMORY[0x263EFFA78];
    CFDictionaryRef v37 = (const __CFDictionary *)objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v33, (uint64_t)&v185, &v184, 1);
    CVReturn v38 = CVPixelBufferCreateWithIOSurface(allocator, v34, v37, logitsMapBuffers);
    if (v38)
    {
      if (qword_26A5020B0 != -1) {
        dispatch_once(&qword_26A5020B0, &unk_2708F1218);
      }
      v39 = (id)qword_26A5020A8;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v38;
        _os_log_debug_impl(&dword_25B3F3000, v39, OS_LOG_TYPE_DEBUG, "CVPixelBufferCreateWithIOSurface output logits failure (%d)", buf, 8u);
      }
    }
    ++v19;
    ++logitsMapBuffers;
    v18 += 24;
  }
  while (v19 != 6);
  uint64_t v40 = 0;
  for (uint64_t i = 0; i != 6; ++i)
  {
    unsigned int v42 = dword_25B5F1FBC[i];
    uint64_t v43 = v42 * dword_25B5F1FEC[i];
    v44 = (char **)((char *)v163->_offsetsMap.__begin_ + v40);
    *(_DWORD *)buf = 0;
    sub_25B43E4C0(v44, v43 * v42, buf);
    v182[0] = v161;
    unsigned int v45 = dword_25B5F1FD4[i];
    v47 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v46, v45);
    v183[0] = v47;
    v182[1] = v159;
    v49 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v48, v43);
    v183[1] = v49;
    v183[2] = &unk_2708FE2F8;
    v182[2] = v158;
    v182[3] = v157;
    v183[3] = &unk_2708FE310;
    v182[4] = v156;
    v51 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v50, 2 * v45);
    v183[4] = v51;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v52, (uint64_t)v183, v182, 5);
    CFDictionaryRef v53 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v55 = IOSurfaceCreate(v53);
    uint64_t v56 = (uint64_t)v163 + 8 * i;
    *(void *)(v56 + 176) = v55;
    if (!v55)
    {
      if (qword_26A5020B0 != -1) {
        dispatch_once(&qword_26A5020B0, &unk_2708F1218);
      }
      v57 = (id)qword_26A5020A8;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = i;
        _os_log_debug_impl(&dword_25B3F3000, v57, OS_LOG_TYPE_DEBUG, "DoorWindow IOSurfaceCreate offsetsMap %d failure", buf, 8u);
      }

      v55 = *(__IOSurface **)(v56 + 176);
    }
    uint64_t v180 = v20;
    uint64_t v181 = MEMORY[0x263EFFA78];
    CFDictionaryRef v58 = (const __CFDictionary *)objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v54, (uint64_t)&v181, &v180, 1);
    CVReturn v59 = CVPixelBufferCreateWithIOSurface(allocator, v55, v58, offsetsMapBuffers);
    if (v59)
    {
      if (qword_26A5020B0 != -1) {
        dispatch_once(&qword_26A5020B0, &unk_2708F1218);
      }
      v60 = (id)qword_26A5020A8;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v59;
        _os_log_debug_impl(&dword_25B3F3000, v60, OS_LOG_TYPE_DEBUG, "CVPixelBufferCreateWithIOSurface output offsets failure (%d)", buf, 8u);
      }
    }
    ++offsetsMapBuffers;
    v40 += 24;
  }
  sub_25B43E5EC((char **)&v163->_softmaxBuffer, 5uLL);
  *(_OWORD *)buf = xmmword_25B5F12C0;
  sub_25B43E700((char *)&v163->_importantClasses, (char *)buf, (uint64_t)&v191, 4uLL);
  uint64_t v61 = 0;
  end = v163->_defaultBoxStrides.__end_;
  v63 = v163;
  do
  {
    float v64 = flt_25B5F2024[v61] * 448.0;
    unint64_t value = (unint64_t)v63->_defaultBoxStrides.__end_cap_.__value_;
    if ((unint64_t)end >= value)
    {
      begin = v63->_defaultBoxStrides.__begin_;
      uint64_t v68 = end - begin;
      unint64_t v69 = v68 + 1;
      if ((unint64_t)(v68 + 1) >> 62) {
        sub_25B3FBC4C();
      }
      uint64_t v70 = value - (void)begin;
      if (v70 >> 1 > v69) {
        unint64_t v69 = v70 >> 1;
      }
      if ((unint64_t)v70 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v71 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v71 = v69;
      }
      if (v71)
      {
        unint64_t v71 = (unint64_t)sub_25B3FBC64(v71);
        end = v163->_defaultBoxStrides.__end_;
        begin = v163->_defaultBoxStrides.__begin_;
      }
      else
      {
        uint64_t v72 = 0;
      }
      v73 = (float *)(v71 + 4 * v68);
      float *v73 = v64;
      v66 = v73 + 1;
      while (end != begin)
      {
        int v74 = *((_DWORD *)end-- - 1);
        *((_DWORD *)v73-- - 1) = v74;
      }
      v163->_defaultBoxStrides.__begin_ = v73;
      v163->_defaultBoxStrides.__end_ = v66;
      v163->_defaultBoxStrides.__end_cap_.__value_ = (float *)(v71 + 4 * v72);
      if (begin) {
        operator delete(begin);
      }
    }
    else
    {
      float *end = v64;
      v66 = end + 1;
    }
    v63 = v163;
    v163->_defaultBoxStrides.__end_ = v66;
    ++v61;
    end = v66;
  }
  while (v61 != 6);
  unint64_t v75 = 0;
  v76 = v163->_defaultBoxStrides.__begin_;
  v77 = &v163->_defaultBoxSizes[0][0][1];
  v78 = &v163->_defaultBoxSizes[0][5][1];
  do
  {
    uint64_t v79 = 0;
    unint64_t v80 = v75;
    float v81 = v76[v75];
    v82 = v77;
    do
    {
      float v83 = sqrtf(*(float *)&dword_25B5F203C[v79]);
      *(v82 - 1) = v81 * v83;
      float *v82 = v81 / v83;
      ++v79;
      v82 += 2;
    }
    while (v79 != 5);
    unint64_t v75 = v80 + 1;
    if (v80 < 5)
    {
      uint64_t v84 = 0;
      float v85 = sqrtf(v81 * v76[v75]);
      v86 = v78;
      do
      {
        float v87 = sqrtf(*(float *)&dword_25B5F203C[v84]);
        *(v86 - 1) = v85 * v87;
        float *v86 = v85 / v87;
        ++v84;
        v86 += 2;
      }
      while (v84 != 5);
    }
    v77 += 40;
    v78 += 40;
  }
  while (v75 != 6);
  v88 = (char *)v163->_anchorBoxes.__end_;
  v89 = (char *)v163->_anchorBoxes.__begin_;
  v90 = (char *)(v88 - v89);
  unint64_t v91 = 0xAAAAAAAAAAAAAAABLL * ((v88 - v89) >> 3);
  if (v91 > 5)
  {
    if (v90 != (char *)144)
    {
      v103 = v89 + 144;
      while (v88 != v103)
      {
        v88 -= 24;
        *(void *)buf = v88;
        sub_25B43CFF4((void ***)buf);
      }
      v163->_anchorBoxes.__end_ = v103;
    }
    goto LABEL_90;
  }
  v92 = v163->_anchorBoxes.__end_cap_.__value_;
  if (0xAAAAAAAAAAAAAAABLL * ((v92 - v88) >> 3) >= 6 - v91)
  {
    bzero(v163->_anchorBoxes.__end_, 24 * ((120 - (uint64_t)v90) / 0x18uLL) + 24);
    v163->_anchorBoxes.__end_ = &v88[24 * ((120 - (uint64_t)v90) / 0x18uLL) + 24];
    goto LABEL_90;
  }
  unint64_t v93 = 0xAAAAAAAAAAAAAAABLL * ((v92 - v89) >> 3);
  unint64_t v94 = 0x5555555555555556 * ((v92 - v89) >> 3);
  if (v94 <= 6) {
    unint64_t v94 = 6;
  }
  if (v93 >= 0x555555555555555) {
    unint64_t v95 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v95 = v94;
  }
  if (v95 > 0xAAAAAAAAAAAAAAALL) {
    sub_25B3FA70C();
  }
  v96 = (char *)operator new(24 * v95);
  v97 = &v96[8 * ((v88 - v89) >> 3)];
  v98 = &v96[24 * v95];
  size_t v99 = 24 * ((120 - (uint64_t)v90) / 0x18uLL) + 24;
  bzero(v97, v99);
  v100 = &v97[v99];
  if (v88 == v89)
  {
    v163->_anchorBoxes.__begin_ = v97;
    v163->_anchorBoxes.__end_ = v100;
    v163->_anchorBoxes.__end_cap_.__value_ = v98;
    if (!v88) {
      goto LABEL_90;
    }
  }
  else
  {
    do
    {
      *((void *)v97 - 3) = 0;
      *((void *)v97 - 2) = 0;
      v97 -= 24;
      *((void *)v97 + 2) = 0;
      long long v101 = *(_OWORD *)(v88 - 24);
      v88 -= 24;
      *(_OWORD *)v97 = v101;
      *((void *)v97 + 2) = *((void *)v88 + 2);
      *(void *)v88 = 0;
      *((void *)v88 + 1) = 0;
      *((void *)v88 + 2) = 0;
    }
    while (v88 != v89);
    v102 = (char *)v163->_anchorBoxes.__begin_;
    v88 = (char *)v163->_anchorBoxes.__end_;
    v163->_anchorBoxes.__begin_ = v97;
    v163->_anchorBoxes.__end_ = v100;
    v163->_anchorBoxes.__end_cap_.__value_ = v98;
    if (v88 != v102)
    {
      do
      {
        v88 -= 24;
        *(void *)buf = v88;
        sub_25B43CFF4((void ***)buf);
      }
      while (v88 != v102);
      v88 = v102;
    }
    if (!v88) {
      goto LABEL_90;
    }
  }
  operator delete(v88);
LABEL_90:
  uint64_t v104 = 0;
  float32x2_t v105 = (float32x2_t)vdup_n_s32(0x43E00000u);
  do
  {
    unint64_t v106 = dword_25B5F1FBC[v104];
    if (v104 == 5) {
      uint64_t v107 = 5;
    }
    else {
      uint64_t v107 = 10;
    }
    int v165 = 0;
    sub_25B400C5C(__p, 4uLL, &v165);
    sub_25B413A88(&v167, v106, (uint64_t)__p);
    v169 = 0;
    v170 = 0;
    uint64_t v171 = 0;
    *(void *)buf = &v169;
    buf[8] = 0;
    sub_25B43E7FC(&v169, v106);
    v108 = v170;
    unint64_t v162 = v106;
    v109 = &v170[3 * v106];
    uint64_t v110 = 24 * v106;
    do
    {
      void *v108 = 0;
      v108[1] = 0;
      v108[2] = 0;
      sub_25B43E84C(v108, v167, v168, 0xAAAAAAAAAAAAAAABLL * ((v168 - v167) >> 3));
      v108 += 3;
      v110 -= 24;
    }
    while (v110);
    v170 = v109;
    v173 = 0;
    long long v172 = 0uLL;
    v174 = &v172;
    char v175 = 0;
    v111 = operator new(24 * v107);
    *(void *)&long long v172 = v111;
    *((void *)&v172 + 1) = v111;
    uint64_t v160 = v107;
    v112 = &v111[3 * v107];
    v173 = v112;
    do
    {
      void *v111 = 0;
      v111[1] = 0;
      v111[2] = 0;
      v114 = v169;
      v113 = v170;
      v176 = v111;
      char v177 = 0;
      if (v170 != v169)
      {
        sub_25B43E7FC(v111, 0xAAAAAAAAAAAAAAABLL * (v170 - v169));
        v178 = (void *)v111[1];
        v179 = v178;
        *(void *)buf = v111 + 2;
        *(void *)&buf[8] = &v178;
        v191 = &v179;
        char v192 = 0;
        v115 = v178;
        do
        {
          void *v115 = 0;
          v115[1] = 0;
          v115[2] = 0;
          sub_25B43E84C(v115, *v114, v114[1], 0xAAAAAAAAAAAAAAABLL * ((v114[1] - *v114) >> 3));
          v115 = v179 + 3;
          v179 += 3;
          v114 += 3;
        }
        while (v114 != v113);
        char v192 = 1;
        sub_25B43E8D4((uint64_t)buf);
        v111[1] = v115;
      }
      v111 += 3;
    }
    while (v111 != v112);
    *((void *)&v172 + 1) = v112;
    v116 = v163->_anchorBoxes.__begin_;
    v117 = (void **)&v116[3 * v104];
    v118 = (char *)*v117;
    if (*v117)
    {
      v119 = &v116[3 * v104];
      v122 = (char *)v119[1];
      v120 = v119 + 1;
      v121 = v122;
      v123 = *v117;
      if (v122 != v118)
      {
        do
        {
          v121 -= 24;
          *(void *)buf = v121;
          sub_25B43D088((void ***)buf);
        }
        while (v121 != v118);
        v123 = *v117;
      }
      void *v120 = v118;
      operator delete(v123);
      *v117 = 0;
      v117[1] = 0;
      v117[2] = 0;
    }
    *(_OWORD *)v117 = v172;
    v116[3 * v104 + 2] = v173;
    long long v172 = 0uLL;
    v173 = 0;
    *(void *)buf = &v172;
    sub_25B43CFF4((void ***)buf);
    *(void *)buf = &v169;
    sub_25B43D088((void ***)buf);
    *(void *)buf = &v167;
    sub_25B413C78((void ***)buf);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    uint64_t v124 = 0;
    uint64_t v125 = v162;
    if (v162 <= 1) {
      uint64_t v125 = 1;
    }
    float v126 = flt_25B5F2050[v104];
    float v127 = flt_25B5F2068[v104];
    uint64_t v128 = *((void *)v163->_anchorBoxes.__begin_ + 3 * v104);
    do
    {
      unint64_t v129 = 0;
      float32x2_t v130 = vdiv_f32(*(float32x2_t *)&v163->_defaultBoxSizes[v104][v124][0], v105);
      uint64_t v131 = *(void *)(v128 + 24 * v124);
      do
      {
        unint64_t v132 = 0;
        v133 = *(float32x2_t ***)(v131 + 24 * v129);
        do
        {
          v134 = *v133;
          v133 += 3;
          v134->f32[0] = (float)(v127 + (float)((float)v132 * v126)) / 448.0;
          v134->f32[1] = (float)(v127 + (float)((float)v129 * v126)) / 448.0;
          v134[1] = v130;
          ++v132;
        }
        while (v125 != v132);
        ++v129;
      }
      while (v129 != v125);
      ++v124;
    }
    while (v124 != v160);
    ++v104;
  }
  while (v104 != 6);
  uint64_t v135 = objc_opt_new();
  windows = v163->_windows;
  v163->_windows = (NSMutableArray *)v135;

  uint64_t v137 = objc_opt_new();
  doors = v163->_doors;
  v163->_doors = (NSMutableArray *)v137;

  uint64_t v139 = objc_opt_new();
  openings = v163->_openings;
  v163->_openings = (NSMutableArray *)v139;

  uint64_t v141 = objc_opt_new();
  opendoors = v163->_opendoors;
  v163->_opendoors = (NSMutableArray *)v141;

  uint64_t v145 = objc_msgSend_array(MEMORY[0x263EFF980], v143, v144);
  curvedWindows = v163->_curvedWindows;
  v163->_curvedWindows = (NSMutableArray *)v145;

  uint64_t v149 = objc_msgSend_array(MEMORY[0x263EFF980], v147, v148);
  curvedDoors = v163->_curvedDoors;
  v163->_curvedDoors = (NSMutableArray *)v149;

  v163->_filterThresholds = (const float *)&unk_25B5F2004;
  *(_WORD *)&v163->_isOnline = 1;

  return v163;
}

@end