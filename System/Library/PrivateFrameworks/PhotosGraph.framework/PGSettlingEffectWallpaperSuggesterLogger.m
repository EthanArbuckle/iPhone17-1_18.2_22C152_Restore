@interface PGSettlingEffectWallpaperSuggesterLogger
- (PGSettlingEffectWallpaperSuggesterLogger)initWithLoggingConnection:(id)a3;
- (void)logFilteringStatistics:(id *)a3 assetGaterStatistics:(id *)a4;
- (void)logHighlightStatistics:(id *)a3;
- (void)logPosterFilteringStatistics:(id)a3;
- (void)logSettlingEffectScoreRequest:(int)a3;
- (void)logStats:(int)a3 reason:(id)a4;
@end

@implementation PGSettlingEffectWallpaperSuggesterLogger

- (void).cxx_destruct
{
}

- (void)logHighlightStatistics:(id *)a3
{
  [(PGSettlingEffectWallpaperSuggesterLogger *)self logSettlingEffectScoreRequest:a3->var2];
  uint64_t var1 = a3->var1;
  [(PGSettlingEffectWallpaperSuggesterLogger *)self logStats:var1 reason:@"low settlingEffectScore"];
}

- (void)logPosterFilteringStatistics:(id)a3
{
  [(PGSettlingEffectWallpaperSuggesterLogger *)self logSettlingEffectScoreRequest:a3.var1];
  [(PGSettlingEffectWallpaperSuggesterLogger *)self logStats:a3 reason:@"low settlingEffectScore"];
}

- (void)logSettlingEffectScoreRequest:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] \t (%d on-demand settling effect score requested)", (uint8_t *)v5, 8u);
  }
}

- (void)logStats:(int)a3 reason:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109378;
    v8[1] = a3;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Filtered by %@)", (uint8_t *)v8, 0x12u);
  }
}

