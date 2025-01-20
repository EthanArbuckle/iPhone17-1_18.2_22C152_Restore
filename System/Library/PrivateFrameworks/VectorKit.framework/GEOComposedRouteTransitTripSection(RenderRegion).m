@interface GEOComposedRouteTransitTripSection(RenderRegion)
- (BOOL)_validateSnappedPaths:()RenderRegion snappedTileBounds:overlay:;
- (id)pathsForRenderRegion:()RenderRegion inOverlay:shouldSnapToTransit:verifySnapping:;
- (id)unsnappedPathsInOverlay:()RenderRegion;
- (uint64_t)_getEndPoints:()RenderRegion rect:result:;
@end

@implementation GEOComposedRouteTransitTripSection(RenderRegion)

- (id)unsnappedPathsInOverlay:()RenderRegion
{
  id v4 = a3;
  v5 = _unsnappedPaths(*(const float **)&a1[*MEMORY[0x1E4F64C70]], *(_DWORD *)&a1[*MEMORY[0x1E4F64C68]], v4, a1, [a1 lineID]);

  return v5;
}

- (id)pathsForRenderRegion:()RenderRegion inOverlay:shouldSnapToTransit:verifySnapping:
{
  id v9 = a3;
  id v239 = a4;
  v10 = &a1[*MEMORY[0x1E4F64C58]];
  v243 = a1;
  v11 = &a1[*MEMORY[0x1E4F64C60]];
  long long v12 = *(_OWORD *)(v10 + 24);
  *(_OWORD *)v11 = *(_OWORD *)v10;
  *((_OWORD *)v11 + 1) = v12;
  v234 = v11;
  v237 = v9;
  if (!a5) {
    goto LABEL_254;
  }
  float64x2_t v291 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  float64x2_t v292 = (float64x2_t)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v13 = (void *)[v9 routeLineDatas];
  v16 = (void *)*v13;
  v14 = v13 + 1;
  v15 = v16;
  if (v16 == v14) {
    goto LABEL_254;
  }
  v241 = v14;
  while (2)
  {
    v244 = v15;
    uint64_t v17 = v15[4];
    v18 = *(geo::codec::VectorTile **)(v17 + 768);
    if (!v18) {
      goto LABEL_246;
    }
    uint64_t v251 = geo::codec::VectorTile::transitLinks(v18);
    unint64_t v19 = geo::codec::VectorTile::transitLinkCount(*(geo::codec::VectorTile **)(v17 + 768));
    unint64_t v20 = v19;
    if (!v19) {
      goto LABEL_246;
    }
    uint64_t v21 = 0;
    v248 = &v243[*MEMORY[0x1E4F64C80]];
    v246 = &v243[*MEMORY[0x1E4F64C88]];
    unint64_t v255 = v19;
    while (1)
    {
      uint64_t v253 = v21;
      uint64_t v22 = v251 + 184 * v21;
      if (*(_DWORD *)(v22 + 20))
      {
        v23 = *(void **)v248;
        v279 = (void *)*((void *)v248 + 2);
        v281 = (void *)*((void *)v248 + 1);
        v285 = (void *)*((void *)v246 + 1);
        v287 = *(void **)v246;
        v283 = (void *)*((void *)v246 + 2);
        uint64_t LineCount = geo::codec::transitLinkGetLineCount(v22);
        if (LineCount)
        {
          unint64_t v25 = 0;
          v26 = (void *)(v251 + 184 * v253);
          v275 = v26 + 15;
          v277 = v26 + 16;
          v271 = v26 + 19;
          v273 = v26 + 20;
          v265 = v26 + 17;
          v267 = v26 + 18;
          v249 = v26 + 21;
          v261 = (geo::codec::VectorTile **)v22;
          v263 = v26 + 22;
          v269 = v23;
          uint64_t v257 = LineCount;
          while (1)
          {
            v27 = geo::codec::transitLinkGetFromNodeID(v22, v25);
            v28 = geo::codec::transitLinkGetToNodeID(v22, v25);
            unsigned int LineDirection = geo::codec::transitLinkGetLineDirection((void *)v22, v25);
            unsigned int v30 = LineDirection;
            if (LineDirection > 1)
            {
              BOOL v31 = 0;
              BOOL v32 = 0;
              goto LABEL_36;
            }
            _ZF = v23 == v27 || v281 == v27;
            BOOL v34 = _ZF || v279 == v27;
            BOOL v31 = v34;
            BOOL v35 = v287 == v28 || v285 == v28;
            BOOL v36 = v35 || v283 == v28;
            BOOL v32 = v36;
            if (v31 && v32) {
              break;
            }
LABEL_36:
            char v37 = LineDirection & 0xFD;
            if ((LineDirection & 0xFFFFFFFD) != 0)
            {
              LOBYTE(v38) = 0;
              BOOL v39 = 0;
            }
            else
            {
              BOOL v38 = v23 == v28 || v281 == v28 || v279 == v28;
              BOOL v39 = v287 == v27 || v285 == v27 || v283 == v27;
              if (v38 && v39) {
                break;
              }
            }
            if (v31 || v32 || v38 || v39)
            {
              v44 = (std::__shared_weak_count *)v261[1];
              if (v44 && (v259 = std::__shared_weak_count::lock(v44)) != 0)
              {
                v45 = *v261;
              }
              else
              {
                v259 = 0;
                v45 = 0;
              }
              if (*v277)
              {
                unint64_t v46 = 0;
                BOOL v49 = v287 != v28 && v285 != v28 && v283 != v28;
                BOOL v52 = v269 != v28 && v281 != v28 && v279 != v28 || v37 != 0;
                uint64_t v53 = 40;
                while (1)
                {
                  v54 = *(void **)(geo::codec::VectorTile::transitNodes(v45) + 344 * *v275 + v53);
                  if (v30 <= 1)
                  {
                    BOOL v55 = v269 == v54 || v281 == v54;
                    BOOL v56 = v55 || v279 == v54;
                    if (v56 && !v49) {
                      break;
                    }
                  }
                  if (!v52)
                  {
                    BOOL v58 = v287 == v54 || v285 == v54;
                    if (v58 || v283 == v54) {
                      break;
                    }
                  }
                  ++v46;
                  v53 += 344;
                  if (v46 >= *v277) {
                    goto LABEL_108;
                  }
                }
                int v60 = 0;
                v23 = v269;
                v61 = v259;
                if (!v259)
                {
LABEL_12:
                  if (!v60) {
                    break;
                  }
                  goto LABEL_13;
                }
LABEL_242:
                if (!atomic_fetch_add(&v61->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
                  std::__shared_weak_count::__release_weak(v61);
                }
                goto LABEL_12;
              }
LABEL_108:
              v23 = v269;
              if (*v273)
              {
                uint64_t v62 = 0;
                BOOL v65 = v287 != v28 && v285 != v28 && v283 != v28;
                BOOL v68 = v269 != v28 && v281 != v28 && v279 != v28 || v37 != 0;
                while (1)
                {
                  v69 = *(void **)(geo::codec::VectorTile::transitNodeCollapseIDs(v45) + 8 * (v62 + *v271));
                  if (v30 <= 1)
                  {
                    BOOL v70 = v269 == v69 || v281 == v69;
                    BOOL v71 = v70 || v279 == v69;
                    if (v71 && !v65) {
                      break;
                    }
                  }
                  if (!v68)
                  {
                    BOOL v73 = v287 == v69 || v285 == v69;
                    if (v73 || v283 == v69) {
                      break;
                    }
                  }
                  if ((unint64_t)++v62 >= *v273) {
                    goto LABEL_149;
                  }
                }
              }
              else
              {
LABEL_149:
                if (*v267)
                {
                  unint64_t v75 = 0;
                  BOOL v78 = v287 != v27 && v285 != v27 && v283 != v27;
                  BOOL v82 = v269 != v27 && v281 != v27 && v279 != v27 || v30 > 1;
                  uint64_t v83 = 40;
                  while (1)
                  {
                    v84 = *(void **)(geo::codec::VectorTile::transitNodes(v45) + 344 * *v265 + v83);
                    if (!v82)
                    {
                      BOOL v85 = v287 == v84 || v285 == v84;
                      if (v85 || v283 == v84) {
                        break;
                      }
                    }
                    if (!v37)
                    {
                      BOOL v87 = v269 == v84 || v281 == v84;
                      BOOL v88 = v87 || v279 == v84;
                      if (v88 && !v78) {
                        break;
                      }
                    }
                    ++v75;
                    v83 += 344;
                    if (v75 >= *v267) {
                      goto LABEL_195;
                    }
                  }
                }
                else
                {
LABEL_195:
                  if (!*v263)
                  {
LABEL_241:
                    int v60 = 1;
                    v61 = v259;
                    if (!v259) {
                      goto LABEL_12;
                    }
                    goto LABEL_242;
                  }
                  uint64_t v90 = 0;
                  BOOL v93 = v287 != v27 && v285 != v27 && v283 != v27;
                  BOOL v97 = v269 != v27 && v281 != v27 && v279 != v27 || v30 > 1;
                  while (1)
                  {
                    v98 = *(void **)(geo::codec::VectorTile::transitNodeCollapseIDs(v45) + 8 * (v90 + *v249));
                    if (!v97)
                    {
                      BOOL v99 = v287 == v98 || v285 == v98;
                      if (v99 || v283 == v98) {
                        break;
                      }
                    }
                    if (!v37)
                    {
                      BOOL v101 = v269 == v98 || v281 == v98;
                      BOOL v102 = v101 || v279 == v98;
                      if (v102 && !v93) {
                        break;
                      }
                    }
                    if ((unint64_t)++v90 >= *v263) {
                      goto LABEL_241;
                    }
                  }
                }
              }
              int v60 = 0;
              v61 = v259;
              if (!v259) {
                goto LABEL_12;
              }
              goto LABEL_242;
            }
LABEL_13:
            ++v25;
            unint64_t v20 = v255;
            uint64_t v22 = (uint64_t)v261;
            if (v25 == v257) {
              goto LABEL_8;
            }
          }
          v289[0] = 0;
          geo::codec::transitLinkPoints((uint64_t)v261, 0, v289);
          unint64_t v20 = v255;
          if (*(void *)v289 > 1uLL) {
            break;
          }
        }
      }
LABEL_8:
      uint64_t v21 = v253 + 1;
      if (v253 + 1 == v20) {
        goto LABEL_246;
      }
    }
    uint64_t v104 = v244[4];
    int v105 = 1 << *(unsigned char *)(v104 + 169);
    double v106 = 1.0 / (double)v105;
    double v107 = v106 * (double)*(int *)(v104 + 176);
    double v108 = v106 * (double)(v105 + ~*(_DWORD *)(v104 + 172));
    v291.f64[0] = fmin(v107, v291.f64[0]);
    v291.f64[1] = fmin(v108, v291.f64[1]);
    v292.f64[0] = fmax(v292.f64[0], v107 + v106);
    v292.f64[1] = fmax(v292.f64[1], v108 + v106);
LABEL_246:
    v109 = v244;
    v110 = (void *)v244[1];
    if (v110)
    {
      do
      {
        v111 = v110;
        v110 = (void *)*v110;
      }
      while (v110);
    }
    else
    {
      do
      {
        v111 = (void *)v109[2];
        _ZF = *v111 == (void)v109;
        v109 = v111;
      }
      while (!_ZF);
    }
    v15 = v111;
    if (v111 != v241) {
      continue;
    }
    break;
  }
  if (v292.f64[0] < v291.f64[0] || v292.f64[1] < v291.f64[1])
  {
LABEL_254:
    id v112 = 0;
    goto LABEL_255;
  }
  v238 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v292.f64[1]);
  v114 = (void *)[v237 routeLineDatas];
  v117 = (void *)*v114;
  v115 = v114 + 1;
  v116 = v117;
  if (v117 == v115) {
    goto LABEL_522;
  }
  __asm { FMOV            V9.2S, #1.0 }
  v236 = v115;
  while (2)
  {
    uint64_t v240 = v116[4];
    v122 = *(geo::codec::VectorTile **)(v240 + 768);
    if (!v122) {
      goto LABEL_516;
    }
    uint64_t v247 = geo::codec::VectorTile::transitLinks(v122);
    unint64_t v123 = geo::codec::VectorTile::transitLinkCount(*(geo::codec::VectorTile **)(v240 + 768));
    unint64_t v124 = v123;
    if (!v123) {
      goto LABEL_516;
    }
    uint64_t v125 = 0;
    v245 = &v243[*MEMORY[0x1E4F64C80]];
    v242 = &v243[*MEMORY[0x1E4F64C88]];
    v252 = v116;
    unint64_t v254 = v123;
    while (2)
    {
      uint64_t v250 = v125;
      uint64_t v126 = v247 + 184 * v125;
      if (!*(_DWORD *)(v126 + 20)) {
        goto LABEL_264;
      }
      v280 = (void *)*((void *)v245 + 1);
      v282 = *(void **)v245;
      v278 = (void *)*((void *)v245 + 2);
      v286 = (void *)*((void *)v242 + 1);
      v288 = *(void **)v242;
      v284 = (void *)*((void *)v242 + 2);
      uint64_t v127 = geo::codec::transitLinkGetLineCount(v126);
      uint64_t v128 = v127;
      if (!v127) {
        goto LABEL_264;
      }
      unint64_t v129 = 0;
      v130 = (void *)(v247 + 184 * v250);
      v274 = v130 + 15;
      v276 = v130 + 16;
      v270 = v130 + 19;
      v272 = v130 + 20;
      v266 = v130 + 17;
      v268 = v130 + 18;
      v262 = v130 + 21;
      v264 = v130 + 22;
      uint64_t v256 = v127;
      v260 = (geo::codec::VectorTile **)v126;
      while (2)
      {
        v131 = geo::codec::transitLinkGetFromNodeID(v126, v129);
        v132 = geo::codec::transitLinkGetToNodeID(v126, v129);
        unsigned int v133 = geo::codec::transitLinkGetLineDirection((void *)v126, v129);
        unsigned int v134 = v133;
        if (v133 <= 1)
        {
          BOOL v135 = v282 == v131 || v280 == v131 || v278 == v131;
          BOOL v136 = v288 == v132 || v286 == v132 || v284 == v132;
          if (v135 && v136)
          {
            int v212 = 1;
            goto LABEL_513;
          }
        }
        else
        {
          BOOL v135 = 0;
          BOOL v136 = 0;
        }
        char v141 = v133 & 0xFD;
        if ((v133 & 0xFFFFFFFD) != 0)
        {
          LOBYTE(v142) = 0;
          BOOL v143 = 0;
          goto LABEL_314;
        }
        BOOL v142 = v282 == v132 || v280 == v132 || v278 == v132;
        BOOL v143 = v288 == v131 || v286 == v131 || v284 == v131;
        if (!v142 || !v143)
        {
LABEL_314:
          if (v135 || v136 || v142 || v143)
          {
            v148 = (std::__shared_weak_count *)v260[1];
            if (v148 && (v258 = std::__shared_weak_count::lock(v148)) != 0)
            {
              v149 = *v260;
            }
            else
            {
              v258 = 0;
              v149 = 0;
            }
            if (*v276)
            {
              unint64_t v150 = 0;
              BOOL v153 = v288 != v132 && v286 != v132 && v284 != v132;
              BOOL v156 = v282 != v132 && v280 != v132 && v278 != v132 || v141 != 0;
              uint64_t v157 = 40;
              while (1)
              {
                v158 = *(void **)(geo::codec::VectorTile::transitNodes(v149) + 344 * *v274 + v157);
                if (v134 <= 1)
                {
                  BOOL v159 = v282 == v158 || v280 == v158;
                  BOOL v160 = v159 || v278 == v158;
                  if (v160 && !v153) {
                    break;
                  }
                }
                if (!v156)
                {
                  BOOL v162 = v288 == v158 || v286 == v158;
                  if (v162 || v284 == v158)
                  {
                    int v164 = 0;
                    int v165 = 2;
                    goto LABEL_497;
                  }
                }
                ++v150;
                v157 += 344;
                if (v150 >= *v276) {
                  goto LABEL_363;
                }
              }
              int v164 = 0;
              int v165 = 1;
LABEL_497:
              LODWORD(v248) = v165;
              v116 = v252;
              unint64_t v124 = v254;
LABEL_506:
              uint64_t v128 = v256;
              v209 = v258;
              if (v258)
              {
LABEL_507:
                if (!atomic_fetch_add(&v209->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v209->__on_zero_shared)(v209);
                  std::__shared_weak_count::__release_weak(v209);
                }
              }
            }
            else
            {
LABEL_363:
              unint64_t v124 = v254;
              uint64_t v128 = v256;
              if (!*v272)
              {
LABEL_404:
                if (*v268)
                {
                  unint64_t v180 = 0;
                  BOOL v183 = v288 != v131 && v286 != v131 && v284 != v131;
                  BOOL v187 = v282 != v131 && v280 != v131 && v278 != v131 || v134 > 1;
                  uint64_t v188 = 40;
                  while (1)
                  {
                    v189 = *(void **)(geo::codec::VectorTile::transitNodes(v149) + 344 * *v266 + v188);
                    if (!v187)
                    {
                      BOOL v190 = v288 == v189 || v286 == v189;
                      if (v190 || v284 == v189)
                      {
                        int v164 = 0;
                        int v210 = 1;
                        goto LABEL_504;
                      }
                    }
                    if (!v141)
                    {
                      BOOL v192 = v282 == v189 || v280 == v189;
                      BOOL v193 = v192 || v278 == v189;
                      if (v193 && !v183) {
                        break;
                      }
                    }
                    ++v180;
                    v188 += 344;
                    if (v180 >= *v268) {
                      goto LABEL_450;
                    }
                  }
                  int v164 = 0;
                  int v210 = 2;
LABEL_504:
                  LODWORD(v248) = v210;
                }
                else
                {
LABEL_450:
                  if (*v264)
                  {
                    uint64_t v195 = 0;
                    BOOL v198 = v288 != v131 && v286 != v131 && v284 != v131;
                    BOOL v202 = v282 != v131 && v280 != v131 && v278 != v131 || v134 > 1;
                    v116 = v252;
                    uint64_t v128 = v256;
                    while (1)
                    {
                      v203 = *(void **)(geo::codec::VectorTile::transitNodeCollapseIDs(v149) + 8 * (v195 + *v262));
                      if (!v202)
                      {
                        BOOL v204 = v288 == v203 || v286 == v203;
                        if (v204 || v284 == v203)
                        {
                          int v164 = 0;
                          int v211 = 1;
                          goto LABEL_509;
                        }
                      }
                      if (!v141)
                      {
                        BOOL v206 = v282 == v203 || v280 == v203;
                        BOOL v207 = v206 || v278 == v203;
                        if (v207 && !v198) {
                          break;
                        }
                      }
                      if ((unint64_t)++v195 >= *v264)
                      {
                        int v164 = 1;
                        v209 = v258;
                        if (v258) {
                          goto LABEL_507;
                        }
                        goto LABEL_268;
                      }
                    }
                    int v164 = 0;
                    int v211 = 2;
LABEL_509:
                    LODWORD(v248) = v211;
                    v209 = v258;
                    if (v258) {
                      goto LABEL_507;
                    }
                    goto LABEL_268;
                  }
                  int v164 = 1;
                }
                v116 = v252;
                goto LABEL_506;
              }
              uint64_t v166 = 0;
              BOOL v169 = v288 != v132 && v286 != v132 && v284 != v132;
              BOOL v172 = v282 != v132 && v280 != v132 && v278 != v132 || v141 != 0;
              while (1)
              {
                v173 = *(void **)(geo::codec::VectorTile::transitNodeCollapseIDs(v149) + 8 * (v166 + *v270));
                if (v134 <= 1)
                {
                  BOOL v174 = v282 == v173 || v280 == v173;
                  BOOL v175 = v174 || v278 == v173;
                  if (v175 && !v169) {
                    break;
                  }
                }
                if (!v172)
                {
                  BOOL v177 = v288 == v173 || v286 == v173;
                  if (v177 || v284 == v173)
                  {
                    int v164 = 0;
                    int v179 = 2;
                    goto LABEL_500;
                  }
                }
                if ((unint64_t)++v166 >= *v272) {
                  goto LABEL_404;
                }
              }
              int v164 = 0;
              int v179 = 1;
LABEL_500:
              LODWORD(v248) = v179;
              v116 = v252;
              v209 = v258;
              if (v258) {
                goto LABEL_507;
              }
            }
LABEL_268:
            if (!v164) {
              goto LABEL_514;
            }
          }
          ++v129;
          uint64_t v126 = (uint64_t)v260;
          if (v129 == v128) {
            goto LABEL_264;
          }
          continue;
        }
        break;
      }
      int v212 = 2;
LABEL_513:
      LODWORD(v248) = v212;
LABEL_514:
      unint64_t v290 = 0;
      uint64_t v213 = geo::codec::transitLinkPoints((uint64_t)v260, 0, &v290);
      if (v290 >= 2)
      {
        uint64_t v214 = v213;
        uint64_t v215 = v116[4];
        int v216 = 1 << *(unsigned char *)(v215 + 169);
        v217.i64[0] = *(int *)(v215 + 176);
        v217.i64[1] = v216 + ~*(_DWORD *)(v215 + 172);
        v289[0] = vdiv_f32(_D9, vcvt_f32_f64(vmulq_n_f64(vsubq_f64(v292, v291), (double)v216)));
        v289[1] = vmul_f32(v289[0], vcvt_f32_f64(vmulq_n_f64(vmlaq_n_f64(vnegq_f64(v291), vcvtq_f64_s64(v217), 1.0 / (double)v216), (double)v216)));
        v218 = [VKTransitPolylinePath alloc];
        unint64_t v219 = v290;
        unsigned int v220 = [v243 startPointIndex];
        unsigned int v221 = [v243 endPointIndex];
        uint64_t v222 = [v243 lineID];
        uint64_t v223 = *(void *)geo::codec::VectorTile::key(*(geo::codec::VectorTile **)(v240 + 768));
        BYTE4(v233) = *(unsigned char *)geo::codec::VectorTile::transitVertices(*(geo::codec::VectorTile **)(v240 + 768));
        LODWORD(v233) = (v223 >> 8) & 0x3F;
        v224 = -[VKTransitPolylinePath initWithOverlay:section:points:pointCount:reversePoints:transform:routeStartIndex:routeEndIndex:lineID:tileZ:vertexPrecision:](v218, "initWithOverlay:section:points:pointCount:reversePoints:transform:routeStartIndex:routeEndIndex:lineID:tileZ:vertexPrecision:", v239, v243, v214, v219, v248 == 2, v289, __PAIR64__(v221, v220), v222, v233);
        [v238 addObject:v224];
      }
LABEL_264:
      uint64_t v125 = v250 + 1;
      if (v250 + 1 != v124) {
        continue;
      }
      break;
    }
LABEL_516:
    v225 = (void *)v116[1];
    if (v225)
    {
      do
      {
        v226 = v225;
        v225 = (void *)*v225;
      }
      while (v225);
    }
    else
    {
      do
      {
        v226 = (void *)v116[2];
        _ZF = *v226 == (void)v116;
        v116 = v226;
      }
      while (!_ZF);
    }
    v116 = v226;
    if (v226 != v236) {
      continue;
    }
    break;
  }
LABEL_522:
  if ((a6 & 1) != 0
    && ([v243 _validateSnappedPaths:v238 snappedTileBounds:&v291 overlay:v239] & 1) == 0)
  {
    id v112 = 0;
  }
  else
  {
    float64x2_t v227 = *(float64x2_t *)(MEMORY[0x1E4F63F08] + 16);
    _V2.D[1] = v292.f64[1];
    uint64_t v229 = *(_OWORD *)&vmulq_f64(v227, v291);
    _D4 = *(void *)(MEMORY[0x1E4F63F08] + 24);
    __asm { FMLS            D4, D4, V2.D[1] }
    float64x2_t v232 = vmulq_f64(vsubq_f64(v292, v291), v227);
    *(void *)v234 = v229;
    *((void *)v234 + 1) = _D4;
    *((float64x2_t *)v234 + 1) = v232;
    id v112 = v238;
  }
LABEL_255:

  return v112;
}

- (BOOL)_validateSnappedPaths:()RenderRegion snappedTileBounds:overlay:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v52 = a5;
  v7 = [a1 unsnappedPathsInOverlay:v52];
  v8 = (double *)&a1[*MEMORY[0x1E4F64C58]];
  double v9 = v8[1];
  double v10 = *(double *)(MEMORY[0x1E4F63F08] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F63F08] + 24);
  double v12 = 1.0 - (v8[4] + v9) / v11;
  double v13 = (v8[3] + *v8) / v10;
  v68[0] = *v8 / v10;
  v68[1] = v12;
  v68[2] = v13;
  v68[3] = 1.0 - v9 / v11;
  if (([a1 _getEndPoints:v7 rect:v68 result:v69] & 1) == 0)
  {
    BOOL v17 = 0;
    goto LABEL_61;
  }
  long long v64 = v69[0];
  BOOL v65 = &v64;
  long long v66 = v69[1];
  v67 = &v64;
  __p = 0;
  uint64_t v62 = 0;
  v63 = 0;
  unint64_t v14 = [v53 count];
  unint64_t v15 = v14;
  if (v14)
  {
    if (v14 >> 61) {
      goto LABEL_63;
    }
    v16 = (char *)operator new(8 * v14);
    __p = v16;
    uint64_t v62 = v16;
    v63 = &v16[8 * v15];
  }
  else
  {
    v16 = 0;
  }
  uint64_t v18 = [v53 count];
  unint64_t v19 = 2 * v18;
  if (2 * v18)
  {
    if (!(v19 >> 61))
    {
      unint64_t v20 = (double **)operator new(16 * v18);
      BOOL v56 = &v20[v19];
      goto LABEL_11;
    }
LABEL_63:
    abort();
  }
  BOOL v56 = 0;
  unint64_t v20 = 0;
