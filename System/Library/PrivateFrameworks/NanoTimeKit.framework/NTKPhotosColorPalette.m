@interface NTKPhotosColorPalette
+ (void)applyColorRamp:(id)a3 colorRampAmount:(double)a4 monochromeColorMatrix:(id)a5 toView:(id)a6;
+ (void)colorRampForMonochromeColorMatrix:(id)a3 fromPalette:(id)a4 toPalette:(id)a5 transitionFraction:(double)a6 completion:(id)a7;
+ (void)removeColorRampFromView:(id)a3;
- (BOOL)isOriginalColor;
- (id)_monocolorRampColor;
- (id)colorRampImage;
- (id)colorRampsIndex;
- (id)colorRampsIndexByColorName;
- (id)imageAsset;
- (id)monocolorRampImage;
- (id)swatchImageForSize:(CGSize)a3;
- (id)swatchPrimaryColor;
@end

@implementation NTKPhotosColorPalette

- (id)imageAsset
{
}

- (id)colorRampImage
{
  if ([(NTKPhotosColorPalette *)self isOriginalColor])
  {
    v3 = 0;
  }
  else
  {
    v4 = [(NTKPhotosColorPalette *)self imageAsset];
    v5 = [(NTKPhotosColorPalette *)self colorRampsIndex];
    v6 = v5;
    if (v5)
    {
      int v7 = [v5 intValue];
    }
    else
    {
      [v4 size];
      double v9 = v8;
      [v4 scale];
      int v7 = (int)(v9 * v10 + -1.0);
    }
    [v4 size];
    v3 = NTKCropImage(v4, 0.0, (double)v7, v11, 1.0);
  }
  return v3;
}

- (id)monocolorRampImage
{
  if ([(NTKPhotosColorPalette *)self isOriginalColor])
  {
    v3 = 0;
  }
  else
  {
    v4 = [(NTKPhotosColorPalette *)self monocolorRampColor];
    v7.width = 1.0;
    v7.height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v7, 1, 1.0);
    [v4 setFill];
    v8.origin.x = 0.0;
    v8.origin.y = 0.0;
    v8.size.width = 1.0;
    v8.size.height = 1.0;
    UIRectFill(v8);
    v3 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  return v3;
}

- (id)swatchImageForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(NTKPhotosColorPalette *)self isOriginalColor])
  {
    if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      +[NTKEditOption sizeForSwatchStyle:0];
      double width = v7;
      double height = v8;
    }
    double v9 = [MEMORY[0x1E4FB1618] blackColor];
    v30.double width = width;
    v30.double height = height;
    UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    [v9 set];
    v34.origin.x = 0.0;
    v34.origin.y = 0.0;
    v34.size.double width = width;
    v34.size.double height = height;
    CGContextFillEllipseInRect(CurrentContext, v34);
    double v11 = UIGraphicsGetCurrentContext();
    Image = CGBitmapContextCreateImage(v11);
    UIGraphicsEndImageContext();
    v31.double width = width;
    v31.double height = height;
    UIGraphicsBeginImageContextWithOptions(v31, 0, 0.0);
    v13 = UIGraphicsGetCurrentContext();
    v35.origin.x = 0.0;
    v35.origin.y = 0.0;
    v35.size.double width = width;
    v35.size.double height = height;
    CGContextClipToMask(v13, v35, Image);
    [v9 set];
    transform.b = 0.0;
    transform.c = 0.0;
    transform.a = 1.0;
    *(_OWORD *)&transform.d = xmmword_1BC8A1FB0;
    transform.ty = height;
    CGContextConcatCTM(v13, &transform);
    NTKImageNamed(@"NoneSwatch");
  }
  if ([(NTKFaceColorPalette *)self isCompositePalette])
  {
    v14 = [(NTKPhotosColorPalette *)self colorRampImage];
    if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      +[NTKEditOption sizeForSwatchStyle:0];
      double width = v16;
      double height = v17;
    }
    v32.double width = width;
    v32.double height = height;
    UIGraphicsBeginImageContextWithOptions(v32, 0, 0.0);
    v18 = UIGraphicsGetCurrentContext();
    v19 = [MEMORY[0x1E4FB1618] blackColor];
    [v19 set];

    v36.origin.x = 0.0;
    v36.origin.y = 0.0;
    v36.size.double width = width;
    v36.size.double height = height;
    CGContextFillEllipseInRect(v18, v36);
    v20 = UIGraphicsGetCurrentContext();
    v21 = CGBitmapContextCreateImage(v20);
    UIGraphicsEndImageContext();
    v33.double width = width;
    v33.double height = height;
    UIGraphicsBeginImageContextWithOptions(v33, 0, 0.0);
    v22 = UIGraphicsGetCurrentContext();
    v37.origin.x = 0.0;
    v37.origin.y = 0.0;
    v37.size.double width = width;
    v37.size.double height = height;
    CGContextClipToMask(v22, v37, v21);
    CGContextTranslateCTM(v22, width * 0.5, height * 0.5);
    CGContextRotateCTM(v22, -2.35619449);
    CGContextTranslateCTM(v22, width * -0.5, height * -0.5);
    id v23 = v14;
    v24 = (CGImage *)[v23 CGImage];
    v38.origin.x = 0.0;
    v38.origin.y = 0.0;
    v38.size.double width = width;
    v38.size.double height = height;
    CGContextDrawImage(v22, v38, v24);
    v25 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(v21);
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)NTKPhotosColorPalette;
    v25 = -[NTKFaceColorPalette swatchImageForSize:](&v27, sel_swatchImageForSize_, width, height);
  }
  return v25;
}

