@interface UIExternalScreenSceneConnectionHandler
@end

@implementation UIExternalScreenSceneConnectionHandler

void _UIExternalScreenSceneConnectionHandler_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 _hostsWindows])
  {
    id v3 = v2;
    if ([(id)UIApp isFrontBoard]) {
      int v4 = [(id)UIApp disablesFrontBoardImplicitWindowScenes];
    }
    else {
      int v4 = 0;
    }
    v5 = [v3 _screen];
    v6 = +[UIWindowScene _placeholderWindowSceneForScreen:v5 create:0];

    if (v6 && ([(id)UIApp isFrontBoard] ^ 1 | v4) == 1)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v7 = objc_msgSend(v6, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0, 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * v11++) _setWindowHostingScene:v3];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
  }
}

@end