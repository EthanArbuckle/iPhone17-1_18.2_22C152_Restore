@interface UIFlowLayoutRow
@end

@implementation UIFlowLayoutRow

void __46___UIFlowLayoutRow_indexOfNearestItemAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = a2;
  v32 = v7;
  if (v7)
  {
    CGFloat v9 = v7[4];
    CGFloat v8 = v7[5];
    CGFloat v11 = v7[6];
    CGFloat v10 = v7[7];
  }
  else
  {
    CGFloat v8 = 0.0;
    CGFloat v11 = 0.0;
    CGFloat v10 = 0.0;
    CGFloat v9 = 0.0;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    double v12 = *(double *)(a1 + 56);
    v34.origin.x = v9;
    v34.origin.y = v8;
    v34.size.width = v11;
    v34.size.height = v10;
    if (v12 < CGRectGetMinY(v34))
    {
      if (a3)
      {
        v35.origin.x = v9;
        v35.origin.y = v8;
        v35.size.width = v11;
        v35.size.height = v10;
        double v13 = CGRectGetMinY(v35) - *(double *)(a1 + 56);
        uint64_t v14 = a3 - 1;
        v15 = [*(id *)(*(void *)(a1 + 32) + 40) objectAtIndexedSubscript:a3 - 1];
        v16 = v15;
        double v17 = *(double *)(a1 + 56);
        if (v15)
        {
          uint64_t v18 = v15[4];
          uint64_t v19 = v15[5];
          uint64_t v20 = v15[6];
          uint64_t v21 = v15[7];
        }
        else
        {
          uint64_t v19 = 0;
          uint64_t v20 = 0;
          uint64_t v21 = 0;
          uint64_t v18 = 0;
        }
        double MaxY = CGRectGetMaxY(*(CGRect *)&v18);
LABEL_14:
        if (v17 - MaxY <= v13) {
          uint64_t v29 = a3;
        }
        else {
          uint64_t v29 = v14;
        }
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v29;
        *a4 = 1;

        goto LABEL_24;
      }
LABEL_22:
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      goto LABEL_23;
    }
    double v30 = *(double *)(a1 + 56);
    v38.origin.x = v9;
    v38.origin.y = v8;
    v38.size.width = v11;
    v38.size.height = v10;
    double MaxX = CGRectGetMaxY(v38);
  }
  else
  {
    double v23 = *(double *)(a1 + 48);
    v36.origin.x = v9;
    v36.origin.y = v8;
    v36.size.width = v11;
    v36.size.height = v10;
    if (v23 < CGRectGetMinX(v36))
    {
      if (a3)
      {
        v37.origin.x = v9;
        v37.origin.y = v8;
        v37.size.width = v11;
        v37.size.height = v10;
        double v13 = CGRectGetMinX(v37) - *(double *)(a1 + 48);
        uint64_t v14 = a3 - 1;
        v24 = [*(id *)(*(void *)(a1 + 32) + 40) objectAtIndexedSubscript:a3 - 1];
        v16 = v24;
        double v17 = *(double *)(a1 + 48);
        if (v24)
        {
          uint64_t v25 = v24[4];
          uint64_t v26 = v24[5];
          uint64_t v27 = v24[6];
          uint64_t v28 = v24[7];
        }
        else
        {
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          uint64_t v28 = 0;
          uint64_t v25 = 0;
        }
        double MaxY = CGRectGetMaxX(*(CGRect *)&v25);
        goto LABEL_14;
      }
      goto LABEL_22;
    }
    double v30 = *(double *)(a1 + 48);
    v39.origin.x = v9;
    v39.origin.y = v8;
    v39.size.width = v11;
    v39.size.height = v10;
    double MaxX = CGRectGetMaxX(v39);
  }
  if (v30 >= MaxX) {
    goto LABEL_24;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
LABEL_23:
  *a4 = 1;
LABEL_24:
}

@end