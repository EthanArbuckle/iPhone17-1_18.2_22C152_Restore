@interface SKDiskImagePartitionedResizer
- (id)resizeStateMachine:(id *)a3;
@end

@implementation SKDiskImagePartitionedResizer

- (id)resizeStateMachine:(id *)a3
{
  v26[10] = *MEMORY[0x263EF8340];
  v5 = [(SKDiskImageResizerBase *)self limits];
  uint64_t v6 = objc_opt_class();
  v7 = [(SKDiskResizerBase *)self disk];
  v8 = [v7 type];
  LOBYTE(v6) = [(id)v6 isSupportedWholeDisk:v8];

  if (v6)
  {
    v25 = transitionEntrySEL(@"kImageResize", (uint64_t)kGrowEvent, (uint64_t)sel_imageResize_, @"kMoveRecovery");
    v26[0] = v25;
    v24 = transitionEntrySEL(@"kMoveRecovery", (uint64_t)kGrowEvent, (uint64_t)sel_moveRecovery_, @"kVolumeResize");
    v26[1] = v24;
    v23 = transitionEntrySEL(@"kVolumeResize", (uint64_t)kGrowEvent, (uint64_t)sel_volumeResize_, (uint64_t)kDoneGrow);
    v26[2] = v23;
    v22 = endTransitionEntrySEL((uint64_t)kDoneGrow, (uint64_t)kGrowEvent, (uint64_t)sel_fitToSize_);
    v26[3] = v22;
    v9 = transitionEntrySEL((uint64_t)kDoneGrow, (uint64_t)kShrinkEvent, (uint64_t)sel_volumeResize_, @"kMoveRecovery");
    v26[4] = v9;
    v10 = transitionEntrySEL(@"kVolumeResize", (uint64_t)kShrinkEvent, (uint64_t)sel_volumeResize_, @"kMoveRecovery");
    v26[5] = v10;
    v11 = transitionEntrySEL(@"kMoveRecovery", (uint64_t)kShrinkEvent, (uint64_t)sel_moveRecovery_, @"kImageResize");
    v26[6] = v11;
    v12 = transitionEntrySEL(@"kImageResize", (uint64_t)kShrinkEvent, (uint64_t)sel_imageResize_, (uint64_t)kDoneShrink);
    v26[7] = v12;
    v13 = endTransitionEntrySEL((uint64_t)kDoneShrink, (uint64_t)kShrinkEvent, (uint64_t)sel_fitToSize_);
    v26[8] = v13;
    v14 = transitionEntrySEL((uint64_t)kDoneShrink, (uint64_t)kGrowEvent, (uint64_t)sel_imageResize_, @"kMoveRecovery");
    v26[9] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:10];
    v16 = +[SKStateTransitionTable tableWithTransitionEntries:v15 selectorTarget:self];

    v17 = [(SKDiskResizerBase *)self eventFromSize];
    if ([v17 isEqualToString:kGrowEvent]) {
      v18 = @"kImageResize";
    }
    else {
      v18 = @"kVolumeResize";
    }
    v19 = [(SKDiskResizerBase *)self eventFromSize];
    v20 = +[SKStateMachine machineWithStateTransitionTable:v16 startState:v18 startEvent:v19];
  }
  else
  {
    v20 = +[SKError nilWithPOSIXCode:45 error:a3];
  }

  return v20;
}

@end