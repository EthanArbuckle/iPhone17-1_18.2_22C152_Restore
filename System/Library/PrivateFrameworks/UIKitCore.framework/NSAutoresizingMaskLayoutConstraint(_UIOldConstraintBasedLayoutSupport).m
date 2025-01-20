@interface NSAutoresizingMaskLayoutConstraint(_UIOldConstraintBasedLayoutSupport)
+ (id)oldUIConstraintsWithAutoresizingMask:()_UIOldConstraintBasedLayoutSupport subitem:frame:superitem:bounds:;
@end

@implementation NSAutoresizingMaskLayoutConstraint(_UIOldConstraintBasedLayoutSupport)

+ (id)oldUIConstraintsWithAutoresizingMask:()_UIOldConstraintBasedLayoutSupport subitem:frame:superitem:bounds:
{
  id v18 = a12;
  id v19 = a13;
  v20 = [MEMORY[0x1E4F1CA48] array];
  switch(a11 & 7)
  {
    case 1uLL:
      v115.origin.x = a5;
      v115.origin.y = a6;
      v115.size.width = a7;
      v115.size.height = a8;
      double MaxX = CGRectGetMaxX(v115);
      v116.origin.x = a1;
      v116.origin.y = a2;
      v116.size.width = a3;
      v116.size.height = a4;
      double v28 = MaxX - CGRectGetMaxX(v116);
      v29 = (void *)MEMORY[0x1E4F5B238];
      v117.origin.x = a5;
      v117.origin.y = a6;
      v117.size.width = a7;
      v117.size.height = a8;
      CGFloat v30 = CGRectGetMinX(v117) - v28;
      v118.origin.x = a1;
      v118.origin.y = a2;
      v118.size.width = a3;
      v118.size.height = a4;
      v21 = [v29 constraintWithItem:v18 attribute:34 relatedBy:0 toItem:v19 attribute:7 constant:v30 + CGRectGetWidth(v118) * -0.5];
      [v20 addObject:v21];
      v22 = (void *)MEMORY[0x1E4F5B238];
      CGFloat v23 = a1;
      CGFloat v24 = a2;
      CGFloat v25 = a3;
      CGFloat v26 = a4;
      goto LABEL_4;
    case 2uLL:
      v119.origin.x = a1;
      v119.origin.y = a2;
      v119.size.width = a3;
      v119.size.height = a4;
      double MinX = CGRectGetMinX(v119);
      v120.origin.x = a5;
      v120.origin.y = a6;
      v120.size.width = a7;
      v120.size.height = a8;
      double rectb = a2;
      double v33 = MinX - CGRectGetMinX(v120);
      v121.origin.x = a5;
      v121.origin.y = a6;
      v121.size.width = a7;
      v121.size.height = a8;
      double v34 = CGRectGetMaxX(v121);
      v122.origin.x = a1;
      v122.origin.y = rectb;
      v122.size.width = a3;
      v122.size.height = a4;
      double v35 = v34 - CGRectGetMaxX(v122);
      v21 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:34 relatedBy:0 toItem:v19 attribute:34 multiplier:1.0 constant:(v33 - v35) * 0.5];
      [v20 addObject:v21];
      double v36 = v33 + v35;
      a2 = rectb;
      uint64_t v31 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:7 relatedBy:0 toItem:v19 attribute:7 constant:-v36];
      goto LABEL_35;
    case 3uLL:
      v123.origin.x = a5;
      v123.origin.y = a6;
      v123.size.width = a7;
      v123.size.height = a8;
      double v37 = CGRectGetMaxX(v123);
      v124.origin.x = a1;
      v124.size.height = a4;
      double rect = a2;
      v124.origin.y = a2;
      v124.size.width = a3;
      double v38 = v37 - CGRectGetMaxX(v124);
      v125.origin.x = a5;
      v125.origin.y = a6;
      v125.size.width = a7;
      v125.size.height = a8;
      double v39 = CGRectGetWidth(v125) - v38;
      if (v39 == 0.0)
      {
        double v40 = 0.5;
        if (*MEMORY[0x1E4F5B220] > 0.0) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
      double v40 = 0.5;
      if (fabs(v39) >= *MEMORY[0x1E4F5B220])
      {
LABEL_8:
        v126.size.width = a3;
        v126.origin.x = a1;
        v126.origin.y = rect;
        v126.size.height = a4;
        double v40 = CGRectGetWidth(v126) / v39;
      }
LABEL_9:
      v127.origin.x = a5;
      v127.origin.y = a6;
      v127.size.width = a7;
      v127.size.height = a8;
      double v41 = CGRectGetMinX(v127);
      v21 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:34 relatedBy:0 toItem:v19 attribute:34 multiplier:2.0 - v40 constant:v41 * (v40 * 1.5 + -1.0) + v38 * (v40 * 0.5 + -1.0)];
      [v20 addObject:v21];
      v42 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:7 relatedBy:0 toItem:v19 attribute:7 multiplier:v40 constant:-(v40 * (v38 + v41))];
      a2 = rect;
      break;
    case 5uLL:
      v128.origin.x = a5;
      v128.origin.y = a6;
      v128.size.width = a7;
      v128.size.height = a8;
      double Width = CGRectGetWidth(v128);
      if (Width == 0.0)
      {
        double v44 = 0.5;
        if (*MEMORY[0x1E4F5B220] > 0.0) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      double v44 = 0.5;
      if (fabs(Width) >= *MEMORY[0x1E4F5B220])
      {
LABEL_12:
        v129.origin.x = a1;
        v129.size.height = a4;
        v129.origin.y = a2;
        v129.size.width = a3;
        double MidX = CGRectGetMidX(v129);
        v130.origin.x = a5;
        v130.origin.y = a6;
        v130.size.width = a7;
        v130.size.height = a8;
        double v44 = MidX / CGRectGetWidth(v130);
      }
LABEL_13:
      v131.origin.x = a1;
      v131.size.height = a4;
      v131.origin.y = a2;
      v131.size.width = a3;
      v21 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:7 relatedBy:0 constant:CGRectGetWidth(v131)];
      [v20 addObject:v21];
      uint64_t v31 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:34 relatedBy:0 toItem:v19 attribute:7 multiplier:v44 constant:0.0];
      goto LABEL_35;
    case 6uLL:
      v132.origin.x = a1;
      v132.size.height = a4;
      CGFloat v46 = a2;
      v132.origin.y = a2;
      v132.size.width = a3;
      double v47 = CGRectGetMinX(v132);
      v133.origin.x = a5;
      v133.origin.y = a6;
      v133.size.width = a7;
      v133.size.height = a8;
      double v48 = v47 - CGRectGetMinX(v133);
      v134.origin.x = a5;
      v134.origin.y = a6;
      v134.size.width = a7;
      v134.size.height = a8;
      double v49 = CGRectGetWidth(v134) - v48;
      if (v49 == 0.0)
      {
        double v50 = 1.0;
        double v51 = v46;
        if (*MEMORY[0x1E4F5B220] > 0.0) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      double v50 = 1.0;
      double v51 = v46;
      if (fabs(v49) >= *MEMORY[0x1E4F5B220])
      {
LABEL_16:
        v135.size.width = a3;
        v135.origin.x = a1;
        v135.origin.y = v51;
        v135.size.height = a4;
        double v50 = CGRectGetWidth(v135) / v49;
      }
LABEL_17:
      v136.origin.x = a5;
      v136.origin.y = a6;
      v136.size.width = a7;
      v136.size.height = a8;
      a2 = v51;
      v21 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:34 relatedBy:0 toItem:v19 attribute:34 multiplier:v50 constant:v48 * (v50 * -0.5 + 1.0) + CGRectGetMinX(v136) * (v50 * -1.5 + 1.0)];
      [v20 addObject:v21];
      v137.origin.x = a5;
      v137.origin.y = a6;
      v137.size.width = a7;
      v137.size.height = a8;
      v42 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:7 relatedBy:0 toItem:v19 attribute:7 multiplier:v50 constant:-(v50 * (v48 + CGRectGetMinX(v137)))];
      break;
    case 7uLL:
      v138.origin.x = a5;
      v138.origin.y = a6;
      v138.size.width = a7;
      v138.size.height = a8;
      double v52 = CGRectGetWidth(v138);
      v53 = (double *)MEMORY[0x1E4F5B220];
      if (v52 == 0.0)
      {
        double v54 = 0.5;
        if (*MEMORY[0x1E4F5B220] > 0.0) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      double v54 = 0.5;
      if (fabs(v52) >= *MEMORY[0x1E4F5B220])
      {
LABEL_20:
        v139.origin.x = a1;
        v139.size.height = a4;
        v139.origin.y = a2;
        v139.size.width = a3;
        double v55 = CGRectGetMidX(v139);
        v140.origin.x = a5;
        v140.origin.y = a6;
        v140.size.width = a7;
        v140.size.height = a8;
        double v54 = v55 / CGRectGetWidth(v140);
      }
LABEL_21:
      v141.origin.x = a5;
      v141.origin.y = a6;
      v141.size.width = a7;
      v141.size.height = a8;
      v21 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:34 relatedBy:0 toItem:v19 attribute:7 multiplier:v54 constant:CGRectGetMinX(v141)];
      [v20 addObject:v21];
      v142.origin.x = a5;
      v142.origin.y = a6;
      v142.size.width = a7;
      v142.size.height = a8;
      double v56 = CGRectGetWidth(v142);
      if (v56 == 0.0)
      {
        if (*v53 > 0.0)
        {
LABEL_23:
          double v57 = 0.333333333;
          goto LABEL_34;
        }
      }
      else if (fabs(v56) < *v53)
      {
        goto LABEL_23;
      }
      v143.origin.x = a1;
      v143.size.height = a4;
      v143.origin.y = a2;
      v143.size.width = a3;
      double v58 = CGRectGetWidth(v143);
      v144.origin.x = a5;
      v144.origin.y = a6;
      v144.size.width = a7;
      v144.size.height = a8;
      double v57 = v58 / CGRectGetWidth(v144);
