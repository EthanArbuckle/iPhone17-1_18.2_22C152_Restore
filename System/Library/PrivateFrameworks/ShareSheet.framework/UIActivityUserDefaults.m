@interface UIActivityUserDefaults
@end

@implementation UIActivityUserDefaults

uint64_t __107___UIActivityUserDefaults_activitiesBySortingActivities_byIdentifierWithDefaultActivityIdentifierOrdering___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

void __47___UIActivityUserDefaults_builtinActivityOrder__block_invoke()
{
  v2[17] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.UIKit.activity.AirDrop";
  v2[1] = @"com.apple.UIKit.activity.Message";
  v2[2] = @"com.apple.UIKit.activity.Mail";
  v2[3] = @"com.apple.UIKit.activity.SharePlay";
  v2[4] = @"com.apple.UIKit.activity.CollaborationInviteWithLink";
  v2[5] = @"com.apple.reminders.sharingextension";
  v2[6] = @"com.apple.mobilenotes.SharingExtension";
  v2[7] = @"com.apple.UIKit.activity.OpenInIBooks";
  v2[8] = @"com.apple.UIKit.activity.CollaborationCopyLink";
  v2[9] = @"com.apple.UIKit.activity.CopyToPasteboard";
  v2[10] = @"com.apple.UIKit.activity.Share";
  v2[11] = @"com.apple.UIKit.activity.AddToReadingList";
  v2[12] = @"com.apple.UIKit.activity.SaveToCameraRoll";
  v2[13] = @"com.apple.UIKit.activity.AssignToContact";
  v2[14] = @"com.apple.UIKit.activity.MarkupAsPDF";
  v2[15] = @"com.apple.UIKit.activity.Print";
  v2[16] = @"com.apple.UIKit.activity.AddToHomeScreen";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:17];
  v1 = (void *)builtinActivityOrder_builtinActivityOrder;
  builtinActivityOrder_builtinActivityOrder = v0;
}

void __110___UIActivityUserDefaults_updatedActivityIdentifiersUserOrderWithPreviousOrder_someSortedActivityIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    [*(id *)(a1 + 40) addIndex:a3];
    [*(id *)(a1 + 32) removeObject:v7];
    if (![*(id *)(a1 + 32) count]) {
      *a4 = 1;
    }
  }
}

void __110___UIActivityUserDefaults_updatedActivityIdentifiersUserOrderWithPreviousOrder_someSortedActivityIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 40);
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v5 = objc_msgSend(v4, "objectAtIndexedSubscript:");
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a2];

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2 + 1;
}

@end