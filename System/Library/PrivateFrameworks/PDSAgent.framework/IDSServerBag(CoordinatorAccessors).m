@interface IDSServerBag(CoordinatorAccessors)
- (double)coalesceDelayFromBag;
- (double)coalesceMaxPeriodFromBag;
- (double)coalescePeriodFromBag;
- (double)messageTimeoutFromBag;
- (id)minEnabledVersion;
- (id)nonCoalescingTopicsFromBag;
- (uint64_t)_valuesDefinedAsNumbersInBagForKeys:()CoordinatorAccessors;
- (uint64_t)allRequiredBagCoalescingValuesPresent;
- (uint64_t)allRequiredBagTTLValuesPresent;
- (uint64_t)bagKillSwitchActive;
- (uint64_t)topicAvoidsCoalescing:()CoordinatorAccessors;
- (uint64_t)ttlFromBag;
- (uint64_t)ttlFromDefault;
- (uint64_t)ttlGracePeriodFromBag;
- (uint64_t)ttlGracePeriodFromDefault;
- (uint64_t)ttlWindowFromBag;
- (uint64_t)ttlWindowFromDefault;
@end

@implementation IDSServerBag(CoordinatorAccessors)

- (uint64_t)topicAvoidsCoalescing:()CoordinatorAccessors
{
  id v4 = a3;
  v5 = [a1 nonCoalescingTopicsFromBag];
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)ttlFromBag
{
  if ([a1 ttlFromDefault])
  {
    return [a1 ttlFromDefault];
  }
  else
  {
    uint64_t v3 = 1296000;
    id v4 = [a1 objectForKey:@"pds-batch-register-ttl"];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([a1 allRequiredBagTTLValuesPresent])
        {
          [v4 doubleValue];
          uint64_t v3 = (uint64_t)v5;
        }
      }
    }

    return v3;
  }
}

- (uint64_t)ttlWindowFromBag
{
  if ([a1 ttlWindowFromDefault])
  {
    return [a1 ttlWindowFromDefault];
  }
  else
  {
    uint64_t v3 = 86400;
    id v4 = [a1 objectForKey:@"pds-batch-heartbeat-window"];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([a1 allRequiredBagTTLValuesPresent])
        {
          [v4 doubleValue];
          uint64_t v3 = (uint64_t)v5;
        }
      }
    }

    return v3;
  }
}

- (uint64_t)ttlGracePeriodFromBag
{
  if ([a1 ttlGracePeriodFromDefault])
  {
    return [a1 ttlGracePeriodFromDefault];
  }
  else
  {
    uint64_t v3 = 432000;
    id v4 = [a1 objectForKey:@"pds-batch-heartbeat-before-ttl"];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([a1 allRequiredBagTTLValuesPresent])
        {
          [v4 doubleValue];
          uint64_t v3 = (uint64_t)v5;
        }
      }
    }

    return v3;
  }
}

- (double)coalesceDelayFromBag
{
  v2 = [a1 objectForKey:@"pds-batch-coalescing-delay"];
  double v3 = 20.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([a1 allRequiredBagCoalescingValuesPresent])
      {
        [v2 doubleValue];
        double v3 = v4;
      }
    }
  }

  return v3;
}

- (double)coalescePeriodFromBag
{
  v2 = [a1 objectForKey:@"pds-batch-coalescing-period"];
  double v3 = 30.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([a1 allRequiredBagCoalescingValuesPresent])
      {
        [v2 doubleValue];
        double v3 = v4;
      }
    }
  }

  return v3;
}

- (double)coalesceMaxPeriodFromBag
{
  v1 = [a1 objectForKey:@"pds-batch-max-coalescing-period"];
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v1 doubleValue];
    double v3 = v2;
  }
  else
  {
    double v3 = 120.0;
  }

  return v3;
}

- (double)messageTimeoutFromBag
{
  v1 = [a1 objectForKey:@"pds-message-timeout"];
  double v2 = 36000.0;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v1 doubleValue];
      double v2 = v3;
    }
  }

  return v2;
}

- (uint64_t)bagKillSwitchActive
{
  v1 = [a1 objectForKey:@"pds-kit-enabled"];
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v2 = [v1 BOOLValue] ^ 1;
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)minEnabledVersion
{
  v1 = [a1 objectForKey:@"pds-min-enabled-version"];
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v2 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1, "intValue"));
  }
  else
  {
    uint64_t v2 = &unk_26D3D4410;
  }

  return v2;
}

- (uint64_t)allRequiredBagCoalescingValuesPresent
{
  v5[2] = *MEMORY[0x263EF8340];
  v5[0] = @"pds-batch-max-coalescing-period";
  v5[1] = @"pds-batch-coalescing-delay";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [a1 _valuesDefinedAsNumbersInBagForKeys:v2];

  return v3;
}

- (uint64_t)allRequiredBagTTLValuesPresent
{
  void v5[3] = *MEMORY[0x263EF8340];
  v5[0] = @"pds-batch-register-ttl";
  v5[1] = @"pds-batch-heartbeat-window";
  v5[2] = @"pds-batch-heartbeat-before-ttl";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  uint64_t v3 = [a1 _valuesDefinedAsNumbersInBagForKeys:v2];

  return v3;
}

- (id)nonCoalescingTopicsFromBag
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [a1 objectForKey:@"pds-batch-non-coalescing-topics"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v2, "addObject:", v9, (void)v11);
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v6);
      }
    }
  }

  return v2;
}

- (uint64_t)ttlFromDefault
{
  v0 = [MEMORY[0x263F4A878] sharedDefaults];
  v1 = [v0 appValueForKey:@"pds-ttl"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v3 = 0;
      goto LABEL_7;
    }
    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v1, "intValue"));
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v3 = v2;
LABEL_7:
  uint64_t v4 = (int)[v3 intValue];

  return v4;
}

- (uint64_t)ttlWindowFromDefault
{
  return [a1 ttlFromDefault] / 10;
}

- (uint64_t)ttlGracePeriodFromDefault
{
  return [a1 ttlFromDefault] / 5;
}

- (uint64_t)_valuesDefinedAsNumbersInBagForKeys:()CoordinatorAccessors
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    char v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = [a1 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
          char v8 = 0;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    char v8 = 1;
  }

  return v8 & 1;
}

@end