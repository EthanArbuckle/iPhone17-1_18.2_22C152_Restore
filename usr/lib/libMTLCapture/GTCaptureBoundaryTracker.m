@interface GTCaptureBoundaryTracker
@end

@implementation GTCaptureBoundaryTracker

void __GTCaptureBoundaryTracker_handleTrigger_block_invoke(uint64_t a1)
{
  unsigned int v1 = atomic_load((unsigned int *)(*(void *)(a1 + 48) + 20));
  unsigned int v188 = v1;
  v2 = *(os_unfair_lock_s **)(a1 + 48);
  uint32_t v3 = *(_DWORD *)(a1 + 56);
  int v4 = *(_DWORD *)(a1 + 60);
  uint64_t v193 = *(void *)(a1 + 64);
  uint64_t v198 = *(void *)(a1 + 72);
  uint64_t v199 = *(void *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 104);
  uint64_t v200 = *(void *)(a1 + 112);
  uint64_t v201 = *(void *)(a1 + 96);
  uint64_t v202 = *(void *)(a1 + 120);
  unint64_t v203 = *(void *)(a1 + 80);
  int v196 = *(unsigned __int8 *)(a1 + 128);
  *(_DWORD *)v211 = *(_DWORD *)(a1 + 129);
  *(_DWORD *)&v211[3] = *(_DWORD *)(a1 + 132);
  uint64_t v6 = *(void *)(a1 + 136);
  lock = v2 + 4;
  os_unfair_lock_lock(v2 + 4);
  int v191 = v4;
  uint32_t v192 = v3;
  if (v3 == 7)
  {
    int v7 = v4;
    if (v4 != 9)
    {
      if (v4 == 3)
      {
        LOBYTE(v2[24]._os_unfair_lock_opaque) = 1;
        goto LABEL_7;
      }
      goto LABEL_11;
    }
LABEL_9:
    p_os_unfair_lock_opaque = &v2[5]._os_unfair_lock_opaque;
    if (!atomic_load(&v2[5]._os_unfair_lock_opaque)) {
      goto LABEL_22;
    }
    BYTE1(v2[24]._os_unfair_lock_opaque) = 1;
LABEL_14:
    atomic_store(4u, p_os_unfair_lock_opaque);
    goto LABEL_15;
  }
  int v7 = v4;
  if (v4 == 9) {
    goto LABEL_9;
  }
  if (v4 != 3)
  {
LABEL_11:
    if (v3 != v2[22]._os_unfair_lock_opaque) {
      goto LABEL_22;
    }
    if (v7 != 8) {
      goto LABEL_22;
    }
    p_os_unfair_lock_opaque = &v2[5]._os_unfair_lock_opaque;
    if (!atomic_load(&v2[5]._os_unfair_lock_opaque)) {
      goto LABEL_22;
    }
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = g_guestAppClientMTL;
  uint64_t add = atomic_fetch_add((atomic_ullong *volatile)(g_guestAppClientMTL + 64), 1uLL);
  if (*(unsigned char *)(v8 + 48))
  {
    GTMTLGuestAppClient_collectFrameProfilingData(v8, add);
    int v7 = v4;
  }
LABEL_22:
  v16 = &v2[5]._os_unfair_lock_opaque;
  unsigned int v17 = atomic_load(&v2[5]._os_unfair_lock_opaque);
  uint64_t v18 = *(void *)&v2[2 * v17 + 8]._os_unfair_lock_opaque;
  *(_DWORD *)buf = v192;
  *(_DWORD *)&buf[4] = v7;
  *(void *)&buf[8] = v193;
  *(void *)&buf[16] = v198;
  *(void *)&buf[24] = v203;
  *(void *)&buf[32] = v199;
  *(void *)&buf[40] = v201;
  *(void *)&buf[48] = v5;
  *(void *)&buf[56] = v200;
  *(void *)&long long v218 = v202;
  BYTE8(v218) = v196;
  *(_DWORD *)((char *)&v218 + 9) = *(_DWORD *)v211;
  HIDWORD(v218) = *(_DWORD *)&v211[3];
  *(void *)&long long v219 = v6;
  if (GTCapturePhase_checkTrigger(v18, (int *)buf))
  {
    unsigned int v19 = atomic_load(v16);
    if (v19 == 1)
    {
      uint64_t v20 = 0;
      int v21 = 0;
      int v22 = 0;
      uint64_t v23 = *(void *)(*(void *)&v2[10]._os_unfair_lock_opaque + 8);
      uint64_t v24 = *(unsigned int *)(v23 + 12);
      while ((unint64_t)(v24 & ~((int)v24 >> 31)) << 6 != v20)
      {
        int v25 = *(_DWORD *)(*(void *)(v23 + 24) + v20 + 60);
        if (v25)
        {
          if (v25 == 1) {
            ++v22;
          }
        }
        else
        {
          ++v21;
        }
        v20 += 64;
      }
      if (v22 == 1 && v21 + 1 == v24 && (int)v24 > 0)
      {
        uint64_t v26 = 0;
        uint64_t v27 = *(void *)(v23 + 24);
        v28 = (int *)(v27 + 4);
        while (1)
        {
          int v29 = *v28;
          v28 += 16;
          if (v29 == 3) {
            break;
          }
          if (v24 == ++v26) {
            goto LABEL_48;
          }
        }
        if (*(_DWORD *)(v27 + (v26 << 6)) == 1)
        {
          for (uint64_t i = 1; i != 5; ++i)
          {
            uint64_t v31 = *(void *)(*(void *)&v2[2 * i + 8]._os_unfair_lock_opaque + 8);
            uint64_t v32 = *(unsigned int *)(v31 + 12);
            if ((int)v32 >= 1)
            {
              uint64_t v33 = 0;
              uint64_t v34 = *(void *)(v31 + 24);
              v35 = (int *)(v34 + 4);
              while (1)
              {
                int v36 = *v35;
                v35 += 16;
                if (v36 == 3) {
                  break;
                }
                if (v32 == ++v33) {
                  goto LABEL_47;
                }
              }
              *(_DWORD *)(v34 + (v33 << 6)) = v192;
              if (v192 == 3) {
                *(void *)(v34 + (v33 << 6) + 8) = v5;
              }
            }
LABEL_47:
            ;
          }
        }
      }
    }
  }
LABEL_48:
  unsigned int v37 = atomic_load(v16);
  if (v37 == 3)
  {
    if (v191 == 5)
    {
      BOOL v39 = g_targetRef == v200 || g_targetRef == v201;
      v38 = &g_commitOther;
      if (v39) {
        v38 = &g_commitCount;
      }
      goto LABEL_59;
    }
    if (v191 == 3)
    {
      if (g_targetRef == v5) {
        v38 = &g_frameCount;
      }
      else {
        v38 = &g_frameOther;
      }
LABEL_59:
      atomic_fetch_add((atomic_ullong *volatile)v38, 1uLL);
    }
  }
  uint64_t v195 = (v191 - 1);
  uint64_t v194 = v192 - 1;
  p_prots = &OBJC_PROTOCOL___MTLDrawable.prots;
  v204 = v2;
  uint64_t v197 = v6;
  while (2)
  {
    if (GTCapturePhase_isComplete(v18))
    {
      unsigned int v41 = atomic_load(&v2[5]._os_unfair_lock_opaque);
      if (v41 != 4)
      {
        if (*((unsigned char *)p_prots + 3552))
        {
          v42 = gt_tagged_log(0);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            uint64_t v43 = atomic_load(&v2[5]._os_unfair_lock_opaque);
            v44 = "UNKNOWN";
            if (v43 <= 4) {
              v44 = (&off_221B88)[v43];
            }
            unsigned int v45 = atomic_load(&v2[5]._os_unfair_lock_opaque);
            unsigned int v46 = v45 + 1;
            v47 = "UNKNOWN";
            if (v46 <= 4) {
              v47 = (&off_221B88)[v46];
            }
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = v44;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v47;
            _os_log_impl(&def_CFBEC, v42, OS_LOG_TYPE_INFO, "⏭️  Capture phase transition: %s ==> %s", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v48 = atomic_load(&v2[5]._os_unfair_lock_opaque);
          v49 = "UNKNOWN";
          if (v48 <= 4) {
            v49 = (&off_221B88)[v48];
          }
          unsigned int v50 = atomic_load(&v2[5]._os_unfair_lock_opaque);
          unsigned int v51 = v50 + 1;
          v52 = "UNKNOWN";
          if (v51 <= 4) {
            v52 = (&off_221B88)[v51];
          }
          fprintf(__stdoutp, "⏭️  Capture phase transition: %s ==> %s\n", v49, v52);
        }
        if (*((unsigned char *)p_prots + 3552))
        {
          v53 = gt_tagged_log(0);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&def_CFBEC, v53, OS_LOG_TYPE_INFO, "🔫 GTCaptureTrigger", buf, 2u);
          }
        }
        else
        {
          fwrite("🔫 GTCaptureTrigger\n", 0x16uLL, 1uLL, __stdoutp);
        }
        if (*((unsigned char *)p_prots + 3552))
        {
          v54 = gt_tagged_log(0);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            v55 = "Instant";
            if (v195 <= 8) {
              v55 = (&off_221BB0)[v195];
            }
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v55;
            _os_log_impl(&def_CFBEC, v54, OS_LOG_TYPE_INFO, "    type: %s", buf, 0xCu);
          }
        }
        else
        {
          v56 = "Instant";
          if (v195 <= 8) {
            v56 = (&off_221BB0)[v195];
          }
          fprintf(__stdoutp, "    type: %s\n", v56);
        }
        if (*((unsigned char *)p_prots + 3552))
        {
          v57 = gt_tagged_log(0);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            v58 = "None";
            if (v194 <= 0xB) {
              v58 = (&off_221B28)[v194];
            }
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v58;
            _os_log_impl(&def_CFBEC, v57, OS_LOG_TYPE_INFO, "    object: %s", buf, 0xCu);
          }
        }
        else
        {
          v59 = "None";
          if (v194 <= 0xB) {
            v59 = (&off_221B28)[v194];
          }
          fprintf(__stdoutp, "    object: %s\n", v59);
        }
        if (*((unsigned char *)p_prots + 3552))
        {
          v60 = gt_tagged_log(0);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&buf[4] = v193;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v198;
            _os_log_impl(&def_CFBEC, v60, OS_LOG_TYPE_INFO, "    stream: %llu; function index: %llu", buf, 0x16u);
          }
        }
        else
        {
          fprintf(__stdoutp, "    stream: %llu; function index: %llu\n", v193, v198);
        }
        if (v203)
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v61 = gt_tagged_log(0);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v203;
              _os_log_impl(&def_CFBEC, v61, OS_LOG_TYPE_INFO, "    parent function index: %llu", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "    parent function index: %llu\n", v203);
          }
        }
        if (v199)
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v62 = gt_tagged_log(0);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v199;
              _os_log_impl(&def_CFBEC, v62, OS_LOG_TYPE_INFO, "    MTLCaptureScope stream ref: %llu", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "    MTLCaptureScope stream ref: %llu\n", v199);
          }
        }
        if (v201)
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v63 = gt_tagged_log(0);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v201;
              _os_log_impl(&def_CFBEC, v63, OS_LOG_TYPE_INFO, "    MTLDevice stream ref: %llu", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "    MTLDevice stream ref: %llu\n", v201);
          }
        }
        if (v200)
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v64 = gt_tagged_log(0);
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v200;
              _os_log_impl(&def_CFBEC, v64, OS_LOG_TYPE_INFO, "    MTLCommandQueue stream ref: %llu", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "    MTLCommandQueue stream ref: %llu\n", v200);
          }
        }
        if (v202)
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v65 = gt_tagged_log(0);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v202;
              _os_log_impl(&def_CFBEC, v65, OS_LOG_TYPE_INFO, "    MTLCommandBuffer stream ref: %llu", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "    MTLCommandBuffer stream ref: %llu\n", v202);
          }
        }
        if (v196)
        {
          if (!*((unsigned char *)p_prots + 3552))
          {
            fwrite("    MTLCommandBuffer is capturing\n", 0x22uLL, 1uLL, __stdoutp);
            if (!v6) {
              goto LABEL_245;
            }
            goto LABEL_129;
          }
          v66 = gt_tagged_log(0);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&def_CFBEC, v66, OS_LOG_TYPE_INFO, "    MTLCommandBuffer is capturing", buf, 2u);
          }
        }
        if (!v6) {
          goto LABEL_245;
        }
