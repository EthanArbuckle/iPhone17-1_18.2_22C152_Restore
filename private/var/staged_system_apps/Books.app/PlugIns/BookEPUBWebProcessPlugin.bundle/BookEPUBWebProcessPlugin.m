id CoalescedRectsForArray(void *a1, int a2, char a3, double a4)
{
  void *v6;
  id v7;
  double x;
  double y;
  double width;
  double height;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double MinX;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MaxY;
  double MinY;
  double v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *i;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *j;
  void *v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double MaxX;
  void *v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  void *v73;
  id v74;
  void *v75;
  id v77;
  id v78;
  uint64_t v79;
  id v80;
  void *v81;
  id obj;
  void *v83;
  double rect;
  double recta;
  long long v87;
  long long v88;
  long long v89;
  long long v90;
  long long v91;
  long long v92;
  long long v93;
  long long v94;
  long long v95;
  long long v96;
  long long v97;
  long long v98;
  long long v99;
  long long v100;
  long long v101;
  long long v102;
  unsigned char v103[128];
  unsigned char v104[128];
  unsigned char v105[128];
  unsigned char v106[128];
  uint64_t vars8;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;

  v77 = a1;
  if ((unint64_t)[v77 count] <= 1)
  {
    v6 = v77;
    v7 = v77;
    goto LABEL_66;
  }
  v7 = +[NSMutableArray array];
  v83 = +[NSMutableDictionary dictionary];
  v81 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v77 count]);
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v12 = v77;
  v13 = [v12 countByEnumeratingWithState:&v99 objects:v106 count:16];
  if (!v13) {
    goto LABEL_27;
  }
  v14 = *(void *)v100;
  do
  {
    v15 = 0;
    do
    {
      if (*(void *)v100 != v14) {
        objc_enumerationMutation(v12);
      }
      v16 = sub_2D38(*(void **)(*((void *)&v99 + 1) + 8 * (void)v15));
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v108.origin.x = x;
      v108.origin.y = y;
      v108.size.width = width;
      v108.size.height = height;
      if (CGRectIsNull(v108)) {
        goto LABEL_22;
      }
      rect = y;
      if (a2)
      {
        v23 = x;
        v109.origin.x = x;
        v109.origin.y = rect;
        v109.size.width = width;
        v109.size.height = height;
        MinX = CGRectGetMinX(v109);
        v110.origin.x = v16;
        v110.origin.y = v18;
        v110.size.width = v20;
        v110.size.height = v22;
        if (MinX - CGRectGetMinX(v110) >= 0.0)
        {
          v117.origin.x = v23;
          v117.origin.y = rect;
          v117.size.width = width;
          v117.size.height = height;
          v30 = CGRectGetMinX(v117);
          v118.origin.x = v16;
          v118.origin.y = v18;
          v118.size.width = v20;
          v118.size.height = v22;
          v26 = v30 - CGRectGetMinX(v118);
        }
        else
        {
          v111.origin.x = v23;
          v111.origin.y = rect;
          v111.size.width = width;
          v111.size.height = height;
          v25 = CGRectGetMinX(v111);
          v112.origin.x = v16;
          v112.origin.y = v18;
          v112.size.width = v20;
          v112.size.height = v22;
          v26 = -(v25 - CGRectGetMinX(v112));
        }
        v119.origin.x = v16;
        v119.origin.y = v18;
        v119.size.width = v20;
        v119.size.height = v22;
        if (v26 > CGRectGetWidth(v119) * 0.5) {
          goto LABEL_21;
        }
        v120.origin.x = v23;
        v120.origin.y = rect;
        v120.size.width = width;
        v120.size.height = height;
        MaxY = CGRectGetMaxY(v120);
        v121.origin.x = v16;
        v121.origin.y = v18;
        v121.size.width = v20;
        v121.size.height = v22;
        MinY = CGRectGetMinY(v121);
      }
      else
      {
        v23 = x;
        v113.origin.x = x;
        v113.origin.y = rect;
        v113.size.width = width;
        v113.size.height = height;
        v27 = CGRectGetMinY(v113);
        v114.origin.x = v16;
        v114.origin.y = v18;
        v114.size.width = v20;
        v114.size.height = v22;
        if (v27 - CGRectGetMinY(v114) >= 0.0)
        {
          v122.origin.x = v23;
          v122.origin.y = rect;
          v122.size.width = width;
          v122.size.height = height;
          v33 = CGRectGetMinY(v122);
          v123.origin.x = v16;
          v123.origin.y = v18;
          v123.size.width = v20;
          v123.size.height = v22;
          v29 = v33 - CGRectGetMinY(v123);
        }
        else
        {
          v115.origin.x = v23;
          v115.origin.y = rect;
          v115.size.width = width;
          v115.size.height = height;
          v28 = CGRectGetMinY(v115);
          v116.origin.x = v16;
          v116.origin.y = v18;
          v116.size.width = v20;
          v116.size.height = v22;
          v29 = -(v28 - CGRectGetMinY(v116));
        }
        v124.origin.x = v16;
        v124.origin.y = v18;
        v124.size.width = v20;
        v124.size.height = v22;
        if (v29 > CGRectGetHeight(v124) * 0.5)
        {
LABEL_21:
          v34 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v23, rect, width, height);
          [v81 addObject:v34];

LABEL_22:
          x = v16;
          y = v18;
          width = v20;
          height = v22;
          goto LABEL_23;
        }
        v125.origin.x = v23;
        v125.origin.y = rect;
        v125.size.width = width;
        v125.size.height = height;
        MaxY = CGRectGetMaxX(v125);
        v126.origin.x = v16;
        v126.origin.y = v18;
        v126.size.width = v20;
        v126.size.height = v22;
        MinY = CGRectGetMinX(v126);
      }
      if (MaxY < MinY) {
        goto LABEL_21;
      }
      v127.origin.x = v23;
      v127.origin.y = rect;
      v127.size.width = width;
      v127.size.height = height;
      v135.origin.x = v16;
      v135.origin.y = v18;
      v135.size.width = v20;
      v135.size.height = v22;
      v128 = CGRectUnion(v127, v135);
      x = v128.origin.x;
      y = v128.origin.y;
      width = v128.size.width;
      height = v128.size.height;
LABEL_23:
      v15 = (char *)v15 + 1;
    }
    while (v13 != v15);
    v35 = [v12 countByEnumeratingWithState:&v99 objects:v106 count:16];
    v13 = v35;
  }
  while (v35);
LABEL_27:

  v129.origin.x = x;
  v129.origin.y = y;
  v129.size.width = width;
  v129.size.height = height;
  if (!CGRectIsNull(v129))
  {
    v36 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height);
    [v81 addObject:v36];
  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = v81;
  v37 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
  if (v37)
  {
    v38 = *(void *)v96;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v96 != v38) {
          objc_enumerationMutation(obj);
        }
        v40 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        [v40 CGRectValue];
        v41 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:");
        v42 = [v83 objectForKey:v41];
        if (!v42)
        {
          v42 = +[NSMutableArray array];
          [v83 setObject:v42 forKey:v41];
        }
        [v42 addObject:v40];
      }
      v37 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
    }
    while (v37);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v78 = [v83 allValues];
  v43 = [v78 countByEnumeratingWithState:&v91 objects:v104 count:16];
  if (v43)
  {
    v79 = *(void *)v92;
    do
    {
      v80 = v43;
      for (j = 0; j != v80; j = (char *)j + 1)
      {
        if (*(void *)v92 != v79) {
          objc_enumerationMutation(v78);
        }
        v45 = *(void **)(*((void *)&v91 + 1) + 8 * (void)j);
        v46 = CGRectZero.origin.x;
        v47 = CGRectZero.origin.y;
        v48 = CGRectZero.size.width;
        v49 = CGRectZero.size.height;
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v50 = v45;
        v51 = [v50 countByEnumeratingWithState:&v87 objects:v103 count:16];
        if (v51)
        {
          v52 = *(void *)v88;
          do
          {
            v53 = 0;
            do
            {
              if (*(void *)v88 != v52) {
                objc_enumerationMutation(v50);
              }
              v54 = *(void **)(*((void *)&v87 + 1) + 8 * (void)v53);
              v130.origin.x = v46;
              v130.origin.y = v47;
              v130.size.width = v48;
              v130.size.height = v49;
              if (CGRectIsEmpty(v130))
              {
                [v54 CGRectValue];
LABEL_56:
                v46 = v55;
                v47 = v56;
                v48 = v57;
                v49 = v58;
                goto LABEL_57;
              }
              [v54 CGRectValue];
              v63 = v59;
              v64 = v60;
              v65 = v61;
              v66 = v62;
              if (a4 == 0.0) {
                goto LABEL_55;
              }
              if (a3)
              {
                recta = CGRectGetMinY(*(CGRect *)&v59);
                v131.origin.x = v46;
                v131.origin.y = v47;
                v131.size.width = v48;
                v131.size.height = v49;
                MaxX = CGRectGetMaxY(v131);
              }
              else
              {
                recta = CGRectGetMinX(*(CGRect *)&v59);
                v132.origin.x = v46;
                v132.origin.y = v47;
                v132.size.width = v48;
                v132.size.height = v49;
                MaxX = CGRectGetMaxX(v132);
              }
              if (recta - MaxX < a4)
              {
LABEL_55:
                v133.origin.x = v46;
                v133.origin.y = v47;
                v133.size.width = v48;
                v133.size.height = v49;
                v136.origin.x = v63;
                v136.origin.y = v64;
                v136.size.width = v65;
                v136.size.height = v66;
                *(CGRect *)&v55 = CGRectUnion(v133, v136);
                goto LABEL_56;
              }
              v68 = sub_2E44(v46, v47, v48, v49);
              [v7 addObject:v68];

              [v54 CGRectValue];
              v73 = sub_2E44(v69, v70, v71, v72);
              [v7 addObject:v73];

              v46 = CGRectZero.origin.x;
              v47 = CGRectZero.origin.y;
              v48 = CGRectZero.size.width;
              v49 = CGRectZero.size.height;
LABEL_57:
              v53 = (char *)v53 + 1;
            }
            while (v51 != v53);
            v74 = [v50 countByEnumeratingWithState:&v87 objects:v103 count:16];
            v51 = v74;
          }
          while (v74);
        }

        v134.origin.x = v46;
        v134.origin.y = v47;
        v134.size.width = v48;
        v134.size.height = v49;
        if (!CGRectIsEmpty(v134))
        {
          v75 = sub_2E44(v46, v47, v48, v49);
          [v7 addObject:v75];
        }
      }
      v43 = [v78 countByEnumeratingWithState:&v91 objects:v104 count:16];
    }
    while (v43);
  }

  v6 = v77;
LABEL_66:

  return v7;
}

void sub_2C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

double sub_2D38(void *a1)
{
  id v1 = a1;
  v2 = [v1 objectForKeyedSubscript:@"top"];
  [v2 doubleValue];

  v3 = [v1 objectForKeyedSubscript:@"left"];
  [v3 doubleValue];
  double v5 = v4;

  v6 = [v1 objectForKeyedSubscript:@"width"];
  [v6 doubleValue];

  v7 = [v1 objectForKeyedSubscript:@"height"];
  [v7 doubleValue];

  return v5;
}

