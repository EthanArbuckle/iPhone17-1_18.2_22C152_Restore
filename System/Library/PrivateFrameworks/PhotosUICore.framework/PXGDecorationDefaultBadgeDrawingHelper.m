@interface PXGDecorationDefaultBadgeDrawingHelper
- (NSByteCountFormatter)byteCountFormatter;
- (NSDateComponentsFormatter)videoDurationFormatter;
- (NSNumberFormatter)assetIndexFormatter;
- (PXGDecorationBadgeInfo)decorationSpriteInfoForDecoratedSpriteIndex:(SEL)a3 decorationType:(unsigned int)a4 decoratingLayout:(int64_t)a5 assetDecorationInfo:(id)a6 overallSelectionOrder:(PXGAssetDecorationInfo *)a7 isItemSelected:(int64_t)a8 isItemHighlighted:(BOOL)a9 isItemDragged:(BOOL)a10;
- (PXGDecorationDefaultBadgeDrawingHelper)init;
- (PXSelectionCountNumberFormatter)selectionCountFormatter;
- (id)cacheKeyForDecorationInfo:(PXGDecorationBadgeInfo *)a3 solidColorOverlay:(id)a4 debugDecoration:(id)a5 targetSize:(CGSize)a6 cornerRadius:(id)a7 screenScale:(double)a8 viewEnvironment:(id)a9 userInterfaceDirection:(unint64_t)a10;
- (void)drawWithDecorationInfo:(PXGDecorationBadgeInfo *)a3 solidColorOverlay:(id)a4 debugDecoration:(id)a5 cornerRadius:(id)a6 context:(CGContext *)a7 viewport:(CGRect)a8 screenScale:(double)a9 viewEnvironment:(id)a10 userInterfaceDirection:(unint64_t)a11;
@end

@implementation PXGDecorationDefaultBadgeDrawingHelper

- (PXGDecorationBadgeInfo)decorationSpriteInfoForDecoratedSpriteIndex:(SEL)a3 decorationType:(unsigned int)a4 decoratingLayout:(int64_t)a5 assetDecorationInfo:(id)a6 overallSelectionOrder:(PXGAssetDecorationInfo *)a7 isItemSelected:(int64_t)a8 isItemHighlighted:(BOOL)a9 isItemDragged:(BOOL)a10
{
  BOOL v11 = a9;
  id v16 = a6;
  *retstr = *(PXGDecorationBadgeInfo *)PXGDecorationBadgeInfoNull;
  switch(a5)
  {
    case 0:
      unint64_t var0 = a7->var0;
      if (a7->var0)
      {
        if ((var0 & 0x20) != 0) {
          int64_t v18 = 2;
        }
        else {
          int64_t v18 = 1;
        }
        goto LABEL_75;
      }
      if ((var0 & 0x80000000) != 0)
      {
        int64_t v18 = 3;
        goto LABEL_75;
      }
      goto LABEL_76;
    case 1:
      id v34 = v16;
      uint64_t v19 = [v16 selectionDecorationStyle];
      uint64_t v20 = v19;
      if (v11 && _SelectionStyleUsesBadge(v19))
      {
        retstr->unint64_t var0 = 9;
        retstr->var3 = a8;
        goto LABEL_20;
      }
      unint64_t v29 = a7->var0;
      id v16 = v34;
      if ((a7->var0 & 0x200000000) != 0)
      {
        int64_t v18 = 12;
        goto LABEL_75;
      }
      if (v20 == 4)
      {
        int64_t v18 = 10;
        goto LABEL_75;
      }
      if ((v29 & 0x1000000000) != 0)
      {
        int64_t v18 = 13;
        goto LABEL_75;
      }
      if ((v29 & 0x20) != 0)
      {
        int64_t v18 = 8;
        goto LABEL_75;
      }
      if ((v29 & 2) != 0)
      {
        if ((v29 & 0x10000000000) == 0)
        {
          int64_t v18 = 6;
          goto LABEL_75;
        }
        int64_t v31 = 26;
      }
      else
      {
        double var1 = a7->var1;
        if (var1 != 0.0)
        {
          if ((v29 & 0x10000000000) == 0)
          {
            retstr->unint64_t var0 = 11;
            retstr->var2 = var1;
            goto LABEL_76;
          }
          retstr->unint64_t var0 = 25;
          retstr->var2 = var1;
LABEL_80:
          retstr->var4 = a7->var3;
          goto LABEL_76;
        }
        if ((v29 & 0x10000000000) == 0) {
          goto LABEL_76;
        }
        int64_t v31 = 24;
      }
      retstr->unint64_t var0 = v31;
      goto LABEL_80;
    case 2:
      id v34 = v16;
      uint64_t v21 = [v16 selectionDecorationStyle];
      char v22 = [v34 selectionDecorationOptions];
      if (a10)
      {
        int64_t v23 = 14;
        goto LABEL_19;
      }
      if (v11 && v21 == 1)
      {
        int64_t v23 = 15;
        goto LABEL_19;
      }
      if (v11 && v21 == 2)
      {
        int64_t v23 = 16;
        goto LABEL_19;
      }
      if (v11 && v21 == 3)
      {
        int64_t v23 = 17;
        goto LABEL_19;
      }
      if (!v11 && (v22 & 1) != 0)
      {
        int64_t v23 = 18;
        goto LABEL_19;
      }
      if (v21 == 5)
      {
        int64_t v23 = 19;
        goto LABEL_19;
      }
      id v16 = v34;
      if (a11)
      {
        int64_t v18 = 17;
        goto LABEL_75;
      }
      v32 = [v34 solidColorOverlayDecorationSource];

      id v16 = v34;
      if (v32)
      {
        int64_t v18 = 20;
        goto LABEL_75;
      }
      goto LABEL_76;
    case 3:
      id v34 = v16;
      uint64_t v24 = [v16 selectionDecorationStyle];
      char v25 = [v34 selectionDecorationOptions];
      if (!v11) {
        goto LABEL_18;
      }
      char v26 = v25;
      if (!_SelectionStyleUsesBadge(v24) || (v26 & 2) == 0) {
        goto LABEL_18;
      }
      int64_t v23 = 0;
      goto LABEL_19;
    case 4:
      if ((a7->var0 & 0x2000000000) == 0) {
        goto LABEL_76;
      }
      int64_t v18 = 4;
      goto LABEL_75;
    case 5:
    case 6:
      goto LABEL_2;
    case 7:
      id v34 = v16;
      v27 = [v16 tapbackDecorationSource];

      if (v27)
      {
LABEL_18:
        int64_t v23 = 27;
LABEL_19:
        retstr->unint64_t var0 = v23;
        goto LABEL_20;
      }
      if ((a7->var0 & 0x20000000) != 0)
      {
        int64_t v23 = 28;
        goto LABEL_19;
      }
      retstr->unint64_t var0 = 0;
LABEL_20:
      id v16 = v34;
LABEL_76:

      return result;
    case 8:
      unint64_t v28 = a7->var0;
      if ((a7->var0 & 0x400000000000) != 0)
      {
        int64_t v18 = 29;
      }
      else if ((v28 & 0x800000000000) != 0)
      {
        int64_t v18 = 30;
      }
      else if ((v28 & 0x1000000000000) != 0)
      {
        int64_t v18 = 31;
      }
      else
      {
        if ((v28 & 0x200000000000) != 0)
        {
          retstr->unint64_t var0 = 23;
          retstr->var5 = a7->var2;
          goto LABEL_76;
        }
        if ((v28 & 0x40) != 0)
        {
          int64_t v18 = 21;
        }
        else
        {
          if ((v28 & 0x20000000000) == 0)
          {
LABEL_2:
            retstr->unint64_t var0 = 0;
            goto LABEL_76;
          }
          int64_t v18 = 22;
        }
      }
LABEL_75:
      retstr->unint64_t var0 = v18;
      goto LABEL_76;
    default:
      goto LABEL_76;
  }
}

