@interface PXStoryDummyTimelineStyle
@end

@implementation PXStoryDummyTimelineStyle

void __242___PXStoryDummyTimelineStyle_enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition_displayAssets_assetContentInfos_finalPlaybackStyles_startTime_durationInfo_separatorEffectParameters_separatorEffectContext_buffer_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) numberOfClips];
  switch(v3)
  {
    case 3:
      switch([*(id *)(*(void *)(a1 + 40) + 8) threeUpKenBurnsKind])
      {
        case 0:
          goto LABEL_8;
        case 1:
LABEL_10:
          uint64_t v6 = *(void *)(a1 + 56);
          [*(id *)(*(void *)(a1 + 40) + 8) kenBurnsDistance];
          objc_msgSend(v14, "getParameters:forOppositePansWithDistance:", v6);
          goto LABEL_15;
        case 2:
LABEL_11:
          uint64_t v7 = *(void *)(a1 + 56);
          [*(id *)(*(void *)(a1 + 40) + 8) kenBurnsDistance];
          objc_msgSend(v14, "getParameters:forParallelPansWithDistance:", v7);
LABEL_15:
          v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
          goto LABEL_16;
        case 3:
LABEL_9:
          [*(id *)(*(void *)(a1 + 40) + 8) kenBurnsRotationInDegrees];
          PXDegreesToRadians();
        default:
          goto LABEL_17;
      }
    case 2:
      switch([*(id *)(*(void *)(a1 + 40) + 8) twoUpKenBurnsKind])
      {
        case 0:
          goto LABEL_8;
        case 1:
          uint64_t v8 = *(void *)(a1 + 56);
          [*(id *)(*(void *)(a1 + 40) + 8) kenBurnsScale];
          double v10 = v9;
          [*(id *)(*(void *)(a1 + 40) + 8) kenBurnsRelativeTransformOrigin];
          objc_msgSend(v14, "getParameters:forZoomWithScale:relativeTransformOrigin:", v8, v10, v11, v12);
          goto LABEL_15;
        case 2:
          goto LABEL_10;
        case 3:
          goto LABEL_11;
        case 4:
          goto LABEL_9;
        case 5:
          uint64_t v13 = *(void *)(a1 + 56);
          [*(id *)(*(void *)(a1 + 40) + 8) kenBurnsDistance];
          objc_msgSend(v14, "getParameters:forSplitAssetOppositePansWithDistance:", v13);
          goto LABEL_15;
        default:
          goto LABEL_17;
      }
    case 1:
      switch([*(id *)(*(void *)(a1 + 40) + 8) oneUpKenBurnsKind])
      {
        case 0:
          goto LABEL_8;
        case 1:
          uint64_t v4 = *(void *)(a1 + 56);
          [*(id *)(*(void *)(a1 + 40) + 8) kenBurnsScale];
          objc_msgSend(v14, "getParameters:forZoomWithScale:", v4);
          goto LABEL_15;
        case 2:
          [*(id *)(*(void *)(a1 + 40) + 8) kenBurnsPanDirection];
          PXRectEdgeOpposite();
        case 3:
          goto LABEL_9;
        default:
          goto LABEL_17;
      }
  }
LABEL_8:
  v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_16:
  v5();
LABEL_17:
}

@end