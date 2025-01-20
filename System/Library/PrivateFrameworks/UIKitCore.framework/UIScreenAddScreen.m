@interface UIScreenAddScreen
@end

@implementation UIScreenAddScreen

void ___UIScreenAddScreen_block_invoke(uint64_t a1)
{
  if (qword_1EB25C5E8 != -1) {
    dispatch_once(&qword_1EB25C5E8, &__block_literal_global_899_0);
  }
  id v2 = (id)qword_1EB25C5F0;
  id v8 = v2;
  if (!*(unsigned char *)(a1 + 40))
  {
    if (qword_1EB25C618 != -1) {
      dispatch_once(&qword_1EB25C618, &__block_literal_global_915);
    }
    id v3 = (id)qword_1EB25C610;
    v4 = [*(id *)(a1 + 32) displayIdentity];
    [v3 addObject:v4];

    v5 = [v8 firstObject];
    if (qword_1EB25C620 != -1) {
      dispatch_once(&qword_1EB25C620, &__block_literal_global_918_1);
    }
    if (byte_1EB25C544 && v5)
    {
      v6 = [v5 displayIdentity];
      if ([v3 countForObject:v6])
      {
      }
      else
      {
        int v7 = [*(id *)(a1 + 32) _isMainLikeScreen];

        if (v7) {
          [v8 replaceObjectAtIndex:0 withObject:*(void *)(a1 + 32)];
        }
      }
    }

    id v2 = v8;
  }
  if (([v2 containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    if (![*(id *)(a1 + 32) _isEmbeddedScreen]) {
      goto LABEL_21;
    }
    if (qword_1EB25C620 != -1) {
      dispatch_once(&qword_1EB25C620, &__block_literal_global_918_1);
    }
    if (byte_1EB25C544) {
      [v8 insertObject:*(void *)(a1 + 32) atIndex:0];
    }
    else {
LABEL_21:
    }
      [v8 addObject:*(void *)(a1 + 32)];
  }
}

@end