- (PXGDecorationDefaultBadgeDrawingHelper)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXGDecorationDefaultBadgeDrawingHelper;
  v2 = [(PXGDecorationDefaultBadgeDrawingHelper *)&v10 init];
  if (v2)
  {
    v3 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28C00]);
    videoDurationFormatter = v2->_videoDurationFormatter;
    v2->_videoDurationFormatter = v3;

    [(NSDateComponentsFormatter *)v2->_videoDurationFormatter setZeroFormattingBehavior:0];
    [(NSDateComponentsFormatter *)v2->_videoDurationFormatter setUnitsStyle:0];
    v5 = (NSByteCountFormatter *)objc_alloc_init(MEMORY[0x1E4F28B68]);
    byteCountFormatter = v2->_byteCountFormatter;
    v2->_byteCountFormatter = v5;

    [(NSByteCountFormatter *)v2->_byteCountFormatter setCountStyle:0];
    v7 = (PXSelectionCountNumberFormatter *)objc_alloc_init((Class)off_1E5DA84E0);
    selectionCountFormatter = v2->_selectionCountFormatter;
    v2->_selectionCountFormatter = v7;

    [(PXSelectionCountNumberFormatter *)v2->_selectionCountFormatter setSelectionNumberLimit:9999];
  }
  return v2;
}

