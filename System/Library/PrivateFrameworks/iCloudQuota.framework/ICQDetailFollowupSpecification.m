@interface ICQDetailFollowupSpecification
@end

@implementation ICQDetailFollowupSpecification

void __89___ICQDetailFollowupSpecification_postFollowupWithController_replaceExisting_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v4 key];
  v6 = [v3 titleWithKey:v5];
  v7 = [v4 wordsToReplace];
  v41 = +[_ICQHelperFunctions replaceWordsIn:v6 with:v7];

  v8 = *(void **)(a1 + 32);
  v9 = [v4 key];
  v10 = [v8 subTitleWithKey:v9];
  v11 = [v4 wordsToReplace];
  v12 = +[_ICQHelperFunctions replaceWordsIn:v10 with:v11];

  v13 = *(void **)(a1 + 32);
  v14 = [v4 key];
  v15 = [v13 mesgWithKey:v14];
  v16 = [v4 wordsToReplace];
  v17 = +[_ICQHelperFunctions replaceWordsIn:v15 with:v16];

  v18 = [*(id *)(a1 + 32) followupTitleTemplates];
  v19 = [v4 key];
  v20 = +[_ICQHelperFunctions stringFromTemplates:v18 key:v19];
  v21 = [v4 wordsToReplace];
  v22 = +[_ICQHelperFunctions replaceWordsIn:v20 with:v21];

  v23 = [*(id *)(a1 + 32) followupMesgTemplates];
  v24 = [v4 key];
  v25 = +[_ICQHelperFunctions stringFromTemplates:v23 key:v24];
  v26 = [v4 wordsToReplace];

  v27 = +[_ICQHelperFunctions replaceWordsIn:v25 with:v26];

  if ([v41 length]) {
    [*(id *)(a1 + 32) setNoteTitle:v41];
  }
  if ([v12 length]) {
    [*(id *)(a1 + 32) setNoteSubTitle:v12];
  }
  if ([v17 length]) {
    [*(id *)(a1 + 32) setNoteMessage:v17];
  }
  if ([v22 length]) {
    [*(id *)(a1 + 32) setTitle:v22];
  }
  if ([v27 length]) {
    [*(id *)(a1 + 32) setMessage:v27];
  }
  v28 = _ICQGetLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = [*(id *)(a1 + 32) noteTitle];
    *(_DWORD *)buf = 138412290;
    v44 = v29;
    _os_log_impl(&dword_1D5851000, v28, OS_LOG_TYPE_DEFAULT, "lockScreenTitle = %@", buf, 0xCu);
  }
  v30 = _ICQGetLogSystem();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [*(id *)(a1 + 32) noteSubTitle];
    *(_DWORD *)buf = 138412290;
    v44 = v31;
    _os_log_impl(&dword_1D5851000, v30, OS_LOG_TYPE_DEFAULT, "lockScreenSubTitle = %@", buf, 0xCu);
  }
  v32 = _ICQGetLogSystem();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = [*(id *)(a1 + 32) noteMessage];
    *(_DWORD *)buf = 138412290;
    v44 = v33;
    _os_log_impl(&dword_1D5851000, v32, OS_LOG_TYPE_DEFAULT, "lockScreenMessage = %@", buf, 0xCu);
  }
  v34 = _ICQGetLogSystem();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = [*(id *)(a1 + 32) title];
    *(_DWORD *)buf = 138412290;
    v44 = v35;
    _os_log_impl(&dword_1D5851000, v34, OS_LOG_TYPE_DEFAULT, "followupTitle = %@", buf, 0xCu);
  }
  v36 = _ICQGetLogSystem();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = [*(id *)(a1 + 32) message];
    *(_DWORD *)buf = 138412290;
    v44 = v37;
    _os_log_impl(&dword_1D5851000, v36, OS_LOG_TYPE_DEFAULT, "followupMessage = %@", buf, 0xCu);
  }
  uint64_t v38 = *(void *)(a1 + 40);
  uint64_t v39 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v40 = *(void *)(a1 + 48);
  v42.receiver = *(id *)(a1 + 32);
  v42.super_class = (Class)_ICQDetailFollowupSpecification;
  objc_msgSendSuper2(&v42, sel_postFollowupWithController_replaceExisting_completion_, v38, v39, v40);
}

@end