@interface SBHardwareButtonCoordinator
- (BOOL)buttonShouldStart:(id)a3;
- (id)assertButtonIsActive:(id)a3;
- (id)assertButtonIsActive:(id)a3 dropletHintIdentifier:(int64_t)a4;
- (id)cancelHardwareButtons:(id)a3 fromButton:(id)a4;
- (int)initWithHardwareButtons:(void *)a3 windowScene:;
- (unint64_t)_shouldSuppressButtonIdentifier:(unint64_t)a1;
- (void)dealloc;
@end

@implementation SBHardwareButtonCoordinator

- (int)initWithHardwareButtons:(void *)a3 windowScene:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v46.receiver = a1;
    v46.super_class = (Class)SBHardwareButtonCoordinator;
    v7 = (id *)objc_msgSendSuper2(&v46, sel_init);
    a1 = (int *)v7;
    if (v7)
    {
      id v38 = v6;
      objc_storeStrong(v7 + 2, a3);
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v39 = v5;
      id v9 = v5;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v55 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v43 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            v15 = [v14 hardwareButtonIdentifier];
            [v8 setObject:v14 forKey:v15];

            [v14 setHardwareButtonCoordinator:a1];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v55 count:16];
        }
        while (v11);
      }

      v16 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v8;
      id v37 = v8;

      v17 = (void *)MEMORY[0x1E4F1CAD0];
      v52 = @"Lock";
      v53[0] = @"Ringer";
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      v19 = [v17 setWithArray:v18];
      v53[1] = @"Lock";
      v54[0] = v19;
      v20 = (void *)MEMORY[0x1E4F1CAD0];
      v51 = @"Ringer";
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
      v22 = [v20 setWithArray:v21];
      v54[1] = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
      v24 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = v23;

      v48 = @"Lock";
      v49[0] = @"Ringer";
      v25 = (void *)MEMORY[0x1E4F1CAD0];
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
      v27 = [v25 setWithArray:v26];
      v49[1] = @"Lock";
      v50[0] = v27;
      v28 = (void *)MEMORY[0x1E4F1CAD0];
      v47 = @"Ringer";
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      v30 = [v28 setWithArray:v29];
      v50[1] = v30;
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
      v32 = (void *)*((void *)a1 + 8);
      *((void *)a1 + 8) = v31;

      uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Capture", 0);
      v34 = (void *)*((void *)a1 + 7);
      *((void *)a1 + 7) = v33;

      a1[2] = -1;
      v35 = a1 + 2;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __67__SBHardwareButtonCoordinator_initWithHardwareButtons_windowScene___block_invoke;
      handler[3] = &unk_1E6AF5558;
      a1 = a1;
      v41 = a1;
      notify_register_dispatch("com.apple.sysdiagnose.sysdiagnoseStarted", v35, MEMORY[0x1E4F14428], handler);

      id v6 = v38;
      id v5 = v39;
    }
  }

  return a1;
}

void __67__SBHardwareButtonCoordinator_initWithHardwareButtons_windowScene___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = SBLogButtonsLock();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "sysdiagnose began - canceling buttons", buf, 2u);
  }

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) cancelHardwareButtonPress];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)dealloc
{
  int sysdiagnoseDidBeginNotificationToken = self->_sysdiagnoseDidBeginNotificationToken;
  if (sysdiagnoseDidBeginNotificationToken != -1)
  {
    notify_cancel(sysdiagnoseDidBeginNotificationToken);
    self->_int sysdiagnoseDidBeginNotificationToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBHardwareButtonCoordinator;
  [(SBHardwareButtonCoordinator *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressedButtonIdentifierToSuppressorButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_otherButtonsAlwaysSuppressButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_buttonIdentifierToSuppressedButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_canceledButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_buttonIdentifierToButtonInstance, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
}

- (unint64_t)_shouldSuppressButtonIdentifier:(unint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([*(id *)(a1 + 56) containsObject:v3])
    {
      objc_super v4 = (void *)[*(id *)(a1 + 40) mutableCopy];
      [v4 removeObject:v3];
      a1 = [v4 count] != 0;
    }
    else
    {
      objc_super v4 = [*(id *)(a1 + 64) objectForKey:v3];
      a1 = [*(id *)(a1 + 40) intersectsSet:v4];
    }
  }
  return a1;
}

- (BOOL)buttonShouldStart:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = -[SBHardwareButtonCoordinator _shouldSuppressButtonIdentifier:]((unint64_t)self, v4);
  int v6 = [(NSCountedSet *)self->_canceledButtonIdentifiers containsObject:v4];
  uint64_t v7 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    long long v9 = [MEMORY[0x1E4F4F720] descriptionForRootObject:self->_activeButtonIdentifiers];
    long long v10 = [MEMORY[0x1E4F4F720] descriptionForRootObject:self->_canceledButtonIdentifiers];
    int v11 = 138544642;
    id v12 = v4;
    __int16 v13 = 1024;
    int v14 = v5;
    __int16 v15 = 1024;
    int v16 = v6;
    __int16 v17 = 1024;
    int v18 = (v5 | v6) ^ 1;
    __int16 v19 = 2114;
    v20 = v9;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_debug_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ shouldSuppress:(%{BOOL}u) isCanceled:(%{BOOL}u) shouldStart:(%{BOOL}u) active:%{public}@ canceled:%{public}@", (uint8_t *)&v11, 0x32u);
  }
  return (v5 | v6) ^ 1;
}