- (id)cacheKeyForDecorationInfo:(PXGDecorationBadgeInfo *)a3 solidColorOverlay:(id)a4 debugDecoration:(id)a5 targetSize:(CGSize)a6 cornerRadius:(id)a7 screenScale:(double)a8 viewEnvironment:(id)a9 userInterfaceDirection:(unint64_t)a10
{
  v12 = *(void **)&a7.var0.var0.var0;
  double v13 = v11;
  int v14 = v10;
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  v48[2] = *MEMORY[0x1E4F143B8];
  id v19 = a4;
  id v20 = a5;
  id v21 = v12;
  char v22 = (void *)[objc_alloc(MEMORY[0x1E4F29238]) initWithBytes:a3 objCType:"{PXGDecorationBadgeInfo=qqdqqq}"];
  v48[0] = v22;
  int64_t v23 = [NSNumber numberWithDouble:v13];
  v48[1] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];

  switch(a3->var0)
  {
    case 9:
      v45[0] = v21;
      uint64_t v25 = [NSNumber numberWithInteger:a3->var3];
      v45[1] = v25;
      char v26 = (void *)MEMORY[0x1E4F1C978];
      v27 = v45;
      goto LABEL_4;
    case 0xBLL:
      uint64_t v25 = [NSNumber numberWithInteger:llround(a3->var2)];
      v46[0] = v25;
      *(CGFloat *)v42 = width;
      *(CGFloat *)&v42[1] = height;
      unint64_t v28 = [MEMORY[0x1E4F29238] valueWithBytes:v42 objCType:"{CGSize=dd}"];
      v46[1] = v28;
      LODWORD(v30) = v14;
      int64_t v31 = [NSNumber numberWithFloat:v30];
      v46[2] = v31;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
      uint64_t v29 = [v24 arrayByAddingObjectsFromArray:v32];

      goto LABEL_6;
    case 0xFLL:
    case 0x10:
      v47[0] = v21;
      *(CGFloat *)v43 = width;
      *(CGFloat *)&v43[1] = height;
      uint64_t v25 = [MEMORY[0x1E4F29238] valueWithBytes:v43 objCType:"{CGSize=dd}"];
      v47[1] = v25;
      char v26 = (void *)MEMORY[0x1E4F1C978];
      v27 = v47;
LABEL_4:
      unint64_t v28 = [v26 arrayWithObjects:v27 count:2];
      uint64_t v29 = [v24 arrayByAddingObjectsFromArray:v28];

LABEL_6:
      uint64_t v24 = (void *)v25;
      goto LABEL_7;
    case 0x14:
      if (!v19) {
        goto LABEL_8;
      }
      uint64_t v29 = [v24 arrayByAddingObject:v19];
LABEL_7:

      uint64_t v24 = (void *)v29;
LABEL_8:
      if (v20)
      {
        v44[0] = v20;
        uint64_t v35 = [NSNumber numberWithDouble:v13];
        v44[1] = v35;
        v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
        v37 = [v24 arrayByAddingObject:v36];

        *(CGFloat *)v41 = width;
        *(CGFloat *)&v41[1] = height;
        v38 = [MEMORY[0x1E4F29238] valueWithBytes:v41 objCType:"{CGSize=dd}"];
        LOBYTE(v35) = [v37 containsObject:v38];

        if (v35)
        {
          uint64_t v24 = v37;
        }
        else
        {
          *(CGFloat *)v40 = width;
          *(CGFloat *)&v40[1] = height;
          v39 = [MEMORY[0x1E4F29238] valueWithBytes:v40 objCType:"{CGSize=dd}"];
          uint64_t v24 = [v37 arrayByAddingObject:v39];
        }
      }
      v33 = (void *)[objc_alloc((Class)off_1E5DA9660) initWithObjects:v24];

      return v33;
    default:
      goto LABEL_8;
  }
}