LABEL_34:
      uint64_t v31 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:7 relatedBy:0 toItem:v19 attribute:7 multiplier:v57];
LABEL_35:
      v42 = (void *)v31;
      break;
    default:
      v114.origin.x = a1;
      v114.origin.y = a2;
      v114.size.width = a3;
      v114.size.height = a4;
      v21 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:34 relatedBy:0 constant:CGRectGetMidX(v114)];
      [v20 addObject:v21];
      v22 = (void *)MEMORY[0x1E4F5B238];
      CGFloat v23 = a1;
      CGFloat v24 = a2;
      CGFloat v25 = a3;
      CGFloat v26 = a4;
LABEL_4:
      uint64_t v31 = [v22 constraintWithItem:v18 attribute:7 relatedBy:0 constant:CGRectGetWidth(*(CGRect *)&v23)];
      goto LABEL_35;
  }

  [v20 addObject:v42];
  switch((a11 >> 3) & 7)
  {
    case 1uLL:
      v146.origin.x = a5;
      v146.origin.y = a6;
      v146.size.width = a7;
      v146.size.height = a8;
      double MaxY = CGRectGetMaxY(v146);
      v147.origin.x = a1;
      v147.origin.y = a2;
      v147.size.width = a3;
      v147.size.height = a4;
      double v66 = MaxY - CGRectGetMaxY(v147);
      v67 = (void *)MEMORY[0x1E4F5B238];
      v148.origin.x = a5;
      v148.origin.y = a6;
      v148.size.width = a7;
      v148.size.height = a8;
      CGFloat v68 = CGRectGetMinY(v148) - v66;
      v149.origin.x = a1;
      v149.origin.y = a2;
      v149.size.width = a3;
      v149.size.height = a4;
      v59 = [v67 constraintWithItem:v18 attribute:35 relatedBy:0 toItem:v19 attribute:8 constant:v68 + CGRectGetHeight(v149) * -0.5];

      [v20 addObject:v59];
      v60 = (void *)MEMORY[0x1E4F5B238];
      CGFloat v61 = a1;
      CGFloat v62 = a2;
      CGFloat v63 = a3;
      CGFloat v64 = a4;
      goto LABEL_39;
    case 2uLL:
      v150.origin.x = a1;
      v150.origin.y = a2;
      v150.size.width = a3;
      v150.size.height = a4;
      double MinY = CGRectGetMinY(v150);
      v151.origin.x = a5;
      v151.origin.y = a6;
      v151.size.width = a7;
      v151.size.height = a8;
      CGFloat v71 = CGRectGetMinY(v151);
      v152.size.height = a8;
      double v72 = MinY - v71;
      v152.origin.x = a5;
      v152.origin.y = a6;
      v152.size.width = a7;
      double v73 = CGRectGetMaxY(v152);
      v153.origin.x = a1;
      v153.origin.y = a2;
      v153.size.width = a3;
      v153.size.height = a4;
      double v74 = v73 - CGRectGetMaxY(v153);
      v59 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:35 relatedBy:0 toItem:v19 attribute:35 multiplier:1.0 constant:(v72 - v74) * 0.5];

      [v20 addObject:v59];
      uint64_t v69 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:8 relatedBy:0 toItem:v19 attribute:8 constant:-(v72 + v74)];
      goto LABEL_72;
    case 3uLL:
      v154.origin.x = a5;
      v154.origin.y = a6;
      v154.size.width = a7;
      v154.size.height = a8;
      double v75 = CGRectGetMaxY(v154);
      v155.origin.x = a1;
      v155.size.height = a4;
      v155.size.width = a3;
      CGFloat v76 = a5;
      CGFloat v77 = a2;
      v155.origin.y = a2;
      CGFloat rect_8 = v155.size.width;
      double v78 = v75 - CGRectGetMaxY(v155);
      v156.origin.x = v76;
      v156.origin.y = a6;
      v156.size.width = a7;
      v156.size.height = a8;
      double v79 = CGRectGetHeight(v156) - v78;
      if (v79 == 0.0)
      {
        double v80 = 0.5;
        if (*MEMORY[0x1E4F5B220] > 0.0) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }
      double v80 = 0.5;
      if (fabs(v79) >= *MEMORY[0x1E4F5B220])
      {
LABEL_43:
        v157.size.width = rect_8;
        v157.origin.x = a1;
        v157.origin.y = v77;
        v157.size.height = a4;
        double v80 = CGRectGetHeight(v157) / v79;
      }
