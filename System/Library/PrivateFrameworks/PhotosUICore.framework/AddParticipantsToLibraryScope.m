@interface AddParticipantsToLibraryScope
@end

@implementation AddParticipantsToLibraryScope

void ___AddParticipantsToLibraryScope_block_invoke(uint64_t a1)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___AddParticipantsToLibraryScope_block_invoke_2;
  v10[3] = &unk_1E5DCAEA0;
  v2 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v10];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  v7 = ___AddParticipantsToLibraryScope_block_invoke_3;
  v8 = &unk_1E5DCAEA0;
  v3 = *(void **)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  [v3 enumerateObjectsUsingBlock:&v5];
  v4 = objc_msgSend(MEMORY[0x1E4F39118], "changeRequestForLibraryScope:", *(void *)(a1 + 56), v5, v6, v7, v8);
  [v4 addParticipants:*(void *)(a1 + 40)];
}

void ___AddParticipantsToLibraryScope_block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [*(id *)(a1 + 32) librarySpecificFetchOptions];
  objc_claimAutoreleasedReturnValue();
  PXMap();
}

uint64_t ___AddParticipantsToLibraryScope_block_invoke_389(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t ___AddParticipantsToLibraryScope_block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

void ___AddParticipantsToLibraryScope_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v5 = [MEMORY[0x1E4F392F0] creationRequestForShareParticipantWithEmailAddress:a2 permission:3];
  v3 = *(void **)(a1 + 32);
  id v4 = [v5 placeholderForCreatedShareParticipant];
  [v3 addObject:v4];
}

void ___AddParticipantsToLibraryScope_block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v5 = [MEMORY[0x1E4F392F0] creationRequestForShareParticipantWithPhoneNumber:a2 permission:3];
  v3 = *(void **)(a1 + 32);
  id v4 = [v5 placeholderForCreatedShareParticipant];
  [v3 addObject:v4];
}

@end