- (id)swatchPrimaryColor
{
  if ([(NTKFaceColorPalette *)self isCompositePalette])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKPhotosColorPalette;
    v3 = [(NTKFaceColorPalette *)&v5 swatchPrimaryColor];
  }
  return v3;
}

- (id)colorRampsIndex
{
  v3 = [(NTKPhotosColorPalette *)self colorRampsIndexByColorName];
  v4 = [(NTKFaceColorPalette *)self pigmentEditOption];
  objc_super v5 = [v4 identifier];
  v6 = [v3 objectForKeyedSubscript:v5];

  if (!v6)
  {
    double v7 = [(NTKPhotosColorPalette *)self colorRampsIndexByColorName];
    double v8 = [(NTKFaceColorPalette *)self configuration];
    double v9 = [v8 colorOption];
    v6 = [v7 objectForKeyedSubscript:v9];
  }
  return v6;
}

- (id)colorRampsIndexByColorName
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NTKPhotosColorPalette_colorRampsIndexByColorName__block_invoke;
  block[3] = &unk_1E62C16C0;
  block[4] = v5;
  if (colorRampsIndexByColorName_once != -1) {
    dispatch_once(&colorRampsIndexByColorName_once, block);
  }
  id v2 = (id)colorRampsIndexByColorName___d;
  _Block_object_dispose(v5, 8);
  return v2;
}

