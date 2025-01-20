@interface SKDiskImageResizer
- (id)resizeStateMachine:(id *)a3;
@end

@implementation SKDiskImageResizer

- (id)resizeStateMachine:(id *)a3
{
  v24[8] = *MEMORY[0x263EF8340];
  v5 = [(SKDiskImageResizerBase *)self limits];
  uint64_t v6 = objc_opt_class();
  v7 = [(SKDiskResizerBase *)self disk];
  v8 = [v7 type];
  LOBYTE(v6) = [(id)v6 isSupportedWholeDisk:v8];

  if (v6)
  {
    v23 = transitionEntrySEL(@"kImageResize", (uint64_t)kGrowEvent, (uint64_t)sel_imageResize_, @"kMoveRecovery");
    v24[0] = v23;
    v22 = transitionEntrySEL(@"kMoveRecovery", (uint64_t)kGrowEvent, (uint64_t)sel_moveRecovery_, (uint64_t)kDoneGrow);
    v24[1] = v22;
    v9 = endTransitionEntrySEL((uint64_t)kDoneGrow, (uint64_t)kGrowEvent, (uint64_t)sel_fitToSize_);
    v24[2] = v9;
    v10 = transitionEntrySEL((uint64_t)kDoneGrow, (uint64_t)kShrinkEvent, (uint64_t)sel_moveRecovery_, @"kImageResize");
    v24[3] = v10;
    v11 = transitionEntrySEL(@"kMoveRecovery", (uint64_t)kShrinkEvent, (uint64_t)sel_moveRecovery_, @"kImageResize");
    v24[4] = v11;
    v12 = transitionEntrySEL(@"kImageResize", (uint64_t)kShrinkEvent, (uint64_t)sel_imageResize_, (uint64_t)kDoneShrink);
    v24[5] = v12;
    v13 = endTransitionEntrySEL((uint64_t)kDoneShrink, (uint64_t)kShrinkEvent, (uint64_t)sel_fitToSize_);
    v24[6] = v13;
    v14 = transitionEntrySEL((uint64_t)kDoneShrink, (uint64_t)kGrowEvent, (uint64_t)sel_imageResize_, @"kMoveRecovery");
    v24[7] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:8];
    v16 = +[SKStateTransitionTable tableWithTransitionEntries:v15 selectorTarget:self];

    v17 = [(SKDiskResizerBase *)self eventFromSize];
    if ([v17 isEqualToString:kGrowEvent]) {
      v18 = @"kImageResize";
    }
    else {
      v18 = @"kMoveRecovery";
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