- (void)drawWithDecorationInfo:(PXGDecorationBadgeInfo *)a3 solidColorOverlay:(id)a4 debugDecoration:(id)a5 cornerRadius:(id)a6 context:(CGContext *)a7 viewport:(CGRect)a8 screenScale:(double)a9 viewEnvironment:(id)a10 userInterfaceDirection:(unint64_t)a11
{
  int v14 = *(void **)&a6.var0.var1[2];
  v15 = *(CGContext **)&a6.var0.var0.var0;
  CGFloat v152 = v13;
  CGFloat v18 = v12;
  CGFloat v148 = v11;
  float v20 = *(float *)&a8.size.width;
  v159[1] = *MEMORY[0x1E4F143B8];
  id v23 = a4;
  id v154 = a5;
  id v24 = v14;
  int64_t var1 = a3->var1;
  if (_PXGDecorationDefaultPadding_onceToken == -1)
  {
    if (var1) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&_PXGDecorationDefaultPadding_onceToken, &__block_literal_global_55131);
    if (var1)
    {
LABEL_3:
      if (var1 != 1)
      {
        v132 = [MEMORY[0x1E4F28B00] currentHandler];
        v133 = [NSString stringWithUTF8String:"CGSize _PXGDecorationDefaultPadding(PXGDecorationSizeClass)"];
        [v132 handleFailureInFunction:v133 file:@"PXGDecorationDefaultBadgeDrawingHelper.m" lineNumber:83 description:@"Code which should be unreachable has been reached"];

        goto LABEL_151;
      }
    }
  }
  double v150 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v151 = *MEMORY[0x1E4F1DB30];
  uint64_t v26 = [(PXGDecorationDefaultBadgeDrawingHelper *)self videoDurationFormatter];
  v27 = [(PXGDecorationDefaultBadgeDrawingHelper *)self byteCountFormatter];
  v146 = [(PXGDecorationDefaultBadgeDrawingHelper *)self selectionCountFormatter];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __180__PXGDecorationDefaultBadgeDrawingHelper_drawWithDecorationInfo_solidColorOverlay_debugDecoration_cornerRadius_context_viewport_screenScale_viewEnvironment_userInterfaceDirection___block_invoke;
  aBlock[3] = &__block_descriptor_40_e58_v64__0_CGRect__CGPoint_dd__CGSize_dd__8d40d48__CGColor__56l;
  aBlock[4] = v15;
  v144 = v24;
  v145 = _Block_copy(aBlock);
  double v30 = 0;
  int64_t var0 = a3->var0;
  CGFloat rect = v18;
  double v149 = a9;
  v142 = v27;
  v143 = (void *)v26;
  switch(a3->var0)
  {
    case 1:
      double v30 = @"PXBadgeGradientLeft";
      v42 = @"PXBadgeGradientLeft";
      goto LABEL_25;
    case 2:
LABEL_25:
      int64_t v43 = a3->var1;
      if (v43 == 1)
      {
        id v99 = +[PXBadgeHelper favoriteBadgeImageMini];
        image = CGImageRetain((CGImageRef)[v99 CGImage]);

        uint64_t v39 = 0;
        v40 = 0;
        v41 = 0;
        char v100 = 6;
        goto LABEL_95;
      }
      CGFloat v44 = v152;
      if (v43) {
        goto LABEL_73;
      }
      id v45 = +[PXBadgeHelper favoriteBadgeImage];
      image = CGImageRetain((CGImageRef)[v45 CGImage]);

      uint64_t v39 = 0;
      v40 = 0;
      goto LABEL_74;
    case 3:
      double v30 = @"PXBadgeGradientLeft";
      v46 = @"PXBadgeGradientLeft";
      int64_t v47 = a3->var1;
      if (v47 == 1)
      {
        id v104 = +[PXBadgeHelper contentSyndicationBadgeImageMini];
        image = CGImageRetain((CGImageRef)[v104 CGImage]);

        uint64_t v39 = 0;
        v40 = 0;
        v41 = 0;
        char v155 = 6;
        double v139 = v150;
        double v140 = v151;
        double v30 = @"PXBadgeGradientLeft";
        goto LABEL_96;
      }
      CGFloat v44 = v152;
      if (!v47)
      {
        id v48 = +[PXBadgeHelper contentSyndicationBadgeImage];
        image = CGImageRetain((CGImageRef)[v48 CGImage]);

        uint64_t v39 = 0;
        v40 = 0;
        v41 = 0;
        char v155 = 6;
        double v139 = v150;
        double v140 = v151;
        double v30 = @"PXBadgeGradientLeft";
        goto LABEL_101;
      }
LABEL_73:
      uint64_t v39 = 0;
      v40 = 0;
      image = 0;
LABEL_74:
      v41 = 0;
      char v96 = 6;
      goto LABEL_100;
    case 4:
      double v30 = @"PXBadgeGradientTopRight";
      v49 = @"PXBadgeGradientTopRight";
      int64_t v50 = a3->var1;
      if (v50 == 1)
      {
        id v105 = +[PXBadgeHelper sharedLibraryBadgeImageMini];
        image = CGImageRetain((CGImageRef)[v105 CGImage]);

        uint64_t v39 = 0;
        v40 = 0;
        v41 = 0;
        char v155 = 9;
        double v139 = v150;
        double v140 = v151;
        double v30 = @"PXBadgeGradientTopRight";
        goto LABEL_96;
      }
      CGFloat v44 = v152;
      if (!v50)
      {
        id v51 = +[PXBadgeHelper sharedLibraryBadgeImage];
        image = CGImageRetain((CGImageRef)[v51 CGImage]);

        uint64_t v39 = 0;
        v40 = 0;
        v41 = 0;
        char v155 = 9;
        double v139 = v150;
        double v140 = v151;
        double v30 = @"PXBadgeGradientTopRight";
        goto LABEL_101;
      }
      uint64_t v39 = 0;
      v40 = 0;
      image = 0;
      v41 = 0;
      char v96 = 9;
      goto LABEL_100;
    case 5:
      int64_t var5 = a3->var5;
      if (var5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%ld", var5);
        objc_claimAutoreleasedReturnValue();
      }
      PXAttributedStringForBadgeText();
    case 6:
      double v30 = @"PXBadgeGradientRight";
      v53 = @"PXBadgeGradientRight";
      goto LABEL_37;
    case 7:
LABEL_37:
      int64_t v54 = a3->var1;
      if (v54 == 1)
      {
        id v101 = +[PXBadgeHelper panoramaBadgeImageMini];
        image = CGImageRetain((CGImageRef)[v101 CGImage]);

        uint64_t v39 = 0;
        v40 = 0;
        goto LABEL_94;
      }
      CGFloat v44 = v152;
      if (v54)
      {
        uint64_t v39 = 0;
        v40 = 0;
        image = 0;
      }
      else
      {
        id v55 = +[PXBadgeHelper panoramaBadgeImage];
        image = CGImageRetain((CGImageRef)[v55 CGImage]);

        uint64_t v39 = 0;
        v40 = 0;
      }
      goto LABEL_99;
    case 8:
      int64_t v56 = a3->var1;
      if (v56 == 1)
      {
        id v106 = +[PXBadgeHelper cloudBadgeImageMini];
        image = CGImageRetain((CGImageRef)[v106 CGImage]);

        uint64_t v39 = 0;
        v40 = 0;
        double v30 = 0;
LABEL_94:
        v41 = 0;
        char v100 = 12;
LABEL_95:
        char v155 = v100;
        double v139 = v150;
        double v140 = v151;
LABEL_96:
        CGFloat v44 = v152;
      }
      else
      {
        CGFloat v44 = v152;
        if (v56)
        {
          uint64_t v39 = 0;
          v40 = 0;
          image = 0;
        }
        else
        {
          id v57 = +[PXBadgeHelper cloudBadgeImage];
          image = CGImageRetain((CGImageRef)[v57 CGImage]);

          uint64_t v39 = 0;
          v40 = 0;
        }
        double v30 = 0;
LABEL_99:
        v41 = 0;
        char v96 = 12;
LABEL_100:
        char v155 = v96;
        double v139 = v150;
        double v140 = v151;
      }
LABEL_101:
      CGFloat v64 = v148;
LABEL_102:
      v93 = a7;
      goto LABEL_119;
    case 9:
    case 0xALL:
      if (var0 == 9)
      {
        int64_t var3 = a3->var3;
        if (var3 != 0x7FFFFFFFFFFFFFFFLL && (var3 & 0x8000000000000000) == 0)
        {
          uint64_t v35 = [NSNumber numberWithInteger:var3 + 1];
          v36 = [v146 stringFromNumber:v35];

          id v37 = v36;
          if (_PXSelectCountAttributedString_onceToken != -1) {
            dispatch_once(&_PXSelectCountAttributedString_onceToken, &__block_literal_global_94);
          }
          if (a7)
          {
            if (a7 != (CGContext *)1) {
              goto LABEL_89;
            }
            uint64_t v38 = 0;
          }
          else
          {
            uint64_t v38 = 2;
          }
          [(id)_PXSelectCountAttributedString_paragraphStyle setAlignment:v38];
LABEL_89:
          id v102 = objc_alloc(MEMORY[0x1E4F28B18]);
          v103 = (void *)[v102 initWithString:v37 attributes:_PXSelectCountAttributedString_attributes];

          [v103 size];
          PXSizeScale();
        }
      }
      int64_t v94 = a3->var1;
      CGFloat v44 = v152;
      if (v94 == 1)
      {
        uint64_t v95 = +[PXBadgeHelper mediumSymbolConfiguration];
        goto LABEL_107;
      }
      if (!v94)
      {
        uint64_t v95 = +[PXBadgeHelper largeSymbolConfiguration];
LABEL_107:
        v59 = (void *)v95;
        goto LABEL_109;
      }
      v59 = 0;
LABEL_109:
      CGFloat v64 = v148;
      v112 = @"circle";
      if (var0 == 9) {
        v112 = @"checkmark.circle";
      }
      v107 = v112;
      if (var0 == 9)
      {
        v113 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithCGColor:", objc_msgSend(v24, "checkmarkColor"));
      }
      else
      {
        v113 = 0;
      }
      v114 = [MEMORY[0x1E4FB1818] systemImageNamed:v107];
      v115 = [v114 imageWithSymbolConfiguration:v59];

      v116 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      objc_msgSend(v115, "px_tintedCircularImageWithColor:backgroundColor:", v116, v113);
      id v117 = objc_claimAutoreleasedReturnValue();
      image = CGImageRetain((CGImageRef)[v117 CGImage]);

LABEL_115:
      uint64_t v39 = 0;
      v40 = 0;
      double v30 = 0;
      v41 = 0;
      char v155 = 12;
      double v139 = v150;
      double v140 = v151;
LABEL_69:
      v93 = a7;
LABEL_119:
      if (v154)
      {
        v119 = [v154 objectForKeyedSubscript:PXGDebugDecorationBackgroundColorKey];

        uint64_t v120 = [v154 objectForKeyedSubscript:PXGDebugDecorationAttributedTextKey];

        v121 = [v154 objectForKeyedSubscript:PXGDebugDecorationBottomEdgeColorKey];
        if (v120)
        {
          uint64_t v39 = 2;
          v40 = (void *)v120;
        }
        else
        {
          v122 = [v154 objectForKeyedSubscript:PXGDebugDecorationTextKey];
          if (v122)
          {
            id v123 = objc_alloc(MEMORY[0x1E4F28B18]);
            uint64_t v158 = *MEMORY[0x1E4FB0700];
            [MEMORY[0x1E4FB1618] orangeColor];
            v125 = id v124 = v23;
            v159[0] = v125;
            v126 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v159 forKeys:&v158 count:1];
            v40 = (void *)[v123 initWithString:v122 attributes:v126];

            v93 = a7;
            id v23 = v124;
          }
          else
          {
            v40 = 0;
          }

          uint64_t v39 = 2;
        }
      }
      else
      {
        v121 = 0;
        v119 = v41;
      }
      if (v93 == (CGContext *)1) {
        PXEdgesFlippedHorizontally();
      }
      if (v119)
      {
        CGContextSetFillColorWithColor(v15, (CGColorRef)[v119 CGColor]);
        v166.origin.CGFloat x = a9;
        v166.origin.CGFloat y = v64;
        v166.size.CGFloat width = v18;
        v166.size.CGFloat height = v44;
        CGContextFillRect(v15, v166);
      }
      if (v121)
      {
        CGContextSetFillColorWithColor(v15, (CGColorRef)[v121 CGColor]);
        v167.origin.CGFloat x = a9;
        v167.origin.CGFloat y = v64;
        v167.size.CGFloat width = v18;
        v167.size.CGFloat height = v44;
        CGRect v168 = CGRectInset(v167, *(double *)&a10 * 3.0, *(double *)&a10 * 3.0);
        CGRectGetWidth(v168);
        PXRectWithSizeAlignedToRectEdges();
      }
      if (v30)
      {
        v127 = objc_msgSend(MEMORY[0x1E4F28B50], "px_bundle");
        v128 = PXGCGImageForImageNamedInBundle(v30, v127, 0, 0, 0, 0);

        if (!v128) {
          PXAssertGetLog();
        }
        CGImageGetWidth(v128);
        CGImageGetHeight(v128);
        PXEdgesFlippedVertically();
      }
      if (image)
      {
        CGImageGetWidth(image);
        CGImageGetHeight(image);
        PXSizeScale();
      }
      if (v40)
      {
        double v129 = *((double *)off_1E5DAAF10 + 3);
        if (v39 == 2) {
          double v130 = v139;
        }
        else {
          double v130 = *(double *)off_1E5DAAF10;
        }
        if ((v155 & 2) != 0) {
          double v131 = v140;
        }
        else {
          double v131 = *((double *)off_1E5DAAF10 + 1);
        }
        if ((v155 & 8) != 0) {
          double v129 = v140;
        }
        PXGDrawAttributedString(v40, 1, 0, v39, v15, v151, v150, v130, v131, *((double *)off_1E5DAAF10 + 2), v129, v28, v29, a9, v64, v18, v44, *(CGFloat *)&a10);
      }

      return;
    case 0xBLL:
    case 0x18:
    case 0x19:
    case 0x1ALL:
      v32 = @"PXBadgeGradientRight";
      int64_t v33 = a3->var0;
      if (a3->var0 <= 24)
      {
        if (v33 == 11) {
          PXLocalizedVideoDuration();
        }
        if (v33 == 24)
        {
          [v27 stringFromByteCount:a3->var4];
          objc_claimAutoreleasedReturnValue();
          goto LABEL_118;
        }
        goto LABEL_153;
      }
      if (v33 != 26)
      {
        if (v33 == 25) {
          PXLocalizedVideoDuration();
        }
LABEL_153:
        v134 = [MEMORY[0x1E4F28B00] currentHandler];
        v132 = v134;
        v135 = @"Code which should be unreachable has been reached";
        SEL v136 = a2;
        v137 = self;
        uint64_t v138 = 710;
LABEL_154:
        [v134 handleFailureInMethod:v136 object:v137 file:@"PXGDecorationDefaultBadgeDrawingHelper.m" lineNumber:v138 description:v135];
LABEL_151:

        abort();
      }
      [v27 stringFromByteCount:a3->var4];
      objc_claimAutoreleasedReturnValue();
      int64_t v97 = a3->var1;
      if (v97 == 1)
      {
        v98 = +[PXBadgeHelper panoramaBadgeImageMini];
      }
      else
      {
        if (v97) {
LABEL_118:
        }
          PXAttributedStringForBadgeText();
        v98 = +[PXBadgeHelper panoramaBadgeImage];
      }
      id v118 = v98;
      CGImageRetain((CGImageRef)[v118 CGImage]);

      goto LABEL_118;
    case 0xCLL:
      int64_t v58 = a3->var1;
      if (v58 == 1)
      {
        v59 = +[PXBadgeHelper mediumSymbolConfiguration];
        CGFloat v44 = v152;
      }
      else
      {
        CGFloat v44 = v152;
        if (v58)
        {
          v59 = 0;
        }
        else
        {
          v59 = +[PXBadgeHelper largeSymbolConfiguration];
        }
      }
      CGFloat v64 = v148;
      v107 = [MEMORY[0x1E4FB1618] colorWithRed:0.56 green:0.77 blue:1.0 alpha:1.0];
      v108 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle"];
      v109 = [v108 imageWithSymbolConfiguration:v59];

      v110 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      objc_msgSend(v109, "px_tintedCircularImageWithColor:backgroundColor:", v110, v107);
      id v111 = objc_claimAutoreleasedReturnValue();
      image = CGImageRetain((CGImageRef)[v111 CGImage]);

      goto LABEL_115;
    case 0xDLL:
      double v30 = @"PXBadgeGradientRight";
      v60 = @"PXBadgeGradientRight";
      id v61 = +[PXBadgeHelper ocrAssetBadgeImage];
      image = CGImageRetain((CGImageRef)[v61 CGImage]);

      uint64_t v39 = 0;
      v40 = 0;
      v41 = 0;
      char v62 = 12;
      goto LABEL_63;
    case 0xELL:
      objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:");
      id v63 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_66;
    case 0xFLL:
      v156[0] = MEMORY[0x1E4F143A8];
      v156[1] = 3221225472;
      v156[2] = __180__PXGDecorationDefaultBadgeDrawingHelper_drawWithDecorationInfo_solidColorOverlay_debugDecoration_cornerRadius_context_viewport_screenScale_viewEnvironment_userInterfaceDirection___block_invoke_23;
      v156[3] = &__block_descriptor_80_e24_v32__0d8__CGColor__16d24l;
      CGFloat v64 = v148;
      *(double *)&v156[4] = a9;
      *(CGFloat *)&v156[5] = v148;
      *(CGFloat *)&v156[6] = v18;
      *(CGFloat *)&v156[7] = v152;
      v156[8] = a10;
      v156[9] = v15;
      v65 = (void (**)(void *, uint64_t, double, double))_Block_copy(v156);
      if (v20 <= 0.0)
      {
        v65[2](v65, [v24 focusRingColor], 3.0, 0.0);
        id v77 = [v24 backgroundColor];
        v65[2](v65, [v77 CGColor], 1.0, 3.0);
      }
      else
      {
        double v66 = *(double *)&a10 * 3.0;
        double v67 = v20 * *(double *)&a10;
        v160.origin.CGFloat x = v149;
        v160.origin.CGFloat y = v148;
        v160.size.CGFloat width = rect;
        v160.size.CGFloat height = v152;
        CGRect v161 = CGRectInset(v160, *(double *)&a10 * 3.0 * 0.5, *(double *)&a10 * 3.0 * 0.5);
        CGFloat x = v161.origin.x;
        CGFloat y = v161.origin.y;
        CGFloat width = v161.size.width;
        CGFloat height = v161.size.height;
        (*((void (**)(void *, uint64_t, CGFloat, CGFloat, CGFloat, CGFloat, double, double))v145 + 2))(v145, [v24 focusRingColor], v161.origin.x, v161.origin.y, v161.size.width, v161.size.height, *(double *)&a10 * 3.0, v67);
        if (v67 - *(double *)&a10 * 3.0 >= 0.0) {
          double v72 = v67 - v66;
        }
        else {
          double v72 = 0.0;
        }
        CGFloat v18 = rect;
        v162.origin.CGFloat x = x;
        v162.origin.CGFloat y = y;
        v162.size.CGFloat width = width;
        v162.size.CGFloat height = height;
        CGRect v163 = CGRectInset(v162, (v66 + *(double *)&a10) * 0.5, (v66 + *(double *)&a10) * 0.5);
        CGFloat v73 = v163.origin.x;
        CGFloat v74 = v163.origin.y;
        double v75 = v163.size.width;
        double v76 = v163.size.height;
        id v77 = [v24 backgroundColor];
        uint64_t v78 = [v77 CGColor];
        double v79 = v73;
        double v80 = v74;
        CGFloat v64 = v148;
        a9 = v149;
        (*((void (**)(void *, uint64_t, double, double, double, double, double, double))v145 + 2))(v145, v78, v79, v80, v75, v76, *(double *)&a10, v72);
      }

      uint64_t v39 = 0;
      v40 = 0;
      image = 0;
      double v30 = 0;
      char v155 = 0;
      v41 = 0;
      double v139 = v150;
      double v140 = v151;
      CGFloat v44 = v152;
      goto LABEL_102;
    case 0x10:
      CGFloat v81 = *(double *)&a10 * 3.0 * 0.5;
      CGFloat v64 = v148;
      v164.origin.CGFloat x = a9;
      v164.origin.CGFloat y = v148;
      v164.size.CGFloat width = v18;
      CGFloat v44 = v152;
      v164.size.CGFloat height = v152;
      CGRect v165 = CGRectInset(v164, v81, v81);
      (*((void (**)(void *, uint64_t, CGFloat, CGFloat, CGFloat, CGFloat, double, CGFloat))v145 + 2))(v145, [v24 focusRingColor], v165.origin.x, v165.origin.y, v165.size.width, v165.size.height, *(double *)&a10 * 3.0, v81 + (v20 + 1.0) * *(double *)&a10);
      uint64_t v39 = 0;
      v40 = 0;
      image = 0;
      double v30 = 0;
      char v155 = 0;
      v41 = 0;
      double v139 = v150;
      double v140 = v151;
      goto LABEL_69;
    case 0x11:
      v82 = [v24 backgroundColor];
      v83 = v82;
      double v84 = 0.25;
      goto LABEL_57;
    case 0x12:
      v85 = (void *)MEMORY[0x1E4FB1618];
      v86 = [off_1E5DA9658 sharedInstance];
      [v86 keyboardUnselectedDimmingFactor];
      v41 = objc_msgSend(v85, "colorWithWhite:alpha:");

      goto LABEL_67;
    case 0x13:
      v82 = [v24 backgroundColor];
      v83 = v82;
      double v84 = 0.400000006;
