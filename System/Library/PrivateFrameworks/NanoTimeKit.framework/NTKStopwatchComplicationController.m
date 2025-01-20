@interface NTKStopwatchComplicationController
+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)hasTapAction;
- (NSDate)timeTravelDate;
- (id)complicationApplicationIdentifier;
- (void)_deactivate;
- (void)_handleStopwatchChange;
- (void)_updateDisplay;
- (void)performTapActionForDisplayWrapper:(id)a3;
- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4;
- (void)setTimeTravelDate:(id)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
@end

@implementation NTKStopwatchComplicationController

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 4;
}

- (void)_deactivate
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (BOOL)hasTapAction
{
  return 1;
}

- (void)performTapActionForDisplayWrapper:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = a3;
  id v6 = [v4 URLWithString:@"nanostopwatch://"];
  [(NTKComplicationController *)self _openAppWithURL:v6 forDisplayWrapper:v5];
}

- (id)complicationApplicationIdentifier
{
  return @"com.apple.NanoStopwatch";
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NTKStopwatchComplicationController;
  [(NTKComplicationController *)&v6 setDisplayProperties:a3 forDisplayWrapper:a4];
  id v5 = [(NTKComplicationController *)self legacyDisplay];
  [(NTKStopwatchComplicationController *)self _configureForLegacyDisplay:v5];
}

- (void)_handleStopwatchChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__NTKStopwatchComplicationController__handleStopwatchChange__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__NTKStopwatchComplicationController__handleStopwatchChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDisplay];
}

- (void)_updateDisplay
{
}

void __52__NTKStopwatchComplicationController__updateDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 display];
  [v2 setStopwatchState:0 elapsedTime:1 shouldPauseTextCountdown:0 timeTravelDate:0.0];
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  objc_storeStrong((id *)&self->_timeTravelDate, a3);

  [(NTKStopwatchComplicationController *)self _updateDisplay];
}

- (NSDate)timeTravelDate
{
  return self->_timeTravelDate;
}

- (void)setTimeTravelDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end