void sub_2E0C(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

id sub_2E44(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v15.origin.x = a1;
  v15.origin.y = a2;
  v15.size.width = a3;
  v15.size.height = a4;
  v9 = +[NSNumber numberWithDouble:CGRectGetMinY(v15)];
  [v8 setObject:v9 forKeyedSubscript:@"top"];

  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  v10 = +[NSNumber numberWithDouble:CGRectGetMinX(v16)];
  [v8 setObject:v10 forKeyedSubscript:@"left"];

  v17.origin.x = a1;
  v17.origin.y = a2;
  v17.size.width = a3;
  v17.size.height = a4;
  v11 = +[NSNumber numberWithDouble:CGRectGetWidth(v17)];
  [v8 setObject:v11 forKeyedSubscript:@"width"];

  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  v12 = +[NSNumber numberWithDouble:CGRectGetHeight(v18)];
  [v8 setObject:v12 forKeyedSubscript:@"height"];

  return v8;
}

void sub_2FB0(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

id RectsFilteredOfDuplicates(void *a1, void *a2)
{
  id v3 = a1;
  id v56 = a2;
  if ((unint64_t)[v3 count] > 1)
  {
    sub_3544(v3, &v63);
    sub_3544(v56, &v61);
    __p = 0;
    v58 = 0;
    v60 = 0;
    if (v64 == v63)
    {
      uint64_t v27 = 0;
      v26 = 0;
    }
    else
    {
      uint64_t v5 = 0;
      if ((unint64_t)(((char *)v64 - (unsigned char *)v63) >> 5) <= 1) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = ((char *)v64 - (unsigned char *)v63) >> 5;
      }
      do
      {
        v7 = (double *)((char *)v63 + 32 * v5);
        CGFloat x = *v7;
        CGFloat y = v7[1];
        CGFloat width = v7[2];
        CGFloat height = v7[3];
        if (v62 != v61)
        {
          uint64_t v12 = 0;
          if ((unint64_t)((v62 - (unsigned char *)v61) >> 5) <= 1) {
            uint64_t v13 = 1;
          }
          else {
            uint64_t v13 = (v62 - (unsigned char *)v61) >> 5;
          }
          do
          {
            v70.origin.CGFloat x = x;
            v70.origin.CGFloat y = y;
            v70.size.CGFloat width = width;
            v70.size.CGFloat height = height;
            CGRect v66 = CGRectIntersection(*(CGRect *)((char *)v61 + v12), v70);
            v71.origin.CGFloat x = x;
            v71.origin.CGFloat y = y;
            v71.size.CGFloat width = width;
            v71.size.CGFloat height = height;
            if (CGRectEqualToRect(v66, v71))
            {
              CGFloat x = CGRectNull.origin.x;
              CGFloat y = CGRectNull.origin.y;
              CGFloat width = CGRectNull.size.width;
              CGFloat height = CGRectNull.size.height;
            }
            v12 += 32;
            --v13;
          }
          while (v13);
        }
        v67.origin.CGFloat x = x;
        v67.origin.CGFloat y = y;
        v67.size.CGFloat width = width;
        v67.size.CGFloat height = height;
        if (!CGRectIsNull(v67))
        {
          v14 = v58;
          if (v58 >= v60)
          {
            CGRect v16 = __p;
            uint64_t v17 = (v58 - __p) >> 5;
            unint64_t v18 = v17 + 1;
            if ((unint64_t)(v17 + 1) >> 59) {
              sub_379C();
            }
            uint64_t v19 = v60 - __p;
            if ((v60 - __p) >> 4 > v18) {
              unint64_t v18 = v19 >> 4;
            }
            if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v20 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v20 = v18;
            }
            if (v20)
            {
              v21 = (char *)sub_3844((uint64_t)&v60, v20);
              CGRect v16 = __p;
              v14 = v58;
            }
            else
            {
              v21 = 0;
            }
            v22 = (CGFloat *)&v21[32 * v17];
            CGFloat *v22 = x;
            v22[1] = y;
            v22[2] = width;
            v22[3] = height;
            if (v14 == v16)
            {
              v25 = &v21[32 * v17];
            }
            else
            {
              v23 = &v21[32 * v17];
              do
              {
                long long v24 = *((_OWORD *)v14 - 1);
                v25 = v23 - 32;
                *((_OWORD *)v23 - 2) = *((_OWORD *)v14 - 2);
                *((_OWORD *)v23 - 1) = v24;
                v14 -= 32;
                v23 -= 32;
              }
              while (v14 != v16);
            }
            CGRect v15 = (char *)(v22 + 4);
            __p = v25;
            v60 = &v21[32 * v20];
            if (v16) {
              operator delete(v16);
            }
          }
          else
          {
            *(CGFloat *)v58 = x;
            *((CGFloat *)v58 + 1) = y;
            CGRect v15 = v58 + 32;
            *((CGFloat *)v58 + 2) = width;
            *((CGFloat *)v58 + 3) = height;
          }
          v58 = v15;
        }
        ++v5;
      }
      while (v5 != v6);
      v26 = __p;
      uint64_t v27 = (uint64_t)v58;
    }
    sub_38B0((char *)&v63, v26, v27, (v27 - (uint64_t)v26) >> 5);
    do
    {
      uint64_t v28 = (uint64_t)__p;
      v59 = __p;
      char v29 = 0;
      if (v64 == v63)
      {
        v51 = __p;
      }
      else
      {
        uint64_t v30 = 0;
        if ((unint64_t)(((char *)v64 - (unsigned char *)v63) >> 5) <= 1) {
          uint64_t v31 = 1;
        }
        else {
          uint64_t v31 = ((char *)v64 - (unsigned char *)v63) >> 5;
        }
        do
        {
          v32 = (double *)((char *)v63 + 32 * v30);
          CGFloat v34 = *v32;
          CGFloat v33 = v32[1];
          CGFloat v36 = v32[2];
          CGFloat v35 = v32[3];
          if (v59 != __p)
          {
            uint64_t v37 = 0;
            if ((unint64_t)((v59 - __p) >> 5) <= 1) {
              uint64_t v38 = 1;
            }
            else {
              uint64_t v38 = (v59 - __p) >> 5;
            }
            do
            {
              v72.origin.CGFloat x = v34;
              v72.origin.CGFloat y = v33;
              v72.size.CGFloat width = v36;
              v72.size.CGFloat height = v35;
              CGRect v68 = CGRectIntersection(*(CGRect *)&__p[v37], v72);
              v73.origin.CGFloat x = v34;
              v73.origin.CGFloat y = v33;
              v73.size.CGFloat width = v36;
              v73.size.CGFloat height = v35;
              if (CGRectEqualToRect(v68, v73))
              {
                CGFloat v34 = CGRectNull.origin.x;
                CGFloat v33 = CGRectNull.origin.y;
                char v29 = 1;
                CGFloat v36 = CGRectNull.size.width;
                CGFloat v35 = CGRectNull.size.height;
              }
              v37 += 32;
              --v38;
            }
            while (v38);
          }
          v69.origin.CGFloat x = v34;
          v69.origin.CGFloat y = v33;
          v69.size.CGFloat width = v36;
          v69.size.CGFloat height = v35;
          if (!CGRectIsNull(v69))
          {
            v39 = v59;
            if (v59 >= v60)
            {
              v41 = __p;
              uint64_t v42 = (v59 - __p) >> 5;
              unint64_t v43 = v42 + 1;
              if ((unint64_t)(v42 + 1) >> 59) {
                sub_379C();
              }
              uint64_t v44 = v60 - __p;
              if ((v60 - __p) >> 4 > v43) {
                unint64_t v43 = v44 >> 4;
              }
              if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v45 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v45 = v43;
              }
              if (v45)
              {
                v46 = (char *)sub_3844((uint64_t)&v60, v45);
                v41 = __p;
                v39 = v59;
              }
              else
              {
                v46 = 0;
              }
              v47 = (CGFloat *)&v46[32 * v42];
              CGFloat *v47 = v34;
              v47[1] = v33;
              v47[2] = v36;
              v47[3] = v35;
              if (v39 == v41)
              {
                v50 = &v46[32 * v42];
              }
              else
              {
                v48 = &v46[32 * v42];
                do
                {
                  long long v49 = *((_OWORD *)v39 - 1);
                  v50 = v48 - 32;
                  *((_OWORD *)v48 - 2) = *((_OWORD *)v39 - 2);
                  *((_OWORD *)v48 - 1) = v49;
                  v39 -= 32;
                  v48 -= 32;
                }
                while (v39 != v41);
              }
              v40 = (char *)(v47 + 4);
              __p = v50;
              v60 = &v46[32 * v45];
              if (v41) {
                operator delete(v41);
              }
            }
            else
            {
              *(CGFloat *)v59 = v34;
              *((CGFloat *)v59 + 1) = v33;
              v40 = v59 + 32;
              *((CGFloat *)v59 + 2) = v36;
              *((CGFloat *)v59 + 3) = v35;
            }
            v59 = v40;
          }
          ++v30;
        }
        while (v30 != v31);
        v51 = __p;
        uint64_t v28 = (uint64_t)v59;
      }
      sub_38B0((char *)&v63, v51, v28, (v28 - (uint64_t)v51) >> 5);
    }
    while ((v29 & 1) != 0);
    id v4 = +[NSMutableArray array];
    v52 = (CGFloat *)v63;
    v53 = v64;
    while (v52 != v53)
    {
      v54 = sub_2E44(*v52, v52[1], v52[2], v52[3]);
      [v4 addObject:v54];

      v52 += 4;
    }
    if (__p) {
      operator delete(__p);
    }
    if (v61)
    {
      v62 = v61;
      operator delete(v61);
    }
    if (v63)
    {
      v64 = (CGFloat *)v63;
      operator delete(v63);
    }
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

void sub_34AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  if (a16) {
    operator delete(a16);
  }

  _Unwind_Resume(a1);
}

