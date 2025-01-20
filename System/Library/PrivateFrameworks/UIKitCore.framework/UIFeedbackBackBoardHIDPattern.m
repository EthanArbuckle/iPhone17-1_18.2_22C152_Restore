@interface UIFeedbackBackBoardHIDPattern
@end

@implementation UIFeedbackBackBoardHIDPattern

void __44___UIFeedbackBackBoardHIDPattern_hidRequest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 160);
  id v4 = a2;
  [v4 setPattern:v3];
  [v4 setDeviceType:*(void *)(*(void *)(a1 + 32) + 136)];
  [v4 setSenderID:*(void *)(*(void *)(a1 + 32) + 144)];
  [v4 setPowerSourceID:*(void *)(*(void *)(a1 + 32) + 152)];
  [v4 setTimestamp:mach_absolute_time()];
}

@end