- (id)assertButtonIsActive:(id)a3
{
  return [(SBHardwareButtonCoordinator *)self assertButtonIsActive:a3 dropletHintIdentifier:0];
}

- (id)assertButtonIsActive:(id)a3 dropletHintIdentifier:(int64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_activeButtonIdentifiers)
  {
    uint64_t v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    activeButtonIdentifiers = self->_activeButtonIdentifiers;
    self->_activeButtonIdentifiers = v7;
  }
  long long v9 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v43 = v6;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ active", buf, 0xCu);
  }

  [(NSCountedSet *)self->_activeButtonIdentifiers addObject:v6];
  if (a4)
  {
    long long v10 = [(SBWindowScene *)self->_windowScene hardwareButtonBezelEffectsCoordinator];
    a4 = [v10 activateHintDropletForButton:a4];
  }
  if ([(NSCountedSet *)self->_activeButtonIdentifiers countForObject:v6] == 1)
  {
    int v11 = [(NSDictionary *)self->_buttonIdentifierToSuppressedButtonIdentifiers objectForKey:v6];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          int v16 = [(NSDictionary *)self->_buttonIdentifierToButtonInstance objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * i)];
          [v16 cancelHardwareButtonPress];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v13);
    }
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  __int16 v17 = self->_otherButtonsAlwaysSuppressButtonIdentifiers;
  uint64_t v18 = [(NSSet *)v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        if (([v6 isEqual:v22] & 1) == 0)
        {
          uint64_t v23 = [(NSDictionary *)self->_buttonIdentifierToButtonInstance objectForKey:v22];
          [v23 cancelHardwareButtonPress];
        }
      }
      uint64_t v19 = [(NSSet *)v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v19);
  }

  id v24 = objc_alloc(MEMORY[0x1E4F4F838]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __92__SBHardwareButtonCoordinator_ButtonsColluding__assertButtonIsActive_dropletHintIdentifier___block_invoke;
  v29[3] = &unk_1E6B05B60;
  v29[4] = self;
  id v30 = v6;
  id v31 = (id)a4;
  id v25 = (id)a4;
  id v26 = v6;
  v27 = (void *)[v24 initWithIdentifier:v26 forReason:@"button active" invalidationBlock:v29];

  return v27;
}

void __92__SBHardwareButtonCoordinator_ButtonsColluding__assertButtonIsActive_dropletHintIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) invalidate];
  v2 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ inactive", (uint8_t *)&v4, 0xCu);
  }
}

- (id)cancelHardwareButtons:(id)a3 fromButton:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!self->_canceledButtonIdentifiers)
  {
    long long v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    canceledButtonIdentifiers = self->_canceledButtonIdentifiers;
    self->_canceledButtonIdentifiers = v9;
  }
  int v11 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v7];
    *(_DWORD *)buf = 138543618;
    id v36 = v8;
    __int16 v37 = 2114;
    long long v38 = v12;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ started canceling %{public}@", buf, 0x16u);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v18 isEqual:v8])
        {
          id v25 = [NSString stringWithFormat:@"button cannot cancel itself (%@)", v8];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[SBHardwareButtonCoordinator(ButtonsColluding) cancelHardwareButtons:fromButton:](a2, (uint64_t)self, (uint64_t)v25);
          }
          [v25 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1D8BE89C0);
        }
        [(NSCountedSet *)self->_canceledButtonIdentifiers addObject:v18];
        uint64_t v19 = [(NSDictionary *)self->_buttonIdentifierToButtonInstance objectForKey:v18];
        [v19 cancelHardwareButtonPress];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }

  id v20 = objc_alloc(MEMORY[0x1E4F4F838]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __82__SBHardwareButtonCoordinator_ButtonsColluding__cancelHardwareButtons_fromButton___block_invoke;
  v26[3] = &unk_1E6B05B60;
  id v27 = v13;
  v28 = self;
  id v29 = v8;
  id v21 = v8;
  id v22 = v13;
  uint64_t v23 = (void *)[v20 initWithIdentifier:@"cancel some buttons" forReason:v21 invalidationBlock:v26];

  return v23;
}

void __82__SBHardwareButtonCoordinator_ButtonsColluding__cancelHardwareButtons_fromButton___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "removeObject:", *(void *)(*((void *)&v10 + 1) + 8 * v6++), (void)v10);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
    }
    while (v4);
  }

  id v7 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    long long v9 = [MEMORY[0x1E4F4F720] descriptionForRootObject:*(void *)(a1 + 32)];
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    __int16 v17 = v9;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ stopped canceling %{public}@", buf, 0x16u);
  }
}

@end