LABEL_11:
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v53;
  uint64_t v21 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v21)
  {
    uint64_t v55 = *(void *)v58;
    double v22 = 0.0000001;
    v23 = v20;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v58 != v55) {
          objc_enumerationMutation(obj);
        }
        if ([*(id *)(*((void *)&v57 + 1) + 8 * i) pointCount]) {
          operator new();
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v21);
    unint64_t v25 = (char *)__p;

    if (v25 != v16)
    {
      std::__introsort<std::_ClassicAlgPolicy,PointInfoSorterByX &,PointInfo **,false>((unint64_t)v20, v20, 0, 1);
      if (v20 >= v56)
      {
        unint64_t v28 = 1;
        if ((unint64_t)(((char *)v56 - (char *)v20) >> 2) > 1) {
          unint64_t v28 = ((char *)v56 - (char *)v20) >> 2;
        }
        if ((unint64_t)((char *)v56 - (char *)v20) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
        }
        if (v28)
        {
          if (v28 >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v29 = (double **)operator new(8 * v28);
        }
        else
        {
          v29 = 0;
        }
        v23 = v29;
        *v29 = (double *)&v66;
        v27 = v29 + 1;
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *unint64_t v20 = (double *)&v66;
        v26 = v20 + 1;
        if (v26 == v23) {
          goto LABEL_53;
        }
        v27 = v26;
      }
      unint64_t v30 = v27 - v23;
      BOOL v31 = v23;
      unint64_t v32 = v30;
      do
      {
        unint64_t v33 = v32 >> 1;
        BOOL v34 = &v31[v32 >> 1];
        BOOL v36 = *v34;
        BOOL v35 = v34 + 1;
        v32 += ~(v32 >> 1);
        if (*v36 < *(double *)&v64 - 0.0000001) {
          BOOL v31 = v35;
        }
        else {
          unint64_t v32 = v33;
        }
      }
      while (v32);
      char v37 = v23;
      do
      {
        unint64_t v38 = v30 >> 1;
        BOOL v39 = &v37[v30 >> 1];
        v41 = *v39;
        v40 = v39 + 1;
        v30 += ~(v30 >> 1);
        if (*v41 > *(double *)&v64 + 0.0000001) {
          unint64_t v30 = v38;
        }
        else {
          char v37 = v40;
        }
      }
      while (v30);
      if (v31 != v37)
      {
        v42 = 0;
        do
        {
          v44 = *v31++;
          v43 = v44;
          double v45 = fmax(vabdd_f64(*(double *)&v64, *v44), vabdd_f64(*((double *)&v64 + 1), v44[1]));
          BOOL v46 = v45 < v22;
          double v22 = fmin(v45, v22);
          if (v46) {
            v42 = v43;
          }
        }
        while (v31 != v37);
        BOOL v17 = v42 != 0;
        unint64_t v20 = v23;
        if (!v23) {
          goto LABEL_55;
        }
        goto LABEL_54;
      }
    }
LABEL_53:
    BOOL v17 = 0;
    unint64_t v20 = v23;
    if (!v23) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }

  BOOL v17 = 0;
  if (v20) {
LABEL_54:
  }
    operator delete(v20);
