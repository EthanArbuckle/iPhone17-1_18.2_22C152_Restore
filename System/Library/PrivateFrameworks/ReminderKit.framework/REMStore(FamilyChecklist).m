@interface REMStore(FamilyChecklist)
@end

@implementation REMStore(FamilyChecklist)

- (void)fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:()FamilyChecklist error:.cold.1()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI error fetching eligibility for shared grocery list: %@", v2, v3, v4, v5, v6);
}

- (void)sharedGroceryListForFamilyChecklistWithCommonParticipants:()FamilyChecklist error:.cold.1()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI error fetching existing shared grocery lists: %@", v2, v3, v4, v5, v6);
}

- (void)createSharedGroceryListWithError:()FamilyChecklist .cold.1()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI error creating itemProvider for shared grocery list: %@", v2, v3, v4, v5, v6);
}

- (void)createSharedGroceryListWithError:()FamilyChecklist .cold.2()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI error creating CKShare for shared grocery list: %@", v2, v3, v4, v5, v6);
}

- (void)createSharedGroceryListWithError:()FamilyChecklist .cold.3()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI error saving created shared grocery list: %@", v2, v3, v4, v5, v6);
}

- (void)createSharedGroceryListWithError:()FamilyChecklist .cold.4()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI error fetching primary active cloudKit account for creating shared grocery list: %@", v2, v3, v4, v5, v6);
}

- (void)addParticipantsToSharedGroceryList:()FamilyChecklist completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI error adding participants: %@", v2, v3, v4, v5, v6);
}

- (void)addParticipantsToSharedGroceryList:()FamilyChecklist completion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI CloudKit error fetching primary active cloudKit account for adding participants to shared grocery list %@", v2, v3, v4, v5, v6);
}

- (void)addParticipantsToSharedGroceryList:()FamilyChecklist completion:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI CloudKit error fetching CKShare for adding participants to shared grocery list %@", v2, v3, v4, v5, v6);
}

- (void)deleteSharedGroceryList:()FamilyChecklist error:.cold.1()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI error saving deletion of shared grocery list: %@", v2, v3, v4, v5, v6);
}

- (void)deleteSharedGroceryList:()FamilyChecklist error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI error deleting shared grocery list: %@", v2, v3, v4, v5, v6);
}

- (void)deleteSharedGroceryList:()FamilyChecklist error:.cold.3()
{
  OUTLINED_FUNCTION_12(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI error fetching shared grocery list for deletion: %@", v2, v3, v4, v5, v6);
}

@end