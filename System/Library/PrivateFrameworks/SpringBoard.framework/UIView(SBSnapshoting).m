@interface UIView(SBSnapshoting)
- (id)sb_generateSnapshotContentsSynchronously;
- (void)_generateSnapshotOnQueue:()SBSnapshoting completionHandler:;
@end

@implementation UIView(SBSnapshoting)

- (id)sb_generateSnapshotContentsSynchronously
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__127;
  v8 = __Block_byref_object_dispose__127;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__UIView_SBSnapshoting__sb_generateSnapshotContentsSynchronously__block_invoke;
  v3[3] = &unk_1E6B0DD08;
  v3[4] = &v4;
  [a1 _generateSnapshotOnQueue:0 completionHandler:v3];
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (void)_generateSnapshotOnQueue:()SBSnapshoting completionHandler:
{
  uint64_t v6 = a3;
  id v7 = a4;
  v8 = [a1 window];
  int v9 = [v8 _contextId];

  v10 = [MEMORY[0x1E4F39B58] allContexts];
  *(void *)&v52.m11 = MEMORY[0x1E4F143A8];
  *(void *)&v52.m12 = 3221225472;
  *(void *)&v52.m13 = __SBCAContextForContextID_block_invoke;
  *(void *)&v52.m14 = &__block_descriptor_36_e19_B16__0__CAContext_8l;
  LODWORD(v52.m21) = v9;
  v11 = objc_msgSend(v10, "bs_firstObjectPassingTest:", &v52);

  v12 = [a1 layer];
  v13 = [a1 _screen];
  [v13 scale];
  double v15 = v14;
  v16 = [v12 presentationLayer];
  if (v16)
  {
    v17 = [v12 presentationLayer];
    [v17 bounds];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
  }
  else
  {
    [a1 bounds];
    CGFloat v19 = v26;
    CGFloat v21 = v27;
    CGFloat v23 = v28;
    CGFloat v25 = v29;
  }

  v53.origin.x = v19;
  v53.origin.y = v21;
  v53.size.width = v23;
  v53.size.height = v25;
  double v30 = v15 * CGRectGetWidth(v53);
  v54.origin.x = v19;
  v54.origin.y = v21;
  v54.size.width = v23;
  v54.size.height = v25;
  double v31 = v15 * CGRectGetHeight(v54);
  memset(&v52, 0, sizeof(v52));
  CATransform3DMakeScale(&v52, v15, v15, 1.0);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __68__UIView_SBSnapshoting___generateSnapshotOnQueue_completionHandler___block_invoke;
  v39[3] = &unk_1E6B0DD30;
  id v32 = v11;
  id v40 = v32;
  double v43 = v30;
  double v44 = v31;
  int v51 = v9;
  id v33 = v12;
  id v41 = v33;
  CGFloat v45 = v19;
  CGFloat v46 = v21;
  CGFloat v47 = v23;
  CGFloat v48 = v25;
  double v49 = v15;
  CATransform3D v50 = v52;
  id v34 = v7;
  id v42 = v34;
  v35 = (void (**)(void))MEMORY[0x1D948C7A0](v39);
  v36 = v35;
  if (v6)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __68__UIView_SBSnapshoting___generateSnapshotOnQueue_completionHandler___block_invoke_2;
    v37[3] = &unk_1E6AF5300;
    v38 = v35;
    dispatch_async(v6, v37);
  }
  else
  {
    v35[2](v35);
  }
}

@end