void sub_3544(void *a1@<X0>, void **a2@<X8>)
{
  id v3 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v31;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(id *)(*((void *)&v30 + 1) + 8 * (void)v7);
        double v9 = sub_2D38(v8);
        double v13 = v9;
        uint64_t v14 = v10;
        uint64_t v15 = v11;
        uint64_t v16 = v12;
        unint64_t v18 = (double *)a2[1];
        uint64_t v17 = (double *)a2[2];
        if (v18 >= v17)
        {
          unint64_t v20 = (double *)*a2;
          uint64_t v21 = ((char *)v18 - (unsigned char *)*a2) >> 5;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 59) {
            sub_379C();
          }
          uint64_t v23 = (char *)v17 - (char *)v20;
          if (v23 >> 4 > v22) {
            unint64_t v22 = v23 >> 4;
          }
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFE0) {
            unint64_t v24 = 0x7FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v22;
          }
          if (v24)
          {
            v25 = (char *)sub_3844((uint64_t)(a2 + 2), v24);
            unint64_t v20 = (double *)*a2;
            unint64_t v18 = (double *)a2[1];
          }
          else
          {
            v25 = 0;
          }
          v26 = &v25[32 * v21];
          *(double *)v26 = v13;
          *((void *)v26 + 1) = v14;
          *((void *)v26 + 2) = v15;
          *((void *)v26 + 3) = v16;
          if (v18 == v20)
          {
            char v29 = &v25[32 * v21];
          }
          else
          {
            uint64_t v27 = &v25[32 * v21];
            do
            {
              long long v28 = *((_OWORD *)v18 - 1);
              char v29 = v27 - 32;
              *((_OWORD *)v27 - 2) = *((_OWORD *)v18 - 2);
              *((_OWORD *)v27 - 1) = v28;
              v18 -= 4;
              v27 -= 32;
            }
            while (v18 != v20);
          }
          uint64_t v19 = v26 + 32;
          *a2 = v29;
          a2[1] = v26 + 32;
          a2[2] = &v25[32 * v24];
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          *unint64_t v18 = v9;
          *((void *)v18 + 1) = v10;
          uint64_t v19 = v18 + 4;
          *((void *)v18 + 2) = v11;
          *((void *)v18 + 3) = v12;
        }
        a2[1] = v19;

        v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v5);
  }
}

void sub_3758(_Unwind_Exception *a1)
{
  id v4 = *(void **)v2;
  if (*(void *)v2)
  {
    *(void *)(v2 + 8) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

void sub_379C()
{
}

void sub_37B4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_3810(exception, a1);
}

void sub_37FC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_3810(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_3844(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_387C();
  }
  return operator new(32 * a2);
}

void sub_387C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

char *sub_38B0(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  v7 = result;
  uint64_t v8 = *((void *)result + 2);
  double v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 5)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 59) {
      sub_379C();
    }
    uint64_t v10 = v8 >> 4;
    if (v8 >> 4 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    result = sub_39BC(v7, v11);
    double v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    double v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  uint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 5;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[32 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    double v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  void *v12 = &v9[v17];
  return result;
}

char *sub_39BC(void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_379C();
  }
  result = (char *)sub_3844((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

BOOL sub_5A3C(id a1, UIAccessibilityCustomAction *a2)
{
  return 1;
}

BOOL sub_5A60(id a1, UIAccessibilityCustomAction *a2)
{
  return 1;
}

uint64_t sub_5A84(uint64_t a1)
{
  return 1;
}

uint64_t sub_5AA8(uint64_t a1)
{
  return 1;
}

void sub_5CE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id sub_5D10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [*(id *)(a1 + 32) accessibilityElements];
  id v6 = [v5 mutableCopy];

  v7 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    UIAccessibilityTraits v12 = UIAccessibilityTraitHeader;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ((v12 & (unint64_t)objc_msgSend(v14, "accessibilityTraits", (void)v24)) != 0) {
          [v7 addObject:v14];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    unint64_t v15 = [WeakRetained baxStoredHeadingsRotorIndex];
    id v16 = [v15 integerValue];

    if (v16 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v17 = 0;
    }
    else {
      id v17 = v16;
    }
    if (objc_msgSend(v3, "searchDirection", (void)v24)) {
      unint64_t v18 = (unint64_t)v17 + 1;
    }
    else {
      unint64_t v18 = (unint64_t)v17 - 1;
    }
    uint64_t v19 = 0;
    if (v18 < (unint64_t)[v7 count])
    {
      uint64_t v19 = (char *)v18;
      if ((v18 & 0x8000000000000000) != 0) {
        uint64_t v19 = (char *)[v7 count] - 1;
      }
    }
    unint64_t v20 = +[NSNumber numberWithInteger:v19];
    [WeakRetained baxSetStoredHeadingsRotorIndex:v20];

    uint64_t v21 = [v7 objectAtIndexedSubscript:v19];
    id v22 = [objc_alloc((Class)UIAccessibilityCustomRotorItemResult) initWithTargetElement:v21 targetRange:0];
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

void sub_6088(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id sub_60B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = +[BEAccessibilityReadingState currentReadingState];
  id v6 = [v5 visibleAnnotations];

  if ([v6 count])
  {
    v7 = [WeakRetained baxStoredHighlightRotorIndex];
    id v8 = [v7 integerValue];

    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v9 = 0;
    }
    else {
      id v9 = v8;
    }
    if (objc_msgSend(v3, "searchDirection", v3)) {
      unint64_t v10 = (unint64_t)v9 + 1;
    }
    else {
      unint64_t v10 = (unint64_t)v9 - 1;
    }
    uint64_t v11 = 0;
    if (v10 < (unint64_t)[v6 count])
    {
      uint64_t v11 = (char *)v10;
      if ((v10 & 0x8000000000000000) != 0) {
        uint64_t v11 = (char *)[v6 count] - 1;
      }
    }
    UIAccessibilityTraits v12 = +[NSNumber numberWithInteger:v11];
    [WeakRetained baxSetStoredHighlightRotorIndex:v12];

    double v13 = [v6 objectAtIndexedSubscript:v11];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"startPoint"];
    unint64_t v15 = [v13 objectForKeyedSubscript:@"endPoint"];
    id v16 = [v14 objectAtIndexedSubscript:0];
    [v16 doubleValue];
    double v18 = v17;
    uint64_t v19 = [v14 objectAtIndexedSubscript:1];
    [v19 doubleValue];
    double v21 = v20;

    id v22 = [v15 objectAtIndexedSubscript:0];
    [v22 doubleValue];
    double v24 = v23;
    long long v25 = [v15 objectAtIndexedSubscript:1];
    [v25 doubleValue];
    double v27 = v26;

    long long v28 = [*(id *)(a1 + 32) accessibilityElements];
    char v29 = [v28 firstObject];
    long long v30 = [v29 referenceElement];

    long long v31 = [v30 textMarkerForPoint:v18, v21];
    uint64_t v32 = [v30 textMarkerForPoint:v24, v27];
    long long v33 = (void *)v32;
    CGFloat v34 = &__NSArray0__struct;
    if (v31 && v32)
    {
      v38[0] = v31;
      v38[1] = v32;
      CGFloat v34 = +[NSArray arrayWithObjects:v38 count:2];
    }
    id v35 = [objc_alloc((Class)UIAccessibilityCustomRotorItemResult) initWithTargetElement:v30 targetRange:0 targetTextMarkerRange:v34];

    id v3 = v37;
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

void sub_6580(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id sub_65BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained baxStoredVisibleLinkInfos];
  id v6 = [v5 sortedArrayUsingComparator:&stru_20708];
  if ([v6 count])
  {
    v7 = [WeakRetained baxStoredLinkRotorIndex];
    id v8 = [v7 integerValue];

    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v9 = 0;
    }
    else {
      id v9 = v8;
    }
    if ([v3 searchDirection]) {
      unint64_t v10 = (unint64_t)v9 + 1;
    }
    else {
      unint64_t v10 = (unint64_t)v9 - 1;
    }
    if ((v10 & 0x8000000000000000) != 0) {
      unint64_t v10 = (unint64_t)[*(id *)(a1 + 32) count] - 1;
    }
    if (v10 >= (unint64_t)[*(id *)(a1 + 32) count]) {
      unint64_t v10 = 0;
    }
    uint64_t v11 = +[NSNumber numberWithInteger:v10];
    [WeakRetained baxSetStoredLinkRotorIndex:v11];

    id v12 = objc_alloc_init((Class)UIAccessibilityCustomRotorItemResult);
    double v13 = [v6 objectAtIndex:v10];
    [v12 setTargetElement:v13];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

int64_t sub_6714(id a1, UIAccessibilityLinkSubelement *a2, UIAccessibilityLinkSubelement *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  id v6 = +[BEAccessibilityReadingState currentReadingState];
  unsigned int v7 = [v6 isTextHorizontal];

  [(UIAccessibilityLinkSubelement *)v4 accessibilityFrame];
  double v9 = v8;
  double v11 = v10;
  [(UIAccessibilityLinkSubelement *)v5 accessibilityFrame];
  if (v7)
  {
    if (v11 != v13)
    {
      [(UIAccessibilityLinkSubelement *)v4 accessibilityFrame];
      double v15 = v14;
      [(UIAccessibilityLinkSubelement *)v5 accessibilityFrame];
      if (v15 >= v16) {
        int64_t v17 = 1;
      }
      else {
        int64_t v17 = -1;
      }
      goto LABEL_16;
    }
LABEL_7:
    int64_t v17 = 0;
    goto LABEL_16;
  }
  if (v9 == v12) {
    goto LABEL_7;
  }
  double v18 = +[BEAccessibilityReadingState currentReadingState];
  unsigned int v19 = [v18 isRTL];

  [(UIAccessibilityLinkSubelement *)v4 accessibilityFrame];
  double v21 = v20;
  [(UIAccessibilityLinkSubelement *)v5 accessibilityFrame];
  uint64_t v23 = -1;
  if (v21 >= v22) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = -1;
  }
  if (v21 < v22) {
    uint64_t v23 = 1;
  }
  if (v19) {
    int64_t v17 = v23;
  }
  else {
    int64_t v17 = v24;
  }
LABEL_16:

  return v17;
}

void sub_6C2C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accessibilityElements];
  id v3 = [v2 lastObject];
  uint64_t v4 = [v3 referenceElement];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    unsigned int v7 = objc_opt_class();
    v13.receiver = *(id *)(a1 + 32);
    v13.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
    double v8 = [super accessibilityElements];
    double v9 = [v8 firstObject];
    __BAXCastAsSafeCategory(v7, v9, 0, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v10 = [*(id *)(a1 + 40) dataUsingEncoding:4];
  if (v6) {
    BEAXPostWebProcessNotification(v6, *(unsigned int *)(a1 + 48), v10);
  }
  double v11 = +[BEAccessibilityReadingState currentReadingState];
  [v11 setDelayForDocumentChanged:0];

  double v12 = +[BEAccessibilityReadingState currentReadingState];
  [v12 setNewDocumentFinishedLoading:0];
}

void sub_7EB0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _baxIsSettingSelectionTimer];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) _baxIsSettingSelectionTimer];
    [v3 invalidate];
  }
  id v4 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&stru_20770 block:1.0];
  [*(id *)(a1 + 32) _baxSetIsSettingSelectionTimer:v4];
}

void sub_7F4C(id a1, NSTimer *a2)
{
}

