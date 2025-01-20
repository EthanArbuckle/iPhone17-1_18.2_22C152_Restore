@interface UIKBResizableKeyplaneTransformation
+ (double)estimatedProgressForHeight:(double)a3;
+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4;
+ (id)transformationIdentifier;
@end

@implementation UIKBResizableKeyplaneTransformation

+ (id)transformationIdentifier
{
  return @"rk";
}

+ (double)estimatedProgressForHeight:(double)a3
{
  double v3 = fmin(fmax((a3 + -300.0) / 300.0, 0.0), 1.0);
  return v3 * v3 * (3.0 - (v3 + v3));
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  v136[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (([v5 visualStyling] & 0xFF0000) != 0x260000)
  {
    id v10 = v5;
    goto LABEL_29;
  }
  v7 = [v5 firstCachedKeyWithName:@"Delete-Key"];
  if (v7) {
    [v5 removeKey:v7];
  }
  v8 = [v6 screenTraits];
  v9 = v8;
  if (v8 && v8[35])
  {

    goto LABEL_10;
  }
  v11 = [v6 screenTraits];
  if (!v11)
  {
    v13 = 0;
LABEL_17:

    goto LABEL_18;
  }
  int v12 = v11[37];

  if (v12)
  {
LABEL_10:
    v9 = [v5 firstCachedKeyWithName:@"Space-Key"];
    if (v9) {
      [v5 removeKey:v9];
    }
    v13 = [v5 firstCachedKeyWithName:@"Emoji-Search-Control-Key"];
    if (v13) {
      [v5 removeKey:v13];
    }
    v14 = [v5 firstCachedKeyWithName:@"Dismiss-Key"];
    if (v14) {
      [v5 removeKey:v14];
    }

    goto LABEL_17;
  }
LABEL_18:
  [v5 frame];
  double v16 = v15;
  double v18 = v17;
  [v6 keyboardSize];
  double v20 = v19;
  double v22 = v21;
  v23 = [v6 screenTraits];
  if (!v23 || !v23[37])
  {
    BOOL v24 = v16 == v20;
    if (v18 != v22) {
      BOOL v24 = 0;
    }
    if (v20 == 0.0 || v24) {
      goto LABEL_21;
    }
LABEL_26:

    if (v22 == 0.0) {
      goto LABEL_27;
    }
    double v124 = v20;
    v27 = [v6 screenTraits];
    v28 = [v27 screen];
    [v28 scale];
    double v30 = v29;

    [v5 numberOfRows];
    v31 = [v5 firstCachedKeyWithName:@"Emoji-InputView-Key"];
    v32 = [v5 firstCachedKeyWithName:@"Emoji-Category-Control-Key"];
    v33 = [v5 firstCachedKeyWithName:@"Emoji-International-Key"];
    v34 = [v6 screenTraits];
    if (v34)
    {
      int v35 = v34[37];

      if (v35)
      {
        if (v32) {
          [v5 removeKey:v32];
        }
        if (v33) {
          [v5 removeKey:v33];
        }
      }
    }
    v36 = [v6 screenTraits];
    v123 = v33;
    double v114 = v22;
    if (v36)
    {
      int v37 = v36[37];

      double v38 = 0.0;
      if (v37)
      {
        double v39 = 0.0;
LABEL_41:
        double v40 = v22;
LABEL_54:
        if (v31)
        {
          [v31 frame];
          double v118 = v57;
          double v120 = v16;
          double v59 = v58;
          double v60 = v30;
          double v62 = v61;
          double v64 = v63;
          [v32 frame];
          double v66 = v40 - v59 - v39 * v65;
          double v67 = v38 + v38;
          double v68 = v38;
          double v69 = v18;
          double v70 = v124 - v67;
          v136[0] = v31;
          v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:1];
          double v72 = v70 - v62;
          double v30 = v60;
          double v18 = v69;
          double v38 = v68;
          objc_msgSend(v5, "resizeKeys:withOffset:scale:", v71, v72, v66 - v64, v60);

          v135 = v31;
          v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v135 count:1];
          double v74 = v59 - v59;
          double v16 = v120;
          objc_msgSend(v5, "repositionKeys:withOffset:scale:", v73, v68 - v118, v74, v60);
        }
        if (v32)
        {
          v75 = [v6 screenTraits];
          if (!v75 || (int v76 = v75[37], v75, !v76))
          {
            objc_msgSend(v32, "frame", *(void *)&v114);
            double v121 = v77;
            double v79 = v78;
            double v80 = v38;
            double v82 = v81;
            [v31 frame];
            double v83 = v16;
            double MaxY = CGRectGetMaxY(v138);
            [v32 originalFrame];
            v134 = v32;
            v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:1];
            objc_msgSend(v5, "resizeKeys:withOffset:scale:", v85, v124 - (v80 + v80) - v82, 0.0, v30);

            v133 = v32;
            v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
            double v87 = MaxY - v79;
            double v16 = v83;
            objc_msgSend(v5, "repositionKeys:withOffset:scale:", v86, v80 - v121, v87, v30);
          }
        }
        v116 = v31;
        double v88 = v114;
        if (v33)
        {
          v89 = [v6 screenTraits];
          if (!v89 || (int v90 = v89[37], v89, !v90))
          {
            objc_msgSend(v33, "frame", *(void *)&v114);
            double v91 = v30;
            double v93 = v92;
            double v95 = v94;
            [v32 frame];
            double v97 = v96;
            v132 = v33;
            v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v132 count:1];
            objc_msgSend(v5, "resizeKeys:withOffset:scale:", v98, 0.0 - v95, 0.0, v91);

            v131 = v33;
            v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1];
            double v100 = v97 - v93;
            double v30 = v91;
            objc_msgSend(v5, "repositionKeys:withOffset:scale:", v99, 0.0, v100, v91);
          }
        }
        v115 = v32;
        v117 = v7;
        id v119 = v6;
        v101 = +[UIKBShapeOperator operatorWithScale:](UIKBShapeOperator, "operatorWithScale:", v30, *(void *)&v114);
        long long v125 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        v122 = v5;
        v102 = [v5 subtrees];
        uint64_t v103 = [v102 countByEnumeratingWithState:&v125 objects:v130 count:16];
        if (v103)
        {
          uint64_t v104 = v103;
          double v105 = v88 - v18;
          uint64_t v106 = *(void *)v126;
          do
          {
            for (uint64_t i = 0; i != v104; ++i)
            {
              if (*(void *)v126 != v106) {
                objc_enumerationMutation(v102);
              }
              v108 = *(void **)(*((void *)&v125 + 1) + 8 * i);
              if ([v108 type] == 3)
              {
                v109 = [v108 shape];
                v129 = v109;
                v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
                v111 = objc_msgSend(v101, "shapesByResizingShapes:withOffset:", v110, v124 - v16, v105);
                v112 = [v111 firstObject];
                [v108 setShape:v112];
              }
            }
            uint64_t v104 = [v102 countByEnumeratingWithState:&v125 objects:v130 count:16];
          }
          while (v104);
        }

        id v5 = v122;
        [v122 setObject:0 forProperty:@"KBunionFrame"];
        [v122 setObject:0 forProperty:@"KBunionPaddedFrame"];

        id v113 = v122;
        v7 = v117;
        id v6 = v119;
        goto LABEL_28;
      }
    }
    objc_msgSend(v6, "screenTraits", *(void *)&v22);
    v41 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    if (!v41)
    {
      v43 = v32;
      v45 = v31;
      v55 = 0;
      double v39 = 1.0;
      double v38 = 0.0;
      double v40 = v22;
LABEL_53:

      v31 = v45;
      v32 = v43;
      v33 = v123;
      goto LABEL_54;
    }
    int v42 = v41[35];

    if (!v42)
    {
      double v39 = 1.0;
      double v38 = 0.0;
      goto LABEL_41;
    }
    v43 = v32;
    v44 = [v6 screenTraits];
    v45 = v31;
    if ((unint64_t)([v44 orientation] - 1) >= 2)
    {
      v46 = +[UIDevice currentDevice];
      v47 = v7;
      uint64_t v48 = [v46 userInterfaceIdiom];

      unint64_t v49 = v48 & 0xFFFFFFFFFFFFFFFBLL;
      v7 = v47;

      double v39 = 0.0;
      if (v49 != 1)
      {
LABEL_49:
        v51 = +[UIKeyboard activeKeyboard];
        v52 = [v51 window];
        v53 = v52;
        if (v52)
        {
          id v54 = v52;
        }
        else
        {
          id v54 = +[UIWindow _applicationKeyWindow];
        }
        v55 = v54;

        [v55 safeAreaInsets];
        double v40 = v22 - v39 * v56;
        double v38 = 15.0;
        goto LABEL_53;
      }
    }
    else
    {
    }
    [(id)objc_opt_class() estimatedProgressForHeight:v22];
    double v39 = v50;
    goto LABEL_49;
  }
  if (v20 != 0.0) {
    goto LABEL_26;
  }
LABEL_21:

LABEL_27:
  id v25 = v5;
LABEL_28:

LABEL_29:
  return v5;
}

@end