LABEL_129:
        if (*((unsigned char *)p_prots + 3552))
        {
          v67 = gt_tagged_log(0);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&def_CFBEC, v67, OS_LOG_TYPE_INFO, "    captureDescriptor:", buf, 2u);
          }
        }
        else
        {
          fwrite("    captureDescriptor:\n", 0x17uLL, 1uLL, __stdoutp);
        }
        if (*((unsigned char *)p_prots + 3552))
        {
          v68 = gt_tagged_log(0);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&def_CFBEC, v68, OS_LOG_TYPE_INFO, "        📜 GTMTLCaptureDescriptorInternal", buf, 2u);
          }
        }
        else
        {
          fwrite("        📜 GTMTLCaptureDescriptorInternal\n", 0x2CuLL, 1uLL, __stdoutp);
        }
        if (*(void *)v6)
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v69 = gt_tagged_log(0);
            if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
            {
              uint64_t v70 = *(void *)v6;
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v70;
              _os_log_impl(&def_CFBEC, v69, OS_LOG_TYPE_INFO, "        MTLDevice stream ref: %llu", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "        MTLDevice stream ref: %llu\n", *(void *)v6);
          }
        }
        if (*(void *)(v6 + 8))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v71 = gt_tagged_log(0);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              uint64_t v72 = *(void *)(v6 + 8);
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v72;
              _os_log_impl(&def_CFBEC, v71, OS_LOG_TYPE_INFO, "        MTLCommandQueue stream ref: %llu", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "        MTLCommandQueue stream ref: %llu\n", *(void *)(v6 + 8));
          }
        }
        if (*(void *)(v6 + 16))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v73 = gt_tagged_log(0);
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              uint64_t v74 = *(void *)(v6 + 16);
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v74;
              _os_log_impl(&def_CFBEC, v73, OS_LOG_TYPE_INFO, "        MTLCaptureScope stream ref: %llu", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "        MTLCaptureScope stream ref: %llu\n", *(void *)(v6 + 16));
          }
        }
        if (*(void *)(v6 + 24))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v75 = gt_tagged_log(0);
            if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
            {
              uint64_t v76 = *(void *)(v6 + 24);
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v76;
              _os_log_impl(&def_CFBEC, v75, OS_LOG_TYPE_INFO, "        CAMetalLayer stream ref: %llu", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "        CAMetalLayer stream ref: %llu\n", *(void *)(v6 + 24));
          }
        }
        if (*(void *)(v6 + 32))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v77 = gt_tagged_log(0);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
            {
              uint64_t v78 = *(void *)(v6 + 32);
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v78;
              _os_log_impl(&def_CFBEC, v77, OS_LOG_TYPE_INFO, "        session ID: %llu", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "        session ID: %llu\n", *(void *)(v6 + 32));
          }
        }
        if (*((unsigned char *)p_prots + 3552))
        {
          v79 = gt_tagged_log(0);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            uint64_t v80 = *(void *)(v6 + 40);
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v80;
            _os_log_impl(&def_CFBEC, v79, OS_LOG_TYPE_INFO, "        trigger hits to start: %llu", buf, 0xCu);
          }
        }
        else
        {
          fprintf(__stdoutp, "        trigger hits to start: %llu\n", *(void *)(v6 + 40));
        }
        if (*((unsigned char *)p_prots + 3552))
        {
          v81 = gt_tagged_log(0);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
          {
            uint64_t v82 = *(void *)(v6 + 48);
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v82;
            _os_log_impl(&def_CFBEC, v81, OS_LOG_TYPE_INFO, "        trigger hits to end: %llu", buf, 0xCu);
          }
        }
        else
        {
          fprintf(__stdoutp, "        trigger hits to end: %llu\n", *(void *)(v6 + 48));
        }
        if (*(void *)(v6 + 56))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v83 = gt_tagged_log(0);
            if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
            {
              uint64_t v84 = *(void *)(v6 + 56);
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v84;
              _os_log_impl(&def_CFBEC, v83, OS_LOG_TYPE_INFO, "        sandboxExtensionHandle: %llu", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "        sandboxExtensionHandle: %llu\n", *(void *)(v6 + 56));
          }
        }
        if (*(void *)(v6 + 64))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v85 = gt_tagged_log(0);
            if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
            {
              uint64_t v86 = *(void *)(v6 + 64);
              *(_DWORD *)buf = 136315138;
              *(void *)&buf[4] = v86;
              _os_log_impl(&def_CFBEC, v85, OS_LOG_TYPE_INFO, "        localFilePathURL: %s", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "        localFilePathURL: %s\n", *(const char **)(v6 + 64));
          }
        }
        if (*(void *)(v6 + 72))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v87 = gt_tagged_log(0);
            if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
            {
              uint64_t v88 = *(void *)(v6 + 72);
              *(_DWORD *)buf = 136315138;
              *(void *)&buf[4] = v88;
              _os_log_impl(&def_CFBEC, v87, OS_LOG_TYPE_INFO, "        hostFilePathURL: %s", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "        hostFilePathURL: %s\n", *(const char **)(v6 + 72));
          }
        }
        if (*((unsigned char *)p_prots + 3552))
        {
          v89 = gt_tagged_log(0);
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            unsigned int v90 = *(_DWORD *)(v6 + 80) - 1;
            v91 = "DeviceManual";
            if (v90 <= 5) {
              v91 = (&off_221C18)[v90];
            }
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v91;
            _os_log_impl(&def_CFBEC, v89, OS_LOG_TYPE_INFO, "        captureMode: %s", buf, 0xCu);
          }
        }
        else
        {
          unsigned int v92 = *(_DWORD *)(v6 + 80) - 1;
          v93 = "DeviceManual";
          if (v92 <= 5) {
            v93 = (&off_221C18)[v92];
          }
          fprintf(__stdoutp, "        captureMode: %s\n", v93);
        }
        if (*(unsigned char *)(v6 + 84))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v94 = gt_tagged_log(0);
            if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&def_CFBEC, v94, OS_LOG_TYPE_INFO, "        suspendAfterCapture: true", buf, 2u);
            }
          }
          else
          {
            fwrite("        suspendAfterCapture: true\n", 0x22uLL, 1uLL, __stdoutp);
          }
        }
        if (*(unsigned char *)(v6 + 86))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v95 = gt_tagged_log(0);
            if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&def_CFBEC, v95, OS_LOG_TYPE_INFO, "        isBoundaryLess: true", buf, 2u);
            }
          }
          else
          {
            fwrite("        isBoundaryLess: true\n", 0x1DuLL, 1uLL, __stdoutp);
          }
        }
        if (*(unsigned char *)(v6 + 85))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v96 = gt_tagged_log(0);
            if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&def_CFBEC, v96, OS_LOG_TYPE_INFO, "        lockGraphicsAfterCapture: true", buf, 2u);
            }
          }
          else
          {
            fwrite("        lockGraphicsAfterCapture: true\n", 0x27uLL, 1uLL, __stdoutp);
          }
        }
        if (*(unsigned char *)(v6 + 88))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v97 = gt_tagged_log(0);
            if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&def_CFBEC, v97, OS_LOG_TYPE_INFO, "        armPreparedCapture: true", buf, 2u);
            }
          }
          else
          {
            fwrite("        armPreparedCapture: true\n", 0x21uLL, 1uLL, __stdoutp);
          }
        }
        if (*(unsigned char *)(v6 + 89))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v98 = gt_tagged_log(0);
            if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&def_CFBEC, v98, OS_LOG_TYPE_INFO, "        apiTriggeredCapture: true", buf, 2u);
            }
          }
          else
          {
            fwrite("        apiTriggeredCapture: true\n", 0x22uLL, 1uLL, __stdoutp);
          }
        }
        if (*(unsigned char *)(v6 + 90))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v99 = gt_tagged_log(0);
            if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&def_CFBEC, v99, OS_LOG_TYPE_INFO, "        toolTriggeredCapture: true", buf, 2u);
            }
          }
          else
          {
            fwrite("        toolTriggeredCapture: true\n", 0x23uLL, 1uLL, __stdoutp);
          }
        }
        if (*(unsigned char *)(v6 + 91))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v100 = gt_tagged_log(0);
            if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&def_CFBEC, v100, OS_LOG_TYPE_INFO, "        ignoreUnusedResources: true", buf, 2u);
            }
          }
          else
          {
            fwrite("        ignoreUnusedResources: true\n", 0x24uLL, 1uLL, __stdoutp);
          }
        }
        if (*(unsigned char *)(v6 + 92))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v101 = gt_tagged_log(0);
            if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&def_CFBEC, v101, OS_LOG_TYPE_INFO, "        includeBacktrace: true", buf, 2u);
            }
          }
          else
          {
            fwrite("        includeBacktrace: true\n", 0x1FuLL, 1uLL, __stdoutp);
          }
        }
        if (*(unsigned char *)(v6 + 93))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v102 = gt_tagged_log(0);
            if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&def_CFBEC, v102, OS_LOG_TYPE_INFO, "       useNewArchiveFormat: true", buf, 2u);
            }
          }
          else
          {
            fwrite("       useNewArchiveFormat: true\n", 0x21uLL, 1uLL, __stdoutp);
          }
        }
        if (*(void *)(v6 + 96))
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v103 = gt_tagged_log(0);
            if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
            {
              uint64_t v104 = *(void *)(v6 + 96);
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v104;
              _os_log_impl(&def_CFBEC, v103, OS_LOG_TYPE_INFO, "        captureCompletionHandler: %lu", buf, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "        captureCompletionHandler: %lu\n", *(void *)(v6 + 96));
          }
        }
