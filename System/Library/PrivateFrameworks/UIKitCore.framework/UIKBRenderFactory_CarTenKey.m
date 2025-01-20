@interface UIKBRenderFactory_CarTenKey
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
@end

@implementation UIKBRenderFactory_CarTenKey

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  v97[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v96.receiver = self;
  v96.super_class = (Class)UIKBRenderFactory_CarTenKey;
  id v7 = a4;
  v8 = [(UIKBRenderFactory_Car *)&v96 _traitsForKey:v6 onKeyplane:v7];
  v9 = [(UIKBRenderFactory *)self lightKeycapsFontName];
  v10 = [v8 symbolStyle];
  [v10 setFontName:v9];

  v11 = [(UIKBRenderFactory_Car *)self displayContentsForKey:v6];
  uint64_t v12 = [v11 displayString];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [v11 secondaryDisplayStrings];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      v16 = [v8 symbolStyle];
      v17 = (void *)[v16 copy];

      v97[0] = v17;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:1];
      [v8 setSecondarySymbolStyles:v18];

      if ([v6 displayType] == 34)
      {
        v19 = [(UIKBRenderFactory *)self lightKeycapsFontName];
        [v17 setFontName:v19];

        [(UIKBRenderFactory_Car *)self defaultKeyFontSize];
        [v17 setFontSize:v20 * 0.6];
        [(UIKBRenderFactory_Car *)self defaultKeyFontSize];
        double v22 = v21 * 0.3;
        [(UIKBRenderFactory_Car *)self defaultKeyFontSize];
        objc_msgSend(v17, "setTextOffset:", v22, v23 * 0.5);
      }
      else
      {
        if ([v6 displayType] == 31)
        {
          uint64_t v24 = [v11 displayString];
          if (!v24) {
            goto LABEL_11;
          }
          v25 = (void *)v24;
          v26 = [v11 secondaryDisplayStrings];
          uint64_t v27 = [v26 count];

          if (!v27) {
            goto LABEL_11;
          }
          [(UIKBRenderFactory_Car *)self defaultKeyFontSize];
          double v29 = v28 * 0.8;
          v30 = [v8 symbolStyle];
          [v30 setFontSize:v29];

          [(UIKBRenderFactory_Car *)self defaultKeyFontSize];
          double v32 = v31 * 0.2;
          v33 = [v8 symbolStyle];
          objc_msgSend(v33, "setTextOffset:", 0.0, v32);

          v34 = [v8 symbolStyle];
          [v34 setKerning:0.0];

          [(UIKBRenderFactory_Car *)self defaultKeyFontSize];
          [v17 setFontSize:v35 * 0.8];
          [(UIKBRenderFactory_Car *)self defaultKeyFontSize];
          double v37 = v36 * 0.2;
          [(UIKBRenderFactory_Car *)self defaultKeyFontSize];
          objc_msgSend(v17, "setTextOffset:", v37, v38 * -0.1);
          double v39 = -4.0;
        }
        else
        {
          [(UIKBRenderFactory_Car *)self defaultKeyFontSize];
          double v41 = v40 * -0.3;
          v42 = [v8 symbolStyle];
          objc_msgSend(v42, "setTextOffset:", 0.0, v41);

          [(UIKBRenderFactory_Car *)self defaultKeyFontSize];
          [v17 setFontSize:v43 * 0.5];
          [(UIKBRenderFactory_Car *)self defaultKeyFontSize];
          objc_msgSend(v17, "setTextOffset:", 0.0, v44 * 0.5);
          double v39 = 1.0;
        }
        [v17 setKerning:v39];
      }
LABEL_11:
    }
  }
  v45 = [v11 displayString];
  unint64_t v46 = [v45 length];

  if (v46 >= 2)
  {
    v47 = [v8 symbolStyle];
    [v47 fontSize];
    double v49 = v48 * 0.8;
    v50 = [v8 symbolStyle];
    [v50 setFontSize:v49];
  }
  v51 = [v6 name];
  if ([v51 hasPrefix:@"TenKey-Chinese-Pinyin-"])
  {
  }
  else
  {
    v52 = [v6 name];
    int v53 = [v52 hasPrefix:@"TenKey-Latin-"];

    if (!v53) {
      goto LABEL_18;
    }
  }
  v54 = [v8 symbolStyle];
  [v54 setFontName:@"UIKBRenderFactorySystemFontName"];

LABEL_18:
  [v6 frame];
  double MaxX = CGRectGetMaxX(v99);
  [v7 frame];
  if (MaxX >= CGRectGetMaxX(v100)) {
    double v56 = 0.0;
  }
  else {
    double v56 = 0.5;
  }
  [v6 frame];
  objc_msgSend(v7, "frame", CGRectGetMinY(v101));
  CGFloat v58 = v57;
  CGFloat v60 = v59;
  CGFloat v62 = v61;
  CGFloat v64 = v63;

  v102.origin.x = v58;
  v102.origin.y = v60;
  v102.size.width = v62;
  v102.size.height = v64;
  v65 = objc_msgSend(v8, "geometry", CGRectGetMaxY(v102));
  [v65 paddedFrame];
  double v67 = v66 + 0.0;
  double v69 = v68 - v56;
  double v71 = v70 + 0.0;
  double v73 = v72 + -0.5;
  v74 = [v8 geometry];
  objc_msgSend(v74, "setFrame:", v67, v71, v69, v73);

  v75 = [v8 geometry];
  [v75 frame];
  double v77 = v76;
  double v79 = v78;
  double v81 = v80;
  double v83 = v82;
  v84 = [v8 geometry];
  objc_msgSend(v84, "setPaddedFrame:", v77, v79, v81, v83);

  v85 = [v8 geometry];
  [v85 frame];
  double v87 = v86;
  double v89 = v88;
  double v91 = v90;
  double v93 = v92;
  v94 = [v8 geometry];
  objc_msgSend(v94, "setDisplayFrame:", v87, v89, v91, v93);

  return v8;
}

@end