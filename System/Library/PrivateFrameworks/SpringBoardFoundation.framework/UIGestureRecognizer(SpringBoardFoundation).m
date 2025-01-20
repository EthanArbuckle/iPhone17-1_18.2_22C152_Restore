@interface UIGestureRecognizer(SpringBoardFoundation)
- (id)sbf_activeTouches;
- (uint64_t)sbf_hasPointerTouch;
- (uint64_t)sbf_setPencilTouchesAllowed:()SpringBoardFoundation;
@end

@implementation UIGestureRecognizer(SpringBoardFoundation)

- (uint64_t)sbf_setPencilTouchesAllowed:()SpringBoardFoundation
{
  v5 = [a1 allowedTouchTypes];
  v10 = v5;
  if (a3)
  {
    uint64_t v6 = [v5 containsObject:&unk_1ED89E620];
    v7 = v10;
    if (v6) {
      goto LABEL_6;
    }
    v8 = (void *)[v10 mutableCopy];
    [v8 addObject:&unk_1ED89E620];
  }
  else
  {
    v8 = (void *)[v5 mutableCopy];
    [v8 removeObject:&unk_1ED89E620];
  }
  [a1 setAllowedTouchTypes:v8];

  v7 = v10;
LABEL_6:
  return MEMORY[0x1F41817F8](v6, v7);
}

- (id)sbf_activeTouches
{
  v2 = [a1 _activeEventOfType:0];
  v3 = [v2 touchesForGestureRecognizer:a1];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  uint64_t v6 = v5;

  return v6;
}

- (uint64_t)sbf_hasPointerTouch
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(a1, "sbf_activeTouches", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if ([*(id *)(*((void *)&v6 + 1) + 8 * i) _isPointerTouch])
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

@end