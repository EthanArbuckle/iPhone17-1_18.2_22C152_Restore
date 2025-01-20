@interface WFSiriExecutionMetrics
- (WFSiriExecutionMetrics)init;
- (unint64_t)currentShortcutStep;
- (unint64_t)shortcutActionCount;
- (unint64_t)siriInteractionCount;
- (void)setCurrentShortcutStep:(unint64_t)a3;
- (void)setShortcutActionCount:(unint64_t)a3;
- (void)setSiriInteractionCount:(unint64_t)a3;
@end

@implementation WFSiriExecutionMetrics

- (void)setSiriInteractionCount:(unint64_t)a3
{
  self->_siriInteractionCount = a3;
}

- (unint64_t)siriInteractionCount
{
  return self->_siriInteractionCount;
}

- (void)setCurrentShortcutStep:(unint64_t)a3
{
  self->_currentShortcutStep = a3;
}

- (unint64_t)currentShortcutStep
{
  return self->_currentShortcutStep;
}

- (void)setShortcutActionCount:(unint64_t)a3
{
  self->_shortcutActionCount = a3;
}

- (unint64_t)shortcutActionCount
{
  return self->_shortcutActionCount;
}

- (WFSiriExecutionMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFSiriExecutionMetrics;
  v2 = [(WFSiriExecutionMetrics *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_siriInteractionCount = 0;
    v2->_shortcutActionCount = 0;
    v4 = v2;
  }

  return v3;
}

@end