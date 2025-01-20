@interface VSNonChannelAppDecider
- (NSArray)appDescriptions;
- (NSString)preferredAppBundleOrAdamID;
- (NSString)preferredDeviceFamily;
- (VSNonChannelAppDecider)init;
- (id)decidedNonChannelApps;
- (void)setAppDescriptions:(id)a3;
- (void)setPreferredAppBundleOrAdamID:(id)a3;
- (void)setPreferredDeviceFamily:(id)a3;
@end

@implementation VSNonChannelAppDecider

- (VSNonChannelAppDecider)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSNonChannelAppDecider;
  v2 = [(VSNonChannelAppDecider *)&v6 init];
  v3 = v2;
  if (v2)
  {
    appDescriptions = v2->_appDescriptions;
    v2->_appDescriptions = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (id)decidedNonChannelApps
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = [(VSNonChannelAppDecider *)self appDescriptions];
  v4 = [(VSNonChannelAppDecider *)self preferredAppBundleOrAdamID];
  if ((unint64_t)[v3 count] <= 1)
  {
    id v5 = v3;
    goto LABEL_31;
  }
  if (!v4)
  {
    v28 = [(VSNonChannelAppDecider *)self preferredDeviceFamily];
    v29 = v28;
    if (v28)
    {
      id v30 = v28;
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __47__VSNonChannelAppDecider_decidedNonChannelApps__block_invoke;
      v41[3] = &unk_265077D58;
      id v42 = v30;
      id v5 = [v3 sortedArrayUsingComparator:v41];
    }
    else
    {
      id v5 = v3;
    }

    goto LABEL_31;
  }
  objc_super v6 = [v3 firstObject];

  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [appDescriptions firstObject] parameter must not be nil."];
  }
  v7 = [v3 firstObject];
  v32 = v4;
  id v8 = v4;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v33 = v3;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (!v10)
  {

    v12 = 0;
    goto LABEL_27;
  }
  uint64_t v11 = v10;
  v12 = 0;
  char v35 = 0;
  uint64_t v13 = *(void *)v38;
  uint64_t v34 = *(void *)v38;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v38 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      if ([v15 isDefaultAppForProvider])
      {
        id v16 = v15;

        char v35 = 1;
        v7 = v16;
      }
      v17 = [v15 bundleID];
      if ([v17 isEqualToString:v8])
      {
      }
      else
      {
        [v15 adamID];
        v36 = v12;
        id v18 = v9;
        v20 = v19 = v7;
        [v20 stringValue];
        v22 = uint64_t v21 = v11;
        int v23 = [v22 isEqualToString:v8];

        uint64_t v11 = v21;
        v7 = v19;
        id v9 = v18;
        v12 = v36;
        uint64_t v13 = v34;

        if (!v23) {
          continue;
        }
      }
      id v24 = v15;

      v12 = v24;
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v44 count:16];
  }
  while (v11);

  if ((v35 & 1) == 0)
  {
LABEL_27:
    id v5 = v9;
    goto LABEL_28;
  }
  if (v12) {
    v25 = v12;
  }
  else {
    v25 = v7;
  }
  v43 = v25;
  v26 = (void *)MEMORY[0x263EFF8C0];
  id v27 = v25;
  id v5 = [v26 arrayWithObjects:&v43 count:1];

LABEL_28:
  v4 = v32;
  v3 = v33;
LABEL_31:

  return v5;
}

uint64_t __47__VSNonChannelAppDecider_decidedNonChannelApps__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 deviceFamilies];
  uint64_t v8 = [v7 count];
  id v9 = [v6 deviceFamilies];
  if (v8 != [v9 count]) {
    goto LABEL_6;
  }
  uint64_t v10 = [v5 deviceFamilies];
  if (([v10 containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  uint64_t v11 = [v6 deviceFamilies];
  char v12 = [v11 containsObject:*(void *)(a1 + 32)];

  if (v12)
  {
    uint64_t v13 = 0;
    goto LABEL_12;
  }
LABEL_7:
  v14 = [v5 deviceFamilies];
  unint64_t v15 = [v14 count];
  id v16 = [v6 deviceFamilies];
  if (v15 >= [v16 count])
  {

    uint64_t v13 = 1;
  }
  else
  {
    v17 = [v5 deviceFamilies];
    int v18 = [v17 containsObject:*(void *)(a1 + 32)];

    if (v18) {
      uint64_t v13 = -1;
    }
    else {
      uint64_t v13 = 1;
    }
  }
LABEL_12:

  return v13;
}

- (NSArray)appDescriptions
{
  return self->_appDescriptions;
}

- (void)setAppDescriptions:(id)a3
{
}

- (NSString)preferredAppBundleOrAdamID
{
  return self->_preferredAppBundleOrAdamID;
}

- (void)setPreferredAppBundleOrAdamID:(id)a3
{
}

- (NSString)preferredDeviceFamily
{
  return self->_preferredDeviceFamily;
}

- (void)setPreferredDeviceFamily:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredDeviceFamily, 0);
  objc_storeStrong((id *)&self->_preferredAppBundleOrAdamID, 0);
  objc_storeStrong((id *)&self->_appDescriptions, 0);
}

@end