LABEL_245:
        v105 = (atomic_uint *)&v2[5];
        unsigned int v106 = atomic_load(&v2[5]._os_unfair_lock_opaque);
        switch(v106)
        {
          case 0u:
            v190 = (atomic_uint *)&v2[5];
            v2[22]._os_unfair_lock_opaque = v192;
            switch(*(_DWORD *)(v6 + 80))
            {
              case 0:
              case 2:
                v107 = (char *)apr_array_push(*(apr_array_header_t **)(*(void *)&v2[14]._os_unfair_lock_opaque + 8));
                *(_DWORD *)v107 = v192;
                *((_DWORD *)v107 + 1) = 8;
                *(_OWORD *)(v107 + 8) = 0u;
                *(_OWORD *)(v107 + 24) = 0u;
                *(_OWORD *)(v107 + 40) = 0u;
                *((void *)v107 + 7) = 1;
                break;
              case 1:
                uint64_t v114 = *(void *)v6;
                uint64_t v115 = *(void *)(v6 + 40);
                v116 = apr_array_push(*(apr_array_header_t **)(*(void *)&v2[10]._os_unfair_lock_opaque + 8));
                void *v116 = 0x400000008;
                v116[1] = 0;
                v116[2] = 0;
                v116[3] = v114;
                v116[4] = 0;
                v116[5] = 0;
                v116[6] = 0;
                v116[7] = v115;
                uint64_t v117 = *(void *)(v6 + 48);
                v118 = (char *)apr_array_push(*(apr_array_header_t **)(*(void *)&v2[14]._os_unfair_lock_opaque + 8));
                *(void *)v118 = 0x500000008;
                *((void *)v118 + 1) = 0;
                *((void *)v118 + 2) = 0;
                *((void *)v118 + 4) = 0;
                *((void *)v118 + 5) = 0;
                *((void *)v118 + 3) = v114;
                goto LABEL_276;
              case 3:
                uint64_t v119 = *(void *)(v6 + 8);
                uint64_t v120 = *(void *)(v6 + 40);
                v121 = apr_array_push(*(apr_array_header_t **)(*(void *)&v2[10]._os_unfair_lock_opaque + 8));
                void *v121 = 0x400000008;
                v121[1] = 0;
                v121[2] = 0;
                v121[3] = 0;
                v121[4] = v119;
                v121[5] = 0;
                v121[6] = 0;
                v121[7] = v120;
                uint64_t v117 = *(void *)(v6 + 48);
                v118 = (char *)apr_array_push(*(apr_array_header_t **)(*(void *)&v2[14]._os_unfair_lock_opaque + 8));
                *(void *)v118 = 0x500000008;
                *((void *)v118 + 1) = 0;
                *((void *)v118 + 2) = 0;
                *((void *)v118 + 3) = 0;
                *((void *)v118 + 4) = v119;
                *((void *)v118 + 5) = 0;
LABEL_276:
                v118[48] = 1;
                *(_DWORD *)(v118 + 49) = 0;
                *((_DWORD *)v118 + 13) = 0;
                goto LABEL_283;
              case 4:
                uint64_t v122 = *(void *)(v6 + 16);
                uint64_t v123 = *(void *)(v6 + 40);
                v124 = (char *)apr_array_push(*(apr_array_header_t **)(*(void *)&v2[10]._os_unfair_lock_opaque + 8));
                *(void *)v124 = 0x100000002;
                *((void *)v124 + 1) = 0;
                *((void *)v124 + 2) = v122;
                *(_OWORD *)(v124 + 24) = 0u;
                *(_OWORD *)(v124 + 40) = 0u;
                *((void *)v124 + 7) = v123;
                uint64_t v117 = *(void *)(v6 + 48);
                v118 = (char *)apr_array_push(*(apr_array_header_t **)(*(void *)&v2[14]._os_unfair_lock_opaque + 8));
                *(void *)v118 = 0x200000002;
                *((void *)v118 + 1) = 0;
                *((void *)v118 + 2) = v122;
                *(_OWORD *)(v118 + 24) = 0u;
                *(_OWORD *)(v118 + 40) = 0u;
                goto LABEL_283;
              case 5:
                uint64_t v125 = *(void *)(v6 + 40);
                if (LOBYTE(v2[24]._os_unfair_lock_opaque)) {
                  int v126 = 7;
                }
                else {
                  int v126 = 1;
                }
                v127 = (char *)apr_array_push(*(apr_array_header_t **)(*(void *)&v2[10]._os_unfair_lock_opaque + 8));
                *(_DWORD *)v127 = v126;
                *((_DWORD *)v127 + 1) = 3;
                *(_OWORD *)(v127 + 8) = 0u;
                *(_OWORD *)(v127 + 24) = 0u;
                *(_OWORD *)(v127 + 40) = 0u;
                *((_DWORD *)v127 + 14) = v125;
                *((_DWORD *)v127 + 15) = 0;
                uint64_t v128 = *(void *)(v6 + 48);
                v118 = (char *)apr_array_push(*(apr_array_header_t **)(*(void *)&v2[14]._os_unfair_lock_opaque + 8));
                *(_DWORD *)v118 = v126;
                *((_DWORD *)v118 + 1) = 3;
                *(_OWORD *)(v118 + 8) = 0u;
                *(_OWORD *)(v118 + 24) = 0u;
                *(_OWORD *)(v118 + 40) = 0u;
                *((_DWORD *)v118 + 14) = v128;
                goto LABEL_284;
              case 6:
                uint64_t v129 = *(void *)(v6 + 24);
                uint64_t v130 = *(void *)(v6 + 40);
                v131 = apr_array_push(*(apr_array_header_t **)(*(void *)&v2[10]._os_unfair_lock_opaque + 8));
                void *v131 = 0x300000003;
                v131[1] = v129;
                *((_OWORD *)v131 + 1) = 0u;
                *((_OWORD *)v131 + 2) = 0u;
                v131[6] = 0;
                v131[7] = v130;
                uint64_t v117 = *(void *)(v6 + 48);
                v118 = (char *)apr_array_push(*(apr_array_header_t **)(*(void *)&v2[14]._os_unfair_lock_opaque + 8));
                *(void *)v118 = 0x300000003;
                *((void *)v118 + 1) = v129;
                *((_OWORD *)v118 + 1) = 0u;
                *((_OWORD *)v118 + 2) = 0u;
                *((void *)v118 + 6) = 0;
LABEL_283:
                *((_DWORD *)v118 + 14) = v117;
LABEL_284:
                *((_DWORD *)v118 + 15) = 0;
                break;
              default:
                break;
            }
            unint64_t v132 = 0;
            int v133 = 0;
            long long v228 = 0u;
            long long v229 = 0u;
            long long v226 = 0u;
            long long v227 = 0u;
            long long v224 = 0u;
            long long v225 = 0u;
            long long v222 = 0u;
            long long v223 = 0u;
            long long v220 = 0u;
            long long v221 = 0u;
            long long v218 = 0u;
            long long v219 = 0u;
            memset(buf, 0, sizeof(buf));
            do
            {
              int v134 = v133 + snprintf((char *)&buf[(char)v133], 256 - (char)v133, "%s--", (&off_221B88)[v132 / 2]);
              v135 = (char *)&buf[(char)v134];
              size_t v136 = 256 - (char)v134;
              if (*(_DWORD *)(*(void *)(*(void *)&v2[v132 + 8]._os_unfair_lock_opaque + 8) + 12)) {
                int v137 = snprintf(v135, v136, "🛡️ --");
              }
              else {
                int v137 = snprintf(v135, v136, "➡️ --");
              }
              int v133 = v134 + v137;
              v132 += 2;
            }
            while (v132 != 10);
            snprintf((char *)&buf[(char)v133], 256 - (char)v133, "Postcapture");
            if (*((unsigned char *)p_prots + 3552))
            {
              v138 = gt_tagged_log(0);
              if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v212 = 136315138;
                *(void *)v213 = buf;
                _os_log_impl(&def_CFBEC, v138, OS_LOG_TYPE_INFO, "%s", v212, 0xCu);
              }
            }
            else
            {
              fprintf(__stdoutp, "%s\n", (const char *)buf);
            }
            uint64_t v139 = 0;
            while (1)
            {
              uint64_t v205 = v139;
              uint64_t v207 = (uint64_t)&v2[2 * v139 + 8];
              uint64_t v140 = *(unsigned int *)(*(void *)(*(void *)v207 + 8) + 12);
              if ((int)v140 >= 1) {
                break;
              }
LABEL_367:
              uint64_t v139 = v205 + 1;
              v2 = v204;
              if (v205 == 4)
              {
                atomic_store(1u, (unsigned int *)(*(void *)&v204->_os_unfair_lock_opaque + 104));
                uint64_t v6 = v197;
                GTMTLCaptureManager_activateCaptureWithDescriptor(v197);
                if (*((unsigned char *)p_prots + 3552))
                {
                  v171 = gt_tagged_log(0);
                  if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&def_CFBEC, v171, OS_LOG_TYPE_INFO, "🚀 Capture activated", buf, 2u);
                  }
                }
                else
                {
                  fwrite("🚀 Capture activated\n", 0x17uLL, 1uLL, __stdoutp);
                }
                *(void *)&v204[18]._os_unfair_lock_opaque = v198;
                v105 = v190;
                goto LABEL_373;
              }
            }
            int v141 = 0;
            uint64_t v142 = 0;
            uint64_t v206 = v140 << 6;
            break;
          case 1u:
            GTTraceStoreDebugDescription();
            if (v201 && !*(void *)_sharedCaptureManager)
            {
              *(void *)_sharedCaptureManager = v201;
              if (v6)
              {
LABEL_251:
                unsigned __int8 v108 = *(unsigned char *)(v6 + 92) != 0;
                goto LABEL_267;
              }
            }
            else if (v6)
            {
              goto LABEL_251;
            }
            unsigned __int8 v108 = 1;
