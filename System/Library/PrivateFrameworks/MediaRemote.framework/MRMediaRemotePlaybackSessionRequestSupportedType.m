@interface MRMediaRemotePlaybackSessionRequestSupportedType
@end

@implementation MRMediaRemotePlaybackSessionRequestSupportedType

uint64_t ___MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void ___MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

void ___MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

void ___MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void ___MRMediaRemotePlaybackSessionRequestSupportedType_block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) airPlayReceivers];
  uint64_t v3 = [*(id *)(a1 + 32) client];
  id v4 = [v3 bundleIdentifier];
  char v5 = [v2 containsObject:v4];

  if (v5)
  {
    v6 = (void *)[[NSString alloc] initWithFormat:@"resolvedSourcePlayerPath %@ is an airplay destination", *(void *)(a1 + 32)];
    id ErrorWithDescription = (id)MRMediaRemoteCreateErrorWithDescription(155, (uint64_t)v6);

    v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id ErrorWithDescription = (id)MRPlaybackSessionMigrateCopySupportedTypeMatch(*(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    if (!ErrorWithDescription)
    {
      v8 = (void *)MRPlaybackSessionMigrateCopyCurrentTypes(*(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
      v9 = (void *)MRPlaybackSessionMigrateCopySupportedTypes(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
      if (v8)
      {
        id v10 = [NSString alloc];
        if (v9)
        {
          v11 = MRMediaRemoteCopyCommandDescription(133);
          v12 = (void *)[v10 initWithFormat:@"%@ options do not match. source=%@ currentType=%@ destination=%@ supportedTypes=%@", v11, *(void *)(a1 + 32), v8, *(void *)(a1 + 40), v9];
          uint64_t v13 = 154;
        }
        else
        {
          uint64_t v16 = *(void *)(a1 + 40);
          v11 = MRMediaRemoteCopyCommandDescription(133);
          v12 = (void *)[v10 initWithFormat:@"destination %@ does not support %@ (source currentTypes = %@)", v16, v11, v8];
          uint64_t v13 = 153;
        }
      }
      else
      {
        id v14 = [NSString alloc];
        uint64_t v15 = *(void *)(a1 + 32);
        v11 = MRMediaRemoteCopyCommandDescription(133);
        v12 = (void *)[v14 initWithFormat:@"source %@ does not support %@ (destination supportedTypes = %@)", v15, v11, v9];
        uint64_t v13 = 152;
      }

      v17 = (void *)[[NSString alloc] initWithFormat:@"SupportedCommands do not allow migration because %@", v12];
      v18 = (void *)MRMediaRemoteCreateErrorWithDescription(v13, (uint64_t)v17);

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_6;
    }
    v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
LABEL_6:
}

@end