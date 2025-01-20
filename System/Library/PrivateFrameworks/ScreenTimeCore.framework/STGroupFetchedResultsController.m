@interface STGroupFetchedResultsController
- (NSArray)resultsControllers;
- (NSArray)resultsRequests;
- (NSFetchedResultsController)resultsController;
- (STGroupFetchedResultsController)initWithContext:(id)a3 resultsRequests:(id)a4;
- (STGroupFetchedResultsController)initWithResultsRequests:(id)a3 cacheName:(id)a4 managedObjectContext:(id)a5;
- (STGroupFetchedResultsControllerDelegate)delegate;
- (unint64_t)changeCounter;
- (void)_evaluateCounter;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)setChangeCounter:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setResultsController:(id)a3;
- (void)setResultsControllers:(id)a3;
- (void)setResultsRequests:(id)a3;
@end

@implementation STGroupFetchedResultsController

- (STGroupFetchedResultsController)initWithContext:(id)a3 resultsRequests:(id)a4
{
  return [(STGroupFetchedResultsController *)self initWithResultsRequests:a4 cacheName:0 managedObjectContext:a3];
}

- (STGroupFetchedResultsController)initWithResultsRequests:(id)a3 cacheName:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v30 = a4;
  id v29 = a5;
  v36.receiver = self;
  v36.super_class = (Class)STGroupFetchedResultsController;
  v9 = [(STGroupFetchedResultsController *)&v36 init];
  if (v9)
  {
    v10 = objc_opt_new();
    v11 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v27 = v8;
    id obj = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v17 = objc_alloc(MEMORY[0x1E4F1C0F0]);
          uint64_t v18 = [v16 fetchRequest];
          v19 = (void *)[v17 initWithFetchRequest:v18 managedObjectContext:v29 sectionNameKeyPath:0 cacheName:v30];

          [v19 setDelegate:v9];
          id v31 = 0;
          LOBYTE(v18) = [v19 performFetch:&v31];
          id v20 = v31;
          if ((v18 & 1) == 0)
          {
            v21 = +[STLog persistence];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              -[STGroupFetchedResultsController initWithResultsRequests:cacheName:managedObjectContext:]((uint64_t)v20, v21);
            }

            goto LABEL_14;
          }
          [v10 addObject:v19];
          [v11 addObject:v16];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    uint64_t v22 = [v10 copy];
    resultsControllers = v9->_resultsControllers;
    v9->_resultsControllers = (NSArray *)v22;

    uint64_t v24 = [v11 copy];
    resultsRequests = v9->_resultsRequests;
    v9->_resultsRequests = (NSArray *)v24;

    v9->_changeCounter = 0;
    id v8 = v27;
  }

  return v9;
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = +[STLog persistence];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[STGroupFetchedResultsController controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:]((uint64_t)v10, (uint64_t)v11, v12);
  }

  uint64_t v13 = [(STGroupFetchedResultsController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = [(STGroupFetchedResultsController *)self resultsControllers];
    uint64_t v15 = [v14 indexOfObject:v10];

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = [(STGroupFetchedResultsController *)self resultsRequests];
      id v17 = [v16 objectAtIndexedSubscript:v15];

      uint64_t v18 = [v10 managedObjectContext];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __101__STGroupFetchedResultsController_controller_didChangeObject_atIndexPath_forChangeType_newIndexPath___block_invoke;
      v20[3] = &unk_1E6BC7A28;
      id v21 = v11;
      id v22 = v13;
      v23 = self;
      id v24 = v17;
      unint64_t v25 = a6;
      id v19 = v17;
      [v18 performBlock:v20];
    }
  }
}

void __101__STGroupFetchedResultsController_controller_didChangeObject_atIndexPath_forChangeType_newIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectID];
  [*(id *)(a1 + 40) groupResultsController:*(void *)(a1 + 48) didChangeResultsForRequest:*(void *)(a1 + 56) objectID:v2 changeType:*(void *)(a1 + 64)];
}

- (void)controllerWillChangeContent:(id)a3
{
  [(STGroupFetchedResultsController *)self setChangeCounter:[(STGroupFetchedResultsController *)self changeCounter] + 1];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__evaluateCounter object:self];
  [(STGroupFetchedResultsController *)self performSelector:sel__evaluateCounter withObject:self afterDelay:1.0];
}

- (void)controllerDidChangeContent:(id)a3
{
  [(STGroupFetchedResultsController *)self setChangeCounter:[(STGroupFetchedResultsController *)self changeCounter] - 1];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__evaluateCounter object:self];
  [(STGroupFetchedResultsController *)self performSelector:sel__evaluateCounter withObject:self afterDelay:1.0];
}

- (void)_evaluateCounter
{
  if (![(STGroupFetchedResultsController *)self changeCounter])
  {
    id v3 = [(STGroupFetchedResultsController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 groupResultsControllerDidChangeContents:self];
    }
  }
}

- (STGroupFetchedResultsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STGroupFetchedResultsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSFetchedResultsController)resultsController
{
  return self->_resultsController;
}

- (void)setResultsController:(id)a3
{
}

- (NSArray)resultsControllers
{
  return self->_resultsControllers;
}

- (void)setResultsControllers:(id)a3
{
}

- (NSArray)resultsRequests
{
  return self->_resultsRequests;
}

- (void)setResultsRequests:(id)a3
{
}

- (unint64_t)changeCounter
{
  return self->_changeCounter;
}

- (void)setChangeCounter:(unint64_t)a3
{
  self->_changeCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsRequests, 0);
  objc_storeStrong((id *)&self->_resultsControllers, 0);
  objc_storeStrong((id *)&self->_resultsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithResultsRequests:(uint64_t)a1 cacheName:(NSObject *)a2 managedObjectContext:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to perform inital results fetch: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)controller:(os_log_t)log didChangeObject:atIndexPath:forChangeType:newIndexPath:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "Controller: %@ changed content: %@", (uint8_t *)&v3, 0x16u);
}

@end