LABEL_57:
      v41 = [v82 colorWithAlphaComponent:v84];

      goto LABEL_67;
    case 0x14:
      id v63 = v23;
      goto LABEL_66;
    case 0x15:
      id v87 = +[PXBadgeHelper livePhotoBadgeShadowedImage];
      CGImageRef v88 = CGImageRetain((CGImageRef)[v87 CGImage]);

      if (!v88) {
        PXAssertGetLog();
      }
      image = v88;
      uint64_t v39 = 0;
      v40 = 0;
      double v30 = 0;
      v41 = 0;
      goto LABEL_62;
    case 0x16:
      id v89 = +[PXBadgeHelper(iOS) spatialBadgeImage];
      image = CGImageRetain((CGImageRef)[v89 CGImage]);

      uint64_t v39 = 0;
      v40 = 0;
      double v30 = 0;
      v41 = 0;
LABEL_62:
      char v62 = 3;
LABEL_63:
      char v155 = v62;
      double v139 = v150;
      double v140 = v151;
      goto LABEL_68;
    case 0x17:
      v90 = @"PXBadgeGradientTopLeft";
      v91 = [(PXGDecorationDefaultBadgeDrawingHelper *)self assetIndexFormatter];
      v92 = [NSNumber numberWithInteger:a3->var5];
      [v91 stringFromNumber:v92];
      objc_claimAutoreleasedReturnValue();

      PXAttributedStringForBadgeText();
    case 0x1BLL:
      v134 = [MEMORY[0x1E4F28B00] currentHandler];
      v132 = v134;
      v135 = @"Custom view decorations require presentationType == PXGPresentationTypeView";
      SEL v136 = a2;
      v137 = self;
      uint64_t v138 = 756;
      goto LABEL_154;
    case 0x1CLL:
      id v63 = [MEMORY[0x1E4FB1618] systemOrangeColor];
