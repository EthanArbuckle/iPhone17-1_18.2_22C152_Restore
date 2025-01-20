@interface ICWorkerContextLaunchTask
- (NSManagedObjectContext)workerContext;
- (void)setWorkerContext:(id)a3;
@end

@implementation ICWorkerContextLaunchTask

- (NSManagedObjectContext)workerContext
{
  workerContext = self->_workerContext;
  if (!workerContext)
  {
    v4 = +[ICNoteContext sharedContext];
    v5 = [v4 workerManagedObjectContext];
    v6 = self->_workerContext;
    self->_workerContext = v5;

    workerContext = self->_workerContext;
  }

  return workerContext;
}

- (void)setWorkerContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end