@interface WBSContentAvailabilityDisplayController
- (BOOL)isDisplaying;
- (NSString)currentLabel;
- (WBSContentAvailabilityDisplayController)initWithPresenter:(id)a3;
- (WBSContentAvailabilityDisplayPresenting)presenter;
- (double)labelDisplayDuration;
- (unint64_t)cumulativeOptions;
- (unint64_t)currentOptions;
- (void)displayTimerDidFire:(id)a3;
- (void)resetDisplay;
- (void)scheduleDisplayTimerIfNeeded;
- (void)setLabelDisplayDuration:(double)a3;
- (void)setPresenter:(id)a3;
- (void)updateToContentOptions:(unint64_t)a3;
@end

@implementation WBSContentAvailabilityDisplayController

- (void)resetDisplay
{
  BOOL v3 = [(WBSContentAvailabilityDisplayController *)self isDisplaying];
  self->_cumulativeOptions = 0;
  availabilityLabels = self->_availabilityLabels;
  self->_availabilityLabels = 0;

  self->_displayedIndex = 0;
  [(NSTimer *)self->_displayTimer invalidate];
  displayTimer = self->_displayTimer;
  self->_displayTimer = 0;

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    [WeakRetained availabilityDisplayController:self didUpdateWithState:2];
  }
}

- (BOOL)isDisplaying
{
  availabilityLabels = self->_availabilityLabels;
  if (availabilityLabels)
  {
    unint64_t displayedIndex = self->_displayedIndex;
    LOBYTE(availabilityLabels) = displayedIndex < [(WBSBrowsingAssistantAvailabilityLabels *)availabilityLabels count];
  }
  return (char)availabilityLabels;
}

- (WBSContentAvailabilityDisplayController)initWithPresenter:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WBSContentAvailabilityDisplayController;
  id v3 = a3;
  v4 = [(WBSContentAvailabilityDisplayController *)&v6 init];
  objc_storeWeak((id *)&v4->_presenter, v3);

  v4->_labelDisplayDuration = 1.55;
  return v4;
}

- (void)setLabelDisplayDuration:(double)a3
{
  self->_labelDisplayDuration = a3;
}

- (void)updateToContentOptions:(unint64_t)a3
{
  if (a3
    && !-[WBSBrowsingAssistantAvailabilityLabels representsSupersetOfContentOptions:](self->_availabilityLabels, "representsSupersetOfContentOptions:"))
  {
    self->_cumulativeOptions |= a3;
    BOOL v5 = [(WBSContentAvailabilityDisplayController *)self isDisplaying];
    availabilityLabels = self->_availabilityLabels;
    if (availabilityLabels) {
      [(WBSBrowsingAssistantAvailabilityLabels *)availabilityLabels possibleLabelsByIncorporatingContentOptions:a3 intoLabelsAfterIndex:self->_displayedIndex];
    }
    else {
    id v10 = +[WBSBrowsingAssistantAvailabilityLabels possibleLabelsForContentOptions:a3];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    if ((unint64_t)[v10 count] >= 2 && WeakRetained)
    {
      v8 = [WeakRetained availabilityDisplayController:self determineBestLabelsForPresentation:v10];
    }
    else
    {
      v8 = [v10 objectAtIndexedSubscript:0];
    }
    v9 = self->_availabilityLabels;
    self->_availabilityLabels = v8;

    self->_unint64_t displayedIndex = 0;
    -[WBSContentAvailabilityDisplayController scheduleDisplayTimerIfNeeded]((uint64_t)self);
    [WeakRetained availabilityDisplayController:self didUpdateWithState:v5];
  }
}

- (void)scheduleDisplayTimerIfNeeded
{
  if (a1)
  {
    [*(id *)(a1 + 16) invalidate];
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if ([(id)a1 isDisplaying])
    {
      uint64_t v3 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:a1 target:sel_displayTimerDidFire_ selector:0 userInfo:0 repeats:*(double *)(a1 + 40)];
      v4 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v3;

      id v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v5 addTimer:*(void *)(a1 + 16) forMode:*MEMORY[0x1E4F1C4B0]];
    }
  }
}

- (NSString)currentLabel
{
  if ([(WBSContentAvailabilityDisplayController *)self isDisplaying])
  {
    uint64_t v3 = [(WBSBrowsingAssistantAvailabilityLabels *)self->_availabilityLabels textForOptionsAtIndex:self->_displayedIndex];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (unint64_t)currentOptions
{
  if (![(WBSContentAvailabilityDisplayController *)self isDisplaying]) {
    return 0;
  }
  availabilityLabels = self->_availabilityLabels;
  unint64_t displayedIndex = self->_displayedIndex;
  return [(WBSBrowsingAssistantAvailabilityLabels *)availabilityLabels representedOptionsAtIndex:displayedIndex];
}

- (void)displayTimerDidFire:(id)a3
{
  ++self->_displayedIndex;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  if ([(WBSContentAvailabilityDisplayController *)self isDisplaying]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  [WeakRetained availabilityDisplayController:self didUpdateWithState:v5];

  -[WBSContentAvailabilityDisplayController scheduleDisplayTimerIfNeeded]((uint64_t)self);
}

- (WBSContentAvailabilityDisplayPresenting)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (WBSContentAvailabilityDisplayPresenting *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (double)labelDisplayDuration
{
  return self->_labelDisplayDuration;
}

- (unint64_t)cumulativeOptions
{
  return self->_cumulativeOptions;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_displayTimer, 0);
  objc_storeStrong((id *)&self->_availabilityLabels, 0);
}

@end