LABEL_44:
      v158.origin.x = v76;
      v158.origin.y = a6;
      v158.size.width = a7;
      v158.size.height = a8;
      double v81 = CGRectGetMinY(v158);
      v59 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:35 relatedBy:0 toItem:v19 attribute:35 multiplier:2.0 - v80 constant:v81 * (v80 * 1.5 + -1.0) + v78 * (v80 * 0.5 + -1.0)];

      [v20 addObject:v59];
      v82 = (void *)MEMORY[0x1E4F5B238];
      double v83 = -(v80 * (v78 + v81));
      goto LABEL_53;
    case 5uLL:
      v159.origin.x = a5;
      v159.origin.y = a6;
      v159.size.width = a7;
      v159.size.height = a8;
      double Height = CGRectGetHeight(v159);
      if (Height == 0.0)
      {
        double v80 = 0.5;
        if (*MEMORY[0x1E4F5B220] > 0.0) {
          goto LABEL_48;
        }
        goto LABEL_47;
      }
      double v80 = 0.5;
      if (fabs(Height) >= *MEMORY[0x1E4F5B220])
      {
LABEL_47:
        v160.origin.x = a1;
        v160.size.height = a4;
        v160.origin.y = a2;
        v160.size.width = a3;
        double MidY = CGRectGetMidY(v160);
        v161.origin.x = a5;
        v161.origin.y = a6;
        v161.size.width = a7;
        v161.size.height = a8;
        double v80 = MidY / CGRectGetHeight(v161);
      }
