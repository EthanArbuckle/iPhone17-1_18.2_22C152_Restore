@interface UIStatusBarInternalRepositionAnimation
@end

@implementation UIStatusBarInternalRepositionAnimation

void ___UIStatusBarInternalRepositionAnimation_block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = a1[4];
  if (!v10 || (*(unsigned int (**)(uint64_t, id))(v10 + 16))(v10, v8))
  {
    v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
    v12 = [v8 identifier];
    v13 = [v11 objectForKeyedSubscript:v12];

    if (v13)
    {
      [v13 CGRectValue];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      [v8 absoluteFrame];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
    }
    else
    {
      CGFloat v23 = *MEMORY[0x1E4F1DB28];
      CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v29 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v21 = v29;
      double v19 = v27;
      double v17 = v25;
      double v15 = *MEMORY[0x1E4F1DB28];
    }
    v47.origin.x = v23;
    v47.origin.y = v25;
    v47.size.width = v27;
    v47.size.height = v29;
    if (CGRectIsEmpty(v47))
    {
      v48.origin.x = v23;
      v48.origin.y = v25;
      v48.size.width = v27;
      v48.size.height = v29;
      v51.origin.x = v15;
      v51.origin.y = v17;
      v51.size.width = v19;
      v51.size.height = v21;
      CGRectEqualToRect(v48, v51);
    }
    else
    {
      v49.origin.x = v15;
      v49.origin.y = v17;
      v49.size.width = v19;
      v49.size.height = v21;
      BOOL IsEmpty = CGRectIsEmpty(v49);
      v50.origin.x = v23;
      v50.origin.y = v25;
      v50.size.width = v27;
      v50.size.height = v29;
      v52.origin.x = v15;
      v52.origin.y = v17;
      v52.size.width = v19;
      v52.size.height = v21;
      if (!CGRectEqualToRect(v50, v52) && !IsEmpty)
      {
        objc_msgSend(v8, "setAbsoluteFrame:", v15, v17, v19, v21);
        uint64_t v31 = a1[5];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = ___UIStatusBarInternalRepositionAnimation_block_invoke_2;
        v41[3] = &unk_1E52DA520;
        id v32 = v8;
        id v42 = v32;
        CGFloat v43 = v23;
        CGFloat v44 = v25;
        CGFloat v45 = v27;
        CGFloat v46 = v29;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = ___UIStatusBarInternalRepositionAnimation_block_invoke_3;
        v39[3] = &unk_1E52D9FE8;
        id v40 = v9;
        (*(void (**)(uint64_t, void *, void *))(v31 + 16))(v31, v41, v39);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = ___UIStatusBarInternalRepositionAnimation_block_invoke_4;
        v33[3] = &unk_1E52DA520;
        id v34 = v32;
        CGFloat v35 = v23;
        CGFloat v36 = v25;
        CGFloat v37 = v27;
        CGFloat v38 = v29;
        [v7 addTimeout:v33 withHandler:2.0];

LABEL_13:
        goto LABEL_14;
      }
    }
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    goto LABEL_13;
  }
  (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
LABEL_14:
}

uint64_t ___UIStatusBarInternalRepositionAnimation_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t ___UIStatusBarInternalRepositionAnimation_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___UIStatusBarInternalRepositionAnimation_block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t ___UIStatusBarInternalRepositionAnimation_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    uint64_t v8 = [v7 displayItemAbsoluteFrames];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else if (v6)
  {
    int v11 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v12 = [v6 identifier];
    v13 = (void *)v12;
    if (v11)
    {
      uint64_t v37 = v12;
      double v14 = (void *)MEMORY[0x1E4F29238];
      [v6 absolutePresentationFrame];
      v34[0] = v15;
      v34[1] = v16;
      v34[2] = v17;
      v34[3] = v18;
      double v19 = [v14 valueWithBytes:v34 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      v38[0] = v19;
      double v20 = (void *)MEMORY[0x1E4F1C9E8];
      double v21 = (void **)v38;
      double v22 = &v37;
    }
    else
    {
      uint64_t v35 = v12;
      CGFloat v23 = (void *)MEMORY[0x1E4F29238];
      [v6 absoluteFrame];
      v33[0] = v24;
      v33[1] = v25;
      v33[2] = v26;
      v33[3] = v27;
      double v19 = [v23 valueWithBytes:v33 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      CGFloat v36 = v19;
      double v20 = (void *)MEMORY[0x1E4F1C9E8];
      double v21 = &v36;
      double v22 = &v35;
    }
    uint64_t v28 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
    uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
    v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;
  }
  uint64_t v31 = *(void *)(a1 + 40);
  if (v31) {
    (*(void (**)(uint64_t, void))(v31 + 16))(v31, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }

  return 1;
}

@end