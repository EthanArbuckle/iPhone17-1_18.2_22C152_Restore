@interface PowerUISleepWakeMonitor
- (BOOL)enabled;
- (NSDate)desktopTransitionEvaluationDate;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PowerUISleepWakeMonitor)initWithManager:(id)a3 withCheckpoint:(unint64_t)a4 withLastDesktopCheck:(id)a5;
- (PowerUISmartChargeManager)manager;
- (_CDUserContext)context;
- (unint64_t)checkpoint;
- (void)setCheckpoint:(unint64_t)a3;
- (void)setContext:(id)a3;
- (void)setDesktopTransitionEvaluationDate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setManager:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation PowerUISleepWakeMonitor

- (PowerUISleepWakeMonitor)initWithManager:(id)a3 withCheckpoint:(unint64_t)a4 withLastDesktopCheck:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PowerUISleepWakeMonitor;
  return [(PowerUISleepWakeMonitor *)&v6 init];
}

- (unint64_t)checkpoint
{
  return self->_checkpoint;
}

- (void)setCheckpoint:(unint64_t)a3
{
  self->_checkpoint = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_CDUserContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (PowerUISmartChargeManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (NSDate)desktopTransitionEvaluationDate
{
  return self->_desktopTransitionEvaluationDate;
}

- (void)setDesktopTransitionEvaluationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desktopTransitionEvaluationDate, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end