LABEL_48:
      v162.origin.x = a1;
      v162.size.height = a4;
      v162.origin.y = a2;
      v162.size.width = a3;
      v59 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:8 relatedBy:0 constant:CGRectGetHeight(v162)];

      [v20 addObject:v59];
      v82 = (void *)MEMORY[0x1E4F5B238];
      double v83 = 0.0;
      id v86 = v18;
      uint64_t v87 = 35;
      goto LABEL_54;
    case 6uLL:
      v163.origin.x = a1;
      v163.size.height = a4;
      CGFloat recta = a2;
      v163.origin.y = a2;
      v163.size.width = a3;
      double v88 = CGRectGetMinY(v163);
      v164.origin.x = a5;
      v164.origin.y = a6;
      v164.size.width = a7;
      v164.size.height = a8;
      double v89 = v88 - CGRectGetMinY(v164);
      v165.origin.x = a5;
      v165.origin.y = a6;
      v165.size.width = a7;
      v165.size.height = a8;
      double v90 = CGRectGetHeight(v165) - v89;
      if (v90 == 0.0)
      {
        double v80 = 1.0;
        if (*MEMORY[0x1E4F5B220] > 0.0) {
          goto LABEL_52;
        }
        goto LABEL_51;
      }
      double v80 = 1.0;
      if (fabs(v90) >= *MEMORY[0x1E4F5B220])
      {
LABEL_51:
        v166.size.width = a3;
        v166.origin.x = a1;
        v166.origin.y = recta;
        v166.size.height = a4;
        double v80 = CGRectGetHeight(v166) / v90;
      }