void __51__NTKPhotosColorPalette_colorRampsIndexByColorName__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = (void *)colorRampsIndexByColorName___d;
  colorRampsIndexByColorName___d = v2;

  v4 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  objc_super v5 = objc_msgSend(v4, "numberWithInteger:");
  v6 = (void *)colorRampsIndexByColorName___d;
  double v7 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  [v6 setObject:v5 forKeyedSubscript:v7];

  double v8 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v9 = objc_msgSend(v8, "numberWithInteger:");
  double v10 = (void *)colorRampsIndexByColorName___d;
  double v11 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2019.lemonCream" otherName:@"seasons.winter2019.beryl"];
  [v10 setObject:v9 forKeyedSubscript:v11];

  v12 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v13 = objc_msgSend(v12, "numberWithInteger:");
  v14 = (void *)colorRampsIndexByColorName___d;
  v15 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", @"seasons.winter2019.beryl");
  [v14 setObject:v13 forKeyedSubscript:v15];

  double v16 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v17 = objc_msgSend(v16, "numberWithInteger:");
  v18 = (void *)colorRampsIndexByColorName___d;
  v19 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", @"seasons.fall2019.lemonCream");
  [v18 setObject:v17 forKeyedSubscript:v19];

  v20 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v21 = objc_msgSend(v20, "numberWithInteger:");
  v22 = (void *)colorRampsIndexByColorName___d;
  id v23 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  [v22 setObject:v21 forKeyedSubscript:v23];

  v24 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v25 = objc_msgSend(v24, "numberWithInteger:");
  v26 = (void *)colorRampsIndexByColorName___d;
  objc_super v27 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  [v26 setObject:v25 forKeyedSubscript:v27];

  v28 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v29 = objc_msgSend(v28, "numberWithInteger:");
  CGSize v30 = (void *)colorRampsIndexByColorName___d;
  CGSize v31 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", @"seasons.fall2015.orange");
  [v30 setObject:v29 forKeyedSubscript:v31];

  CGSize v32 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  CGSize v33 = objc_msgSend(v32, "numberWithInteger:");
  CGRect v34 = (void *)colorRampsIndexByColorName___d;
  CGRect v35 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  [v34 setObject:v33 forKeyedSubscript:v35];

  CGRect v36 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  CGRect v37 = objc_msgSend(v36, "numberWithInteger:");
  CGRect v38 = (void *)colorRampsIndexByColorName___d;
  v39 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  [v38 setObject:v37 forKeyedSubscript:v39];

  v40 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v41 = objc_msgSend(v40, "numberWithInteger:");
  v42 = (void *)colorRampsIndexByColorName___d;
  v43 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  [v42 setObject:v41 forKeyedSubscript:v43];

  v44 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v45 = objc_msgSend(v44, "numberWithInteger:");
  v46 = (void *)colorRampsIndexByColorName___d;
  v47 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2015.orange" otherName:@"seasons.summer2020.coastalGray"];
  [v46 setObject:v45 forKeyedSubscript:v47];

  v48 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v49 = objc_msgSend(v48, "numberWithInteger:");
  v50 = (void *)colorRampsIndexByColorName___d;
  v51 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  [v50 setObject:v49 forKeyedSubscript:v51];

  v52 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v53 = objc_msgSend(v52, "numberWithInteger:");
  v54 = (void *)colorRampsIndexByColorName___d;
  v55 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  [v54 setObject:v53 forKeyedSubscript:v55];

  v56 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v57 = objc_msgSend(v56, "numberWithInteger:");
  v58 = (void *)colorRampsIndexByColorName___d;
  v59 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  [v58 setObject:v57 forKeyedSubscript:v59];

  v60 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v61 = objc_msgSend(v60, "numberWithInteger:");
  v62 = (void *)colorRampsIndexByColorName___d;
  v63 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2020.pinkCitrus" otherName:@"seasons.fall2020.kumquat"];
  [v62 setObject:v61 forKeyedSubscript:v63];

  v64 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v65 = objc_msgSend(v64, "numberWithInteger:");
  v66 = (void *)colorRampsIndexByColorName___d;
  v67 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", @"seasons.spring2015.pink");
  [v66 setObject:v65 forKeyedSubscript:v67];

  v68 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v69 = objc_msgSend(v68, "numberWithInteger:");
  v70 = (void *)colorRampsIndexByColorName___d;
  v71 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  [v70 setObject:v69 forKeyedSubscript:v71];

  v72 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v73 = objc_msgSend(v72, "numberWithInteger:");
  v74 = (void *)colorRampsIndexByColorName___d;
  v75 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", @"seasons.summer2021.olive");
  [v74 setObject:v73 forKeyedSubscript:v75];

  v76 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v77 = objc_msgSend(v76, "numberWithInteger:");
  v78 = (void *)colorRampsIndexByColorName___d;
  v79 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:");
  [v78 setObject:v77 forKeyedSubscript:v79];

  v80 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v81 = objc_msgSend(v80, "numberWithInteger:");
  v82 = (void *)colorRampsIndexByColorName___d;
  v83 = +[NTKPigmentEditOption duotoneNameWithName:otherName:](NTKPigmentEditOption, "duotoneNameWithName:otherName:", @"seasons.summer2021.olive");
  [v82 setObject:v81 forKeyedSubscript:v83];

  v84 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v85 = objc_msgSend(v84, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v85 forKeyedSubscript:@"seasons.spring2015.gold"];

  v86 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v87 = objc_msgSend(v86, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v87 forKeyedSubscript:@"seasons.spring2015.goldRose"];

  v88 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v89 = objc_msgSend(v88, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v89 forKeyedSubscript:@"seasons.spring2015.goldYellow"];

  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v90 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v91 = objc_msgSend(v90, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v91 forKeyedSubscript:@"seasons.fall2020.pinkCitrus"];

  v92 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v93 = objc_msgSend(v92, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v93 forKeyedSubscript:@"seasons.fall2020.deepNavy"];

  v94 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v95 = objc_msgSend(v94, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v95 forKeyedSubscript:@"seasons.fall2020.cyprusGreen"];

  v96 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v97 = objc_msgSend(v96, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v97 forKeyedSubscript:@"seasons.fall2020.kumquat"];

  v98 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v99 = objc_msgSend(v98, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v99 forKeyedSubscript:@"seasons.fall2020.northernBlue"];

  v100 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v101 = objc_msgSend(v100, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v101 forKeyedSubscript:@"seasons.fall2020.plum"];

  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v102 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v103 = objc_msgSend(v102, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v103 forKeyedSubscript:@"seasons.fall2020.cream"];

  v104 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v105 = objc_msgSend(v104, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v105 forKeyedSubscript:@"seasons.spring2021.mallardGreen"];

  v106 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v107 = objc_msgSend(v106, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v107 forKeyedSubscript:@"seasons.summer2021.electricOrange"];

  v108 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v109 = objc_msgSend(v108, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v109 forKeyedSubscript:@"seasons.summer2021.cloudBlue"];

  v110 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v111 = objc_msgSend(v110, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v111 forKeyedSubscript:@"seasons.spring2021.pistachio"];

  v112 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v113 = objc_msgSend(v112, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v113 forKeyedSubscript:@"seasons.spring2021.sunflower"];

  v114 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v115 = objc_msgSend(v114, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v115 forKeyedSubscript:@"seasons.spring2021.seaSalt"];

  v116 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v117 = objc_msgSend(v116, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v117 forKeyedSubscript:@"seasons.spring2021.abyss"];

  v118 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v119 = objc_msgSend(v118, "numberWithInteger:");
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v119);

  v120 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v121 = objc_msgSend(v120, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v121 forKeyedSubscript:@"seasons.fall2015.red"];

  v122 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v123 = objc_msgSend(v122, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v123 forKeyedSubscript:@"seasons.fall2015.orange"];

  v124 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v125 = objc_msgSend(v124, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v125 forKeyedSubscript:@"seasons.fall2019.clementine"];

  v126 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v127 = objc_msgSend(v126, "numberWithInteger:");
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v127);

  v128 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v129 = objc_msgSend(v128, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v129 forKeyedSubscript:@"seasons.spring2018.peach"];

  v130 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v131 = objc_msgSend(v130, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v131 forKeyedSubscript:@"seasons.spring2019.papaya"];

  v132 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v133 = objc_msgSend(v132, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v133 forKeyedSubscript:@"seasons.spring2015.lightOrange"];

  v134 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v135 = objc_msgSend(v134, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v135 forKeyedSubscript:@"seasons.winter2018.mellowYellow"];

  v136 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v137 = objc_msgSend(v136, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v137 forKeyedSubscript:@"seasons.fall2019.lemonCream"];

  v138 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v139 = objc_msgSend(v138, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v139 forKeyedSubscript:@"seasons.spring2016.yellow"];

  v140 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v141 = objc_msgSend(v140, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v141 forKeyedSubscript:@"seasons.summer2017.pollen"];

  v142 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v143 = objc_msgSend(v142, "numberWithInteger:");
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v143);

  v144 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v145 = objc_msgSend(v144, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v145 forKeyedSubscript:@"seasons.spring2018.flashLight"];

  v146 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v147 = objc_msgSend(v146, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v147 forKeyedSubscript:@"seasons.fall2017.flash"];

  v148 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v149 = objc_msgSend(v148, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v149 forKeyedSubscript:@"seasons.spring2015.green"];

  v150 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v151 = objc_msgSend(v150, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v151 forKeyedSubscript:@"seasons.spring2019.spearmint"];

  v152 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v153 = objc_msgSend(v152, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v153 forKeyedSubscript:@"seasons.spring2016.mint"];

  v154 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v155 = objc_msgSend(v154, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v155 forKeyedSubscript:@"seasons.winter2019.beryl"];

  v156 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v157 = objc_msgSend(v156, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v157 forKeyedSubscript:@"seasons.summer2020.seaFoam"];

  v158 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v159 = objc_msgSend(v158, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v159 forKeyedSubscript:@"seasons.fall2015.turquoise"];

  v160 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v161 = objc_msgSend(v160, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v161 forKeyedSubscript:@"seasons.fall2015.lightBlue"];

  v162 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v163 = objc_msgSend(v162, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v163 forKeyedSubscript:@"seasons.spring2020.surfBlue"];

  v164 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v165 = objc_msgSend(v164, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v165 forKeyedSubscript:@"seasons.spring2015.blue"];

  v166 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v167 = objc_msgSend(v166, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v167 forKeyedSubscript:@"seasons.spring2016.royalBlue"];

  v168 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v169 = objc_msgSend(v168, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v169 forKeyedSubscript:@"seasons.spring2019.cerulean"];

  v170 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v171 = objc_msgSend(v170, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v171 forKeyedSubscript:@"seasons.spring2019.lilac"];

  v172 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v173 = objc_msgSend(v172, "numberWithInteger:");
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v173);

  v174 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v175 = objc_msgSend(v174, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v175 forKeyedSubscript:@"seasons.spring2017.azure"];

  v176 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v177 = objc_msgSend(v176, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v177 forKeyedSubscript:@"seasons.fall2018.stormGray"];

  v178 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v179 = objc_msgSend(v178, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v179 forKeyedSubscript:@"seasons.spring2020.cactus"];

  v180 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v181 = objc_msgSend(v180, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v181 forKeyedSubscript:@"seasons.winter2018.pacificGreen"];

  v182 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v183 = objc_msgSend(v182, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v183 forKeyedSubscript:@"seasons.fall2017.blueCobalt"];

  v184 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v185 = objc_msgSend(v184, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v185 forKeyedSubscript:@"seasons.fall2019.alaskanBlue"];

  v186 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v187 = objc_msgSend(v186, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v187 forKeyedSubscript:@"seasons.winter2017.darkTeal"];

  v188 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v189 = objc_msgSend(v188, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v189 forKeyedSubscript:@"seasons.fall2018.blueHorizon"];

  v190 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v191 = objc_msgSend(v190, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v191 forKeyedSubscript:@"seasons.summer2020.linenBlue"];

  v192 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v193 = objc_msgSend(v192, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v193 forKeyedSubscript:@"seasons.spring2018.denimBlue"];

  v194 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v195 = objc_msgSend(v194, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v195 forKeyedSubscript:@"seasons.fall2015.midnightBlue"];

  v196 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v197 = objc_msgSend(v196, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v197 forKeyedSubscript:@"seasons.fall2016.oceanBlue"];

  v198 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v199 = objc_msgSend(v198, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v199 forKeyedSubscript:@"seasons.spring2019.delftBlue"];

  v200 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v201 = objc_msgSend(v200, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v201 forKeyedSubscript:@"seasons.fall2018.indigo"];

  v202 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v203 = objc_msgSend(v202, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v203 forKeyedSubscript:@"seasons.spring2015.purple"];

  v204 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v205 = objc_msgSend(v204, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v205 forKeyedSubscript:@"seasons.fall2017.violet"];

  v206 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v207 = objc_msgSend(v206, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v207 forKeyedSubscript:@"seasons.fall2018.lavenderGray"];

  v208 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v209 = objc_msgSend(v208, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v209 forKeyedSubscript:@"seasons.fall2015.lavender"];

  v210 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v211 = objc_msgSend(v210, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v211 forKeyedSubscript:@"seasons.fall2017.pinkSand"];

  v212 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v213 = objc_msgSend(v212, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v213 forKeyedSubscript:@"seasons.spring2016.lightPink"];

  v214 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v215 = objc_msgSend(v214, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v215 forKeyedSubscript:@"seasons.fall2015.vintageRose"];

  v216 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v217 = objc_msgSend(v216, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v217 forKeyedSubscript:@"seasons.spring2020.grapefruit"];

  v218 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v219 = objc_msgSend(v218, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v219 forKeyedSubscript:@"seasons.spring2015.pink"];

  v220 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v221 = objc_msgSend(v220, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v221 forKeyedSubscript:@"seasons.fall2017.electricPink"];

  v222 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v223 = objc_msgSend(v222, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v223 forKeyedSubscript:@"seasons.spring2020.neonPink"];

  v224 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v225 = objc_msgSend(v224, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v225 forKeyedSubscript:@"seasons.summer2019.dragonFruit"];

  v226 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v227 = objc_msgSend(v226, "numberWithInteger:");
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v227);

  v228 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v229 = objc_msgSend(v228, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v229 forKeyedSubscript:@"seasons.winter2019.pomegranate"];

  v230 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v231 = objc_msgSend(v230, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v231 forKeyedSubscript:@"seasons.fall2017.roseRed"];

  v232 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v233 = objc_msgSend(v232, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v233 forKeyedSubscript:@"seasons.spring2017.camellia"];

  v234 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v235 = objc_msgSend(v234, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v235 forKeyedSubscript:@"seasons.summer2017.flamingo"];

  v236 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v237 = objc_msgSend(v236, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v237 forKeyedSubscript:@"seasons.fall2019.camel"];

  v238 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v239 = objc_msgSend(v238, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v239 forKeyedSubscript:@"seasons.fall2015.walnut"];

  v240 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v241 = objc_msgSend(v240, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v241 forKeyedSubscript:@"seasons.fall2015.stone"];

  v242 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v243 = objc_msgSend(v242, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v243 forKeyedSubscript:@"seasons.fall2015.antiqueWhite"];

  v244 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v245 = objc_msgSend(v244, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v245 forKeyedSubscript:@"seasons.fall2017.softWhite"];

  v246 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v247 = objc_msgSend(v246, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v247 forKeyedSubscript:@"seasons.spring2017.pebble"];

  v248 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v249 = objc_msgSend(v248, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v249 forKeyedSubscript:@"seasons.fall2016.cocoa"];

  v250 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v251 = objc_msgSend(v250, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v251 forKeyedSubscript:@"seasons.summer2020.coastalGray"];

  v252 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v253 = objc_msgSend(v252, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v253 forKeyedSubscript:@"seasons.fall2017.darkOlive"];

  v254 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v255 = objc_msgSend(v254, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v255 forKeyedSubscript:@"seasons.winter2019.khaki"];

  v256 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v257 = objc_msgSend(v256, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v257 forKeyedSubscript:@"seasons.fall2019.pineGreen"];

  v258 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v259 = objc_msgSend(v258, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v259 forKeyedSubscript:@"seasons.summer2021.olive"];

  v260 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v261 = objc_msgSend(v260, "numberWithInteger:");
  v262 = (void *)colorRampsIndexByColorName___d;
  v263 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.spring2015.lightOrange" otherName:@"seasons.fall2021.white2t"];
  [v262 setObject:v261 forKeyedSubscript:v263];

  v264 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v265 = objc_msgSend(v264, "numberWithInteger:");
  v266 = (void *)colorRampsIndexByColorName___d;
  v267 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2017.electricPink" otherName:@"seasons.fall2015.walnut"];
  [v266 setObject:v265 forKeyedSubscript:v267];

  v268 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v269 = objc_msgSend(v268, "numberWithInteger:");
  v270 = (void *)colorRampsIndexByColorName___d;
  v271 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2020.kumquat" otherName:@"seasons.fall2021.green6"];
  [v270 setObject:v269 forKeyedSubscript:v271];

  v272 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v273 = objc_msgSend(v272, "numberWithInteger:");
  v274 = (void *)colorRampsIndexByColorName___d;
  v275 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2021.blue11" otherName:@"seasons.fall2021.green1"];
  [v274 setObject:v273 forKeyedSubscript:v275];

  v276 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v277 = objc_msgSend(v276, "numberWithInteger:");
  v278 = (void *)colorRampsIndexByColorName___d;
  v279 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2021.red2sg" otherName:@"seasons.fall2021.purple1"];
  [v278 setObject:v277 forKeyedSubscript:v279];

  v280 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v281 = objc_msgSend(v280, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v281 forKeyedSubscript:@"seasons.fall2021.purple2"];

  v282 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v283 = objc_msgSend(v282, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v283 forKeyedSubscript:@"seasons.fall2021.green3"];

  v284 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v285 = objc_msgSend(v284, "numberWithInteger:");
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v285);

  v286 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v287 = objc_msgSend(v286, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v287 forKeyedSubscript:@"seasons.fall2021.red2sg"];

  v288 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v289 = objc_msgSend(v288, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v289 forKeyedSubscript:@"seasons.fall2021.blue11"];

  v290 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v291 = objc_msgSend(v290, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v291 forKeyedSubscript:@"seasons.fall2021.purple1"];

  v292 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v293 = objc_msgSend(v292, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v293 forKeyedSubscript:@"seasons.spring2022.blue2"];

  v294 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v295 = objc_msgSend(v294, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v295 forKeyedSubscript:@"seasons.spring2022.green3"];

  v296 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v297 = objc_msgSend(v296, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v297 forKeyedSubscript:@"seasons.spring2022.green5"];

  v298 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v299 = objc_msgSend(v298, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v299 forKeyedSubscript:@"seasons.spring2022.orange2"];

  v300 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v301 = objc_msgSend(v300, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v301 forKeyedSubscript:@"seasons.spring2022.pink6t"];

  v302 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v303 = objc_msgSend(v302, "numberWithInteger:");
  v304 = (void *)colorRampsIndexByColorName___d;
  v305 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2020.deepNavy" otherName:@"seasons.spring2016.apricot"];
  [v304 setObject:v303 forKeyedSubscript:v305];

  v306 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v307 = objc_msgSend(v306, "numberWithInteger:");
  v308 = (void *)colorRampsIndexByColorName___d;
  v309 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.spring2022.lavender" otherName:@"seasons.spring2022.lilac"];
  [v308 setObject:v307 forKeyedSubscript:v309];

  v310 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v311 = objc_msgSend(v310, "numberWithInteger:");
  v312 = (void *)colorRampsIndexByColorName___d;
  v313 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.spring2022.oatmilk" otherName:@"seasons.summer2019.canaryYellow"];
  [v312 setObject:v311 forKeyedSubscript:v313];

  v314 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v315 = objc_msgSend(v314, "numberWithInteger:");
  v316 = (void *)colorRampsIndexByColorName___d;
  v317 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.summer2020.linenBlue" otherName:@"seasons.spring2022.green5"];
  [v316 setObject:v315 forKeyedSubscript:v317];

  v318 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v319 = objc_msgSend(v318, "numberWithInteger:");
  v320 = (void *)colorRampsIndexByColorName___d;
  v321 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.spring2022.orange2" otherName:@"seasons.winter2018.hibiscus"];
  [v320 setObject:v319 forKeyedSubscript:v321];

  v322 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v323 = objc_msgSend(v322, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v323 forKeyedSubscript:@"seasons.fall2022.red"];

  v324 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v325 = objc_msgSend(v324, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v325 forKeyedSubscript:@"seasons.fall2022.succulent"];

  v326 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v327 = objc_msgSend(v326, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v327 forKeyedSubscript:@"seasons.fall2022.elderberry"];

  v328 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v329 = objc_msgSend(v328, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v329 forKeyedSubscript:@"seasons.fall2022.slateBlue"];

  v330 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v331 = objc_msgSend(v330, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v331 forKeyedSubscript:@"seasons.fall2022.stormBlue"];

  v332 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v333 = objc_msgSend(v332, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v333 forKeyedSubscript:@"seasons.fall2022.sunglow"];

  v334 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v335 = objc_msgSend(v334, "numberWithInteger:");
  v336 = (void *)colorRampsIndexByColorName___d;
  v337 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2022.red" otherName:@"seasons.fall2020.kumquat"];
  [v336 setObject:v335 forKeyedSubscript:v337];

  v338 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v339 = objc_msgSend(v338, "numberWithInteger:");
  v340 = (void *)colorRampsIndexByColorName___d;
  v341 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2017.pinkSand" otherName:@"seasons.spring2022.orange2"];
  [v340 setObject:v339 forKeyedSubscript:v341];

  v342 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v343 = objc_msgSend(v342, "numberWithInteger:");
  v344 = (void *)colorRampsIndexByColorName___d;
  v345 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2021.stardust" otherName:@"seasons.fall2022.sunglow"];
  [v344 setObject:v343 forKeyedSubscript:v345];

  v346 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v347 = objc_msgSend(v346, "numberWithInteger:");
  v348 = (void *)colorRampsIndexByColorName___d;
  v349 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2021.stardust" otherName:@"seasons.summer2017.mistBlue"];
  [v348 setObject:v347 forKeyedSubscript:v349];

  v350 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v351 = objc_msgSend(v350, "numberWithInteger:");
  v352 = (void *)colorRampsIndexByColorName___d;
  v353 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2021.stardust" otherName:@"seasons.fall2017.darkOlive"];
  [v352 setObject:v351 forKeyedSubscript:v353];

  v354 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v355 = objc_msgSend(v354, "numberWithInteger:");
  v356 = (void *)colorRampsIndexByColorName___d;
  v357 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2022.stormBlue" otherName:@"seasons.spring2015.white"];
  [v356 setObject:v355 forKeyedSubscript:v357];

  v358 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v359 = objc_msgSend(v358, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v359 forKeyedSubscript:@"seasons.spring2023.sky"];

  v360 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v361 = objc_msgSend(v360, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v361 forKeyedSubscript:@"seasons.spring2023.purpleFog"];

  v362 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v363 = objc_msgSend(v362, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v363 forKeyedSubscript:@"seasons.spring2023.sproutGreen"];

  v364 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v365 = objc_msgSend(v364, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v365 forKeyedSubscript:@"seasons.fall2023.lightPink"];

  v366 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v367 = objc_msgSend(v366, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v367 forKeyedSubscript:@"seasons.fall2023.red"];

  v368 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v369 = objc_msgSend(v368, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v369 forKeyedSubscript:@"seasons.fall2023.clay"];

  v370 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v371 = objc_msgSend(v370, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v371 forKeyedSubscript:@"seasons.fall2023.mulberry"];

  v372 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v373 = objc_msgSend(v372, "numberWithInteger:");
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v373);

  v374 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v375 = objc_msgSend(v374, "numberWithInteger:");
  objc_msgSend((id)colorRampsIndexByColorName___d, "setObject:forKeyedSubscript:", v375);

  v376 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v377 = objc_msgSend(v376, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v377 forKeyedSubscript:@"seasons.fall2023.cypress"];

  v378 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v379 = objc_msgSend(v378, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v379 forKeyedSubscript:@"seasons.fall2023.guava"];

  v380 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v381 = objc_msgSend(v380, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v381 forKeyedSubscript:@"seasons.fall2023.taupe"];

  v382 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v383 = objc_msgSend(v382, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v383 forKeyedSubscript:@"seasons.fall2019.alaskanBlue"];

  v384 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v385 = objc_msgSend(v384, "numberWithInteger:");
  v386 = (void *)colorRampsIndexByColorName___d;
  v387 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2023.lightPink" otherName:@"seasons.fall2023.guava"];
  [v386 setObject:v385 forKeyedSubscript:v387];

  v388 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v389 = objc_msgSend(v388, "numberWithInteger:");
  v390 = (void *)colorRampsIndexByColorName___d;
  v391 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2023.cypress" otherName:@"custom.fall2023.mint"];
  [v390 setObject:v389 forKeyedSubscript:v391];

  v392 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v393 = objc_msgSend(v392, "numberWithInteger:");
  v394 = (void *)colorRampsIndexByColorName___d;
  v395 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2023.winterBlue" otherName:@"seasons.fall2023.mulberry"];
  [v394 setObject:v393 forKeyedSubscript:v395];

  v396 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v397 = objc_msgSend(v396, "numberWithInteger:");
  v398 = (void *)colorRampsIndexByColorName___d;
  v399 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2021.stardust" otherName:@"seasons.fall2023.orangeSorbet"];
  [v398 setObject:v397 forKeyedSubscript:v399];

  v400 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v401 = objc_msgSend(v400, "numberWithInteger:");
  v402 = (void *)colorRampsIndexByColorName___d;
  v403 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2021.stardust" otherName:@"seasons.fall2023.winterBlue"];
  [v402 setObject:v401 forKeyedSubscript:v403];

  v404 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v405 = objc_msgSend(v404, "numberWithInteger:");
  v406 = (void *)colorRampsIndexByColorName___d;
  v407 = +[NTKPigmentEditOption duotoneNameWithName:@"seasons.fall2023.orangeSorbet" otherName:@"seasons.fall2023.winterBlue"];
  [v406 setObject:v405 forKeyedSubscript:v407];

  v408 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v409 = objc_msgSend(v408, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v409 forKeyedSubscript:@"seasons.spring2024.lightBlue"];

  v410 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v411 = objc_msgSend(v410, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v411 forKeyedSubscript:@"seasons.spring2024.sunshine"];

  v412 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v413 = objc_msgSend(v412, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v413 forKeyedSubscript:@"seasons.spring2024.softMint"];

  v414 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v415 = objc_msgSend(v414, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v415 forKeyedSubscript:@"seasons.spring2024.oceanBlue"];

  v416 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v417 = objc_msgSend(v416, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v417 forKeyedSubscript:@"seasons.spring2024.pink"];

  v418 = NSNumber;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v419 = objc_msgSend(v418, "numberWithInteger:");
  [(id)colorRampsIndexByColorName___d setObject:v419 forKeyedSubscript:@"seasons.spring2024.raspberry"];
}

