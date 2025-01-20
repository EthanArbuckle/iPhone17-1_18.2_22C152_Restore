@interface TSRemoteUIStyle
- (TSRemoteUIStyle)initWithButton:(id)a3;
- (void)applyToObjectModel:(id)a3;
@end

@implementation TSRemoteUIStyle

- (TSRemoteUIStyle)initWithButton:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSRemoteUIStyle;
  v6 = [(RUIStyle *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_button, a3);
  }

  return v7;
}

- (void)applyToObjectModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = objc_msgSend(a3, "allPages", 0);
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
        objc_super v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10 = [v9 navigationItem];
        [v10 setRightBarButtonItem:self->_button];

        [v9 setModalInPresentation:1];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
}

@end