LABEL_66:
      v41 = v63;
LABEL_67:
      uint64_t v39 = 0;
      v40 = 0;
      image = 0;
      double v30 = 0;
      char v155 = 0;
      double v139 = v150;
      double v140 = v151;
      goto LABEL_68;
    case 0x1DLL:
    case 0x1ELL:
    case 0x1FLL:
      PXAttributedStringForBadgeText();
    default:
      uint64_t v39 = 0;
      char v155 = 0;
      double v139 = v150;
      double v140 = v151;
      v40 = 0;
      image = 0;
      v41 = 0;
LABEL_68:
      CGFloat v44 = v152;
      CGFloat v64 = v148;
      goto LABEL_69;
  }
}

- (NSDateComponentsFormatter)videoDurationFormatter
{
  return self->_videoDurationFormatter;
}

- (PXSelectionCountNumberFormatter)selectionCountFormatter
{
  return self->_selectionCountFormatter;
}

- (NSByteCountFormatter)byteCountFormatter
{
  return self->_byteCountFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionCountFormatter, 0);
  objc_storeStrong((id *)&self->_byteCountFormatter, 0);
  objc_storeStrong((id *)&self->_videoDurationFormatter, 0);
  objc_storeStrong((id *)&self->_assetIndexFormatter, 0);
}