void sub_9114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_9150(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = [a1[4] baxStoredLinkInfos];
  id v6 = [WeakRetained visibleLinkElements:v5];

  if ([v6 count])
  {
    unsigned int v7 = [WeakRetained baxStoredLinkRotorIndex];
    id v8 = [v7 integerValue];

    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v9 = 0;
    }
    else {
      id v9 = v8;
    }
    if ([v3 searchDirection]) {
      unint64_t v10 = (unint64_t)v9 + 1;
    }
    else {
      unint64_t v10 = (unint64_t)v9 - 1;
    }
    if ((v10 & 0x8000000000000000) != 0) {
      unint64_t v10 = (unint64_t)[a1[5] count] - 1;
    }
    if (v10 >= (unint64_t)[a1[5] count]) {
      unint64_t v10 = 0;
    }
    double v11 = +[NSNumber numberWithInteger:v10];
    [WeakRetained baxSetStoredLinkRotorIndex:v11];

    id v12 = objc_alloc_init((Class)UIAccessibilityCustomRotorItemResult);
    objc_super v13 = [v6 objectAtIndex:v10];
    [v12 setTargetElement:v13];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void sub_93B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_93DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = +[BEAccessibilityReadingState currentReadingState];
  id v6 = [v5 visibleAnnotations];

  if ([v6 count])
  {
    unsigned int v7 = [WeakRetained baxStoredLinkRotorIndex];
    id v8 = [v7 integerValue];

    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v9 = 0;
    }
    else {
      id v9 = v8;
    }
    if ([v3 searchDirection]) {
      unint64_t v10 = (unint64_t)v9 + 1;
    }
    else {
      unint64_t v10 = (unint64_t)v9 - 1;
    }
    double v11 = 0;
    if (v10 < (unint64_t)[v6 count])
    {
      double v11 = (char *)v10;
      if ((v10 & 0x8000000000000000) != 0) {
        double v11 = (char *)[v6 count] - 1;
      }
    }
    id v12 = +[NSNumber numberWithInteger:v11];
    [WeakRetained baxSetStoredLinkRotorIndex:v12];

    objc_super v13 = [v6 objectAtIndexedSubscript:v11];
    double v14 = [v13 objectForKeyedSubscript:@"startPoint"];
    double v15 = [v13 objectForKeyedSubscript:@"endPoint"];
    double v16 = [v14 objectAtIndexedSubscript:0];
    [v16 doubleValue];
    double v18 = v17 + 1.0;
    v50 = v14;
    unsigned int v19 = [v14 objectAtIndexedSubscript:1];
    [v19 doubleValue];
    double v21 = v20 + 1.0;

    double v22 = [v15 objectAtIndexedSubscript:0];
    [v22 doubleValue];
    double v24 = v23 + -1.0;
    long long v49 = v15;
    long long v25 = [v15 objectAtIndexedSubscript:1];
    [v25 doubleValue];
    double v27 = v26 + -1.0;

    long long v28 = [WeakRetained baxBookContentElement];
    char v29 = [v28 textMarkerForPoint:v18, v21];

    long long v30 = [WeakRetained baxBookContentElement];
    long long v31 = [v30 textMarkerForPoint:v24, v27];

    uint64_t v32 = [WeakRetained baxBookContentElement];
    long long v33 = [v32 positionForTextMarker:v29];

    CGFloat v34 = [WeakRetained baxBookContentElement];
    id v35 = [v34 positionForTextMarker:v31];

    CGFloat v36 = [WeakRetained baxBookContentElement];
    uint64_t v37 = [v36 _stringFromStartMarker:v29 toEndMarker:v31 attributed:0];

    v51 = v13;
    uint64_t v38 = [v13 objectForKeyedSubscript:@"text"];
    id v52 = v3;
    if (v37)
    {
      id v39 = [v37 rangeOfString:v38];
      if (v39 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v35 = &v33[(void)v39 + v40];
        long long v33 = &v33[(void)v39];
      }
    }
    v41 = [WeakRetained baxBookContentElement];
    uint64_t v42 = +[BEAXWebContentUtilities visibleTextRangeInChapterForBookContentElement:v41];

    int64_t v43 = v33 - v42;
    int64_t v44 = v35 - v33;
    id v45 = objc_alloc((Class)UIAccessibilityCustomRotorItemResult);
    v46 = [WeakRetained baxBookContentElement];
    id v47 = [v45 initWithTargetElement:v46 targetRange:0];

    [v47 setTargetNSRange:v43, v44];
    id v3 = v52;
  }
  else
  {
    id v47 = 0;
  }

  return v47;
}

void sub_9CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_9CEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_9CFC(uint64_t a1)
{
}

void sub_9D04(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lineRectsForTextMarkerRange:*(void *)(a1 + 40)];
    _objc_release_x1();
  }
  else
  {
    [*(id *)(a1 + 32) frameForTextMarkers:*(void *)(a1 + 40)];
    uint64_t v2 = +[NSValue valueWithRect:](NSValue, "valueWithRect:");
    id v6 = v2;
    uint64_t v3 = +[NSArray arrayWithObjects:&v6 count:1];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

BOOL sub_A624(id a1, UIAccessibilityCustomAction *a2)
{
  return 1;
}

void sub_A984(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _baxIsTurning] & 1) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = UIAccessibilityPageScrolledNotification;
    id v4 = [v2 _axPageScrollString];
    [v2 accessibilityOverrideProcessNotification:v3 notificationData:v4];
  }
}

uint64_t sub_B2C0(uint64_t a1, int a2)
{
  id v4 = _BookEPUBWebProcessPluginLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v13 = 67109378;
    LODWORD(v14[0]) = a2;
    WORD2(v14[0]) = 2114;
    *(void *)((char *)v14 + 6) = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Received match state: %d for #fontFamily '%{public}@'", (uint8_t *)&v13, 0x12u);
  }

  if ((a2 - 3) < 3)
  {
LABEL_6:
    id v6 = _BookEPUBWebProcessPluginLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v13 = 67240450;
      LODWORD(v14[0]) = a2;
      WORD2(v14[0]) = 2114;
      *(void *)((char *)v14 + 6) = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Error state:%{public}u registering #fontFamily:'%{public}@'", (uint8_t *)&v13, 0x12u);
    }

    CFRelease(*(CFTypeRef *)(a1 + 48));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    return 0;
  }
  if (a2 != 1)
  {
    if (a2 != 8) {
      return 1;
    }
    goto LABEL_6;
  }
  unint64_t v10 = _BookEPUBWebProcessPluginLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v13 = 138543362;
    v14[0] = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Completed matching #fontFamily '%{public}@'", (uint8_t *)&v13, 0xCu);
  }

  CFRelease(*(CFTypeRef *)(a1 + 48));
  id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  uint64_t v8 = 1;
  v12();
  return v8;
}

id BEAXWebNotificationWithName(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_CDD4();
  uint64_t v3 = [v2 valueForKey:v1];

  return v3;
}

id sub_CDD4()
{
  if (qword_271F8 != -1) {
    dispatch_once(&qword_271F8, &stru_20898);
  }
  v0 = (void *)qword_271F0;

  return v0;
}

id BEAXWebNotificationName(void *a1)
{
  id v1 = a1;
  sub_CDD4();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = [v2 objectForKeyedSubscript:v6];
        unsigned __int8 v8 = [v7 isEqual:v1];

        if (v8)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

void BEAXPostWebProcessNotification(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = +[NSNumber numberWithUnsignedInt:a2];
  unsigned __int8 v8 = BEAXWebNotificationName(v7);

  if (objc_opt_respondsToSelector())
  {
    [v5 accessibilityOverrideProcessNotification:v8 notificationData:v6];
  }
  else
  {
    id v9 = _BookEPUBWebProcessPluginLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = NSStringFromSelector("accessibilityOverrideProcessNotification:notificationData:");
      int v11 = 138543362;
      long long v12 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Attempting to call selector '%{public}@'", (uint8_t *)&v11, 0xCu);
    }
  }
}

void sub_D1B0(id a1)
{
  id v1 = (void *)qword_271F0;
  qword_271F0 = (uint64_t)&off_21A10;
}

uint64_t BEBooksWebKitAccessibility()
{
  return _os_feature_enabled_impl();
}

void sub_D27C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_27208;
  qword_27208 = (uint64_t)v1;

  if (_AXSApplicationAccessibilityEnabled()) {
    [(id)qword_27208 loadAccessibilitySupportWithDelay];
  }
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:qword_27208 selector:"loadAccessibilitySupportWithDelay" name:kAXSApplicationAccessibilityEnabledNotification object:0];
}

id sub_D478(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadAccessibilitySupport];
}

void BAXPerformBlockOnMainThread(void *a1)
{
  block = a1;
  if (+[NSThread isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void BAXPerformBlockAsynchronouslyOnMainThread(dispatch_block_t block)
{
}

void BAXPerformBlockOnMainThreadAfterDelay(void *a1, double a2)
{
  int64_t v2 = (uint64_t)(a2 * 1000000000.0);
  dispatch_block_t block = a1;
  dispatch_time_t v3 = dispatch_time(0, v2);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_D73C(uint64_t a1)
{
  qword_27218 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_E144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_E15C(uint64_t a1, uint64_t a2)
{
  id v14 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v4 = +[BEAccessibilityReadingState currentReadingState];
  id v5 = (char *)[v4 bookLayout];

  [v14 frameInScreenCoordinates];
  if (v5 == (unsigned char *)&dword_0 + 3)
  {
    if (CGRectGetMinY(*(CGRect *)&v6) > *(double *)(a1 + 56)) {
      goto LABEL_8;
    }
    [v14 frameCenterPoint];
    v16.CGFloat x = v10;
    v16.CGFloat y = v11;
    if (!CGRectContainsPoint(*(CGRect *)(a1 + 64), v16)) {
      goto LABEL_8;
    }
LABEL_7:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 - *(void *)(a1 + 96);
    goto LABEL_8;
  }
  if (CGRectGetMinX(*(CGRect *)&v6) <= *(double *)(a1 + 48))
  {
    [v14 frameCenterPoint];
    v17.CGFloat x = v12;
    v17.CGFloat y = v13;
    if (CGRectContainsPoint(*(CGRect *)(a1 + 64), v17)) {
      goto LABEL_7;
    }
  }
LABEL_8:
}

void sub_EEB4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v16 = a2;
  uint64_t v7 = objc_opt_class();
  unsigned __int8 v8 = __BAXCastAsSafeCategory(v7, v16, 0, 0);
  id v9 = [v8 baxAttachmentElement];
  if (v9)
  {
    [*(id *)(a1 + 32) addAttribute:UIAccessibilityTokenAttachment value:v9 range:a3, a4];
  }
  else if (BAXShouldPerformValidationChecks())
  {
    int v10 = BAXShouldCrashOnValidationErrorAfterLaunch();
    if (__BAXHandleValidationErrorWithDescription(v10, 0, @"We probably need to handle attachments like this one: %@", v11, v12, v13, v14, v15, *(void *)(a1 + 40)))abort(); {
  }
    }
}

void sub_F240(void *a1, NSUInteger *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = (char *)[v5 accessibilityElementCount];
  if ((uint64_t)v7 < 1) {
    goto LABEL_21;
  }
  unsigned __int8 v8 = v7;
  id v9 = 0;
  uint64_t v38 = v7;
  id v39 = v5;
  do
  {
    int v10 = [v5 accessibilityElementAtIndex:v9];
    if ((uint64_t)[v10 accessibilityElementCount] >= 1)
    {
      sub_F240(v10, a2, v6);
      goto LABEL_20;
    }
    uint64_t v40 = v9;
    uint64_t v11 = [v10 lineRectsAndText];
    v41 = v10;
    *a2 = (NSUInteger)[v10 elementTextRange];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v11;
    id v12 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (!v12) {
      goto LABEL_19;
    }
    id v13 = v12;
    uint64_t v14 = *(void *)v44;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        CGPoint v17 = [v16 valueForKey:@"text"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = [objc_alloc((Class)NSAttributedString) initWithString:v17];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_17;
          }
          id v18 = v17;
        }
        unsigned int v19 = v18;
        NSUInteger v20 = *a2;
        id v21 = [v18 length];
        *a2 += (NSUInteger)[v19 length];
        double v22 = [v16 valueForKey:@"rect"];
        [v22 CGRectValue];
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;

        +[BEAXLineInfo addOffsetForPoint:](BEAXLineInfo, "addOffsetForPoint:", v24, v26);
        double v32 = v31;
        double v34 = v33;
        id v35 = [v6 lastObject];
        v49.location = (NSUInteger)[v35 rangeInChapter];
        v49.length = v36;
        v48.location = v20;
        v48.length = (NSUInteger)v21;
        if (!NSIntersectionRange(v48, v49).length)
        {
          uint64_t v37 = -[BEAXLineInfo initWithRange:frame:attributedText:element:]([BEAXLineInfo alloc], "initWithRange:frame:attributedText:element:", v20, v21, v19, v41, v32, v34, v28, v30);
          [v6 addObject:v37];
        }
LABEL_17:
      }
      id v13 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v13);
LABEL_19:

    unsigned __int8 v8 = v38;
    id v5 = v39;
    id v9 = v40;
    int v10 = v41;
LABEL_20:

    ++v9;
  }
  while (v9 != v8);
LABEL_21:
}

void sub_108CC(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) _baxIsSettingSelectionTimer];

  if (v2)
  {
    dispatch_time_t v3 = [*(id *)(a1 + 32) _baxIsSettingSelectionTimer];
    [v3 invalidate];
  }
  id v4 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&stru_20928 block:1.0];
  [*(id *)(a1 + 32) _baxSetIsSettingSelectionTimer:v4];
}

