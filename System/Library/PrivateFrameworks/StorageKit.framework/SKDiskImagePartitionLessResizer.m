@interface SKDiskImagePartitionLessResizer
- (id)resizeStateMachine:(id *)a3;
@end

@implementation SKDiskImagePartitionLessResizer

- (id)resizeStateMachine:(id *)a3
{
  v24[8] = *MEMORY[0x263EF8340];
  v5 = [(SKDiskResizerBase *)self disk];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_4:
    v23 = transitionEntrySEL(@"kImageResize", (uint64_t)kGrowEvent, (uint64_t)sel_imageResize_, @"kVolumeResize");
    v24[0] = v23;
    v9 = transitionEntrySEL(@"kVolumeResize", (uint64_t)kGrowEvent, (uint64_t)sel_volumeResize_, (uint64_t)kDoneGrow);
    v24[1] = v9;
    v10 = endTransitionEntry((uint64_t)kDoneGrow, (uint64_t)kGrowEvent);
    v24[2] = v10;
    v11 = transitionEntrySEL((uint64_t)kDoneGrow, (uint64_t)kShrinkEvent, (uint64_t)sel_volumeResize_, @"kImageResize");
    v24[3] = v11;
    v12 = transitionEntrySEL(@"kVolumeResize", (uint64_t)kShrinkEvent, (uint64_t)sel_volumeResize_, @"kImageResize");
    v24[4] = v12;
    v13 = transitionEntrySEL(@"kImageResize", (uint64_t)kShrinkEvent, (uint64_t)sel_imageResize_, (uint64_t)kDoneShrink);
    v24[5] = v13;
    v14 = endTransitionEntry((uint64_t)kDoneShrink, (uint64_t)kShrinkEvent);
    v24[6] = v14;
    v15 = transitionEntrySEL((uint64_t)kDoneShrink, (uint64_t)kGrowEvent, (uint64_t)sel_imageResize_, @"kVolumeResize");
    v24[7] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:8];
    v17 = +[SKStateTransitionTable tableWithTransitionEntries:v16 selectorTarget:self];

    v18 = [(SKDiskResizerBase *)self eventFromSize];
    if ([v18 isEqualToString:kGrowEvent]) {
      v19 = @"kImageResize";
    }
    else {
      v19 = @"kVolumeResize";
    }
    v20 = [(SKDiskResizerBase *)self eventFromSize];
    v21 = +[SKStateMachine machineWithStateTransitionTable:v17 startState:v19 startEvent:v20];

    goto LABEL_9;
  }
  v6 = [(SKDiskResizerBase *)self disk];
  v7 = [v6 type];
  char v8 = [v7 isEqualToString:kSKDiskTypeHFS[0]];

  if (v8) {
    goto LABEL_4;
  }
  v21 = +[SKError nilWithPOSIXCode:45 error:a3];
LABEL_9:

  return v21;
}

@end