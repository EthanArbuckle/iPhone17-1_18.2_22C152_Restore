@interface NSOperationQueue(ICRequestAdditions)
+ (id)ic_sharedRequestOperationQueueWithQualityOfService:()ICRequestAdditions;
@end

@implementation NSOperationQueue(ICRequestAdditions)

+ (id)ic_sharedRequestOperationQueueWithQualityOfService:()ICRequestAdditions
{
  switch(__ROR8__(a3 - 9, 3))
  {
    case 0:
      if (ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_17 != -1) {
        dispatch_once(&ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_17, &__block_literal_global_19);
      }
      v3 = &ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_16;
      break;
    case 1:
      if (ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken != -1) {
        dispatch_once(&ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken, &__block_literal_global_25017);
      }
      v3 = &ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue;
      break;
    case 2:
      if (ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_3 != -1) {
        dispatch_once(&ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_3, &__block_literal_global_5);
      }
      v3 = &ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_2;
      break;
    case 3:
      if (ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_10 != -1) {
        dispatch_once(&ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_10, &__block_literal_global_12_25018);
      }
      v3 = &ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_9;
      break;
    default:
      if (ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_24 != -1) {
        dispatch_once(&ic_sharedRequestOperationQueueWithQualityOfService__sOnceToken_24, &__block_literal_global_26);
      }
      v3 = &ic_sharedRequestOperationQueueWithQualityOfService__sOperationQueue_23;
      break;
  }
  v4 = (void *)*v3;

  return v4;
}

@end