void sub_10968(id a1, NSTimer *a2)
{
}

uint64_t sub_10E54(uint64_t a1)
{
  qword_27230 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id _BookEPUBWebProcessPluginLog()
{
  if (qword_27240 != -1) {
    dispatch_once(&qword_27240, &stru_20948);
  }
  v0 = (void *)qword_27238;

  return v0;
}

void sub_116C8(id a1)
{
  qword_27238 = (uint64_t)os_log_create("com.apple.iBooks", "BookEPUBWebProcessPlugin");

  _objc_release_x1();
}

id BookEPUBWebProcessPluginRectFilteringLog()
{
  if (qword_27250 != -1) {
    dispatch_once(&qword_27250, &stru_20968);
  }
  v0 = (void *)qword_27248;

  return v0;
}

void sub_11760(id a1)
{
  qword_27248 = (uint64_t)os_log_create("com.apple.iBooks", "RectFiltering");

  _objc_release_x1();
}

uint64_t sub_11818()
{
  return 1;
}

JSValue *__cdecl sub_11820(id a1, JSValue *a2, JSValue *a3, JSValue *a4, JSValue *a5, JSValue *a6)
{
  uint64_t v7 = a3;
  unsigned __int8 v8 = a2;
  id v9 = [(JSValue *)v8 toArray];
  int v10 = [(JSValue *)v7 toArray];

  uint64_t v11 = RectsFilteredOfDuplicates(v9, v10);

  id v12 = [(JSValue *)v8 context];

  id v13 = +[JSValue valueWithObject:v11 inContext:v12];

  return (JSValue *)v13;
}

uint64_t BAXShouldPerformValidationChecks()
{
  if (qword_27258 != -1) {
    dispatch_once(&qword_27258, &stru_209F8);
  }
  return 0;
}

uint64_t __BAXHandleValidationErrorWithDescription(int a1, int a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a3;
  id v12 = [objc_alloc((Class)NSString) initWithFormat:v11 arguments:&a9];

  NSLog(@"*** BAX validation error: %@", v12);
  int v13 = a1 ^ 1;
  if (!v12) {
    int v13 = 1;
  }
  uint64_t v14 = v13 ^ 1u;
  if ((v13 & 1) == 0 && a2)
  {
    if (qword_27270 != -1) {
      dispatch_once(&qword_27270, &stru_20A58);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t BAXShouldCrashOnValidationErrorAfterLaunch()
{
  if (qword_27268 != -1) {
    dispatch_once(&qword_27268, &stru_20A38);
  }
  return 0;
}

uint64_t __BAXPerformSafeBlock(void *a1)
{
  id v1 = a1;
  v1[2]();

  return 0;
}

id __BAXCastAsSafeCategory(void *a1, void *a2, int a3, unsigned char *a4)
{
  id v7 = a2;
  if (!v7)
  {
    id v12 = 0;
    goto LABEL_22;
  }
  unsigned __int8 v8 = [a1 baxTargetClassName];
  id v9 = v8;
  if (!a3)
  {
    if (!v8 || !NSClassFromString(v8)) {
      goto LABEL_20;
    }
    char isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_18;
  }
  if (qword_27258 == -1)
  {
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  dispatch_once(&qword_27258, &stru_209F8);
  if (a4) {
LABEL_5:
  }
    *a4 = 0;
LABEL_6:
  if (!v9)
  {
LABEL_20:
    id v12 = 0;
    goto LABEL_21;
  }
  Class v10 = NSClassFromString(v9);
  if (qword_27258 == -1)
  {
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v15 = v10;
  dispatch_once(&qword_27258, &stru_209F8);
  Class v10 = v15;
  if (a4) {
LABEL_9:
  }
    *a4 = 0;
LABEL_10:
  if (!v10) {
    goto LABEL_20;
  }
  char isKindOfClass = objc_opt_isKindOfClass();
  if (qword_27258 == -1)
  {
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  char v14 = isKindOfClass;
  dispatch_once(&qword_27258, &stru_209F8);
  char isKindOfClass = v14;
  if (a4) {
LABEL_13:
  }
    *a4 = 0;
LABEL_18:
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_20;
  }
  id v12 = v7;
LABEL_21:

LABEL_22:

  return v12;
}

id __BAXCastAsClass(uint64_t a1, void *a2, int a3, unsigned char *a4)
{
  id v6 = a2;
  if (!v6) {
    goto LABEL_8;
  }
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a3)
  {
    if (qword_27258 == -1)
    {
      if (!a4) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    dispatch_once(&qword_27258, &stru_209F8);
    if (a4) {
LABEL_5:
    }
      *a4 = 0;
  }
LABEL_6:
  if (isKindOfClass)
  {
    id v8 = v6;
    goto LABEL_9;
  }
LABEL_8:
  id v8 = 0;
LABEL_9:

  return v8;
}

id __BAXCastAsProtocol(void *a1, void *a2, int a3, unsigned char *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = v8;
  if (!v8) {
    goto LABEL_8;
  }
  unsigned int v10 = [v8 conformsToProtocol:v7];
  if (a3)
  {
    if (qword_27258 == -1)
    {
      if (!a4) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    dispatch_once(&qword_27258, &stru_209F8);
    if (a4) {
LABEL_5:
    }
      *a4 = 0;
  }
LABEL_6:
  if (v10)
  {
    id v11 = v9;
    goto LABEL_9;
  }
LABEL_8:
  id v11 = 0;
LABEL_9:

  return v11;
}

void BAXInstallSafeCategory(NSString *a1)
{
  Class v1 = NSClassFromString(a1);
  Class v2 = v1;
  if (qword_27258 == -1)
  {
    if (!v1) {
      return;
    }
  }
  else
  {
    dispatch_once(&qword_27258, &stru_209F8);
    if (!v2) {
      return;
    }
  }

  [(objc_class *)v2 performSelector:"_baxInitializeSafeCategory"];
}

uint64_t BAXShouldCrashOnValidationError()
{
  if (qword_27260 != -1) {
    dispatch_once(&qword_27260, &stru_20A18);
  }
  return 0;
}

void BAXInstallSafeCategories(void *a1)
{
  id v1 = a1;
  id v2 = [v1 count];
  if (!v2) {
    goto LABEL_27;
  }
  __base = (char *)malloc_type_malloc(40 * (void)v2, 0x800402FCC0CB6uLL);
  if (!__base) {
    goto LABEL_27;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v27 = v1;
  id obj = v1;
  id v3 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v3)
  {
    size_t v5 = 0;
    goto LABEL_23;
  }
  id v4 = v3;
  size_t v5 = 0;
  uint64_t v6 = *(void *)v35;
  do
  {
    id v7 = 0;
    do
    {
      if (*(void *)v35 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(NSString **)(*((void *)&v34 + 1) + 8 * (void)v7);
      Class v9 = NSClassFromString(v8);
      Class v10 = v9;
      if (qword_27258 == -1)
      {
        if (!v9) {
          goto LABEL_14;
        }
LABEL_10:
        id v11 = [(objc_class *)v10 baxTargetClassName];
        Class v12 = NSClassFromString(v11);
        Class v13 = v12;
        if (qword_27258 == -1)
        {
          if (v12) {
            goto LABEL_12;
          }
        }
        else
        {
          dispatch_once(&qword_27258, &stru_209F8);
          if (v13)
          {
LABEL_12:
            char v14 = (id *)&__base[40 * v5];
            id *v14 = v10;
            objc_storeStrong(v14 + 1, v8);
            uint64_t v15 = sub_128D0(v10, v8);
            id v16 = v14[2];
            void v14[2] = (id)v15;

            v14[3] = v13;
            uint64_t v17 = sub_128D0(v13, v11);
            id v18 = v14[4];
            v14[4] = (id)v17;

            ++v5;
          }
        }

        goto LABEL_14;
      }
      dispatch_once(&qword_27258, &stru_209F8);
      if (v10) {
        goto LABEL_10;
      }
LABEL_14:
      id v7 = (char *)v7 + 1;
    }
    while (v4 != v7);
    id v19 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    id v4 = v19;
  }
  while (v19);
LABEL_23:

  NSUInteger v20 = objc_opt_new();
  id v21 = objc_opt_new();
  double v22 = objc_opt_new();
  __compar[0] = _NSConcreteStackBlock;
  __compar[1] = 3221225472;
  __compar[2] = sub_12994;
  __compar[3] = &unk_209D8;
  id v23 = v20;
  id v31 = v23;
  id v24 = v21;
  id v32 = v24;
  id v25 = v22;
  id v33 = v25;
  qsort_b(__base, v5, 0x28uLL, __compar);
  if (v5)
  {
    double v26 = __base;
    do
    {
      [*(id *)v26 _baxInstallSafeCategoryOnClass:*(void *)v26 + 3 v27];
      v26 += 40;
      --v5;
    }
    while (v5);
  }
  free(__base);

  id v1 = v27;
LABEL_27:
}

id sub_128D0(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSMutableString) initWithString:v3];
  size_t v5 = (objc_class *)[a1 superclass];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      [v4 insertString:@"," atIndex:0];
      id v7 = NSStringFromClass(v6);
      [v4 insertString:v7 atIndex:0];

      uint64_t v6 = (objc_class *)[(objc_class *)v6 superclass];
    }
    while (v6);
  }

  return v4;
}

uint64_t sub_12994(void **a1, void **a2, uint64_t a3)
{
  uint64_t result = (uint64_t)[a2[4] compare:*(void *)(a3 + 32)];
  if (!result)
  {
    if (sub_12A20(a2, a3, a1[4], a1[5], a1[6]))
    {
      return 1;
    }
    else if (sub_12A20((void **)a3, (uint64_t)a2, a1[4], a1[5], a1[6]))
    {
      return -1;
    }
    else
    {
      return (uint64_t)[a2[2] compare:*(void *)(a3 + 16)];
    }
  }
  return result;
}

uint64_t sub_12A20(void **a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  sub_141D0(*a1, v9, v10, v11);
  char v12 = 0;
  while ([v9 count])
  {
    Class v13 = [v9 objectAtIndex:0];
    [v9 removeObjectAtIndex:0];
    [v11 addObject:v13];
    if ([(NSString *)v13 isEqualToString:*(void *)(a2 + 8)])
    {
      [v9 removeAllObjects];
      char v12 = 1;
    }
    else
    {
      Class v14 = NSClassFromString(v13);
      sub_141D0(v14, v9, v10, v11);
    }
  }
  [v11 removeAllObjects];

  return v12 & 1;
}

id BAXLocString(void *a1)
{
  id v1 = a1;
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:v1 value:&stru_20BB8 table:@"Accessibility"];

  if (v3 == v1)
  {
    if (qword_27258 != -1) {
      dispatch_once(&qword_27258, &stru_209F8);
    }

    id v3 = 0;
  }

  return v3;
}

void sub_1300C(id a1)
{
  if (qword_27260 != -1) {
    dispatch_once(&qword_27260, &stru_20A18);
  }
}

void sub_13038(id a1)
{
  if (qword_27260 != -1) {
    dispatch_once(&qword_27260, &stru_20A18);
  }
}

void sub_13060(id a1)
{
}

void sub_13074(id a1)
{
}

void __BAXValidateMethodSignature(int a1, int a2, int a3, Method m, uint64_t a5, void *a6)
{
  if (!m) {
    return;
  }
  id v7 = method_copyReturnType(m);
  id v8 = v7;
  if (qword_27258 != -1)
  {
    dispatch_once(&qword_27258, &stru_209F8);
    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v7) {
LABEL_4:
  }
    free(v8);
LABEL_5:
  unsigned int NumberOfArguments = method_getNumberOfArguments(m);
  if (NumberOfArguments != 2)
  {
    unsigned int v10 = NumberOfArguments;
    unsigned int v11 = 2;
    while (1)
    {
      char v12 = a6++;
      if (!*v12) {
        goto LABEL_15;
      }
      Class v13 = method_copyArgumentType(m, v11);
      Class v14 = v13;
      if (qword_27258 != -1) {
        break;
      }
      if (v13) {
        goto LABEL_10;
      }
LABEL_11:
      if (v10 == ++v11) {
        goto LABEL_15;
      }
    }
    dispatch_once(&qword_27258, &stru_209F8);
    if (!v14) {
      goto LABEL_11;
    }
LABEL_10:
    free(v14);
    goto LABEL_11;
  }
LABEL_15:
  if (qword_27258 != -1) {
    dispatch_once(&qword_27258, &stru_209F8);
  }
}

void __BAXValidateSymbol(char *__symbol)
{
  if (!dlsym(&dword_8, __symbol))
  {
    dlsym((void *)0xFFFFFFFFFFFFFFFELL, __symbol);
    if (qword_27258 != -1)
    {
      dispatch_once(&qword_27258, &stru_209F8);
    }
  }
}

void __BAXValidateClassMethod(NSString *a1, void *a2)
{
  id v3 = a2;
  id v4 = NSClassFromString(a1);
  size_t v5 = NSSelectorFromString(v3);

  class_getClassMethod(v4, v5);
  if (qword_27258 != -1)
  {
    dispatch_once(&qword_27258, &stru_209F8);
  }
}

void __BAXValidateClassMethodComplete(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v10 = a2;
  unsigned int v11 = a1;
  char v12 = NSClassFromString(v11);
  if (qword_27258 != -1) {
    dispatch_once(&qword_27258, &stru_209F8);
  }
  Class v13 = NSSelectorFromString(v10);
  Method ClassMethod = class_getClassMethod(v12, v13);
  id v18 = ClassMethod;
  if (qword_27258 != -1) {
    dispatch_once(&qword_27258, &stru_209F8);
  }
  __BAXValidateMethodSignature((int)ClassMethod, v15, v16, v18, v17, &a9);
}

void __BAXValidateIsKindOfClass(NSString *a1, void *a2)
{
  aClassName = a2;
  id v3 = NSClassFromString(a1);
  Class v4 = NSClassFromString(aClassName);
  if (v3)
  {
    size_t v5 = v4;
    if (v4)
    {
      do
      {
        Class Superclass = class_getSuperclass(v3);
        if (!Superclass) {
          break;
        }
        id v3 = Superclass;
      }
      while (Superclass != v5);
    }
  }
  if (qword_27258 != -1) {
    dispatch_once(&qword_27258, &stru_209F8);
  }
}

void __BAXValidateIvarType(NSString *a1, const char *a2)
{
  id v3 = NSClassFromString(a1);
  InstanceVariable = class_getInstanceVariable(v3, a2);
  ivar_getTypeEncoding(InstanceVariable);
  if (qword_27258 != -1)
  {
    dispatch_once(&qword_27258, &stru_209F8);
  }
}

void __BAXValidateInstanceMethod(NSString *a1, void *a2)
{
  id v3 = a2;
  Class v4 = NSClassFromString(a1);
  size_t v5 = NSSelectorFromString(v3);

  class_getInstanceMethod(v4, v5);
  unsigned int outCount = 0;
  uint64_t v6 = class_copyMethodList(v4, &outCount);
  if (v6) {
    free(v6);
  }
  if (qword_27258 != -1) {
    dispatch_once(&qword_27258, &stru_209F8);
  }
}

void __BAXValidateInstanceMethodComplete(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v10 = a2;
  unsigned int v11 = a1;
  char v12 = NSClassFromString(v11);
  if (qword_27258 != -1) {
    dispatch_once(&qword_27258, &stru_209F8);
  }
  Class v13 = NSSelectorFromString(v10);
  Method InstanceMethod = class_getInstanceMethod(v12, v13);
  id v18 = InstanceMethod;
  if (qword_27258 != -1) {
    dispatch_once(&qword_27258, &stru_209F8);
  }
  __BAXValidateMethodSignature((int)InstanceMethod, v15, v16, v18, v17, &a9);
}

void __BAXValidateProperty(NSString *a1, const char *a2)
{
  id v3 = NSClassFromString(a1);
  if (qword_27258 != -1) {
    dispatch_once(&qword_27258, &stru_209F8);
  }
  class_getProperty(v3, a2);
  if (qword_27258 != -1)
  {
    dispatch_once(&qword_27258, &stru_209F8);
  }
}

void __BAXValidateClass(NSString *a1)
{
  id v1 = NSClassFromString(a1);
  class_getName(v1);
  if (qword_27258 != -1)
  {
    dispatch_once(&qword_27258, &stru_209F8);
  }
}

void __BAXValidateIvar(NSString *a1, const char *a2)
{
  id v3 = NSClassFromString(a1);
  class_getInstanceVariable(v3, a2);
  if (qword_27258 != -1)
  {
    dispatch_once(&qword_27258, &stru_209F8);
  }
}

void __BAXValidateProtocolProperty(NSString *a1, const char *a2)
{
  NSProtocolFromString(a1);
  id v3 = (Protocol *)objc_claimAutoreleasedReturnValue();
  protocol_getProperty(v3, a2, 0, 1);
  if (qword_27258 != -1) {
    dispatch_once(&qword_27258, &stru_209F8);
  }
}

void __BAXValidateProtocolMethod(NSString *a1, void *a2, BOOL a3, BOOL a4)
{
  id v7 = a2;
  NSProtocolFromString(a1);
  p = (Protocol *)objc_claimAutoreleasedReturnValue();
  id v8 = NSSelectorFromString(v7);

  protocol_getMethodDescription(p, v8, a3, a4);
  if (qword_27258 != -1) {
    dispatch_once(&qword_27258, &stru_209F8);
  }
}

objc_ivar *__bax_verbose_encode_with_type_encoding_group_class(objc_class *a1, const char *a2)
{
  uint64_t result = class_getInstanceVariable(a1, a2);
  if (result)
  {
    return (objc_ivar *)ivar_getTypeEncoding(result);
  }
  return result;
}

void __BAXSetAssociatedObject(void *a1, const void *a2, void *a3)
{
}

void __BAXSetAssociatedNonRetainedObject(void *a1, const void *a2, void *a3)
{
}

void __BAXSetAssociatedCopiedObject(void *a1, const void *a2, void *a3)
{
}

id __BAXGetAssociatedBool(void *a1, const void *a2)
{
  id v2 = objc_getAssociatedObject(a1, a2);
  id v3 = [v2 BOOLValue];

  return v3;
}

void __BAXSetAssociatedBool(void *a1, const void *a2, int a3)
{
  id object = a1;
  if (a3)
  {
    size_t v5 = +[NSNumber numberWithBool:1];
  }
  else
  {
    size_t v5 = 0;
  }
  objc_setAssociatedObject(object, a2, v5, (char *)&dword_0 + 1);
}

id __BAXGetAssociatedInteger(void *a1, const void *a2)
{
  id v2 = objc_getAssociatedObject(a1, a2);
  id v3 = [v2 integerValue];

  return v3;
}

void __BAXSetAssociatedInteger(void *a1, const void *a2, void *a3)
{
  id object = a1;
  if (a3)
  {
    a3 = +[NSNumber numberWithInteger:a3];
  }
  objc_setAssociatedObject(object, a2, a3, (char *)&dword_0 + 1);
}

id __BAXGetAssociatedUnsignedInteger(void *a1, const void *a2)
{
  id v2 = objc_getAssociatedObject(a1, a2);
  id v3 = [v2 unsignedIntegerValue];

  return v3;
}

void __BAXSetAssociatedUnsignedInteger(void *a1, const void *a2, void *a3)
{
  id object = a1;
  if (a3)
  {
    a3 = +[NSNumber numberWithUnsignedInteger:a3];
  }
  objc_setAssociatedObject(object, a2, a3, (char *)&dword_0 + 1);
}

id __BAXGetAssociatedRange(void *a1, const void *a2)
{
  id v2 = objc_getAssociatedObject(a1, a2);
  id v3 = v2;
  if (v2) {
    id v4 = [v2 rangeValue];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

void __BAXSetAssociatedRange(void *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  id object = a1;
  if (a3 | a4)
  {
    id v7 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4);
  }
  else
  {
    id v7 = 0;
  }
  objc_setAssociatedObject(object, a2, v7, (char *)&dword_0 + 1);
}

double __BAXGetAssociatedTimeInterval(void *a1, const void *a2)
{
  id v2 = objc_getAssociatedObject(a1, a2);
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

void __BAXSetAssociatedTimeInterval(void *a1, const void *a2, double a3)
{
  id object = a1;
  if (a3 == 0.0) {
    id v5 = 0;
  }
  else {
    id v5 = [objc_alloc((Class)NSNumber) initWithDouble:a3];
  }
  objc_setAssociatedObject(object, a2, v5, (char *)&dword_0 + 1);
}

double __BAXGetAssociatedCGFloat(void *a1, const void *a2)
{
  id v2 = objc_getAssociatedObject(a1, a2);
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

void __BAXSetAssociatedCGFloat(void *a1, const void *a2, double a3)
{
  id object = a1;
  if (a3 == 0.0)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[NSNumber numberWithDouble:a3];
  }
  objc_setAssociatedObject(object, a2, v5, (char *)&dword_0 + 1);
}

double __BAXGetAssociatedCGPoint(void *a1, const void *a2)
{
  id v2 = objc_getAssociatedObject(a1, a2);
  double v3 = v2;
  if (v2)
  {
    [v2 CGPointValue];
    double x = v4;
  }
  else
  {
    double x = CGPointZero.x;
  }

  return x;
}

void __BAXSetAssociatedCGPoint(void *a1, const void *a2, double a3, double a4)
{
  id object = a1;
  if (a3 == CGPointZero.x && a4 == CGPointZero.y)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", a3, a4);
  }
  objc_setAssociatedObject(object, a2, v8, (char *)&dword_0 + 1);
}

double __BAXGetAssociatedCGRect(void *a1, const void *a2)
{
  id v2 = objc_getAssociatedObject(a1, a2);
  double v3 = v2;
  if (v2)
  {
    [v2 CGRectValue];
    double x = v4;
  }
  else
  {
    double x = CGRectZero.origin.x;
  }

  return x;
}

void __BAXSetAssociatedCGRect(void *a1, const void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id object = a1;
  v15.origin.double x = CGRectZero.origin.x;
  v15.origin.CGFloat y = CGRectZero.origin.y;
  v15.size.CGFloat width = CGRectZero.size.width;
  v15.size.CGFloat height = CGRectZero.size.height;
  v14.origin.double x = a3;
  v14.origin.CGFloat y = a4;
  v14.size.CGFloat width = a5;
  v14.size.CGFloat height = a6;
  if (CGRectEqualToRect(v14, v15))
  {
    unsigned int v11 = 0;
  }
  else
  {
    unsigned int v11 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", a3, a4, a5, a6);
  }
  objc_setAssociatedObject(object, a2, v11, (char *)&dword_0 + 1);
}

id __stringForNextArgument(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
LABEL_5:
    double v3 = v2;
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v1 string];
    goto LABEL_5;
  }
  double v3 = 0;
LABEL_7:

  return v3;
}

id __BAXStringForVariables(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  unsigned int v10 = +[NSMutableString stringWithString:&stru_20BB8];
  unsigned int v11 = __stringForNextArgument(v9);
  if ([v11 length]) {
    [v10 appendString:v11];
  }
  int v16 = (id *)&a9;
  while (1)
  {
    char v12 = v16++;
    id v13 = *v12;
    CGRect v14 = __stringForNextArgument(v13);
    if (![v14 length]) {
      goto LABEL_9;
    }
    if ([v14 isEqualToString:@"__BAXStringForVariablesSentinel"]) {
      break;
    }
    if ([v10 length]) {
      [v10 appendString:@", "];
    }
    [v10 appendString:v14];
LABEL_9:
  }

  return v10;
}

void sub_141D0(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [a1 baxAddSafeCategoryDependenciesToCollection:v8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v9, "containsObject:", v15, (void)v16) & 1) == 0
          && ([v7 containsObject:v15] & 1) == 0)
        {
          [v7 addObject:v15];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [v10 removeAllObjects];
}

void sub_145D0(void *a1)
{
  objc_begin_catch(a1);
  if (qword_27258 != -1) {
    dispatch_once(&qword_27258, &stru_209F8);
  }

  objc_end_catch();
}

uint64_t AXRequestingClient()
{
  return _AXRequestingClient();
}

void CFRelease(CFTypeRef cf)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return _CTFontDescriptorCreateWithAttributes(attributes);
}

