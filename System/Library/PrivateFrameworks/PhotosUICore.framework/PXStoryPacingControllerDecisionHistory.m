@interface PXStoryPacingControllerDecisionHistory
@end

@implementation PXStoryPacingControllerDecisionHistory

void __69___PXStoryPacingControllerDecisionHistory_descriptionWithShortStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 decisionsCount];
  if (v4 >= 1)
  {
    uint64_t v29 = a1;
    unint64_t v5 = v4 + 1;
    uint64_t v6 = 240 * v4 - 112;
    id v30 = v3;
    do
    {
      uint64_t v7 = [v3 decisions] + v6;
      uint64_t v8 = *(void *)(v7 - 128);
      long long v9 = *(_OWORD *)(v7 - 104);
      long long v52 = *(_OWORD *)(v7 - 120);
      long long v53 = v9;
      long long v54 = *(_OWORD *)(v7 - 88);
      long long v50 = *(_OWORD *)(v7 - 72);
      uint64_t v51 = *(void *)(v7 - 56);
      long long v10 = *(_OWORD *)(v7 - 48);
      uint64_t v49 = *(void *)(v7 - 32);
      unint64_t v11 = *(void *)v7;
      long long v12 = *(_OWORD *)(v7 + 8);
      v47[1] = *(_OWORD *)(v7 + 24);
      long long v48 = v10;
      v47[0] = v12;
      v13 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 40))
      {
        long long v14 = *(_OWORD *)(v7 - 104);
        *(_OWORD *)&v32[8] = *(_OWORD *)(v7 - 120);
        *(_OWORD *)&v32[24] = v14;
        *(_OWORD *)&v32[40] = *(_OWORD *)(v7 - 88);
        long long v33 = *(_OWORD *)(v7 - 72);
        uint64_t v34 = *(void *)(v7 - 56);
        long long v35 = *(_OWORD *)(v7 - 48);
        uint64_t v36 = *(void *)(v7 - 32);
        uint64_t v38 = *(void *)(v7 - 8);
        long long v37 = *(_OWORD *)(v7 - 24);
        *(void *)v32 = v8;
        unint64_t v39 = v11;
        long long v15 = *(_OWORD *)(v7 + 24);
        long long v40 = *(_OWORD *)(v7 + 8);
        long long v41 = v15;
        long long v16 = *(_OWORD *)(v7 + 40);
        uint64_t v46 = *(void *)(v7 + 104);
        long long v17 = *(_OWORD *)(v7 + 88);
        long long v44 = *(_OWORD *)(v7 + 72);
        long long v45 = v17;
        long long v18 = *(_OWORD *)(v7 + 56);
        long long v42 = v16;
        long long v43 = v18;
        v19 = PXStoryPacingDecisionDescription((uint64_t)v32);
        [v13 appendFormat:@"%@\n", v19];
      }
      else
      {
        v19 = [NSNumber numberWithInteger:v8];
        v20 = @"Unspecified";
        if (v11 <= 4) {
          v20 = off_1E5DAF518[v11];
        }
        v21 = v20;
        *(_OWORD *)v32 = *(_OWORD *)((char *)v47 + 8);
        *(void *)&v32[16] = *((void *)&v47[1] + 1);
        v22 = PXStoryTimeDescription((CMTime *)v32);
        *(_OWORD *)v32 = v50;
        *(void *)&v32[16] = v51;
        v23 = PXStoryTimeDescription((CMTime *)v32);
        *(_OWORD *)v32 = v48;
        *(void *)&v32[16] = v49;
        v24 = PXStoryTimeDescription((CMTime *)v32);
        *(_OWORD *)v32 = v52;
        *(_OWORD *)&v32[16] = v53;
        *(_OWORD *)&v32[32] = v54;
        v25 = PXStoryTimeRangeDescription((uint64_t)v32);
        [v13 appendFormat:@"Segment: %@, Cue Type: %@, Cue Time: %@, Original Duration: %@, Adjusted Duration: %@, Allowed Range: %@\n", v19, v21, v22, v23, v24, v25];

        a1 = v29;
        id v3 = v30;
      }

      --v5;
      v6 -= 240;
    }
    while (v5 > 1);
  }
  v26 = *(void **)(a1 + 32);
  v27 = [v3 resetReason];
  if (v3) {
    [v3 targetRemainingDuration];
  }
  else {
    memset(&v31, 0, sizeof(v31));
  }
  v28 = PXStoryTimeDescription(&v31);
  [v26 appendFormat:@"  Reset: %@ (%@ Remaining)\n", v27, v28];
}

__n128 __72___PXStoryPacingControllerDecisionHistory_firstPacingDecisionAfterTime___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 >= 2)
  {
    uint64_t v23 = v3;
    uint64_t v24 = v4;
    uint64_t v6 = (CMTime *)(a1 + 40);
    unint64_t v7 = a2 + 1;
    uint64_t v8 = a3 + 240 * a2 - 240;
    do
    {
      CMTime time1 = *(CMTime *)(v8 + 144);
      CMTime v21 = *v6;
      if (CMTimeCompare(&time1, &v21) < 1) {
        break;
      }
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      long long v11 = *(_OWORD *)(v8 + 96);
      long long v13 = *(_OWORD *)(v8 + 48);
      long long v12 = *(_OWORD *)(v8 + 64);
      *(_OWORD *)(v10 + 112) = *(_OWORD *)(v8 + 80);
      *(_OWORD *)(v10 + 128) = v11;
      *(_OWORD *)(v10 + 80) = v13;
      *(_OWORD *)(v10 + 96) = v12;
      long long v14 = *(_OWORD *)(v8 + 160);
      long long v16 = *(_OWORD *)(v8 + 112);
      long long v15 = *(_OWORD *)(v8 + 128);
      *(_OWORD *)(v10 + 176) = *(_OWORD *)(v8 + 144);
      *(_OWORD *)(v10 + 192) = v14;
      *(_OWORD *)(v10 + 144) = v16;
      *(_OWORD *)(v10 + 160) = v15;
      long long v17 = *(_OWORD *)(v8 + 224);
      long long v19 = *(_OWORD *)(v8 + 176);
      long long v18 = *(_OWORD *)(v8 + 192);
      *(_OWORD *)(v10 + 240) = *(_OWORD *)(v8 + 208);
      *(_OWORD *)(v10 + 256) = v17;
      *(_OWORD *)(v10 + 208) = v19;
      *(_OWORD *)(v10 + 224) = v18;
      __n128 result = *(__n128 *)v8;
      long long v20 = *(_OWORD *)(v8 + 32);
      *(_OWORD *)(v10 + 48) = *(_OWORD *)(v8 + 16);
      *(_OWORD *)(v10 + 64) = v20;
      *(__n128 *)(v10 + 32) = result;
      --v7;
      v8 -= 240;
    }
    while (v7 > 2);
  }
  return result;
}

@end