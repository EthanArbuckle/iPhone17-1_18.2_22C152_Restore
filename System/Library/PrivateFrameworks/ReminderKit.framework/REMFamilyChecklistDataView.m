@interface REMFamilyChecklistDataView
- (REMFamilyChecklistDataView)initWithStore:(id)a3;
- (REMStore)store;
- (id)fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:(id)a3 error:(id *)a4;
- (id)fetchSharedGroceryListsWithCommonSharees:(id)a3 error:(id *)a4;
@end

@implementation REMFamilyChecklistDataView

- (REMFamilyChecklistDataView)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMFamilyChecklistDataView;
  v6 = [(REMFamilyChecklistDataView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)fetchSharedGroceryListsWithCommonSharees:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists alloc] initWithCommonSharees:v6];

  v8 = [(REMFamilyChecklistDataView *)self store];
  objc_super v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

  uint64_t v10 = objc_opt_class();
  v11 = REMDynamicCast(v10, (uint64_t)v9);
  v12 = [v11 sharedGroceryListsWithCommonSharees];

  return v12;
}

- (id)fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility alloc];
  v8 = [v6 localeIdentifier];

  objc_super v9 = [(REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility *)v7 initWithLocaleIdentifier:v8];
  uint64_t v10 = [(REMFamilyChecklistDataView *)self store];
  v11 = [v10 resultFromPerformingInvocation:v9 error:a4];

  uint64_t v12 = objc_opt_class();
  v13 = REMDynamicCast(v12, (uint64_t)v11);
  v14 = [v13 familyGroceryListEligibility];

  return v14;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

@end