LABEL_267:
            atomic_store(v108, (unsigned __int8 *)(*(void *)&v2->_os_unfair_lock_opaque + 120));
            GTMTLCaptureManager_startCapture();
            if (*((unsigned char *)p_prots + 3552))
            {
              v111 = gt_tagged_log(0);
              if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&def_CFBEC, v111, OS_LOG_TYPE_INFO, "🟢 Capture started", buf, 2u);
              }
            }
            else
            {
              fwrite("🟢 Capture started\n", 0x15uLL, 1uLL, __stdoutp);
            }
            *(void *)&v2[18]._os_unfair_lock_opaque = v198;
LABEL_373:
            atomic_fetch_add(v105, 1u);
LABEL_374:
            unsigned int v172 = atomic_load(&v2[5]._os_unfair_lock_opaque);
            uint64_t v18 = *(void *)&v2[2 * v172 + 8]._os_unfair_lock_opaque;
            continue;
          case 2u:
            if (!v203 || v191 != 3 || v203 > *(void *)&v2[18]._os_unfair_lock_opaque) {
              goto LABEL_373;
            }
            if (*((unsigned char *)p_prots + 3552))
            {
              v109 = gt_tagged_log(0);
              if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&def_CFBEC, v109, OS_LOG_TYPE_INFO, "🔄 Transition aborted: waiting for a present issued during capture", buf, 2u);
              }
            }
            else
            {
              fwrite("🔄 Transition aborted: waiting for a present issued during capture\n", 0x45uLL, 1uLL, __stdoutp);
            }
            uint64_t v173 = 0;
            uint64_t v174 = *(void *)&v2[10]._os_unfair_lock_opaque;
            uint64_t v175 = *(void *)&v2[12]._os_unfair_lock_opaque;
            while (2)
            {
              uint64_t v176 = *(void *)(v174 + 8);
              if (v173 >= *(int *)(v176 + 12)) {
                goto LABEL_374;
              }
              v177 = (int *)(*(void *)(v176 + 24) + (v173 << 6));
              if (v177[1] != 3) {
                goto LABEL_388;
              }
              int v178 = *v177;
              v179 = v177 + 2;
              uint64_t v180 = *((void *)v177 + 7);
              *(_DWORD *)buf = *v177;
              *(_DWORD *)&buf[4] = 3;
              *(_OWORD *)&buf[8] = *(_OWORD *)(v177 + 2);
              *(_OWORD *)&buf[24] = *(_OWORD *)(v177 + 6);
              *(_OWORD *)&buf[40] = *(_OWORD *)(v177 + 10);
              *(void *)&buf[56] = v180;
              v181 = *(apr_array_header_t **)(v175 + 8);
              uint64_t nelts = v181->nelts;
              if ((int)nelts < 1) {
                goto LABEL_386;
              }
              uint64_t v183 = 0;
              elts = v181->elts;
              uint64_t v185 = (uint64_t)elts;
              while (!GTCaptureBoundaryCondition_equals(v185, (uint64_t)buf))
              {
                ++v183;
                v185 += 64;
                if (nelts == v183) {
                  goto LABEL_386;
                }
              }
              if (elts)
              {
                ++*(_DWORD *)&elts[64 * v183 + 56];
              }
              else
              {
LABEL_386:
                *(_OWORD *)buf = *v179;
                *(_OWORD *)&buf[16] = v179[1];
                *(_OWORD *)&buf[32] = v179[2];
                v186 = (char *)apr_array_push(v181);
                *(_DWORD *)v186 = v178;
                *((_DWORD *)v186 + 1) = 3;
                *(_OWORD *)(v186 + 8) = *(_OWORD *)buf;
                *(_OWORD *)(v186 + 24) = *(_OWORD *)&buf[16];
                *(_OWORD *)(v186 + 40) = *(_OWORD *)&buf[32];
                *((void *)v186 + 7) = 1;
              }
              v2 = v204;
              uint64_t v6 = v197;
              p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___MTLDrawable + 16);