BOOL CTFontDescriptorMatchFontDescriptorsWithProgressHandler(CFArrayRef descriptors, CFSetRef mandatoryAttributes, CTFontDescriptorProgressHandler progressBlock)
{
  return _CTFontDescriptorMatchFontDescriptorsWithProgressHandler(descriptors, mandatoryAttributes, progressBlock);
}

JSContextGroupRef JSContextGetGroup(JSContextRef ctx)
{
  return _JSContextGetGroup(ctx);
}

uint64_t JSContextGroupSetExecutionTimeLimit()
{
  return _JSContextGroupSetExecutionTimeLimit();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSIntersectionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

void NSLog(NSString *format, ...)
{
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return _NSProtocolFromString(namestr);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return _NSStringFromRect(aRect);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return _UIAccessibilityIsSwitchControlRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return __AXSApplicationAccessibilityEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_addMethod(cls, name, imp, types);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return _class_addProtocol(cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return _class_copyMethodList(cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return _class_copyProtocolList(cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return _class_getClassMethod(cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return _class_getInstanceVariable(cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return _class_getProperty(cls, name);
}

Class class_getSuperclass(Class cls)
{
  return _class_getSuperclass(cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return _ivar_getTypeEncoding(v);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

char *__cdecl method_copyArgumentType(Method m, unsigned int index)
{
  return _method_copyArgumentType(m, index);
}

char *__cdecl method_copyReturnType(Method m)
{
  return _method_copyReturnType(m);
}

IMP method_getImplementation(Method m)
{
  return _method_getImplementation(m);
}

SEL method_getName(Method m)
{
  return _method_getName(m);
}

unsigned int method_getNumberOfArguments(Method m)
{
  return _method_getNumberOfArguments(m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return _method_getTypeEncoding(m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return _method_setImplementation(m, imp);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

Class object_getClass(id a1)
{
  return _object_getClass(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  objc_method_description MethodDescription = _protocol_getMethodDescription(p, aSel, isRequiredMethod, isInstanceMethod);
  types = MethodDescription.types;
  name = MethodDescription.name;
  result.types = types;
  result.name = name;
  return result;
}

objc_property_t protocol_getProperty(Protocol *proto, const char *name, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  return _protocol_getProperty(proto, name, isRequiredProperty, isInstanceProperty);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return [a1 CGSizeValue];
}

id objc_msgSend_JSGlobalContextRef(void *a1, const char *a2, ...)
{
  return [a1 JSGlobalContextRef];
}

id objc_msgSend__accessibilityInternalTextLinkCustomRotors(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityInternalTextLinkCustomRotors];
}

id objc_msgSend__accessibilityInternalTextLinks(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityInternalTextLinks];
}

id objc_msgSend__accessibilityIsRTL(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityIsRTL];
}

id objc_msgSend__accessibilityParentView(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityParentView];
}

id objc_msgSend__accessibilityScrollStatus(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityScrollStatus];
}

id objc_msgSend__accessibilitySelectedTextRange(void *a1, const char *a2, ...)
{
  return [a1 _accessibilitySelectedTextRange];
}

id objc_msgSend__accessibilityTextMarkerRange(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityTextMarkerRange];
}

id objc_msgSend__accessibilityTextMarkerRangeForSelection(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityTextMarkerRangeForSelection];
}

id objc_msgSend__axPageScrollString(void *a1, const char *a2, ...)
{
  return [a1 _axPageScrollString];
}

id objc_msgSend__baxCachedAccessibilityElementTree(void *a1, const char *a2, ...)
{
  return [a1 _baxCachedAccessibilityElementTree];
}

id objc_msgSend__baxCachedAttachmentElement(void *a1, const char *a2, ...)
{
  return [a1 _baxCachedAttachmentElement];
}

id objc_msgSend__baxHeadingsRotor(void *a1, const char *a2, ...)
{
  return [a1 _baxHeadingsRotor];
}

id objc_msgSend__baxHighlightRotor(void *a1, const char *a2, ...)
{
  return [a1 _baxHighlightRotor];
}

id objc_msgSend__baxIsSettingSelectionTimer(void *a1, const char *a2, ...)
{
  return [a1 _baxIsSettingSelectionTimer];
}

id objc_msgSend__baxIsTurning(void *a1, const char *a2, ...)
{
  return [a1 _baxIsTurning];
}

id objc_msgSend__baxIsTurningCounter(void *a1, const char *a2, ...)
{
  return [a1 _baxIsTurningCounter];
}

id objc_msgSend__beaxParentWebPageObject(void *a1, const char *a2, ...)
{
  return [a1 _beaxParentWebPageObject];
}

id objc_msgSend__bkaxSuperAccessibilityContainer(void *a1, const char *a2, ...)
{
  return [a1 _bkaxSuperAccessibilityContainer];
}

id objc_msgSend__checkActions(void *a1, const char *a2, ...)
{
  return [a1 _checkActions];
}

id objc_msgSend__dispatchPageScrolledNotification(void *a1, const char *a2, ...)
{
  return [a1 _dispatchPageScrolledNotification];
}

id objc_msgSend__rangeForVisibleContent(void *a1, const char *a2, ...)
{
  return [a1 _rangeForVisibleContent];
}

id objc_msgSend__remoteObjectRegistry(void *a1, const char *a2, ...)
{
  return [a1 _remoteObjectRegistry];
}

id objc_msgSend__sanitizeCachedElements(void *a1, const char *a2, ...)
{
  return [a1 _sanitizeCachedElements];
}

id objc_msgSend_accessibilityAttributedPageContent(void *a1, const char *a2, ...)
{
  return [a1 accessibilityAttributedPageContent];
}

id objc_msgSend_accessibilityAttributedValue(void *a1, const char *a2, ...)
{
  return [a1 accessibilityAttributedValue];
}

id objc_msgSend_accessibilityContainer(void *a1, const char *a2, ...)
{
  return [a1 accessibilityContainer];
}

id objc_msgSend_accessibilityElementCount(void *a1, const char *a2, ...)
{
  return [a1 accessibilityElementCount];
}

id objc_msgSend_accessibilityElements(void *a1, const char *a2, ...)
{
  return [a1 accessibilityElements];
}

id objc_msgSend_accessibilityFrame(void *a1, const char *a2, ...)
{
  return [a1 accessibilityFrame];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_accessibilityNeedsReload(void *a1, const char *a2, ...)
{
  return [a1 accessibilityNeedsReload];
}

id objc_msgSend_accessibilityPageContent(void *a1, const char *a2, ...)
{
  return [a1 accessibilityPageContent];
}

id objc_msgSend_accessibilityTraits(void *a1, const char *a2, ...)
{
  return [a1 accessibilityTraits];
}

id objc_msgSend_accessibilityValue(void *a1, const char *a2, ...)
{
  return [a1 accessibilityValue];
}

id objc_msgSend_accessibilityVisibleCharacterRange(void *a1, const char *a2, ...)
{
  return [a1 accessibilityVisibleCharacterRange];
}

id objc_msgSend_accessibilityVisibleContentRect(void *a1, const char *a2, ...)
{
  return [a1 accessibilityVisibleContentRect];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributedStringForElement(void *a1, const char *a2, ...)
{
  return [a1 attributedStringForElement];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return [a1 attributedText];
}

id objc_msgSend_baxAttachmentElement(void *a1, const char *a2, ...)
{
  return [a1 baxAttachmentElement];
}

id objc_msgSend_baxBaseSafeCategoryClass(void *a1, const char *a2, ...)
{
  return [a1 baxBaseSafeCategoryClass];
}

id objc_msgSend_baxBookContentElement(void *a1, const char *a2, ...)
{
  return [a1 baxBookContentElement];
}

id objc_msgSend_baxElementIsInteractive(void *a1, const char *a2, ...)
{
  return [a1 baxElementIsInteractive];
}

id objc_msgSend_baxInvalidateCaches(void *a1, const char *a2, ...)
{
  return [a1 baxInvalidateCaches];
}

id objc_msgSend_baxInvalidateContainerCaches(void *a1, const char *a2, ...)
{
  return [a1 baxInvalidateContainerCaches];
}

id objc_msgSend_baxInvalidateLineInfos(void *a1, const char *a2, ...)
{
  return [a1 baxInvalidateLineInfos];
}

id objc_msgSend_baxIsBookContentElement(void *a1, const char *a2, ...)
{
  return [a1 baxIsBookContentElement];
}

id objc_msgSend_baxIsInPictureBook(void *a1, const char *a2, ...)
{
  return [a1 baxIsInPictureBook];
}

id objc_msgSend_baxNeedsAttachmentElement(void *a1, const char *a2, ...)
{
  return [a1 baxNeedsAttachmentElement];
}

id objc_msgSend_baxStoredAttributedPageContent(void *a1, const char *a2, ...)
{
  return [a1 baxStoredAttributedPageContent];
}

id objc_msgSend_baxStoredHeadingsRotor(void *a1, const char *a2, ...)
{
  return [a1 baxStoredHeadingsRotor];
}

id objc_msgSend_baxStoredHeadingsRotorIndex(void *a1, const char *a2, ...)
{
  return [a1 baxStoredHeadingsRotorIndex];
}

id objc_msgSend_baxStoredHighlightRotor(void *a1, const char *a2, ...)
{
  return [a1 baxStoredHighlightRotor];
}

id objc_msgSend_baxStoredHighlightRotorIndex(void *a1, const char *a2, ...)
{
  return [a1 baxStoredHighlightRotorIndex];
}

id objc_msgSend_baxStoredLineInfos(void *a1, const char *a2, ...)
{
  return [a1 baxStoredLineInfos];
}

id objc_msgSend_baxStoredLinkInfos(void *a1, const char *a2, ...)
{
  return [a1 baxStoredLinkInfos];
}

id objc_msgSend_baxStoredLinkRotor(void *a1, const char *a2, ...)
{
  return [a1 baxStoredLinkRotor];
}

id objc_msgSend_baxStoredLinkRotorIndex(void *a1, const char *a2, ...)
{
  return [a1 baxStoredLinkRotorIndex];
}

id objc_msgSend_baxStoredVisibleLinkElements(void *a1, const char *a2, ...)
{
  return [a1 baxStoredVisibleLinkElements];
}

id objc_msgSend_baxStoredVisibleLinkInfos(void *a1, const char *a2, ...)
{
  return [a1 baxStoredVisibleLinkInfos];
}

id objc_msgSend_baxTargetClassName(void *a1, const char *a2, ...)
{
  return [a1 baxTargetClassName];
}

id objc_msgSend_baxWebPageObject(void *a1, const char *a2, ...)
{
  return [a1 baxWebPageObject];
}

id objc_msgSend_bkaxAdditionalAXElementsForCurrentPage(void *a1, const char *a2, ...)
{
  return [a1 bkaxAdditionalAXElementsForCurrentPage];
}

id objc_msgSend_bookLayout(void *a1, const char *a2, ...)
{
  return [a1 bookLayout];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_checkActions(void *a1, const char *a2, ...)
{
  return [a1 checkActions];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentPage(void *a1, const char *a2, ...)
{
  return [a1 currentPage];
}

id objc_msgSend_currentPageLength(void *a1, const char *a2, ...)
{
  return [a1 currentPageLength];
}

id objc_msgSend_currentPageLocation(void *a1, const char *a2, ...)
{
  return [a1 currentPageLocation];
}

id objc_msgSend_currentPageNumber(void *a1, const char *a2, ...)
{
  return [a1 currentPageNumber];
}

id objc_msgSend_currentReadingState(void *a1, const char *a2, ...)
{
  return [a1 currentReadingState];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultJSContext(void *a1, const char *a2, ...)
{
  return [a1 defaultJSContext];
}

id objc_msgSend_delayForDocumentChanged(void *a1, const char *a2, ...)
{
  return [a1 delayForDocumentChanged];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_documentChanged(void *a1, const char *a2, ...)
{
  return [a1 documentChanged];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_elementTextRange(void *a1, const char *a2, ...)
{
  return [a1 elementTextRange];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_frameCenterPoint(void *a1, const char *a2, ...)
{
  return [a1 frameCenterPoint];
}

id objc_msgSend_frameInScreenCoordinates(void *a1, const char *a2, ...)
{
  return [a1 frameInScreenCoordinates];
}

id objc_msgSend_hasVisibleControls(void *a1, const char *a2, ...)
{
  return [a1 hasVisibleControls];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateCaches(void *a1, const char *a2, ...)
{
  return [a1 invalidateCaches];
}

id objc_msgSend_isAccessibilityElement(void *a1, const char *a2, ...)
{
  return [a1 isAccessibilityElement];
}

id objc_msgSend_isAccessibilityLoaded(void *a1, const char *a2, ...)
{
  return [a1 isAccessibilityLoaded];
}

id objc_msgSend_isAccessibilitySupportLoaded(void *a1, const char *a2, ...)
{
  return [a1 isAccessibilitySupportLoaded];
}

id objc_msgSend_isFixedLayoutBook(void *a1, const char *a2, ...)
{
  return [a1 isFixedLayoutBook];
}

id objc_msgSend_isMainFrame(void *a1, const char *a2, ...)
{
  return [a1 isMainFrame];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isPaginated(void *a1, const char *a2, ...)
{
  return [a1 isPaginated];
}

id objc_msgSend_isRTL(void *a1, const char *a2, ...)
{
  return [a1 isRTL];
}

id objc_msgSend_isSpreadWithChapterBoundary(void *a1, const char *a2, ...)
{
  return [a1 isSpreadWithChapterBoundary];
}

id objc_msgSend_isTextHorizontal(void *a1, const char *a2, ...)
{
  return [a1 isTextHorizontal];
}

id objc_msgSend_isVisiblePageBookmarked(void *a1, const char *a2, ...)
{
  return [a1 isVisiblePageBookmarked];
}

id objc_msgSend_jsContext(void *a1, const char *a2, ...)
{
  return [a1 jsContext];
}

id objc_msgSend_knownBookContentElements(void *a1, const char *a2, ...)
{
  return [a1 knownBookContentElements];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineRectsAndText(void *a1, const char *a2, ...)
{
  return [a1 lineRectsAndText];
}

id objc_msgSend_loadAccessibilitySupport(void *a1, const char *a2, ...)
{
  return [a1 loadAccessibilitySupport];
}

id objc_msgSend_loadAccessibilitySupportWithDelay(void *a1, const char *a2, ...)
{
  return [a1 loadAccessibilitySupportWithDelay];
}

id objc_msgSend_mainFrame(void *a1, const char *a2, ...)
{
  return [a1 mainFrame];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newDocumentFinishedLoading(void *a1, const char *a2, ...)
{
  return [a1 newDocumentFinishedLoading];
}

id objc_msgSend_normalWorld(void *a1, const char *a2, ...)
{
  return [a1 normalWorld];
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return [a1 objCType];
}

id objc_msgSend_objectWrapper(void *a1, const char *a2, ...)
{
  return [a1 objectWrapper];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_pageCount(void *a1, const char *a2, ...)
{
  return [a1 pageCount];
}

id objc_msgSend_performValidation(void *a1, const char *a2, ...)
{
  return [a1 performValidation];
}

id objc_msgSend_performableOperations(void *a1, const char *a2, ...)
{
  return [a1 performableOperations];
}

id objc_msgSend_pointValue(void *a1, const char *a2, ...)
{
  return [a1 pointValue];
}

id objc_msgSend_primaryVisibleContentRect(void *a1, const char *a2, ...)
{
  return [a1 primaryVisibleContentRect];
}

id objc_msgSend_processController(void *a1, const char *a2, ...)
{
  return [a1 processController];
}

id objc_msgSend_rangeInChapter(void *a1, const char *a2, ...)
{
  return [a1 rangeInChapter];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return [a1 rangeValue];
}

id objc_msgSend_referenceElement(void *a1, const char *a2, ...)
{
  return [a1 referenceElement];
}

id objc_msgSend_remoteObjectInterface(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectInterface];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_screenHeight(void *a1, const char *a2, ...)
{
  return [a1 screenHeight];
}

id objc_msgSend_screenWidth(void *a1, const char *a2, ...)
{
  return [a1 screenWidth];
}

id objc_msgSend_searchDirection(void *a1, const char *a2, ...)
{
  return [a1 searchDirection];
}

id objc_msgSend_secondaryVisibleContentRect(void *a1, const char *a2, ...)
{
  return [a1 secondaryVisibleContentRect];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedUtilities(void *a1, const char *a2, ...)
{
  return [a1 sharedUtilities];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return [a1 superclass];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textMarkerRange(void *a1, const char *a2, ...)
{
  return [a1 textMarkerRange];
}

id objc_msgSend_toArray(void *a1, const char *a2, ...)
{
  return [a1 toArray];
}

id objc_msgSend_toBool(void *a1, const char *a2, ...)
{
  return [a1 toBool];
}

id objc_msgSend_toDictionary(void *a1, const char *a2, ...)
{
  return [a1 toDictionary];
}

id objc_msgSend_toggleBookmark(void *a1, const char *a2, ...)
{
  return [a1 toggleBookmark];
}

id objc_msgSend_toggleControlsVisibility(void *a1, const char *a2, ...)
{
  return [a1 toggleControlsVisibility];
}

id objc_msgSend_trimElementSpanningPageBoundary(void *a1, const char *a2, ...)
{
  return [a1 trimElementSpanningPageBoundary];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_visibleAnnotations(void *a1, const char *a2, ...)
{
  return [a1 visibleAnnotations];
}

id objc_msgSend_webProcessPlugin(void *a1, const char *a2, ...)
{
  return [a1 webProcessPlugin];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}