LABEL_55:
  v47 = __p;
  if (__p)
  {
    v48 = v62;
    while (v48 != v47)
    {
      uint64_t v50 = *--v48;
      uint64_t v49 = v50;
      void *v48 = 0;
      if (v50) {
        MEMORY[0x1A6239270](v49, 0x1020C4005C7B374);
      }
    }
    uint64_t v62 = v47;
    operator delete(v47);
  }
LABEL_61:

  return v17;
}

- (uint64_t)_getEndPoints:()RenderRegion rect:result:
{
  id v7 = a3;
  uint64_t v8 = [v7 count];
  if (v8)
  {
    double v9 = [v7 objectAtIndex:0];
    if (![v9 pointCount]) {
      goto LABEL_5;
    }
    double v10 = (float *)[v9 points];
    float v11 = v10[1];
    *a5 = *a4 + (a4[2] - *a4) * *v10;
    a5[1] = a4[1] + (a4[3] - a4[1]) * v11;

    double v9 = [v7 objectAtIndex:v8 - 1];
    unsigned int v12 = [v9 pointCount];
    if (v12)
    {
      uint64_t v13 = [v9 points] + 12 * v12;
      float v14 = *(float *)(v13 - 8);
      a5[2] = *a4 + (a4[2] - *a4) * *(float *)(v13 - 12);
      a5[3] = a4[1] + (a4[3] - a4[1]) * v14;
      uint64_t v15 = 1;
    }
    else
    {
LABEL_5:
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

@end