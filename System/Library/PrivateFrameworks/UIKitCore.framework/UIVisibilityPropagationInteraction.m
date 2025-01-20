@interface UIVisibilityPropagationInteraction
@end

@implementation UIVisibilityPropagationInteraction

void __58___UIVisibilityPropagationInteraction__enqueuedUpdateBody__block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTarget:v3];
  [v4 setInheritingEnvironment:*(void *)(a1 + 40)];
  v5 = [MEMORY[0x1E4F96388] grantWithNamespace:*MEMORY[0x1E4FB3560] sourceEnvironment:*(void *)(a1 + 40) attributes:0];
  v7[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v4 setAdditionalAttributes:v6];
}

void __79___UIVisibilityPropagationInteraction__visibilityLock_enqueueUpdateIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    v2 = (void *)MEMORY[0x18C108260]();
    os_unfair_lock_lock((os_unfair_lock_t)v11 + 21);
    os_unfair_lock_lock((os_unfair_lock_t)v11 + 20);
    uint64_t v3 = v11;
    if (*((unsigned char *)v11 + 93))
    {
      id v4 = 0;
      v5 = 0;
    }
    else
    {
      v5 = (void *)[*((id *)v11 + 1) copy];
      id v4 = (void *)[*((id *)v11 + 6) copy];
      uint64_t v3 = v11;
    }
    v3[92] = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)v11 + 20);
    if (!BSEqualObjects() || (BSEqualStrings() & 1) == 0)
    {
      objc_storeStrong((id *)v11 + 7, v5);
      objc_storeStrong((id *)v11 + 8, v4);
      v6 = (void *)*((void *)v11 + 9);
      if (v5 && v4)
      {
        v7 = (void *)MEMORY[0x1E4F62890];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __58___UIVisibilityPropagationInteraction__enqueuedUpdateBody__block_invoke;
        v12[3] = &unk_1E530DA90;
        id v13 = v5;
        id v14 = v4;
        id v8 = v6;
        uint64_t v9 = [v7 injectorWithConfigurator:v12];
        v10 = (void *)*((void *)v11 + 9);
        *((void *)v11 + 9) = v9;
      }
      else
      {
        *((void *)v11 + 9) = 0;
      }
      [v6 invalidate];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v11 + 21);

    id WeakRetained = v11;
  }
}

void __71___UIVisibilityPropagationInteraction__visibilityLock_didMoveToWindow___block_invoke(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 20);
    -[_UIVisibilityPropagationInteraction _visibilityLock_updateVisibility]((uint64_t)WeakRetained);
    os_unfair_lock_unlock(WeakRetained + 20);
  }
}

@end