- (NSNumberFormatter)assetIndexFormatter
{
  assetIndexFormatter = self->_assetIndexFormatter;
  if (!assetIndexFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v5 = self->_assetIndexFormatter;
    self->_assetIndexFormatter = v4;

    [(NSNumberFormatter *)self->_assetIndexFormatter setNumberStyle:1];
    v6 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSNumberFormatter *)self->_assetIndexFormatter setLocale:v6];

    assetIndexFormatter = self->_assetIndexFormatter;
  }
  return assetIndexFormatter;
}

void __180__PXGDecorationDefaultBadgeDrawingHelper_drawWithDecorationInfo_solidColorOverlay_debugDecoration_cornerRadius_context_viewport_screenScale_viewEnvironment_userInterfaceDirection___block_invoke(uint64_t a1, CGColor *a2, double a3, double a4, double a5, double a6, CGFloat a7, CGFloat a8)
{
  double v11 = CGPathCreateWithRoundedRect(*(CGRect *)&a3, a8, a8, 0);
  CGContextAddPath(*(CGContextRef *)(a1 + 32), v11);
  CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 32), a2);
  CGContextSetLineWidth(*(CGContextRef *)(a1 + 32), a7);
  CGContextStrokePath(*(CGContextRef *)(a1 + 32));
  CGPathRelease(v11);
}