- (BOOL)isOriginalColor
{
  uint64_t v2 = [(NTKFaceColorPalette *)self configuration];
  v3 = [v2 colorOption];
  v4 = +[NTKPhotosColorEditOption originalColorName];
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)_monocolorRampColor
{
  if ([(NTKFaceColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKFaceColorPalette *)self paletteAtIndex:0];
    v4 = [v3 primaryColor];
  }
  else
  {
    v4 = [(NTKPhotosColorPalette *)self primaryColor];
  }
  return v4;
}

+ (void)colorRampForMonochromeColorMatrix:(id)a3 fromPalette:(id)a4 toPalette:(id)a5 transitionFraction:(double)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v22 = v11;
  v14 = (void (**)(id, void *, void *, double))a7;
  BOOL v15 = NTKIsDefaultMonochromeColorMatrix(v22);
  if (![v12 isOriginalColor])
  {
    if (![v13 isOriginalColor])
    {
      if (v15)
      {
        v20 = [v12 monocolorRampImage];
        [v13 monocolorRampImage];
      }
      else
      {
        v20 = [v12 colorRampImage];
        [v13 colorRampImage];
      v21 = };
      v19 = NTKInterpolateBetweenImages(v20, v21, a6);

      a6 = 1.0;
      double v16 = v22;
      goto LABEL_12;
    }
    double v16 = NTKInterpolateColorMatrixToIdentity(v22, a6);

    a6 = 1.0 - a6;
    double v17 = v12;
    if (v15) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v18 = [v17 colorRampImage];
    goto LABEL_7;
  }
  double v16 = NTKInterpolateColorMatrixToIdentity(v22, 1.0 - a6);

  double v17 = v13;
  if (!v15) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v18 = [v17 monocolorRampImage];
LABEL_7:
  v19 = (void *)v18;
LABEL_12:
  v14[2](v14, v19, v16, a6);
}

+ (void)applyColorRamp:(id)a3 colorRampAmount:(double)a4 monochromeColorMatrix:(id)a5 toView:(id)a6
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    id v12 = (void *)MEMORY[0x1E4F39BC0];
    uint64_t v13 = *MEMORY[0x1E4F3A038];
    id v14 = a6;
    id v15 = [v12 filterWithType:v13];
    [v15 setValue:v11 forKey:@"inputColorMatrix"];
    double v16 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A268]];
    double v17 = [NSNumber numberWithDouble:a4];
    [v16 setValue:v17 forKey:@"inputAmount"];

    objc_msgSend(v16, "setValue:forKey:", objc_msgSend(v10, "CGImage"), @"inputColorMap");
    v20[0] = v15;
    v20[1] = v16;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    v19 = [v14 layer];

    [v19 setFilters:v18];
  }
  else
  {
    id v15 = a6;
    [a1 removeColorRampFromView:v15];
  }
}

+ (void)removeColorRampFromView:(id)a3
{
  id v3 = [a3 layer];
  [v3 setFilters:0];
}

@end