LABEL_388:
              ++v173;
              continue;
            }
          case 3u:
            if (!v202 || v191 != 5 && v191 != 3)
            {
              atomic_store(0, (unsigned __int8 *)(*(void *)&v2->_os_unfair_lock_opaque + 120));
              goto LABEL_373;
            }
            if (*((unsigned char *)p_prots + 3552))
            {
              v110 = gt_tagged_log(0);
              if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&def_CFBEC, v110, OS_LOG_TYPE_INFO, "🔄 Transition aborted: waiting until command buffer is scheduled", buf, 2u);
              }
            }
            else
            {
              fwrite("🔄 Transition aborted: waiting until command buffer is scheduled\n", 0x43uLL, 1uLL, __stdoutp);
            }
            v112 = *(apr_array_header_t **)(*(void *)&v2[14]._os_unfair_lock_opaque + 8);
            v112->uint64_t nelts = 0;
            v113 = (char *)apr_array_push(v112);
            *(void *)v113 = 0x600000008;
            *(_OWORD *)(v113 + 8) = 0u;
            *(_OWORD *)(v113 + 24) = 0u;
            *((void *)v113 + 5) = v202;
            *((void *)v113 + 6) = 0;
            *((void *)v113 + 7) = 1;
            goto LABEL_374;
          default:
            goto LABEL_373;
        }
        while (1)
        {
          if (*((unsigned char *)p_prots + 3552))
          {
            v143 = gt_tagged_log(0);
            if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
            {
              v144 = "Postcapture";
              v145 = "Inactive";
              v146 = "Active";
              switch((int)v205)
              {
                case 0:
                  break;
                case 1:
                  v145 = "Active";
                  v146 = "Precapture";
                  break;
                case 2:
                  v145 = "Precapture";
                  v146 = "Capture";
                  break;
                case 3:
                  v145 = "Capture";
                  v146 = "Postcapture";
                  break;
                case 4:
                  goto LABEL_310;
                default:
                  v144 = "UNKNOWN";
LABEL_310:
                  v145 = v144;
                  v146 = "UNKNOWN";
                  break;
              }
              *(_DWORD *)v212 = 136315650;
              *(void *)v213 = v145;
              *(_WORD *)&v213[8] = 2080;
              v214 = v146;
              __int16 v215 = 1024;
              int v216 = v141;
              _os_log_impl(&def_CFBEC, v143, OS_LOG_TYPE_INFO, "%s--🛡️ --%s Condition #%d", v212, 0x1Cu);
            }
          }
          else
          {
            v147 = "Postcapture";
            v148 = "Inactive";
            v149 = "Active";
            switch((int)v205)
            {
              case 0:
                break;
              case 1:
                v148 = "Active";
                v149 = "Precapture";
                break;
              case 2:
                v148 = "Precapture";
                v149 = "Capture";
                break;
              case 3:
                v148 = "Capture";
                v149 = "Postcapture";
                break;
              case 4:
                goto LABEL_306;
              default:
                v147 = "UNKNOWN";
LABEL_306:
                v148 = v147;
                v149 = "UNKNOWN";
                break;
            }
            fprintf(__stdoutp, "%s--🛡️ --%s Condition #%d\n", v148, v149, v141);
          }
          v150 = (int *)(*(void *)(*(void *)(*(void *)v207 + 8) + 24) + v142);
          int v151 = *v150;
          int v152 = v150[1];
          uint64_t v154 = *((void *)v150 + 1);
          uint64_t v153 = *((void *)v150 + 2);
          uint64_t v156 = *((void *)v150 + 3);
          uint64_t v155 = *((void *)v150 + 4);
          uint64_t v157 = *((void *)v150 + 5);
          int v210 = *((unsigned __int8 *)v150 + 48);
          int v208 = v150[15];
          int v209 = v150[14];
          if (s_logUsingOsLog)
          {
            v158 = gt_tagged_log(0);
            if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
            {
              v159 = "Instant";
              if ((v152 - 1) <= 8) {
                v159 = (&off_221BB0)[v152 - 1];
              }
              *(_DWORD *)v212 = 136315138;
              *(void *)v213 = v159;
              _os_log_impl(&def_CFBEC, v158, OS_LOG_TYPE_INFO, "    type: %s", v212, 0xCu);
            }
          }
          else
          {
            v160 = "Instant";
            if ((v152 - 1) <= 8) {
              v160 = (&off_221BB0)[v152 - 1];
            }
            fprintf(__stdoutp, "    type: %s\n", v160);
          }
          p_prots = &OBJC_PROTOCOL___MTLDrawable.prots;
          if (s_logUsingOsLog)
          {
            v161 = gt_tagged_log(0);
            if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
            {
              v162 = "None";
              if ((v151 - 1) <= 0xB) {
                v162 = (&off_221B28)[v151 - 1];
              }
              *(_DWORD *)v212 = 136315138;
              *(void *)v213 = v162;
              _os_log_impl(&def_CFBEC, v161, OS_LOG_TYPE_INFO, "    object: %s", v212, 0xCu);
            }
            if (!v154) {
              goto LABEL_334;
            }
          }
          else
          {
            v163 = "None";
            if ((v151 - 1) <= 0xB) {
              v163 = (&off_221B28)[v151 - 1];
            }
            fprintf(__stdoutp, "    object: %s\n", v163);
            if (!v154) {
              goto LABEL_334;
            }
          }
          if (!s_logUsingOsLog)
          {
            fprintf(__stdoutp, "    CAMetalLayer stream ref: %llu\n", v154);
            if (!v153) {
              goto LABEL_341;
            }
            goto LABEL_335;
          }
          v164 = gt_tagged_log(0);
          if (os_log_type_enabled(v164, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v212 = 134217984;
            *(void *)v213 = v154;
            _os_log_impl(&def_CFBEC, v164, OS_LOG_TYPE_INFO, "    CAMetalLayer stream ref: %llu", v212, 0xCu);
          }
LABEL_334:
          if (!v153) {
            goto LABEL_341;
          }
LABEL_335:
          if (s_logUsingOsLog)
          {
            v165 = gt_tagged_log(0);
            if (os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v212 = 134217984;
              *(void *)v213 = v153;
              _os_log_impl(&def_CFBEC, v165, OS_LOG_TYPE_INFO, "    MTLCaptureScope stream ref: %llu", v212, 0xCu);
            }
          }
          else
          {
            fprintf(__stdoutp, "    MTLCaptureScope stream ref: %llu\n", v153);
          }
LABEL_341:
          if (!v156) {
            goto LABEL_345;
          }
          if (s_logUsingOsLog)
          {
            v166 = gt_tagged_log(0);
            if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v212 = 134217984;
              *(void *)v213 = v156;
              _os_log_impl(&def_CFBEC, v166, OS_LOG_TYPE_INFO, "    MTLDevice stream ref: %llu", v212, 0xCu);
            }
LABEL_345:
            if (v155) {
              goto LABEL_346;
            }
            goto LABEL_352;
          }
          fprintf(__stdoutp, "    MTLDevice stream ref: %llu\n", v156);
          if (v155)
          {
LABEL_346:
            if (s_logUsingOsLog)
            {
              v167 = gt_tagged_log(0);
              if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v212 = 134217984;
                *(void *)v213 = v155;
                _os_log_impl(&def_CFBEC, v167, OS_LOG_TYPE_INFO, "    MTLCommandQueue stream ref: %llu", v212, 0xCu);
              }
            }
            else
            {
              fprintf(__stdoutp, "    MTLCommandQueue stream ref: %llu\n", v155);
            }
          }