void __180__PXGDecorationDefaultBadgeDrawingHelper_drawWithDecorationInfo_solidColorOverlay_debugDecoration_cornerRadius_context_viewport_screenScale_viewEnvironment_userInterfaceDirection___block_invoke_23(uint64_t a1, CGColor *a2, double a3, double a4)
{
  CGFloat v7 = (a4 + a3 * 0.5) * *(double *)(a1 + 64);
  CGRect v18 = CGRectInset(*(CGRect *)(a1 + 32), v7, v7);
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 72), a2);
  CGContextSetLineWidth(*(CGContextRef *)(a1 + 72), *(double *)(a1 + 64) * a3);
  double v12 = *(CGContext **)(a1 + 72);
  CGFloat v13 = x;
  CGFloat v14 = y;
  CGFloat v15 = width;
  CGFloat v16 = height;
  CGContextStrokeRect(v12, *(CGRect *)&v13);
}

double __180__PXGDecorationDefaultBadgeDrawingHelper_drawWithDecorationInfo_solidColorOverlay_debugDecoration_cornerRadius_context_viewport_screenScale_viewEnvironment_userInterfaceDirection___block_invoke_52(uint64_t a1)
{
  double result = 1.2;
  if ((unint64_t)(*(void *)(a1 + 32) - 25) >= 2) {
    return 1.0;
  }
  return result;
}

@end