@interface PXSidebarDataContext
- (NSOperationQueue)workQueue;
- (NSPredicate)assetsFilterPredicate;
- (PXLibraryFilterState)libraryFilterState;
- (PXSidebarDataContext)init;
- (PXSidebarDataContext)initWithLibraryFilterState:(id)a3 workQueue:(id)a4 enablementProvider:(id)a5 assetsFilterPredicate:(id)a6;
- (PXSidebarDataSectionEnablement)enablementProvider;
@end

@implementation PXSidebarDataContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_enablementProvider, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (PXSidebarDataSectionEnablement)enablementProvider
{
  return self->_enablementProvider;
}

- (NSOperationQueue)workQueue
{
  return self->_workQueue;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSidebarDataContext)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSidebarDataContext.m", 27, @"%s is not available as initializer", "-[PXSidebarDataContext init]");

  abort();
}

- (PXSidebarDataContext)initWithLibraryFilterState:(id)a3 workQueue:(id)a4 enablementProvider:(id)a5 assetsFilterPredicate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXSidebarDataContext;
  v15 = [(PXSidebarDataContext *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a4);
    objc_storeStrong((id *)&v16->_libraryFilterState, a3);
    objc_storeStrong((id *)&v16->_enablementProvider, a5);
    objc_storeStrong((id *)&v16->_assetsFilterPredicate, a6);
  }

  return v16;
}

@end