- (void)logFilteringStatistics:(id *)a3 assetGaterStatistics:(id *)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Logging Live Photo filtering statistics...", buf, 2u);
    loggingConnection = self->_loggingConnection;
  }
  int var0 = a3->var0;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v106) = var0;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] %d (Live Photos in library)", buf, 8u);
  }
  if (var0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__PGSettlingEffectWallpaperSuggesterLogger_logFilteringStatistics_assetGaterStatistics___block_invoke;
    aBlock[3] = &__block_descriptor_36_e8_d12__0i8l;
    int v104 = var0;
    __int16 v9 = _Block_copy(aBlock);
    uint64_t var1 = a3->var1;
    uint64_t v11 = self->_loggingConnection;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (double (*)(void *, uint64_t))v9[2];
      v13 = v11;
      double v14 = v12(v9, var1);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = var1;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v14;
      _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] %d (wallpaper suggestions) %.2f%%", buf, 0x12u);

      uint64_t v11 = self->_loggingConnection;
    }
    uint64_t var2 = a3->var2;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = (var1 - var2);
      v17 = (double (*)(void *, uint64_t))v9[2];
      v18 = v11;
      double v19 = v17(v9, v16);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = v16;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v19;
      _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] \t %d (existing wallpaper with settling effect) %.2f%%", buf, 0x12u);

      uint64_t v11 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v20 = (double (*)(void *, uint64_t))v9[2];
      v21 = v11;
      double v22 = v20(v9, var2);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = var2;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v22;
      _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] \t %d (existing wallpaper without settling effect) %.2f%%", buf, 0x12u);

      uint64_t v11 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t var3 = a3->var3;
      v24 = (double (*)(void *, uint64_t))v9[2];
      v25 = v11;
      double v26 = v24(v9, var3);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = var3;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v26;
      _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] Starting with %d (existing live photo wallpaper) %.2f%%", buf, 0x12u);
    }
    [(PGSettlingEffectWallpaperSuggesterLogger *)self logPosterFilteringStatistics:*(void *)&a3->var4];
    uint64_t v27 = a3->var6.var0;
    long long v101 = *(_OWORD *)&a3->var6.var1;
    long long v102 = *(_OWORD *)&a3->var6.var3.var2;
    v28 = self->_loggingConnection;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (double (*)(void *, uint64_t))v9[2];
      v30 = v28;
      double v31 = v29(v9, v27);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = v27;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v31;
      _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] + %d (highlight candidates for FRC) %.2f%%", buf, 0x12u);
    }
    *(_DWORD *)buf = v27;
    long long v106 = v101;
    long long v107 = v102;
    -[PGSettlingEffectWallpaperSuggesterLogger logHighlightStatistics:](self, "logHighlightStatistics:", buf, v101, v102);
    v32 = self->_loggingConnection;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] FRC Gating: \n", buf, 2u);
      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = a4->var3;
      v34 = (double (*)(void *, uint64_t))v9[2];
      v35 = v32;
      double v36 = v34(v9, v33);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = v33;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v36;
      _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos with invalid analysis versions) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t var4 = a4->var4;
      v38 = (double (*)(void *, uint64_t))v9[2];
      v39 = v32;
      double v40 = v38(v9, var4);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = var4;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v40;
      _os_log_impl(&dword_1D1805000, v39, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos fail getting analysis result) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v41 = a3->var5.var0;
      v42 = (double (*)(void *, uint64_t))v9[2];
      v43 = v32;
      double v44 = v42(v9, v41);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = v41;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v44;
      _os_log_impl(&dword_1D1805000, v43, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed feature enablement) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v45 = a3->var5.var1;
      v46 = (double (*)(void *, uint64_t))v9[2];
      v47 = v32;
      double v48 = v46(v9, v45);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = v45;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v48;
      _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed hardware support) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v49 = a3->var5.var2;
      v50 = (double (*)(void *, uint64_t))v9[2];
      v51 = v32;
      double v52 = v50(v9, v49);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = v49;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v52;
      _os_log_impl(&dword_1D1805000, v51, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed to download resources) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v53 = a3->var5.var3;
      v54 = (double (*)(void *, uint64_t))v9[2];
      v55 = v32;
      double v56 = v54(v9, v53);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = v53;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v56;
      _os_log_impl(&dword_1D1805000, v55, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed adjustments supported) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v57 = a3->var5.var4;
      v58 = (double (*)(void *, uint64_t))v9[2];
      v59 = v32;
      double v60 = v58(v9, v57);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = v57;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v60;
      _os_log_impl(&dword_1D1805000, v59, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed with generic error) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t var5 = a3->var5.var5;
      v62 = (double (*)(void *, uint64_t))v9[2];
      v63 = v32;
      double v64 = v62(v9, var5);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = var5;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v64;
      _os_log_impl(&dword_1D1805000, v63, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed metadata check) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t var6 = a3->var5.var6;
      v66 = (double (*)(void *, uint64_t))v9[2];
      v67 = v32;
      double v68 = v66(v9, var6);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = var6;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v68;
      _os_log_impl(&dword_1D1805000, v67, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed stabilization) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t var7 = a3->var5.var7;
      v70 = (double (*)(void *, uint64_t))v9[2];
      v71 = v32;
      double v72 = v70(v9, var7);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = var7;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v72;
      _os_log_impl(&dword_1D1805000, v71, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed video quality) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t var8 = a3->var5.var8;
      v74 = (double (*)(void *, uint64_t))v9[2];
      v75 = v32;
      double v76 = v74(v9, var8);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = var8;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v76;
      _os_log_impl(&dword_1D1805000, v75, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed metadata integrity) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t var9 = a3->var5.var9;
      v78 = (double (*)(void *, uint64_t))v9[2];
      v79 = v32;
      double v80 = v78(v9, var9);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = var9;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v80;
      _os_log_impl(&dword_1D1805000, v79, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed FRC) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t var10 = a3->var5.var10;
      v82 = (double (*)(void *, uint64_t))v9[2];
      v83 = v32;
      double v84 = v82(v9, var10);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = var10;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v84;
      _os_log_impl(&dword_1D1805000, v83, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed video decision) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t var11 = a3->var5.var11;
      v86 = (double (*)(void *, uint64_t))v9[2];
      v87 = v32;
      double v88 = v86(v9, var11);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = var11;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v88;
      _os_log_impl(&dword_1D1805000, v87, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed layout decision) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t var12 = a3->var5.var12;
      v90 = (double (*)(void *, uint64_t))v9[2];
      v91 = v32;
      double v92 = v90(v9, var12);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = var12;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v92;
      _os_log_impl(&dword_1D1805000, v91, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] - %d (Live Photos failed still transition) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v93 = a3->var7;
      v94 = (double (*)(void *, uint64_t))v9[2];
      v95 = v32;
      double v96 = v94(v9, v93);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = v93;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v96;
      _os_log_impl(&dword_1D1805000, v95, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] = %d (FRC eligible candidates for suggestions) %.2f%%", buf, 0x12u);

      v32 = self->_loggingConnection;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v97 = a3->var8;
      v98 = (double (*)(void *, uint64_t))v9[2];
      v99 = v32;
      double v100 = v98(v9, v97);
      *(_DWORD *)buf = 67109376;
      LODWORD(v106) = v97;
      WORD2(v106) = 2048;
      *(double *)((char *)&v106 + 6) = v100;
      _os_log_impl(&dword_1D1805000, v99, OS_LOG_TYPE_INFO, "[PGSettlingEffectWallpaperSuggester] = %d (FRC eligible highlight assets) %.2f%%", buf, 0x12u);
    }
  }
}

double __88__PGSettlingEffectWallpaperSuggesterLogger_logFilteringStatistics_assetGaterStatistics___block_invoke(uint64_t a1, int a2)
{
  return (double)a2 / (double)*(int *)(a1 + 32) * 100.0;
}

- (PGSettlingEffectWallpaperSuggesterLogger)initWithLoggingConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSettlingEffectWallpaperSuggesterLogger;
  id v6 = [(PGSettlingEffectWallpaperSuggesterLogger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_loggingConnection, a3);
  }

  return v7;
}

@end