LABEL_52:
      v167.origin.x = a5;
      v167.origin.y = a6;
      v167.size.width = a7;
      v167.size.height = a8;
      v59 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:35 relatedBy:0 toItem:v19 attribute:35 multiplier:v80 constant:v89 * (v80 * -0.5 + 1.0) + CGRectGetMinY(v167) * (v80 * -1.5 + 1.0)];

      [v20 addObject:v59];
      v91 = (void *)MEMORY[0x1E4F5B238];
      v168.origin.x = a5;
      v168.origin.y = a6;
      v168.size.width = a7;
      v168.size.height = a8;
      double v83 = -(v80 * (v89 + CGRectGetMinY(v168)));
      v82 = v91;
LABEL_53:
      id v86 = v18;
      uint64_t v87 = 8;
LABEL_54:
      uint64_t v69 = [v82 constraintWithItem:v86 attribute:v87 relatedBy:0 toItem:v19 attribute:8 multiplier:v80 constant:v83];
      goto LABEL_72;
    case 7uLL:
      v169.origin.x = a5;
      v169.origin.y = a6;
      v169.size.width = a7;
      v169.size.height = a8;
      double v92 = CGRectGetHeight(v169);
      if (v92 == 0.0)
      {
        double v93 = 0.5;
        if (*MEMORY[0x1E4F5B220] > 0.0) {
          goto LABEL_58;
        }
        goto LABEL_57;
      }
      double v93 = 0.5;
      if (fabs(v92) >= *MEMORY[0x1E4F5B220])
      {
LABEL_57:
        v170.origin.x = a1;
        v170.size.height = a4;
        v170.origin.y = a2;
        v170.size.width = a3;
        double v94 = CGRectGetMidY(v170);
        v171.origin.x = a5;
        v171.origin.y = a6;
        v171.size.width = a7;
        v171.size.height = a8;
        double v93 = v94 / CGRectGetHeight(v171);
      }
LABEL_58:
      v172.origin.x = a5;
      v172.origin.y = a6;
      v172.size.width = a7;
      v172.size.height = a8;
      v59 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:35 relatedBy:0 toItem:v19 attribute:8 multiplier:v93 constant:CGRectGetMinY(v172)];

      [v20 addObject:v59];
      v173.origin.x = a5;
      v173.origin.y = a6;
      v173.size.width = a7;
      v173.size.height = a8;
      double v95 = CGRectGetHeight(v173);
      if (v95 == 0.0)
      {
        double v96 = a2;
        if (*MEMORY[0x1E4F5B220] > 0.0)
        {
LABEL_60:
          double v97 = 0.333333333;
          goto LABEL_71;
        }
      }
      else
      {
        double v96 = a2;
        if (fabs(v95) < *MEMORY[0x1E4F5B220]) {
          goto LABEL_60;
        }
      }
      CGFloat v98 = a1;
      CGFloat v99 = a4;
      CGFloat v100 = a3;
      double v101 = CGRectGetHeight(*(CGRect *)(&v96 - 1));
      v174.origin.x = a5;
      v174.origin.y = a6;
      v174.size.width = a7;
      v174.size.height = a8;
      double v97 = v101 / CGRectGetHeight(v174);
LABEL_71:
      uint64_t v69 = objc_msgSend(MEMORY[0x1E4F5B238], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:", v18, 8, 0, v19, 8, v97, v96);
LABEL_72:
      v102 = (void *)v69;

      [v20 addObject:v102];
      return v20;
    default:
      v145.origin.x = a1;
      v145.origin.y = a2;
      v145.size.width = a3;
      v145.size.height = a4;
      v59 = [MEMORY[0x1E4F5B238] constraintWithItem:v18 attribute:35 relatedBy:0 constant:CGRectGetMidY(v145)];

      [v20 addObject:v59];
      v60 = (void *)MEMORY[0x1E4F5B238];
      CGFloat v61 = a1;
      CGFloat v62 = a2;
      CGFloat v63 = a3;
      CGFloat v64 = a4;
LABEL_39:
      uint64_t v69 = [v60 constraintWithItem:v18 attribute:8 relatedBy:0 constant:CGRectGetHeight(*(CGRect *)&v61)];
      goto LABEL_72;
  }
}

@end