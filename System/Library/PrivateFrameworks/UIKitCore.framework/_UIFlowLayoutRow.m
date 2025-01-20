@interface _UIFlowLayoutRow
- (_UIFlowLayoutRow)init;
- (uint64_t)indexOfNearestItemAtPoint:(double)a3;
- (void)addItem:(int)a3 atEnd:;
- (void)layoutRow;
@end

@implementation _UIFlowLayoutRow

- (void)addItem:(int)a3 atEnd:
{
  v5 = a2;
  if (a1)
  {
    v6 = (void *)a1[5];
    v7 = v5;
    if (a3) {
      [v6 addObject:v5];
    }
    else {
      [v6 insertObject:v5 atIndex:0];
    }
    v5 = v7;
    if (v7)
    {
      objc_storeWeak(v7 + 3, a1);
      v5 = v7;
    }
  }
}

- (void)layoutRow
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 24));
    v3 = (double *)WeakRetained;
    double v4 = 0.0;
    if (WeakRetained)
    {
      v5 = (double *)objc_loadWeakRetained(WeakRetained + 18);
      v6 = v5;
      BOOL v7 = v5 == 0;
      if (v5)
      {
        double v8 = v3[35];
        double v9 = v3[36];
        double v11 = v3[37];
        double v10 = v3[38];
        double v12 = v5[14];
        double v65 = v10;
        double v66 = v9;
        if (*((unsigned char *)v5 + 97))
        {
          BOOL v7 = 0;
          int v13 = 1;
          uint64_t v14 = 14;
          double v10 = v3[37];
          double v9 = v3[35];
        }
        else
        {
          int v13 = 0;
          uint64_t v14 = 15;
        }
      }
      else
      {
        int v13 = 0;
        double v8 = v3[35];
        double v9 = v3[36];
        double v11 = v3[37];
        double v10 = v3[38];
        double v12 = 0.0;
        uint64_t v14 = 15;
        double v65 = v10;
        double v66 = v9;
      }
      double v15 = v3[v14];
    }
    else
    {
      int v13 = 0;
      v6 = 0;
      double v10 = 0.0;
      double v12 = 0.0;
      BOOL v7 = 1;
      double v15 = 0.0;
      double v65 = 0.0;
      double v66 = 0.0;
      double v11 = 0.0;
      double v8 = 0.0;
      double v9 = 0.0;
    }
    double v68 = v15;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v16 = *(id *)(a1 + 40);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v73 objects:v78 count:16];
    double v18 = 0.0;
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v20 = *(void *)v74;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v74 != v20) {
            objc_enumerationMutation(v16);
          }
          uint64_t v22 = *(void *)(*((void *)&v73 + 1) + 8 * v21);
          if (v22)
          {
            double v23 = *(double *)(v22 + 48);
            double v24 = *(double *)(v22 + 56);
          }
          else
          {
            double v23 = 0.0;
            double v24 = 0.0;
          }
          if (v13) {
            double v25 = v23;
          }
          else {
            double v25 = v24;
          }
          if (v13) {
            double v23 = v24;
          }
          if (v25 > v18) {
            double v18 = v25;
          }
          double v4 = v4 + v23;
          ++v21;
        }
        while (v19 != v21);
        uint64_t v26 = [v16 countByEnumeratingWithState:&v73 objects:v78 count:16];
        uint64_t v19 = v26;
      }
      while (v26);
    }

    if (v13) {
      double v27 = v12;
    }
    else {
      double v27 = v18;
    }
    if (v13) {
      double v28 = v18;
    }
    else {
      double v28 = v12;
    }
    *(double *)(a1 + 56) = v28;
    *(double *)(a1 + 64) = v27;
    if (v3) {
      uint64_t v29 = *((void *)v3 + 29);
    }
    else {
      uint64_t v29 = 0;
    }
    if (*(unsigned char *)(a1 + 9)) {
      int v30 = v29;
    }
    else {
      int v30 = HIDWORD(v29);
    }
    id v31 = *(id *)(a1 + 40);
    v32 = v31;
    switch(v30)
    {
      case 1:
        double v33 = v9 + (v12 - v4 - v68 * (double)(unint64_t)([v31 count] - 1) - v10 - v9) * 0.5;
        goto LABEL_48;
      case 3:
        if ((unint64_t)[v31 count] <= 1)
        {
          double v34 = v12 - (v10 + v9);
          double v35 = (v34 - v4) * 0.5;
          BOOL v36 = v34 < v4;
          double v37 = -0.0;
          if (!v36) {
            double v37 = v35;
          }
          double v33 = v9 + v37;
          double v68 = 0.0;
LABEL_48:
          if (*(unsigned char *)(a1 + 9) || !*(unsigned char *)(a1 + 20) || v29 != 3 || (v29 & 0xFFFFFFFD00000000) != 0)
          {
LABEL_69:
            double v67 = *(double *)(a1 + 56);
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            id v48 = v32;
            uint64_t v49 = [v48 countByEnumeratingWithState:&v69 objects:v77 count:16];
            if (!v49) {
              goto LABEL_101;
            }
            uint64_t v50 = v49;
            uint64_t v51 = *(void *)v70;
            while (1)
            {
              uint64_t v52 = 0;
              do
              {
                if (*(void *)v70 != v51) {
                  objc_enumerationMutation(v48);
                }
                v53 = *(double **)(*((void *)&v69 + 1) + 8 * v52);
                if (v53)
                {
                  double v54 = v53[6];
                  double v55 = v53[7];
                }
                else
                {
                  double v54 = 0.0;
                  double v55 = 0.0;
                }
                if (v13) {
                  double v56 = v55;
                }
                else {
                  double v56 = v54;
                }
                int v57 = *(_DWORD *)(a1 + 12);
                if (v13) {
                  double v58 = v54;
                }
                else {
                  double v58 = v55;
                }
                double v59 = v18 * 0.5 + v58 * -0.5;
                double v60 = v18 - v58;
                if (v57 != 2) {
                  double v60 = 0.0;
                }
                if (v57 == 1) {
                  double v60 = v59;
                }
                if (v13)
                {
                  if (v7)
                  {
                    double v61 = v60;
                    CGFloat v62 = v33;
                  }
                  else
                  {
                    double v61 = v60;
                    CGFloat v62 = v33;
                    double v63 = v60;
                    double v60 = v33;
                    if (*((unsigned char *)v6 + 98)) {
                      goto LABEL_93;
                    }
                  }
                }
                else if (v7)
                {
                  double v61 = v33;
                  CGFloat v62 = v60;
                }
                else
                {
                  double v61 = v33;
                  CGFloat v62 = v60;
                  double v63 = v33;
                  if (*((unsigned char *)v6 + 98)) {
                    goto LABEL_93;
                  }
                }
                v80.origin.x = v61;
                v80.origin.y = v62;
                v80.size.width = v54;
                v80.size.height = v55;
                double v63 = v67 - CGRectGetWidth(v80) - v61;
                double v60 = v62;
LABEL_93:
                if (v53)
                {
                  v53[4] = v63;
                  v53[5] = v60;
                  v53[6] = v54;
                  v53[7] = v55;
                }
                double v33 = v33 + v68 + v56;
                ++v52;
              }
              while (v50 != v52);
              uint64_t v64 = [v48 countByEnumeratingWithState:&v69 objects:v77 count:16];
              uint64_t v50 = v64;
              if (!v64)
              {
LABEL_101:

                return;
              }
            }
          }
          double v38 = 0.0;
          double v39 = 0.0;
          if (v7 || (double v39 = v6[14], !*((unsigned char *)v6 + 97)))
          {
            int v41 = 0;
            double v40 = v66 + v65;
            if (v3)
            {
              uint64_t v42 = 15;
              goto LABEL_58;
            }
          }
          else
          {
            double v40 = v11 + v8;
            int v41 = 1;
            if (v3)
            {
              uint64_t v42 = 14;
LABEL_58:
              double v38 = v3[v42];
            }
          }
          double v43 = v39 - v40;
          v44 = [*(id *)(a1 + 40) lastObject];
          double v45 = 0.0;
          double v68 = 0.0;
          if (v44)
          {
            uint64_t v46 = 48;
            if (v41) {
              uint64_t v46 = 56;
            }
            double v45 = *(double *)&v44[v46];
          }
          if (v45 <= v43)
          {
            uint64_t v47 = -1;
            do
            {
              double v43 = v43 - (v38 + v45);
              ++v47;
            }
            while (v45 <= v43);
            if (v47) {
              double v68 = (v12 - v45 * (double)(v47 + 1) - v9 - v10) / (double)v47;
            }
          }

          double v33 = v9;
          goto LABEL_69;
        }
        double v68 = (v12 - v4 - v9 - v10) / (double)(unint64_t)([v32 count] - 1);
        break;
      case 2:
        double v33 = v12 - v4 - v68 * (double)(unint64_t)([v31 count] - 1) - v10;
        goto LABEL_48;
    }
    double v33 = v9;
    goto LABEL_48;
  }
}

- (uint64_t)indexOfNearestItemAtPoint:(double)a3
{
  uint64_t v3 = a1;
  if (a1)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 24));
    BOOL v7 = WeakRetained;
    if (WeakRetained && (double v8 = objc_loadWeakRetained(WeakRetained + 18)) != 0)
    {
      BOOL v9 = v8[97] != 0;
    }
    else
    {
      BOOL v9 = 0;
    }

    uint64_t v14 = 0;
    double v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    double v10 = *(void **)(v3 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46___UIFlowLayoutRow_indexOfNearestItemAtPoint___block_invoke;
    v12[3] = &unk_1E52E6568;
    BOOL v13 = v9;
    *(double *)&v12[6] = a2;
    *(double *)&v12[7] = a3;
    v12[4] = v3;
    v12[5] = &v14;
    [v10 enumerateObjectsUsingBlock:v12];
    uint64_t v3 = v15[3];
    _Block_object_dispose(&v14, 8);
  }
  return v3;
}

- (_UIFlowLayoutRow)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFlowLayoutRow;
  v2 = [(_UIFlowLayoutRow *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    double v4 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v3;

    *(void *)(v2 + 12) = 0x300000001;
  }
  return (_UIFlowLayoutRow *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_section);
}

@end