LABEL_352:
          if (v157)
          {
            if (s_logUsingOsLog)
            {
              v168 = gt_tagged_log(0);
              if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v212 = 134217984;
                *(void *)v213 = v157;
                _os_log_impl(&def_CFBEC, v168, OS_LOG_TYPE_INFO, "    MTLCommandBuffer stream ref: %llu", v212, 0xCu);
              }
            }
            else
            {
              fprintf(__stdoutp, "    MTLCommandBuffer stream ref: %llu\n", v157);
            }
          }
          if (v210)
          {
            if (s_logUsingOsLog)
            {
              v169 = gt_tagged_log(0);
              if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v212 = 0;
                _os_log_impl(&def_CFBEC, v169, OS_LOG_TYPE_INFO, "    MTLCommandBuffer is capturing", v212, 2u);
              }
            }
            else
            {
              fwrite("    MTLCommandBuffer is capturing\n", 0x22uLL, 1uLL, __stdoutp);
            }
          }
          if (s_logUsingOsLog)
          {
            v170 = gt_tagged_log(0);
            if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v212 = 67109376;
              *(_DWORD *)v213 = v208;
              *(_WORD *)&v213[4] = 1024;
              *(_DWORD *)&v213[6] = v209;
              _os_log_impl(&def_CFBEC, v170, OS_LOG_TYPE_INFO, "    Hit count: %u/%u", v212, 0xEu);
            }
          }
          else
          {
            fprintf(__stdoutp, "    Hit count: %u/%u\n", v208, v209);
          }
          v142 += 64;
          ++v141;
          if (v206 == v142) {
            goto LABEL_367;
          }
        }
      }
    }
    break;
  }
LABEL_15:
  os_unfair_lock_unlock(lock);
  unsigned int v13 = atomic_load((unsigned int *)(*(void *)(a1 + 48) + 20));
  BOOL v15 = v188 != 4 && v13 == 4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v15;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 48) + 97);
}

void __GTCaptureBoundaryTracker_handleTrigger_block_invoke_2(uint64_t a1)
{
  if (s_logUsingOsLog)
  {
    v2 = gt_tagged_log(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_CFBEC, v2, OS_LOG_TYPE_INFO, "🛑 Stopping capture", buf, 2u);
    }
  }
  else
  {
    fwrite("🛑 Stopping capture\n", 0x16uLL, 1uLL, __stdoutp);
  }
  GTMTLCaptureManager_stopActiveCapture(*(void *)(*(void *)(a1 + 32) + 72), *(void *)(*(void *)(a1 + 32) + 80));
  if (s_logUsingOsLog)
  {
    uint32_t v3 = gt_tagged_log(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&def_CFBEC, v3, OS_LOG_TYPE_INFO, "🏁 Capture finished", v4, 2u);
    }
  }
  else
  {
    fwrite("🏁 Capture finished\n", 0x16uLL, 1uLL, __stdoutp);
  }
}

@end