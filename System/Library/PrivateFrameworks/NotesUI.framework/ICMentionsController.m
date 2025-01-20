@interface ICMentionsController
@end

@implementation ICMentionsController

void __66__ICMentionsController_UI__registerForContactsChangedNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  performBlockOnMainThread();
  objc_destroyWeak(&v4);
}

void __66__ICMentionsController_UI__registerForContactsChangedNotification__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateNoteParticipants];
}

uint64_t __67__ICMentionsController_UI__rangeOfUnconfirmedMentionInTextStorage___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    uint64_t v5 = *(void *)(*(void *)(result + 32) + 8);
    *(void *)(v5 + 32) = a3;
    *(void *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

void __71__ICMentionsController_UI__sendPendingNotificationsAfterDelay_forNote___block_invoke(uint64_t a1)
{
  id v2 = +[ICMentionNotificationController sharedController];
  [v2 sendPendingNotificationsCreatedBefore:*(void *)(a1 + 32)];
}

void __60__ICMentionsController_UI__hasMentionInTextStorage_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  v7 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F83580]];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

void __60__ICMentionsController_UI__hasMentionInTextStorage_inRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v12)
  {
    v9 = [v12 attachment];
    v10 = [v9 typeUTI];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F83190]];

    if (v11)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }

    v8 = v12;
  }
}

@end