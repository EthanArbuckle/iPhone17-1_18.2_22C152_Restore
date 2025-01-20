@interface NTKDArgonInternalKeyFetcher
- (void)fetchNewRecordsSinceChangeToken:(id)a3 forReason:(int64_t)a4 completion:(id)a5;
@end

@implementation NTKDArgonInternalKeyFetcher

- (void)fetchNewRecordsSinceChangeToken:(id)a3 forReason:(int64_t)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  v7 = NTKFaceSupportInternalDirectory((uint64_t)v5, v6);
  if (v7)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v28 = 0;
    v9 = [v8 contentsOfDirectoryAtPath:v7 error:&v28];
    id v10 = v28;

    if (v9)
    {
      id v22 = v10;
      v23 = [MEMORY[0x1E4F1CA80] set];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = v7;
            v17 = [v7 stringByAppendingPathComponent:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            v18 = [MEMORY[0x1E4F28B50] bundleWithPath:v17];
            v19 = +[NTKArgonKeyDescriptor unfilteredKeyDescriptorFromBundle:v18];
            if (v19) {
              [v23 addObject:v19];
            }

            v7 = v16;
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v13);
      }

      v20 = (void *)[v23 copy];
      (*((void (**)(id, void *, void, void))v5 + 2))(v5, v20, 0, 0);

      id v10 = v22;
    }
    else
    {
      (*((void (**)(id, void, void, id))v5 + 2))(v5, 0, 0, v10);
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F1CAD0] set];
    (*((void (**)(id, void *, void, void))v5 + 2))(v5, v21, 0, 0);
  }
}

@end